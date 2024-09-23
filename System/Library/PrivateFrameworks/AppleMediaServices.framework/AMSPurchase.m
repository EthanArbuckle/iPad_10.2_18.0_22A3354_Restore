@implementation AMSPurchase

- (AMSPurchase)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4
{
  id v7;
  AMSPurchase *v8;
  AMSPurchase *v9;
  void *v10;
  uint64_t v11;
  NSString *clientCorrelationKey;
  uint64_t v13;
  NSString *logUUID;
  uint64_t v15;
  NSNumber *uniqueIdentifier;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSPurchase;
  v8 = -[AMSPurchase init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buyParams, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    clientCorrelationKey = v9->_clientCorrelationKey;
    v9->_clientCorrelationKey = (NSString *)v11;

    v9->_ignoreRequirePasswordRestriction = 0;
    AMSGenerateLogCorrelationKey();
    v13 = objc_claimAutoreleasedReturnValue();
    logUUID = v9->_logUUID;
    v9->_logUUID = (NSString *)v13;

    v9->_purchaseType = a3;
    v9->_requiresAccount = 0;
    -[AMSPurchase _generateIdentifier](v9, "_generateIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v9->_uniqueIdentifier;
    v9->_uniqueIdentifier = (NSNumber *)v15;

    *(_WORD *)&v9->_userInitiated = 1;
  }

  return v9;
}

- (NSString)logUUID
{
  NSString *logUUID;

  logUUID = self->_logUUID;
  if (logUUID)
    return logUUID;
  -[NSNumber stringValue](self->_uniqueIdentifier, "stringValue");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isRedownload
{
  void *v2;
  char v3;

  -[AMSBuyParams objectForKeyedSubscript:](self->_buyParams, "objectForKeyedSubscript:", CFSTR("pricingParameters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("STDRDL"));

  return v3;
}

- (void)setLogUUID:(id)a3
{
  NSString *v5;
  NSString **p_logUUID;
  NSString *logUUID;
  NSString *v8;

  v5 = (NSString *)a3;
  logUUID = self->_logUUID;
  p_logUUID = &self->_logUUID;
  if (logUUID != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_logUUID, a3);
    v5 = v8;
  }

}

- (id)authenticationContextForRequest:(id)a3
{
  return +[AMSPurchase defaultAuthenticationContextForRequest:](AMSPurchase, "defaultAuthenticationContextForRequest:", a3);
}

+ (id)defaultAuthenticationContextForRequest:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAltDSID:", v6);

  objc_msgSend(v3, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDSID:", v9);

  objc_msgSend(v3, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsUsernameEditable:", v11 == 0);

  objc_msgSend(v3, "explanation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_passwordPromptTitle:", v12);

  objc_msgSend(v3, "message");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReason:", v13);

  objc_msgSend(v4, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v4, "setAuthenticationType:", 2);
  objc_msgSend(v4, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v3, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v15);

  objc_msgSend(v4, "setServiceType:", 2);
  if (objc_msgSend(v4, "isContextEligibleForPasscodeAuth"))
  {
    +[AMSPurchase _authContextTitleForConfirmationStyle:](AMSPurchase, "_authContextTitleForConfirmationStyle:", objc_msgSend(v3, "ams_confirmationStyle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v16);

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[AMSPurchase account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[3];
  v5[3] = v7;

  -[AMSPurchase additionalHeaders](self, "additionalHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  -[AMSPurchase buyParams](self, "buyParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  v14 = (void *)v5[5];
  v5[5] = v13;

  -[AMSPurchase callerBundleId](self, "callerBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  v17 = (void *)v5[17];
  v5[17] = v16;

  -[AMSPurchase clientCorrelationKey](self, "clientCorrelationKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  v20 = (void *)v5[6];
  v5[6] = v19;

  -[AMSPurchase clientId](self, "clientId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  v23 = (void *)v5[18];
  v5[18] = v22;

  -[AMSPurchase clientInfo](self, "clientInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copyWithZone:", a3);
  v26 = (void *)v5[7];
  v5[7] = v25;

  *((_BYTE *)v5 + 8) = -[AMSPurchase ignoreRequirePasswordRestriction](self, "ignoreRequirePasswordRestriction");
  -[AMSPurchase logUUID](self, "logUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copyWithZone:", a3);
  v29 = (void *)v5[2];
  v5[2] = v28;

  -[AMSPurchase metricsOverlay](self, "metricsOverlay");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copyWithZone:", a3);
  v32 = (void *)v5[9];
  v5[9] = v31;

  -[AMSPurchase performanceMetricsOverlay](self, "performanceMetricsOverlay");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copyWithZone:", a3);
  v35 = (void *)v5[11];
  v5[11] = v34;

  -[AMSPurchase ownerAccountId](self, "ownerAccountId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "copyWithZone:", a3);
  v38 = (void *)v5[8];
  v5[8] = v37;

  v5[14] = -[AMSPurchase purchaseType](self, "purchaseType");
  *((_BYTE *)v5 + 9) = -[AMSPurchase requiresAccount](self, "requiresAccount");
  -[AMSPurchase storefront](self, "storefront");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "copyWithZone:", a3);
  v41 = (void *)v5[15];
  v5[15] = v40;

  -[AMSPurchase uniqueIdentifier](self, "uniqueIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "copyWithZone:", a3);
  v44 = (void *)v5[16];
  v5[16] = v43;

  *((_BYTE *)v5 + 10) = -[AMSPurchase isUserInitiated](self, "isUserInitiated");
  *((_BYTE *)v5 + 11) = -[AMSPurchase useJSONContentType](self, "useJSONContentType");
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  id v18;

  v18 = a3;
  -[AMSPurchase account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("account"));

  -[AMSPurchase additionalHeaders](self, "additionalHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("additionalHeaders"));

  -[AMSPurchase buyParams](self, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("buyParams"));

  -[AMSPurchase clientInfo](self, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("clientInfo"));

  objc_msgSend(v18, "encodeBool:forKey:", -[AMSPurchase ignoreRequirePasswordRestriction](self, "ignoreRequirePasswordRestriction"), CFSTR("ignoreRequirePasswordRestriction"));
  -[AMSPurchase logUUID](self, "logUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("logUUID"));

  -[AMSPurchase ownerAccountId](self, "ownerAccountId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("ownerAccountId"));

  -[AMSPurchase presentingSceneBundleIdentifier](self, "presentingSceneBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("presentingSceneBundleIdentifier"));

  -[AMSPurchase presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("presentingSceneIdentifier"));

  objc_msgSend(v18, "encodeInteger:forKey:", -[AMSPurchase purchaseType](self, "purchaseType"), CFSTR("purchaseType"));
  objc_msgSend(v18, "encodeBool:forKey:", -[AMSPurchase requiresAccount](self, "requiresAccount"), CFSTR("requiresAccount"));
  -[AMSPurchase storefront](self, "storefront");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("storefront"));

  -[AMSPurchase uniqueIdentifier](self, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("uniqueIdentifier"));

  objc_msgSend(v18, "encodeBool:forKey:", -[AMSPurchase isUserInitiated](self, "isUserInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v18, "encodeBool:forKey:", -[AMSPurchase useJSONContentType](self, "useJSONContentType"), CFSTR("useJSONContentType"));
  -[AMSPurchase metricsOverlay](self, "metricsOverlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSPurchase metricsOverlay](self, "metricsOverlay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_encodeJSONDictionary:forKey:", v15, CFSTR("metricsOverlay"));

  }
  -[AMSPurchase performanceMetricsOverlay](self, "performanceMetricsOverlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSPurchase performanceMetricsOverlay](self, "performanceMetricsOverlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ams_encodeJSONDictionary:forKey:", v17, CFSTR("performanceMetricsOverlay"));

  }
}

- (AMSPurchase)initWithCoder:(id)a3
{
  id v4;
  AMSPurchase *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *additionalHeaders;
  uint64_t v11;
  AMSBuyParams *buyParams;
  uint64_t v13;
  AMSProcessInfo *clientInfo;
  uint64_t v15;
  NSString *logUUID;
  uint64_t v17;
  NSDictionary *metricsOverlay;
  uint64_t v19;
  NSDictionary *performanceMetricsOverlay;
  uint64_t v21;
  NSNumber *ownerAccountId;
  uint64_t v23;
  NSString *presentingSceneBundleIdentifier;
  uint64_t v25;
  NSString *presentingSceneIdentifier;
  uint64_t v27;
  NSString *storefront;
  uint64_t v29;
  NSNumber *uniqueIdentifier;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AMSPurchase;
  v5 = -[AMSPurchase init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("additionalHeaders"));
    v9 = objc_claimAutoreleasedReturnValue();
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buyParams"));
    v11 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (AMSBuyParams *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v13;

    v5->_ignoreRequirePasswordRestriction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRequirePasswordRestriction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logUUID"));
    v15 = objc_claimAutoreleasedReturnValue();
    logUUID = v5->_logUUID;
    v5->_logUUID = (NSString *)v15;

    objc_msgSend(v4, "ams_decodeJSONDictionaryForKey:", CFSTR("metricsOverlay"));
    v17 = objc_claimAutoreleasedReturnValue();
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v17;

    objc_msgSend(v4, "ams_decodeJSONDictionaryForKey:", CFSTR("performanceMetricsOverlay"));
    v19 = objc_claimAutoreleasedReturnValue();
    performanceMetricsOverlay = v5->_performanceMetricsOverlay;
    v5->_performanceMetricsOverlay = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerAccountId"));
    v21 = objc_claimAutoreleasedReturnValue();
    ownerAccountId = v5->_ownerAccountId;
    v5->_ownerAccountId = (NSNumber *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneBundleIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v25;

    v5->_purchaseType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("purchaseType"));
    v5->_requiresAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefront"));
    v27 = objc_claimAutoreleasedReturnValue();
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSNumber *)v29;

    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_useJSONContentType = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useJSONContentType"));
  }

  return v5;
}

+ (id)purchaseFromPurchase:(id)a3
{
  id v3;
  AMSPurchase *v4;
  uint64_t v5;
  void *v6;
  AMSPurchase *v7;
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
  uint64_t v18;

  v3 = a3;
  v4 = [AMSPurchase alloc];
  v5 = objc_msgSend(v3, "purchaseType");
  objc_msgSend(v3, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSPurchase initWithPurchaseType:buyParams:](v4, "initWithPurchaseType:buyParams:", v5, v6);

  objc_msgSend(v3, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setAccount:](v7, "setAccount:", v8);

  objc_msgSend(v3, "additionalHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setAdditionalHeaders:](v7, "setAdditionalHeaders:", v9);

  objc_msgSend(v3, "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setClientInfo:](v7, "setClientInfo:", v10);

  -[AMSPurchase setIgnoreRequirePasswordRestriction:](v7, "setIgnoreRequirePasswordRestriction:", objc_msgSend(v3, "ignoreRequirePasswordRestriction"));
  objc_msgSend(v3, "logUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setLogUUID:](v7, "setLogUUID:", v11);

  objc_msgSend(v3, "metricsOverlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setMetricsOverlay:](v7, "setMetricsOverlay:", v12);

  objc_msgSend(v3, "performanceMetricsOverlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setPerformanceMetricsOverlay:](v7, "setPerformanceMetricsOverlay:", v13);

  objc_msgSend(v3, "ownerAccountId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setOwnerAccountId:](v7, "setOwnerAccountId:", v14);

  objc_msgSend(v3, "presentingSceneBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setPresentingSceneBundleIdentifier:](v7, "setPresentingSceneBundleIdentifier:", v15);

  objc_msgSend(v3, "presentingSceneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setPresentingSceneIdentifier:](v7, "setPresentingSceneIdentifier:", v16);

  -[AMSPurchase setRequiresAccount:](v7, "setRequiresAccount:", objc_msgSend(v3, "requiresAccount"));
  objc_msgSend(v3, "storefront");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchase setStorefront:](v7, "setStorefront:", v17);

  -[AMSPurchase setUserInitiated:](v7, "setUserInitiated:", objc_msgSend(v3, "isUserInitiated"));
  v18 = objc_msgSend(v3, "useJSONContentType");

  -[AMSPurchase setUseJSONContentType:](v7, "setUseJSONContentType:", v18);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AMSPurchase logUUID](self, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{ key: %@ }"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AMSPurchase uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AMSPurchase *v4;
  AMSPurchase *v5;
  BOOL v6;

  v4 = (AMSPurchase *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[AMSPurchase isEqualToPurchase:](self, "isEqualToPurchase:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPurchase:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSPurchase uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToNumber:", v6);
  return (char)v4;
}

- (id)_generateIdentifier
{
  const __CFUUID *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = CFUUIDCreate(0);
  v3 = *(_OWORD *)&CFUUIDGetUUIDBytes(v2);
  CFRelease(v2);
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
}

+ (id)_authContextTitleForConfirmationStyle:(unint64_t)a3
{
  __CFString *v3;

  if (a3 > 9)
    v3 = CFSTR("PASSCODE_AUTH_TITLE_DEFAULT");
  else
    v3 = off_1E2544D70[a3];
  AMSLocalizedString(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (NSString)clientCorrelationKey
{
  return self->_clientCorrelationKey;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)ignoreRequirePasswordRestriction
{
  return self->_ignoreRequirePasswordRestriction;
}

- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3
{
  self->_ignoreRequirePasswordRestriction = a3;
}

- (NSNumber)ownerAccountId
{
  return self->_ownerAccountId;
}

- (void)setOwnerAccountId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_paymentViewServiceListener, a3);
}

- (NSDictionary)performanceMetricsOverlay
{
  return self->_performanceMetricsOverlay;
}

- (void)setPerformanceMetricsOverlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)purchaseType
{
  return self->_purchaseType;
}

- (BOOL)requiresAccount
{
  return self->_requiresAccount;
}

- (void)setRequiresAccount:(BOOL)a3
{
  self->_requiresAccount = a3;
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)useJSONContentType
{
  return self->_useJSONContentType;
}

- (void)setUseJSONContentType:(BOOL)a3
{
  self->_useJSONContentType = a3;
}

- (NSString)callerBundleId
{
  return self->_callerBundleId;
}

- (void)setCallerBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)URLBagKey
{
  return self->_URLBagKey;
}

- (void)setURLBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLBagKey, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_ownerAccountId, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientCorrelationKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
}

@end
