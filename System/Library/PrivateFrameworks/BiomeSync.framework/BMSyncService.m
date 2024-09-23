@implementation BMSyncService

- (id)connection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v42[4];
  id v43;
  id location;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.biomesyncd.sync"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25510CE90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remoteDevicesForAccount_reply_, 0, 1);

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_triggerRapportSyncWithReply_, 0, 1);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_triggerRapportSyncDeviceIdentifiers_reply_, 0, 0);

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_triggerRapportSyncDeviceIdentifiers_reply_, 0, 1);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_triggerCloudKitSyncWithReply_, 0, 1);

  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_rapportSyncWithReply_, 1, 1);

  v27 = (void *)MEMORY[0x24BDBCF20];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_cascadeRapportSyncWithReply_, 1, 1);

  v31 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_cloudKitSyncWithReply_, 1, 1);

  v35 = (void *)MEMORY[0x24BDBCF20];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_peerInformationWithReply_, 1, 1);

  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25510C930);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v39);

  objc_msgSend(v2, "setExportedObject:", self);
  objc_initWeak(&location, v2);
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __27__BMSyncService_connection__block_invoke;
  v42[3] = &unk_24DD8BF18;
  objc_copyWeak(&v43, &location);
  objc_msgSend(v2, "setInvalidationHandler:", v42);
  objc_msgSend(v2, "setInterruptionHandler:", &__block_literal_global);
  objc_msgSend(v2, "resume");
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return v2;
}

void __27__BMSyncService_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  char *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (char *)xpc_connection_copy_invalidation_reason();

    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = "<unknown>";
      if (v4)
        v6 = v4;
      v7 = 136446210;
      v8 = v6;
      _os_log_impl(&dword_21AA74000, v5, OS_LOG_TYPE_INFO, "BMSyncService: connection invalidated with reason %{public}s", (uint8_t *)&v7, 0xCu);
    }

    free(v4);
  }

}

void __27__BMSyncService_connection__block_invoke_30()
{
  NSObject *v0;
  uint8_t v1[16];

  __biome_log_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21AA74000, v0, OS_LOG_TYPE_INFO, "BMSyncService: connection interrupted", v1, 2u);
  }

}

- (void)remoteDevicesWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__BMSyncService_remoteDevicesWithReply___block_invoke;
  v14[3] = &unk_24DD8BF60;
  v8 = v4;
  v15 = v8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__BMSyncService_remoteDevicesWithReply___block_invoke_2;
  v11[3] = &unk_24DD8BF88;
  v10 = v8;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "remoteDevicesForAccount:reply:", 0, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v5);

}

void __40__BMSyncService_remoteDevicesWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, MEMORY[0x24BDBD1A8], a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __40__BMSyncService_remoteDevicesWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke;
  v17[3] = &unk_24DD8BF60;
  v11 = v7;
  v18 = v11;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke_2;
  v14[3] = &unk_24DD8BF88;
  v13 = v11;
  v15 = v13;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v12, "remoteDevicesForAccount:reply:", v6, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v8);

}

void __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, MEMORY[0x24BDBD1A8], a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __47__BMSyncService_remoteDevicesForAccount_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)triggerRapportSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__BMSyncService_triggerRapportSyncWithReply___block_invoke;
  v14[3] = &unk_24DD8BF60;
  v8 = v4;
  v15 = v8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __45__BMSyncService_triggerRapportSyncWithReply___block_invoke_2;
  v11[3] = &unk_24DD8BF60;
  v10 = v8;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "triggerRapportSyncWithReply:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v5);

}

void __45__BMSyncService_triggerRapportSyncWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __45__BMSyncService_triggerRapportSyncWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)triggerCloudKitSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke;
  v14[3] = &unk_24DD8BF60;
  v8 = v4;
  v15 = v8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke_2;
  v11[3] = &unk_24DD8BF60;
  v10 = v8;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "triggerCloudKitSyncWithReply:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v5);

}

