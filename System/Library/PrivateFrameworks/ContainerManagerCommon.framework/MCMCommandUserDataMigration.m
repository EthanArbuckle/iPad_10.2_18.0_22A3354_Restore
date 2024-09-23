@implementation MCMCommandUserDataMigration

+ (unint64_t)command
{
  return 30;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToStartUserDataMigration");

  return v4;
}

- (void)execute
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t error_description;
  NSObject *v40;
  uint64_t v41;
  MCMResultPromise *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  uint64_t v51;
  MCMResultBase *v52;
  MCMResultBase *v53;
  void *v54;
  void *context;
  void *contexta;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  uint64_t v63;
  _QWORD v64[7];
  _QWORD v65[8];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint8_t buf[4];
  _BYTE v87[18];
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  _BYTE v92[128];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__2215;
  v84 = __Block_byref_object_dispose__2216;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__2215;
  v78 = __Block_byref_object_dispose__2216;
  v79 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 1;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 1;
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand context](self, "context", context);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = containermanager_copy_global_configuration();
    objc_msgSend(v5, "defaultUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v87 = v4;
    *(_WORD *)&v87[8] = 2112;
    *(_QWORD *)&v87[10] = v6;
    _os_log_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEFAULT, "Container data migration requested by %@ for default user: %@", buf, 0x16u);

  }
  v7 = (void *)gCodeSigningMapping;
  -[MCMCommand context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performAllCodeSigningMigrationAndReconciliationWithContext:", v8);

  v57 = -[MCMMigrationStatus initForMobileUserMigration]([MCMMigrationStatus alloc], "initForMobileUserMigration");
  v9 = objc_msgSend(v57, "hasMigrationOccurredForType:", CFSTR("SubdirectoryMigration"));
  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) == 0)
  {
    -[MCMCommand context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userIdentityCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v10;
    v65[1] = 3221225472;
    v65[2] = __38__MCMCommandUserDataMigration_execute__block_invoke;
    v65[3] = &unk_1E8CB51F8;
    v65[4] = self;
    v65[5] = &v80;
    v65[6] = &v70;
    v65[7] = &v74;
    objc_msgSend(v12, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v65);

    if (*((_BYTE *)v71 + 24))
      objc_msgSend(v57, "setMigrationCompleteForType:", CFSTR("SubdirectoryMigration"));
  }
  v13 = (void *)v75[5];
  v75[5] = 0;

  -[MCMCommand context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userIdentityCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v10;
  v64[1] = 3221225472;
  v64[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_15;
  v64[3] = &unk_1E8CB53D0;
  v64[4] = self;
  v64[5] = &v80;
  v64[6] = &v66;
  objc_msgSend(v15, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v64);

  v16 = (void *)v75[5];
  v75[5] = 0;

  v63 = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(&unk_1E8CD5560, "count"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v17 = objc_msgSend(&unk_1E8CD5560, "countByEnumeratingWithState:objects:count:", &v93, v92, 16);
  if (v17)
  {
    v59 = *(_QWORD *)v94;
    do
    {
      v60 = v17;
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v94 != v59)
          objc_enumerationMutation(&unk_1E8CD5560);
        v19 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
        objc_msgSend(&unk_1E8CD5560, "objectForKeyedSubscript:", v19, context);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedLongLongValue");

        v63 = 1;
        -[MCMCommand context](self, "context");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "globalConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "staticConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "configForContainerClass:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMCommand context](self, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "userIdentityCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCommand context](self, "context");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "clientIdentity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "posixUser");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "userIdentityForPersonalPersonaWithPOSIXUser:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMCommand context](self, "context");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "userIdentityCache");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v31, v19, v25, 0, v33, &v63);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = (id *)(v81 + 5);
          obj = (id)v81[5];
          objc_msgSend((id)gContainerCache, "entryForContainerIdentity:error:", v34, &obj);
          v36 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v35, obj);
          -[NSObject metadataMinimal](v36, "metadataMinimal");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v58, "addObject:", v34);
          }
          else
          {
            if (objc_msgSend((id)v81[5], "type") == 21)
            {
              v40 = v81[5];
              v81[5] = 0;
            }
            else
            {
              container_log_handle_for_category();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = v81[5];
                *(_DWORD *)buf = 134218498;
                *(_QWORD *)v87 = v21;
                *(_WORD *)&v87[8] = 2112;
                *(_QWORD *)&v87[10] = v19;
                v88 = 2112;
                v89 = v41;
                _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Failed lookup when trying to remove deprecated [%llu:%@]: %@", buf, 0x20u);
              }
            }

          }
        }
        else
        {
          container_log_handle_for_category();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v38 = v63;
            error_description = container_get_error_description();
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)v87 = v21;
            *(_WORD *)&v87[8] = 2112;
            *(_QWORD *)&v87[10] = v19;
            v88 = 2048;
            v89 = v38;
            v90 = 2080;
            v91 = error_description;
            _os_log_error_impl(&dword_1CF807000, v36, OS_LOG_TYPE_ERROR, "Could not create container identity when trying to remove deprecated [%llu:%@]: (%llu) %s", buf, 0x2Au);
          }
        }

      }
      v17 = objc_msgSend(&unk_1E8CD5560, "countByEnumeratingWithState:objects:count:", &v93, v92, 16);
    }
    while (v17);
  }
  if (objc_msgSend(v58, "count", context))
  {
    v42 = objc_alloc_init(MCMResultPromise);
    v43 = (void *)objc_msgSend(v58, "copy");
    -[MCMCommand context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v43, 1, v44, v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "execute");
    -[MCMResultPromise result](v42, "result");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "error");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      container_log_handle_for_category();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v87 = v47;
        _os_log_error_impl(&dword_1CF807000, v48, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during user data migration; error = %@",
          buf,
          0xCu);
      }

    }
  }
  if (*((_BYTE *)v71 + 24))
    v49 = *((unsigned __int8 *)v67 + 24);
  else
    v49 = 0;
  container_log_handle_for_category();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v81[5];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v87 = v49;
    *(_WORD *)&v87[4] = 2112;
    *(_QWORD *)&v87[6] = v51;
    _os_log_impl(&dword_1CF807000, v50, OS_LOG_TYPE_DEFAULT, "Per user data migration result: %d, error = %@", buf, 0x12u);
  }

  v52 = [MCMResultBase alloc];
  v53 = -[MCMResultBase initWithError:](v52, "initWithError:", v81[5]);
  -[MCMCommand resultPromise](self, "resultPromise");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "completeWithResult:", v53);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  objc_autoreleasePoolPop(contexta);
}

