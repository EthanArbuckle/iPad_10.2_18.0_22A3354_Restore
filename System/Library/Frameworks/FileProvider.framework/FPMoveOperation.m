@implementation FPMoveOperation

- (void)checkNonEmptyPackage
{
  id v2;

  v2 = -[NSArray fp_map:](self->__sourceURLs, "fp_map:", &__block_literal_global_30);
}

uint64_t __39__FPMoveOperation_checkNonEmptyPackage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");
  if (objc_msgSend(v2, "fp_isPackage"))
  {
    v10 = 0;
    v4 = objc_retainAutorelease(v2);
    v5 = fpfs_num_entries((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0, &v10);
    if (!(v5 | v10))
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fp_prettyPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Attempt to move/import an empty package %@", buf, 0xCu);

      }
    }
  }
  if (v3)
    objc_msgSend(v2, "stopAccessingSecurityScopedResource");

  return 0;
}

- (FPMoveOperation)initWithSourceItems:(id)a3 orSourceURLs:(id)a4 destinationFolder:(id)a5 orDestinationURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  FPMoveOperation *v20;
  FPMoveOperation *v21;
  uint64_t v22;
  FPProgressManager *progressManager;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *progressByRoot;
  uint64_t v27;
  NSMutableSet *createdOrFailedRoots;
  uint64_t v29;
  NSMutableDictionary *createdItemsByRoot;
  uint64_t v31;
  NSMutableDictionary *placeholderIDsByRoot;
  uint64_t v33;
  NSMutableDictionary *URLByResolvedFPItem;
  id location;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13)
  {
    objc_msgSend(v13, "providerDomainID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v16 = v11;
    v17 = v14;
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "providerDomainID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v18;
    v14 = v17;
    v11 = v16;
    v13 = 0;
  }
  else
  {
    v15 = 0;
  }
  v37.receiver = self;
  v37.super_class = (Class)FPMoveOperation;
  v20 = -[FPActionOperation initWithProvider:action:](&v37, sel_initWithProvider_action_, v15, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_providerIdentifier, v15);
    objc_storeStrong((id *)&v21->__sourceURLs, a4);
    objc_storeStrong((id *)&v21->__sourceItems, a3);
    objc_storeStrong((id *)&v21->__destinationURL, a6);
    objc_storeStrong((id *)&v21->__destinationFolder, a5);
    v21->__lastUsedDatePolicy = -[FPMoveOperation defaultLastUsedDatePolicy](v21, "defaultLastUsedDatePolicy");
    -[FPActionOperation setSourceItemsToPreflight:](v21, "setSourceItemsToPreflight:", v11);
    -[FPActionOperation setDestinationItemToPreflight:](v21, "setDestinationItemToPreflight:", v13);
    v21->_isScheduledFromThisClient = 1;
    +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
    v22 = objc_claimAutoreleasedReturnValue();
    progressManager = v21->_progressManager;
    v21->_progressManager = (FPProgressManager *)v22;

    location = 0;
    objc_initWeak(&location, v21);
    -[FPActionOperation progress](v21, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fp_setFileOperationKind:", *MEMORY[0x1E0CB30B0]);

    v25 = objc_opt_new();
    progressByRoot = v21->_progressByRoot;
    v21->_progressByRoot = (NSMutableDictionary *)v25;

    v27 = objc_opt_new();
    createdOrFailedRoots = v21->_createdOrFailedRoots;
    v21->_createdOrFailedRoots = (NSMutableSet *)v27;

    v29 = objc_opt_new();
    createdItemsByRoot = v21->_createdItemsByRoot;
    v21->_createdItemsByRoot = (NSMutableDictionary *)v29;

    v31 = objc_opt_new();
    placeholderIDsByRoot = v21->_placeholderIDsByRoot;
    v21->_placeholderIDsByRoot = (NSMutableDictionary *)v31;

    v33 = objc_opt_new();
    URLByResolvedFPItem = v21->_URLByResolvedFPItem;
    v21->_URLByResolvedFPItem = (NSMutableDictionary *)v33;

    -[FPActionOperation setSetupRemoteOperationService:](v21, "setSetupRemoteOperationService:", 1);
    -[FPMoveOperation checkNonEmptyPackage](v21, "checkNonEmptyPackage");
    objc_destroyWeak(&location);
  }

  return v21;
}

- (FPMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  return -[FPMoveOperation initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:](self, "initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:", a3, 0, 0, a4);
}

- (FPMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  return -[FPMoveOperation initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:](self, "initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:", 0, a3, a4, 0);
}

- (FPMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  return -[FPMoveOperation initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:](self, "initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:", a3, 0, a4, 0);
}

- (FPMoveOperation)initWithRemoteOperation:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  FPMoveOperation *v9;
  FPMoveOperation *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[FPMoveOperation initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:](self, "initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:", 0, 0, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteMoveOperation, a3);
    objc_storeStrong((id *)&v10->_info, a4);
    v10->_isScheduledFromThisClient = 0;
    -[FPActionOperation setHavePreflight:](v10, "setHavePreflight:", 0);
    -[FPActionOperation setSetupRemoteOperationService:](v10, "setSetupRemoteOperationService:", 0);
  }

  return v10;
}

- (FPMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FPMoveOperation *v9;
  uint64_t v10;
  NSDictionary *targetFilenamesByURL;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FPMoveOperation initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:](self, "initWithSourceItems:orSourceURLs:destinationFolder:orDestinationURL:", 0, v8, v6, 0);

  v10 = objc_msgSend(v7, "copy");
  targetFilenamesByURL = v9->__targetFilenamesByURL;
  v9->__targetFilenamesByURL = (NSDictionary *)v10;

  return v9;
}

- (id)operationDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bounce:%d lud:%lu "), -[FPMoveInfo shouldBounce](self->_info, "shouldBounce"), -[FPMoveInfo lastUsedDatePolicy](self->_info, "lastUsedDatePolicy"));
}

