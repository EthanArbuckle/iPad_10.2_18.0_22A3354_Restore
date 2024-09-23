@implementation MCMClientConnection

- (MCMCommandContext)context
{
  return self->_context;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  void *v5;
  void *v6;
  MCMContainerFactory *v7;
  MCMContainerFactory *v8;
  MCMCommandContext *v9;
  uint64_t v10;
  id v11;
  MCMCommandContext *v12;
  void *v13;

  +[MCMClientIdentity privilegedClientIdentityWithUserIdentity:kernel:](MCMClientIdentity, "privilegedClientIdentityWithUserIdentity:kernel:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MCMContainerFactory alloc];
  v8 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:](v7, "initWithContainerCache:clientIdentity:userIdentityCache:", gContainerCache, v5, v6);
  v9 = [MCMCommandContext alloc];
  v10 = gContainerCache;
  v11 = containermanager_copy_global_configuration();
  v12 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:](v9, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:", v5, v10, v8, v6, 0, v11);

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v12);
  return v13;
}

- (MCMClientConnection)initWithContext:(id)a3
{
  id v5;
  MCMClientConnection *v6;
  MCMClientConnection *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMClientConnection;
  v6 = -[MCMClientConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (MCMClientConnection)init
{
  MCMClientConnection *v2;
  void *v3;
  void *v4;
  void *v5;
  MCMContainerFactory *v6;
  MCMContainerFactory *v7;
  MCMCommandContext *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  MCMCommandContext *context;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MCMClientConnection;
  v2 = -[MCMClientConnection init](&v14, sel_init);
  if (v2)
  {
    +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultUserIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:](MCMClientIdentity, "anonymousPrivilegedClientIdentityWithUserIdentity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [MCMContainerFactory alloc];
    v7 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:](v6, "initWithContainerCache:clientIdentity:userIdentityCache:", gContainerCache, v5, v3);
    v8 = [MCMCommandContext alloc];
    v9 = gContainerCache;
    v10 = containermanager_copy_global_configuration();
    v11 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:](v8, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:", v5, v9, v7, v3, 0, v10);
    context = v2->_context;
    v2->_context = (MCMCommandContext *)v11;

  }
  return v2;
}

- (id)clientBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MCMClientConnection context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "codeSignInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)containerManagerSetup
{
  id v3;
  int v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  NSObject *v23;
  char v24;
  int v25;
  NSObject *v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  char v31;
  int v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  NSObject *v40;
  NSObject *v41;
  char v42;
  id v43;
  NSObject *v44;
  void *v45;
  BOOL v46;
  id v47;
  NSObject *v48;
  id v49;
  int v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68[2];
  id v69[2];
  uint8_t v70[4];
  void *v71;
  __int16 v72;
  id v73;
  uint8_t v74[4];
  void *v75;
  __int16 v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "dispositionForContainerClass:", 12);

  if (v4 == 1)
  {
    -[MCMClientConnection context](self, "context");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = containermanager_copy_global_configuration();
    v7 = objc_msgSend(v6, "systemContainerMode");

    if (!v7)
    {
LABEL_60:

      goto LABEL_61;
    }
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = containermanager_copy_global_configuration();
    v10 = objc_msgSend(v9, "systemContainerMode");

    if (v10 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "globalSystemUserIdentity");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10 != 2)
      {
LABEL_59:

        goto LABEL_60;
      }
      +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userIdentityForCurrentContext");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;

    +[MCMContainerClassBackupPath systemContainerBackupBaseDirectoryWithUserIdentity:](MCMContainerClassBackupPath, "systemContainerBackupBaseDirectoryWithUserIdentity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerClassBackupPath systemContainerBackupDirectoryWithUserIdentity:](MCMContainerClassBackupPath, "systemContainerBackupDirectoryWithUserIdentity:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerClassBackupPath systemGroupContainerBackupDirectoryWithUserIdentity:](MCMContainerClassBackupPath, "systemGroupContainerBackupDirectoryWithUserIdentity:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v16;
    v61 = v15;
    if (objc_msgSend(v8, "itemDoesNotExistAtURL:", v14))
    {
      container_log_handle_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "There are no system/system group containers staged for restore, skipping.", buf, 2u);
      }
      v62 = 0;
      v63 = 0;
      v18 = 0;
      v19 = 0;
LABEL_11:

LABEL_54:
      v65 = v19;
      v42 = objc_msgSend(v8, "removeItemAtURL:error:", v14, &v65);
      v43 = v65;

      if ((v42 & 1) == 0)
      {
        container_log_handle_for_category();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "path");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v70 = 138412546;
          v71 = v58;
          v72 = 2112;
          v73 = v43;
          _os_log_error_impl(&dword_1CF807000, v44, OS_LOG_TYPE_ERROR, "Failed to remove system container base dir %@: %@", v70, 0x16u);

        }
      }

      goto LABEL_59;
    }
    if (objc_msgSend(v8, "itemExistsAtURL:", v15))
    {
      objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("inprogress"));
      v69[1] = 0;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "removeItemAtURL:error:");
      v21 = 0;
      if ((v20 & 1) == 0)
      {
        v22 = v16;
        container_log_handle_for_category();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v21;
          _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to remove existing inprogress system containers: %@", buf, 0xCu);
        }

        v16 = v22;
      }
      v69[0] = v21;
      v24 = objc_msgSend(v8, "moveItemAtURL:toURL:error:", v15, v63, v69);
      v19 = v69[0];

      if ((v24 & 1) != 0)
      {
        v25 = 1;
        goto LABEL_24;
      }
      container_log_handle_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v83 = v19;
        _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Failed to move system containers to inprogress: %@", buf, 0xCu);
      }

    }
    else
    {
      v63 = 0;
      v19 = 0;
    }
    v25 = 0;
