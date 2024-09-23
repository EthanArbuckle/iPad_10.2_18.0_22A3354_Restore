@implementation GCConfigXPCService

- (GCConfigXPCService)init
{
  GCConfigXPCService *v2;
  uint64_t v3;
  OS_dispatch_workloop *workloop;
  dispatch_workloop_t v5;
  OS_dispatch_workloop *v6;
  _GCConfigurationDataManager *v7;
  _GCConfigurationDataManager *configurationManager;
  _GCGenericDeviceDB *v9;
  _GCGenericDeviceDB *genericDeviceDB;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCConfigXPCService;
  v2 = -[GCConfigXPCService init](&v12, sel_init);
  GCLookupDispatchWorkloop(v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  workloop = v2->_workloop;
  v2->_workloop = (OS_dispatch_workloop *)v3;

  if (!v2->_workloop)
  {
    v5 = dispatch_workloop_create("GameController Root Workloop");
    v6 = v2->_workloop;
    v2->_workloop = (OS_dispatch_workloop *)v5;

  }
  v7 = -[_GCConfigurationDataManager initWithProvider:]([_GCConfigurationDataManager alloc], "initWithProvider:", v2);
  configurationManager = v2->_configurationManager;
  v2->_configurationManager = v7;

  v9 = -[_GCGenericDeviceDB initWithProvider:]([_GCGenericDeviceDB alloc], "initWithProvider:", v2);
  genericDeviceDB = v2->_genericDeviceDB;
  v2->_genericDeviceDB = v9;

  return v2;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  id v5;
  OS_dispatch_workloop *v6;
  OS_dispatch_workloop *workloop;
  uint64_t v8;

  v5 = a3;
  if (&unk_1F03A96F0 == v5)
  {
    workloop = self->_workloop;
    if (workloop)
      goto LABEL_10;
  }
  if ((id)objc_opt_class() == v5)
  {
    v8 = 16;
LABEL_9:
    workloop = *(Class *)((char *)&self->super.isa + v8);
LABEL_10:
    v6 = workloop;
    goto LABEL_11;
  }
  if (&unk_1F03A4588 == v5)
  {
    v8 = 24;
    goto LABEL_9;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (void)connectToAssetManagementServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, GCConfigurationAssetManagementServiceXPCProxy *, _QWORD);
  NSObject *v8;
  void *v9;
  GCConfigurationAssetManagementServiceXPCProxy *v10;
  uint64_t v11;
  void *v12;
  os_activity_scope_state_s state;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, GCConfigurationAssetManagementServiceXPCProxy *, _QWORD))a4;
  v8 = _os_activity_create(&dword_1DC79E000, "[Config Service/XPC] Connect to AssetManagementService", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  GCLookupService(self, (objc_class *)&unk_1F03A3B48, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[GCConfigurationAssetManagementServiceXPCProxy initWithService:]([GCConfigurationAssetManagementServiceXPCProxy alloc], "initWithService:", v9);
    v7[2](v7, v10, 0);
  }
  else
  {
    v11 = *MEMORY[0x1E0CB2D68];
    v14[0] = *MEMORY[0x1E0CB2D50];
    v14[1] = v11;
    v15[0] = CFSTR("Connect to AssetManagementService failed");
    v15[1] = CFSTR("Service not found");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (GCConfigurationAssetManagementServiceXPCProxy *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCServiceError"), 1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, GCConfigurationAssetManagementServiceXPCProxy *, void *))v7)[2](v7, 0, v12);

  }
  os_activity_scope_leave(&state);

}

- (void)connectToGenericDeviceDBServiceWithClient:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _GCGenericDeviceDB *, _QWORD);
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a3;
  v7 = (void (**)(id, _GCGenericDeviceDB *, _QWORD))a4;
  v8 = _os_activity_create(&dword_1DC79E000, "[Config Service/XPC] Connect to GenericDeviceDBService", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  v7[2](v7, self->_genericDeviceDB, 0);
  os_activity_scope_leave(&v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericDeviceDB, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

@end
