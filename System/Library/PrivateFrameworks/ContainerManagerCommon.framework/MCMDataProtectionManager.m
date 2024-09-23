@implementation MCMDataProtectionManager

- (MCMDataProtectionManager)init
{
  MCMDataProtectionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *protectionOperationFileQueue;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MCMDataProtectionManager;
  v2 = -[MCMDataProtectionManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MobileContainerManager.ProtectionOperationFileQueue", v3);
    protectionOperationFileQueue = v2->_protectionOperationFileQueue;
    v2->_protectionOperationFileQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_startDataProtectionChangeOperation:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  MCMApplicationTerminationAssertion *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  id v22;
  int v23;
  char v24;
  _QWORD v25[5];
  id v26;
  id location;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8133;
  v32 = __Block_byref_object_dispose__8134;
  v33 = 0;
  objc_msgSend(v5, "dataContainerMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  LODWORD(v7) = objc_msgSend(v5, "newDataProtectionClass");
  v8 = objc_msgSend(v5, "retryIfLocked");
  v9 = [MCMApplicationTerminationAssertion alloc];
  v10 = objc_loadWeakRetained(&location);
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMApplicationTerminationAssertion initWithBundleIdentifier:reason:](v9, "initWithBundleIdentifier:reason:", v11, CFSTR("preventing app launch during container data protection class change"));
  v13 = (void *)v29[5];
  v29[5] = v12;

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke;
  v25[3] = &unk_1E8CB5CB8;
  v25[4] = &v28;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v5, "setRetryStartBlock:", v25);
  v16 = v14;
  v17 = 3221225472;
  v18 = __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2;
  v19 = &unk_1E8CB5CE0;
  objc_copyWeak(&v22, &location);
  v23 = (int)v7;
  v24 = v8;
  v21 = &v28;
  v15 = v6;
  v20 = v15;
  objc_msgSend(v5, "setCompletionBlock:", &v16);
  objc_msgSend(v5, "performChangeOperation", v16, v17, v18, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);

}

- (void)restartPendingDataProtectionOperations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  MCMDataProtectionManager *v42;
  uint64_t v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  _BYTE v50[24];
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "managedPathRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerPendingUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v7, "urlsForItemsInDirectoryAtURL:error:", v6, &v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v48;

    if (v8)
    {
      v38 = v9;
      v39 = v6;
      v40 = v5;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v10 = v8;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v55;
        v14 = 0x1ED8FF000uLL;
        v41 = *(_QWORD *)v55;
        v42 = self;
        do
        {
          v15 = 0;
          v43 = v12;
          do
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
            container_log_handle_for_category();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v50 = v18;
              _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "Found pending data protection operation at %@", buf, 0xCu);

            }
            -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            objc_msgSend((id)(v14 + 664), "dataProtectionChangeOperationAtURL:queue:error:", v16, v19, &v47);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v47;

            if (v20)
            {
              container_log_handle_for_category();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = objc_msgSend(v20, "newDataProtectionClass");
                objc_msgSend(v20, "dataContainerMetadata");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "userIdentity");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "dataContainerMetadata");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "dataContainerMetadata");
                v27 = v21;
                v28 = v10;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "containerClass");
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v50 = v23;
                v12 = v43;
                *(_WORD *)&v50[4] = 2112;
                *(_QWORD *)&v50[6] = v24;
                *(_WORD *)&v50[14] = 2112;
                *(_QWORD *)&v50[16] = v26;
                v51 = 2048;
                v52 = v30;
                _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "Starting pending data protection update to protection class %d for user: %@, ID: %@, containerClass: %llu", buf, 0x26u);

                v10 = v28;
                v21 = v27;

                self = v42;
                v13 = v41;

                v14 = 0x1ED8FF000;
              }

              v31 = MCMDataProtectionQueue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke;
              block[3] = &unk_1E8CB6318;
              block[4] = self;
              v46 = v20;
              dispatch_async(v31, block);

            }
            else
            {
              container_log_handle_for_category();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v16, "path");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v50 = v33;
                *(_WORD *)&v50[8] = 2112;
                *(_QWORD *)&v50[10] = v21;
                _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Failed to read data protection change operation at %@ : %@", buf, 0x16u);

              }
            }

            ++v15;
          }
          while (v12 != v15);
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
        }
        while (v12);
      }

      v6 = v39;
      v5 = v40;
      v9 = v38;
    }
    else
    {
      objc_msgSend(v9, "domain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      {
        v35 = objc_msgSend(v9, "code");

        if (v35 == 2)
          goto LABEL_30;
      }
      else
      {

      }
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "url");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v50 = v37;
        *(_WORD *)&v50[8] = 2112;
        *(_QWORD *)&v50[10] = v9;
        _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Failed to get items at pendingUpdates URL %@ : %@", buf, 0x16u);

      }
    }
  }
  else
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    v9 = 0;
  }