LABEL_24:
    if (objc_msgSend(v8, "itemExistsAtURL:", v16))
    {
      objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("inprogress"));
      v68[1] = v19;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v8, "removeItemAtURL:error:");
      v28 = v19;

      if ((v27 & 1) == 0)
      {
        v29 = v16;
        container_log_handle_for_category();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v28;
          _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to remove existing inprogress system containers: %@", buf, 0xCu);
        }

        v16 = v29;
      }
      v68[0] = v28;
      v31 = objc_msgSend(v8, "moveItemAtURL:toURL:error:", v16, v62, v68);
      v19 = v68[0];

      if ((v31 & 1) != 0)
      {
        if (!v25)
        {
          v18 = 0;
          v35 = v19;
LABEL_69:
          container_log_handle_for_category();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v74 = 0;
            _os_log_impl(&dword_1CF807000, v52, OS_LOG_TYPE_DEFAULT, "Installing system group containers", v74, 2u);
          }

          v66 = v35;
          objc_msgSend(v8, "urlsForItemsInDirectoryAtURL:error:", v62, &v66);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v66;

          if (v53)
          {
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v17 = v53;
            v54 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v78, v74, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v55; ++i)
                {
                  if (*(_QWORD *)v79 != v56)
                    objc_enumerationMutation(v17);
                  _moveSystemContainerIntoPlace(*(void **)(*((_QWORD *)&v78 + 1) + 8 * i), 13, v5, v13);
                }
                v55 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v78, v74, 16);
              }
              while (v55);
              v18 = v17;
            }
            else
            {
              v18 = v17;
            }
          }
          else
          {
            container_log_handle_for_category();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v74 = 138412546;
              v75 = v62;
              v76 = 2112;
              v77 = v19;
              _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Couldn't find any system shared containers at %@: %@", v74, 0x16u);
            }
            v18 = 0;
          }
          goto LABEL_11;
        }
        v32 = 1;
