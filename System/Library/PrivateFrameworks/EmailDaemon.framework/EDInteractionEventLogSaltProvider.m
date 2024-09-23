@implementation EDInteractionEventLogSaltProvider

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EDInteractionEventLogSaltProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_37 != -1)
    dispatch_once(&log_onceToken_37, block);
  return (OS_os_log *)(id)log_log_37;
}

void __40__EDInteractionEventLogSaltProvider_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_37;
  log_log_37 = (uint64_t)v1;

}

+ (id)saltProviderWithString:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (id)saltProviderFromKeyChain
{
  return objc_alloc_init((Class)a1);
}

- (EDInteractionEventLogSaltProvider)init
{
  EDInteractionEventLogSaltProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDInteractionEventLogSaltProvider;
  result = -[EDInteractionEventLogSaltProvider init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (NSData)salt
{
  os_unfair_lock_s *p_lock;
  NSData *salt;
  NSData *v5;
  NSData *v6;
  NSData *v7;
  NSObject *v8;
  char v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  salt = self->_salt;
  if (!salt)
  {
    -[EDInteractionEventLogSaltProvider _findOrCreateSalt](self, "_findOrCreateSalt");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_salt;
    self->_salt = v5;

    salt = self->_salt;
  }
  v7 = salt;
  os_unfair_lock_unlock(p_lock);
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = EFDeviceUnlockedSinceBoot();
      -[EDInteractionEventLogSaltProvider salt].cold.1(v9, v11, v8);
    }

  }
  return v7;
}

- (id)_findOrCreateSalt
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  id v21;

  v21 = 0;
  -[EDInteractionEventLogSaltProvider _findExistingSaltError:](self, "_findExistingSaltError:", &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
  if (!v3)
  {
LABEL_9:
    -[EDInteractionEventLogSaltProvider _createSalt](self, "_createSalt");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CD68A8]);

  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[EDInteractionEventLogSaltProvider _findOrCreateSalt].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    -[EDInteractionEventLogSaltProvider _deleteSalt](self, "_deleteSalt");
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Found existing salt", v20, 2u);
  }

  objc_msgSend(v3, "first");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = (void *)v9;

  return v18;
}

- (id)_queryKeychainError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v23[0] = *MEMORY[0x1E0CD6C98];
  v23[1] = v5;
  v24[0] = v4;
  v24[1] = CFSTR("com.apple.mail.interaction-log.salt");
  v6 = *MEMORY[0x1E0CD7018];
  v23[2] = *MEMORY[0x1E0CD6B80];
  v23[3] = v6;
  v24[2] = MEMORY[0x1E0C9AAB0];
  v24[3] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0CD6F30];
  v23[4] = *MEMORY[0x1E0CD7010];
  v23[5] = v7;
  v24[4] = MEMORY[0x1E0C9AAB0];
  v24[5] = &unk_1E94E4760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
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
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "No salt found", v21, 2u);
      }

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[EDInteractionEventLogSaltProvider _queryKeychainError:].cold.1(v10, v13, v14, v15, v16, v17, v18, v19);

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

  -[EDInteractionEventLogSaltProvider _queryKeychainError:](self, "_queryKeychainError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_23);
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

uint64_t __60__EDInteractionEventLogSaltProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_createSalt
{
  NSObject *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[7];
  uint8_t buf[16];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Will create new salt", buf, 2u);
  }

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v3;
  v33 = v3;
  arc4random_buf(buf, 0x20uLL);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buf, 32);
  objc_msgSend(v4, "ef_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CD6C98];
  v27[0] = *MEMORY[0x1E0CD70D8];
  v27[1] = v7;
  v8 = *MEMORY[0x1E0CD6CA8];
  v31[0] = v6;
  v31[1] = v8;
  v9 = *MEMORY[0x1E0CD6B58];
  v28 = *MEMORY[0x1E0CD6898];
  v31[2] = CFSTR("com.apple.mail");
  v31[3] = CFSTR("com.apple.mail.interaction-log.salt");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice", v27[0], v7, v28, v9, *MEMORY[0x1E0CD69C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isInternal") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CD68A0];
  v14 = *MEMORY[0x1E0CD68A8];
  v31[4] = v12;
  v31[5] = v14;
  v15 = *MEMORY[0x1E0CD6B80];
  v29 = v13;
  v30 = v15;
  v31[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v27, 7);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = SecItemAdd(v16, 0);
  if ((_DWORD)v17)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EDInteractionEventLogSaltProvider _createSalt].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = 0;
  }
  else
  {
    v25 = v4;
  }

  return v25;
}

- (void)_deleteSalt
{
  OUTLINED_FUNCTION_0_6(&dword_1D2F2C000, a2, a3, "Error deleting salt: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (BOOL)migrateAccessClass
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint8_t buf[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Will migrate salt", buf, 2u);
  }

  v17 = 0;
  -[EDInteractionEventLogSaltProvider _findExistingSaltError:](self, "_findExistingSaltError:", &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  v6 = v5;
  if (v4)
  {
    -[EDInteractionEventLogSaltProvider _deleteSalt](self, "_deleteSalt");
    -[EDInteractionEventLogSaltProvider _createSalt](self, "_createSalt");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
  }
  else
  {
    if (!v5 || objc_msgSend(v5, "code") != -25308)
    {
      v8 = 1;
      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EDInteractionEventLogSaltProvider migrateAccessClass].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

LABEL_12:
  return v8;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
}

- (void)salt
{
  const __CFString *v3;

  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = v3;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Could not generate salt. Device unlocked since boot: %@", buf, 0xCu);
}

- (void)_findOrCreateSalt
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Existing salt has wrong access class. Re-creating salt", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_queryKeychainError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D2F2C000, a2, a3, "Error finding existing salt: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_createSalt
{
  OUTLINED_FUNCTION_0_6(&dword_1D2F2C000, a2, a3, "Error creating new salt: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)migrateAccessClass
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "errSecInteractionNotAllowed from keychain. Is the device still locked?", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
