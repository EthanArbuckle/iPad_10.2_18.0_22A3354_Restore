@implementation LNMetadataProvider

void __56__LNMetadataProvider_entitiesForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "entitiesForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __65__LNMetadataProvider_actionsWithFullyQualifiedIdentifiers_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[LNMetadataProvider getInterfaceWithSource:](a1[4], a1[8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "actionsWithFullyQualifiedIdentifiers:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  getLNLogCategoryMetadata();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = a1[5];
    v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1A18F6000, v8, OS_LOG_TYPE_INFO, "Client requested %@, got %@", buf, 0x16u);
  }

}

void __62__LNMetadataProvider_queriesForBundleIdentifier_ofType_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "queriesForBundleIdentifier:ofType:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __53__LNMetadataProvider_enumsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "enumsForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getInterfaceWithSource:(uint64_t)a1
{
  void *v2;
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  id v8;
  _TtC12LinkServices25_LNMetadataProviderDirect *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__LNMetadataProvider_getInterfaceWithSource___block_invoke;
  v18[3] = &unk_1E45DDE18;
  v18[4] = a1;
  v5 = (void (**)(_QWORD))_Block_copy(v18);
  if (a2 == 1)
  {
    v7 = *(void **)(a1 + 32);
    if (!v7)
    {
      v10 = [_TtC12LinkServices25_LNMetadataProviderDirect alloc];
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 16);
      v19 = 0;
      v13 = -[_LNMetadataProviderDirect initWithConnection:options:error:](v10, "initWithConnection:options:error:", v11, v12, &v19);
      v14 = v19;
      v15 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v13;

      if (v14)
      {
        getLNLogCategoryMetadata();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "Request for read access failed, falling back to XPC: %@", buf, 0xCu);
        }

        -[LNMetadataProvider getXPCProvider](a1);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = *(id *)(a1 + 32);
      }
      v2 = v17;

      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!a2)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      -[LNMetadataProvider getXPCProvider](a1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    getLNLogCategoryMetadata();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_INFO, "XPC provider requested, but there is already direct provider available", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
LABEL_9:
    v8 = v7;
LABEL_11:
    v2 = v8;
  }
LABEL_12:
  v5[2](v5);

  return v2;
}

