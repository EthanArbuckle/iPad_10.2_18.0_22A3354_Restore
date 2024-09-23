@implementation MCMCodeSigningMapping

uint64_t __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_dataContainerTypeForIdentifier:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_onQueue_dataContainerTypeForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "codeSigningEntryWithIdentifier:error:", v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
    goto LABEL_2;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MCMErrorDomain")) & 1) != 0)
  {
    v11 = objc_msgSend(v8, "code");

    if (v11 == 67)
    {
LABEL_2:
      v9 = objc_msgSend(v7, "dataContainerClass");
      goto LABEL_10;
    }
  }
  else
  {

  }
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

void __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_entitlementsForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)appGroupIdentifiersForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appGroupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)entitlementsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  MCMCodeSigningEntry *v25;
  NSObject *v26;
  MCMCodeSigningEntry *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  _QWORD v34[5];
  MCMCodeSigningEntry *v35;
  id v36;
  _QWORD block[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3876;
  v44 = __Block_byref_object_dispose__3877;
  v45 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke;
  block[3] = &unk_1E8CB6408;
  v39 = &v40;
  block[4] = self;
  v7 = v4;
  v38 = v7;
  dispatch_sync(v5, block);

  if (!v41[5])
  {
    v8 = containermanager_copy_global_configuration();
    v9 = objc_msgSend(v8, "dispositionForContainerClass:", 1) == 1;

    if (v9)
    {
      v10 = containermanager_copy_global_configuration();
      objc_msgSend(v10, "staticConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configForContainerClass:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      +[MCMUserIdentityCache defaultUserIdentity](MCMUserIdentityCache, "defaultUserIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v12, v7, v33, 0, 0, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend((id)gContainerCache, "entryForContainerIdentity:error:", v14, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "metadataWithError:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "info");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.CachedCodeSigningInfo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v19 = v18;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;

          if (v20)
          {
            v21 = (void *)objc_msgSend(v20, "mutableCopy");
            container_log_handle_for_category();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v47 = v23;
              _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "Migrating code signing info from bundle container upon request for %@", buf, 0xCu);

            }
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Entitlements"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("com.apple.MobileContainerManager.Entitlements"));

            v25 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]([MCMCodeSigningEntry alloc], "initWithCodeSigningInfo:andDataContainerClass:", v21, 2);
            -[MCMCodeSigningMapping queue](self, "queue");
            v26 = objc_claimAutoreleasedReturnValue();
            v34[0] = v6;
            v34[1] = 3221225472;
            v34[2] = __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_79;
            v34[3] = &unk_1E8CB5E98;
            v34[4] = self;
            v27 = v25;
            v35 = v27;
            v36 = v16;
            dispatch_sync(v26, v34);

            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v41[5];
            v41[5] = v28;

          }
        }

      }
    }
  }
  v30 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v30;
}

- (id)_onQueue_entitlementsForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MCMEntitlements *v7;
  void *v8;
  id v9;
  void *v10;
  MCMEntitlements *v11;

  v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping _onQueue_codeSigningInfoForIdentifier:externalRequest:](self, "_onQueue_codeSigningInfoForIdentifier:externalRequest:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MCMEntitlements alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = containermanager_copy_global_configuration();
  objc_msgSend(v9, "classIterator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v7, "initWithEntitlements:clientIdentifier:classIterator:", v8, v4, v10);

  return v11;
}

- (id)_onQueue_codeSigningInfoForIdentifier:(id)a3 externalRequest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v8, "codeSigningEntryWithIdentifier:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v9)
    goto LABEL_2;
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MCMErrorDomain")) & 1) != 0)
  {
    v13 = objc_msgSend(v10, "code");

    if (v13 == 67)
    {
LABEL_2:
      -[MCMCodeSigningMapping _codeSigningInfoForCodeSigningEntry:externalRequest:](self, "_codeSigningInfoForCodeSigningEntry:externalRequest:", v9, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {

  }
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v10;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMSQLiteDB)codeSigningMappingDB
{
  return self->_codeSigningMappingDB;
}

- (id)_codeSigningInfoForCodeSigningEntry:(id)a3 externalRequest:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4
    && ((objc_msgSend(v5, "isPlaceholder") & 1) != 0
     || (objc_msgSend(v6, "isAdvanceCopy") & 1) != 0
     || (objc_msgSend(v6, "isInvalid") & 1) != 0
     || (objc_msgSend(v6, "isRegisteredByKernel") & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "codeSigningInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)dataContainerTypeForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MCMCodeSigningMapping_dataContainerTypeForIdentifier___block_invoke;
  v9[3] = &unk_1E8CB6408;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(v5, v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (MCMCodeSigningMapping)initWithUserIdentityCache:(id)a3 queue:(id)a4 mappingDB:(id)a5 childParentMapCache:(id)a6 library:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  MCMCodeSigningMapping *v17;
  MCMCodeSigningMapping *v18;
  id v20;
  _QWORD block[4];
  MCMCodeSigningMapping *v22;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MCMCodeSigningMapping;
  v17 = -[MCMCodeSigningMapping init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a4);
    objc_storeStrong((id *)&v18->_userIdentityCache, a3);
    objc_storeStrong((id *)&v18->_codeSigningMappingDB, a5);
    objc_storeStrong((id *)&v18->_library, a7);
    objc_storeStrong((id *)&v18->_childParentMapCache, a6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke;
    block[3] = &unk_1E8CB6458;
    v22 = v18;
    dispatch_sync(v13, block);

  }
  return v18;
}

- (void)_onQueue_migrateFromMappingFileToDBIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  id *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  id obj;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[8];
  uint8_t *v30;
  uint64_t v31;
  __int16 v32;
  uint8_t buf[4];
  _BYTE v34[10];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[MCMCodeSigningMapping queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3876;
  v27 = __Block_byref_object_dispose__3877;
  v28 = 0;
  -[MCMCodeSigningMapping library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("mcm_code_signing_info.plist"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MCMCodeSigningMapping _readCodeSigningMappingFromDiskAtURL:](self, "_readCodeSigningMappingFromDiskAtURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      *(_QWORD *)v29 = 0;
      v30 = v29;
      v31 = 0x2020000000;
      v32 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "Migrating code signing info from file to DB", buf, 2u);
      }

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke;
      v18[3] = &unk_1E8CB54E8;
      v18[4] = self;
      v18[5] = &v23;
      v18[6] = &v19;
      v18[7] = v29;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v18);
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *((unsigned __int16 *)v30 + 12);
        v11 = *((unsigned __int16 *)v20 + 12);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v34 = v10;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v11;
        _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Successfully migrated %d entries, failed to migrate %d", buf, 0xEu);
      }

      if (*((_WORD *)v30 + 12))
      {
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id *)(v24 + 5);
        obj = (id)v24[5];
        v14 = objc_msgSend(v12, "removeItemAtURL:error:", v6, &obj);
        objc_storeStrong(v13, obj);

        if ((v14 & 1) == 0)
        {
          container_log_handle_for_category();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = v24[5];
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v34 = v16;
            _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Failed to remove legacy code signing mapping file: %@", buf, 0xCu);
          }

        }
      }
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v29, 8);
    }

  }
  else
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Failed to get library url.", v29, 2u);
    }
  }

  _Block_object_dispose(&v23, 8);
}

- (void)migrateAppGroupIdsFromDataContainersToFile
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __objc2_class_ro **p_info;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  MCMCommandSetInfoValue *v23;
  void *v24;
  void *v25;
  MCMCommandSetInfoValue *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  void *v39;
  id obj;
  _QWORD block[5];
  id v42;
  id v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17D7010](self, a2);
  v3 = (void *)objc_opt_new();
  if ((objc_msgSend(v3, "hasMigrationOccurredForType:", CFSTR("GroupIdMigration")) & 1) == 0)
  {
    v33 = v3;
    v34 = v2;
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Performing group ID migration", buf, 2u);
    }

    -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIdentityForLegacyMobileUser");
    v6 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v6;
    +[MCMClientConnection privilegedClientConnectionWithUserIdentity:](MCMClientConnection, "privilegedClientConnectionWithUserIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    p_info = MCMCommandDeleteContainerContent.info;
    while (1)
    {
      v10 = (void *)gContainerCache;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v35, v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)qword_1CF8D9C58[v8];
      v43 = 0;
      objc_msgSend(v10, "entriesForUserIdentities:contentClass:transient:error:", v11, v12, 0, &v43);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v43;

      if (!v13)
        break;
      v37 = v14;
      v38 = v8;
      -[MCMCodeSigningMapping queue](self, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke;
      block[3] = &unk_1E8CB6318;
      block[4] = self;
      v16 = v13;
      v42 = v16;
      dispatch_sync(v15, block);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v16;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v46;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v46 != v19)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v20), "metadataMinimal");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc_init((Class)(p_info + 371));
            v23 = [MCMCommandSetInfoValue alloc];
            objc_msgSend(v21, "containerIdentity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "context");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:](v23, "initWithKey:value:containerIdentity:context:resultPromise:", CFSTR("com.apple.MobileInstallation.GroupContainerIDs"), 0, v24, v25, v22);

            -[MCMCommandSetInfoValue execute](v26, "execute");
            objc_msgSend(v22, "result");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "error");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              container_log_handle_for_category();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "containerIdentity");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "result");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "error");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v50 = v30;
                v51 = 2112;
                v52 = v31;
                _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Failed to clear group id metadata for %@ : %@", buf, 0x16u);

                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
              }

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
        }
        while (v18);
      }

      v8 = v38 + 1;
      if (v38 == 2)
      {
        v3 = v33;
        objc_msgSend(v33, "setMigrationCompleteForType:", CFSTR("GroupIdMigration"));
        v2 = v34;
        goto LABEL_22;
      }
    }
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    v2 = v34;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v50 = v12;
      v51 = 2112;
      v52 = v14;
      _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for userId: 501, class %ld : %@", buf, 0x16u);
    }

    v3 = v33;
LABEL_22:

  }
  objc_autoreleasePoolPop(v2);
}

