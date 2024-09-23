@implementation CNLaunchServices

- (id)applicationsForUserActivityType:(id)a3
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise future](v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CNLaunchServices_applicationsForUserActivityType___block_invoke;
  v12[3] = &unk_1E29B9558;
  v12[4] = self;
  objc_msgSend(v6, "addFailureBlock:", v12);

  -[CNLaunchServices adapter](self, "adapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationsForUserActivityType:withReply:", v4, v8);

  -[CNPromise future](v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNLaunchServicesAdapter)adapter
{
  return self->_adapter;
}

- (CNLaunchServices)init
{
  void *v3;
  CNLaunchServicesLocalAdapter *v4;
  CNLaunchServices *v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNLaunchServicesLocalAdapter initWithApplicationWorkspace:]([CNLaunchServicesLocalAdapter alloc], "initWithApplicationWorkspace:", v3);
  v5 = -[CNLaunchServices initWithAdapter:](self, "initWithAdapter:", v4);

  return v5;
}

- (CNLaunchServices)initWithAdapter:(id)a3
{
  id v5;
  CNLaunchServices *v6;
  CNLaunchServices *v7;
  os_log_t v8;
  OS_os_log *log;
  CNLaunchServices *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNLaunchServices;
  v6 = -[CNLaunchServices init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = os_log_create("com.apple.contacts.contactsfoundation", "launchservices");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise future](v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke;
  v12[3] = &unk_1E29B9558;
  v12[4] = self;
  objc_msgSend(v6, "addFailureBlock:", v12);

  -[CNLaunchServices adapter](self, "adapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationsAvailableForHandlingURLScheme:withReply:", v4, v8);

  -[CNPromise future](v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

void __52__CNLaunchServices_applicationsForUserActivityType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (id)applicationForBundleIdentifier:(id)a3
{
  id v4;
  CNPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  v5 = objc_alloc_init(CNPromise);
  -[CNPromise future](v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke;
  v12[3] = &unk_1E29B9558;
  v12[4] = self;
  objc_msgSend(v6, "addFailureBlock:", v12);

  -[CNLaunchServices adapter](self, "adapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationForBundleIdentifier:withReply:", v4, v8);

  -[CNPromise future](v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPromise *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CNPromise);
  -[CNPromise future](v11, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke;
  v24[3] = &unk_1E29BC710;
  v14 = v8;
  v25 = v14;
  objc_msgSend(v12, "addSuccessBlock:", v24);

  -[CNPromise future](v11, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  v20 = 3221225472;
  v21 = __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke_2;
  v22 = &unk_1E29BA220;
  v23 = v14;
  v16 = v14;
  objc_msgSend(v15, "addFailureBlock:", &v19);

  -[CNLaunchServices adapter](self, "adapter", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPromise BOOLErrorCompletionHandlerAdapter](v11, "BOOLErrorCompletionHandlerAdapter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openUserActivityData:inApplication:withReply:", v10, v9, v18);

}

uint64_t __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPromise *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CNPromise);
  -[CNPromise future](v11, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke;
  v24[3] = &unk_1E29BC710;
  v14 = v8;
  v25 = v14;
  objc_msgSend(v12, "addSuccessBlock:", v24);

  -[CNPromise future](v11, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  v20 = 3221225472;
  v21 = __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke_2;
  v22 = &unk_1E29BA220;
  v23 = v14;
  v16 = v14;
  objc_msgSend(v15, "addFailureBlock:", &v19);

  -[CNLaunchServices adapter](self, "adapter", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPromise BOOLErrorCompletionHandlerAdapter](v11, "BOOLErrorCompletionHandlerAdapter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "openSensitiveURLInBackground:withOptions:withReply:", v10, v9, v18);

}

uint64_t __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_adapter, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

void __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "Error fetching application proxies %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

void __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "Error fetching application proxy %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

@end
