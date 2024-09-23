@implementation MCMDataProtectionChangeOperation

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 internalChangeID:(id)a7 queue:(id)a8 userIdentityCache:(id)a9
{
  id v16;
  id v17;
  MCMDataProtectionChangeOperation *v18;
  MCMDataProtectionChangeOperation *v19;
  void **p_internalChangeID;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MCMDataProtectionChangeOperation;
  v18 = -[MCMDataProtectionChangeOperation init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataContainerMetadata, a3);
    v19->_retryIfLocked = a5;
    p_internalChangeID = (void **)&v19->_internalChangeID;
    v19->_newDataProtectionClass = a4;
    v19->_changeType = a6;
    objc_storeStrong((id *)&v19->_internalChangeID, a7);
    objc_storeStrong((id *)&v19->_queue, a8);
    objc_storeStrong((id *)&v19->_userIdentityCache, a9);
    if (!v19->_internalChangeID)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *p_internalChangeID;
      *p_internalChangeID = (void *)v21;

    }
  }

  return v19;
}

- (MCMDataProtectionChangeOperation)initWithContainerMetadata:(id)a3 newClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7 userIdentityCache:(id)a8
{
  return -[MCMDataProtectionChangeOperation initWithContainerMetadata:newClass:retryingIfLocked:changeType:internalChangeID:queue:userIdentityCache:](self, "initWithContainerMetadata:newClass:retryingIfLocked:changeType:internalChangeID:queue:userIdentityCache:", a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, 0, a7, a8);
}

- (BOOL)_onQueue_writeToDiskWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  MCMError *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[6];
  _QWORD v43[6];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5, v7 = -[MCMDataProtectionChangeOperation changeType](self, "changeType"), v6, !v7))
  {
    v30 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 38, 3);
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v36;
      v46 = 1024;
      v47 = -[MCMDataProtectionChangeOperation changeType](self, "changeType");
      _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Invalid Update Info: metadata: %@, changeType: %u", buf, 0x12u);

    }
    v24 = 0;
    v17 = 0;
    v27 = 0;
    goto LABEL_19;
  }
  v37 = a3;
  v42[0] = CFSTR("MCMDataOperationIdentifier");
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  v42[1] = CFSTR("MCMDataOperationContainerClass");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "containerClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v10;
  v42[2] = CFSTR("MCMDataOperationProtectionClass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v11;
  v42[3] = CFSTR("MCMDataOperationChangeType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MCMDataProtectionChangeOperation changeType](self, "changeType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v12;
  v42[4] = CFSTR("MCMDataOperationRetryIfLocked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMDataProtectionChangeOperation retryIfLocked](self, "retryIfLocked"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v13;
  v42[5] = CFSTR("MCMDataOperationInternalID");
  -[MCMDataProtectionChangeOperation internalChangeID](self, "internalChangeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", objc_msgSend(v18, "containerClass"));

  if ((_DWORD)v14)
  {
    -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "plist");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("MCMDataOperationUserIdentity"));

  }
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "containerIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:](MCMDataProtectionChangeOperation, "urlForProtectionOperationWithContainerIdentity:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v30 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 84, 1);
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    v24 = 0;
    v27 = 0;
    goto LABEL_18;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v26 = objc_msgSend(v25, "removeItemAtURL:error:", v24, &v41);
  v27 = v41;

  if ((v26 & 1) != 0)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend((id)v28, "dataWritingOptionsForFileAtURL:", v24);

    v40 = 0;
    LOBYTE(v28) = objc_msgSend(v17, "MCM_writeToURL:withOptions:error:", v24, v29, &v40);
    v27 = v40;
    if ((v28 & 1) != 0)
    {
      v30 = 0;
      v31 = 1;
      goto LABEL_22;
    }
    v30 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v27, v24, 85);
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    objc_msgSend(v24, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    v34 = "Failed to write data protection update dictionary to URL %@";
    goto LABEL_24;
  }
  v30 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v27, v24, 36);
  container_log_handle_for_category();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v24, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    v34 = "Failed to remove pending data protection file at %@";
LABEL_24:
    _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);

  }
LABEL_18:
  a3 = v37;
LABEL_19:

  if (a3)
  {
    v30 = objc_retainAutorelease(v30);
    v31 = 0;
    *a3 = v30;
  }
  else
  {
    v31 = 0;
  }
LABEL_22:

  return v31;
}

