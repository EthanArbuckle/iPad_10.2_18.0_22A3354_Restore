@implementation FCStorefrontAccessChecker

- (FCStorefrontAccessChecker)initWithPrivateChannelMembershipController:(id)a3
{
  id v5;
  FCStorefrontAccessChecker *v6;
  FCStorefrontAccessChecker *v7;
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
    v12 = "-[FCStorefrontAccessChecker initWithPrivateChannelMembershipController:]";
    v13 = 2080;
    v14 = "FCStorefrontAccessChecker.m";
    v15 = 1024;
    v16 = 29;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCStorefrontAccessChecker;
  v6 = -[FCAccessChecker init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_privateChannelMembershipController, a3);

  return v7;
}

- (FCStorefrontAccessChecker)init
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
    v8 = "-[FCStorefrontAccessChecker init]";
    v9 = 2080;
    v10 = "FCStorefrontAccessChecker.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCStorefrontAccessChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v3;
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
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCStorefrontAccessChecker canSynchronouslyCheckAccessToItem:]";
    v8 = 2080;
    v9 = "FCStorefrontAccessChecker.m";
    v10 = 1024;
    v11 = 42;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  char *v19;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCStorefrontAccessChecker hasAccessToItem:blockedReason:error:]";
    v24 = 2080;
    v25 = "FCStorefrontAccessChecker.m";
    v26 = 1024;
    v27 = 50;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCStorefrontAccessChecker privateChannelMembershipController](self, "privateChannelMembershipController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceChannelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isMemberOfChannelID:", v9);

  if ((v10 & 1) == 0)
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentStoreFrontID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "blockedStorefrontIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allowedStorefrontIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v13) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      if (!objc_msgSend(v15, "count"))
      {
        v11 = 1;
LABEL_15:

        goto LABEL_16;
      }
      v16 = objc_msgSend(v15, "containsObject:", v13) ^ 1;
    }
    v11 = v16 ^ 1;
    if (a4)
    {
      if (v16)
      {
        *a4 = 2;
        v17 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          objc_msgSend(v7, "identifier");
          v19 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v19;
          _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it's not allowed in the current storefront", buf, 0xCu);

        }
      }
    }
    goto LABEL_15;
  }
  v11 = 1;
LABEL_16:

  return v11;
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
