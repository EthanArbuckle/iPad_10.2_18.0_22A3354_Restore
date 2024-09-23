@implementation CSSiriAudioMessageRequestClient

- (CSSiriAudioMessageRequestClient)init
{
  CSSiriAudioMessageRequestClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSSiriAudioMessageRequestClient;
  v2 = -[CSSiriAudioMessageRequestClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CSSiriAudioMessageRequestClient Queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSiriAudioMessageRequestClient dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s deallocated", buf, 0xCu);
  }
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CSSiriAudioMessageRequestClient;
  -[CSSiriAudioMessageRequestClient dealloc](&v4, sel_dealloc);
}

- (id)_newConnection
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.audio_message_service.xpc"), 0);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5930);
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "_setQueue:", self->_queue);
  return v3;
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  void *v4;
  NSString *v5;
  NSString *xpcConnectionUUIDString;
  NSObject *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  NSString *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSString *v13;
  NSXPCConnection *v14;
  NSString *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  NSString *v21;
  id v22;
  _QWORD v23[4];
  NSString *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSSiriAudioMessageRequestClient _connection]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    v8 = -[CSSiriAudioMessageRequestClient _newConnection](self, "_newConnection");
    v9 = self->_xpcConnection;
    self->_xpcConnection = v8;

    objc_initWeak((id *)buf, self);
    v10 = self->_xpcConnectionUUIDString;
    v11 = self->_xpcConnection;
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __46__CSSiriAudioMessageRequestClient__connection__block_invoke;
    v23[3] = &unk_1E7C28E78;
    objc_copyWeak(&v25, (id *)buf);
    v13 = v10;
    v24 = v13;
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v23);
    v14 = self->_xpcConnection;
    v17 = v12;
    v18 = 3221225472;
    v19 = __46__CSSiriAudioMessageRequestClient__connection__block_invoke_5;
    v20 = &unk_1E7C28E78;
    objc_copyWeak(&v22, (id *)buf);
    v15 = v13;
    v21 = v15;
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v17);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v17, v18, v19, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[CSSiriAudioMessageRequestClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getAudioFileWithRequestId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)releaseAudioMessageRetainLockFromRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CSSiriAudioMessageRequestClient_releaseAudioMessageRetainLockFromRequestId___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)forceReleaseAllAudioMessageRetainLock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSSiriAudioMessageRequestClient_forceReleaseAllAudioMessageRetainLock__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CSSiriAudioMessageRequestClient_forceReleaseAllAudioMessageRetainLock__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceReleaseAllAudioMessageRetainLock");

}

void __78__CSSiriAudioMessageRequestClient_releaseAudioMessageRetainLockFromRequestId___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseAudioMessageRetainLockFromRequestId:", *(_QWORD *)(a1 + 40));

}

void __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke_2;
  v4[3] = &unk_1E7C28EA0;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "getAudioFileWithRequestId:completion:", v3, v4);

}

uint64_t __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__CSSiriAudioMessageRequestClient__connection__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  os_log_t v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
    v15 = 2112;
    v16 = CFSTR("com.apple.siri.audio_message_service.xpc");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v13, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v5[3], "invalidate");
      v8 = v5[3];
      v5[3] = 0;

    }
    else
    {
      v9 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(const __CFString **)(a1 + 32);
        v11 = v9;
        objc_msgSend(v5, "xpcConnectionUUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315650;
        v14 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v13, 0x20u);

      }
    }
  }

}

void __46__CSSiriAudioMessageRequestClient__connection__block_invoke_5(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
    v14 = 2112;
    v15 = CFSTR("com.apple.siri.audio_message_service.xpc");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v12, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v6 & 1) == 0)
    {
      v8 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(const __CFString **)(a1 + 32);
        v10 = v8;
        objc_msgSend(v5, "xpcConnectionUUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
        v14 = 2112;
        v15 = v9;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v12, 0x20u);

      }
    }
  }

}

@end
