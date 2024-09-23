@implementation BLPurchaseResponse

- (BLPurchaseResponse)initWithAMSPurchaseResult:(id)a3
{
  void *v3;
  id v5;
  BLPurchaseResponse *v6;
  BLPurchaseResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BLPurchaseResponseItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *purchaseResponseItems;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSNumber *storeID;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *currency;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSString *purchaseParameters;
  void *v48;
  uint64_t v49;
  NSString *logUUID;
  BLDownloadMetadata *v51;
  void *v52;
  BLDownloadMetadata *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  NSNumber *supplementalContentCount;
  void *v59;
  BLPurchaseResponse *v61;
  id v62;
  id obj;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BLPurchaseResponse;
  v6 = -[BLPurchaseResponse init](&v71, sel_init);
  v7 = v6;
  if (v5 && v6)
  {
    objc_opt_class();
    objc_msgSend(v5, "responseDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("songList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v61 = v7;
      v62 = v5;
      v66 = (void *)objc_opt_new();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v10;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v11)
      {
        v12 = v11;
        v65 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v68 != v65)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            v15 = objc_alloc_init(BLPurchaseResponseItem);
            -[BLPurchaseResponseItem setItem:](v15, "setItem:", v14);
            objc_opt_class();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("metadata"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            BUDynamicCast();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLPurchaseResponseItem setMetadata:](v15, "setMetadata:", v17);

            -[BLPurchaseResponseItem metadata](v15, "metadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kind"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLPurchaseResponseItem setIsAudiobook:](v15, "setIsAudiobook:", objc_msgSend(v19, "isEqualToString:", CFSTR("book")));

            -[BLPurchaseResponseItem metadata](v15, "metadata");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kind"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLPurchaseResponseItem setIsPDF:](v15, "setIsPDF:", objc_msgSend(v21, "isEqualToString:", CFSTR("pdf")));

            objc_opt_class();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("buyParams"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = 0;
            }
            else
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("action-params"));
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if (v3)
              {
                v23 = 0;
              }
              else
              {
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("redownload-params"));
                v23 = 1;
                v64 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            BUDynamicCast();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLPurchaseResponseItem setPurchaseParameters:](v15, "setPurchaseParameters:", v24);

            if (v23)
            if (!v22)

            objc_opt_class();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("is-purchased-redownload"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            BUDynamicCast();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[BLPurchaseResponseItem setIsPurchaseRedownload:](v15, "setIsPurchaseRedownload:", objc_msgSend(v26, "BOOLValue"));

            objc_msgSend(v66, "addObject:", v15);
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v12);
      }

      v27 = objc_msgSend(v66, "copy");
      v7 = v61;
      purchaseResponseItems = v61->_purchaseResponseItems;
      v61->_purchaseResponseItems = (NSArray *)v27;

      v5 = v62;
    }
    objc_msgSend(v5, "purchase");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "buyParams");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLUtilities storeIDFromBuyParameters:](BLUtilities, "storeIDFromBuyParameters:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    storeID = v7->_storeID;
    v7->_storeID = (NSNumber *)v32;

    objc_opt_class();
    objc_msgSend(v5, "responseDictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("metrics"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v7->_responseMetrics, v36);
    objc_opt_class();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("currency"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v38 = objc_claimAutoreleasedReturnValue();
    currency = v7->_currency;
    v7->_currency = (NSString *)v38;

    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("price"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    BUDynamicCast();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      objc_opt_class();
      BUDynamicCast();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42)
      {
        objc_msgSend(v42, "stringValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = 0;
      }

    }
    objc_storeStrong((id *)&v7->_price, v41);
    objc_msgSend(v5, "purchase");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "buyParams");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringValue");
    v46 = objc_claimAutoreleasedReturnValue();
    purchaseParameters = v7->_purchaseParameters;
    v7->_purchaseParameters = (NSString *)v46;

    objc_msgSend(v5, "purchase");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "logUUID");
    v49 = objc_claimAutoreleasedReturnValue();
    logUUID = v7->_logUUID;
    v7->_logUUID = (NSString *)v49;

    v51 = [BLDownloadMetadata alloc];
    objc_msgSend(v10, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[BLDownloadMetadata initWithDictionary:](v51, "initWithDictionary:", v52);

    -[BLDownloadMetadata racGUID](v53, "racGUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hasRacGUID = v54 != 0;

    -[NSArray firstObject](v7->_purchaseResponseItems, "firstObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isAudiobook");

    if (v56)
    {
      -[NSArray valueForKeyPath:](v7->_purchaseResponseItems, "valueForKeyPath:", CFSTR("@sum.isPDF"));
      v57 = objc_claimAutoreleasedReturnValue();
      supplementalContentCount = v7->_supplementalContentCount;
      v7->_supplementalContentCount = (NSNumber *)v57;

    }
    objc_msgSend(v5, "error");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseResponse _updatePropertiesFromPurchaseError:](v7, "_updatePropertiesFromPurchaseError:", v59);

  }
  return v7;
}

