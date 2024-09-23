@implementation ContextSyncClient

- (ContextSyncClient)initWithClientName:(id)a3
{
  id v5;
  ContextSyncClient *v6;
  ContextSyncClient *v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ContextSyncClient;
  v6 = -[ContextSyncClient init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.biome.ContextSync"), 4096);
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D9DAE8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v10);
    -[NSXPCConnection resume](v7->_connection, "resume");

  }
  return v7;
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  return -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:](self, "registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:", a3, a4, *MEMORY[0x24BE0C048], a5, a6, a7);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSXPCConnection *connection;
  uint64_t v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v26;
  _QWORD v28[6];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v9 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_214A1F000, v17, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v14, v16, a8))goto LABEL_10;
  if (!v15)
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a8, 5);
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  connection = self->_connection;
  v21 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke;
  v29[3] = &unk_24D2787B0;
  v29[5] = buf;
  v29[6] = a2;
  v29[4] = &v30;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_58;
  v28[3] = &unk_24D2787D8;
  v28[4] = &v30;
  v28[5] = buf;
  objc_msgSend(v22, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDeviceTypes:withErrorHandler:", v14, v15, v16, v9, a7, v28);

  if (!*((_BYTE *)v31 + 24) && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a8)
      *a8 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }
  v23 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v30, 8);
LABEL_11:

  return v23;
}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_58(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDevices:(id)a7 withError:(id *)a8
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSXPCConnection *connection;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v10 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_214A1F000, v19, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v15, v17, a8))goto LABEL_10;
  if (!v16)
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a8, 5);
LABEL_10:
    v24 = 0;
    goto LABEL_11;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  connection = self->_connection;
  v22 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke;
  v29[3] = &unk_24D2787B0;
  v29[5] = buf;
  v29[6] = a2;
  v29[4] = &v30;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke_60;
  v28[3] = &unk_24D2787D8;
  v28[4] = &v30;
  v28[5] = buf;
  objc_msgSend(v23, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDevices:withErrorHandler:", v15, v16, v17, v10, v18, v28);

  if (!*((_BYTE *)v31 + 24) && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a8)
      *a8 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }
  v24 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v30, 8);
LABEL_11:

  return v24;
}

void __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __98__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDevices_withError___block_invoke_60(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 shouldWake:(BOOL)a5 forDeviceTypes:(int64_t)a6
{
  return -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:](self, "registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:", a3, a4, *MEMORY[0x24BE0C048], a5, a6);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 shouldWake:(BOOL)a6 forDeviceTypes:(int64_t)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSXPCConnection *connection;
  uint64_t v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  _BYTE *v27;
  _QWORD v28[6];
  _BYTE buf[24];
  char v30;
  uint64_t v31;

  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_214A1F000, v16, OS_LOG_TYPE_INFO, "Received DSL with shouldWake %@ for devices %@", buf, 0x16u);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v13, v15, 0))goto LABEL_9;
  if (!v14)
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

LABEL_9:
    v22 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v30 = 0;
  connection = self->_connection;
  v20 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke;
  v28[3] = &unk_24D278800;
  v28[4] = buf;
  v28[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61;
  v25[3] = &unk_24D278828;
  v27 = buf;
  v26 = v14;
  objc_msgSend(v21, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDeviceTypes:withErrorHandler:", v13, v26, v15, v8, a7, v25);

  v22 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_10:

  return v22;
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61_cold_1();

  }
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSXPCConnection *connection;
  uint64_t v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v26;
  _QWORD v28[6];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_214A1F000, v17, OS_LOG_TYPE_INFO, "Received DSL with options %@ for device types %@", buf, 0x16u);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v14, v16, a8))goto LABEL_10;
  if (!v15)
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a8, 5);
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  connection = self->_connection;
  v21 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke;
  v29[3] = &unk_24D2787B0;
  v29[5] = buf;
  v29[6] = a2;
  v29[4] = &v30;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke_62;
  v28[3] = &unk_24D2787D8;
  v28[4] = &v30;
  v28[5] = buf;
  objc_msgSend(v22, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDeviceTypes:withErrorHandler:", v14, v15, v16, a6, a7, v28);

  if (!*((_BYTE *)v31 + 24) && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a8)
      *a8 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }
  v23 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v30, 8);
LABEL_11:

  return v23;
}

