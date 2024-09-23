@implementation CALNEKDebugPreferences

+ (CALNEKDebugPreferences)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CALNEKDebugPreferences_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_16 != -1)
    dispatch_once(&sharedInstance_onceToken_16, block);
  return (CALNEKDebugPreferences *)(id)sharedInstance_sharedInstance_13;
}

void __40__CALNEKDebugPreferences_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_13;
  sharedInstance_sharedInstance_13 = v0;

}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceDisplayOfNewTravelAdvisoryHypotheses");

  return v3;
}

@end
