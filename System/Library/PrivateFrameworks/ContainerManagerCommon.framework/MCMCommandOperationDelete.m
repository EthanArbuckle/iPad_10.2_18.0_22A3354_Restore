@implementation MCMCommandOperationDelete

- (MCMCommandOperationDelete)initWithContainerIdentities:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)-[MCMCommandOperationDelete _initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:](self, "_initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:", a3, 0, a4, a5, a6, a7);
}

- (MCMCommandOperationDelete)initWithManifests:(id)a3 waitForDiskSpaceReclaim:(BOOL)a4 removeAllCodeSignInfo:(BOOL)a5 context:(id)a6 resultPromise:(id)a7
{
  return (MCMCommandOperationDelete *)-[MCMCommandOperationDelete _initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:](self, "_initWithContainerIdentities:manifests:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:", 0, a3, a4, a5, a6, a7);
}

- (id)_initWithContainerIdentities:(id)a3 manifests:(id)a4 waitForDiskSpaceReclaim:(BOOL)a5 removeAllCodeSignInfo:(BOOL)a6 context:(id)a7 resultPromise:(id)a8
{
  id v14;
  id v15;
  MCMCommandOperationDelete *v16;
  MCMCommandOperationDelete *v17;
  void *v18;
  void *v19;
  void *v20;
  MCMXPCMessageOperationDelete *message;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MCMCommandOperationDelete;
  v16 = -[MCMCommand initWithContext:resultPromise:](&v23, sel_initWithContext_resultPromise_, a7, a8);
  v17 = v16;
  if (v16)
  {
    if (v14)
      v18 = v14;
    else
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_containerIdentities, v18);
    v19 = (void *)objc_msgSend(v15, "mutableCopy");
    v20 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v17->_manifests, v20);
    if (!v19)

    v17->_removeAllCodeSignInfo = a6;
    v17->_waitForDiskSpaceReclaim = a5;
    message = v17->_message;
    v17->_message = 0;

  }
  return v17;
}

- (MCMCommandOperationDelete)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v9;
  MCMCommandOperationDelete *v10;
  uint64_t v11;
  NSArray *containerIdentities;
  uint64_t v13;
  NSMutableSet *manifests;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMCommandOperationDelete;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v16, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    objc_msgSend(v9, "concreteContainerIdentities");
    v11 = objc_claimAutoreleasedReturnValue();
    containerIdentities = v10->_containerIdentities;
    v10->_containerIdentities = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    manifests = v10->_manifests;
    v10->_manifests = (NSMutableSet *)v13;

    v10->_removeAllCodeSignInfo = 0;
    v10->_waitForDiskSpaceReclaim = objc_msgSend(v9, "waitForDiskSpaceReclaim");
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "codeSignInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "allowed") & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "canDelete"))
  {
    objc_msgSend(v4, "codeSignInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MCMCommandOperationDelete containerIdentities](self, "containerIdentities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v11)
    {
      v12 = v11;
      v22 = v4;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v9, "isEqualToString:", v16);

          v18 = objc_msgSend(v15, "containerClass");
          objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v6, "isEntitledForLookupWithClass:identifier:", v18, v19);

          if ((v17 & 1) == 0 && !v20)
          {
            v7 = 0;
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v12)
          continue;
        break;
      }
      v7 = 1;
