@implementation MBNetworkPathMonitor

- (MBNetworkPathMonitor)initWithQueue:(id)a3
{
  id v5;
  MBNetworkPathMonitor *v6;
  MBNetworkPathMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBNetworkPathMonitor;
  v6 = -[MBNetworkPathMonitor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    atomic_store(0, (unsigned __int8 *)&v6->_started);
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_backupOnCellularSupport = 0;
    v7->_backupOnCellularSupportChanged = 0;
    v7->_wifiPathState = 0;
    v7->_cellularPathState = 0;
  }

  return v7;
}

- (MBNetworkPathMonitor)init
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  const char *Name;
  dispatch_queue_t v7;
  MBNetworkPathMonitor *v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (objc_class *)objc_opt_class();
  Name = class_getName(v5);
  v7 = dispatch_queue_create(Name, v4);
  v8 = -[MBNetworkPathMonitor initWithQueue:](self, "initWithQueue:", v7);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MBNetworkPathMonitor _cancelMonitors](self, "_cancelMonitors");
  v3.receiver = self;
  v3.super_class = (Class)MBNetworkPathMonitor;
  -[MBNetworkPathMonitor dealloc](&v3, sel_dealloc);
}

- (void)_cancelMonitors
{
  void *v3;
  NSObject *cellularPathMonitor;
  OS_nw_path_monitor *v5;
  NSObject *wifiPathMonitor;
  OS_nw_path_monitor *v7;
  NSObject *wiredPathMonitor;
  OS_nw_path_monitor *v9;

  -[MBNetworkPathMonitor dataSubscriptionMonitor](self, "dataSubscriptionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[MBNetworkPathMonitor setDataSubscriptionMonitor:](self, "setDataSubscriptionMonitor:", 0);
  cellularPathMonitor = self->_cellularPathMonitor;
  if (cellularPathMonitor)
  {
    nw_path_monitor_cancel(cellularPathMonitor);
    v5 = self->_cellularPathMonitor;
    self->_cellularPathMonitor = 0;

  }
  wifiPathMonitor = self->_wifiPathMonitor;
  if (wifiPathMonitor)
  {
    nw_path_monitor_cancel(wifiPathMonitor);
    v7 = self->_wifiPathMonitor;
    self->_wifiPathMonitor = 0;

  }
  wiredPathMonitor = self->_wiredPathMonitor;
  if (wiredPathMonitor)
  {
    nw_path_monitor_cancel(wiredPathMonitor);
    v9 = self->_wiredPathMonitor;
    self->_wiredPathMonitor = 0;

  }
}

- (void)_performBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_block_t v18;
  id obj;
  _QWORD block[4];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  -[MBNetworkPathMonitor initialCellularStateGroup](self, "initialCellularStateGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  -[MBNetworkPathMonitor initialWiFiStateGroup](self, "initialWiFiStateGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  -[MBNetworkPathMonitor initialWiredStateGroup](self, "initialWiredStateGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  -[MBNetworkPathMonitor initialBackupOnCellularSupportGroup](self, "initialBackupOnCellularSupportGroup");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "addObject:", v8);
  v9 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      v15 = v8;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v14);

        dispatch_group_enter(v9);
        -[MBNetworkPathMonitor queue](self, "queue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __38__MBNetworkPathMonitor__performBlock___block_invoke;
        block[3] = &unk_1E995CE70;
        v21 = v9;
        dispatch_group_notify(v8, v16, block);

        ++v14;
        v15 = v8;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[MBNetworkPathMonitor queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v9, v17, v18);

}

void __38__MBNetworkPathMonitor__performBlock___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __30__MBNetworkPathMonitor_cancel__block_invoke;
  v2[3] = &unk_1E995CE70;
  v2[4] = self;
  -[MBNetworkPathMonitor _performBlock:](self, "_performBlock:", v2);
}

uint64_t __30__MBNetworkPathMonitor_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelMonitors");
}

+ (const)_pathTypeStringWithPathType:(int)a3
{
  if ((a3 - 1) > 2)
    return "???";
  else
    return off_1E995D0B0[a3 - 1];
}

