@implementation CMContinuityCaptureProvider

- (CMContinuityCaptureProvider)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureProvider *v6;
  CMContinuityCaptureProvider *v7;
  OS_dispatch_queue **p_queue;
  NSMutableSet *v9;
  NSMutableSet *observedDevices;
  NSMutableDictionary *v11;
  NSMutableDictionary *availableCaptureDevicesByIdentifiers;
  NSMutableArray *v13;
  NSMutableArray *devicePublishLogs;
  NSMutableSet *v15;
  NSMutableSet *pendingTerminateDeviceIdentifiers;
  NSMutableSet *v17;
  NSMutableSet *registeredStreamDevicesOnWifi;
  CMContinuityCaptureProvider *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureProvider;
  v6 = -[CMIOExtensionProvider initWithSource:clientQueue:](&v21, sel_initWithSource_clientQueue_, self, v5);
  v7 = v6;
  if (v6 && (p_queue = &v6->_queue, objc_storeStrong((id *)&v6->_queue, a3), *p_queue))
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    observedDevices = v7->_observedDevices;
    v7->_observedDevices = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    availableCaptureDevicesByIdentifiers = v7->_availableCaptureDevicesByIdentifiers;
    v7->_availableCaptureDevicesByIdentifiers = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    devicePublishLogs = v7->_devicePublishLogs;
    v7->_devicePublishLogs = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    pendingTerminateDeviceIdentifiers = v7->_pendingTerminateDeviceIdentifiers;
    v7->_pendingTerminateDeviceIdentifiers = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    registeredStreamDevicesOnWifi = v7->_registeredStreamDevicesOnWifi;
    v7->_registeredStreamDevicesOnWifi = v17;

    v19 = v7;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)filterCapabilitiesByMinorVersion:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CMContinuityCaptureDeviceCapabilities *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CMContinuityCaptureCapabilities *v32;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v34 = v3;
  objc_msgSend(v3, "devicesCapabilities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  if (!v38)
    goto LABEL_50;
  v36 = *(_QWORD *)v82;
  do
  {
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v82 != v36)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v5, "streamFormats");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v78;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v78 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
            if (!v12)
            {
              v74 = 0;
              v75 = 0;
              v76 = 0;
              v71 = 0;
              v72 = 0;
              v70 = 0;
LABEL_17:
              objc_msgSend(v6, "addObject:", v12);
              continue;
            }
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "minimumSupportedVersion");
            if (v74 == 3)
            {
              objc_msgSend(v12, "minimumSupportedVersion");
              if (v73 <= 303)
                goto LABEL_17;
            }
            objc_msgSend(v12, "minimumSupportedVersion");
            if (v70 <= 2)
              goto LABEL_17;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
        }
        while (v9);
      }

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v5, "manualFramingSupportedStreamFormats");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      if (!v14)
        goto LABEL_34;
      v15 = v14;
      v16 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
          if (!v18)
          {
            v63 = 0;
            v64 = 0;
            v65 = 0;
            v60 = 0;
            v61 = 0;
            v59 = 0;
LABEL_31:
            objc_msgSend(v6, "addObject:", v18);
            continue;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * k), "minimumSupportedVersion");
          if (v63 == 3)
          {
            objc_msgSend(v18, "minimumSupportedVersion");
            if (v62 <= 303)
              goto LABEL_31;
          }
          objc_msgSend(v18, "minimumSupportedVersion");
          if (v59 <= 2)
            goto LABEL_31;
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      }
      while (v15);
LABEL_34:

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v5, "controls");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v85, 16);
      if (!v21)
        goto LABEL_48;
      v22 = v21;
      v23 = *(_QWORD *)v56;
      while (2)
      {
        v24 = 0;
        while (2)
        {
          if (*(_QWORD *)v56 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v24);
          if (!v25)
          {
            v52 = 0;
            v53 = 0;
            v54 = 0;
            v49 = 0;
            v50 = 0;
            v48 = 0;
LABEL_45:
            objc_msgSend(v19, "addObject:", v25);
            goto LABEL_46;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v24), "minimumSupportedVersion");
          if (v52 == 3)
          {
            objc_msgSend(v25, "minimumSupportedVersion");
            if (v51 <= 303)
              goto LABEL_45;
          }
          objc_msgSend(v25, "minimumSupportedVersion");
          if (v48 <= 2)
            goto LABEL_45;
LABEL_46:
          if (v22 != ++v24)
            continue;
          break;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v85, 16);
        if (v22)
          continue;
        break;
      }
