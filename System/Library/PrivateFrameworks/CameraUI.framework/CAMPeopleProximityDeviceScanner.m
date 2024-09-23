@implementation CAMPeopleProximityDeviceScanner

- (CAMPeopleProximityDeviceScanner)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CAMPeopleProximityDeviceScanner *v9;
  CAMPeopleProximityDeviceScanner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMPeopleProximityDeviceScanner;
  v9 = -[CAMPeopleProximityDeviceScanner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->__queue_sessionID = 1;
  }

  return v10;
}

- (void)dealloc
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *queue_deviceDiscovery;
  NSObject *queue;
  objc_super v6;
  _QWORD block[4];
  SFDeviceDiscovery *v8;

  v3 = self->__queue_deviceDiscovery;
  if (v3)
  {
    ++self->__queue_sessionID;
    queue_deviceDiscovery = self->__queue_deviceDiscovery;
    self->__queue_deviceDiscovery = 0;

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CAMPeopleProximityDeviceScanner_dealloc__block_invoke;
    block[3] = &unk_1EA328868;
    v8 = v3;
    dispatch_async(queue, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)CAMPeopleProximityDeviceScanner;
  -[CAMPeopleProximityDeviceScanner dealloc](&v6, sel_dealloc);
}

uint64_t __42__CAMPeopleProximityDeviceScanner_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)isScanning
{
  return self->__queue_deviceDiscovery != 0;
}

- (void)startDiscoveryWithScanRate:(unint64_t)a3 timeout:(double)a4
{
  unsigned int queue_sessionID;
  NSMutableDictionary *v8;
  NSMutableDictionary *queue_discoveredDevices;
  NSMutableDictionary *v10;
  NSMutableDictionary *queue_discoveredIdentities;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  SFDeviceDiscovery *v15;
  SFDeviceDiscovery *queue_deviceDiscovery;
  SFDeviceDiscovery *v17;
  _QWORD v18[4];
  id v19;
  unsigned int v20;
  _QWORD v21[4];
  id v22;
  unsigned int v23;
  _QWORD v24[4];
  id v25;
  unsigned int v26;
  _QWORD v27[4];
  id v28;
  unsigned int v29;
  _QWORD v30[4];
  id v31;
  unsigned int v32;
  _QWORD v33[4];
  id v34;
  unsigned int v35;
  id location[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->__queue_deviceDiscovery)
  {
    queue_sessionID = self->__queue_sessionID;
    CAMSignpostWithIDAndArgs(78, 0xEEEEB0B5B2B2EEEELL, queue_sessionID, 0, 0, 0);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_discoveredDevices = self->__queue_discoveredDevices;
    self->__queue_discoveredDevices = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = v10;

    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v12 = (void *)getSFDeviceDiscoveryClass_softClass;
    v40 = getSFDeviceDiscoveryClass_softClass;
    v13 = MEMORY[0x1E0C809B0];
    if (!getSFDeviceDiscoveryClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getSFDeviceDiscoveryClass_block_invoke;
      location[3] = &unk_1EA329140;
      location[4] = &v37;
      __getSFDeviceDiscoveryClass_block_invoke((uint64_t)location);
      v12 = (void *)v38[3];
    }
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v37, 8);
    v15 = (SFDeviceDiscovery *)objc_alloc_init(v14);
    queue_deviceDiscovery = self->__queue_deviceDiscovery;
    self->__queue_deviceDiscovery = v15;

    -[SFDeviceDiscovery setDispatchQueue:](self->__queue_deviceDiscovery, "setDispatchQueue:", self->_queue);
    -[SFDeviceDiscovery setChangeFlags:](self->__queue_deviceDiscovery, "setChangeFlags:", 3);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->__queue_deviceDiscovery, "setDiscoveryFlags:", 1);
    -[SFDeviceDiscovery setPurpose:](self->__queue_deviceDiscovery, "setPurpose:", CFSTR("CameraPeopleProximity"));
    if (a3 > 0x32 || ((1 << a3) & 0x4010040100400) == 0)
      a3 = 30;
    -[SFDeviceDiscovery setScanRate:](self->__queue_deviceDiscovery, "setScanRate:", a3);
    -[SFDeviceDiscovery setTimeout:](self->__queue_deviceDiscovery, "setTimeout:", a4);
    objc_initWeak(location, self);
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke;
    v33[3] = &unk_1EA32CE50;
    objc_copyWeak(&v34, location);
    v35 = queue_sessionID;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->__queue_deviceDiscovery, "setDeviceFoundHandler:", v33);
    v30[0] = v13;
    v30[1] = 3221225472;
    v30[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_2;
    v30[3] = &unk_1EA32CE50;
    objc_copyWeak(&v31, location);
    v32 = queue_sessionID;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->__queue_deviceDiscovery, "setDeviceLostHandler:", v30);
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_3;
    v27[3] = &unk_1EA32CE78;
    objc_copyWeak(&v28, location);
    v29 = queue_sessionID;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->__queue_deviceDiscovery, "setDeviceChangedHandler:", v27);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_4;
    v24[3] = &unk_1EA3296A8;
    objc_copyWeak(&v25, location);
    v26 = queue_sessionID;
    -[SFDeviceDiscovery setInterruptionHandler:](self->__queue_deviceDiscovery, "setInterruptionHandler:", v24);
    v17 = self->__queue_deviceDiscovery;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_5;
    v21[3] = &unk_1EA32CEA0;
    objc_copyWeak(&v22, location);
    v23 = queue_sessionID;
    -[SFDeviceDiscovery activateWithCompletion:](v17, "activateWithCompletion:", v21);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_6;
    v18[3] = &unk_1EA3296A8;
    objc_copyWeak(&v19, location);
    v20 = queue_sessionID;
    -[SFDeviceDiscovery setTimeoutHandler:](self->__queue_deviceDiscovery, "setTimeoutHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(location);
  }
}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryDeviceFound:sessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryDeviceLost:sessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryDeviceFound:sessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryInterruptedWithPeopleDiscoverySessionID:", *(unsigned int *)(a1 + 40));

}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryActivatedWithError:sessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __70__CAMPeopleProximityDeviceScanner_startDiscoveryWithScanRate_timeout___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryTimeoutForSessionID:", *(unsigned int *)(a1 + 40));

}