- (void)_setDataProtectionIfNecessaryOnContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  MCMResultPromise *v13;
  MCMResultPromise *v14;
  MCMCommandSetDataProtection *v15;
  void *v16;
  void *v17;
  MCMCommandSetDataProtection *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerClassPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsDataProtection");

  if (v7)
  {
    v21 = 0;
    v8 = -[MCMCommandUserDataMigration _bundleContainerExistsForDataContainer:error:](self, "_bundleContainerExistsForDataContainer:error:", v4, &v21);
    v9 = v21;
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        v24 = 2112;
        v25 = v9;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Error looking up bundle container for %@ : %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      v12 = -[MCMCommandUserDataMigration _intendedDataProtectionClassBasedOnEntitlementsForIdentifier:](self, "_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:", v10);
      v13 = [MCMResultPromise alloc];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke;
      v19[3] = &unk_1E8CB5248;
      v20 = v10;
      v14 = -[MCMResultPromise initWithCompletion:](v13, "initWithCompletion:", v19);
      v15 = [MCMCommandSetDataProtection alloc];
      objc_msgSend(v4, "containerIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommand context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MCMCommandSetDataProtection initWithContainerIdentity:thirdParty:dataProtectionClass:retryIfLocked:skipIfUnchanged:context:resultPromise:](v15, "initWithContainerIdentity:thirdParty:dataProtectionClass:retryIfLocked:skipIfUnchanged:context:resultPromise:", v16, 0, v12, 0, 1, v17, v14);

      -[MCMCommandSetDataProtection execute](v18, "execute");
      v11 = v20;
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (int)_intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend((id)gCodeSigningMapping, "entitlementsForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intendedDataProtectionClass");
  else
    v5 = 0;

  return v5;
}

- (BOOL)_bundleContainerExistsForDataContainer:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  xpc_object_t v10;
  uint64_t count_results;
  BOOL v12;
  MCMError *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  xpc_object_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  MCMError *v30;
  NSObject *v31;
  MCMError *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  MCMError *v41;
  MCMError *v42;
  id v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  MCMError *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = 1;
  if (objc_msgSend(v6, "containerClass") == 2)
  {
    v7 = containermanager_copy_global_configuration();
    v8 = objc_msgSend(v7, "dispositionForContainerClass:", 1);

    if (v8 == 2)
    {
      container_query_create();
      container_query_set_class();
      objc_msgSend(v6, "identifier");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = xpc_string_create((const char *)objc_msgSend(v9, "UTF8String"));
      container_query_set_identifiers();

      count_results = container_query_count_results();
      v12 = count_results > 0;
      if (count_results < 0)
        v13 = -[MCMError initWithLibsystemError:]([MCMError alloc], "initWithLibsystemError:", container_query_get_last_error());
      else
        v13 = 0;
      container_query_free();
      goto LABEL_41;
    }
    -[MCMCommand context](self, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "globalConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "staticConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "configForContainerClass:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "userIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userIdentityCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v24, v25, v16, 0, v27, &v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v45 = 0;
      objc_msgSend((id)gContainerCache, "entryForContainerIdentity:error:", v28, &v45);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (MCMError *)v45;
      v13 = v30;
      if (v29)
      {
        v12 = 1;
LABEL_39:

        goto LABEL_40;
      }
      if (v30 && -[MCMError type](v30, "type") == 21)
      {

        v29 = 0;
        v13 = 0;
      }
      else
      {
        v29 = 0;
      }
    }
    else
    {
      v32 = [MCMError alloc];
      v13 = -[MCMError initWithErrorType:](v32, "initWithErrorType:", v46);
      container_log_handle_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = (uint64_t)v33;
        v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Could not create container identity from [%@]: %@", buf, 0x16u);

      }
    }
    v12 = 0;
    goto LABEL_39;
  }
  if (objc_msgSend(v6, "containerClass") == 4)
  {
    objc_msgSend((id)gCodeSigningMapping, "childParentMapCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentIdentifierForChildIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v13 = 0;
      v12 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v17 = containermanager_copy_global_configuration();
    v18 = objc_msgSend(v17, "dispositionForContainerClass:", 1);

    if (v18 == 2)
    {
      container_query_create();
      container_query_set_class();
      v19 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
      container_query_set_identifiers();

      v20 = container_query_count_results();
      v12 = v20 > 0;
      if (v20 < 0)
        v13 = -[MCMError initWithLibsystemError:]([MCMError alloc], "initWithLibsystemError:", container_query_get_last_error());
      else
        v13 = 0;
      container_query_free();
      goto LABEL_40;
    }
    -[MCMCommand context](self, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "globalConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "staticConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "configForContainerClass:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "userIdentity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "userIdentityCache");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v37, v16, v28, 0, v39, &v46);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v44 = 0;
      objc_msgSend((id)gContainerCache, "entryForContainerIdentity:error:", v29, &v44);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (MCMError *)v44;
      v13 = v41;
      if (v40)
      {
        v12 = 1;
LABEL_38:

        goto LABEL_39;
      }
      if (v41 && -[MCMError type](v41, "type") == 21)
      {

        v40 = 0;
        v13 = 0;
      }
      else
      {
        v40 = 0;
      }
    }
    else
    {
      v42 = [MCMError alloc];
      v13 = -[MCMError initWithErrorType:](v42, "initWithErrorType:", v46);
      container_log_handle_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v48 = (uint64_t)v16;
        v49 = 2112;
        v50 = v13;
        _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Could not create container identity from [%@]: %@", buf, 0x16u);
      }
    }
    v12 = 0;
    goto LABEL_38;
  }
  v13 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 20);
  container_log_handle_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v48 = objc_msgSend(v6, "containerClass");
    _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "Passed an unexpected container type: %llu", buf, 0xCu);
  }

  v12 = 0;
