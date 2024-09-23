@implementation AMSMarketingItemAction

- (AMSMarketingItemAction)initWithDictionary:(id)a3
{
  id v5;
  AMSMarketingItemAction *v6;
  AMSMarketingItemAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItemAction;
  v6 = -[AMSMarketingItemAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValues, a3);

  return v7;
}

- (AMSBuyParams)buyParams
{
  void *v2;
  void *v3;
  id v4;
  AMSBuyParams *v5;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E25491E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = -[AMSBuyParams initWithString:]([AMSBuyParams alloc], "initWithString:", v4);
  return v5;
}

- (NSString)callToActionLabel
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E25597C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)disclaimerText
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E25597E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (BOOL)isDefault
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2559800);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)isFamily
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2559820);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)isRecommended
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2559840);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (NSString)offerID
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2558920);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSNumber)price
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E2559860);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSNumber)priceDiff
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E2559880);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSString)priceDiffForDisplay
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E25598A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)priceForDisplay
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E25598C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSArray)serviceComponents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AMSMarketingItemAction _serviceNames](self, "_serviceNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItemAction _servicesData](self, "_servicesData");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    -[AMSMarketingItemAction _serviceComponentsFromMap:withNames:](self, "_serviceComponentsFromMap:withNames:", v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v6;
}

- (NSString)type
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E254FF40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E254E920);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSURL *)v5;
}

- (NSString)valuePropDetail
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E25598E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)valuePropInfo
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", 0x1E2559900);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)_servicesData
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2559720);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_serviceNames
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItemAction rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2552B40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_serviceComponentsFromMap:(id)a3 withNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__AMSMarketingItemAction__serviceComponentsFromMap_withNames___block_invoke;
  v9[3] = &unk_1E2542C58;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

AMSMarketingItemActionComponent *__62__AMSMarketingItemAction__serviceComponentsFromMap_withNames___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  AMSMarketingItemActionComponent *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[AMSMarketingItemActionComponent initWithDictionary:]([AMSMarketingItemActionComponent alloc], "initWithDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)description
{
  return 0;
}

- (id)dismissLabel
{
  return 0;
}

- (id)freeTrialPeriod
{
  return 0;
}

- (id)inAppID
{
  return 0;
}

- (id)introOfferPeriod
{
  return 0;
}

- (id)introOfferPrice
{
  return 0;
}

- (id)introOfferPriceForDisplay
{
  return 0;
}

- (id)name
{
  return 0;
}

- (BOOL)isYearly
{
  return 0;
}

- (id)priceFormatted
{
  return 0;
}

- (id)priceString
{
  return 0;
}

- (id)recurringSubscriptionPeriod
{
  return 0;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void)setRawValues:(id)a3
{
  objc_storeStrong((id *)&self->_rawValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValues, 0);
}

@end
