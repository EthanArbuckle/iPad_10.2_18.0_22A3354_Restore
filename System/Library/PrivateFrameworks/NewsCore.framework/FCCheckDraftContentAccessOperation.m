@implementation FCCheckDraftContentAccessOperation

- (FCCheckDraftContentAccessOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCheckDraftContentAccessOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[FCCheckDraftContentAccessOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check draft content access operation requires context"));
    v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    v20 = 1024;
    v21 = 36;
    v22 = 2114;
    v23 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);

  }
  -[FCCheckDraftContentAccessOperation channelMemberships](self, "channelMemberships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check draft content access operation requires channel memberships"));
    v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    v20 = 1024;
    v21 = 40;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);

  }
  -[FCCheckDraftContentAccessOperation issueIDs](self, "issueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_10:
    v7 = 1;
    goto LABEL_11;
  }
  -[FCCheckDraftContentAccessOperation articleIDs](self, "articleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check draft content access operation requires content IDs"));
    v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    v20 = 1024;
    v21 = 44;
    v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);

  }
  v7 = 0;
LABEL_11:
  -[FCCheckDraftContentAccessOperation checkAccessCompletion](self, "checkAccessCompletion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check draft content access operation requires completion"));
    v16 = 136315906;
    v17 = "-[FCCheckDraftContentAccessOperation validateOperation]";
    v18 = 2080;
    v19 = "FCCheckDraftContentAccessOperation.m";
    v20 = 1024;
    v21 = 48;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v16, 0x26u);

  }
  if (v3)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = v7;
  return v8 && v10;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
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
  id v35;
  id v36;
  FCCheckDraftContentAccessOperation *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  _QWORD v54[4];
  const __CFString *v55;
  _QWORD v56[4];
  _QWORD v57[4];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  -[FCCheckDraftContentAccessOperation channelMemberships](self, "channelMemberships");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCheckDraftContentAccessOperation articleIDs](self, "articleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCheckDraftContentAccessOperation issueIDs](self, "issueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v9);
  }

  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v45 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v14);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
        objc_msgSend(v22, "draftIssueListID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fc_safelyAddObject:", v23);

        objc_msgSend(v22, "draftArticleListID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fc_safelyAddObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v19);
  }

  v25 = (void *)objc_opt_new();
  -[FCCheckDraftContentAccessOperation context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContext:", v26);

  objc_msgSend(v6, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTopLevelRecordIDs:", v27);

  v37 = self;
  v56[0] = CFSTR("Article");
  v56[1] = CFSTR("ArticleList");
  v57[0] = MEMORY[0x1E0C9AA60];
  v57[1] = MEMORY[0x1E0C9AA60];
  v57[2] = MEMORY[0x1E0C9AA60];
  v56[2] = CFSTR("Issue");
  v56[3] = CFSTR("IssueList");
  v55 = CFSTR("issueIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLinkKeysByRecordType:", v29);

  v53[0] = CFSTR("Article");
  +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v30;
  v53[1] = CFSTR("ArticleList");
  +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v31;
  v53[2] = CFSTR("Issue");
  +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v32;
  v53[3] = CFSTR("IssueList");
  +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCachePoliciesByRecordType:", v34);

  objc_msgSend(v25, "setShouldReturnErrorWhenSomeRecordsMissing:", 0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke;
  v38[3] = &unk_1E4645498;
  v38[4] = v37;
  v39 = v12;
  v40 = v7;
  v35 = v7;
  v36 = v12;
  objc_msgSend(v25, "setRecordChainCompletionHandler:", v38);
  -[FCOperation associateChildOperation:](v37, "associateChildOperation:", v25);
  objc_msgSend(v25, "start");

}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(a1[4], "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_2;
    v38[3] = &unk_1E463AE18;
    v27 = v5;
    v25 = v5;
    v39 = v25;
    objc_msgSend(v7, "fc_set:", v38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = a1[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "containsObject:", v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v11);
    }

    v16 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_21;
    v32[3] = &unk_1E463AE18;
    v33 = v25;
    objc_msgSend(v16, "fc_set:", v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = a1;
    v18 = a1[6];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "containsObject:", v23, v26));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v20);
    }

    objc_msgSend(v26[4], "setResultAccessByContentID:", v6);
    objc_msgSend(v26[4], "finishedPerformingOperationWithError:", 0);

    v5 = v27;
  }

}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470AB98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "allRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "issueIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObjects:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470ABB0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v11, "allRecords", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if ((objc_msgSend(v17, "isDraft") & 1) == 0)
        {
          objc_msgSend(v17, "base");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v19);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

}

void __54__FCCheckDraftContentAccessOperation_performOperation__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470ABC8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "allRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "articleIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObjects:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470ABB0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v11, "allRecords");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "allArticleIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObjects:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E470ABE0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v18, "allRecords", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * k);
        if ((objc_msgSend(v24, "isDraft") & 1) == 0)
        {
          objc_msgSend(v24, "base");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v21);
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, id);

  v4 = a3;
  -[FCCheckDraftContentAccessOperation checkAccessCompletion](self, "checkAccessCompletion");
  v6 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  -[FCCheckDraftContentAccessOperation resultAccessByContentID](self, "resultAccessByContentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v4);

}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)channelMemberships
{
  return self->_channelMemberships;
}

- (void)setChannelMemberships:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSSet)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)checkAccessCompletion
{
  return self->_checkAccessCompletion;
}

- (void)setCheckAccessCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSDictionary)resultAccessByContentID
{
  return self->_resultAccessByContentID;
}

- (void)setResultAccessByContentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultAccessByContentID, 0);
  objc_storeStrong(&self->_checkAccessCompletion, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_channelMemberships, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