LABEL_48:

      v26 = -[CMContinuityCaptureDeviceCapabilities initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:]([CMContinuityCaptureDeviceCapabilities alloc], "initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:", objc_msgSend(v5, "entityType"), v6, v39, v19);
      objc_msgSend(v37, "addObject:", v26);

    }
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  }
  while (v38);
LABEL_50:

  if (v34)
  {
    objc_msgSend(v34, "capabilitiesVersion");
    v27 = v45;
    objc_msgSend(v34, "capabilitiesVersion");
    v28 = v43;
    objc_msgSend(v34, "capabilitiesVersion");
    v29 = v41;
  }
  else
  {
    v29 = 0;
    v28 = 0;
    v27 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v43 = 0;
    v44 = 0;
    v41 = 0;
    v42 = 0;
    v40[3] = 0;
    v40[4] = 0;
  }
  if (v28 >= 303)
    v28 = 303;
  if (v27 >= 3)
    v30 = 3;
  else
    v30 = v27;
  if (v29 >= 1)
    v31 = 1;
  else
    v31 = v29;
  v40[0] = v30;
  v40[1] = v28;
  v40[2] = v31;
  v32 = -[CMContinuityCaptureCapabilities initWithCapabilitiesVersion:devicesCapabilities:userDisabled:]([CMContinuityCaptureCapabilities alloc], "initWithCapabilitiesVersion:devicesCapabilities:userDisabled:", v40, v37, objc_msgSend(v34, "userDisabled"));

  return v32;
}

- (void)logDevicePublishSummary:(id)a3 publishTime:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if ((unint64_t)-[NSMutableArray count](self->_devicePublishLogs, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->_devicePublishLogs, "removeObjectAtIndex:", 0);
  if (v6)
    v8 = v6;
  else
    v8 = &stru_24F06D368;
  v12[0] = CFSTR("DeviceIdentifier");
  v12[1] = CFSTR("DevicePublishTime");
  if (v7)
    v9 = v7;
  else
    v9 = &stru_24F06D368;
  v13[0] = v8;
  v13[1] = v9;
  v12[2] = CFSTR("DeviceTerminateTime");
  CMContinuityCaptureGetCurrentTimeString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_devicePublishLogs, "addObject:", v11);
}

- (void)terminateAllDevices
{
  NSObject *v3;
  NSMutableDictionary *availableCaptureDevicesByIdentifiers;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSMutableDictionary *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    *(_DWORD *)buf = 138412802;
    v20 = self;
    v21 = 2082;
    v22 = "-[CMContinuityCaptureProvider terminateAllDevices]";
    v23 = 2114;
    v24 = availableCaptureDevicesByIdentifiers;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}s %{public}@ ", buf, 0x20u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_availableCaptureDevicesByIdentifiers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v7 = 138412546;
    v13 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(const char **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v11, v13))
        {
          CMContinuityCaptureLog(1);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v20 = self;
            v21 = 2114;
            v22 = v11;
            _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
          }

        }
        else
        {
          -[CMContinuityCaptureProvider terminateCompositeDeviceWithIdentifier:](self, "terminateCompositeDeviceWithIdentifier:", v11);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)postEventOnAllDevices:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary allValues](self->_availableCaptureDevicesByIdentifiers, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ Post %@ on devices %{public}@ data %{public}@", buf, 0x2Au);
  }

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "postEvent:entity:data:", v6, 0, v7, (_QWORD)v15);
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }
  }
  else
  {
    CMContinuityCaptureLog(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[CMContinuityCaptureProvider postEventOnAllDevices:data:].cold.1((uint64_t)self, v10);
  }

}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CMContinuityCaptureProvider_terminateCompleteForDevice___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CMContinuityCaptureProvider_terminateCompleteForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_terminateCompleteForDevice:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_terminateCompleteForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *availableCaptureDevicesByIdentifiers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  CMContinuityCaptureProvider *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMContinuityCaptureProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v28 = self;
  -[NSMutableDictionary objectForKey:](self->_availableCaptureDevicesByIdentifiers, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    CMContinuityCaptureLog(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = self;
      v36 = 2114;
      v37 = v4;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ Terminate %{public}@ ", buf, 0x16u);
    }

    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    objc_msgSend(v4, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](availableCaptureDevicesByIdentifiers, "removeObjectForKey:", v16);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSMutableDictionary allKeys](self->_availableCaptureDevicesByIdentifiers, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isEqualToString:", v22) & 1) == 0)
          {
            objc_msgSend(v4, "client");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "device");
            v24 = v4;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "hasStreamIntent");

            v4 = v24;
            if (v26)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](v28->_availableCaptureDevicesByIdentifiers, "objectForKeyedSubscript:", v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit"), 0, 0);

            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    -[CMContinuityCaptureProvider _reset:](v28, "_reset:", v4);
  }

}

- (void)createCompositeDeviceWithTransportDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  CMContinuityCaptureCompositeDevice *v9;
  NSMutableDictionary *availableCaptureDevicesByIdentifiers;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  CMContinuityCaptureCompositeDevice *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  char *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  CMContinuityCaptureProvider *v46;
  _QWORD v47[4];
  CMContinuityCaptureCompositeDevice *v48;
  CMContinuityCaptureProvider *v49;
  _QWORD block[4];
  CMContinuityCaptureCompositeDevice *v51;
  CMContinuityCaptureProvider *v52;
  uint8_t buf[4];
  CMContinuityCaptureProvider *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMContinuityCaptureProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v54 = self;
    v55 = 2080;
    v56 = "-[CMContinuityCaptureProvider createCompositeDeviceWithTransportDevice:]";
    v57 = 2114;
    v58 = v8;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@", buf, 0x20u);

  }
  v9 = -[CMContinuityCaptureCompositeDevice initWithDevice:provider:]([CMContinuityCaptureCompositeDevice alloc], "initWithDevice:provider:", v4, self);
  if (v9)
  {
    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    objc_msgSend(v4, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](availableCaptureDevicesByIdentifiers, "setObject:forKeyedSubscript:", v9, v12);

    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "hasStreamIntent"))
      {
        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "activeSession");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "device");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "deviceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v46 = self;
        v20 = v4;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deviceIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v42 = v16;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v21, "isEqualToString:", v23);

        v4 = v20;
        self = v46;

        if ((v43 & 1) == 0)
          -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](v9, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream"), 0, 0);
        goto LABEL_10;
      }

    }
LABEL_10:
    -[CMContinuityCaptureCompositeDevice client](v9, "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "magicStateMonitor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "queue");
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v27);

    -[CMContinuityCaptureCompositeDevice client](v9, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "device");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "magicStateMonitor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "queue");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke;
    block[3] = &unk_24F06ADE8;
    v33 = v9;
    v51 = v33;
    v52 = self;
    dispatch_async_and_wait(v31, block);

    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v35);

    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "queue");
    v37 = objc_claimAutoreleasedReturnValue();
    v47[0] = v32;
    v47[1] = 3221225472;
    v47[2] = __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke_2;
    v47[3] = &unk_24F06ADE8;
    v48 = v33;
    v49 = self;
    dispatch_async_and_wait(v37, v47);

    -[NSMutableSet addObject:](self->_observedDevices, "addObject:", v4);
    goto LABEL_11;
  }
  CMContinuityCaptureLog(1);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "deviceIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = self;
    v55 = 2114;
    v56 = v40;
    _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_DEFAULT, "%@ Failed to create capture device for identifier %{public}@", buf, 0x16u);

  }
LABEL_11:

}

void __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magicStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 3, 0);

}

void __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 3, 0);

}

