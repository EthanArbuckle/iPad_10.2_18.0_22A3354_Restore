@implementation CCAdminXPCClient

+ (id)wrappedCompletion:(id)a3 retainingClient:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke;
  v11[3] = &unk_250990C18;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = (void *)MEMORY[0x23B820934](v11);

  return v9;
}

uint64_t __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t result;

  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_1(a1, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_2(a1, a2, v5);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)triggerMaintenanceActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v6, "activityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "initWithClientId:activity:", v8, v6);

  objc_msgSend((id)objc_opt_class(), "wrappedCompletion:retainingClient:", v5, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "serviceRequest:completion:usingBlock:", 1, v9, &__block_literal_global_4);
}

uint64_t __58__CCAdminXPCClient_triggerMaintenanceActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startMaintenanceActivity:");
}

+ (void)removeSetsRootDirectory:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithClientId:activity:", CFSTR("removeSetsRootDirectory"), 0);
  objc_msgSend((id)objc_opt_class(), "wrappedCompletion:retainingClient:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "serviceRequest:completion:usingBlock:", 1, v4, &__block_literal_global_3);
}

uint64_t __44__CCAdminXPCClient_removeSetsRootDirectory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSetsRootDirectory:");
}

- (CCAdminXPCClient)initWithClientId:(id)a3 activity:(id)a4
{
  id v7;
  uint64_t v8;
  CCAdminXPCClient *v9;
  CCAdminXPCClient *v10;
  objc_super v12;

  v7 = a4;
  v8 = *MEMORY[0x24BE0C068];
  v12.receiver = self;
  v12.super_class = (Class)CCAdminXPCClient;
  v9 = -[CCXPCClient initWithRemoteObjectInterface:exportedInterface:serviceName:clientId:interruptionCode:invalidationCode:useCase:](&v12, sel_initWithRemoteObjectInterface_exportedInterface_serviceName_clientId_interruptionCode_invalidationCode_useCase_, &unk_25687F248, &unk_25687A158, CFSTR("com.apple.SetStoreUpdateService"), a3, 5, 4, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_activity, a4);

  return v10;
}

- (void)shouldDeferCurrentActivity:(id)a3
{
  void (**v4)(id, _QWORD);
  BMXPCActivity *activity;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    activity = self->_activity;
    v8 = v4;
    if (activity)
    {
      v6 = -[BMXPCActivity didDefer](activity, "didDefer");
      v4 = v8;
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }
    v4[2](v4, v7);
    v4 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

void __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "Successfully completed client activity: %@", (uint8_t *)&v3, 0xCu);
}

void __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2112;
  v6 = v3;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Failed to complete client activity (serviceResult: %u): %@", (uint8_t *)v4, 0x12u);
}

@end
