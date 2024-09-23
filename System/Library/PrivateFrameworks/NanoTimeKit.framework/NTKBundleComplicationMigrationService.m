@implementation NTKBundleComplicationMigrationService

- (NTKBundleComplicationMigrationService)init
{
  NTKBundleComplicationMigrationService *v2;
  uint64_t v3;
  NTKBundleComplicationIdentifierCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationMigrationService;
  v2 = -[NTKBundleComplicationMigrationService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NTKBundleComplicationIdentifierCache *)v3;

    NTKBundleComplicationMigrationServiceEnsureLookupDirectory();
  }
  return v2;
}

- (void)processRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKBundleComplicationMigrationService _processSingleRequest:completion:](self, "_processSingleRequest:completion:", v8, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKBundleComplicationMigrationService _processFallbackRequest:completion:](self, "_processFallbackRequest:completion:", v8, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.NTKBundleComplicationMigrationService"), 3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v7);

    }
  }

}

- (void)_processFallbackRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NTKBundleComplicationIdentifierCache *cache;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Begin processing fallback request %@", buf, 0xCu);
  }

  cache = self->_cache;
  objc_msgSend(v6, "complication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__NTKBundleComplicationMigrationService__processFallbackRequest_completion___block_invoke;
  v13[3] = &unk_1E6BD2DD0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[NTKBundleComplicationIdentifierCache fetchIdentifiersForComplication:completion:](cache, "fetchIdentifiersForComplication:completion:", v10, v13);

}

void __76__NTKBundleComplicationMigrationService__processFallbackRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v27 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_loadAndFetchClassesForBundleIdentifier:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "families");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v31)
  {
    v32 = 0;
    v29 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "integerValue");
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v8 = v30;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v9)
        {
          v10 = v9;
          v33 = i;
          v11 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v13, "bundleIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", v5);

              if (v15)
              {
                objc_msgSend(*(id *)(a1 + 40), "device");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v13, "acceptsComplicationFamily:forDevice:", v7, v16);

                if (v17)
                {
                  v18 = objc_alloc((Class)v13);
                  objc_msgSend(*(id *)(a1 + 40), "complication");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 40), "device");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = (void *)objc_opt_new();
                  v22 = objc_msgSend(v18, "initWithComplication:family:forDevice:context:", v19, v7, v20, v21);

                  v32 = (void *)v22;
                  goto LABEL_17;
                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v10)
              continue;
            break;
          }
LABEL_17:
          i = v33;
        }

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v31);
  }
  else
  {
    v32 = 0;
  }

  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "complication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v32, "family");
  objc_msgSend(*(id *)(a1 + 40), "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_performMigrationWithDataSource:complication:family:device:completion:", v32, v24, v25, v26, *(_QWORD *)(a1 + 48));

}

- (void)_processSingleRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NTKBundleComplicationIdentifierCache *cache;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Processing single request %@", buf, 0xCu);
  }

  cache = self->_cache;
  objc_msgSend(v6, "complication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NTKBundleComplicationMigrationService__processSingleRequest_completion___block_invoke;
  v13[3] = &unk_1E6BD2DD0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[NTKBundleComplicationIdentifierCache fetchIdentifiersForComplication:completion:](cache, "fetchIdentifiersForComplication:completion:", v10, v13);

}

void __74__NTKBundleComplicationMigrationService__processSingleRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_loadAndFetchClassesForBundleIdentifier:", a3);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "bundleIdentifier", (_QWORD)v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v13 = objc_alloc((Class)v10);
          objc_msgSend(*(id *)(a1 + 40), "complication");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(*(id *)(a1 + 40), "family");
          objc_msgSend(*(id *)(a1 + 40), "device");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_opt_new();
          v7 = (void *)objc_msgSend(v13, "initWithComplication:family:forDevice:context:", v14, v15, v16, v17);

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "complication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(*(id *)(a1 + 40), "family");
  objc_msgSend(*(id *)(a1 + 40), "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_performMigrationWithDataSource:complication:family:device:completion:", v7, v19, v20, v21, *(_QWORD *)(a1 + 48));

}