- (void)_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  char *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  char *v29;
  MCMCodeSigningEntry *v30;
  void *v31;
  NSObject *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char *v39;
  uint64_t v40;
  id v41;
  MCMCodeSigningMapping *v42;
  NSObject *v43;
  id v44;
  id v45;
  const __CFString *v46;
  NSObject *v47;
  const __CFString *v48;
  void *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  NSObject *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    v40 = *(_QWORD *)v58;
    v41 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSObject **)(*((_QWORD *)&v57 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D17D7010]();
        v45 = 0;
        -[NSObject metadataWithError:](v11, "metadataWithError:", &v45);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v45;
        if (!v13)
        {
          container_log_handle_for_category();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v51 = "-[MCMCodeSigningMapping _onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:]";
            v52 = 2112;
            v53 = v11;
            v54 = 2112;
            v55 = v14;
            _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }
          goto LABEL_31;
        }
        objc_msgSend(v13, "info");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_32;
        objc_msgSend(v13, "info");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.GroupContainerIDs"));
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          container_log_handle_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "identifier");
            v33 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v51 = v33;
            v52 = 2112;
            v53 = v17;
            _os_log_debug_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEBUG, "Data container for userId: 501, identifier %@ references container IDs: %@", buf, 0x16u);

          }
          -[MCMCodeSigningMapping codeSigningMappingDB](v42, "codeSigningMappingDB");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          objc_msgSend(v19, "codeSigningEntryWithIdentifier:error:", v20, &v44);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v44;

          if (v21)
          {
            container_log_handle_for_category();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "identifier");
              v24 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v51 = v24;
              _os_log_impl(&dword_1CF807000, v23, OS_LOG_TYPE_DEFAULT, "Deleting app group entitlements for %@ because we already have them in mapping", buf, 0xCu);
              goto LABEL_14;
            }
            goto LABEL_28;
          }
          -[NSObject domain](v22, "domain");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isEqualToString:", CFSTR("MCMErrorDomain")))
          {
            v27 = -[NSObject code](v22, "code");

            if (v27 == 67)
            {
              container_log_handle_for_category();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "identifier");
                v29 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v51 = v29;
                _os_log_impl(&dword_1CF807000, v28, OS_LOG_TYPE_DEFAULT, "Migrating app group entitlements for %@", buf, 0xCu);

              }
              v30 = [MCMCodeSigningEntry alloc];
              v47 = v17;
              v48 = CFSTR("com.apple.MobileContainerManager.Entitlements");
              v46 = CFSTR("com.apple.security.application-groups");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v37;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](v30, "initWithCodeSigningInfo:andDataContainerClass:", v31, objc_msgSend(v13, "containerClass"));

              -[NSObject setInvalid:](v23, "setInvalid:", 1);
              -[MCMCodeSigningMapping codeSigningMappingDB](v42, "codeSigningMappingDB");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v22;
              v36 = objc_msgSend(v38, "addCodeSigningEntry:withIdentifier:error:", v23, v35, &v43);
              v25 = v43;

              if ((v36 & 1) == 0)
              {
                container_log_handle_for_category();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v13, "identifier");
                  v39 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v51 = v39;
                  v52 = 2112;
                  v53 = v25;
                  _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Failed to write migrated group id info to DB for %@ : %@", buf, 0x16u);

                }
              }
              goto LABEL_29;
            }
          }
          else
          {

          }
          container_log_handle_for_category();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "identifier");
            v24 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v51 = v24;
            v52 = 2112;
            v53 = v22;
            _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
LABEL_14:

          }
LABEL_28:
          v25 = v22;
LABEL_29:

          v9 = v40;
          v6 = v41;
          goto LABEL_30;
        }
        v25 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
      v8 = v34;
    }
    while (v34);
  }

}

- (void)_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id obj;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  __int128 *p_buf;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[MCMCodeSigningMapping queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MCMCodeSigningMapping library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("mcm_entitlements.plist"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "itemDoesNotExistAtURL:", v6);

    if ((v8 & 1) == 0)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Performing legacy entitlement migration", (uint8_t *)&buf, 2u);
      }

      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v6);
      v11 = v10;
      if (v10)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__3876;
        v39 = __Block_byref_object_dispose__3877;
        v40 = 0;
        -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.ChildPluginBundleIDs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.PlaceholderEntitlements"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("com.apple.MobileContainerManager.ChildPluginBundleIDs"));
        -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("com.apple.MobileContainerManager.EntitlementsRegisteredByCaller"));
        -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("com.apple.MobileContainerManager.PlaceholderEntitlements"));
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke;
        v27[3] = &unk_1E8CB5510;
        p_buf = &buf;
        v27[4] = self;
        v15 = v12;
        v28 = v15;
        v16 = v14;
        v29 = v16;
        v17 = v13;
        v30 = v17;
        -[NSObject enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v27);
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id *)(*((_QWORD *)&buf + 1) + 40);
        obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
        v20 = objc_msgSend(v18, "removeItemAtURL:error:", v6, &obj);
        objc_storeStrong(v19, obj);

        if ((v20 & 1) == 0)
        {
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            -[NSObject path](v6, "path");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            *(_DWORD *)v32 = 138412546;
            v33 = v24;
            v34 = 2112;
            v35 = v25;
            _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Failed to remove legacy file at %@: %@", v32, 0x16u);

          }
        }
        container_log_handle_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "Legacy entitlement migration completed", v32, 2u);
        }

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        container_log_handle_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[NSObject path](v6, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v23;
          _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Entitlement File exists at %@, but we unexpectedly cant read it", (uint8_t *)&buf, 0xCu);

        }
      }

    }
  }
  else
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Failed to get library url.", (uint8_t *)&buf, 2u);
    }
  }

}

- (void)migrateCachedCodeSigningInfoFromBundleContainersToMapping
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend(v4, "hasMigrationOccurredForType:", CFSTR("CodeSigningMigration")) & 1) == 0)
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Performing code signing migration", buf, 2u);
    }

    v6 = containermanager_copy_global_configuration();
    objc_msgSend(v6, "classIterator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke;
    v8[3] = &unk_1E8CB5588;
    v8[4] = self;
    objc_msgSend(v7, "selectWithFlags:iterator:", 0x10000040000, v8);

    objc_msgSend(v4, "setMigrationCompleteForType:", CFSTR("CodeSigningMigration"));
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:(id)a3 containerClass:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  NSObject *v28;
  char *v29;
  NSObject *v30;
  void *v31;
  MCMCodeSigningEntry *v32;
  uint64_t v33;
  char *v34;
  id v35;
  MCMCodeSigningEntry *v36;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  char *v41;
  uint64_t v42;
  __int128 v43;
  id v44;
  MCMCodeSigningMapping *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
  if (v9)
  {
    v11 = v9;
    v49 = *(_QWORD *)v63;
    *(_QWORD *)&v10 = 138412546;
    v43 = v10;
    v44 = v8;
    v45 = self;
    v46 = a4;
    do
    {
      v12 = 0;
      v47 = v11;
      do
      {
        if (*(_QWORD *)v63 != v49)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1D17D7010]();
        v54 = 0;
        objc_msgSend(v13, "metadataWithError:", &v54);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v54;
        v17 = v16;
        if (v15)
        {
          v50 = v16;
          v51 = v14;
          objc_msgSend(v15, "info");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.CachedCodeSigningInfo"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;

          if (!v21)
          {
            v17 = v50;
            v14 = v51;
            goto LABEL_41;
          }
          -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0;
          objc_msgSend(v22, "codeSigningEntryWithIdentifier:error:", v23, &v53);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v53;

          v48 = v24;
          if (v24 && (objc_msgSend(v24, "isInvalid") & 1) == 0)
          {
            container_log_handle_for_category();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            objc_msgSend(v15, "identifier");
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v56 = v34;
            _os_log_impl(&dword_1CF807000, v30, OS_LOG_TYPE_DEFAULT, "Deleting cached code signing info for %@ because we already have it in mapping", buf, 0xCu);
          }
          else
          {
            objc_msgSend(v25, "domain", v43);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "isEqualToString:", CFSTR("MCMErrorDomain"))
              && objc_msgSend(v25, "code") == 67)
            {

              goto LABEL_20;
            }
            v27 = objc_msgSend(v24, "isInvalid");

            if ((v27 & 1) != 0)
            {
LABEL_20:
              container_log_handle_for_category();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "identifier");
                v29 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v56 = v29;
                _os_log_impl(&dword_1CF807000, v28, OS_LOG_TYPE_DEFAULT, "Migrating code signing info for %@", buf, 0xCu);

              }
              v30 = -[NSObject mutableCopy](v21, "mutableCopy");
              -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("Entitlements"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, CFSTR("com.apple.MobileContainerManager.Entitlements"));

              v32 = [MCMCodeSigningEntry alloc];
              if ((uint64_t)a4 > 4)
              {
                if (a4 == 5)
                {
                  v33 = 6;
                }
                else
                {
                  v33 = 2;
                  if (a4 != 14)
                    goto LABEL_33;
                }
              }
              else
              {
                v33 = 2;
                if (a4 == 1)
                  goto LABEL_35;
                if (a4 == 3)
                {
                  v33 = 4;
                  goto LABEL_35;
                }
LABEL_33:
                v33 = 0;
              }
LABEL_35:
              v36 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](v32, "initWithCodeSigningInfo:andDataContainerClass:", v30, v33);
              -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v25;
              v39 = objc_msgSend(v37, "addCodeSigningEntry:withIdentifier:error:", v36, v38, &v52);
              v35 = v52;

              v8 = v44;
              if ((v39 & 1) == 0)
              {
                container_log_handle_for_category();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v15, "identifier");
                  v41 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v43;
                  v56 = v41;
                  v57 = 2112;
                  v58 = v35;
                  _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Failed to write migrated cached cs info from bundle container to DB for %@ : %@", buf, 0x16u);

                }
              }

              self = v45;
              a4 = v46;
LABEL_40:
              v17 = v50;
              v14 = v51;

              v11 = v47;
              goto LABEL_41;
            }
            container_log_handle_for_category();
            v30 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
LABEL_30:
              v35 = v25;
              goto LABEL_40;
            }
            objc_msgSend(v15, "identifier");
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v43;
            v56 = v34;
            v57 = 2112;
            v58 = v25;
            _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
          }

          goto LABEL_30;
        }
        container_log_handle_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v56 = "-[MCMCodeSigningMapping _onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainers"
                "Legacy:containerClass:]";
          v57 = 2112;
          v58 = v13;
          v59 = 2112;
          v60 = v17;
          _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
            buf,
            0x20u);
        }
LABEL_41:

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v11 != v12);
      v42 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
      v11 = v42;
    }
    while (v42);
  }

}

- (void)_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  MCMCodeSigningEntry *v19;
  uint64_t v20;
  id v21;
  MCMCodeSigningEntry *v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCMCodeSigningMapping queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v11, "codeSigningEntryWithIdentifier:error:", v9, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;

  if (v12 && (objc_msgSend(v12, "isInvalid") & 1) == 0)
  {
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "Deleting cached code signing info for %@ because we already have it in mapping", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("MCMErrorDomain")) && objc_msgSend(v13, "code") == 67)
  {

    goto LABEL_7;
  }
  v15 = objc_msgSend(v12, "isInvalid");

  if ((v15 & 1) == 0)
  {
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }
LABEL_17:
    v21 = v13;
    goto LABEL_27;
  }
LABEL_7:
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Migrating code signing info for %@", buf, 0xCu);
  }

  v17 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Entitlements"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, CFSTR("com.apple.MobileContainerManager.Entitlements"));

  v19 = [MCMCodeSigningEntry alloc];
  v20 = 2;
  if ((uint64_t)a5 > 4)
  {
    if (a5 == 5)
    {
      v20 = 6;
      goto LABEL_22;
    }
    if (a5 != 14)
      goto LABEL_20;
  }
  else if (a5 != 1)
  {
    if (a5 == 3)
    {
      v20 = 4;
      goto LABEL_22;
    }
LABEL_20:
    v20 = 0;
  }
