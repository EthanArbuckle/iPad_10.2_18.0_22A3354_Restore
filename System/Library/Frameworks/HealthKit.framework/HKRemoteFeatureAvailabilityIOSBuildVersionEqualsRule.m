@implementation HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("IOSBuildVersionEquals");
}

- (void)processUserInfo:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v5;
  else
    v4 = 0;
  -[HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule setBuildVersion:](self, "setBuildVersion:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule buildVersion](self, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iOSBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iOSBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityIOSBuildVersionEqualsRule buildVersion](self, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

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