LABEL_16:
      v4 = v22;
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)execute
{
  MCMCommandOperationReclaimDiskSpace *v3;
  NSObject *v4;
  MCMCommandOperationReclaimDiskSpace *v5;
  MCMCommandOperationReclaimDiskSpace *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  MCMCommandOperationReclaimDiskSpace *v14;
  _BOOL8 v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  MCMResultOperationDelete *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  MCMResultOperationDelete *v31;
  void *v32;
  void *v33;
  MCMResultOperationDelete *v34;
  MCMResultPromise *v35;
  MCMResultPromise *v36;
  MCMCommandOperationReclaimDiskSpace *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  MCMCommandOperationReclaimDiskSpace *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *context;
  id v47;
  MCMCommandOperationReclaimDiskSpace *v48;
  _QWORD v49[5];
  MCMResultOperationDelete *v50;
  MCMCommandOperationReclaimDiskSpace *v51;
  MCMCommandOperationReclaimDiskSpace *v52;
  id v53;
  id v54;
  id v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  MCMCommandOperationReclaimDiskSpace *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  v54 = 0;
  v55 = 0;
  -[MCMCommandOperationDelete _routeContainersToHandle:toRelay:](self, "_routeContainersToHandle:toRelay:", &v55, &v54);
  v3 = (MCMCommandOperationReclaimDiskSpace *)v55;
  v47 = v54;
  v48 = v3;
  if (!-[MCMCommandOperationReclaimDiskSpace count](v3, "count"))
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to delete locally", buf, 2u);
    }

    v5 = 0;
    v9 = 0;
    goto LABEL_45;
  }
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v3;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Queueing containers for deletion: %@", buf, 0xCu);
  }

  v53 = 0;
  -[MCMCommandOperationDelete _containersToDeleteRecursivelyStartingWithContainerIdentities:error:](self, "_containersToDeleteRecursivelyStartingWithContainerIdentities:error:", v3, &v53);
  v5 = (MCMCommandOperationReclaimDiskSpace *)objc_claimAutoreleasedReturnValue();
  v6 = (MCMCommandOperationReclaimDiskSpace *)v53;
  if (!v5)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v6;
      v63 = 2112;
      v64 = (uint64_t)v3;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Failed to collect identities for deletion; error = %@, staring set = %@",
        buf,
        0x16u);
    }

    v9 = 0;
    v5 = 0;
    if (v6)
      goto LABEL_36;
    goto LABEL_45;
  }
  if (!-[MCMCommandOperationReclaimDiskSpace count](v5, "count"))
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v3;
      _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "Collected zero identities for deletion; starting set = %@",
        buf,
        0xCu);
    }

    v9 = 0;
    if (v6)
      goto LABEL_36;
    goto LABEL_45;
  }
  -[MCMCommandOperationDelete manifests](self, "manifests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v12 = (unint64_t)-[MCMCommandOperationReclaimDiskSpace count](v5, "count") > 1;

  if (!v12)
    goto LABEL_22;
  v52 = v6;
  v13 = -[MCMCommandOperationDelete _writeDeleteManifestsForItems:error:](self, "_writeDeleteManifestsForItems:error:", v5, &v52);
  v14 = v52;

  if (!v13)
  {
    if (-[MCMCommandOperationReclaimDiskSpace category](v14, "category") != 1
      || -[MCMCommandOperationReclaimDiskSpace POSIXerrno](v14, "POSIXerrno") != 28)
    {
      container_log_handle_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v14;
        v63 = 2112;
        v64 = (uint64_t)v5;
        _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Failed to write manifest for deletion; error = %@, containers = %@",
          buf,
          0x16u);
      }

      goto LABEL_34;
    }
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v5;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Failed to write manifest for deletion because ENOSPC, ignoring and enabling direct delete; containers = %@",
        buf,
        0xCu);
    }

    v14 = 0;
  }
  v15 = !v13;
  v6 = v14;
LABEL_23:
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v5;
    _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Deleting containers: %@", buf, 0xCu);
  }

  v51 = v6;
  -[MCMCommandOperationDelete _deleteItems:directDelete:error:](self, "_deleteItems:directDelete:error:", v5, v15, &v51);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v51;

  if (!v9)
  {
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v14;
      v63 = 2112;
      v64 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Failed to delete containers; error = %@, containers = %@",
        buf,
        0x16u);
    }

LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  if (!objc_msgSend(v9, "count"))
  {
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v14;
      v63 = 2112;
      v64 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Deleted zero containers; error = %@, containers = %@",
        buf,
        0x16u);
    }

  }
LABEL_35:
  v6 = v14;
  if (v14)
  {
LABEL_36:
    v19 = -[MCMResultBase initWithError:]([MCMResultOperationDelete alloc], "initWithError:", v6);
    v20 = 0;
    goto LABEL_55;
  }
