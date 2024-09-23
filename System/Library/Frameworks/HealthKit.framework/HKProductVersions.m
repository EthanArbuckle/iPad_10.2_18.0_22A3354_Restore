@implementation HKProductVersions

+ (id)activePairedDeviceSystemBuildVersion
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceSystemBuildVersion](HKNanoRegistryDeviceUtility, "activePairedDeviceSystemBuildVersion");
}

+ (id)productBuildVersionForDeviceType:(int64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        v6 = 0;
        return v6;
      }
      goto LABEL_6;
    }
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppleWatch");

    if (!v8)
    {
LABEL_8:
      objc_msgSend(a1, "activePairedDeviceSystemBuildVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");

    if (v5)
      goto LABEL_8;
  }
LABEL_6:
  +[_HKBehavior currentOSBuild](_HKBehavior, "currentOSBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

@end
