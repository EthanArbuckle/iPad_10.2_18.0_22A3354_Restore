@implementation MCMCommandOperationReclaimDiskSpace

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5 handoffForReply:(id)a6
{
  id v11;
  MCMCommandOperationReclaimDiskSpace *v12;
  MCMCommandOperationReclaimDiskSpace *v13;
  MCMXPCMessage *message;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandOperationReclaimDiskSpace;
  v12 = -[MCMCommand initWithContext:resultPromise:](&v16, sel_initWithContext_resultPromise_, a4, a5);
  v13 = v12;
  if (v12)
  {
    v12->_asynchronously = a3;
    message = v12->_message;
    v12->_message = 0;

    objc_storeStrong((id *)&v13->_handoffReply, a6);
  }

  return v13;
}

- (MCMCommandOperationReclaimDiskSpace)initWithAsynchronously:(BOOL)a3 context:(id)a4 resultPromise:(id)a5
{
  return -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:handoffForReply:](self, "initWithAsynchronously:context:resultPromise:handoffForReply:", a3, a4, a5, 0);
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5 asyncResultPromise:(id)a6
{
  id v10;
  id v11;
  MCMCommandOperationReclaimDiskSpace *v12;
  MCMCommandOperationReclaimDiskSpace *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandOperationReclaimDiskSpace;
  v12 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v10, a4, v11);
  v13 = v12;
  if (v12)
  {
    v12->_asynchronously = 0;
    objc_storeStrong((id *)&v12->_handoffReply, a5);
    objc_storeStrong((id *)&v13->_message, a3);
  }

  return v13;
}

- (MCMCommandOperationReclaimDiskSpace)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  return -[MCMCommandOperationReclaimDiskSpace initWithMessage:context:reply:asyncResultPromise:](self, "initWithMessage:context:reply:asyncResultPromise:", a3, a4, a5, 0);
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "codeSignInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "allowed") & 1) != 0 || (objc_msgSend(v5, "canDelete") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "canManageUserManagedAssets");

  return v6;
}

- (void)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  MCMCommandOperationReclaimDiskSpace *v21;
  id v22;
  __int128 block;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommand resultPromise](self, "resultPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke;
  v20 = &unk_1E8CB6318;
  v21 = self;
  v22 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D17D71B4](&v17);
  if (-[MCMCommandOperationReclaimDiskSpace asynchronously](self, "asynchronously", v17, v18, v19, v20, v21))
  {
    v8 = MCMSharedSlowWorkloop();
    v9 = v7;
    v10 = v8;
    MEMORY[0x1D17D7868]();
    *(_QWORD *)&block = v5;
    *((_QWORD *)&block + 1) = 3221225472;
    v24 = __MCMRunTransactionalTask_block_invoke;
    v25 = &unk_1E8CB65B0;
    v26 = v9;
    v11 = v9;
    dispatch_async(v10, &block);

  }
  else
  {
    -[MCMCommandOperationReclaimDiskSpace handoffReply](self, "handoffReply");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v10 = MCMSharedSlowWorkloop();
      dispatch_async_and_wait(v10, v7);
      goto LABEL_8;
    }
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[MCMCommand context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = v16;
      _os_log_debug_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEBUG, "Reply to reclaim handed off to the slow workloop for client [%@]", (uint8_t *)&block, 0xCu);

    }
    -[MCMCommandOperationReclaimDiskSpace handoffReply](self, "handoffReply");
    v10 = objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject handoffToSlowWorkloopforClientIdentity:withBlock:](v10, "handoffToSlowWorkloopforClientIdentity:withBlock:", v14, v7);

  }
LABEL_8:

  objc_autoreleasePoolPop(v3);
}

- (BOOL)_removeItemOrMoveToTempAtURL:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  MCMError *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 1;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/tmp"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v9 = objc_msgSend(v8, "removeItemAtURL:error:", v5, &v26);
  v10 = v26;

  if ((v9 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v12 = objc_msgSend(v10, "code");

    if (v12 == 2)
    {
LABEL_4:
      v13 = 0;
      goto LABEL_16;
    }
  }
  else
  {

  }
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v22;
    v29 = 2112;
    v30 = v10;
    _os_log_debug_impl(&dword_1CF807000, v14, OS_LOG_TYPE_DEBUG, "Couldn't remove, so moving item to /tmp: %@ : %@", buf, 0x16u);

  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  v18 = objc_msgSend(v15, "moveItemIfExistsAtURL:toURL:error:", v5, v17, &v25);
  v19 = v25;

  if ((v18 & 1) != 0)
  {
    v13 = 0;
    v6 = 1;
  }
  else
  {
    v13 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v19, v5, 17);
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v19;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Failed to move dir %@ to %@: %@", buf, 0x20u);

    }
    v6 = 0;
    if (a4 && v13)
    {
      v13 = objc_retainAutorelease(v13);
      v6 = 0;
      *a4 = v13;
    }
  }
  v10 = v19;
LABEL_16:

  return v6;
}