- (BLPurchaseResponse)initWithPurchase:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BLPurchaseResponse *v8;
  BLPurchaseResponse *v9;
  NSArray *purchaseResponseItems;
  NSDictionary *responseMetrics;
  NSString *currency;
  NSString *price;
  void *v14;
  uint64_t v15;
  NSString *purchaseParameters;
  uint64_t v17;
  NSNumber *storeID;
  NSString *logUUID;
  NSNumber *supplementalContentCount;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BLPurchaseResponse;
  v8 = -[BLPurchaseResponse init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    purchaseResponseItems = v8->_purchaseResponseItems;
    v8->_purchaseResponseItems = 0;

    responseMetrics = v9->_responseMetrics;
    v9->_responseMetrics = 0;

    currency = v9->_currency;
    v9->_currency = 0;

    price = v9->_price;
    v9->_price = 0;

    objc_msgSend(v6, "buyParams");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = objc_claimAutoreleasedReturnValue();
    purchaseParameters = v9->_purchaseParameters;
    v9->_purchaseParameters = (NSString *)v15;

    +[BLUtilities storeIDFromBuyParameters:](BLUtilities, "storeIDFromBuyParameters:", v9->_purchaseParameters);
    v17 = objc_claimAutoreleasedReturnValue();
    storeID = v9->_storeID;
    v9->_storeID = (NSNumber *)v17;

    logUUID = v9->_logUUID;
    v9->_logUUID = 0;

    supplementalContentCount = v9->_supplementalContentCount;
    v9->_supplementalContentCount = 0;

    -[BLPurchaseResponse _updatePropertiesFromPurchaseError:](v9, "_updatePropertiesFromPurchaseError:", v7);
  }

  return v9;
}

