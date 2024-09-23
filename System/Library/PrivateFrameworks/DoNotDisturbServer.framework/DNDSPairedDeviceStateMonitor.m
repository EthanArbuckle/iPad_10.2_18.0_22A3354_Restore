@implementation DNDSPairedDeviceStateMonitor

- (DNDSPairedDeviceStateMonitor)initWithLocalIDSService:(id)a3 cloudIDSService:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_source_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DNDSPairedDeviceStateMonitor;
  v9 = -[DNDSPairedDeviceStateMonitor init](&v18, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.donotdisturb.server.PairedDeviceStateMonitor", v10);
    v12 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = v11;

    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v9 + 2));
    v14 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v13;

    objc_storeStrong((id *)v9 + 3, a3);
    objc_storeStrong((id *)v9 + 4, a4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v15;

    DNDSRegisterSysdiagnoseDataProvider(v9);
  }

  return (DNDSPairedDeviceStateMonitor *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSPairedDeviceStateMonitor _endMonitoringForChanges](self, "_endMonitoringForChanges");
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSPairedDeviceStateMonitor;
  -[DNDSPairedDeviceStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  uint64_t v3;
  NSObject *coalescingTimer;
  NSObject *queue;
  _QWORD v6[5];
  _QWORD handler[5];

  v3 = MEMORY[0x1E0C809B0];
  coalescingTimer = self->_coalescingTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __38__DNDSPairedDeviceStateMonitor_resume__block_invoke;
  handler[3] = &unk_1E86A5970;
  handler[4] = self;
  dispatch_source_set_event_handler(coalescingTimer, handler);
  dispatch_source_set_timer((dispatch_source_t)self->_coalescingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_resume((dispatch_object_t)self->_coalescingTimer);
  queue = self->_queue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __38__DNDSPairedDeviceStateMonitor_resume__block_invoke_2;
  v6[3] = &unk_1E86A5970;
  v6[4] = self;
  dispatch_async(queue, v6);
}

uint64_t __38__DNDSPairedDeviceStateMonitor_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_informDelegatesOfPairedStateChange");
}

uint64_t __38__DNDSPairedDeviceStateMonitor_resume__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_beginMonitoringForChanges");
  objc_msgSend(*(id *)(a1 + 32), "_queue_updatePairedState");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateCloudDevices");
}

- (DNDAccountFeatureSupport)accountFeatureSupport
{
  NSUInteger v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  DNDSPairedDevice *pairedDevice;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NSSet count](self->_cloudDevices, "count");
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_cloudDevices;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 1;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "supportsSilenceLists", (_QWORD)v13))
          {
            v8 = 0;
            goto LABEL_14;
          }
        }
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v8 = 1;
    }
LABEL_14:

  }
  else
  {
    v8 = 1;
  }
  pairedDevice = self->_pairedDevice;
  if (pairedDevice)
    v11 = -[DNDSPairedDevice supportsSilenceLists](pairedDevice, "supportsSilenceLists");
  else
    v11 = 1;
  objc_msgSend(MEMORY[0x1E0D1D568], "accountFeaturesWithCloud:hasCloudDevices:paired:hasPairedDevices:", v8, v3 != 0, v11, pairedDevice != 0);
  return (DNDAccountFeatureSupport *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)pairedDeviceForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[DNDSPairedDeviceStateMonitor cloudDevices](self, "cloudDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  -[DNDSPairedDeviceStateMonitor pairedDevice](self, "pairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DNDSPairedDeviceStateMonitor pairedDevice](self, "pairedDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__DNDSPairedDeviceStateMonitor_pairedDeviceForDeviceIdentifier___block_invoke;
  v17[3] = &unk_1E86A70A0;
  v13 = v4;
  v18 = v13;
  objc_msgSend(v9, "bs_firstObjectPassingTest:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = DNDSLogPairedDeviceState;
    if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
      -[DNDSPairedDeviceStateMonitor pairedDeviceForDeviceIdentifier:].cold.1((uint64_t)v13, (uint64_t)v9, v15);
  }

  return v14;
}