- (BOOL)_updateState:(id *)a3 path:(id)a4 pathType:(int)a5
{
  uint64_t v5;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  nw_path_status_t status;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 is_expensive;
  _BOOL4 is_constrained;
  BOOL v22;
  NSObject *v23;
  _BOOL4 var1;
  _BOOL4 var2;
  _BOOL4 var3;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  unsigned __int32 v37;
  __int16 v38;
  _DWORD v39[7];

  v5 = *(_QWORD *)&a5;
  *(_QWORD *)&v39[5] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[MBNetworkPathMonitor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!a3)
    -[MBNetworkPathMonitor _updateState:path:pathType:].cold.1();
  if (!(_DWORD)v5)
    -[MBNetworkPathMonitor _updateState:path:pathType:].cold.2();
  v10 = objc_msgSend((id)objc_opt_class(), "_pathTypeStringWithPathType:", v5);
  status = nw_path_get_status(v8);
  MBGetDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v35 = v10;
    v36 = 1024;
    v37 = status;
    v38 = 2114;
    *(_QWORD *)v39 = v8;
    _os_log_impl(&dword_1D5213000, v12, OS_LOG_TYPE_DEBUG, "%{public}s path changed, status:%d - %{public}@", buf, 0x1Cu);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"%{public}s path changed, status:%d - %{public}@", v13, v14, v15, v16, v17, v18, v10);
  }

  v19 = (status & 0xFFFFFFFD) == 1;
  is_expensive = nw_path_is_expensive(v8);
  is_constrained = nw_path_is_constrained(v8);
  if (a3->var0 && a3->var1 == v19 && a3->var2 == is_expensive && a3->var3 == is_constrained)
  {
    v22 = 0;
  }
  else
  {
    a3->var0 = 1;
    a3->var1 = v19;
    a3->var2 = is_expensive;
    a3->var3 = is_constrained;
    MBGetDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      var1 = a3->var1;
      var2 = a3->var2;
      var3 = a3->var3;
      *(_DWORD *)buf = 136315906;
      v35 = v10;
      v36 = 1024;
      v37 = var1;
      v38 = 1024;
      v39[0] = var2;
      LOWORD(v39[1]) = 1024;
      *(_DWORD *)((char *)&v39[1] + 2) = var3;
      _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_DEFAULT, "%s, available:%d, expensive:%d, constrained:%d", buf, 0x1Eu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%s, available:%d, expensive:%d, constrained:%d", v27, v28, v29, v30, v31, v32, v10);
    }

    v22 = 1;
  }

  return v22;
}

- (void)_handleWiFiStateChange
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, _QWORD);

  -[MBNetworkPathMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_wifiPathState.isMonitored && self->_wiredPathState.isMonitored)
  {
    v4 = 44;
    if (!self->_wiredPathState.isAvailable)
      v4 = 40;
    v5 = *(unsigned int *)((char *)&self->super.isa + v4);
    -[MBNetworkPathMonitor networkPathUpdateHandler](self, "networkPathUpdateHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MBNetworkPathMonitor networkPathUpdateHandler](self, "networkPathUpdateHandler");
      v7 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 1, v5);

    }
  }
}

- (void)_startWiFiMonitor
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD update_handler[4];
  id v11;
  id location;

  v3 = nw_path_monitor_create_with_type(nw_interface_type_wifi);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke;
  update_handler[3] = &unk_1E995D018;
  objc_copyWeak(&v11, &location);
  nw_path_monitor_set_update_handler(v3, update_handler);
  -[MBNetworkPathMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v3, v5);

  objc_storeStrong((id *)&self->_wifiPathMonitor, v3);
  v6 = nw_path_monitor_create_with_type(nw_interface_type_wired);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke_2;
  v8[3] = &unk_1E995D018;
  objc_copyWeak(&v9, &location);
  nw_path_monitor_set_update_handler(v6, v8);
  -[MBNetworkPathMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v6, v7);

  objc_storeStrong((id *)&self->_wiredPathMonitor, v6);
  nw_path_monitor_start(v3);
  nw_path_monitor_start(v6);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke(uint64_t a1, void *a2)
{
  char *WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_updateState:path:pathType:", WeakRetained + 40, v6, 1))
      objc_msgSend(v4, "_handleWiFiStateChange");
    objc_msgSend(v4, "initialWiFiStateGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "setInitialWiFiStateGroup:", 0);
      dispatch_group_leave(v5);
    }

  }
}

