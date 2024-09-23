@implementation FCContentContextInternal

- (FCCKContentDatabase)contentDatabase
{
  FCCKContentDatabase *contentDatabase;
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
  contentDatabase = self->_contentDatabase;
  if (!contentDatabase)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_contentDatabase");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal contentDatabase]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 964;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_contentDatabase;
    }
    contentDatabase = 0;
  }
  return contentDatabase;
}

- (NSArray)recordSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[16];

  v19[14] = *MEMORY[0x1E0C80C00];
  -[FCContentContextInternal articleRecordSource](self, "articleRecordSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  -[FCContentContextInternal articleListRecordSource](self, "articleListRecordSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  -[FCContentContextInternal audioConfigRecordSource](self, "audioConfigRecordSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  -[FCContentContextInternal forYouConfigRecordSource](self, "forYouConfigRecordSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  -[FCContentContextInternal issueRecordSource](self, "issueRecordSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  -[FCContentContextInternal issueListRecordSource](self, "issueListRecordSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  -[FCContentContextInternal purchaseLookupRecordSource](self, "purchaseLookupRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  -[FCContentContextInternal puzzleRecordSource](self, "puzzleRecordSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  -[FCContentContextInternal puzzleTypeRecordSource](self, "puzzleTypeRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  -[FCContentContextInternal resourceRecordSource](self, "resourceRecordSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v8;
  -[FCContentContextInternal sportsEventRecordSource](self, "sportsEventRecordSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v9;
  -[FCContentContextInternal tagRecordSource](self, "tagRecordSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v10;
  -[FCContentContextInternal tagListRecordSource](self, "tagListRecordSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v11;
  -[FCContentContextInternal widgetSectionConfigRecordSource](self, "widgetSectionConfigRecordSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 14);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (FCResourceRecordSource)resourceRecordSource
{
  FCResourceRecordSource *resourceRecordSource;
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
  resourceRecordSource = self->_resourceRecordSource;
  if (!resourceRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_resourceRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal resourceRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 884;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_resourceRecordSource;
    }
    resourceRecordSource = 0;
  }
  return resourceRecordSource;
}

- (FCArticleRecordSource)articleRecordSource
{
  FCArticleRecordSource *articleRecordSource;
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
  articleRecordSource = self->_articleRecordSource;
  if (!articleRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_articleRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal articleRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 860;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_articleRecordSource;
    }
    articleRecordSource = 0;
  }
  return articleRecordSource;
}

- (FCWidgetSectionConfigRecordSource)widgetSectionConfigRecordSource
{
  FCWidgetSectionConfigRecordSource *widgetSectionConfigRecordSource;
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
  widgetSectionConfigRecordSource = self->_widgetSectionConfigRecordSource;
  if (!widgetSectionConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_widgetSectionConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal widgetSectionConfigRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 908;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_widgetSectionConfigRecordSource;
    }
    widgetSectionConfigRecordSource = 0;
  }
  return widgetSectionConfigRecordSource;
}

- (FCTagRecordSource)tagRecordSource
{
  FCTagRecordSource *tagRecordSource;
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
  tagRecordSource = self->_tagRecordSource;
  if (!tagRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_tagRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal tagRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 866;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_tagRecordSource;
    }
    tagRecordSource = 0;
  }
  return tagRecordSource;
}

- (FCTagListRecordSource)tagListRecordSource
{
  FCTagListRecordSource *tagListRecordSource;
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
  tagListRecordSource = self->_tagListRecordSource;
  if (!tagListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_tagListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal tagListRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 872;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_tagListRecordSource;
    }
    tagListRecordSource = 0;
  }
  return tagListRecordSource;
}

- (FCSportsEventRecordSource)sportsEventRecordSource
{
  return self->_sportsEventRecordSource;
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  FCPuzzleTypeRecordSource *puzzleTypeRecordSource;
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
  puzzleTypeRecordSource = self->_puzzleTypeRecordSource;
  if (!puzzleTypeRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_puzzleTypeRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal puzzleTypeRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 938;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_puzzleTypeRecordSource;
    }
    puzzleTypeRecordSource = 0;
  }
  return puzzleTypeRecordSource;
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  FCPuzzleRecordSource *puzzleRecordSource;
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
  puzzleRecordSource = self->_puzzleRecordSource;
  if (!puzzleRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_puzzleRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal puzzleRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 932;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_puzzleRecordSource;
    }
    puzzleRecordSource = 0;
  }
  return puzzleRecordSource;
}

- (FCPurchaseLookupRecordSource)purchaseLookupRecordSource
{
  FCPurchaseLookupRecordSource *purchaseLookupRecordSource;
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
  purchaseLookupRecordSource = self->_purchaseLookupRecordSource;
  if (!purchaseLookupRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_purchaseLookupRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal purchaseLookupRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 896;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_purchaseLookupRecordSource;
    }
    purchaseLookupRecordSource = 0;
  }
  return purchaseLookupRecordSource;
}

- (FCIssueRecordSource)issueRecordSource
{
  FCIssueRecordSource *issueRecordSource;
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
  issueRecordSource = self->_issueRecordSource;
  if (!issueRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_issueRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal issueRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 914;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_issueRecordSource;
    }
    issueRecordSource = 0;
  }
  return issueRecordSource;
}

