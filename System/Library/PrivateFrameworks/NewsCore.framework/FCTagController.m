@implementation FCTagController

- (void)tagsFetchOperation:(id)a3 didFetchTags:(id)a4
{
  -[FCTagController saveTagsToCache:](self, "saveTagsToCache:", a4);
}

- (void)saveTagsToCache:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (self)
    self = (FCTagController *)self->_fastCache;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__FCTagController_saveTagsToCache___block_invoke;
  v6[3] = &unk_1E463B7E0;
  v7 = v4;
  v5 = v4;
  -[FCTagController readWriteWithAccessor:](self, "readWriteWithAccessor:", v6);

}

void __35__FCTagController_saveTagsToCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  objc_msgSend(v14, "tagRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tagRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fc_isNewerThan:", v10);

  if (v11)
  {
LABEL_3:
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v14, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, v13);

  }
}

FCTag *__37__FCTagController_tagsForTagRecords___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  FCTag *v15;
  uint64_t v16;
  uint64_t v17;
  FCTag *v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_3;
  objc_msgSend(v5, "base");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tagRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "base");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "fc_isNewerThan:", v13);

  if ((v14 & 1) == 0)
  {
    v18 = v10;
  }
  else
  {
LABEL_3:
    v15 = [FCTag alloc];
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      v17 = *(_QWORD *)(v16 + 16);
    else
      v17 = 0;
    v18 = -[FCTag initWithTagRecord:assetManager:interestToken:](v15, "initWithTagRecord:assetManager:interestToken:", v5, v17, v6);
    v19 = *(void **)(a1 + 32);
    -[FCTag identifier](v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, v20);

  }
  return v18;
}

