@implementation CSOtherAppRecordingStateMonitorASMac

- (BOOL)isOtherAppRecording
{
  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18807 != -1)
    dispatch_once(&sharedInstance_onceToken_18807, &__block_literal_global_18808);
  return (id)sharedInstance_sharedInstance_18809;
}

void __54__CSOtherAppRecordingStateMonitorASMac_sharedInstance__block_invoke()
{
  CSOtherAppRecordingStateMonitorASMac *v0;
  void *v1;

  v0 = objc_alloc_init(CSOtherAppRecordingStateMonitorASMac);
  v1 = (void *)sharedInstance_sharedInstance_18809;
  sharedInstance_sharedInstance_18809 = (uint64_t)v0;

}

@end
