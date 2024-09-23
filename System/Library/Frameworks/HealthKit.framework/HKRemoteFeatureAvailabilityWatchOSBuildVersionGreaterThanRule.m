@implementation HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchOSBuildVersionGreaterThan");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule setBuildVersion:](self, "setBuildVersion:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule buildVersion](self, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchOSBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[HKRemoteFeatureAvailabilityWatchOSBuildVersionGreaterThanRule buildVersion](self, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "watchOSBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hk_compareBuildVersionWithString:", v8) == -1;

  return v9;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