- (FCIssueListRecordSource)issueListRecordSource
{
  FCIssueListRecordSource *issueListRecordSource;
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
  issueListRecordSource = self->_issueListRecordSource;
  if (!issueListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_issueListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal issueListRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 920;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_issueListRecordSource;
    }
    issueListRecordSource = 0;
  }
  return issueListRecordSource;
}

- (FCForYouConfigRecordSource)forYouConfigRecordSource
{
  FCForYouConfigRecordSource *forYouConfigRecordSource;
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
  forYouConfigRecordSource = self->_forYouConfigRecordSource;
  if (!forYouConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_forYouConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal forYouConfigRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 902;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_forYouConfigRecordSource;
    }
    forYouConfigRecordSource = 0;
  }
  return forYouConfigRecordSource;
}

- (FCAudioConfigRecordSource)audioConfigRecordSource
{
  FCAudioConfigRecordSource *audioConfigRecordSource;
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
  audioConfigRecordSource = self->_audioConfigRecordSource;
  if (!audioConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_audioConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal audioConfigRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 926;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_audioConfigRecordSource;
    }
    audioConfigRecordSource = 0;
  }
  return audioConfigRecordSource;
}

- (FCArticleListRecordSource)articleListRecordSource
{
  FCArticleListRecordSource *articleListRecordSource;
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
  articleListRecordSource = self->_articleListRecordSource;
  if (!articleListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_articleListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal articleListRecordSource]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 890;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_articleListRecordSource;
    }
    articleListRecordSource = 0;
  }
  return articleListRecordSource;
}

void __64__FCContentContextInternal_enableFlushingWithFlushingThreshold___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordSources");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (void)setWidgetSectionConfigRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionConfigRecordSource, a3);
}

- (void)setTagRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_tagRecordSource, a3);
}

- (void)setTagListRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_tagListRecordSource, a3);
}

- (void)setSportsEventRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_sportsEventRecordSource, a3);
}

- (void)setResourceRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_resourceRecordSource, a3);
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, a3);
}

- (void)setPuzzleRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleRecordSource, a3);
}

- (void)setPurchaseLookupRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseLookupRecordSource, a3);
}

- (void)setIssueRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_issueRecordSource, a3);
}

- (void)setIssueListRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_issueListRecordSource, a3);
}

- (void)setForYouConfigRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_forYouConfigRecordSource, a3);
}

- (void)setFeedPrewarmer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPrewarmer, a3);
}

- (void)setFeedDatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setContentDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_contentDatabase, a3);
}

- (void)setChannelMembershipController:(id)a3
{
  objc_storeStrong((id *)&self->_channelMembershipController, a3);
}

- (void)setAvAssetKeyCache:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetKeyCache, a3);
}

- (void)setAvAssetFactory:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetFactory, a3);
}

- (void)setAvAssetDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetDownloadManager, a3);
}

- (void)setAvAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetCache, a3);
}

