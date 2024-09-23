@implementation VSCredentialSaveOperation

- (VSCredentialSaveOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSCredentialSaveOperation)initWithUnsavedAccounts:(id)a3 accountStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VSCredentialSaveOperation *v9;
  uint64_t v10;
  NSArray *unsavedAccounts;
  VSOptional *v12;
  VSOptional *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accounts parameter must not be nil."));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accountStore parameter must not be nil."));
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialSaveOperation;
  v9 = -[VSCredentialSaveOperation init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    unsavedAccounts = v9->_unsavedAccounts;
    v9->_unsavedAccounts = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_accountStore, a4);
    v12 = objc_alloc_init(VSOptional);
    v13 = v9->_result;
    v9->_result = v12;

  }
  return v9;
}

- (void)_didSaveAccounts:(id)a3 withResult:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v6)
  {
    +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "count") && objc_msgSend(v8, "count"))
    {
      VSDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch accounts from account store - fallback to local accounts.", v19, 2u);
      }

      v14 = v8;
      v12 = v14;
    }
    +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCredentialSaveOperation setResult:](self, "setResult:", v16);

  }
  else
  {
    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCredentialSaveOperation setResult:](self, "setResult:", v18);

  }
  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[VSCredentialSaveOperation unsavedAccounts](self, "unsavedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialSaveOperation accountStore](self, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VSCredentialSaveOperation_executionDidBegin__block_invoke;
  v6[3] = &unk_1E939FF40;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "saveAccounts:withCompletionHandler:", v5, v6);

}

void __46__VSCredentialSaveOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "VSCredentialSaveOperation: success %d, error %@", (uint8_t *)v7, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didSaveAccounts:withResult:error:", *(_QWORD *)(a1 + 40), a2, v5);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSArray)unsavedAccounts
{
  return self->_unsavedAccounts;
}

- (void)setUnsavedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unsavedAccounts, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
