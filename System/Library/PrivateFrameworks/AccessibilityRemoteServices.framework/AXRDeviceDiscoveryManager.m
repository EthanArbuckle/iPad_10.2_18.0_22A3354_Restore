@implementation AXRDeviceDiscoveryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__Manager;
}

void __43__AXRDeviceDiscoveryManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXRDeviceDiscoveryManager _init]([AXRDeviceDiscoveryManager alloc], "_init");
  v1 = (void *)sharedInstance__Manager;
  sharedInstance__Manager = (uint64_t)v0;

}

- (id)cachedDiscoveredDevices
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__AXRDeviceDiscoveryManager_cachedDiscoveredDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "discoveredDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_observersLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_observersLock);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)_init
{
  AXRDeviceDiscoveryManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *deviceQueue;
  uint64_t v7;
  NSHashTable *observers;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AXRDeviceDiscoveryManager;
  v2 = -[AXRDeviceDiscoveryManager init](&v30, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.AXRemoteServices.DiscoveryDeviceQueue", v4);
    deviceQueue = v2->_deviceQueue;
    v2->_deviceQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.accessibility.switchcontrol"));
    -[AXRDeviceDiscoveryManager setService:](v2, "setService:", v9);

    v10 = -[AXRDeviceDiscoveryManager mineDevices](v2, "mineDevices");
    v11 = (void *)objc_opt_new();
    -[AXRDeviceDiscoveryManager setDiscoveredDevices:](v2, "setDiscoveredDevices:", v11);

    -[AXRDeviceDiscoveryManager setDevicesLock:](v2, "setDevicesLock:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
    -[AXRDeviceDiscoveryManager setCompanionLinkClient:](v2, "setCompanionLinkClient:", v12);

    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAppID:", CFSTR("com.apple.AXRemoteServices.DeviceDiscoveryManager"));

    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setControlFlags:", 0x200000002);

    v15 = v2->_deviceQueue;
    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDispatchQueue:", v15);

    objc_initWeak(&location, v2);
    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDisconnectHandler:", &__block_literal_global_11);

    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInterruptionHandler:", &__block_literal_global_13);

    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInvalidationHandler:", &__block_literal_global_15);

    v20 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __34__AXRDeviceDiscoveryManager__init__block_invoke_16;
    v27[3] = &unk_24D99AC80;
    objc_copyWeak(&v28, &location);
    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceFoundHandler:", v27);

    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __34__AXRDeviceDiscoveryManager__init__block_invoke_2;
    v25[3] = &unk_24D99AC80;
    objc_copyWeak(&v26, &location);
    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceLostHandler:", v25);

    -[AXRDeviceDiscoveryManager companionLinkClient](v2, "companionLinkClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateWithCompletion:", &__block_literal_global_28);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  ax_remote_connection_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_218A93000, v0, OS_LOG_TYPE_INFO, "discovery companion link disconnected", v1, 2u);
  }

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_12()
{
  NSObject *v0;
  uint8_t v1[16];

  ax_remote_connection_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_218A93000, v0, OS_LOG_TYPE_INFO, "discovery companion link interrupted", v1, 2u);
  }

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_14()
{
  NSObject *v0;
  uint8_t v1[16];

  ax_remote_connection_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_218A93000, v0, OS_LOG_TYPE_INFO, "discovery companion link invalidated", v1, 2u);
  }

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  int v18;
  NSObject *WeakRetained;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  unint64_t v31;
  BOOL v32;
  int v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  AXRemoteDevice *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  AXRemoteDevice *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sourceVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ax_remote_connection_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v3, "proximity");
    if (v6 > 19)
    {
      if (v6 == 20)
      {
        v7 = "Near";
        goto LABEL_12;
      }
      if (v6 == 30)
      {
        v7 = "Far";
        goto LABEL_12;
      }
    }
    else
    {
      if (!v6)
      {
        v7 = "Unknown";
        goto LABEL_12;
      }
      if (v6 == 10)
      {
        v7 = "Immed";
LABEL_12:
        *(_DWORD *)buf = 138412802;
        v48 = v3;
        v49 = 2112;
        v50 = v4;
        v51 = 2080;
        v52 = v7;
        _os_log_impl(&dword_218A93000, v5, OS_LOG_TYPE_INFO, "found device: %@ (version: %@), proximity: %s", buf, 0x20u);
        goto LABEL_13;
      }
    }
    v7 = "?";
    goto LABEL_12;
  }
