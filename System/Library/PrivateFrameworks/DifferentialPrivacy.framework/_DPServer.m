@implementation _DPServer

- (BOOL)metadataMethodsAllowed
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.private.dprivacyd.metadata.allow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (_DPServer)init
{
  NSObject *v3;
  void *v4;
  void *v5;
  _DPServer *v6;

  +[_DPLog daemon](_DPLog, "daemon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_DPServer init].cold.1(v3);

  +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPStrings reportsDirectoryPath](_DPStrings, "reportsDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_DPServer initWithDatabaseDirectoryPath:reportsDirectoryPath:enablePeriodicTasks:enterSandbox:](self, "initWithDatabaseDirectoryPath:reportsDirectoryPath:enablePeriodicTasks:enterSandbox:", v4, v5, 1, 1);

  return v6;
}

- (void)setupPeriodicTasksWith:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _DPTokenFetcher *v9;
  id v10;

  v10 = a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.ReportFilesMaintenance"), v10);
  objc_msgSend(v10, "scheduleStorageCullingWithName:database:", CFSTR("com.apple.DifferentialPrivacy.StorageCulling"), v10);
  objc_msgSend(v10, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.StorageMaintenance"), v10);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.TransparencyLogMaintenance"), v10);
  if (!+[_DPDeviceInfo isRunningAsLaunchDaemon](_DPDeviceInfo, "isRunningAsLaunchDaemon"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.DediscoReporter"), v10);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.PrivacyBudgetMaintenance"), v10);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.runtimeBlacklistMaintenance"), v10);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.serverBlacklistUpdate"), v10);
    v9 = -[_DPTokenFetcher initWithTaskName:]([_DPTokenFetcher alloc], "initWithTaskName:", CFSTR("com.apple.DifferentialPrivacy.TokenFetcher"));
    -[_DPTokenFetcher scheduleMaintenanceWithName:database:](v9, "scheduleMaintenanceWithName:database:", CFSTR("com.apple.DifferentialPrivacy.TokenFetcher"), v10);

  }
}

- (_DPServer)initWithDatabaseDirectoryPath:(id)a3 reportsDirectoryPath:(id)a4 enablePeriodicTasks:(BOOL)a5 enterSandbox:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _DPServer *v16;
  uint64_t v17;
  _DPStorage *db;
  id v19;
  void *v20;
  uint64_t v21;
  NSXPCListener *listener;
  NSObject *v24;
  objc_super v25;
  _QWORD block[4];
  id v27;
  id v28;

  v6 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v12 = v10;
  if (!v11)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_DPServer initWithDatabaseDirectoryPath:reportsDirectoryPath:enablePeriodicTasks:enterSandbox:].cold.1(v24);

    exit(1);
  }
  v13 = v12;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __one_time_setup_block_invoke;
  block[3] = &unk_1E95D9470;
  v27 = v11;
  v28 = v12;
  if (one_time_setup_onceToken == -1)
  {
    v14 = v11;
    v15 = v12;
  }
  else
  {
    dispatch_once(&one_time_setup_onceToken, block);
    v14 = v27;
    v15 = v28;
  }

  v25.receiver = self;
  v25.super_class = (Class)_DPServer;
  v16 = -[_DPServer init](&v25, sel_init);
  if (v16)
  {
    +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v11, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    db = v16->_db;
    v16->_db = (_DPStorage *)v17;

    +[_DPPrivacyBudgetProperties initializeAllBudgetProperties](_DPPrivacyBudgetProperties, "initializeAllBudgetProperties");
    +[_DPPrivacyBudget createBudgetRecordsIn:](_DPPrivacyBudget, "createBudgetRecordsIn:", v16->_db);
    +[_DPBlacklistManager processRuntimeBlacklist](_DPBlacklistManager, "processRuntimeBlacklist");
    if (v6)
      -[_DPServer setupPeriodicTasksWith:](v16, "setupPeriodicTasksWith:", v16->_db);
    v19 = objc_alloc(MEMORY[0x1E0CB3B58]);
    +[_DPStrings machServiceName](_DPStrings, "machServiceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithMachServiceName:", v20);
    listener = v16->_listener;
    v16->_listener = (NSXPCListener *)v21;

    -[NSXPCListener setDelegate:](v16->_listener, "setDelegate:", v16);
  }

  return v16;
}

- (void)start
{
  NSObject *v2;
  uint8_t v3[16];

  -[NSXPCListener resume](self->_listener, "resume");
  +[_DPLog daemon](_DPLog, "daemon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D3FAA000, v2, OS_LOG_TYPE_INFO, "dprivacyd: accepting work now", v3, 2u);
  }

  dispatch_main();
}

