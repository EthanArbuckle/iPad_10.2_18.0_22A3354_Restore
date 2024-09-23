@implementation HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchProductTypeHasPrefix");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ProductTypePrefix"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule setProductType:](self, "setProductType:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule productType](self, "productType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchProductTypeHasPrefixRule productType](self, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  return v7;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
}

@end
