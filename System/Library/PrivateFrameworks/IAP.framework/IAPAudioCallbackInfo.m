@implementation IAPAudioCallbackInfo

- (void)_handleiAPDaemonDied:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("IAPAudioDeviceStateChangedNotification"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("IAPAudioVolumeControlSupportChangedNotification"), 0);
}

- (IAPAudioCallbackInfo)init
{
  IAPAudioCallbackInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IAPAudioCallbackInfo;
  v2 = -[IAPAudioCallbackInfo init](&v4, sel_init);
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleiAPDaemonDied_, CFSTR("kIAPDServerDiedNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleiAPDaemonDied_, CFSTR("kIAP2ServerDiedNotification"), 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", CFSTR("kIAPDServerDiedNotification"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", CFSTR("kIAP2ServerDiedNotification"));

  v3.receiver = self;
  v3.super_class = (Class)IAPAudioCallbackInfo;
  -[IAPAudioCallbackInfo dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (+[IAPAudioCallbackInfo sharedInstance]::once != -1)
    dispatch_once(&+[IAPAudioCallbackInfo sharedInstance]::once, &__block_literal_global_1);
  return (id)+[IAPAudioCallbackInfo sharedInstance]::sharedInstance;
}

IAPAudioCallbackInfo *__38__IAPAudioCallbackInfo_sharedInstance__block_invoke()
{
  IAPAudioCallbackInfo *result;

  result = objc_alloc_init(IAPAudioCallbackInfo);
  +[IAPAudioCallbackInfo sharedInstance]::sharedInstance = (uint64_t)result;
  return result;
}

- (void)setupDeviceStateChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v9;

  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  self->_deviceStateChangedCallback = a3;
  self->_deviceStateChangedContext = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__deviceStateChanged_, CFSTR("IAPAudioDeviceStateChangedNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioDeviceStateChangedNotificationCallBack, CFSTR("IAPAudioDeviceStateChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)AccessoryDigitalAudioNotificationCallBack, CFSTR("com.apple.accessories.audio.stateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)clearDeviceStateChangedCallback
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  -[NSLock lock](self->_lock, "lock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("IAPAudioDeviceStateChangedNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("IAPAudioDeviceStateChangedNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, 0, CFSTR("com.apple.accessories.audio.stateChanged"), 0);
  self->_deviceStateChangedCallback = 0;
  self->_deviceStateChangedContext = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setupVolumeChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  self->_volumeChangedCallback = a3;
  self->_volumeChangedContext = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioVolumeChangedNotificationCallBack, CFSTR("IAPAudioVolumeChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)clearVolumeChangedCallback
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("IAPAudioVolumeChangedNotification"), 0);
  self->_volumeChangedCallback = 0;
  self->_volumeChangedContext = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setupPauseOnHeadphoneDisconnectChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  self->_pauseOnHeadphoneDisconnectChangedCallback = a3;
  self->_pauseOnHeadphoneDisconnectChangedContext = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotificationCallBack, CFSTR("IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)clearPauseOnHeadphoneDisconnectChangedCallback
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotification"), 0);
  self->_pauseOnHeadphoneDisconnectChangedCallback = 0;
  self->_pauseOnHeadphoneDisconnectChangedContext = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setupVolumeControlSupportChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock", a3, a4, a5);
  self->_volumeControlSupportChangedCallback = a3;
  self->_volumeControlSupportChangedContext = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__volumeControlSupportChanged_, CFSTR("IAPAudioVolumeControlSupportChangedNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioVolumeControlSupportChangedNotificationCallBack, CFSTR("IAPAudioVolumeControlSupportChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)clearVolumeControlSupportChangedCallback
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[NSLock lock](self->_lock, "lock");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("IAPAudioVolumeControlSupportChangedNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("IAPAudioVolumeControlSupportChangedNotification"), 0);
  self->_volumeControlSupportChangedCallback = 0;
  self->_volumeControlSupportChangedContext = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_deviceStateChanged:(id)a3
{
  ((void (*)(void *))self->_deviceStateChangedCallback)(self->_deviceStateChangedContext);
}

- (void)_volumeChanged:(id)a3
{
  ((void (*)(void *))self->_volumeChangedCallback)(self->_volumeChangedContext);
}

- (void)_pauseOnHeadphoneDisconnectChanged:(id)a3
{
  ((void (*)(void *))self->_pauseOnHeadphoneDisconnectChangedCallback)(self->_pauseOnHeadphoneDisconnectChangedContext);
}

- (void)_volumeControlSupportChanged:(id)a3
{
  ((void (*)(void *))self->_volumeControlSupportChangedCallback)(self->_volumeControlSupportChangedContext);
}

@end
