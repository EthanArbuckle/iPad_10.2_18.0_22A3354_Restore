@implementation FCPurchaseAccessChecker

- (FCPurchaseAccessChecker)initWithPaidAccessChecker:(id)a3
{
  id v5;
  FCPurchaseAccessChecker *v6;
  FCPurchaseAccessChecker *v7;
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
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "paidAccessChecker != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCPurchaseAccessChecker initWithPaidAccessChecker:]";
    v13 = 2080;
    v14 = "FCPurchaseAccessChecker.m";
    v15 = 1024;
    v16 = 29;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCPurchaseAccessChecker;
  v6 = -[FCAccessChecker init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paidAccessChecker, a3);

  return v7;
}

- (FCPurchaseAccessChecker)init
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
    v8 = "-[FCPurchaseAccessChecker init]";
    v9 = 2080;
    v10 = "FCPurchaseAccessChecker.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPurchaseAccessChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPurchaseAccessChecker canSynchronouslyCheckAccessToItem:]";
    v11 = 2080;
    v12 = "FCPurchaseAccessChecker.m";
    v13 = 1024;
    v14 = 42;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCPurchaseAccessChecker paidAccessChecker](self, "paidAccessChecker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPreparedForUse");

  return v6;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  char *v17;
  int v18;
  const __CFString *v19;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCPurchaseAccessChecker hasAccessToItem:blockedReason:error:]";
    v24 = 2080;
    v25 = "FCPurchaseAccessChecker.m";
    v26 = 1024;
    LODWORD(v27[0]) = 50;
    WORD2(v27[0]) = 2114;
    *(_QWORD *)((char *)v27 + 6) = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCPurchaseAccessChecker paidAccessChecker](self, "paidAccessChecker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isPaid");
  v10 = objc_msgSend(v7, "isBundlePaid");
  objc_msgSend(v7, "sourceChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "canGetAccessToItemPaid:bundlePaid:channel:", v9, v10, v11);

  if (a4)
  {
    if ((v12 & 1) == 0)
    {
      *a4 = 4;
      v13 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        objc_msgSend(v7, "identifier");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sourceChannel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v7, "isBundlePaid");
        v19 = CFSTR("does not have purchasing setup");
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2114;
        if (v18)
          v19 = CFSTR("is not in the bundle");
        v25 = v17;
        v26 = 2114;
        v27[0] = v19;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not purchaseable because its source channel %{public}@ %{public}@", buf, 0x20u);

      }
    }
  }

  return v12;
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  -[FCPurchaseAccessChecker paidAccessChecker](self, "paidAccessChecker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__FCPurchaseAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke;
  v12[3] = &unk_1E463CCB8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "prepareForUseWithCompletion:", v12);

}

void __77__FCPurchaseAccessChecker_checkAccessToItem_withQualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = 0;
  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "hasAccessToItem:blockedReason:error:", *(_QWORD *)(a1 + 40), &v2, &v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (FCPaidAccessCheckerType)paidAccessChecker
{
  return self->_paidAccessChecker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
}

@end
