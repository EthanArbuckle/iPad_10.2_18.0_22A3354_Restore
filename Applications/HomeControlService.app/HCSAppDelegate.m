@implementation HCSAppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = HFPlatformSpecificHomeAppBundleID(self, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[CLLocationManager setDefaultEffectiveBundleIdentifier:](CLLocationManager, "setDefaultEffectiveBundleIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v6, "warmup");

  return 1;
}

@end