LABEL_45:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = v9;
  v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v9);
        v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v28, "containerPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v29);

        objc_msgSend(v28, "containerIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

      }
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
    }
    while (v25);
  }

  v31 = [MCMResultOperationDelete alloc];
  -[MCMCommand context](self, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "clientIdentity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MCMResultWithContainersArrayBase initWithContainerPaths:containerIdentities:includePath:clientIdentity:skipSandboxExtensions:](v31, "initWithContainerPaths:containerIdentities:includePath:clientIdentity:skipSandboxExtensions:", v23, v24, 1, v33, 1);

  -[MCMCommandOperationDelete _relayContainerIdentities:andAmendResult:](self, "_relayContainerIdentities:andAmendResult:", v47, v34);
  v35 = [MCMResultPromise alloc];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __36__MCMCommandOperationDelete_execute__block_invoke;
  v49[3] = &unk_1E8CB4990;
  v49[4] = self;
  v19 = v34;
  v50 = v19;
  v36 = -[MCMResultPromise initWithCompletion:](v35, "initWithCompletion:", v49);
  v37 = [MCMCommandOperationReclaimDiskSpace alloc];
  v38 = -[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim");
  -[MCMCommand context](self, "context");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand reply](self, "reply");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:handoffForReply:](v37, "initWithAsynchronously:context:resultPromise:handoffForReply:", !v38, v39, v36, v40);

  container_log_handle_for_category();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v45 = objc_msgSend((id)objc_opt_class(), "command");
    *(_DWORD *)buf = 134218240;
    v62 = v41;
    v63 = 2048;
    v64 = v45;
    _os_log_debug_impl(&dword_1CF807000, v42, OS_LOG_TYPE_DEBUG, "Completed delete, executing command <%p; %llu>...",
      buf,
      0x16u);
  }

  -[MCMCommandOperationReclaimDiskSpace execute](v41, "execute");
  v6 = 0;
  v20 = 1;
LABEL_55:
  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "waitOnLock:", 11);

  if (!v20 || !-[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim"))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "completeWithResult:", v19);

  }
  objc_autoreleasePoolPop(context);
}

- (void)_relayContainerIdentities:(id)a3 andAmendResult:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[MCMCommandOperationDelete _replyFromRelayToDaemonWithContainerIdentities:](self, "_replyFromRelayToDaemonWithContainerIdentities:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "mergeWithXPCResult:", v7);

  }
}

- (void)_routeContainersToHandle:(id *)a3 toRelay:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MCMCommandOperationDelete _containerIdentities](self, "_containerIdentities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "disposition");
        if (v13)
        {
          if (v13 == 2)
          {
            v14 = v6;
          }
          else
          {
            if (v13 != 1)
              continue;
            v14 = v5;
          }
          objc_msgSend(v14, "addObject:", v12);
        }
        else
        {
          container_log_handle_for_category();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            -[MCMCommand context](self, "context");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "clientIdentity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v12;
            v23 = 2112;
            v24 = v17;
            _os_log_fault_impl(&dword_1CF807000, v15, OS_LOG_TYPE_FAULT, "Attempt to delete container for different user or container class not supported, ignored: %@; client: %@",
              buf,
              0x16u);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v9);
  }

  if (a3)
    *a3 = (id)objc_msgSend(v5, "copy");
  if (a4)
    *a4 = (id)objc_msgSend(v6, "copy");

}

