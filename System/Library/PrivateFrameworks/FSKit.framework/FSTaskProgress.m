@implementation FSTaskProgress

- (FSTaskProgress)initWithProgress:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  FSTaskProgress *v9;
  FSTaskProgress *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSTaskProgress;
  v9 = -[FSTaskProgress init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_initialDescription, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_ourConn, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FSTaskProgress;
  -[FSTaskProgress dealloc](&v3, sel_dealloc);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (FSTaskDescription)initialDescription
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCConnection)ourConn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOurConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConn, 0);
  objc_storeStrong((id *)&self->_initialDescription, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

+ (void)constructFromListener:(id)a3 description:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  int v19;
  FSTaskProgress *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint8_t buf[4];
  _BYTE v32[10];
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v8);
  +[FSKitConstants FSTaskProgressXPCProtocol](FSKitConstants, "FSTaskProgressXPCProtocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  objc_msgSend(v11, "resume");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke;
  v23[3] = &unk_250C32328;
  v25 = &v27;
  v26 = a1;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getProgress:", &__block_literal_global_3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCancellationHandler:", &__block_literal_global_28);
  objc_msgSend(v15, "setPausingHandler:", &__block_literal_global_29);
  fskit_std_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v15, "completedUnitCount");
    v18 = objc_msgSend(v15, "totalUnitCount");
    v19 = objc_msgSend(v15, "isFinished");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v17;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v18;
    v33 = 1024;
    v34 = v19;
    _os_log_impl(&dword_23B2A6000, v16, OS_LOG_TYPE_DEFAULT, "Progress from getProgress %u units of %u, isFinished %d", buf, 0x14u);
  }

  v20 = -[FSTaskProgress initWithProgress:description:]([FSTaskProgress alloc], "initWithProgress:description:", v15, v9);
  -[FSTaskProgress setOurConn:](v20, "setOurConn:", v11);
  v21 = a1;
  objc_sync_enter(v21);
  if (!*((_DWORD *)v28 + 6))
  {
    (*((void (**)(id, FSTaskProgress *, _QWORD))v13 + 2))(v13, v20, 0);
    fskit_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = v20;
      _os_log_impl(&dword_23B2A6000, v22, OS_LOG_TYPE_DEFAULT, "normnal blockReply just did fire, passed rv %@", buf, 0xCu);
    }

    *((_DWORD *)v28 + 6) = 1;
  }
  objc_sync_exit(v21);

  _Block_object_dispose(&v27, 8);
}

void __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_23B2A6000, v4, OS_LOG_TYPE_DEFAULT, "remote proxy object error %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(id *)(a1 + 48);
  objc_sync_enter(v5);
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_DEFAULT, "remote proxy blockReply about to fire", (uint8_t *)&v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_sync_exit(v5);

}

void __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "getProgress returned error %@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "getProgress returned success";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

@end