- (BOOL)writeToDiskWithError:(id *)a3
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
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke;
  v7[3] = &unk_1E8CB5C68;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_onQueue_stillMostCurrentUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:](MCMDataProtectionChangeOperation, "urlForProtectionOperationWithContainerIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    goto LABEL_9;
  }
  -[MCMDataProtectionChangeOperation userIdentityCache](self, "userIdentityCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:](MCMDataProtectionChangeOperation, "_readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:", v5, v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (!v7)
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to read data protection update from %@; error = %@",
        buf,
        0x16u);

    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MCMDataOperationInternalID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

  -[MCMDataProtectionChangeOperation internalChangeID](self, "internalChangeID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v11);

LABEL_10:
  return v13;
}

- (BOOL)_stillMostCurrentUpdate
{
  MCMDataProtectionChangeOperation *v2;
  NSObject *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v2 = self;
  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke;
  block[3] = &unk_1E8CB5D08;
  block[4] = v2;
  block[5] = &v6;
  dispatch_sync(v3, block);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_onQueue_deleteUpdateFileWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[MCMDataProtectionChangeOperation _onQueue_stillMostCurrentUpdate](self, "_onQueue_stillMostCurrentUpdate"))
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2048;
      v23 = objc_msgSend(v15, "containerClass");
      _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Nothing to delete because there is a newer update for user: %@, id: %@, containerClass: %llu", buf, 0x20u);

    }
    v8 = 0;
    goto LABEL_8;
  }
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v7 = +[MCMDataProtectionChangeOperation deleteUpdateFileWithContainerIdentity:error:](MCMDataProtectionChangeOperation, "deleteUpdateFileWithContainerIdentity:error:", v6, &v17);
  v8 = v17;

  if (v7)
  {
LABEL_8:
    v9 = 1;
    goto LABEL_9;
  }
  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v9 = 0;
    *a3 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_9:

  return v9;
}

- (BOOL)_deleteUpdateFileWithError:(id *)a3
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
  -[MCMDataProtectionChangeOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke;
  v7[3] = &unk_1E8CB5C68;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  dispatch_sync(v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_runChangeOperationNeedToRetry:(BOOL *)a3 error:(id *)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  BOOL v37;
  BOOL v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  MCMError *v47;
  void *v48;
  const char *v49;
  MCMError *v50;
  void *v51;
  NSObject *v52;
  MCMError *v54;
  void *v55;
  MCMError *v56;
  void *v57;
  char v60;
  NSObject *v61;
  id obj;
  id v63;
  _QWORD block[7];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__8027;
  v75 = __Block_byref_object_dispose__8028;
  v76 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__8027;
  v69 = __Block_byref_object_dispose__8028;
  v70 = 0;
  v5 = MCMSharedFastWorkloop();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke;
  block[3] = &unk_1E8CB5C90;
  block[4] = self;
  block[5] = &v71;
  block[6] = &v65;
  dispatch_async_and_wait(v5, block);

  if (!v66[5])
  {
    container_log_handle_for_category();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "userIdentity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "containerClass");
      v46 = v72[5];
      *(_DWORD *)buf = 138413058;
      v88 = v41;
      v89 = 2112;
      v90 = v43;
      v91 = 2048;
      v92 = v45;
      v93 = 2112;
      v94 = v46;
      _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Failed to lookup container to set data protection for user identity: %@, identifier: %@, Class: %llu; %@",
        buf,
        0x2Au);

    }
LABEL_39:
    v52 = 0;
    obj = 0;
LABEL_40:

    v38 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v72[5]);
    v61 = v52;
    goto LABEL_43;
  }
  -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v66[5], "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v47 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);
    v48 = (void *)v72[5];
    v72[5] = (uint64_t)v47;

    container_log_handle_for_category();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v49 = "Cancelling data protection operation because container path changed on disk. This indicates the app may have b"
          "een updated and changed its protection level.";
