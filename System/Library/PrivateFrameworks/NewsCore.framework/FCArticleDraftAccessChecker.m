@implementation FCArticleDraftAccessChecker

- (FCArticleDraftAccessChecker)initWithPrivateChannelMembershipController:(id)a3
{
  id v5;
  FCArticleDraftAccessChecker *v6;
  FCArticleDraftAccessChecker *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateChannelMembershipController != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCArticleDraftAccessChecker initWithPrivateChannelMembershipController:]";
    v13 = 2080;
    v14 = "FCArticleDraftAccessChecker.m";
    v15 = 1024;
    v16 = 29;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCArticleDraftAccessChecker;
  v6 = -[FCAccessChecker init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_privateChannelMembershipController, a3);

  return v7;
}

- (FCArticleDraftAccessChecker)init
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
    v8 = "-[FCArticleDraftAccessChecker init]";
    v9 = 2080;
    v10 = "FCArticleDraftAccessChecker.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleDraftAccessChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v4;
  BOOL v5;
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
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCArticleDraftAccessChecker canSynchronouslyCheckAccessToItem:]";
    v10 = 2080;
    v11 = "FCArticleDraftAccessChecker.m";
    v12 = 1024;
    v13 = 42;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!objc_msgSend(v4, "isDraft")
    || objc_msgSend(v4, "isDraft") && (objc_msgSend(v4, "isLocalDraft") & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isDraft"))
  {
    v5 = -[FCArticleDraftAccessChecker shouldShowAllDraftContent](self, "shouldShowAllDraftContent");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v9;
  id v10;
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
  v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCArticleDraftAccessChecker hasAccessToItem:blockedReason:error:]";
    v14 = 2080;
    v15 = "FCArticleDraftAccessChecker.m";
    v16 = 1024;
    v17 = 50;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!objc_msgSend(v7, "isDraft")
    || objc_msgSend(v7, "isDraft") && (objc_msgSend(v7, "isLocalDraft") & 1) != 0
    || -[FCArticleDraftAccessChecker shouldShowAllDraftContent](self, "shouldShowAllDraftContent"))
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCAccessCheckerErrorDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *a5;
    *a5 = v9;

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCArticleDraftAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    v20 = 2080;
    v21 = "FCArticleDraftAccessChecker.m";
    v22 = 1024;
    v23 = 72;
    v24 = 2114;
    v25 = v12;
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
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCArticleDraftAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    v20 = 2080;
    v21 = "FCArticleDraftAccessChecker.m";
    v22 = 1024;
    v23 = 73;
    v24 = 2114;
    v25 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (-[FCArticleDraftAccessChecker canSynchronouslyCheckAccessToItem:](self, "canSynchronouslyCheckAccessToItem:", v8))
  {
    v17.receiver = self;
    v17.super_class = (Class)FCArticleDraftAccessChecker;
    -[FCAccessChecker checkAccessToItem:withQualityOfService:completion:](&v17, sel_checkAccessToItem_withQualityOfService_completion_, v8, a4, v9);
  }
  else
  {
    -[FCArticleDraftAccessChecker privateChannelMembershipController](self, "privateChannelMembershipController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__FCArticleDraftAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
    v14[3] = &unk_1E463D618;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v10, "isAllowedToSeeArticleID:completionBlock:", v11, v14);

  }
}

uint64_t __81__FCArticleDraftAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sourceChannel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it requires draft membership in channel %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)shouldShowAllDraftContent
{
  int v2;
  void *v3;
  char v4;

  v2 = NFInternalBuild();
  if (v2)
  {
    NewsCoreUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("news.draft_content.show_drafts"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  return self->_privateChannelMembershipController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
}

@end