- (void)terminateCompositeDeviceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *observedDevices;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSMutableSet *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  CMContinuityCaptureProvider *v36;
  _QWORD block[4];
  id v38;
  CMContinuityCaptureProvider *v39;
  uint8_t buf[4];
  CMContinuityCaptureProvider *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMContinuityCaptureProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  CMContinuityCaptureLog(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v41 = self;
    v42 = 2080;
    v43 = "-[CMContinuityCaptureProvider terminateCompositeDeviceWithIdentifier:]";
    v44 = 2114;
    v45 = v4;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@", buf, 0x20u);
  }

  -[NSMutableDictionary objectForKey:](self->_availableCaptureDevicesByIdentifiers, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCaptureDevicesByIdentifiers, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publishTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "publishTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureProvider logDevicePublishSummary:publishTime:](self, "logDevicePublishSummary:publishTime:", v4, v10);

    }
    else
    {
      -[CMContinuityCaptureProvider logDevicePublishSummary:publishTime:](self, "logDevicePublishSummary:publishTime:", v4, &stru_24F06D368);
    }

    -[NSMutableSet addObject:](self->_pendingTerminateDeviceIdentifiers, "addObject:", v4);
    -[CMContinuityCaptureProvider unregisterStreamIntentForDevice:](self, "unregisterStreamIntentForDevice:", v8);
    observedDevices = self->_observedDevices;
    objc_msgSend(v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(observedDevices) = -[NSMutableSet containsObject:](observedDevices, "containsObject:", v13);

    if ((_DWORD)observedDevices)
    {
      objc_msgSend(v8, "client");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "magicStateMonitor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v17);

      objc_msgSend(v8, "client");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "device");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "magicStateMonitor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke;
      block[3] = &unk_24F06ADE8;
      v22 = v8;
      v38 = v22;
      v39 = self;
      dispatch_async_and_wait(v21, block);

      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "queue");
      v24 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v24);

      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x24BDAC760];
      v32 = 3221225472;
      v33 = __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke_2;
      v34 = &unk_24F06ADE8;
      v27 = v22;
      v35 = v27;
      v36 = self;
      dispatch_async_and_wait(v26, &v31);

      v28 = self->_observedDevices;
      objc_msgSend(v27, "client", v31, v32, v33, v34);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v28, "removeObject:", v30);

    }
    objc_msgSend(v8, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventTerminate"), 0, 0);

  }
}

void __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magicStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 0);

}

void __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 0);

}

- (void)reset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CMContinuityCaptureProvider_reset___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__CMContinuityCaptureProvider_reset___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reset:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_reset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  CMContinuityCaptureProvider *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMContinuityCaptureProvider queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v8))
  {
    CMContinuityCaptureLog(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ Reset %{public}@", (uint8_t *)&v11, 0x16u);
    }

    -[NSMutableSet removeObject:](self->_pendingTerminateDeviceIdentifiers, "removeObject:", v8);
    -[CMContinuityCaptureProvider updateState](self, "updateState");
  }

}

- (void)resetTransportDevice:(id)a3 forIdentifier:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableSet *observedDevices;
  void *v17;
  void *v18;
  uint64_t v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSMutableSet *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  id v52;
  CMContinuityCaptureProvider *v53;
  _QWORD v54[4];
  id v55;
  CMContinuityCaptureProvider *v56;
  _QWORD v57[4];
  NSObject *v58;
  CMContinuityCaptureProvider *v59;
  _QWORD block[4];
  NSObject *v61;
  CMContinuityCaptureProvider *v62;
  uint8_t buf[4];
  CMContinuityCaptureProvider *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (char *)a4;
  -[CMContinuityCaptureProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v7))
  {
    CMContinuityCaptureLog(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = self;
      v65 = 2114;
      v66 = v7;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCaptureDevicesByIdentifiers, "objectForKeyedSubscript:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject client](v9, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v6);

    if ((v12 & 1) == 0)
    {
      CMContinuityCaptureLog(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject client](v9, "client");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "device");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v64 = self;
        v65 = 2080;
        v66 = "-[CMContinuityCaptureProvider resetTransportDevice:forIdentifier:]";
        v67 = 2112;
        v68 = v15;
        v69 = 2112;
        v70 = v6;
        _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%@ %s (%@) -> (%@)", buf, 0x2Au);

      }
      observedDevices = self->_observedDevices;
      -[NSObject client](v9, "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(observedDevices) = -[NSMutableSet containsObject:](observedDevices, "containsObject:", v18);

      v19 = MEMORY[0x24BDAC760];
      v20 = &off_24F06A000;
      if ((_DWORD)observedDevices)
      {
        -[NSObject client](v9, "client");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "device");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "magicStateMonitor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "queue");
        v24 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_not_V2(v24);

        -[NSObject client](v9, "client");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "device");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "magicStateMonitor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "queue");
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke;
        block[3] = &unk_24F06ADE8;
        v29 = v9;
        v61 = v29;
        v62 = self;
        dispatch_async_and_wait(v28, block);

        v19 = MEMORY[0x24BDAC760];
        +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "queue");
        v31 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_not_V2(v31);

        +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "queue");
        v33 = objc_claimAutoreleasedReturnValue();
        v57[0] = v19;
        v57[1] = 3221225472;
        v57[2] = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_2;
        v57[3] = &unk_24F06ADE8;
        v34 = v29;
        v58 = v34;
        v59 = self;
        dispatch_async_and_wait(v33, v57);

        v35 = self->_observedDevices;
        -[NSObject client](v34, "client");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "device");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](v35, "removeObject:", v37);

        v20 = &off_24F06A000;
      }
      objc_msgSend(v20[127], "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "queue");
      v39 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v39);

      objc_msgSend(v20[127], "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "queue");
      v41 = objc_claimAutoreleasedReturnValue();
      v54[0] = v19;
      v54[1] = 3221225472;
      v54[2] = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_3;
      v54[3] = &unk_24F06ADE8;
      v42 = v6;
      v55 = v42;
      v56 = self;
      dispatch_async_and_wait(v41, v54);

      objc_msgSend(v42, "magicStateMonitor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "queue");
      v44 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v44);

      objc_msgSend(v42, "magicStateMonitor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "queue");
      v46 = objc_claimAutoreleasedReturnValue();
      v48 = v19;
      v49 = 3221225472;
      v50 = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_4;
      v51 = &unk_24F06ADE8;
      v47 = v42;
      v52 = v47;
      v53 = self;
      dispatch_async_and_wait(v46, &v48);

      -[NSMutableSet addObject:](self->_observedDevices, "addObject:", v47, v48, v49, v50, v51);
    }
    -[NSObject resetTransportDevice:](v9, "resetTransportDevice:", v6);
  }

}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magicStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 0);

}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 0);

}

