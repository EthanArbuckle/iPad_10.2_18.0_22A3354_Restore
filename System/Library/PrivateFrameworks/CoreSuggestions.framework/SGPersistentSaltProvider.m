@implementation SGPersistentSaltProvider

- (SGPersistentSaltProvider)initWithServiceIdentifier:(id)a3 accessGroup:(id)a4
{
  id v7;
  id v8;
  SGPersistentSaltProvider *v9;
  SGPersistentSaltProvider *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGPersistentSaltProvider;
  v9 = -[SGPersistentSaltProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_accessGroup, a4);
    v11 = objc_alloc(MEMORY[0x1E0D815F0]);
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v11, "initWithGuardedData:", v12);
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v13;

  }
  return v10;
}

- (id)salt
{
  _PASLock *lock;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5235;
  v13 = __Block_byref_object_dispose__5236;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__SGPersistentSaltProvider_salt__block_invoke;
  v8[3] = &unk_1E4761E80;
  v8[4] = self;
  v8[5] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = (void *)v10[5];
  if (!v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1A2267000, v4, OS_LOG_TYPE_FAULT, "Could not generate salt.", v7, 2u);
    }

    if ((_PASEvaluateLogFaultAndProbCrashCriteria() & 1) != 0)
      abort();
    v3 = (void *)v10[5];
  }
  v5 = v3;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_findOrCreateSalt
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v13[16];
  uint8_t buf[8];
  id v15;

  v15 = 0;
  -[SGPersistentSaltProvider _findExistingSaltError:](self, "_findExistingSaltError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (!v3)
  {
LABEL_9:
    -[SGPersistentSaltProvider _createSalt](self, "_createSalt");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CD68A8]);

  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1A2267000, v9, OS_LOG_TYPE_ERROR, "Existing salt has wrong access class. Re-creating salt", v13, 2u);
    }

    -[SGPersistentSaltProvider _deleteSalt](self, "_deleteSalt");
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_INFO, "Found existing salt", buf, 2u);
  }

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = (void *)v10;

  return v11;
}

- (id)_queryKeychainError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString *serviceIdentifier;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v5;
  serviceIdentifier = self->_serviceIdentifier;
  v20[0] = v4;
  v20[1] = serviceIdentifier;
  v7 = *MEMORY[0x1E0CD7018];
  v19[2] = *MEMORY[0x1E0CD6B80];
  v19[3] = v7;
  v20[2] = MEMORY[0x1E0C9AAB0];
  v20[3] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0CD6F30];
  v19[4] = *MEMORY[0x1E0CD7010];
  v19[5] = v8;
  v20[4] = MEMORY[0x1E0C9AAB0];
  v20[5] = &unk_1E4781370;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v10 = SecItemCopyMatching(v9, &result);
  if (v10)
  {
    v11 = v10;
    if (v10 == -25300)
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2267000, v12, OS_LOG_TYPE_INFO, "No salt found", buf, 2u);
      }

      goto LABEL_12;
    }
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v11;
      _os_log_error_impl(&dword_1A2267000, v14, OS_LOG_TYPE_ERROR, "Error finding existing salt: %d", buf, 8u);
    }

    if (!a3)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!result)
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    CFAutorelease(result);
    v13 = (id)result;
  }
LABEL_13:

  return v13;
}

