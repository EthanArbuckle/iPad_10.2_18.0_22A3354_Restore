@implementation _DKPluggedInMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKPluggedInMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKPluggedInMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("ChargerPluggedInState");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (void)setIsPluggedIn:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  _DKPluggedInMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_INFO, "Updating context store with plug in state: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

+ (id)_eventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v5 = a5;
  v7 = a3;
  v21[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPluggedInMonitor setIsPluggedIn:](_DKPluggedInMonitor, "setIsPluggedIn:", v7);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BE1B070], "adapterType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x24BE1B070], "adapterIsWireless");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceIsPluggedInStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventWithStream:startDate:endDate:value:metadata:", v15, v16, v17, v8, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_BMEventWithState:(BOOL)a3 adapterType:(int64_t)a4 isWireless:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a3;
  v8 = objc_alloc(MEMORY[0x24BE0C370]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithStarting:wireless:adapterType:", v9, v10, v11);

  return v12;
}

- (void)setCurrentState
{
  uint64_t v3;
  const __CFBoolean *v4;
  int Value;
  CFDictionaryRef v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t)IOPSCopyPowerSourcesInfo();
  if (v3)
  {
    v4 = (const __CFBoolean *)IOPSPowerSourceSupported();
    Value = CFBooleanGetValue(v4);
    CFRelease((CFTypeRef)v3);
    if (Value)
    {
      v6 = IOPSCopyExternalPowerAdapterDetails();
      if (v6)
      {
        v3 = IOPSDrawingUnlimitedPower();
        -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("FamilyCode"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "integerValue");

        -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("IsWireless"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

      }
      else
      {
        v10 = 0;
        v8 = 0;
        v3 = 0;
      }

    }
    else
    {
      v10 = 0;
      v8 = 0;
      v3 = 1;
    }
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  _DKPluggedInMonitorLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_219056000, v11, OS_LOG_TYPE_INFO, "Setting current state plugin:%@, adapterType:%@, wireless:%@, ", (uint8_t *)&v19, 0x20u);

  }
  -[_DKMonitor currentEvent](self, "currentEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPluggedInMonitor _eventWithState:adapterType:isWireless:](_DKPluggedInMonitor, "_eventWithState:adapterType:isWireless:", v3, v8, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_DKMonitor historicalStateHasChanged:](self, "historicalStateHasChanged:", v16))
  {
    objc_msgSend((id)objc_opt_class(), "_BMEventWithState:adapterType:isWireless:", v3, v8, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMSource sendEvent:](self->_source, "sendEvent:", v17);

  }
  -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v16, 1);
  _DKPluggedInMonitorLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v16;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_219056000, v18, OS_LOG_TYPE_DEFAULT, "Setting current event: %@, previousEvent: %@", (uint8_t *)&v19, 0x16u);
  }

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BMSource *v7;
  BMSource *source;
  const char *v9;
  NSObject *v10;
  _QWORD handler[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DKPluggedInMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v12, sel_instantMonitorNeedsActivation))
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Power");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PluggedIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (BMSource *)objc_claimAutoreleasedReturnValue();
    source = self->_source;
    self->_source = v7;

    self->_enabled = 1;
    v9 = (const char *)objc_msgSend(CFSTR("com.apple.system.powermanagement.poweradapter"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __28___DKPluggedInMonitor_start__block_invoke;
    handler[3] = &unk_24DA670E8;
    handler[4] = self;
    notify_register_dispatch(v9, &self->_pluggedInToken, v10, handler);

    -[_DKPluggedInMonitor setCurrentState](self, "setCurrentState");
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKPluggedInMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKPluggedInMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int pluggedInToken;

  self->_enabled = 0;
  pluggedInToken = self->_pluggedInToken;
  if (pluggedInToken)
  {
    notify_cancel(pluggedInToken);
    self->_pluggedInToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  void *v2;
  uint64_t v3;
  const __CFBoolean *v4;
  int Value;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[_DKMonitor currentEvent](self, "currentEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (uint64_t)IOPSCopyPowerSourcesInfo();
    if (v3)
    {
      v4 = (const __CFBoolean *)IOPSPowerSourceSupported();
      Value = CFBooleanGetValue(v4);
      CFRelease((CFTypeRef)v3);
      if (Value)
        v3 = IOPSDrawingUnlimitedPower();
      else
        v3 = 1;
    }
    _DKPluggedInMonitorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_219056000, v6, OS_LOG_TYPE_DEFAULT, "Synchronously reflecting current plug in status: %@", (uint8_t *)&v8, 0xCu);

    }
    +[_DKPluggedInMonitor setIsPluggedIn:](_DKPluggedInMonitor, "setIsPluggedIn:", v3);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int)pluggedInToken
{
  return self->_pluggedInToken;
}

- (void)setPluggedInToken:(int)a3
{
  self->_pluggedInToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