- (void)setAudioConfigRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_audioConfigRecordSource, a3);
}

- (void)setAssetKeyManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeyManager, a3);
}

- (void)setAssetKeyCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetKeyCache, a3);
}

- (void)setArticleRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecordSource, a3);
}

- (void)setArticleListRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_articleListRecordSource, a3);
}

- (FCContentContextInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCContentContextInternal;
  return -[FCContentContextInternal init](&v3, sel_init);
}

- (FCChannelMembershipController)channelMembershipController
{
  FCChannelMembershipController *channelMembershipController;
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
  channelMembershipController = self->_channelMembershipController;
  if (!channelMembershipController)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_channelMembershipController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal channelMembershipController]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 878;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_channelMembershipController;
    }
    channelMembershipController = 0;
  }
  return channelMembershipController;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FCContentContextInternal_enableFlushingWithFlushingThreshold___block_invoke;
  v13[3] = &unk_1E463AA30;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "enableFlushingWithFlushingThreshold:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (FCFeedPrewarmer)feedPrewarmer
{
  return self->_feedPrewarmer;
}

- (FCFeedDatabase)feedDatabase
{
  return (FCFeedDatabase *)objc_getProperty(self, a2, 128, 1);
}

- (FCAssetKeyCacheType)assetKeyCache
{
  FCAssetKeyCacheType *assetKeyCache;
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
  assetKeyCache = self->_assetKeyCache;
  if (!assetKeyCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_assetKeyCache");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal assetKeyCache]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 970;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_assetKeyCache;
    }
    assetKeyCache = 0;
  }
  return assetKeyCache;
}

- (FCAssetKeyManagerType)assetKeyManager
{
  FCAssetKeyManagerType *assetKeyManager;
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
  assetKeyManager = self->_assetKeyManager;
  if (!assetKeyManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_assetKeyManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal assetKeyManager]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 976;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_assetKeyManager;
    }
    assetKeyManager = 0;
  }
  return assetKeyManager;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  FCAVAssetFactoryType *avAssetFactory;
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
  avAssetFactory = self->_avAssetFactory;
  if (!avAssetFactory)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_avAssetFactory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal avAssetFactory]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 982;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_avAssetFactory;
    }
    avAssetFactory = 0;
  }
  return avAssetFactory;
}

- (FCAVAssetCacheType)avAssetCache
{
  FCAVAssetCacheType *avAssetCache;
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
  avAssetCache = self->_avAssetCache;
  if (!avAssetCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_avAssetCache");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal avAssetCache]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 988;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_avAssetCache;
    }
    avAssetCache = 0;
  }
  return avAssetCache;
}

- (FCAVAssetKeyCacheType)avAssetKeyCache
{
  FCAVAssetKeyCacheType *avAssetKeyCache;
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
  avAssetKeyCache = self->_avAssetKeyCache;
  if (!avAssetKeyCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "_avAssetKeyCache");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal avAssetKeyCache]";
      v8 = 2080;
      v9 = "FCContentContext.m";
      v10 = 1024;
      v11 = 994;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      return self->_avAssetKeyCache;
    }
    avAssetKeyCache = 0;
  }
  return avAssetKeyCache;
}

- (FCAVAssetDownloadManager)avAssetDownloadManager
{
  return self->_avAssetDownloadManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPrewarmer, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadManager, 0);
  objc_storeStrong((id *)&self->_avAssetKeyCache, 0);
  objc_storeStrong((id *)&self->_avAssetCache, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_audioConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_issueListRecordSource, 0);
  objc_storeStrong((id *)&self->_issueRecordSource, 0);
  objc_storeStrong((id *)&self->_widgetSectionConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_forYouConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_purchaseLookupRecordSource, 0);
  objc_storeStrong((id *)&self->_articleListRecordSource, 0);
  objc_storeStrong((id *)&self->_resourceRecordSource, 0);
  objc_storeStrong((id *)&self->_channelMembershipController, 0);
  objc_storeStrong((id *)&self->_tagListRecordSource, 0);
  objc_storeStrong((id *)&self->_sportsEventRecordSource, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_articleRecordSource, 0);
}

@end
