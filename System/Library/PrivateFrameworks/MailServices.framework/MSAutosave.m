@implementation MSAutosave

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAutosaveSessions, 0);
}

+ (id)autosave
{
  return objc_alloc_init(MSAutosave);
}

- (MSAutosave)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MSAutosave *v8;
  uint64_t v9;
  NSHashTable *activeAutosaveSessions;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25461A428);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getIdleAutosaves_, 0, 1);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25461A488);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_autosaveSessionForIdentifier_completion_, 0, 1);
  v12.receiver = self;
  v12.super_class = (Class)MSAutosave;
  v8 = -[MSXPCService initWithRemoteObjectInterface:](&v12, sel_initWithRemoteObjectInterface_, v3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    activeAutosaveSessions = v8->_activeAutosaveSessions;
    v8->_activeAutosaveSessions = (NSHashTable *)v9;

  }
  return v8;
}

- (id)newConnectionForInterface:(id)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSAutosave;
  v4 = -[MSXPCService newConnectionForInterface:](&v9, sel_newConnectionForInterface_, a3);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__MSAutosave_newConnectionForInterface___block_invoke;
  v6[3] = &unk_24C385350;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (void)getIdleAutosaves:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__MSAutosave_getIdleAutosaves___block_invoke;
  v7[3] = &unk_24C385300;
  v5 = v4;
  v8 = v5;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getIdleAutosaves:", v5);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__MSAutosave_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __17__MSAutosave_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (MSAutosave)initWithRemoteObjectInterface:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSAutosave;
  return -[MSXPCService initWithRemoteObjectInterface:](&v4, sel_initWithRemoteObjectInterface_, a3);
}

- (BOOL)hasAutosavedMessageWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE2E680], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __48__MSAutosave_hasAutosavedMessageWithIdentifier___block_invoke;
  v18[3] = &unk_24C385288;
  v8 = v5;
  v19 = v8;
  objc_msgSend(v7, "hasAutosavedMessageWithIdentifier:completion:", v4, v18);
  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "resultWithTimeout:error:", &v17, 5.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (v11)
  {
    +[MSAutosave log](MSAutosave, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSAutosave hasAutosavedMessageWithIdentifier:].cold.1(v13, v24, v12);
    }

  }
  v14 = objc_msgSend(v10, "BOOLValue");
  +[MSAutosave log](MSAutosave, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v4;
    v22 = 1024;
    v23 = v14;
    _os_log_impl(&dword_20AC30000, v15, OS_LOG_TYPE_INFO, "hasAutosavedMessageWithIdentifier %{public}@ returns %{BOOL}d", buf, 0x12u);
  }

  return v14;
}

void __48__MSAutosave_hasAutosavedMessageWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:");

}

- (void)removeAutosavedMessageWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke;
  v7[3] = &unk_24C3852B0;
  v5 = v4;
  v8 = v5;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAutosavedMessageWithIdentifier:", v5);

}

void __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[MSAutosave log](MSAutosave, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke_cold_1(v5, v6, v7, v4);
  }

}

- (id)autosavedMessageDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE2E680], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke;
  v16[3] = &unk_24C3852B0;
  v7 = v5;
  v17 = v7;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke_2;
  v13[3] = &unk_24C3852D8;
  v9 = v4;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "autosavedMessageDataWithIdentifier:completion:", v9, v13);
  objc_msgSend(v10, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", 0, a2);
}

void __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[MSAutosave log](MSAutosave, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v8;
    v11 = 2048;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_20AC30000, v7, OS_LOG_TYPE_INFO, "autosavedMessageDataWithIdentifier:%{public}@ returned data: %p, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);
}

- (void)autosaveMessageData:(id)a3 replacingIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__MSAutosave_autosaveMessageData_replacingIdentifier_completion___block_invoke;
  v13[3] = &unk_24C385300;
  v11 = v10;
  v14 = v11;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autosaveMessageData:replacingIdentifier:completion:", v8, v9, v11);

}

uint64_t __65__MSAutosave_autosaveMessageData_replacingIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__MSAutosave_getIdleAutosaves___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)autosaveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MSAutosave *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__MSAutosave_autosaveSessionForIdentifier_completion___block_invoke;
  v10[3] = &unk_24C385328;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[MSAutosave _getRemoteAutosaveSessionForIdentifier:completion:](self, "_getRemoteAutosaveSessionForIdentifier:completion:", v9, v10);

}

void __54__MSAutosave_autosaveSessionForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  MSAutosaveSession *v9;
  MSAutosaveSession *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = -[MSAutosaveSession initWithIdentifier:remoteSession:remoteService:]([MSAutosaveSession alloc], "initWithIdentifier:remoteSession:remoteService:", *(_QWORD *)(a1 + 32), v12, v7);
    objc_msgSend(*(id *)(a1 + 40), "activeAutosaveSessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    v9 = v10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __40__MSAutosave_newConnectionForInterface___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterruptedConnection");

}

- (void)_handleInterruptedConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AC30000, log, OS_LOG_TYPE_ERROR, "Autosave XPC connection was interrupted. Attempting to reconnect...", v1, 2u);
}

void __42__MSAutosave__handleInterruptedConnection__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v9 && v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "didReconnectRemoteSession:remoteService:", v9, v7);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MSMessageAutosaveErrorDomain"), 4, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "remoteSessionDisconnectedWithError:", v8);
  }

}

- (void)_getRemoteAutosaveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[MSXPCService remoteObjectProxy](self, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__MSAutosave__getRemoteAutosaveSessionForIdentifier_completion___block_invoke;
    v10[3] = &unk_24C3853A0;
    v12 = v7;
    v11 = v8;
    objc_msgSend(v11, "autosaveSessionForIdentifier:completion:", v6, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MSMessageAutosaveErrorDomain"), 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v9);

  }
}

void __64__MSAutosave__getRemoteAutosaveSessionForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((!v6 || v5) && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MSMessageAutosaveErrorDomain"), 4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSHashTable)activeAutosaveSessions
{
  return self->_activeAutosaveSessions;
}

- (void)setActiveAutosaveSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeAutosaveSessions, a3);
}

- (void)hasAutosavedMessageWithIdentifier:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20AC30000, log, OS_LOG_TYPE_ERROR, "Failed to check for autosaved message. Error: %{public}@", buf, 0xCu);

}

void __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_20AC30000, log, OS_LOG_TYPE_ERROR, "Removing autosave for identifier (%@) failed with error: %{public}@", buf, 0x16u);

}

@end
