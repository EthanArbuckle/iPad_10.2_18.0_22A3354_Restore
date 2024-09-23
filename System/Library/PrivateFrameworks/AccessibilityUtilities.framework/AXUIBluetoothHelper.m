@implementation AXUIBluetoothHelper

+ (int)lastInitError
{
  return _lastInitError;
}

- (BOOL)available
{
  return self->_available == 2;
}

- (AXUIBluetoothHelper)init
{
  AXUIBluetoothHelper *v2;
  AXUIBluetoothHelper *v3;
  uint64_t v4;
  NSMutableDictionary *discoveredDevices;
  id v6;
  void *v7;
  void *v8;
  AXUIBluetoothHelper *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXUIBluetoothHelper;
  v2 = -[AXUIBluetoothHelper init](&v11, sel_init);
  v3 = v2;
  if (v2 && !-[AXUIBluetoothHelper attach:](v2, "attach:", &unk_1E24F79D0))
  {
    v3->_authorizedServices = 0;
    -[AXUIBluetoothHelper _cleanup:](v3, "_cleanup:", 1);
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    discoveredDevices = v3->_discoveredDevices;
    v3->_discoveredDevices = (NSMutableDictionary *)v4;

    v6 = objc_alloc(MEMORY[0x1E0C97728]);
    v7 = (void *)objc_msgSend(v6, "initWithDelegate:queue:options:", v3, MEMORY[0x1E0C80D38], 0);
    -[AXUIBluetoothHelper setCentralManager:](v3, "setCentralManager:", v7);

    -[CBCentralManager sharedPairingAgent](v3->_centralManager, "sharedPairingAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v3);

    v9 = v3;
  }

  return v9;
}

- (id)discoveredDevices
{
  return (id)-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues");
}

- (BOOL)attach:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "integerValue") >= 1)
  {
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = objc_msgSend(v4, "intValue");
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: attemping to re-attach in %d seconds", buf, 8u);
    }

    -[AXUIBluetoothHelper performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_attach_, 0, (double)(int)objc_msgSend(v4, "intValue"));
    goto LABEL_6;
  }
  if (self->_available)
  {
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  AXLogBluetooth();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: attaching to BTServer", buf, 2u);
  }

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("VOBTM%@-%u"), v11, getpid());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  objc_msgSend(v13, "cStringUsingEncoding:", 4);
  v14 = BTSessionAttachWithQueue();
  AXLogBluetooth();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v14;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTSessionAttachWithRunLoopAsync failed with error %d", buf, 8u);
    }

    _lastInitError = v14;
    v6 = 0;
  }
  else
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: Did request attach to session with id: %@. result:%@", buf, 0x16u);

    }
    v6 = 1;
    self->_available = 1;

  }
LABEL_7:

  return v6;
}

- (BOOL)_setup:(BTSessionImpl *)a3
{
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int Default;
  int v9;
  BOOL v10;
  NSMutableDictionary *v12;
  NSMutableDictionary *btAddrDict;
  NSMutableDictionary *v14;
  NSMutableDictionary *btDeviceDict;
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_session = a3;
  v4 = BTServiceAddCallbacks();
  if (v4)
  {
    v5 = v4;
    AXLogBluetooth();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109120;
      v17 = v5;
      v7 = "VOTBTM: BTServiceAddCallbacks failed with error %d";
LABEL_10:
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 8u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    v5 = Default;
    AXLogBluetooth();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109120;
      v17 = v5;
      v7 = "VOTBTM: BTLocalDeviceGetDefault failed with error %d";
      goto LABEL_10;
    }
LABEL_11:

    v10 = 0;
    _lastInitError = v5;
    return v10;
  }
  v9 = BTLocalDeviceAddCallbacks();
  if (v9)
  {
    v5 = v9;
    AXLogBluetooth();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109120;
      v17 = v5;
      v7 = "VOTBTM: BTLocalDeviceAddCallbacks failed with %d";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v12 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
  btAddrDict = self->_btAddrDict;
  self->_btAddrDict = v12;

  v14 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = v14;

  _lastInitError = 0;
  self->_available = 2;
  if (self->_wantsScanningEnabled)
    -[AXUIBluetoothHelper setDeviceScanningEnabled:](self, "setDeviceScanningEnabled:", 1);
  v10 = 1;
  if (self->_wantsDiscoveryEnabled)
    -[AXUIBluetoothHelper setDevicePairingEnabled:](self, "setDevicePairingEnabled:", 1);
  return v10;
}