LABEL_30:
}

- (void)setDataProtectionOnDataContainerForMetadata:(id)a3 isSecondOrThirdPartyApp:(BOOL)a4 retryIfLocked:(BOOL)a5 deferUntilNextLaunch:(BOOL)a6 withCompletion:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v11;
  void (**v12)(id, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  void *v31;
  int64_t v32;
  NSObject *v33;
  int v34;
  void *v35;
  uint64_t v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  id v44;
  _QWORD block[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  _BYTE v53[10];
  uint64_t v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v43 = a6;
  v8 = a5;
  v9 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, uint64_t))a7;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  v13 = objc_msgSend(v11, "dataProtectionClass");
  v14 = objc_msgSend(v11, "containerClass");
  if (v14 > 0xB || ((1 << v14) & 0xED4) == 0 || (v15 = objc_msgSend(v11, "containerClass"), v15 == 13) || v15 == 7)
  {
    v49[3] = 11;
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      v17 = 0;
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v53 = v11;
    v27 = "Can't act on an invalid object: %@";
    goto LABEL_21;
  }
  objc_msgSend(v11, "containerPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "containerClassPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "supportsDataProtection");

  if ((v20 & 1) == 0)
  {
    v49[3] = 72;
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v26 = objc_msgSend(v11, "containerClass");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v53 = v26;
    v27 = "Data protection not supported for containers of class [%llu]";
LABEL_21:
    v28 = v16;
    v29 = 12;
LABEL_22:
    _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_6;
  }
  objc_msgSend(v11, "info");
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v11, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.ContentProtectionClass"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    if (v25)
      v21 = objc_msgSend(v25, "intValue");
    else
      v21 = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[MCMFileHandle compareDataProtectionClassTarget:withExisting:](MCMFileHandle, "compareDataProtectionClassTarget:withExisting:", v30, v31);

  if (v32 == 3)
  {
    -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke;
    block[3] = &unk_1E8CB5D08;
    v46 = v11;
    v47 = &v48;
    dispatch_sync(v33, block);

    if (v12 && v49[3] == 1)
      v12[2](v12, 1);
    v17 = 0;
    v16 = v46;
  }
  else
  {
    if (!v32)
    {
      v49[3] = 72;
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v53 = v21;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v13;
      v27 = "Unable to determine precedence of data protection; desired = %d, original = %d";
      v28 = v16;
      v29 = 14;
      goto LABEL_22;
    }
    if ((_DWORD)v21 == 2)
    {
      v49[3] = 38;
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = 2;
      v27 = "Data protection class %d is not allowed";
      goto LABEL_36;
    }
    if (v9 && (v21 > 7 || ((1 << v21) & 0x8B) == 0))
    {
      v49[3] = 38;
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v53 = v21;
      v27 = "Data protection class %d is invalid for 2nd and 3rd party apps";
LABEL_36:
      v28 = v16;
      v29 = 8;
      goto LABEL_22;
    }
    v34 = v21;
    -[MCMDataProtectionManager protectionOperationFileQueue](self, "protectionOperationFileQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 == 1)
      v36 = 7;
    else
      v36 = 1;
    +[MCMDataProtectionChangeOperation dataProtectionChangeOperationWithContainerMetadata:settingClass:retryingIfLocked:changeType:queue:](MCMDataProtectionChangeOperation, "dataProtectionChangeOperationWithContainerMetadata:settingClass:retryingIfLocked:changeType:queue:", v11, v21, v8, v36, v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0;
    v37 = objc_msgSend(v17, "writeToDiskWithError:", &v44);
    v38 = v44;
    v16 = v38;
    if ((v37 & 1) != 0)
    {
      if (!v43)
      {
        -[MCMDataProtectionManager _startDataProtectionChangeOperation:withCompletion:](self, "_startDataProtectionChangeOperation:withCompletion:", v17, v12);
        goto LABEL_7;
      }
      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v11, "containerClass");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)v53 = v40;
        *(_WORD *)&v53[8] = 2048;
        v54 = v41;
        v55 = 1024;
        v56 = v13;
        v57 = 1024;
        v58 = v34;
        _os_log_impl(&dword_1CF807000, v39, OS_LOG_TYPE_DEFAULT, "Wrote DP class update operation for [%@(%llu)] %d → %d, deferred until next daemon launch.", buf, 0x22u);

      }
    }
    else
    {
      v42 = -[NSObject type](v38, "type");
      v49[3] = v42;
      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v53 = v16;
        _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Failed to write data protection update file to disk: %@", buf, 0xCu);
      }
    }

  }
