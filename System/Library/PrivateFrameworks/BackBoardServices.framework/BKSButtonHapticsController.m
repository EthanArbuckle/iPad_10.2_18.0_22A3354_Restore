@implementation BKSButtonHapticsController

- (void)applyDefinitions:(id)a3
{
  _BKSHIDServicesApplyButtonDefinitions(a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4679 != -1)
    dispatch_once(&sharedInstance_onceToken_4679, &__block_literal_global_4680);
  return (id)sharedInstance_controller_4681;
}

void __44__BKSButtonHapticsController_sharedInstance__block_invoke()
{
  BKSButtonHapticsController *v0;
  void *v1;

  v0 = objc_alloc_init(BKSButtonHapticsController);
  v1 = (void *)sharedInstance_controller_4681;
  sharedInstance_controller_4681 = (uint64_t)v0;

}

@end
