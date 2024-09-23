@implementation CoreDAVBulkUploadTaskGroup

- (CoreDAVBulkUploadTaskGroup)initWithFolderURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  CoreDAVBulkUploadTaskGroup *v24;
  CoreDAVBulkUploadTaskGroup *v25;
  CoreDAVBulkUploadTaskGroup *v26;
  uint64_t v27;
  NSMutableDictionary *remainingUUIDsToAddActions;
  uint64_t v29;
  NSMutableDictionary *remainingHREFsToModDeleteActions;
  NSMutableDictionary *v31;
  NSMutableDictionary *uuidToHREF;
  NSMutableDictionary *v33;
  NSMutableDictionary *hrefToETag;
  NSMutableDictionary *v35;
  NSMutableDictionary *uuidToErrorItems;
  NSMutableDictionary *v37;
  NSMutableDictionary *hrefToErrorItems;
  NSMutableDictionary *v39;
  NSMutableDictionary *uuidToStatus;
  NSMutableDictionary *v41;
  NSMutableDictionary *hrefToStatus;
  id v44;
  objc_super v45;

  v17 = a3;
  v44 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (-[CoreDAVBulkUploadTaskGroup isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVBulkUploadTaskGroup.m"), 50, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v24 = 0;
  }
  else
  {
    v45.receiver = self;
    v45.super_class = (Class)CoreDAVBulkUploadTaskGroup;
    v25 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v45, sel_initWithAccountInfoProvider_taskManager_, v21, v22);
    v26 = v25;
    if (v25)
    {
      -[CoreDAVTaskGroup setContext:](v25, "setContext:", v20);
      objc_storeStrong((id *)&v26->_folderURL, a3);
      objc_storeStrong((id *)&v26->_lastKnownCTag, a4);
      v26->_multiPutBatchMaxNumResources = 25;
      v26->_multiPutBatchMaxSize = 0;
      v27 = objc_msgSend(v18, "mutableCopy");
      remainingUUIDsToAddActions = v26->_remainingUUIDsToAddActions;
      v26->_remainingUUIDsToAddActions = (NSMutableDictionary *)v27;

      v29 = objc_msgSend(v19, "mutableCopy");
      remainingHREFsToModDeleteActions = v26->_remainingHREFsToModDeleteActions;
      v26->_remainingHREFsToModDeleteActions = (NSMutableDictionary *)v29;

      v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToHREF = v26->_uuidToHREF;
      v26->_uuidToHREF = v31;

      v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToETag = v26->_hrefToETag;
      v26->_hrefToETag = v33;

      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToErrorItems = v26->_uuidToErrorItems;
      v26->_uuidToErrorItems = v35;

      v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToErrorItems = v26->_hrefToErrorItems;
      v26->_hrefToErrorItems = v37;

      v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToStatus = v26->_uuidToStatus;
      v26->_uuidToStatus = v39;

      v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToStatus = v26->_hrefToStatus;
      v26->_hrefToStatus = v41;

    }
    self = v26;
    v24 = self;
  }

  return v24;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: NumRemainingAdds %d NumRemainingModDeletes %d"), v5, self, -[NSMutableDictionary count](self->_remainingUUIDsToAddActions, "count"), -[NSMutableDictionary count](self->_remainingHREFsToModDeleteActions, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (Class)multiPutTaskClass
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "multiPutTaskClass to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }

  return 0;
}

