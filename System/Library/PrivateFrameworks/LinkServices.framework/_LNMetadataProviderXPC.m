@implementation _LNMetadataProviderXPC

- (_LNMetadataProviderXPC)initWithConnection:(id)a3
{
  NSXPCConnection *v4;
  _LNMetadataProviderXPC *v5;
  NSXPCConnection *connection;
  objc_super v8;

  v4 = (NSXPCConnection *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_LNMetadataProviderXPC;
  v5 = -[_LNMetadataProviderXPC init](&v8, sel_init);
  connection = v5->_connection;
  v5->_connection = v4;

  return v5;
}

- (id)actionsWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___LNMetadataProviderXPC_actionsWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_actionsWithError___block_invoke_2;
  v10[3] = &unk_1E45DCBD8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "actionsWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1834;
  v30 = __Block_byref_object_dispose__1835;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1834;
  v24 = __Block_byref_object_dispose__1835;
  v25 = 0;
  v12 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96___LNMetadataProviderXPC_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke;
  v19[3] = &unk_1E45DE140;
  v19[4] = &v26;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __96___LNMetadataProviderXPC_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke_2;
  v18[3] = &unk_1E45DCBD8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v14, "actionsConformingToSystemProtocols:logicalType:bundleIdentifier:reply:", v10, a4, v11, v18);

  v15 = (void *)v21[5];
  if (v15)
    v16 = v15;
  else
    *a6 = objc_retainAutorelease((id)v27[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84___LNMetadataProviderXPC_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __84___LNMetadataProviderXPC_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DCBD8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "actionsAndSystemProtocolDefaultsForBundleIdentifier:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSXPCConnection *connection;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1834;
  v31 = __Block_byref_object_dispose__1835;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v13 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105___LNMetadataProviderXPC_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke;
  v20[3] = &unk_1E45DE140;
  v20[4] = &v27;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __105___LNMetadataProviderXPC_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke_2;
  v19[3] = &unk_1E45DCBD8;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v15, "actionsConformingToSystemProtocol:withParametersOfTypes:bundleIdentifier:reply:", v10, v11, v12, v19);

  v16 = (void *)v22[5];
  if (v16)
    v17 = v16;
  else
    *a6 = objc_retainAutorelease((id)v28[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59___LNMetadataProviderXPC_actionsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __59___LNMetadataProviderXPC_actionsForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DC9B8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "actionsForBundleIdentifier:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1834;
  v28 = __Block_byref_object_dispose__1835;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79___LNMetadataProviderXPC_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke;
  v17[3] = &unk_1E45DE140;
  v17[4] = &v24;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __79___LNMetadataProviderXPC_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke_2;
  v16[3] = &unk_1E45DC9B8;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForBundleIdentifier:andActionIdentifier:reply:", v8, v9, v16);

  v13 = (void *)v19[5];
  if (v13)
    v14 = v13;
  else
    *a5 = objc_retainAutorelease((id)v25[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1834;
  v28 = __Block_byref_object_dispose__1835;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78___LNMetadataProviderXPC_actionForBundleIdentifier_andActionIdentifier_error___block_invoke;
  v17[3] = &unk_1E45DE140;
  v17[4] = &v24;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __78___LNMetadataProviderXPC_actionForBundleIdentifier_andActionIdentifier_error___block_invoke_2;
  v16[3] = &unk_1E45DC9B8;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "actionsForBundleIdentifier:andActionIdentifier:reply:", v8, v9, v16);

  v13 = (void *)v19[5];
  if (v13)
    v14 = v13;
  else
    *a5 = objc_retainAutorelease((id)v25[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69___LNMetadataProviderXPC_actionsWithFullyQualifiedIdentifiers_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __69___LNMetadataProviderXPC_actionsWithFullyQualifiedIdentifiers_error___block_invoke_2;
  v13[3] = &unk_1E45DCBD8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "actionsWithFullyQualifiedIdentifiers:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1834;
  v27 = __Block_byref_object_dispose__1835;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1834;
  v21 = __Block_byref_object_dispose__1835;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69___LNMetadataProviderXPC_actionIdentifiersForBundleIdentifier_error___block_invoke;
  v16[3] = &unk_1E45DE140;
  v16[4] = &v23;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __69___LNMetadataProviderXPC_actionIdentifiersForBundleIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E45DC9B8;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v9, "actionIdentifiersForBundleIdentifier:reply:", v6, v15);

  v10 = (void *)v18[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    v13 = (void *)v24[5];
    if (v13)
    {
      *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v14;

    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1834;
  v27 = __Block_byref_object_dispose__1835;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1834;
  v21 = __Block_byref_object_dispose__1835;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69___LNMetadataProviderXPC_entityIdentifiersForBundleIdentifier_error___block_invoke;
  v16[3] = &unk_1E45DE140;
  v16[4] = &v23;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __69___LNMetadataProviderXPC_entityIdentifiersForBundleIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E45DC9B8;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v9, "entityIdentifiersForBundleIdentifier:reply:", v6, v15);

  v10 = (void *)v18[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    v13 = (void *)v24[5];
    if (v13)
    {
      *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v14;

    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (id)bundlesWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___LNMetadataProviderXPC_bundlesWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_bundlesWithError___block_invoke_2;
  v10[3] = &unk_1E45DC9B8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "bundlesWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___LNMetadataProviderXPC_bundleRegistrationsWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __55___LNMetadataProviderXPC_bundleRegistrationsWithError___block_invoke_2;
  v10[3] = &unk_1E45DC9B8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "bundleRegistrationsWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)queriesWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___LNMetadataProviderXPC_queriesWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43___LNMetadataProviderXPC_queriesWithError___block_invoke_2;
  v10[3] = &unk_1E45DCBD8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "queriesWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1834;
  v28 = __Block_byref_object_dispose__1835;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66___LNMetadataProviderXPC_queriesForBundleIdentifier_ofType_error___block_invoke;
  v17[3] = &unk_1E45DE140;
  v17[4] = &v24;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __66___LNMetadataProviderXPC_queriesForBundleIdentifier_ofType_error___block_invoke_2;
  v16[3] = &unk_1E45DC9B8;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "queriesForBundleIdentifier:ofType:reply:", v8, v9, v16);

  v13 = (void *)v19[5];
  if (v13)
    v14 = v13;
  else
    *a5 = objc_retainAutorelease((id)v25[5]);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)enumsWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___LNMetadataProviderXPC_enumsWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __41___LNMetadataProviderXPC_enumsWithError___block_invoke_2;
  v10[3] = &unk_1E45DCBD8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "enumsWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___LNMetadataProviderXPC_enumsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __57___LNMetadataProviderXPC_enumsForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DC9B8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "enumsForBundleIdentifier:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)entitiesWithError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1834;
  v16 = __Block_byref_object_dispose__1835;
  v17 = 0;
  v4 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44___LNMetadataProviderXPC_entitiesWithError___block_invoke;
  v11[3] = &unk_1E45DE140;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __44___LNMetadataProviderXPC_entitiesWithError___block_invoke_2;
  v10[3] = &unk_1E45DCBD8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "entitiesWithReply:", v10);

  v7 = (void *)v13[5];
  if (v7)
    v8 = v7;
  else
    *a3 = objc_retainAutorelease((id)v19[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v7;
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___LNMetadataProviderXPC_entitiesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __60___LNMetadataProviderXPC_entitiesForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DC9B8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "entitiesForBundleIdentifier:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  int64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1834;
  v22 = __Block_byref_object_dispose__1835;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67___LNMetadataProviderXPC_metadataVersionForBundleIdentifier_error___block_invoke;
  v13[3] = &unk_1E45DE140;
  v13[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __67___LNMetadataProviderXPC_metadataVersionForBundleIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E45DC160;
  v12[4] = &v14;
  v12[5] = &v18;
  objc_msgSend(v9, "metadataVersionForBundleIdentifier:reply:", v6, v12);

  *a4 = objc_retainAutorelease((id)v19[5]);
  v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    getLNLogCategoryMetadata();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "%@ not supported via XPC", (uint8_t *)&v9, 0xCu);

    }
    NSErrorFromMetadataProviderError(9000);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
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
  v24 = __Block_byref_object_copy__1834;
  v25 = __Block_byref_object_dispose__1835;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1834;
  v19 = __Block_byref_object_dispose__1835;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66___LNMetadataProviderXPC_examplePhrasesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DE140;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __66___LNMetadataProviderXPC_examplePhrasesForBundleIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E45DC9B8;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "examplePhrasesForBundleIdentifier:reply:", v6, v13);

  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    *a4 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
