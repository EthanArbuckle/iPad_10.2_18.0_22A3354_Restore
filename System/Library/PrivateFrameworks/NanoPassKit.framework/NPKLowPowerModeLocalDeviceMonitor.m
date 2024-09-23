@implementation NPKLowPowerModeLocalDeviceMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_10);
  return (id)sharedInstance_monitor;
}

void __51__NPKLowPowerModeLocalDeviceMonitor_sharedInstance__block_invoke()
{
  NPKLowPowerModeLocalDeviceMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(NPKLowPowerModeLocalDeviceMonitor);
  v1 = (void *)sharedInstance_monitor;
  sharedInstance_monitor = (uint64_t)v0;

}

- (NPKLowPowerModeLocalDeviceMonitor)init
{
  void *v3;
  NPKLowPowerModeLocalDeviceMonitor *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NPKLowPowerModeLocalDeviceMonitor initWithNotificationCenter:](self, "initWithNotificationCenter:", v3);

  return v4;
}

- (NPKLowPowerModeLocalDeviceMonitor)initWithNotificationCenter:(id)a3
{
  id v4;
  NPKLowPowerModeLocalDeviceMonitor *v5;
  NPKThreadSafeObserverManager *v6;
  NPKObserverManager *observersManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKLowPowerModeLocalDeviceMonitor;
  v5 = -[NPKLowPowerModeLocalDeviceMonitor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(NPKThreadSafeObserverManager);
    observersManager = v5->_observersManager;
    v5->_observersManager = &v6->super;

    objc_msgSend(v4, "addObserver:selector:name:object:", v5, sel__lowPowerModeStateChanged_, *MEMORY[0x24BDD1160], 0);
  }

  return v5;
}

- (BOOL)isLowPowerModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (void)_lowPowerModeStateChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__NPKLowPowerModeLocalDeviceMonitor__lowPowerModeStateChanged___block_invoke;
  v3[3] = &unk_24CFE7998;
  v3[4] = self;
  NPKGuaranteeMainThread(v3);
}

uint64_t __63__NPKLowPowerModeLocalDeviceMonitor__lowPowerModeStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLowPowerModeEnabledStateToObservers:", objc_msgSend(*(id *)(a1 + 32), "isLowPowerModeEnabled"));
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[NPKObserverManager registerObserver:](self->_observersManager, "registerObserver:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__NPKLowPowerModeLocalDeviceMonitor_registerObserver___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  NPKGuaranteeMainThread(v6);

}

uint64_t __54__NPKLowPowerModeLocalDeviceMonitor_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLowPowerModeEnabled:toObserver:", objc_msgSend(*(id *)(a1 + 32), "isLowPowerModeEnabled"), *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  NPKObserverManager *observersManager;
  id v4;

  observersManager = self->_observersManager;
  v4 = a3;
  -[NPKObserverManager unregisterObserver:](observersManager, "unregisterObserver:", v4);

}

- (void)_sendLowPowerModeEnabledStateToObservers:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  NPKObserverManager *observersManager;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("disabled");
      if (v3)
        v8 = CFSTR("enabled");
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKLowPowerModeMonitor: Sending low power mode %@ state to observers.", buf, 0xCu);
    }

  }
  observersManager = self->_observersManager;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__NPKLowPowerModeLocalDeviceMonitor__sendLowPowerModeEnabledStateToObservers___block_invoke;
  v10[3] = &unk_24CFE9F30;
  v10[4] = self;
  v11 = v3;
  -[NPKObserverManager enumerateObserversUsingBlock:](observersManager, "enumerateObserversUsingBlock:", v10);
}

uint64_t __78__NPKLowPowerModeLocalDeviceMonitor__sendLowPowerModeEnabledStateToObservers___block_invoke(uint64_t a1, uint64_t a2)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersManager, 0);
}

@end
