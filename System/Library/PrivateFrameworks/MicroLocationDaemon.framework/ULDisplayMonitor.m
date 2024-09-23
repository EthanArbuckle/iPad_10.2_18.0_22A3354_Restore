@implementation ULDisplayMonitor

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BE38438];
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke;
  v15[3] = &unk_2511D9450;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "setTransitionHandler:", v15);
  objc_destroyWeak(&v16);
  objc_msgSend(v6, "monitorWithConfiguration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULDisplayMonitor setDisplayLayoutMinitor:](self, "setDisplayLayoutMinitor:", v9);

  v10 = dispatch_time(0, 100000000);
  -[ULEventMonitor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke_3;
  v13[3] = &unk_2511D2CA8;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_after(v10, v11, v13);

  objc_destroyWeak(&location);
}

void __36__ULDisplayMonitor_startMonitoring___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke_2;
    v8[3] = &unk_2511D2CA8;
    v8[4] = v6;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

uint64_t __36__ULDisplayMonitor_startMonitoring___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didUpdateDisplayLayout:", *(_QWORD *)(a1 + 40));
}

void __36__ULDisplayMonitor_startMonitoring___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "displayLayoutMinitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "DisplayMonitor got currentLayout nil", (uint8_t *)&v13, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_didUpdateDisplayLayout:", v3);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "appInFocus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "displayOn"))
      v10 = CFSTR("On");
    else
      v10 = CFSTR("Off");
    v11 = objc_msgSend(*(id *)(a1 + 32), "screenLocked");
    v12 = CFSTR("Unlocked");
    v13 = 138413058;
    v14 = v7;
    v15 = 2112;
    if (v11)
      v12 = CFSTR("Locked");
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, appInFocus: %@, display: %@, screen: %@", (uint8_t *)&v13, 0x2Au);

  }
}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULDisplayMonitor displayLayoutMinitor](self, "displayLayoutMinitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[ULDisplayMonitor setDisplayLayoutMinitor:](self, "setDisplayLayoutMinitor:", 0);
  -[ULDisplayMonitor setAppInFocus:](self, "setAppInFocus:", 0);
  -[ULDisplayMonitor setDisplayOn:](self, "setDisplayOn:", 0);
  -[ULDisplayMonitor setScreenLocked:](self, "setScreenLocked:", 0);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_78);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULDisplayMonitorEventDisplayState *v8;
  void *v9;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULDisplayMonitorEventDisplayState, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULDisplayMonitorEventDisplayState);
    -[ULDisplayMonitor appInFocus](self, "appInFocus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDisplayMonitorEventDisplayState setAppInFocus:](v8, "setAppInFocus:", v9);

    -[ULDisplayMonitorEventDisplayState setAppInFocusChanged:](v8, "setAppInFocusChanged:", 1);
    -[ULDisplayMonitorEventDisplayState setDisplayOn:](v8, "setDisplayOn:", -[ULDisplayMonitor displayOn](self, "displayOn"));
    -[ULDisplayMonitorEventDisplayState setDisplayOnChanged:](v8, "setDisplayOnChanged:", 1);
    -[ULDisplayMonitorEventDisplayState setScreenLocked:](v8, "setScreenLocked:", -[ULDisplayMonitor screenLocked](self, "screenLocked"));
    -[ULDisplayMonitorEventDisplayState setScreenLockedChanged:](v8, "setScreenLockedChanged:", 1);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_didUpdateDisplayLayout:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  ULDisplayMonitorEventDisplayState *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[ULEventMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = v17;
  if (v17)
  {
    -[ULDisplayMonitor appInFocus](self, "appInFocus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDisplayMonitor _checkAppInFocusFromLayout:](self, "_checkAppInFocusFromLayout:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDisplayMonitor setAppInFocus:](self, "setAppInFocus:", v7);

    -[ULDisplayMonitor appInFocus](self, "appInFocus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {
      v10 = 0;
    }
    else
    {
      -[ULDisplayMonitor appInFocus](self, "appInFocus");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqual:", v9) ^ 1;

    }
    v11 = -[ULDisplayMonitor displayOn](self, "displayOn");
    -[ULDisplayMonitor setDisplayOn:](self, "setDisplayOn:", -[ULDisplayMonitor _checkDisplayOnFromLayout:](self, "_checkDisplayOnFromLayout:", v17));
    v12 = v11 ^ -[ULDisplayMonitor displayOn](self, "displayOn");
    v13 = -[ULDisplayMonitor screenLocked](self, "screenLocked");
    -[ULDisplayMonitor setScreenLocked:](self, "setScreenLocked:", -[ULDisplayMonitor _checkScreenLockedFromLayout:](self, "_checkScreenLockedFromLayout:", v17));
    v14 = v13 ^ -[ULDisplayMonitor screenLocked](self, "screenLocked");
    if ((v10 & 1) != 0 || (v12 & 1) != 0 || (_DWORD)v14)
    {
      v15 = objc_alloc_init(ULDisplayMonitorEventDisplayState);
      -[ULDisplayMonitor appInFocus](self, "appInFocus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULDisplayMonitorEventDisplayState setAppInFocus:](v15, "setAppInFocus:", v16);

      -[ULDisplayMonitorEventDisplayState setAppInFocusChanged:](v15, "setAppInFocusChanged:", v10);
      -[ULDisplayMonitorEventDisplayState setDisplayOn:](v15, "setDisplayOn:", -[ULDisplayMonitor displayOn](self, "displayOn"));
      -[ULDisplayMonitorEventDisplayState setDisplayOnChanged:](v15, "setDisplayOnChanged:", v12);
      -[ULDisplayMonitorEventDisplayState setScreenLocked:](v15, "setScreenLocked:", -[ULDisplayMonitor screenLocked](self, "screenLocked"));
      -[ULDisplayMonitorEventDisplayState setScreenLockedChanged:](v15, "setScreenLockedChanged:", v14);
      -[ULEventMonitor postEvent:](self, "postEvent:", v15);

    }
    v5 = v17;
  }

}

- (id)_checkAppInFocusFromLayout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = 0;
  objc_msgSend(v4, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__ULDisplayMonitor__checkAppInFocusFromLayout___block_invoke;
  v9[3] = &unk_2511D9478;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__ULDisplayMonitor__checkAppInFocusFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v11, "layoutRole") == 1)
  {
    v7 = objc_msgSend(v11, "isUIApplicationElement");

    if (v7)
    {
      objc_msgSend(v11, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }
  else
  {

  }
}

- (BOOL)_checkDisplayOnFromLayout:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "displayBacklightLevel");
  return v6 > 0;
}

