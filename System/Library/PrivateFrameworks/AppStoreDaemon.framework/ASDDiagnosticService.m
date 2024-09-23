@implementation ASDDiagnosticService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3925B0);
}

+ (id)defaultService
{
  if (qword_1ECFFAB38 != -1)
    dispatch_once(&qword_1ECFFAB38, &__block_literal_global_20);
  return (id)_MergedGlobals_47;
}

void __38__ASDDiagnosticService_defaultService__block_invoke()
{
  ASDDiagnosticService *v0;
  void *v1;
  ASDDiagnosticService *v2;
  void *v3;
  id v4;
  objc_super v5;

  v0 = [ASDDiagnosticService alloc];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)ASDDiagnosticService;
    v2 = (ASDDiagnosticService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2)
      objc_storeStrong((id *)&v2->_serviceBroker, v1);
  }

  v3 = (void *)_MergedGlobals_47;
  _MergedGlobals_47 = (uint64_t)v0;

}

- (id)activeClientsWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v4 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__ASDDiagnosticService_activeClientsWithError___block_invoke;
  v16[3] = &unk_1E37BDFB0;
  v16[4] = &v17;
  -[ASDDiagnosticService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __47__ASDDiagnosticService_activeClientsWithError___block_invoke_2;
  v9[3] = &unk_1E37BF5D8;
  v9[4] = &v10;
  objc_msgSend(v5, "activeClientsWithReplyHandler:", v9);
  if (a3)
  {
    v6 = (void *)v18[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__ASDDiagnosticService_activeClientsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__ASDDiagnosticService_activeClientsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addSubscriberWithEndpoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASDDiagnosticService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubscriberWithEndpoint:", v4);

}

void __50__ASDDiagnosticService_addSubscriberWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[DiagnosticService] Adding subscriber failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)pingWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v4 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__ASDDiagnosticService_pingWithError___block_invoke;
  v14[3] = &unk_1E37BDFB0;
  v14[4] = &v15;
  -[ASDDiagnosticService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __38__ASDDiagnosticService_pingWithError___block_invoke_2;
  v9[3] = &unk_1E37BDEA8;
  v9[4] = &v10;
  objc_msgSend(v5, "pingWithReplyHandler:", v9);
  if (a3)
  {
    v6 = (void *)v16[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __38__ASDDiagnosticService_pingWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __38__ASDDiagnosticService_pingWithError___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)sendCommand:(int64_t)a3 withError:(id *)a4
{
  uint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v6 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__ASDDiagnosticService_sendCommand_withError___block_invoke;
  v16[3] = &unk_1E37BDFB0;
  v16[4] = &v17;
  -[ASDDiagnosticService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __46__ASDDiagnosticService_sendCommand_withError___block_invoke_2;
  v11[3] = &unk_1E37BDEA8;
  v11[4] = &v12;
  objc_msgSend(v7, "sendCommandWithReplyHandler:handler:", a3, v11);
  v8 = *((unsigned __int8 *)v13 + 24);
  if (a4 && !*((_BYTE *)v13 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v8 = *((unsigned __int8 *)v13 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __46__ASDDiagnosticService_sendCommand_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __46__ASDDiagnosticService_sendCommand_withError___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)sendDetailsCommand:(int64_t)a3 withError:(id *)a4
{
  return -[ASDDiagnosticService sendDetailsCommand:timeout:withError:](self, "sendDetailsCommand:timeout:withError:", a3, &unk_1E37E3280, a4);
}

- (id)sendDetailsCommand:(int64_t)a3 timeout:(id)a4 withError:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = dispatch_semaphore_create(0);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__10;
  v35 = __Block_byref_object_dispose__10;
  v10 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke;
  v30[3] = &unk_1E37BDFB0;
  v30[4] = &v31;
  -[ASDDiagnosticService _asynchronousRemoteObjectProxyWithErrorHandler:](self, "_asynchronousRemoteObjectProxyWithErrorHandler:", v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke_2;
  v21[3] = &unk_1E37BF620;
  v23 = &v24;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v11, "sendCommandWithDetailedReplyHandler:handler:", a3, v21);
  if ((int)objc_msgSend(v8, "intValue") < 1)
  {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (!a5)
      goto LABEL_10;
LABEL_9:
    *a5 = objc_retainAutorelease((id)v32[5]);
    goto LABEL_10;
  }
  v13 = dispatch_time(0, 1000000000 * objc_msgSend(v8, "integerValue"));
  if (dispatch_semaphore_wait(v12, v13))
  {
    ASDLogHandleForCategory(12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v38 = v19;
      v39 = 2048;
      v40 = a3;
      v20 = v19;
      _os_log_error_impl(&dword_19A03B000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]: Timed out attempting to diagnostic command %ld", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.asclient.diagnostics"), 515, &unk_1E37E3388);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v32[5];
    v32[5] = v15;

  }
  if (a5)
    goto LABEL_9;
LABEL_10:
  v17 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__ASDDiagnosticService_sendDetailsCommand_timeout_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  ASDServiceBroker *serviceBroker;
  void (**v4)(id, id);
  void *v5;
  id v6;
  void *v7;
  id v9;

  serviceBroker = self->_serviceBroker;
  v9 = 0;
  v4 = (void (**)(id, id))a3;
  -[ASDServiceBroker getDiagnosticServiceWithError:](serviceBroker, "getDiagnosticServiceWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4[2](v4, v6);
    v7 = 0;
  }

  return v7;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  ASDServiceBroker *serviceBroker;
  void (**v4)(id, id);
  void *v5;
  id v6;
  void *v7;
  id v9;

  serviceBroker = self->_serviceBroker;
  v9 = 0;
  v4 = (void (**)(id, id))a3;
  -[ASDServiceBroker getDiagnosticServiceWithError:](serviceBroker, "getDiagnosticServiceWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4[2](v4, v6);
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