- (void)stopDiscovery
{
  NSObject *v3;
  unsigned int queue_sessionID;
  SFDeviceDiscovery *queue_deviceDiscovery;
  NSMutableDictionary *queue_discoveredDevices;
  NSMutableDictionary *queue_discoveredIdentities;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_deviceDiscovery)
  {
    v3 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queue_sessionID = self->__queue_sessionID;
      v9[0] = 67109120;
      v9[1] = queue_sessionID;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] discovery stop ID %u", (uint8_t *)v9, 8u);
    }

    -[SFDeviceDiscovery invalidate](self->__queue_deviceDiscovery, "invalidate");
    queue_deviceDiscovery = self->__queue_deviceDiscovery;
    self->__queue_deviceDiscovery = 0;

    queue_discoveredDevices = self->__queue_discoveredDevices;
    self->__queue_discoveredDevices = 0;

    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = 0;

    ++self->__queue_sessionID;
    -[CAMPeopleProximityDeviceScanner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peopleProximityScannerDidStopDiscovery:", self);

  }
}

- (void)_queue_discoveryActivatedWithError:(id)a3 sessionID:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_sessionID == a4)
  {
    CAMSignpostWithIDAndArgs(79, 0xEEEEB0B5B2B2EEEELL, a4, objc_msgSend(v6, "code"), 0, 0);
    v7 = os_log_create("com.apple.camera", "SharedLibrary");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CAMPeopleProximityDeviceScanner _queue_discoveryActivatedWithError:sessionID:].cold.1((uint64_t)v6, v8);

      -[CAMPeopleProximityDeviceScanner stopDiscovery](self, "stopDiscovery");
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[SFDeviceDiscovery scanRate](self->__queue_deviceDiscovery, "scanRate");
        v10 = -[SFDeviceDiscovery rssiThreshold](self->__queue_deviceDiscovery, "rssiThreshold");
        v11[0] = 67109632;
        v11[1] = a4;
        v12 = 2048;
        v13 = v9;
        v14 = 2048;
        v15 = v10;
        _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Device discovery activated ID %u scanRate:%ld rssiThreshold:%ld", (uint8_t *)v11, 0x1Cu);
      }

    }
  }

}

- (void)_queue_discoveryTimeoutForSessionID:(unsigned int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_sessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Device discovery timeout sessionID:%u", (uint8_t *)v6, 8u);
    }

    -[CAMPeopleProximityDeviceScanner stopDiscovery](self, "stopDiscovery");
  }
}

- (void)_queue_discoveryInterruptedWithPeopleDiscoverySessionID:(unsigned int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_sessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] discovery interrupted ID %u", (uint8_t *)v6, 8u);
    }

    -[CAMPeopleProximityDeviceScanner stopDiscovery](self, "stopDiscovery");
  }
}