LABEL_22:
  v22 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](v19, "initWithCodeSigningInfo:andDataContainerClass:", v17, v20);
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  v24 = objc_msgSend(v23, "addCodeSigningEntry:withIdentifier:error:", v22, v9, &v26);
  v21 = v26;

  if ((v24 & 1) == 0)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v21;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to write migrated cached cs info from bundle container to DB for %@ : %@", buf, 0x16u);
    }

  }
LABEL_27:

}

- (void)_onQueue_reconcileSystemContainersWithContext:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  MCMResultPromise *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *log;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  void *v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  NSObject *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3876;
  v40 = __Block_byref_object_dispose__3877;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultUserIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke;
  block[3] = &unk_1E8CB6408;
  v35 = &v36;
  block[4] = self;
  v31 = v5;
  v34 = v31;
  dispatch_sync(v7, block);

  if (v37[5])
  {
    container_log_handle_for_category();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v8 = v37[5];
      *(_DWORD *)buf = 138412290;
      v49 = v8;
      _os_log_error_impl(&dword_1CF807000, log, OS_LOG_TYPE_ERROR, "Failed to enumerate system container references: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v30, "containerCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v9, "entriesForUserIdentities:contentClass:transient:error:", v10, 12, 0, &v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    log = v32;

    if (v27)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v11 = v27;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "metadataMinimal");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v31, "containsObject:", v16);

            if ((v17 & 1) == 0)
            {
              container_log_handle_for_category();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v15, "identifier");
                v26 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v49 = v26;
                _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Removing system container with identifier %@", buf, 0xCu);

              }
              v19 = objc_alloc_init(MCMResultPromise);
              objc_msgSend(v15, "containerIdentity");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v20;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v21, 0, v30, v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "execute");
              -[MCMResultPromise result](v19, "result");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "error");
              v24 = objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                container_log_handle_for_category();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v24;
                  _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to destroy system container(s) with no references; error = %@",
                    buf,
                    0xCu);
                }

              }
            }

          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
        }
        while (v12);
      }
    }
    else
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = log;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch system container list: %@", buf, 0xCu);
      }
    }

  }
  _Block_object_dispose(&v36, 8);

}

- (void)performAllCodeSigningMigrationAndReconciliationWithContext:(id)a3
{
  host_t v4;
  NSObject *v5;
  uint64_t v6;
  host_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  uint32_t multiuser_flags;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  multiuser_flags = 0;
  v4 = MEMORY[0x1D17D6F20]();
  if (host_get_multiuser_config_flags(v4, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
    -[MCMCodeSigningMapping migrateAppGroupIdsFromDataContainersToFile](self, "migrateAppGroupIdsFromDataContainersToFile");
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke;
  block[3] = &unk_1E8CB6458;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = -[MCMCodeSigningMapping migrateCachedCodeSigningInfoFromBundleContainersToMapping](self, "migrateCachedCodeSigningInfoFromBundleContainersToMapping");
  multiuser_flags = 0;
  v7 = MEMORY[0x1D17D6F20](v6);
  if (host_get_multiuser_config_flags(v7, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    +[MCMGroupManager defaultManager](MCMGroupManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reconcileGroupContainersForContainerClass:context:", 7, v9);

  }
}

- (id)_readCodeSigningMappingFromDiskAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  MCMCodeSigningEntry *v14;
  void *v15;
  MCMCodeSigningEntry *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  NSObject *obj;
  id v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "MCM_dictionaryWithContentsOfURL:options:error:", v3, 0, &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    if (v8)
    {
      v9 = v8;
      v21 = v6;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D17D7010]();
          v14 = [MCMCodeSigningEntry alloc];
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[MCMCodeSigningEntry initWithSerializedDictionary:](v14, "initWithSerializedDictionary:", v15);

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v12);
          objc_autoreleasePoolPop(v13);
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      }
      while (v9);
      v6 = v21;
    }
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v5, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_14;
  }
  v18 = objc_msgSend(v6, "code");

  if (v18 != 2)
  {
LABEL_14:
    container_log_handle_for_category();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v20;
      v31 = 2112;
      v32 = v6;
      _os_log_error_impl(&dword_1CF807000, obj, OS_LOG_TYPE_ERROR, "Failed to read code signing mapping file at %@ : %@", buf, 0x16u);

    }
    v7 = 0;
    goto LABEL_17;
  }
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)_onQueue_setCodeSigningDictionaryValues:(id)a3 forIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  char v28;
  id v29;
  NSObject *v30;
  const char *v31;
  NSObject *v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MCMCodeSigningMapping queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v6, "count");
  if (v9 != objc_msgSend(v7, "count"))
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke;
    v39[3] = &unk_1E8CB61F8;
    v40 = v6;
    v41 = v7;
    __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke((uint64_t)v39);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (uint64_t)v40;
    goto LABEL_31;
  }
  if (!objc_msgSend(v6, "count") || !objc_msgSend(v6, "count"))
  {
    v11 = 0;
    goto LABEL_33;
  }
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&v10 = 138412290;
  v34 = v10;
  while (1)
  {
    v13 = v11;
    objc_msgSend(v6, "objectAtIndex:", v12, v34);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v11;
    objc_msgSend(v16, "codeSigningEntryWithIdentifier:error:", v15, &v38);
    v17 = objc_claimAutoreleasedReturnValue();
    v11 = v38;

    if (v17)
      goto LABEL_9;
    objc_msgSend(v11, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqualToString:", CFSTR("MCMErrorDomain")))
      break;
    v19 = objc_msgSend(v11, "code");

    if (v19 != 67)
      goto LABEL_35;

    v11 = 0;
LABEL_9:
    objc_msgSend((id)v14, "codeSigningInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {

      v14 = 0;
    }
    if (!(v17 | v14) || (objc_msgSend((id)v14, "isEqual:", v17) & 1) != 0)
      goto LABEL_26;
    -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v14)
    {
      v37 = v11;
      v23 = objc_msgSend(v21, "addCodeSigningEntry:withIdentifier:error:", v14, v15, &v37);
      v35 = v37;

      if ((v23 & 1) != 0)
      {
        container_log_handle_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v15;
          v44 = 2112;
          v45 = v14;
          v25 = v24;
          v26 = "Set Code Signing Mapping for ID: %@ : %@";
          v27 = 22;
LABEL_20:
          _os_log_impl(&dword_1CF807000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
        }
      }
      else
      {
        container_log_handle_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v15;
          v44 = 2112;
          v29 = v35;
          v45 = (uint64_t)v35;
          v30 = v24;
          v31 = "Failed to write code signing info to DB for %@ : %@";
LABEL_29:
          _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
          goto LABEL_25;
        }
      }
    }
    else
    {
      v36 = v11;
      v28 = objc_msgSend(v21, "deleteCodeSigningEntryWithIdentifier:error:", v15, &v36);
      v35 = v36;

      if ((v28 & 1) != 0)
      {
        container_log_handle_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          v43 = v15;
          v25 = v24;
          v26 = "Deleted Code Signing Mapping for ID: %@";
          v27 = 12;
          goto LABEL_20;
        }
      }
      else
      {
        container_log_handle_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v15;
          v44 = 2112;
          v29 = v35;
          v45 = (uint64_t)v35;
          v30 = v24;
          v31 = "Failed to delete code signing info from DB for %@ : %@";
          goto LABEL_29;
        }
      }
    }
    v29 = v35;
LABEL_25:

    v11 = v29;
LABEL_26:

    if (++v12 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_33;
  }

LABEL_35:
  container_log_handle_for_category();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v43 = v15;
    v44 = 2112;
    v45 = (uint64_t)v11;
    _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

LABEL_31:
LABEL_33:

  return v11;
}

- (id)_entitlementsFromCodeSigningEntry:(id)a3
{
  void *v3;
  void *v4;

  -[MCMCodeSigningMapping _codeSigningInfoForCodeSigningEntry:externalRequest:](self, "_codeSigningInfoForCodeSigningEntry:externalRequest:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_onQueue_codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "codeSigningEntryWithIdentifier:error:", v6, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (v9)
    goto LABEL_6;
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MCMErrorDomain")) & 1) == 0)
  {

LABEL_8:
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    if (a4)
      goto LABEL_5;
    goto LABEL_6;
  }
  v12 = objc_msgSend(v10, "code");

  if (v12 != 67)
    goto LABEL_8;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v10);
LABEL_6:

  return v9;
}

