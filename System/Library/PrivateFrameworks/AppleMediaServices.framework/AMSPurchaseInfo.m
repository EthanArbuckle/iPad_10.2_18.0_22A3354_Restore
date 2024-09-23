@implementation AMSPurchaseInfo

- (AMSPurchaseInfo)initWithPurchase:(id)a3
{
  id v5;
  AMSPurchaseInfo *v6;
  AMSPurchaseInfo *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *additionalHeaders;
  uint64_t v11;
  AMSBuyParams *buyParams;
  uint64_t v13;
  NSString *clientCorrelationKey;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ACAccount *account;
  void *v21;
  uint64_t v22;
  void *clientInfo;
  void *v24;
  AMSProcessInfo *v25;
  void *v26;
  uint64_t v27;
  AMSProcessInfo *v28;
  id *p_clientInfo;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  ACAccount *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  ACAccount *v50;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  ACAccount *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)AMSPurchaseInfo;
  v6 = -[AMSPurchaseInfo init](&v52, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_addKBSync = 1;
    objc_msgSend(v5, "additionalHeaders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    additionalHeaders = v7->_additionalHeaders;
    v7->_additionalHeaders = (NSMutableDictionary *)v9;

    objc_msgSend(v5, "buyParams");
    v11 = objc_claimAutoreleasedReturnValue();
    buyParams = v7->_buyParams;
    v7->_buyParams = (AMSBuyParams *)v11;

    objc_msgSend(v5, "clientCorrelationKey");
    v13 = objc_claimAutoreleasedReturnValue();
    clientCorrelationKey = v7->_clientCorrelationKey;
    v7->_clientCorrelationKey = (NSString *)v13;

    objc_msgSend(v5, "buyParams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hasBeenAuthedForBuy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "buyParams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("hasBeenAuthedForBuy"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_hasBeenAuthedForBuy = objc_msgSend(v18, "BOOLValue");

    }
    else
    {
      v7->_hasBeenAuthedForBuy = 0;
    }

    objc_storeStrong((id *)&v7->_purchase, a3);
    objc_msgSend(v5, "account");
    v19 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (ACAccount *)v19;

    v7->_didShowPaymentSheet = 0;
    objc_msgSend(v5, "clientInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v5, "clientInfo");
      v22 = objc_claimAutoreleasedReturnValue();
      clientInfo = v7->_clientInfo;
      v7->_clientInfo = (AMSProcessInfo *)v22;
    }
    else
    {
      objc_msgSend(v5, "callerBundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = [AMSProcessInfo alloc];
        objc_msgSend(v5, "callerBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[AMSProcessInfo initWithBundleIdentifier:](v25, "initWithBundleIdentifier:", v26);
        p_clientInfo = (id *)&v7->_clientInfo;
        v28 = v7->_clientInfo;
        v7->_clientInfo = (AMSProcessInfo *)v27;

      }
      else
      {
        +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
        v30 = objc_claimAutoreleasedReturnValue();
        p_clientInfo = (id *)&v7->_clientInfo;
        v26 = v7->_clientInfo;
        v7->_clientInfo = (AMSProcessInfo *)v30;
      }

      objc_msgSend(v5, "clientId");
      clientInfo = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_clientInfo, "setProxyAppBundleID:", clientInfo);
    }

    objc_msgSend(v5, "account");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      objc_msgSend(v5, "account");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "ams_isiCloudAccount");

      if (v34)
      {
        v35 = (void *)MEMORY[0x1E0C8F2B8];
        -[AMSPurchaseInfo clientInfo](v7, "clientInfo");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ams_sharedAccountStoreForClient:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "account");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ams_iTunesAccountForAccount:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          objc_storeStrong((id *)&v7->_account, v39);

      }
    }
    if (+[AMSEphemeralDefaults purchaseAccountFallback](AMSEphemeralDefaults, "purchaseAccountFallback")
      && !v7->_account)
    {
      v40 = (void *)MEMORY[0x1E0C8F2B8];
      -[AMSPurchaseInfo clientInfo](v7, "clientInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "ams_sharedAccountStoreForClient:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "ams_activeiTunesAccount");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v7->_account;
      v7->_account = (ACAccount *)v43;

      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = (void *)objc_opt_class();
        v48 = v47;
        AMSLogKey();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v7->_account;
        *(_DWORD *)buf = 138543874;
        v54 = v47;
        v55 = 2114;
        v56 = v49;
        v57 = 2112;
        v58 = v50;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Falling back to active iTunes account: %@", buf, 0x20u);

      }
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSPurchaseInfo purchase](self, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseInfo account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseInfo _purchaseStringForType:](self, "_purchaseStringForType:", -[AMSPurchase purchaseType](self->_purchase, "purchaseType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPurchaseInfo purchase](self, "purchase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ logUUID: %@ accountId: %@ purchaseType: %@ purchaseId: %@ }"), v5, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_purchaseStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_1E2544DE8[a3];
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
  id v15;

  v4 = a3;
  -[AMSPurchaseInfo additionalHeaders](self, "additionalHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAdditionalHeaders"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo addKBSync](self, "addKBSync"), CFSTR("kAddKBSync"));
  -[AMSPurchaseInfo buyParams](self, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kBuyParams"));

  -[AMSPurchaseInfo clientCorrelationKey](self, "clientCorrelationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kClientCorrelationKey"));

  -[AMSPurchaseInfo clientInfo](self, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kClientInfo"));

  -[AMSPurchaseInfo dialog](self, "dialog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kDialog"));

  -[AMSPurchaseInfo dialogId](self, "dialogId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kDialogId"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo didShowPaymentSheet](self, "didShowPaymentSheet"), CFSTR("kDidShowPaymentSheet"));
  -[AMSPurchaseInfo expressCheckoutMode](self, "expressCheckoutMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kExpressCheckoutMode"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo hasBeenAuthedForBuy](self, "hasBeenAuthedForBuy"), CFSTR("kHasBeenAuthedForBuy"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSPurchaseInfo hasRetriedOriginalOwnerAccount](self, "hasRetriedOriginalOwnerAccount"), CFSTR("kHasRetriedOriginalOwnerAccount"));
  -[AMSPurchaseInfo idmsTokens](self, "idmsTokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kIDMTokens"));

  -[AMSPurchaseInfo paymentServicesURL](self, "paymentServicesURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kPaymentServicesURL"));

  -[AMSPurchaseInfo paymentToken](self, "paymentToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("kPaymentToken"));

  -[AMSPurchaseInfo purchase](self, "purchase");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("kPurchase"));

}