- (void)resetDeviceScanning
{
  BTDiscoveryAgentImpl **p_discoveryAgent;

  p_discoveryAgent = &self->_discoveryAgent;
  if (self->_discoveryAgent)
  {
    BTDiscoveryAgentDestroy();
    *p_discoveryAgent = 0;
  }
}

- (BOOL)deviceScanningEnabled
{
  return self->_scanningEnabled;
}

- (void)setDeviceScanningEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (self->_session)
  {
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "disabled";
      if (v3)
        v6 = "enabled";
      v9 = 136446210;
      v10 = v6;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting device scanning %{public}s", (uint8_t *)&v9, 0xCu);
    }

    -[AXUIBluetoothHelper _setDiscoveryAgentScanning:](self, "_setDiscoveryAgentScanning:", v3);
    v7 = 0;
    self->_scanningEnabled = v3;
  }
  else
  {
    if (!a3)
      return;
    AXLogBluetooth();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: attempted to start scanning, but there is not yet an active session", (uint8_t *)&v9, 2u);
    }

    v7 = 1;
  }
  self->_wantsScanningEnabled = v7;
}

- (void)_setDiscoveryAgentScanning:(BOOL)a3
{
  BTDiscoveryAgentImpl *discoveryAgent;
  BTDiscoveryAgentImpl **p_discoveryAgent;
  int started;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_session)
  {
    p_discoveryAgent = &self->_discoveryAgent;
    discoveryAgent = self->_discoveryAgent;
    if (a3)
    {
      if (!discoveryAgent)
      {
        v12 = BTDiscoveryAgentCreate();
        if (v12)
        {
          v13 = v12;
          AXLogBluetooth();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v14 = 67109120;
            v15 = v13;
            v9 = "VOTBTM: discovery agent creation failed with error %d";
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
      started = BTDiscoveryAgentStartScan();
      if (started)
      {
        v7 = started;
        AXLogBluetooth();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 67109120;
          v15 = v7;
          v9 = "VOTBTM: failed to start scanning with error %d";
LABEL_19:
          _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 8u);
        }
LABEL_20:

        return;
      }
    }
    else if (discoveryAgent)
    {
      AXLogBluetooth();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "VOTBTM: stopping discovery agent", (uint8_t *)&v14, 2u);
      }

      BTDiscoveryAgentStopScan();
      BTDiscoveryAgentDestroy();
      *p_discoveryAgent = 0;
    }
    self->_wantsDiscoveryEnabled = 0;
    return;
  }
  if (a3)
  {
    AXLogBluetooth();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_DEFAULT, "VOTBTM: Could not enable DiscoveryAgentScanning. session is nil", (uint8_t *)&v14, 2u);
    }

    self->_wantsDiscoveryEnabled = 1;
  }
}

- (void)_restartScan
{
  int started;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_scanningEnabled)
  {
    -[AXUIBluetoothHelper _setDiscoveryAgentScanning:](self, "_setDiscoveryAgentScanning:", 0);
    -[AXUIBluetoothHelper _setDiscoveryAgentScanning:](self, "_setDiscoveryAgentScanning:", 1);
    started = BTDiscoveryAgentStartScan();
    if (started)
    {
      v4 = started;
      AXLogBluetooth();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to restart scanning with error %d", (uint8_t *)v6, 8u);
      }

      self->_scanningEnabled = 0;
    }
  }
}

- (void)_cleanup:(BOOL)a3
{
  NSMutableDictionary *btAddrDict;
  NSMutableDictionary *btDeviceDict;
  NSObject *v6;
  int v7;
  AXUIBluetoothHelper *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_available = 0;
  if (!a3)
  {
    if (self->_discoveryAgent)
    {
      BTDiscoveryAgentStopScan();
      BTDiscoveryAgentDestroy();
    }
    if (self->_pairingAgent)
    {
      BTPairingAgentStop();
      BTPairingAgentDestroy();
    }
    if (self->_localDevice)
      BTLocalDeviceRemoveCallbacks();
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      BTSessionDetachWithQueue();
    }
  }
  *(_WORD *)&self->_audioConnected = 0;
  self->_localDevice = 0;
  self->_session = 0;
  self->_discoveryAgent = 0;
  self->_pairingAgent = 0;
  btAddrDict = self->_btAddrDict;
  self->_btAddrDict = 0;

  btDeviceDict = self->_btDeviceDict;
  self->_btDeviceDict = 0;

  AXLogBluetooth();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up BT helper: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedPairingAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[AXUIBluetoothHelper _cleanup:](self, "_cleanup:", 0);
  v6.receiver = self;
  v6.super_class = (Class)AXUIBluetoothHelper;
  -[AXUIBluetoothHelper dealloc](&v6, sel_dealloc);
}

