@implementation HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("WatchAtrialFibrillationDetectionVersionEquals");
}

- (void)processUserInfo:(id)a3
{
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AtrialFibrillationDetectionVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    HKSemanticVersionFromString(&v7, v4);
    v5 = v7;
    v6 = v8;
    -[HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule setTargetVersion:](self, "setTargetVersion:", &v5);
  }

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "watchAtrialFibrillationDetectionVersion");
  }
  else
  {
    v18 = 0uLL;
    v19 = 0;
  }
  if (HKSemanticVersionIsUnknown(&v18))
  {
    v5 = 0;
LABEL_15:

    return v5;
  }
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "watchAtrialFibrillationDetectionVersion");
  }
  else
  {
    v16 = 0uLL;
    v17 = 0;
  }
  v14 = 0uLL;
  v15 = 0;
  v8 = HKSemanticVersionsEqual(&v16, &v14);

  if (!v8)
  {
    -[HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule targetVersion](self, "targetVersion");
    -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v9)
    {
      objc_msgSend(v9, "watchAtrialFibrillationDetectionVersion");
    }
    else
    {
      v11 = 0uLL;
      v12 = 0;
    }
    v5 = HKSemanticVersionCompare(&v13, &v11) == 0;
    goto LABEL_15;
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
