@implementation FCFeedItemHeadlinesOperation

- (FCFeedItemHeadlinesOperation)init
{
  FCFeedItemHeadlinesOperation *v2;
  FCFeedItemHeadlinesOperation *v3;
  FCFeedItemHeadlinesOperationProperties *v4;
  FCFeedItemHeadlinesOperationProperties *properties;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCFeedItemHeadlinesOperation;
  v2 = -[FCOperation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_feedPersonalizationConfigurationSet = 0;
    v4 = objc_alloc_init(FCFeedItemHeadlinesOperationProperties);
    properties = v3->_properties;
    v3->_properties = v4;

  }
  return v3;
}

- (FCMapTable)feedItemScoreProfiles
{
  void *v2;
  void *v3;

  -[FCFeedItemHeadlinesOperation properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedItemScoreProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCMapTable *)v3;
}

- (void)setFeedItemScoreProfiles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCFeedItemHeadlinesOperation properties](self, "properties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedItemScoreProfiles:", v4);

}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[FCFeedItemHeadlinesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed item headlines operation must have a configuration"));
    v11 = 136315906;
    v12 = "-[FCFeedItemHeadlinesOperation validateOperation]";
    v13 = 2080;
    v14 = "FCFeedItemHeadlinesOperation.m";
    v15 = 1024;
    v16 = 69;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  -[FCFeedItemHeadlinesOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed item headlines operation must have a context"));
    v11 = 136315906;
    v12 = "-[FCFeedItemHeadlinesOperation validateOperation]";
    v13 = 2080;
    v14 = "FCFeedItemHeadlinesOperation.m";
    v15 = 1024;
    v16 = 70;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  -[FCFeedItemHeadlinesOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FCFeedItemHeadlinesOperation context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performOperation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__FCFeedItemHeadlinesOperation_performOperation__block_invoke;
  v2[3] = &unk_1E463B408;
  v2[4] = self;
  -[FCFeedItemHeadlinesOperation _fetchUnadornedHeadlinesWithCompletionHandler:](self, "_fetchUnadornedHeadlinesWithCompletionHandler:", v2);
}

void __48__FCFeedItemHeadlinesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_articleID);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedItemScoreProfiles");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = a1;
    v44 = (void *)v7;
    if (!v7)
    {
      NewsCoreUserDefaults();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("personalization_disabled"));

      if ((v10 & 1) != 0)
      {
        v44 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(v8 + 32), "personalizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v8 + 32), "feedItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sortItems:options:configurationSet:", v12, 1, objc_msgSend(*(id *)(v8 + 32), "feedPersonalizationConfigurationSet"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "scoreProfiles");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(*(id *)(v8 + 32), "feedItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v51;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v51 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v17);
          v19 = (objc_class *)objc_opt_class();
          objc_msgSend(v18, "articleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          FCCheckedDynamicCast(v19, (uint64_t)v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v23 = v8;
            objc_msgSend(v18, "feedID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setSurfacedByBinID:", v24);

            objc_msgSend(v22, "setFeedOrder:", objc_msgSend(v18, "order"));
            objc_msgSend(v18, "globalUserFeedback");
            objc_msgSend(v22, "setGlobalUserFeedback:");
            if (objc_msgSend(v18, "isEvergreen"))
              objc_msgSend(v22, "markAsEvergreen");
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            objc_msgSend(v18, "surfacedByArticleListIDs");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v47 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(v22, "addSurfacedByArticleListID:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
              }
              while (v27);
            }

            v8 = v23;
            objc_msgSend(*(id *)(v23 + 32), "feedContextByFeedID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "feedID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "fc_safeObjectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v32, "sectionID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setSurfacedBySectionID:", v33);

              objc_msgSend(v32, "channelID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setSurfacedByChannelID:", v34);

              objc_msgSend(v32, "topicID");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setSurfacedByTopicID:", v35);

              objc_msgSend(v22, "setTopStoryType:", objc_msgSend(v32, "isTopStories"));
            }
            objc_msgSend(v44, "objectForKey:", v18);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(v22, "setScoreProfile:", v36);
              objc_msgSend(v36, "sortingScore");
              objc_msgSend(v22, "setTileProminenceScore:");
            }
            else
            {
              objc_msgSend(*(id *)(v23 + 32), "personalizer");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37
                && !NSClassFromString(CFSTR("XCTest"))
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("personalizer should have provided a score"));
                *(_DWORD *)buf = 136315906;
                v55 = "-[FCFeedItemHeadlinesOperation performOperation]_block_invoke";
                v56 = 2080;
                v57 = "FCFeedItemHeadlinesOperation.m";
                v58 = 1024;
                v59 = 130;
                v60 = 2114;
                v61 = v38;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
            }
            objc_msgSend(v43, "addObject:", v22);
            objc_msgSend(v42, "setObject:forKey:", v22, v18);

          }
          ++v17;
        }
        while (v17 != v15);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        v15 = v39;
      }
      while (v39);
    }

    objc_msgSend(*(id *)(v8 + 32), "setResultHeadlines:", v43);
    objc_msgSend(*(id *)(v8 + 32), "properties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setResultHeadlinesByFeedItem:", v42);

    a1 = v8;
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v5);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[FCFeedItemHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCFeedItemHeadlinesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCFeedItemHeadlinesOperation resultHeadlines](self, "resultHeadlines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v11);

  }
  -[FCFeedItemHeadlinesOperation headlinesMapCompletionHandler](self, "headlinesMapCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCFeedItemHeadlinesOperation headlinesMapCompletionHandler](self, "headlinesMapCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCFeedItemHeadlinesOperation properties](self, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultHeadlinesByFeedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v10, v11);

  }
}

- (void)_fetchUnadornedHeadlinesWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  FCCKContentBatchedFetchRecordsOperation *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  FCFeedItemHeadlinesOperation *v46;
  void *v47;
  const char *v48;
  void *v49;
  id v50;
  id v51;
  const char *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  FCFeedItemHeadlinesOperation *v68;
  void *v69;
  _QWORD newValue[4];
  id v71;
  id v72;
  id v73;
  FCFeedItemHeadlinesOperation *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  FCFeedItemHeadlinesOperation *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  -[FCFeedItemHeadlinesOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleRecordSource");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedItemHeadlinesOperation context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalContentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "issueRecordSource");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedItemHeadlinesOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalContentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tagRecordSource");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v68 = self;
  -[FCFeedItemHeadlinesOperation feedItems](self, "feedItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v87 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v18, "articleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);
        objc_msgSend(v18, "sourceChannelID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v18, "sourceChannelID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v21);

        }
        objc_msgSend(v18, "parentIssueID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v18, "parentIssueID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v23);

        }
        objc_msgSend(v18, "feedID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, v19);
          }
          objc_msgSend(v18, "feedID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v26);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
    }
    while (v15);
  }

  objc_msgSend(v11, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "cachedRecordsWithIDs:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedItemHeadlinesOperation rapidUpdateRefreshTest](v68, "rapidUpdateRefreshTest");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke;
    v83[3] = &unk_1E463F000;
    v84 = v10;
    v85 = v68;
    objc_msgSend(v28, "heldRecordsPassingTest:", v83);
    v30 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v30;
  }
  objc_msgSend(v69, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "cachedRecordsWithIDs:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "cachedRecordsWithIDs:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "unionSet:", v11);
  objc_msgSend(v35, "unionSet:", v69);
  objc_msgSend(v35, "unionSet:", v12);
  objc_msgSend(v28, "allRecordIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v36);

  v58 = v32;
  objc_msgSend(v32, "allRecordIDs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v37);

  v56 = v34;
  objc_msgSend(v34, "allRecordIDs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fc_removeObjectsFromArray:", v38);

  v39 = (void *)MEMORY[0x1E0C99D20];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2;
  v79[3] = &unk_1E463F098;
  v67 = v66;
  v80 = v67;
  v54 = v65;
  v81 = v54;
  v62 = v61;
  v82 = v62;
  objc_msgSend(v39, "fc_array:", v79);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
  -[FCFeedItemHeadlinesOperation context](v68, "context");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "internalContentContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "contentDatabase");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v41, v44);

  v46 = v68;
  if (v41)
    objc_setProperty_nonatomic_copy(v41, v45, v40, 384);
  if (!-[FCFeedItemHeadlinesOperation cachedOnly](v68, "cachedOnly", v54))
  {
    objc_msgSend(v35, "allObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "fc_arrayByTransformingWithBlock:", &__block_literal_global_145);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_setProperty_nonatomic_copy(v41, v48, v49, 376);

    v46 = v68;
  }
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_4;
  newValue[3] = &unk_1E4648898;
  v71 = v67;
  v72 = v55;
  v73 = v62;
  v74 = v46;
  v75 = v28;
  v76 = v58;
  v77 = v56;
  v78 = v63;
  v64 = v63;
  v57 = v56;
  v59 = v58;
  v60 = v28;
  v50 = v62;
  v51 = v55;
  v53 = v67;
  if (v41)
    objc_setProperty_nonatomic_copy(v41, v52, newValue, 400);
  -[FCOperation associateChildOperation:](v68, "associateChildOperation:", v41);
  -[FCOperation start](v41, "start");

}

uint64_t __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD, double);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "behaviorFlags") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateWithPBDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_timeIntervalUntilNow");
    v10 = v9;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v3, "base", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
          objc_msgSend(*(id *)(a1 + 40), "rapidUpdateRefreshTest");
          v20 = (uint64_t (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
          LOBYTE(v19) = v20[2](v20, v19, v10);

          if ((v19 & 1) != 0)
          {
            v4 = 0;
            goto LABEL_13;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          continue;
        break;
      }
    }
    v4 = 1;
LABEL_13:

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "desiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 40), "desiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 48), "desiredKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

}

