@implementation CALNNullAlarmEngineMonitor

+ (CALNNullAlarmEngineMonitor)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CALNNullAlarmEngineMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, block);
  return (CALNNullAlarmEngineMonitor *)(id)sharedInstance_sharedInstance_12;
}

void __44__CALNNullAlarmEngineMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_12;
  sharedInstance_sharedInstance_12 = (uint64_t)v1;

}

@end