void __37__FCTagController_tagsForTagRecords___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__FCTagController_tagsForTagRecords___block_invoke_2;
  v10[3] = &unk_1E463B808;
  v5 = (void *)a1[4];
  v4 = a1[5];
  v11 = v3;
  v12 = v4;
  v6 = v3;
  objc_msgSend(v5, "transformRecordsByIDWithBlock:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  FCOperationThrottler *v6;
  void (**v7)(_QWORD);
  FCCoreConfigurationManager *configurationManager;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  FCThreadSafeMutableSet *tagIDsNeedingRefresh;
  FCThreadSafeMutableSet *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  void (**v44)(_QWORD);
  _QWORD v45[5];
  void (**v46)(_QWORD);
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = (FCOperationThrottler *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    v48 = "-[FCTagController operationThrottler:performAsyncOperationWithCompletion:]";
    v49 = 2080;
    v50 = "FCTagController.m";
    v51 = 1024;
    v52 = 658;
    v53 = 2114;
    v54 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_17:
    if (v6)
      goto LABEL_15;
    configurationManager = 0;
    goto LABEL_6;
  }
  if (!self)
    goto LABEL_17;
LABEL_4:
  if (self->_tagPrefetchThrottler != v6)
    goto LABEL_12;
  configurationManager = self->_configurationManager;
LABEL_6:
  -[FCCoreConfigurationManager configuration](configurationManager, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "briefingsTagID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v11);

  objc_msgSend(v9, "trendingTagID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v12);

  objc_msgSend(v9, "featuredStoriesTagID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v13);

  objc_msgSend(v9, "savedStoriesTagID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v14);

  objc_msgSend(v9, "spotlightChannelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v15);

  objc_msgSend(v9, "myMagazinesTagID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v16);

  objc_msgSend(v9, "mySportsTagID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v17);

  objc_msgSend(v9, "sportsTopStoriesTagID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v18);

  objc_msgSend(v9, "puzzlesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "puzzleHubTagID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v20);

  objc_msgSend(v9, "puzzlesConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "puzzleFullArchiveTagID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v22);

  objc_msgSend(v9, "shortcutsTagID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v23);

  objc_msgSend(v9, "mySportsScoresTagID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v24);

  objc_msgSend(v9, "mySportsHighlightsTagID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v25);

  objc_msgSend(v9, "sportScoresTagID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v26);

  objc_msgSend(v9, "sportTeamScoresTagID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v27);

  objc_msgSend(v9, "sportLeagueScoresTagID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v28);

  objc_msgSend(v9, "sportsStandingsTagID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v29);

  objc_msgSend(v9, "sportsBracketTagID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v30);

  objc_msgSend(v9, "sportHighlightsTagID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v31);

  objc_msgSend(v9, "sportTeamHighlightsTagID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v32);

  objc_msgSend(v9, "sportLeagueHighlightsTagID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v33);

  objc_msgSend(v9, "sportEventHighlightsTagID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_safelyAddObject:", v34);

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
    v45[3] = &unk_1E463B858;
    v45[4] = self;
    v46 = v7;
    if (self)
      -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, v35, 0, 0, 9, MEMORY[0x1E0C80D38], v45);

  }
  else
  {
    v7[2](v7);
  }

  if (!self)
  {
    if (v6)
      goto LABEL_15;
    tagIDsNeedingRefresh = 0;
    goto LABEL_14;
  }
LABEL_12:
  if (self->_tagRefreshThrottler == v6)
  {
    tagIDsNeedingRefresh = self->_tagIDsNeedingRefresh;
LABEL_14:
    v37 = tagIDsNeedingRefresh;
    -[FCThreadSafeMutableSet allObjects](v37, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCTagController fetchOperationForTagsWithIDs:](self, "fetchOperationForTagsWithIDs:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setQualityOfService:", 9);
    objc_msgSend(v39, "setRelativePriority:", -1);
    objc_msgSend(v39, "setCachePolicy:", 4);
    objc_msgSend(v39, "setMaximumCachedAge:", 3600.0);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2;
    v42[3] = &unk_1E463B880;
    v42[4] = self;
    v43 = v38;
    v44 = v7;
    v40 = v38;
    objc_msgSend(v39, "setFetchCompletionBlock:", v42);
    objc_msgSend(v39, "start");

  }
LABEL_15:

}

- (void)_fetchTagsForTagIDs:(uint64_t)a3 includeParents:(uint64_t)a4 includeChildren:(uint64_t)a5 qualityOfService:(void *)a6 callbackQueue:(void *)a7 completionHandler:
{
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  char v38;
  char v39;
  _QWORD v40[6];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a6;
  v15 = a7;
  if (!a1)
    goto LABEL_27;
  if (v13 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (v14)
      goto LABEL_5;
LABEL_23:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "callbackQueue != nil");
      *(_DWORD *)buf = 136315906;
      v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
      v43 = 2080;
      v44 = "FCTagController.m";
      v45 = 1024;
      v46 = 462;
      v47 = 2114;
      v48 = v27;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    if (v15)
      goto LABEL_27;
LABEL_26:
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
    v43 = 2080;
    v44 = "FCTagController.m";
    v45 = 1024;
    v46 = 463;
    v47 = 2114;
    v48 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    goto LABEL_21;
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs != nil");
  *(_DWORD *)buf = 136315906;
  v42 = "-[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:]";
  v43 = 2080;
  v44 = "FCTagController.m";
  v45 = 1024;
  v46 = 461;
  v47 = 2114;
  v48 = v26;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!v14)
    goto LABEL_23;
LABEL_5:
  if (!v15)
    goto LABEL_26;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)a1[5];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
    v34[3] = &unk_1E463B740;
    v35 = v13;
    v19 = v16;
    v36 = v19;
    v38 = a3;
    v20 = v17;
    v37 = v20;
    v39 = a4;
    objc_msgSend(v18, "readWithAccessor:", v34);
    if (objc_msgSend(v20, "count"))
    {
      v21 = MEMORY[0x1E0C809B0];
      objc_msgSend(a1, "fetchOperationForTagsWithIDs:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setIncludeParents:", a3);
      objc_msgSend(v22, "setIncludeChildren:", a4);
      objc_msgSend(v22, "setQualityOfService:", a5);
      if (a5 == 9)
      {
        v24 = -1;
        v23 = v21;
      }
      else
      {
        v23 = v21;
        v24 = a5 == 33 || a5 == 25;
      }
      objc_msgSend(v22, "setRelativePriority:", v24);
      objc_msgSend(v22, "setFetchCompletionQueue:", v14);
      objc_msgSend(v22, "setCanSendFetchCompletionSynchronously:", 0);
      v31[0] = v23;
      v31[1] = 3221225472;
      v31[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_5;
      v31[3] = &unk_1E463B768;
      v32 = v19;
      v33 = v15;
      objc_msgSend(v22, "setFetchCompletionBlock:", v31);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addOperation:", v22);

      }
      else
      {
        objc_msgSend(v22, "start");
      }

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_7;
      block[3] = &unk_1E463B790;
      v29 = v19;
      v30 = v15;
      dispatch_async(v14, block);

      v22 = v29;
    }

LABEL_21:
    goto LABEL_27;
  }
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v40[3] = &unk_1E463B2D0;
  v40[4] = v14;
  v40[5] = v15;
  __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2((uint64_t)v40);
LABEL_27:

}

- (id)fetchOperationForTagsWithIDs:(id)a3
{
  id v4;
  FCTagsFetchOperation *v5;
  FCTagRecordSource *v6;
  FCAssetManager *assetManager;
  FCTagsFetchOperation *v8;

  v4 = a3;
  v5 = [FCTagsFetchOperation alloc];
  if (self)
  {
    v6 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    v6 = 0;
    assetManager = 0;
  }
  v8 = -[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:](v5, "initWithTagIDs:tagRecordSource:assetManager:delegate:", v4, v6, assetManager, self);

  return v8;
}

- (id)_cachedTagsForTagIDs:(char)a3 fastCacheOnly:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs != nil");
      *(_DWORD *)buf = 136315906;
      v46 = "-[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]";
      v47 = 2080;
      v48 = "FCTagController.m";
      v49 = 1024;
      v50 = 377;
      v51 = 2114;
      v52 = v30;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v10 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke;
    v37[3] = &unk_1E463B6F0;
    v33 = v6;
    v38 = v6;
    v11 = v7;
    v39 = v11;
    v12 = v8;
    v40 = v12;
    objc_msgSend(v9, "readWithAccessor:", v37);
    if (objc_msgSend(v12, "count") && (a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 24), "cachedRecordsWithIDs:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v10;
      v35[1] = 3221225472;
      v35[2] = __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke_2;
      v35[3] = &unk_1E463B718;
      v35[4] = a1;
      v14 = v11;
      v36 = v14;
      objc_msgSend(v13, "enumerateRecordsAndInterestTokensWithBlock:", v35);
      objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v14);

    }
    v32 = v12;
    v31 = a1;
    objc_msgSend(v11, "allValues");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v21, "loadDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateByAddingTimeInterval:", 3600.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "fc_isEarlierThan:", v24);

          if (v25)
          {
            objc_msgSend(v21, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v26);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v34, "count"))
    {
      objc_msgSend(*(id *)(v31 + 72), "addObjectsFromArray:", v34);
      objc_msgSend(*(id *)(v31 + 64), "tickle");
    }

    v27 = v40;
    v28 = v11;

    v6 = v33;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (FCTagController)initWithContentDatabase:(id)a3 assetManager:(id)a4 tagRecordSource:(id)a5 configurationManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCTagController *v15;
  FCTagController *v16;
  uint64_t v17;
  FCThreadSafeMapTable *fastCache;
  FCOperationThrottler *v19;
  FCOperationThrottler *tagPrefetchThrottler;
  NSMutableDictionary *v21;
  NSMutableDictionary *prefetchedTags;
  FCOperationThrottler *v23;
  FCOperationThrottler *tagRefreshThrottler;
  FCThreadSafeMutableSet *v25;
  FCThreadSafeMutableSet *tagIDsNeedingRefresh;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDatabase != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    v34 = 2080;
    v35 = "FCTagController.m";
    v36 = 1024;
    v37 = 70;
    v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    v34 = 2080;
    v35 = "FCTagController.m";
    v36 = 1024;
    v37 = 71;
    v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCTagController initWithContentDatabase:assetManager:tagRecordSource:configurationManager:]";
    v34 = 2080;
    v35 = "FCTagController.m";
    v36 = 1024;
    v37 = 72;
    v38 = 2114;
    v39 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v31.receiver = self;
  v31.super_class = (Class)FCTagController;
  v15 = -[FCTagController init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentDatabase, a3);
    objc_storeStrong((id *)&v16->_assetManager, a4);
    objc_storeStrong((id *)&v16->_configurationManager, a6);
    objc_storeStrong((id *)&v16->_tagRecordSource, a5);
    +[FCThreadSafeMapTable strongToWeakObjectsMapTable](FCThreadSafeMapTable, "strongToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    fastCache = v16->_fastCache;
    v16->_fastCache = (FCThreadSafeMapTable *)v17;

    v19 = -[FCOperationThrottler initWithDelegate:]([FCOperationThrottler alloc], "initWithDelegate:", v16);
    tagPrefetchThrottler = v16->_tagPrefetchThrottler;
    v16->_tagPrefetchThrottler = v19;

    -[FCOperationThrottler setSuspended:](v16->_tagPrefetchThrottler, "setSuspended:", 1);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prefetchedTags = v16->_prefetchedTags;
    v16->_prefetchedTags = v21;

    v23 = -[FCOperationThrottler initWithDelegate:]([FCOperationThrottler alloc], "initWithDelegate:", v16);
    tagRefreshThrottler = v16->_tagRefreshThrottler;
    v16->_tagRefreshThrottler = v23;

    v25 = objc_alloc_init(FCThreadSafeMutableSet);
    tagIDsNeedingRefresh = v16->_tagIDsNeedingRefresh;
    v16->_tagIDsNeedingRefresh = v25;

    objc_storeStrong((id *)&v16->_configurationManager, a6);
    -[FCCoreConfigurationManager addObserver:](v16->_configurationManager, "addObserver:", v16);
  }

  return v16;
}

- (id)fastCachedTagsForIDs:(id)a3
{
  return -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]((uint64_t)self, a3, 1);
}

- (id)tagsForTagRecords:(id)a3
{
  id v4;
  FCThreadSafeMapTable *fastCache;
  FCThreadSafeMapTable *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  FCTagController *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  if (self)
    fastCache = self->_fastCache;
  else
    fastCache = 0;
  v6 = fastCache;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__FCTagController_tagsForTagRecords___block_invoke;
  v10[3] = &unk_1E463B830;
  v13 = &v14;
  v7 = v4;
  v11 = v7;
  v12 = self;
  -[FCThreadSafeMapTable readWriteWithAccessor:](v6, "readWriteWithAccessor:", v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__FCTagController_saveTagsToCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__FCTagController_saveTagsToCache___block_invoke_2;
  v6[3] = &unk_1E463B7B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __47__FCTagController_setShouldPrefetchGlobalTags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  return objc_msgSend(v2, "tickle");
}

void __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(a1[5], "setObject:forKey:", v10, v9);
        else
          objc_msgSend(a1[6], "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)setShouldPrefetchGlobalTags:(BOOL)a3
{
  _BOOL4 v3;
  FCTagController *v4;
  FCOperationThrottler *tagPrefetchThrottler;
  _QWORD v6[5];

  v3 = a3;
  v4 = self;
  if (self)
    self = (FCTagController *)self->_tagPrefetchThrottler;
  if (-[FCTagController suspended](self, "suspended") == a3)
  {
    if (v4)
      tagPrefetchThrottler = v4->_tagPrefetchThrottler;
    else
      tagPrefetchThrottler = 0;
    -[FCOperationThrottler setSuspended:](tagPrefetchThrottler, "setSuspended:", !v3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__FCTagController_setShouldPrefetchGlobalTags___block_invoke;
    v6[3] = &unk_1E463AB18;
    v6[4] = v4;
    +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v6);
  }
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(v8, "status"))
  {
    objc_msgSend(v8, "fetchedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_52);
  v6 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  if (objc_msgSend(v4, "count"))
  {
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);

  }
}

uint64_t __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 56);
    else
      v4 = 0;
    objc_msgSend(v4, "addEntriesFromDictionary:", a2);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__FCTagController_configurationManager_configurationDidChange___block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v4, a4);
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v23 = *(_QWORD *)v33;
    v24 = v4;
    do
    {
      v8 = 0;
      v25 = v6;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v8);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v9);
          objc_msgSend(v10, "asSection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "parentID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (*(_BYTE *)(a1 + 56) && v12)
          {
            objc_msgSend(v3, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, v12);
            else
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

          }
          objc_msgSend(v10, "asChannel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sectionIDs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (*(_BYTE *)(a1 + 57) && objc_msgSend(v15, "count"))
          {
            v26 = v15;
            v27 = v12;
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v16 = v15;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v29;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
                  objc_msgSend(v3, "objectForKey:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22)
                    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v22, v21);
                  else
                    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v18);
            }

            v7 = v23;
            v4 = v24;
            v6 = v25;
            v15 = v26;
            v12 = v27;
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

}

- (FCTagController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagController init]";
    v9 = 2080;
    v10 = "FCTagController.m";
    v11 = 1024;
    v12 = 62;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCTagController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)dealloc
{
  objc_super v3;

  -[FCCoreConfigurationManager removeObserver:](self->_configurationManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)FCTagController;
  -[FCTagController dealloc](&v3, sel_dealloc);
}

- (id)fastCachedTagForID:(id)a3
{
  return -[FCTagController _cachedTagForTagID:fastCacheOnly:]((uint64_t)self, a3, 1);
}

- (id)_cachedTagForTagID:(char)a3 fastCacheOnly:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
      *(_DWORD *)buf = 136315906;
      v15 = "-[FCTagController _cachedTagForTagID:fastCacheOnly:]";
      v16 = 2080;
      v17 = "FCTagController.m";
      v18 = 1024;
      v19 = 370;
      v20 = 2114;
      v21 = v12;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_6;
  }
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:](a1, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (id)slowCachedTagForID:(id)a3
{
  return -[FCTagController _cachedTagForTagID:fastCacheOnly:]((uint64_t)self, a3, 0);
}

- (id)slowCachedTagsForIDs:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    v8 = 136315906;
    v9 = "-[FCTagController slowCachedTagsForIDs:]";
    v10 = 2080;
    v11 = "FCTagController.m";
    v12 = 1024;
    v13 = 118;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  -[FCTagController _cachedTagsForTagIDs:fastCacheOnly:]((uint64_t)self, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)expectedFastCachedTagForID:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCTagController _cachedTagForTagID:fastCacheOnly:]((uint64_t)self, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "result");
      *(_DWORD *)buf = 136315906;
      v9 = "-[FCTagController expectedFastCachedTagForID:]";
      v10 = 2080;
      v11 = "FCTagController.m";
      v12 = 1024;
      v13 = 126;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCTagController _cachedTagForTagID:fastCacheOnly:]((uint64_t)self, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (BOOL)isTagAllowed:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:options:](FCTagFilterUtilities, "filterTag:options:", a3, 30);
}

+ (BOOL)isTagAllowedInContentStoreFront:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:options:](FCTagFilterUtilities, "filterTag:options:", a3, 4);
}