void __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __103__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDeviceTypes_withError___block_invoke_62(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withError:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSXPCConnection *connection;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_214A1F000, v19, OS_LOG_TYPE_INFO, "Received DSL with options %@ for devices %@", buf, 0x16u);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v15, v17, a8))goto LABEL_10;
  if (!v16)
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a8, 5);
LABEL_10:
    v24 = 0;
    goto LABEL_11;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  connection = self->_connection;
  v22 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke;
  v29[3] = &unk_24D2787B0;
  v29[5] = buf;
  v29[6] = a2;
  v29[4] = &v30;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke_63;
  v28[3] = &unk_24D2787D8;
  v28[4] = &v30;
  v28[5] = buf;
  objc_msgSend(v23, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDevices:withErrorHandler:", v15, v16, v17, a6, v18, v28);

  if (!*((_BYTE *)v31 + 24) && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a8)
      *a8 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }
  v24 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v30, 8);
LABEL_11:

  return v24;
}

void __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __99__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_withOptions_forDevices_withError___block_invoke_63(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6
{
  return -[ContextSyncClient unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withError:](self, "unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withError:", a3, a4, *MEMORY[0x24BE0C048], a5, a6);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSXPCConnection *connection;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v24;
  _QWORD v25[6];
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_214A1F000, v16, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v13, v15, a7))goto LABEL_10;
  if (!v14)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 5);
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  connection = self->_connection;
  v19 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke;
  v26[3] = &unk_24D2787B0;
  v26[5] = &buf;
  v26[6] = a2;
  v26[4] = &v27;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke_64;
  v25[3] = &unk_24D2787D8;
  v25[4] = &v27;
  v25[5] = &buf;
  objc_msgSend(v20, "unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withErrorHandler:", v13, v14, v15, a6, v25);

  if (!*((_BYTE *)v28 + 24) && *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a7)
      *a7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }
  v21 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v27, 8);
LABEL_11:

  return v21;
}

void __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __93__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes_withError___block_invoke_64(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withError:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSXPCConnection *connection;
  uint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v24;
  _QWORD v25[6];
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_214A1F000, v17, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);
  }

  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v13, v15, a7))goto LABEL_10;
  if (!v14)
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 5);
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  connection = self->_connection;
  v19 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke;
  v26[3] = &unk_24D2787B0;
  v26[5] = &buf;
  v26[6] = a2;
  v26[4] = &v27;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke_65;
  v25[3] = &unk_24D2787D8;
  v25[4] = &v27;
  v25[5] = &buf;
  objc_msgSend(v20, "unregisterForUpdates:withIdentifier:forUseCase:forDevices:withErrorHandler:", v13, v14, v15, v16, v25);

  if (!*((_BYTE *)v28 + 24) && *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "localizedDescription");
      objc_claimAutoreleasedReturnValue();
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.2();
    }

    if (a7)
      *a7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }
  v21 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v27, 8);
LABEL_11:

  return v21;
}

void __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __89__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDevices_withError___block_invoke_65(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5
{
  return -[ContextSyncClient unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:](self, "unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:", a3, a4, *MEMORY[0x24BE0C048], a5);
}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSXPCConnection *connection;
  uint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  __int128 *p_buf;
  _QWORD v25[6];
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_214A1F000, v14, OS_LOG_TYPE_INFO, "Client unregistered DSL for devices types %@", (uint8_t *)&buf, 0xCu);

  }
  if (!+[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:](BMDistributedContextUtilities, "isSupportEnabledForBMDSL:useCase:withError:", v11, v13, 0))goto LABEL_9;
  if (!v12)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:].cold.1();

LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x2020000000;
  v28 = 0;
  connection = self->_connection;
  v17 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke;
  v25[3] = &unk_24D278800;
  v25[4] = &buf;
  v25[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66;
  v22[3] = &unk_24D278828;
  p_buf = &buf;
  v23 = v12;
  objc_msgSend(v18, "unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withErrorHandler:", v11, v23, v13, a6, v22);

  v19 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v19;
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66_cold_1();

  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_214A1F000, v0, v1, "Context Sync registration error: No Identifier!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)registerForUpdates:withIdentifier:forUseCase:shouldWake:forDeviceTypes:withError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5(&dword_214A1F000, v3, v4, "Error: %@", v5);

  OUTLINED_FUNCTION_9();
}

void __102__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes_withError___block_invoke_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  v1 = (const char *)OUTLINED_FUNCTION_10(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_214A1F000, v3, v4, "%@ Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_214A1F000, v2, v3, "%@ Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __92__ContextSyncClient_registerForUpdates_withIdentifier_forUseCase_shouldWake_forDeviceTypes___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_214A1F000, v0, (uint64_t)v0, "Error registering %@ error %@", v1);
}

void __83__ContextSyncClient_unregisterForUpdates_withIdentifier_forUseCase_forDeviceTypes___block_invoke_66_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_214A1F000, v0, (uint64_t)v0, "Error unregistering %@ error %@", v1);
}

@end
