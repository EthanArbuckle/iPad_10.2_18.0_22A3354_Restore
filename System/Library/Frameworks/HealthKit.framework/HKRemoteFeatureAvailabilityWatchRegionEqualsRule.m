@implementation HKRemoteFeatureAvailabilityWatchRegionEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchRegionEquals");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegionCode"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchRegionEqualsRule setRegionCode:](self, "setRegionCode:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKRemoteFeatureAvailabilityWatchRegionEqualsRule regionCode](self, "regionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchRegionEqualsRule regionCode](self, "regionCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_regionCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
}

@end
