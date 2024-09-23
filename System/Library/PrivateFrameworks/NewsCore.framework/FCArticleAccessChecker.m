@implementation FCArticleAccessChecker

void __87__FCArticleAccessChecker_initWithPaidAccessChecker_privateChannelMembershipController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FCPurchaseAccessChecker *v6;
  FCArticleDraftAccessChecker *v7;
  FCStorefrontAccessChecker *v8;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", v4);

  v8 = -[FCStorefrontAccessChecker initWithPrivateChannelMembershipController:]([FCStorefrontAccessChecker alloc], "initWithPrivateChannelMembershipController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", v8);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", v5);

  v6 = -[FCPurchaseAccessChecker initWithPaidAccessChecker:]([FCPurchaseAccessChecker alloc], "initWithPaidAccessChecker:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v6);
  v7 = -[FCArticleDraftAccessChecker initWithPrivateChannelMembershipController:]([FCArticleDraftAccessChecker alloc], "initWithPrivateChannelMembershipController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", v7);

}

- (FCArticleAccessChecker)initWithPaidAccessChecker:(id)a3 privateChannelMembershipController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  FCArticleAccessChecker *v12;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;
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
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "paidAccessChecker != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCArticleAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:]";
    v22 = 2080;
    v23 = "FCArticleAccessChecker.m";
    v24 = 1024;
    v25 = 36;
    v26 = 2114;
    v27 = v14;
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
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateChannelMembershipController != nil");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCArticleAccessChecker initWithPaidAccessChecker:privateChannelMembershipController:]";
    v22 = 2080;
    v23 = "FCArticleAccessChecker.m";
    v24 = 1024;
    v25 = 37;
    v26 = 2114;
    v27 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = (void *)MEMORY[0x1E0C99D20];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__FCArticleAccessChecker_initWithPaidAccessChecker_privateChannelMembershipController___block_invoke;
  v17[3] = &unk_1E463EFB0;
  v18 = v7;
  v19 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fc_array:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)FCArticleAccessChecker;
  v12 = -[FCMultiAccessChecker initWithAccessCheckers:](&v16, sel_initWithAccessCheckers_, v11);

  return v12;
}

- (FCArticleAccessChecker)init
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
    v8 = "-[FCArticleAccessChecker init]";
    v9 = 2080;
    v10 = "FCArticleAccessChecker.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleAccessChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCArticleAccessChecker)initWithAccessCheckers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
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
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCArticleAccessChecker initWithAccessCheckers:]";
    v11 = 2080;
    v12 = "FCArticleAccessChecker.m";
    v13 = 1024;
    v14 = 30;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleAccessChecker initWithAccessCheckers:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  return self->_privateChannelMembershipController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
}

@end