uint64_t __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("wired"), 3, 0);
}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "magicStateMonitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("magic"), 3, 0);

}

- (void)updateState
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  CMContinuityCaptureProvider *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  NSObject *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[NSMutableDictionary allKeys](self->_availableCaptureDevicesByIdentifiers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableClientDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ CurrentDevices : %{public}@", buf, 0x16u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v30;
    *(_QWORD *)&v11 = 138412546;
    v27 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        objc_msgSend(v15, "deviceIdentifier", v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "userDisconnected"))
        {
          CMContinuityCaptureLog(1);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "deviceIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v15, "wired");
            *(_DWORD *)buf = 138412802;
            v34 = self;
            v35 = 2114;
            v36 = v19;
            v37 = 1024;
            LODWORD(v38) = v20;
            _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%@ Ignore Device %{public}@ in User Disconnect Mode (wired:%d)", buf, 0x1Cu);

          }
LABEL_20:

          goto LABEL_21;
        }
        -[NSMutableDictionary objectForKey:](self->_availableCaptureDevicesByIdentifiers, "objectForKey:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(v15, "capabilities");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[CMContinuityCaptureProvider filterCapabilitiesByMinorVersion:](CMContinuityCaptureProvider, "filterCapabilitiesByMinorVersion:", v23);
          v18 = objc_claimAutoreleasedReturnValue();

          CMContinuityCaptureLog(1);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v34 = self;
            v35 = 2114;
            v36 = v17;
            v37 = 2114;
            v38 = v18;
            _os_log_impl(&dword_227C5D000, v24, OS_LOG_TYPE_DEFAULT, "%@ New Device (%{public}@) : %{public}@", buf, 0x20u);
          }

          -[CMContinuityCaptureProvider createCompositeDeviceWithTransportDevice:](self, "createCompositeDeviceWithTransportDevice:", v15);
          goto LABEL_20;
        }
        CMContinuityCaptureLog(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          v34 = self;
          v35 = 2114;
          v36 = v17;
          _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, "%@ Device (%{public}@) present", buf, 0x16u);
        }

        objc_msgSend(v28, "removeObject:", v17);
        if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v17))
        {
          CMContinuityCaptureLog(1);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v34 = self;
            v35 = 2114;
            v36 = v17;
            _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination, skip reset", buf, 0x16u);
          }
          goto LABEL_20;
        }
        -[CMContinuityCaptureProvider resetTransportDevice:forIdentifier:](self, "resetTransportDevice:forIdentifier:", v15, v17);
LABEL_21:

        ++v14;
      }
      while (v12 != v14);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      v12 = v25;
    }
    while (v25);
  }

  objc_msgSend(v28, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureProvider terminateDevicesIfApplicable:](self, "terminateDevicesIfApplicable:", v26);

}