+ (BOOL)isTagAllowedForNewsVersion:(id)a3
{
  return !+[FCTagFilterUtilities filterTag:options:](FCTagFilterUtilities, "filterTag:options:", a3, 16);
}

- (id)fetchOperationForTagsWithIDs:(id)a3 includeParents:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FCTagsFetchOperation *v7;
  FCTagRecordSource *v8;
  FCAssetManager *assetManager;
  FCTagsFetchOperation *v10;

  v4 = a4;
  v6 = a3;
  v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    v8 = 0;
    assetManager = 0;
  }
  v10 = -[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:](v7, "initWithTagIDs:tagRecordSource:assetManager:delegate:", v6, v8, assetManager, self);

  -[FCTagsFetchOperation setIncludeParents:](v10, "setIncludeParents:", v4);
  return v10;
}

- (id)fetchOperationForTagsWithIDs:(id)a3 includeChildren:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FCTagsFetchOperation *v7;
  FCTagRecordSource *v8;
  FCAssetManager *assetManager;
  FCTagsFetchOperation *v10;

  v4 = a4;
  v6 = a3;
  v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    v8 = 0;
    assetManager = 0;
  }
  v10 = -[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:](v7, "initWithTagIDs:tagRecordSource:assetManager:delegate:", v6, v8, assetManager, self);

  -[FCTagsFetchOperation setIncludeChildren:](v10, "setIncludeChildren:", v4);
  return v10;
}

