@implementation SGDomainWhitelistChecker

+ (id)lock
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SGDomainWhitelistChecker_lock__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lock_onceToken != -1)
    dispatch_once(&lock_onceToken, block);
  return (id)lock_lock;
}

+ (void)_setTrieFromPath:(id)a3 guardedData:(id)a4
{
  objc_class *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E0D81548];
    v6 = a4;
    v7 = a3;
    v8 = objc_msgSend([v5 alloc], "initWithPath:", v7);

    v9 = (id)v6[1];
    v6[1] = v8;

  }
}

+ (void)setTrieFromPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGDomainWhitelistChecker_setTrieFromPath___block_invoke;
  v7[3] = &unk_1E7DACBA0;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "runWithLockAcquired:", v7);

}

+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadForDomain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  const char *v14;
  int v15;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2410000000;
  v14 = "";
  v15 = 0;
  objc_msgSend(a1, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SGDomainWhitelistChecker_payloadForDomain___block_invoke;
  v8[3] = &unk_1E7DACBC8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "runWithLockAcquired:", v8);

  LODWORD(v5) = *((_DWORD *)v12 + 8);
  _Block_object_dispose(&v11, 8);

  return ($30CD494556BCE78BE9FDF48ACEFE6DD0)v5;
}

+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadWithStartChar:(const char *)a3 andSize:(unint64_t)a4
{
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  int v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2410000000;
  v12 = "";
  v13 = 0;
  objc_msgSend(a1, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SGDomainWhitelistChecker_payloadWithStartChar_andSize___block_invoke;
  v8[3] = &unk_1E7DACBF0;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = &v9;
  objc_msgSend(v6, "runWithLockAcquired:", v8);

  LODWORD(a4) = *((_DWORD *)v10 + 8);
  _Block_object_dispose(&v9, 8);
  return ($30CD494556BCE78BE9FDF48ACEFE6DD0)a4;
}

+ (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4
{
  void *v5;
  unsigned int v6;
  _OWORD *v7;
  int64_t v8;
  _BYTE *v9;
  uint64_t i;
  int v11;
  _OWORD v13[6];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x64)
    {
      v14 = 0;
      memset(v13, 0, sizeof(v13));
      v7 = v13;
      LOBYTE(v6) = 0;
      if (objc_msgSend(v5, "getCString:maxLength:encoding:", v13, 100, 1))
      {
        v8 = strnlen((const char *)v13, 0x64uLL);
        v9 = (char *)v13 + v8;
        if (v8 >= 4)
          v7 = (_OWORD *)((unint64_t)v13 | (4 * (LODWORD(v13[0]) == 779581303)));
        for (i = v9 - (_BYTE *)v7; v9 >= (_BYTE *)v7; --v9)
        {
          v11 = (char)*v9;
          if ((v11 - 65) <= 0x19)
            *v9 = v11 | 0x20;
        }
        v6 = (objc_msgSend(a1, "payloadWithStartChar:andSize:", v7, i) >> 2) & 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)isStructuredEventCandidateForEmailDomain:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E7DB83A8) & 1) == 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(a1, "lock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__SGDomainWhitelistChecker_isStructuredEventCandidateForEmailDomain___block_invoke;
    v9[3] = &unk_1E7DACC18;
    v12 = a1;
    v10 = v5;
    v11 = &v13;
    objc_msgSend(v7, "runWithLockAcquired:", v9);

    v6 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __69__SGDomainWhitelistChecker_isStructuredEventCandidateForEmailDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(a2 + 8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "payloadForDomain:", *(_QWORD *)(a1 + 32)) & 1;
  }
  else
  {
    sgEventsLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker isStructuredEventCandidateForEmailDomain: trie is nil.", v3, 2u);
    }

  }
}

uint64_t __57__SGDomainWhitelistChecker_payloadWithStartChar_andSize___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];

  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    result = objc_msgSend(v3, "payloadForUTF8String:length:", a1[5], a1[6]);
  }
  else
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker payloadWithStartChar: trie is nil.", v6, 2u);
    }

    result = 0;
  }
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = result;
  return result;
}

uint64_t __45__SGDomainWhitelistChecker_payloadForDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];

  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    result = objc_msgSend(v3, "payloadForString:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker payloadForDomain: trie is nil.", v6, 2u);
    }

    result = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

uint64_t __44__SGDomainWhitelistChecker_setTrieFromPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_setTrieFromPath:guardedData:", *(_QWORD *)(a1 + 32), a2);
}

void __32__SGDomainWhitelistChecker_lock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD handler[5];
  int out_token;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("master_whitelist.trie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    out_token = 138412290;
    v13 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Loading master domains whitelist from path = %@", (uint8_t *)&out_token, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setTrieFromPath:guardedData:", v4, v2);
  out_token = 0;
  if (_block_invoke__pasOnceToken3 != -1)
    dispatch_once(&_block_invoke__pasOnceToken3, &__block_literal_global_12837);
  v6 = (void *)*MEMORY[0x1E0D19E00];
  v7 = (id)_block_invoke__pasExprOnceResult_12838;
  v8 = (const char *)objc_msgSend(v6, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __32__SGDomainWhitelistChecker_lock__block_invoke_2;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  handler[4] = *(_QWORD *)(a1 + 32);
  notify_register_dispatch(v8, &out_token, v7, handler);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v2);
  v10 = (void *)lock_lock;
  lock_lock = v9;

}

void __32__SGDomainWhitelistChecker_lock__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SGAsset asset](SGAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filesystemPathForAssetDataRelativePath:", CFSTR("master_whitelist.trie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "Received asset update notification. Now loading master domains whitelist from path = %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTrieFromPath:", v3);
}

void __32__SGDomainWhitelistChecker_lock__block_invoke_5()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.suggestions.masterwhitelist", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke__pasExprOnceResult_12838;
  _block_invoke__pasExprOnceResult_12838 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