LABEL_34:
        container_log_handle_for_category();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CF807000, v33, OS_LOG_TYPE_DEFAULT, "Installing system containers", buf, 2u);
        }

        v67 = v19;
        objc_msgSend(v8, "urlsForItemsInDirectoryAtURL:error:", v63, &v67);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v67;

        if (v34)
        {
          v59 = v32;
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v18 = v34;
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v87;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v87 != v38)
                  objc_enumerationMutation(v18);
                _moveSystemContainerIntoPlace(*(void **)(*((_QWORD *)&v86 + 1) + 8 * j), 12, v5, v13);
              }
              v37 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
            }
            while (v37);
          }

          if ((v59 & 1) != 0)
            goto LABEL_69;
        }
        else
        {
          container_log_handle_for_category();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v83 = v63;
            v84 = 2112;
            v85 = v35;
            _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Couldn't find any system containers at %@: %@", buf, 0x16u);
          }

          v18 = 0;
          if (v32)
            goto LABEL_69;
        }
        v19 = v35;
        goto LABEL_54;
      }
      container_log_handle_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v83 = v19;
        _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Failed to move shared system containers to inprogress: %@", buf, 0xCu);
      }

      if ((v25 & 1) == 0)
      {
LABEL_49:
        v18 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      v62 = 0;
      if ((v25 & 1) == 0)
        goto LABEL_49;
    }
    v32 = 0;
    goto LABEL_34;
  }
LABEL_61:
  -[MCMClientConnection context](self, "context");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v46 = +[MCMCommandReplaceContainer recoverFromReplaceOperationsWithContext:error:](MCMCommandReplaceContainer, "recoverFromReplaceOperationsWithContext:error:", v45, &v64);
  v47 = v64;

  if (!v46)
  {
    container_log_handle_for_category();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v83 = v47;
      _os_log_error_impl(&dword_1CF807000, v48, OS_LOG_TYPE_ERROR, "Failed recovering from replace operations: %@", buf, 0xCu);
    }

  }
  v49 = containermanager_copy_global_configuration();
  v50 = objc_msgSend(v49, "runmode");

  if (v50)
  {
    +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "restartPendingDataProtectionOperations");

  }
}

- (void)containerManagerCleanupWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD block[4];
  id v31;
  NSObject *v32;
  id obj;
  _QWORD v34[5];
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  -[MCMClientConnection _resumeDeleteOperations](self, "_resumeDeleteOperations");
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke;
  v34[3] = &unk_1E8CB4AD8;
  v34[4] = self;
  v6 = (void *)MEMORY[0x1D17D71B4](v34);
  v7 = containermanager_copy_global_configuration();
  v8 = objc_msgSend(v7, "dispositionForContainerClass:", 1) == 1;

  if (v8)
  {
    +[MCMContainerClassStagingPath stagingGlobalURL](MCMContainerClassStagingPath, "stagingGlobalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v36;
    obj = v36[5];
    objc_msgSend(v10, "urlsForItemsInDirectoryAtURL:error:", v9, &obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11 + 5, obj);

    if (v12)
    {
      v13 = MCMSharedBackgroundQueue();
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10;
      block[3] = &unk_1E8CB5DD8;
      v32 = v6;
      v31 = v12;
      dispatch_async(v13, block);

      v14 = v32;
    }
    else
    {
      objc_msgSend(v36[5], "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      {
        v16 = objc_msgSend(v36[5], "code") == 2;

        if (v16)
          goto LABEL_11;
      }
      else
      {

      }
      container_log_handle_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v36[5];
        *(_DWORD *)buf = 138412546;
        v42 = v23;
        v43 = 2112;
        v44 = v24;
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to get items at global staging URL: %@ : %@", buf, 0x16u);

      }
    }

LABEL_11:
  }
  v17 = containermanager_copy_global_configuration();
  v18 = objc_msgSend(v17, "dispositionForContainerClass:", 2) == 1;

  if (v18)
  {
    -[MCMClientConnection context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userIdentityCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2;
    v27[3] = &unk_1E8CB4B00;
    v29 = &v35;
    v28 = v6;
    objc_msgSend(v20, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v27);

  }
  v21 = MCMSharedBackgroundQueue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13;
  v25[3] = &unk_1E8CB5DD8;
  v25[4] = self;
  v26 = v4;
  v22 = v4;
  dispatch_async(v21, v25);

  _Block_object_dispose(&v35, 8);
}

