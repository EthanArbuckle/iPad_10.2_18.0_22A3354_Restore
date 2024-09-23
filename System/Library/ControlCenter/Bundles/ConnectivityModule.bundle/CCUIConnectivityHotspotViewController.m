@implementation CCUIConnectivityHotspotViewController

- (CCUIConnectivityHotspotViewController)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CCUIConnectivityHotspotViewController *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("HotspotGlyph"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemGreenColor(MEMORY[0x24BDF6950], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)CCUIConnectivityHotspotViewController;
  v13 = -[CCUIConnectivityButtonViewController initWithGlyphImage:highlightColor:](&v23, sel_initWithGlyphImage_highlightColor_, v9, v12);

  if (v13)
  {
    v14 = dispatch_queue_create("com.apple.ControlCenter.HotspotViewController", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_msgSend_sharedInstance(CCUIConnectivityManager, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hotspotStateMonitor(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_phStateMonitor, v21);

  }
  return v13;
}

- (id)displayName
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.Hotspot");
}

- (id)subtitleText
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int isEnabled;
  void *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  int isDiscoverable;
  void *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;

  v4 = objc_msgSend_connections(self, a2, v2);
  if (!objc_msgSend_isAvailable(self, v5, v6))
  {
    isEnabled = objc_msgSend_isEnabled(self, v7, v8);
    v18 = (void *)MEMORY[0x24BDD1488];
    v19 = objc_opt_class();
    objc_msgSend_bundleForClass_(v18, v20, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (isEnabled)
      objc_msgSend_localizedStringForKey_value_table_(v14, v21, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_ON"), &stru_24FFCAEF8, 0);
    else
      objc_msgSend_localizedStringForKey_value_table_(v14, v21, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_OFF"), &stru_24FFCAEF8, 0);
    goto LABEL_10;
  }
  if (!(_DWORD)v4)
  {
    isDiscoverable = objc_msgSend_isDiscoverable(self, v7, v8);
    v23 = (void *)MEMORY[0x24BDD1488];
    v24 = objc_opt_class();
    objc_msgSend_bundleForClass_(v23, v25, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (isDiscoverable)
      objc_msgSend_localizedStringForKey_value_table_(v14, v26, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_DISCOVERABLE"), &stru_24FFCAEF8, 0);
    else
      objc_msgSend_localizedStringForKey_value_table_(v14, v26, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_UNDISCOVERABLE"), &stru_24FFCAEF8, 0);
LABEL_10:
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = objc_opt_class();
  objc_msgSend_bundleForClass_(v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_HOTSPOT_CONNECTIONS"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_localizedStringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)v14, v4);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v27 = (void *)v16;

  return v27;
}

- (void)buttonTapped:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend__toggleState(self, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityHotspotViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v7, sel_buttonTapped_, v4);

}

+ (BOOL)isSupported
{
  return MGGetBoolAnswer();
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityHotspotViewController;
  -[CCUIConnectivityHotspotViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateDiscoverability(self, v6, v7);
  objc_msgSend__updateState(self, v8, v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id WeakRetained;
  const char *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCUIConnectivityHotspotViewController;
  -[CCUIConnectivityHotspotViewController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
  if (objc_msgSend_isDiscoverable(self, v6, v7))
  {
    v8 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_230FA3000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Stopping hotspot discoverability after delay", v11, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
    objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v10, 0, 0);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_toggleState
{
  uint64_t v2;
  char isEnabled;
  const char *v5;
  uint64_t v6;
  os_log_t *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  int isDiscoverable;
  NSObject *v17;
  _BOOL4 v18;
  id WeakRetained;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  isEnabled = objc_msgSend_isEnabled(self, a2, v2);
  v7 = (os_log_t *)MEMORY[0x24BE19AA0];
  if ((isEnabled & 1) == 0)
  {
    v8 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230FA3000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot service", buf, 2u);
    }
    objc_msgSend__setGlobalServiceState_(self, v9, 1023);
  }
  if (objc_msgSend_connections(self, v5, v6))
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_230FA3000, v12, OS_LOG_TYPE_DEFAULT, "[Hotspot] Stopping hotspot service", v27, 2u);
    }
    objc_msgSend__setGlobalServiceState_(self, v13, 1022);
  }
  else
  {
    isDiscoverable = objc_msgSend_isDiscoverable(self, v10, v11);
    v17 = *v7;
    v18 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
    if (isDiscoverable)
    {
      if (v18)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_230FA3000, v17, OS_LOG_TYPE_DEFAULT, "[Hotspot] Shutting down hotspot discoverability immediately", v26, 2u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
      objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v20, 0, 1);
    }
    else
    {
      if (v18)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_230FA3000, v17, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot discoverability", v25, 2u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
      objc_msgSend_setMISDiscoveryState_immediateDisable_(WeakRetained, v21, 1, 0);
    }

  }
  objc_msgSend__updateDiscoverability(self, v14, v15);
  objc_msgSend__updateState(self, v22, v23);
  return 1;
}

- (void)_setGlobalServiceState:(int)a3
{
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  int v10;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_queue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FB18C0;
  block[3] = &unk_24FFCACA0;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  dispatch_async(v7, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)_updateDiscoverability
{
  id WeakRetained;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_phStateMonitor);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FB1A44;
  v5[3] = &unk_24FFCACF0;
  objc_copyWeak(&v6, &location);
  objc_msgSend_asyncMISDiscoveryState_(WeakRetained, v4, (uint64_t)v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateState
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  v3 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230FA3000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Updating state...", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  objc_msgSend_queue(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FB1CC0;
  block[3] = &unk_24FFCAB28;
  objc_copyWeak(&v8, buf);
  dispatch_async(v6, block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
}

- (BOOL)_isHotspotRestricted
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isPersonalHotspotModificationAllowed;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isPersonalHotspotModificationAllowed = objc_msgSend_isPersonalHotspotModificationAllowed(v3, v4, v5);

  return isPersonalHotspotModificationAllowed ^ 1;
}

- (void)_networkTetheringStateChanged
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230FA3000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Network tethering state changed", v6, 2u);
  }
  objc_msgSend__updateState(self, v4, v5);
}

- (void)_hostAPStateChanged
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230FA3000, v3, OS_LOG_TYPE_DEFAULT, "[Hotspot] Host AP state changed", v6, 2u);
  }
  objc_msgSend__updateDiscoverability(self, v4, v5);
}

- (void)startObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCUIConnectivityHotspotViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v12, sel_startObservingStateChanges);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)self, sel__networkTetheringStateChanged, *MEMORY[0x24BEB0F10], 0);
  objc_msgSend_addObserver_selector_name_object_(v5, v7, (uint64_t)self, sel__hostAPStateChanged, *MEMORY[0x24BEC2900], 0);
  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v10, v11, (uint64_t)self);

}

- (void)stopObservingStateChanges
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityHotspotViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v11, sel_stopObservingStateChanges);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self);

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v9, v10, (uint64_t)self);

}

- (WFPersonalHotspotStateMonitor)phStateMonitor
{
  return (WFPersonalHotspotStateMonitor *)objc_loadWeakRetained((id *)&self->_phStateMonitor);
}

- (void)setPhStateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_phStateMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)isDiscoverable
{
  return self->_discoverable;
}

- (void)setDiscoverable:(BOOL)a3
{
  self->_discoverable = a3;
}

- (unsigned)connections
{
  return self->_connections;
}

- (void)setConnections:(unsigned int)a3
{
  self->_connections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_phStateMonitor);
}

@end