- (BOOL)_onQueue_identifierHasCallerRegisteredEntitlements:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "codeSigningEntryWithIdentifier:error:", v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
    goto LABEL_2;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MCMErrorDomain")) & 1) != 0)
  {
    v11 = objc_msgSend(v8, "code");

    if (v11 == 67)
    {
LABEL_2:
      v9 = objc_msgSend(v7, "isRegisteredByCaller");
      goto LABEL_10;
    }
  }
  else
  {

  }
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_onQueue_processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 oldEntitlements:(id)a6 error:(id *)a7 reconcileHandler:(id)a8
{
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  MCMError *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  BOOL v33;
  void *v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  MCMEntitlements *v45;
  id v46;
  void *v47;
  MCMEntitlements *v48;
  id v49;
  BOOL v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  MCMError *v68;
  void *v69;
  int v70;
  char v71;
  id *v73;
  void (**v74)(void);
  void *v75;
  void *v76;
  MCMCodeSigningMapping *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v73 = a7;
  v104 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v83 = a4;
  v84 = a5;
  v78 = a6;
  v74 = (void (**)(void))a8;
  v77 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v76 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v79 = (void *)objc_opt_new();
  v81 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  if (!v83)
  {
    v24 = 0;
    v25 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 18);
    v85 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v17 = 0;
    goto LABEL_79;
  }
  v14 = v84;
  if (!v84)
    v14 = (id)MEMORY[0x1E0C9AA70];
  v84 = v14;
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB", v73);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  objc_msgSend(v15, "codeSigningEntryWithIdentifier:error:", v83, &v93);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v93;

  if (!v16)
  {
    objc_msgSend(v17, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqualToString:", CFSTR("MCMErrorDomain")))
    {
      v31 = objc_msgSend(v17, "code") == 67;

      if (v31)
      {

        v17 = 0;
        goto LABEL_5;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v95 = v83;
      v96 = 2112;
      v97 = (uint64_t)v17;
      _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    v16 = 0;
    v85 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v33 = 0;
    if (!v17)
      goto LABEL_73;
    goto LABEL_67;
  }
LABEL_5:
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.DataContainerClass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setDataContainerClass:", objc_msgSend(v18, "unsignedLongLongValue"));

  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.ParentBundleID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v85)
    goto LABEL_30;
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v17;
  objc_msgSend(v19, "codeSigningEntryWithIdentifier:error:", v85, &v92);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v92;

  if (v20)
  {
    v17 = v21;
    goto LABEL_8;
  }
  objc_msgSend(v21, "domain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "isEqualToString:", CFSTR("MCMErrorDomain")))
  {

LABEL_45:
    container_log_handle_for_category();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v95 = v83;
      v96 = 2112;
      v97 = (uint64_t)v21;
      _os_log_error_impl(&dword_1CF807000, v56, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }

    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v33 = 0;
    v17 = v21;
    if (!v21)
      goto LABEL_73;
    goto LABEL_67;
  }
  v35 = objc_msgSend(v21, "code") == 67;

  if (!v35)
    goto LABEL_45;

  v17 = 0;
LABEL_8:
  objc_msgSend(v20, "childBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  if (v23)
  {
    if (!v20)
      goto LABEL_24;
  }
  else
  {
    v23 = (void *)objc_opt_new();
    if (!v20)
LABEL_24:
      v20 = (void *)objc_opt_new();
  }
  if ((objc_msgSend(v23, "containsObject:", v83) & 1) == 0)
  {
    objc_msgSend(v23, "addObject:", v83);
    v36 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v20, "setChildBundleIdentifiers:", v36);

    container_log_handle_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v95 = v23;
      v96 = 2112;
      v97 = (uint64_t)v85;
      v98 = 2112;
      v99 = (uint64_t)v83;
      _os_log_debug_impl(&dword_1CF807000, v37, OS_LOG_TYPE_DEBUG, "Staging Child Bundles: %@ for parent ID: %@ by appending: %@", buf, 0x20u);
    }

    objc_msgSend(v79, "addObject:", v20);
    objc_msgSend(v81, "addObject:", v85);
  }

LABEL_30:
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("RegByCaller"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
    objc_msgSend(v82, "setRegisteredByCaller:", 1);
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.PlaceholderEntitlements"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "BOOLValue");

  if (v41)
    objc_msgSend(v82, "setPlaceholder:", 1);
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.AdvanceCopy"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "BOOLValue");

  if (v43)
    objc_msgSend(v82, "setAdvanceCopy:", 1);
  objc_msgSend(v82, "setCodeSigningInfo:", v80);
  if (v16 && (objc_msgSend(v16, "isEqual:", v82) & 1) != 0)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
  }
  else
  {
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = [MCMEntitlements alloc];
    v46 = containermanager_copy_global_configuration();
    objc_msgSend(v46, "classIterator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v45, "initWithEntitlements:clientIdentifier:classIterator:", v44, v83, v47);

    v49 = containermanager_copy_global_configuration();
    v50 = objc_msgSend(v49, "systemContainerMode") == 0;

    if (!v50
      && objc_msgSend(v78, "hasSystemContainer")
      && !-[MCMEntitlements hasSystemContainer](v48, "hasSystemContainer"))
    {
      v51 = containermanager_copy_global_configuration();
      objc_msgSend(v51, "staticConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "configForContainerClass:", 12);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      -[MCMCodeSigningMapping userIdentityCache](v77, "userIdentityCache");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerIdentity containerIdentityWithIdentifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithIdentifier:containerConfig:platform:userIdentityCache:error:", v83, v53, 0, v54, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v76, "addObject:", v55);
      }
      else
      {
        container_log_handle_for_category();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v95 = v83;
          v96 = 2112;
          v97 = (uint64_t)v17;
          _os_log_error_impl(&dword_1CF807000, v57, OS_LOG_TYPE_ERROR, "Failed to create system container identity for %@: %@", buf, 0x16u);
        }

        v17 = 0;
      }

    }
    -[MCMEntitlements appGroupIdentifiers](v48, "appGroupIdentifiers");
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "appGroupIdentifiers");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27 | v29)
    {
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke;
      v89[3] = &unk_1E8CB55D8;
      v90 = v76;
      v91 = v75;
      -[MCMCodeSigningMapping _onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:](v77, "_onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:", v27, v29, 7, v89);

    }
    v58 = containermanager_copy_global_configuration();
    v59 = objc_msgSend(v58, "systemContainerMode") == 0;

    if (v59
      || (-[MCMEntitlements systemGroupIdentifiers](v48, "systemGroupIdentifiers"),
          v60 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v78, "systemGroupIdentifiers"),
          v61 = objc_claimAutoreleasedReturnValue(),
          !(v61 | v60)))
    {
      v26 = 0;
      v28 = 0;
    }
    else
    {
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2;
      v86[3] = &unk_1E8CB55D8;
      v87 = v76;
      v88 = v75;
      -[MCMCodeSigningMapping _onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:](v77, "_onQueue_handleChangeFromOldGroupContainerIds:toNewGroupContainerIds:containerClass:reconcileHandler:", v61, v60, 13, v86);

      v26 = (void *)v61;
      v28 = (void *)v60;
    }
    container_log_handle_for_category();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v95 = v83;
      v96 = 2112;
      v97 = v27;
      v98 = 2112;
      v99 = v29;
      v100 = 2112;
      v101 = v26;
      v102 = 2112;
      v103 = v28;
      _os_log_impl(&dword_1CF807000, v62, OS_LOG_TYPE_DEFAULT, "Reconciled [%@]; old app groups: %@, new app groups: %@, old system groups: %@, new system groups: %@",
        buf,
        0x34u);
    }

    if (v80)
    {
      v63 = v82;
    }
    else
    {
      v64 = objc_opt_new();

      v63 = (void *)v64;
    }
    v82 = v63;
    objc_msgSend(v79, "addObject:");
    objc_msgSend(v81, "addObject:", v83);

  }
  if (!objc_msgSend(v81, "count"))
  {
    v33 = 1;
    if (!v17)
      goto LABEL_73;
LABEL_67:
    v24 = v16;
    objc_msgSend(v17, "domain");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "isEqual:", CFSTR("MCMErrorDomain"));

    if (v67)
    {
      v68 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", objc_msgSend(v17, "code"));
    }
    else
    {
      objc_msgSend(v17, "domain");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "isEqual:", *MEMORY[0x1E0CB2FE0]);

      if (!v70)
      {
        v25 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 40);
LABEL_79:
        v33 = 0;
        if (v73 && v25)
        {
          v25 = objc_retainAutorelease(v25);
          v33 = 0;
          *v73 = v25;
        }
        v16 = v24;
        goto LABEL_83;
      }
      v68 = -[MCMError initWithErrorType:category:path:POSIXerrno:]([MCMError alloc], "initWithErrorType:category:path:POSIXerrno:", 40, 1, 0, objc_msgSend(v17, "code"));
    }
    v25 = v68;
    goto LABEL_79;
  }
  -[MCMCodeSigningMapping _onQueue_setCodeSigningDictionaryValues:forIdentifiers:](v77, "_onQueue_setCodeSigningDictionaryValues:forIdentifiers:", v79, v81);
  v65 = objc_claimAutoreleasedReturnValue();

  v33 = 1;
  v17 = (id)v65;
  if (v65)
    goto LABEL_67;
LABEL_73:
  v71 = !v33;
  if (!v74)
    v71 = 1;
  if ((v71 & 1) != 0)
  {
    v25 = 0;
    v17 = 0;
  }
  else
  {
    v74[2]();
    v25 = 0;
    v17 = 0;
    v33 = 1;
  }
LABEL_83:

  return v33;
}

- (id)_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0;
  objc_msgSend(v6, "invalidateCodeSigningForIdentifierAndAllChildren:error:", v4, v9);

  v7 = v9[0];
  return v7;
}

- (BOOL)_onQueue_invalidateCodeSigningInfoForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "invalidateCodeSigningWithIdentifier:error:", v6, a4);

  return (char)a4;
}

- (void)_onQueue_iterateGroupIdsWithKey:(id)a3 fallBackKey:(id)a4 noReferenceKey:(id)a5 forAllIdentifiersUsingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MCMCodeSigningMapping queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke;
  v22[3] = &unk_1E8CB5600;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v15, "enumerateIdentifiersAndCodeSigningInfoUsingBlock:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Failed to enumerate code signing info: %@", buf, 0xCu);
    }

  }
}

- (id)groupContainerIdentifiersAssociatedWithIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;

  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 != 13)
  {
    if (a4 == 7)
    {
      objc_msgSend(v5, "appGroupIdentifiers");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v10 = (void *)objc_opt_new();
    goto LABEL_8;
  }
  v8 = containermanager_copy_global_configuration();
  v9 = objc_msgSend(v8, "systemContainerMode");

  if (!v9)
    goto LABEL_7;
  objc_msgSend(v6, "systemGroupIdentifiers");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v7;
  if (!v7)
    goto LABEL_7;
LABEL_8:

  return v10;
}

- (id)removeCodeSigningDictionaryForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v27;
    *(_QWORD *)&v8 = 138412546;
    v19 = v8;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
        v20 = v13;
        -[MCMCodeSigningMapping processCodeSigningInfo:identifier:options:error:](self, "processCodeSigningInfo:identifier:options:error:", 0, v14, 0, &v20, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v20;

        if (v15)
        {
          objc_msgSend(v5, "unionSet:", v15);
        }
        else
        {
          container_log_handle_for_category();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v22 = v14;
            v23 = 2112;
            v24 = v10;
            _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to clear entitlements for %@ : %@", buf, 0x16u);
          }

        }
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v9);

  }
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)codeSigningEntryForIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3876;
  v19 = __Block_byref_object_dispose__3877;
  v20 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke;
  block[3] = &unk_1E8CB5470;
  block[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (BOOL)identifierHasCallerRegisteredEntitlements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke;
  v8[3] = &unk_1E8CB6408;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(self) = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)identifierHasSystemContainer:(id)a3
{
  void *v3;
  char v4;

  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSystemContainer");

  return v4;
}

- (id)systemGroupIdentifiersForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemGroupIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)processCallerRegisteredEntitlements:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  MCMError *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  MCMError *v24;
  uint64_t v25;
  MCMError *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v34;
  id v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v19 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 18);
    v10 = 0;
    v18 = 0;
    v12 = 0;
    if (!a5)
      goto LABEL_28;
    goto LABEL_26;
  }
  v35 = 0;
  -[MCMCodeSigningMapping codeSigningEntryForIdentifier:withError:](self, "codeSigningEntryForIdentifier:withError:", v9, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v12 = v11;
  if (!v10)
  {
    objc_msgSend(v11, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("MCMErrorDomain")) & 1) != 0)
    {
      v21 = objc_msgSend(v12, "code");

      if (v21 == 67)
        goto LABEL_3;
      if (v12)
        goto LABEL_12;
    }
    else
    {

      if (v12)
      {
LABEL_12:
        objc_msgSend(v12, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", CFSTR("MCMErrorDomain"));

        if (v23)
        {
          v24 = [MCMError alloc];
          v25 = objc_msgSend(v12, "code");
          v26 = v24;
LABEL_24:
          v32 = -[MCMError initWithErrorType:](v26, "initWithErrorType:", v25);
LABEL_25:
          v19 = (MCMError *)v32;
          v10 = 0;
          v18 = 0;
          if (!a5)
            goto LABEL_28;
          goto LABEL_26;
        }
        objc_msgSend(v12, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqual:", CFSTR("MCMErrorDomain"));

        v26 = [MCMError alloc];
        if (v31)
        {
          v32 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v26, "initWithErrorType:category:path:POSIXerrno:", 40, 1, 0, objc_msgSend(v12, "code"));
          goto LABEL_25;
        }
LABEL_23:
        v25 = 40;
        goto LABEL_24;
      }
    }
    v26 = [MCMError alloc];
    goto LABEL_23;
  }
