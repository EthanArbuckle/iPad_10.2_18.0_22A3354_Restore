@implementation FKApplePayTransactionInsight

- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 merchantName:(id)a4 merchantRawName:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 merchantType:(id)a8 merchantCountryCode:(id)a9 terminalIdentifier:(id)a10 merchantAdditionalData:(id)a11 paymentNetwork:(id)a12 isCoarseLocation:(id)a13 location:(id)a14 merchantIdentifier:(id)a15 merchantRawCANL:(id)a16 merchantRawCity:(id)a17 merchantRawState:(id)a18 merchantRawCountry:(id)a19 merchantCity:(id)a20 merchantZip:(id)a21 merchantState:(id)a22 merchantCleanConfidenceLevel:(id)a23 adamIdentifier:(id)a24 webURL:(id)a25 webMerchantIdentifier:(id)a26 webMerchantName:(id)a27
{
  return -[FKApplePayTransactionInsight initWithPaymentHash:transactionDate:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:](self, "initWithPaymentHash:transactionDate:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 transactionDate:(id)a4 merchantName:(id)a5 merchantRawName:(id)a6 industryCategory:(id)a7 industryCode:(id)a8 merchantType:(id)a9 merchantCountryCode:(id)a10 terminalIdentifier:(id)a11 merchantAdditionalData:(id)a12 paymentNetwork:(id)a13 isCoarseLocation:(id)a14 location:(id)a15 merchantIdentifier:(id)a16 merchantRawCANL:(id)a17 merchantRawCity:(id)a18 merchantRawState:(id)a19 merchantRawCountry:(id)a20 merchantCity:(id)a21 merchantZip:(id)a22 merchantState:(id)a23 merchantCleanConfidenceLevel:(id)a24 adamIdentifier:(id)a25 webURL:(id)a26 webMerchantIdentifier:(id)a27 webMerchantName:(id)a28
{
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  FKApplePayTransactionInsight *v43;
  uint64_t v44;
  NSString *paymentHash;
  uint64_t v46;
  NSDate *transactionDate;
  uint64_t v48;
  NSString *merchantName;
  uint64_t v50;
  NSString *merchantRawName;
  uint64_t v52;
  NSString *industryCategory;
  uint64_t v54;
  NSNumber *industryCode;
  uint64_t v56;
  NSString *merchantType;
  uint64_t v58;
  NSString *merchantCountryCode;
  uint64_t v60;
  NSString *terminalIdentifier;
  uint64_t v62;
  NSString *merchantAdditionalData;
  uint64_t v64;
  NSString *paymentNetwork;
  uint64_t v66;
  NSNumber *isCoarseLocation;
  uint64_t v68;
  CLLocation *location;
  uint64_t v70;
  NSString *merchantIdentifier;
  uint64_t v72;
  NSString *merchantRawCANL;
  uint64_t v74;
  NSString *merchantRawCity;
  uint64_t v76;
  NSString *merchantRawState;
  uint64_t v78;
  NSString *merchantRawCountry;
  uint64_t v80;
  NSString *merchantCity;
  uint64_t v82;
  NSString *merchantZip;
  uint64_t v84;
  NSString *merchantState;
  uint64_t v86;
  NSNumber *merchantCleanConfidenceLevel;
  uint64_t v88;
  NSNumber *adamIdentifier;
  uint64_t v90;
  NSURL *webURL;
  uint64_t v92;
  NSString *webMerchantIdentifier;
  uint64_t v94;
  NSString *webMerchantName;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  objc_super v115;

  v33 = a3;
  v34 = a4;
  v114 = a5;
  v113 = a6;
  v112 = a7;
  v111 = a8;
  v110 = a9;
  v35 = v34;
  v109 = a10;
  v108 = a11;
  v107 = a12;
  v106 = a13;
  v105 = a14;
  v104 = a15;
  v103 = a16;
  v102 = a17;
  v101 = a18;
  v100 = a19;
  v99 = a20;
  v98 = a21;
  v36 = a22;
  v37 = a23;
  v38 = a24;
  v39 = a25;
  v40 = a26;
  v41 = a27;
  v42 = a28;
  v115.receiver = self;
  v115.super_class = (Class)FKApplePayTransactionInsight;
  v43 = -[FKApplePayTransactionInsight init](&v115, sel_init);
  if (v43)
  {
    v44 = objc_msgSend(v33, "copy");
    paymentHash = v43->_paymentHash;
    v43->_paymentHash = (NSString *)v44;

    v46 = objc_msgSend(v35, "copy");
    transactionDate = v43->_transactionDate;
    v43->_transactionDate = (NSDate *)v46;

    v48 = objc_msgSend(v114, "copy");
    merchantName = v43->_merchantName;
    v43->_merchantName = (NSString *)v48;

    v50 = objc_msgSend(v113, "copy");
    merchantRawName = v43->_merchantRawName;
    v43->_merchantRawName = (NSString *)v50;

    v52 = objc_msgSend(v112, "copy");
    industryCategory = v43->_industryCategory;
    v43->_industryCategory = (NSString *)v52;

    v54 = objc_msgSend(v111, "copy");
    industryCode = v43->_industryCode;
    v43->_industryCode = (NSNumber *)v54;

    v56 = objc_msgSend(v110, "copy");
    merchantType = v43->_merchantType;
    v43->_merchantType = (NSString *)v56;

    v58 = objc_msgSend(v109, "copy");
    merchantCountryCode = v43->_merchantCountryCode;
    v43->_merchantCountryCode = (NSString *)v58;

    v60 = objc_msgSend(v108, "copy");
    terminalIdentifier = v43->_terminalIdentifier;
    v43->_terminalIdentifier = (NSString *)v60;

    v62 = objc_msgSend(v107, "copy");
    merchantAdditionalData = v43->_merchantAdditionalData;
    v43->_merchantAdditionalData = (NSString *)v62;

    v64 = objc_msgSend(v106, "copy");
    paymentNetwork = v43->_paymentNetwork;
    v43->_paymentNetwork = (NSString *)v64;

    v66 = objc_msgSend(v105, "copy");
    isCoarseLocation = v43->_isCoarseLocation;
    v43->_isCoarseLocation = (NSNumber *)v66;

    v68 = objc_msgSend(v104, "copy");
    location = v43->_location;
    v43->_location = (CLLocation *)v68;

    v70 = objc_msgSend(v103, "copy");
    merchantIdentifier = v43->_merchantIdentifier;
    v43->_merchantIdentifier = (NSString *)v70;

    v72 = objc_msgSend(v102, "copy");
    merchantRawCANL = v43->_merchantRawCANL;
    v43->_merchantRawCANL = (NSString *)v72;

    v74 = objc_msgSend(v101, "copy");
    merchantRawCity = v43->_merchantRawCity;
    v43->_merchantRawCity = (NSString *)v74;

    v76 = objc_msgSend(v100, "copy");
    merchantRawState = v43->_merchantRawState;
    v43->_merchantRawState = (NSString *)v76;

    v78 = objc_msgSend(v99, "copy");
    merchantRawCountry = v43->_merchantRawCountry;
    v43->_merchantRawCountry = (NSString *)v78;

    v80 = objc_msgSend(v98, "copy");
    merchantCity = v43->_merchantCity;
    v43->_merchantCity = (NSString *)v80;

    v82 = objc_msgSend(v36, "copy");
    merchantZip = v43->_merchantZip;
    v43->_merchantZip = (NSString *)v82;

    v84 = objc_msgSend(v37, "copy");
    merchantState = v43->_merchantState;
    v43->_merchantState = (NSString *)v84;

    v86 = objc_msgSend(v38, "copy");
    merchantCleanConfidenceLevel = v43->_merchantCleanConfidenceLevel;
    v43->_merchantCleanConfidenceLevel = (NSNumber *)v86;

    v88 = objc_msgSend(v39, "copy");
    adamIdentifier = v43->_adamIdentifier;
    v43->_adamIdentifier = (NSNumber *)v88;

    v90 = objc_msgSend(v40, "copy");
    webURL = v43->_webURL;
    v43->_webURL = (NSURL *)v90;

    v92 = objc_msgSend(v41, "copy");
    webMerchantIdentifier = v43->_webMerchantIdentifier;
    v43->_webMerchantIdentifier = (NSString *)v92;

    v94 = objc_msgSend(v42, "copy");
    webMerchantName = v43->_webMerchantName;
    v43->_webMerchantName = (NSString *)v94;

  }
  return v43;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  void *v31;
  uint64_t v32;
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
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDate copyWithZone:](self->_transactionDate, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_paymentHash, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_merchantName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_merchantRawName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_industryCategory, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSNumber copyWithZone:](self->_industryCode, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSString copyWithZone:](self->_merchantType, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[NSString copyWithZone:](self->_merchantCountryCode, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[NSString copyWithZone:](self->_terminalIdentifier, "copyWithZone:", a3);
  v23 = (void *)v5[9];
  v5[9] = v22;

  v24 = -[NSString copyWithZone:](self->_merchantAdditionalData, "copyWithZone:", a3);
  v25 = (void *)v5[10];
  v5[10] = v24;

  v26 = -[NSString copyWithZone:](self->_paymentNetwork, "copyWithZone:", a3);
  v27 = (void *)v5[11];
  v5[11] = v26;

  v28 = -[NSNumber copyWithZone:](self->_isCoarseLocation, "copyWithZone:", a3);
  v29 = (void *)v5[12];
  v5[12] = v28;

  v30 = -[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v31 = (void *)v5[13];
  v5[13] = v30;

  v32 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v33 = (void *)v5[14];
  v5[14] = v32;

  v34 = -[NSString copyWithZone:](self->_merchantRawCANL, "copyWithZone:", a3);
  v35 = (void *)v5[15];
  v5[15] = v34;

  v36 = -[NSString copyWithZone:](self->_merchantRawCity, "copyWithZone:", a3);
  v37 = (void *)v5[16];
  v5[16] = v36;

  v38 = -[NSString copyWithZone:](self->_merchantRawState, "copyWithZone:", a3);
  v39 = (void *)v5[17];
  v5[17] = v38;

  v40 = -[NSString copyWithZone:](self->_merchantRawCountry, "copyWithZone:", a3);
  v41 = (void *)v5[18];
  v5[18] = v40;

  v42 = -[NSString copyWithZone:](self->_merchantCity, "copyWithZone:", a3);
  v43 = (void *)v5[19];
  v5[19] = v42;

  v44 = -[NSString copyWithZone:](self->_merchantZip, "copyWithZone:", a3);
  v45 = (void *)v5[20];
  v5[20] = v44;

  v46 = -[NSString copyWithZone:](self->_merchantState, "copyWithZone:", a3);
  v47 = (void *)v5[21];
  v5[21] = v46;

  v48 = -[NSNumber copyWithZone:](self->_merchantCleanConfidenceLevel, "copyWithZone:", a3);
  v49 = (void *)v5[22];
  v5[22] = v48;

  v50 = -[NSNumber copyWithZone:](self->_adamIdentifier, "copyWithZone:", a3);
  v51 = (void *)v5[23];
  v5[23] = v50;

  v52 = -[NSURL copyWithZone:](self->_webURL, "copyWithZone:", a3);
  v53 = (void *)v5[24];
  v5[24] = v52;

  v54 = -[NSString copyWithZone:](self->_webMerchantIdentifier, "copyWithZone:", a3);
  v55 = (void *)v5[25];
  v5[25] = v54;

  v56 = -[NSString copyWithZone:](self->_webMerchantName, "copyWithZone:", a3);
  v57 = (void *)v5[26];
  v5[26] = v56;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentHash);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDate);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantName);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawName);
  objc_msgSend(v3, "safelyAddObject:", self->_industryCategory);
  objc_msgSend(v3, "safelyAddObject:", self->_industryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantType);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCountryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_terminalIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantAdditionalData);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentNetwork);
  objc_msgSend(v3, "safelyAddObject:", self->_isCoarseLocation);
  objc_msgSend(v3, "safelyAddObject:", self->_location);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawCANL);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawCity);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawState);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawCountry);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCity);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantZip);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantState);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCleanConfidenceLevel);
  objc_msgSend(v3, "safelyAddObject:", self->_adamIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_webURL);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantName);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKApplePayTransactionInsight *v4;
  FKApplePayTransactionInsight *v5;
  void **v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;

  v4 = (FKApplePayTransactionInsight *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_paymentHash, v6[1])
      && FKEqualObjects(self->_transactionDate, v6[2])
      && FKEqualObjects(self->_merchantName, v6[3])
      && FKEqualObjects(self->_merchantRawName, v6[4])
      && FKEqualObjects(self->_industryCategory, v6[5])
      && FKEqualObjects(self->_industryCode, v6[6])
      && FKEqualObjects(self->_merchantType, v6[7])
      && FKEqualObjects(self->_merchantCountryCode, v6[8])
      && FKEqualObjects(self->_terminalIdentifier, v6[9])
      && FKEqualObjects(self->_merchantAdditionalData, v6[10])
      && FKEqualObjects(self->_paymentNetwork, v6[11])
      && FKEqualObjects(self->_isCoarseLocation, v6[12])
      && (-[CLLocation distanceFromLocation:](self->_location, "distanceFromLocation:", v6[13]), v7 == 0.0))
    {
      -[CLLocation timestamp](self->_location, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6[13], "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (FKEqualObjects(v8, v9)
        && (-[CLLocation verticalAccuracy](self->_location, "verticalAccuracy"),
            v11 = v10,
            objc_msgSend(v6[13], "verticalAccuracy"),
            v11 == v12)
        && (-[CLLocation horizontalAccuracy](self->_location, "horizontalAccuracy"),
            v14 = v13,
            objc_msgSend(v6[13], "horizontalAccuracy"),
            v14 == v15)
        && FKEqualObjects(self->_merchantIdentifier, v6[14])
        && FKEqualObjects(self->_merchantRawCANL, v6[15])
        && FKEqualObjects(self->_merchantRawCity, v6[16])
        && FKEqualObjects(self->_merchantRawState, v6[17])
        && FKEqualObjects(self->_merchantRawCountry, v6[18])
        && FKEqualObjects(self->_merchantCity, v6[19])
        && FKEqualObjects(self->_merchantZip, v6[20])
        && FKEqualObjects(self->_merchantState, v6[21])
        && FKEqualObjects(self->_merchantCleanConfidenceLevel, v6[22])
        && FKEqualObjects(self->_adamIdentifier, v6[23])
        && FKEqualObjects(self->_webURL, v6[24])
        && FKEqualObjects(self->_webMerchantIdentifier, v6[25]))
      {
        v16 = FKEqualObjects(self->_webMerchantName, v6[26]);
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)merchantRawName
{
  return self->_merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)merchantType
{
  return self->_merchantType;
}

- (void)setMerchantType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)terminalIdentifier
{
  return self->_terminalIdentifier;
}

