@implementation MOEffectiveShieldSettings

- (MOEffectiveArray)webDomains
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveArray *v7;
  void *v8;
  void *v9;
  MOEffectiveArray *v10;

  -[MOEffectiveShieldSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shield");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOShieldSettingsGroup webDomainsMetadata](MOShieldSettingsGroup, "webDomainsMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [MOEffectiveArray alloc];
  objc_msgSend(v4, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MOEffectiveArray initWithValue:defaultValue:](v7, "initWithValue:defaultValue:", v8, v9);

  return v10;
}

- (MOEffectiveCategoryShieldPolicy)applicationCategoryPolicy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveCategoryShieldPolicy *v7;

  -[MOEffectiveShieldSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shield");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOShieldSettingsGroup applicationCategoriesMetadata](MOShieldSettingsGroup, "applicationCategoriesMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOEffectiveCategoryShieldPolicy initWithValue:defaultValue:]([MOEffectiveCategoryShieldPolicy alloc], "initWithValue:defaultValue:", v4, v6);
  return v7;
}

- (MOEffectiveArray)applications
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveArray *v7;
  void *v8;
  void *v9;
  MOEffectiveArray *v10;

  -[MOEffectiveShieldSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shield");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOShieldSettingsGroup applicationsMetadata](MOShieldSettingsGroup, "applicationsMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [MOEffectiveArray alloc];
  objc_msgSend(v4, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MOEffectiveArray initWithValue:defaultValue:](v7, "initWithValue:defaultValue:", v8, v9);

  return v10;
}

- (MOEffectiveSettingsStore)store
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 8, 1);
}

- (MOEffectiveCategoryShieldPolicy)webDomainCategoryPolicy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MOEffectiveCategoryShieldPolicy *v7;

  -[MOEffectiveShieldSettings store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shield");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webDomainCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MOShieldSettingsGroup webDomainCategoriesMetadata](MOShieldSettingsGroup, "webDomainCategoriesMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOEffectiveCategoryShieldPolicy initWithValue:defaultValue:]([MOEffectiveCategoryShieldPolicy alloc], "initWithValue:defaultValue:", v4, v6);
  return v7;
}

- (MOEffectiveShieldSettings)init
{
  MOEffectiveShieldSettings *v2;
  uint64_t v3;
  MOEffectiveSettingsStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveShieldSettings;
  v2 = -[MOEffectiveShieldSettings init](&v6, sel_init);
  v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

+ (id)newConnection
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  v2 = +[MOManagedSettingsAgentConnection newConnection](MOManagedSettingsAgentConnection, "newConnection");
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __42__MOEffectiveShieldSettings_newConnection__block_invoke;
  v7 = &unk_1E675E388;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "setInterruptionHandler:", &v4);
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __42__MOEffectiveShieldSettings_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

+ (id)configurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v13 = (void *)objc_msgSend(a1, "newConnection");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke;
  v19[3] = &unk_1E675E3D8;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = &v31;
  v24 = &v25;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v13, 1, v19);
  if (a6 && !v32[5])
    *a6 = objc_retainAutorelease((id)v26[5]);
  objc_msgSend(v13, "invalidate");
  v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke_2;
    v10[3] = &unk_1E675E3B0;
    v11 = *(_OWORD *)(a1 + 56);
    objc_msgSend(a2, "fetchConfigurationForBundleIdentifier:categoryIdentifier:categoryName:replyHandler:", v7, v8, v9, v10);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

void __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v5, &obj);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

+ (id)configurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v10 = (void *)objc_msgSend(a1, "newConnection");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke;
  v18 = &unk_1E675E400;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = &v29;
  v22 = &v23;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v10, 1, &v15);
  if (a5 && !v30[5])
    *a5 = objc_retainAutorelease((id)v24[5]);
  objc_msgSend(v10, "invalidate", v15, v16, v17, v18);
  v13 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke_2;
    v9[3] = &unk_1E675E3B0;
    v10 = *(_OWORD *)(a1 + 48);
    objc_msgSend(a2, "fetchConfigurationForCategoryIdentifier:categoryName:replyHandler:", v7, v8, v9);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }

}

void __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v5, &obj);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

+ (id)configurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v13 = (void *)objc_msgSend(a1, "newConnection");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke;
  v19[3] = &unk_1E675E3D8;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = &v31;
  v24 = &v25;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v13, 1, v19);
  if (a6 && !v32[5])
    *a6 = objc_retainAutorelease((id)v26[5]);
  objc_msgSend(v13, "invalidate");
  v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke_2;
    v10[3] = &unk_1E675E3B0;
    v11 = *(_OWORD *)(a1 + 56);
    objc_msgSend(a2, "fetchConfigurationForWebDomain:categoryIdentifier:categoryName:replyHandler:", v7, v8, v9, v10);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

void __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v5, &obj);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

+ (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a1, "newConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __96__MOEffectiveShieldSettings_handleAction_bundleIdentifier_categoryIdentifier_completionHandler___block_invoke;
  v20 = &unk_1E675E428;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a3;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v13, 1, &v17);
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20);

}

uint64_t __96__MOEffectiveShieldSettings_handleAction_bundleIdentifier_categoryIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "handleAction:bundleIdentifier:categoryIdentifier:replyHandler:", a1[7], a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

+ (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a1, "newConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__MOEffectiveShieldSettings_handleAction_categoryIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E675E450;
  v15 = v9;
  v16 = a3;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v10, 1, v13);
  objc_msgSend(v10, "invalidate");

}

uint64_t __79__MOEffectiveShieldSettings_handleAction_categoryIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "handleAction:categoryIdentifier:replyHandler:", a1[6], a1[4], a1[5]);
  else
    return (*(uint64_t (**)(void))(a1[5] + 16))();
}

+ (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a1, "newConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __89__MOEffectiveShieldSettings_handleAction_webDomain_categoryIdentifier_completionHandler___block_invoke;
  v20 = &unk_1E675E428;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a3;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](MOXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v13, 1, &v17);
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20);

}

uint64_t __89__MOEffectiveShieldSettings_handleAction_webDomain_categoryIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "handleAction:webDomain:categoryIdentifier:replyHandler:", a1[7], a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
