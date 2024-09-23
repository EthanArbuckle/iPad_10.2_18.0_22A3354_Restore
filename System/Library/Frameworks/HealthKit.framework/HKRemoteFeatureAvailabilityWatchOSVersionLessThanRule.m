@implementation HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchOSVersionLessThan");
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
  -[HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule setTargetVersion:](self, "setTargetVersion:", v5, v6, v7);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL IsUnknown;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];

  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "watchOSVersion");
  else
    memset(v12, 0, sizeof(v12));
  if (HKNSOperatingSystemVersionIsUnknown(v12))
  {
    v5 = 0;
LABEL_12:

    return v5;
  }
  -[HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule targetVersion](self, "targetVersion");
  IsUnknown = HKNSOperatingSystemVersionIsUnknown(v11);

  if (!IsUnknown)
  {
    -[HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule targetVersion](self, "targetVersion");
    -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v7)
      objc_msgSend(v7, "watchOSVersion");
    else
      memset(v9, 0, sizeof(v9));
    v5 = HKNSOperatingSystemVersionCompare(v10, v9) == 1;
    goto LABEL_12;
  }
  return 0;
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