- (void)_recomputeMoveInfoIfNecessary
{
  FPMoveInfo *v3;
  FPMoveInfo *info;
  void *v5;
  void *v6;
  NSArray *sourceItems;
  void *v8;
  NSArray *sourceURLs;
  void *v10;
  void *v11;
  FPMoveInfo *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  _QWORD v27[5];
  _QWORD v28[5];

  if (!self->_info)
  {
    v3 = (FPMoveInfo *)objc_opt_new();
    info = self->_info;
    self->_info = v3;

  }
  +[FPDaemonOperationManager sharedInstance](FPDaemonOperationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateLocalOperationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperationInfo setOperationID:](self->_info, "setOperationID:", v6);

  if (self->__sourceItems || self->__sourceURLs)
  {
    -[FPActionOperationInfo setRoots:](self->_info, "setRoots:", 0);
    sourceItems = self->__sourceItems;
    if (sourceItems)
    {
      -[NSArray fp_map:](sourceItems, "fp_map:", &__block_literal_global_8_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperationInfo setRoots:](self->_info, "setRoots:", v8);

    }
    sourceURLs = self->__sourceURLs;
    if (sourceURLs)
    {
      -[NSArray fp_map:](sourceURLs, "fp_map:", &__block_literal_global_11_1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperationInfo roots](self->_info, "roots");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = self->_info;
      if (v11)
      {
        -[FPActionOperationInfo roots](v12, "roots");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPActionOperationInfo setRoots:](self->_info, "setRoots:", v14);

      }
      else
      {
        -[FPActionOperationInfo setRoots:](v12, "setRoots:", v10);
      }

    }
  }
  -[FPActionOperationInfo roots](self->_info, "roots");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v17 = (void *)v15;
    v18 = -[NSMutableDictionary count](self->_createdItemsByRoot, "count");

    if (v18)
    {
      -[FPActionOperationInfo roots](self->_info, "roots");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_3;
      v28[3] = &unk_1E444D560;
      v28[4] = self;
      objc_msgSend(v19, "fp_filter:", v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperationInfo setRoots:](self->_info, "setRoots:", v20);

    }
  }
  -[FPActionOperationInfo roots](self->_info, "roots");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_4;
  v27[3] = &unk_1E444D588;
  v27[4] = self;
  objc_msgSend(v21, "fp_map:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveInfo setRootFilenames:](self->_info, "setRootFilenames:", v22);

  if (self->__destinationFolder)
  {
    +[FPActionOperationLocator locatorForItem:](FPActionOperationLocator, "locatorForItem:");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->__destinationURL)
      goto LABEL_20;
    +[FPActionOperationLocator locatorForURL:](FPActionOperationLocator, "locatorForURL:");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;
  -[FPMoveInfo setTargetFolder:](self->_info, "setTargetFolder:", v23);

LABEL_20:
  -[FPMoveInfo setLastUsedDatePolicy:](self->_info, "setLastUsedDatePolicy:", self->__lastUsedDatePolicy);
  -[FPMoveInfo setShouldBounce:](self->_info, "setShouldBounce:", self->_shouldBounceOnCollision);
  -[FPMoveInfo setByCopy:](self->_info, "setByCopy:", -[FPMoveOperation byCopy](self, "byCopy"));
  -[FPMoveOperation _t_patchActionOperationInfo](self, "_t_patchActionOperationInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[FPMoveOperation _t_patchActionOperationInfo](self, "_t_patchActionOperationInfo");
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, FPMoveInfo *))v26)[2](v26, self->_info);

  }
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForItem:](FPActionOperationLocator, "locatorForItem:", a2);
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForURL:](FPActionOperationLocator, "locatorForURL:", a2);
}

BOOL __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_4(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;

  v3 = a2;
  if (objc_msgSend(v3, "isExternalURL")
    && (v4 = *(void **)(*(_QWORD *)(a1 + 32) + 496),
        objc_msgSend(v3, "asURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
    objc_msgSend(v3, "asURL");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isProviderItem")
      || (v9 = *(void **)(*(_QWORD *)(a1 + 32) + 504),
          objc_msgSend(v3, "asFPItem"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "objectForKeyedSubscript:", v10),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      objc_msgSend(v3, "filename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
    objc_msgSend(v3, "asFPItem");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (BOOL)_hasAccessToURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  int v6;
  pid_t v7;
  const char *v8;
  int v9;
  id v10;
  int v11;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  v7 = getpid();
  if (v4)
    v8 = "file-read-data";
  else
    v8 = "file-write-data";
  v9 = *MEMORY[0x1E0C806B0] | 1;
  objc_msgSend(v5, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = fpfs_lp_sandbox_check(v7, (uint64_t)v8, v9, (const char *)objc_msgSend(v10, "fileSystemRepresentation"));

  if (v6)
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");

  return v11 == 0;
}

- (void)_resolveURLsWithCompletionHandler:(id)a3
{
  NSObject *v4;
  NSURL **p_destinationURL;
  NSURL *destinationURL;
  NSURL *v7;
  NSArray *sourceURLs;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSURL *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  NSObject *v35;
  void (**v36)(id, id);
  NSArray *obj;
  void *v38;
  id v39;
  _QWORD block[4];
  NSArray *v41;
  id v42;
  FPMoveOperation *v43;
  id v44;
  void (**v45)(id, id);
  _QWORD v46[4];
  NSObject *v47;
  uint64_t v48;
  NSArray *v49;
  id v50;
  id v51;
  id v52;
  id location;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v36 = (void (**)(id, id))a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  p_destinationURL = &self->__destinationURL;
  destinationURL = self->__destinationURL;
  if (destinationURL)
  {
    if (!-[FPMoveOperation _hasAccessToURL:readonly:](self, "_hasAccessToURL:readonly:", destinationURL, 0))
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FPMoveOperation _resolveURLsWithCompletionHandler:].cold.2((uint64_t)&self->__destinationURL, v15, v16, v17, v18, v19, v20, v21);

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *p_destinationURL;
      v63 = *MEMORY[0x1E0CB3308];
      v64[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 513, v39);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v36[2](v36, v9);
      goto LABEL_23;
    }
    dispatch_group_enter(v4);
    v7 = *p_destinationURL;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke;
    v58[3] = &unk_1E444D5B0;
    v58[4] = self;
    v59 = v4;
    objc_msgSend(v38, "fetchItemForURL:completionHandler:", v7, v58);

  }
  sourceURLs = self->__sourceURLs;
  if (sourceURLs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](sourceURLs, "count"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->__sourceURLs, "count"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->__targetFilenamesByURL, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = self->__sourceURLs;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v55 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (!-[FPMoveOperation _hasAccessToURL:readonly:](self, "_hasAccessToURL:readonly:", v14, 1))
          {
            fp_current_or_default_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              -[FPMoveOperation _resolveURLsWithCompletionHandler:].cold.1(v14, v24, v25, v26, v27, v28, v29, v30);

            v31 = (void *)MEMORY[0x1E0CB35C8];
            v60 = *MEMORY[0x1E0CB3308];
            v61 = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v36[2](v36, v33);

            v34 = obj;
            goto LABEL_22;
          }
          dispatch_group_enter(v4);
          location = 0;
          objc_initWeak(&location, self);
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_21;
          v46[3] = &unk_1E444D5D8;
          v47 = v4;
          objc_copyWeak(&v52, &location);
          v48 = v14;
          v49 = v9;
          v50 = v10;
          v51 = v39;
          objc_msgSend(v38, "fetchItemForURL:completionHandler:", v14, v46);

          objc_destroyWeak(&v52);
          objc_destroyWeak(&location);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  else
  {
    v39 = 0;
    v9 = 0;
    v10 = 0;
  }
  -[FPOperation callbackQueue](self, "callbackQueue");
  v35 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_22;
  block[3] = &unk_1E444B110;
  v9 = v9;
  v41 = v9;
  v39 = v39;
  v42 = v39;
  v43 = self;
  v10 = v10;
  v44 = v10;
  v45 = v36;
  dispatch_group_notify(v4, v35, block);

  v34 = v41;
LABEL_22:

LABEL_23:
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v8);

    v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472), v6);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 480), a2);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 472);
    *(_QWORD *)(v10 + 472) = 0;

    objc_msgSend(*(id *)(a1 + 32), "setDestinationItemToPreflight:", v6);
    objc_sync_exit(v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_21(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  objc_sync_enter(v7);
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 9);
  v9 = WeakRetained;
  if (v5 && WeakRetained)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[5], "fp_shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: source URL %@ resolved to item %@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(a1[6], "addObject:", v5);
    objc_msgSend(v9[70], "setObject:forKeyedSubscript:", a1[5], v5);
    objc_msgSend(v9[62], "objectForKeyedSubscript:", a1[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v11, v5);

  }
  else if (WeakRetained)
  {
    objc_msgSend(a1[8], "addObject:", a1[5]);
  }

  objc_sync_exit(v7);
  dispatch_group_leave((dispatch_group_t)a1[4]);

}

