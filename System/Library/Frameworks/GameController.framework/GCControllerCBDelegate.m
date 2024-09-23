@implementation GCControllerCBDelegate

- (GCControllerCBDelegate)init
{
  GCControllerCBDelegate *v2;
  uint64_t v3;
  NSMutableArray *foundPeripherals;
  uint64_t v5;
  NSMutableArray *connectedPeripherals;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCControllerCBDelegate;
  v2 = -[GCControllerCBDelegate init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    foundPeripherals = v2->_foundPeripherals;
    v2->_foundPeripherals = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    connectedPeripherals = v2->_connectedPeripherals;
    v2->_connectedPeripherals = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)fireCompletionHandler
{
  void *v3;
  id completionHandler;
  _QWORD block[4];
  id v6;

  v3 = (void *)MEMORY[0x2199DEBB0](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__GCControllerCBDelegate_fireCompletionHandler__block_invoke;
    block[3] = &unk_24D2B4AA8;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __47__GCControllerCBDelegate_fireCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopScan
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__GCControllerCBDelegate_stopScan__block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)s_cbDelegateQueue, block);
}

uint64_t __34__GCControllerCBDelegate_stopScan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stopScan");
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
}

- (void)startScan
{
  -[GCControllerCBDelegate startScanWithTimeout:](self, "startScanWithTimeout:", 30.0);
}

- (void)startScanWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  dispatch_time_t v18;
  _QWORD block[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("1812"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSArray arrayWithObject:](NSArray_0, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSDictionary dictionaryWithObject:forKey:](&off_254DEBCC0, "dictionaryWithObject:forKey:", v7, *MEMORY[0x24BDBB058]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBCentralManager scanForPeripheralsWithServices:options:](self->_centralManager, "scanForPeripheralsWithServices:options:", v6, v8);
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSDictionary dictionaryWithObject:forKey:](&off_254DEBCC0, "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BDBB140]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMutableArray addObject:](self->_foundPeripherals, "addObject:", v17);
          -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v17, v11);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  if (a3 > 0.0)
  {
    v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__GCControllerCBDelegate_startScanWithTimeout___block_invoke;
    block[3] = &unk_24D2B2B20;
    block[4] = self;
    dispatch_after(v18, (dispatch_queue_t)s_cbDelegateQueue, block);
  }

}

uint64_t __47__GCControllerCBDelegate_startScanWithTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopScan");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 2)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "The platform doesn't support Bluetooth Low Energy.", buf, 2u);
      }

    }
    v5 = s_cbDelegateQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke;
    v13[3] = &unk_24D2B2B20;
    v13[4] = self;
    v6 = v13;
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "The app is not authorized to use Bluetooth Low Energy.", buf, 2u);
      }

    }
    v5 = s_cbDelegateQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_70;
    v12[3] = &unk_24D2B2B20;
    v12[4] = self;
    v6 = v12;
  }
  else
  {
    v7 = objc_msgSend(v4, "state");
    v5 = s_cbDelegateQueue;
    if (v7 > 4)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_3;
      v10[3] = &unk_24D2B2B20;
      v10[4] = self;
      v6 = v10;
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_2;
      v11[3] = &unk_24D2B2B20;
      v11[4] = self;
      v6 = v11;
    }
  }
  dispatch_async(v5, v6);

}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startScan");
}

- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "centralManager: didRetrievePeripherals:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "centralManager: didRetrieveConnectedPeripherals:%@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_DEFAULT, "centralManager: didDiscoverPeripheral:%@ advertisementData:%@ RSSI:%@", (uint8_t *)&v17, 0x20u);
    }

  }
  -[NSMutableArray addObject:](self->_foundPeripherals, "addObject:", v10);
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSDictionary dictionaryWithObject:forKey:](&off_254DEBCC0, "dictionaryWithObject:forKey:", v14, *MEMORY[0x24BDBB140]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "connectPeripheral:options:", v10, v15);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "centralManager: didConnectPeripheral:%@", buf, 0xCu);
    }

  }
  -[NSMutableArray addObject:](self->_connectedPeripherals, "addObject:", v5);
  objc_msgSend(v5, "setDelegate:", self);
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("1812"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("180A"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("180F"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("7d74f4bd-c74a-4431-862c-cce884371592"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "discoverServices:", v10);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "services");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverServices: -> %@", buf, 0xCu);

    }
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "discoverIncludedServices:forService:", 0, v10);
        objc_msgSend(v4, "discoverCharacteristics:forService:", 0, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)peripheral:(id)a3 didDiscoverIncludedServicesForService:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "includedServices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverIncludedServicesForService: -> %@", buf, 0xCu);

    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v7, "includedServices", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "discoverCharacteristics:forService:", 0, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  int isInternalBuild;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v50 = v38;
      v51 = 2112;
      v52 = (uint64_t)v39;
      _os_log_impl(&dword_215181000, v36, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverCharacteristicsForService:(%@) '%@'", buf, 0x16u);

    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v7, "characteristics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
        objc_msgSend(v7, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("180F"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "UUID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "data");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "UUID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v50 = v17;
              v51 = 2112;
              v52 = (uint64_t)v18;
              v19 = v16;
              v20 = "=battery=: (%@) %@ ";
              goto LABEL_27;
            }
LABEL_28:

          }
LABEL_17:
          objc_msgSend(v6, "readValueForCharacteristic:", v12);
          goto LABEL_18;
        }
        objc_msgSend(v7, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("180A"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          if (!gc_isInternalBuild())
            goto LABEL_17;
          getGCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          objc_msgSend(v12, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v17;
          v51 = 2112;
          v52 = (uint64_t)v18;
          v19 = v16;
          v20 = "=device info=: (%@) %@ ";
LABEL_27:
          _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);

          goto LABEL_28;
        }
        objc_msgSend(v7, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("1812"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        isInternalBuild = gc_isInternalBuild();
        if (v26)
        {
          if (!isInternalBuild)
            goto LABEL_17;
          getGCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          objc_msgSend(v12, "UUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v17;
          v51 = 2112;
          v52 = (uint64_t)v18;
          v19 = v16;
          v20 = "=hid=: (%@) %@ ";
          goto LABEL_27;
        }
        if (isInternalBuild)
        {
          getGCLogger();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "UUID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "data");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v12, "properties");
            objc_msgSend(v12, "UUID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v50 = v33;
            v51 = 2048;
            v52 = v40;
            v53 = 2112;
            v54 = v34;
            _os_log_impl(&dword_215181000, v32, OS_LOG_TYPE_DEFAULT, "=misc=: (%@:0x%lx) %@ ", buf, 0x20u);

          }
        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_alloc((Class)&off_254DEDEA8);
            objc_msgSend(v12, "value");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v30, "initWithData:encoding:", v42, 4);
            *(_DWORD *)buf = 138412546;
            v50 = v29;
            v51 = 2112;
            v52 = (uint64_t)v31;
            _os_log_impl(&dword_215181000, v28, OS_LOG_TYPE_DEFAULT, "(%@) '%@'", buf, 0x16u);

          }
        }
LABEL_18:
        objc_msgSend(v6, "discoverDescriptorsForCharacteristic:", v12);
        ++v11;
      }
      while (v9 != v11);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      v9 = v35;
    }
    while (v35);
  }

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverDescriptorsForCharacteristic:%@ error:", buf, 0xCu);

    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v7, "descriptors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "readValueForDescriptor:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  unsigned __int16 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = *(double *)&v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "peripheral: didUpdateValueForCharacteristic:(%@) '%@'", (uint8_t *)&v21, 0x16u);

    }
  }
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("2A19"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v5, "value");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (unsigned __int16 *)-[NSObject bytes](v9, "bytes");
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (double)(int)__rev16(*v10);
        v21 = 134217984;
        v22 = v16;
        _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_DEFAULT, "battery level: %02.1f%%", (uint8_t *)&v21, 0xCu);
      }

    }
    if (!gc_isInternalBuild())
      goto LABEL_5;
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = *(double *)&v9;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "(%@)", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_18;
  }
  if (!gc_isInternalBuild())
    goto LABEL_7;
  getGCLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc((Class)&off_254DEDEA8);
    objc_msgSend(v5, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithData:encoding:", v19, 4);
    v21 = 138412546;
    v22 = *(double *)&v17;
    v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "(%@) '%@'", (uint8_t *)&v21, 0x16u);

LABEL_18:
  }
LABEL_5:

LABEL_7:
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  uint8_t buf[4];
  _BYTE v25[10];
  _WORD v26[9];

  *(_QWORD *)&v26[5] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v25 = v19;
      *(_WORD *)&v25[8] = 2112;
      *(_QWORD *)v26 = v20;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "peripheral: didUpdateValueForDescriptor:(%@) '%@'", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254E116AC(&off_254E119A8, "UUIDWithString:", CFSTR("2908"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v5, "value");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = -[NSObject bytes](v9, "bytes");
    if (-[NSObject length](v9, "length"))
    {
      v11 = 0;
      do
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(unsigned __int8 *)(v10 + v11 + 1) - 1;
            v22 = *(unsigned __int8 *)(v10 + v11);
            objc_msgSend(v5, "characteristic");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v25 = v22;
            *(_WORD *)&v25[4] = 1024;
            *(_DWORD *)&v25[6] = v21;
            v26[0] = 2112;
            *(_QWORD *)&v26[1] = v13;
            _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, "Found HID report 0x%02x of type %d on char %@", buf, 0x18u);

          }
        }
        v11 += 2;
      }
      while (-[NSObject length](v9, "length") > v11);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "characteristic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v25 = v15;
      *(_WORD *)&v25[8] = 2112;
      *(_QWORD *)v26 = v16;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "on (%@): %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "centralManager: didFailToConnectPeripheral:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }

  }
  -[NSMutableArray removeObject:](self->_foundPeripherals, "removeObject:", v7);

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "centralManager: didDisconnectPeripheral:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }

  }
  -[NSMutableArray removeObject:](self->_connectedPeripherals, "removeObject:", v7);

}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_connectedPeripherals, 0);
  objc_storeStrong((id *)&self->_foundPeripherals, 0);
}

@end