LABEL_48:
    _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, v49, buf, 2u);
    goto LABEL_39;
  }
  if (!-[MCMDataProtectionChangeOperation _stillMostCurrentUpdate](self, "_stillMostCurrentUpdate"))
  {
    v50 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 69);
    v51 = (void *)v72[5];
    v72[5] = (uint64_t)v50;

    container_log_handle_for_category();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v49 = "Cancelling data protection operation because another more current operation on this container has taken precedence";
    goto LABEL_48;
  }
  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "appUserDataItemNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v84 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "containerPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "containerDataURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v16, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v12, "addObject:", v20);
        }
        else
        {
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v16;
            _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "itemURL is nil for item: %@", buf, 0xCu);
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
    }
    while (v13);
  }

  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "waitOnLock:", 10);

  v60 = -[MCMDataProtectionChangeOperation changeType](self, "changeType");
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v23 = v12;
  v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
  v61 = v23;
  if (!v24)
    goto LABEL_33;
  v25 = *(_QWORD *)v79;
  v26 = *MEMORY[0x1E0CB2FE0];
  while (2)
  {
    for (j = 0; j != v24; ++j)
    {
      if (*(_QWORD *)v79 != v25)
        objc_enumerationMutation(v61);
      v28 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      v63 = 0;
      v31 = objc_msgSend(v29, "setDataProtectionAtURL:toDataProtectionClass:directoriesOnly:recursive:error:", v28, v30, (v60 & 2) == 0, 1, &v63);
      v32 = v63;

      if ((v31 & 1) == 0)
      {
        objc_msgSend(v32, "domain");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isEqualToString:", v26))
        {
          v34 = objc_msgSend(v32, "code") == 1;

          if (v34)
          {
            v56 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v32, v28, 61);
            v57 = (void *)v72[5];
            v72[5] = (uint64_t)v56;

            *a3 = 1;
            goto LABEL_46;
          }
        }
        else
        {

        }
        objc_msgSend(v32, "domain");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "isEqualToString:", v26) && objc_msgSend(v32, "code") == 2)
        {

        }
        else
        {
          objc_msgSend(v32, "domain");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v36, "isEqualToString:", v26) & 1) == 0)
          {

LABEL_45:
            v54 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v32, v28, 152);
            v55 = (void *)v72[5];
            v72[5] = (uint64_t)v54;

LABEL_46:
            v39 = v61;
            v52 = v61;
            goto LABEL_40;
          }
          v37 = objc_msgSend(v32, "code") == 9;

          if (!v37)
            goto LABEL_45;
        }
      }

    }
    v23 = v61;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
    if (v24)
      continue;
    break;
  }
LABEL_33:

  v38 = 1;
LABEL_43:
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  return v38;
}

- (void)performChangeOperation
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  NSObject *v24;
  dispatch_time_t v25;
  _QWORD *v26;
  NSObject *v27;
  BOOL v28;
  id v29;
  NSObject *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int v46;
  id v47;
  _QWORD v48[5];
  id v49;
  char v50;
  _BYTE buf[40];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v50 = 0;
  v49 = 0;
  v3 = -[MCMDataProtectionChangeOperation _runChangeOperationNeedToRetry:error:](self, "_runChangeOperationNeedToRetry:error:", &v50, &v49);
  v4 = v49;
  if (!v3)
  {
    v50 = 0;
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containerClass");
      v12 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v11;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v12;
      *(_WORD *)&buf[38] = 2112;
      v52 = v4;
      _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Operation to update protection classes for user: %@, id: %@, containerClass: %llu to class %d failed with error %@", buf, 0x30u);

    }
  }
  if (v50)
  {
    if (-[MCMDataProtectionChangeOperation retryIfLocked](self, "retryIfLocked"))
    {
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containerClass");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v14;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v16;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v18;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v20;
        _os_log_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEFAULT, "Retrying container protection update to %d on next unlock for user: %@, id: %@, containerClass: %llu", buf, 0x26u);

      }
      v21 = MEMORY[0x1E0C809B0];
      v22 = (void *)gLockStateQueue;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke;
      v48[3] = &unk_1E8CB6458;
      v48[4] = self;
      v23 = v48;
      v24 = v22;
      MEMORY[0x1D17D7868]();
      v25 = dispatch_time(0, 10000000000);
      *(_QWORD *)buf = v21;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __MCMRunTransactionalTaskWithDelay_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E8CB65B0;
      *(_QWORD *)&buf[32] = v23;
      v26 = v23;
      dispatch_after(v25, v24, buf);

      goto LABEL_21;
    }
    if (v50)
    {
      container_log_handle_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "userIdentity");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "containerClass");
        v46 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v45;
        *(_WORD *)&buf[32] = 1024;
        *(_DWORD *)&buf[34] = v46;
        _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Tried to update user: %@, id: %@, containerClass: %llu to protection class %d, but was locked and didn't retry", buf, 0x26u);

      }
    }
  }
  v47 = v4;
  v28 = -[MCMDataProtectionChangeOperation _deleteUpdateFileWithError:](self, "_deleteUpdateFileWithError:", &v47);
  v29 = v47;

  if (!v28)
  {
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "userIdentity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDataProtectionChangeOperation dataContainerMetadata](self, "dataContainerMetadata");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "containerClass");
      v39 = -[MCMDataProtectionChangeOperation newDataProtectionClass](self, "newDataProtectionClass");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v38;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v39;
      _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to delete update file for user: %@, id: %@, containerClass: %llu, protection class %d", buf, 0x26u);

    }
  }
  -[MCMDataProtectionChangeOperation completionBlock](self, "completionBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MCMDataProtectionChangeOperation completionBlock](self, "completionBlock");
    v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v32)[2](v32, v29);

  }
  v4 = v29;
