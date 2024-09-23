@implementation ULAirplaneModeMonitor

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc(MEMORY[0x24BE04788]);
  -[ULEventMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithQueue:", v7);
  -[ULAirplaneModeMonitor setRadiosPref:](self, "setRadiosPref:", v8);

  -[ULAirplaneModeMonitor radiosPref](self, "radiosPref");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[ULAirplaneModeMonitor setAirplaneMode:](self, "setAirplaneMode:", -[ULAirplaneModeMonitor _checkAirplaneMode](self, "_checkAirplaneMode"));
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_109);
  v10 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = -[ULAirplaneModeMonitor airplaneMode](self, "airplaneMode");
    v13 = CFSTR("NO");
    if (v12)
      v13 = CFSTR("YES");
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, airplaneMode: %@", (uint8_t *)&v14, 0x16u);

  }
}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_109);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  -[ULAirplaneModeMonitor radiosPref](self, "radiosPref");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[ULAirplaneModeMonitor setRadiosPref:](self, "setRadiosPref:", 0);
  -[ULAirplaneModeMonitor setAirplaneMode:](self, "setAirplaneMode:", 0);

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULAirplaneModeMonitorEventAirplaneMode *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULAirplaneModeMonitorEventAirplaneMode, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULAirplaneModeMonitorEventAirplaneMode);
    -[ULAirplaneModeMonitorEventAirplaneMode setAirplaneMode:](v8, "setAirplaneMode:", -[ULAirplaneModeMonitor airplaneMode](self, "airplaneMode"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_checkAirplaneMode
{
  void *v2;
  char v3;

  -[ULAirplaneModeMonitor radiosPref](self, "radiosPref");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (void)airplaneModeChanged
{
  NSObject *v3;
  _BOOL8 v4;
  ULAirplaneModeMonitorEventAirplaneMode *v5;

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[ULAirplaneModeMonitor _checkAirplaneMode](self, "_checkAirplaneMode");
  if (v4 != -[ULAirplaneModeMonitor airplaneMode](self, "airplaneMode"))
  {
    -[ULAirplaneModeMonitor setAirplaneMode:](self, "setAirplaneMode:", v4);
    v5 = objc_alloc_init(ULAirplaneModeMonitorEventAirplaneMode);
    -[ULAirplaneModeMonitorEventAirplaneMode setAirplaneMode:](v5, "setAirplaneMode:", v4);
    -[ULEventMonitor postEvent:](self, "postEvent:", v5);

  }
}

- (RadiosPreferences)radiosPref
{
  return self->_radiosPref;
}

- (void)setRadiosPref:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPref, a3);
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPref, 0);
}

@end