- (id)_replyFromRelayToDaemonWithContainerIdentities:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t error_description;
  MCMCommandOperationDelete *v17;
  uint64_t v18;
  xpc_object_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int current_persona_originator_info;
  int current_persona_proximate_info;
  int current_persona;
  const char *v26;
  NSObject *v27;
  int v28;
  int v29;
  uid_t v30;
  uid_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v39;
  int v40;
  int v41;
  int v43;
  int v44;
  int v45;
  int v46;
  _QWORD __s[2];
  uint8_t v48[8];
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uid_t v62;
  __int16 v63;
  uid_t v64;
  __int16 v65;
  void *v66;
  uint8_t buf[4];
  _OWORD v68[21];
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __s[1] = 0;
  v4 = xpc_array_create(0, 0);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v78 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          *(_QWORD *)v48 = 1;
          v12 = -[NSObject createLibsystemContainerWithError:](v11, "createLibsystemContainerWithError:", v48);
          if (v12)
          {
            v13 = v12;
            v14 = xpc_dictionary_create(0, 0, 0);
            container_xpc_encode_container_object();
            xpc_array_append_value(v4, v14);
            MEMORY[0x1D17D69E0](v13);
          }
          else
          {
            container_log_handle_for_category();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = *(_QWORD *)v48;
              error_description = container_get_error_description();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&v68[0] = v11;
              WORD4(v68[0]) = 2048;
              *(_QWORD *)((char *)v68 + 10) = v15;
              WORD1(v68[1]) = 2080;
              *(_QWORD *)((char *)&v68[1] + 4) = error_description;
              _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Could not allocate container object for delete relay using %@: (%llu) %s", buf, 0x20u);
            }
          }

        }
        else
        {
          container_log_handle_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&v68[0] = v10;
            _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Non-libsystem identity encountered when constructing delete relay: %@", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
    }
    while (v7);
  }

  v17 = self;
  v18 = -[MCMCommandOperationDelete waitForDiskSpaceReclaim](self, "waitForDiskSpaceReclaim");
  v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v19, "Command", 3uLL);
  xpc_dictionary_set_uint64(v19, "Flags", v18);
  xpc_dictionary_set_value(v19, "ContainersArray", v4);
  container_log_handle_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    v22 = (void *)MEMORY[0x1D17D773C](v19);
    __s[0] = v22;
    v74 = 0u;
    v75 = 0u;
    v73 = 0u;
    current_persona_originator_info = voucher_get_current_persona_originator_info();
    v45 = DWORD2(v73);
    v43 = DWORD1(v74);
    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    v40 = DWORD1(v71);
    v41 = DWORD2(v70);
    v69 = 0;
    memset(v68, 0, sizeof(v68));
    *(_DWORD *)buf = 2;
    current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      v39 = "<unknown>";
      v26 = "NOPERSONA";
    }
    else
    {
      if ((DWORD1(v68[0]) - 2) > 4)
        v26 = "<unknown>";
      else
        v26 = off_1E8CB49D8[DWORD1(v68[0]) - 2];
      v39 = (char *)&v68[5] + 4;
    }
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v45 & ~(current_persona_originator_info >> 31);
      v29 = v43 & ~(current_persona_originator_info >> 31);
      v44 = v41 & ~(current_persona_proximate_info >> 31);
      v46 = v40 & ~(current_persona_proximate_info >> 31);
      v30 = geteuid();
      v31 = getuid();
      *(_DWORD *)v48 = 67111427;
      *(_DWORD *)&v48[4] = current_persona;
      v49 = 2082;
      v50 = v26;
      v51 = 2082;
      v52 = v39;
      v53 = 1024;
      v54 = v28;
      v17 = self;
      v55 = 1024;
      v56 = v29;
      v57 = 1024;
      v58 = v44;
      v59 = 1024;
      v60 = v46;
      v61 = 1024;
      v62 = v30;
      v63 = 1024;
      v64 = v31;
      v65 = 2081;
      v66 = v22;
      _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "Container delete; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proxi"
        "mate [pid = %d, personaid = %d], euid = %d, uid = %d, message = %{private}s",
        v48,
        0x4Au);
    }

    if (v22)
    {
      free(v22);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  *(_QWORD *)v48 = 1;
  container_xpc_set_use_shared_connection();
  -[MCMCommand context](v17, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "clientIdentity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "createLibsystemClient");

  v34 = (void *)container_client_copy_encoded_xpc_object();
  if (v34)
  {
    v35 = 0;
    if (*(_QWORD *)v48 == 1)
    {
      xpc_dictionary_set_value(v19, "ProxyForClient", v34);
      v35 = (void *)container_xpc_send_sync_message();
    }
  }
  else
  {
    v35 = 0;
  }
  v36 = (void *)container_error_copy_unlocalized_description();
  *(_QWORD *)&v73 = v36;
  container_log_handle_for_category();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&v68[0] = v36;
    _os_log_impl(&dword_1CF807000, v37, OS_LOG_TYPE_DEFAULT, "Delete relay response: %s", buf, 0xCu);
  }

  if (v36)
  {
    free(v36);
    memset_s(&v73, 8uLL, 0, 8uLL);
  }
  container_free_client();
  container_error_free();

  return v35;
}

