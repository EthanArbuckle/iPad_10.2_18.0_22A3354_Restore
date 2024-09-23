@implementation AMSUIWebSubscriptionAction

- (AMSUIWebSubscriptionAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebSubscriptionAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebSubscriptionAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cachePolicy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cachePolicy"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_cachePolicy = objc_msgSend(v9, "longLongValue");

    }
    else
    {
      v7->_cachePolicy = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extendedCarrierCheck"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extendedCarrierCheck"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_extendedCarrierCheck = objc_msgSend(v11, "BOOLValue");

    }
    else
    {
      v7->_extendedCarrierCheck = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_mediaType = objc_msgSend(v13, "longLongValue");

    }
    else
    {
      v7->_mediaType = 1;
    }

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebSubscriptionAction;
  v3 = -[AMSUIWebAction runAction](&v13, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSUIWebSubscriptionAction mediaType](self, "mediaType");
    *(_DWORD *)buf = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Started subscription lookup for media type: %ld", buf, 0x20u);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE083C8]), "initWithMediaType:", -[AMSUIWebSubscriptionAction mediaType](self, "mediaType"));
  objc_msgSend(v9, "setCachePolicy:", -[AMSUIWebSubscriptionAction cachePolicy](self, "cachePolicy"));
  objc_msgSend(v9, "setExtendedCarrierCheck:", -[AMSUIWebSubscriptionAction extendedCarrierCheck](self, "extendedCarrierCheck"));
  objc_msgSend(v9, "performExternalLookup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "thenWithBlock:", &__block_literal_global_30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __39__AMSUIWebSubscriptionAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(a2, "exportObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(int64_t)a3
{
  self->_cachePolicy = a3;
}

- (BOOL)extendedCarrierCheck
{
  return self->_extendedCarrierCheck;
}

- (void)setExtendedCarrierCheck:(BOOL)a3
{
  self->_extendedCarrierCheck = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

@end