void __45__LNMetadataProvider_getInterfaceWithSource___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL8 v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  _BOOL8 v19;
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

  v6 = a3;
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
  v7 = objc_msgSend(v6, "count") != 1;
  v8 = _os_activity_create(&dword_1A18F6000, "appintents:fetch fully qualified actions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__LNMetadataProvider_actionsWithFullyQualifiedIdentifiers_error___block_invoke;
  block[3] = &unk_1E45DC138;
  v17 = &v20;
  block[4] = self;
  v19 = v7;
  v9 = v6;
  v16 = v9;
  v18 = &v26;
  os_activity_apply(v8, block);

  v10 = (void *)v21[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    v13 = (void *)v27[5];
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
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch enums for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__LNMetadataProvider_enumsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch entities for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__LNMetadataProvider_entitiesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v16;
  id v17;
  _QWORD block[5];
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
  v32 = __Block_byref_object_copy__1834;
  v33 = __Block_byref_object_dispose__1835;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1834;
  v27 = __Block_byref_object_dispose__1835;
  v28 = 0;
  v10 = _os_activity_create(&dword_1A18F6000, "appintents:fetch queries for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__LNMetadataProvider_queriesForBundleIdentifier_ofType_error___block_invoke;
  block[3] = &unk_1E45DC9E0;
  v21 = &v23;
  block[4] = self;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v22 = &v29;
  os_activity_apply(v10, block);

  v13 = (void *)v24[5];
  if (v13)
  {
    v14 = v13;
  }
  else if (a5)
  {
    v16 = (void *)v30[5];
    if (v16)
    {
      *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v17;

    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13;
}

- (LNMetadataProvider)init
{
  return -[LNMetadataProvider initWithOptions:](self, "initWithOptions:", 0);
}

- (LNMetadataProvider)initWithOptions:(int64_t)a3
{
  LNMetadataProvider *v4;
  LNMetadataProvider *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  LNMetadataProvider *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LNMetadataProvider;
  v4 = -[LNMetadataProvider init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_options = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.registry"), 0);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    LNDaemonRegistryXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_connection, "resume");
    v9 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LNMetadataProvider;
  -[LNMetadataProvider dealloc](&v3, sel_dealloc);
}

- (id)actionsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_actionsWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  os_activity_apply(v5, block);

  v6 = (void *)v19[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v13[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1834;
  v36 = __Block_byref_object_dispose__1835;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1834;
  v30 = __Block_byref_object_dispose__1835;
  v31 = 0;
  v12 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions by protocol", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__LNMetadataProvider_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke;
  v20[3] = &unk_1E45DC0E8;
  v23 = &v26;
  v20[4] = self;
  v13 = v10;
  v21 = v13;
  v25 = a4;
  v14 = v11;
  v22 = v14;
  v24 = &v32;
  os_activity_apply(v12, v20);

  v15 = (void *)v27[5];
  if (v15)
  {
    v16 = v15;
  }
  else if (a6)
  {
    v18 = (void *)v33[5];
    if (v18)
    {
      *a6 = objc_retainAutorelease(v18);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v19;

    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v15;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions defaults", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__LNMetadataProvider_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1834;
  v38 = __Block_byref_object_dispose__1835;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1834;
  v32 = __Block_byref_object_dispose__1835;
  v33 = 0;
  v13 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions by protocol and parameters", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__LNMetadataProvider_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke;
  v22[3] = &unk_1E45DC110;
  v26 = &v28;
  v22[4] = self;
  v14 = v10;
  v23 = v14;
  v15 = v11;
  v24 = v15;
  v16 = v12;
  v25 = v16;
  v27 = &v34;
  os_activity_apply(v13, v22);

  v17 = (void *)v29[5];
  if (v17)
  {
    v18 = v17;
  }
  else if (a6)
  {
    v20 = (void *)v35[5];
    if (v20)
    {
      *a6 = objc_retainAutorelease(v20);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v21;

    }
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v17;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__LNMetadataProvider_actionsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch action identifiers for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__LNMetadataProvider_actionIdentifiersForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD block[5];
  id v20;
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
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1834;
  v34 = __Block_byref_object_dispose__1835;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1834;
  v28 = __Block_byref_object_dispose__1835;
  v29 = 0;
  v10 = _os_activity_create(&dword_1A18F6000, "appintents:fetch actions for bundle and action", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__LNMetadataProvider_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke;
  block[3] = &unk_1E45DC9E0;
  v22 = &v24;
  block[4] = self;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v23 = &v30;
  os_activity_apply(v10, block);

  v13 = (void *)v25[5];
  if (!v13)
  {
    if (a5)
    {
      v16 = (void *)v31[5];
      if (v16)
      {
        v15 = 0;
        *a5 = objc_retainAutorelease(v16);
        goto LABEL_12;
      }
      NSErrorFromMetadataProviderError(9004);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v17;

    }
    v15 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v13, "count"))
  {
    getLNLogCategoryMetadata();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v11;
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_DEFAULT, "Metadata not found for %{public}@:%{public}@", buf, 0x16u);
    }

  }
  v15 = (id)v25[5];
LABEL_12:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
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
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1834;
  v34 = __Block_byref_object_dispose__1835;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1834;
  v28 = __Block_byref_object_dispose__1835;
  v29 = 0;
  v10 = _os_activity_create(&dword_1A18F6000, "appintents:fetch action for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__LNMetadataProvider_actionForBundleIdentifier_andActionIdentifier_error___block_invoke;
  block[3] = &unk_1E45DC9E0;
  v22 = &v24;
  block[4] = self;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v23 = &v30;
  os_activity_apply(v10, block);

  v13 = (void *)v25[5];
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    if (!v31[5])
    {
      getLNLogCategoryMetadata();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v37 = v11;
        v38 = 2114;
        v39 = v12;
        _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_DEFAULT, "Metadata not found for %{public}@:%{public}@", buf, 0x16u);
      }

    }
    if (a5)
    {
      v17 = (void *)v31[5];
      if (v17)
      {
        *a5 = objc_retainAutorelease(v17);
      }
      else
      {
        NSErrorFromMetadataProviderError(9004);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v18;

      }
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v13;
}

- (id)bundlesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch bundles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_bundlesWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch bundle registrations", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LNMetadataProvider_bundleRegistrationsWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)queriesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch queries", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_queriesWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)enumsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch enums", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__LNMetadataProvider_enumsWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)entitiesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v9;
  id v10;
  _QWORD block[7];
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
  v5 = _os_activity_create(&dword_1A18F6000, "appintents:fetch entites", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__LNMetadataProvider_entitiesWithError___block_invoke;
  block[3] = &unk_1E45DC0C0;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else if (a3)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch action identifiers for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__LNMetadataProvider_entityIdentifiersForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1834;
  v24 = __Block_byref_object_dispose__1835;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch metadata version", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__LNMetadataProvider_metadataVersionForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E45DCA30;
  v14 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v20;
  os_activity_apply(v7, v12);

  if (a4)
  {
    v9 = (void *)v21[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = v17[3];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1834;
  v26 = __Block_byref_object_dispose__1835;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1834;
  v20 = __Block_byref_object_dispose__1835;
  v21 = 0;
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch app shortcuts provider mangled type name", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__LNMetadataProvider_appShortcutsProviderMangledTypeNameForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E45DCA30;
  v14 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v22;
  os_activity_apply(v7, v12);

  if (a4)
  {
    v9 = (void *)v23[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

- (BOOL)registerBundleWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1834;
  v17 = __Block_byref_object_dispose__1835;
  v18 = 0;
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:register bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke;
  block[3] = &unk_1E45DD4C0;
  block[4] = self;
  v11 = v6;
  v12 = &v13;
  v8 = v6;
  os_activity_apply(v7, block);

  *a4 = objc_retainAutorelease((id)v14[5]);
  LOBYTE(a4) = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return (char)a4;
}

- (void)registerBundleWithIdentifier:(id)a3 force:(BOOL)a4 reply:(id)a5
{
  void (**v7)(id, id);
  id v8;
  id v9;

  v9 = 0;
  v7 = (void (**)(id, id))a5;
  -[LNMetadataProvider registerBundleWithIdentifier:error:](self, "registerBundleWithIdentifier:error:", a3, &v9);
  v8 = v9;
  v7[2](v7, v8);

}

- (void)resetWithReply:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:reset metadata", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__LNMetadataProvider_resetWithReply___block_invoke;
  block[3] = &unk_1E45DD1E0;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (void)scanBundlesWithReply:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:scan bundles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LNMetadataProvider_scanBundlesWithReply___block_invoke;
  block[3] = &unk_1E45DD1E0;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (void)unregisterBundleWithIdentifier:(id)a3 reply:(id)a4
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
  activity = _os_activity_create(&dword_1A18F6000, "appintents:unregister bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke;
  block[3] = &unk_1E45DE0A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  os_activity_apply(activity, block);

}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
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

  v6 = a3;
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
  v7 = _os_activity_create(&dword_1A18F6000, "appintents:fetch example phrases for bundle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__LNMetadataProvider_examplePhrasesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E45DCA30;
  v16 = &v18;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_directProvider, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
}

void __62__LNMetadataProvider_examplePhrasesForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "examplePhrasesForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getXPCProvider
{
  void *v1;
  _LNMetadataProviderXPC *v3;
  void *v4;

  v1 = *(void **)(a1 + 24);
  if (!v1)
  {
    v3 = -[_LNMetadataProviderXPC initWithConnection:]([_LNMetadataProviderXPC alloc], "initWithConnection:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v3;

    v1 = *(void **)(a1 + 24);
  }
  return v1;
}

void __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_1E45DE2E8;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterBundleWithIdentifier:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__LNMetadataProvider_scanBundlesWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__LNMetadataProvider_scanBundlesWithReply___block_invoke_2;
  v5[3] = &unk_1E45DE2E8;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scanBundlesWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __43__LNMetadataProvider_scanBundlesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__LNMetadataProvider_resetWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__LNMetadataProvider_resetWithReply___block_invoke_2;
  v5[3] = &unk_1E45DE2E8;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __37__LNMetadataProvider_resetWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1834;
  v12 = __Block_byref_object_dispose__1835;
  v13 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1[4] + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_2;
  v7[3] = &unk_1E45DE140;
  v7[4] = &v8;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_3;
  v6[3] = &unk_1E45DE140;
  v6[4] = &v8;
  objc_msgSend(v4, "registerBundleWithIdentifier:force:reply:", v5, 1, v6);

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), (id)v9[5]);
  _Block_object_dispose(&v8, 8);

}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __83__LNMetadataProvider_appShortcutsProviderMangledTypeNameForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "appShortcutsProviderMangledTypeNameForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __63__LNMetadataProvider_metadataVersionForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "metadataVersionForBundleIdentifier:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

}

void __65__LNMetadataProvider_entityIdentifiersForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "entityIdentifiersForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __40__LNMetadataProvider_entitiesWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "entitiesWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __37__LNMetadataProvider_enumsWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "enumsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __39__LNMetadataProvider_queriesWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "queriesWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __51__LNMetadataProvider_bundleRegistrationsWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "bundleRegistrationsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __39__LNMetadataProvider_bundlesWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "bundlesWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __74__LNMetadataProvider_actionForBundleIdentifier_andActionIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "actionForBundleIdentifier:andActionIdentifier:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __75__LNMetadataProvider_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "actionsForBundleIdentifier:andActionIdentifier:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __65__LNMetadataProvider_actionIdentifiersForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "actionIdentifiersForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __55__LNMetadataProvider_actionsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "actionsForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __101__LNMetadataProvider_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "actionsConformingToSystemProtocol:withParametersOfTypes:bundleIdentifier:error:", v3, v4, v5, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __80__LNMetadataProvider_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "actionsAndSystemProtocolDefaultsForBundleIdentifier:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __92__LNMetadataProvider_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "actionsConformingToSystemProtocols:logicalType:bundleIdentifier:error:", v3, v5, v4, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __39__LNMetadataProvider_actionsWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "actionsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
