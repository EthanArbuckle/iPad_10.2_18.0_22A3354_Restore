@implementation NSMutableDictionary(FCAccountActionQueue)

- (void)fc_setLocalDataHintIfNeeded:()FCAccountActionQueue
{
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, CFSTR("FCFileCoordinatedAccountActionQueueLocalDataHintKey"));

  }
}

- (void)fc_popActionTypesUpToCount:()FCAccountActionQueue
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectsInRange:", 0, a3);
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));

}

- (id)fc_dequeueTransactions
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("a"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  objc_msgSend(a1, "removeObjectForKey:", CFSTR("a"));
  return v5;
}

- (uint64_t)fc_enqueueActionType:()FCAccountActionQueue
{
  uint64_t v3;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = 0;
  if (a3 <= 6)
  {
    if (((1 << a3) & 0x26) != 0)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueLocalDataHintKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "BOOLValue");

    }
    else if (((1 << a3) & 0x48) == 0)
    {
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, CFSTR("FCFileCoordinatedAccountActionQueueLocalDataHintKey"));

    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v12, CFSTR("FCFileCoordinatedAccountActionQueueActionTypesKey"));
    return 1;
  }
  return v3;
}

- (void)fc_enqueueTransaction:()FCAccountActionQueue withMaxTransactionCount:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transaction");
    *(_DWORD *)buf = 136315906;
    v14 = "-[NSMutableDictionary(FCAccountActionQueue) fc_enqueueTransaction:withMaxTransactionCount:]";
    v15 = 2080;
    v16 = "NSDictionary+FCTodayPrivateDataTransactionQueue.m";
    v17 = 1024;
    v18 = 28;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("a"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v11, "addObject:", v6);
  objc_msgSend(v11, "fc_trimFromFrontToMaxCount:", a4);
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v11, CFSTR("a"));

}

@end
