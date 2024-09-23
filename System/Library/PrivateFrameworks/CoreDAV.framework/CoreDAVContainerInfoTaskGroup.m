@implementation CoreDAVContainerInfoTaskGroup

- (CoreDAVContainerInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5
{
  id v8;
  CoreDAVContainerInfoTaskGroup *v9;
  uint64_t v10;
  NSMutableSet *containerURLs;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVContainerInfoTaskGroup;
  v9 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v13, sel_initWithAccountInfoProvider_taskManager_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    containerURLs = v9->_containerURLs;
    v9->_containerURLs = (NSMutableSet *)v10;

    -[CoreDAVContainerInfoTaskGroup setContainerInfoDepth:](v9, "setContainerInfoDepth:", 3);
  }

  return v9;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: Phase %d URLs %@"), v5, self, self->_phase, self->_containerURLs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)startTaskGroup
{
  NSMutableSet *containerURLs;

  containerURLs = self->_containerURLs;
  if (containerURLs && -[NSMutableSet count](containerURLs, "count"))
    -[CoreDAVContainerInfoTaskGroup _getContainerTopLevelInfo](self, "_getContainerTopLevelInfo");
  else
    -[CoreDAVContainerInfoTaskGroup _getContainerHomeSet](self, "_getContainerHomeSet");
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4;
  CoreDAVContainerInfoTaskGroup *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = self;
  -[CoreDAVTaskGroup delegate](v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerInfoTask:completedWithContainers:error:", v5, 0, v4);
  v7.receiver = v5;
  v7.super_class = (Class)CoreDAVContainerInfoTaskGroup;
  -[CoreDAVTaskGroup taskGroupWillCancelWithError:](&v7, sel_taskGroupWillCancelWithError_, v4);

}

- (void)_getContainerHomeSet
{
  CoreDAVPropFindTask *v3;
  id WeakRetained;
  void *v5;
  CoreDAVPropFindTask *v6;
  id v7;
  id v8;
  id v9;

  self->_phase = 0;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v9, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", self->_appSpecificHomeSetPropNameSpace, self->_appSpecificHomeSetPropName, objc_opt_class());
  v3 = [CoreDAVPropFindTask alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(WeakRetained, "principalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:](v3, "initWithPropertiesToFind:atURL:withDepth:", v9, v5, 2);

  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v6);
  -[CoreDAVTask setDelegate:](v6, "setDelegate:", self);
  v7 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  -[CoreDAVTask setAccountInfoProvider:](v6, "setAccountInfoProvider:", v7);

  -[CoreDAVTask setTimeoutInterval:](v6, "setTimeoutInterval:", self->super._timeoutInterval);
  v8 = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(v8, "submitQueuedCoreDAVTask:", v6);

}

- (void)_getContainerTopLevelInfo
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CoreDAVPropFindTask *v8;
  id WeakRetained;
  id v10;
  NSMutableSet *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->_phase = 1;
  v3 = -[CoreDAVContainerInfoTaskGroup _copyContainerParserMappings](self, "_copyContainerParserMappings");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = self->_containerURLs;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(obj);
        v8 = -[CoreDAVPropFindTask initWithPropertiesToFind:atURL:withDepth:]([CoreDAVPropFindTask alloc], "initWithPropertiesToFind:atURL:withDepth:", v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), -[CoreDAVContainerInfoTaskGroup containerInfoDepthForURL:](self, "containerInfoDepthForURL:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7)));
        -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v8);
        -[CoreDAVTask setDelegate:](v8, "setDelegate:", self);
        WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        -[CoreDAVTask setAccountInfoProvider:](v8, "setAccountInfoProvider:", WeakRetained);

        -[CoreDAVTask setTimeoutInterval:](v8, "setTimeoutInterval:", self->super._timeoutInterval);
        v10 = objc_loadWeakRetained((id *)&self->super._taskManager);
        objc_msgSend(v10, "submitQueuedCoreDAVTask:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  int phase;
  NSMutableSet *v12;
  NSMutableSet *containerURLs;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  char v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  id v69;
  void *v70;
  id WeakRetained;
  NSObject *v72;
  id v73;
  NSMutableSet *containers;
  NSMutableSet *v75;
  NSMutableSet *v76;
  id v77;
  id v78;
  void *v79;
  int v80;
  void *v81;
  char v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
    goto LABEL_82;
  -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
  if (v10)
  {
    -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", v10);
    goto LABEL_82;
  }
  phase = self->_phase;
  if (phase == 1)
  {
    v84 = v8;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v58 = v9;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v59)
    {
      v60 = v59;
      v78 = v9;
      v88 = 0;
      v61 = *(_QWORD *)v93;
      do
      {
        v62 = 0;
        v90 = v60;
        do
        {
          if (*(_QWORD *)v93 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v62);
          objc_msgSend(v63, "firstHref");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "payloadAsFullURL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          if (v65)
          {
            objc_msgSend(v63, "successfulPropertiesToValues");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = -[CoreDAVContainerInfoTaskGroup _copyContainerWithURL:andProperties:](self, "_copyContainerWithURL:andProperties:", v65, v66);
            if (-[NSObject isUnauthenticated](v67, "isUnauthenticated"))
            {
              v68 = v61;
              v69 = v58;
              +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
              objc_msgSend(v70, "logHandleForAccountInfoProvider:", WeakRetained);
              v72 = objc_claimAutoreleasedReturnValue();

              if (v72 && os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_209602000, v72, OS_LOG_TYPE_DEFAULT, "Not authenticated to get Collection", buf, 2u);
              }

              v58 = v69;
              v61 = v68;
              v60 = v90;
            }
            else
            {
              containers = self->_containers;
              if (!containers)
              {
                v75 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v76 = self->_containers;
                self->_containers = v75;

                containers = self->_containers;
              }
              -[NSMutableSet addObject:](containers, "addObject:", v67);
              v88 = 1;
            }
          }
          else
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            objc_msgSend(v66, "logHandleForAccountInfoProvider:", v73);
            v67 = objc_claimAutoreleasedReturnValue();

            if (v67 && os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v63;
              _os_log_impl(&dword_209602000, v67, OS_LOG_TYPE_DEFAULT, "Could not find the first HREF's URL. Response is %@", buf, 0xCu);
            }
          }

          ++v62;
        }
        while (v60 != v62);
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      }
      while (v60);

      v9 = v78;
      if ((v88 & 1) != 0)
      {
        v8 = v84;
        v10 = 0;
        if (!-[NSMutableSet count](self->super._outstandingTasks, "count"))
        {
          v91[0] = MEMORY[0x24BDAC760];
          v91[1] = 3221225472;
          v91[2] = __68__CoreDAVContainerInfoTaskGroup_propFindTask_parsedResponses_error___block_invoke;
          v91[3] = &unk_24C1D9A40;
          v91[4] = self;
          -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, v91);
        }
        goto LABEL_82;
      }
    }
    else
    {

    }
    -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", 0);
    v8 = v84;
    goto LABEL_81;
  }
  v10 = 0;
  if (phase)
    goto LABEL_82;
  v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  containerURLs = self->_containerURLs;
  self->_containerURLs = v12;

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
  if (!v15)
  {

    goto LABEL_78;
  }
  v16 = v15;
  v77 = v9;
  v83 = v8;
  v82 = 0;
  v89 = *(_QWORD *)v101;
  v85 = v14;
  do
  {
    v17 = 0;
    v86 = v16;
    do
    {
      if (*(_QWORD *)v101 != v89)
        objc_enumerationMutation(v14);
      objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v17), "successfulPropertiesToValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "CDVObjectForKeyWithNameSpace:andName:", self->_appSpecificHomeSetPropNameSpace, self->_appSpecificHomeSetPropName);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v22, "logHandleForAccountInfoProvider:", v28);
        v24 = objc_claimAutoreleasedReturnValue();

        if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v18;
          v25 = v24;
          v26 = "Got malformed xml from server. Found Values are %@";
          v27 = 12;
LABEL_19:
          _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
        }
