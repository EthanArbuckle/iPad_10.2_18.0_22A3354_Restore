@implementation ASDStoreKitExternalNotificationSheet

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392190);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ASDStoreKitExternalNotificationSheet_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAA48 != -1)
    dispatch_once(&qword_1ECFFAA48, block);
  return (id)_MergedGlobals_33;
}

void __54__ASDStoreKitExternalNotificationSheet_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = (uint64_t)v1;

}

- (ASDStoreKitExternalNotificationSheet)init
{
  ASDStoreKitExternalNotificationSheet *v2;
  uint64_t v3;
  ASDServiceBroker *serviceBroker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDStoreKitExternalNotificationSheet;
  v2 = -[ASDStoreKitExternalNotificationSheet init](&v6, sel_init);
  if (v2)
  {
    +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
    v3 = objc_claimAutoreleasedReturnValue();
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;

  }
  return v2;
}

- (void)presentSheetIfNeededForProcessHandle:(id)a3 completion:(id)a4
{
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  serviceBroker = self->_serviceBroker;
  v13 = 0;
  v8 = a4;
  -[ASDServiceBroker getStoreKitExternalNotificationServiceWithError:](serviceBroker, "getStoreKitExternalNotificationServiceWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentSheetIfNeededForProcessHandle:completion:", v6, v8);

    v8 = v11;
  }
  else
  {
    ASDLogHandleForCategory(12);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_error_impl(&dword_19A03B000, v12, OS_LOG_TYPE_ERROR, "[ASDStoreKitExternalNotification] Service unavailable: %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __88__ASDStoreKitExternalNotificationSheet_presentSheetIfNeededForProcessHandle_completion___block_invoke(uint64_t a1, void *a2)
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
    v4 = 138543362;
    v5 = v2;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "[ASDStoreKitExternalNotification] Remote object proxy error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
