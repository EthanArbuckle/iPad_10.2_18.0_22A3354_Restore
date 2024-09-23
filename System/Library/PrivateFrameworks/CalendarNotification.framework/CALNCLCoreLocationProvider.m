@implementation CALNCLCoreLocationProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1)
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_25);
  return (id)sharedInstance_sharedInstance_19;
}

void __44__CALNCLCoreLocationProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_19;
  sharedInstance_sharedInstance_19 = v0;

}

- (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE13FC0], "authorizationStatusForBundleIdentifier:", a3);
}

- (int)authorizationStatusForBundle:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE13FC0], "authorizationStatusForBundle:", a3);
}

- (BOOL)preciseLocationAuthorizedForBundleIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE13FC0], "preciseLocationAuthorizedForBundleIdentifier:", a3);
}

- (BOOL)preciseLocationAuthorizedForBundle:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE13FC0], "preciseLocationAuthorizedForBundle:", a3);
}

- (void)markAsHavingReceivedLocationWithEffectiveBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA88]), "initWithEffectiveBundleIdentifier:delegate:onQueue:", v3, 0, 0);
  objc_msgSend(v4, "markAsHavingReceivedLocation");
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Marked as having received location with effective bundle identifier = %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

@end