LABEL_41:
  if (a4 && v13)
    *a4 = objc_retainAutorelease(v13);

  return v12;
}

id __72__MCMCommandUserDataMigration__setDataProtectionIfNecessaryOnContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "Error processing restored system container %@: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  return v3;
}

void __38__MCMCommandUserDataMigration_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMCommandContext privilegedWithUserIdentity:userIdentityCache:](MCMCommandContext, "privilegedWithUserIdentity:userIdentityCache:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](MCMMigrationStatus, "currentBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v3;
    v24 = 2112;
    v25 = (uint64_t)v8;
    _os_log_impl(&dword_1CF807000, v7, OS_LOG_TYPE_DEFAULT, "Performing Per User Subdirectory Migration for %@ on %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "classIterator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_3;
  v17[3] = &unk_1E8CB51D0;
  v11 = v6;
  v18 = v11;
  v12 = v3;
  v19 = v12;
  v20 = *(_OWORD *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v10, "selectUserWithIterator:", v17);

  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](MCMMigrationStatus, "currentBuildVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v16 = 89;
    else
      v16 = 78;
    *(_DWORD *)buf = 138412802;
    v23 = v12;
    v24 = 2112;
    v25 = v14;
    v26 = 1024;
    v27 = v16;
    _os_log_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEFAULT, "Completed Per User Subdirectory Migration for %@ on %@ : Success: %c", buf, 0x1Cu);

  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](MCMMigrationStatus, "currentBuildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v3;
    v22 = 2112;
    v23 = (uint64_t)v5;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Performing User Data Protection Migration for %@ on %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classIterator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __38__MCMCommandUserDataMigration_execute__block_invoke_16;
  v16 = &unk_1E8CB5220;
  v17 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v18 = v8;
  v19 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v7, "selectDataProtectedWithIterator:", &v13);

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[MCMMigrationStatus currentBuildVersion](MCMMigrationStatus, "currentBuildVersion", v13, v14, v15, v16, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v12 = 89;
    else
      v12 = 78;
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    v24 = 1024;
    v25 = v12;
    _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Completed User Data Protection Migration for %@ on %@ : Success: %c", buf, 0x1Cu);

  }
}