LABEL_13:

  if (!v4)
  {
    v8 = _os_feature_enabled_impl();
    ax_remote_connection_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (!v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218A93000, v9, OS_LOG_TYPE_INFO, "No source version!", buf, 2u);
      }
      goto LABEL_61;
    }
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218A93000, v9, OS_LOG_TYPE_INFO, "Ignoring source version", buf, 2u);
    }

  }
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = -[NSObject count](v9, "count");
  if (v11 < 1)
  {
    v14 = 0;
LABEL_23:
    v17 = (double)v14;
    goto LABEL_24;
  }
  v12 = v11;
  -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 10000 * objc_msgSend(v13, "integerValue");

  if (v12 == 1)
    goto LABEL_23;
  -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (uint64_t)(fmax((double)objc_msgSend(v15, "integerValue"), 99.0) * 100.0 + (double)v14);

  if (v12 <= 2)
    goto LABEL_23;
  -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = fmax((double)objc_msgSend(v16, "integerValue"), 99.0) + (double)v14;

LABEL_24:
  if ((uint64_t)v17 <= 3999999)
  {
    v18 = _os_feature_enabled_impl();
    ax_remote_connection_log();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
    if (!v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218A93000, WeakRetained, OS_LOG_TYPE_INFO, "skipping older source version", buf, 2u);
      }
      goto LABEL_60;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218A93000, WeakRetained, OS_LOG_TYPE_INFO, "Ignoring rapport version", buf, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSObject mineDevices](WeakRetained, "mineDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v22)
  {
    v30 = v21;
    goto LABEL_59;
  }
  v23 = v22;
  v38 = v4;
  v39 = v9;
  v24 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v43 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v3, "idsDeviceIdentifier", v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uniqueIDOverride");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if ((v29 & 1) != 0)
      {
        v30 = v26;

        if (!v30)
        {
          v4 = v38;
          v9 = v39;
          goto LABEL_60;
        }
        v31 = objc_msgSend(v30, "deviceType");
        v32 = v31 > 8 || ((1 << v31) & 0x1E3) == 0;
        v9 = v39;
        if (!v32)
        {
          v33 = _os_feature_enabled_impl();
          ax_remote_connection_log();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (!v33)
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_218A93000, v34, OS_LOG_TYPE_INFO, "skipping unsupported device type", buf, 2u);
            }
            goto LABEL_58;
          }
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218A93000, v34, OS_LOG_TYPE_INFO, "Ignoring unsupported device type", buf, 2u);
          }

        }
        objc_msgSend(v3, "effectiveIdentifier");
        v34 = objc_claimAutoreleasedReturnValue();
        v36 = -[NSObject _indexOfDeviceWithEffectiveIdentifier:](WeakRetained, "_indexOfDeviceWithEffectiveIdentifier:", v34);
        v37 = -[AXRemoteDevice initWithDevice:]([AXRemoteDevice alloc], "initWithDevice:", v3);
        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = WeakRetained;
          v41 = v37;
          AX_PERFORM_WITH_LOCK();
          -[NSObject _discoveredDevicesChanged](v40, "_discoveredDevicesChanged");

        }
LABEL_58:
        v4 = v38;

        goto LABEL_59;
      }
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v23)
      continue;
    break;
  }
  v30 = v21;
  v4 = v38;
  v9 = v39;
LABEL_59:

LABEL_60:
LABEL_61:

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_23(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "discoveredDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ax_remote_connection_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_218A93000, v4, OS_LOG_TYPE_INFO, "lost device: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "effectiveIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "_indexOfDeviceWithEffectiveIdentifier:", v6) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = WeakRetained;
    AX_PERFORM_WITH_LOCK();
    objc_msgSend(v8, "_discoveredDevicesChanged", v7, 3221225472, __34__AXRDeviceDiscoveryManager__init__block_invoke_25, &unk_24D99ACA8);

  }
}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_25(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "discoveredDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));

}

void __34__AXRDeviceDiscoveryManager__init__block_invoke_2_26(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  ax_remote_connection_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_218A93000, v3, OS_LOG_TYPE_INFO, "activated discovery companion link with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)mineDevices
{
  void *v2;
  void *v3;

  -[AXRDeviceDiscoveryManager service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkedDevicesWithRelationship:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_indexOfDeviceWithEffectiveIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AXRDeviceDiscoveryManager discoveredDevices](self, "discoveredDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__AXRDeviceDiscoveryManager__indexOfDeviceWithEffectiveIdentifier___block_invoke;
  v9[3] = &unk_24D99AD10;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __67__AXRDeviceDiscoveryManager__indexOfDeviceWithEffectiveIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)_discoveredDevicesChanged
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[AXRDeviceDiscoveryManager cachedDiscoveredDevices](self, "cachedDiscoveredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke;
  v5[3] = &unk_24D99AC58;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke_2;
  v2[3] = &unk_24D99AD38;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_enumerateObservers:", v2);

}

uint64_t __54__AXRDeviceDiscoveryManager__discoveredDevicesChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceDiscoveryManager:updatedDevices:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (NSMutableArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (void)setDiscoveredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredDevices, a3);
}

- (os_unfair_lock_s)devicesLock
{
  return self->_devicesLock;
}

- (void)setDevicesLock:(os_unfair_lock_s)a3
{
  self->_devicesLock = a3;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceQueue, 0);
}

@end