uint64_t __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "count");
    v3 = objc_msgSend(*(id *)(a1 + 32), "count") + v2;
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 456), "count");
    if (v3 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "count") + v4)
      __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_22_cold_1();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 456), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 464), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 504), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "sourceItemsToPreflight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "sourceItemsToPreflight");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setSourceItemsToPreflight:", v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setSourceItemsToPreflight:", *(_QWORD *)(a1 + 32));
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)actionMain
{
  _BOOL4 isScheduledFromThisClient;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FPMoveInfo *info;
  void *v9;
  _QWORD v10[5];

  isScheduledFromThisClient = self->_isScheduledFromThisClient;
  -[FPMoveOperation _recomputeMoveInfoIfNecessary](self, "_recomputeMoveInfoIfNecessary");
  if (!isScheduledFromThisClient)
  {
    -[FPMoveOperation _runWithRemoteOperation:](self, "_runWithRemoteOperation:", self->_remoteMoveOperation);
    return;
  }
  if (-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight"))
  {
    if (-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPMoveOperation.m"), 436, CFSTR("operation shouldn't run"));

    }
  }
  -[FPActionOperationInfo setAttachSandboxExtensionsOnXPCEncoding:](self->_info, "setAttachSandboxExtensionsOnXPCEncoding:", 1);
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPMoveOperation qualityOfService](self, "qualityOfService");
  if (v6 <= 16)
  {
    if (v6 == -1)
    {
      v7 = 21;
      goto LABEL_18;
    }
    if (v6 == 9)
    {
      v7 = 9;
      goto LABEL_18;
    }
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if (v6 == 17)
  {
    v7 = 17;
    goto LABEL_18;
  }
  if (v6 == 33)
  {
    v7 = 33;
    goto LABEL_18;
  }
  if (v6 != 25)
    goto LABEL_17;
  v7 = 25;
LABEL_18:
  -[FPActionOperationInfo setQos:](self->_info, "setQos:", v7);
  info = self->_info;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__FPMoveOperation_actionMain__block_invoke;
  v10[3] = &unk_1E444CF08;
  v10[4] = self;
  objc_msgSend(v5, "scheduleActionOperationWithInfo:completionHandler:", info, v10);

}

void __29__FPMoveOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__FPMoveOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E444AB48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __29__FPMoveOperation_actionMain__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "completedWithResult:error:", 0);
  else
    return objc_msgSend(v2, "_runWithRemoteOperation:", a1[6]);
}

- (void)main
{
  _QWORD v2[5];
  objc_super v3;

  if (self->_isScheduledFromThisClient)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __23__FPMoveOperation_main__block_invoke;
    v2[3] = &unk_1E444A598;
    v2[4] = self;
    -[FPMoveOperation _resolveURLsWithCompletionHandler:](self, "_resolveURLsWithCompletionHandler:", v2);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)FPMoveOperation;
    -[FPActionOperation main](&v3, sel_main);
  }
}

id __23__FPMoveOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return (id)objc_msgSend(v2, "completedWithResult:error:", 0, a2);
  v4.receiver = v2;
  v4.super_class = (Class)FPMoveOperation;
  return objc_msgSendSuper2(&v4, sel_main);
}

- (void)_runWithRemoteOperation:(id)a3
{
  uint64_t v4;
  NSXPCProxyCreating *v5;
  NSXPCProxyCreating *remoteMoveOperation;
  NSXPCProxyCreating *v7;
  void *v8;
  void (**v9)(void);
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke;
  v11[3] = &unk_1E444A598;
  v11[4] = self;
  objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = v5;

  v7 = self->_remoteMoveOperation;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_3;
  v10[3] = &unk_1E444CF78;
  v10[4] = self;
  -[NSXPCProxyCreating registerFrameworkClient:operationCompletion:](v7, "registerFrameworkClient:operationCompletion:", self, v10);
  -[FPMoveOperation _t_remoteOperationWasScheduled](self, "_t_remoteOperationWasScheduled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FPMoveOperation _t_remoteOperationWasScheduled](self, "_t_remoteOperationWasScheduled");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

void __43__FPMoveOperation__runWithRemoteOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_2;
  v6[3] = &unk_1E4449A40;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __43__FPMoveOperation__runWithRemoteOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

void __43__FPMoveOperation__runWithRemoteOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_4;
  v14[3] = &unk_1E444A0C0;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, v14);

}

uint64_t __43__FPMoveOperation__runWithRemoteOperation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithResultsByRoot:errorsByRoot:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FPMoveOperation;
  -[FPOperation cancel](&v2, sel_cancel);
}

