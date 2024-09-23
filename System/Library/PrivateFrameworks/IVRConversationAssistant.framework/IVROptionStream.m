@implementation IVROptionStream

- (IVROptionStream)init
{
  IVROptionStream *v2;
  IVROptionStream *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IVROptionStream;
  v2 = -[IVROptionStream init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IVROptionStream initializeConnection](v2, "initializeConnection");
    v4 = dispatch_queue_create("com.apple.ivrconversationassistant.clientQueue", 0);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IVROptionStream serviceConnection](self, "serviceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v5.receiver = self;
  v5.super_class = (Class)IVROptionStream;
  -[IVROptionStream dealloc](&v5, sel_dealloc);
}

- (BOOL)initializeConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  id buf[2];

  IVRCADefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23ECA6000, v3, OS_LOG_TYPE_INFO, "IVRConversationAssistant XPC connection setup begin", (uint8_t *)buf, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.IVRConversationAssistantXPC"));
  -[IVROptionStream setServiceConnection:](self, "setServiceConnection:", v4);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256DCCA50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256DCC6F0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v7);

  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExportedObject:", self);

  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  objc_initWeak(buf, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__IVROptionStream_initializeConnection__block_invoke;
  v16[3] = &unk_250F5C1F0;
  objc_copyWeak(&v17, buf);
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", v16);

  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global);

  IVRCADefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23ECA6000, v13, OS_LOG_TYPE_INFO, "IVRConversationAssistant XPC connection setup done", v15, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  return 1;
}

void __39__IVROptionStream_initializeConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  IVRCADefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__IVROptionStream_initializeConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initializeConnection");

}

void __39__IVROptionStream_initializeConnection__block_invoke_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  IVRCADefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __39__IVROptionStream_initializeConnection__block_invoke_15_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (BOOL)startOptionStream
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint8_t v8;
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;
  uint8_t v15[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  IVRCADefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23ECA6000, v3, OS_LOG_TYPE_INFO, "startOptionStream request received", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2020000000;
  v14 = 1;
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__IVROptionStream_startOptionStream__block_invoke;
  v10[3] = &unk_250F5C258;
  v10[4] = buf;
  objc_msgSend(v5, "startOptionStreamWithReply:", v10);

  IVRCADefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v12[24];
    *(_DWORD *)v15 = 67109120;
    v16 = v7;
    _os_log_impl(&dword_23ECA6000, v6, OS_LOG_TYPE_INFO, "startOptionStream request isSuccess=%{BOOL}d", v15, 8u);
  }

  v8 = v12[24];
  _Block_object_dispose(buf, 8);
  return v8;
}

void __36__IVROptionStream_startOptionStream__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  IVRCADefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_23ECA6000, v4, OS_LOG_TYPE_INFO, "Starting option stream response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)getOptionStream:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[7];
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  IVRCADefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23ECA6000, v7, OS_LOG_TYPE_INFO, "getOptionStream request received", buf, 2u);
  }

  if (v6)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 1;
    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    v22 = 0;
    -[IVROptionStream serviceConnection](self, "serviceConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __41__IVROptionStream_getOptionStream_error___block_invoke;
    v20[3] = &unk_250F5C280;
    v20[4] = buf;
    v20[5] = &v33;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v34 + 24))
    {
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __41__IVROptionStream_getOptionStream_error___block_invoke_24;
      v19[3] = &unk_250F5C2A8;
      v19[4] = &v23;
      v19[5] = buf;
      v19[6] = v21;
      objc_msgSend(v10, "getOptionStreamWithReply:", v19);
      if (*((_BYTE *)v24 + 24))
      {
        -[IVROptionStream clientQueue](self, "clientQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __41__IVROptionStream_getOptionStream_error___block_invoke_2;
        block[3] = &unk_250F5C2D0;
        v18 = v21;
        v17 = v6;
        dispatch_sync(v11, block);

        v12 = *((_BYTE *)v24 + 24) != 0;
      }
      else
      {
        *a4 = objc_retainAutorelease(*((id *)v28 + 5));
        v12 = *((_BYTE *)v24 + 24) != 0;
      }
    }
    else
    {
      v12 = 0;
      *a4 = objc_retainAutorelease(*((id *)v28 + 5));
    }

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    v38[0] = CFSTR("callback handler is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ivrconversationassistant"), 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }

  return v12;
}

void __41__IVROptionStream_getOptionStream_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  IVRCADefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__IVROptionStream_getOptionStream_error___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __41__IVROptionStream_getOptionStream_error___block_invoke_24(_QWORD *a1, char a2, void *a3, id obj)
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v6 = a3;
  v8 = v6;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_250F5C370;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);

}

void __41__IVROptionStream_getOptionStream_error___block_invoke_2(uint64_t a1)
{
  IVROptionStreamData *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(IVROptionStreamData);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = &stru_250F5C370;
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IVROptionStreamData setOptionStreamData:](v2, "setOptionStreamData:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)stopOptionStream
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint8_t v8;
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;
  uint8_t v15[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  IVRCADefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23ECA6000, v3, OS_LOG_TYPE_INFO, "stopOptionStream request received", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2020000000;
  v14 = 1;
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__IVROptionStream_stopOptionStream__block_invoke;
  v10[3] = &unk_250F5C258;
  v10[4] = buf;
  objc_msgSend(v5, "stopOptionStreamWithReply:", v10);

  IVRCADefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v12[24];
    *(_DWORD *)v15 = 67109120;
    v16 = v7;
    _os_log_impl(&dword_23ECA6000, v6, OS_LOG_TYPE_INFO, "startOptionStream request isSuccess=%{BOOL}d", v15, 8u);
  }

  v8 = v12[24];
  _Block_object_dispose(buf, 8);
  return v8;
}

void __35__IVROptionStream_stopOptionStream__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  IVRCADefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_23ECA6000, v4, OS_LOG_TYPE_INFO, "Stopping option stream response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)userSelectedDTMFOption:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IVRCADefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_23ECA6000, v5, OS_LOG_TYPE_INFO, "userSelectedDTMFOption invoked with: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x2020000000;
  v12 = 1;
  -[IVROptionStream serviceConnection](self, "serviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__IVROptionStream_userSelectedDTMFOption___block_invoke;
  v9[3] = &unk_250F5C258;
  v9[4] = &buf;
  objc_msgSend(v7, "userSelectedDTMFOption:withReply:", v4, v9);

  LOBYTE(v6) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return (char)v6;
}

void __42__IVROptionStream_userSelectedDTMFOption___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  IVRCADefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_23ECA6000, v4, OS_LOG_TYPE_INFO, "userSelectedDTMFOption invoked with response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __39__IVROptionStream_initializeConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23ECA6000, a1, a3, "IVROptionStream connection interrupted", a5, a6, a7, a8, 0);
}

void __39__IVROptionStream_initializeConnection__block_invoke_15_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23ECA6000, a1, a3, "IVROptionStream connection invalidated", a5, a6, a7, a8, 0);
}

void __41__IVROptionStream_getOptionStream_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_23ECA6000, a2, OS_LOG_TYPE_ERROR, "Unable to get service object: %@", (uint8_t *)&v4, 0xCu);

}

@end