LABEL_3:
  objc_msgSend(v10, "codeSigningInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (!objc_msgSend(v10, "isRegisteredByCaller"))
      goto LABEL_6;
    objc_msgSend(v10, "codeSigningInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rawEntitlements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToDictionary:", v16);

    if (v17)
    {
LABEL_6:
      v18 = (void *)objc_opt_new();
      v19 = 0;
      goto LABEL_28;
    }
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "%@ has changed entitlements. Re-registering.", buf, 0xCu);
    }

  }
  v36 = CFSTR("com.apple.MobileContainerManager.Entitlements");
  objc_msgSend(v8, "rawEntitlements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  -[MCMCodeSigningMapping processCodeSigningInfo:identifier:options:error:](self, "processCodeSigningInfo:identifier:options:error:", v29, v9, &unk_1E8CD5588, &v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (MCMError *)v34;

  if (!a5)
    goto LABEL_28;
LABEL_26:
  if (v19)
  {
    v19 = objc_retainAutorelease(v19);
    *a5 = v19;
  }
LABEL_28:

  return v18;
}

- (id)processCodeSigningInfo:(id)a3 identifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3876;
  v39 = __Block_byref_object_dispose__3877;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3876;
  v33 = __Block_byref_object_dispose__3877;
  v34 = 0;
  -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCodeSigningMapping queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke;
  v22[3] = &unk_1E8CB5650;
  v22[4] = self;
  v15 = v10;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v27 = &v35;
  v28 = &v29;
  dispatch_sync(v14, v22);

  v19 = v30;
  if (a6 && !v30[5])
  {
    *a6 = objc_retainAutorelease((id)v36[5]);
    v19 = v30;
  }
  v20 = (id)v19[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

- (id)getCodeSigningInfoForIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3876;
  v17 = __Block_byref_object_dispose__3877;
  v18 = 0;
  v5 = -[MCMCodeSigningMapping entitlementsForIdentifier:](self, "entitlementsForIdentifier:", v4);
  -[MCMCodeSigningMapping queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke;
  v10[3] = &unk_1E8CB6408;
  v11 = v4;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  dispatch_sync(v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (unint64_t)invalidateCodeSigningInfoForAppsWithoutDataContainer
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  char v26;
  NSObject *v27;
  id *v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  id v35;
  id obj;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD v40[6];
  id v41;
  _QWORD v42[5];
  id v43;
  MCMCodeSigningMapping *v44;
  _BYTE *v45;
  _QWORD block[8];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  id v53;
  uint8_t v54[4];
  uint64_t v55;
  __int16 v56;
  _BOOL4 v57;
  _BYTE buf[24];
  int v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  _BOOL4 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  -[MCMCodeSigningMapping identifiersWithError:](self, "identifiersWithError:", &v53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v53;
  if (!v3)
  {
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v64) = 138412290;
      *(_QWORD *)((char *)&v64 + 4) = v35;
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "Failed to enumerate containers when invalidating code signing info: %@", (uint8_t *)&v64, 0xCu);
    }

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v3;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v71;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v71 != v37)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D17D7010]();
        *(_QWORD *)&v64 = 0;
        *((_QWORD *)&v64 + 1) = &v64;
        v65 = 0x3032000000;
        v66 = __Block_byref_object_copy__3876;
        v67 = __Block_byref_object_dispose__3877;
        v68 = 0;
        v47 = 0;
        v48 = &v47;
        v49 = 0x3032000000;
        v50 = __Block_byref_object_copy__3876;
        v51 = __Block_byref_object_dispose__3877;
        v52 = 0;
        -[MCMCodeSigningMapping queue](self, "queue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke;
        block[3] = &unk_1E8CB5E48;
        block[4] = self;
        block[5] = v7;
        block[6] = &v64;
        block[7] = &v47;
        dispatch_sync(v9, block);

        if (v48[5])
        {
          container_log_handle_for_category();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v32 = v48[5];
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Error fetching code sign info for %@ to check for invalidation: %@", buf, 0x16u);
          }

        }
        else
        {
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 40), "isRegisteredByCaller");
          v12 = 0;
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 40), "dataContainerClass") - 3;
          v38 = v13;
          if (*(_QWORD *)(*((_QWORD *)&v64 + 1) + 40) && v13 <= 3)
          {
            -[MCMCodeSigningMapping childParentMapCache](self, "childParentMapCache");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "parentIdentifierForChildIdentifier:", v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = v15 != 0;
          }
          container_log_handle_for_category();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40);
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 1024;
            v59 = v11;
            v60 = 1024;
            v61 = v38 < 4;
            v62 = 1024;
            v63 = v12;
            _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_INFO, "Checking for invalidation: identifier = %@, codeSigningEntry = <%p>, isRegisteredByCaller = %d, isPlugIn = %d, hasParent = %d", buf, 0x28u);
          }

          if (!(v11 & 1 | (v38 < 4 && v12)))
          {
            v18 = 0;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v19 = 1;
            LOBYTE(v59) = 0;
            do
            {
              v20 = qword_1CF8D9CE0[v18];
              v21 = containermanager_copy_global_configuration();
              objc_msgSend(v21, "staticConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "configForContainerClass:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
              v24 = objc_claimAutoreleasedReturnValue();
              v42[0] = v5;
              v42[1] = 3221225472;
              v42[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_80;
              v42[3] = &unk_1E8CB5678;
              v45 = buf;
              v42[4] = v7;
              v25 = v23;
              v43 = v25;
              v44 = self;
              objc_msgSend((id)v24, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v42);

              LOBYTE(v24) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;
              v26 = v24 & v19;
              v18 = 1;
              v19 = 0;
            }
            while ((v26 & 1) != 0);
            if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            {
              container_log_handle_for_category();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v54 = 138412546;
                v55 = v7;
                v56 = 1024;
                v57 = v38 < 4;
                _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "Invalidating: identifier = %@, isPlugin = %d", v54, 0x12u);
              }

              v28 = (id *)(v48 + 5);
              v41 = (id)v48[5];
              v29 = -[MCMCodeSigningMapping invalidateCodeSigningInfoForIdentifierAndItsChildren:withError:](self, "invalidateCodeSigningInfoForIdentifierAndItsChildren:withError:", v7, &v41);
              objc_storeStrong(v28, v41);
              if (!v29)
              {
                v40[0] = v5;
                v40[1] = 3221225472;
                v40[2] = __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82;
                v40[3] = &unk_1E8CB56A0;
                v40[4] = v7;
                v40[5] = &v47;
                __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82((uint64_t)v40);
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = (void *)v48[5];
                v48[5] = v30;

              }
            }
            _Block_object_dispose(buf, 8);
          }
        }
        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(&v64, 8);
        objc_autoreleasePoolPop(v8);
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
    }
    while (v39);
  }

  if (v35)
    v33 = objc_msgSend(v35, "code");
  else
    v33 = 1;

  return v33;
}

- (id)identifiersWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3876;
  v20 = __Block_byref_object_dispose__3877;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3876;
  v14 = __Block_byref_object_dispose__3877;
  v15 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__MCMCodeSigningMapping_identifiersWithError___block_invoke;
  v9[3] = &unk_1E8CB5C90;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &v16;
  dispatch_sync(v5, v9);

  v6 = (void *)v11[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v6 = (void *)v11[5];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_onQueue_identifiersWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiersWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)invalidateCodeSigningInfoForIdentifierAndItsChildren:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3876;
  v19 = __Block_byref_object_dispose__3877;
  v20 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke;
  v12[3] = &unk_1E8CB6408;
  v14 = &v15;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  dispatch_sync(v7, v12);

  v9 = (void *)v16[5];
  if (a4 && v9)
  {
    *a4 = objc_retainAutorelease(v9);
    v9 = (void *)v16[5];
  }
  v10 = v9 == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)invalidateCodeSigningInfoForIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke;
  block[3] = &unk_1E8CB5470;
  block[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return (char)a4;
}

- (id)copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3876;
  v13 = __Block_byref_object_dispose__3877;
  v14 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke;
  v8[3] = &unk_1E8CB5C68;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  dispatch_sync(v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_onQueue_copyReferenceCountSetForContainerClass:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3876;
  v16 = __Block_byref_object_dispose__3877;
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8CD6A50);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v7 = CFSTR("com.apple.private.MobileContainerManager.appGroup.noReference");
  }
  else
  {
    if (a3 != 13)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.security.system-groups"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = CFSTR("com.apple.security.system-group-containers");
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke;
  v11[3] = &unk_1E8CB56C8;
  v11[4] = &v12;
  -[MCMCodeSigningMapping _onQueue_iterateGroupIdsWithKey:fallBackKey:noReferenceKey:forAllIdentifiersUsingBlock:](self, "_onQueue_iterateGroupIdsWithKey:fallBackKey:noReferenceKey:forAllIdentifiersUsingBlock:", v6, v8, v7, v11);
LABEL_7:
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)_onQueue_handleChangeFromOldGroupContainerIds:(id)a3 toNewGroupContainerIds:(id)a4 containerClass:(unint64_t)a5 reconcileHandler:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  void (**v12)(id, void *, void *);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[4];
  id v31;
  MCMCodeSigningMapping *v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = (void (**)(id, void *, void *))a6;
  -[MCMCodeSigningMapping queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  if (!(v10 | v11))
  {
    v11 = 0;
    v10 = 0;
LABEL_6:
    if (!v12)
      goto LABEL_8;
LABEL_7:
    v12[2](v12, v14, v15);
    goto LABEL_8;
  }
  if ((objc_msgSend((id)v10, "isEqualToSet:", v11) & 1) != 0)
    goto LABEL_6;
  if (v11)
  {
    v16 = (void *)objc_msgSend((id)v10, "mutableCopy");
    v17 = (void *)objc_msgSend((id)v11, "mutableCopy");
    objc_msgSend(v16, "minusSet:", v11);
    v18 = objc_msgSend(v16, "copy");

    objc_msgSend(v17, "minusSet:", v18);
    v19 = objc_msgSend(v17, "copy");

    v20 = (void *)v19;
    v10 = v18;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend((id)v10, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCodeSigningMapping _onQueue_removeReferenceForGroupIdentifiers:containerClass:](self, "_onQueue_removeReferenceForGroupIdentifiers:containerClass:", v21, a5);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke;
  v30[3] = &unk_1E8CB5D30;
  v11 = v20;
  v34 = a5;
  v31 = (id)v11;
  v32 = self;
  v33 = v15;
  v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17D71B4](v30);
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", a5))
  {
    -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    v28[1] = 3221225472;
    v28[2] = __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_98;
    v28[3] = &unk_1E8CB56F0;
    v29 = v24;
    objc_msgSend(v25, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v28);

    v26 = v29;
  }
  else
  {
    -[MCMCodeSigningMapping userIdentityCache](self, "userIdentityCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "globalSystemUserIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v24)[2](v24, v27);

  }
  v14 = (void *)v22;
  if (v12)
    goto LABEL_7;
LABEL_8:

}

