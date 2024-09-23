@implementation FCIssueReadingHistory

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:", objc_opt_class());

}

+ (unint64_t)localStoreVersion
{
  return 2;
}

+ (id)localStoreFilename
{
  return CFSTR("issue-history");
}

+ (id)commandStoreFileName
{
  return CFSTR("issue-history-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

void __49__FCIssueReadingHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAllEntriesToDictionary:", obj);

  objc_msgSend((id)objc_opt_class(), "internalLocalStoreKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "removeObjectsForKeys:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    objc_storeStrong((id *)(v5 + 96), obj);

}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__FCIssueReadingHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (FCIssueReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCIssueReadingHistory *v11;
  uint64_t v12;
  FCMTWriterLock *itemsLock;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    v23 = 1024;
    v24 = 49;
    v25 = 2114;
    v26 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "pushNotificationCenter != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    v23 = 1024;
    v24 = 50;
    v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storeDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    v23 = 1024;
    v24 = 51;
    v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v18.receiver = self;
  v18.super_class = (Class)FCIssueReadingHistory;
  v11 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v18, sel_initWithContext_pushNotificationCenter_storeDirectory_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_new();
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = (FCMTWriterLock *)v12;

  }
  return v11;
}

- (void)markIssueWithID:(id)a3 asVisitedWithBookmark:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCIssueReadingHistory markIssueWithID:asVisitedWithBookmark:]";
    v15 = 2080;
    v16 = "FCIssueReadingHistory.m";
    v17 = 1024;
    v18 = 66;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "bookmark != nil");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCIssueReadingHistory markIssueWithID:asVisitedWithBookmark:]";
    v15 = 2080;
    v16 = "FCIssueReadingHistory.m";
    v17 = 1024;
    v18 = 67;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__FCIssueReadingHistory_markIssueWithID_asVisitedWithBookmark___block_invoke;
  v11[3] = &unk_1E463AC08;
  v12 = v7;
  v8 = v7;
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v6, v11);

}

void __63__FCIssueReadingHistory_markIssueWithID_asVisitedWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastVisitedDate:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "issueType");
  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "pageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastVisitedPageID:", v5);
    goto LABEL_5;
  }
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastVisitedArticleID:", v5);
LABEL_5:

  }
}

- (void)_modifyHistoryForIssueID:(void *)a3 withBlock:
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCModifyIssueHistoryCommand *v11;
  void *v12;
  FCModifyIssueHistoryCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:]";
    v22 = 2080;
    v23 = "FCIssueReadingHistory.m";
    v24 = 1024;
    v25 = 475;
    v26 = 2114;
    v27 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v6)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
        *(_DWORD *)buf = 136315906;
        v21 = "-[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:]";
        v22 = 2080;
        v23 = "FCIssueReadingHistory.m";
        v24 = 1024;
        v25 = 476;
        v26 = 2114;
        v27 = v16;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)a1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    FCIssueHistoryItemIDFromIssueID((uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v9);

    objc_msgSend(v8, "setIssueID:", v5);
  }
  v6[2](v6, v8);
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCIssueReadingHistory _addHistoryItems:]((uint64_t)a1, v10);

  v11 = [FCModifyIssueHistoryCommand alloc];
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCModifyIssueHistoryCommand initWithIssueHistoryItems:merge:](v11, "initWithIssueHistoryItems:merge:", v12, 0);

  objc_msgSend(a1, "addCommandToCommandQueue:", v13);
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCIssueReadingHistory _didChangeForIssueIDs:](a1, v14);

LABEL_10:
}

- (BOOL)hasIssueWithIDBeenVisited:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCIssueReadingHistory hasIssueWithIDBeenVisited:]";
    v11 = 2080;
    v12 = "FCIssueReadingHistory.m";
    v13 = 1024;
    v14 = 86;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory bookmarkForLastVisitToIssueWithID:](self, "bookmarkForLastVisitToIssueWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)markIssueAsBadgedWithID:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCIssueReadingHistory markIssueAsBadgedWithID:]";
    v8 = 2080;
    v9 = "FCIssueReadingHistory.m";
    v10 = 1024;
    v11 = 93;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_0);

}

void __49__FCIssueReadingHistory_markIssueAsBadgedWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastBadgedDate:", v4);

}

- (BOOL)hasIssueWithIDBeenBadged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenBadged:]";
    v12 = 2080;
    v13 = "FCIssueReadingHistory.m";
    v14 = 1024;
    v15 = 101;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastBadgedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)_historyItemForIssueID:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE buf[24];
  __int128 v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCIssueReadingHistory _historyItemForIssueID:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCIssueReadingHistory.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 452;
      WORD2(v19) = 2114;
      *(_QWORD *)((char *)&v19 + 6) = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    FCIssueHistoryItemIDFromIssueID((uint64_t)v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCIssueReadingHistory _historyItemForID:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCIssueReadingHistory.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 460;
      WORD2(v19) = 2114;
      *(_QWORD *)((char *)&v19 + 6) = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = 0;
    v6 = *(id *)(a1 + 104);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __43__FCIssueReadingHistory__historyItemForID___block_invoke;
    *(_QWORD *)&v19 = &unk_1E463AD58;
    v21 = &v12;
    *((_QWORD *)&v19 + 1) = a1;
    v7 = v5;
    v20 = v7;
    objc_msgSend(v6, "performReadSync:", buf);

    v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)markIssueAsEngagedWithID:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCIssueReadingHistory markIssueAsEngagedWithID:]";
    v8 = 2080;
    v9 = "FCIssueReadingHistory.m";
    v10 = 1024;
    v11 = 108;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_15);

}