- (void)_performMigrationWithDataSource:(id)a3 complication:(id)a4 family:(int64_t)a5 device:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, uint64_t);
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  int64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  _QWORD aBlock[4];
  void (**v43)(id, _QWORD, uint64_t);
  _QWORD *v44;
  _QWORD v45[3];
  char v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, uint64_t))a7;
  if ((objc_msgSend(v13, "supportsWidgetMigration") & 1) == 0)
    goto LABEL_7;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.NTKBundleComplicationMigrationService"), 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v16;
    v14[2](v14, 0, v16);

    goto LABEL_11;
  }
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.NTKBundleComplicationMigrationService"), 1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_opt_class(), "hasMigratedToWidgetForFamily:device:", a5, v13) & 1) == 0)
  {
LABEL_7:
    v14[2](v14, 0, 0);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "complicationDescriptor");
  else
    objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
  v18 = objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke;
  aBlock[3] = &unk_1E6BD2DF8;
  v44 = v45;
  v43 = v14;
  v19 = _Block_copy(aBlock);
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CLKComplicationFamilyDescription();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v48 = v12;
    v49 = 2112;
    v50 = v21;
    v51 = 2048;
    v52 = a5;
    v53 = 2112;
    v54 = v22;
    _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "Fetching migration for request <complication=%@, family=%@ (%li)> from %@", buf, 0x2Au);

  }
  objc_msgSend((id)objc_opt_class(), "appIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_11;
  v36[3] = &unk_1E6BD2E48;
  v30 = v23;
  v37 = v30;
  v24 = v19;
  v40 = v24;
  v25 = v11;
  v38 = v25;
  v26 = v12;
  v39 = v26;
  v41 = a5;
  objc_msgSend(v25, "fetchWidgetMigrationForDescriptor:family:completion:", v18, a5, v36);
  v27 = (void *)v18;
  v28 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16;
  block[3] = &unk_1E6BD2E70;
  v34 = v24;
  v32 = v25;
  v33 = v26;
  v35 = a5;
  v29 = v24;
  dispatch_after(v28, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v45, 8);
LABEL_11:

}

BOOL __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(unsigned __int8 *)(v1 + 24);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return v2 == 0;
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_2;
  v7[3] = &unk_1E6BD2E20;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v11 = v4;
  v13 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2
    && (objc_msgSend(v2, "intentReference"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2 = *(void **)(a1 + 32),
        v3))
  {
    objc_msgSend(v2, "intentReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setLaunchId:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      INIntentWithTypedIntent();
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    v7 = objc_alloc(MEMORY[0x1E0C94578]);
    objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:", v8, v9, v10, v5);

    if (!v11)
      goto LABEL_11;
  }
  else
  {
    v11 = v2;
    if (!v11)
      goto LABEL_11;
  }
  objc_msgSend(v11, "extensionBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "containerBundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v11, "kind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_11:
        v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 32);
          objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 56);
          CLKComplicationFamilyDescription();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 72);
          v31 = 138413570;
          v32 = v19;
          v33 = 2112;
          v34 = v20;
          v35 = 2112;
          v36 = v21;
          v37 = 2112;
          v38 = v22;
          v39 = 2048;
          v40 = v23;
          v41 = 1024;
          v42 = v17;
          _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "Received migration result %@ in \"%@\" for request <complication=%@, family=%@ (%li)> (success=%d)", (uint8_t *)&v31, 0x3Au);

        }
        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.NTKBundleComplicationMigrationService"), 4, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v24 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    v26 = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 56);
    CLKComplicationFamilyDescription();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 72);
    v31 = 138413570;
    v32 = v26;
    v33 = 2112;
    v34 = v27;
    v35 = 2112;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    v39 = 2048;
    v40 = v30;
    v41 = 1024;
    v42 = v24;
    _os_log_fault_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_FAULT, "Received invalid migration result %@ in \"%@\" for request <complication=%@, family=%@ (%li)> (first=%d)", (uint8_t *)&v31, 0x3Au);

  }
