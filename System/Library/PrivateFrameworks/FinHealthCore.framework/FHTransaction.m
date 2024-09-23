@implementation FHTransaction

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = a3;
  -[FHTransaction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[FHTransaction transactionServiceIdentifier](self, "transactionServiceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serviceIdentifier"));

  -[FHTransaction financeTransactionIdentifier](self, "financeTransactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("financeTransactionIdentifier"));

  -[FHTransaction paymentHash](self, "paymentHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("paymentHash"));

  -[FHTransaction amount](self, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("amount"));

  -[FHTransaction currencyCode](self, "currencyCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("currencyCode"));

  -[FHTransaction transactionDate](self, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("transactionDate"));

  -[FHTransaction transactionStatusChangedDate](self, "transactionStatusChangedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("transactionStatusChangedDate"));

  -[FHTransaction transactionSourceIdentifier](self, "transactionSourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("transactionSourceIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionStatus](self, "transactionStatus"), CFSTR("transactionStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionSource](self, "transactionSource"), CFSTR("transactionSource"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction cardType](self, "cardType"), CFSTR("cardType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionType](self, "transactionType"), CFSTR("transactionType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction transactionInternalState](self, "transactionInternalState"), CFSTR("transactionInternalState"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction accountType](self, "accountType"), CFSTR("accountType"));
  -[FHTransaction timeZone](self, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("timeZone"));

  -[FHTransaction altDSID](self, "altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("altDSID"));

  -[FHTransaction receiptIdentifier](self, "receiptIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("receiptIdentifier"));

  -[FHTransaction merchantUniqueIdentifier](self, "merchantUniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("merchantUniqueIdentifier"));

  -[FHTransaction name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("name"));

  -[FHTransaction rawName](self, "rawName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("rawName"));

  -[FHTransaction displayName](self, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("displayName"));

  -[FHTransaction industryCategory](self, "industryCategory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("industryCategory"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction industryCode](self, "industryCode"), CFSTR("industryCode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction category](self, "category"), CFSTR("category"));
  -[FHTransaction street](self, "street");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("street"));

  -[FHTransaction city](self, "city");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("city"));

  -[FHTransaction state](self, "state");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("state"));

  -[FHTransaction zip](self, "zip");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("zip"));

  -[FHTransaction countryCode](self, "countryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("countryCode"));

  -[FHTransaction country](self, "country");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("country"));

  -[FHTransaction merchantDetailedCategory](self, "merchantDetailedCategory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("merchantDetailedCategory"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[FHTransaction mapsMerchantID](self, "mapsMerchantID"), CFSTR("mapsMerchantID"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[FHTransaction mapsMerchantResultProviderID](self, "mapsMerchantResultProviderID"), CFSTR("mapsMerchantResultProviderID"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[FHTransaction mapsMerchantBrandID](self, "mapsMerchantBrandID"), CFSTR("mapsMerchantBrandID"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[FHTransaction mapsMerchantBrandResultProviderID](self, "mapsMerchantBrandResultProviderID"), CFSTR("mapsMerchantBrandResultProviderID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FHTransaction hasLocation](self, "hasLocation"), CFSTR("hasLocation"));
  -[FHTransaction location](self, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("location"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction disputeType](self, "disputeType"), CFSTR("disputeType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction disputeStatus](self, "disputeStatus"), CFSTR("disputeStatus"));
  -[FHTransaction peerPaymentCounterpartHandle](self, "peerPaymentCounterpartHandle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("peerPaymentCounterpartHandle"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[FHTransaction peerPaymentType](self, "peerPaymentType"), CFSTR("peerPaymentType"));
  -[FHTransaction transactionDescription](self, "transactionDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("transactionDescription"));

  objc_msgSend(v4, "encodeBool:forKey:", -[FHTransaction recurring](self, "recurring"), CFSTR("recurring"));
  -[FHTransaction disputeOpenDate](self, "disputeOpenDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("disputeOpenDate"));

  -[FHTransaction disputeLastUpdatedDate](self, "disputeLastUpdatedDate");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("disputeLastUpdatedDate"));

}

- (FHTransaction)initWithCoder:(id)a3
{
  id v4;
  FHTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)FHTransaction;
  v5 = -[FHTransaction init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTransactionServiceIdentifier:](v5, "setTransactionServiceIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("financeTransactionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setFinanceTransactionIdentifier:](v5, "setFinanceTransactionIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setPaymentHash:](v5, "setPaymentHash:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setAmount:](v5, "setAmount:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCurrencyCode:](v5, "setCurrencyCode:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTransactionDate:](v5, "setTransactionDate:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionStatusChangedDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTransactionStatusChangedDate:](v5, "setTransactionStatusChangedDate:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTransactionSourceIdentifier:](v5, "setTransactionSourceIdentifier:", v14);

    -[FHTransaction setTransactionStatus:](v5, "setTransactionStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionStatus")));
    -[FHTransaction setTransactionSource:](v5, "setTransactionSource:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionSource")));
    -[FHTransaction setCardType:](v5, "setCardType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType")));
    -[FHTransaction setTransactionType:](v5, "setTransactionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionType")));
    -[FHTransaction setAccountType:](v5, "setAccountType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType")));
    -[FHTransaction setTransactionInternalState:](v5, "setTransactionInternalState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionInternalState")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTimeZone:](v5, "setTimeZone:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setAltDSID:](v5, "setAltDSID:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setReceiptIdentifier:](v5, "setReceiptIdentifier:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantUniqueIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setMerchantUniqueIdentifier:](v5, "setMerchantUniqueIdentifier:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setName:](v5, "setName:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setRawName:](v5, "setRawName:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setDisplayName:](v5, "setDisplayName:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("industryCategory"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setIndustryCategory:](v5, "setIndustryCategory:", v22);

    -[FHTransaction setIndustryCode:](v5, "setIndustryCode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("industryCode")));
    -[FHTransaction setCategory:](v5, "setCategory:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("street"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setStreet:](v5, "setStreet:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCity:](v5, "setCity:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setState:](v5, "setState:", v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zip"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setZip:](v5, "setZip:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCountryCode:](v5, "setCountryCode:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setCountry:](v5, "setCountry:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantDetailedCategory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setMerchantDetailedCategory:](v5, "setMerchantDetailedCategory:", v29);

    -[FHTransaction setMapsMerchantID:](v5, "setMapsMerchantID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mapsMerchantID")));
    -[FHTransaction setMapsMerchantResultProviderID:](v5, "setMapsMerchantResultProviderID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mapsMerchantResultProviderID")));
    -[FHTransaction setMapsMerchantBrandID:](v5, "setMapsMerchantBrandID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mapsMerchantBrandID")));
    -[FHTransaction setMapsMerchantBrandResultProviderID:](v5, "setMapsMerchantBrandResultProviderID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mapsMerchantBrandResultProviderID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setLocation:](v5, "setLocation:", v30);

    -[FHTransaction setHasLocation:](v5, "setHasLocation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasLocation")));
    -[FHTransaction setDisputeType:](v5, "setDisputeType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disputeType")));
    -[FHTransaction setDisputeStatus:](v5, "setDisputeStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disputeStatus")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentCounterpartHandle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setPeerPaymentCounterpartHandle:](v5, "setPeerPaymentCounterpartHandle:", v31);

    -[FHTransaction setPeerPaymentType:](v5, "setPeerPaymentType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDescription"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setTransactionDescription:](v5, "setTransactionDescription:", v32);

    -[FHTransaction setRecurring:](v5, "setRecurring:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recurring")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disputeOpenDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setDisputeOpenDate:](v5, "setDisputeOpenDate:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disputeLastUpdatedDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction setDisputeLastUpdatedDate:](v5, "setDisputeLastUpdatedDate:", v34);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  int64_t v51;
  unint64_t v52;
  unint64_t v53;
  int64_t v54;
  int64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  int64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  unint64_t v75;

  -[FHTransaction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHTransaction transactionServiceIdentifier](self, "transactionServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[FHTransaction financeTransactionIdentifier](self, "financeTransactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[FHTransaction paymentHash](self, "paymentHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[FHTransaction transactionSourceIdentifier](self, "transactionSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[FHTransaction amount](self, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") - v12 + 32 * v12;

  -[FHTransaction currencyCode](self, "currencyCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash") - v14 + 32 * v14;

  -[FHTransaction transactionDate](self, "transactionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash") - v16 + 32 * v16;

  -[FHTransaction transactionStatusChangedDate](self, "transactionStatusChangedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash") - v18 + 32 * v18;

  -[FHTransaction industryCategory](self, "industryCategory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash") - v20 + 32 * v20;

  -[FHTransaction displayName](self, "displayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash") - v22 + 32 * v22;

  -[FHTransaction merchantUniqueIdentifier](self, "merchantUniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hash") - v24 + 32 * v24;

  -[FHTransaction name](self, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash") - v26 + 32 * v26;

  -[FHTransaction rawName](self, "rawName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hash") - v28 + 32 * v28;

  v31 = -[FHTransaction industryCode](self, "industryCode") - v30 + 32 * v30;
  v32 = -[FHTransaction category](self, "category") - v31 + 32 * v31;
  -[FHTransaction street](self, "street");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hash") - v32 + 32 * v32;

  -[FHTransaction city](self, "city");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "hash") - v34 + 32 * v34;

  -[FHTransaction state](self, "state");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "hash") - v36 + 32 * v36;

  -[FHTransaction zip](self, "zip");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "hash") - v38 + 32 * v38;

  -[FHTransaction countryCode](self, "countryCode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "hash") - v40 + 32 * v40;

  -[FHTransaction altDSID](self, "altDSID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "hash") - v42 + 32 * v42;

  -[FHTransaction receiptIdentifier](self, "receiptIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "hash") - v44 + 32 * v44;

  -[FHTransaction country](self, "country");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "hash") - v46 + 32 * v46;

  -[FHTransaction merchantDetailedCategory](self, "merchantDetailedCategory");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "hash") - v48 + 32 * v48;

  v51 = -[FHTransaction transactionStatus](self, "transactionStatus") - v50 + 32 * v50;
  v52 = -[FHTransaction transactionSource](self, "transactionSource") - v51 + 32 * v51;
  v53 = -[FHTransaction cardType](self, "cardType") - v52 + 32 * v52;
  v54 = -[FHTransaction transactionType](self, "transactionType") - v53 + 32 * v53;
  v55 = -[FHTransaction accountType](self, "accountType") - v54 + 32 * v54;
  v56 = -[FHTransaction transactionInternalState](self, "transactionInternalState") - v55 + 32 * v55;
  -[FHTransaction timeZone](self, "timeZone");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "hash") - v56 + 32 * v56;

  -[FHTransaction location](self, "location");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "hash") - v58 + 32 * v58;

  v61 = 31 * (-[FHTransaction mapsMerchantID](self, "mapsMerchantID") - v60 + 32 * v60);
  v62 = 31 * (v61 + -[FHTransaction mapsMerchantResultProviderID](self, "mapsMerchantResultProviderID"));
  v63 = v62 + -[FHTransaction hasLocation](self, "hasLocation");
  v64 = -[FHTransaction disputeType](self, "disputeType") - v63 + 32 * v63;
  v65 = -[FHTransaction disputeStatus](self, "disputeStatus") - v64 + 32 * v64;
  -[FHTransaction peerPaymentCounterpartHandle](self, "peerPaymentCounterpartHandle");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "hash") - v65 + 32 * v65;

  v68 = -[FHTransaction peerPaymentType](self, "peerPaymentType") - v67 + 32 * v67;
  -[FHTransaction transactionDescription](self, "transactionDescription");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 31 * (objc_msgSend(v69, "hash") - v68 + 32 * v68);

  v71 = v70 + -[FHTransaction recurring](self, "recurring");
  -[FHTransaction disputeOpenDate](self, "disputeOpenDate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "hash") - v71 + 32 * v71;

  -[FHTransaction disputeLastUpdatedDate](self, "disputeLastUpdatedDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "hash") - v73 + 32 * v73 - 0x78218E28655F3D7FLL;

  return v75;
}

- (BOOL)isEqual:(id)a3
{
  FHTransaction *v4;
  FHTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  char v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  unint64_t v55;
  unint64_t v56;
  int64_t v57;
  int64_t v58;
  unint64_t v59;
  _BOOL4 v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  int64_t v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[9];
  int v134;
  id v135;
  id v136;
  int v137;
  uint64_t v138;

  v4 = (FHTransaction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v20 = 1;
    goto LABEL_86;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = 0;
    goto LABEL_86;
  }
  -[FHTransaction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction identifier](v5, "identifier");
  v135 = (id)objc_claimAutoreleasedReturnValue();
  v136 = v6;
  v134 = objc_msgSend(v6, "isEqualToString:", v135);
  if (!v134)
  {
    v21 = 0;
    v18 = 0;
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, sizeof(v133));
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    goto LABEL_22;
  }
  -[FHTransaction transactionServiceIdentifier](self, "transactionServiceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction transactionServiceIdentifier](v5, "transactionServiceIdentifier");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v8;
  if (!objc_msgSend(v8, "isEqualToString:"))
  {
    v18 = 0;
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, sizeof(v133));
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    goto LABEL_22;
  }
  -[FHTransaction financeTransactionIdentifier](self, "financeTransactionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction financeTransactionIdentifier](v5, "financeTransactionIdentifier");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v9;
  if (!objc_msgSend(v9, "isEqualToString:"))
  {
    v18 = 0;
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 68);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    HIDWORD(v133[8]) = 1;
    goto LABEL_22;
  }
  -[FHTransaction paymentHash](self, "paymentHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction paymentHash](v5, "paymentHash");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v10;
  if (!objc_msgSend(v10, "isEqualToString:"))
  {
    v18 = 0;
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 64);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    goto LABEL_22;
  }
  -[FHTransaction transactionSourceIdentifier](self, "transactionSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction transactionSourceIdentifier](v5, "transactionSourceIdentifier");
  v126 = v11;
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:"))
  {
    v18 = 0;
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 60);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    HIDWORD(v133[7]) = 1;
    goto LABEL_22;
  }
  -[FHTransaction amount](self, "amount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction amount](v5, "amount");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v12;
  if (!objc_msgSend(v12, "isEqual:"))
  {
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 60);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    HIDWORD(v133[7]) = 1;
    v18 = 1;
    goto LABEL_22;
  }
  -[FHTransaction currencyCode](self, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction currencyCode](v5, "currencyCode");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v13;
  if (!objc_msgSend(v13, "isEqualToString:"))
  {
    v19 = 0;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 56);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    v18 = 1;
    v133[7] = 0x100000001;
    goto LABEL_22;
  }
  -[FHTransaction transactionDate](self, "transactionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction transactionDate](v5, "transactionDate");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v14;
  if (!objc_msgSend(v14, "isEqual:"))
  {
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 56);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    v133[7] = 0x100000001;
    v18 = 1;
    v19 = 1;
    goto LABEL_22;
  }
  -[FHTransaction transactionStatusChangedDate](self, "transactionStatusChangedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction transactionStatusChangedDate](v5, "transactionStatusChangedDate");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v15;
  if (!objc_msgSend(v15, "isEqual:"))
  {
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 52);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    v133[7] = 0x100000001;
    v18 = 1;
    v19 = 1;
    HIDWORD(v133[6]) = 1;
    goto LABEL_22;
  }
  -[FHTransaction industryCategory](self, "industryCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction industryCategory](v5, "industryCategory");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v16;
  if (!objc_msgSend(v16, "isEqualToString:"))
  {
    v133[6] = 0x100000000;
    v138 = 0;
    v137 = 0;
    memset(v133, 0, 44);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    v133[7] = 0x100000001;
    v18 = 1;
    v19 = 1;
    HIDWORD(v133[5]) = 1;
    goto LABEL_22;
  }
  -[FHTransaction displayName](self, "displayName");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v138) = v111 != 0;
  if (v111
    && (-[FHTransaction displayName](v5, "displayName"), (v114 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[FHTransaction displayName](self, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction displayName](v5, "displayName");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v17;
    v137 = 0;
    HIDWORD(v138) = 1;
    if ((objc_msgSend(v17, "isEqual:") & 1) == 0)
    {
      v133[8] = 0x100000001;
      v133[7] = 0x100000001;
      v18 = 1;
      v19 = 1;
      v133[6] = 0x100000001;
      HIDWORD(v133[5]) = 1;
      LODWORD(v138) = 1;
      v20 = 0;
LABEL_97:
      memset(v133, 0, 44);
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    -[FHTransaction displayName](self, "displayName");
    v37 = objc_claimAutoreleasedReturnValue();
    -[FHTransaction displayName](v5, "displayName");
    HIDWORD(v138) = 0;
    v114 = 0;
    v137 = 1;
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = (void *)v37;
    if ((void *)v37 != v112)
    {
      v133[8] = 0x100000001;
      v133[7] = 0x100000001;
      v18 = 1;
      v19 = 1;
      v133[6] = 0x100000001;
      HIDWORD(v133[5]) = 1;
      v20 = 0;
      goto LABEL_97;
    }
  }
  -[FHTransaction street](self, "street");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHTransaction street](v5, "street");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v38;
  if (objc_msgSend(v38, "isEqualToString:"))
  {
    -[FHTransaction city](self, "city");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTransaction city](v5, "city");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v39;
    if (objc_msgSend(v39, "isEqualToString:"))
    {
      -[FHTransaction state](self, "state");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHTransaction state](v5, "state");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v40;
      if (objc_msgSend(v40, "isEqualToString:"))
      {
        -[FHTransaction zip](self, "zip");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHTransaction zip](v5, "zip");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v41;
        if (objc_msgSend(v41, "isEqualToString:"))
        {
          -[FHTransaction countryCode](self, "countryCode");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHTransaction countryCode](v5, "countryCode");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v42;
          if (objc_msgSend(v42, "isEqualToString:"))
          {
            -[FHTransaction altDSID](self, "altDSID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHTransaction altDSID](v5, "altDSID");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v43;
            if (objc_msgSend(v43, "isEqualToString:"))
            {
              -[FHTransaction receiptIdentifier](self, "receiptIdentifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[FHTransaction receiptIdentifier](v5, "receiptIdentifier");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = v44;
              if (objc_msgSend(v44, "isEqualToString:"))
              {
                -[FHTransaction country](self, "country");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[FHTransaction country](v5, "country");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = v45;
                if (objc_msgSend(v45, "isEqualToString:"))
                {
                  -[FHTransaction merchantUniqueIdentifier](self, "merchantUniqueIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FHTransaction merchantUniqueIdentifier](v5, "merchantUniqueIdentifier");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v92 = v46;
                  if (objc_msgSend(v46, "isEqualToString:"))
                  {
                    -[FHTransaction name](self, "name");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    -[FHTransaction name](v5, "name");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v90 = v47;
                    if (objc_msgSend(v47, "isEqualToString:"))
                    {
                      -[FHTransaction rawName](self, "rawName");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[FHTransaction rawName](v5, "rawName");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      v88 = v48;
                      if (objc_msgSend(v48, "isEqualToString:"))
                      {
                        -[FHTransaction timeZone](self, "timeZone");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        -[FHTransaction timeZone](v5, "timeZone");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = v49;
                        if (objc_msgSend(v49, "isEqual:"))
                        {
                          -[FHTransaction merchantDetailedCategory](self, "merchantDetailedCategory");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          -[FHTransaction merchantDetailedCategory](v5, "merchantDetailedCategory");
                          v83 = (void *)objc_claimAutoreleasedReturnValue();
                          v84 = v50;
                          if (objc_msgSend(v50, "isEqualToString:"))
                          {
                            -[FHTransaction location](self, "location");
                            v51 = (void *)objc_claimAutoreleasedReturnValue();
                            -[FHTransaction location](v5, "location");
                            v81 = (void *)objc_claimAutoreleasedReturnValue();
                            v82 = v51;
                            if (!objc_msgSend(v51, "isEqual:"))
                              goto LABEL_145;
                            v52 = -[FHTransaction industryCode](self, "industryCode");
                            if (v52 != -[FHTransaction industryCode](v5, "industryCode"))
                              goto LABEL_145;
                            v53 = -[FHTransaction category](self, "category");
                            if (v53 != -[FHTransaction category](v5, "category"))
                              goto LABEL_145;
                            v54 = -[FHTransaction transactionStatus](self, "transactionStatus");
                            if (v54 != -[FHTransaction transactionStatus](v5, "transactionStatus"))
                              goto LABEL_145;
                            v55 = -[FHTransaction transactionSource](self, "transactionSource");
                            if (v55 != -[FHTransaction transactionSource](v5, "transactionSource"))
                              goto LABEL_145;
                            v56 = -[FHTransaction cardType](self, "cardType");
                            if (v56 != -[FHTransaction cardType](v5, "cardType"))
                              goto LABEL_145;
                            v57 = -[FHTransaction transactionType](self, "transactionType");
                            if (v57 != -[FHTransaction transactionType](v5, "transactionType"))
                              goto LABEL_145;
                            v58 = -[FHTransaction accountType](self, "accountType");
                            if (v58 != -[FHTransaction accountType](v5, "accountType"))
                              goto LABEL_145;
                            v59 = -[FHTransaction transactionInternalState](self, "transactionInternalState");
                            if (v59 != -[FHTransaction transactionInternalState](v5, "transactionInternalState"))
                              goto LABEL_145;
                            v60 = -[FHTransaction hasLocation](self, "hasLocation");
                            if (v60 == -[FHTransaction hasLocation](v5, "hasLocation")
                              && (v61 = -[FHTransaction mapsMerchantID](self, "mapsMerchantID"),
                                  v61 == -[FHTransaction mapsMerchantID](v5, "mapsMerchantID"))
                              && (v62 = -[FHTransaction mapsMerchantResultProviderID](self, "mapsMerchantResultProviderID"), v62 == -[FHTransaction mapsMerchantResultProviderID](v5, "mapsMerchantResultProviderID"))&& (v63 = -[FHTransaction mapsMerchantBrandID](self, "mapsMerchantBrandID"), v63 == -[FHTransaction mapsMerchantBrandID](v5, "mapsMerchantBrandID"))&& (v64 = -[FHTransaction mapsMerchantBrandResultProviderID](self, "mapsMerchantBrandResultProviderID"), v64 == -[FHTransaction mapsMerchantBrandResultProviderID](v5, "mapsMerchantBrandResultProviderID"))&& (v65 = -[FHTransaction disputeType](self, "disputeType"), v65 == -[FHTransaction disputeType](v5, "disputeType"))&& (v66 = -[FHTransaction disputeStatus](self, "disputeStatus"), v66 == -[FHTransaction disputeStatus](v5, "disputeStatus")))
                            {
                              -[FHTransaction peerPaymentCounterpartHandle](self, "peerPaymentCounterpartHandle");
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              -[FHTransaction peerPaymentCounterpartHandle](v5, "peerPaymentCounterpartHandle");
                              v79 = (void *)objc_claimAutoreleasedReturnValue();
                              v80 = v67;
                              if (objc_msgSend(v67, "isEqualToString:")
                                && (v68 = -[FHTransaction peerPaymentType](self, "peerPaymentType"),
                                    v68 == -[FHTransaction peerPaymentType](v5, "peerPaymentType")))
                              {
                                -[FHTransaction transactionDescription](self, "transactionDescription");
                                v69 = (void *)objc_claimAutoreleasedReturnValue();
                                -[FHTransaction transactionDescription](v5, "transactionDescription");
                                v77 = (void *)objc_claimAutoreleasedReturnValue();
                                v78 = v69;
                                if (objc_msgSend(v69, "isEqualToString:")
                                  && (v70 = -[FHTransaction recurring](self, "recurring"),
                                      v70 == -[FHTransaction recurring](v5, "recurring")))
                                {
                                  -[FHTransaction disputeOpenDate](self, "disputeOpenDate");
                                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[FHTransaction disputeOpenDate](v5, "disputeOpenDate");
                                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                                  v76 = v71;
                                  if (objc_msgSend(v71, "isEqual:"))
                                  {
                                    -[FHTransaction disputeLastUpdatedDate](self, "disputeLastUpdatedDate");
                                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[FHTransaction disputeLastUpdatedDate](v5, "disputeLastUpdatedDate");
                                    v73 = objc_claimAutoreleasedReturnValue();
                                    v74 = v72;
                                    v20 = objc_msgSend(v72, "isEqual:", v73);
                                    v7 = (void *)v73;
                                    v133[8] = 0x100000001;
                                    v133[7] = 0x100000001;
                                    v18 = 1;
                                    v19 = 1;
                                    v133[6] = 0x100000001;
                                    HIDWORD(v133[5]) = 1;
                                    v112 = v113;
                                    v27 = 1;
                                  }
                                  else
                                  {
                                    v27 = 0;
                                    v20 = 0;
                                    v133[8] = 0x100000001;
                                    v133[7] = 0x100000001;
                                    v18 = 1;
                                    v19 = 1;
                                    v133[6] = 0x100000001;
                                    HIDWORD(v133[5]) = 1;
                                    v112 = v113;
                                  }
                                  LODWORD(v133[5]) = 1;
                                  v133[4] = 0x100000001;
                                  v133[3] = 0x100000001;
                                  v133[2] = 0x100000001;
                                  v133[1] = 0x100000001;
                                  v133[0] = 0x100000001;
                                  v21 = 1;
                                  v22 = 1;
                                  v23 = 1;
                                  v24 = 1;
                                  v25 = 1;
                                  v26 = 1;
                                }
                                else
                                {
                                  v26 = 0;
                                  v27 = 0;
                                  v20 = 0;
                                  v133[8] = 0x100000001;
                                  v133[7] = 0x100000001;
                                  v18 = 1;
                                  v19 = 1;
                                  v133[6] = 0x100000001;
                                  v112 = v113;
                                  v133[5] = 0x100000001;
                                  v133[4] = 0x100000001;
                                  v133[3] = 0x100000001;
                                  v133[2] = 0x100000001;
                                  v133[1] = 0x100000001;
                                  v133[0] = 0x100000001;
                                  v21 = 1;
                                  v22 = 1;
                                  v23 = 1;
                                  v24 = 1;
                                  v25 = 1;
                                }
                              }
                              else
                              {
                                v25 = 0;
                                v26 = 0;
                                v27 = 0;
                                v20 = 0;
                                v133[8] = 0x100000001;
                                v133[7] = 0x100000001;
                                v18 = 1;
                                v19 = 1;
                                v133[6] = 0x100000001;
                                v112 = v113;
                                v133[5] = 0x100000001;
                                v133[4] = 0x100000001;
                                v133[3] = 0x100000001;
                                v133[2] = 0x100000001;
                                v133[1] = 0x100000001;
                                v133[0] = 0x100000001;
                                v21 = 1;
                                v22 = 1;
                                v23 = 1;
                                v24 = 1;
                              }
                            }
                            else
                            {
LABEL_145:
                              v24 = 0;
                              v25 = 0;
                              v26 = 0;
                              v27 = 0;
                              v20 = 0;
                              v133[8] = 0x100000001;
                              v133[7] = 0x100000001;
                              v18 = 1;
                              v19 = 1;
                              v133[6] = 0x100000001;
                              v112 = v113;
                              v133[5] = 0x100000001;
                              v133[4] = 0x100000001;
                              v133[3] = 0x100000001;
                              v133[2] = 0x100000001;
                              v133[1] = 0x100000001;
                              v133[0] = 0x100000001;
                              v21 = 1;
                              v22 = 1;
                              v23 = 1;
                            }
                          }
                          else
                          {
                            v23 = 0;
                            v24 = 0;
                            v25 = 0;
                            v26 = 0;
                            v27 = 0;
                            v20 = 0;
                            v133[8] = 0x100000001;
                            v133[7] = 0x100000001;
                            v18 = 1;
                            v19 = 1;
                            v133[6] = 0x100000001;
                            v112 = v113;
                            v133[5] = 0x100000001;
                            v133[4] = 0x100000001;
                            v133[3] = 0x100000001;
                            v133[2] = 0x100000001;
                            v133[1] = 0x100000001;
                            v133[0] = 0x100000001;
                            v21 = 1;
                            v22 = 1;
                          }
                        }
                        else
                        {
                          v22 = 0;
                          v23 = 0;
                          v24 = 0;
                          v25 = 0;
                          v26 = 0;
                          v27 = 0;
                          v20 = 0;
                          v133[8] = 0x100000001;
                          v133[7] = 0x100000001;
                          v18 = 1;
                          v19 = 1;
                          v133[6] = 0x100000001;
                          v112 = v113;
                          v133[5] = 0x100000001;
                          v133[4] = 0x100000001;
                          v133[3] = 0x100000001;
                          v133[2] = 0x100000001;
                          v133[1] = 0x100000001;
                          v133[0] = 0x100000001;
                          v21 = 1;
                        }
                      }
                      else
                      {
                        v21 = 0;
                        v22 = 0;
                        v23 = 0;
                        v24 = 0;
                        v25 = 0;
                        v26 = 0;
                        v27 = 0;
                        v20 = 0;
                        v133[8] = 0x100000001;
                        v133[7] = 0x100000001;
                        v18 = 1;
                        v19 = 1;
                        v133[6] = 0x100000001;
                        v112 = v113;
                        v133[5] = 0x100000001;
                        v133[4] = 0x100000001;
                        v133[3] = 0x100000001;
                        v133[2] = 0x100000001;
                        v133[1] = 0x100000001;
                        v133[0] = 0x100000001;
                      }
                    }
                    else
                    {
                      v133[0] = 0x100000000;
                      v21 = 0;
                      v22 = 0;
                      v23 = 0;
                      v24 = 0;
                      v25 = 0;
                      v26 = 0;
                      v27 = 0;
                      v20 = 0;
                      v133[8] = 0x100000001;
                      v133[7] = 0x100000001;
                      v18 = 1;
                      v19 = 1;
                      v133[6] = 0x100000001;
                      v112 = v113;
                      v133[5] = 0x100000001;
                      v133[4] = 0x100000001;
                      v133[3] = 0x100000001;
                      v133[2] = 0x100000001;
                      v133[1] = 0x100000001;
                    }
                  }
                  else
                  {
                    v133[0] = 0;
                    v21 = 0;
                    v22 = 0;
                    v23 = 0;
                    v24 = 0;
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v20 = 0;
                    v133[8] = 0x100000001;
                    v133[7] = 0x100000001;
                    v18 = 1;
                    v19 = 1;
                    v133[6] = 0x100000001;
                    v112 = v113;
                    v133[5] = 0x100000001;
                    v133[4] = 0x100000001;
                    v133[3] = 0x100000001;
                    v133[2] = 0x100000001;
                    v133[1] = 0x100000001;
                  }
                }
                else
                {
                  *(_QWORD *)((char *)v133 + 4) = 0;
                  LODWORD(v133[0]) = 0;
                  v21 = 0;
                  v22 = 0;
                  v23 = 0;
                  v24 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v20 = 0;
                  v133[8] = 0x100000001;
                  v133[7] = 0x100000001;
                  v18 = 1;
                  v19 = 1;
                  v133[6] = 0x100000001;
                  v112 = v113;
                  v133[5] = 0x100000001;
                  v133[4] = 0x100000001;
                  v133[3] = 0x100000001;
                  v133[2] = 0x100000001;
                  HIDWORD(v133[1]) = 1;
                }
              }
              else
              {
                v133[1] = 0;
                v133[0] = 0;
                v21 = 0;
                v22 = 0;
                v23 = 0;
                v24 = 0;
                v25 = 0;
                v26 = 0;
                v27 = 0;
                v20 = 0;
                v133[8] = 0x100000001;
                v133[7] = 0x100000001;
                v18 = 1;
                v19 = 1;
                v133[6] = 0x100000001;
                v112 = v113;
                v133[5] = 0x100000001;
                v133[4] = 0x100000001;
                v133[3] = 0x100000001;
                v133[2] = 0x100000001;
              }
            }
            else
            {
              memset(v133, 0, 20);
              v21 = 0;
              v22 = 0;
              v23 = 0;
              v24 = 0;
              v25 = 0;
              v26 = 0;
              v27 = 0;
              v20 = 0;
              v133[8] = 0x100000001;
              v133[7] = 0x100000001;
              v18 = 1;
              v19 = 1;
              v133[6] = 0x100000001;
              v112 = v113;
              v133[5] = 0x100000001;
              v133[4] = 0x100000001;
              v133[3] = 0x100000001;
              HIDWORD(v133[2]) = 1;
            }
          }
          else
          {
            memset(v133, 0, 24);
            v21 = 0;
            v22 = 0;
            v23 = 0;
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v20 = 0;
            v133[8] = 0x100000001;
            v133[7] = 0x100000001;
            v18 = 1;
            v19 = 1;
            v133[6] = 0x100000001;
            v112 = v113;
            v133[5] = 0x100000001;
            v133[4] = 0x100000001;
            v133[3] = 0x100000001;
          }
        }
        else
        {
          memset(v133, 0, 28);
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v20 = 0;
          v133[8] = 0x100000001;
          v133[7] = 0x100000001;
          v18 = 1;
          v19 = 1;
          v133[6] = 0x100000001;
          v112 = v113;
          v133[5] = 0x100000001;
          v133[4] = 0x100000001;
          HIDWORD(v133[3]) = 1;
        }
      }
      else
      {
        memset(v133, 0, 32);
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v20 = 0;
        v133[8] = 0x100000001;
        v133[7] = 0x100000001;
        v18 = 1;
        v19 = 1;
        v133[6] = 0x100000001;
        v112 = v113;
        v133[5] = 0x100000001;
        v133[4] = 0x100000001;
      }
    }
    else
    {
      memset(v133, 0, 36);
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v20 = 0;
      v133[8] = 0x100000001;
      v133[7] = 0x100000001;
      v18 = 1;
      v19 = 1;
      v133[6] = 0x100000001;
      v112 = v113;
      v133[5] = 0x100000001;
      HIDWORD(v133[4]) = 1;
    }
  }
  else
  {
    memset(v133, 0, 40);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v20 = 0;
    v133[8] = 0x100000001;
    v133[7] = 0x100000001;
    v18 = 1;
    v19 = 1;
    v133[6] = 0x100000001;
    v112 = v113;
    v133[5] = 0x100000001;
  }
LABEL_22:
  if (v27)
  {
    v28 = v22;
    v29 = v21;
    v30 = v24;
    v31 = v19;
    v32 = v25;
    v33 = v18;
    v34 = v26;

    v35 = v34;
    v18 = v33;
    v25 = v32;
    v19 = v31;
    v24 = v30;
    v21 = v29;
    v22 = v28;
    if (!v35)
      goto LABEL_24;
  }
  else if (!v26)
  {
LABEL_24:
    if (v25)
      goto LABEL_25;
    goto LABEL_31;
  }

  if (v25)
  {
LABEL_25:

    if (!v24)
      goto LABEL_26;
    goto LABEL_32;
  }
LABEL_31:
  if (!v24)
  {
LABEL_26:
    if (v23)
      goto LABEL_27;
    goto LABEL_33;
  }
LABEL_32:

  if (v23)
  {
LABEL_27:

    if (!v22)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_33:
  if (v22)
  {
LABEL_34:

  }
LABEL_35:
  if (v21)
  {

  }
  if (LODWORD(v133[0]))
  {

  }
  if (HIDWORD(v133[0]))
  {

  }
  if (LODWORD(v133[1]))
  {

  }
  if (HIDWORD(v133[1]))
  {

  }
  if (LODWORD(v133[2]))
  {

  }
  if (HIDWORD(v133[2]))
  {

  }
  if (LODWORD(v133[3]))
  {

  }
  if (HIDWORD(v133[3]))
  {

  }
  if (LODWORD(v133[4]))
  {

  }
  if (HIDWORD(v133[4]))
  {

  }
  if (LODWORD(v133[5]))
  {

  }
  if (v137)
  {

  }
  if (HIDWORD(v138))
  {

  }
  if ((_DWORD)v138)

  if (LODWORD(v133[6]))
  if (HIDWORD(v133[5]))
  {

  }
  if (HIDWORD(v133[6]))
  {

  }
  if (v19)
  {

  }
  if (LODWORD(v133[7]))
  {

  }
  if (v18)
  {

  }
  if (HIDWORD(v133[7]))
  {

  }
  if (LODWORD(v133[8]))
  {

  }
  if (HIDWORD(v133[8]))
  {

  }
  if (v134)
  {

  }
LABEL_86:

  return v20;
}

- (FHTransaction)initWithDictionary:(id)a3 dateFormatter:(id)a4
{
  id v6;
  id v7;
  FHTransaction *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *transactionServiceIdentifier;
  uint64_t v13;
  NSString *financeTransactionIdentifier;
  uint64_t v15;
  NSString *paymentHash;
  uint64_t v17;
  NSString *transactionSourceIdentifier;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSDecimalNumber *amount;
  uint64_t v24;
  NSString *currencyCode;
  void *v26;
  uint64_t v27;
  NSDate *transactionDate;
  void *v29;
  uint64_t v30;
  NSDate *transactionStatusChangedDate;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *street;
  uint64_t v40;
  NSString *city;
  uint64_t v42;
  NSString *state;
  uint64_t v44;
  NSString *zip;
  uint64_t v46;
  NSString *countryCode;
  uint64_t v48;
  NSString *altDSID;
  uint64_t v50;
  NSString *receiptIdentifier;
  uint64_t v52;
  NSString *country;
  uint64_t v54;
  NSString *merchantUniqueIdentifier;
  uint64_t v56;
  NSString *name;
  uint64_t v58;
  NSString *rawName;
  void *v60;
  void *v61;
  uint64_t v62;
  NSString *merchantDetailedCategory;
  uint64_t v64;
  NSString *industryCategory;
  uint64_t v66;
  NSString *displayName;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  CLLocationDegrees v74;
  void *v75;
  double v76;
  CLLocationDegrees v77;
  CLLocationCoordinate2D v78;
  id v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  uint64_t v87;
  CLLocation *location;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSTimeZone *timeZone;
  void *v94;
  void *v95;
  uint64_t v96;
  NSString *peerPaymentCounterpartHandle;
  void *v98;
  uint64_t v99;
  NSString *transactionDescription;
  void *v101;
  void *v102;
  uint64_t v103;
  NSDate *disputeOpenDate;
  void *v105;
  uint64_t v106;
  NSDate *disputeLastUpdatedDate;
  objc_super v109;

  v6 = a3;
  v7 = a4;
  v109.receiver = self;
  v109.super_class = (Class)FHTransaction;
  v8 = -[FHTransaction init](&v109, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "valueForKey:", CFSTR("serviceIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    transactionServiceIdentifier = v8->_transactionServiceIdentifier;
    v8->_transactionServiceIdentifier = (NSString *)v11;

    objc_msgSend(v6, "valueForKey:", CFSTR("financeTransactionIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    financeTransactionIdentifier = v8->_financeTransactionIdentifier;
    v8->_financeTransactionIdentifier = (NSString *)v13;

    objc_msgSend(v6, "valueForKey:", CFSTR("paymentHash"));
    v15 = objc_claimAutoreleasedReturnValue();
    paymentHash = v8->_paymentHash;
    v8->_paymentHash = (NSString *)v15;

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionSourceIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v8->_transactionSourceIdentifier;
    v8->_transactionSourceIdentifier = (NSString *)v17;

    objc_msgSend(v6, "valueForKey:", CFSTR("amount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x24BDD1518]);
      objc_msgSend(v6, "valueForKey:", CFSTR("amount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v22 = objc_msgSend(v20, "initWithDouble:");
      amount = v8->_amount;
      v8->_amount = (NSDecimalNumber *)v22;

    }
    objc_msgSend(v6, "valueForKey:", CFSTR("currencyCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v24;

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    transactionDate = v8->_transactionDate;
    v8->_transactionDate = (NSDate *)v27;

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionStatusChangedDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    transactionStatusChangedDate = v8->_transactionStatusChangedDate;
    v8->_transactionStatusChangedDate = (NSDate *)v30;

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionStatus"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_transactionStatus = objc_msgSend(v32, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionSource"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_transactionSource = objc_msgSend(v33, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("cardType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_cardType = objc_msgSend(v34, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_transactionType = objc_msgSend(v35, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("accountType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_accountType = objc_msgSend(v36, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionInternalState"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_transactionInternalState = objc_msgSend(v37, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("street"));
    v38 = objc_claimAutoreleasedReturnValue();
    street = v8->_street;
    v8->_street = (NSString *)v38;

    objc_msgSend(v6, "valueForKey:", CFSTR("city"));
    v40 = objc_claimAutoreleasedReturnValue();
    city = v8->_city;
    v8->_city = (NSString *)v40;

    objc_msgSend(v6, "valueForKey:", CFSTR("state"));
    v42 = objc_claimAutoreleasedReturnValue();
    state = v8->_state;
    v8->_state = (NSString *)v42;

    objc_msgSend(v6, "valueForKey:", CFSTR("zip"));
    v44 = objc_claimAutoreleasedReturnValue();
    zip = v8->_zip;
    v8->_zip = (NSString *)v44;

    objc_msgSend(v6, "valueForKey:", CFSTR("countryCode"));
    v46 = objc_claimAutoreleasedReturnValue();
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v46;

    objc_msgSend(v6, "valueForKey:", CFSTR("altDSID"));
    v48 = objc_claimAutoreleasedReturnValue();
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v48;

    objc_msgSend(v6, "valueForKey:", CFSTR("receiptIdentifier"));
    v50 = objc_claimAutoreleasedReturnValue();
    receiptIdentifier = v8->_receiptIdentifier;
    v8->_receiptIdentifier = (NSString *)v50;

    objc_msgSend(v6, "valueForKey:", CFSTR("country"));
    v52 = objc_claimAutoreleasedReturnValue();
    country = v8->_country;
    v8->_country = (NSString *)v52;

    objc_msgSend(v6, "valueForKey:", CFSTR("merchantUniqueIdentifier"));
    v54 = objc_claimAutoreleasedReturnValue();
    merchantUniqueIdentifier = v8->_merchantUniqueIdentifier;
    v8->_merchantUniqueIdentifier = (NSString *)v54;

    objc_msgSend(v6, "valueForKey:", CFSTR("name"));
    v56 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v56;

    objc_msgSend(v6, "valueForKey:", CFSTR("rawName"));
    v58 = objc_claimAutoreleasedReturnValue();
    rawName = v8->_rawName;
    v8->_rawName = (NSString *)v58;

    objc_msgSend(v6, "valueForKey:", CFSTR("industryCode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_industryCode = objc_msgSend(v60, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("category"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_category = objc_msgSend(v61, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("merchantDetailedCategory"));
    v62 = objc_claimAutoreleasedReturnValue();
    merchantDetailedCategory = v8->_merchantDetailedCategory;
    v8->_merchantDetailedCategory = (NSString *)v62;

    objc_msgSend(v6, "valueForKey:", CFSTR("industryCategory"));
    v64 = objc_claimAutoreleasedReturnValue();
    industryCategory = v8->_industryCategory;
    v8->_industryCategory = (NSString *)v64;

    objc_msgSend(v6, "valueForKey:", CFSTR("displayName"));
    v66 = objc_claimAutoreleasedReturnValue();
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v66;

    objc_msgSend(v6, "valueForKey:", CFSTR("mapsMerchantID"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_mapsMerchantID = objc_msgSend(v68, "unsignedLongLongValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("mapsMerchantResultProviderID"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_mapsMerchantResultProviderID = objc_msgSend(v69, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("mapsMerchantBrandID"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_mapsMerchantBrandID = objc_msgSend(v70, "unsignedLongLongValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("mapsMerchantBrandResultProviderID"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_mapsMerchantBrandResultProviderID = objc_msgSend(v71, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("locationLatitude"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    v74 = v73;

    objc_msgSend(v6, "valueForKey:", CFSTR("locationLongitude"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "doubleValue");
    v77 = v76;

    v78 = CLLocationCoordinate2DMake(v74, v77);
    if ((v74 != 0.0 || v77 != 0.0) && CLLocationCoordinate2DIsValid(v78))
    {
      v79 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v6, "valueForKey:", CFSTR("locationHorizontalAccuracy"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "doubleValue");
      v82 = v81;
      objc_msgSend(v6, "valueForKey:", CFSTR("locationVerticalAccuracy"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "doubleValue");
      v85 = v84;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v79, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v86, v78.latitude, v78.longitude, 0.0, v82, v85);
      location = v8->_location;
      v8->_location = (CLLocation *)v87;

    }
    objc_msgSend(v6, "valueForKey:", CFSTR("timeZone"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      v90 = (void *)MEMORY[0x24BDBCF38];
      objc_msgSend(v6, "valueForKey:", CFSTR("timeZone"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "timeZoneForSecondsFromGMT:", objc_msgSend(v91, "integerValue"));
      v92 = objc_claimAutoreleasedReturnValue();
      timeZone = v8->_timeZone;
      v8->_timeZone = (NSTimeZone *)v92;

    }
    objc_msgSend(v6, "valueForKey:", CFSTR("disputeType"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_disputeType = objc_msgSend(v94, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("disputeStatus"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_disputeStatus = objc_msgSend(v95, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("peerPaymentCounterpartHandle"));
    v96 = objc_claimAutoreleasedReturnValue();
    peerPaymentCounterpartHandle = v8->_peerPaymentCounterpartHandle;
    v8->_peerPaymentCounterpartHandle = (NSString *)v96;

    objc_msgSend(v6, "valueForKey:", CFSTR("peerPaymentType"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_peerPaymentType = objc_msgSend(v98, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("transactionDescription"));
    v99 = objc_claimAutoreleasedReturnValue();
    transactionDescription = v8->_transactionDescription;
    v8->_transactionDescription = (NSString *)v99;

    objc_msgSend(v6, "valueForKey:", CFSTR("recurring"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_recurring = v101 != 0;

    objc_msgSend(v6, "valueForKey:", CFSTR("disputeOpenDate"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v102);
    v103 = objc_claimAutoreleasedReturnValue();
    disputeOpenDate = v8->_disputeOpenDate;
    v8->_disputeOpenDate = (NSDate *)v103;

    objc_msgSend(v6, "valueForKey:", CFSTR("disputeLastUpdatedDate"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v105);
    v106 = objc_claimAutoreleasedReturnValue();
    disputeLastUpdatedDate = v8->_disputeLastUpdatedDate;
    v8->_disputeLastUpdatedDate = (NSDate *)v106;

  }
  return v8;
}

- (FHTransaction)initWithDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  FHTransaction *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1500];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss Z"));
  v7 = -[FHTransaction initWithDictionary:dateFormatter:](self, "initWithDictionary:dateFormatter:", v5, v6);

  return v7;
}

- (FHTransaction)initWithJsonString:(id)a3
{
  void *v4;
  void *v5;
  FHTransaction *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self = -[FHTransaction initWithDictionary:](self, "initWithDictionary:", v5);
  v6 = self;

  return v6;
}

- (id)toDictionary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "safelySetObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_transactionServiceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_financeTransactionIdentifier, CFSTR("financeTransactionIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_paymentHash, CFSTR("paymentHash"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v3, "setDate:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v3, "setDate:forKey:", self->_transactionStatusChangedDate, CFSTR("transactionStatusChangedDate"));
  objc_msgSend(v3, "setInteger:forKey:", self->_transactionStatus, CFSTR("transactionStatus"));
  objc_msgSend(v3, "setInteger:forKey:", self->_transactionSource, CFSTR("transactionSource"));
  objc_msgSend(v3, "setInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v3, "setInteger:forKey:", self->_transactionType, CFSTR("transactionType"));
  objc_msgSend(v3, "setInteger:forKey:", self->_accountType, CFSTR("accountType"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
  objc_msgSend(v3, "setInteger:forKey:", self->_transactionInternalState, CFSTR("transactionInternalState"));
  objc_msgSend(v3, "setInteger:forKey:", -[NSTimeZone secondsFromGMT](self->_timeZone, "secondsFromGMT"), CFSTR("timeZone"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_merchantUniqueIdentifier, CFSTR("merchantUniqueIdentifier"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_rawName, CFSTR("rawName"));
  objc_msgSend(v3, "setInteger:forKey:", self->_industryCode, CFSTR("industryCode"));
  objc_msgSend(v3, "setInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_industryCategory, CFSTR("industryCategory"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_street, CFSTR("street"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_zip, CFSTR("zip"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_country, CFSTR("country"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_merchantDetailedCategory, CFSTR("merchantDetailedCategory"));
  objc_msgSend(v3, "setUnsignedLongLong:forKey:", self->_mapsMerchantID, CFSTR("mapsMerchantID"));
  objc_msgSend(v3, "setInt32:forKey:", self->_mapsMerchantResultProviderID, CFSTR("mapsMerchantResultProviderID"));
  objc_msgSend(v3, "setUnsignedLongLong:forKey:", self->_mapsMerchantBrandID, CFSTR("mapsMerchantBrandID"));
  objc_msgSend(v3, "setInt32:forKey:", self->_mapsMerchantBrandResultProviderID, CFSTR("mapsMerchantBrandResultProviderID"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v3, "setInteger:forKey:", self->_disputeType, CFSTR("disputeType"));
  objc_msgSend(v3, "setInteger:forKey:", self->_disputeStatus, CFSTR("disputeStatus"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_peerPaymentCounterpartHandle, CFSTR("peerPaymentCounterpartHandle"));
  objc_msgSend(v3, "setInteger:forKey:", self->_peerPaymentType, CFSTR("peerPaymentType"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_transactionDescription, CFSTR("transactionDescription"));
  objc_msgSend(v3, "setBool:forKey:", self->_recurring, CFSTR("recurring"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_disputeOpenDate, CFSTR("disputeOpenDate"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_disputeLastUpdatedDate, CFSTR("disputeLastUpdatedDate"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)toJson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v4 = a3;
  -[FHTransaction toDictionary](self, "toDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 2, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  else
    v8 = 0;

  return v8;
}

+ (id)fhProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__FHTransaction_fhProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fhProperties_onceToken != -1)
    dispatch_once(&fhProperties_onceToken, block);
  return (id)fhProperties__fhProperties;
}

void __29__FHTransaction_fhProperties__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  objc_class *v3;
  Ivar *v4;
  unint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int outCount;

  v0 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v1 = (void *)fhProperties__fhProperties;
  fhProperties__fhProperties = (uint64_t)v0;

  v2 = (void *)objc_opt_new();
  outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyIvarList(v3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", ivar_getName(v4[i]));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringFromIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v7);

    }
  }
  free(v4);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v2);
  v9 = (void *)fhProperties__fhProperties;
  fhProperties__fhProperties = v8;

}

+ (id)_allowedCountryNamesForMapsMerchant
{
  if (_allowedCountryNamesForMapsMerchant_onceToken != -1)
    dispatch_once(&_allowedCountryNamesForMapsMerchant_onceToken, &__block_literal_global_2);
  return (id)_allowedCountryNamesForMapsMerchant__allowedCountryNames;
}

void __52__FHTransaction__allowedCountryNamesForMapsMerchant__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("USA"), CFSTR("usa"), CFSTR("United States"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allowedCountryNamesForMapsMerchant__allowedCountryNames;
  _allowedCountryNamesForMapsMerchant__allowedCountryNames = v0;

}

- (id)description
{
  void *v3;
  NSTimeZone *timeZone;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("identifier"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("serviceIdentifier"),
    self->_transactionServiceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("financeTransactionIdentifier"),
    self->_financeTransactionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("paymentHash"), self->_paymentHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("transactionSourceIdentifier"),
    self->_transactionSourceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("amount"), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("currencyCode"), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("transactionDate"), self->_transactionDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("transactionStatusChangedDate"),
    self->_transactionStatusChangedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("transactionStatus"), self->_transactionStatus);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("transactionSource"), self->_transactionSource);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("cardType"), self->_cardType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("transactionType"), self->_transactionType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("accountType"), self->_accountType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("altDSID"), self->_altDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("receiptIdentifier"), self->_receiptIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "),
    CFSTR("transactionInternalState"),
    self->_transactionInternalState);
  timeZone = self->_timeZone;
  if (timeZone)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSTimeZone secondsFromGMT](timeZone, "secondsFromGMT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("timeZone"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("timeZone"), 0);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("merchantUniqueIdentifier"),
    self->_merchantUniqueIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("name"), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("rawName"), self->_rawName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("industryCode"), self->_industryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("category"), self->_category);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("industryCategory"), self->_industryCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("displayName"), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("street"), self->_street);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("city"), self->_city);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("state"), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("zip"), self->_zip);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("countryCode"), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("country"), self->_country);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("merchantDetailedCategory"),
    self->_merchantDetailedCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%llu'; "), CFSTR("mapsMerchantID"), self->_mapsMerchantID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%d'; "),
    CFSTR("mapsMerchantResultProviderID"),
    self->_mapsMerchantResultProviderID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%llu'; "), CFSTR("mapsMerchantBrandID"), self->_mapsMerchantBrandID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%d'; "),
    CFSTR("mapsMerchantBrandResultProviderID"),
    self->_mapsMerchantBrandResultProviderID);
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("locationLatitude"), v6);
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("locationLongitude"), v7);
  -[CLLocation horizontalAccuracy](self->_location, "horizontalAccuracy");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("locationHorizontalAccuracy"), v8);
  -[CLLocation verticalAccuracy](self->_location, "verticalAccuracy");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("locationVerticalAccuracy"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("disputeType"), self->_disputeType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("disputeStatus"), self->_disputeStatus);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("disputeOpenDate"), self->_disputeOpenDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("disputeLastUpdatedDate"), self->_disputeLastUpdatedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("peerPaymentCounterpartHandle"),
    self->_peerPaymentCounterpartHandle);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("peerPaymentType"), self->_peerPaymentType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("transactionDescription"), self->_transactionDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%d'; "), CFSTR("recurring"), self->_recurring);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)hasLocation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[FHTransaction location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FHTransaction location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    if (v5 == 0.0)
    {
      v8 = 0;
    }
    else
    {
      -[FHTransaction location](self, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "coordinate");
      v8 = v7 != 0.0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (void)setTransactionServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)financeTransactionIdentifier
{
  return self->_financeTransactionIdentifier;
}

- (void)setFinanceTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (void)setTransactionStatusChangedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_cardType = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (void)setReceiptIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)merchantUniqueIdentifier
{
  return self->_merchantUniqueIdentifier;
}

- (void)setMerchantUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)mapsMerchantID
{
  return self->_mapsMerchantID;
}

- (void)setMapsMerchantID:(unint64_t)a3
{
  self->_mapsMerchantID = a3;
}

- (int)mapsMerchantResultProviderID
{
  return self->_mapsMerchantResultProviderID;
}

- (void)setMapsMerchantResultProviderID:(int)a3
{
  self->_mapsMerchantResultProviderID = a3;
}

- (unint64_t)mapsMerchantBrandID
{
  return self->_mapsMerchantBrandID;
}

- (void)setMapsMerchantBrandID:(unint64_t)a3
{
  self->_mapsMerchantBrandID = a3;
}

- (int)mapsMerchantBrandResultProviderID
{
  return self->_mapsMerchantBrandResultProviderID;
}

- (void)setMapsMerchantBrandResultProviderID:(int)a3
{
  self->_mapsMerchantBrandResultProviderID = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)rawName
{
  return self->_rawName;
}

- (void)setRawName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)merchantDetailedCategory
{
  return self->_merchantDetailedCategory;
}

- (void)setMerchantDetailedCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (unint64_t)disputeType
{
  return self->_disputeType;
}

- (void)setDisputeType:(unint64_t)a3
{
  self->_disputeType = a3;
}

- (unint64_t)disputeStatus
{
  return self->_disputeStatus;
}

- (void)setDisputeStatus:(unint64_t)a3
{
  self->_disputeStatus = a3;
}

- (NSDate)disputeOpenDate
{
  return self->_disputeOpenDate;
}

- (void)setDisputeOpenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDate)disputeLastUpdatedDate
{
  return self->_disputeLastUpdatedDate;
}

- (void)setDisputeLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void)setPeerPaymentCounterpartHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (void)setPeerPaymentType:(int64_t)a3
{
  self->_peerPaymentType = a3;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)recurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (unint64_t)transactionInternalState
{
  return self->_transactionInternalState;
}

- (void)setTransactionInternalState:(unint64_t)a3
{
  self->_transactionInternalState = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (NSDictionary)compoundFeatures
{
  return self->_compoundFeatures;
}

- (void)setCompoundFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (int64_t)amountFromDatabase
{
  return self->_amountFromDatabase;
}

- (void)setAmountFromDatabase:(int64_t)a3
{
  self->_amountFromDatabase = a3;
}

- (unint64_t)suggestedSuggestionCategory
{
  return self->_suggestedSuggestionCategory;
}

- (void)setSuggestedSuggestionCategory:(unint64_t)a3
{
  self->_suggestedSuggestionCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundFeatures, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_disputeLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_disputeOpenDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_merchantDetailedCategory, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_merchantUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_financeTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