void __50__FCIssueReadingHistory_markIssueAsEngagedWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastEngagedDate:", v4);

}

- (BOOL)hasIssueWithIDBeenEngaged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenEngaged:]";
    v12 = 2080;
    v13 = "FCIssueReadingHistory.m";
    v14 = 1024;
    v15 = 116;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEngagedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)markIssueAsSeenWithID:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCIssueReadingHistory markIssueAsSeenWithID:]";
    v8 = 2080;
    v9 = "FCIssueReadingHistory.m";
    v10 = 1024;
    v11 = 123;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_16);

}

void __47__FCIssueReadingHistory_markIssueAsSeenWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastSeenDate:", v4);

}

- (BOOL)hasIssueWithIDBeenSeen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenSeen:]";
    v12 = 2080;
    v13 = "FCIssueReadingHistory.m";
    v14 = 1024;
    v15 = 131;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)markIssueAsRemovedFromMyMagazinesWithID:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCIssueReadingHistory markIssueAsRemovedFromMyMagazinesWithID:]";
    v8 = 2080;
    v9 = "FCIssueReadingHistory.m";
    v10 = 1024;
    v11 = 138;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_17);

}

void __65__FCIssueReadingHistory_markIssueAsRemovedFromMyMagazinesWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastRemovedFromMyMagazinesDate:", v4);

}

- (id)bookmarkForLastVisitToIssueWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCIssueReadingHistory bookmarkForLastVisitToIssueWithID:]";
    v14 = 2080;
    v15 = "FCIssueReadingHistory.m";
    v16 = 1024;
    v17 = 147;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastVisitedArticleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "lastVisitedArticleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCIssueBookmark ANFBookmarkWithArticleID:](FCIssueBookmark, "ANFBookmarkWithArticleID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v8;

    goto LABEL_9;
  }
  objc_msgSend(v5, "lastVisitedPageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "lastVisitedPageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCIssueBookmark PDFBookmarkWithPageID:](FCIssueBookmark, "PDFBookmarkWithPageID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (id)lastVisitedDateForIssueWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCIssueReadingHistory lastVisitedDateForIssueWithID:]";
    v11 = 2080;
    v12 = "FCIssueReadingHistory.m";
    v13 = 1024;
    v14 = 168;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastVisitedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastEngagedDateForIssueWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCIssueReadingHistory lastEngagedDateForIssueWithID:]";
    v11 = 2080;
    v12 = "FCIssueReadingHistory.m";
    v13 = 1024;
    v14 = 176;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEngagedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastSeenDateForIssueWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCIssueReadingHistory lastSeenDateForIssueWithID:]";
    v11 = 2080;
    v12 = "FCIssueReadingHistory.m";
    v13 = 1024;
    v14 = 184;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCIssueReadingHistory lastRemovedFromMyMagazinesDateForIssueWithID:]";
    v11 = 2080;
    v12 = "FCIssueReadingHistory.m";
    v13 = 1024;
    v14 = 192;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastRemovedFromMyMagazinesDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)mostRecentlyVisitedIssueID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_allHistoryItems
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__0;
    v9 = __Block_byref_object_dispose__0;
    v10 = 0;
    v2 = a1[13];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__FCIssueReadingHistory__allHistoryItems__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

