@implementation FPSupport_PowerStateSingleton

+ (id)sharedFPSupportPowerStateSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FPSupport_PowerStateSingleton_sharedFPSupportPowerStateSingleton__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = a1;
  if (sharedFPSupportPowerStateSingleton_onceTokenPowerState != -1)
    dispatch_once(&sharedFPSupportPowerStateSingleton_onceTokenPowerState, block);
  return (id)sharedFPSupportPowerStateSingleton_gSharedFPSupportPowerState;
}

- (void)postNotification
{
  dispatch_async((dispatch_queue_t)self->_notificationQ, &__block_literal_global_17);
}

- (FPSupport_PowerStateSingleton)init
{
  FPSupport_PowerStateSingleton *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPSupport_PowerStateSingleton;
  v2 = -[FPSupport_PowerStateSingleton init](&v5, sel_init);
  if (v2)
  {
    v2->_notificationQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.fpsupport.powerStateChangedNotificationQueue", 0);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__didChangePowerState_, *MEMORY[0x1E0CB3048], 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FPSupport_PowerStateSingleton;
  -[FPSupport_PowerStateSingleton dealloc](&v2, sel_dealloc);
}

@end
