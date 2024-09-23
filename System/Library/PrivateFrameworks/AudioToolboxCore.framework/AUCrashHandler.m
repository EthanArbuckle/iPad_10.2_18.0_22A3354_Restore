@implementation AUCrashHandler

- (AUCrashHandler)initWithAuditToken:(id *)a3 withCrashBlock:(id)a4
{
  id v6;
  AUCrashHandler *v7;
  AUCrashHandler *v8;
  void *v9;
  id crashCallback;
  void *v11;
  __int128 v12;
  _OWORD v14[2];
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AUCrashHandler;
  v7 = -[AUCrashHandler init](&v15, sel_init);
  v8 = v7;
  if (v7 && PlatformUtilities::IsInternalBuild((PlatformUtilities *)v7))
  {
    v9 = _Block_copy(v6);
    crashCallback = v8->_crashCallback;
    v8->_crashCallback = v9;

    -[AUCrashHandler asyncCrashHandlerServiceProxy](v8, "asyncCrashHandlerServiceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&a3->var0[4];
    v14[0] = *(_OWORD *)a3->var0;
    v14[1] = v12;
    objc_msgSend(v11, "addCrashObserverForToken:withReply:", v14, &__block_literal_global_6564);

  }
  return v8;
}

- (AUCrashHandler)initWithEndpoint:(id)a3 withCrashBlock:(id)a4
{
  id v6;
  id v7;
  AUCrashHandler *v8;
  void *v9;
  id crashCallback;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUCrashHandler;
  v8 = -[AUCrashHandler init](&v16, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    crashCallback = v8->_crashCallback;
    v8->_crashCallback = v9;

    objc_initWeak(&location, v8);
    -[AUCrashHandler asyncCrashHandlerServiceProxy](v8, "asyncCrashHandlerServiceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__AUCrashHandler_initWithEndpoint_withCrashBlock___block_invoke;
    v13[3] = &unk_1E29212A8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "addCrashObserverForXPCEndpoint:withReply:", v6, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AUCrashHandler syncCrashHandlerServiceProxy](self, "syncCrashHandlerServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCrashObserver:", &__block_literal_global_16_6560);

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AUCrashHandler;
  -[AUCrashHandler dealloc](&v4, sel_dealloc);
}

- (id)serviceConnection
{
  NSXPCConnection *connectionToService;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  id v7;
  void *v8;

  connectionToService = self->_connectionToService;
  if (!connectionToService)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.audio.AUCrashHandlerService"));
    v5 = self->_connectionToService;
    self->_connectionToService = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE171510);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v6);

    v7 = -[AUCrashHandlerDelegate init:]([AUCrashHandlerDelegate alloc], "init:", self);
    -[NSXPCConnection setExportedObject:](self->_connectionToService, "setExportedObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16E138);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connectionToService, "setExportedInterface:", v8);

    -[NSXPCConnection setInterruptionHandler:](self->_connectionToService, "setInterruptionHandler:", &__block_literal_global_32);
    -[NSXPCConnection setInvalidationHandler:](self->_connectionToService, "setInvalidationHandler:", &__block_literal_global_35);
    -[NSXPCConnection resume](self->_connectionToService, "resume");
    connectionToService = self->_connectionToService;
  }
  return connectionToService;
}

- (id)syncCrashHandlerServiceProxy
{
  void *v2;
  void *v3;

  -[AUCrashHandler serviceConnection](self, "serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)asyncCrashHandlerServiceProxy
{
  void *v2;
  void *v3;

  -[AUCrashHandler serviceConnection](self, "serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_37);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4
{
  (*((void (**)(void))self->_crashCallback + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_crashCallback, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __47__AUCrashHandler_asyncCrashHandlerServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CrashHandlerLogCategory();
  v3 = objc_retainAutorelease((id)CrashHandlerLogCategory(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "AUCrashHandler.mm";
    v6 = 1024;
    v7 = 124;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d CrashHandler proxy error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __46__AUCrashHandler_syncCrashHandlerServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CrashHandlerLogCategory();
  v3 = objc_retainAutorelease((id)CrashHandlerLogCategory(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "AUCrashHandler.mm";
    v6 = 1024;
    v7 = 118;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_18EE07000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d CrashHandler proxy error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __35__AUCrashHandler_serviceConnection__block_invoke_34()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CrashHandlerLogCategory();
  v0 = objc_retainAutorelease((id)CrashHandlerLogCategory(void)::category);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315394;
    v2 = "AUCrashHandler.mm";
    v3 = 1024;
    v4 = 107;
    _os_log_impl(&dword_18EE07000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d invalidated", (uint8_t *)&v1, 0x12u);
  }
}

void __35__AUCrashHandler_serviceConnection__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CrashHandlerLogCategory();
  v0 = objc_retainAutorelease((id)CrashHandlerLogCategory(void)::category);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315394;
    v2 = "AUCrashHandler.mm";
    v3 = 1024;
    v4 = 104;
    _os_log_impl(&dword_18EE07000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d interrupted", (uint8_t *)&v1, 0x12u);
  }
}

void __50__AUCrashHandler_initWithEndpoint_withCrashBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;

  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
      objc_msgSend(WeakRetained[1], "invalidate");

  }
}

@end