LABEL_7:

  if (v12 && v49[3] != 1)
    ((void (*)(void (**)(id, uint64_t)))v12[2])(v12);

  _Block_object_dispose(&v48, 8);
}

- (int)intendedDataProtectionClassBasedOnEntitlementsForIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 info:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = 0;
  if (a5 <= 0xB && ((1 << a5) & 0xE54) != 0)
  {
    objc_msgSend(v10, "codeSignInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "isEqualToString:", v14);

    if (v15)
    {
      objc_msgSend(v10, "codeSignInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entitlements");
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v11 && (objc_msgSend(v10, "isKernel") & 1) == 0)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.ContentProtectionClass"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v19 = v18;
        v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;

        if (v17)
        {
          v20 = objc_msgSend(v17, "intValue");
LABEL_15:
          v12 = v20;

          goto LABEL_16;
        }
      }
      objc_msgSend((id)gCodeSigningMapping, "entitlementsForIdentifier:", v9);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v12 = 0;
        goto LABEL_16;
      }
      v17 = (id)v21;
    }
    v20 = objc_msgSend(v17, "intendedDataProtectionClass");
    goto LABEL_15;
  }
LABEL_16:

  return v12;
}

- (int)desiredDataProtectionClassForMetadata:(id)a3 clientIdentity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerClassPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsDataProtection");

  if (v9)
  {
    +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "containerClass");
    objc_msgSend(v5, "info");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "intendedDataProtectionClassBasedOnEntitlementsForIdentifier:clientIdentity:containerClass:info:", v11, v6, v12, v13);

  }
  else
  {
    v14 = -1;
  }

  return v14;
}

- (OS_dispatch_queue)protectionOperationFileQueue
{
  return self->_protectionOperationFileQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionOperationFileQueue, 0);
}

void __146__MCMDataProtectionManager_setDataProtectionOnDataContainerForMetadata_isSecondOrThirdPartyApp_retryIfLocked_deferUntilNextLaunch_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:error:](MCMDataProtectionChangeOperation, "deleteUpdateFileWithContainerIdentity:error:", v2, &v6);
  v4 = v6;

  if (!v3)
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "Failed to delete existing data protection update file: %@", buf, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "type");
  }

}

uint64_t __66__MCMDataProtectionManager_restartPendingDataProtectionOperations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDataProtectionChangeOperation:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  MCMApplicationTerminationAssertion *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
    objc_msgSend(v2, "invalidate");
  v3 = [MCMApplicationTerminationAssertion alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMApplicationTerminationAssertion initWithBundleIdentifier:reason:](v3, "initWithBundleIdentifier:reason:", v4, CFSTR("preventing app launch during container data protection class change"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __79__MCMDataProtectionManager__startDataProtectionChangeOperation_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "containerPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerDataURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_DWORD *)(a1 + 56);
      v16 = 138413058;
      v17 = v11;
      v18 = 2112;
      v19 = v14;
      v20 = 1024;
      v21 = v15;
      v22 = 2112;
      v23 = v3;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Failed to set data protection on container with identifier %@ at %@ to %d: %@", (uint8_t *)&v16, 0x26u);

    }
    if (v5 == 61)
    {
      if (*(_BYTE *)(a1 + 60))
      {
        container_log_handle_for_category();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Unexpectedly got completion block called while locked", (uint8_t *)&v16, 2u);
        }

      }
      v5 = 61;
    }
  }
  else
  {
    v5 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v5);

}

+ (id)defaultManager
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__MCMDataProtectionManager_defaultManager__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, v3);
  return (id)defaultManager_defaultManager;
}

void __42__MCMDataProtectionManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

@end
