@implementation DMMigrationPluginWrapperConnection

+ (id)connection
{
  return objc_alloc_init(DMMigrationPluginWrapperConnection);
}

- (DMMigrationPluginWrapperConnection)init
{
  DMMigrationPluginWrapperConnection *v2;
  DMXPCConnection *v3;
  DMXPCConnection *connection;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMMigrationPluginWrapperConnection;
  v2 = -[DMMigrationPluginWrapperConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = -[DMXPCConnection initWithServiceName:]([DMXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.migrationpluginwrapper"));
    connection = v2->_connection;
    v2->_connection = v3;

    v2->_didReceivePid = 0;
    objc_initWeak(&location, v2);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__DMMigrationPluginWrapperConnection_init__block_invoke;
    v6[3] = &unk_1E951EF30;
    objc_copyWeak(&v7, &location);
    -[DMXPCConnection setMessageHandler:](v2->_connection, "setMessageHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__DMMigrationPluginWrapperConnection_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleMessage:", v3);

}

- (void)resume
{
  -[DMXPCConnection resume](self->_connection, "resume");
}

- (void)invalidate
{
  -[DMXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)didReceivePid
{
  DMMigrationPluginWrapperConnection *v2;
  BOOL didReceivePid;

  v2 = self;
  objc_sync_enter(v2);
  didReceivePid = v2->_didReceivePid;
  objc_sync_exit(v2);

  return didReceivePid;
}

- (int)_pid
{
  _xpc_connection_s *v2;
  pid_t pid;

  -[DMXPCConnection connection](self->_connection, "connection");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid = xpc_connection_get_pid(v2);

  return pid;
}

- (void)runPluginAtPath:(id)a3 withIdentifier:(id)a4 parameters:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _BOOL8, void *);
  id v12;
  xpc_object_t v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  void *v56;
  const char *string;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, _BOOL8, void *))a6;
  v12 = a4;
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v13, "msgID", 0);
  v14 = objc_retainAutorelease(v9);
  xpc_dictionary_set_string(v13, "pluginPath", (const char *)objc_msgSend(v14, "UTF8String"));
  v15 = objc_retainAutorelease(v12);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  xpc_dictionary_set_string(v13, "pluginIdentifier", v16);
  +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "suppressMigrationPluginWrapperExitMarkerPref");

  if ((_DWORD)v16)
    xpc_dictionary_set_BOOL(v13, (const char *)objc_msgSend(CFSTR("DMSuppressMigrationPluginWrapperExit"), "UTF8String"), 1);
  +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "testMigrationInfrastructureOnly");

  if (v19)
    xpc_dictionary_set_BOOL(v13, "testMigrationInfrastructureOnly", 1);
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:](DMUserDataDispositionManager, "dispositionFlagsFromDispositionDict:", v20);

  xpc_dictionary_set_uint64(v13, "userDataDisposition", v21);
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RestoredBackupBuildVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    xpc_dictionary_set_string(v13, (const char *)objc_msgSend(CFSTR("RestoredBackupBuildVersion"), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RestoredBackupProductType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    xpc_dictionary_set_string(v13, (const char *)objc_msgSend(CFSTR("RestoredBackupProductType"), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("RestoredBackupDeviceName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    xpc_dictionary_set_string(v13, (const char *)objc_msgSend(CFSTR("RestoredBackupDeviceName"), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
  v28 = (const char *)objc_msgSend(CFSTR("SyntheticDidUpgrade"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SyntheticDidUpgrade"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v28, objc_msgSend(v30, "BOOLValue"));

  v31 = (const char *)objc_msgSend(CFSTR("DidRestoreFromBackup"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("DidRestoreFromBackup"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v31, objc_msgSend(v33, "BOOLValue"));

  v34 = (const char *)objc_msgSend(CFSTR("DidMigrateBackupFromDifferentDevice"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DidMigrateBackupFromDifferentDevice"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v34, objc_msgSend(v36, "BOOLValue"));

  v37 = (const char *)objc_msgSend(CFSTR("DidRestoreFromCloudBackup"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("DidRestoreFromCloudBackup"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v37, objc_msgSend(v39, "BOOLValue"));

  v40 = (const char *)objc_msgSend(CFSTR("ShouldPreserveSettingsAfterRestore"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ShouldPreserveSettingsAfterRestore"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v40, objc_msgSend(v42, "BOOLValue"));

  v43 = (const char *)objc_msgSend(CFSTR("WasPasscodeSetInBackup"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("WasPasscodeSetInBackup"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v43, objc_msgSend(v45, "BOOLValue"));

  v46 = (const char *)objc_msgSend(CFSTR("RestoredBackupIsMegaBackup"), "UTF8String");
  objc_msgSend(v10, "dispositionSupersetOfContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("RestoredBackupIsMegaBackup"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v13, v46, objc_msgSend(v48, "BOOLValue"));

  objc_msgSend(v10, "backupDeviceUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  if (v50)
  {
    objc_msgSend(v10, "backupDeviceUUID");
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v13, "backupDeviceUUID", (const char *)objc_msgSend(v51, "UTF8String"));

  }
  _DMLogFunc(v59, 7, CFSTR("DMMigrationPluginWrapperConnection will sendMessageSync:"));
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v52, (const char *)*MEMORY[0x1E0C81270]);
    _DMLogFunc(v59, 6, CFSTR("MigrationPluginWrapper -runPluginAtPath: %@ withParameters: XPC error: %s"));
    v55 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0CB2D50];
    v61[0] = CFSTR("migrationpluginwrapper xpc error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1, v14, string);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("com.apple.datamigrator"), 0, v56);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0;
  }
  else
  {
    v53 = xpc_dictionary_get_BOOL(v52, "migrationResult");
    v54 = 0;
  }
  v11[2](v11, v53, v54);

}

- (void)handleMessage:(id)a3
{
  uint64_t v3;
  DMMigrationPluginWrapperConnection *v5;
  int64_t int64;
  void *v7;
  void *v8;
  void *v9;
  xpc_object_t xdict;

  xdict = a3;
  if (!xpc_dictionary_get_int64(xdict, "msgID"))
  {
    v5 = self;
    objc_sync_enter(v5);
    v5->_didReceivePid = 1;
    objc_sync_exit(v5);

    int64 = xpc_dictionary_get_int64(xdict, "pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", int64);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DMMigrationPluginWrapperConnection _pid](v5, "_pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _DMLogFunc(v3, 7, CFSTR("DMMigrationPluginWrapperConnection handling event %p msgID %@ containing pid %@ from peer pid %@"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