- (void)_postNotificationWithArray:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "count");
  if (!v4)
  {
    v6 = 0;
    v5 = &stru_1E24CAB08;
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectAtIndex:", 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v4 >= 3)
    {
      objc_msgSend(v3, "objectAtIndex:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, CFSTR("VOSBluetoothErrorKey"), v5, CFSTR("VOSBluetoothNotificationNameKey"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  v4 = 0;
LABEL_8:
  AXLogBluetooth();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: posting notification %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v5, v6, v4);

}

- (void)_postNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogBluetooth();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: posting notification %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v4, self);

}

- (void)postNotification:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __40__AXUIBluetoothHelper_postNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotification:", *(_QWORD *)(a1 + 40));
}

- (void)postNotificationName:(id)a3 object:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = v5;
    v9 = v7;
    AXPerformBlockAsynchronouslyOnMainThread();

  }
}

void __51__AXUIBluetoothHelper_postNotificationName_object___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[6];
  v4[0] = a1[5];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_postNotificationWithArray:", v3);

}

- (void)postNotificationName:(id)a3 object:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    v11 = v7;
    v12 = v8;
    v13 = v10;
    AXPerformBlockAsynchronouslyOnMainThread();

  }
}

void __57__AXUIBluetoothHelper_postNotificationName_object_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_postNotificationWithArray:", v2);

}

- (int64_t)powerState
{
  int64_t result;

  result = (int64_t)self->_localDevice;
  if (result)
  {
    BTLocalDeviceGetModulePower();
    return 0;
  }
  return result;
}

- (BOOL)powered
{
  return -[AXUIBluetoothHelper powerState](self, "powerState") == 2;
}

- (BOOL)setPowered:(BOOL)a3
{
  BTLocalDeviceImpl *localDevice;
  _BOOL4 v5;
  int v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    v5 = a3;
    v6 = BTLocalDeviceSetModulePower();
    if (v6)
    {
      v7 = v6;
      AXLogBluetooth();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("OFF");
        if (v5)
          v9 = CFSTR("ON");
        v11 = 138543618;
        v12 = v9;
        v13 = 1024;
        v14 = v7;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "VOBTM: BTLocalDeviceSetModulePower with power %{public}@ failed with error %d", (uint8_t *)&v11, 0x12u);
      }

      LOBYTE(localDevice) = 0;
    }
    else
    {
      -[AXUIBluetoothHelper postNotification:](self, "postNotification:", CFSTR("VOSBluetoothPowerChangedNotification"));
      LOBYTE(localDevice) = 1;
    }
  }
  return (char)localDevice;
}

- (void)_powerChanged
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (-[AXUIBluetoothHelper powerState](self, "powerState") != 1)
  {
    -[AXUIBluetoothHelper postNotification:](self, "postNotification:", CFSTR("VOSBluetoothPowerChangedNotification"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.bluetooth.power-changed"), 0, 0, 1u);
  }
}

- (BOOL)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!a3)
    -[AXUIBluetoothHelper setDeviceScanningEnabled:](self, "setDeviceScanningEnabled:", 0);
  return -[AXUIBluetoothHelper setPowered:](self, "setPowered:", v3);
}

- (BOOL)btleDeviceIsPaired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedPairingAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isPeerPaired:", v7);
  return (char)v4;
}

- (void)unpairBTLEDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogBluetooth();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "Unpairing BTLE device: %@", (uint8_t *)&v9, 0xCu);
  }

  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedPairingAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unpairPeer:", v8);

}

- (BOOL)unpairDevice:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_pairingAgent)
      -[AXUIBluetoothHelper setDevicePairingEnabled:](self, "setDevicePairingEnabled:", 1);
    -[AXUIBluetoothHelper cancelPairing](self, "cancelPairing");
    objc_msgSend(v4, "device");
    v5 = BTPairingAgentDeletePairedDevice();
    if (!v5)
    {
      v8 = 1;
      goto LABEL_10;
    }
    v6 = v5;
    AXLogBluetooth();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v4;
      v12 = 1024;
      v13 = v6;
      _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to unpair from device %{public}@ with error %d", (uint8_t *)&v10, 0x12u);
    }

  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)devicePairingEnabled
{
  return self->_pairingAgent != 0;
}

