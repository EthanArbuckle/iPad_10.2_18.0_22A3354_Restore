@implementation CoreDAVMultiMoveWithFallbackTaskGroup

- (CoreDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 accountInfoProvider:(id)a10 taskManager:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CoreDAVMultiMoveWithFallbackTaskGroup *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  NSMutableSet *destinationURLs;
  void *v38;
  void *v39;
  uint64_t v40;
  NSMutableDictionary *destinationEntityETags;
  void *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  id v62;
  _BOOL4 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  uint64_t v70;

  v63 = a6;
  v70 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  obj = a7;
  v18 = a7;
  v62 = a8;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v68.receiver = self;
  v68.super_class = (Class)CoreDAVMultiMoveWithFallbackTaskGroup;
  v23 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v68, sel_initWithAccountInfoProvider_taskManager_, v21, v22);
  if (!v23)
    goto LABEL_19;
  if (!v16 || !objc_msgSend(v16, "count"))
  {
    v49 = (void *)MEMORY[0x24BDBCE88];
    v50 = *MEMORY[0x24BDBCAB8];
    v51 = CFSTR("Non-nil and non-empty sourceURLs set required.");
    goto LABEL_25;
  }
  v54 = a3;
  v55 = a4;
  v56 = v22;
  v57 = v21;
  v58 = v20;
  v59 = v19;
  v60 = v18;
  if (!v17
    || (objc_msgSend(v17, "CDVRawPath"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "length"),
        v24,
        !v25))
  {
    v49 = (void *)MEMORY[0x24BDBCE88];
    v50 = *MEMORY[0x24BDBCAB8];
    v51 = CFSTR("Non-nil and non-zero length destinationURL required.");
LABEL_25:
    objc_msgSend(v49, "exceptionWithName:reason:userInfo:", v50, v51, 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v65 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v31, "CDVRawPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "length");

        if (!v33)
        {
          v43 = (void *)MEMORY[0x24BDBCE88];
          v44 = *MEMORY[0x24BDBCAB8];
          v45 = (void *)MEMORY[0x24BDD17C8];
          v46 = CFSTR("Non-zero length sourceURL required.");
          goto LABEL_22;
        }
        objc_msgSend(v31, "URLByDeletingLastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqual:", v17);

        if (v35)
        {
          v43 = (void *)MEMORY[0x24BDBCE88];
          v44 = *MEMORY[0x24BDBCAB8];
          v45 = (void *)MEMORY[0x24BDD17C8];
          v53 = v31;
          v46 = CFSTR("The value for sourceURL and the value for destinationURL must not be the same. A sourceURL is already present in destination path: %@");
          goto LABEL_22;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v28);
  }

  v19 = v59;
  v18 = v60;
  if (v63 && (!v60 || !v59))
  {
    v43 = (void *)MEMORY[0x24BDBCE88];
    v44 = *MEMORY[0x24BDBCAB8];
    v45 = (void *)MEMORY[0x24BDD17C8];
    v46 = CFSTR("Asked to create a taskgroup with fallback, but some required data for PUT is missing.");
LABEL_22:
    objc_msgSend(v45, "stringWithFormat:", v46, v53, v54, v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "exceptionWithName:reason:userInfo:", v44, v47, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v48);
  }
  v23->_useFallback = v63;
  objc_storeStrong((id *)&v23->_sourceEntityDataPayloads, obj);
  objc_storeStrong((id *)&v23->_sourceEntityDataContentTypes, v62);
  objc_storeStrong((id *)&v23->_sourceEntityETags, a9);
  objc_storeStrong((id *)&v23->_sourceURLs, v54);
  objc_storeStrong((id *)&v23->_destinationURL, v55);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[NSSet count](v23->_sourceURLs, "count"));
  v36 = objc_claimAutoreleasedReturnValue();
  destinationURLs = v23->_destinationURLs;
  v23->_destinationURLs = (NSMutableSet *)v36;

  v38 = (void *)MEMORY[0x24BDBCED8];
  -[CoreDAVMultiMoveWithFallbackTaskGroup sourceURLs](v23, "sourceURLs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
  v40 = objc_claimAutoreleasedReturnValue();
  destinationEntityETags = v23->_destinationEntityETags;
  v23->_destinationEntityETags = (NSMutableDictionary *)v40;

  v21 = v57;
  v20 = v58;
  v22 = v56;
LABEL_19:

  return v23;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("CoreDAVMultiMoveWithFallbackTaskGroup:"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSource urls: %@"), self->_sourceURLs);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDestination url: %@"), self->_destinationURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tOverwrite: %i"), self->_overwrite);
  return v3;
}

- (id)fullDestinationURLFromSourceURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF48];
  -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVMultiMoveWithFallbackTaskGroup destinationURL](self, "destinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:relativeToURL:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filenameFromURL:(id)a3
{
  return (id)objc_msgSend(a3, "lastPathComponent");
}

- (void)startTaskGroup
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *outstandingSourceURLsToMove;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[CoreDAVMultiMoveWithFallbackTaskGroup sourceURLs](self, "sourceURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  outstandingSourceURLsToMove = self->_outstandingSourceURLsToMove;
  self->_outstandingSourceURLsToMove = v6;

  -[CoreDAVMultiMoveWithFallbackTaskGroup processOutstandingTasks](self, "processOutstandingTasks");
}

- (void)processOutstandingTasks
{
  NSMutableArray *outstandingSourceURLsToMove;
  void *v4;
  void *v5;
  CoreDAVMoveTask *v6;
  void *v7;
  CoreDAVMoveTask *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CoreDAVMultiMoveWithFallbackTaskGroup *v22;
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  CoreDAVMoveTask *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  outstandingSourceURLsToMove = self->_outstandingSourceURLsToMove;
  if (outstandingSourceURLsToMove && -[NSMutableArray count](outstandingSourceURLsToMove, "count"))
  {
    -[CoreDAVMultiMoveWithFallbackTaskGroup outstandingSourceURLsToMove](self, "outstandingSourceURLsToMove");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [CoreDAVMoveTask alloc];
    -[CoreDAVMultiMoveWithFallbackTaskGroup fullDestinationURLFromSourceURL:](self, "fullDestinationURLFromSourceURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CoreDAVCopyOrMoveTask initWithSourceURL:destinationURL:andOverwrite:](v6, "initWithSourceURL:destinationURL:andOverwrite:", v5, v7, -[CoreDAVMultiMoveWithFallbackTaskGroup overwrite](self, "overwrite"));

    -[CoreDAVMultiMoveWithFallbackTaskGroup sourceEntityETags](self, "sourceEntityETags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVMoveTask setPreviousETag:](v8, "setPreviousETag:", v11);

    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask setAccountInfoProvider:](v8, "setAccountInfoProvider:", v12);

    -[CoreDAVTask setTimeoutInterval:](v8, "setTimeoutInterval:", self->super._timeoutInterval);
    objc_initWeak(&location, v8);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __64__CoreDAVMultiMoveWithFallbackTaskGroup_processOutstandingTasks__block_invoke;
    v21 = &unk_24C1D9B30;
    objc_copyWeak(&v24, &location);
    v22 = self;
    v13 = v5;
    v23 = v13;
    -[CoreDAVTask setCompletionBlock:](v8, "setCompletionBlock:", &v18);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging", v18, v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v8;
        _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_INFO, "[multi-move] ~  Multi-move task group starting:\n%@", buf, 0xCu);
      }
    }

    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v8);
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitQueuedCoreDAVTask:", v8);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  else
  {
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);
  }
}

void __64__CoreDAVMultiMoveWithFallbackTaskGroup_processOutstandingTasks__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(*(id *)(a1 + 32), "outstandingSourceURLsToMove");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "_completedMoveTask:sourceURL:", v4, *(_QWORD *)(a1 + 40));
    WeakRetained = v4;
  }

}

- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  uint8_t v17[16];

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  v10 = a3;
  -[CoreDAVMultiMoveWithFallbackTaskGroup destinationEntityETags](self, "destinationEntityETags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVMultiMoveWithFallbackTaskGroup _eTagFromTaskResponseHeaders:](self, "_eTagFromTaskResponseHeaders:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKey:", v12, v13);
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v14, "logHandleForAccountInfoProvider:", WeakRetained);
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", v17, 2u);
  }

  if (v8)
    v8[2](v8);

}