- (void)remoteOperationProgressesAreReady
{
  NSObject *v4;
  _QWORD v5[6];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__FPMoveOperation_remoteOperationProgressesAreReady__block_invoke;
  v5[3] = &unk_1E44499E8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __52__FPMoveOperation_remoteOperationProgressesAreReady__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPMoveOperation.m"), 509, CFSTR("operation was not setup propertly"));

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "roots");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0CB30B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "progressForRoot:completion:", v10, &__block_literal_global_41_0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fp_setFileOperationKind:", v8);
        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 584);
        objc_msgSend(v10, "underlyingObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        objc_msgSend(v2, "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount") + objc_msgSend(v11, "totalUnitCount"));
        objc_msgSend(v2, "addChild:withPendingUnitCount:", v11, objc_msgSend(v11, "totalUnitCount"));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKeyedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "registerCopyProgress:forItemID:", v11, v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  (*((void (**)(id))a5 + 2))(a5);
  -[FPOperation callbackQueue](self, "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__FPMoveOperation_remoteOperationCreatedRoot_resultingItem_completion___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

}

void __71__FPMoveOperation_remoteOperationCreatedRoot_resultingItem_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*((id *)a1[4] + 69), "objectForKeyedSubscript:", a1[5]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)*((_QWORD *)a1[4] + 73);
  objc_msgSend(a1[5], "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)a1[4] + 67), "addObject:", a1[5]);
  v5 = a1[6];
  if (v5
    && (objc_msgSend(*((id *)a1[4] + 68), "setObject:forKeyedSubscript:", v5, a1[5]),
        objc_msgSend(a1[6], "isProviderItem")))
  {
    objc_msgSend(a1[6], "asFPItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
    if (!v4)
      goto LABEL_10;
  }
  if (v6)
  {
    v7 = (void *)*((_QWORD *)a1[4] + 64);
    objc_msgSend(v6, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerCopyProgress:forItemID:", v4, v8);

  }
  if (v10)
    objc_msgSend(*((id *)a1[4] + 64), "registerCopyProgress:forItemID:", v4, v10);
LABEL_10:
  if (objc_msgSend(a1[4], "byCopy"))
  {
    objc_msgSend(v6, "setChildItemCount:", 0);
    objc_msgSend(v6, "setState:", objc_msgSend(v6, "state") | 8);
    objc_msgSend(a1[4], "stitcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replacePlaceholderWithID:withItem:", v10, v6);

  }
}

- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v9 = a3;
  v10 = a4;
  (*((void (**)(id))a6 + 2))(a6);
  -[FPOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FPMoveOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, block);

}

void __79__FPMoveOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_t_rootCompleted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_t_rootCompleted");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "isProviderItem")
    && (objc_msgSend(*(id *)(a1 + 48), "asFPItem"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
    v11 = v4;
    objc_msgSend(v4, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeCopyProgressForItemID:", v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
    v11 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "byCopy"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "removeCopyProgressForItemID:", v8);
    v9 = v7 ^ 1;
    if (!v8)
      v9 = 1;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v11, "setChildItemCount:", 0);
      objc_msgSend(*(id *)(a1 + 32), "stitcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replacePlaceholderWithID:withItem:", v8, v11);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "removeCopyProgressForItemID:", v8);
    }

  }
}

- (void)remoteOperationFinishedSendingPastUpdates
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_isScheduledFromThisClient)
  {
    -[FPOperation callbackQueue](self, "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FPMoveOperation_remoteOperationFinishedSendingPastUpdates__block_invoke;
    block[3] = &unk_1E444A308;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

uint64_t __60__FPMoveOperation_remoteOperationFinishedSendingPastUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presendNotifications");
}

- (void)_recoverFromCollisionError:(id)a3 withPolicy:(unint64_t)a4
{
  id v7;
  void *v8;
  FPMoveOperation *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  __objc2_class **v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "fp_userInfoFPItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation setHaveErrorRecovery:](self, "setHaveErrorRecovery:", 0);
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      if (!v8)
      {
        fp_current_or_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[FPMoveOperation _recoverFromCollisionError:withPolicy:].cold.1(v19);

        v9 = self;
        v10 = v7;
        goto LABEL_21;
      }
      v24 = a2;
      v11 = (void *)objc_opt_new();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[NSDictionary allValues](self->_errorsByItem, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        v16 = 1;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "fp_userInfoFPItem", v24);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v11, "addObject:", v18);
              v16 &= (objc_msgSend(v18, "capabilities") & 0x10) != 0;
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v14);
      }
      else
      {
        v16 = 1;
      }

      if (!objc_msgSend(v11, "count") && !objc_msgSend(v11, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("FPMoveOperation.m"), 669, CFSTR("there should be at least one item"));

      }
      v20 = off_1E4447778;
      if ((v16 & 1) == 0)
        v20 = off_1E4447558;
      v21 = (void *)objc_msgSend(objc_alloc(*v20), "initWithItems:", v11);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke;
      v25[3] = &unk_1E444A598;
      v25[4] = self;
      objc_msgSend(v21, "setActionCompletionBlock:", v25);
      -[FPMoveOperation _resetOperationBeforeErrorRecovery](self, "_resetOperationBeforeErrorRecovery");
      +[FPItemManager defaultManager](FPItemManager, "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scheduleAction:", v21);

    }
    else
    {
      if (!a4)
      {
        v9 = self;
        v10 = 0;
LABEL_21:
        -[FPMoveOperation completedWithResult:error:](v9, "completedWithResult:error:", 0, v10);
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPMoveOperation.m"), 701, CFSTR("UNREACHABLE: unhandled recovery option"));
    }

    goto LABEL_30;
  }
  -[FPMoveOperation setShouldBounceOnCollision:](self, "setShouldBounceOnCollision:", 1);
  -[FPMoveOperation _resetOperationBeforeErrorRecovery](self, "_resetOperationBeforeErrorRecovery");
  -[FPMoveOperation _scheduleAgainAfterErrorRecovery](self, "_scheduleAgainAfterErrorRecovery");
LABEL_30:

}

void __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke_2;
  v7[3] = &unk_1E4449A40;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "completedWithResult:error:", 0);
  else
    return objc_msgSend(v1, "_scheduleAgainAfterErrorRecovery");
}

- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSDictionary *v13;
  NSDictionary *transferLocations;
  NSDictionary *v15;
  NSDictionary *transferResults;
  NSDictionary *v17;
  NSDictionary *errorsByItem;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "fp_prettyDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v28;
    _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] remote operation finished with results:%@; errors:%@; %@",
      buf,
      0x20u);

  }
  objc_msgSend(v8, "fp_copyItemKeysAndValuesUnwrappedAndKeyMap:", self->_URLByResolvedFPItem);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  transferLocations = self->_transferLocations;
  self->_transferLocations = v13;

  -[NSDictionary fp_filter:](self->_transferLocations, "fp_filter:", &__block_literal_global_49);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  transferResults = self->_transferResults;
  self->_transferResults = v15;

  objc_msgSend(v9, "fp_copyItemKeysUnwrappedAndKeyMap:", self->_URLByResolvedFPItem);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  errorsByItem = self->_errorsByItem;
  self->_errorsByItem = v17;

  if (v10)
  {
    v19 = v10;
  }
  else
  {
    -[NSDictionary allValues](self->_errorsByItem, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isProviderItem") & 1) == 0)
  {

    v23 = 0;
LABEL_11:
    -[NSDictionary allValues](self->_transferResults, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPMoveOperation completedWithResult:error:](self, "completedWithResult:error:", v27, v19);

    goto LABEL_12;
  }
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "asFPItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_11;
  objc_msgSend(v23, "childItemCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_11;
  -[FPActionOperation itemManager](self, "itemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "itemID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke_2;
  v29[3] = &unk_1E444D5B0;
  v29[4] = self;
  v30 = v19;
  objc_msgSend(v25, "fetchItemForItemID:completionHandler:", v26, v29);

LABEL_12:
}

uint64_t __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  uint8_t v9[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(id **)(a1 + 32);
    objc_msgSend(v4[72], "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completedWithResult:error:", v6, *(_QWORD *)(a1 + 40));

  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] move destination folder is gone after move finished", v9, 2u);
    }

    v8 = *(id **)(a1 + 32);
    objc_msgSend(v8[72], "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completedWithResult:error:", v5, *(_QWORD *)(a1 + 40));
  }

}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPMoveOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__FPMoveOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_completedWithResult:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString **v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSXPCProxyCreating *remoteMoveOperation;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  FPProgressManager *progressManager;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  FPMoveOperation *v32;
  SEL v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v27 = a2;
  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    v8 = -[FPMoveInfo byCopy](self->_info, "byCopy");
    v9 = FPErrorVariantCopy;
    if (!v8)
      v9 = FPErrorVariantMove;
    v10 = *v9;
    -[FPActionOperationInfo roots](self->_info, "roots");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_10;
    if (objc_msgSend(v12, "isProviderItem"))
    {
      objc_msgSend(v12, "asFPItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fp_annotatedErrorWithItem:variant:", v13, v10);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "isExternalURL"))
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v12, "asURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fp_annotatedErrorWithURL:variant:", v13, v10);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;

    v6 = v15;
    goto LABEL_10;
  }