uint64_t __51__FCIssueReadingHistory_mostRecentlyVisitedIssueID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a3;
  objc_msgSend(a2, "lastVisitedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastVisitedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

- (NSArray)recentlyVisitedIssueIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[FCPrivateDataController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paidBundleConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)objc_msgSend(v6, "recentIssuesMaxAge");

  -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke;
  v13[3] = &__block_descriptor_40_e44_B16__0___FCMutableIssueReadingHistoryItem__8l;
  *(double *)&v13[4] = v7;
  objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

BOOL __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "lastVisitedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "lastVisitedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fc_timeIntervalUntilNow");
    v7 = v6 <= *(double *)(a1 + 32);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a2;
  objc_msgSend(a3, "lastVisitedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastVisitedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

- (NSArray)recentlyEngagedIssueIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[FCPrivateDataController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paidBundleConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)objc_msgSend(v6, "recentIssuesMaxAge");

  -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke;
  v13[3] = &__block_descriptor_40_e44_B16__0___FCMutableIssueReadingHistoryItem__8l;
  *(double *)&v13[4] = v7;
  objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_26_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

BOOL __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "lastEngagedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "lastEngagedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fc_timeIntervalUntilNow");
    v7 = v6 <= *(double *)(a1 + 32);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a2;
  objc_msgSend(a3, "lastEngagedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEngagedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

- (NSArray)allEngagedIssueIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

BOOL __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "lastEngagedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a2;
  objc_msgSend(a3, "lastEngagedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEngagedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueReadingHistory addObserver:]";
    v9 = 2080;
    v10 = "FCIssueReadingHistory.m";
    v11 = 1024;
    v12 = 272;
    v13 = 2114;
    v14 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v6.receiver = self;
  v6.super_class = (Class)FCIssueReadingHistory;
  -[FCPrivateDataController addObserver:](&v6, sel_addObserver_, v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueReadingHistory removeObserver:]";
    v9 = 2080;
    v10 = "FCIssueReadingHistory.m";
    v11 = 1024;
    v12 = 280;
    v13 = 2114;
    v14 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v6.receiver = self;
  v6.super_class = (Class)FCIssueReadingHistory;
  -[FCPrivateDataController removeObserver:](&v6, sel_removeObserver_, v4);

}

- (void)clearHistory
{
  NSMutableDictionary *itemsByID;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  FCMTWriterLock *itemsLock;
  FCRemoveIssueHistoryCommand *v10;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    itemsByID = self->_itemsByID;
  else
    itemsByID = 0;
  -[NSMutableDictionary allKeys](itemsByID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v5 = self->_itemsByID;
  else
    v5 = 0;
  -[NSMutableDictionary allValues](v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsForKeys:", v4);

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__FCIssueReadingHistory_clearHistory__block_invoke_2;
  v11[3] = &unk_1E463AB18;
  v11[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v11);
  v10 = -[FCRemoveIssueHistoryCommand initWithIssueHistoryItemIDs:]([FCRemoveIssueHistoryCommand alloc], "initWithIssueHistoryItemIDs:", v4);
  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v10);
  -[FCIssueReadingHistory _didChangeForIssueIDs:](self, v7);

}

uint64_t __37__FCIssueReadingHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

uint64_t __37__FCIssueReadingHistory_clearHistory__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 96);
  else
    v2 = 0;
  return objc_msgSend(v2, "removeAllObjects");
}

- (void)_didChangeForIssueIDs:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1, "observers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "issueReadingHistoryDidChange:forIssueIDs:", a1, v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("IssueReadingHistory"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  FCModifyIssueHistoryCommand *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  FCModifyIssueHistoryCommand *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  v14 = -[FCModifyIssueHistoryCommand initWithIssueHistoryItems:merge:]([FCModifyIssueHistoryCommand alloc], "initWithIssueHistoryItems:merge:", v6, 1);
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *itemsByID;
  void *v12;
  void *v13;
  FCMTWriterLock *itemsLock;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  FCIssueReadingHistory *v22;
  id v23;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = a3;
  objc_msgSend(v7, "isMainThread");
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_46);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsByID = self->_itemsByID;
  else
    itemsByID = 0;
  -[NSMutableDictionary nf_objectsForKeysWithoutMarker:](itemsByID, "nf_objectsForKeysWithoutMarker:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", &__block_literal_global_49);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCIssueReadingHistory _addHistoryItems:]((uint64_t)self, v9);
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_4;
  v21 = &unk_1E463AD10;
  v22 = self;
  v15 = v6;
  v23 = v15;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", &v18);
  -[FCPrivateDataController localStore](self, "localStore", v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsForKeys:", v15);

  if (objc_msgSend(v10, "count") || objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v10, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCIssueReadingHistory _didChangeForIssueIDs:](self, v17);

  }
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D626E8], "issueReadingHistoryItemWithCKRecord:", a2);
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueID");
}

- (void)_addHistoryItems:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "items != nil");
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCIssueReadingHistory _addHistoryItems:]";
      v11 = 2080;
      v12 = "FCIssueReadingHistory.m";
      v13 = 1024;
      v14 = 501;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v4 = *(void **)(a1 + 104);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__FCIssueReadingHistory__addHistoryItems___block_invoke;
    v6[3] = &unk_1E463AD10;
    v7 = v3;
    v8 = a1;
    objc_msgSend(v4, "performWriteSync:", v6);

  }
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_4(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *itemsByID;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    itemsByID = self->_itemsByID;
  else
    itemsByID = 0;
  return (id)-[NSMutableDictionary allKeys](itemsByID, "allKeys");
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("IssueReadingHistory"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  void *v3;
  void *v4;

  -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_51);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__FCIssueReadingHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

void __43__FCIssueReadingHistory__historyItemForID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __42__FCIssueReadingHistory__addHistoryItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(v7, "identifier", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        if (v9)
          v10 = *(void **)(v9 + 96);
        else
          v10 = 0;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v8);
        objc_msgSend(*(id *)(a1 + 40), "localStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v8);

        ++v6;
      }
      while (v4 != v6);
      v12 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v4 = v12;
    }
    while (v12);
  }

}

void __41__FCIssueReadingHistory__allHistoryItems__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_itemsByID, 0);
}

@end