- (id)fetchOperationForTagsIncludingChildrenWithIDs:(id)a3 softMaxAge:(double)a4
{
  id v6;
  FCTagsFetchOperation *v7;
  FCTagRecordSource *v8;
  FCAssetManager *assetManager;
  FCTagsFetchOperation *v10;

  v6 = a3;
  v7 = [FCTagsFetchOperation alloc];
  if (self)
  {
    v8 = self->_tagRecordSource;
    assetManager = self->_assetManager;
  }
  else
  {
    v8 = 0;
    assetManager = 0;
  }
  v10 = -[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:](v7, "initWithTagIDs:tagRecordSource:assetManager:delegate:", v6, v8, assetManager, self);

  -[FCFetchOperation setCachePolicy:](v10, "setCachePolicy:", 4);
  -[FCFetchOperation setMaximumCachedAge:](v10, "setMaximumCachedAge:", a4);
  -[FCTagsFetchOperation setIncludeChildren:](v10, "setIncludeChildren:", 1);
  -[FCTagsFetchOperation setOverrideChildrenCachePolicy:](v10, "setOverrideChildrenCachePolicy:", 1);
  -[FCTagsFetchOperation setChildrenCachePolicy:](v10, "setChildrenCachePolicy:", 4);
  -[FCTagsFetchOperation setChildrenMaximumCachedAge:](v10, "setChildrenMaximumCachedAge:", a4);
  return v10;
}

