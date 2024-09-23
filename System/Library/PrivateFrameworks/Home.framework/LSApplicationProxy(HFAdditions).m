@implementation LSApplicationProxy(HFAdditions)

+ (id)hf_applicationProxyForAccessory:()HFAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hf_isInstalledForLaunching
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInstalled"))
  {
    objc_msgSend(a1, "appState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaceholder") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