- (void)setDevicePairingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  BTPairingAgentImpl *pairingAgent;
  BTPairingAgentImpl **p_pairingAgent;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  AXLogBluetooth();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "disabled";
    if (v3)
      v6 = "enabled";
    v18 = 136446210;
    v19 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: trying setting device pairing %{public}s", (uint8_t *)&v18, 0xCu);
  }

  if (!self->_session || -[AXUIBluetoothHelper devicePairingEnabled](self, "devicePairingEnabled") == v3)
  {
    self->_wantsDiscoveryEnabled = 1;
    return;
  }
  AXLogBluetooth();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "disabled";
    if (v3)
      v8 = "enabled";
    v18 = 136446210;
    v19 = v8;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting device pairing %{public}s", (uint8_t *)&v18, 0xCu);
  }

  p_pairingAgent = &self->_pairingAgent;
  pairingAgent = self->_pairingAgent;
  if (!v3)
  {
    if (!pairingAgent)
      return;
    AXLogBluetooth();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_DEFAULT, "VOTBTM: stopping pairing agent", (uint8_t *)&v18, 2u);
    }

    BTPairingAgentStop();
LABEL_22:
    BTPairingAgentDestroy();
    *p_pairingAgent = 0;
    return;
  }
  if (!pairingAgent)
  {
    v15 = BTPairingAgentCreate();
    if (v15)
    {
      v16 = v15;
      AXLogBluetooth();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109120;
        LODWORD(v19) = v16;
        _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_DEFAULT, "VOTBTM: pairing agent creation failed with error %d", (uint8_t *)&v18, 8u);
      }

      return;
    }
  }
  v11 = BTPairingAgentStart();
  AXLogBluetooth();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v18 = 67109120;
      LODWORD(v19) = v11;
      _os_log_impl(&dword_18C62B000, v12, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to start pairing agent with error %d", (uint8_t *)&v18, 8u);
    }

    goto LABEL_22;
  }
  if (v13)
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_18C62B000, v12, OS_LOG_TYPE_DEFAULT, "VOTBTM: started pairing agent ", (uint8_t *)&v18, 2u);
  }

}

- (void)cancelPairing
{
  int v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_pairingAgent)
  {
    v2 = BTPairingAgentCancelPairing();
    if (v2)
    {
      v3 = v2;
      AXLogBluetooth();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v3;
        _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to cancel pairing with error %d", (uint8_t *)v5, 8u);
      }

    }
  }
}

- (id)deviceForPeripheral:(id)a3
{
  id v4;
  NSMutableDictionary *btleDevices;
  void *v6;
  void *v7;
  AXUIBluetoothDevice *v8;
  NSMutableDictionary *v9;
  void *v10;
  AXUIBluetoothDevice *v11;

  v4 = a3;
  btleDevices = self->_btleDevices;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](btleDevices, "objectForKey:", v7);
  v8 = (AXUIBluetoothDevice *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[AXUIBluetoothDevice initWithPeripheral:helper:]([AXUIBluetoothDevice alloc], "initWithPeripheral:helper:", v4, self);
    v9 = self->_btleDevices;
    -[AXUIBluetoothDevice identifier](v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  v11 = v8;

  return v11;
}

- (BOOL)isPairedDeviceBrailleDisplay:(id)a3
{
  return 0;
}

- (NSArray)pairedBTLEDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[AXUIBluetoothHelper centralManager](self, "centralManager", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (!v13 || (objc_msgSend(v13, "containsString:", CFSTR("Apple Pencil")) & 1) == 0)
          {
            -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15
              && (objc_msgSend(v3, "containsObject:", v15) & 1) == 0
              && -[AXUIBluetoothHelper isPairedDeviceBrailleDisplay:](self, "isPairedDeviceBrailleDisplay:", v15))
            {
              objc_msgSend(v3, "addObject:", v15);
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  return (NSArray *)v3;
}

- (id)pairedDevices
{
  void *v3;
  int PairedDevices;
  NSObject *v5;
  _BOOL4 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localDevice)
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    PairedDevices = BTLocalDeviceGetPairedDevices();
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (PairedDevices)
    {
      if (v6)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = PairedDevices;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to get paired devices with error %d", buf, 8u);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      v42 = v40;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetPairedDevices returned %zd devices", buf, 0xCu);
    }

  }
  return v3;
}

- (void)setPincode:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  AXLogBluetooth();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting pincode %{public}@ for device %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    objc_msgSend(v6, "device");
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    BTPairingAgentSetPincode();
  }
  else
  {
    BTPairingAgentCancelPairing();
  }

}