- (void)fetchTagsForTagIDs:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  v11 = a3;
  +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__FCTagController_fetchTagsForTagIDs_maximumCachedAge_qualityOfService_completionHandler___block_invoke;
  v14[3] = &unk_1E463B570;
  v15 = v10;
  v13 = v10;
  -[FCTagController fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:](self, "fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:", v11, v12, a5, v14);

}

uint64_t __90__FCTagController_fetchTagsForTagIDs_maximumCachedAge_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchTagsForTagIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  unint64_t v13;
  FCThreadSafeMapTable *fastCache;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  FCThreadSafeMapTable *v22;
  FCThreadSafeMapTable *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(id, void *, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, _QWORD))a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs != nil");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCTagController fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:]";
    v36 = 2080;
    v37 = "FCTagController.m";
    v38 = 1024;
    v39 = 219;
    v40 = 2114;
    v41 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
    {
LABEL_4:
      if (objc_msgSend(v10, "count"))
      {
        v13 = objc_msgSend(v11, "cachePolicy");
        if (v13 > 5)
        {
          v15 = 0;
        }
        else if (((1 << v13) & 0xD) != 0)
        {
          if (self)
            fastCache = self->_fastCache;
          else
            fastCache = 0;
          -[FCThreadSafeMapTable subdictionaryForKeys:](fastCache, "subdictionaryForKeys:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (((1 << v13) & 0x30) != 0)
        {
          objc_msgSend(v11, "oldestAllowedDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v18;

          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToDate:", v20);

          if (v21)
          {
            if (self)
              v22 = self->_fastCache;
            else
              v22 = 0;
            -[FCThreadSafeMapTable subdictionaryForKeys:](v22, "subdictionaryForKeys:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (self)
              v23 = self->_fastCache;
            else
              v23 = 0;
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3;
            v32[3] = &unk_1E463B5C0;
            v33 = v19;
            -[FCThreadSafeMapTable subdictionaryForKeys:passingTest:](v23, "subdictionaryForKeys:passingTest:", v10, v32);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v15 = (void *)MEMORY[0x1E0C9AA70];
        }
        v24 = objc_msgSend(v15, "count");
        if (v24 == objc_msgSend(v10, "count"))
        {
          v12[2](v12, v15, 0);
        }
        else
        {
          -[FCTagController fetchOperationForTagsWithIDs:](self, "fetchOperationForTagsWithIDs:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setQualityOfService:", a5);
          if (a5 == 9)
            v26 = -1;
          else
            v26 = a5 == 33 || a5 == 25;
          objc_msgSend(v25, "setRelativePriority:", v26);
          objc_msgSend(v25, "setCachePolicy:", objc_msgSend(v11, "cachePolicy"));
          objc_msgSend(v11, "maximumCachedAge");
          objc_msgSend(v25, "setMaximumCachedAge:");
          objc_msgSend(v25, "setCanSendFetchCompletionSynchronously:", 1);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_4;
          v30[3] = &unk_1E463B608;
          v31 = v12;
          objc_msgSend(v25, "setFetchCompletionBlock:", v30);
          if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          {
            objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addOperation:", v25);

          }
          else
          {
            objc_msgSend(v25, "start");
          }

        }
      }
      else
      {
        v12[2](v12, (void *)MEMORY[0x1E0C9AA70], 0);
      }
      goto LABEL_41;
    }
  }
  else if (v12)
  {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCTagController fetchTagsForTagIDs:cachePolicy:qualityOfService:completionHandler:]";
    v36 = 2080;
    v37 = "FCTagController.m";
    v38 = 1024;
    v39 = 220;
    v40 = 2114;
    v41 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_41:

}

BOOL __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _BOOL8 v6;

  v4 = a3;
  objc_msgSend(v4, "fetchDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fc_isLaterThanOrEqualTo:", *(_QWORD *)(a1 + 32)))
    v6 = +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:", v4);
  else
    v6 = 0;

  return v6;
}

void __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v4, "fetchedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_33);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

uint64_t __85__FCTagController_fetchTagsForTagIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (void)fetchTagsForTagIDs:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  if (self)
    -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, a3, 0, 0, a4, a5, a6);
}