- (void)_cleanupOrphanedDataForDirectories:(id)a3 containerClass:(unint64_t)a4 forUserIdentity:(id)a5
{
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class_ro **p_info;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  id v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  __int128 v40;
  id v41;
  id obj;
  id v43;
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  NSObject *v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a5;
  obj = v8;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v50;
    p_info = MCMCommandDeleteContainerContent.info;
    *(_QWORD *)&v10 = 138412546;
    v40 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v16 = -[MCMClientConnection _containerURL:isValidForContainerClass:](self, "_containerURL:isValidForContainerClass:", v15, a4, v40);
        objc_msgSend(p_info + 296, "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "itemExistsAtURL:", v15);

        if (v18)
        {
          if (v16)
          {
            objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.mobile_container_manager.metadata.plist"), 0);
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_info + 296, "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "itemDoesNotExistAtURL:", v19);

            if (!v21)
              goto LABEL_32;
            if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
            {
              objc_msgSend(v15, "lastPathComponent");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              v25 = a4 == 13
                  ? objc_msgSend(v23, "systemGroupContainerIdIsWellknown:", v22)
                  : objc_msgSend(v23, "systemContainerIdIsWellknown:", v22);
              v27 = v25;

              if ((v27 & 1) != 0)
              {
LABEL_28:
                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
                goto LABEL_32;
              }
            }
            container_log_handle_for_category();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "path");
              v39 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v45 = v39;
              _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Deleting orphaned data missing a metadata file at: %@", buf, 0xCu);

            }
          }
          v29 = containermanager_copy_global_configuration();
          v30 = objc_msgSend(v29, "isInternalImage");

          if (v30)
          {
            container_log_handle_for_category();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "***INTERNAL BUILD REQUEST: If you see this, file a Radar in \"MobileContainerManager | all\" with the following data:", buf, 2u);
            }

            container_log_handle_for_category();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "\tSomeone is writing invalid data to a container, which has now been orphaned. Here are the invalid files:", buf, 2u);
            }

            +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "printDirectoryStructureAtURL:", v15);

            container_log_handle_for_category();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CF807000, v34, OS_LOG_TYPE_ERROR, "***END INTERNAL BUILD REQUEST", buf, 2u);
            }

          }
          -[MCMClientConnection context](self, "context");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "containerFactory");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v37 = objc_msgSend(v36, "deleteURL:forUserIdentity:error:", v15, v41, &v43);
          v19 = v43;

          if ((v37 & 1) != 0)
            goto LABEL_28;
          container_log_handle_for_category();
          v26 = objc_claimAutoreleasedReturnValue();
          p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "path");
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v40;
            v45 = v38;
            v46 = 2112;
            v47 = v19;
            _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Failed to delete [%@]; error = %@",
              buf,
              0x16u);

            p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
          }
        }
        else
        {
          container_log_handle_for_category();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_32;
          objc_msgSend(v15, "path");
          v26 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v26;
          _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring deleted container path during cleanup: [%@]", buf, 0xCu);
        }

LABEL_32:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    }
    while (v11);
  }

}

- (BOOL)_containerURL:(id)a3 isValidForContainerClass:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  BOOL v13;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  if (a4 == 12)
  {
    +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "systemContainerIdIsWellknown:", v10);
  }
  else
  {
    if (a4 != 13)
    {
LABEL_7:
      v13 = v8 != 0;
      goto LABEL_8;
    }
    +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "systemGroupContainerIdIsWellknown:", v10);
  }
  v12 = v11;

  if ((v12 & 1) == 0)
    goto LABEL_7;
  v13 = 1;
LABEL_8:

  return v13;
}

- (void)_cleanupOprhanedCodeSigningMappingData
{
  char v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v2 = objc_msgSend((id)gCodeSigningMapping, "removeAllAdvanceCopiesWithError:", &v5);
  v3 = v5;
  if ((v2 & 1) == 0)
  {
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "Could not remove advance copies of code sign data: %@", buf, 0xCu);
    }

  }
}