- (BOOL)isAnyoneScanning
{
  BTLocalDeviceImpl *localDevice;
  uint64_t Scanning;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  localDevice = self->_localDevice;
  if (localDevice)
  {
    Scanning = BTLocalDeviceGetScanning();
    if ((_DWORD)Scanning)
    {
      v4 = Scanning;
      AXLogBluetooth();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AXUIBluetoothHelper isAnyoneScanning].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (BOOL)isDiscoverable
{
  BTLocalDeviceImpl *localDevice;
  int Discoverable;
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    Discoverable = BTLocalDeviceGetDiscoverable();
    if (Discoverable)
    {
      v4 = Discoverable;
      AXLogBluetooth();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = v4;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetDiscoverable returned error %d", buf, 8u);
      }

    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)setDiscoverable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_localDevice)
  {
    v3 = a3;
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "disabled";
      if (v3)
        v6 = "enabled";
      v7 = 136446210;
      v8 = v6;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting discoverable status %{public}s", (uint8_t *)&v7, 0xCu);
    }

    if (!BTLocalDeviceSetDiscoverable())
      -[AXUIBluetoothHelper setDevicePairingEnabled:](self, "setDevicePairingEnabled:", v3);
  }
}

- (BOOL)wasDeviceDiscovered:(id)a3
{
  id v3;
  NSObject *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  if (!BTDiscoveryAgentGetDevices())
  {
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v39 = 0;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTDiscoveryAgentGetDevices returned %zd devices", buf, 0xCu);
    }

  }
  return 0;
}

- (id)addDeviceIfNeeded:(BTDeviceImpl *)a3
{
  NSMutableDictionary *btDeviceDict;
  void *v6;
  BTDeviceImpl *v7;
  void *v8;
  BTDeviceImpl *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSObject *v14;
  int v15;
  BTDeviceImpl *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  btDeviceDict = self->_btDeviceDict;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](btDeviceDict, "objectForKey:", v6);
  v7 = (BTDeviceImpl *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_2:
    v8 = 0;
    goto LABEL_3;
  }
  VOSAddressForBTDevice();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_btAddrDict, "objectForKey:", v8);
  v10 = (BTDeviceImpl *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v7 = v10;
    if ((BTDeviceImpl *)-[BTDeviceImpl device](v10, "device") != a3)
      -[BTDeviceImpl setDevice:](v7, "setDevice:", a3);
  }
  else
  {
    if (!v8)
    {
      AXLogBluetooth();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134217984;
        v16 = a3;
        _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_DEFAULT, "VOTBTM: Failed to retrieve address for BTDevice %p. VOSBluetoothManager may be thoroughly confused.", (uint8_t *)&v15, 0xCu);
      }

      v7 = 0;
      goto LABEL_2;
    }
    v7 = (BTDeviceImpl *)objc_msgSend(objc_allocWithZone((Class)AXUIBluetoothDevice), "initWithDevice:address:helper:", a3, v8, self);
    AXLogBluetooth();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "VOTBTM: Adding new device %{public}@", (uint8_t *)&v15, 0xCu);
    }

    -[NSMutableDictionary setObject:forKey:](self->_btAddrDict, "setObject:forKey:", v7, v8);
    v12 = self->_btDeviceDict;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v7, v13);

  }
LABEL_3:

  return v7;
}

- (void)acceptSSP:(int)a3 forDevice:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AXLogBluetooth();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = a3;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: accepting SSP with error code %ld for device %{public}@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v5, "device");
  v7 = BTPairingAgentAcceptSSP();
  if (v7)
  {
    v8 = v7;
    AXLogBluetooth();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109120;
      LODWORD(v11) = v8;
      _os_log_impl(&dword_18C62B000, v9, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTPairingAgentAcceptSSP returned error %d", (uint8_t *)&v10, 8u);
    }

  }
}

- (BOOL)connectAddress:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  AXUIBluetoothHelper *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    AXLogBluetooth();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[AXUIBluetoothHelper discoveredDevices](self, "discoveredDevices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "%@ Could not find device with address: %@ %@", (uint8_t *)&v9, 0x20u);

    }
  }
  -[AXUIBluetoothHelper connectDevice:](self, "connectDevice:", v5);

  return 1;
}

- (BOOL)disconnectAddress:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXUIBluetoothHelper disconnectDevice:](self, "disconnectDevice:", v4);
  }
  else
  {
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "Could not find device with address, making new one", v7, 2u);
    }

  }
  return v4 != 0;
}

