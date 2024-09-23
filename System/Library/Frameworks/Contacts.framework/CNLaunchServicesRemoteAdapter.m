@implementation CNLaunchServicesRemoteAdapter

+ (id)os_log
{
  if (os_log_cn_once_token_0_19 != -1)
    dispatch_once(&os_log_cn_once_token_0_19, &__block_literal_global_127);
  return (id)os_log_cn_once_object_0_19;
}

void __39__CNLaunchServicesRemoteAdapter_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.contactsd", "launch-services");
  v1 = (void *)os_log_cn_once_object_0_19;
  os_log_cn_once_object_0_19 = (uint64_t)v0;

}

+ (id)launchServicesAdapterInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1A6E10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_applicationsForUserActivityType_withReply_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_applicationsForUserActivityType_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_applicationsForUserActivityType_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_applicationsAvailableForHandlingURLScheme_withReply_, 0, 0);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_applicationsAvailableForHandlingURLScheme_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_applicationsAvailableForHandlingURLScheme_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_applicationForBundleIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_applicationForBundleIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_applicationForBundleIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_openUserActivityData_inApplication_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_openUserActivityData_inApplication_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_openUserActivityData_inApplication_withReply_, 1, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openSensitiveURLInBackground_withOptions_withReply_, 0, 0);
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_openSensitiveURLInBackground_withOptions_withReply_, 1, 0);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openSensitiveURLInBackground_withOptions_withReply_, 1, 1);
  return v2;
}

+ (id)createConnectionWithInterface:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.contactsd.launch-services-proxy"), 0);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a1;
  objc_msgSend(v6, "setInterruptionHandler:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_27;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  v9[4] = a1;
  objc_msgSend(v6, "setInvalidationHandler:", v9);
  objc_msgSend(v6, "setRemoteObjectInterface:", v5);

  objc_msgSend(v6, "resume");
  return v6;
}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_27()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.contactsd.launch-services-proxy");
    _os_log_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_DEFAULT, "Service connection to %@ was invalidated", (uint8_t *)&v1, 0xCu);
  }

}

- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "launchServicesAdapterInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createConnectionWithInterface:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke;
  v12[3] = &unk_1E29F89E0;
  v12[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationsForUserActivityType:withReply:", v7, v6);

  objc_msgSend(v10, "invalidate");
}

void __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();

}

- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "launchServicesAdapterInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createConnectionWithInterface:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__CNLaunchServicesRemoteAdapter_applicationsAvailableForHandlingURLScheme_withReply___block_invoke;
  v12[3] = &unk_1E29F89E0;
  v12[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationsAvailableForHandlingURLScheme:withReply:", v7, v6);

  objc_msgSend(v10, "invalidate");
}

void __85__CNLaunchServicesRemoteAdapter_applicationsAvailableForHandlingURLScheme_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();

}

- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "launchServicesAdapterInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createConnectionWithInterface:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CNLaunchServicesRemoteAdapter_applicationForBundleIdentifier_withReply___block_invoke;
  v12[3] = &unk_1E29F89E0;
  v12[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationForBundleIdentifier:withReply:", v7, v6);

  objc_msgSend(v10, "invalidate");
}

void __74__CNLaunchServicesRemoteAdapter_applicationForBundleIdentifier_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();

}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "launchServicesAdapterInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createConnectionWithInterface:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__CNLaunchServicesRemoteAdapter_openUserActivityData_inApplication_withReply___block_invoke;
  v15[3] = &unk_1E29F89E0;
  v15[4] = self;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openUserActivityData:inApplication:withReply:", v10, v9, v8);

  objc_msgSend(v13, "invalidate");
}

void __78__CNLaunchServicesRemoteAdapter_openUserActivityData_inApplication_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();

}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "launchServicesAdapterInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createConnectionWithInterface:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__CNLaunchServicesRemoteAdapter_openSensitiveURLInBackground_withOptions_withReply___block_invoke;
  v15[3] = &unk_1E29F89E0;
  v15[4] = self;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openSensitiveURLInBackground:withOptions:withReply:", v10, v9, v8);

  objc_msgSend(v13, "invalidate");
}

void __84__CNLaunchServicesRemoteAdapter_openSensitiveURLInBackground_withOptions_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();

}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a1, a3, "Error: service connection to %@ was interrupted", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error: could not obtain service proxy %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