- (id)_onQueue_removeReferenceForGroupIdentifiers:(id)a3 containerClass:(unint64_t)a4
{
  NSObject *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t (**v18)(_QWORD, _QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v25;
  id v26;
  MCMCodeSigningMapping *v27;
  _QWORD v29[5];
  id v30;
  _BYTE *v31;
  _QWORD v32[5];
  id v33;
  unint64_t v34;
  uint8_t v35[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE buf[24];
  char v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v27 = self;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_opt_new();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke;
  v32[3] = &unk_1E8CB5718;
  v34 = a4;
  v32[4] = v27;
  v25 = v6;
  v33 = v25;
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17D71B4](v32);
  if (v26 && objc_msgSend(v26, "count"))
  {
    -[MCMCodeSigningMapping _onQueue_copyReferenceCountSetForContainerClass:](v27, "_onQueue_copyReferenceCountSetForContainerClass:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a4 == 13)
      {
        container_log_handle_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v26;
          _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Would have removed system group container references for %@", buf, 0xCu);
        }

      }
      else
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v10 = v26;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(v10);
              v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              v15 = -[NSObject countForObject:](v8, "countForObject:", v14);
              if (v15 == 1)
              {
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x2020000000;
                v40 = 1;
                container_log_handle_for_category();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v35 = 138543618;
                  v36 = v14;
                  v37 = 2048;
                  v38 = 1;
                  _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %ld, including for delete", v35, 0x16u);
                }

                if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", a4))
                {
                  -[MCMCodeSigningMapping userIdentityCache](v27, "userIdentityCache");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v29[0] = MEMORY[0x1E0C809B0];
                  v29[1] = 3221225472;
                  v29[2] = __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_100;
                  v29[3] = &unk_1E8CB5740;
                  v31 = buf;
                  v18 = v7;
                  v29[4] = v14;
                  v30 = v18;
                  objc_msgSend(v17, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v29);

                }
                else if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                {
                  -[MCMCodeSigningMapping userIdentityCache](v27, "userIdentityCache");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "globalSystemUserIdentity");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = ((uint64_t (**)(_QWORD, uint64_t, void *))v7)[2](v7, v14, v21);
                  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v22;

                }
                else
                {
                  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
                }
                if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                  -[NSObject removeObject:](v8, "removeObject:", v14);
                _Block_object_dispose(buf, 8);
              }
              else
              {
                container_log_handle_for_category();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v14;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v15;
                  _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "Reference count for [%{public}@] is %ld", buf, 0x16u);
                }

              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
          }
          while (v11);
        }

      }
    }
    else
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a4;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to get reference count information for class: %llu", buf, 0xCu);
      }
    }

  }
  v23 = (void *)objc_msgSend(v25, "copy");

  return v23;
}

- (BOOL)removeAllAdvanceCopiesWithError:(id *)a3
{
  NSObject *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke;
  v7[3] = &unk_1E8CB5C68;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_onQueue_removeAllAdvanceCopiesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;

  -[MCMCodeSigningMapping queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:", a3);

  return (char)a3;
}

- (BOOL)removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  NSObject *v7;
  _QWORD block[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke;
  block[3] = &unk_1E8CB5768;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  block[7] = a4;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

- (BOOL)_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:(int *)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;

  -[MCMCodeSigningMapping queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:", a3, a4);

  return (char)a4;
}

- (BOOL)enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3876;
  v27 = __Block_byref_object_dispose__3877;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v14[3] = &unk_1E8CB5790;
  v16 = &v19;
  v17 = &v23;
  v14[4] = self;
  v18 = a3;
  v10 = v8;
  v15 = v10;
  dispatch_sync(v9, v14);

  v11 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = objc_retainAutorelease((id)v24[5]);
    v11 = *((unsigned __int8 *)v20 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (BOOL)_onqueue_enumerateOwnersAndGroupsWithGroupClass:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[MCMCodeSigningMapping queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x1D17D7010]();
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke;
  v15[3] = &unk_1E8CB57B8;
  v17 = a3;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "enumerateIdentifiersAndCodeSigningInfoUsingBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  if (a4 && v13)
    *a4 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v13, 0, 66);

  return v13 == 0;
}

- (BOOL)addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_1E8CB57E0;
  v20[4] = self;
  v21 = v12;
  v24 = &v27;
  v25 = a5;
  v26 = a6;
  v22 = v13;
  v23 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

- (BOOL)removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[MCMCodeSigningMapping queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke;
  v20[3] = &unk_1E8CB57E0;
  v20[4] = self;
  v21 = v12;
  v24 = &v27;
  v25 = a5;
  v26 = a6;
  v22 = v13;
  v23 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_sync(v15, v20);

  LOBYTE(v12) = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return (char)v12;
}

- (BOOL)_onQueue_addGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  MCMEntitlements *v19;
  id v20;
  void *v21;
  MCMEntitlements *v22;
  id v23;
  MCMError *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  -[MCMCodeSigningMapping queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    v24 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 20, 4);
LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v15, "codeSigningEntryWithIdentifier:error:", v12, &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v32;

  v17 = 0x1E0C99000uLL;
  if (!v16)
  {
    +[MCMEntitlements publicEntitlementForGroupContainerClass:](MCMEntitlements, "publicEntitlementForGroupContainerClass:", a5, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v25;
    v36[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v22 = 0;
    goto LABEL_8;
  }
  -[MCMCodeSigningMapping _entitlementsFromCodeSigningEntry:](self, "_entitlementsFromCodeSigningEntry:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [MCMEntitlements alloc];
  v20 = containermanager_copy_global_configuration();
  objc_msgSend(v20, "classIterator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v19, "initWithEntitlements:clientIdentifier:classIterator:", v18, v12, v21);

  if (!v22)
  {
    v24 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 60, 3);

    goto LABEL_10;
  }
  v23 = -[MCMEntitlements copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:](v22, "copyEntitlementsDictionaryByAddingGroupContainerOfClass:groupIdentifier:", a5, v11, v29);
  v17 = 0x1E0C99000;
LABEL_8:
  v33 = CFSTR("com.apple.MobileContainerManager.Entitlements");
  v34 = v23;
  objc_msgSend(*(id *)(v17 + 3456), "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v27 = -[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:](self, "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:", v26, v12, 0, v22, &v31, v13);
  v24 = (MCMError *)v31;

LABEL_11:
  return v27;
}

- (BOOL)_onQueue_removeGroupIdentifier:(id)a3 forIdentifier:(id)a4 containerClass:(unint64_t)a5 error:(id *)a6 reconcileHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  MCMEntitlements *v19;
  id v20;
  void *v21;
  MCMEntitlements *v22;
  id v23;
  void *v24;
  BOOL v25;
  MCMError *v26;
  void *v28;
  id v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  -[MCMCodeSigningMapping queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (a5 != 7 && a5 != 13)
  {
    v26 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 20, 4);
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  -[MCMCodeSigningMapping codeSigningMappingDB](self, "codeSigningMappingDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v15, "codeSigningEntryWithIdentifier:error:", v12, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;

  if (!v16)
  {
    v26 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 67, 3);

    goto LABEL_9;
  }
  v28 = v17;
  -[MCMCodeSigningMapping _entitlementsFromCodeSigningEntry:](self, "_entitlementsFromCodeSigningEntry:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [MCMEntitlements alloc];
  v20 = containermanager_copy_global_configuration();
  objc_msgSend(v20, "classIterator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v19, "initWithEntitlements:clientIdentifier:classIterator:", v18, v12, v21);

  if (!v22)
  {
    v26 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 60, 3);

    goto LABEL_9;
  }
  v23 = -[MCMEntitlements copyEntitlementsDictionaryByRemovingGroupContainerOfClass:groupIdentifier:](v22, "copyEntitlementsDictionaryByRemovingGroupContainerOfClass:groupIdentifier:", a5, v11);
  v31 = CFSTR("com.apple.MobileContainerManager.Entitlements");
  v32[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v25 = -[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:](self, "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:", v24, v12, 0, v22, &v29, v13);
  v26 = (MCMError *)v29;

LABEL_10:
  return v25;
}

- (MCMChildParentMapCache)childParentMapCache
{
  return self->_childParentMapCache;
}

- (void)setCodeSigningMappingDB:(id)a3
{
  objc_storeStrong((id *)&self->_codeSigningMappingDB, a3);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_codeSigningMappingDB, 0);
  objc_storeStrong((id *)&self->_childParentMapCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __99__MCMCodeSigningMapping_removeGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __96__MCMCodeSigningMapping_addGroupIdentifier_forIdentifier_containerClass_error_reconcileHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_addGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __85__MCMCodeSigningMapping__onqueue_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MCMEntitlements *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  MCMEntitlements *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [MCMEntitlements alloc];
  objc_msgSend(v6, "codeSigningInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "classIterator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v7, "initWithEntitlements:clientIdentifier:classIterator:", v9, v5, v11);

  v13 = *(_QWORD *)(a1 + 40);
  if (v13 == 13)
  {
    -[MCMEntitlements systemGroupIdentifiers](v12, "systemGroupIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v13 == 7)
  {
    -[MCMEntitlements appGroupIdentifiers](v12, "appGroupIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v17);
  }

}

void __76__MCMCodeSigningMapping_enumerateOwnersAndGroupsWithGroupClass_error_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj[0] = *(id *)(v3 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_enumerateOwnersAndGroupsWithGroupClass:error:block:", v2, obj, *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
}

uint64_t __86__MCMCodeSigningMapping_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__MCMCodeSigningMapping_removeAllAdvanceCopiesWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeAllAdvanceCopiesWithError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t error_description;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "homeDirectoryExists"))
  {
    v7 = containermanager_copy_global_configuration();
    objc_msgSend(v7, "staticConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configForContainerClass:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 1;
    objc_msgSend(*(id *)(a1 + 32), "userIdentityCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v6, v5, v9, 0, v10, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11 != 0;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    }
    else
    {
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = v18;
        error_description = container_get_error_description();
        v17 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v20 = v15;
        v21 = 2080;
        v22 = error_description;
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v5;
        v27 = 2048;
        v28 = v17;
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Could not generate identity for ref cnt delete of container; error = (%llu) %s, userIdentity = %@, identifier "
          "= %@, class = %llu",
          buf,
          0x34u);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __84__MCMCodeSigningMapping__onQueue_removeReferenceForGroupIdentifiers_containerClass___block_invoke_100(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v1 + 24) = result;
  return result;
}

void __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t error_description;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v9 = containermanager_copy_global_configuration();
        objc_msgSend(v9, "staticConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configForContainerClass:", *(_QWORD *)(a1 + 56));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 1;
        objc_msgSend(*(id *)(a1 + 40), "userIdentityCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v3, v8, v11, 0, v12, &v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
        }
        else
        {
          container_log_handle_for_category();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v17 = v19;
            error_description = container_get_error_description();
            v16 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 134219010;
            v21 = v17;
            v22 = 2080;
            v23 = error_description;
            v24 = 2112;
            v25 = v3;
            v26 = 2112;
            v27 = v8;
            v28 = 2048;
            v29 = v16;
            _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Could not generate identity for ref cnt add of container; error = (%llu) %s, userIdentity = %@, identifier"
              " = %@, class = %llu",
              buf,
              0x34u);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v5);
  }

}

uint64_t __126__MCMCodeSigningMapping__onQueue_handleChangeFromOldGroupContainerIds_toNewGroupContainerIds_containerClass_reconcileHandler___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__MCMCodeSigningMapping__onQueue_copyReferenceCountSetForContainerClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v7;
        _os_log_debug_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEBUG, "Entitlements for identifier %@ references container IDs: %@", (uint8_t *)&v12, 0x16u);
      }

      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "allObjects");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);
    }
    else
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v7;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "identifier: %@ has non-array type of group container IDs: %@", (uint8_t *)&v12, 0x16u);
      }
    }

  }
}