uint64_t __64__DNDSPairedDeviceStateMonitor_pairedDeviceForDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_queue_updatePairedState
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  OS_dispatch_source *coalescingTimer;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSPairedDeviceStateMonitor pairedDevice](self, "pairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPairedDeviceStateMonitor _getCurrentPairedDevice](self, "_getCurrentPairedDevice");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 != (void *)v4 && (!v3 || !v4 || (objc_msgSend(v3, "isEqual:", v4) & 1) == 0))
  {
    -[DNDSPairedDeviceStateMonitor setPairedDevice:](self, "setPairedDevice:", v5);
    -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[DNDSPairedDeviceStateMonitor setPreviousPairedDevice:](self, "setPreviousPairedDevice:", v3);
    -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((void *)v8 == v5)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v5 || !v10)
      {

LABEL_19:
        v18 = (void *)DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)MEMORY[0x1E0CB37E8];
          v20 = v18;
          objc_msgSend(v19, "numberWithLongLong:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v3;
          v25 = 2114;
          v26 = v5;
          v27 = 2112;
          v28 = v21;
          _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Paired device state changed: from=%{public}@, to=%{public}@; waiting to coalesce for %@s",
            (uint8_t *)&v23,
            0x20u);

        }
        coalescingTimer = self->_coalescingTimer;
        v16 = dispatch_walltime(0, 2000000000);
        v15 = coalescingTimer;
        v17 = 1000000000;
LABEL_22:
        dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, v17);
        goto LABEL_23;
      }
      -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v5);

      if ((v13 & 1) == 0)
        goto LABEL_19;
    }
    v14 = DNDSLogPairedDeviceState;
    if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = v5;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Paired device state returned to previously-paired device. Cancelling delegate callbacks. device=%{public}@", (uint8_t *)&v23, 0xCu);
    }
    -[DNDSPairedDeviceStateMonitor setPreviousPairedDevice:](self, "setPreviousPairedDevice:", 0);
    v15 = self->_coalescingTimer;
    v16 = -1;
    v17 = -1;
    goto LABEL_22;
  }
  v6 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Paired device did not change: current=%{public}@", (uint8_t *)&v23, 0xCu);
  }
LABEL_23:

}

- (void)_queue_informDelegatesOfPairedStateChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_suspend((dispatch_object_t)self->_coalescingTimer);
  -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPairedDeviceStateMonitor pairedDevice](self, "pairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((void *)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !v4)
    {

LABEL_10:
      v12 = DNDSLogPairedDeviceState;
      if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = v3;
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Informing delegates of coalesced paired device state changed: from=%{public}@, to=%{public}@", (uint8_t *)&v14, 0x16u);
      }
      -[DNDSPairedDeviceStateMonitor delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pairedDeviceStateMonitor:pairingChangedFromDevice:toDevice:", self, v3, v4);

      goto LABEL_13;
    }
    -[DNDSPairedDeviceStateMonitor previousPairedDevice](self, "previousPairedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v4);

    if ((v10 & 1) == 0)
      goto LABEL_10;
  }
  v11 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring paired device state; coalesced back to the original device: %{public}@",
      (uint8_t *)&v14,
      0xCu);
  }
LABEL_13:
  -[DNDSPairedDeviceStateMonitor setPreviousPairedDevice:](self, "setPreviousPairedDevice:", 0);
  dispatch_resume((dispatch_object_t)self->_coalescingTimer);

}

- (id)_getCurrentPairedDevice
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  char v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  DNDSPairedDevice *v52;
  NSObject *v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unsigned int v58;
  DNDSPairedDeviceStateMonitor *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  _BYTE v74[10];
  void *v75;
  _BYTE v76[10];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  if (v4 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService devices](self->_localService, "devices");
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (!v6)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v63 = 0;
    v19 = 0;
    v58 = 1;
    goto LABEL_31;
  }
  v59 = self;
  v61 = v5;
  v7 = *(_QWORD *)v70;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v70 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v9, "isLocallyPaired") && objc_msgSend(v9, "isActive"))
      {
        v5 = v61;
        objc_msgSend(v61, "deviceForIDSDevice:", v9);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v6 = (void *)v21;
          v22 = objc_msgSend(v9, "isConnected");
          v23 = DNDSLogPairedDeviceState;
          v24 = os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v74 = v9;
              _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Found active paired device: %@", buf, 0xCu);
            }
            v17 = objc_msgSend(v9, "_dnds_assertionSyncProtocolVersion");
            v16 = objc_msgSend(v9, "_dnds_configurationSyncProtocolVersion");
            objc_msgSend(v9, "productBuildVersion");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v9, "_dnds_isIOS14EraOS");
            v63 = (void *)v25;
            if ((v26 & 1) != 0)
              v58 = 0;
            else
              v58 = objc_msgSend(v9, "_dnds_supportsSilenceLists");
            self = v59;
            objc_msgSend(v9, "uniqueIDOverride");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v9, "_dnds_pairedDeviceClass");
            v15 = v26;
            goto LABEL_31;
          }
          if (v24)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v74 = v9;
            _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring unconnected active paired device: %@", buf, 0xCu);
          }
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v63 = 0;
          v19 = 0;
        }
        else
        {
          v27 = DNDSLogPairedDeviceState;
          if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
            -[DNDSPairedDeviceStateMonitor _getCurrentPairedDevice].cold.2((uint64_t)v9, v27, v28, v29, v30, v31, v32, v33);
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v63 = 0;
          v19 = 0;
          v6 = 0;
        }
        v58 = 1;
        goto LABEL_31;
      }
      v10 = (void *)DNDSLogPairedDeviceState;
      if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = objc_msgSend(v9, "isConnected");
        v13 = objc_msgSend(v9, "isActive");
        v14 = objc_msgSend(v9, "isCloudConnected");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v74 = v12;
        *(_WORD *)&v74[4] = 1024;
        *(_DWORD *)&v74[6] = v13;
        LOWORD(v75) = 1024;
        *(_DWORD *)((char *)&v75 + 2) = v14;
        HIWORD(v75) = 2114;
        *(_QWORD *)v76 = 0;
        _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring device: isConnected=%{BOOL}d, isActive=%{BOOL}d, isCloudConnected:%{BOOL}d, device=%{public}@", buf, 0x1Eu);

      }
    }
    v6 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v6)
      continue;
    break;
  }
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v63 = 0;
  v19 = 0;
  v58 = 1;
  v5 = v61;
