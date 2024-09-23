@implementation FPSupport_VideoRangeSingleton

+ (id)sharedFPSupportSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FPSupport_VideoRangeSingleton_sharedFPSupportSingleton__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = a1;
  if (sharedFPSupportSingleton_onceToken != -1)
    dispatch_once(&sharedFPSupportSingleton_onceToken, block);
  return (id)sharedFPSupportSingleton_gSharedFPSupport;
}

- (void)postNotification
{
  dispatch_async((dispatch_queue_t)self->_notificationQ, &__block_literal_global_56);
}

- (FPSupport_VideoRangeSingleton)init
{
  FPSupport_VideoRangeSingleton *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPSupport_VideoRangeSingleton;
  v2 = -[FPSupport_VideoRangeSingleton init](&v4, sel_init);
  if (v2)
  {
    v2->_notificationQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.fpsupport.displayChangedNotificationQueue", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay"), "addObserver:forKeyPath:options:context:", v2, CFSTR("currentMode"), 3, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FPSupport_VideoRangeSingleton;
  -[FPSupport_VideoRangeSingleton dealloc](&v2, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currentMode")))
  {
    dispatch_async((dispatch_queue_t)self->_notificationQ, &__block_literal_global_62);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FPSupport_VideoRangeSingleton;
    -[FPSupport_VideoRangeSingleton observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

@end
