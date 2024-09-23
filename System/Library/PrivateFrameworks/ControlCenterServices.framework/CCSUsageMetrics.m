@implementation CCSUsageMetrics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CCSUsageMetrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance_1;
}

void __33__CCSUsageMetrics_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

}

- (unint64_t)userInvocationCount
{
  void *v2;
  unint64_t v3;

  +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInvocationCount");

  return v3;
}

- (void)incrementUserInvocationCount
{
  id v2;

  +[CCSControlCenterDefaults standardDefaults](CCSControlCenterDefaults, "standardDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "presentationGesture") == 1)
    objc_msgSend(v2, "setUserInvocationCount:", objc_msgSend(v2, "userInvocationCount") + 1);

}

@end
