@implementation ICKeychain

+ (id)stringForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "dataForIdentifier:account:isSynced:authenticationContext:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)setString:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "ic_dataValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "setData:forIdentifier:account:shouldSync:error:", v14, v13, v12, v8, a7);

  return (char)a7;
}

+ (BOOL)BOOLeanForIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a1, "dataForIdentifier:account:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_BOOLValue");

  return v5;
}

+ (BOOL)setBoolean:(BOOL)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v10 = a3;
  v12 = (void *)MEMORY[0x1E0C99D50];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "ic_dataWithBoolean:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "setData:forIdentifier:account:shouldSync:error:", v15, v14, v13, v8, a7);

  return (char)a7;
}

+ (unint64_t)unsignedIntegerForIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a1, "dataForIdentifier:account:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_unsignedIntegerValue");

  return v5;
}

+ (BOOL)setUnsignedInteger:(unint64_t)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v12 = (void *)MEMORY[0x1E0C99D50];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "ic_dataWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "setData:forIdentifier:account:shouldSync:error:", v15, v14, v13, v8, a7);

  return (char)a7;
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4
{
  return (id)objc_msgSend(a1, "dataForIdentifier:account:authenticationContext:", a3, a4, 0);
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4 authenticationContext:(id)a5
{
  return (id)objc_msgSend(a1, "dataForIdentifier:account:isSynced:authenticationContext:", a3, a4, 0, a5);
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  const __CFDictionary *v12;
  OSStatus v13;
  OSStatus v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  CFTypeRef result;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  LOBYTE(v18) = 1;
  objc_msgSend(a1, "queryForItemClass:forIdentifier:account:isSynced:type:authenticationContext:returnData:limit:", *MEMORY[0x1E0CD6CA8], v10, v11, v7, 0, a6, v18, 0);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v13 = SecItemCopyMatching(v12, &result);
  if (v13 == -25300)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v14 = v13;
  if (v13)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 1024;
      v25 = v14;
      _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Failed getting item (%@) for account (%@) with code: %d", buf, 0x1Cu);
    }

    goto LABEL_7;
  }
  v15 = (void *)result;
LABEL_8:

  return v15;
}

+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 authenticationContext:(id)a5
{
  return (id)objc_msgSend(a1, "itemsOfType:account:isSynced:authenticationContext:", a3, a4, 0, a5);
}

+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6
{
  _BOOL8 v7;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  CFTypeRef result;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  LOBYTE(v17) = 1;
  objc_msgSend(a1, "queryForItemClass:forIdentifier:account:isSynced:type:authenticationContext:returnData:limit:", *MEMORY[0x1E0CD6CA8], 0, v10, v7, a3, a6, v17, *MEMORY[0x1E0CD6F38]);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v12 = SecItemCopyMatching(v11, &result);
  if (v12 == -25300)
  {
LABEL_7:
    v14 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v13 = v12;
  if (v12)
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v20 = a3;
      v21 = 2112;
      v22 = v10;
      v23 = 1024;
      v24 = v13;
      _os_log_error_impl(&dword_1BD918000, v15, OS_LOG_TYPE_ERROR, "Failed getting items of type (%lu) for account (%@) with code: %d", buf, 0x1Cu);
    }

    goto LABEL_7;
  }
  v14 = (void *)result;
