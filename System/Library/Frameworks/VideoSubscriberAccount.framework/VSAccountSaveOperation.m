@implementation VSAccountSaveOperation

- (VSAccountSaveOperation)init
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

- (VSAccountSaveOperation)initWithUnsavedAccounts:(id)a3 channels:(id)a4 storage:(id)a5
{
  id v8;
  id v9;
  id v10;
  VSAccountSaveOperation *v11;
  uint64_t v12;
  NSArray *unsavedAccounts;
  uint64_t v14;
  VSAccountChannels *unsavedChannels;
  VSOptional *v16;
  VSOptional *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The channels parameter must not be nil."));
    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accounts parameter must not be nil."));
  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The storage parameter must not be nil."));
LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)VSAccountSaveOperation;
  v11 = -[VSAccountSaveOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    unsavedAccounts = v11->_unsavedAccounts;
    v11->_unsavedAccounts = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    unsavedChannels = v11->_unsavedChannels;
    v11->_unsavedChannels = (VSAccountChannels *)v14;

    objc_storeStrong((id *)&v11->_storage, a5);
    v16 = objc_alloc_init(VSOptional);
    v17 = v11->_result;
    v11->_result = v16;

  }
  return v11;
}

- (void)_startCredentialSaveOperation
{
  NSObject *v3;
  VSCredentialSaveOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  VSCredentialSaveOperation *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[VSAccountSaveOperation _startCredentialSaveOperation]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v4 = [VSCredentialSaveOperation alloc];
  -[VSAccountSaveOperation unsavedAccounts](self, "unsavedAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountSaveOperation storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VSCredentialSaveOperation initWithUnsavedAccounts:accountStore:](v4, "initWithUnsavedAccounts:accountStore:", v5, v7);

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke;
  v9[3] = &unk_1E939ED60;
  objc_copyWeak(&v10, (id *)buf);
  objc_copyWeak(&v11, &location);
  -[VSCredentialSaveOperation setCompletionBlock:](v8, "setCompletionBlock:", v9);
  -[VSAccountSaveOperation setCurrentOperation:](self, "setCurrentOperation:", v8);
  -[VSAsyncOperation start](v8, "start");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "result");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v5);
    -[NSObject forceUnwrapObject](v5, "forceUnwrapObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[4] = WeakRetained;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_2;
    v9[3] = &unk_1E939FAB8;
    v9[4] = WeakRetained;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_3;
    v8[3] = &unk_1E939ED90;
    objc_msgSend(v6, "unwrapObject:error:", v9, v8);

  }
  else
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "_startCredentialSaveOperation: nil operation ref", v7, 2u);
    }
  }

}

uint64_t __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAccountChannelsSaveOperation");
}

void __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "_startCredentialSaveOperation: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

- (void)_startAccountChannelsSaveOperation
{
  NSObject *v3;
  VSAccountChannelsSaveOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  VSAccountChannelsSaveOperation *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VSAccountSaveOperation _startAccountChannelsSaveOperation]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v4 = [VSAccountChannelsSaveOperation alloc];
  -[VSAccountSaveOperation unsavedChannels](self, "unsavedChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountSaveOperation storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelsCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VSAccountChannelsSaveOperation initWithUnsavedAccountChannels:accountChannelsCenter:](v4, "initWithUnsavedAccountChannels:accountChannelsCenter:", v5, v7);

  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__VSAccountSaveOperation__startAccountChannelsSaveOperation__block_invoke;
  v9[3] = &unk_1E939FD70;
  objc_copyWeak(&v10, (id *)buf);
  -[VSAccountChannelsSaveOperation setCompletionBlock:](v8, "setCompletionBlock:", v9);
  -[VSAccountSaveOperation setCurrentOperation:](self, "setCurrentOperation:", v8);
  -[VSAsyncOperation start](v8, "start");
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __60__VSAccountSaveOperation__startAccountChannelsSaveOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
    WeakRetained = v2;
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAccountSaveOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSAccountSaveOperation currentOperation](self, "currentOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

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

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (VSAccountChannels)unsavedChannels
{
  return self->_unsavedChannels;
}

- (void)setUnsavedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedChannels, a3);
}

- (NSOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_unsavedChannels, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_unsavedAccounts, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
