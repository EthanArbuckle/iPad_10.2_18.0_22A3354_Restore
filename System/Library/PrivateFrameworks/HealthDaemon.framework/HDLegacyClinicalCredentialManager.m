@implementation HDLegacyClinicalCredentialManager

- (HDLegacyClinicalCredentialManager)init
{
  HDLegacyClinicalCredentialManager *v2;
  uint64_t v3;
  OS_dispatch_queue *credentialKeyQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDLegacyClinicalCredentialManager;
  v2 = -[HDLegacyClinicalCredentialManager init](&v6, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    credentialKeyQueue = v2->_credentialKeyQueue;
    v2->_credentialKeyQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 description:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a1)
  {
    if (v7)
    {
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.healthd.healthrecords.HDClinicalCredentialManager"), a3, v9);
    if (v10)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return a1 != 0;
}

- (id)_tokenDataFromToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if (!self)
    goto LABEL_6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1E0CB3500];
  v10 = v8;
  objc_msgSend(v9, "characterSetWithCharactersInString:", &stru_1E6D3D498);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v12, "isEqualToString:", v10);
  if ((v11 & 1) == 0)
  {
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 106, CFSTR("Token contains invalid padding."));

LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }

  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 103, CFSTR("Failed to encode token."));
LABEL_7:

  return v13;
}

- (void)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 format:(uint64_t)a5
{
  objc_class *v11;
  id v12;
  void *v13;

  if (a1)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a4;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:](a1, a2, 1, v13);
  }
}

- (id)_credentialKeyBaseAttributes
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *MEMORY[0x1E0CD6CC0];
  v2 = *MEMORY[0x1E0CD68A0];
  v7[0] = *MEMORY[0x1E0CD6C98];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0CD68E8];
  v8[0] = v1;
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0CD6908];
  objc_msgSend(CFSTR("com.apple.healthd.healthrecords.credential-key"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unitTesting_retrieveCredentialKeyFromKeychainWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  HDLegacyClinicalCredentialManager *v16;
  id *v17;
  uint64_t v18;
  uint64_t v20;
  CFTypeRef result[2];

  result[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v20 = *MEMORY[0x1E0CD7018];
  result[0] = *(CFTypeRef *)MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", result, &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  result[0] = 0;
  v8 = SecItemCopyMatching((CFDictionaryRef)v6, result);
  if ((_DWORD)v8 == -25308)
  {
    v15 = CFSTR("Credential key not accessible.");
    v16 = self;
    v17 = a3;
    v18 = 102;
LABEL_8:
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)v16, v17, v18, v15);
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  if ((_DWORD)v8 == -25300)
  {
    v15 = CFSTR("Credential key not found.");
    v16 = self;
    v17 = a3;
    v18 = 100;
    goto LABEL_8;
  }
  if ((_DWORD)v8)
  {
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:format:]((uint64_t)self, a3, v9, CFSTR("Failed to fetch credential key. OSStatus: %d"), v10, v11, v12, v13, v8);
    goto LABEL_10;
  }
  v14 = (void *)result[0];
LABEL_11:

  return v14;
}

- (BOOL)unitTesting_storeCredentialKeyInKeychain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  _QWORD v33[13];
  _QWORD v34[14];

  v34[13] = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  v6 = a3;
  -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = *MEMORY[0x1E0CD69F8];
  v34[0] = *MEMORY[0x1E0CD6A18];
  v10 = *MEMORY[0x1E0CD6A20];
  v33[0] = v9;
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 256);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  v33[2] = *MEMORY[0x1E0CD69A8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 256);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CD6950];
  v14 = *MEMORY[0x1E0C9AE50];
  v34[2] = v12;
  v34[3] = v14;
  v15 = *MEMORY[0x1E0CD6940];
  v33[3] = v13;
  v33[4] = v15;
  v16 = *MEMORY[0x1E0CD6948];
  v17 = *MEMORY[0x1E0C9AE40];
  v34[4] = v14;
  v34[5] = v17;
  v18 = *MEMORY[0x1E0CD6958];
  v33[5] = v16;
  v33[6] = v18;
  v19 = *MEMORY[0x1E0CD6968];
  v34[6] = v17;
  v34[7] = v17;
  v20 = *MEMORY[0x1E0CD6970];
  v33[7] = v19;
  v33[8] = v20;
  v21 = *MEMORY[0x1E0CD69D8];
  v33[9] = *MEMORY[0x1E0CD6960];
  v33[10] = v21;
  v34[8] = v17;
  v34[9] = v17;
  v22 = *MEMORY[0x1E0CD6B80];
  v34[10] = v14;
  v34[11] = v17;
  v23 = *MEMORY[0x1E0CD70D8];
  v33[11] = v22;
  v33[12] = v23;
  v34[12] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v24);
  v25 = SecItemAdd((CFDictionaryRef)v8, 0);
  if ((_DWORD)v25)
  {
    if ((_DWORD)v25 == -25299)
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 101, CFSTR("Credential key exists in Keychain."));
    else
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:format:]((uint64_t)self, a4, v26, CFSTR("Failed to add credential key. OSStatus: %d"), v27, v28, v29, v30, v25);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }

  return v31;
}

- (BOOL)deleteCredentialKeyFromKeychainWithError:(id *)a3
{
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = SecItemDelete(v5);
  v12 = 1;
  if ((_DWORD)v6 && (_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6 == -25308)
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a3, 102, CFSTR("Credential key not accessible."));
    else
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:format:]((uint64_t)self, a3, v7, CFSTR("Failed to delete credential key. OSStatus: %d"), v8, v9, v10, v11, v6);
    v12 = 0;
  }

  return v12;
}

- (NSData)cachedCredentialKey
{
  HDLegacyClinicalCredentialManager *v2;
  NSObject *credentialKeyQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = self;
  if (self)
    self = (HDLegacyClinicalCredentialManager *)self->_credentialKeyQueue;
  dispatch_assert_queue_not_V2(&self->super);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__154;
  v11 = __Block_byref_object_dispose__154;
  v12 = 0;
  if (v2)
    credentialKeyQueue = v2->_credentialKeyQueue;
  else
    credentialKeyQueue = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HDLegacyClinicalCredentialManager_cachedCredentialKey__block_invoke;
  v6[3] = &unk_1E6CE8110;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(credentialKeyQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

void __56__HDLegacyClinicalCredentialManager_cachedCredentialKey__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setCachedCredentialKey:(id)a3
{
  id v4;
  NSObject *credentialKeyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    credentialKeyQueue = self->_credentialKeyQueue;
  else
    credentialKeyQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HDLegacyClinicalCredentialManager_setCachedCredentialKey___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(credentialKeyQueue, v7);

}

void __60__HDLegacyClinicalCredentialManager_setCachedCredentialKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialKeyQueue, 0);
  objc_storeStrong((id *)&self->_cachedCredentialKey, 0);
}

@end
