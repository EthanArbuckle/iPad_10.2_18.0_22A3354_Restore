@implementation HKRemoteFeatureAvailabilityWatchOSVersionEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchOSVersionEquals");
}

- (void)processUserInfo:(id)a3
{
  void *v4;
  __int128 *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OperatingSystemVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    HKNSOperatingSystemVersionFromString(v4, (uint64_t *)&v10);
    v8 = v10;
    v9 = v11;
    v5 = &v8;
  }
  else
  {
    v6 = HKNSOperatingSystemVersionUnknown;
    v7 = 0;
    v5 = &v6;
  }
  -[HKRemoteFeatureAvailabilityWatchOSVersionEqualsRule setTargetVersion:](self, "setTargetVersion:", v5, v6, v7);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[3];
  _QWORD v8[3];

  -[HKRemoteFeatureAvailabilityWatchOSVersionEqualsRule targetVersion](self, "targetVersion");
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "watchOSVersion");
  else
    memset(v7, 0, sizeof(v7));
  v5 = HKNSOperatingSystemVersionCompare(v8, v7) == 0;

  return v5;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)targetVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)&self->var2;
  return self;
}

- (void)setTargetVersion:(id *)a3
{
  int64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_targetVersion.majorVersion = *(_OWORD *)&a3->var0;
  self->_targetVersion.patchVersion = var2;
}

@end