void __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int *WeakRetained;
  unsigned int *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  id v8;

  v8 = a2;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_updateState:path:pathType:", WeakRetained + 11, v8, 3))
    {
      objc_msgSend(v4, "_handleWiFiStateChange");
      objc_msgSend(v4, "networkPathUpdateHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "networkPathUpdateHandler");
        v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v6[2](v6, 3, v4[11]);

      }
    }
    objc_msgSend(v4, "initialWiredStateGroup");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "setInitialWiredStateGroup:", 0);
      dispatch_group_leave(v7);
    }

  }
}

- (void)_handleCellularStateChange:(id)a3 backupOnCellularSupport:(unint64_t)a4
{
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[MBNetworkPathMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (__PAIR64__((*(unsigned int *)&a3 >> 8) & 1, a3.var0) == __PAIR64__(self->_cellularPathState.isAvailable, self->_cellularPathState.isMonitored)&& (HIWORD(*(unsigned int *)&a3) & 1) == self->_cellularPathState.isExpensive&& (HIBYTE(*(unsigned int *)&a3) & 1) == self->_cellularPathState.isConstrained)
  {
    v8 = 0;
  }
  else
  {
    self->_cellularPathState = ($AA2DF90B845B79CAB9D40DC176B17A2E)a3;
    v8 = 1;
  }
  if (self->_backupOnCellularSupportChanged && self->_backupOnCellularSupport == a4)
  {
    if (!v8)
      return;
    v9 = 0;
  }
  else
  {
    self->_backupOnCellularSupport = a4;
    v9 = 1;
    self->_backupOnCellularSupportChanged = 1;
  }
  v10 = objc_msgSend((id)objc_opt_class(), "_pathTypeStringWithPathType:", 2);
  MBGetDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v23 = v10;
    v24 = 1024;
    v25 = (*(unsigned int *)&a3 >> 8) & 1;
    v26 = 1024;
    v27 = HIWORD(*(unsigned int *)&a3) & 1;
    v28 = 1024;
    v29 = HIBYTE(*(unsigned int *)&a3) & 1;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s, available:%d, expensive:%d, constrained:%d, backupOnCellularSupport:0x%lx", buf, 0x28u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%{public}s, available:%d, expensive:%d, constrained:%d, backupOnCellularSupport:0x%lx", v12, v13, v14, v15, v16, v17, v10);
  }

  if (v8)
  {
    -[MBNetworkPathMonitor networkPathUpdateHandler](self, "networkPathUpdateHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MBNetworkPathMonitor networkPathUpdateHandler](self, "networkPathUpdateHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v19[2](v19, 2, *(unsigned int *)&a3);

    }
  }
  if (v9)
  {
    -[MBNetworkPathMonitor backupOnCellularSupportUpdateHandler](self, "backupOnCellularSupportUpdateHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[MBNetworkPathMonitor backupOnCellularSupportUpdateHandler](self, "backupOnCellularSupportUpdateHandler");
      v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v21[2](v21, a4);

    }
  }
}

