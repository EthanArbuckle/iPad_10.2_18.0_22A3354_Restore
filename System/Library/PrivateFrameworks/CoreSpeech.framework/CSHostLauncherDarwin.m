@implementation CSHostLauncherDarwin

- (CSHostLauncherDarwin)init
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *hidCallbackQueue;
  void *v5;
  __IOHIDUserDevice *v6;
  __IOHIDUserDevice *device;
  CSHostLauncherDarwin *v8;
  _QWORD handler[4];
  CSHostLauncherDarwin *v11;
  objc_super v12;

  if (!objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
    goto LABEL_7;
  v12.receiver = self;
  v12.super_class = (Class)CSHostLauncherDarwin;
  self = -[CSHostLauncherDarwin init](&v12, sel_init);
  if (self)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("HID event callback queue", 0);
    hidCallbackQueue = self->_hidCallbackQueue;
    self->_hidCallbackQueue = v3;

    +[CSHostLauncherDarwin propertyDictForDarwin](CSHostLauncherDarwin, "propertyDictForDarwin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate();
    self->_device = v6;
    if (v6)
    {
      IOHIDUserDeviceSetDispatchQueue(v6, (dispatch_queue_t)self->_hidCallbackQueue);
      device = self->_device;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __28__CSHostLauncherDarwin_init__block_invoke;
      handler[3] = &unk_1E7C292C8;
      v11 = self;
      IOHIDUserDeviceSetCancelHandler(device, handler);
      IOHIDUserDeviceActivate(self->_device);
      NSLog(CFSTR("Created HID device successfully"));

      goto LABEL_5;
    }
    NSLog(CFSTR("Error : Failed in creating device"));

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
LABEL_5:
  self = self;
  v8 = self;
LABEL_8:

  return v8;
}

- (void)dealloc
{
  __IOHIDUserDevice *device;
  objc_super v4;

  device = self->_device;
  if (device)
    IOHIDUserDeviceCancel(device);
  v4.receiver = self;
  v4.super_class = (Class)CSHostLauncherDarwin;
  -[CSHostLauncherDarwin dealloc](&v4, sel_dealloc);
}

- (BOOL)wakeHostForVoiceTrigger
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19260], "deviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = 1;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_retainAutorelease(v3);
    objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v5, "bytes"), 25);
    v6 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = objc_msgSend(v4, "length");
      *(_DWORD *)buf = 136315650;
      v14 = "-[CSHostLauncherDarwin wakeHostForVoiceTrigger]";
      v15 = 2050;
      v16 = v8;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Sending HID report (length = %{public}lu) to host with deviceId info (%{public}@)", buf, 0x20u);

    }
    v9 = objc_retainAutorelease(v4);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    IOHIDUserDeviceHandleReport();

  }
  else
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSHostLauncherDarwin wakeHostForVoiceTrigger]";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Failed to fetch local deviceId, abort", buf, 0xCu);
    }
  }

  return v3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidCallbackQueue, 0);
}

void __28__CSHostLauncherDarwin_init__block_invoke(uint64_t a1)
{
  NSLog(CFSTR("cancelled device"));
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2615 != -1)
    dispatch_once(&sharedInstance_onceToken_2615, &__block_literal_global_2616);
  return (id)sharedInstance__sharedInstance_2617;
}

+ (id)propertyDictForDarwin
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  CFDataRef v4;
  CFNumberRef v5;
  void *v6;
  int valuePtr;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = CFDataCreate(v2, gHIDDescriptorDarwin, 25);
  if (v4)
    CFDictionarySetValue(Mutable, CFSTR("ReportDescriptor"), v4);
  valuePtr = 4000000;
  v5 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
  if (v5)
    CFDictionarySetValue(Mutable, CFSTR("RequestTimeout"), v5);
  CFDictionarySetValue(Mutable, CFSTR("HIDRelaySupport"), (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(Mutable, CFSTR("HIDRelayUSBInterface"), CFSTR("SiriHIDDevice"));
  v6 = (void *)-[__CFDictionary copy](Mutable, "copy");

  return v6;
}

void __38__CSHostLauncherDarwin_sharedInstance__block_invoke()
{
  CSHostLauncherDarwin *v0;
  void *v1;

  v0 = objc_alloc_init(CSHostLauncherDarwin);
  v1 = (void *)sharedInstance__sharedInstance_2617;
  sharedInstance__sharedInstance_2617 = (uint64_t)v0;

}

@end
