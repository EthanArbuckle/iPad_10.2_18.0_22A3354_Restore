@implementation HMHome(HFDemoMode)

- (id)hf_demoModeAccessories
{
  void *v0;
  void *v1;

  +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