LABEL_17:

}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.NTKBundleComplicationMigrationService"), 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16_cold_1(a1, v3);

  }
}

- (void)generateComplicationTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C944B0], "deviceForDescriptor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke;
  v10[3] = &unk_1E6BD2E98;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  +[NTKBundleComplicationMigrationTypeLookupGenerator generateLookupUsingService:device:completion:](NTKBundleComplicationMigrationTypeLookupGenerator, "generateLookupUsingService:device:completion:", self, v8, v10);

}

void __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void (*v14)(void);
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  NTKBundleComplicationMigrationCurrentVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuildVersion:", v5);

  objc_msgSend(v4, "setDictionary:", v3);
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v6)
  {
    NTKBundleComplicationMigrationServiceLookupPathForDevice(*(void **)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    v9 = objc_msgSend(v6, "writeToFile:options:error:", v8, 1, &v15);
    v10 = v15;

    if ((v9 & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      NTKBundleComplicationMigrationCurrentVersion();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = NTKBundleComplicationMigrationServiceSetLookupVersion(v11, v12);

      if ((v11 & 1) == 0)
      {
        _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke_cold_1((uint64_t)v8, v13);

      }
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v14();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = v7;
  }

}

- (void)_enumerateBundles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_enumerateBundles__onceToken != -1)
    dispatch_once(&_enumerateBundles__onceToken, &__block_literal_global_65);
  NTKBundleComplicationDirectoryURLs();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (void *)_enumerateBundles___complicationBundleLoader;
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2;
        v12[3] = &unk_1E6BD2EE0;
        v13 = v3;
        objc_msgSend(v10, "enumerateBundlesFromDirectoryURL:enumerator:", v9, v12);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke()
{
  NTKBundleLoader *v0;
  void *v1;

  v0 = objc_alloc_init(NTKBundleLoader);
  v1 = (void *)_enumerateBundles___complicationBundleLoader;
  _enumerateBundles___complicationBundleLoader = (uint64_t)v0;

}

uint64_t __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NTKBundleComplicationMigrationStatusForInfoDictionary(v4);

  if (!v5)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_INFO, "NTKBundleComplicationMigrationService: Skipping bundle %{public}@, not migrated", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
  {
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("NSPrincipalClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      goto LABEL_5;
    }
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2_cold_1(v3, v9);
LABEL_12:

    v8 = 0;
    goto LABEL_13;
  }
LABEL_5:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  v8 = 1;
LABEL_13:

  return v8;
}

- (id)_loadAndFetchClassesForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__24;
  v15 = __Block_byref_object_dispose__24;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__NTKBundleComplicationMigrationService__loadAndFetchClassesForBundleIdentifier___block_invoke;
  v8[3] = &unk_1E6BD2F08;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NTKBundleComplicationMigrationService _enumerateBundles:](self, "_enumerateBundles:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __81__NTKBundleComplicationMigrationService__loadAndFetchClassesForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
    {
      objc_msgSend(v3, "load");
      _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v7;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Loading bundle for identifier %{public}@", (uint8_t *)&v11, 0xCu);

      }
    }
    NTKBundleComplicationDataSourceClassesFromBundle(v3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  CLKComplicationFamilyDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = 138413058;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2048;
  v15 = v7;
  _os_log_fault_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_FAULT, "Timed out requesting migration from %@ with request <complication=%@, family=%@ (%li)>", (uint8_t *)&v8, 0x2Au);

}

void __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = v5;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Failed to set xattr on %@: %s", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationService: Bundle %{public}@ missing principal class", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_4();
}

@end