void __64__MCMCodeSigningMapping_copyReferenceCountSetForContainerClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_copyReferenceCountSetForContainerClass:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __74__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifier_withError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_invalidateCodeSigningInfoForIdentifier:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __88__MCMCodeSigningMapping_invalidateCodeSigningInfoForIdentifierAndItsChildren_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_invalidateCodeSigningInfoForIdentifierAndItsChildren:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__MCMCodeSigningMapping_identifiersWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v3 + 40);
  objc_msgSend(v2, "_onQueue_identifiersWithError:", obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj[0]);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj[0] = *(id *)(v4 + 40);
  objc_msgSend(v2, "codeSigningEntryWithIdentifier:error:", v3, obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_80(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = (void *)a1[6];
    v6 = a2;
    objc_msgSend(v5, "userIdentityCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v6, v3, v4, 0, 0, v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend((id)gContainerCache, "entryForContainerIdentity:error:", v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;

      }
    }

  }
}

id __77__MCMCodeSigningMapping_invalidateCodeSigningInfoForAppsWithoutDataContainer__block_invoke_82(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to invalidate code signing info for %@ : %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMCodeSigningMapping invalidateCodeSigningInfoForAppsWithoutDataContainer]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6060;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __51__MCMCodeSigningMapping_entitlementsForIdentifier___block_invoke_79(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v2, "addCodeSigningEntry:withIdentifier:error:", v3, v4, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to write code signing info to DB for %@ : %@", buf, 0x16u);

    }
  }

}

void __57__MCMCodeSigningMapping_getCodeSigningInfoForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_codeSigningInfoForIdentifier:externalRequest:", *(_QWORD *)(a1 + 40), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[8];
  v6 = *(_QWORD *)(a1[9] + 8);
  v8[0] = *(id *)(v6 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2;
  v7[3] = &unk_1E8CB5628;
  v7[4] = a1[10];
  objc_msgSend(v2, "_onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:", v1, v3, v4, v5, v8, v7);
  objc_storeStrong((id *)(v6 + 40), v8[0]);
}

void __73__MCMCodeSigningMapping_processCodeSigningInfo_identifier_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __67__MCMCodeSigningMapping_identifierHasCallerRegisteredEntitlements___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_identifierHasCallerRegisteredEntitlements:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __65__MCMCodeSigningMapping_codeSigningEntryForIdentifier_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_codeSigningEntryForIdentifier:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __112__MCMCodeSigningMapping__onQueue_iterateGroupIdsWithKey_fallBackKey_noReferenceKey_forAllIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_entitlementsFromCodeSigningEntry:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = (_QWORD *)a1;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v11 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:](MCMEntitlements, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", v5, v6, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13));

        objc_msgSend(v7, "unionSet:", v11);
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (v20[6] && !objc_msgSend(v7, "count"))
  {
    v15 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:](MCMEntitlements, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", v5, v6, v20[6]);

    v16 = objc_msgSend(v15, "mutableCopy");
    v11 = v15;
    v7 = (void *)v16;
  }
  if (v20[7] && objc_msgSend(v7, "count"))
  {
    v17 = +[MCMEntitlements copyGroupEntitlementForIdentifier:entitlements:groupKey:](MCMEntitlements, "copyGroupEntitlementForIdentifier:entitlements:groupKey:", v5, v6, v20[7]);

    objc_msgSend(v7, "minusSet:", v17);
    v11 = v17;
  }
  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  v18 = v20[8];
  v19 = (void *)objc_msgSend(v7, "copy");
  (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v5, v19);

}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v6);

}

void __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v6);

}

id __115__MCMCodeSigningMapping__onQueue_processCodeSigningInfo_identifier_options_oldEntitlements_error_reconcileHandler___block_invoke_73(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Got exception: %@ : %@"), v3, v4);

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMCodeSigningMapping _onQueue_processCodeSigningInfo:identifier:options:oldEntitlements:error:reconcileHandler:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6048;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 40, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __80__MCMCodeSigningMapping__onQueue_setCodeSigningDictionaryValues_forIdentifiers___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't act on an invalid input: values count: %ld, IDs count: %ld"), objc_msgSend(*(id *)(a1 + 32), "count"), objc_msgSend(*(id *)(a1 + 40), "count"));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMCodeSigningMapping _onQueue_setCodeSigningDictionaryValues:forIdentifiers:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6030;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 60, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __84__MCMCodeSigningMapping_performAllCodeSigningMigrationAndReconciliationWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile");
}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2;
  v7[3] = &unk_1E8CB55B0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v2, "enumerateIdentifiersAndCodeSigningInfoUsingBlock:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __71__MCMCodeSigningMapping__onQueue_reconcileSystemContainersWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  MCMEntitlements *v7;
  id v8;
  void *v9;
  MCMEntitlements *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_entitlementsFromCodeSigningEntry:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MCMEntitlements alloc];
  v8 = containermanager_copy_global_configuration();
  objc_msgSend(v8, "classIterator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v7, "initWithEntitlements:clientIdentifier:classIterator:", v6, v5, v9);

  if (-[MCMEntitlements hasSystemContainer](v10, "hasSystemContainer"))
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "System container exists for identifier %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  MCMResultPromise *v23;
  MCMCommandSetInfoValue *v24;
  void *v25;
  void *v26;
  MCMCommandSetInfoValue *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46[6];
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "handledByProxy"))
  {
    container_query_create();
    objc_msgSend(v3, "containerClass");
    container_query_set_class();
    container_query_set_include_other_owners();
    container_query_operation_set_flags();
    v46[1] = (id)MEMORY[0x1E0C809B0];
    v46[2] = (id)3221225472;
    v46[3] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2;
    v46[4] = &unk_1E8CB5560;
    v46[5] = *(id *)(a1 + 32);
    v47 = v3;
    container_query_iterate_results_sync();
    container_query_free();

    goto LABEL_29;
  }
  objc_msgSend(*(id *)(a1 + 32), "userIdentityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUserIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMClientConnection privilegedClientConnectionWithUserIdentity:](MCMClientConnection, "privilegedClientConnectionWithUserIdentity:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)gContainerCache;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = 0;
  objc_msgSend(v6, "entriesForUserIdentities:contentClass:transient:error:", v7, objc_msgSend(v3, "containerClass"), 0, v46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v46[0];

  if (v8)
  {
    v35 = v9;
    v37 = v5;
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_46;
    block[3] = &unk_1E8CB5E98;
    block[4] = *(_QWORD *)(a1 + 32);
    v36 = v8;
    v11 = v8;
    v44 = v11;
    v38 = v3;
    v45 = v3;
    dispatch_sync(v10, block);

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
    if (!v12)
      goto LABEL_24;
    v13 = v12;
    v14 = *(_QWORD *)v56;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v15);
        v42 = 0;
        objc_msgSend(v16, "metadataWithError:", &v42);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v42;
        if (!v17)
        {
          container_log_handle_for_category();
          v23 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v49 = "-[MCMCodeSigningMapping migrateCachedCodeSigningInfoFromBundleContainersToMapping]_block_invoke_2";
            v50 = 2112;
            v51 = v16;
            v52 = 2112;
            v53 = v18;
            _os_log_error_impl(&dword_1CF807000, &v23->super, OS_LOG_TYPE_ERROR, "%s: Could not fetch metadata for %@; error = %@",
              buf,
              0x20u);
          }
          goto LABEL_21;
        }
        objc_msgSend(v17, "info");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.CachedCodeSigningInfo"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = v20;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;

        if (v22)
        {
          v23 = objc_alloc_init(MCMResultPromise);
          v24 = [MCMCommandSetInfoValue alloc];
          objc_msgSend(v17, "containerIdentity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "context");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:](v24, "initWithKey:value:containerIdentity:context:resultPromise:", CFSTR("com.apple.MobileInstallation.CachedCodeSigningInfo"), 0, v25, v26, v23);

          -[MCMCommandSetInfoValue execute](v27, "execute");
          -[MCMResultPromise result](v23, "result");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "error");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            container_log_handle_for_category();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "containerIdentity");
              v31 = (char *)objc_claimAutoreleasedReturnValue();
              -[MCMResultPromise result](v23, "result");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "error");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v49 = v31;
              v50 = 2112;
              v51 = v32;
              _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Error setting info value for identity %@ : %@", buf, 0x16u);

            }
          }

LABEL_21:
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
      if (!v13)
      {
LABEL_24:

        v5 = v37;
        v3 = v38;
        v9 = v35;
        v8 = v36;
        goto LABEL_28;
      }
    }
  }
  container_log_handle_for_category();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = objc_msgSend(v3, "containerClass");
    *(_DWORD *)buf = 134218242;
    v49 = (const char *)v34;
    v50 = 2112;
    v51 = v9;
    _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for class %llu : %@", buf, 0x16u);
  }

LABEL_28:
LABEL_29:

}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  container_object_get_info();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_get_value(v2, "com.apple.MobileInstallation.CachedCodeSigningInfo");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", container_get_identifier());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3;
      v15[3] = &unk_1E8CB5538;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v7;
      v9 = v6;
      v17 = v9;
      v18 = *(id *)(a1 + 40);
      v10 = v7;
      dispatch_sync(v8, v15);

      v11 = container_set_info_value();
      if (v11 != 1)
      {
        v12 = v11;
        container_log_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          v21 = 2048;
          v22 = v12;
          _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Error setting info value for identity %@ : %llu", buf, 0x16u);
        }

      }
    }
  }

  return 1;
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateCachedCodeSigningInfoFromBundleContainersToMappingWithContainersLegacy:containerClass:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "containerClass"));
}

uint64_t __82__MCMCodeSigningMapping_migrateCachedCodeSigningInfoFromBundleContainersToMapping__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateCachedCodeSigningInfoFromBundleContainerToMappingWithInfo:identifier:containerClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "containerClass"));
}