- (void)_deleteContainersAtDeathRowURL:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  MCMError *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MCMError *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  MCMError *v24;
  void *v25;
  uint64_t v26;
  id *v27;
  id v28;
  MCMError *v29;
  _QWORD block[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v27 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3499;
  v44 = __Block_byref_object_dispose__3500;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3499;
  v38 = __Block_byref_object_dispose__3500;
  v39 = 0;
  v6 = MCMSharedDeathrowQueue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke;
  block[3] = &unk_1E8CB5C90;
  v32 = &v40;
  v28 = v5;
  v31 = v28;
  v33 = &v34;
  dispatch_sync(v6, block);

  if (objc_msgSend((id)v41[5], "count"))
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = (void *)v41[5];
    *(_DWORD *)buf = 138412290;
    v52 = v8;
    v9 = "Preparing to delete: %@";
  }
  else
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v52 = v28;
    v9 = "There are no items staged for delete at %@.";
  }
  _os_log_impl(&dword_1CF807000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:

  v10 = (void *)v41[5];
  if (v10)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = v10;
    v12 = 0;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v48;
      do
      {
        v15 = 0;
        v16 = v12;
        do
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
          v29 = v16;
          v18 = -[MCMCommandOperationReclaimDiskSpace _removeItemOrMoveToTempAtURL:error:](self, "_removeItemOrMoveToTempAtURL:error:", v17, &v29, v27);
          v12 = v29;

          if (!v18)
          {
            container_log_handle_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v35[5];
              *(_DWORD *)buf = 138412546;
              v52 = v20;
              v53 = 2112;
              v54 = v21;
              _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to destroy item at %@: %@", buf, 0x16u);

            }
          }
          ++v15;
          v16 = v12;
        }
        while (v13 != v15);
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend((id)v35[5], "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v23 = objc_msgSend((id)v35[5], "code") == 2;

      if (v23)
      {
        v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {

    }
    v24 = [MCMError alloc];
    v12 = -[MCMError initWithNSError:url:defaultErrorType:](v24, "initWithNSError:url:defaultErrorType:", v35[5], v28, 28);
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v35[5];
      *(_DWORD *)buf = 138412546;
      v52 = v25;
      v53 = 2112;
      v54 = v26;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to get items for deletion at %@: %@", buf, 0x16u);

    }
  }

  if (v27 && v12)
  {
    v12 = objc_retainAutorelease(v12);
    *v27 = v12;
  }
LABEL_29:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

}

- (void)_deleteContainersOnDeathRowWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id obj;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3499;
  v27 = __Block_byref_object_dispose__3500;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3499;
  v21 = __Block_byref_object_dispose__3500;
  v22 = 0;
  v5 = containermanager_copy_global_configuration();
  v6 = objc_msgSend(v5, "dispositionForContainerClass:", 2) == 1;

  if (v6)
  {
    -[MCMCommand context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentityCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke;
    v16[3] = &unk_1E8CB53D0;
    v16[4] = self;
    v16[5] = &v17;
    v16[6] = &v23;
    objc_msgSend(v8, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v16);

  }
  v9 = containermanager_copy_global_configuration();
  v10 = objc_msgSend(v9, "dispositionForContainerClass:", 1) == 1;

  if (v10)
  {
    +[MCMContainerClassDeletedPath deletedGlobalURL](MCMContainerClassDeletedPath, "deletedGlobalURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18[5];
    v18[5] = v11;

    v13 = v18[5];
    v14 = v24;
    obj = v24[5];
    -[MCMCommandOperationReclaimDiskSpace _deleteContainersAtDeathRowURL:error:](self, "_deleteContainersAtDeathRowURL:error:", v13, &obj);
    objc_storeStrong(v14 + 5, obj);
  }
  if (v4)
    ((void (**)(id, id))v4)[2](v4, v24[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (MCMReply)handoffReply
{
  return self->_handoffReply;
}

- (BOOL)asynchronously
{
  return self->_asynchronously;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffReply, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

void __81__MCMCommandOperationReclaimDiskSpace__deleteContainersOnDeathRowWithCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:](MCMContainerClassDeletedPath, "deletedURLWithUserIdentity:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v8 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v8 + 40);
  objc_msgSend(v6, "_deleteContainersAtDeathRowURL:error:", v7, obj);
  objc_storeStrong((id *)(v8 + 40), obj[0]);
}

void __76__MCMCommandOperationReclaimDiskSpace__deleteContainersAtDeathRowURL_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v4 + 40);
  objc_msgSend(v2, "urlsForItemsInDirectoryAtURL:error:", v3, obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitOnLock:", 9);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2;
  v4[3] = &unk_1E8CB53A8;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_deleteContainersOnDeathRowWithCompletion:", v4);

}

void __46__MCMCommandOperationReclaimDiskSpace_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  MCMResultBase *v12;
  MCMResultBase *v13;
  id v14;

  v3 = a2;
  v13 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v3);

  objc_msgSend(*(id *)(a1 + 32), "message");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = containermanager_copy_global_configuration();
    if (objc_msgSend(v6, "runmode") == 2)
    {

    }
    else
    {
      v7 = containermanager_copy_global_configuration();
      v8 = objc_msgSend(v7, "runmode");

      if (v8 != 3)
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "message", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommand relayToPrivilegedDaemonMessage:context:](MCMCommand, "relayToPrivilegedDaemonMessage:context:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v12 = v11;

      v13 = v12;
    }

  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "completeWithResult:", v13, v13);

}

+ (unint64_t)command
{
  return 4;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
