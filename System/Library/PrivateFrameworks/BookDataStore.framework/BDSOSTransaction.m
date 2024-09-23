@implementation BDSOSTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BDSOSTransaction)initWithTransactionName:(const char *)a3
{
  BDSOSTransaction *v4;
  uint64_t v5;
  OS_os_transaction *osTransaction;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  BDSOSTransaction *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)BDSOSTransaction;
  v4 = -[BDSOSTransaction init](&v9, sel_init);
  if (v4)
  {
    v5 = os_transaction_create();
    osTransaction = v4->_osTransaction;
    v4->_osTransaction = (OS_os_transaction *)v5;

    BDSCloudKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v11 = a3;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "[Transaction]: Created transaction %{public}s(%p)", buf, 0x16u);
    }

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  BDSOSTransaction *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_osTransaction)
  {
    v3 = (void *)os_transaction_copy_description();
    BDSCloudKitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v20 = v3;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_227D4F000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", buf, 0x16u);
    }

    objc_msgSend_delegate(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_delegate(self, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transactionWillEndWithName_(v14, v15, (uint64_t)v3, v16, v17);

    }
    if (v3)
      free(v3);
  }
  v18.receiver = self;
  v18.super_class = (Class)BDSOSTransaction;
  -[BDSOSTransaction dealloc](&v18, sel_dealloc);
}

- (BDSOSTransactionDelegate)delegate
{
  return (BDSOSTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)transactionNeedsMoreTime
{
  BDSOSTransaction *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  BDSOSTransaction *v7;
  __int16 v8;
  BDSOSTransaction *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    BDSCloudKitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = v3;
      v8 = 2048;
      v9 = self;
      _os_log_impl(&dword_227D4F000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Transaction needs more time %{public}s(%p)", (uint8_t *)&v6, 0x16u);
    }

    os_transaction_needs_more_time();
    if (v3)
      free(v3);
  }
  else
  {
    BDSCloudKitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "[Transaction]: transactionNeedsMoreTime was called but transaction was already nil.(%p)", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)endTransaction
{
  BDSOSTransaction *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  OS_os_transaction *osTransaction;
  int v20;
  BDSOSTransaction *v21;
  __int16 v22;
  BDSOSTransaction *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_osTransaction)
  {
    v3 = (BDSOSTransaction *)os_transaction_copy_description();
    BDSCloudKitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136446466;
      v21 = v3;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_227D4F000, v4, OS_LOG_TYPE_DEFAULT, "[Transaction]: Ending transaction %{public}s(%p)", (uint8_t *)&v20, 0x16u);
    }

    objc_msgSend_delegate(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_delegate(self, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transactionWillEndWithName_(v14, v15, (uint64_t)v3, v16, v17);

    }
    if (v3)
      free(v3);
  }
  else
  {
    BDSCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = self;
      _os_log_impl(&dword_227D4F000, v18, OS_LOG_TYPE_DEFAULT, "[Transaction]: EndTransaction was called but transaction was already nil.(%p)", (uint8_t *)&v20, 0xCu);
    }

  }
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_osTransaction, a3);
}

@end