- (void)fetchTagsForTagIDs:(id)a3 includeParents:(BOOL)a4 includeChildren:(BOOL)a5 qualityOfService:(int64_t)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, a3, a4, a5, a6, a7, a8);
}

- (void)fetchTagForTagID:(id)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _BYTE block[24];
  __int128 v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self)
  {
    if (v10)
    {
      v17[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke;
      *(_QWORD *)&v16 = &unk_1E463B570;
      *((_QWORD *)&v16 + 1) = v12;
      -[FCTagController _fetchTagsForTagIDs:includeParents:includeChildren:qualityOfService:callbackQueue:completionHandler:](self, v13, 0, 0, a4, v11, block);

LABEL_7:
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
      *(_DWORD *)block = 136315906;
      *(_QWORD *)&block[4] = "-[FCTagController _fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:]";
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = "FCTagController.m";
      *(_WORD *)&block[22] = 1024;
      LODWORD(v16) = 435;
      WORD2(v16) = 2114;
      *(_QWORD *)((char *)&v16 + 6) = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", block, 0x26u);

      if (!v12)
        goto LABEL_8;
      goto LABEL_6;
    }
    if (v12)
    {
LABEL_6:
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
      *(_QWORD *)&v16 = &unk_1E463B598;
      *((_QWORD *)&v16 + 1) = v12;
      dispatch_async(v11, block);
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a4;
  v9 = *(double *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_2;
  v13[3] = &unk_1E463B680;
  v10 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = v8;
  v14 = v7;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v11, a3, v13, v9);

}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_3;
  v9[3] = &unk_1E463B658;
  v10 = v6;
  v11 = v5;
  v13 = a1[5];
  v14 = a1[6];
  v12 = a1[4];
  v7 = v5;
  v8 = v6;
  FCPerformBlockOnMainThread(v9);

}

void __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v10 = v3;
      objc_msgSend(v2, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

    }
  }
  v4 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_38;
    v12[3] = &unk_1E463B630;
    v13 = v5;
    objc_msgSend(v6, "fc_dictionaryByTransformingValuesWithBlock:", v12);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "nf_objectsForKeysWithoutMarker:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