LABEL_31:

  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51700]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51728]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && v17 && v16)
  {
    v60 = v36;
    if (v34 && v35)
    {
      v55 = v18;
      v56 = v16;
      v57 = v17;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      -[IDSService devices](self->_cloudService, "devices");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (v38)
      {
        v54 = v15;
        v62 = v5;
        v39 = *(_QWORD *)v66;
        while (2)
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v66 != v39)
              objc_enumerationMutation(v37);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "uniqueIDOverride");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "isEqual:", v19);

            if ((v42 & 1) != 0)
            {
              v38 = 1;
              goto LABEL_54;
            }
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (v38)
            continue;
          break;
        }
LABEL_54:
        v5 = v62;
        v51 = v63;
        v15 = v54;
      }
      else
      {
        v51 = v63;
      }

      v52 = -[DNDSPairedDevice initWithLocalDeviceIdentifier:deviceClass:assertionSyncProtocolVersion:configurationSyncProtocolVersion:iOS14EraOS:supportsSilenceLists:pairingIdentifier:pairingDataStore:]([DNDSPairedDevice alloc], "initWithLocalDeviceIdentifier:deviceClass:assertionSyncProtocolVersion:configurationSyncProtocolVersion:iOS14EraOS:supportsSilenceLists:pairingIdentifier:pairingDataStore:", v19, v55, v57, v56, v15, v58, v34, v35);
      -[DNDSPairedDevice setDeviceName:](v52, "setDeviceName:", v60);
      -[DNDSPairedDevice setOsBuild:](v52, "setOsBuild:", v51);
      if (v57 >= 9)
        -[DNDSPairedDevice setICloudEnabled:](v52, "setICloudEnabled:", v38);
    }
    else
    {
      v53 = DNDSLogPairedDeviceState;
      if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v74 = v6;
        *(_WORD *)&v74[8] = 2114;
        v75 = v34;
        *(_WORD *)v76 = 2114;
        *(_QWORD *)&v76[2] = v35;
        _os_log_error_impl(&dword_1CB895000, v53, OS_LOG_TYPE_ERROR, "Pairing ID and data store of current watch was invalid; device=%{public}@, pairingID=%{public}@, pairingDataStore=%{public}@",
          buf,
          0x20u);
      }
      v52 = 0;
      v51 = v63;
    }
    v36 = v60;
  }
  else if (v6)
  {
    v43 = v36;
    v44 = DNDSLogPairedDeviceState;
    v51 = v63;
    if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
      -[DNDSPairedDeviceStateMonitor _getCurrentPairedDevice].cold.1((uint64_t)v6, v44, v45, v46, v47, v48, v49, v50);
    v52 = 0;
    v36 = v43;
  }
  else
  {
    v52 = 0;
    v51 = v63;
  }

  return v52;
}

- (void)_beginMonitoringForChanges
{
  const char *v3;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  -[IDSService addDelegate:queue:](self->_localService, "addDelegate:queue:", self, self->_queue);
  -[IDSService addDelegate:queue:](self->_cloudService, "addDelegate:queue:", self, self->_queue);
  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D517F8], "UTF8String");
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__DNDSPairedDeviceStateMonitor__beginMonitoringForChanges__block_invoke;
  v5[3] = &unk_1E86A7758;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_pairedDeviceDidChangeNotificationToken, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__DNDSPairedDeviceStateMonitor__beginMonitoringForChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Paired watch updated, will check for pairing change", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updatePairedState");

}