- (BOOL)disconnectDevice:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isBTLEDevice");
  AXLogBluetooth();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: Disconnecting periperhal: %@", (uint8_t *)&v13, 0xCu);
    }

    -[AXUIBluetoothHelper centralManager](self, "centralManager");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peripheral");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cancelPeripheralConnection:options:](v8, "cancelPeripheralConnection:options:", v9, 0);

  }
  else
  {
    if (v7)
    {
      v13 = 138543362;
      v14 = v4;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_DEFAULT, "VOTBTM: disconnecting services to device %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v4, "device");
    v10 = BTDeviceDisconnect();
    if (!v10)
    {
      LOBYTE(v5) = 1;
      goto LABEL_11;
    }
    v11 = v10;
    AXLogBluetooth();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = v4;
      v15 = 1024;
      v16 = v11;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "VOTBTM: disconnecting to device %{public}@ failed with error %d", (uint8_t *)&v13, 0x12u);
    }
  }

LABEL_11:
  return v5;
}

- (BOOL)connectDevice:(id)a3 withServices:(unsigned int)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  CBCentralManager *centralManager;
  NSObject *v15;
  NSObject *v16;
  int v17;
  int v18;
  int v20;
  _BYTE v21[14];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "isBTLEDevice");
  if (!v7)
  {
    AXLogBluetooth();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109378;
      *(_DWORD *)v21 = a4;
      *(_WORD *)&v21[4] = 2114;
      *(_QWORD *)&v21[6] = v6;
      _os_log_impl(&dword_18C62B000, v16, OS_LOG_TYPE_DEFAULT, "VOTBTM: connecting services 0x%08x to device %{public}@", (uint8_t *)&v20, 0x12u);
    }

    objc_msgSend(v6, "device");
    v17 = BTDeviceConnectServices();
    if (v17)
    {
      v18 = v17;
      AXLogBluetooth();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        *(_QWORD *)v21 = v6;
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)&v21[10] = v18;
        _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "VOTBTM: connecting to device %{public}@ failed with error %d", (uint8_t *)&v20, 0x12u);
      }
      goto LABEL_13;
    }
LABEL_14:
    LOBYTE(v7) = 1;
    goto LABEL_15;
  }
  AXLogBrailleHW();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "peripheral");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    *(_QWORD *)v21 = v9;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "Attempt connect: Current peripheral state: %@", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend(v6, "peripheral");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isConnectedToSystem");

  if ((v11 & 1) != 0)
    goto LABEL_14;
  AXLogBrailleHW();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "peripheral");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    *(_QWORD *)v21 = v13;
    _os_log_impl(&dword_18C62B000, v12, OS_LOG_TYPE_DEFAULT, "Connecting: %@", (uint8_t *)&v20, 0xCu);

  }
  centralManager = self->_centralManager;
  objc_msgSend(v6, "peripheral");
  v15 = objc_claimAutoreleasedReturnValue();
  -[CBCentralManager connectPeripheral:options:](centralManager, "connectPeripheral:options:", v15, 0);
LABEL_13:

LABEL_15:
  return v7;
}

- (BOOL)connectDevice:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[AXUIBluetoothHelper connectDevice:withServices:](self, "connectDevice:withServices:", v4, -[AXUIBluetoothHelper authorizedServices](self, "authorizedServices"));

  return (char)self;
}

- (BOOL)connectable
{
  BTLocalDeviceImpl *localDevice;
  int Connectable;
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    Connectable = BTLocalDeviceGetConnectable();
    if (Connectable)
    {
      v4 = Connectable;
      AXLogBluetooth();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = v4;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "BT: BTLocalDeviceGetConnectable returned error %d", buf, 8u);
      }

    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)setConnectable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_localDevice)
  {
    v3 = a3;
    AXLogBluetooth();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "disabled";
      if (v3)
        v5 = "enabled";
      v6 = 136446210;
      v7 = v5;
      _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: setting connectable status %{public}s", (uint8_t *)&v6, 0xCu);
    }

    BTLocalDeviceSetConnectable();
  }
}

- (id)connectingDevices
{
  void *v3;
  int ConnectingDevices;
  NSObject *v5;
  _BOOL4 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localDevice)
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    ConnectingDevices = BTLocalDeviceGetConnectingDevices();
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (ConnectingDevices)
    {
      if (v6)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = ConnectingDevices;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: failed to get connecting devices with error %d", buf, 8u);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      v42 = v40;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetConnectingDevices returned %zd devices", buf, 0xCu);
    }

  }
  return v3;
}

- (BOOL)_onlySensorsConnected
{
  int ConnectedDevices;
  int v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_localDevice)
    return 0;
  ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    v3 = ConnectedDevices;
    AXLogBluetooth();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v3;
      _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "VOTBTM: BTLocalDeviceGetConnectedDevices failed with error %d", buf, 8u);
    }

  }
  return 0;
}

