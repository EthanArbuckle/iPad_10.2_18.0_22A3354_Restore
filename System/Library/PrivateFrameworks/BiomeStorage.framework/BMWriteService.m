@implementation BMWriteService

- (BMWriteService)initWithUseCase:(id)a3
{
  id v5;
  BMWriteService *v6;
  BMWriteService *v7;

  v5 = a3;
  v6 = -[BMWriteService init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_useCase, a3);
  }

  return v7;
}

- (id)newConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3B38], "bm_connectionWithServiceName:queue:", CFSTR("com.apple.BiomeWriteService"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEAF8650);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEAF8130);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);
  objc_msgSend(MEMORY[0x1E0D01D48], "weakProxyToObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedObject:", v6);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __31__BMWriteService_newConnection__block_invoke;
  v11 = &unk_1E5566070;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v8);
  objc_msgSend(v3, "activate", v8, v9, v10, v11);
  objc_msgSend(v3, "setBm_exportedUseCase:", self->_useCase);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v3;
}

void __31__BMWriteService_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

- (void)connectionInvalidated
{
  -[BMWriteService setConnection:](self, "setConnection:", 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BMWriteService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = -[BMWriteService newConnection](self, "newConnection");
    -[BMWriteService setConnection:](self, "setConnection:", v7);

  }
  -[BMWriteService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMWriteService connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v10 = v10;
      v11 = v10;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = CFSTR("Unable to create proxy");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D01C60], 7, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v16);

      v11 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Unable to create connection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D01C60], 7, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);

    v11 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (BOOL)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 error:(id *)a8
{
  uint64_t v8;
  uint64_t v11;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  BOOL v19;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = a6;
  v30 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v15 = MEMORY[0x1E0C809B0];
  do
  {
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke;
    v23[3] = &unk_1E5566098;
    v23[4] = &v24;
    -[BMWriteService synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke_2;
    v22[3] = &unk_1E5566098;
    v22[4] = &v24;
    objc_msgSend(v16, "writeData:version:timestamp:toStream:asUser:reply:", v13, v11, v14, v8, v22, a5);

  }
  while ((BMShouldRetry() & 1) != 0);
  v17 = v25;
  if (a8)
  {
    v18 = (void *)v25[5];
    if (v18)
    {
      *a8 = objc_retainAutorelease(v18);
      v17 = v25;
    }
  }
  v19 = v17[5] == 0;
  _Block_object_dispose(&v24, 8);

  return v19;
}

void __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__BMWriteService_writeData_version_timestamp_toStream_asUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  _QWORD v30[6];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  _QWORD v50[3];

  v5 = *(_QWORD *)&a4;
  v50[1] = *MEMORY[0x1E0C80C00];
  v28 = (void (**)(id, _QWORD, void *))a5;
  v8 = (void *)MEMORY[0x1E0D01D18];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processWithXPCConnection:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v29, "processType");
  v11 = (_QWORD *)MEMORY[0x1E0D01C60];
  if (v10 != 4)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50[0] = CFSTR("Not authorized");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *v11, 5, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 0, v27);

    goto LABEL_12;
  }
  v44 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v12 = *MEMORY[0x1E0D01C60];
  v13 = *MEMORY[0x1E0CB2D50];
  do
  {
    objc_msgSend(MEMORY[0x1E0D01CC8], "connectionToAccessServerInDomain:user:useCase:", a3, v5, self->_useCase);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke;
      v31[3] = &unk_1E5566098;
      v31[4] = &v32;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2;
        v30[3] = &unk_1E55660C0;
        v30[4] = &v38;
        v30[5] = &v32;
        objc_msgSend(v17, "requestBiomeEndpointForAppScopedService:user:reply:", a3, v5, v30);
        goto LABEL_9;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v45 = v13;
      v46 = CFSTR("Failed to create remote object proxy");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v12, 7, v21);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v33[5];
      v33[5] = v23;

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v47 = v13;
      v48 = CFSTR("Failed to create connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v12, 7, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v33[5];
      v33[5] = v20;
    }

LABEL_9:
  }
  while ((BMShouldRetry() & 1) != 0);
  v28[2](v28, v39[5], (void *)v33[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
LABEL_12:

}

void __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__BMWriteService_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BMWriteService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  -[BMWriteService connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[BMWriteService setConnection:](self, "setConnection:", 0);
  v5.receiver = self;
  v5.super_class = (Class)BMWriteService;
  -[BMWriteService dealloc](&v5, sel_dealloc);
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
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end