- (void)_queue_updateCloudDevices
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CB895000, log, OS_LOG_TYPE_DEBUG, "No change in cloud devices.", v1, 2u);
}

- (void)_endMonitoringForChanges
{
  int pairedDeviceDidChangeNotificationToken;

  -[IDSService removeDelegate:](self->_localService, "removeDelegate:", self);
  -[IDSService removeDelegate:](self->_cloudService, "removeDelegate:", self);
  pairedDeviceDidChangeNotificationToken = self->_pairedDeviceDidChangeNotificationToken;
  if (pairedDeviceDidChangeNotificationToken != -1)
    notify_cancel(pairedDeviceDidChangeNotificationToken);
}

- (void)_pairedDeviceStateChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DNDSPairedDeviceStateMonitor__pairedDeviceStateChanged___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__DNDSPairedDeviceStateMonitor__pairedDeviceStateChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Paired device state updated, will check for pairing change", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updatePairedState");
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Nearby devices changed, devices=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (objc_msgSend(v6, "isEqual:", self->_localService))
    -[DNDSPairedDeviceStateMonitor _queue_updatePairedState](self, "_queue_updatePairedState");

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Devices changed, devices=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (objc_msgSend(v6, "isEqual:", self->_cloudService))
  {
    -[DNDSPairedDeviceStateMonitor _queue_updateCloudDevices](self, "_queue_updateCloudDevices");
  }
  else if (objc_msgSend(v6, "isEqual:", self->_localService))
  {
    -[DNDSPairedDeviceStateMonitor _queue_updatePairedState](self, "_queue_updatePairedState");
  }

}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.PairedDevice");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _BYTE v44[128];
  _QWORD v45[5];
  _QWORD v46[7];

  v46[5] = *MEMORY[0x1E0C80C00];
  -[DNDSPairedDeviceStateMonitor pairedDevice](self, "pairedDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v45[0] = CFSTR("identifier");
    objc_msgSend(v5, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v7;
    v45[1] = CFSTR("class");
    DNDSStringFromPairedDeviceClass(objc_msgSend(v5, "deviceClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v8;
    v45[2] = CFSTR("assertion-protocol-version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionSyncProtocolVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v9;
    v45[3] = CFSTR("config-protocol-version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "configurationSyncProtocolVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v10;
    v45[4] = CFSTR("icloud-enabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isICloudEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v5, "deviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("name"));

    objc_msgSend(v5, "osBuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("build"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("paired-device"));
  }
  v35 = v5;
  v16 = (void *)MEMORY[0x1E0C99DE8];
  -[DNDSPairedDeviceStateMonitor cloudDevices](self, "cloudDevices", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[DNDSPairedDeviceStateMonitor cloudDevices](self, "cloudDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v19)
  {
    v20 = v19;
    v37 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v37)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v42[0] = CFSTR("identifier");
        objc_msgSend(v22, "deviceIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v23;
        v42[1] = CFSTR("class");
        DNDSStringFromPairedDeviceClass(objc_msgSend(v22, "deviceClass"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v24;
        v42[2] = CFSTR("assertion-protocol-version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "assertionSyncProtocolVersion"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v25;
        v42[3] = CFSTR("config-protocol-version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "configurationSyncProtocolVersion"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v43[3] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "mutableCopy");

        objc_msgSend(v22, "deviceName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("name"));

        objc_msgSend(v22, "osBuild");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("build"));

        objc_msgSend(v18, "addObject:", v28);
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v18, "count"))
  {
    v31 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v31, CFSTR("cloud-devices"));

  }
  v32 = (void *)objc_msgSend(v34, "copy");

  return v32;
}

- (DNDSPairedDevice)previousPairedDevice
{
  return (DNDSPairedDevice *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPreviousPairedDevice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (DNDSPairedDevice)pairedDevice
{
  return (DNDSPairedDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPairedDevice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSSet)cloudDevices
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCloudDevices:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (DNDSPairedDeviceStateMonitorDelegate)delegate
{
  return (DNDSPairedDeviceStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_previousPairedDevice, 0);
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
}

- (void)pairedDeviceForDeviceIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_7(&dword_1CB895000, a3, (uint64_t)a3, "Unable to find device with ID %@. Devices: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentPairedDevice
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Device not found in paired device registry: device=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
