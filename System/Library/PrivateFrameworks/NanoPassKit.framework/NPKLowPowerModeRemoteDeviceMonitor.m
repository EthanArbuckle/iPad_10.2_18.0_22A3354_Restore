@implementation NPKLowPowerModeRemoteDeviceMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  return (id)sharedInstance_monitor_0;
}

void __52__NPKLowPowerModeRemoteDeviceMonitor_sharedInstance__block_invoke()
{
  NPKLowPowerModeRemoteDeviceMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(NPKLowPowerModeRemoteDeviceMonitor);
  v1 = (void *)sharedInstance_monitor_0;
  sharedInstance_monitor_0 = (uint64_t)v0;

}

- (NPKLowPowerModeRemoteDeviceMonitor)init
{
  NPKLowPowerModeRemoteDeviceMonitor *v2;
  NPKThreadSafeObserverManager *v3;
  NPKObserverManager *observersManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKLowPowerModeRemoteDeviceMonitor;
  v2 = -[NPKLowPowerModeRemoteDeviceMonitor init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NPKThreadSafeObserverManager);
    observersManager = v2->_observersManager;
    v2->_observersManager = &v3->super;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)lowPowerModeChangedNotification, CFSTR("com.apple.Carousel.LowPowerMode"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.Carousel.LowPowerMode"), 0);
  v4.receiver = self;
  v4.super_class = (Class)NPKLowPowerModeRemoteDeviceMonitor;
  -[NPKLowPowerModeRemoteDeviceMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)isLowPowerModeEnabled
{
  void *v2;
  id v3;
  char v4;

  -[NPKLowPowerModeRemoteDeviceMonitor _currentDeviceDomainAccessor](self, "_currentDeviceDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "synchronize");
  v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LowPowerMode"));

  return v4;
}

- (void)registerObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v4 = a3;
  -[NPKObserverManager registerObserver:](self->_observersManager, "registerObserver:", v4);
  v5 = -[NPKLowPowerModeRemoteDeviceMonitor isLowPowerModeEnabled](self, "isLowPowerModeEnabled");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NPKLowPowerModeRemoteDeviceMonitor_registerObserver___block_invoke;
  v7[3] = &unk_24CFE8FA8;
  v9 = v5;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  NPKGuaranteeMainThread(v7);

}

uint64_t __55__NPKLowPowerModeRemoteDeviceMonitor_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLowPowerModeEnabled:toObserver:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  NPKObserverManager *observersManager;
  id v4;

  observersManager = self->_observersManager;
  v4 = a3;
  -[NPKObserverManager unregisterObserver:](observersManager, "unregisterObserver:", v4);

}

- (void)_sendLowPowerModeEnabledStateToObservers
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[NPKLowPowerModeRemoteDeviceMonitor isLowPowerModeEnabled](self, "isLowPowerModeEnabled");
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("disabled");
      if (v3)
        v7 = CFSTR("enabled");
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observers.", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke;
  v8[3] = &unk_24CFE7D78;
  v8[4] = self;
  v9 = v3;
  NPKGuaranteeMainThread(v8);
}

uint64_t __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke_2;
  v4[3] = &unk_24CFE9F30;
  v4[4] = v1;
  v5 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v2, "enumerateObserversUsingBlock:", v4);
}

uint64_t __78__NPKLowPowerModeRemoteDeviceMonitor__sendLowPowerModeEnabledStateToObservers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLowPowerModeEnabled:toObserver:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)_sendLowPowerModeEnabled:(BOOL)a3 toObserver:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("disabled");
      if (v4)
        v10 = CFSTR("enabled");
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observer %@.", (uint8_t *)&v11, 0x16u);
    }

  }
  objc_msgSend(v6, "lowPowerModeMonitor:didUpdateLowPowerModeEnabled:", self, v4);

}

- (id)_currentDeviceDomainAccessor
{
  return NPKDomainAccessorForDomain(CFSTR("com.apple.Carousel"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersManager, 0);
}

@end
