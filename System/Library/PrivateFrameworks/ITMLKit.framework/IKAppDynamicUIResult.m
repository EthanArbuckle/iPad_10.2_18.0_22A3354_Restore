@implementation IKAppDynamicUIResult

- (IKAppDynamicUIResult)initWithPurchaseResult:(id)a3
{
  id v5;
  IKAppDynamicUIResult *v6;
  IKAppDynamicUIResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKAppDynamicUIResult;
  v6 = -[IKAppDynamicUIResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_purchaseResult, a3);

  return v7;
}

- (IKAppDynamicUIResult)initWithCarrierLinkResult:(id)a3
{
  id v5;
  IKAppDynamicUIResult *v6;
  IKAppDynamicUIResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKAppDynamicUIResult;
  v6 = -[IKAppDynamicUIResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_carrierLinkResult, a3);

  return v7;
}

- (id)rawResponse
{
  return (id)objc_msgSend((id)objc_opt_class(), "_rawResultWithDynamicUIResult:", self);
}

+ (id)_responseDictionaryWithCarrierLinkResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "linkParams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("linkParams"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_rawResultWithDynamicUIResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "purchaseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v3, "carrierLinkResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_responseDictionaryWithCarrierLinkResult:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseResult, a3);
}

- (AMSCarrierLinkResult)carrierLinkResult
{
  return self->_carrierLinkResult;
}

- (void)setCarrierLinkResult:(id)a3
{
  objc_storeStrong((id *)&self->_carrierLinkResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierLinkResult, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end
