@implementation LPFetcherGroup

- (LPFetcherGroup)initWithPolicy:(int64_t)a3 configuration:(id)a4 description:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPFetcherGroup *v13;
  LPFetcherGroup *v14;
  LPFetcherGroup *v15;
  uint64_t v16;
  LPFetcherConfiguration *configuration;
  void *v18;
  id completionHandler;
  NSMutableArray *v20;
  NSMutableArray *tasks;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  LPFetcherGroup *v28;
  objc_super v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)LPFetcherGroup;
  v13 = -[LPFetcherGroup init](&v30, sel_init);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v13->_loggingID = ++initWithPolicy_configuration_description_completionHandler__nextLoggingID;
    v13->_responsePolicy = a3;
    v16 = objc_msgSend(v10, "copy");
    configuration = v15->_configuration;
    v15->_configuration = (LPFetcherConfiguration *)v16;

    v18 = _Block_copy(v12);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = v18;

    objc_storeStrong((id *)&v14->_description, a5);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tasks = v15->_tasks;
    v15->_tasks = v20;

    -[LPFetcherConfiguration webViewForProcessSharing](v15->_configuration, "webViewForProcessSharing");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0CEF630]);
      v24 = +[LPMetadataProvider _copyDefaultWebViewConfiguration](LPMetadataProvider, "_copyDefaultWebViewConfiguration");
      v25 = (void *)objc_msgSend(v23, "initWithFrame:configuration:", v24, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[LPFetcherConfiguration setWebViewForProcessSharing:](v15->_configuration, "setWebViewForProcessSharing:", v25);

    }
    -[LPFetcherConfiguration rootEvent](v15->_configuration, "rootEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "childWithType:subtitle:", 1, v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFetcherConfiguration setRootEvent:](v15->_configuration, "setRootEvent:", v27);

    v28 = v15;
  }

  return v15;
}

- (void)_addFetcher:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  LPFetcherGroupTask *v8;
  NSObject *v9;
  unsigned int loggingID;
  int v11;
  NSString *description;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x1E0C99750];
  if (self->_done)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to add a fetcher to an already-complete LPFetcherGroup."));
  if (self->_doneAddingFetchers)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("Trying to add a fetcher to an LPFetcherGroup on which -doneAddingFetchers was already called."));
  v8 = objc_alloc_init(LPFetcherGroupTask);
  -[LPFetcherGroupTask setFetcher:](v8, "setFetcher:", v6);
  v9 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v11 = objc_msgSend(v6, "_loggingID");
    description = self->_description;
    v13[0] = 67109634;
    v13[1] = loggingID;
    v14 = 1024;
    v15 = v11;
    v16 = 2112;
    v17 = description;
    _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPFetcherGroup<%d>: adding LPFetcher<%d> for %@", (uint8_t *)v13, 0x18u);
  }

  -[NSMutableArray insertObject:atIndex:](self->_tasks, "insertObject:atIndex:", v8, a4);
  -[LPFetcherGroup startFetchesIfNeeded](self, "startFetchesIfNeeded");

}

- (void)appendFetcher:(id)a3
{
  id v4;

  v4 = a3;
  -[LPFetcherGroup _addFetcher:atIndex:](self, "_addFetcher:atIndex:", v4, -[NSMutableArray count](self->_tasks, "count"));

}

- (void)prependFetcher:(id)a3
{
  -[LPFetcherGroup _addFetcher:atIndex:](self, "_addFetcher:atIndex:", a3, 0);
}

- (unint64_t)numberOfActiveFetches
{
  NSMutableArray *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_tasks;
  v3 = 0;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasStarted", (_QWORD)v11))
        {
          objc_msgSend(v7, "response");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8 == 0;

          v3 += v9;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return v3;
}

- (void)startFetchesIfNeeded
{
  unint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  LPFetcherConfiguration *configuration;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[LPFetcherGroup numberOfActiveFetches](self, "numberOfActiveFetches");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_tasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasStarted") & 1) == 0)
        {
          if (v3 > 5)
            goto LABEL_11;
          objc_msgSend(v8, "setHasStarted:", 1);
          objc_msgSend(v8, "fetcher");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          configuration = self->_configuration;
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __38__LPFetcherGroup_startFetchesIfNeeded__block_invoke;
          v11[3] = &unk_1E44A9E38;
          v11[4] = v8;
          v11[5] = self;
          objc_msgSend(v9, "fetchWithConfiguration:completionHandler:", configuration, v11);

          ++v3;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
LABEL_11:

}

void __38__LPFetcherGroup_startFetchesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setResponse:");
  objc_msgSend(*(id *)(a1 + 40), "evaluateCompleteness");
  objc_msgSend(*(id *)(a1 + 40), "startFetchesIfNeeded");

}

- (void)doneAddingFetchers
{
  self->_doneAddingFetchers = 1;
  -[LPFetcherGroup evaluateCompleteness](self, "evaluateCompleteness");
}

- (void)evaluateCompleteness
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A0C41000, v0, v1, "LPFetcherGroup<%d>: complete, all fetchers fulfilled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (id)_responsesRespectingPolicy
{
  id v2;
  int64_t responsePolicy;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  responsePolicy = self->_responsePolicy;
  switch(responsePolicy)
  {
    case 0:
      v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v5 = self->_tasks;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v5);
            v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v17, "response", (_QWORD)v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v17, "response");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "state") == 2;

              if (v20)
              {
                objc_msgSend(v17, "response");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "addObject:", v21);

              }
            }
          }
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v14);
      }
LABEL_39:

      return v2;
    case 2:
      v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v5 = self->_tasks;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v39;
LABEL_27:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v5);
          v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v24);
          v26 = objc_msgSend(v2, "count");
          if (v26 >= -[LPFetcherConfiguration maximumResponseCount](self->_configuration, "maximumResponseCount"))
            break;
          objc_msgSend(v25, "response");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            objc_msgSend(v25, "response");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "state");

            if (v30 == 2)
            {
              objc_msgSend(v25, "response");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v31);

            }
          }
          if (v22 == ++v24)
          {
            v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v22)
              goto LABEL_27;
            goto LABEL_39;
          }
        }
      }
      goto LABEL_39;
    case 1:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v5 = self->_tasks;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v43;
        v2 = (id)MEMORY[0x1E0C9AA60];
        while (2)
        {
          for (j = 0; j != v6; ++j)
          {
            if (*(_QWORD *)v43 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_msgSend(v9, "response");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10 == 0;

            if (!v11)
            {
              objc_msgSend(v9, "response");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "state");

              if (v13 == 2)
              {
                objc_msgSend(v9, "response");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
                v2 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_39;
              }
            }
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        v2 = (id)MEMORY[0x1E0C9AA60];
      }
      goto LABEL_39;
  }
  return v2;
}

- (void)cancel
{
  id completionHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  self->_cancelled = 1;
  -[LPFetcherGroup _completed](self, "_completed");
}

- (void)_completed
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a3;
  _os_log_debug_impl(&dword_1A0C41000, log, OS_LOG_TYPE_DEBUG, "LPFetcherGroup<%d>: complete with %lu responses", buf, 0x12u);
}

- (unsigned)loggingID
{
  return self->_loggingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