void __38__MCMCommandUserDataMigration_execute__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id obj;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "containerClass");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v5, "entriesForUserIdentities:contentClass:transient:error:", v6, v7, 0, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1D17D7010]();
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v23 = *(id *)(v17 + 40);
          objc_msgSend(v15, "metadataWithError:", &v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v17 + 40), v23);
          if (v18)
            objc_msgSend(*(id *)(a1 + 32), "_setDataProtectionIfNecessaryOnContainer:", v18);

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      }
      while (v12);
    }

  }
  else
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = objc_msgSend(v3, "containerClass");
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v20;
      v32 = 2048;
      v33 = v21;
      v34 = 2112;
      v35 = v22;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch list of data containers for userIdentity: %@, class: %ld: %@", buf, 0x20u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __38__MCMCommandUserDataMigration_execute__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  MCMResultPromise *v16;
  MCMCommandRecreateContainerStructure *v17;
  void *v18;
  MCMCommandRecreateContainerStructure *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  MCMResultPromise *v34;
  uint64_t v35;
  id obj;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "containerCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v3;
  v6 = objc_msgSend(v3, "containerClass");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v4, "entriesForUserIdentities:contentClass:transient:error:", v5, v6, 0, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v8)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v8;
    v29 = v8;
    v9 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v29);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D17D7010]();
          objc_msgSend(v13, "metadataMinimal");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc_init(MCMResultPromise);
          v17 = [MCMCommandRecreateContainerStructure alloc];
          objc_msgSend(v15, "containerIdentity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[MCMCommandRecreateContainerStructure initWithConcreteContainerIdentity:context:resultPromise:](v17, "initWithConcreteContainerIdentity:context:resultPromise:", v18, *(_QWORD *)(a1 + 32), v16);

          -[MCMCommandRecreateContainerStructure execute](v19, "execute");
          -[MCMResultPromise result](v16, "result");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "error");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __38__MCMCommandUserDataMigration_execute__block_invoke_7;
            v31[3] = &unk_1E8CB51A8;
            v32 = v15;
            v33 = v30;
            v34 = v16;
            v35 = 1;
            __38__MCMCommandUserDataMigration_execute__block_invoke_7((uint64_t)v31);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v24 = *(void **)(v23 + 40);
            *(_QWORD *)(v23 + 40) = v22;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          }

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v10);
    }

    v8 = v28;
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 40);
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v43 = v26;
      v44 = 2048;
      v45 = 0;
      v46 = 2112;
      v47 = v27;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch list of containers for userIdentity: %@, class %ld : %@", buf, 0x20u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

id __38__MCMCommandUserDataMigration_execute__block_invoke_7(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "containerClass");
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to recreate container directory structure for %@:%ld:%@ : %@"), v3, v4, v5, v7);

  v17[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMCommandUserDataMigration execute]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = &unk_1E8CD5FA0;
  v10 = *MEMORY[0x1E0CB2D50];
  v17[1] = CFSTR("SourceFileLine");
  v17[2] = v10;
  v18[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), *(_QWORD *)(a1 + 56), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
