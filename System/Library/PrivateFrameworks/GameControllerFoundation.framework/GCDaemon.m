@implementation GCDaemon

- (GCDaemon)init
{
  GCDaemon *v2;
  uint64_t v3;
  OS_dispatch_workloop *workloop;
  uint64_t v5;
  GCConfigXPCServiceConnection *configServiceConnection;
  void *v7;
  GCDaemon *v8;
  _QWORD handler[4];
  GCDaemon *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCDaemon;
  v2 = -[GCDaemon init](&v12, sel_init);
  objc_msgSend((id)objc_opt_class(), "createRootWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  workloop = v2->_workloop;
  v2->_workloop = (OS_dispatch_workloop *)v3;

  v5 = objc_opt_new();
  configServiceConnection = v2->_configServiceConnection;
  v2->_configServiceConnection = (GCConfigXPCServiceConnection *)v5;

  -[GCConfigXPCServiceConnection setClient:](v2->_configServiceConnection, "setClient:", v2);
  -[GCIPCRemoteConnection resume](v2->_configServiceConnection, "resume");
  v7 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __16__GCDaemon_init__block_invoke;
  handler[3] = &unk_1EA4D2B60;
  v8 = v2;
  v11 = v8;
  xpc_activity_register("com.apple.GameController.mobileasset.DB.update", v7, handler);

  return v8;
}

void __16__GCDaemon_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  os_activity_scope_state_s state;

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) && xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    v4 = _os_activity_create(&dword_1DC79E000, "[DB Mobile Asset Manager] Update DB Asset", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DETACHED);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    +[GCConfigXPCServiceServiceConnection connection:withClient:](GCConfigurationAssetManagementServiceConnection, "connection:withClient:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __16__GCDaemon_init__block_invoke_2;
    v9[3] = &unk_1EA4D2B38;
    v7 = v3;
    v10 = v7;
    v11 = &v12;
    objc_msgSend(v6, "checkForNewAssets:forceCatalogRefresh:completion:", 1, 0, v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v13[3] = xpc_activity_add_eligibility_changed_handler();
    xpc_activity_set_state((xpc_activity_t)v7, 4);

    _Block_object_dispose(&v12, 8);
    os_activity_scope_leave(&state);

  }
}

void __16__GCDaemon_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  xpc_activity_set_completion_status();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    xpc_activity_remove_eligibility_changed_handler();

}

uint64_t __16__GCDaemon_init__block_invoke_3(uint64_t a1, xpc_activity_t activity)
{
  uint64_t result;

  result = xpc_activity_should_defer(activity);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  return result;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_workloop *v8;
  GCDaemon *v9;
  void *configAssetManagementServiceConnection;
  void *v11;
  uint64_t v12;
  GCConfigurationAssetManagementServiceConnection *v13;
  _GCGenericDeviceDBServiceConnection *configGenericDeviceDBServiceConnection;
  void *v15;
  uint64_t v16;
  _GCGenericDeviceDBServiceConnection *v17;

  v6 = a3;
  v7 = a4;
  if (&unk_1F03A96F0 == v6)
  {
    v8 = self->_workloop;
    goto LABEL_13;
  }
  if (&unk_1F03A3B48 == v6)
  {
    v9 = self;
    objc_sync_enter(v9);
    configAssetManagementServiceConnection = v9->_configAssetManagementServiceConnection;
    if (!configAssetManagementServiceConnection)
    {
      +[GCConfigXPCServiceServiceConnection connection:withClient:](GCConfigurationAssetManagementServiceConnection, "connection:withClient:", v9->_configServiceConnection, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "result");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v9->_configAssetManagementServiceConnection;
      v9->_configAssetManagementServiceConnection = (GCConfigurationAssetManagementServiceConnection *)v12;

      configAssetManagementServiceConnection = v9->_configAssetManagementServiceConnection;
    }
    goto LABEL_12;
  }
  if (&unk_1F03A4588 == v6)
  {
    v9 = self;
    objc_sync_enter(v9);
    configGenericDeviceDBServiceConnection = v9->_configGenericDeviceDBServiceConnection;
    if (!configGenericDeviceDBServiceConnection
      || -[GCConfigXPCServiceServiceConnection isInvalid](configGenericDeviceDBServiceConnection, "isInvalid"))
    {
      +[GCConfigXPCServiceServiceConnection connection:withClient:](_GCGenericDeviceDBServiceConnection, "connection:withClient:", v9->_configServiceConnection, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "result");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v9->_configGenericDeviceDBServiceConnection;
      v9->_configGenericDeviceDBServiceConnection = (_GCGenericDeviceDBServiceConnection *)v16;

    }
    configAssetManagementServiceConnection = v9->_configGenericDeviceDBServiceConnection;
LABEL_12:
    v8 = configAssetManagementServiceConnection;
    objc_sync_exit(v9);

    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)createRootWorkloop
{
  return dispatch_workloop_create("GameController Root Workloop");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configGenericDeviceDBServiceConnection, 0);
  objc_storeStrong((id *)&self->_configAssetManagementServiceConnection, 0);
  objc_storeStrong((id *)&self->_configServiceConnection, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

@end