- (void)_updatePropertiesFromPurchaseError:(id)a3
{
  id v4;
  NSString *v5;
  NSString *errorDomain;
  NSNumber *v7;
  NSNumber *errorCode;
  NSString *v9;
  NSString *errorDescription;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *firstUnderlyingErrorDomain;
  NSNumber *v16;
  NSNumber *firstUnderlyingErrorCode;
  NSString *v18;
  NSString *firstUnderlyingErrorLocalizedDescription;
  id v20;

  v4 = a3;
  if (v4)
  {
    v20 = v4;
    objc_msgSend(v4, "domain");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDomain = self->_errorDomain;
    self->_errorDomain = v5;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "code"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    errorCode = self->_errorCode;
    self->_errorCode = v7;

    objc_msgSend(v20, "localizedDescription");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDescription = self->_errorDescription;
    self->_errorDescription = v9;

    objc_msgSend(v20, "underlyingErrors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "domain");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorDomain = self->_firstUnderlyingErrorDomain;
      self->_firstUnderlyingErrorDomain = v14;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "code"));
      v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorCode = self->_firstUnderlyingErrorCode;
      self->_firstUnderlyingErrorCode = v16;

      objc_msgSend(v13, "localizedDescription");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      firstUnderlyingErrorLocalizedDescription = self->_firstUnderlyingErrorLocalizedDescription;
      self->_firstUnderlyingErrorLocalizedDescription = v18;

    }
    self->_isUserCancelError = objc_msgSend(v20, "bl_isUserCancelError");

    v4 = v20;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseResponse)initWithCoder:(id)a3
{
  id v4;
  BLPurchaseResponse *v5;
  uint64_t v6;
  NSString *currency;
  uint64_t v8;
  NSNumber *errorCode;
  uint64_t v10;
  NSString *errorDescription;
  uint64_t v12;
  NSString *errorDomain;
  uint64_t v14;
  NSNumber *firstUnderlyingErrorCode;
  uint64_t v16;
  NSString *firstUnderlyingErrorDomain;
  uint64_t v18;
  NSString *firstUnderlyingErrorLocalizedDescription;
  uint64_t v20;
  NSString *logUUID;
  uint64_t v22;
  NSString *permLink;
  uint64_t v24;
  NSString *price;
  uint64_t v26;
  NSString *purchaseParameters;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *responseMetrics;
  uint64_t v35;
  NSNumber *storeID;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *purchaseResponseItems;
  uint64_t v42;
  NSNumber *supplementalContentCount;

  v4 = a3;
  v5 = -[BLPurchaseResponse initWithAMSPurchaseResult:](self, "initWithAMSPurchaseResult:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v6 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorDescription = v5->_errorDescription;
    v5->_errorDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDomain"));
    v12 = objc_claimAutoreleasedReturnValue();
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstUnderlyingErrorCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstUnderlyingErrorCode = v5->_firstUnderlyingErrorCode;
    v5->_firstUnderlyingErrorCode = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstUnderlyingErrorDomain"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstUnderlyingErrorDomain = v5->_firstUnderlyingErrorDomain;
    v5->_firstUnderlyingErrorDomain = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstUnderlyingErrorLocalizedDescription"));
    v18 = objc_claimAutoreleasedReturnValue();
    firstUnderlyingErrorLocalizedDescription = v5->_firstUnderlyingErrorLocalizedDescription;
    v5->_firstUnderlyingErrorLocalizedDescription = (NSString *)v18;

    v5->_isUserCancelError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUserCancelError"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logUUID"));
    v20 = objc_claimAutoreleasedReturnValue();
    logUUID = v5->_logUUID;
    v5->_logUUID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permLink"));
    v22 = objc_claimAutoreleasedReturnValue();
    permLink = v5->_permLink;
    v5->_permLink = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("price"));
    v24 = objc_claimAutoreleasedReturnValue();
    price = v5->_price;
    v5->_price = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseParameters"));
    v26 = objc_claimAutoreleasedReturnValue();
    purchaseParameters = v5->_purchaseParameters;
    v5->_purchaseParameters = (NSString *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("responseMetrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    responseMetrics = v5->_responseMetrics;
    v5->_responseMetrics = (NSDictionary *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeID"));
    v35 = objc_claimAutoreleasedReturnValue();
    storeID = v5->_storeID;
    v5->_storeID = (NSNumber *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("purchaseResponseItems"));
    v40 = objc_claimAutoreleasedReturnValue();
    purchaseResponseItems = v5->_purchaseResponseItems;
    v5->_purchaseResponseItems = (NSArray *)v40;

    v5->_hasRacGUID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRacGUID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalContentCount"));
    v42 = objc_claimAutoreleasedReturnValue();
    supplementalContentCount = v5->_supplementalContentCount;
    v5->_supplementalContentCount = (NSNumber *)v42;

  }
  return v5;
}

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
  id v19;

  v4 = a3;
  -[BLPurchaseResponse currency](self, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("currency"));

  -[BLPurchaseResponse errorCode](self, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("errorCode"));

  -[BLPurchaseResponse errorDescription](self, "errorDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("errorDescription"));

  -[BLPurchaseResponse errorDomain](self, "errorDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("errorDomain"));

  -[BLPurchaseResponse firstUnderlyingErrorCode](self, "firstUnderlyingErrorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("firstUnderlyingErrorCode"));

  -[BLPurchaseResponse firstUnderlyingErrorDomain](self, "firstUnderlyingErrorDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("firstUnderlyingErrorDomain"));

  -[BLPurchaseResponse firstUnderlyingErrorLocalizedDescription](self, "firstUnderlyingErrorLocalizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("firstUnderlyingErrorLocalizedDescription"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BLPurchaseResponse isUserCancelError](self, "isUserCancelError"), CFSTR("isUserCancelError"));
  -[BLPurchaseResponse logUUID](self, "logUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("logUUID"));

  -[BLPurchaseResponse permLink](self, "permLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("permLink"));

  -[BLPurchaseResponse price](self, "price");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("price"));

  -[BLPurchaseResponse purchaseParameters](self, "purchaseParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("purchaseParameters"));

  -[BLPurchaseResponse responseMetrics](self, "responseMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("responseMetrics"));

  -[BLPurchaseResponse storeID](self, "storeID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("storeID"));

  -[BLPurchaseResponse purchaseResponseItems](self, "purchaseResponseItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("purchaseResponseItems"));

  objc_msgSend(v4, "encodeBool:forKey:", -[BLPurchaseResponse hasRacGUID](self, "hasRacGUID"), CFSTR("hasRacGUID"));
  -[BLPurchaseResponse supplementalContentCount](self, "supplementalContentCount");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("supplementalContentCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[BLPurchaseResponse currency](self, "currency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrency:", v5);

    -[BLPurchaseResponse errorCode](self, "errorCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setErrorCode:", v6);

    -[BLPurchaseResponse errorDescription](self, "errorDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setErrorDescription:", v7);

    -[BLPurchaseResponse errorDomain](self, "errorDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setErrorDomain:", v8);

    -[BLPurchaseResponse firstUnderlyingErrorCode](self, "firstUnderlyingErrorCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFirstUnderlyingErrorCode:", v9);

    -[BLPurchaseResponse firstUnderlyingErrorDomain](self, "firstUnderlyingErrorDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFirstUnderlyingErrorDomain:", v10);

    -[BLPurchaseResponse firstUnderlyingErrorLocalizedDescription](self, "firstUnderlyingErrorLocalizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFirstUnderlyingErrorLocalizedDescription:", v11);

    objc_msgSend(v4, "setIsUserCancelError:", -[BLPurchaseResponse isUserCancelError](self, "isUserCancelError"));
    -[BLPurchaseResponse logUUID](self, "logUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLogUUID:", v12);

    -[BLPurchaseResponse permLink](self, "permLink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPermLink:", v13);

    -[BLPurchaseResponse price](self, "price");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrice:", v14);

    -[BLPurchaseResponse purchaseParameters](self, "purchaseParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPurchaseParameters:", v15);

    -[BLPurchaseResponse responseMetrics](self, "responseMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResponseMetrics:", v16);

    -[BLPurchaseResponse storeID](self, "storeID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStoreID:", v17);

    -[BLPurchaseResponse purchaseResponseItems](self, "purchaseResponseItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPurchaseResponseItems:", v18);

    objc_msgSend(v4, "setHasRacGUID:", -[BLPurchaseResponse hasRacGUID](self, "hasRacGUID"));
    -[BLPurchaseResponse supplementalContentCount](self, "supplementalContentCount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupplementalContentCount:", v19);

  }
  return v4;
}

- (NSDictionary)item
{
  void *v2;
  void *v3;
  void *v4;

  -[BLPurchaseResponse purchaseResponseItems](self, "purchaseResponseItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)downloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[BLPurchaseResponse purchaseResponseItems](self, "purchaseResponseItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDictionary)metadata
{
  void *v2;
  void *v3;
  void *v4;

  -[BLPurchaseResponse purchaseResponseItems](self, "purchaseResponseItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (void)setLogUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)permLink
{
  return self->_permLink;
}

- (void)setPermLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)responseMetrics
{
  return self->_responseMetrics;
}

- (void)setResponseMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (BOOL)hasRacGUID
{
  return self->_hasRacGUID;
}

- (void)setHasRacGUID:(BOOL)a3
{
  self->_hasRacGUID = a3;
}

- (NSNumber)supplementalContentCount
{
  return self->_supplementalContentCount;
}

- (void)setSupplementalContentCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)purchaseResponseItems
{
  return self->_purchaseResponseItems;
}

- (void)setPurchaseResponseItems:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseResponseItems, a3);
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)purchaseParameters
{
  return self->_purchaseParameters;
}

- (void)setPurchaseParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)firstUnderlyingErrorCode
{
  return self->_firstUnderlyingErrorCode;
}

- (void)setFirstUnderlyingErrorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)firstUnderlyingErrorDomain
{
  return self->_firstUnderlyingErrorDomain;
}

- (void)setFirstUnderlyingErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)firstUnderlyingErrorLocalizedDescription
{
  return self->_firstUnderlyingErrorLocalizedDescription;
}

- (void)setFirstUnderlyingErrorLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)isUserCancelError
{
  return self->_isUserCancelError;
}

- (void)setIsUserCancelError:(BOOL)a3
{
  self->_isUserCancelError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnderlyingErrorLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_firstUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_firstUnderlyingErrorCode, 0);
  objc_storeStrong((id *)&self->_purchaseParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_purchaseResponseItems, 0);
  objc_storeStrong((id *)&self->_supplementalContentCount, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_responseMetrics, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end