id __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C95070];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithRecordName:", v3);

  return v4;
}

void __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v49 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = v4;
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (!v6)
    goto LABEL_18;
  v7 = v6;
  v8 = *(_QWORD *)v58;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v58 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
      objc_msgSend(v10, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Article"));

      if (v12)
      {
        v13 = v54;
LABEL_12:
        objc_msgSend(v13, "addObject:", v10);
        goto LABEL_13;
      }
      objc_msgSend(v10, "recordType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Tag"));

      if (v15)
      {
        v13 = v53;
        goto LABEL_12;
      }
      objc_msgSend(v10, "recordType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Issue"));

      if (v17)
      {
        v13 = v52;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "recordType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("unexpected record type %@"), v19);
        *(_DWORD *)buf = 136315906;
        v62 = "-[FCFeedItemHeadlinesOperation _fetchUnadornedHeadlinesWithCompletionHandler:]_block_invoke_4";
        v63 = 2080;
        v64 = "FCFeedItemHeadlinesOperation.m";
        v65 = 1024;
        v66 = 282;
        v67 = 2114;
        v68 = v20;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
LABEL_13:
      ++v9;
    }
    while (v7 != v9);
    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    v7 = v21;
  }
  while (v21);
LABEL_18:

  objc_msgSend(*(id *)(a1 + 32), "saveArticleRecords:", v54);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "saveTagRecords:", v53);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "saveRecords:", v52);
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v22;
  +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v22, *(_QWORD *)(a1 + 64));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v23;
  +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v23, *(_QWORD *)(a1 + 72));
  v27 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v24;
  +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v24, *(_QWORD *)(a1 + 80));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "feedItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fc_setByTransformingWithBlock:", &__block_literal_global_29_2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tagController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v27;
  objc_msgSend(v32, "channelsForTagRecords:", v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "context");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "assetManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v25;
  v36 = v26;
  FCHeadlinesByArticleIDFromHeldRecords(v25, v35, v30, v26, v33, v28, objc_msgSend(*(id *)(a1 + 56), "shouldFilterHeadlinesWithoutSourceChannels"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "feedItems");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2_30;
  v55[3] = &unk_1E4648870;
  v56 = v37;
  v39 = v37;
  objc_msgSend(v38, "fc_arrayByTransformingWithBlock:", v55);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v40, "count"))
  {
    v41 = 0;
    v42 = v49;
  }
  else
  {
    v42 = v49;
    objc_msgSend(v49, "allValues");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

uint64_t __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

id __78__FCFeedItemHeadlinesOperation__fetchUnadornedHeadlinesWithCompletionHandler___block_invoke_2_30(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (FCFeedPersonalizing)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_personalizer, a3);
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return self->_feedPersonalizationConfigurationSet;
}

- (void)setFeedPersonalizationConfigurationSet:(int64_t)a3
{
  self->_feedPersonalizationConfigurationSet = a3;
}

- (BOOL)shouldFilterHeadlinesWithoutSourceChannels
{
  return self->_shouldFilterHeadlinesWithoutSourceChannels;
}

- (void)setShouldFilterHeadlinesWithoutSourceChannels:(BOOL)a3
{
  self->_shouldFilterHeadlinesWithoutSourceChannels = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)rapidUpdateRefreshTest
{
  return self->_rapidUpdateRefreshTest;
}

- (void)setRapidUpdateRefreshTest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (id)headlinesMapCompletionHandler
{
  return self->_headlinesMapCompletionHandler;
}

- (void)setHeadlinesMapCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (void)setResultHeadlines:(id)a3
{
  objc_storeStrong((id *)&self->_resultHeadlines, a3);
}

- (FCFeedItemHeadlinesOperationProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong(&self->_headlinesMapCompletionHandler, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong(&self->_rapidUpdateRefreshTest, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
