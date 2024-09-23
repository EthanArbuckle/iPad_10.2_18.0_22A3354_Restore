@implementation MOAnalyticsManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3);
  return (id)defaultManager_analyticsManager;
}

void __36__MOAnalyticsManager_defaultManager__block_invoke()
{
  MOAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(MOAnalyticsManager);
  v1 = (void *)defaultManager_analyticsManager;
  defaultManager_analyticsManager = (uint64_t)v0;

}

- (MOAnalyticsManager)init
{
  MOAnalyticsManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSXPCConnection *connection;
  uint64_t v12;
  MOAnalyticsManagerXPCProtocol *proxy;
  MOConnection *v14;
  MOConnection *connectionProxy;
  void *v16;
  MOAnalyticsManager *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MOAnalyticsManager;
  v2 = -[MOAnalyticsManager init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99CC68);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchPhotoAnalyticsMetricsWithContext_andHandler_, 0, 1);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v10;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", &__block_literal_global_75);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_79);
    v12 = objc_claimAutoreleasedReturnValue();
    proxy = v2->proxy;
    v2->proxy = (MOAnalyticsManagerXPCProtocol *)v12;

    v14 = -[MOConnection initWithName:]([MOConnection alloc], "initWithName:", CFSTR("MOAnalyticsManager"));
    connectionProxy = v2->connectionProxy;
    v2->connectionProxy = v14;

    -[MOConnection onConnectionInterrupted](v2->connectionProxy, "onConnectionInterrupted");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", v16);

    -[NSXPCConnection resume](v2->connection, "resume");
    NSLog(CFSTR("initiate client"));
    v17 = v2;

  }
  return v2;
}

void __26__MOAnalyticsManager_init__block_invoke()
{
  NSLog(CFSTR("Invalidated"));
}

void __26__MOAnalyticsManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "localizedDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%@: %@ %@\n"), CFSTR("Error on remote object proxy"), v4, v3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOAnalyticsManager;
  -[MOAnalyticsManager dealloc](&v3, sel_dealloc);
}

- (id)context
{
  return objc_alloc_init(MOXPCContext);
}

- (void)fetchPhotoAnalyticsMetricsWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  MOConnection *connectionProxy;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  NSLog(CFSTR("calling function of client"));
  v5 = MEMORY[0x1E0C809B0];
  connectionProxy = self->connectionProxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke;
  v10[3] = &unk_1E8541BD8;
  v10[4] = self;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_3;
  v8[3] = &unk_1E8541C00;
  v9 = v11;
  v7 = v11;
  -[MOConnection callBlock:onInterruption:](connectionProxy, "callBlock:onInterruption:", v10, v8);

}

void __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_2;
  v8[3] = &unk_1E8541BB0;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v5, "fetchPhotoAnalyticsMetricsWithContext:andHandler:", v6, v8);

}

void __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }

}

uint64_t __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

@end
