@implementation APResult

- (APResult)initWithBundleIdentifier:(id)a3 buyParams:(id)a4 itemIdentifier:(id)a5 productType:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  APResult *v15;
  APResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APResult;
  v15 = -[APResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_buyParams, a4);
    objc_storeStrong((id *)&v16->_itemIdentifier, a5);
    objc_storeStrong((id *)&v16->_productType, a6);
  }

  return v16;
}

- (APResult)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  APResult *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v13 = 0;
  if (v8 && v10 && v12)
  {
    self = -[APResult initWithBundleIdentifier:buyParams:itemIdentifier:productType:](self, "initWithBundleIdentifier:buyParams:itemIdentifier:productType:", v6, v8, v10, v12);
    v13 = self;
  }

  return v13;
}

- (id)compile
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[APResult bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, CFSTR("bundleIdentifier"));

  -[APResult buyParams](self, "buyParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, CFSTR("buyParams"));

  -[APResult itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, CFSTR("itemIdentifier"));

  -[APResult productType](self, "productType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, CFSTR("productType"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  -[APResult compile](self, "compile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)productType
{
  return self->_productType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