LABEL_11:
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = 0;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSMutableDictionary allValues](self->_createdItemsByRoot, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v22, "isProviderItem", v27))
        {
          progressManager = self->_progressManager;
          objc_msgSend(v22, "asFPItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "itemID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPProgressManager removeCopyProgressForItemID:](progressManager, "removeCopyProgressForItemID:", v25);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v19);
  }

  -[FPActionOperation stitcher](self, "stitcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "finishWithItems:error:", v28, v6);

  if (v6)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __46__FPMoveOperation__completedWithResult_error___block_invoke;
    v29[3] = &unk_1E444D620;
    v30 = v28;
    v31 = v6;
    v32 = self;
    v33 = v27;
    -[FPActionOperation tryRecoveringFromError:completion:](self, "tryRecoveringFromError:completion:", v31, v29);

  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)FPMoveOperation;
    -[FPOperation completedWithResult:error:](&v34, sel_completedWithResult_error_, v28, 0);
  }

}

id __46__FPMoveOperation__completedWithResult_error___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  if ((a2 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "fp_isFileProviderError:", -1001) & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 40), "fp_isFileProviderError:", -1001) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("FPMoveOperation.m"), 803, CFSTR("unexpected recoverable error: %@"), *(_QWORD *)(a1 + 40));

    }
    return (id)objc_msgSend(*(id *)(a1 + 48), "_recoverFromCollisionError:withPolicy:", *(_QWORD *)(a1 + 40), a3);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v9.receiver = *(id *)(a1 + 48);
    v9.super_class = (Class)FPMoveOperation;
    return objc_msgSendSuper2(&v9, sel_completedWithResult_error_, v7, v6);
  }
}

- (void)_presendNotifications
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  NSObject *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPMoveOperation _recomputeMoveInfoIfNecessary](self, "_recomputeMoveInfoIfNecessary");
  if (!-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight")
    && !-[FPOperation isFinished](self, "isFinished"))
  {
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isExternalURL");

    if ((v5 & 1) == 0)
    {
      -[FPActionOperation stitcher](self, "stitcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");

      if (-[FPMoveInfo lastUsedDatePolicy](self->_info, "lastUsedDatePolicy") == 2)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = 0;
      }
      -[FPMoveInfo targetFolder](self->_info, "targetFolder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isProviderItem"))
      {
        -[FPMoveInfo targetFolder](self->_info, "targetFolder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asFPItem");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v63 = 0;
      }

      -[FPActionOperationInfo roots](self->_info, "roots");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v12 = 0;
        v59 = (void *)*MEMORY[0x1E0CEC528];
        v60 = *MEMORY[0x1E0C998E0];
        v58 = (void *)*MEMORY[0x1E0CEC4F0];
        v13 = 0x1EE5C9000uLL;
        *(_QWORD *)&v11 = 138412546;
        v57 = v11;
        do
        {
          -[FPActionOperationInfo roots](self->_info, "roots", v57);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[FPMoveInfo rootFilenames](self->_info, "rootFilenames");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v13 + 4068)), "containsObject:", v15) & 1) == 0)
          {
            v64 = v17;
            if (objc_msgSend(v15, "isExternalURL"))
            {
              objc_msgSend(v15, "asURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "startAccessingSecurityScopedResource");
              v70 = 0;
              v71 = 0;
              v20 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v71, v60, &v70);
              v21 = v71;
              v62 = v70;
              if (!v20 || !v21)
              {
                fp_current_or_default_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v76 = v15;
                  v77 = 2112;
                  v78 = v62;
                  _os_log_error_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Failed to get type of %@ (%@)", buf, 0x16u);
                }

                v23 = objc_msgSend(v15, "isFolder");
                v24 = v59;
                if (v23)
                  v24 = v58;
                v25 = v24;

                v21 = v25;
              }
              if (v19)
                objc_msgSend(v18, "stopAccessingSecurityScopedResource");
              -[FPActionOperation stitcher](self, "stitcher");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "itemIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "providerDomainID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v64, v21, v61, v27, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placeholderIDsByRoot, "setObject:forKeyedSubscript:", v29, v15);

              v13 = 0x1EE5C9000;
              v30 = v62;
            }
            else
            {
              objc_msgSend(v15, "asFPItem");
              v21 = (id)objc_claimAutoreleasedReturnValue();
              if (-[FPMoveInfo byCopy](self->_info, "byCopy"))
              {
                -[FPActionOperation stitcher](self, "stitcher");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = -[FPMoveInfo lastUsedDatePolicy](self->_info, "lastUsedDatePolicy");
                objc_msgSend(v63, "itemIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "providerDomainID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "createPlaceholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:", v21, v31, v32, v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placeholderIDsByRoot, "setObject:forKeyedSubscript:", v34, v15);

              }
              else if (v63
                     && (objc_msgSend(v21, "providerDomainID"),
                         v35 = (void *)objc_claimAutoreleasedReturnValue(),
                         objc_msgSend(v63, "providerDomainID"),
                         v36 = (void *)objc_claimAutoreleasedReturnValue(),
                         v37 = objc_msgSend(v35, "isEqualToString:", v36),
                         v36,
                         v35,
                         v37))
              {
                -[FPActionOperation stitcher](self, "stitcher");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v68[0] = MEMORY[0x1E0C809B0];
                v68[1] = 3221225472;
                v68[2] = __40__FPMoveOperation__presendNotifications__block_invoke;
                v68[3] = &unk_1E444D648;
                v69 = v63;
                objc_msgSend(v38, "transformItems:handler:", v39, v68);

                v30 = v69;
              }
              else
              {
                -[FPActionOperation stitcher](self, "stitcher");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "deleteItems:", v41);

                -[FPActionOperation stitcher](self, "stitcher");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "itemIdentifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "providerDomainID");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = (id)objc_msgSend(v30, "createPlaceholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:", v21, 1, v42, v43);

              }
            }

            v17 = v64;
          }

          ++v12;
          -[FPActionOperationInfo roots](self->_info, "roots");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

        }
        while (v12 < v46);
      }
      if (v63)
      {
        -[FPMoveInfo targetFolder](self->_info, "targetFolder");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "asFPItem");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "childItemCount");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          -[FPActionOperationInfo roots](self->_info, "roots");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "count");

          -[FPActionOperation stitcher](self, "stitcher");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPMoveInfo targetFolder](self->_info, "targetFolder");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "asFPItem");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v54;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __40__FPMoveOperation__presendNotifications__block_invoke_2;
          v65[3] = &unk_1E444D670;
          v66 = v49;
          v67 = v51;
          objc_msgSend(v52, "transformItems:handler:", v55, v65);

        }
      }
      -[FPActionOperation stitcher](self, "stitcher");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "flush");

    }
  }
}