+ (BOOL)shouldNotRecord:(id)a3 forKey:(id)a4 count:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "approvedForNonDNU");
  v11 = objc_msgSend(v9, "transport");
  if (+[_DPDeviceInfo isDataCollectionEnabled](_DPDeviceInfo, "isDataCollectionEnabled")
    || (v10 & 1) != 0)
  {
    if (!+[_DPDeviceInfo isDisabledByTaskingForTransport:](_DPDeviceInfo, "isDisabledByTaskingForTransport:", v11))
    {
      v17 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Disabled by Tasking (%lu)"), v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog daemon](_DPLog, "daemon");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_DPServer shouldNotRecord:forKey:count:].cold.1();

    for (; a5; --a5)
    {
      v16 = (objc_msgSend(v9, "telemetryAllowed") & 1) != 0
         || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
      LOBYTE(v20) = v16;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v8, 1, 0, 0, 102, v12, v20);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Disabled by D&U switch and not approved for non D&U"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog daemon](_DPLog, "daemon");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[_DPServer shouldNotRecord:forKey:count:].cold.1();

    for (; a5; --a5)
    {
      v14 = (objc_msgSend(v9, "telemetryAllowed") & 1) != 0
         || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
      LOBYTE(v19) = v14;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v8, 1, 0, 0, 101, v12, v19);
    }
  }

  v17 = 1;
LABEL_21:

  return v17;
}

- (void)recordValues:(id)a3 forKey:(id)a4 usingSelector:(SEL)a5
{
  -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", a3, 0, a4, a5);
}

- (void)recordValues:(id)a3 metadata:(id)a4 forKey:(id)a5 usingSelector:(SEL)a6
{
  id v10;
  _DPDatabaseRecorder *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v19 = a5;
  v11 = -[_DPDatabaseRecorder initWithKey:storage:]([_DPDatabaseRecorder alloc], "initWithKey:storage:", v19, self->_db);
  v12 = objc_msgSend(v20, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = v12;
    do
    {
      v16 = (void *)MEMORY[0x1D8256B78]();
      if (v15 >= 128)
        v17 = 128;
      else
        v17 = v15;
      objc_msgSend(v20, "subarrayWithRange:", v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder performSelector:withObject:withObject:](v11, "performSelector:withObject:withObject:", a6, v18, v10);
      v15 -= v17;

      objc_autoreleasePoolPop(v16);
      v14 += 128;
    }
    while (v14 < v13);
  }

}

- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordBitValues_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v18 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v18;
      }
      while (v18 < objc_msgSend(v11, "count"));
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB2D68];
    v26[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v22);

    goto LABEL_14;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v20 = (void *)os_transaction_create();
    v23 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v24 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v24;
      }
      while (v24 < objc_msgSend(v11, "count"));
    }
    v14[2](v14, 1, 0);
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordBitValues_metadata_);
    objc_autoreleasePoolPop(v23);
LABEL_14:

    goto LABEL_15;
  }
  +[_DPLog daemon](_DPLog, "daemon");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[_DPServer recordBitValues:metadata:forKey:withReply:].cold.1();

  v14[2](v14, 1, 0);
LABEL_15:

}

- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordBitVectors_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v17;
      }
      while (v17 < objc_msgSend(v11, "count"));
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);

    goto LABEL_12;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v19 = (void *)os_transaction_create();
    v22 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v23 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v23;
      }
      while (v23 < objc_msgSend(v11, "count"));
    }
    v14[2](v14, 1, 0);
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordBitVectors_metadata_);
    objc_autoreleasePoolPop(v22);
LABEL_12:

    goto LABEL_13;
  }
  v14[2](v14, 1, 0);
LABEL_13:

}

- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordFloatVectors_);
    v10[2](v10, 1, 0);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v17;
      }
      while (v17 < objc_msgSend(v11, "count"));
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);

    goto LABEL_12;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v19 = (void *)os_transaction_create();
    v22 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v23 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v23;
      }
      while (v23 < objc_msgSend(v11, "count"));
    }
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordFloatVectors_metadata_);
    v14[2](v14, 1, 0);
    objc_autoreleasePoolPop(v22);
LABEL_12:

    goto LABEL_13;
  }
  v14[2](v14, 1, 0);
LABEL_13:

}

- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordNumbers_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v17;
      }
      while (v17 < objc_msgSend(v11, "count"));
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);

    goto LABEL_12;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v19 = (void *)os_transaction_create();
    v22 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v23 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v23;
      }
      while (v23 < objc_msgSend(v11, "count"));
    }
    v14[2](v14, 1, 0);
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordNumbers_metadata_);
    objc_autoreleasePoolPop(v22);
LABEL_12:

    goto LABEL_13;
  }
  v14[2](v14, 1, 0);
LABEL_13:

}

- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordNumbersVectors_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v17;
      }
      while (v17 < objc_msgSend(v11, "count"));
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);

    goto LABEL_12;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v19 = (void *)os_transaction_create();
    v22 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v23 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v23;
      }
      while (v23 < objc_msgSend(v11, "count"));
    }
    v14[2](v14, 1, 0);
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordNumbersVectors_metadata_);
    objc_autoreleasePoolPop(v22);