- (void)_queue_discoveryDeviceFound:(id)a3 sessionID:(unsigned int)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_sessionID == a4)
  {
    objc_msgSend(v6, "idsIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "librarySelectionMockAutomationModeEnabled");

    if (v9)
    {
      v10 = CFSTR("mockDeviceID");
      if (v7)
        v10 = v7;
      v11 = v10;

      v7 = v11;
    }
    else if (!v7)
    {
      goto LABEL_27;
    }
    if (-[__CFString length](v7, "length"))
    {
      +[CAMLibrarySelectionIdentity identityWithDevice:](CAMLibrarySelectionIdentity, "identityWithDevice:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      -[CAMPeopleProximityDeviceScanner delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "peopleProximityScanner:shouldDiscoverIdentity:", self, v12);

      if (!v14)
      {
LABEL_36:

        goto LABEL_37;
      }
      v15 = objc_msgSend(v6, "distance");
      v16 = 10;
      if (v15 != 10)
        v16 = 0;
      if (((1 << v15) & 0x1004000000000000) != 0)
        v17 = 30;
      else
        v17 = v16;
      if (((1 << v15) & 0x10040100000) != 0)
        v18 = 20;
      else
        v18 = v17;
      if (v15 <= 0x3C)
        v19 = v18;
      else
        v19 = 0;
      -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredDevices, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->__queue_discoveredDevices, "setObject:forKeyedSubscript:", v6, v7);
      if (v20)
      {
        v21 = os_log_create("com.apple.camera", "SharedLibrary");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[CAMPeopleProximityDeviceScanner _queue_discoveryDeviceFound:sessionID:].cold.1((uint64_t)v6, v21);

        v22 = objc_msgSend(v20, "distance");
        v23 = 0;
        if (v22 <= 0x3C)
        {
          if (((1 << v22) & 0x10040100000) != 0)
          {
            v23 = 20;
          }
          else if (((1 << v22) & 0x1004000000000000) != 0)
          {
            v23 = 30;
          }
          else if (v22 == 10)
          {
            v23 = 10;
          }
        }
        if (v23 == v19)
          goto LABEL_35;
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->__queue_discoveredIdentities, "setObject:forKeyedSubscript:", v12, v7);
      }
      objc_msgSend(v6, "bleDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rssi");

      -[CAMPeopleProximityDeviceScanner delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "peopleProximityScanner:didDiscoverIdentity:distance:rssi:", self, v12, v19, v25);

LABEL_35:
      goto LABEL_36;
    }
LABEL_27:
    v12 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138543362;
      v28 = v6;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Ignoring BLE device found with no IDS device ID: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_36;
  }
LABEL_37:

}

- (void)_queue_discoveryDeviceLost:(id)a3 sessionID:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_sessionID == a4)
  {
    objc_msgSend(v6, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredDevices, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_12:

        goto LABEL_13;
      }
      v9 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138477827;
        v13 = v6;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Lost %{private}@", (uint8_t *)&v12, 0xCu);
      }

      -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredIdentities, "objectForKeyedSubscript:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CAMPeopleProximityDeviceScanner delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "peopleProximityScanner:didLoseIdentity:", self, v10);

      }
      -[NSMutableDictionary removeObjectForKey:](self->__queue_discoveredDevices, "removeObjectForKey:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->__queue_discoveredIdentities, "removeObjectForKey:", v7);
    }
    else
    {
      v10 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityDeviceScanner] Ignoring BLE device lost with no IDS device ID: %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (CAMPeopleProximityScannerDelegate)delegate
{
  return (CAMPeopleProximityScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SFDeviceDiscovery)_queue_deviceDiscovery
{
  return self->__queue_deviceDiscovery;
}

- (void)set_queue_deviceDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->__queue_deviceDiscovery, a3);
}

- (NSMutableDictionary)_queue_discoveredDevices
{
  return self->__queue_discoveredDevices;
}

- (void)set_queue_discoveredDevices:(id)a3
{
  objc_storeStrong((id *)&self->__queue_discoveredDevices, a3);
}

- (NSMutableDictionary)_queue_discoveredIdentities
{
  return self->__queue_discoveredIdentities;
}

- (void)set_queue_discoveredIdentities:(id)a3
{
  objc_storeStrong((id *)&self->__queue_discoveredIdentities, a3);
}

- (unsigned)_queue_sessionID
{
  return self->__queue_sessionID;
}

- (void)set_queue_sessionID:(unsigned int)a3
{
  self->__queue_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue_discoveredIdentities, 0);
  objc_storeStrong((id *)&self->__queue_discoveredDevices, 0);
  objc_storeStrong((id *)&self->__queue_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_queue_discoveryActivatedWithError:(uint64_t)a1 sessionID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "[CAMPeopleProximityDeviceScanner] BLE discovery start failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_discoveryDeviceFound:(uint64_t)a1 sessionID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB760000, a2, OS_LOG_TYPE_DEBUG, "[CAMPeopleProximityDeviceScanner] device changed: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
