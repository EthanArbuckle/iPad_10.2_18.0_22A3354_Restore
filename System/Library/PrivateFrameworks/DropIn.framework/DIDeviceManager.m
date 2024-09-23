@implementation DIDeviceManager

- (DIDeviceManager)initWithConnectionManager:(id)a3
{
  id v4;
  DIDeviceManager *v5;
  uint64_t v6;
  NSArray *devices;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIDeviceManager;
  v5 = -[DIDeviceManager init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    v8 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    objc_msgSend(v4, "dispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceListDelegate:", v5);

    WeakRetained = objc_loadWeakRetained((id *)&v5->_connectionManager);
    objc_msgSend(WeakRetained, "dispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceStatusDelegate:", v5);

    v12 = objc_loadWeakRetained((id *)&v5->_connectionManager);
    objc_msgSend(v12, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addCheckInObserver:", v5);

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", buf, 0x16u);
  }

  if (v4)
  {
    -[DIDeviceManager connectionManager](self, "connectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDeviceManager connectionManager](self, "connectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __31__DIDeviceManager_setDelegate___block_invoke_2;
    v13[3] = &unk_250B96898;
    v13[4] = self;
    objc_msgSend(v9, "loadDevicesWithContext:completionHandler:", v12, v13);

  }
}

void __31__DIDeviceManager_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  DILogHandleDeviceManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Set delegate proxy error: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __31__DIDeviceManager_setDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    DILogHandleDeviceManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = &stru_250B97E20;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_23A742000, v7, OS_LOG_TYPE_ERROR, "%@Set delegate load devices error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "didLoadDevices:", v5);
      goto LABEL_7;
    }
    DILogHandleDeviceManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = &stru_250B97E20;
      _os_log_impl(&dword_23A742000, v7, OS_LOG_TYPE_ERROR, "%@Set delegate load devices. Devices are nil", (uint8_t *)&v9, 0xCu);
    }
  }

LABEL_7:
}

- (void)setCurrentDevice:(id)a3
{
  DIDevice *v4;
  NSObject *v5;
  DIDevice *currentDevice;
  int v7;
  const __CFString *v8;
  __int16 v9;
  DIDevice *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (DIDevice *)a3;
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = &stru_250B97E20;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Setting Current Device: %@", (uint8_t *)&v7, 0x16u);
  }

  currentDevice = self->_currentDevice;
  self->_currentDevice = v4;

}

- (NSArray)devices
{
  NSArray *v3;
  void *v4;

  v3 = self->_devices;
  objc_sync_enter(v3);
  v4 = (void *)-[NSArray copy](self->_devices, "copy");
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (void)didAddDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = &stru_250B97E20;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did add device %@", buf, 0x16u);
  }

  -[DIDeviceManager devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[DIDeviceManager connectionManager](self, "connectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionManager:", v7);

  -[DIDeviceManager devices](self, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDeviceManager setDevices:](self, "setDevices:", v9);

  if (objc_msgSend(v4, "isCurrentDevice"))
    -[DIDeviceManager setCurrentDevice:](self, "setCurrentDevice:", v4);
  objc_sync_exit(v6);

  -[DIDeviceManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[DIDeviceManager connectionManager](self, "connectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "manager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __32__DIDeviceManager_didAddDevice___block_invoke;
    v15[3] = &unk_250B96438;
    v15[4] = self;
    v16 = v4;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v14, v15);

  }
}

void __32__DIDeviceManager_didAddDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manager:didAddDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didLoadDevices:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = &stru_250B97E20;
    v40 = 2048;
    v41 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Load Devices %lu", buf, 0x16u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v33;
    *(_QWORD *)&v8 = 138412546;
    v26 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        DILogHandleDeviceManager();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v39 = &stru_250B97E20;
          v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_23A742000, v12, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  -[DIDeviceManager devices](self, "devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        -[DIDeviceManager connectionManager](self, "connectionManager", v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setConnectionManager:", v19);

        objc_msgSend(v18, "stateExpiration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setStateExpiration:", v20);

        if (objc_msgSend(v18, "isCurrentDevice"))
          -[DIDeviceManager setCurrentDevice:](self, "setCurrentDevice:", v18);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v15);
  }

  -[DIDeviceManager setDevices:](self, "setDevices:", v14);
  objc_sync_exit(v13);

  -[DIDeviceManager delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[DIDeviceManager connectionManager](self, "connectionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "manager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clientQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __34__DIDeviceManager_didLoadDevices___block_invoke;
    v27[3] = &unk_250B96588;
    v27[4] = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v25, v27);

  }
}

void __34__DIDeviceManager_didLoadDevices___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managerDidUpdateDevices:", *(_QWORD *)(a1 + 32));

}

- (void)didRemoveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_250B97E20;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did remove device %@", buf, 0x16u);
  }

  -[DIDeviceManager devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  v7 = (void *)MEMORY[0x24BDBCEB8];
  -[DIDeviceManager devices](self, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v4);
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DIDeviceManager setDevices:](self, "setDevices:", v10);

  if (objc_msgSend(v4, "isCurrentDevice"))
    -[DIDeviceManager setCurrentDevice:](self, "setCurrentDevice:", 0);

  objc_sync_exit(v6);
  -[DIDeviceManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[DIDeviceManager connectionManager](self, "connectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __35__DIDeviceManager_didRemoveDevice___block_invoke;
    v16[3] = &unk_250B96438;
    v16[4] = self;
    v17 = v4;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v15, v16);

  }
}

void __35__DIDeviceManager_didRemoveDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manager:didRemoveDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateDevice:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  DILogHandleDeviceManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = &stru_250B97E20;
    v34 = 2112;
    v35 = (uint64_t)v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_DEFAULT, "%@Did update device %@", buf, 0x16u);
  }

  -[DIDeviceManager devices](self, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  DILogHandleDeviceManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[DIDeviceManager devices](self, "devices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412546;
      v33 = &stru_250B97E20;
      v34 = 2048;
      v35 = v8;
      _os_log_impl(&dword_23A742000, v6, OS_LOG_TYPE_DEFAULT, "%@Devices %lu", buf, 0x16u);

    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[DIDeviceManager devices](self, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        DILogHandleDeviceManager();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = &stru_250B97E20;
          v34 = 2112;
          v35 = v13;
          _os_log_impl(&dword_23A742000, v14, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[DIDeviceManager devices](self, "devices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v19, "isEqual:", v3, obj))
          objc_msgSend(v19, "updateWithDevice:updateState:", v3, 1);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  objc_sync_exit(obj);
}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[DIDeviceManager setDelegate:](self, "setDelegate:", WeakRetained);

}

- (DIDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (DIDeviceManagerDelegate)delegate
{
  return (DIDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

@end