- (id)_containerIdentities
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MCMCommandOperationDelete containerIdentities](self, "containerIdentities");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "concreteContainerIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (id)_codeSignIdentifiersToRemoveFor:(id)a3 amendingCumulativeIdentifiers:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "containerClass");
  if (v8 > 0xB || ((1 << v8) & 0xED4) == 0)
  {
    v11 = 0;
LABEL_19:
    v12 = 0;
    goto LABEL_29;
  }
  v10 = objc_msgSend(v6, "containerClass");
  v11 = 0;
  v12 = 0;
  if (v10 != 7 && v10 != 13)
  {
    -[MCMCommand context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "countContainersForOtherUserIdentitiesWithIdentity:error:", v15, 0);

    v11 = 0;
    v12 = 0;
    if (!v16)
    {
      v17 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v6, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithObject:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)gCodeSigningMapping, "childParentMapCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "childBundleIdentifiersForParentIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        objc_msgSend(v12, "unionSet:", v21);

      if (!v12)
      {
        v11 = 0;
        goto LABEL_29;
      }
      if (objc_msgSend(v6, "transient"))
      {
        v43 = 1;
        objc_msgSend(v6, "userIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "containerIdentity");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "containerConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v6, "platform");
        -[MCMCommand context](self, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "userIdentityCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v22, v23, v24, v25, 0, v27, &v43);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[MCMCommand context](self, "context");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "containerCache");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v30, "entryForContainerIdentity:error:", v28, &v42);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v42;

          if (v31)
          {
            v41 = v32;
            objc_msgSend(v31, "metadataWithError:", &v41);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v41;

            if (v33)
            {
              container_log_handle_for_category();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v6, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v45 = v35;
                v46 = 2112;
                v47 = 0;
                _os_log_impl(&dword_1CF807000, v34, OS_LOG_TYPE_DEFAULT, "Skipping removal of code sign mapping since container to be deleted [%@] is transient and there's a permanent one; error = %@",
                  buf,
                  0x16u);

              }
              goto LABEL_19;
            }
          }
          else
          {
            v11 = v32;
          }

          goto LABEL_27;
        }
        container_log_handle_for_category();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "shortDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = v39;
          v46 = 2048;
          v47 = v43;
          _os_log_error_impl(&dword_1CF807000, v36, OS_LOG_TYPE_ERROR, "Could not construct container identity from %@ to check for permanent copy: %llu", buf, 0x16u);

        }
      }
      v11 = 0;
LABEL_27:
      if (objc_msgSend(v12, "count"))
        objc_msgSend(v7, "unionSet:", v12);
    }
  }
LABEL_29:
  v37 = (void *)objc_msgSend(v12, "copy");

  return v37;
}

- (id)_containersToDeleteRecursivelyStartingWithContainerIdentities:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MCMCommandOperationDeleteItem *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  MCMCommandOperationDelete *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v34 = v5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  v37 = v9;
  v35 = self;
  while (1)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");
    if (v10)
    {
      do
      {
        objc_msgSend(v10, "containerIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "containerIdentity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13);

          -[MCMCommand context](self, "context");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "containerCache");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          objc_msgSend(v15, "entryForContainerIdentity:error:", v10, &v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v40;

          if (v16 && (objc_msgSend(v16, "metadataMinimal"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v18 = (void *)v17;
            -[MCMCommandOperationDelete _codeSignIdentifiersToRemoveFor:amendingCumulativeIdentifiers:](self, "_codeSignIdentifiersToRemoveFor:amendingCumulativeIdentifiers:", v17, v38);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "containerIdentity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMCommandOperationDelete _getOrCreateManifestWithContainerIdentity:](self, "_getOrCreateManifestWithContainerIdentity:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            do
            {
              v22 = -[MCMCommandOperationDeleteItem initWithCacheEntry:codeSignIdentifiersToRemove:manifest:]([MCMCommandOperationDeleteItem alloc], "initWithCacheEntry:codeSignIdentifiersToRemove:manifest:", v16, v19, v21);
              if (v22)
              {
                objc_msgSend(v6, "addObject:", v22);
              }
              else
              {
                container_log_handle_for_category();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v18, "shortDescription");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v42 = v25;
                  _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Could not create delete item; metadata = %@",
                    buf,
                    0xCu);

                }
              }

              objc_msgSend(v16, "next");
              v24 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v24;
            }
            while (v24);

            self = v35;
            v8 = v36;
            v9 = v37;
            v27 = v39;
          }
          else
          {
            container_log_handle_for_category();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v39;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v42 = v39;
              v43 = 2112;
              v44 = v10;
              _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Could not find container from container identity queued for delete; error = %@, identity = %@",
                buf,
                0x16u);
            }

            if (objc_msgSend(v39, "type") == 21)
              -[MCMCommandOperationDelete _deleteManifestForContainerIdentity:](self, "_deleteManifestForContainerIdentity:", v10);
          }

        }
        objc_msgSend(v8, "lastObject");
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "removeLastObject");
        v10 = (void *)v28;
      }
      while (v28);
    }
    if (!v38)
    {
      v30 = 0;
      goto LABEL_28;
    }
    if (!objc_msgSend(v38, "count"))
      break;
    -[MCMCommandOperationDelete _groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:](self, "_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:", v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29 || !objc_msgSend(v29, "count"))
    {

      goto LABEL_28;
    }
    objc_msgSend(v29, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v31);

    v9 = v37;
    v38 = v30;
  }
  v30 = v38;