- (BOOL)_checkScreenLockedFromLayout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v4, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ULDisplayMonitor__checkScreenLockedFromLayout___block_invoke;
  v8[3] = &unk_2511D9478;
  v8[4] = &v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v6) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v6;
}

void __49__ULDisplayMonitor__checkScreenLockedFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE38278]);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (FBSDisplayLayoutMonitor)displayLayoutMinitor
{
  return self->_displayLayoutMinitor;
}

- (void)setDisplayLayoutMinitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMinitor, a3);
}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (void)setAppInFocus:(id)a3
{
  objc_storeStrong((id *)&self->_appInFocus, a3);
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
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
  objc_storeStrong((id *)&self->_appInFocus, 0);
  objc_storeStrong((id *)&self->_displayLayoutMinitor, 0);
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_84);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_ERROR, "Invalidation called for system handling", v3, 2u);
    }
    objc_msgSend(WeakRetained, "_invalidationHandler");
  }

}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_31(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_screenOnChangedHandler");
    WeakRetained = v2;
  }

}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_clamshellModeChangedHandler");
    WeakRetained = v2;
  }

}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_screenLockedChangedHandler");
    WeakRetained = v2;
  }

}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_activateWithCompletion");
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_84);
    v4 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = v4;
      if (objc_msgSend(v3, "screenOn"))
        v7 = CFSTR("On");
      else
        v7 = CFSTR("Off");
      if (objc_msgSend(v3, "clamshellMode"))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v10 = 138413058;
      if (objc_msgSend(v3, "screenLocked"))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "System monitor activated, Start monitoring: %@, screenOn: %@, clamshellMode: %@, screenLocked: %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

@end
