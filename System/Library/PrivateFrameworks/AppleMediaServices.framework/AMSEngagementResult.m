@implementation AMSEngagementResult

- (AMSEngagementResult)initWithPath:(int64_t)a3
{
  AMSEngagementResult *result;

  AMSEngagementResult.init(path:)();
  return result;
}

- (AMSEngagementResult)initWithSelection:(id)a3
{
  id v3;
  AMSEngagementResult *result;

  v3 = a3;
  AMSEngagementResult.init(selection:)();
  return result;
}

- (int64_t)expressCheckoutPath
{
  AMSEngagementResult *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  AMSEngagementResult.expressCheckoutPath()();
  v4 = v3;

  return v4;
}

- (id)expressCheckoutCardSelection
{
  AMSEngagementResult *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AMSEngagementResult.expressCheckoutCardSelection()();

  return v3;
}

- (NSString)ams_buyParams
{
  void *v2;
  void *v3;
  id v4;

  -[AMSEngagementResult userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)ams_requestActionFromRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSEngagementResult userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
    goto LABEL_7;
  }
  v7 = v6;

  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
    goto LABEL_9;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (objc_msgSend(v13, "isEqualToString:", CFSTR("retry")))
  {
    if (v10)
      +[AMSURLAction redirectActionWithURL:](AMSURLAction, "redirectActionWithURL:", v10);
    else
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v14;
  -[AMSEngagementResult ams_buyParams](self, "ams_buyParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = v9;
      v20 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v18;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dropping updated body because buy params exist", (uint8_t *)&v27, 0x16u);

      v10 = v20;
      v9 = v19;
    }

  }
  else
  {
    v22 = (void *)objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("body"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_updatedBodyFromValue:request:", v16, v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUpdatedBody:", v23);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("headers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;

  objc_msgSend(v11, "setUpdatedHeaders:", v25);
LABEL_30:

  return v11;
}

+ (id)_updatedBodyFromValue:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "allHTTPHeaderFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Content-Type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0;
        +[AMSData dataWithObject:encoding:error:](AMSData, "dataWithObject:encoding:error:", v5, +[AMSData dataEncodingFromContentType:](AMSData, "dataEncodingFromContentType:", v9), &v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16;
        if (v10)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v11, "OSLogObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = objc_opt_class();
            AMSLogKey();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v18 = v13;
            v19 = 2114;
            v20 = v14;
            v21 = 2114;
            v22 = v10;
            _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode data from engagement request. %{public}@", buf, 0x20u);

          }
        }

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AMSEngagementResult)initWithModel:(id)a3
{
  id v4;
  AMSEngagementResult *v5;
  uint64_t v6;
  NSData *modelData;

  v4 = a3;
  v5 = -[AMSEngagementResult init](self, "init");
  if (v5)
  {
    +[AMSEngagementUtils encodeModel:](AMSEngagementUtils, "encodeModel:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v6;

  }
  return v5;
}

- (id)modelForClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[AMSEngagementResult modelData](self, "modelData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSEngagementUtils modelFromData:class:error:](AMSEngagementUtils, "modelFromData:class:error:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (AMSEngagementResult)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementResult *v5;
  uint64_t v6;
  AMSCarrierLinkResult *carrierLinkResult;
  uint64_t v8;
  NSData *modelData;
  uint64_t v10;
  AMSPurchaseResult *purchaseResult;
  void *v12;
  uint64_t v13;
  NSDictionary *userInfo;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSEngagementResult;
  v5 = -[AMSEngagementResult init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyCarrierLinkResult"));
    v6 = objc_claimAutoreleasedReturnValue();
    carrierLinkResult = v5->_carrierLinkResult;
    v5->_carrierLinkResult = (AMSCarrierLinkResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyModelData"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelData = v5->_modelData;
    v5->_modelData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyPurchaseResult"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kCodingKeyUserInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AMSEngagementResult carrierLinkResult](self, "carrierLinkResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyCarrierLinkResult"));

  -[AMSEngagementResult purchaseResult](self, "purchaseResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyPurchaseResult"));

  -[AMSEngagementResult modelData](self, "modelData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCodingKeyModelData"));

  -[AMSEngagementResult userInfo](self, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCodingKeyUserInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSCarrierLinkResult)carrierLinkResult
{
  return self->_carrierLinkResult;
}

- (void)setCarrierLinkResult:(id)a3
{
  objc_storeStrong((id *)&self->_carrierLinkResult, a3);
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseResult, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSData)modelData
{
  return self->_modelData;
}

- (void)setModelData:(id)a3
{
  objc_storeStrong((id *)&self->_modelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
  objc_storeStrong((id *)&self->_carrierLinkResult, 0);
}

@end
