@implementation AMSLookupItemOffer

- (AMSLookupItemOffer)initWithLookupDictionary:(id)a3
{
  id v4;
  AMSLookupItemOffer *v5;
  uint64_t v6;
  NSDictionary *lookupDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSLookupItemOffer;
  v5 = -[AMSLookupItemOffer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupDictionary = v5->_lookupDictionary;
    v5->_lookupDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)actionTextForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("actionText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)buyParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("buyParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("action-params"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v5;
    else
      v4 = 0;
  }
  v7 = v4;

  return (NSString *)v7;
}

- (NSString)formattedPrice
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("priceFormatted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)offerType
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSNumber)price
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("price"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)subscriptionType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AMSLookupItemOffer lookupDictionary](self, "lookupDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("subscription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);
}

@end
