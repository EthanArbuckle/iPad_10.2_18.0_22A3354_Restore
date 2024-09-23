@implementation _DKAssertionsPreventingRestartMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKAssertionsPreventingRestartMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("AssertionsPreventingRestartMonitor");
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD handler[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v14, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke;
    handler[3] = &unk_24DA670E8;
    handler[4] = self;
    notify_register_dispatch("com.apple.powermanagement.idlesleeppreventers", &self->_preventIdleSleepAssertionsToken, v3, handler);

    -[_DKMonitor queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke_2;
    v12[3] = &unk_24DA670E8;
    v12[4] = self;
    notify_register_dispatch("com.apple.powermanagement.systemsleeppreventers", &self->_systemAssertionsToken, v5, v12);

    -[_DKMonitor queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke_3;
    v11[3] = &unk_24DA670E8;
    v11[4] = self;
    notify_register_dispatch("com.apple.powermanagement.restartpreventers", &self->_restartPreventerAssertionsToken, v6, v11);

    v7 = -[_DKAssertionsPreventingRestartMonitor areAssertionsPreventingRestart](self, "areAssertionsPreventingRestart");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForDeviceAssertionsHeldStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    self->_lastPreventingRestartAssertionsStatus = v7;
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKAssertionsPreventingRestartMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  notify_cancel(self->_userspaceAssertionsToken);
  IOPMAssertionNotify();
  notify_cancel(self->_preventIdleSleepAssertionsToken);
  notify_cancel(self->_systemAssertionsToken);
}

- (BOOL)areAssertionsPreventingRestart
{
  NSObject *v3;
  NSObject *v4;
  BOOL v5;
  int restarted;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CFTypeRef v20;
  CFTypeRef cf;
  uint64_t state64;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(self->_systemAssertionsToken, &state64);
  if (!state64)
  {
    cf = 0;
    notify_get_state(self->_preventIdleSleepAssertionsToken, (uint64_t *)&cf);
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = (uint64_t)cf;
        _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_DEFAULT, "Idle Sleep Preventers Count: %llu", buf, 0xCu);
      }

      IOPMCopySleepPreventersList();
    }
    v20 = 0;
    restarted = IOPMCopyDeviceRestartPreventers();
    if (restarted)
    {
      v7 = restarted;
      objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v7;
        _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_DEFAULT, "Unable to determine restart preventers (Ret=%d)", buf, 8u);
      }
    }
    else
    {
      if (!objc_msgSend((id)v20, "count"))
      {
        v5 = 0;
        goto LABEL_23;
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = 0;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("AssertName"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v25 = (uint64_t)v13;
              _os_log_impl(&dword_219056000, v14, OS_LOG_TYPE_DEFAULT, "Restart preventer: %@", buf, 0xCu);
            }

          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
        }
        while (v10);
      }
    }

    v5 = 1;
LABEL_23:

    return v5;
  }
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = state64;
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "System Sleep Preventers Count: %llu", buf, 0xCu);
  }

  IOPMCopySleepPreventersList();
  return 1;
}

- (void)synchronouslyReflectCurrentValue
{
  _BOOL8 v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[_DKAssertionsPreventingRestartMonitor areAssertionsPreventingRestart](self, "areAssertionsPreventingRestart");
  if (self->_lastPreventingRestartAssertionsStatus != v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForDeviceAssertionsHeldStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    self->_lastPreventingRestartAssertionsStatus = v4;
  }
}

- (int)userspaceAssertionsToken
{
  return self->_userspaceAssertionsToken;
}

- (void)setUserspaceAssertionsToken:(int)a3
{
  self->_userspaceAssertionsToken = a3;
}

- (int)preventIdleSleepAssertionsToken
{
  return self->_preventIdleSleepAssertionsToken;
}

- (void)setPreventIdleSleepAssertionsToken:(int)a3
{
  self->_preventIdleSleepAssertionsToken = a3;
}

- (int)systemAssertionsToken
{
  return self->_systemAssertionsToken;
}

- (void)setSystemAssertionsToken:(int)a3
{
  self->_systemAssertionsToken = a3;
}

- (int)restartPreventerAssertionsToken
{
  return self->_restartPreventerAssertionsToken;
}

- (void)setRestartPreventerAssertionsToken:(int)a3
{
  self->_restartPreventerAssertionsToken = a3;
}

- (BOOL)lastPreventingRestartAssertionsStatus
{
  return self->_lastPreventingRestartAssertionsStatus;
}

- (void)setLastPreventingRestartAssertionsStatus:(BOOL)a3
{
  self->_lastPreventingRestartAssertionsStatus = a3;
}

@end