- (void)rebootContainerManagerSetup
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  host_t v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint32_t multiuser_flags;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "isBuildUpgrade"))
  {
    -[MCMClientConnection _regenerateContainerPaths](self, "_regenerateContainerPaths");
    +[MCMContainerMigrator sharedInstance](MCMContainerMigrator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMClientConnection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = objc_msgSend(v4, "performSynchronousBuildUpgradeMigration:context:error:", v3, v5, &v19);
    v7 = v19;

    if ((v6 & 1) == 0)
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        multiuser_flags = 138412290;
        v21 = v7;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to perform build upgrade migration : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

    }
    objc_msgSend(v3, "writeCurrentBuildInfoToDisk");

  }
  v18 = 0;
  v17 = 0;
  v9 = objc_msgSend((id)gCodeSigningMapping, "removeAllInvalidPluginCodeSigningEntriesWithNumRemoved:error:", &v18, &v17);
  v10 = v17;
  if ((v9 & 1) == 0)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      multiuser_flags = 138412290;
      v21 = v10;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to remove invalid plugin codesign entries; error = %@",
        (uint8_t *)&multiuser_flags,
        0xCu);
    }

  }
  v12 = containermanager_copy_global_configuration();
  v13 = objc_msgSend(v12, "dispositionForContainerClass:", 7);

  if (v13 == 1)
  {
    if (v18 > 0
      || (multiuser_flags = 0, v14 = MEMORY[0x1D17D6F20](), !host_get_multiuser_config_flags(v14, &multiuser_flags))
      && (multiuser_flags & 0x80000000) != 0)
    {
      +[MCMGroupManager defaultManager](MCMGroupManager, "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMClientConnection context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reconcileGroupContainersForContainerClass:context:", 7, v16);

    }
  }

}

- (void)_cleanTransientUserContainersWithContainerConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MCMClientConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMClientConnection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentityCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke;
  v8[3] = &unk_1E8CB5330;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v8);

}

- (void)_cleanTransientContainersWithContainerConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "usesGlobalBundleUserIdentity") & 1) != 0
    || objc_msgSend(v4, "usesGlobalSystemUserIdentity"))
  {
    +[MCMContainerClassTransientPath transientGlobalURL](MCMContainerClassTransientPath, "transientGlobalURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "usesGlobalBundleUserIdentity"))
    {
      +[MCMContainerClassTransientPath transientGlobalBundleURL](MCMContainerClassTransientPath, "transientGlobalBundleURL");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    if (v5)
    {
      -[MCMClientConnection context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "containerFactory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v9 = objc_msgSend(v8, "deleteURL:forUserIdentity:error:", v5, 0, &v12);
      v10 = v12;

      if ((v9 & 1) == 0)
      {
        container_log_handle_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v5;
          v15 = 2112;
          v16 = v10;
          _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to delete shared transient bundle URL %@ : %@", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    -[MCMClientConnection _cleanTransientUserContainersWithContainerConfig:](self, "_cleanTransientUserContainersWithContainerConfig:", v4);
  }

}

- (void)rebootContainerManagerCleanupWithCompletion:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  _QWORD block[5];
  _QWORD v35[4];
  id v36;
  MCMClientConnection *v37;
  _QWORD *v38;
  _QWORD v39[6];
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  v45 = (id)os_transaction_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  v43 = 0;
  v5 = containermanager_copy_global_configuration();
  v6 = objc_msgSend(v5, "dispositionForContainerClass:", 1) == 1;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/installd/Library/Caches/com.apple.containermanagerd"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "itemExistsAtURL:", v7);

    if (v9)
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v7;
        _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Sentencing legacy transient bundle directory [%@] to final deletion", buf, 0xCu);
      }

      -[MCMClientConnection context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "containerFactory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v13 = objc_msgSend(v12, "deleteURL:forUserIdentity:error:", v7, 0, &v41);
      v14 = v41;

      if ((v13 & 1) == 0)
      {
        container_log_handle_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v47 = v7;
          v48 = 2112;
          v49 = v14;
          _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Failed to delete legacy shared transient bundle URL %@ : %@", buf, 0x16u);
        }

      }
    }

  }
  v16 = containermanager_copy_global_configuration();
  objc_msgSend(v16, "classIterator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke;
  v40[3] = &unk_1E8CB5588;
  v40[4] = self;
  objc_msgSend(v17, "selectWithIterator:", v40);

  v19 = containermanager_copy_global_configuration();
  LODWORD(v17) = objc_msgSend(v19, "dispositionForContainerClass:", 2) == 1;

  if ((_DWORD)v17)
  {
    -[MCMClientConnection context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userIdentityCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v18;
    v39[1] = 3221225472;
    v39[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2;
    v39[3] = &unk_1E8CB4B78;
    v39[4] = self;
    v39[5] = v42;
    objc_msgSend(v21, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v39);

  }
  -[MCMClientConnection context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "userIdentityCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "defaultUserIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMClientConnection context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "classIterator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  v35[1] = 3221225472;
  v35[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_30;
  v35[3] = &unk_1E8CB4B50;
  v27 = v24;
  v37 = self;
  v38 = v42;
  v36 = v27;
  objc_msgSend(v26, "selectGlobalWithIterator:", v35);

  v28 = MCMSharedBackgroundQueue();
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_32;
  block[3] = &unk_1E8CB6458;
  block[4] = self;
  dispatch_async(v28, block);

  v29 = MCMSharedBackgroundQueue();
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_33;
  v31[3] = &unk_1E8CB4BA0;
  v32 = v4;
  v33 = v44;
  v30 = v4;
  dispatch_async(v29, v31);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

}

- (void)_regenerateContainerPaths
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v3, OS_LOG_TYPE_DEFAULT, "Rolling system container directory UUIDs on disk", buf, 2u);
  }

  -[MCMClientConnection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classIterator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke;
  v6[3] = &unk_1E8CB4BF0;
  v6[4] = self;
  objc_msgSend(v5, "selectAutorollingWithUserIdentityIterator:", v6);

}

- (void)_resumeDeleteOperations
{
  MCMResultPromise *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MCMResultPromise);
  -[MCMClientConnection _commandForResumedDeleteOperationsWithResultPromise:](self, "_commandForResumedDeleteOperationsWithResultPromise:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "execute");
    -[MCMResultPromise result](v3, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during resumed delete; error = %@",
          (uint8_t *)&v9,
          0xCu);
      }

    }
  }

}

