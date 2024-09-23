@implementation VSTestSetupPreparationOperation

- (VSTestSetupPreparationOperation)init
{
  VSTestSetupPreparationOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  NSOperationQueue *v5;
  objc_class *v6;
  void *v7;
  NSArray *v8;
  NSArray *errors;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSTestSetupPreparationOperation;
  v2 = -[VSTestSetupPreparationOperation init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = v2->_privateQueue;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v5, "setName:", v7);

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    errors = v2->_errors;
    v2->_errors = v8;

  }
  return v2;
}

- (void)executionDidBegin
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke;
  v10[3] = &unk_1E939EE88;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTestSetupPreparationOperation privateQueue](self, "privateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_14;
  v9[3] = &unk_1E939EE88;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_20;
  v8[3] = &unk_1E939EE88;
  v8[4] = self;
  objc_msgSend(v6, "setCompletionBlock:", v8);
  -[VSTestSetupPreparationOperation privateQueue](self, "privateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v6);

}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  VSSemaphore *v5;
  VSSemaphore *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  VSSemaphore *v15;
  _QWORD block[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v3 = MEMORY[0x1E0C809B0];
  v24 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_4;
  block[3] = &unk_1E93A08C0;
  v18 = &v19;
  v4 = v2;
  v17 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v5 = objc_alloc_init(VSSemaphore);
  v6 = v5;
  v7 = (void *)v20[5];
  if (v7)
  {
    v8 = v7;
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2;
    v12[3] = &unk_1E93A0A40;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    v15 = v6;
    objc_msgSend(v4, "removeAccounts:withCompletionHandler:", v9, v12);

  }
  else
  {
    -[VSSemaphore signal](v5, "signal");
  }
  -[VSSemaphore wait](v6, "wait");

  _Block_object_dispose(&v19, 8);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "firstAccount");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed account %@ from account store.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
    objc_msgSend(v9, "addError:", v6);
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)v6, v7, v10, v11, v12, v13, v14, v15);
  }

  objc_msgSend(*(id *)(a1 + 48), "signal");
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_14(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  +[VSDevice currentDevice](VSDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_16;
  v3[3] = &unk_1E939ED90;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "refreshSetTopBoxProfile:", v3);

}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_16_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "addError:", v3);
  }

}

uint64_t __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "errors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_20_cold_1(v4);
  }
  else
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "No errors preparting for OOB testing, clearing buddy defaults.", v7, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.purplebuddy"));
    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("TVBuddyCompletedSuccessfully"));
    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("SetupDone"));
    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("VSSkipSetup"));
  }

  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

- (void)addError:(id)a3
{
  VSTestSetupPreparationOperation *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VSTestSetupPreparationOperation errors](v4, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    -[VSTestSetupPreparationOperation errors](v4, "errors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, [self errors] was %@, instead of NSMutableArray."), v10);

  }
  -[VSTestSetupPreparationOperation errors](v4, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  objc_sync_exit(v4);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error removing account for setup testing preparation: %@", a5, a6, a7, a8, 2u);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_16_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error refreshing profile for testing: %@", a5, a6, a7, a8, 2u);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_20_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Errors present preparing for OOB testing, not clearing buddy defaults.", v1, 2u);
}

@end