- (id)_eTagFromTaskResponseHeaders:(id)a3
{
  return (id)objc_msgSend(a3, "CDVObjectForKeyCaseInsensitive:", CFSTR("ETag"));
}

- (void)_completedMoveTask:(id)a3 sourceURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  CoreDAVPutTask *v30;
  void *v31;
  void *v32;
  void *v33;
  CoreDAVPutTask *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v8, "logHandleForAccountInfoProvider:", WeakRetained);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v7;
    _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_DEBUG, "[multi-move] ~ Completion block for %@", buf, 0xCu);
  }

  objc_msgSend(v6, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
      v14 = objc_msgSend(v12, "code");
    else
      v14 = 0;

    if (self->_useFallback && ((unint64_t)(v14 - 403) < 3 || v14 == 501))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v21, "logHandleForAccountInfoProvider:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v7;
        _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_INFO, "[multi-move] ~  Move of %@ failed, trying a PUT as fallback", buf, 0xCu);
      }

      -[CoreDAVMultiMoveWithFallbackTaskGroup sourceEntityDataPayloads](self, "sourceEntityDataPayloads");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v25);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[CoreDAVMultiMoveWithFallbackTaskGroup sourceEntityDataContentTypes](self, "sourceEntityDataContentTypes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", v27);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[CoreDAVMultiMoveWithFallbackTaskGroup fullDestinationURLFromSourceURL:](self, "fullDestinationURLFromSourceURL:", v7);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v44 && v43 && v28)
      {
        v30 = [CoreDAVPutTask alloc];
        -[CoreDAVMultiMoveWithFallbackTaskGroup sourceEntityETags](self, "sourceEntityETags");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v30, "initWithDataPayload:dataContentType:atURL:previousETag:", v44, v43, v29, v33);

        v35 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        -[CoreDAVTask setAccountInfoProvider:](v34, "setAccountInfoProvider:", v35);

        objc_initWeak((id *)buf, v34);
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke;
        v48[3] = &unk_24C1D9B30;
        objc_copyWeak(&v50, (id *)buf);
        v48[4] = self;
        v49 = v7;
        -[CoreDAVTask setCompletionBlock:](v34, "setCompletionBlock:", v48);
        -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v34);
        -[CoreDAVTaskGroup taskManager](self, "taskManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "submitQueuedCoreDAVTask:", v34);

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v40, "logHandleForAccountInfoProvider:", v41);
        v42 = objc_claimAutoreleasedReturnValue();

        if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v7;
          _os_log_impl(&dword_209602000, v42, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ PUT failed for %@. Missing local data.", buf, 0xCu);
        }

        -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v12, 0);
      }

    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v37, "logHandleForAccountInfoProvider:", v38);
      v39 = objc_claimAutoreleasedReturnValue();

      if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v7;
        _os_log_impl(&dword_209602000, v39, OS_LOG_TYPE_DEFAULT, "[multi-move] ~  Move failed for %@", buf, 0xCu);
      }

      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v12, 0);
    }
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v15, "logHandleForAccountInfoProvider:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v7;
      _os_log_impl(&dword_209602000, v17, OS_LOG_TYPE_INFO, "[multi-move] ~  Move succeded for %@", buf, 0xCu);
    }

    -[CoreDAVMultiMoveWithFallbackTaskGroup fullDestinationURLFromSourceURL:](self, "fullDestinationURLFromSourceURL:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    objc_msgSend(v6, "responseHeaders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke_27;
    v45[3] = &unk_24C1D9A90;
    objc_copyWeak(&v47, (id *)buf);
    v20 = v18;
    v46 = v20;
    -[CoreDAVMultiMoveWithFallbackTaskGroup _setTagsForDestinationEntityAtURL:fromTaskResponseHeaders:completionBlock:](self, "_setTagsForDestinationEntityAtURL:fromTaskResponseHeaders:completionBlock:", v20, v19, v45);

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);

  }
}

void __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(*(id *)(a1 + 32), "_completedPutTask:sourceURL:", v3, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __70__CoreDAVMultiMoveWithFallbackTaskGroup__completedMoveTask_sourceURL___block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "destinationURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v4, "processOutstandingTasks");
    WeakRetained = v4;
  }

}