void __40__FPMoveOperation__presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParentItemIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderDomainID:", v6);

}

void __40__FPMoveOperation__presendNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setState:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40) + objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChildItemCount:", v4);

}

- (void)presendNotifications
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  if (self->_isScheduledFromThisClient)
  {
    -[FPOperation callbackQueue](self, "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v3);

    -[FPOperation callbackQueue](self, "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v4);

    -[FPOperation callbackQueue](self, "callbackQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FPMoveOperation_presendNotifications__block_invoke;
    block[3] = &unk_1E444A308;
    block[4] = self;
    dispatch_sync(v5, block);

  }
}

uint64_t __39__FPMoveOperation_presendNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presendNotifications");
}

- (BOOL)byCopy
{
  return 0;
}

- (unint64_t)defaultLastUsedDatePolicy
{
  return 1;
}

- (void)runUserInteractionsPreflight:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  __CFString **v20;
  __CFString *v21;
  _BOOL4 v22;
  NSObject *v23;
  __CFString **v24;
  __CFString *v25;
  __CFString *v26;
  _BOOL4 v27;
  __CFString **v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _BYTE *v40;
  _QWORD v41[4];
  NSObject *v42;
  _BYTE *v43;
  _QWORD v44[4];
  NSObject *v45;
  _BYTE *v46;
  _QWORD block[4];
  __CFString *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[FPActionOperation setupRemoteOperationService](self, "setupRemoteOperationService"))
  {
    -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExcludedFromSync");

    if ((v8 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "providerDomainID");
      v9 = objc_claimAutoreleasedReturnValue();

    }
    -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isExcludedFromSync") & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isIgnoreRoot");

      if ((v16 & 1) != 0)
      {
        v13 = 0;
        goto LABEL_12;
      }
      -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "providerDomainID");
      v13 = objc_claimAutoreleasedReturnValue();
    }

LABEL_12:
    if (!(v9 | v13))
    {
      -[FPOperation callbackQueue](self, "callbackQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke;
      block[3] = &unk_1E444A840;
      v48 = (__CFString *)v5;
      dispatch_async(v23, block);

      v21 = v48;
LABEL_57:

      goto LABEL_58;
    }
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v50 = (uint64_t (*)(uint64_t, uint64_t))v13;
      _os_log_debug_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: preflighting for moving items from %@ to %@", buf, 0x20u);
    }

    if (v9)
      v18 = v13 != 0;
    else
      v18 = 1;
    if (!v18)
      goto LABEL_22;
    if (v9 && v13)
    {
      if ((objc_msgSend((id)v9, "isEqualToString:", v13) & 1) == 0)
      {
LABEL_22:
        v19 = -[FPMoveOperation byCopy](self, "byCopy");
        v20 = FPPreflightActionCopyOut;
        if (!v19)
          v20 = FPPreflightActionMoveOut;
        v21 = *v20;
        if (!v13)
        {
          v26 = 0;
          goto LABEL_43;
        }
        if (!-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight")
          && !-[FPMoveOperation byCopy](self, "byCopy")
          && !-[FPActionOperation finishAfterPreflight](self, "finishAfterPreflight")
          && !-[FPMoveOperation byCopy](self, "byCopy"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPMoveOperation.m"), 977, CFSTR("cross-domain moves only support preflight, not execution"));

        }
        v22 = -[FPMoveOperation byCopy](self, "byCopy");
        goto LABEL_35;
      }
    }
    else if (!v9 && v13)
    {
      v22 = -[FPMoveOperation byCopy](self, "byCopy");
      v21 = 0;
LABEL_35:
      v24 = FPPreflightActionCopyIn;
      if (!v22)
        v24 = FPPreflightActionMoveIn;
      v25 = *v24;
      v26 = v25;
LABEL_41:
      v29 = v25;
LABEL_43:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v50 = __Block_byref_object_copy__16;
      v51 = __Block_byref_object_dispose__16;
      v52 = 0;
      v52 = (id)objc_opt_new();
      v30 = dispatch_group_create();
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[FPMoveOperation runUserInteractionsPreflight:].cold.1((uint64_t)self);

      if (v21)
      {
        dispatch_group_enter(v30);
        -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v33 = 0;
        }
        else
        {
          -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_62;
        v44[3] = &unk_1E444D698;
        v46 = buf;
        v45 = v30;
        -[FPMoveOperation gatherErrorsForUserInteractionForDomain:action:sourceItems:destinationItem:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:](self, "gatherErrorsForUserInteractionForDomain:action:sourceItems:destinationItem:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:", v9, v21, v32, v33, 0, 0, v44);
        if (!v26)

      }
      if (v26)
      {
        dispatch_group_enter(v30);
        fp_current_or_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[FPMoveOperation runUserInteractionsPreflight:].cold.1((uint64_t)self);

        -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_63;
        v41[3] = &unk_1E444D698;
        v43 = buf;
        v42 = v30;
        -[FPMoveOperation gatherErrorsForUserInteractionForDomain:action:sourceItems:destinationItem:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:](self, "gatherErrorsForUserInteractionForDomain:action:sourceItems:destinationItem:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:", v13, v26, 0, v35, 0, 0, v41);

      }
      -[FPOperation callbackQueue](self, "callbackQueue");
      v36 = objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2;
      v38[3] = &unk_1E444D6C0;
      v40 = buf;
      v38[4] = self;
      v39 = v5;
      dispatch_group_notify(v30, v36, v38);

      _Block_object_dispose(buf, 8);
      goto LABEL_57;
    }
    v27 = -[FPMoveOperation byCopy](self, "byCopy");
    v26 = 0;
    v28 = FPPreflightActionCopy;
    if (!v27)
      v28 = FPPreflightActionMove;
    v25 = *v28;
    v21 = v25;
    goto LABEL_41;
  }
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_58:

}

uint64_t __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("description"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2_cold_1(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)gatherErrorsForUserInteractionForDomain:(id)a3 action:(id)a4 sourceItems:(id)a5 destinationItem:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[FPActionOperation itemManager](self, "itemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke;
  v30[3] = &unk_1E444D710;
  v36 = v20;
  v37 = v21;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v15;
  v35 = v19;
  v23 = v20;
  v24 = v19;
  v25 = v15;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v21;
  objc_msgSend(v22, "fetchOperationServiceForProviderDomainID:handler:", v25, v30);

}

void __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke_2;
    v11[3] = &unk_1E444D6E8;
    v12 = *(id *)(a1 + 80);
    objc_msgSend(v4, "userInteractionErrorsForPerformingAction:sourceItems:destinationItem:fpProviderDomainId:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:", v5, v6, v7, v8, v9, v10, v11);

  }
}