- (id)_commandForResumedDeleteOperationsWithResultPromise:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MCMCommandOperationDelete *v12;
  void *v13;
  MCMCommandOperationDelete *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[MCMClientConnection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDeleteManifest deleteManifestsForGlobalContainersWithUserIdentityCache:](MCMDeleteManifest, "deleteManifestsForGlobalContainersWithUserIdentityCache:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v8);

  -[MCMClientConnection context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDeleteManifest deleteManifestsForUserContainersWithUserIdentityCache:](MCMDeleteManifest, "deleteManifestsForUserContainersWithUserIdentityCache:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v11);

  if (objc_msgSend(v5, "count"))
  {
    v12 = [MCMCommandOperationDelete alloc];
    -[MCMClientConnection context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCMCommandOperationDelete initWithManifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:](v12, "initWithManifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:", v5, 0, 0, v13, v4);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __48__MCMClientConnection__regenerateContainerPaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  MCMContainerClassCache *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MCMContainerClassCache *v14;
  MCMContainerClassCache *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MCMContainerClassCache *v19;
  void *v20;
  void *v21;
  MCMContainerClassCache *v22;
  _QWORD v23[5];
  MCMContainerClassCache *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "classPathCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerClassPathForUserIdentity:containerConfig:typeClass:", v5, v6, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [MCMContainerClassCache alloc];
  v11 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentityCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MCMContainerClassCache initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:](v10, "initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:", v9, v11, 0, v13);

  v15 = [MCMContainerClassCache alloc];
  v16 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userIdentityCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MCMContainerClassCache initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:](v15, "initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:", v9, v16, 0, v18);

  -[MCMContainerClassCache waitForSynchronizationToComplete](v14, "waitForSynchronizationToComplete");
  objc_msgSend(*(id *)(a1 + 32), "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "containerCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContainerClassCache:", v19);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2;
  v23[3] = &unk_1E8CB4BC8;
  v23[4] = *(_QWORD *)(a1 + 32);
  v24 = v19;
  v22 = v19;
  -[MCMContainerClassCache enumerateCacheEntriesWithEnumerator:](v14, "enumerateCacheEntriesWithEnumerator:", v23);

}

uint64_t __48__MCMClientConnection__regenerateContainerPaths__block_invoke_2(uint64_t a1, void *a2)
{
  MCMContainerCacheEntry *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  MCMContainerCacheEntry *v9;
  void *v10;
  id v11;
  MCMCommandRegenerateDirectoryUUID *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  MCMContainerCacheEntry *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](v3, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerClassPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containerIdIsWellknown:class:", v5, objc_msgSend(v7, "containerClass"));

  v9 = v3;
  if ((v8 & 1) == 0)
  {
    v34 = 0;
    -[MCMContainerCacheEntry metadataWithError:](v3, "metadataWithError:", &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;
    if (v10)
    {
      v12 = [MCMCommandRegenerateDirectoryUUID alloc];
      objc_msgSend(v10, "containerIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MCMCommandRegenerateDirectoryUUID initWithConcreteContainerIdentity:context:resultPromise:](v12, "initWithConcreteContainerIdentity:context:resultPromise:", v13, v14, 0);

      v33 = v11;
      -[NSObject regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:](v15, "regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:", v10, &v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v33;

      if (v16)
      {
        v18 = [MCMContainerCacheEntry alloc];
        objc_msgSend(*(id *)(a1 + 32), "context");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject userIdentityCache](v19, "userIdentityCache");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[MCMContainerCacheEntry initWithMetadata:userIdentityCache:](v18, "initWithMetadata:userIdentityCache:", v16, v20);

      }
      else
      {
        container_log_handle_for_category();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[MCMContainerCacheEntry identifier](v3, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMContainerCacheEntry containerPath](v3, "containerPath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "containerClassPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "containerClass");
          *(_DWORD *)buf = 138412802;
          v36 = v29;
          v37 = 2048;
          v38 = v32;
          v39 = 2112;
          v40 = v17;
          _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to regenerate directory UUID for identifier: %@, class: %llu, error = %@", buf, 0x20u);

        }
        v9 = v3;
      }

    }
    else
    {
      container_log_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[MCMContainerCacheEntry identifier](v3, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMContainerCacheEntry containerPath](v3, "containerPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "containerClassPath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containerClass");
        *(_DWORD *)buf = 138412802;
        v36 = v25;
        v37 = 2048;
        v38 = v28;
        v39 = 2112;
        v40 = v11;
        _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Failed to regenerate directory UUID (couldn't read metadata) for identifier: %@, class: %llu; error = %@",
          buf,
          0x20u);

      }
      v17 = v11;
      v9 = v3;
    }

  }
  v21 = *(void **)(a1 + 40);
  -[MCMContainerCacheEntry identifier](v9, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "setCacheEntry:forIdentifier:", v9, v22);

  return 1;
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "cleanTransientsEachBoot"))
    objc_msgSend(*(id *)(a1 + 32), "_cleanTransientContainersWithContainerConfig:", v3);

}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  __int128 v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "homeDirectoryExists"))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "classIterator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3;
    v7[3] = &unk_1E8CB4B50;
    v8 = v3;
    v9 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "selectUserWithIterator:", v7);

    v6 = v8;
  }
  else
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_debug_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEBUG, "Skipping orphan cleanup of data containers since home directory doesn't exist for %@", buf, 0xCu);
    }
  }

}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_30(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id obj;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "classPathCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerClassPathForUserIdentity:containerConfig:typeClass:", a1[4], v3, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "urlsForItemsInDirectoryAtURL:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    objc_msgSend(v6, "setExists:", 1);
    v11 = MCMSharedBackgroundQueue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_31;
    v16[3] = &unk_1E8CB5E98;
    v16[4] = a1[5];
    v17 = v10;
    v18 = v3;
    dispatch_async(v11, v16);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "code");

      if (v13 == 2)
        goto LABEL_10;
    }
    else
    {

    }
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to get items : %@", buf, 0xCu);
    }

  }