id __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v2;
  unsigned int (*v3)(uint64_t, id);
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  if (v3(v2, v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)tagsForTagIDs:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  FCArrayStream *v8;
  FCTransformedResultsStream *v9;
  FCTransformedResultsStream *v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (self)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = -[FCArrayStream initWithArray:]([FCArrayStream alloc], "initWithArray:", v6);
      v9 = [FCTransformedResultsStream alloc];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__FCTagController_tagsForTagIDs_maximumCachedAge_predicate___block_invoke;
      v12[3] = &unk_1E463B6A8;
      v12[4] = self;
      v14 = 0x7FEFFFFFFFFFFFFFLL;
      v13 = v7;
      v10 = -[FCTransformedResultsStream initWithStream:asyncTransformBlock:](v9, "initWithStream:asyncTransformBlock:", v8, v12);
      self = -[FCStreamingResults initWithStream:]([FCStreamingResults alloc], "initWithStream:", v10);

    }
    else
    {
      self = 0;
    }
  }

  return self;
}

- (id)tagsForTagIDs:(id)a3
{
  return -[FCTagController tagsForTagIDs:predicate:](self, "tagsForTagIDs:predicate:", a3, &__block_literal_global_43);
}

uint64_t __33__FCTagController_tagsForTagIDs___block_invoke()
{
  return 1;
}