LABEL_8:

  return v14;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  ICGroupContainerIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(a1, "setData:forIdentifier:account:type:shouldSync:accessFlags:accessGroup:error:", v12, v11, v10, 0, 0, 0, v13, a6);

  return (char)a6;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  ICGroupContainerIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "setData:forIdentifier:account:type:shouldSync:accessFlags:accessGroup:error:", v14, v13, v12, 0, v8, 0, v15, a7);

  return (char)a7;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 type:(unint64_t)a6 shouldSync:(BOOL)a7 accessFlags:(unint64_t)a8 accessGroup:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  const __CFDictionary *v33;
  OSStatus v34;
  const __CFDictionary *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFDictionary *v39;
  NSObject *v40;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _BOOL4 v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  OSStatus v52;
  uint64_t v53;
  id v54;
  _QWORD v55[5];
  _QWORD v56[7];

  v45 = a7;
  v56[5] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = (id)*MEMORY[0x1E0CD6CA8];
  if (a10)
    *a10 = 0;
  if (v15)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99E08]);
    v21 = *MEMORY[0x1E0CD70D8];
    v55[0] = *MEMORY[0x1E0CD6C98];
    v55[1] = v21;
    v43 = v21;
    v22 = *MEMORY[0x1E0CD69C0];
    v55[2] = *MEMORY[0x1E0CD70A8];
    v55[3] = v22;
    v46 = v19;
    v56[0] = v19;
    v56[1] = v15;
    v55[4] = *MEMORY[0x1E0CD6B80];
    v23 = MEMORY[0x1E0C9AAA0];
    v56[2] = MEMORY[0x1E0C9AAB0];
    v56[3] = MEMORY[0x1E0C9AAB0];
    if (v45)
      v23 = MEMORY[0x1E0C9AAB0];
    v56[4] = v23;
    v44 = v16;
    if (v45)
      v24 = (uint64_t *)MEMORY[0x1E0CD68F8];
    else
      v24 = (uint64_t *)MEMORY[0x1E0CD6B58];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v20, "initWithDictionary:", v25);

    v27 = *v24;
    v16 = v44;
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v44, v27);
    if (v17)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CD6A90]);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CD6BC8]);

    }
    v29 = *MEMORY[0x1E0CD68A8];
    v19 = v46;
    if (a8)
    {
      objc_msgSend(a1, "accessControlObjectWithProtection:flags:error:", v29, a8, a10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (!v30 || a10 && *a10)
      {

        v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CD6890]);

      if (!v18)
      {
LABEL_21:
        v33 = (const __CFDictionary *)objc_msgSend(v26, "copy");
        v34 = SecItemAdd(v33, 0);

        if (v34 == -25299)
        {
          LOBYTE(v42) = 0;
          objc_msgSend(a1, "queryForItemClass:forIdentifier:account:isSynced:type:authenticationContext:returnData:limit:", v46, v44, v17, v45, 0, 0, v42, 0);
          v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc(MEMORY[0x1E0C99E08]);
          v53 = v43;
          v54 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithDictionary:", v37);

          v39 = (const __CFDictionary *)objc_msgSend(v38, "copy");
          v34 = SecItemUpdate(v35, v39);

          v16 = v44;
          v26 = v38;
        }
        if (v34)
        {
          v40 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v48 = v44;
            v49 = 2112;
            v50 = v17;
            v51 = 1024;
            v52 = v34;
            _os_log_error_impl(&dword_1BD918000, v40, OS_LOG_TYPE_ERROR, "Failed writing item (%@) for account (%@) to keychain with code: %d", buf, 0x1Cu);
          }

          v19 = v46;
          if (a10)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v34, 0);
            v32 = 0;
            *a10 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = 0;
          }
          v16 = v44;
        }
        else
        {
          v32 = 1;
          v19 = v46;
        }
        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CD68A0]);
      if (!v18)
        goto LABEL_21;
    }
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CD6898]);
    goto LABEL_21;
  }
  v32 = objc_msgSend(a1, "deleteItemsForIdentifier:account:error:", v16, v17, a10);
LABEL_34:

  return v32;
}

+ (BOOL)hasItemForIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "dataForIdentifier:account:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "deleteItemsForIdentifier:account:isSynced:error:", a3, a4, 0, a5);
}