void __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)_preflightCheckProviderCanMoveWithErrors:(id *)a3
{
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  id *v30;
  id v32;
  FPMoveOperation *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!-[FPMoveInfo byMoving](self->_info, "byMoving"))
    return 1;
  v30 = a3;
  v33 = self;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExternalURL");

  if ((v6 & 1) != 0)
    return 1;
  -[FPActionOperation remoteService](v33, "remoteService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[FPActionOperation remoteService](v33, "remoteService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v33, CFSTR("FPMoveOperation.m"), 1085, CFSTR("cannot preflight without the service"));

    }
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__16;
  v43 = __Block_byref_object_dispose__16;
  v44 = 0;
  -[FPMoveInfo targetFolder](v33->_info, "targetFolder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asFPItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[FPActionOperationInfo roots](v33->_info, "roots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        if ((objc_msgSend(v16, "isExternalURL") & 1) == 0)
        {
          objc_msgSend(v16, "asFPItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "providerDomainID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "providerDomainID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v20 & 1) != 0)
          {
            objc_msgSend(v16, "asFPItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "itemID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v22);

LABEL_15:
            goto LABEL_18;
          }
          if (!-[FPActionOperation finishAfterPreflight](v33, "finishAfterPreflight")
            && !-[FPActionOperation finishAfterPreflight](v33, "finishAfterPreflight"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v33, CFSTR("FPMoveOperation.m"), 1098, CFSTR("only preflight is supported on cross-domain moves"));
            goto LABEL_15;
          }
        }
LABEL_18:
        ++v15;
      }
      while (v13 != v15);
      v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      v13 = v23;
    }
    while (v23);
  }

  if (objc_msgSend(v32, "count"))
  {
    -[FPActionOperation remoteService](v33, "remoteService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "synchronousRemoteObjectProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __60__FPMoveOperation__preflightCheckProviderCanMoveWithErrors___block_invoke;
    v34[3] = &unk_1E444D738;
    v34[4] = &v39;
    objc_msgSend(v25, "preflightReparentItemIDs:underParentID:reply:", v32, v26, v34);

  }
  v27 = objc_msgSend((id)v40[5], "count");
  if (v30 && v27)
    *v30 = objc_retainAutorelease((id)v40[5]);
  v7 = objc_msgSend((id)v40[5], "count") == 0;

  _Block_object_dispose(&v39, 8);
  return v7;
}

void __60__FPMoveOperation__preflightCheckProviderCanMoveWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (v5)
    a2 = v4;
  objc_storeStrong(v3, a2);
}

- (BOOL)_preflightCheckNotMovingIntoSelfWithError:(id *)a3
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  NSDictionary *errorsByItem;
  NSDictionary *v27;
  void *v28;
  dispatch_group_t group;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  NSDictionary *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  dispatch_group_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExternalURL");

  if ((v4 & 1) != 0)
    return 1;
  -[FPMoveInfo targetFolder](self->_info, "targetFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asFPItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__16;
  v62 = __Block_byref_object_dispose__16;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__16;
  v56 = __Block_byref_object_dispose__16;
  v57 = 0;
  v38 = (NSDictionary *)objc_opt_new();
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  -[FPActionOperation itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __61__FPMoveOperation__preflightCheckNotMovingIntoSelfWithError___block_invoke;
  v48[3] = &unk_1E444D760;
  v50 = &v52;
  v51 = &v58;
  group = v7;
  v49 = group;
  objc_msgSend(v8, "fetchParentsForItemID:recursively:completionHandler:", v9, 1, v48);

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v59[5], "arrayByAddingObject:", v32);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v59[5];
  v59[5] = v10;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[FPActionOperationInfo roots](self->_info, "roots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v45;
    v37 = *MEMORY[0x1E0CB28A8];
    obj = v12;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isExternalURL") & 1) == 0)
        {
          objc_msgSend(v13, "asFPItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v15 = (id)v59[5];
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v41 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                objc_msgSend(v14, "itemID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "itemID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v19) = objc_msgSend(v20, "isEqual:", v21);

                if ((_DWORD)v19)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v37, 512, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[FPMoveOperation byCopy](self, "byCopy"))
                    v23 = CFSTR("Copy");
                  else
                    v23 = CFSTR("Move");
                  objc_msgSend(v22, "fp_annotatedErrorWithItem:variant:", v14, v23);
                  v24 = objc_claimAutoreleasedReturnValue();
                  v25 = (void *)v53[5];
                  v53[5] = v24;

                  -[NSDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v53[5], v14);
                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
            }
            while (v16);
          }

        }
      }
      v12 = obj;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
    }
    while (v35);
  }

  errorsByItem = self->_errorsByItem;
  self->_errorsByItem = v38;
  v27 = v38;

  v28 = (void *)v53[5];
  if (a3 && v28)
  {
    *a3 = objc_retainAutorelease(v28);
    v28 = (void *)v53[5];
  }
  v5 = v28 == 0;

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v5;
}

void __61__FPMoveOperation__preflightCheckNotMovingIntoSelfWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
    v10 = v8;
  else
    v10 = a3;
  objc_storeStrong(v7, v10);
  v14 = a3;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_preflightForceBounceIfCopyingOntoSelf
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_shouldBounceOnCollision)
  {
    -[FPMoveInfo targetFolder](self->_info, "targetFolder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isExternalURL");

    if ((v3 & 1) == 0)
    {
      -[FPMoveInfo targetFolder](self->_info, "targetFolder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asFPItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[FPActionOperationInfo roots](self->_info, "roots");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v31 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v24 = 0;
            v25 = &v24;
            v26 = 0x3032000000;
            v27 = __Block_byref_object_copy__16;
            v28 = __Block_byref_object_dispose__16;
            v29 = 0;
            if (objc_msgSend(v10, "isProviderItem"))
            {
              objc_msgSend(v10, "asFPItem");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = 0;
            }
            v29 = v11;
            if (!v25[5] && objc_msgSend(v10, "isExternalURL"))
            {
              v12 = dispatch_semaphore_create(0);
              -[FPActionOperation itemManager](self, "itemManager");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "asURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v21[0] = MEMORY[0x1E0C809B0];
              v21[1] = 3221225472;
              v21[2] = __57__FPMoveOperation__preflightForceBounceIfCopyingOntoSelf__block_invoke;
              v21[3] = &unk_1E444D788;
              v23 = &v24;
              v15 = v12;
              v22 = v15;
              objc_msgSend(v13, "fetchItemForURL:completionHandler:", v14, v21);

              dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
            }
            v16 = (void *)v25[5];
            if (v16)
            {
              objc_msgSend(v16, "parentItemID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "itemID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqual:", v18);

              if (v19)
              {
                self->_shouldBounceOnCollision = 1;
                _Block_object_dispose(&v24, 8);

                goto LABEL_20;
              }
            }
            _Block_object_dispose(&v24, 8);

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_20:

    }
  }
}

void __57__FPMoveOperation__preflightForceBounceIfCopyingOntoSelf__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  id v12;
  id v13;

  v5 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[FPMoveOperation _recomputeMoveInfoIfNecessary](self, "_recomputeMoveInfoIfNecessary");
  v13 = 0;
  -[FPMoveOperation _preflightCheckNotMovingIntoSelfWithError:](self, "_preflightCheckNotMovingIntoSelfWithError:", &v13);
  v7 = v13;
  v12 = 0;
  -[FPMoveOperation _preflightCheckProviderCanMoveWithErrors:](self, "_preflightCheckProviderCanMoveWithErrors:", &v12);
  v8 = v12;
  -[FPMoveOperation _preflightForceBounceIfCopyingOntoSelf](self, "_preflightForceBounceIfCopyingOntoSelf");
  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "addObject:", v7);
  if (v8)
    objc_msgSend(v10, "addObjectsFromArray:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FPMoveOperation_subclassPreflightWithCompletion___block_invoke;
  v11[3] = &unk_1E444D7B0;
  v11[4] = self;
  v11[5] = a2;
  -[FPActionOperation tryRecoveringFromPreflightErrors:recoveryHandler:completion:](self, "tryRecoveringFromPreflightErrors:recoveryHandler:completion:", v10, v11, v5);

}

