@implementation CSDeviceListener

+ (id)sharedListener
{
  if (sharedListener_defaultOnceToken != -1)
    dispatch_once(&sharedListener_defaultOnceToken, &__block_literal_global_10);
  return (id)sharedListener___DefaultListener;
}

void __34__CSDeviceListener_sharedListener__block_invoke()
{
  CSDeviceListener *v0;
  void *v1;

  v0 = objc_alloc_init(CSDeviceListener);
  v1 = (void *)sharedListener___DefaultListener;
  sharedListener___DefaultListener = (uint64_t)v0;

}

- (CSDeviceListener)init
{
  CSDeviceListener *v2;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  __CFRunLoop *Main;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSDeviceListener;
  v2 = -[CSDeviceListener init](&v7, sel_init);
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&sCSOnBattery);
    CSQueryPowerState();
    RunLoopSource = IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)CSQueryPowerState, 0);
    if (RunLoopSource)
    {
      v4 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      CFRelease(v4);
      CSQueryPowerState();
    }
  }
  return v2;
}

- (BOOL)onBattery
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&sCSOnBattery);
  return v2 & 1;
}

@end
