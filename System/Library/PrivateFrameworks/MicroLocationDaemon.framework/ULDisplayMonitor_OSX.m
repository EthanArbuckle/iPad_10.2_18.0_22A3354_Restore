@implementation ULDisplayMonitor_OSX

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
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_opt_new();
  -[ULDisplayMonitor_OSX setSystemMonitor:](self, "setSystemMonitor:", v6);

  -[ULEventMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDispatchQueue:", v7);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke;
  v25[3] = &unk_2511D2C80;
  objc_copyWeak(&v26, &location);
  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidationHandler:", v25);

  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_31;
  v23[3] = &unk_2511D2C80;
  objc_copyWeak(&v24, &location);
  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScreenOnChangedHandler:", v23);

  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_2;
  v21[3] = &unk_2511D2C80;
  objc_copyWeak(&v22, &location);
  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClamshellModeChangedHandler:", v21);

  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_3;
  v19[3] = &unk_2511D2C80;
  objc_copyWeak(&v20, &location);
  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScreenLockedChangedHandler:", v19);

  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_4;
  v16[3] = &unk_2511D3E20;
  objc_copyWeak(&v18, &location);
  v15 = v4;
  v17 = v15;
  objc_msgSend(v14, "activateWithCompletion:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)stopMonitoring:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[ULEventMonitor queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[ULDisplayMonitor_OSX _invalidationHandler](self, "_invalidationHandler");
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_84);
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    +[ULEvent eventName](ULDisplayMonitorEventDisplayState_OSX, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULDisplayMonitorEventDisplayState_OSX *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULDisplayMonitorEventDisplayState_OSX, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULDisplayMonitorEventDisplayState_OSX);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOn:](v8, "setScreenOn:", -[ULDisplayMonitor_OSX screenOn](self, "screenOn"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOnChanged:](v8, "setScreenOnChanged:", 1);
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellMode:](v8, "setClamshellMode:", -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode"));
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellModeChanged:](v8, "setClamshellModeChanged:", 1);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLocked:](v8, "setScreenLocked:", -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLockedChanged:](v8, "setScreenLockedChanged:", 1);
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

  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ULDisplayMonitor_OSX setSystemMonitor:](self, "setSystemMonitor:", 0);
  -[ULDisplayMonitor_OSX setScreenOn:](self, "setScreenOn:", 0);
  -[ULDisplayMonitor_OSX setClamshellMode:](self, "setClamshellMode:", 0);
  -[ULDisplayMonitor_OSX setScreenLocked:](self, "setScreenLocked:", 0);
}

- (void)_screenOnChangedHandler
{
  NSObject *v3;
  ULDisplayMonitorEventDisplayState_OSX *v4;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LODWORD(v3) = -[ULDisplayMonitor_OSX screenOn](self, "screenOn");
  -[ULDisplayMonitor_OSX setScreenOn:](self, "setScreenOn:", -[ULDisplayMonitor_OSX _checkScreenOn](self, "_checkScreenOn"));
  if ((_DWORD)v3 != -[ULDisplayMonitor_OSX screenOn](self, "screenOn"))
  {
    v4 = objc_alloc_init(ULDisplayMonitorEventDisplayState_OSX);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOn:](v4, "setScreenOn:", -[ULDisplayMonitor_OSX screenOn](self, "screenOn"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOnChanged:](v4, "setScreenOnChanged:", 1);
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellMode:](v4, "setClamshellMode:", -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode"));
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellModeChanged:](v4, "setClamshellModeChanged:", 0);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLocked:](v4, "setScreenLocked:", -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLockedChanged:](v4, "setScreenLockedChanged:", 0);
    -[ULEventMonitor postEvent:](self, "postEvent:", v4);

  }
}

- (void)_clamshellModeChangedHandler
{
  NSObject *v3;
  ULDisplayMonitorEventDisplayState_OSX *v4;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LODWORD(v3) = -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode");
  -[ULDisplayMonitor_OSX setClamshellMode:](self, "setClamshellMode:", -[ULDisplayMonitor_OSX _checkClamshellMode](self, "_checkClamshellMode"));
  if ((_DWORD)v3 != -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode"))
  {
    v4 = objc_alloc_init(ULDisplayMonitorEventDisplayState_OSX);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOn:](v4, "setScreenOn:", -[ULDisplayMonitor_OSX screenOn](self, "screenOn"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOnChanged:](v4, "setScreenOnChanged:", 0);
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellMode:](v4, "setClamshellMode:", -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode"));
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellModeChanged:](v4, "setClamshellModeChanged:", 1);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLocked:](v4, "setScreenLocked:", -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLockedChanged:](v4, "setScreenLockedChanged:", 0);
    -[ULEventMonitor postEvent:](self, "postEvent:", v4);

  }
}

- (void)_screenLockedChangedHandler
{
  NSObject *v3;
  ULDisplayMonitorEventDisplayState_OSX *v4;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LODWORD(v3) = -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked");
  -[ULDisplayMonitor_OSX setScreenLocked:](self, "setScreenLocked:", -[ULDisplayMonitor_OSX _checkScreenLocked](self, "_checkScreenLocked"));
  if ((_DWORD)v3 != -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked"))
  {
    v4 = objc_alloc_init(ULDisplayMonitorEventDisplayState_OSX);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLocked:](v4, "setScreenLocked:", -[ULDisplayMonitor_OSX screenLocked](self, "screenLocked"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenLockedChanged:](v4, "setScreenLockedChanged:", 1);
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOn:](v4, "setScreenOn:", -[ULDisplayMonitor_OSX screenOn](self, "screenOn"));
    -[ULDisplayMonitorEventDisplayState_OSX setScreenOnChanged:](v4, "setScreenOnChanged:", 0);
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellMode:](v4, "setClamshellMode:", -[ULDisplayMonitor_OSX clamshellMode](self, "clamshellMode"));
    -[ULDisplayMonitorEventDisplayState_OSX setClamshellModeChanged:](v4, "setClamshellModeChanged:", 0);
    -[ULEventMonitor postEvent:](self, "postEvent:", v4);

  }
}

- (void)_activateWithCompletion
{
  NSObject *v3;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULDisplayMonitor_OSX _screenOnChangedHandler](self, "_screenOnChangedHandler");
  -[ULDisplayMonitor_OSX _clamshellModeChangedHandler](self, "_clamshellModeChangedHandler");
  -[ULDisplayMonitor_OSX _screenLockedChangedHandler](self, "_screenLockedChangedHandler");
}

- (BOOL)_checkScreenOn
{
  void *v2;
  char v3;

  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenOn");

  return v3;
}

- (BOOL)_checkClamshellMode
{
  void *v2;
  char v3;

  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clamshellMode");

  return v3;
}

- (BOOL)_checkScreenLocked
{
  void *v2;
  char v3;

  -[ULDisplayMonitor_OSX systemMonitor](self, "systemMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenLocked");

  return v3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (BOOL)clamshellMode
{
  return self->_clamshellMode;
}

- (void)setClamshellMode:(BOOL)a3
{
  self->_clamshellMode = a3;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
}

@end