LABEL_21:

}

- (MCMMetadata)dataContainerMetadata
{
  return self->_dataContainerMetadata;
}

- (void)setDataContainerMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainerMetadata, a3);
}

- (int)newDataProtectionClass
{
  return self->_newDataProtectionClass;
}

- (void)setNewDataProtectionClass:(int)a3
{
  self->_newDataProtectionClass = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (void)setRetryIfLocked:(BOOL)a3
{
  self->_retryIfLocked = a3;
}

- (id)retryStartBlock
{
  return self->_retryStartBlock;
}

- (void)setRetryStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)retried
{
  return self->_retried;
}

- (void)setRetried:(BOOL)a3
{
  self->_retried = a3;
}

- (NSUUID)internalChangeID
{
  return self->_internalChangeID;
}

- (void)setInternalChangeID:(id)a3
{
  objc_storeStrong((id *)&self->_internalChangeID, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_internalChangeID, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_retryStartBlock, 0);
  objc_storeStrong((id *)&self->_dataContainerMetadata, 0);
}

uint64_t __58__MCMDataProtectionChangeOperation_performChangeOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  if ((objc_msgSend(*(id *)(a1 + 32), "retried") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "retryStartBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "retryStartBlock");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setRetried:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "performChangeOperation");
}

void __73__MCMDataProtectionChangeOperation__runChangeOperationNeedToRetry_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  +[MCMCommandContext privileged](MCMCommandContext, "privileged");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataContainerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj[0] = *(id *)(v6 + 40);
  objc_msgSend(v3, "entryForContainerIdentity:error:", v5, obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj[0]);

  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(id *)(v8 + 40);
    objc_msgSend(v7, "metadataWithError:", &v12);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v12);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

uint64_t __63__MCMDataProtectionChangeOperation__deleteUpdateFileWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_deleteUpdateFileWithError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__MCMDataProtectionChangeOperation__stillMostCurrentUpdate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_stillMostCurrentUpdate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__MCMDataProtectionChangeOperation_writeToDiskWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeToDiskWithError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)dataProtectionChangeOperationWithContainerMetadata:(id)a3 settingClass:(int)a4 retryingIfLocked:(BOOL)a5 changeType:(int)a6 queue:(id)a7
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v7 = *(_QWORD *)&a6;
  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v11 = a7;
  v12 = a3;
  v13 = objc_alloc((Class)objc_opt_class());
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithContainerMetadata:newClass:retryingIfLocked:changeType:queue:userIdentityCache:", v12, v9, v8, v7, v11, v14);

  return v15;
}

+ (id)dataProtectionChangeOperationAtURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  MCMError *v33;
  id v34;
  MCMError *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t error_description;
  void *v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  unsigned int v54;
  void *v55;
  unsigned int v56;
  id v57;
  id v58;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint8_t buf[4];
  _BYTE v69[24];
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = a4;
  v67 = 1;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v8 = objc_claimAutoreleasedReturnValue();
  v66 = 0;
  +[MCMDataProtectionChangeOperation _readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:](MCMDataProtectionChangeOperation, "_readAndValidateDataProtectionUpdateAtURL:userIdentityCache:error:", v7, v8, &v66);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v66;
  v60 = (void *)v8;
  if (!v9)
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v69 = v38;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to read data protection update at %@", buf, 0xCu);

    }
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v62 = 0;
    v63 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserIdentity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    +[MCMUserIdentityCache defaultUserIdentity](MCMUserIdentityCache, "defaultUserIdentity");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v13;

  v63 = v20;
  +[MCMClientConnection privilegedClientConnectionWithUserIdentity:](MCMClientConnection, "privilegedClientConnectionWithUserIdentity:", v20);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationContainerClass"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedLongLongValue");

  v23 = containermanager_copy_global_configuration();
  objc_msgSend(v23, "staticConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configForContainerClass:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v32 = v7;
    v33 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 20, 3);

    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v69 = v22;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Container class [%llu] in operation undefined.", buf, 0xCu);
    }
    v15 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v15, "supportedOnPlatform") & 1) == 0)
  {
    v32 = v7;
    v33 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 72, 3);

    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v69 = v22;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Container class [%llu] in operation unsupported.", buf, 0xCu);
    }
