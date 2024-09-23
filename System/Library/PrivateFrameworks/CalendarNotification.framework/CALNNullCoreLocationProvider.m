@implementation CALNNullCoreLocationProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance_2;
}

void __46__CALNNullCoreLocationProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = v0;

}

- (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return 3;
}

- (int)authorizationStatusForBundle:(id)a3
{
  return 3;
}

- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return 1;
}

- (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return 1;
}

@end