LABEL_28:
  v32 = (void *)objc_msgSend(v6, "copy");

  return v32;
}

- (id)_deleteItems:(id)a3 directDelete:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  MCMCommandOperationDelete *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  NSObject *v44;
  void *v45;
  void *context;
  void *v49;
  MCMCommandOperationDelete *v50;
  unsigned int v51;
  id v52;
  id obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  const __CFString *v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  v5 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[MCMCommand context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentity");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v52 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D17D7010]();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v7;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
  if (v56)
  {
    v50 = self;
    v9 = 0;
    v55 = *(_QWORD *)v73;
    v51 = v5;
    while (1)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v73 != v55)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v11, "cacheEntry", context);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "containerPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "containerPathIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "containerClass");
        objc_msgSend(v13, "containerRootURL");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "containerIdentity");
        v58 = (void *)v15;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v9;
        v57 = (void *)v17;
        LODWORD(v15) = +[MCMCommandOperationDelete deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:](MCMCommandOperationDelete, "deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:", v17, v14, v16, v15, v5, &v62);
        v18 = v5;
        v19 = v62;

        if (!(_DWORD)v15)
        {
          v9 = v19;
LABEL_24:
          v5 = v18;
          goto LABEL_28;
        }
        v54 = v19;
        container_log_handle_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v57, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v64 = v21;
          v65 = 2112;
          v66 = v59;
          _os_log_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] %@", buf, 0x16u);

        }
        container_log_handle_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          objc_msgSend(v49, "codeSignInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          *(_DWORD *)buf = 138478595;
          v26 = CFSTR("<unknown>");
          if (v24)
            v26 = (const __CFString *)v24;
          v64 = v58;
          v65 = 2113;
          v66 = v60;
          v67 = 2050;
          v68 = v16;
          v69 = 2113;
          v70 = v26;
          _os_signpost_emit_with_name_impl(&dword_1CF807000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DeletedContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", buf, 0x2Au);

        }
        objc_msgSend(v52, "addObject:", v12);
        objc_msgSend(v11, "codeSignIdentifiersToRemove");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)v27;
          objc_msgSend(v11, "codeSignIdentifiersToRemove");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          if (v30)
          {
            container_log_handle_for_category();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "codeSignIdentifiersToRemove");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v64 = v32;
              _os_log_impl(&dword_1CF807000, v31, OS_LOG_TYPE_DEFAULT, "Removing codesign info for [%@]", buf, 0xCu);

            }
            v33 = (void *)gCodeSigningMapping;
            objc_msgSend(v11, "codeSignIdentifiersToRemove");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (id)objc_msgSend(v33, "removeCodeSigningDictionaryForIdentifiers:", v34);

          }
        }
        objc_msgSend(v11, "manifest");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v11, "manifest");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v50;
          v39 = -[MCMCommandOperationDelete _deleteManifest:](v50, "_deleteManifest:", v37);
        }
        else
        {
          container_log_handle_for_category();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v50;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "containerIdentity");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v64 = v45;
            _os_log_debug_impl(&dword_1CF807000, v37, OS_LOG_TYPE_DEBUG, "No delete manifest URL; identity = %@",
              buf,
              0xCu);

          }
        }
        v18 = v51;

        -[MCMCommand context](v38, "context");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "containerCache");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v13, "transient");
        v61 = 0;
        v43 = objc_msgSend(v41, "removeContainerForUserIdentity:contentClass:identifier:transient:error:", v14, v16, v60, v42, &v61);
        v9 = v61;

        if ((v43 & 1) != 0)
          goto LABEL_24;
        container_log_handle_for_category();
        v44 = objc_claimAutoreleasedReturnValue();
        v5 = v51;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v64 = v59;
          v65 = 2112;
          v66 = v9;
          _os_log_error_impl(&dword_1CF807000, v44, OS_LOG_TYPE_ERROR, "Failed to remove from cache %@; error = %@",
            buf,
            0x16u);
        }

        v9 = 0;
LABEL_28:

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
      if (!v56)
        goto LABEL_32;
    }
  }
  v9 = 0;
LABEL_32:

  objc_autoreleasePoolPop(context);
  if (a5 && v9)
    *a5 = objc_retainAutorelease(v9);

  return v52;
}