void __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __46__BMSyncService_triggerCloudKitSyncWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)remoteDevicesWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__BMSyncService_remoteDevicesWithError___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__BMSyncService_remoteDevicesWithError___block_invoke_2;
  v12[3] = &unk_24DD8BFD8;
  v12[4] = &v23;
  v12[5] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "remoteDevicesForAccount:reply:", 0, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __40__BMSyncService_remoteDevicesWithError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __40__BMSyncService_remoteDevicesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v7 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __47__BMSyncService_remoteDevicesForAccount_error___block_invoke;
  v16[3] = &unk_24DD8BFB0;
  v16[4] = &v19;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __47__BMSyncService_remoteDevicesForAccount_error___block_invoke_2;
  v14[3] = &unk_24DD8BFD8;
  v14[4] = &v25;
  v14[5] = &v19;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v10, "remoteDevicesForAccount:reply:", v6, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    v11 = (void *)v20[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

void __47__BMSyncService_remoteDevicesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __47__BMSyncService_remoteDevicesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

- (BOOL)triggerRapportSyncWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__BMSyncService_triggerRapportSyncWithError___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __45__BMSyncService_triggerRapportSyncWithError___block_invoke_2;
  v12[3] = &unk_24DD8BFB0;
  v12[4] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "triggerRapportSyncWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  v9 = (void *)v18[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v18[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __45__BMSyncService_triggerRapportSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __45__BMSyncService_triggerRapportSyncWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (BOOL)triggerRapportSyncWithDeviceIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v7 = (void *)MEMORY[0x220750220]();
  -[BMSyncService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke;
  v16[3] = &unk_24DD8BFB0;
  v16[4] = &v19;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke_2;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v19;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v10, "triggerRapportSyncDeviceIdentifiers:reply:", v6, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v7);
  v11 = (void *)v20[5];
  if (a4 && v11)
  {
    *a4 = objc_retainAutorelease(v11);
    v11 = (void *)v20[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __63__BMSyncService_triggerRapportSyncWithDeviceIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (BOOL)triggerCloudKitSyncWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke_2;
  v12[3] = &unk_24DD8BFB0;
  v12[4] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "triggerCloudKitSyncWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  v9 = (void *)v18[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v18[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __46__BMSyncService_triggerCloudKitSyncWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)rapportSyncWithErrors:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)MEMORY[0x24BDBD1A8];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__BMSyncService_rapportSyncWithErrors___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__BMSyncService_rapportSyncWithErrors___block_invoke_2;
  v12[3] = &unk_24DD8C000;
  v12[4] = &v23;
  v12[5] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "rapportSyncWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __39__BMSyncService_rapportSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);

}

void __39__BMSyncService_rapportSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)cascadeRapportSyncWithErrors:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)MEMORY[0x24BDBD1A8];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke_2;
  v12[3] = &unk_24DD8C000;
  v12[4] = &v23;
  v12[5] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "cascadeRapportSyncWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);

}

void __46__BMSyncService_cascadeRapportSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)cloudKitSyncWithErrors:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = (id)MEMORY[0x24BDBD1A8];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__BMSyncService_cloudKitSyncWithErrors___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v17;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__BMSyncService_cloudKitSyncWithErrors___block_invoke_2;
  v12[3] = &unk_24DD8C000;
  v12[4] = &v23;
  v12[5] = &v17;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "cloudKitSyncWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v9 = (void *)v18[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __40__BMSyncService_cloudKitSyncWithErrors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", v9, v10);

}

void __40__BMSyncService_cloudKitSyncWithErrors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)peerInformationWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v5 = (void *)MEMORY[0x220750220](self, a2);
  -[BMSyncService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__BMSyncService_peerInformationWithError___block_invoke;
  v14[3] = &unk_24DD8BFB0;
  v14[4] = &v23;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __42__BMSyncService_peerInformationWithError___block_invoke_2;
  v12[3] = &unk_24DD8BFD8;
  v12[4] = &v17;
  v12[5] = &v23;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "peerInformationWithReply:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v5);
  if (a3)
  {
    v9 = (void *)v24[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __42__BMSyncService_peerInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __42__BMSyncService_peerInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidate");

}

@end