- (void)_startCellularMonitor
{
  NSObject *v3;
  MBCellularDataSubscriptionMonitor *v4;
  void *v5;
  MBCellularDataSubscriptionMonitor *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD update_handler[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[MBNetworkPathMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = [MBCellularDataSubscriptionMonitor alloc];
  -[MBNetworkPathMonitor queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MBCellularDataSubscriptionMonitor initWithQueue:timeout:](v4, "initWithQueue:timeout:", v5, 30);

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke;
  v12[3] = &unk_1E995D040;
  objc_copyWeak(&v13, &location);
  -[MBCellularDataSubscriptionMonitor setBackupOnCellularSupportHandler:](v6, "setBackupOnCellularSupportHandler:", v12);
  -[MBNetworkPathMonitor setDataSubscriptionMonitor:](self, "setDataSubscriptionMonitor:", v6);
  v8 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  update_handler[0] = v7;
  update_handler[1] = 3221225472;
  update_handler[2] = __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke_2;
  update_handler[3] = &unk_1E995D018;
  objc_copyWeak(&v11, &location);
  nw_path_monitor_set_update_handler(v8, update_handler);
  -[MBNetworkPathMonitor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v8, v9);

  objc_storeStrong((id *)&self->_cellularPathMonitor, v8);
  -[MBCellularDataSubscriptionMonitor start](v6, "start");
  nw_path_monitor_start(v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int *WeakRetained;
  NSObject *v4;
  unsigned int *v5;

  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleCellularStateChange:backupOnCellularSupport:", WeakRetained[12], a2);
    objc_msgSend(v5, "initialBackupOnCellularSupportGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v5, "setInitialBackupOnCellularSupportGroup:", 0);
      dispatch_group_leave(v4);
    }

    WeakRetained = v5;
  }

}

void __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  nw_path_status_t status;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL4 is_expensive;
  _BOOL4 is_constrained;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  nw_path_status_t v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_pathTypeStringWithPathType:", 2);
    status = nw_path_get_status(v3);
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v22 = v5;
      v23 = 1024;
      v24 = status;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEBUG, "%{public}s path changed, status:%d - %{public}@", buf, 0x1Cu);
      _MBLog(CFSTR("DEBUG"), (uint64_t)"%{public}s path changed, status:%d - %{public}@", v8, v9, v10, v11, v12, v13, v5);
    }

    v14 = status & 0xFFFFFFFD;
    is_expensive = nw_path_is_expensive(v3);
    is_constrained = nw_path_is_constrained(v3);
    v17 = 0x1000000;
    if (!is_constrained)
      v17 = 0;
    v18 = 0x10000;
    if (!is_expensive)
      v18 = 0;
    v19 = 257;
    if (v14 != 1)
      v19 = 1;
    objc_msgSend(WeakRetained, "_handleCellularStateChange:backupOnCellularSupport:", v19 | v18 | v17, WeakRetained[7]);
    objc_msgSend(WeakRetained, "initialCellularStateGroup");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(WeakRetained, "setInitialCellularStateGroup:", 0);
      dispatch_group_leave(v20);
    }

  }
}

- (void)start
{
  BOOL *p_started;
  unsigned __int8 v4;
  dispatch_group_t v5;
  NSObject *v6;
  dispatch_group_t v7;
  NSObject *v8;
  dispatch_group_t v9;
  NSObject *v10;
  dispatch_group_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];

  p_started = &self->_started;
  do
    v4 = __ldaxr((unsigned __int8 *)p_started);
  while (__stlxr(1u, (unsigned __int8 *)p_started));
  if ((v4 & 1) == 0)
  {
    v5 = dispatch_group_create();
    -[MBNetworkPathMonitor setInitialWiFiStateGroup:](self, "setInitialWiFiStateGroup:", v5);

    -[MBNetworkPathMonitor initialWiFiStateGroup](self, "initialWiFiStateGroup");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v6);

    v7 = dispatch_group_create();
    -[MBNetworkPathMonitor setInitialWiredStateGroup:](self, "setInitialWiredStateGroup:", v7);

    -[MBNetworkPathMonitor initialWiredStateGroup](self, "initialWiredStateGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v8);

    v9 = dispatch_group_create();
    -[MBNetworkPathMonitor setInitialCellularStateGroup:](self, "setInitialCellularStateGroup:", v9);

    -[MBNetworkPathMonitor initialCellularStateGroup](self, "initialCellularStateGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    v11 = dispatch_group_create();
    -[MBNetworkPathMonitor setInitialBackupOnCellularSupportGroup:](self, "setInitialBackupOnCellularSupportGroup:", v11);

    -[MBNetworkPathMonitor initialBackupOnCellularSupportGroup](self, "initialBackupOnCellularSupportGroup");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v12);

    -[MBNetworkPathMonitor queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__MBNetworkPathMonitor_start__block_invoke;
    block[3] = &unk_1E995CE70;
    block[4] = self;
    dispatch_async(v13, block);

  }
}