- (void)_sendNextBatch
{
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int *v12;
  void *v13;
  int v14;
  unint64_t v15;
  BOOL v16;
  unint64_t multiPutBatchMaxSize;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  unint64_t multiPutBatchMaxNumResources;
  BOOL v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id WeakRetained;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  id obja;
  id v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableDictionary count](self->_remainingUUIDsToAddActions, "count")
    || -[NSMutableDictionary count](self->_remainingHREFsToModDeleteActions, "count"))
  {
    v46 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v53 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[NSMutableDictionary allKeys](self->_remainingHREFsToModDeleteActions, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    if (v3)
    {
      v4 = 0;
      v5 = 0;
      v6 = *(_QWORD *)v67;
      v7 = &OBJC_IVAR___CoreDAVItem__attributes;
      v43 = *(_QWORD *)v67;
      while (2)
      {
        v8 = 0;
        LODWORD(v42) = v5;
        HIDWORD(v42) = v5 + v3;
        v49 = v3;
        v51 = v5 + 1;
        do
        {
          if (*(_QWORD *)v67 != v6)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v8);
          -[NSMutableDictionary objectForKey:](self->_remainingHREFsToModDeleteActions, "objectForKey:", v9, v42);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "action") == 1)
          {
            objc_msgSend(v10, "context");
            v47 = v4;
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "dataPayload");
            v12 = v7;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "length");

            v7 = v12;
            v4 = v47;
            v6 = v43;
          }
          else
          {
            v14 = 100;
          }
          v4 += v14;
          v15 = *(unint64_t *)((char *)&self->super.super.isa + v7[92]);
          if (v15)
            v16 = v15 >= (v51 + v8);
          else
            v16 = 1;
          if (!v16
            || (multiPutBatchMaxSize = self->_multiPutBatchMaxSize) != 0
            && (float)multiPutBatchMaxSize * 0.8 < (float)v4)
          {

            HIDWORD(v42) = v42 + v8 + 1;
            v18 = 1;
            goto LABEL_23;
          }
          objc_msgSend(v53, "setObject:forKey:", v10, v9);

          ++v8;
        }
        while (v49 != v8);
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        v18 = 0;
        v5 = HIDWORD(v42);
        if (v3)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
      v4 = 0;
      HIDWORD(v42) = 0;
    }
LABEL_23:

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v53, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v63 != v22)
            objc_enumerationMutation(v19);
          -[NSMutableDictionary removeObjectForKey:](self->_remainingHREFsToModDeleteActions, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v21);
    }

    if ((v18 & 1) == 0)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[NSMutableDictionary allKeys](self->_remainingUUIDsToAddActions, "allKeys");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      if (v52)
      {
        v48 = *(_QWORD *)v59;
        while (2)
        {
          v24 = 0;
          v50 = HIDWORD(v42) + 1;
          HIDWORD(v42) += v52;
          do
          {
            v25 = v4;
            if (*(_QWORD *)v59 != v48)
              objc_enumerationMutation(obja);
            v26 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v24);
            -[NSMutableDictionary objectForKey:](self->_remainingUUIDsToAddActions, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "context");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "dataPayload");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "length");

            multiPutBatchMaxNumResources = self->_multiPutBatchMaxNumResources;
            if (multiPutBatchMaxNumResources)
              v32 = multiPutBatchMaxNumResources >= (v50 + v24);
            else
              v32 = 1;
            if (!v32 || (v4 = v25 + v30, (v33 = self->_multiPutBatchMaxSize) != 0) && (float)v33 * 0.8 < (float)v4)
            {

              goto LABEL_47;
            }
            objc_msgSend(v46, "setObject:forKey:", v27, v26);

            ++v24;
          }
          while (v52 != v24);
          v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
          if (v52)
            continue;
          break;
        }
      }