LABEL_20:

        goto LABEL_51;
      }
      objc_msgSend(v19, "unauthenticated");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v22, "logHandleForAccountInfoProvider:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v25 = v24;
          v26 = "Not authenticated to get Container set";
          v27 = 2;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      objc_msgSend(v20, "hrefs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (!v30)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v39, "logHandleForAccountInfoProvider:", v40);
        v35 = objc_claimAutoreleasedReturnValue();

        if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v107 = v20;
          _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, "Got malformed xml from server. Container set %@", buf, 0xCu);
        }
        goto LABEL_42;
      }
      objc_msgSend(v20, "hrefs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "payloadAsFullURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v83, "url");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "CDVServerURL");
      v35 = objc_claimAutoreleasedReturnValue();

      v87 = v33;
      objc_msgSend(v33, "CDVServerURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqual:](v35, "isEqual:", v36) & 1) == 0)
      {
        objc_msgSend(v36, "scheme");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject scheme](v35, "scheme");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "isEqualToString:", v38))
        {

LABEL_29:
          objc_msgSend(v36, "host");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject host](v35, "host");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "isEqualToString:", v43);

          if ((v44 & 1) != 0)
            goto LABEL_41;
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v45, "logHandleForAccountInfoProvider:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            v48 = v47;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject host](v35, "host");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "host");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v107 = v81;
              v108 = 2112;
              v109 = v79;
              _os_log_impl(&dword_209602000, v48, OS_LOG_TYPE_DEFAULT, "HomeSet is in another castle.  Was %@, is now %@", buf, 0x16u);

            }
          }

          objc_msgSend(v83, "accountInfoProvider");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_opt_respondsToSelector();

          if ((v50 & 1) == 0)
            goto LABEL_41;
          objc_msgSend(v83, "accountInfoProvider");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "noteHomeSetOnDifferentHost:", v36);
        }
        else
        {
          objc_msgSend(v36, "scheme");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v41, "isEqualToString:", CFSTR("https"));

          if (v80)
            goto LABEL_29;
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v51, "logHandleForAccountInfoProvider:", v52);
          v53 = objc_claimAutoreleasedReturnValue();

          if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v107 = v36;
            _os_log_impl(&dword_209602000, v53, OS_LOG_TYPE_DEFAULT, "Ignoring host change to: %@ because it sends it to an insecure URL.", buf, 0xCu);
          }

        }
      }
