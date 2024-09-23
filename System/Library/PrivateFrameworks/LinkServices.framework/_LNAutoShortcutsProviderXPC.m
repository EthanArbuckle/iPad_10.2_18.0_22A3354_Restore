@implementation _LNAutoShortcutsProviderXPC

- (_LNAutoShortcutsProviderXPC)initWithConnection:(id)a3
{
  id v5;
  _LNAutoShortcutsProviderXPC *v6;
  _LNAutoShortcutsProviderXPC *v7;
  _LNAutoShortcutsProviderXPC *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LNAutoShortcutsProviderXPC;
  v6 = -[_LNAutoShortcutsProviderXPC init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  NSXPCConnection *connection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92___LNAutoShortcutsProviderXPC_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke;
  v14[3] = &unk_1E45DE2E8;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "autoShortcutsForBundleIdentifier:localeIdentifier:completionHandler:", v12, v11, v10);

}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E45DE2E8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoShortcutsForLocaleIdentifier:completionHandler:", v9, v8);

}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4151;
  v25 = __Block_byref_object_dispose__4152;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4151;
  v19 = __Block_byref_object_dispose__4152;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __70___LNAutoShortcutsProviderXPC_autoShortcutsForLocaleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DCBD8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "autoShortcutsForLocaleIdentifier:completionHandler:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4151;
  v25 = __Block_byref_object_dispose__4152;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4151;
  v19 = __Block_byref_object_dispose__4152;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62___LNAutoShortcutsProviderXPC_propertiesForIdentifiers_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __62___LNAutoShortcutsProviderXPC_propertiesForIdentifiers_error___block_invoke_2;
  v13[3] = &unk_1E45DCBD8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "propertiesForIdentifiers:completionHandler:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
