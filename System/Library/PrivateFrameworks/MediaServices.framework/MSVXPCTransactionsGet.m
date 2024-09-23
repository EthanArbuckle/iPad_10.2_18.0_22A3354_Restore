@implementation MSVXPCTransactionsGet

uint64_t ___MSVXPCTransactionsGet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MSVXPCTransactionsGet___MSVXPCTransactions;
  _MSVXPCTransactionsGet___MSVXPCTransactions = v0;

  return os_state_add_handler();
}

_DWORD *___MSVXPCTransactionsGet_block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _DWORD *v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  unint64_t v10;
  size_t v11;
  id v12;
  uint64_t v14;

  os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  objc_msgSend((id)_MSVXPCTransactionsGet___MSVXPCTransactions, "allObjects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  objc_msgSend(v0, "valueForKey:", CFSTR("description"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v1, 200, 0, &v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0;
  if (!v14)
  {
    v5 = malloc_type_calloc(1uLL, objc_msgSend(v2, "length") + 200, 0xBEBC90DDuLL);
    v4 = v5;
    if (v5)
    {
      *v5 = 1;
      v5[1] = objc_msgSend(v3, "length");
      objc_msgSend(CFSTR("MSVXPCTransaction"), "dataUsingEncoding:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_retainAutorelease(v6);
        v9 = (const void *)objc_msgSend(v8, "bytes");
        v10 = objc_msgSend(v8, "length");
        if (v10 >= 0x3F)
          v11 = 63;
        else
          v11 = v10;
        memcpy(v4 + 34, v9, v11);
      }
      v12 = objc_retainAutorelease(v3);
      memcpy(v4 + 50, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));

    }
  }

  return v4;
}

@end
