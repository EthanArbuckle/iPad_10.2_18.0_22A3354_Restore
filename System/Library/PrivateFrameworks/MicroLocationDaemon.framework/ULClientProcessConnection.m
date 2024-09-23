@implementation ULClientProcessConnection

- (ULClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 serviceHandling:(id)a5 legacyServiceHandling:(id)a6 diagnosticsHandling:(id)a7 queue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ULClientProcessConnection *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  ULClientProcessConnection *v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)ULClientProcessConnection;
  v20 = -[ULClientProcessConnection init](&v35, sel_init);
  if (v20)
  {
    if (!+[ULServerEntitlements allowConnection:](ULServerEntitlements, "allowConnection:", v14))
    {
      v28 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v14, "signingIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULClientProcessConnection setSigningIdentity:](v20, "setSigningIdentity:", v21);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULClientProcessConnection setConnectionToken:](v20, "setConnectionToken:", v22);

    objc_msgSend(MEMORY[0x24BE66998], "responseInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRemoteObjectInterface:", v23);

    objc_msgSend(MEMORY[0x24BE66998], "requestInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExportedInterface:", v24);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE669F0]), "initWithObject:", v20);
    objc_msgSend(v14, "setExportedObject:", v25);

    objc_initWeak(&location, v20);
    v26 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke;
    v32[3] = &unk_2511D2C80;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v14, "setInterruptionHandler:", v32);
    v30[0] = v26;
    v30[1] = 3221225472;
    v30[2] = __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke_4;
    v30[3] = &unk_2511D2C80;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v14, "setInvalidationHandler:", v30);
    objc_msgSend(v14, "remoteObjectProxy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULClientProcessConnection setRemoteObjectProxy:](v20, "setRemoteObjectProxy:", v27);

    -[ULClientProcessConnection setXpcConnection:](v20, "setXpcConnection:", v14);
    -[ULClientProcessConnection setDelegate:](v20, "setDelegate:", v15);
    -[ULClientProcessConnection setServiceHandling:](v20, "setServiceHandling:", v16);
    -[ULClientProcessConnection setLegacyServiceHandling:](v20, "setLegacyServiceHandling:", v17);
    -[ULClientProcessConnection setDiagnosticsHandling:](v20, "setDiagnosticsHandling:", v18);
    -[ULClientProcessConnection setQueue:](v20, "setQueue:", v19);
    objc_msgSend(v14, "resume");
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v28 = v20;
LABEL_6:

  return v28;
}

void __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
    v2 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      objc_msgSend(WeakRetained, "signingIdentity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted for: %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientConnectionSeveredConnection:", WeakRetained);

  }
}

void __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
    v2 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      objc_msgSend(WeakRetained, "signingIdentity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated for: %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientConnectionSeveredConnection:", WeakRetained);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ULClientProcessConnection xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ULClientProcessConnection;
  -[ULClientProcessConnection dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[ULClientProcessConnection signingIdentity](self, "signingIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", signingIdentity: %@"), v7);

  -[ULClientProcessConnection connectionToken](self, "connectionToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", connectionToken: %@"), v8);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ULClientProcessConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ULClientProcessConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ULClientProcessConnection_deleteServiceWithIdentifier_reply___block_invoke;
  block[3] = &unk_2511D9CF8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __63__ULClientProcessConnection_deleteServiceWithIdentifier_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "Deleting service:%@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "serviceHandling");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "signingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteServiceWithIdentifier:clientIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (void)queryServicesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__ULClientProcessConnection_queryServicesWithReply___block_invoke;
  v7[3] = &unk_2511D9D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__ULClientProcessConnection_queryServicesWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "Query services", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "signingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryServicesForClient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ULClientProcessConnection *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  -[ULClientProcessConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __143__ULClientProcessConnection_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke;
  v13[3] = &unk_2511D9D48;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __143__ULClientProcessConnection_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = v2;
    objc_msgSend(v4, "numberWithBool:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v3;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation, information: %@, shouldForceRecording: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "legacyServiceHandling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "signingIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:shouldForceRecording:handler:clientId:", v11, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ULClientProcessConnection *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ULClientProcessConnection queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __103__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke;
  v15[3] = &unk_2511D9D70;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __103__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "donateMicroLocationTruthTagWithTagUUID, tagUUID: %@, triggerUUID: %@", (uint8_t *)&v11, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "legacyServiceHandling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "signingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "donateMicroLocationTruthTagWithTagUUID:correspondingToTriggerUUID:handler:clientId:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  ULClientProcessConnection *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ULClientProcessConnection queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke;
  block[3] = &unk_2511D9D98;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __114__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v13 = 138412802;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "donateMicroLocationTruthTagWithTagUUIDforRecordingEventsBetweenDate, tagUUID: %@, startDate: %@, endDate: %@", (uint8_t *)&v13, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 56), "legacyServiceHandling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "signingIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "donateMicroLocationTruthTagWithTagUUID:forRecordingEventsBetweenDate:andDate:handler:clientId:", v7, v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ULClientProcessConnection *v9;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__ULClientProcessConnection_requestCurrentMicroLocationWithAdditionalInformation___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __82__ULClientProcessConnection_requestCurrentMicroLocationWithAdditionalInformation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "requestCurrentMicroLocationWithAdditionalInformation, localizationInformation: %@", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "legacyServiceHandling");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "signingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestCurrentMicroLocationWithAdditionalInformation:clientId:", v5, v6);

}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ULClientProcessConnection *v9;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__ULClientProcessConnection_requestMicroLocationRecordingScanWithAdditionalInformation___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __88__ULClientProcessConnection_requestMicroLocationRecordingScanWithAdditionalInformation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "requestMicroLocationRecordingScanWithAdditionalInformation, recordingInformation: %@", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "legacyServiceHandling");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "signingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestMicroLocationRecordingScanWithAdditionalInformation:clientId:", v5, v6);

}

- (void)getMicroLocationInternalVersionWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__ULClientProcessConnection_getMicroLocationInternalVersionWithReply___block_invoke;
  v7[3] = &unk_2511D9D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__ULClientProcessConnection_getMicroLocationInternalVersionWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "getMicroLocationInternalVersionWithReply", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "legacyServiceHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getMicroLocationInternalVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 andRequestIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ULClientProcessConnection *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ULClientProcessConnection queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __103__ULClientProcessConnection_connectWithServiceIdentifier_legacyServiceIdentifier_andRequestIdentifier___block_invoke;
  v15[3] = &unk_2511D2CF8;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __103__ULClientProcessConnection_connectWithServiceIdentifier_legacyServiceIdentifier_andRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v15 = 138412546;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2112;
      *(_QWORD *)&v15[14] = v4;
      v5 = "connectWithServiceIdentifier:%@ , withLegacyServiceIdentifier:%@";
      v6 = v2;
      v7 = 22;
LABEL_10:
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, v5, v15, v7);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v9;
      v5 = "connectWithServiceIdentifier:%@";
      v6 = v8;
      v7 = 12;
      goto LABEL_10;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setServiceIdentifier:", *(_QWORD *)(a1 + 40), *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
  objc_msgSend(*(id *)(a1 + 48), "serviceHandling");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "serviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "signingIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "connectionToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectWithServiceIdentifier:legacyServiceIdentifier:clientIdentifier:connectionToken:requestIdentifier:", v11, v12, v13, v14, *(_QWORD *)(a1 + 56));

}

- (void)disconnectWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ULClientProcessConnection_disconnectWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__ULClientProcessConnection_disconnectWithRequestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "setServiceIdentifier:", 0);
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "signingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectWithConnectionToken:clientIdentifier:requestIdentifier:", v3, v4, *(_QWORD *)(a1 + 40));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "disconnect", v6, 2u);
  }
}

- (void)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4 withReturnIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ULClientProcessConnection queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__ULClientProcessConnection_labelRequestIdentifier_withPlaceIdentifier_withReturnIdentifier___block_invoke;
  v15[3] = &unk_2511D2CF8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __93__ULClientProcessConnection_labelRequestIdentifier_withPlaceIdentifier_withReturnIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelObservationForConnectionToken:withRequestIdentifier:andPlaceIdentifier:andReturnIdentifier:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "labelRequestIdentifier:%@ withPlaceIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)requestObservationWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__ULClientProcessConnection_requestObservationWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__ULClientProcessConnection_requestObservationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "signingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestObservationForConnectionToken:clientIdentifier:requestIdentifier:", v3, v4, *(_QWORD *)(a1 + 40));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "requestObservationWithRequestIdentifier:%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)requestPredictionWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__ULClientProcessConnection_requestPredictionWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__ULClientProcessConnection_requestPredictionWithRequestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "signingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPredictionForConnectionToken:clientIdentifier:requestIdentifier:", v3, v4, *(_QWORD *)(a1 + 40));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "requestPredictionWithRequestIdentifier:%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)startUpdatingWithConfiguration:(id)a3 withRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ULClientProcessConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__ULClientProcessConnection_startUpdatingWithConfiguration_withRequestIdentifier___block_invoke;
  block[3] = &unk_2511D2218;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __82__ULClientProcessConnection_startUpdatingWithConfiguration_withRequestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUpdatingForConnectionToken:updateConfiguration:requestIdentifier:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "startUpdatingWithConfiguration:%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)stopUpdatingWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__ULClientProcessConnection_stopUpdatingWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__ULClientProcessConnection_stopUpdatingWithRequestIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopUpdatingForConnectionToken:requestIdentifier:", v3, *(_QWORD *)(a1 + 40));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "stopUpdating", v5, 2u);
  }
}

