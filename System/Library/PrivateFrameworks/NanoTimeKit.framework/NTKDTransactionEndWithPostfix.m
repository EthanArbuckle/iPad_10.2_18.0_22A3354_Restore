@implementation NTKDTransactionEndWithPostfix

void __NTKDTransactionEndWithPostfix_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "stringByAppendingString:");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("--30s-extension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");

  v7 = (void *)os_transaction_create();
  +[NTKJetsamMonitor sharedJetsamMonitor](NTKJetsamMonitor, "sharedJetsamMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "incrementTransactionCount");

  v9 = dispatch_time(0, 30000000000);
  _TransactionQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __NTKDTransactionEndWithPostfix_block_invoke_2;
  block[3] = &unk_1E6BCD5F0;
  v11 = v7;
  v23 = v11;
  dispatch_after(v9, v10, block);

  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = v12;
  v15 = v13;
  v16 = v14;
  v17 = v16;
  v18 = v16;
  if (v15)
  {
    objc_msgSend(v16, "stringByAppendingString:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _TransactionsByReason();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "removeLastObject");
    +[NTKJetsamMonitor sharedJetsamMonitor](NTKJetsamMonitor, "sharedJetsamMonitor");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject decrementTransactionCount](v21, "decrementTransactionCount");
  }
  else
  {
    _NTKLoggingObjectForDomain(16, (uint64_t)"NTKLoggingDomainDaemonActivity");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __NTKDTransactionEndWithPostfix_block_invoke_cold_1();
  }

}

void __NTKDTransactionEndWithPostfix_block_invoke_2()
{
  id v0;

  +[NTKJetsamMonitor sharedJetsamMonitor](NTKJetsamMonitor, "sharedJetsamMonitor");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "decrementTransactionCount");

}

void __NTKDTransactionEndWithPostfix_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "****** imbalanced transactions for reason '%@' -- please file a radar on Watch Faces ******", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
