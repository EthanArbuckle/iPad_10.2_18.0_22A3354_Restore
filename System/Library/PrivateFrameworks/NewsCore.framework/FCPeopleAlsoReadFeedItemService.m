@implementation FCPeopleAlsoReadFeedItemService

- (FCPeopleAlsoReadFeedItemService)initWithConfigurationManager:(id)a3 contentContext:(id)a4 readingHistory:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCPeopleAlsoReadFeedItemService *v12;
  FCPeopleAlsoReadFeedItemService *v13;
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
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    v23 = 1024;
    v24 = 38;
    v25 = 2114;
    v26 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    v23 = 1024;
    v24 = 39;
    v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "readingHistory");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPeopleAlsoReadFeedItemService initWithConfigurationManager:contentContext:readingHistory:]";
    v21 = 2080;
    v22 = "FCPeopleAlsoReadFeedItemService.m";
    v23 = 1024;
    v24 = 40;
    v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v18.receiver = self;
  v18.super_class = (Class)FCPeopleAlsoReadFeedItemService;
  v12 = -[FCPeopleAlsoReadFeedItemService init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configurationManager, a3);
    objc_storeStrong((id *)&v13->_contentContext, a4);
    objc_storeStrong((id *)&v13->_readingHistory, a5);
  }

  return v13;
}

- (FCPeopleAlsoReadFeedItemService)init
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
    v8 = "-[FCPeopleAlsoReadFeedItemService init]";
    v9 = 2080;
    v10 = "FCPeopleAlsoReadFeedItemService.m";
    v11 = 1024;
    v12 = 31;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPeopleAlsoReadFeedItemService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCPeopleAlsoReadArticlesOperation *v10;
  void *v11;
  void *v12;
  FCPeopleAlsoReadArticlesOperation *v13;
  id v14;
  _QWORD v15[5];

  v14 = a3;
  v6 = a4;
  -[FCPeopleAlsoReadFeedItemService configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possiblyUnfetchedAppConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "peopleAlsoReadConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [FCPeopleAlsoReadArticlesOperation alloc];
      -[FCPeopleAlsoReadFeedItemService contentContext](self, "contentContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPeopleAlsoReadFeedItemService readingHistory](self, "readingHistory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:](v10, "initWithContentContext:configuration:readingHistory:cursor:", v11, v9, v12, v14);

      -[FCPeopleAlsoReadArticlesOperation setCompletionHandler:](v13, "setCompletionHandler:", v6);
      -[FCOperation start](v13, "start");

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2;
      v15[3] = &unk_1E463B598;
      v15[4] = v6;
      __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2((uint64_t)v15);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
  }

}

void __71__FCPeopleAlsoReadFeedItemService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 44, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
