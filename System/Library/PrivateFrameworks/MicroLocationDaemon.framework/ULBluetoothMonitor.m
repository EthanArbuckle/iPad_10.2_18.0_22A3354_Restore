@implementation ULBluetoothMonitor

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_opt_new();
  -[ULBluetoothMonitor setController:](self, "setController:", v6);

  -[ULEventMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBluetoothMonitor controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDispatchQueue:", v7);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke;
  v22[3] = &unk_2511D2C80;
  objc_copyWeak(&v23, &location);
  -[ULBluetoothMonitor controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidationHandler:", v22);

  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_6;
  v20[3] = &unk_2511D2C80;
  objc_copyWeak(&v21, &location);
  -[ULBluetoothMonitor controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", v20);

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_7;
  v18[3] = &unk_2511D2C80;
  objc_copyWeak(&v19, &location);
  -[ULBluetoothMonitor controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBluetoothStateChangedHandler:", v18);

  -[ULBluetoothMonitor controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_2;
  v16[3] = &unk_2511D3410;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v13, "activateWithCompletion:", v16);

  -[ULBluetoothMonitor setPowerOn:](self, "setPowerOn:", 1);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
  v14 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULBluetoothMonitor powerOn](self, "powerOn"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Start monitoring: %@, powerOn: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: Invalidation called for bluetooth client", v3, 2u);
    }
    objc_msgSend(WeakRetained, "_invalidationHandler");
  }

}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: Interruption called for bluetooth client", v3, 2u);
    }
  }

}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_bluetoothStateChangeHandler");
    WeakRetained = v2;
  }

}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: activate with completion called with error: %@", (uint8_t *)&v6, 0xCu);
    }
    if (v3)
      objc_msgSend(WeakRetained, "_invalidationHandler");
    else
      objc_msgSend(WeakRetained, "_bluetoothStateChangeHandler");
  }

}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  -[ULBluetoothMonitor _invalidationHandler](self, "_invalidationHandler");

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULBluetoothMonitorEventPowerOn *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULBluetoothMonitorEventPowerOn, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULBluetoothMonitorEventPowerOn);
    -[ULBluetoothMonitorEventPowerOn setPowerOn:](v8, "setPowerOn:", -[ULBluetoothMonitor powerOn](self, "powerOn"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_invalidationHandler
{
  NSObject *v3;
  void *v4;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULBluetoothMonitor controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ULBluetoothMonitor setController:](self, "setController:", 0);
  -[ULBluetoothMonitor setPowerOn:](self, "setPowerOn:", 0);
}

- (void)_bluetoothStateChangeHandler
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  _BOOL8 v11;
  ULBluetoothMonitorEventPowerOn *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULBluetoothMonitor controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bluetoothState");

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_11);
  v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v5 > 0xA)
      v8 = "?";
    else
      v8 = off_2511D3450[v5];
    v9 = v6;
    objc_msgSend(v7, "stringWithUTF8String:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Bluetooth state: %@", (uint8_t *)&v13, 0xCu);

  }
  v11 = -[ULBluetoothMonitor _checkPowerOnForBluetoothState:](self, "_checkPowerOnForBluetoothState:", v5);
  if (v11 != -[ULBluetoothMonitor powerOn](self, "powerOn"))
  {
    -[ULBluetoothMonitor setPowerOn:](self, "setPowerOn:", v11);
    v12 = objc_alloc_init(ULBluetoothMonitorEventPowerOn);
    -[ULBluetoothMonitorEventPowerOn setPowerOn:](v12, "setPowerOn:", -[ULBluetoothMonitor powerOn](self, "powerOn"));
    -[ULEventMonitor postEvent:](self, "postEvent:", v12);

  }
}

- (BOOL)_checkPowerOnForBluetoothState:(int64_t)a3
{
  return a3 == 5 || a3 == 10;
}

- (CBController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_powerOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