+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  BOOL v15;
  NSObject *v17;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a6)
  {
    *a6 = 0;
    if (!objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.keychain"), 3, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[ICKeychain deleteItemsForIdentifier:account:isSynced:error:].cold.1();
      v15 = 0;
      goto LABEL_19;
    }
  }
  else if (!objc_msgSend(v10, "length"))
  {
    goto LABEL_16;
  }
  LOBYTE(v19) = 0;
  objc_msgSend(a1, "queryForItemClass:forIdentifier:account:isSynced:type:authenticationContext:returnData:limit:", *MEMORY[0x1E0CD6CA8], v10, v11, v7, 0, 0, v19, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[NSObject copy](v12, "copy");
  v14 = SecItemDelete(v13);

  if (v14)
    v15 = v14 == -25300;
  else
    v15 = 1;
  if (v14 != -25300 && v14 != 0)
  {
    v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 1024;
      v25 = v14;
      _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Failed deleting keychain item (%@) for account (%@) with code: %d", buf, 0x1Cu);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_19:

  return v15;
}

+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "deleteItemsOfType:account:isSynced:error:", a3, a4, 0, a5);
}

+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  BOOL v15;
  NSObject *v17;
  uint64_t v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = v10;
  if (a6)
    *a6 = 0;
  if (a3 || objc_msgSend(v10, "length"))
  {
    LOBYTE(v19) = 0;
    objc_msgSend(a1, "queryForItemClass:forIdentifier:account:isSynced:type:authenticationContext:returnData:limit:", *MEMORY[0x1E0CD6CA8], 0, v11, v7, a3, 0, v19, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject copy](v12, "copy");
    v14 = SecItemDelete(v13);

    if (v14)
      v15 = v14 == -25300;
    else
      v15 = 1;
    if (v14 != -25300 && v14 != 0)
    {
      v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v21 = a3;
        v22 = 2112;
        v23 = v11;
        v24 = 1024;
        v25 = v14;
        _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Failed deleting keychain items of type (%lu) for account (%@) with code: %d", buf, 0x1Cu);
      }

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.keychain"), 3, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICKeychain deleteItemsOfType:account:isSynced:error:].cold.1();
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isSyncAvailableForAccount:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  char v24;
  id v26;
  id v27;

  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v3, "isDeleted");

    if ((v6 & 1) == 0)
    {
      if (objc_msgSend(v3, "isPrimaryiCloudAccount"))
      {
        objc_msgSend(v3, "altDSID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_16;
      }
      else
      {
        if (objc_msgSend(v3, "accountType") != 3)
        {
          v23 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            +[ICKeychain isSyncAvailableForAccount:].cold.6(v3);

          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accountsWithAccountType:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "ic_objectPassingTest:", &__block_literal_global_27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "aa_altDSID");
        v8 = objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_16:
          v8 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            +[ICKeychain isSyncAvailableForAccount:].cold.1();
          v7 = 0;
          goto LABEL_32;
        }
      }
      v16 = objc_alloc_init(MEMORY[0x1E0CD5C70]);
      objc_msgSend(v16, "setContext:", *MEMORY[0x1E0CD5C90]);
      objc_msgSend(v16, "setAltDSID:", v8);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C68]), "initWithContextData:", v16);
      v18 = objc_alloc_init(MEMORY[0x1E0CD5C80]);
      objc_msgSend(v18, "setUseCachedAccountStatus:", 1);
      v27 = 0;
      v19 = objc_msgSend(v17, "fetchCliqueStatus:error:", v18, &v27);
      v20 = v27;
      if (v20)
      {
        v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[ICKeychain isSyncAvailableForAccount:].cold.5(v3);
      }
      else
      {
        if ((v19 | 2) == 2)
        {
          v26 = 0;
          v24 = objc_msgSend(v17, "fetchUserControllableViewsSyncingEnabled:", &v26);
          v22 = v26;
          if (v22)
          {
            v21 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              +[ICKeychain isSyncAvailableForAccount:].cold.4(v3);
          }
          else
          {
            if ((v24 & 1) != 0)
            {
              v7 = 1;
LABEL_31:

LABEL_32:
              goto LABEL_33;
            }
            v21 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              +[ICKeychain isSyncAvailableForAccount:].cold.3(v3);
          }

LABEL_30:
          v7 = 0;
          goto LABEL_31;
        }
        v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[ICKeychain isSyncAvailableForAccount:].cold.2(v3);
      }
      v22 = v21;
      goto LABEL_30;
    }
  }
  v7 = 0;