- (BOOL)connected
{
  BTLocalDeviceImpl *localDevice;
  int ConnectionStatus;
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  localDevice = self->_localDevice;
  if (localDevice)
  {
    ConnectionStatus = BTLocalDeviceGetConnectionStatus();
    if (ConnectionStatus)
    {
      v4 = ConnectionStatus;
      AXLogBluetooth();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = v4;
        _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOBTM: BTLocalDeviceGetConnectionStatus failed with error %d", buf, 8u);
      }

    }
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (void)_connectedStatusChanged
{
  -[AXUIBluetoothHelper postNotification:](self, "postNotification:", CFSTR("VOSBluetoothConnectionStatusChangedNotification"));
}

- (void)_connectabilityChanged
{
  -[AXUIBluetoothHelper postNotification:](self, "postNotification:", CFSTR("VOSBluetoothConnectabilityChangedNotification"));
}

- (BOOL)audioConnected
{
  return self->_audioConnected;
}

- (void)setAudioConnected:(BOOL)a3
{
  self->_audioConnected = a3;
}

- (void)_discoveryStateChanged
{
  -[AXUIBluetoothHelper postNotification:](self, "postNotification:", CFSTR("VOSBluetoothDiscoveryStateChangedNotification"));
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  BTLocalDeviceImpl *localDevice;

  localDevice = self->_localDevice;
  if (localDevice)
  {
    BTLocalDeviceSupportsService();
    LOBYTE(localDevice) = 0;
  }
  return (char)localDevice;
}

- (unsigned)authorizedServicesForDevice:(id)a3
{
  uint64_t AuthorizedServices;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a3, "device");
  AuthorizedServices = BTDeviceGetAuthorizedServices();
  if (!(_DWORD)AuthorizedServices)
    return 0;
  v4 = AuthorizedServices;
  AXLogBluetooth();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[AXUIBluetoothHelper authorizedServicesForDevice:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (void)_updateCentralManagerScan
{
  id v2;

  if (-[CBCentralManager state](self->_centralManager, "state") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("VOSBluetoothCoreBluetoothManagerReadyNotification"), 0);

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AXUIBluetoothHelper _updateCentralManagerScan](self, "_updateCentralManagerScan", a3);
  AXLogBluetooth();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CBCentralManager state](self->_centralManager, "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Center manager did updated state: %@", buf, 0xCu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveConnectedPeripheralsWithServices:", MEMORY[0x1E0C9AA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    *(_QWORD *)&v9 = 138412290;
    v15 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogBrailleHW();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          v22 = v13;
          _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_DEFAULT, "Adding BTLE discovered device: %@", buf, 0xCu);
        }

        -[AXUIBluetoothHelper _addDiscoveredDevice:](self, "_addDiscoveredDevice:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[AXUIBluetoothHelper _setupCentralScanning:](self, "_setupCentralScanning:", 1);
}

- (void)_setupCentralScanning:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v3 = a3;
  -[AXUIBluetoothHelper centralManager](self, "centralManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 == 5)
  {
    -[AXUIBluetoothHelper centralManager](self, "centralManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    if (v3)
    {
      objc_msgSend(v7, "scanForPeripheralsWithServices:options:", 0, 0);

      AXLogBrailleHW();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_DEFAULT, "Scanning for peripherals: ", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(v7, "stopScan");

    }
  }
}

- (void)_removeDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *btAddrDict;
  void *v7;
  NSMutableDictionary *btDeviceDict;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "paired") & 1) == 0)
  {
    AXLogBluetooth();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "VOTBTM: Removing device %{public}@", (uint8_t *)&v10, 0xCu);
    }

    btAddrDict = self->_btAddrDict;
    objc_msgSend(v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](btAddrDict, "removeObjectForKey:", v7);

    btDeviceDict = self->_btDeviceDict;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", objc_msgSend(v4, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](btDeviceDict, "removeObjectForKey:", v9);

  }
}

- (void)deviceDiscovered:(id)a3
{
  void *v4;
  id deviceDiscovered;

  v4 = _Block_copy(a3);
  deviceDiscovered = self->_deviceDiscovered;
  self->_deviceDiscovered = v4;

}

- (void)deviceRemoved:(id)a3
{
  void *v4;
  id deviceRemoved;

  v4 = _Block_copy(a3);
  deviceRemoved = self->_deviceRemoved;
  self->_deviceRemoved = v4;

}

- (void)deviceUpdated:(id)a3
{
  void *v4;
  id deviceUpdated;

  v4 = _Block_copy(a3);
  deviceUpdated = self->_deviceUpdated;
  self->_deviceUpdated = v4;

}