- (void)_completedPutTask:(id)a3 sourceURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT to %@ failed", buf, 0xCu);

      }
    }

    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v8, 0);
  }
  else
  {
    if (v11)
    {
      v14 = v11;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v15;
        _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT succeded at %@", buf, 0xCu);

      }
    }

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "responseHeaders");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback PUT Responses are: %@", buf, 0xCu);

      }
    }

    -[CoreDAVMultiMoveWithFallbackTaskGroup fullDestinationURLFromSourceURL:](self, "fullDestinationURLFromSourceURL:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    objc_msgSend(v6, "responseHeaders");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke;
    v24[3] = &unk_24C1D9B08;
    objc_copyWeak(&v28, (id *)buf);
    v23 = v21;
    v25 = v23;
    v26 = v6;
    v27 = v7;
    -[CoreDAVMultiMoveWithFallbackTaskGroup _setTagsForDestinationEntityAtURL:fromTaskResponseHeaders:completionBlock:](self, "_setTagsForDestinationEntityAtURL:fromTaskResponseHeaders:completionBlock:", v23, v22, v24);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
}

void __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  CoreDAVDeleteTask *v10;
  id v11;
  id *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "destinationURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v3 + 2);
    objc_msgSend(v5, "logHandleForAccountInfoProvider:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_INFO, "[multi-move] ~  Going to do a DELETE of the sourceURL now (put to %@)", buf, 0xCu);

      }
    }

    v10 = -[CoreDAVTask initWithURL:]([CoreDAVDeleteTask alloc], "initWithURL:", *(_QWORD *)(a1 + 48));
    v11 = objc_loadWeakRetained(v3 + 2);
    -[CoreDAVTask setAccountInfoProvider:](v10, "setAccountInfoProvider:", v11);

    objc_initWeak((id *)buf, v10);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke_29;
    v17 = &unk_24C1D9A90;
    objc_copyWeak(&v19, (id *)buf);
    v12 = v3;
    v18 = v12;
    -[CoreDAVTask setCompletionBlock:](v10, "setCompletionBlock:", &v14);
    objc_msgSend(v12[4], "addObject:", v10, v14, v15, v16, v17);
    objc_msgSend(v12, "taskManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitQueuedCoreDAVTask:", v10);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

  }
}

void __69__CoreDAVMultiMoveWithFallbackTaskGroup__completedPutTask_sourceURL___block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v3, "logHandleForAccountInfoProvider:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(WeakRetained, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "[multi-move] ~  Move-fallback DELETE completed with error: %@", (uint8_t *)&v11, 0xCu);

      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
    objc_msgSend(WeakRetained, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(WeakRetained, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v10, 0);

    }
    else
    {
      objc_msgSend(v9, "processOutstandingTasks");
    }
  }

}

- (NSSet)sourceURLs
{
  return self->_sourceURLs;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int)overwrite
{
  return self->_overwrite;
}

- (BOOL)useFallback
{
  return self->_useFallback;
}

- (NSDictionary)sourceEntityDataPayloads
{
  return self->_sourceEntityDataPayloads;
}

- (NSDictionary)sourceEntityDataContentTypes
{
  return self->_sourceEntityDataContentTypes;
}

- (NSDictionary)sourceEntityETags
{
  return self->_sourceEntityETags;
}

- (NSMutableDictionary)destinationEntityETags
{
  return self->_destinationEntityETags;
}

- (NSMutableSet)destinationURLs
{
  return self->_destinationURLs;
}

- (NSMutableArray)outstandingSourceURLsToMove
{
  return self->_outstandingSourceURLsToMove;
}

- (void)setOutstandingSourceURLsToMove:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingSourceURLsToMove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingSourceURLsToMove, 0);
  objc_storeStrong((id *)&self->_destinationEntityETags, 0);
  objc_storeStrong((id *)&self->_destinationURLs, 0);
  objc_storeStrong((id *)&self->_sourceEntityETags, 0);
  objc_storeStrong((id *)&self->_sourceEntityDataContentTypes, 0);
  objc_storeStrong((id *)&self->_sourceEntityDataPayloads, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURLs, 0);
}

@end