- (void)createCustomLocationOfInterestAtCurrentLocationWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__ULClientProcessConnection_createCustomLocationOfInterestAtCurrentLocationWithConfiguration___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __94__ULClientProcessConnection_createCustomLocationOfInterestAtCurrentLocationWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createCustomLoiAtCurrentLocationForConnectionToken:withConfiguration:", v3, *(_QWORD *)(a1 + 40));

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "createCustomLocationOfInterestAtCurrentLocationWithConfiguration", v5, 2u);
  }
}

- (void)removeCustomLocationOfInterestWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__ULClientProcessConnection_removeCustomLocationOfInterestWithIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __74__ULClientProcessConnection_removeCustomLocationOfInterestWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "connectionToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCustomLoiWithIdentifier:forConnectionToken:", v3, v4);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "removeCustomLocationOfInterestWithIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)requestAllModelsLearningWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ULClientProcessConnection *v9;

  v4 = a3;
  -[ULClientProcessConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__ULClientProcessConnection_requestAllModelsLearningWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2511D2CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__ULClientProcessConnection_requestAllModelsLearningWithRequestIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "requestAllModelsLearningWithRequestIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "diagnosticsHandling");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "connectionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestModelLearningForConnectionToken:requestIdentifier:", v5, *(_QWORD *)(a1 + 32));

}

- (void)exportDatabaseWithReply:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULClientProcessConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[ULServerEntitlements allowPrivateDataAccess:](ULServerEntitlements, "allowPrivateDataAccess:", v5);

  if (v6)
  {
    -[ULClientProcessConnection queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ULClientProcessConnection_exportDatabaseWithReply___block_invoke;
    block[3] = &unk_2511D9D20;
    block[4] = self;
    v12 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("export database missing entitlements");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("ULClientProcessConnection"), 41, v9);

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);
  }

}

void __53__ULClientProcessConnection_exportDatabaseWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "exportDatabaseWithReply", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "diagnosticsHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exportDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "exportedURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

}

- (void)purgeDatabaseWithReply:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULClientProcessConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[ULServerEntitlements allowPrivateDataAccess:](ULServerEntitlements, "allowPrivateDataAccess:", v5);

  if (v6)
  {
    -[ULClientProcessConnection queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__ULClientProcessConnection_purgeDatabaseWithReply___block_invoke;
    block[3] = &unk_2511D9D20;
    block[4] = self;
    v12 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("purge database missing entitlements");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("ULClientProcessConnection"), 41, v9);

    (*((void (**)(id, void *))v4 + 2))(v4, v10);
  }

}

void __52__ULClientProcessConnection_purgeDatabaseWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "purgeDatabaseWithReply", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "diagnosticsHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (NSUUID)connectionToken
{
  return self->_connectionToken;
}

- (void)setConnectionToken:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToken, a3);
}

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (void)setSigningIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_signingIdentity, a3);
}

- (ULXPCResponseProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, a3);
}

- (ULLogicServiceHandling)serviceHandling
{
  return (ULLogicServiceHandling *)objc_loadWeakRetained((id *)&self->_serviceHandling);
}

- (void)setServiceHandling:(id)a3
{
  objc_storeWeak((id *)&self->_serviceHandling, a3);
}

- (ULLogicLegacyServiceHandling)legacyServiceHandling
{
  return (ULLogicLegacyServiceHandling *)objc_loadWeakRetained((id *)&self->_legacyServiceHandling);
}

- (void)setLegacyServiceHandling:(id)a3
{
  objc_storeWeak((id *)&self->_legacyServiceHandling, a3);
}

- (ULLogicDiagnosticsHandling)diagnosticsHandling
{
  return (ULLogicDiagnosticsHandling *)objc_loadWeakRetained((id *)&self->_diagnosticsHandling);
}

- (void)setDiagnosticsHandling:(id)a3
{
  objc_storeWeak((id *)&self->_diagnosticsHandling, a3);
}

- (ULClientProcessConnectionDelegate)delegate
{
  return (ULClientProcessConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_diagnosticsHandling);
  objc_destroyWeak((id *)&self->_legacyServiceHandling);
  objc_destroyWeak((id *)&self->_serviceHandling);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_connectionToken, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