void __88__MCMCodeSigningMapping__onQueue_migrateDataFromLegacyEntitlementsFileToCodeSigningFile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  MCMCodeSigningEntry *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id obj;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = v5;
  v10 = v6;
  objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v12 + 40);
  objc_msgSend(v11, "codeSigningEntryWithIdentifier:error:", v9, &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v12 + 40), obj);

  if (v13 && (objc_msgSend(v13, "isInvalid") & 1) == 0)
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "Already have code signing info for %@.  No need to migrate legacy entitlements.", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("MCMErrorDomain"))
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "code") == 67)
    {

LABEL_7:
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Migrating legacy entitlements for %@", buf, 0xCu);
      }

      v17 = [MCMCodeSigningEntry alloc];
      v37 = CFSTR("com.apple.MobileContainerManager.Entitlements");
      v38[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](v17, "initWithCodeSigningInfo:andDataContainerClass:", v18, 0);

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setChildBundleIdentifiers:](v19, "setChildBundleIdentifiers:", v21);

      }
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        -[NSObject setPlaceholder:](v19, "setPlaceholder:", 1);
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (v24)
        -[NSObject setRegisteredByCaller:](v19, "setRegisteredByCaller:", 1);
      else
        -[NSObject setInvalid:](v19, "setInvalid:", 1);
      objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v31 = *(id *)(v27 + 40);
      v28 = objc_msgSend(v26, "addCodeSigningEntry:withIdentifier:error:", v19, v9, &v31);
      objc_storeStrong((id *)(v27 + 40), v31);

      if ((v28 & 1) == 0)
      {
        container_log_handle_for_category();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          v34 = v9;
          v35 = 2112;
          v36 = v30;
          _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Failed to write migrated legacy info to DB for %@ : %@", buf, 0x16u);
        }

      }
      goto LABEL_24;
    }
    v15 = objc_msgSend(v13, "isInvalid");

    if ((v15 & 1) != 0)
      goto LABEL_7;
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v34 = v9;
      v35 = 2112;
      v36 = v25;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Error retrieving entry from DB with identifier %@ : %@", buf, 0x16u);
    }
  }
LABEL_24:

}

uint64_t __67__MCMCodeSigningMapping_migrateAppGroupIdsFromDataContainersToFile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateAppGroupIdsFromDataContainersToFileUsingContainers:", *(_QWORD *)(a1 + 40));
}

void __71__MCMCodeSigningMapping__onQueue_migrateFromMappingFileToDBIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17D7010]();
  v8 = v5;
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 32), "codeSigningMappingDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v10, "addCodeSigningEntry:withIdentifier:error:", v9, v8, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

  if ((v12 & 1) != 0)
  {
    v13 = a1 + 56;
  }
  else
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v17;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate code signing entry for %@ : %@", buf, 0x16u);
    }

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

    v13 = a1 + 48;
  }
  ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 24);

  objc_autoreleasePoolPop(v7);
}

uint64_t __95__MCMCodeSigningMapping_initWithUserIdentityCache_queue_mappingDB_childParentMapCache_library___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migrateFromMappingFileToDBIfNecessary");
}

+ (id)codeSignMappingWithError:(id *)a3
{
  id v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  host_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  MCMChildParentMapCache *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v25;
  Class v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint32_t multiuser_flags;
  id v40;
  uint64_t v41;

  v26 = (Class)a1;
  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3876;
  v37 = __Block_byref_object_dispose__3877;
  v38 = 0;
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "managedPathRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_queue_create("com.apple.MobileContainerManager.EntitlementQueue", 0);
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("containers"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("sqlite3"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(multiuser_flags) = 0;
      _os_log_fault_impl(&dword_1CF807000, v13, OS_LOG_TYPE_FAULT, "Failed to get global library url.", (uint8_t *)&multiuser_flags, 2u);
    }
    v12 = 0;
    v14 = 0;
    goto LABEL_14;
  }
  multiuser_flags = 0;
  v10 = MEMORY[0x1D17D6F20]();
  if (host_get_multiuser_config_flags(v10, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    v32 = 0;
    -[objc_class _moveDBIfNeededFromURL:queue:error:](v26, "_moveDBIfNeededFromURL:queue:error:", v9, v6, &v32, v26);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v32;
    v11 = v15;
    if (v12)
      goto LABEL_10;
    if (v15)
    {
      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        multiuser_flags = 138412290;
        v40 = v11;
        _os_log_fault_impl(&dword_1CF807000, v25, OS_LOG_TYPE_FAULT, "Failed to move database: error = %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

    }
  }
  else
  {
    v11 = 0;
  }
  v12 = v9;
LABEL_10:

  v16 = containermanager_copy_global_configuration();
  objc_msgSend(v16, "libraryRepair");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke;
  v28[3] = &unk_1E8CB5498;
  v18 = v6;
  v29 = v18;
  v30 = &v33;
  objc_msgSend(v17, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v12, &v31, v28);
  v14 = v31;

  if (v34[5])
  {
    v19 = [MCMChildParentMapCache alloc];
    v13 = -[MCMChildParentMapCache initWithDB:queue:](v19, "initWithDB:queue:", v34[5], v18);
    v20 = [v26 alloc];
    +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithUserIdentityCache:queue:mappingDB:childParentMapCache:library:", v21, v18, v34[5], v13, v5);

    goto LABEL_15;
  }
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    multiuser_flags = 138412290;
    v40 = v14;
    _os_log_fault_impl(&dword_1CF807000, v13, OS_LOG_TYPE_FAULT, "Failed to initialize database; error = %@",
      (uint8_t *)&multiuser_flags,
      0xCu);
  }
LABEL_14:
  v22 = 0;
LABEL_15:

  if (a3)
    *a3 = objc_retainAutorelease(v14);
  v23 = v22;

  _Block_object_dispose(&v33, 8);
  return v23;
}

+ (id)_moveDBIfNeededFromURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v50;
  _QWORD block[4];
  NSObject *v52;
  NSObject *v53;
  dispatch_queue_t v54;
  _BYTE *v55;
  uint64_t *v56;
  id obj;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[24];
  uint64_t v66;
  _BYTE buf[24];
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__3876;
  v63 = __Block_byref_object_dispose__3877;
  v64 = 0;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultUserIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedUserPathRegistryForUserIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "containermanagerUserLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", &stru_1E8CB6A50);
    *(_QWORD *)v65 = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMCodeSigningMapping _moveDBIfNeededFromURL:queue:error:]_block_invoke");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v33;
    *(_QWORD *)&buf[8] = &unk_1E8CD6018;
    v34 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&v65[8] = CFSTR("SourceFileLine");
    *(_QWORD *)&v65[16] = v34;
    *(_QWORD *)&buf[16] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v65, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 132, v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v60[5];
    v60[5] = v36;

    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CF807000, v14, OS_LOG_TYPE_FAULT, "Failed to get user library url.", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("references"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("sqlite3"));
  v14 = objc_claimAutoreleasedReturnValue();

  v58 = 0;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)(v60 + 5);
  obj = (id)v60[5];
  v17 = objc_msgSend(v15, "itemAtURL:exists:isDirectory:error:", v6, &v58, 0, &obj);
  objc_storeStrong(v16, obj);

  if ((v17 & 1) == 0)
  {
    container_log_handle_for_category();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      v44 = v60[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v44;
      _os_log_fault_impl(&dword_1CF807000, v38, OS_LOG_TYPE_FAULT, "Failed to check if old database exists at [%@], error = %@", buf, 0x16u);
    }

LABEL_12:
    v21 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (!v58)
  {
LABEL_18:
    v21 = v14;
    goto LABEL_19;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeItemAtURL:error:", v14, 0);

  -[NSObject URLByDeletingPathExtension](v14, "URLByDeletingPathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathExtension:", CFSTR("sqlite3-wal"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeItemAtURL:error:", v47, 0);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v68 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke;
  block[3] = &unk_1E8CB54C0;
  v55 = buf;
  v21 = v6;
  v52 = v21;
  v22 = v14;
  v53 = v22;
  v54 = (dispatch_queue_t)v48;
  v56 = &v59;
  dispatch_sync(v54, block);
  v46 = v22;
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v39 = v60[5];
    *(_DWORD *)v65 = 138412802;
    *(_QWORD *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(_QWORD *)&v65[14] = v22;
    *(_WORD *)&v65[22] = 2112;
    v66 = v39;
    v40 = "Failed to move database from [%@] to [%@], error = %@";
    v41 = v28;
    v42 = 32;
LABEL_27:
    _os_log_fault_impl(&dword_1CF807000, v41, OS_LOG_TYPE_FAULT, v40, v65, v42);
    goto LABEL_16;
  }
  v23 = v6;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager", v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id *)(v60 + 5);
  v50 = (id)v60[5];
  v26 = objc_msgSend(v24, "removeItemAtURL:error:", v21, &v50);
  objc_storeStrong(v25, v50);
  v6 = v23;

  if ((v26 & 1) != 0)
  {
    -[NSObject URLByDeletingPathExtension](v21, "URLByDeletingPathExtension");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLByAppendingPathExtension:", CFSTR("sqlite3-wal"));
    v28 = objc_claimAutoreleasedReturnValue();

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeItemAtURL:error:", v28, 0);

    v30 = 0;
    v31 = 1;
    goto LABEL_17;
  }
  container_log_handle_for_category();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    v45 = v60[5];
    *(_DWORD *)v65 = 138412546;
    *(_QWORD *)&v65[4] = v21;
    *(_WORD *)&v65[12] = 2112;
    *(_QWORD *)&v65[14] = v45;
    v40 = "Failed to delete database from [%@], error = %@";
    v41 = v28;
    v42 = 22;
    goto LABEL_27;
  }
LABEL_16:
  v31 = 0;
  v30 = 1;
LABEL_17:

  _Block_object_dispose(buf, 8);
  if ((v31 & 1) != 0)
    goto LABEL_18;

  if ((v30 & 1) == 0)
    goto LABEL_23;
  v21 = 0;
LABEL_20:
  if (a5 && !v21)
  {
    v21 = 0;
    *a5 = objc_retainAutorelease((id)v60[5]);
  }
LABEL_23:

  _Block_object_dispose(&v59, 8);
  return v21;
}

void __60__MCMCodeSigningMapping__moveDBIfNeededFromURL_queue_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj[0] = *(id *)(v5 + 40);
  v6 = +[MCMSQLiteDB moveDBWithURL:toURL:queue:error:](MCMSQLiteDB, "moveDBWithURL:toURL:queue:error:", v2, v3, v4, obj);
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

BOOL __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _BOOL8 v9;
  __int128 v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2;
  block[3] = &unk_1E8CB5470;
  v13 = v5;
  v11 = *(_OWORD *)(a1 + 32);
  v7 = (id)v11;
  v14 = v11;
  v15 = a3;
  v8 = v5;
  dispatch_sync(v6, block);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

  return v9;
}

void __50__MCMCodeSigningMapping_codeSignMappingWithError___block_invoke_2(_QWORD *a1)
{
  MCMSQLiteDB *v2;
  uint64_t v3;
  void *v4;

  v2 = -[MCMSQLiteDB initWithURL:queue:error:]([MCMSQLiteDB alloc], "initWithURL:queue:error:", a1[4], a1[5], a1[7]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
