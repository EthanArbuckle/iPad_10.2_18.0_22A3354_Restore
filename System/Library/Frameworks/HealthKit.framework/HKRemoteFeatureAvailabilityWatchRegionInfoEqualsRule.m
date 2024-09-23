@implementation HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchRegionInfoEquals");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegionInfo"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule setRegionInfo:](self, "setRegionInfo:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule regionInfo](self, "regionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchRegionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchRegionInfoEqualsRule regionInfo](self, "regionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setRegionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_regionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfo, 0);
}

@end