- (void)terminateDevicesIfApplicable:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  CMContinuityCaptureProvider *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v7 = 138412546;
    v13 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v11, v13, (_QWORD)v14))
        {
          CMContinuityCaptureLog(1);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = self;
            v20 = 2114;
            v21 = v11;
            _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
          }

        }
        else
        {
          -[CMContinuityCaptureProvider terminateCompositeDeviceWithIdentifier:](self, "terminateCompositeDeviceWithIdentifier:", v11);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v8);
  }

}

- (BOOL)activate
{
  NSObject *queue;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __39__CMContinuityCaptureProvider_activate__block_invoke;
  v8 = &unk_24F06AE60;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, &v5);
  objc_msgSend(MEMORY[0x24BDC1380], "startServiceWithProvider:", self, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return 1;
}

void __39__CMContinuityCaptureProvider_activate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned __int8 *v3;
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WeakRetained;
    atomic_store(1u, WeakRetained + 224);
    objc_msgSend(v2, "addObserver:forKeyPath:options:context:", v3, CFSTR("availableClientDevices"), 3, 0);
    objc_msgSend(v1, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("state"), 3, 0);

  }
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
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
  _BYTE v37[128];
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = self;
    v42 = 2082;
    v43 = "-[CMContinuityCaptureProvider cancel]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}s", buf, 0x16u);
  }

  -[CMContinuityCaptureProvider queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableDictionary allValues](self->_availableCaptureDevicesByIdentifiers, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v10, "continuityCaptureDevices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v30;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v15++), "invalidate");
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CMIOExtensionProvider devices](self, "devices", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        -[CMIOExtensionProvider removeDevice:error:](self, "removeDevice:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20++), 0);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v18);
  }

  -[NSMutableDictionary removeAllObjects](self->_availableCaptureDevicesByIdentifiers, "removeAllObjects");
  +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = atomic_load((unsigned __int8 *)&self->_observingStateKVOs);
  if ((v24 & 1) != 0)
  {
    objc_msgSend(v22, "removeObserver:forKeyPath:context:", self, CFSTR("availableClientDevices"), 0);
    objc_msgSend(v21, "removeObserver:forKeyPath:context:", self, CFSTR("state"), 0);
    atomic_store(0, (unsigned __int8 *)&self->_observingStateKVOs);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__CMContinuityCaptureProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_24F06AFA0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __78__CMContinuityCaptureProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v34 = self;
      v35 = 2114;
      v36 = v9;
      v37 = 2114;
      v38 = v10;
      _os_log_debug_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEBUG, "%@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("availableClientDevices")))
    goto LABEL_20;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("state")))
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("magic")))
      goto LABEL_21;
LABEL_20:
    -[CMContinuityCaptureProvider updateState](self, "updateState");
    goto LABEL_21;
  }
  v13 = *MEMORY[0x24BDD0E70];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v15 == 4)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v17 <= 2)
    {
      +[CMContinuityCaptureDiscoverySession sharedInstance](CMContinuityCaptureDiscoverySession, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "availableClientDevices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "magicStateMonitor", (_QWORD)v28);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "holdMagicStateAssertion:", 2);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v22);
      }

    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v13, (_QWORD)v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  if (v27 >= 3)
    goto LABEL_20;
LABEL_21:

}

- (void)registerStreamIntentForDevice:(id)a3 forTransportType:(int64_t)a4 completion:(id)a5
{
  int v6;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  int v11;
  CMContinuityCaptureProvider *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  CMContinuityCaptureLog(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138413058;
    v12 = self;
    v13 = 2082;
    v14 = "-[CMContinuityCaptureProvider registerStreamIntentForDevice:forTransportType:completion:]";
    v15 = 2114;
    v16 = v8;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ %{public}s Device:%{public}@ Transport:%d", (uint8_t *)&v11, 0x26u);
  }

  v9[2](v9, 0);
}

