@implementation SUUIInAppPurchase

- (SUUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3
{
  id v4;
  SUUIInAppPurchase *v5;
  void *v6;
  uint64_t v7;
  NSString *formattedPrice;
  void *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIInAppPurchase;
  v5 = -[SUUIInAppPurchase init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      formattedPrice = v5->_formattedPrice;
      v5->_formattedPrice = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v10;

    }
  }

  return v5;
}

- (SUUIInAppPurchase)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIInAppPurchase *v5;
  void *v6;
  uint64_t v7;
  NSString *formattedPrice;
  void *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIInAppPurchase;
  v5 = -[SUUIInAppPurchase init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      formattedPrice = v5->_formattedPrice;
      v5->_formattedPrice = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v10;

    }
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *formattedPrice;
  NSString *name;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  formattedPrice = self->_formattedPrice;
  if (formattedPrice)
    objc_msgSend(v3, "setObject:forKey:", formattedPrice, CFSTR("price"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  return (NSMutableDictionary *)v4;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
}

@end
