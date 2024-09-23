@implementation ASDSkannerService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392310);
}

- (ASDSkannerService)init
{
  void *v3;
  ASDSkannerService *v4;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ASDSkannerService *)-[ASDSkannerService _initWithServiceBroker:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)_initWithServiceBroker:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASDSkannerService;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

+ (ASDSkannerService)defaultService
{
  if (qword_1ECFFAA98 != -1)
    dispatch_once(&qword_1ECFFAA98, &__block_literal_global_13);
  return (ASDSkannerService *)(id)_MergedGlobals_38;
}

void __35__ASDSkannerService_defaultService__block_invoke()
{
  ASDSkannerService *v0;
  id *v1;
  void *v2;
  id v3;

  v0 = [ASDSkannerService alloc];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ASDSkannerService _initWithServiceBroker:]((id *)&v0->super.isa, v3);
  v2 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = (uint64_t)v1;

}

- (void)fetchStoriesWithCompletionHandler:(id)a3
{
  id v4;
  ASDServiceBroker *serviceBroker;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37BEFE0;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getSkannerServiceWithCompletionHandler:](serviceBroker, "getSkannerServiceWithCompletionHandler:", v7);

}

void __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchStoriesWithCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    ASDLogHandleForCategory(32);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting skanner service: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __55__ASDSkannerService_fetchStoriesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(32);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting remote proxy for skanner service: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