LABEL_10:

}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupOprhanedCodeSigningMappingData");
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_33(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_2_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupOrphanedDataForDirectories:containerClass:forUserIdentity:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "containerClass"), 0);
}

void __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id obj;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "classPathCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerClassPathForUserIdentity:containerConfig:typeClass:", *(_QWORD *)(a1 + 32), v3, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "urlsForItemsInDirectoryAtURL:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    objc_msgSend(v6, "setExists:", 1);
    v11 = MCMSharedBackgroundQueue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4;
    block[3] = &unk_1E8CB5538;
    block[4] = *(_QWORD *)(a1 + 40);
    v19 = v10;
    v20 = v3;
    v21 = *(id *)(a1 + 32);
    dispatch_async(v11, block);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code");

      if (v13 == 2)
        goto LABEL_10;
    }
    else
    {

    }
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = objc_msgSend(v3, "containerClass");
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Skipping orphan cleanup of data containers for %@, %llu; error = %@",
        buf,
        0x20u);
    }

  }
LABEL_10:

}

uint64_t __67__MCMClientConnection_rebootContainerManagerCleanupWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupOrphanedDataForDirectories:containerClass:forUserIdentity:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "containerClass"), *(_QWORD *)(a1 + 56));
}

void __72__MCMClientConnection__cleanTransientUserContainersWithContainerConfig___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (-[NSObject homeDirectoryExists](v3, "homeDirectoryExists"))
  {
    +[MCMContainerClassTransientPath transientURLWithUserIdentity:withContainerClass:](MCMContainerClassTransientPath, "transientURLWithUserIdentity:withContainerClass:", v3, objc_msgSend(*(id *)(a1 + 32), "containerClass"));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "deleteURL:forUserIdentity:error:", v4, v3, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v8;
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to delete per-user transient URL %@ : %@", buf, 0x16u);
      }

    }
  }
  else
  {
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_debug_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEBUG, "Skipping cleanup of transient data containers since home directory doesn't exist for %@", buf, 0xCu);
    }
  }

}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  id obj;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 138412546;
    v19 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "context", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "containerFactory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v15 = objc_msgSend(v14, "deleteURL:forUserIdentity:error:", v12, v6, &v21);
        v16 = v21;

        if ((v15 & 1) == 0)
        {
          container_log_handle_for_category();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v23 = v18;
            v24 = 2112;
            v25 = v16;
            _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Failed to delete [%@]; error = %@",
              buf,
              0x16u);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v9);
  }

}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  NSObject *v17;
  id obj;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MCMContainerClassStagingPath stagingURLWithUserIdentity:](MCMContainerClassStagingPath, "stagingURLWithUserIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "urlsForItemsInDirectoryAtURL:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    v8 = MCMSharedBackgroundQueue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11;
    v14[3] = &unk_1E8CB60C8;
    v17 = *(id *)(a1 + 32);
    v15 = v7;
    v16 = v3;
    dispatch_async(v8, v14);

    v9 = v17;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "code");

      if (v11 == 2)
        goto LABEL_10;
    }
    else
    {

    }
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to get items at per-user staging URL: %@ : %@", buf, 0x16u);

    }
  }