LABEL_20:
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v10 = v33;
    v7 = v32;
    goto LABEL_21;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v63, v25, v15, 0, v8, &v67);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v62, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "containerFactory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v10;
    objc_msgSend(v27, "containerForContainerIdentity:createIfNecessary:error:", v17, 0, &v65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v65;

    if (v16)
    {
      v58 = v7;
      v64 = v28;
      objc_msgSend(v16, "metadataWithError:", &v64);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v64;

      if (v18)
      {
        v57 = objc_alloc((Class)a1);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationProtectionClass"));
        v14 = objc_claimAutoreleasedReturnValue();
        v56 = -[NSObject intValue](v14, "intValue");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationRetryIfLocked"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v52, "BOOLValue");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationChangeType"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v55, "intValue");
        v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationInternalID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);
        v19 = (void *)objc_msgSend(v57, "initWithContainerMetadata:newClass:retryingIfLocked:changeType:internalChangeID:queue:userIdentityCache:", v18, v56, v54, v53, v31, v61, v60);

      }
      else
      {
        container_log_handle_for_category();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserId"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "unsignedIntValue");
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationIdentifier"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationContainerClass"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "unsignedLongLongValue");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v69 = v48;
          *(_WORD *)&v69[4] = 2112;
          *(_QWORD *)&v69[6] = v49;
          *(_WORD *)&v69[14] = 2048;
          *(_QWORD *)&v69[16] = v51;
          v70 = 2048;
          v71 = v67;
          v72 = 2112;
          v73 = v10;
          _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to get metadata for container from file userId: %u, identifier: %@, Class: %llu : %llu, %@", buf, 0x30u);

        }
        v18 = 0;
        v19 = 0;
      }
      v7 = v58;
      goto LABEL_21;
    }
    v10 = v28;
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserId"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "unsignedIntValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationIdentifier"));
      v43 = v7;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationContainerClass"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "unsignedLongLongValue");
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v69 = v42;
      *(_WORD *)&v69[4] = 2112;
      *(_QWORD *)&v69[6] = v44;
      *(_WORD *)&v69[14] = 2048;
      *(_QWORD *)&v69[16] = v46;
      v70 = 2048;
      v71 = v67;
      v72 = 2112;
      v73 = v10;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to lookup container metadata from file userId: %u, identifier: %@, Class: %llu : %llu, %@", buf, 0x30u);

      v7 = v43;
    }
    v16 = 0;
LABEL_7:
    v18 = 0;
    v19 = 0;
    goto LABEL_21;
  }
  v36 = [MCMError alloc];
  v37 = -[MCMError initWithErrorType:](v36, "initWithErrorType:", v67);

  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v39 = v67;
    error_description = container_get_error_description();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v69 = v39;
    *(_WORD *)&v69[8] = 2080;
    *(_QWORD *)&v69[10] = error_description;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Could not create user identity; error = (%llu)%s",
      buf,
      0x16u);
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v10 = (id)v37;
LABEL_21:

  if (a5 && !v19)
    *a5 = objc_retainAutorelease(v10);
  v34 = v19;

  return v34;
}

+ (id)_readAndValidateDataProtectionUpdateAtURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  MCMError *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  void *v58;
  id v59;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 38);
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "URL cannot be nil", buf, 2u);
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", v7);
  if (!v9)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 12);
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v69 = (uint64_t)v61;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Failed to read update info at URL %@", buf, 0xCu);

    }
LABEL_9:

    v16 = 0;
    v17 = 0;
    v18 = 0;
    v10 = 0;
    goto LABEL_71;
  }
  v10 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMDataOperationIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (!v13)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationIdentifier"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = (uint64_t)v63;
      v70 = 2112;
      v71 = v64;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Invalid update info Identifier: %@ at %@", buf, 0x16u);

    }
    goto LABEL_44;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationContainerClass"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (v21)
  {
    v23 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationContainerClass"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v24, "unsignedLongLongValue");

  if ((unint64_t)(v23 - 1) >= 0xE)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v69 = v23;
      v70 = 2112;
      v71 = v65;
      _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Invalid update info container class: %ld at %@", buf, 0x16u);

    }