LABEL_41:

      v39 = v87;
LABEL_42:

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      objc_msgSend(v20, "hrefsAsFullURLs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v97 != v56)
              objc_enumerationMutation(v22);
            -[NSMutableSet addObject:](self->_containerURLs, "addObject:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i));
          }
          v55 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
        }
        while (v55);
        v82 = 1;
      }
      v14 = v85;
      v16 = v86;
LABEL_51:

      ++v17;
    }
    while (v17 != v16);
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
  }
  while (v16);

  v8 = v83;
  v9 = v77;
  if ((v82 & 1) != 0)
  {
    -[CoreDAVContainerInfoTaskGroup _getContainerTopLevelInfo](self, "_getContainerTopLevelInfo");
    goto LABEL_81;
  }
LABEL_78:
  -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", 0);
LABEL_81:
  v10 = 0;
LABEL_82:

}

void __68__CoreDAVContainerInfoTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerInfoTask:completedWithContainers:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 0);

}

- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4
{
  id v5;
  id v6;
  CoreDAVContainer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CoreDAVContainer initWithURL:andProperties:]([CoreDAVContainer alloc], "initWithURL:andProperties:", v6, v5);

  return v7;
}

- (id)_copyContainerParserMappings
{
  return +[CoreDAVContainer copyPropertyMappingsForParser](CoreDAVContainer, "copyPropertyMappingsForParser");
}

- (int)containerInfoDepth
{
  return self->_containerInfoDepth;
}

- (void)setContainerInfoDepth:(int)a3
{
  self->_containerInfoDepth = a3;
}

- (NSSet)containerURLs
{
  return &self->_containerURLs->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecificHomeSetPropName, 0);
  objc_storeStrong((id *)&self->_appSpecificHomeSetPropNameSpace, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containerURLs, 0);
}

@end
