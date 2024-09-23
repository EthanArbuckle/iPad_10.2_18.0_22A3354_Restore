@implementation FKPaymentTransaction

- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21
{
  uint64_t v22;
  uint64_t v23;

  LOBYTE(v23) = a18;
  LOBYTE(v22) = a16;
  return -[FKPaymentTransaction initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:serviceIdentifier:](self, "initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:serviceIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, v22,
           a17,
           v23,
           a19,
           a20,
           a21,
           0);
}

- (FKPaymentTransaction)initWithTransactionIdentifier:(id)a3 amount:(id)a4 foreignAmount:(id)a5 foreignCurrencyExchangeRate:(id)a6 transactionDate:(id)a7 transactionStatusChangedDate:(id)a8 type:(unint64_t)a9 status:(int64_t)a10 transactionDescription:(id)a11 originalTransactionDescription:(id)a12 localizedTypeDescription:(id)a13 creditDebitIndicator:(unint64_t)a14 actions:(id)a15 isBankConnectTransaction:(BOOL)a16 merchantCategoryCode:(int64_t)a17 hasNotificationServiceData:(BOOL)a18 paymentHash:(id)a19 altDSID:(id)a20 insights:(id)a21 serviceIdentifier:(id)a22
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  FKPaymentTransaction *v34;
  uint64_t v35;
  NSString *transactionId;
  uint64_t v37;
  FKAmount *amount;
  uint64_t v39;
  FKAmount *foreignAmount;
  uint64_t v41;
  NSDecimalNumber *foreignCurrencyExchangeRate;
  uint64_t v43;
  NSDate *transactionDate;
  uint64_t v45;
  NSDate *transactionStatusChangedDate;
  uint64_t v47;
  NSString *transactionDescription;
  uint64_t v49;
  NSString *originalTransactionDescription;
  uint64_t v51;
  NSString *localizedTypeDescription;
  uint64_t v53;
  FKActions *actions;
  uint64_t v55;
  NSString *paymentHash;
  uint64_t v57;
  NSString *altDSID;
  uint64_t v59;
  FKPaymentTransactionInsights *insights;
  uint64_t v61;
  NSString *serviceIdentifier;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;

  v71 = a3;
  v70 = a4;
  v69 = a5;
  v68 = a6;
  v67 = a7;
  v66 = a8;
  v27 = a11;
  v65 = a12;
  v28 = a13;
  v29 = a15;
  v30 = a19;
  v31 = a20;
  v32 = a21;
  v33 = a22;
  v72.receiver = self;
  v72.super_class = (Class)FKPaymentTransaction;
  v34 = -[FKPaymentTransaction init](&v72, sel_init);
  if (v34)
  {
    v35 = objc_msgSend(v71, "copy");
    transactionId = v34->_transactionId;
    v34->_transactionId = (NSString *)v35;

    v37 = objc_msgSend(v70, "copy");
    amount = v34->_amount;
    v34->_amount = (FKAmount *)v37;

    v39 = objc_msgSend(v69, "copy");
    foreignAmount = v34->_foreignAmount;
    v34->_foreignAmount = (FKAmount *)v39;

    v41 = objc_msgSend(v68, "copy");
    foreignCurrencyExchangeRate = v34->_foreignCurrencyExchangeRate;
    v34->_foreignCurrencyExchangeRate = (NSDecimalNumber *)v41;

    v43 = objc_msgSend(v67, "copy");
    transactionDate = v34->_transactionDate;
    v34->_transactionDate = (NSDate *)v43;

    v45 = objc_msgSend(v66, "copy");
    transactionStatusChangedDate = v34->_transactionStatusChangedDate;
    v34->_transactionStatusChangedDate = (NSDate *)v45;

    v34->_type = a9;
    v34->_status = a10;
    v47 = objc_msgSend(v27, "copy");
    transactionDescription = v34->_transactionDescription;
    v34->_transactionDescription = (NSString *)v47;

    v49 = objc_msgSend(v65, "copy");
    originalTransactionDescription = v34->_originalTransactionDescription;
    v34->_originalTransactionDescription = (NSString *)v49;

    v51 = objc_msgSend(v28, "copy");
    localizedTypeDescription = v34->_localizedTypeDescription;
    v34->_localizedTypeDescription = (NSString *)v51;

    v34->_merchantCategoryCode = a17;
    v34->_creditDebitIndicator = a14;
    v53 = objc_msgSend(v29, "copy");
    actions = v34->_actions;
    v34->_actions = (FKActions *)v53;

    v34->_isBankConnectTransaction = a16;
    v34->_hasNotificationServiceData = a18;
    v55 = objc_msgSend(v30, "copy");
    paymentHash = v34->_paymentHash;
    v34->_paymentHash = (NSString *)v55;

    v57 = objc_msgSend(v31, "copy");
    altDSID = v34->_altDSID;
    v34->_altDSID = (NSString *)v57;

    v59 = objc_msgSend(v32, "copy");
    insights = v34->_insights;
    v34->_insights = (FKPaymentTransactionInsights *)v59;

    v61 = objc_msgSend(v33, "copy");
    serviceIdentifier = v34->_serviceIdentifier;
    v34->_serviceIdentifier = (NSString *)v61;

  }
  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKPaymentTransaction *v5;
  uint64_t v6;
  NSString *transactionId;
  FKAmount *v8;
  FKAmount *amount;
  FKAmount *v10;
  FKAmount *foreignAmount;
  uint64_t v12;
  NSDecimalNumber *foreignCurrencyExchangeRate;
  uint64_t v14;
  NSDate *transactionDate;
  uint64_t v16;
  NSDate *transactionStatusChangedDate;
  uint64_t v18;
  NSString *transactionDescription;
  uint64_t v20;
  NSString *originalTransactionDescription;
  uint64_t v22;
  NSString *localizedTypeDescription;
  FKActions *v24;
  FKActions *actions;
  uint64_t v26;
  NSString *altDSID;
  uint64_t v28;
  NSString *paymentHash;
  FKPaymentTransactionInsights *v30;
  FKPaymentTransactionInsights *insights;
  uint64_t v32;
  NSString *serviceIdentifier;

  v5 = objc_alloc_init(FKPaymentTransaction);
  v6 = -[NSString copyWithZone:](self->_transactionId, "copyWithZone:", a3);
  transactionId = v5->_transactionId;
  v5->_transactionId = (NSString *)v6;

  v8 = -[FKAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v8;

  v10 = -[FKAmount copyWithZone:](self->_foreignAmount, "copyWithZone:", a3);
  foreignAmount = v5->_foreignAmount;
  v5->_foreignAmount = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_foreignCurrencyExchangeRate, "copyWithZone:", a3);
  foreignCurrencyExchangeRate = v5->_foreignCurrencyExchangeRate;
  v5->_foreignCurrencyExchangeRate = (NSDecimalNumber *)v12;

  v14 = -[NSDate copyWithZone:](self->_transactionDate, "copyWithZone:", a3);
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = (NSDate *)v14;

  v16 = -[NSDate copyWithZone:](self->_transactionStatusChangedDate, "copyWithZone:", a3);
  transactionStatusChangedDate = v5->_transactionStatusChangedDate;
  v5->_transactionStatusChangedDate = (NSDate *)v16;

  v5->_type = self->_type;
  v5->_status = self->_status;
  v18 = -[NSString copyWithZone:](self->_transactionDescription, "copyWithZone:", a3);
  transactionDescription = v5->_transactionDescription;
  v5->_transactionDescription = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_originalTransactionDescription, "copyWithZone:", a3);
  originalTransactionDescription = v5->_originalTransactionDescription;
  v5->_originalTransactionDescription = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_localizedTypeDescription, "copyWithZone:", a3);
  localizedTypeDescription = v5->_localizedTypeDescription;
  v5->_localizedTypeDescription = (NSString *)v22;

  v5->_merchantCategoryCode = self->_merchantCategoryCode;
  v5->_creditDebitIndicator = self->_creditDebitIndicator;
  v24 = -[FKActions copyWithZone:](self->_actions, "copyWithZone:", a3);
  actions = v5->_actions;
  v5->_actions = v24;

  v5->_isBankConnectTransaction = self->_isBankConnectTransaction;
  v5->_hasNotificationServiceData = self->_hasNotificationServiceData;
  v26 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_paymentHash, "copyWithZone:", a3);
  paymentHash = v5->_paymentHash;
  v5->_paymentHash = (NSString *)v28;

  v30 = -[FKPaymentTransactionInsights copyWithZone:](self->_insights, "copyWithZone:", a3);
  insights = v5->_insights;
  v5->_insights = v30;

  v32 = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  serviceIdentifier = v5->_serviceIdentifier;
  v5->_serviceIdentifier = (NSString *)v32;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionId);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_foreignAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_foreignCurrencyExchangeRate);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDate);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionStatusChangedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_originalTransactionDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTypeDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_actions);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentHash);
  objc_msgSend(v3, "safelyAddObject:", self->_insights);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceIdentifier);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_type);
  v6 = FKIntegerHash(v5, self->_status);
  v7 = FKIntegerHash(v6, self->_merchantCategoryCode);
  v8 = FKIntegerHash(v7, self->_creditDebitIndicator);
  v9 = FKIntegerHash(v8, self->_isBankConnectTransaction);
  v10 = FKIntegerHash(v9, self->_hasNotificationServiceData);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  FKPaymentTransaction *v4;
  FKPaymentTransaction *v5;
  void **v6;
  char v7;

  v4 = (FKPaymentTransaction *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_transactionId, v6[2])
      && FKEqualObjects(self->_amount, v6[3])
      && FKEqualObjects(self->_foreignAmount, v6[4])
      && FKEqualObjects(self->_foreignCurrencyExchangeRate, v6[5])
      && FKEqualObjects(self->_transactionDate, v6[6])
      && FKEqualObjects(self->_transactionStatusChangedDate, v6[7])
      && (void *)self->_type == v6[8]
      && (void *)self->_status == v6[9]
      && FKEqualObjects(self->_transactionDescription, v6[10])
      && FKEqualObjects(self->_originalTransactionDescription, v6[11])
      && FKEqualObjects(self->_localizedTypeDescription, v6[12])
      && (void *)self->_creditDebitIndicator == v6[14]
      && FKEqualObjects(self->_actions, v6[15])
      && self->_isBankConnectTransaction == *((unsigned __int8 *)v6 + 8)
      && (void *)self->_merchantCategoryCode == v6[13]
      && self->_hasNotificationServiceData == *((unsigned __int8 *)v6 + 9)
      && FKEqualObjects(self->_altDSID, v6[17])
      && FKEqualObjects(self->_paymentHash, v6[16])
      && FKEqualObjects(self->_insights, v6[19]))
    {
      v7 = FKEqualObjects(self->_serviceIdentifier, v6[18]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (FKMapsTransactionInsight)mapsInsight
{
  return -[FKPaymentTransactionInsights mapsInsight](self->_insights, "mapsInsight");
}

- (FKApplePayTransactionInsight)applePayInsight
{
  return -[FKPaymentTransactionInsights applePayInsight](self->_insights, "applePayInsight");
}

- (FKContactTransactionInsight)contactInsight
{
  return -[FKPaymentTransactionInsights contactInsight](self->_insights, "contactInsight");
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (FKAmount)amount
{
  return self->_amount;
}

- (FKAmount)foreignAmount
{
  return self->_foreignAmount;
}

- (NSDecimalNumber)foreignCurrencyExchangeRate
{
  return self->_foreignCurrencyExchangeRate;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (NSString)originalTransactionDescription
{
  return self->_originalTransactionDescription;
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (int64_t)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (unint64_t)creditDebitIndicator
{
  return self->_creditDebitIndicator;
}

- (FKActions)actions
{
  return self->_actions;
}

- (BOOL)isBankConnectTransaction
{
  return self->_isBankConnectTransaction;
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (BOOL)hasNotificationServiceData
{
  return self->_hasNotificationServiceData;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (FKPaymentTransactionInsights)insights
{
  return self->_insights;
}

- (void)setInsights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insights, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_originalTransactionDescription, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_foreignCurrencyExchangeRate, 0);
  objc_storeStrong((id *)&self->_foreignAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
}

@end
