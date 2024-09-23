@implementation NPKOSTransaction

- (id)_initWithName:(id)a3
{
  id v4;
  NPKOSTransaction *v5;
  uint64_t v6;
  NSString *name;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  id v10;
  uint64_t v11;
  OS_os_transaction *transaction;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSString *v17;
  id v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NPKOSTransaction;
  v5 = -[NPKOSTransaction init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = dispatch_queue_create("com.apple.nanopasskit.ostransaction", 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(CFSTR("com.apple.nanopasskit."), "stringByAppendingString:", v4);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    v11 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v11;

    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_opt_class();
        v17 = v5->_name;
        *(_DWORD *)buf = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        v18 = v16;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: %@: %@ begin", buf, 0x16u);

      }
    }
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  NSString *name;
  id v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_transaction)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (void *)objc_opt_class();
        name = self->_name;
        *(_DWORD *)buf = 136447234;
        v11 = "-[NPKOSTransaction dealloc]";
        v12 = 2082;
        v13 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKOSTransaction.m";
        v14 = 2048;
        v15 = 31;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = name;
        v8 = v6;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %@: %@ was not invalidated prior to deallocation)", buf, 0x34u);

      }
    }
    _NPKAssertAbort();
  }
  v9.receiver = self;
  v9.super_class = (Class)NPKOSTransaction;
  -[NPKOSTransaction dealloc](&v9, sel_dealloc);
}

+ (NPKOSTransaction)transactionWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:", v4);

  return (NPKOSTransaction *)v5;
}

- (void)invalidate
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__NPKOSTransaction_invalidate__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __30__NPKOSTransaction_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_opt_class();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v14 = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        v8 = v6;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@: %@ invalidated", (uint8_t *)&v14, 0x16u);

      }
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;
LABEL_7:

    return;
  }
  if (v4)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v13 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Warning: %@: %@ was already invalidated", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_7;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