LABEL_44:
    v16 = 0;
    v17 = 0;
LABEL_70:
    v18 = 0;
    goto LABEL_71;
  }
LABEL_21:
  if (!+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", v23))
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_29;
  }
  v67 = 1;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserIdentity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v26;
  else
    v17 = 0;

  if (!v17)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserId"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v42;
    else
      v43 = 0;

    if (!v43)
    {
      v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
      container_log_handle_for_category();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserId"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v69 = (uint64_t)v53;
        v70 = 2112;
        v71 = v54;
        v55 = "Invalid update info user id: %@ at %@";
        v56 = v52;
        v57 = 22;
        goto LABEL_83;
      }
LABEL_69:

      v16 = 0;
      goto LABEL_70;
    }
    +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", objc_msgSend(v43, "intValue"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIdentityForPersonalPersonaWithPOSIXUser:", v51);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_28;
LABEL_62:
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationUserIdentity"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = (uint64_t)v53;
      v70 = 2112;
      v71 = v54;
      v72 = 2048;
      v73 = v67;
      v55 = "Invalid update info user identity: %@ at %@: %llu";
      v56 = v52;
      v57 = 32;
LABEL_83:
      _os_log_error_impl(&dword_1CF807000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);

      goto LABEL_69;
    }
    goto LABEL_69;
  }
  +[MCMUserIdentity userIdentityWithPlist:cache:error:](MCMUserIdentity, "userIdentityWithPlist:cache:error:", v17, v8, &v67);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_62;
LABEL_28:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("MCMDataOperationUserIdentity"));
LABEL_29:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationProtectionClass"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;

  if (!v29)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationProtectionClass"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = (uint64_t)v34;
    v70 = 2112;
    v71 = v35;
    v36 = "Invalid update info protection class: %@ at %@";
LABEL_66:
    _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

    goto LABEL_67;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationChangeType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v31 = v30;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;

  if (!v32)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationChangeType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = (uint64_t)v34;
    v70 = 2112;
    v71 = v35;
    v36 = "Invalid update info change type: %@ at %@";
    goto LABEL_66;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationRetryIfLocked"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = v37;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = v38;
  else
    v39 = 0;

  if (!v39)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationRetryIfLocked"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = (uint64_t)v34;
    v70 = 2112;
    v71 = v35;
    v36 = "Invalid update info retry: %@ at %@";
    goto LABEL_66;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationInternalID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = v44;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  if (!v46)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationInternalID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = (uint64_t)v34;
      v70 = 2112;
      v71 = v35;
      v36 = "Invalid update info UUID String: %@ at %@";
      goto LABEL_66;
    }
LABEL_67:

    goto LABEL_70;
  }
  v47 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MCMDataOperationInternalID"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithUUIDString:", v48);

  objc_opt_class();
  v18 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v50 = v18;
  else
    v50 = 0;

  if (!v50)
  {
    v14 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 29);
    container_log_handle_for_category();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = (uint64_t)v18;
      v70 = 2112;
      v71 = v66;
      _os_log_error_impl(&dword_1CF807000, v62, OS_LOG_TYPE_ERROR, "Invalid update info UUID: %@ at %@", buf, 0x16u);

    }
LABEL_71:
    v58 = 0;
    if (!a5)
      goto LABEL_74;
    goto LABEL_72;
  }
  v58 = (void *)objc_msgSend(v10, "copy");
  v14 = 0;
  if (!a5)
    goto LABEL_74;
LABEL_72:
  if (!v58)
    *a5 = objc_retainAutorelease(v14);
LABEL_74:
  v59 = v58;

  return v59;
}

+ (id)urlForProtectionOperationWithContainerIdentity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "managedPathRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containermanagerPendingUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containerClass");
  objc_msgSend(v3, "userIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%llu-%@.plist"), v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)deleteUpdateFileWithContainerIdentity:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  MCMError *v9;
  BOOL v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[MCMDataProtectionChangeOperation urlForProtectionOperationWithContainerIdentity:](MCMDataProtectionChangeOperation, "urlForProtectionOperationWithContainerIdentity:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v14);
    v8 = v14;

    if ((v7 & 1) != 0)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_12;
    }
    v9 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v8, v5, 36);
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to remove data protection file at %@ : %@", buf, 0x16u);

    }
  }
  else
  {
    v9 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 84);
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending operations.", buf, 2u);
    }
    v8 = 0;
  }

  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a4 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_12:

  return v10;
}

@end
