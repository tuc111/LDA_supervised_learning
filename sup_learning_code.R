library(readxl)
library(MASS)
library(caret)
library(ISLR)
# Libraries needed

# Work Directory must be created seperately

LDA_MODEL <- function(TYPE){
  LDA_data <- read_excel("freshwater.xlsx",sheet=TYPE)
  
  if(TYPE=="nitrate"){
    
    na_test <- read_excel("freshwater.xlsx",sheet="nitrate_test")
    
    na_lda <- lda(value~.,
                  # Value is the independent variable of this LDA
                  
                  LDA_data,
                  # The datasheet object created outside of this loop is used as the data for this LDA
                  
                  prior=c(1,1,1,1,1,1)/6)
    # This is equal to the prior proportions of the values
    # There are 6 discreet for Nitrate, hence the numbering
    
    # This block of code creates an LDA of the Nitrate data
    
    plot(na_lda)
    # Creates a plot of the lda created
    
    na_table <- table(predict(na_lda,type="class")$class,LDA_data$value)
    # Creates a table showing the LDA predicting the values on the original datasheet
    
    print("Confusion Matrix With Original Data")
    print(na_table)
    # Prints out the previously created table
    
    print("Total Prediction Accuracy")
    print(sum(diag(na_table))/sum(na_table)*100)
    # Computes the accuracy of the LDA relative to the data within the original datasheet
    
    print("0 Prediction Accuracy")
    print((na_table[1,1]/sum(na_table[1,])*100))
    
    print("20 Prediction Accuracy")
    print((na_table[2,2]/sum(na_table[2,])*100))
    
    print("40 Prediction Accuracy")
    print((na_table[3,3]/sum(na_table[3,])*100))
    
    print("80 Prediction Accuracy")
    print((na_table[4,4]/sum(na_table[4,])*100))
    
    print("160 Prediction Accuracy")
    print((na_table[5,5]/sum(na_table[5,])*100))
    
    print("200 Prediction Accuracy")
    print((na_table[6,6]/sum(na_table[6,])*100))
    
    
    na_pred <- predict(na_lda,na_test)
    
    # Creates a prediction of values of the test datasheet
    
    na_pred_table <- table(na_pred$class, na_test$value)
    # Creates a table that shows the confusion Matrix Generated
    
    print("Confusion Matrix with Test Data")
    print(na_pred_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(na_pred_table))/sum(na_pred_table)*100))
    # Prints the accuracy of the LDA predictor
    
    print("0 Prediction Accuracy")
    print((na_pred_table[1,1]/sum(na_pred_table[1,])*100))
    
    print("20 Prediction Accuracy")
    print((na_pred_table[2,2]/sum(na_pred_table[2,])*100))
    
    print("40 Prediction Accuracy")
    print((na_pred_table[3,3]/sum(na_pred_table[3,])*100))
    
    print("80 Prediction Accuracy")
    print((na_pred_table[4,4]/sum(na_pred_table[4,])*100))
    
    print("160 Prediction Accuracy")
    print((na_pred_table[5,5]/sum(na_pred_table[5,])*100))
    
    print("200 Prediction Accuracy")
    print((na_pred_table[6,6]/sum(na_pred_table[6,])*100))
    
    # Each of the lines of code shows the accuracy of the LDA predictor at different discreet values
  }
  
  if(TYPE=="nitrite"){
    
    ni_test <- read_excel("freshwater.xlsx",sheet="nitrite_test")
    
    ni_lda <- lda(value~.,
                  LDA_data,
                  prior=c(1,1,1,1,1,1)/6)
    
    plot(ni_lda)
    
    ni_table <- table(predict(ni_lda,type="class")$class,LDA_data$value)
    
    print("Confusion Matrix with Original Data")
    print(ni_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(ni_table))/sum(ni_table)*100))
    
    print("0 Prediction Accuracy")
    print((ni_table[1,1]/sum(ni_table[1,])*100))
    
    print("0.5 Prediction Accuracy")
    print((ni_table[2,2]/sum(ni_table[2,])*100))
    
    print("1 Prediction Accuracy")
    print((ni_table[3,3]/sum(ni_table[3,])*100))
    
    print("3 Prediction Accuracy")
    print((ni_table[4,4]/sum(ni_table[4,])*100))
    
    print("5 Prediction Accuracy")
    print((ni_table[5,5]/sum(ni_table[5,])*100))
    
    print("10 Prediction Accuracy")
    print((ni_table[6,6]/sum(ni_table[6,])*100))
    
    ni_pred <- predict(ni_lda,ni_test)
    
    ni_pred_table <- table(ni_pred$class, ni_test$value)
    
    print("Confusion Matrix with Test Dataset")
    print(ni_pred_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(ni_pred_table))/sum(ni_pred_table)*100))
    
    print("0 Prediction Accuracy")
    print((ni_pred_table[1,1]/sum(ni_pred_table[1,])*100))
    
    print("0.5 Prediction Accuracy")
    print((ni_pred_table[2,2]/sum(ni_pred_table[2,])*100))
    
    print("1 Prediction Accuracy")
    print((ni_pred_table[3,3]/sum(ni_pred_table[3,])*100))
    
    print("3 Prediction Accuracy")
    print((ni_pred_table[4,4]/sum(ni_pred_table[4,])*100))
    
    print("5 Prediction Accuracy")
    print((ni_pred_table[5,5]/sum(ni_pred_table[5,])*100))
    
    print("10 Prediction Accuracy")
    print((ni_pred_table[6,6]/sum(ni_pred_table[6,])*100))
  }
  
  if(TYPE=="hardness"){
    
    ha_test <- read_excel("freshwater.xlsx",sheet="hardness_test")
    
    ha_lda <- lda(value~.,
                  LDA_data,
                  prior=c(1,1,1,1,1)/5)
    
    plot(ha_lda)
    
    ha_table <- table(predict(ha_lda,type="class")$class,LDA_data$value)
    
    print("Confusion Matrix With Original Data")
    print(ha_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(ha_table))/sum(ha_table)*100))
    
    print("0 Prediction Accuracy")
    print((ha_table[1,1]/sum(ha_table[1,])*100))
    
    print("25 Prediction Accuracy")
    print((ha_table[2,2]/sum(ha_table[2,])*100))
    
    print("75 Prediction Accuracy")
    print((ha_table[3,3]/sum(ha_table[3,])*100))
    
    print("150 Prediction Accuracy")
    print((ha_table[4,4]/sum(ha_table[4,])*100))
    
    print("300 Prediction Accuracy")
    print((ha_table[5,5]/sum(ha_table[5,])*100))
    
    ha_pred <- predict(ha_lda,ha_test)
    
    ha_pred_table <- table(ha_pred$class, ha_test$value)
    
    print("Confusion Matrix with Test Data")
    print(ha_pred_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(ha_pred_table))/sum(ha_pred_table)*100))
    
    print("0 Prediction Accuracy")
    print((ha_pred_table[1,1]/sum(ha_pred_table[1,])*100))
    
    print("25 Prediction Accuracy")
    print((ha_pred_table[2,2]/sum(ha_pred_table[2,])*100))
    
    print("75 Prediction Accuracy")
    print((ha_pred_table[3,3]/sum(ha_pred_table[3,])*100))
    
    print("150 Prediction Accuracy")
    print((ha_pred_table[4,4]/sum(ha_pred_table[4,])*100))
    
    print("300 Prediction Accuracy")
    print((ha_pred_table[5,5]/sum(ha_pred_table[5,])*100))
  }
  
  if(TYPE=="alkilinity"){
    
    al_test <- read_excel("freshwater.xlsx",sheet="alkilinity_test")
    
    al_lda <- lda(value~.,
                  LDA_data,
                  prior=c(1,1,1,1,1,1)/6)
    
    plot(al_lda)
    
    al_table <- table(predict(al_lda,type="class")$class,LDA_data$value)
    
    print("Confusion Matrix With Original Data")
    print(al_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(al_table))/sum(al_table)*100))
    
    print("0 Prediction Accuracy")
    print((al_table[1,1]/sum(al_table[1,])*100))
    
    print("40 Prediction Accuracy")
    print((al_table[2,2]/sum(al_table[2,])*100))
    
    print("80 Prediction Accuracy")
    print((al_table[3,3]/sum(al_table[3,])*100))
    
    print("120 Prediction Accuracy")
    print((al_table[4,4]/sum(al_table[4,])*100))
    
    print("180 Prediction Accuracy")
    print((al_table[5,5]/sum(al_table[5,])*100))
    
    print("300 Prediction Accuracy")
    print((al_table[6,6]/sum(al_table[6,])*100))
    
    al_pred <- predict(al_lda,al_test)
    
    al_pred_table <- table(al_pred$class, al_test$value)
    
    print("Confusion Matrix with Test Data")
    print(al_pred_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(al_pred_table))/sum(al_pred_table)*100))
    
    print("0 Prediction Accuracy")
    print((al_pred_table[1,1]/sum(al_pred_table[1,])*100))
    
    print("40 Prediction Accuracy")
    print((al_pred_table[2,2]/sum(al_pred_table[2,])*100))
    
    print("80 Prediction Accuracy")
    print((al_pred_table[3,3]/sum(al_pred_table[3,])*100))
    
    print("120 Prediction Accuracy")
    print((al_pred_table[4,4]/sum(al_pred_table[4,])*100))
    
    print("180 Prediction Accuracy")
    print((al_pred_table[5,5]/sum(al_pred_table[5,])*100))
    
    print("300 Prediction Accuracy")
    print((al_pred_table[6,6]/sum(al_pred_table[6,])*100))
  }
  
  if(TYPE=="pH"){
    
    pH_test <- read_excel("freshwater.xlsx",sheet="pH")
    
    pH_lda <- lda(value~.,
                  LDA_data,
                  prior=c(1,1,1,1,1)/5)
    
    plot(pH_lda)
    
    pH_table <- table(predict(pH_lda,type="class")$class,LDA_data$value)
    
    print("Confusion Matrix with Original Data")
    print(pH_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(pH_table))/sum(pH_table)*100))
    
    print("5.2 Prediction Accuracy")
    print((pH_table[1,1]/sum(pH_table[1,])*100))
    
    print("6.8 Prediction Accuracy")
    print((pH_table[2,2]/sum(pH_table[2,])*100))
    
    print("7.2 Prediction Accuracy")
    print((pH_table[3,3]/sum(pH_table[3,])*100))
    
    print("7.8 Prediction Accuracy")
    print((pH_table[4,4]/sum(pH_table[4,])*100))
    
    print("8.4 Prediction Accuracy")
    print((pH_table[5,5]/sum(pH_table[5,])*100))
    
    pH_pred <- predict(pH_lda,pH_test)
    
    pH_pred_table <- table(pH_pred$class, pH_test$value)
    
    print("Confusion Matrix with Test Data")
    print(pH_pred_table)
    
    print("Total Prediction Accuracy")
    print((sum(diag(pH_pred_table))/sum(pH_pred_table)*100))
    
    print("5.2 Prediction Accuracy")
    print((pH_pred_table[1,1]/sum(pH_pred_table[1,])*100))
    
    print("6.8 Prediction Accuracy")
    print((pH_pred_table[2,2]/sum(pH_pred_table[2,])*100))
    
    print("7.2 Prediction Accuracy")
    print((pH_pred_table[3,3]/sum(pH_pred_table[3,])*100))
    
    print("7.8 Prediction Accuracy")
    print((pH_pred_table[4,4]/sum(pH_pred_table[4,])*100))
    
    print("8.4 Prediction Accuracy")
    print((pH_pred_table[5,5]/sum(pH_pred_table[5,])*100))
    
  }
}