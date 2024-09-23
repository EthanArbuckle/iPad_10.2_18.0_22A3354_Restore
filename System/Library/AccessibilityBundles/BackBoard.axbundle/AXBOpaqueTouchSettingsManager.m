@implementation AXBOpaqueTouchSettingsManager

- (id)initSharedInstance
{
  AXBOpaqueTouchSettingsManager *v2;
  uint64_t v3;
  NSMutableArray *trackedServices;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXBOpaqueTouchSettingsManager;
  v2 = -[AXBOpaqueTouchSettingsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    trackedServices = v2->_trackedServices;
    v2->_trackedServices = (NSMutableArray *)v3;

    v2->_systemFilterClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    IOHIDEventSystemClientSetMatching();
    CFRunLoopGetMain();
    IOHIDEventSystemClientScheduleWithRunLoop();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_systemFilterClient)
  {
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    CFRelease(self->_systemFilterClient);
    self->_systemFilterClient = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)AXBOpaqueTouchSettingsManager;
  -[AXBOpaqueTouchSettingsManager dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  return (id)sharedInstance_shared;
}

void __47__AXBOpaqueTouchSettingsManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXBOpaqueTouchSettingsManager initSharedInstance]([AXBOpaqueTouchSettingsManager alloc], "initSharedInstance");
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (void)_applyPreferencesToDeviceService:(__IOHIDServiceClient *)a3
{
  float v4;
  CFNumberRef v5;
  int v6;
  CFTypeRef *v7;
  uint64_t valuePtr;

  _AXSOpaqueTouchTapSpeed();
  valuePtr = (uint64_t)(float)(v4 * 1000.0);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  IOHIDServiceClientSetProperty(a3, CFSTR("DoubleTapDeltaMs"), v5);
  CFRelease(v5);
  v6 = _AXSAllowOpaqueTouchGestures();
  v7 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (!v6)
    v7 = (CFTypeRef *)MEMORY[0x24BDBD270];
  IOHIDServiceClientSetProperty(a3, CFSTR("GesturesDisabled"), *v7);
}

- (void)deviceServiceAppeared:(__IOHIDServiceClient *)a3
{
  NSObject *v5;
  __IOHIDServiceClient *v6;
  int v7;
  __IOHIDServiceClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  AXLogAccessories();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Accessibility noticed opaque touch service appearing: %@", (uint8_t *)&v7, 0xCu);
  }

  IOHIDServiceClientRegisterRemovalCallback();
  v6 = a3;
  if ((-[NSMutableArray containsObject:](self->_trackedServices, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_trackedServices, "addObject:", v6);
    -[AXBOpaqueTouchSettingsManager _applyPreferencesToDeviceService:](self, "_applyPreferencesToDeviceService:", v6);
  }

}

- (void)deviceServiceDisappeared:(__IOHIDServiceClient *)a3
{
  NSObject *v5;
  int v6;
  __IOHIDServiceClient *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogAccessories();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = a3;
    _os_log_impl(&dword_232455000, v5, OS_LOG_TYPE_DEFAULT, "Accessibility noticed opaque touch service disappearing: %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray removeObject:](self->_trackedServices, "removeObject:", a3);
}

- (void)start
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  CFArrayRef v5;
  NSObject *v6;
  const __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_running || (v12 = "-[AXBOpaqueTouchSettingsManager start]", _AXAssert(), !self->_running))
  {
    self->_running = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x24BED26C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x24BED28B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    IOHIDEventSystemClientRegisterDeviceMatchingCallback();
    v5 = IOHIDEventSystemClientCopyServices(self->_systemFilterClient);
    AXLogAccessories();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = -[__CFArray count](v5, "count");
      _os_log_impl(&dword_232455000, v6, OS_LOG_TYPE_DEFAULT, "Accessibility is starting opaque touch settings manager. There are %ld matching devices at startup.", buf, 0xCu);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[AXBOpaqueTouchSettingsManager deviceServiceAppeared:](self, "deviceServiceAppeared:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), v12);
        }
        while (v9 != v11);
        v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)_resendPreferencesToServices
{
  NSObject *v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  AXLogAccessories();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_trackedServices, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v4;
    _os_log_impl(&dword_232455000, v3, OS_LOG_TYPE_DEFAULT, "Accessibility is resending opaque touch preferences to tracked device services. there are %ld such services.", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_trackedServices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AXBOpaqueTouchSettingsManager _applyPreferencesToDeviceService:](self, "_applyPreferencesToDeviceService:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldBlockOpaqueTouchEvents
{
  return _AXSAllowOpaqueTouchGestures() == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedServices, 0);
}

@end
