@implementation HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchModelNumberHasPrefix");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ModelNumberPrefix"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule setModelNumberPrefix:](self, "setModelNumberPrefix:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule modelNumberPrefix](self, "modelNumberPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchModelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityWatchModelNumberHasPrefixRule modelNumberPrefix](self, "modelNumberPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  return v7;
}

- (NSString)modelNumberPrefix
{
  return self->_modelNumberPrefix;
}

- (void)setModelNumberPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumberPrefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumberPrefix, 0);
}

@end
