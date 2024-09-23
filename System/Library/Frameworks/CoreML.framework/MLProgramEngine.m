@implementation MLProgramEngine

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

+ (int)gpuEngine
{
  void *v2;
  int v3;

  +[MLFeatureFlags sharedFeatureFlags](MLFeatureFlags, "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMPSGraphEnabled");

  if (v3)
    return 50005;
  else
    return 5;
}

+ (int)gpuPrecision
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  int v6;

  +[MLFeatureFlags sharedFeatureFlags](MLFeatureFlags, "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMPSGraphEnabled");
  v4 = 65552;

  if (v3)
  {
    +[MLFeatureFlags sharedFeatureFlags](MLFeatureFlags, "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMPSGraphFP16Enabled");

    if (v6)
      return 65552;
    else
      return 65568;
  }
  return v4;
}

@end
