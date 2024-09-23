@implementation FCFeedTransformationUnreadFirst

+ (id)transformationWithReadingHistory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHistory:", v3);

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
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
  v4 = a3;
  -[FCFeedTransformationUnreadFirst history](self, "history");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't sort unread articles to the front without history"));
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFeedTransformationUnreadFirst transformFeedItems:]";
    v16 = 2080;
    v17 = "FCFeedTransformationUnreadFirst.m";
    v18 = 1024;
    v19 = 31;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedTransformationUnreadFirst history](self, "history");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allReadArticleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__FCFeedTransformationUnreadFirst_transformFeedItems___block_invoke;
  v12[3] = &unk_1E463F360;
  v13 = v7;
  v8 = v7;
  objc_msgSend(v4, "sortedArrayWithOptions:usingComparator:", 16, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __54__FCFeedTransformationUnreadFirst_transformFeedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "articleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "articleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "containsObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compare:", v13);

  return v14;
}

- (FCReadingHistory)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
