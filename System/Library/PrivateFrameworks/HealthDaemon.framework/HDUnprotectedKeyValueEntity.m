@implementation HDUnprotectedKeyValueEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)badgeForDomain:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  +[HDUnprotectedKeyValueEntity _keyForNotificationDomain:error:]((uint64_t)a1, a3, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v20 = 0;
    objc_msgSend(a1, "numberForKey:domain:category:profile:entity:error:", v9, &stru_1E6D11BB8, 2, v8, 0, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v12 = v11;
    if (v10)
      v13 = 1;
    else
      v13 = v11 == 0;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB6338], "badgeFromKeyValueRepresentation:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v18 = v15;
        NSStringFromHKNotificationDomain();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        v23 = 2114;
        v24 = v12;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to get badge for notification domain %@: %{public}@", buf, 0x16u);

      }
      if (a5)
      {
        v14 = 0;
        *a5 = objc_retainAutorelease(v12);
      }
      else
      {
        _HKLogDroppedError();
        v14 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6338], "badgeFromKeyValueRepresentation:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (__CFString)_keyForNotificationDomain:(uint64_t)a3 error:
{
  objc_opt_self();
  if (a2 < 0x10 && ((0xBDF9u >> a2) & 1) != 0)
    return off_1E6CFA4E0[a2];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Invalid notification domain %zd"), a2);
  return 0;
}

+ (BOOL)setBadge:(id)a3 forDomain:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a5;
  +[HDUnprotectedKeyValueEntity _keyForNotificationDomain:error:]((uint64_t)a1, a4, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "keyValueRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(a1, "setNumber:forKey:domain:category:profile:error:", v13, v12, &stru_1E6D11BB8, 2, v11, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)databaseTable
{
  return CFSTR("key_value");
}

+ (const)_insertStatementKey
{
  return (const char *)&_insertStatementKey_key_351;
}

@end