LABEL_33:

  return v7;
}

uint64_t __40__ICKeychain_isSyncAvailableForAccount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
}

+ (BOOL)shouldFetchItemsWithError:(id *)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;

  v4 = a1;
  objc_sync_enter(v4);
  +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "keychainFetchingEnabled");

  if ((v6 & 1) == 0)
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[ICKeychain shouldFetchItemsWithError:].cold.4();

    if (!a3)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.keychain"), 5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v18 = v16;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentReachabilityStatus");

  if (!v8)
  {
    v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[ICKeychain shouldFetchItemsWithError:].cold.1();

    if (!a3)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.keychain"), 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v9 = (void *)lastItemsFetchFetchDate;
  +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keychainMinimumSyncInterval");
  objc_msgSend(v9, "dateByAddingTimeInterval:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "ic_isLaterThanDate:", v12);

  if (v13)
  {
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[ICKeychain shouldFetchItemsWithError:].cold.2();

LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v20 = (void *)lastItemsFetchErrorDate;
  +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keychainFetchErrorTimeout");
  objc_msgSend(v20, "dateByAddingTimeInterval:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "ic_isLaterThanDate:", v23);

  if (!v24)
  {
    v19 = 1;
    goto LABEL_23;
  }
  v25 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[ICKeychain shouldFetchItemsWithError:].cold.3();

  if (!a3)
    goto LABEL_22;
  v18 = objc_retainAutorelease((id)lastItemsFetchError);
LABEL_16:
  v19 = 0;
  *a3 = v18;
LABEL_23:
  objc_sync_exit(v4);

  return v19;
}

+ (void)fetchItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CD5C10], "controlObject:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v5)
  {
    v7 = a1;
    objc_sync_enter(v7);
    v17 = v6;
    v8 = objc_msgSend(v7, "shouldFetchItemsWithError:", &v17);
    v9 = v17;

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)lastItemsFetchFetchDate;
      lastItemsFetchFetchDate = v10;

      objc_sync_exit(v7);
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[ICKeychain fetchItemsWithCompletionHandler:].cold.2();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E76CAEF0;
      v16 = v7;
      v15 = v4;
      objc_msgSend(v5, "rpcFetchAndProcessChanges:reply:", 0, v14);

    }
    else
    {
      if (v4)
        (*((void (**)(id, id))v4 + 2))(v4, v9);
      objc_sync_exit(v7);

    }
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ICKeychain fetchItemsWithCompletionHandler:].cold.1();

    if (v4)
      (*((void (**)(id, id))v4 + 2))(v4, v6);
    v9 = v6;
  }

}

void __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[16];

  v4 = a2;
  v5 = os_log_create("com.apple.notes", "Crypto");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke_cold_1();

    v7 = *(id *)(a1 + 40);
    objc_sync_enter(v7);
    objc_storeStrong((id *)&lastItemsFetchError, a2);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)lastItemsFetchErrorDate;
    lastItemsFetchErrorDate = v8;
    v10 = &lastItemsFetchFetchDate;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Fetched Keychain items", v13, 2u);
    }

    v7 = *(id *)(a1 + 40);
    objc_sync_enter(v7);
    v9 = (void *)lastItemsFetchError;
    lastItemsFetchError = 0;
    v10 = &lastItemsFetchErrorDate;
  }

  v11 = (void *)*v10;
  *v10 = 0;

  objc_sync_exit(v7);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);

}