- (id)allowedServices
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C97718]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("49535343-FE7D-4AE5-8FA9-9FAFD205E455"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)peripheralMatchesUnadvertisedService:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("DotPad")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasPrefix:", CFSTR("DotMini"));

  }
  return v5;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0C97628]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        -[AXUIBluetoothHelper allowedServices](self, "allowedServices", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v15, "containsObject:", v14);

        if ((v14 & 1) != 0)
        {

          v16 = 1;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = -[AXUIBluetoothHelper peripheralMatchesUnadvertisedService:](self, "peripheralMatchesUnadvertisedService:", v8);
LABEL_11:
  AXLogBrailleHW();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v8;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_INFO, "Discovered periperal: %@, allowed %@ %@", buf, 0x20u);

  }
  if (v16)
  {
    -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogBrailleHW();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v19;
      _os_log_impl(&dword_18C62B000, v20, OS_LOG_TYPE_DEFAULT, "Adding BTLE discovered device: %@", buf, 0xCu);
    }

    -[AXUIBluetoothHelper _addDiscoveredDevice:](self, "_addDiscoveredDevice:", v19);
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogBrailleHW();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_error_impl(&dword_18C62B000, v10, OS_LOG_TYPE_ERROR, "Failed to connected: %@, device: %@ error %@", (uint8_t *)&v12, 0x20u);
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceConnectFailedNotification"), v9);

  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogBrailleHW();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "Updated periperhal state for %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceUpdatedNotification"), v4);

  }
}

- (void)_peripheralDidCompletePairing:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AXLogBrailleHW();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Completed pairing to %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("VOSBluetoothDevicePairedNotification"), v3);

  }
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXUIBluetoothHelper _peripheralDidCompletePairing:](self, "_peripheralDidCompletePairing:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceConnectSuccessNotification"), v7);

    v5 = v7;
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "state"))
  {
    -[AXUIBluetoothHelper centralManager](self, "centralManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelPeripheralConnection:", v9);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceUnpairedNotification"), v6);

  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  void *v4;
  id v5;

  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceDisconnectSuccessNotification"), v5);

  }
}

- (void)peripheralDidUpdateName:(id)a3
{
  void *v3;
  id v4;

  -[AXUIBluetoothHelper deviceForPeripheral:](self, "deviceForPeripheral:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceUpdatedNotification"), v4);

  }
}

- (void)_addDiscoveredDevice:(id)a3
{
  AXUIBluetoothHelper *v4;
  AXUIBluetoothHelper *v5;
  void *v6;
  NSMutableDictionary *discoveredDevices;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void (**deviceDiscovered)(id, void *);
  NSObject *v13;
  int v14;
  AXUIBluetoothHelper *v15;
  __int16 v16;
  NSMutableDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (AXUIBluetoothHelper *)a3;
  v5 = v4;
  if (v4
    && (-[AXUIBluetoothHelper address](v4, "address"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    discoveredDevices = self->_discoveredDevices;
    -[AXUIBluetoothHelper address](v5, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v5, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("VOSBluetoothDeviceDiscoveredNotification"), v5);

    AXLogBluetooth();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_discoveredDevices;
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_DEFAULT, "%@ Discovered devices: %@", (uint8_t *)&v14, 0x16u);
    }

    deviceDiscovered = (void (**)(id, void *))self->_deviceDiscovered;
    if (deviceDiscovered)
      deviceDiscovered[2](deviceDiscovered, v5);
  }
  else
  {
    AXLogBluetooth();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_18C62B000, v13, OS_LOG_TYPE_DEFAULT, "Invalid discovered device: %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (unsigned)authorizedServices
{
  return self->_authorizedServices;
}

- (void)setAuthorizedServices:(unsigned int)a3
{
  self->_authorizedServices = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong(&self->_deviceRemoved, 0);
  objc_storeStrong(&self->_deviceUpdated, 0);
  objc_storeStrong(&self->_deviceDiscovered, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_btleDevices, 0);
  objc_storeStrong((id *)&self->_btDeviceDict, 0);
  objc_storeStrong((id *)&self->_btAddrDict, 0);
}

- (void)isAnyoneScanning
{
  OUTLINED_FUNCTION_0_8(&dword_18C62B000, a2, a3, "VOTBTM: BTLocalDeviceGetScanning returned error %d", a5, a6, a7, a8, 0);
}

- (void)authorizedServicesForDevice:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_8(&dword_18C62B000, a2, a3, "VOBTM: failed to get authorized services with error %d", a5, a6, a7, a8, 0);
}

@end