LABEL_47:

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v46, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v55 != v37)
            objc_enumerationMutation(v34);
          -[NSMutableDictionary removeObjectForKey:](self->_remainingUUIDsToAddActions, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      }
      while (v36);
    }

    v39 = (void *)objc_msgSend(objc_alloc(-[CoreDAVBulkUploadTaskGroup multiPutTaskClass](self, "multiPutTaskClass")), "initWithURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:", self->_folderURL, self->_lastKnownCTag, v46, v53);
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v39);
    objc_msgSend(v39, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v39, "setAccountInfoProvider:", WeakRetained);

    objc_msgSend(v39, "setTimeoutInterval:", self->super._timeoutInterval);
    v41 = objc_loadWeakRetained((id *)&self->super._taskManager);
    objc_msgSend(v41, "submitQueuedCoreDAVTask:", v39);

  }
  else
  {
    self->_validCTag = 1;
    -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *uuidToHREF;
  void *v16;
  NSMutableDictionary *hrefToETag;
  void *v18;
  NSMutableDictionary *uuidToErrorItems;
  void *v20;
  NSMutableDictionary *hrefToErrorItems;
  void *v22;
  NSMutableDictionary *uuidToStatus;
  void *v24;
  NSMutableDictionary *hrefToStatus;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v6);
  v8 = v6;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "uuidToHREF");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hrefToETag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412802;
      v40 = v13;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "MultiPutTask finished.  uuidToHREF %@\nhrefToETAG %@\nerror %@", (uint8_t *)&v39, 0x20u);

    }
  }

  uuidToHREF = self->_uuidToHREF;
  objc_msgSend(v8, "uuidToHREF");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](uuidToHREF, "addEntriesFromDictionary:", v16);

  hrefToETag = self->_hrefToETag;
  objc_msgSend(v8, "hrefToETag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](hrefToETag, "addEntriesFromDictionary:", v18);

  uuidToErrorItems = self->_uuidToErrorItems;
  objc_msgSend(v8, "uuidToErrorItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](uuidToErrorItems, "addEntriesFromDictionary:", v20);

  hrefToErrorItems = self->_hrefToErrorItems;
  objc_msgSend(v8, "hrefToErrorItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](hrefToErrorItems, "addEntriesFromDictionary:", v22);

  uuidToStatus = self->_uuidToStatus;
  objc_msgSend(v8, "uuidToStatus");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](uuidToStatus, "addEntriesFromDictionary:", v24);

  hrefToStatus = self->_hrefToStatus;
  objc_msgSend(v8, "hrefToStatus");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](hrefToStatus, "addEntriesFromDictionary:", v26);

  if (v7)
  {
    if (objc_msgSend(v7, "code") == 412)
    {
      objc_msgSend(v7, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain"));

      if (v28)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v29, "logHandleForAccountInfoProvider:", v30);
        v31 = objc_claimAutoreleasedReturnValue();

        if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LOWORD(v39) = 0;
          _os_log_impl(&dword_209602000, v31, OS_LOG_TYPE_INFO, "MultiPutTask told that our ctag was out of date.  Bailing on the group", (uint8_t *)&v39, 2u);
        }

        self->_validCTag = 0;
      }
    }
    -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", v7);
  }
  else
  {
    objc_msgSend(v8, "nextCTag");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");

    if (v33)
    {
      objc_msgSend(v8, "nextCTag");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVBulkUploadTaskGroup setNextCTag:](self, "setNextCTag:", v34);

      -[CoreDAVBulkUploadTaskGroup _sendNextBatch](self, "_sendNextBatch");
    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      objc_msgSend(v35, "logHandleForAccountInfoProvider:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_209602000, v37, OS_LOG_TYPE_INFO, "Got no updated ctag from the server, bailing on the group", (uint8_t *)&v39, 2u);
      }

      self->_validCTag = 0;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 7, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", v38);

    }
  }

}

- (unint64_t)multiPutBatchMaxNumResources
{
  return self->_multiPutBatchMaxNumResources;
}

- (void)setMultiPutBatchMaxNumResources:(unint64_t)a3
{
  self->_multiPutBatchMaxNumResources = a3;
}

- (unint64_t)multiPutBatchMaxSize
{
  return self->_multiPutBatchMaxSize;
}

- (void)setMultiPutBatchMaxSize:(unint64_t)a3
{
  self->_multiPutBatchMaxSize = a3;
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)validCTag
{
  return self->_validCTag;
}

- (NSString)nextCTag
{
  return self->_lastKnownCTag;
}

- (void)setNextCTag:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownCTag, a3);
}

- (NSDictionary)uuidToHREF
{
  return &self->_uuidToHREF->super;
}

- (NSDictionary)hrefToETag
{
  return &self->_hrefToETag->super;
}

- (NSDictionary)uuidToErrorItems
{
  return &self->_uuidToErrorItems->super;
}

- (NSDictionary)hrefToErrorItems
{
  return &self->_hrefToErrorItems->super;
}

- (NSDictionary)uuidToStatus
{
  return &self->_uuidToStatus->super;
}

- (NSDictionary)hrefToStatus
{
  return &self->_hrefToStatus->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hrefToStatus, 0);
  objc_storeStrong((id *)&self->_uuidToStatus, 0);
  objc_storeStrong((id *)&self->_hrefToErrorItems, 0);
  objc_storeStrong((id *)&self->_uuidToErrorItems, 0);
  objc_storeStrong((id *)&self->_hrefToETag, 0);
  objc_storeStrong((id *)&self->_uuidToHREF, 0);
  objc_storeStrong((id *)&self->_remainingHREFsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_remainingUUIDsToAddActions, 0);
  objc_storeStrong((id *)&self->_lastKnownCTag, 0);
  objc_storeStrong((id *)&self->_folderURL, 0);
}

@end