- (id)_findExistingSaltError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  char v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char v17;
  __int16 v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[SGPersistentSaltProvider _queryKeychainError:](self, "_queryKeychainError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_5224);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  if (v8)
  {
    if (objc_msgSend(v8, "length"))
    {
      v10 = 0;
      do
      {
        v18 = 0;
        objc_msgSend(v8, "getBytes:range:", &v18, v10, 2);
        if ((v18 & 0x10) != 0)
          v11 = 0;
        else
          v11 = 9;
        v12 = v11 + v18;
        if ((v18 & 0x1000) != 0)
          v13 = -16;
        else
          v13 = 9;
        v17 = v13 + (HIBYTE(v18) & 0x1F) + 16 * v12;
        objc_msgSend(v9, "appendBytes:length:", &v17, 1);
        v10 += 2;
      }
      while (v10 < objc_msgSend(v8, "length"));
    }
    v19[0] = v9;
    objc_msgSend(v6, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    if (a3)
      *a3 = 0;
  }

  return v15;
}

- (id)_createSalt
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *serviceIdentifier;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  OSStatus v16;
  OSStatus v17;
  NSObject *v18;
  id v19;
  _DWORD v21[4];
  _QWORD v22[7];
  _QWORD v23[7];
  uint8_t buf[16];
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v3, OS_LOG_TYPE_INFO, "Will create new salt", buf, 2u);
  }

  *(_OWORD *)buf = 0u;
  v25 = 0u;
  arc4random_buf(buf, 0x20uLL);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buf, 32);
  +[SGPersistentSaltProvider hexStringForData:](SGPersistentSaltProvider, "hexStringForData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CD6C98];
  v22[0] = *MEMORY[0x1E0CD70D8];
  v22[1] = v7;
  v8 = *MEMORY[0x1E0CD6CA8];
  v23[0] = v6;
  v23[1] = v8;
  v9 = *MEMORY[0x1E0CD6B58];
  v22[2] = *MEMORY[0x1E0CD6898];
  v22[3] = v9;
  serviceIdentifier = self->_serviceIdentifier;
  v23[2] = self->_accessGroup;
  v23[3] = serviceIdentifier;
  v22[4] = *MEMORY[0x1E0CD69C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", os_variant_has_internal_diagnostics() ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CD68A0];
  v13 = *MEMORY[0x1E0CD68A8];
  v23[4] = v11;
  v23[5] = v13;
  v14 = *MEMORY[0x1E0CD6B80];
  v22[5] = v12;
  v22[6] = v14;
  v23[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v16 = SecItemAdd(v15, 0);
  if (v16)
  {
    v17 = v16;
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = v17;
      _os_log_error_impl(&dword_1A2267000, v18, OS_LOG_TYPE_ERROR, "Error creating new salt: %d", (uint8_t *)v21, 8u);
    }

    v19 = 0;
  }
  else
  {
    v19 = v4;
  }

  return v19;
}

- (void)_deleteSalt
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSString *accessGroup;
  NSString *serviceIdentifier;
  uint64_t v8;
  const __CFDictionary *v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  _DWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1A2267000, v3, OS_LOG_TYPE_INFO, "Will delete salt", (uint8_t *)v13, 2u);
  }

  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6898];
  v14[0] = *MEMORY[0x1E0CD6C98];
  v14[1] = v5;
  serviceIdentifier = self->_serviceIdentifier;
  accessGroup = self->_accessGroup;
  v15[0] = v4;
  v15[1] = accessGroup;
  v8 = *MEMORY[0x1E0CD6B80];
  v14[2] = *MEMORY[0x1E0CD6B58];
  v14[3] = v8;
  v15[2] = serviceIdentifier;
  v15[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = SecItemDelete(v9);
  if (v10)
  {
    v11 = v10;
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v11;
      _os_log_error_impl(&dword_1A2267000, v12, OS_LOG_TYPE_ERROR, "Error deleting salt: %d", (uint8_t *)v13, 8u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __51__SGPersistentSaltProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v4 = *MEMORY[0x1E0CD6990];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (v6)
      v9 = -1;
    else
      v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "compare:", v7);
  }

  return v9;
}

void __32__SGPersistentSaltProvider_salt__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[1];
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_findOrCreateSalt");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v6[1];
    v6[1] = v4;

    v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

+ (id)saltProviderWithString:(id)a3 serviceIdentifier:(id)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceIdentifier:accessGroup:", v10, v9);

  v12 = (void *)v11[1];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__SGPersistentSaltProvider_saltProviderWithString_serviceIdentifier_accessGroup___block_invoke;
  v15[3] = &unk_1E4761E58;
  v16 = v8;
  v13 = v8;
  objc_msgSend(v12, "runWithLockAcquired:", v15);

  return v11;
}

+ (id)saltProviderFromKeyChainWithServiceIdentifier:(id)a3 accessGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceIdentifier:accessGroup:", v7, v6);

  return v8;
}

+ (id)hexStringForData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v4);
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "bytes");
  if (v4)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      v9 = *v8++;
      objc_msgSend(v5, "appendFormat:", CFSTR("%02X"), v9);
      --v4;
    }
    while (v4);
  }

  return v5;
}

void __81__SGPersistentSaltProvider_saltProviderWithString_serviceIdentifier_accessGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[1];
  v3[1] = v4;

}

@end
