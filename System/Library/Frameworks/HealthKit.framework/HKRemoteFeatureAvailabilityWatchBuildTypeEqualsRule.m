@implementation HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchBuildTypeEquals");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BuildType"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule setBuildType:](self, "setBuildType:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule buildType](self, "buildType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchBuildType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchBuildTypeEqualsRule buildType](self, "buildType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (NSString)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(id)a3
{
  objc_storeStrong((id *)&self->_buildType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildType, 0);
}

@end
