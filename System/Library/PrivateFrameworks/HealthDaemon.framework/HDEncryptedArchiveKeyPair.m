@implementation HDEncryptedArchiveKeyPair

- (HDEncryptedArchiveKeyPair)initWithSecKey:(__SecKey *)a3
{
  HDEncryptedArchiveKeyPair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDEncryptedArchiveKeyPair;
  v4 = -[HDEncryptedArchiveKeyPair init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_fullKey = a3;
    v4->_publicKey = SecKeyCopyPublicKey(a3);
  }
  return v4;
}

- (HDEncryptedArchiveKeyPair)initWithPublicSecKey:(__SecKey *)a3
{
  HDEncryptedArchiveKeyPair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDEncryptedArchiveKeyPair;
  v4 = -[HDEncryptedArchiveKeyPair init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_publicKey = a3;
  }
  return v4;
}

- (void)dealloc
{
  __SecKey *fullKey;
  objc_super v4;

  fullKey = self->_fullKey;
  if (fullKey)
  {
    CFRelease(fullKey);
    self->_fullKey = 0;
  }
  CFRelease(self->_publicKey);
  self->_publicKey = 0;
  v4.receiver = self;
  v4.super_class = (Class)HDEncryptedArchiveKeyPair;
  -[HDEncryptedArchiveKeyPair dealloc](&v4, sel_dealloc);
}

+ (id)randomKeyPairWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  SecKeyRef v7;
  SecKeyRef v8;
  HDEncryptedArchiveKeyPair *v9;
  __CFError *v10;
  CFErrorRef v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6A50];
  v5 = *MEMORY[0x1E0CD6A20];
  v13[0] = *MEMORY[0x1E0CD6A38];
  v13[1] = v5;
  v14[0] = v4;
  v14[1] = &unk_1E6DFE5D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = SecKeyCreateRandomKey(v6, &v12);
  if (v7)
  {
    v8 = v7;
    v9 = -[HDEncryptedArchiveKeyPair initWithSecKey:]([HDEncryptedArchiveKeyPair alloc], "initWithSecKey:", v7);
    CFRelease(v8);
  }
  else
  {
    v10 = v12;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = 0;
  }

  return v9;
}

+ (id)fetchFromKeychainForLabel:(id)a3 includePrivate:(BOOL)a4 error:(id *)a5
{
  const char *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  OSStatus v16;
  CFTypeID v17;
  HDEncryptedArchiveKeyPair *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  CFTypeID v26;
  __CFString *v27;
  void *v28;
  CFTypeRef result;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x1E0C80C00];
  v7 = "private";
  if (a4)
  {
    v8 = (uint64_t *)MEMORY[0x1E0CD68F0];
  }
  else
  {
    v7 = "public";
    v8 = (uint64_t *)MEMORY[0x1E0CD68B0];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%s"), a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v10 = *MEMORY[0x1E0CD6C98];
  v33[0] = *MEMORY[0x1E0CD6A90];
  v33[1] = v10;
  v11 = *MEMORY[0x1E0CD6CC0];
  v34[0] = v9;
  v34[1] = v11;
  v12 = *MEMORY[0x1E0CD6B80];
  v33[2] = *MEMORY[0x1E0CD70A8];
  v33[3] = v12;
  v34[2] = MEMORY[0x1E0C9AAB0];
  v34[3] = MEMORY[0x1E0C9AAA0];
  v13 = *v8;
  v14 = *MEMORY[0x1E0CD7028];
  v33[4] = *MEMORY[0x1E0CD68A0];
  v33[5] = v14;
  v34[4] = v13;
  v34[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v16 = SecItemCopyMatching(v15, &result);
  if (v16)
  {
    if (v16 == -25300)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 118, CFSTR("No matching key found."));
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2F90];
      v22 = v16;
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Failed to retrieve key.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }

    }
    goto LABEL_18;
  }
  v17 = CFGetTypeID(result);
  if (v17 != SecKeyGetTypeID())
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = CFGetTypeID(result);
    v27 = (__CFString *)CFCopyTypeIDDescription(v26);
    objc_msgSend(v25, "hk_assignError:code:format:", a5, 3, CFSTR("Unexpected return type %@ during keychain fetch."), v27);

    CFRelease(result);
LABEL_18:
    v28 = 0;
    goto LABEL_19;
  }
  v18 = [HDEncryptedArchiveKeyPair alloc];
  if (a4)
    v19 = -[HDEncryptedArchiveKeyPair initWithSecKey:](v18, "initWithSecKey:", result);
  else
    v19 = -[HDEncryptedArchiveKeyPair initWithPublicSecKey:](v18, "initWithPublicSecKey:", result);
  v28 = (void *)v19;
LABEL_19:

  return v28;
}

- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  const void **v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  __CFDictionary *MutableCopy;
  OSStatus v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id *v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFDictionary *v32;
  OSStatus v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  id v39;
  id v40;
  uint64_t v42;
  const __CFString *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  uint64_t v46;
  const __CFString *v47;
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (_QWORD *)MEMORY[0x1E0CD6A90];
  v7 = (uint64_t *)MEMORY[0x1E0CD70A8];
  v8 = MEMORY[0x1E0C9AAB0];
  v9 = (uint64_t *)MEMORY[0x1E0CD6B80];
  v10 = MEMORY[0x1E0C9AAA0];
  v11 = (_QWORD *)MEMORY[0x1E0CD68A0];
  v12 = (const void **)MEMORY[0x1E0CD70E8];
  if (self->_fullKey)
  {
    v48[0] = *MEMORY[0x1E0CD6A90];
    v40 = v5;
    v39 = v5;
    v13 = (uint64_t *)MEMORY[0x1E0CD70A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%s"), v39, "private");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v13;
    v49[0] = v14;
    v49[1] = v8;
    v16 = *v9;
    v48[1] = v15;
    v48[2] = v16;
    v48[3] = *v11;
    v17 = *MEMORY[0x1E0CD68F0];
    v49[2] = v10;
    v49[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v18 = v10;
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v19);
    CFDictionarySetValue(MutableCopy, *v12, self->_fullKey);
    v21 = SecItemAdd(MutableCopy, 0);
    CFRelease(MutableCopy);
    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2F90];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("Failed to store private key.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v21, v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v5 = v40;
        goto LABEL_14;
      }
      v5 = v40;
      v26 = a4;
      if (a4)
        goto LABEL_5;
      goto LABEL_11;
    }

    v10 = v18;
    v5 = v40;
    v9 = (uint64_t *)MEMORY[0x1E0CD6B80];
    v7 = (uint64_t *)MEMORY[0x1E0CD70A8];
    v6 = (_QWORD *)MEMORY[0x1E0CD6A90];
  }
  if (self->_publicKey)
  {
    v44[0] = *v6;
    v27 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%s"), v5, "public");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *v27;
    v45[0] = v28;
    v45[1] = v8;
    v30 = *v9;
    v44[1] = v29;
    v44[2] = v30;
    v44[3] = *v11;
    v31 = *MEMORY[0x1E0CD68B0];
    v45[2] = v10;
    v45[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v32 = CFDictionaryCreateMutableCopy(0, 0, v19);
    CFDictionarySetValue(v32, *v12, self->_publicKey);
    v33 = SecItemAdd(v32, 0);
    CFRelease(v32);
    if (!v33)
    {
      v37 = 1;
      goto LABEL_15;
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2F90];
    v36 = v33;
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("Failed to store public key.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, v36, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
LABEL_14:

      v37 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v26 = a4;
    if (a4)
    {
LABEL_5:
      v25 = objc_retainAutorelease(v25);
      *v26 = v25;
      goto LABEL_14;
    }
LABEL_11:
    _HKLogDroppedError();
    goto LABEL_14;
  }
  v37 = 1;
LABEL_16:

  return v37;
}

- (BOOL)_deleteFromKeychainWithLabel:(id)a3 public:(BOOL)a4 error:(id *)a5
{
  const char *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  OSStatus v15;
  OSStatus v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  BOOL v21;
  BOOL v22;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v6 = "public";
  if (a4)
  {
    v7 = (uint64_t *)MEMORY[0x1E0CD68B0];
  }
  else
  {
    v6 = "private";
    v7 = (uint64_t *)MEMORY[0x1E0CD68F0];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%s"), a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD6C98];
  v26[0] = *MEMORY[0x1E0CD6A90];
  v26[1] = v9;
  v10 = *MEMORY[0x1E0CD6CC0];
  v27[0] = v8;
  v27[1] = v10;
  v11 = *MEMORY[0x1E0CD6B80];
  v26[2] = *MEMORY[0x1E0CD70A8];
  v26[3] = v11;
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = MEMORY[0x1E0C9AAA0];
  v12 = *v7;
  v13 = *MEMORY[0x1E0CD7028];
  v26[4] = *MEMORY[0x1E0CD68A0];
  v26[5] = v13;
  v27[4] = v12;
  v27[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = SecItemDelete(v14);
  v16 = v15;
  if (v15 != -25300 && v15)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Failed to delete key.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v16, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

  }
  if (v16)
    v21 = v16 == -25300;
  else
    v21 = 1;
  v22 = v21;

  return v22;
}

- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = 0;
  if (-[HDEncryptedArchiveKeyPair _deleteFromKeychainWithLabel:public:error:](self, "_deleteFromKeychainWithLabel:public:error:", v6, 0, a4))
  {
    v7 = -[HDEncryptedArchiveKeyPair _deleteFromKeychainWithLabel:public:error:](self, "_deleteFromKeychainWithLabel:public:error:", v6, 1, a4);
  }

  return v7;
}

- (BOOL)symmetric
{
  return 0;
}

- (id)keyDataForEncryptionWithError:(id *)a3
{
  CFDataRef v4;
  CFDataRef v5;
  const __CFData *v6;
  __CFError *v7;
  CFErrorRef error;

  error = 0;
  v4 = SecKeyCopyExternalRepresentation(self->_publicKey, &error);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = error;
    if (v7)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError();
    }

  }
  return v5;
}

- (id)keyDataForDecryptionWithError:(id *)a3
{
  __SecKey *fullKey;
  CFDataRef v5;
  CFDataRef v6;
  const __CFData *v7;
  __CFError *v9;
  CFErrorRef error;

  fullKey = self->_fullKey;
  if (fullKey)
  {
    error = 0;
    v5 = SecKeyCopyExternalRepresentation(fullKey, &error);
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v9 = error;
      if (v9)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError();
      }

    }
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 924, CFSTR("Private key not available; did you only fetch the public key?"));
    return 0;
  }
}

@end