- (void)unregisterStreamIntentForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleNotification:", 2);

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CMContinuityCaptureProvider_unregisterStreamIntentForDevice___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureProvider_unregisterStreamIntentForDevice___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(WeakRetained[24], "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v9) & 1) == 0)
            objc_msgSend(v9, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit"), 0, 0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (id)debugInfo
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[CMContinuityCaptureProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[CMContinuityCaptureProvider queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__CMContinuityCaptureProvider_debugInfo__block_invoke;
  v7[3] = &unk_24F06B238;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__CMContinuityCaptureProvider_debugInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_debugInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_debugInfo
{
  NSObject *v3;
  id v4;
  void *v5;
  NSMutableArray *devicePublishLogs;
  void *v7;

  -[CMContinuityCaptureProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NSMutableDictionary allKeys](self->_availableCaptureDevicesByIdentifiers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CurrentPublishedDevices"));
  devicePublishLogs = self->_devicePublishLogs;
  if (devicePublishLogs)
  {
    v7 = (void *)-[NSMutableArray copy](devicePublishLogs, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("DevicePublishHistory"));

  }
  return v4;
}

- (void)debugInfo:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  -[CMContinuityCaptureProvider debugInfo](self, "debugInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (BOOL)connectClient:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  CMContinuityCaptureProvider *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "clientID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413059;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureProvider connectClient:error:]";
    v14 = 2113;
    v15 = v7;
    v16 = 1025;
    v17 = objc_msgSend(v5, "pid");
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Client Connected - %{private}@, %{private}d", (uint8_t *)&v10, 0x26u);

  }
  +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportClientState:forClient:", 1, v5);

  return 1;
}

- (void)disconnectClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  CMContinuityCaptureProvider *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v31 = self;
    v32 = 2080;
    v33 = "-[CMContinuityCaptureProvider disconnectClient:]";
    v34 = 2113;
    v35 = v6;
    v36 = 1025;
    v37 = objc_msgSend(v4, "pid");
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s Client Disconnected - %{private}@, %{private}d", buf, 0x26u);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CMIOExtensionProvider devices](self, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v11, "streams");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v17, "disconnectClient:", v4);
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportClientState:forClient:", 2, v4);

}

- (NSSet)availableProperties
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *MEMORY[0x24BDC1340]);
    objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1348]);
    objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1310]);
  }
  return (NSSet *)v3;
}

- (id)providerPropertiesForProperties:(id)a3 error:(id *)a4
{
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    queue = self->_queue;
    v5 = a3;
    dispatch_assert_queue_V2(queue);
    objc_msgSend(MEMORY[0x24BDC1388], "providerPropertiesWithDictionary:", MEMORY[0x24BDBD1B8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDC1310];
    v8 = objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDC1310]);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDC1378], "propertyStateWithValue:", &unk_24F07F7C8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v6, "setPropertyState:forProperty:", v9, v7);

      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)setProviderProperties:(id)a3 error:(id *)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v23;
  CMContinuityCaptureProvider *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    queue = self->_queue;
    v7 = a3;
    dispatch_assert_queue_V2(queue);
    objc_msgSend(v7, "propertiesDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    CMContinuityCaptureLog(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = self;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ propertyDict %{public}@", (uint8_t *)&v23, 0x16u);
    }

    v11 = *MEMORY[0x24BDC1310];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDC1310]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      CMContinuityCaptureLog(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = self;
        v25 = 2114;
        v26 = v15;
        v27 = 2114;
        v28 = v9;
        _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%@ CMIOExtensionPropertyClientStreamingFromDALDevice %{public}@ client %{public}@", (uint8_t *)&v23, 0x20u);

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      +[CMContinuityCaptureUserOnboarding sharedInstance](CMContinuityCaptureUserOnboarding, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
        v21 = 3;
      else
        v21 = 4;
      objc_msgSend(v19, "reportClientState:forClient:", v21, v9);

    }
  }
  return a3 != 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%p]"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_captureDeviceForEntity:(int64_t)a3 deviceUID:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_availableCaptureDevicesByIdentifiers, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "continuityCaptureDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "entity") == a3)
        {
          v12 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 240, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredStreamDevicesOnWifi, 0);
  objc_storeStrong((id *)&self->_observedDevices, 0);
  objc_storeStrong((id *)&self->_devicePublishLogs, 0);
  objc_storeStrong((id *)&self->_pendingTerminateDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableCaptureDevicesByIdentifiers, 0);
}

- (void)postEventOnAllDevices:(uint64_t)a1 data:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_227C5D000, a2, OS_LOG_TYPE_FAULT, "%@ Invalid event name", (uint8_t *)&v2, 0xCu);
}

@end
