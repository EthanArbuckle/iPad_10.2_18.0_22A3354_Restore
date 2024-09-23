@implementation LNAutoShortcutsProvider

- (LNAutoShortcutsProvider)initWithOptions:(int64_t)a3
{
  LNAutoShortcutsProvider *v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSObject *v8;
  _TtC12LinkServices25_LNMetadataProviderDirect *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  id v12;
  LNAutoShortcutsProviderInterface *directAccess;
  NSObject *v14;
  _LNAutoShortcutsProviderXPC *v15;
  LNAutoShortcutsProviderInterface *xpcAccess;
  LNAutoShortcutsProvider *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)LNAutoShortcutsProvider;
  v4 = -[LNAutoShortcutsProvider init](&v20, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.registry"), 0);
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v5;

    LNDaemonRegistryXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4->_connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](v4->_connection, "resume");
    if ((a3 & 1) == 0)
    {
      getLNLogCategoryMetadata();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Reading directly from link metadata", buf, 2u);
      }

      v9 = [_TtC12LinkServices25_LNMetadataProviderDirect alloc];
      v10 = v4->_connection;
      v19 = 0;
      v11 = -[_LNMetadataProviderDirect initWithConnection:options:error:](v9, "initWithConnection:options:error:", v10, a3, &v19);
      v12 = v19;
      directAccess = v4->_directAccess;
      v4->_directAccess = (LNAutoShortcutsProviderInterface *)v11;

      if (!v4->_directAccess)
      {
        getLNLogCategoryMetadata();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v12;
          _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_ERROR, "Request for read access failed %@", buf, 0xCu);
        }

      }
    }
    v15 = -[_LNAutoShortcutsProviderXPC initWithConnection:]([_LNAutoShortcutsProviderXPC alloc], "initWithConnection:", v4->_connection);
    xpcAccess = v4->_xpcAccess;
    v4->_xpcAccess = (LNAutoShortcutsProviderInterface *)v15;

    v17 = v4;
  }

  return v4;
}

void __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[8] + 8);
    obj = *(id *)(v4 + 40);
    objc_msgSend(v2, "autoShortcutsForLocaleIdentifier:error:", v3, &obj);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v4 + 40), obj);
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
      (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;
  void *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD aBlock[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4151;
  v34 = __Block_byref_object_dispose__4152;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4151;
  v28 = __Block_byref_object_dispose__4152;
  v29 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke;
  aBlock[3] = &unk_1E45DCA30;
  v22 = &v24;
  aBlock[4] = self;
  v8 = v6;
  v21 = v8;
  v23 = &v30;
  v9 = _Block_copy(aBlock);
  v10 = _os_activity_create(&dword_1A18F6000, "appintents:fetch all app shortcuts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke_2;
  block[3] = &unk_1E45DCA58;
  block[4] = self;
  v18 = &v24;
  v11 = v8;
  v19 = &v30;
  v16 = v11;
  v17 = v9;
  os_activity_apply(v10, block);

  v12 = (void *)v25[5];
  if (v12)
  {
    v13 = v12;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v31[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v12;
}

- (LNAutoShortcutsProvider)init
{
  return -[LNAutoShortcutsProvider initWithOptions:](self, "initWithOptions:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  getLNLogCategoryGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_DEBUG, "-dealloc called on LNAutoShortcutsProvider", buf, 2u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)LNAutoShortcutsProvider;
  -[LNAutoShortcutsProvider dealloc](&v4, sel_dealloc);
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *activity;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:fetch app shortcuts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke;
  block[3] = &unk_1E45DC940;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  os_activity_apply(activity, block);

}

- (void)retrieveActionForLocalizedPhrase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSXPCConnection *connection;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  LNAutoShortcutsProvider *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getLNLogCategoryGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_DEBUG, "Fetching action for bundleIdentifier: %@", buf, 0xCu);

  }
  connection = self->_connection;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke;
  v23[3] = &unk_1E45DE2E8;
  v12 = v7;
  v24 = v12;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _os_activity_create(&dword_1A18F6000, "appintents:retrieve action for phrase", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_19;
  block[3] = &unk_1E45DC940;
  v19 = v6;
  v20 = v13;
  v21 = self;
  v22 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v6;
  os_activity_apply(v14, block);

}

- (void)retrieveActionForBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSXPCConnection *connection;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  LNAutoShortcutsProvider *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  getLNLogCategoryGeneral();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    v43 = 2112;
    v44 = v14;
    v45 = 2112;
    v46 = v15;
  }

  connection = self->_connection;
  v19 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke;
  v37[3] = &unk_1E45DE2E8;
  v20 = v16;
  v38 = v20;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _os_activity_create(&dword_1A18F6000, "appintents:retrieve action for actionId, parameterId", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_21;
  v29[3] = &unk_1E45DC968;
  v30 = v21;
  v31 = v12;
  v32 = v13;
  v33 = v14;
  v35 = self;
  v36 = v20;
  v34 = v15;
  v23 = v20;
  v24 = v15;
  v25 = v14;
  v26 = v13;
  v27 = v12;
  v28 = v21;
  os_activity_apply(v22, v29);

}

- (void)retrieveActionForBundleIdentifier:(id)a3 appShortcutIdentifier:(id)a4 parameterIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSXPCConnection *connection;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  LNAutoShortcutsProvider *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getLNLogCategoryGeneral();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_DEBUG, "Fetching action for bundleIdentifier: %@ appShortcutIdentifier: %@ parameterIdentifier: %@", buf, 0x20u);
  }

  connection = self->_connection;
  v16 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke;
  v32[3] = &unk_1E45DE2E8;
  v17 = v13;
  v33 = v17;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _os_activity_create(&dword_1A18F6000, "appintents:retrieve action for appshortcut identifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_22;
  block[3] = &unk_1E45DD0C0;
  v26 = v18;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v30 = self;
  v31 = v17;
  v20 = v17;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v18;
  os_activity_apply(v19, block);

}