- (id)_groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[7];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend((id)gCodeSigningMapping, "copyReferenceCountSetForContainerClass:", 7);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v6);
        objc_msgSend((id)gCodeSigningMapping, "groupContainerIdentifiersAssociatedWithIdentifier:containerClass:", v7, 7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v37 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v5, "removeObject:", v13);
              v14 = objc_msgSend(v5, "countForObject:", v13);
              if (v14)
              {
                v15 = v14;
                container_log_handle_for_category();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v30 = v13;
                  v31 = 2048;
                  v32 = v15;
                  v33 = 2112;
                  v34 = v7;
                  _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_INFO, "Ref count for [%@] will reach %lu after removing [%@]", buf, 0x20u);
                }

              }
              else
              {
                -[MCMCommand context](self, "context");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "userIdentityCache");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v26[0] = MEMORY[0x1E0C809B0];
                v26[1] = 3221225472;
                v26[2] = __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke;
                v26[3] = &unk_1E8CB49B8;
                v26[4] = self;
                v26[5] = v13;
                v28 = 7;
                v26[6] = v7;
                v27 = v25;
                objc_msgSend(v18, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v26);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          }
          while (v10);
        }

        v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    }
    while (v23);
  }

  v19 = (void *)objc_msgSend(v25, "copy");
  return v19;
}

- (id)_getManifestWithContainerIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "concreteContainerIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToContainerIdentity:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_getOrCreateManifestWithContainerIdentity:(id)a3
{
  id v4;
  MCMDeleteManifest *v5;
  MCMDeleteManifest *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MCMCommandOperationDelete _getManifestWithContainerIdentity:](self, "_getManifestWithContainerIdentity:", v4);
  v5 = (MCMDeleteManifest *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = [MCMDeleteManifest alloc];
    -[MCMCommand context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentityCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MCMDeleteManifest initWithConcreteContainerIdentity:userIdentityCache:](v6, "initWithConcreteContainerIdentity:userIdentityCache:", v4, v8);

  }
  return v5;
}

- (id)_deleteManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentityCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "concreteContainerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryRepairForUserIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(v4, "deleteManifestAfterRemovingUsingLibraryRepairForUser:error:", v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (!v10)
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "concreteContainerIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Could not remove delete manifest; error = %@, identity = %@",
        buf,
        0x16u);

    }
  }

  return v10;
}

- (void)_deleteManifestForContainerIdentity:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MCMCommandOperationDelete manifests](self, "manifests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MCMCommandOperationDelete _getManifestWithContainerIdentity:](self, "_getManifestWithContainerIdentity:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[MCMCommandOperationDelete _deleteManifest:](self, "_deleteManifest:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[MCMCommandOperationDelete manifests](self, "manifests");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", v6);

        }
      }

    }
  }

}

- (BOOL)_writeDeleteManifestsForItems:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
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
  BOOL v21;
  NSObject *v22;
  void *v24;
  void *v25;
  id *v26;
  id obj;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v6)
  {
    v7 = v6;
    v26 = a4;
    obj = v5;
    v8 = 0;
    v9 = *(_QWORD *)v36;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        objc_msgSend(v12, "cacheEntry", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "containerPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMCommand context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "userIdentityCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "libraryRepairForUserIdentity:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "manifest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v11;
        objc_msgSend(v19, "deleteManifestAfterWritingUsingLibraryRepairForUser:error:", v18, &v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v29;

        v21 = v20 != 0;
        if (!v20)
        {
          container_log_handle_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "cacheEntry");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "containerIdentity");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v8;
            v32 = 2112;
            v33 = v25;
            _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Failed to write delete manifest; error = %@, identity = %@",
              buf,
              0x16u);

          }
          v5 = obj;
          goto LABEL_13;
        }
        objc_msgSend(v12, "setManifest:", v20);

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      if (v7)
        continue;
      break;
    }
LABEL_13:

    if (v26 && v8)
    {
      v8 = objc_retainAutorelease(v8);
      *v26 = v8;
    }
  }
  else
  {

    v8 = 0;
    v21 = 1;
  }

  return v21;
}

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (BOOL)waitForDiskSpaceReclaim
{
  return self->_waitForDiskSpaceReclaim;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (BOOL)removeAllCodeSignInfo
{
  return self->_removeAllCodeSignInfo;
}

- (MCMXPCMessageOperationDelete)message
{
  return self->_message;
}

- (NSMutableSet)manifests
{
  return self->_manifests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifests, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_containerIdentities, 0);
  objc_storeStrong((id *)&self->_concreteContainerIdentities, 0);
}

