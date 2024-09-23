@implementation EMMessageIDRandomizer

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EMMessageIDRandomizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1)
    dispatch_once(&log_onceToken_23, block);
  return (OS_os_log *)(id)log_log_23;
}

void __28__EMMessageIDRandomizer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;

}

- (EMMessageIDRandomizer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMMessageIDRandomizer;
  return -[EMMessageIDRandomizer init](&v3, sel_init);
}

+ (id)randomizedStringForGlobalMessageID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  char v7;
  os_unfair_lock_s lock;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  lock._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(&lock);
  objc_msgSend(a1, "_findOrCreateRandomizedStringForMessageID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&lock);
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = EFDeviceUnlockedSinceBoot();
      +[EMMessageIDRandomizer randomizedStringForGlobalMessageID:].cold.1(v7, buf, v6);
    }

  }
  return v5;
}

+ (id)_findOrCreateRandomizedStringForMessageID:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "_findExistingStringError:messageID:", &v10, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "_createRandomizedStringForMessageID:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_queryKeychainError:(id *)a3 messageID:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v21[16];
  CFTypeRef result;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v23[0] = *MEMORY[0x1E0CD6C98];
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  v7 = *MEMORY[0x1E0CD7010];
  v23[2] = *MEMORY[0x1E0CD7018];
  v23[3] = v7;
  v24[2] = MEMORY[0x1E0C9AAB0];
  v24[3] = MEMORY[0x1E0C9AAB0];
  v23[4] = *MEMORY[0x1E0CD6F30];
  v24[4] = &unk_1E711F440;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  v10 = v9;
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 == -25300)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "No randomized string found", v21, 2u);
      }

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[EMMessageIDRandomizer _queryKeychainError:messageID:].cold.1(v10, v13, v14, v15, v16, v17, v18, v19);

    if (!a3)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v10, 0);
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!result)
    {
LABEL_12:
      v12 = 0;
      goto LABEL_13;
    }
    CFAutorelease(result);
    v12 = (id)result;
  }
LABEL_13:

  return v12;
}

+ (id)_findExistingStringError:(id *)a3 messageID:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "_queryKeychainError:messageID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "ef_isMoreThanTimeIntervalAgo:", 86400.0))
    {
      objc_msgSend(a1, "_deleteExpiredStringForMessageID:", a4);
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_createRandomizedStringForMessageID:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFDictionary *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[6];
  uint8_t buf[4];
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = a3;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Will create new randomized string for messageID %lld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CD6C98];
  v25[0] = *MEMORY[0x1E0CD70D8];
  v25[1] = v7;
  v8 = *MEMORY[0x1E0CD6CA8];
  v26[0] = v6;
  v26[1] = v8;
  v26[2] = CFSTR("com.apple.mail.categories");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3, v25[0], v7, *MEMORY[0x1E0CD6898], *MEMORY[0x1E0CD6B58]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v9;
  v25[4] = *MEMORY[0x1E0CD69C0];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isInternal") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = *MEMORY[0x1E0CD68A0];
  v13 = *MEMORY[0x1E0CD68A8];
  v26[4] = v12;
  v26[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v15 = SecItemAdd(v14, 0);
  if ((_DWORD)v15)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[EMMessageIDRandomizer _createRandomizedStringForMessageID:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v23 = 0;
  }
  else
  {
    v23 = v5;
  }

  return v23;
}

+ (void)_deleteExpiredStringForMessageID:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[8];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Will delete expired randomized string", v17, 2u);
  }

  v5 = *MEMORY[0x1E0CD6CA8];
  v6 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v6;
  v19[0] = v5;
  v19[1] = CFSTR("com.apple.mail.categories");
  v18[2] = *MEMORY[0x1E0CD6B58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v9 = SecItemDelete(v8);
  if ((_DWORD)v9)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[EMMessageIDRandomizer _deleteExpiredStringForMessageID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

+ (void)randomizedStringForGlobalMessageID:(os_log_t)log .cold.1(char a1, uint8_t *buf, os_log_t log)
{
  const __CFString *v3;

  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = v3;
  _os_log_fault_impl(&dword_1B99BB000, log, OS_LOG_TYPE_FAULT, "Could not generate randomized string. Device unlocked since boot: %@", buf, 0xCu);
}

+ (void)_queryKeychainError:(uint64_t)a3 messageID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B99BB000, a2, a3, "Error finding existing randomized string: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_createRandomizedStringForMessageID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B99BB000, a2, a3, "Error creating new randomized string: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_deleteExpiredStringForMessageID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B99BB000, a2, a3, "Error deleting expired randomized string: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