- (id)autoShortcutsForApplicationRecord:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v15;
  LNAutoShortcutsProvider *v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__4151;
  v26[4] = __Block_byref_object_dispose__4152;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4151;
  v24 = __Block_byref_object_dispose__4152;
  v25 = 0;
  v8 = _os_activity_create(&dword_1A18F6000, "appintents:fetch app shortcuts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke;
  block[3] = &unk_1E45DC9E0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v18 = v26;
  v19 = &v20;
  v9 = v7;
  v10 = v6;
  os_activity_apply(v8, block);

  v11 = (void *)v21[5];
  if (!v11)
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v12;
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:fetch all app shortcuts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke;
  block[3] = &unk_1E45DE0A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD aBlock[5];
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

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__4151;
    v33 = __Block_byref_object_dispose__4152;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4151;
    v27 = __Block_byref_object_dispose__4152;
    v28 = 0;
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke;
    aBlock[3] = &unk_1E45DCA30;
    v21 = &v23;
    aBlock[4] = self;
    v8 = v6;
    v20 = v8;
    v22 = &v29;
    v9 = _Block_copy(aBlock);
    v10 = _os_activity_create(&dword_1A18F6000, "appintents:fetch properties", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke_2;
    block[3] = &unk_1E45DCA58;
    block[4] = self;
    v17 = &v23;
    v18 = &v29;
    v15 = v8;
    v16 = v9;
    os_activity_apply(v10, block);

    v11 = (void *)v24[5];
    if (v11)
    {
      v12 = v11;
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease((id)v30[5]);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAccess, 0);
  objc_storeStrong((id *)&self->_directAccess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 24);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "propertiesForIdentifiers:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[8] + 8);
    obj = *(id *)(v4 + 40);
    objc_msgSend(v2, "propertiesForIdentifiers:error:", v3, &obj);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v4 + 40), obj);
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
      (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 24);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "autoShortcutsForLocaleIdentifier:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke_2;
    v5[3] = &unk_1E45DCA08;
    v5[4] = v2;
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v3, "autoShortcutsForLocaleIdentifier:completion:", v6, v5);

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 24), "autoShortcutsForLocaleIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    return objc_msgSend(*(id *)(a1[4] + 24), "autoShortcutsForLocaleIdentifier:completion:", a1[5], a1[6]);
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  _QWORD v13[5];
  _QWORD v14[4];
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_2;
    v14[3] = &unk_1E45DC9B8;
    v15 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v3, "autoShortcutsForBundleIdentifier:localeIdentifier:completion:", v2, v5, v14);
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_3;
    v13[3] = &unk_1E45DE140;
    v13[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_4;
    v11[3] = &unk_1E45DC9B8;
    v12 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    objc_msgSend(v7, "autoShortcutsForBundleIdentifier:localeIdentifier:completionHandler:", v2, v8, v11);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      getLNLogCategoryGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Failed to retrieve app shortucts with error, returning empty array: %@", buf, 0xCu);
      }

    }
  }

}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_22(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_2;
  v6[3] = &unk_1E45DC990;
  v5 = (void *)a1[9];
  v6[4] = a1[8];
  v7 = v5;
  objc_msgSend(v1, "actionForBundleIdentifier:appShortcutIdentifier:parameterIdentifier:completionHandler:", v2, v3, v4, v6);

}

uint64_t __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_21(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E45DC990;
  v7 = *(id *)(a1 + 80);
  v8[4] = *(_QWORD *)(a1 + 72);
  v9 = v7;
  objc_msgSend(v2, "actionForBundleIdentifier:basePhraseTemplate:actionIdentifier:parameterIdentifier:completionHandler:", v3, v4, v5, v6, v8);

}

uint64_t __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "parameterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "basePhraseTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_2;
    v12[3] = &unk_1E45DC990;
    v7 = &v13;
    v8 = *(id *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 48);
    v13 = v8;
    objc_msgSend(v3, "actionForBundleIdentifier:basePhraseTemplate:parameterIdentifier:completionHandler:", v4, v5, v6, v12);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_3;
    v10[3] = &unk_1E45DC990;
    v7 = &v11;
    v9 = *(id *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 48);
    v11 = v9;
    objc_msgSend(v3, "actionForBundleIdentifier:basePhraseTemplate:completionHandler:", v4, v5, v10);
  }

}

uint64_t __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E45DC918;
    v13[4] = v2;
    v14 = v4;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v3, "autoShortcutsForBundleIdentifier:localeIdentifier:completion:", v14, v5, v13);

    v6 = v14;
  }
  else
  {
    v7 = *(void **)(v2 + 24);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_4;
    v11[3] = &unk_1E45DCDE0;
    v10 = *(id *)(a1 + 56);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v7, "autoShortcutsForBundleIdentifier:localeIdentifier:completion:", v8, v9, v11);
    v6 = v12;
  }

}

void __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_3;
    v7[3] = &unk_1E45DCDE0;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v4, "autoShortcutsForBundleIdentifier:localeIdentifier:completion:", v3, v5, v7);

  }
}

uint64_t __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)sharedInstance
{
  return objc_alloc_init(LNAutoShortcutsProvider);
}

@end
