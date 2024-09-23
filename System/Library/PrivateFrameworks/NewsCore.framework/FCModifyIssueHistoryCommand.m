@implementation FCModifyIssueHistoryCommand

- (FCModifyIssueHistoryCommand)initWithIssueHistoryItems:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  FCModifyIssueHistoryCommand *v9;
  void *v11;
  objc_super v12;
  _QWORD aBlock[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "historyItems != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCModifyIssueHistoryCommand initWithIssueHistoryItems:merge:]";
    v17 = 2080;
    v18 = "FCModifyIssueHistoryCommand.m";
    v19 = 1024;
    v20 = 23;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke;
  aBlock[3] = &unk_1E4643BA0;
  v14 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v12.receiver = self;
  v12.super_class = (Class)FCModifyIssueHistoryCommand;
  v9 = -[FCModifyRecordsCommand initWithLocalRecordsGenerator:merge:](&v12, sel_initWithLocalRecordsGenerator_merge_, v8, v4);

  return v9;
}

uint64_t __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_158);
}

uint64_t __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (id)recordZoneName
{
  return CFSTR("IssueReadingHistory");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisited"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastVisited"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  v8 = objc_msgSend(v7, "compare:", v30);
  v9 = v8 == 1;
  if (v8 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisited"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastVisited"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisitedPageID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("lastVisitedPageID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisitedArticleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("lastVisitedArticleID"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastBadged"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastBadged"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  if (objc_msgSend(v13, "compare:", v28) == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastBadged"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("lastBadged"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastEngaged"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastEngaged"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && (!v16 || objc_msgSend(v15, "compare:", v16) == 1))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastEngaged"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("lastEngaged"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastSeen"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSeen"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && (!v20 || objc_msgSend(v19, "compare:", v20) == 1))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastSeen"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("lastSeen"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastRemovedFromMyMagazines"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastRemovedFromMyMagazines"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v23 && (!v24 || objc_msgSend(v23, "compare:", v24) == 1))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastRemovedFromMyMagazines"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("lastRemovedFromMyMagazines"));

    v9 = 1;
  }

  return v9;
}

@end