+ (void)tests_setLastItemsError:(id)a3 lastItemsErrorDate:(id)a4 lastItemsFetchDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id obj;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  obj = a1;
  objc_sync_enter(obj);
  v11 = (void *)lastItemsFetchError;
  lastItemsFetchError = (uint64_t)v8;
  v12 = v8;

  v13 = (void *)lastItemsFetchErrorDate;
  lastItemsFetchErrorDate = (uint64_t)v9;
  v14 = v9;

  v15 = (void *)lastItemsFetchFetchDate;
  lastItemsFetchFetchDate = (uint64_t)v10;

  objc_sync_exit(obj);
}

+ (id)queryForItemClass:(id)a3 forIdentifier:(id)a4 account:(id)a5 isSynced:(BOOL)a6 type:(unint64_t)a7 authenticationContext:(id)a8 returnData:(BOOL)a9 limit:(id)a10
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v12 = a6;
  v30[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a10;
  v20 = objc_alloc(MEMORY[0x1E0C99E08]);
  v21 = *MEMORY[0x1E0CD6B80];
  v29[0] = *MEMORY[0x1E0CD70A8];
  v29[1] = v21;
  v22 = MEMORY[0x1E0C9AAA0];
  if (v12)
    v22 = MEMORY[0x1E0C9AAB0];
  v30[0] = MEMORY[0x1E0C9AAB0];
  v30[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithDictionary:", v23);

  if (v16)
  {
    v25 = (_QWORD *)MEMORY[0x1E0CD68F8];
    if (!v12)
      v25 = (_QWORD *)MEMORY[0x1E0CD6B58];
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, *v25);
  }
  if (v15)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CD6C98]);
  if (v17)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CD6A90]);
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CD6BC8]);

  }
  if (a9)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
  if (v19)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CD6F30]);
  if (v18)
    objc_msgSend(v24, "setObject:forKey:", v18, *MEMORY[0x1E0CD7088]);
  v27 = (void *)objc_msgSend(v24, "copy");

  return v27;
}

+ (id)accessControlObjectWithProtection:(void *)a3 flags:(unint64_t)a4 error:(id *)a5
{
  SecAccessControlRef v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CFErrorRef v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (a5)
    *a5 = 0;
  v19 = 0;
  v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4, &v19);
  if (v6)
    v7 = v19 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ICKeychain accessControlObjectWithProtection:flags:error:].cold.1((uint64_t)&v19, v8, v9, v10, v11, v12, v13, v14);

    if (a5)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB3388];
      v20[0] = *MEMORY[0x1E0CB2D50];
      v20[1] = v16;
      v21[0] = CFSTR("SecAccessControlCreateWithFlags() returned with an error");
      v21[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.keychain"), 1, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v6)
    {
      CFRelease(v6);
      v6 = 0;
    }
  }
  return v6;
}

+ (void)deleteItemsForIdentifier:account:isSynced:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Cannot delete items from keychain because no itemIdentifier was specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)deleteItemsOfType:account:isSynced:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Cannot delete items from keychain because no type or accountIdentifier was specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)isSyncAvailableForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Couldn't resolve account alt DSID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Unexpected keychain clique status for account (%@): %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Keychain syncing is not enabled for account: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed to fetch keychain sync status for account (%@): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed to fetch keychain clique status for account (%@): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "iCloud keychain sync is not available for non-primary, non-local account: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldFetchItemsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not fetching Keychain items because internet is not reachable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)shouldFetchItemsWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not fetching Keychain items because we fetched them recently", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)shouldFetchItemsWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not fetching Keychain items because we encountered an error recently", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)shouldFetchItemsWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not fetching Keychain items because it's disabled via the cloud configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)fetchItemsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error creating control object for fetching Keychain items {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)fetchItemsWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetching Keychain items…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching Keychain items {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)accessControlObjectWithProtection:(uint64_t)a3 flags:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Failed to create access control object: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