void __54__FCTagController__cachedTagsForTagIDs_fastCacheOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTag *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCTag *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCTag alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 16);
  else
    v9 = 0;
  v12 = -[FCTag initWithTagRecord:assetManager:interestToken:](v7, "initWithTagRecord:assetManager:interestToken:", v6, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCTag identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

void __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "allValues");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);

  }
}

uint64_t __86__FCTagController__fetchTagForTagID_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E463B598;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_6()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_53);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __119__FCTagController__fetchTagsForTagIDs_includeParents_includeChildren_qualityOfService_callbackQueue_completionHandler___block_invoke_8()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (BOOL)shouldPrefetchGlobalTags
{
  if (self)
    self = (FCTagController *)self->_tagPrefetchThrottler;
  return -[FCTagController suspended](self, "suspended") ^ 1;
}

uint64_t __63__FCTagController_configurationManager_configurationDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  return objc_msgSend(v2, "tickle");
}

uint64_t __74__FCTagController_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 72);
  else
    v3 = 0;
  objc_msgSend(v3, "removeObjectsInArray:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)jsonEncodableObject
{
  if (self)
    self = (FCTagController *)self->_tagRecordSource;
  return -[FCTagController jsonEncodableObject](self, "jsonEncodableObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDsNeedingRefresh, 0);
  objc_storeStrong((id *)&self->_tagRefreshThrottler, 0);
  objc_storeStrong((id *)&self->_prefetchedTags, 0);
  objc_storeStrong((id *)&self->_tagPrefetchThrottler, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
}

@end
