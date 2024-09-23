@implementation FCFeedItemServiceCursor

- (FCFeedItemServiceCursor)init
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemServiceCursor init]";
    v9 = 2080;
    v10 = "FCFeedItemServiceCursor.m";
    v11 = 1024;
    v12 = 19;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedItemServiceCursor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCFeedItemServiceCursor)initWithLastRefreshed:(id)a3 feedItems:(id)a4
{
  id v6;
  id v7;
  FCFeedItemServiceCursor *v8;
  uint64_t v9;
  NTPBDate *lastRefreshed;
  uint64_t v11;
  NSArray *feedItems;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "lastRefreshed");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCFeedItemServiceCursor initWithLastRefreshed:feedItems:]";
    v19 = 2080;
    v20 = "FCFeedItemServiceCursor.m";
    v21 = 1024;
    v22 = 25;
    v23 = 2114;
    v24 = v14;
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
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItems");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCFeedItemServiceCursor initWithLastRefreshed:feedItems:]";
    v19 = 2080;
    v20 = "FCFeedItemServiceCursor.m";
    v21 = 1024;
    v22 = 26;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCFeedItemServiceCursor;
  v8 = -[FCFeedItemServiceCursor init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    lastRefreshed = v8->_lastRefreshed;
    v8->_lastRefreshed = (NTPBDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    feedItems = v8->_feedItems;
    v8->_feedItems = (NSArray *)v11;

  }
  return v8;
}

- (NTPBDate)lastRefreshed
{
  return self->_lastRefreshed;
}

- (NSArray)feedItems
{
  return self->_feedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItems, 0);
  objc_storeStrong((id *)&self->_lastRefreshed, 0);
}

@end