LABEL_10:
}

void __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_2_13(uint64_t a1)
{
  MCMResultPromise *v2;
  MCMResultPromise *v3;
  MCMCommandOperationReclaimDiskSpace *v4;
  void *v5;
  MCMCommandOperationReclaimDiskSpace *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = [MCMResultPromise alloc];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3;
  v10 = &unk_1E8CB4B28;
  v11 = *(id *)(a1 + 40);
  v3 = -[MCMResultPromise initWithCompletion:](v2, "initWithCompletion:", &v7);
  v4 = [MCMCommandOperationReclaimDiskSpace alloc];
  objc_msgSend(*(id *)(a1 + 32), "context", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:](v4, "initWithAsynchronously:context:resultPromise:", 1, v5, v3);

  -[MCMCommandOperationReclaimDiskSpace execute](v6, "execute");
}

id __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  return v3;
}

uint64_t __61__MCMClientConnection_containerManagerCleanupWithCompletion___block_invoke_11(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)sharedClientConnection
{
  if (sharedClientConnection_onceToken != -1)
    dispatch_once(&sharedClientConnection_onceToken, &__block_literal_global_877);
  return (id)sharedClientConnection_sharedConnection;
}

+ (id)privilegedClientConnectionWithUserIdentity:(id)a3
{
  return (id)objc_msgSend(a1, "privilegedClientConnectionWithUserIdentity:kernel:", a3, 0);
}

void __45__MCMClientConnection_sharedClientConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedClientConnection_sharedConnection;
  sharedClientConnection_sharedConnection = v0;

}

@end