uint64_t __29__MBNetworkPathMonitor_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startWiFiMonitor");
  return objc_msgSend(*(id *)(a1 + 32), "_startCellularMonitor");
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivity
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  unint64_t v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  $1C6001547D93A6C6CE4901F2C331F3E5 result;

  -[MBNetworkPathMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v17 = 0;
  v18 = 0;
  v16 = &unk_1D526B3D6;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__MBNetworkPathMonitor_networkConnectivity__block_invoke;
  v10[3] = &unk_1E995D068;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  -[MBNetworkPathMonitor fetchNetworkConnectivityWithBlock:](self, "fetchNetworkConnectivityWithBlock:", v10);
  MBGroupWaitForever(v5);
  v6 = v14[4];
  v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  v8 = v6;
  v9 = v7;
  result.var4 = v9;
  result.var0 = v8;
  result.var1 = BYTE1(v8);
  result.var2 = BYTE2(v8);
  result.var3 = HIDWORD(v8);
  return result;
}

void __43__MBNetworkPathMonitor_networkConnectivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)fetchNetworkConnectivityWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__MBNetworkPathMonitor_fetchNetworkConnectivityWithBlock___block_invoke;
  v6[3] = &unk_1E995D090;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MBNetworkPathMonitor _performBlock:](self, "_performBlock:", v6);

}

uint64_t __58__MBNetworkPathMonitor_fetchNetworkConnectivityWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "dataSubscriptionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellularRadioType");

  objc_msgSend(*(id *)(a1 + 32), "dataSubscriptionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backupOnCellularSupport");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)backupOnCellularSupport
{
  void *v2;
  unint64_t v3;

  -[MBNetworkPathMonitor dataSubscriptionMonitor](self, "dataSubscriptionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backupOnCellularSupport");

  return v3;
}

- (int)cellularRadioType
{
  void *v2;
  int v3;

  -[MBNetworkPathMonitor dataSubscriptionMonitor](self, "dataSubscriptionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cellularRadioType");

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)networkPathUpdateHandler
{
  return self->_networkPathUpdateHandler;
}

- (void)setNetworkPathUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)backupOnCellularSupportUpdateHandler
{
  return self->_backupOnCellularSupportUpdateHandler;
}

- (void)setBackupOnCellularSupportUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_group)initialWiFiStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInitialWiFiStateGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_group)initialWiredStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInitialWiredStateGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_group)initialCellularStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInitialCellularStateGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OS_dispatch_group)initialBackupOnCellularSupportGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInitialBackupOnCellularSupportGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (MBCellularDataSubscriptionMonitor)dataSubscriptionMonitor
{
  return (MBCellularDataSubscriptionMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDataSubscriptionMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSubscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_initialBackupOnCellularSupportGroup, 0);
  objc_storeStrong((id *)&self->_initialCellularStateGroup, 0);
  objc_storeStrong((id *)&self->_initialWiredStateGroup, 0);
  objc_storeStrong((id *)&self->_initialWiFiStateGroup, 0);
  objc_storeStrong(&self->_backupOnCellularSupportUpdateHandler, 0);
  objc_storeStrong(&self->_networkPathUpdateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cellularPathMonitor, 0);
  objc_storeStrong((id *)&self->_wiredPathMonitor, 0);
  objc_storeStrong((id *)&self->_wifiPathMonitor, 0);
}

- (void)_updateState:path:pathType:.cold.1()
{
  __assert_rtn("-[MBNetworkPathMonitor _updateState:path:pathType:]", "MBNetworkPathMonitor.m", 126, "state");
}

- (void)_updateState:path:pathType:.cold.2()
{
  __assert_rtn("-[MBNetworkPathMonitor _updateState:path:pathType:]", "MBNetworkPathMonitor.m", 127, "pathType != MBNetworkPathTypeUnspecified");
}

@end