LABEL_12:

    goto LABEL_13;
  }
  v14[2](v14, 1, 0);
LABEL_13:

}

- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v16, "count"));

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v16, "count"))
    {
      v15 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
        ++v15;
      }
      while (v15 < objc_msgSend(v16, "count"));
    }
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v16, v9, sel_recordStrings_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!-[_DPServer metadataMethodsAllowed](self, "metadataMethodsAllowed"))
  {
    if (objc_msgSend(v11, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 0);
        ++v17;
      }
      while (v17 < objc_msgSend(v11, "count"));
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    +[_DPStrings errorDomain](_DPStrings, "errorDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("Missing entitlement required for this method");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);

    goto LABEL_12;
  }
  v15 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!(_DWORD)v15)
  {
    v19 = (void *)os_transaction_create();
    v22 = (void *)MEMORY[0x1D8256B78]();
    if (objc_msgSend(v11, "count"))
    {
      v23 = 0;
      do
      {
        -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v13, 1);
        ++v23;
      }
      while (v23 < objc_msgSend(v11, "count"));
    }
    v14[2](v14, 1, 0);
    -[_DPServer recordValues:metadata:forKey:usingSelector:](self, "recordValues:metadata:forKey:usingSelector:", v11, v12, v13, sel_recordStrings_metadata_);
    objc_autoreleasePoolPop(v22);
LABEL_12:

    goto LABEL_13;
  }
  v14[2](v14, 1, 0);
LABEL_13:

}

- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v11 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, 1);

  if ((_DWORD)v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v13 = (void *)os_transaction_create();
    v14 = (void *)MEMORY[0x1D8256B78]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:", v9, 1);
    v10[2](v10, 1, 0);
    -[_DPServer recordValues:forKey:usingSelector:](self, "recordValues:forKey:usingSelector:", v15, v9, sel_recordWords_);
    objc_autoreleasePoolPop(v14);

  }
}

- (void)reportsNotYetSubmittedWithReply:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t, void *, _QWORD);

  v8 = (void (**)(id, uint64_t, void *, _QWORD))a3;
  v4 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x1D8256B78]();
  +[_DPStrings reportsDirectoryPath](_DPStrings, "reportsDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPServer reportsNotYetSubmittedInDirecory:](self, "reportsNotYetSubmittedInDirecory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, 1, v7, 0);
  objc_autoreleasePoolPop(v5);

}

- (id)reportsNotYetSubmittedInDirecory:(id)a3
{
  return +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", a3);
}

- (void)retireReports:(id)a3 withReply:(id)a4
{
  void (**v6)(id, _BOOL8, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  v7 = (void *)os_transaction_create();
  v8 = (void *)MEMORY[0x1D8256B78]();
  +[_DPStrings reportsDirectoryPath](_DPStrings, "reportsDirectoryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_DPServer retireReports:inDirectory:](self, "retireReports:inDirectory:", v11, v9);

  v6[2](v6, v10, 0);
  objc_autoreleasePoolPop(v8);

}

- (BOOL)retireReports:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8256B78]();
  +[_DPReportFilesMaintainer retiredReportsPath:](_DPReportFilesMaintainer, "retiredReportsPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[_DPReportFilesMaintainer retireFiles:toDirectory:](_DPReportFilesMaintainer, "retireFiles:toDirectory:", v5, v8);

  objc_autoreleasePoolPop(v7);
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.dprivacyd.allow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    _DPDaemonInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");

    v9 = 1;
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DPServer listener:shouldAcceptNewConnection:].cold.1(v5);

    objc_msgSend(v5, "invalidate");
    v9 = 0;
  }

  return v9;
}

- (void)donateDonationReceivedEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v10 = a3;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "telemetryAllowed") & 1) != 0
    || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
  if (v4)
    v7 = 0;
  else
    v7 = 103;
  if (v4)
    v8 = 0;
  else
    v8 = CFSTR("Metadata methods not allowed");
  LOBYTE(v9) = v6;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v10, 1, 0, v4, v7, v8, v9);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (_DPStorage)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)init
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1D3FAA000, a1, v3, "DataBaseDirectoryPath: %@", v4);

}

- (void)initWithDatabaseDirectoryPath:(os_log_t)log reportsDirectoryPath:enablePeriodicTasks:enterSandbox:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "nil databaseDirectoryPath, exiting.", v1, 2u);
}

+ (void)shouldNotRecord:forKey:count:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_3(&dword_1D3FAA000, v0, v1, "%@ for key: %@");
  OUTLINED_FUNCTION_1();
}

- (void)recordBitValues:metadata:forKey:withReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1D3FAA000, v0, v1, "Skipping recording for key=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "processIdentifier");
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_1();
}

@end
