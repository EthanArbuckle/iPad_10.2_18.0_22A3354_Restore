@implementation EDInteractionEventLogLegacyPersistentBitsProvider

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EDInteractionEventLogLegacyPersistentBitsProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1)
    dispatch_once(&log_onceToken_35, block);
  return (OS_os_log *)(id)log_log_35;
}

void __56__EDInteractionEventLogLegacyPersistentBitsProvider_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;

}

- (id)_persistentBits
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v7;
  char v8;

  -[EDInteractionEventLogLegacyPersistentBitsProvider _oldSalt](self, "_oldSalt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "length");
    v8 = -86;
    v7 = -86;
    objc_msgSend(v3, "getBytes:range:", &v8, 0, 1);
    objc_msgSend(v3, "getBytes:range:", &v7, v4 - 1, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8 & 7 ^ (v7 >> 5));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_oldSalt
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  -[EDInteractionEventLogLegacyPersistentBitsProvider _findExistingSaltError:](self, "_findExistingSaltError:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  v4 = 0;
  if (v3)
    v5 = 1;
  else
    v5 = v2 == 0;
  if (!v5)
  {
    objc_msgSend(v2, "second");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68A0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CD68A8]);

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Found existing old salt", v11, 2u);
      }

      objc_msgSend(v2, "first");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)_findExistingSaltError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t i;
  char v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v18;
  __int16 v19;

  -[EDInteractionEventLogLegacyPersistentBitsProvider _queryKeychainError:](self, "_queryKeychainError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (v8)
  {
    for (i = 0; i < objc_msgSend(v8, "length"); i += 2)
    {
      v19 = -21846;
      objc_msgSend(v8, "getBytes:range:", &v19, i, 2);
      if ((v19 & 0x10) != 0)
        v11 = 0;
      else
        v11 = 9;
      v12 = v11 + v19;
      if ((v19 & 0x1000) != 0)
        v13 = -16;
      else
        v13 = 9;
      v18 = v13 + (HIBYTE(v19) & 0x1F) + 16 * v12;
      objc_msgSend(v9, "appendBytes:length:", &v18, 1);
    }
    v14 = (void *)MEMORY[0x1E0D1EF38];
    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pairWithFirst:second:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
    if (a3)
      *a3 = 0;
  }

  return v16;
}

uint64_t __76__EDInteractionEventLogLegacyPersistentBitsProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;

  v4 = a3;
  v5 = *MEMORY[0x1E0CD6990];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v10 = -1;
    else
      v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "compare:", v7);
  }

  return v10;
}

- (id)_queryKeychainError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  CFTypeRef result;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v17[0] = *MEMORY[0x1E0CD6C98];
  v17[1] = v5;
  v18[0] = v4;
  v18[1] = CFSTR("com.apple.mail.interaction-log.salt");
  v6 = *MEMORY[0x1E0CD7018];
  v17[2] = *MEMORY[0x1E0CD6B80];
  v17[3] = v6;
  v18[2] = MEMORY[0x1E0C9AAB0];
  v18[3] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0CD6F30];
  v17[4] = *MEMORY[0x1E0CD7010];
  v17[5] = v7;
  v18[4] = MEMORY[0x1E0C9AAB0];
  v18[5] = &unk_1E94E4748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  v10 = v9;
  if (v9)
  {
    if (v9 == -25300)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "No old salt found", v15, 2u);
      }

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[EDInteractionEventLogLegacyPersistentBitsProvider _queryKeychainError:].cold.1(v10, v13);

    if (!a3)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
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

- (void)_queryKeychainError:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "Error finding existing old salt: %d", (uint8_t *)v2, 8u);
}

@end