uint64_t __51__FPMoveOperation_subclassPreflightWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (!a3)
    goto LABEL_5;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPMoveOperation.m"), 1238, CFSTR("UNREACHABLE: invalid index for error: %@"), v5);

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 1;
LABEL_6:

  return v6;
}

- (void)_t_unblockReader
{
  NSObject *v3;
  _QWORD block[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPMoveOperation__t_unblockReader__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __35__FPMoveOperation__t_unblockReader__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "_t_unblockReader");
}

- (void)_resetOperationBeforeErrorRecovery
{
  NSObject *v3;
  void *v4;

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finish");

  -[FPActionOperation resetStitcher](self, "resetStitcher");
  -[FPOperation resetRemoteOperation](self, "resetRemoteOperation");
}

- (void)_scheduleAgainAfterErrorRecovery
{
  NSObject *v4;
  void *v5;

  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!self->_isScheduledFromThisClient)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPMoveOperation.m"), 1269, CFSTR("retrying remote operations is not supported"));

  }
  -[FPMoveOperation _presendNotifications](self, "_presendNotifications");
  -[FPMoveOperation actionMain](self, "actionMain");
}

- (id)fp_prettyDescription
{
  _BOOL4 v3;
  NSArray *sourceURLs;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[FPMoveOperation byCopy](self, "byCopy");
  sourceURLs = self->__sourceURLs;
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    if (sourceURLs)
      -[NSArray fp_map:](sourceURLs, "fp_map:", &__block_literal_global_81);
    else
      -[NSArray fp_itemIdentifiers](self->__sourceItems, "fp_itemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("copy items (%@)"), v7);
  }
  else
  {
    if (sourceURLs)
      -[NSArray fp_map:](sourceURLs, "fp_map:", &__block_literal_global_86);
    else
      -[NSArray fp_itemIdentifiers](self->__sourceItems, "fp_itemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("move items (%@)"), v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __39__FPMoveOperation_fp_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_shortDescription");
}

uint64_t __39__FPMoveOperation_fp_prettyDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_shortDescription");
}

- (NSDictionary)errorsByItem
{
  return self->_errorsByItem;
}

- (NSDictionary)targetFilenamesByURL
{
  return self->__targetFilenamesByURL;
}

- (void)setTargetFilenamesByURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSDictionary)targetFilenamesByItem
{
  return self->__targetFilenamesByItem;
}

- (void)setTargetFilenamesByItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSDictionary)transferResults
{
  return self->_transferResults;
}

- (unint64_t)lastUsageUpdatePolicy
{
  return self->__lastUsedDatePolicy;
}

- (void)setLastUsageUpdatePolicy:(unint64_t)a3
{
  self->__lastUsedDatePolicy = a3;
}

- (BOOL)shouldBounceOnCollision
{
  return self->_shouldBounceOnCollision;
}

- (void)setShouldBounceOnCollision:(BOOL)a3
{
  self->_shouldBounceOnCollision = a3;
}

- (NSDictionary)transferLocations
{
  return self->_transferLocations;
}

- (NSMutableDictionary)filenamesByURL
{
  return self->_filenamesByURL;
}

- (NSDictionary)progressByRoot
{
  return &self->_progressByRoot->super;
}

- (void)setProgressByRoot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (id)_t_patchActionOperationInfo
{
  return self->__t_patchActionOperationInfo;
}

- (void)set_t_patchActionOperationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (id)_t_remoteOperationWasScheduled
{
  return self->__t_remoteOperationWasScheduled;
}

- (void)set_t_remoteOperationWasScheduled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (id)_t_rootCompleted
{
  return self->__t_rootCompleted;
}

- (void)set_t_rootCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_rootCompleted, 0);
  objc_storeStrong(&self->__t_remoteOperationWasScheduled, 0);
  objc_storeStrong(&self->__t_patchActionOperationInfo, 0);
  objc_storeStrong((id *)&self->_filenamesByURL, 0);
  objc_storeStrong((id *)&self->_transferLocations, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_transferResults, 0);
  objc_storeStrong((id *)&self->_errorsByItem, 0);
  objc_storeStrong((id *)&self->_URLByResolvedFPItem, 0);
  objc_storeStrong((id *)&self->_placeholderIDsByRoot, 0);
  objc_storeStrong((id *)&self->_createdItemsByRoot, 0);
  objc_storeStrong((id *)&self->_createdOrFailedRoots, 0);
  objc_storeStrong((id *)&self->_remoteMoveOperation, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->__targetFilenamesByItem, 0);
  objc_storeStrong((id *)&self->__targetFilenamesByURL, 0);
  objc_storeStrong((id *)&self->__destinationFolder, 0);
  objc_storeStrong((id *)&self->__destinationURL, 0);
  objc_storeStrong((id *)&self->__sourceItems, 0);
  objc_storeStrong((id *)&self->__sourceURLs, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)_resolveURLsWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] No read permission for source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_resolveURLsWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] No write permission to destination: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 472), "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: destination URL %@ resolved to item %@", (uint8_t *)&v7, 0x20u);

}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_22_cold_1()
{
  __assert_rtn("-[FPMoveOperation _resolveURLsWithCompletionHandler:]_block_invoke", "FPMoveOperation.m", 406, "externalURLS.count + items.count == self->__sourceURLs.count + self->__sourceItems.count");
}

- (void)_recoverFromCollisionError:(os_log_t)log withPolicy:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] file provider extension sent a collision error without an item", v1, 2u);
}

- (void)runUserInteractionsPreflight:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] %@: running user interaction preflight for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] %@: returning %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

@end
