@implementation NTKTransactionCommitCoordinator

+ (BOOL)addTransactionCommitHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_addTransactionCommitHandler:", v4);

  return v6;
}

+ (id)_sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NTKTransactionCommitCoordinator__sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedInstance_onceToken_0 != -1)
    dispatch_once(&_sharedInstance_onceToken_0, block);
  return (id)_sharedInstance___coordinator;
}

void __50__NTKTransactionCommitCoordinator__sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sharedInstance___coordinator;
  _sharedInstance___coordinator = (uint64_t)v1;

}

- (NTKTransactionCommitCoordinator)init
{
  NTKTransactionCommitCoordinator *v2;
  NSMutableArray *v3;
  NSMutableArray *commitHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKTransactionCommitCoordinator;
  v2 = -[NTKTransactionCommitCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    commitHandlers = v2->_commitHandlers;
    v2->_commitHandlers = v3;

  }
  return v2;
}

- (BOOL)_addTransactionCommitHandler:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSMutableArray *commitHandlers;
  void *v8;
  int v9;
  NSObject *v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  v5 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentState");
  v6 = v5 & 3;
  if ((v5 & 3) != 0)
  {
    if (!-[NSMutableArray count](self->_commitHandlers, "count"))
      -[NTKTransactionCommitCoordinator _registerCATransactionCommitHandler](self, "_registerCATransactionCommitHandler");
    commitHandlers = self->_commitHandlers;
    v8 = _Block_copy(v4);
    -[NSMutableArray addObject:](commitHandlers, "addObject:", v8);

  }
  else
  {
    v9 = v5;
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKTransactionCommitCoordinator _addTransactionCommitHandler:].cold.1(v9, v10);

  }
  return v6 != 0;
}

+ (void)flushCommitHandlers
{
  id v2;

  objc_msgSend(a1, "_sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_registerCATransactionCommitHandler");

}

- (void)_registerCATransactionCommitHandler
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke;
  v2[3] = &unk_1E6BCD5F0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v2, 1);
}

uint64_t __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateObjectsUsingBlock:", &__block_literal_global_78);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitHandlers, 0);
}

- (void)_addTransactionCommitHandler:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4;
  if ((a1 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_7(v4, v5, CFSTR("implicit"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      OUTLINED_FUNCTION_0_7(v4, v5, CFSTR("flushed"));
      if ((a1 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_0_7(v4, v5, CFSTR("explicit"));
  if ((a1 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a1 & 8) != 0)
LABEL_5:
    OUTLINED_FUNCTION_0_7(v4, v5, CFSTR("committing"));
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Attempt to add implicit/explicit transaction commit handler in transaction state %d (%@) will FAIL. Call stack: %@", (uint8_t *)v8, 0x1Cu);

}

@end
