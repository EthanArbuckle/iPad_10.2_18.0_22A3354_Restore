@implementation NTKDTransactionBeginWithPostfix

void __NTKDTransactionBeginWithPostfix_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  v4 = v2;
  v5 = v4;
  v6 = v4;
  if (v3)
  {
    objc_msgSend(v4, "stringByAppendingString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _TransactionsByReason();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    _TransactionsByReason();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  v14 = v5;
  v10 = v14;
  if (v3)
  {
    objc_msgSend(v14, "stringByAppendingString:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "UTF8String");

  v12 = (void *)os_transaction_create();
  objc_msgSend(v8, "addObject:", v12);
  +[NTKJetsamMonitor sharedJetsamMonitor](NTKJetsamMonitor, "sharedJetsamMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "incrementTransactionCount");

}

@end