void __89__MCMCommandOperationDelete__groupContainersToDeleteWhenReconcilingRemovalOfIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t error_description;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "staticConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configForContainerClass:", *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 1;
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v3, v8, v7, 0, 0, v10, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = (uint64_t)v16;
      _os_log_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEFAULT, "Ref count for [%@] will reach zero after removing [%@]; queueing ui=%@ for delete.",
        buf,
        0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = v20;
      error_description = container_get_error_description();
      *(_DWORD *)buf = 138412802;
      v22 = v17;
      v23 = 2048;
      v24 = v18;
      v25 = 2080;
      v26 = error_description;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Could not generate identity for [%@] during group reconciliation; error = (%llu) %s",
        buf,
        0x20u);
    }

  }
}

id __36__MCMCommandOperationDelete_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "waitForDiskSpaceReclaim"))
  {
    objc_msgSend(*(id *)(a1 + 32), "resultPromise");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completeWithResult:", *(_QWORD *)(a1 + 40));

  }
  return v3;
}

+ (id)commandForOperationDeleteWithContainerIdentities:(id)a3 removeAllCodeSignInfo:(BOOL)a4 context:(id)a5 resultPromise:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerIdentities:waitForDiskSpaceReclaim:removeAllCodeSignInfo:context:resultPromise:", v12, 0, v7, v11, v10);

  return v13;
}

+ (BOOL)deleteContainerRootURL:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 containerPathIdentifier:(id)a6 preferDirectDelete:(BOOL)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  char v29;
  id v30;
  NSObject *v31;
  char v32;
  MCMError *v33;
  BOOL v34;
  NSObject *v35;
  MCMError *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
    v16 = 0;
LABEL_17:
    v26 = 0;
    goto LABEL_18;
  }
  v41 = v14;
  v17 = v13;
  v18 = a8;
  v19 = v17;
  +[MCMContainerClassDeletedPath containerPathForUserIdentity:containerClass:](MCMContainerClassDeletedPath, "containerPathForUserIdentity:containerClass:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v21 = objc_msgSend(v20, "createIfNecessaryWithError:", &v45);
  v22 = v45;
  if ((v21 & 1) == 0)
  {
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v22;
      v48 = 2112;
      v49 = v20;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to create deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    v22 = 0;
  }
  objc_msgSend(v20, "classURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v22;
  objc_msgSend(v15, "createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:", v24, CFSTR("deleting."), &v44);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v44;

  if (v25)
  {
    v27 = v21 ^ 1;
    a8 = v18;
  }
  else
  {
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    a8 = v18;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v26;
      v48 = 2112;
      v49 = v20;
      _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Failed to create unique deathrow directory; error = %@, class path = %@",
        buf,
        0x16u);
    }

    v26 = 0;
    v27 = 1;
  }
  v13 = v19;
  v14 = v41;
  objc_msgSend(v25, "URLByAppendingPathComponent:isDirectory:", v41, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v27 & 1) == 0)
  {
    v43 = v26;
    v29 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v12, v16, &v43);
    v30 = v43;

    if ((v29 & 1) != 0)
    {
LABEL_19:
      v33 = 0;
      v34 = 1;
      goto LABEL_25;
    }
    container_log_handle_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v39;
      v48 = 2112;
      v49 = v40;
      v50 = 2112;
      v51 = v30;
      _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "Couldn't stage for deletion from [%@] to [%@]; trying a direct delete instead: %@",
        buf,
        0x20u);

    }
    goto LABEL_17;
  }
LABEL_18:
  v42 = v26;
  v32 = objc_msgSend(v15, "removeItemAtURL:error:", v12, &v42);
  v30 = v42;

  if ((v32 & 1) != 0)
    goto LABEL_19;
  container_log_handle_for_category();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v38;
    v48 = 2112;
    v49 = v30;
    _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Failed to delete container at %@: %@", buf, 0x16u);

  }
  v36 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v30, v12, 28);
  v33 = v36;
  if (a8)
  {
    v33 = objc_retainAutorelease(v36);
    v34 = 0;
    *a8 = v33;
  }
  else
  {
    v34 = 0;
  }
LABEL_25:

  return v34;
}

+ (unint64_t)command
{
  return 3;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
