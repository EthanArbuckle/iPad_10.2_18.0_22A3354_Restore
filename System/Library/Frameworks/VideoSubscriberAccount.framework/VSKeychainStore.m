@implementation VSKeychainStore

- (id)addItem:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  OSStatus v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v25[8];
  CFTypeRef result;

  v6 = (const __CFDictionary *)a3;
  result = 0;
  v7 = SecItemAdd(v6, &result);
  if (v7 == -25299)
  {
    v17 = SecItemDelete(v6);
    if (!v17)
    {
      VSDefaultLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1D2419000, v23, OS_LOG_TYPE_DEFAULT, "Successfully deleted conflicting item, re-attempting insertion.", v25, 2u);
      }

      -[VSKeychainStore addItem:error:](self, "addItem:error:", v6, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v18 = v17;
    VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VSKeychainStore addItem:error:].cold.2(v18, v19);

    if (!a4)
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2F90];
    v22 = -25299;
LABEL_14:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v7)
  {
    if (!a4)
    {
LABEL_15:
      v8 = 0;
      goto LABEL_19;
    }
    v21 = *MEMORY[0x1E0CB2F90];
    v22 = v7;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_14;
  }
  v8 = (void *)result;
  if (!result)
  {
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VSKeychainStore addItem:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_15;
  }
LABEL_19:

  return v8;
}

- (id)findItemsMatchingQuery:(id)a3 error:(id *)a4
{
  OSStatus v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef result;

  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  if (v5 == -25300)
    return MEMORY[0x1E0C9AA60];
  if (v5)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    goto LABEL_10;
  }
  v6 = (void *)result;
  if (!result)
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VSKeychainStore findItemsMatchingQuery:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

LABEL_10:
    v6 = 0;
  }
  return v6;
}

- (BOOL)updateAttributes:(id)a3 ofItemsMatchingQuery:(id)a4 error:(id *)a5
{
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = (const __CFDictionary *)a3;
  v9 = (const __CFDictionary *)a4;
  v10 = SecItemUpdate(v9, v8);
  if (!v10)
  {
    v11 = 1;
    goto LABEL_12;
  }
  if (v10 != -25299)
  {
    if (a5)
    {
      v12 = *MEMORY[0x1E0CB2F90];
      v13 = v10;
      v14 = (void *)MEMORY[0x1E0CB35C8];
LABEL_10:
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v12, v13, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (!-[VSKeychainStore _fixUpdateConflictForItemWithAttributes:andAttributesToUpdate:](self, "_fixUpdateConflictForItemWithAttributes:andAttributesToUpdate:", v9, v8))
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2F90];
      v13 = -25299;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v11 = -[VSKeychainStore updateAttributes:ofItemsMatchingQuery:error:](self, "updateAttributes:ofItemsMatchingQuery:error:", v8, v9, a5);
LABEL_12:

  return v11;
}

- (BOOL)deleteItemsMatchingQuery:(id)a3 error:(id *)a4
{
  OSStatus v5;
  OSStatus v6;

  v5 = SecItemDelete((CFDictionaryRef)a3);
  v6 = v5;
  if (v5 != -25300 && v5 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return !v6 || v6 == -25300;
}

- (BOOL)_fixUpdateConflictForItemWithAttributes:(id)a3 andAttributesToUpdate:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  const char *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint32_t v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0CD6990]);
  objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0CD6A98]);
  objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0CD70D8]);
  v16 = 0;
  v8 = -[VSKeychainStore deleteItemsMatchingQuery:error:](self, "deleteItemsMatchingQuery:error:", v7, &v16);
  v9 = v16;
  if (v8)
  {
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Tried to fix an update conflict in Keychain and succeeded.";
LABEL_9:
      v13 = v10;
      v14 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        v11 = "Tried to fix an update conflict in Keychain and failed with error: %@";
        v13 = v10;
        v14 = 12;
LABEL_10:
        _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, v11, buf, v14);
      }
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      v11 = "Tried to fix an update conflict in Keychain and failed.";
      goto LABEL_9;
    }
  }

  return v8;
}

- (void)addItem:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "SecItemAdd() returned errSecSuccess, but the result out-param is NULL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)addItem:(int)a1 error:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "SecItemDelete() returned %d attempting to delete conflicting duplicate item.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_0();
}

- (void)findItemsMatchingQuery:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "SecItemCopyMatching() returned errSecSuccess, but the result out-param is NULL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