- (void)setTerminalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)merchantAdditionalData
{
  return self->_merchantAdditionalData;
}

- (void)setMerchantAdditionalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)isCoarseLocation
{
  return self->_isCoarseLocation;
}

- (void)setIsCoarseLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)merchantRawCANL
{
  return self->_merchantRawCANL;
}

- (void)setMerchantRawCANL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)merchantRawCity
{
  return self->_merchantRawCity;
}

- (void)setMerchantRawCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)merchantRawState
{
  return self->_merchantRawState;
}

- (void)setMerchantRawState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)merchantRawCountry
{
  return self->_merchantRawCountry;
}

- (void)setMerchantRawCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)merchantCity
{
  return self->_merchantCity;
}

- (void)setMerchantCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)merchantZip
{
  return self->_merchantZip;
}

- (void)setMerchantZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)merchantState
{
  return self->_merchantState;
}

- (void)setMerchantState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)merchantCleanConfidenceLevel
{
  return self->_merchantCleanConfidenceLevel;
}

- (void)setMerchantCleanConfidenceLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCleanConfidenceLevel, 0);
  objc_storeStrong((id *)&self->_merchantState, 0);
  objc_storeStrong((id *)&self->_merchantZip, 0);
  objc_storeStrong((id *)&self->_merchantCity, 0);
  objc_storeStrong((id *)&self->_merchantRawCountry, 0);
  objc_storeStrong((id *)&self->_merchantRawState, 0);
  objc_storeStrong((id *)&self->_merchantRawCity, 0);
  objc_storeStrong((id *)&self->_merchantRawCANL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_isCoarseLocation, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_merchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_terminalIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantType, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
}

@end