- (AMSPurchaseInfo)initWithCoder:(id)a3
{
  id v4;
  AMSPurchaseInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *additionalHeaders;
  uint64_t v12;
  AMSBuyParams *buyParams;
  uint64_t v14;
  NSString *clientCorrelationKey;
  uint64_t v16;
  AMSProcessInfo *clientInfo;
  void *v18;
  uint64_t v19;
  NSDictionary *dialog;
  uint64_t v21;
  NSString *dialogId;
  uint64_t v23;
  NSNumber *expressCheckoutMode;
  void *v25;
  uint64_t v26;
  NSDictionary *idmsTokens;
  uint64_t v28;
  NSURL *paymentServicesURL;
  uint64_t v30;
  NSString *paymentToken;
  uint64_t v32;
  AMSPurchase *purchase;

  v4 = a3;
  v5 = -[AMSPurchaseInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kAdditionalHeaders"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = v10;

    v5->_addKBSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAddKBSync"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBuyParams"));
    v12 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (AMSBuyParams *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kClientCorrelationKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    clientCorrelationKey = v5->_clientCorrelationKey;
    v5->_clientCorrelationKey = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kClientInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kDialog"));
    v19 = objc_claimAutoreleasedReturnValue();
    dialog = v5->_dialog;
    v5->_dialog = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDialogId"));
    v21 = objc_claimAutoreleasedReturnValue();
    dialogId = v5->_dialogId;
    v5->_dialogId = (NSString *)v21;

    v5->_didShowPaymentSheet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kDidShowPaymentSheet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExpressCheckoutMode"));
    v23 = objc_claimAutoreleasedReturnValue();
    expressCheckoutMode = v5->_expressCheckoutMode;
    v5->_expressCheckoutMode = (NSNumber *)v23;

    v5->_hasBeenAuthedForBuy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasBeenAuthedForBuy"));
    v5->_hasRetriedOriginalOwnerAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasRetriedOriginalOwnerAccount"));
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("kIDMTokens"));
    v26 = objc_claimAutoreleasedReturnValue();
    idmsTokens = v5->_idmsTokens;
    v5->_idmsTokens = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPaymentServicesURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPaymentToken"));
    v30 = objc_claimAutoreleasedReturnValue();
    paymentToken = v5->_paymentToken;
    v5->_paymentToken = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPurchase"));
    v32 = objc_claimAutoreleasedReturnValue();
    purchase = v5->_purchase;
    v5->_purchase = (AMSPurchase *)v32;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSPurchaseTask)activePurchaseTask
{
  return (AMSPurchaseTask *)objc_loadWeakRetained((id *)&self->_activePurchaseTask);
}

- (void)setActivePurchaseTask:(id)a3
{
  objc_storeWeak((id *)&self->_activePurchaseTask, a3);
}

- (NSMutableDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaders, a3);
}

- (BOOL)addKBSync
{
  return self->_addKBSync;
}

- (void)setAddKBSync:(BOOL)a3
{
  self->_addKBSync = a3;
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (NSString)clientCorrelationKey
{
  return self->_clientCorrelationKey;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (AMSPurchaseDelegate)delegate
{
  return (AMSPurchaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_storeStrong((id *)&self->_dialog, a3);
}

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_storeStrong((id *)&self->_dialogId, a3);
}

- (BOOL)didShowPaymentSheet
{
  return self->_didShowPaymentSheet;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  self->_didShowPaymentSheet = a3;
}

- (NSNumber)expressCheckoutMode
{
  return self->_expressCheckoutMode;
}

- (void)setExpressCheckoutMode:(id)a3
{
  objc_storeStrong((id *)&self->_expressCheckoutMode, a3);
}

- (BOOL)hasBeenAuthedForBuy
{
  return self->_hasBeenAuthedForBuy;
}

- (void)setHasBeenAuthedForBuy:(BOOL)a3
{
  self->_hasBeenAuthedForBuy = a3;
}

- (BOOL)hasRetriedOriginalOwnerAccount
{
  return self->_hasRetriedOriginalOwnerAccount;
}

- (void)setHasRetriedOriginalOwnerAccount:(BOOL)a3
{
  self->_hasRetriedOriginalOwnerAccount = a3;
}

- (NSDictionary)idmsTokens
{
  return self->_idmsTokens;
}

- (void)setIdmsTokens:(id)a3
{
  objc_storeStrong((id *)&self->_idmsTokens, a3);
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (void)setLocalAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthContext, a3);
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void)setPaymentServicesURL:(id)a3
{
  objc_storeStrong((id *)&self->_paymentServicesURL, a3);
}

- (NSString)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
  objc_storeStrong((id *)&self->_paymentToken, a3);
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_paymentViewServiceListener, a3);
}

- (NSNumber)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodType, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_idmsTokens, 0);
  objc_storeStrong((id *)&self->_expressCheckoutMode, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientCorrelationKey, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_activePurchaseTask);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
