@implementation HDEncryptedArchiveSymmetricKey

- (HDEncryptedArchiveSymmetricKey)initWithData:(id)a3
{
  id v4;
  HDEncryptedArchiveSymmetricKey *v5;
  uint64_t v6;
  NSData *key;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDEncryptedArchiveSymmetricKey;
  v5 = -[HDEncryptedArchiveSymmetricKey init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    key = v5->_key;
    v5->_key = (NSData *)v6;

  }
  return v5;
}

+ (id)randomKeyWithError:(id *)a3
{
  void *v4;
  const __SecRandom *v5;
  size_t v6;
  id v7;
  uint64_t v8;
  HDEncryptedArchiveSymmetricKey *v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_msgSend(v4, "length");
  v7 = objc_retainAutorelease(v4);
  v8 = SecRandomCopyBytes(v5, v6, (void *)objc_msgSend(v7, "mutableBytes"));
  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 2000, CFSTR("Failed to generate random symmetric key: %d"), v8);
    v9 = 0;
  }
  else
  {
    v9 = -[HDEncryptedArchiveSymmetricKey initWithData:]([HDEncryptedArchiveSymmetricKey alloc], "initWithData:", v7);
  }

  return v9;
}

+ (id)fetchFromKeychainForLabel:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  OSStatus v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  CFTypeID v19;
  HDEncryptedArchiveSymmetricKey *v20;
  void *v21;
  HDEncryptedArchiveSymmetricKey *v22;
  void *v23;
  CFTypeID v24;
  __CFString *v25;
  CFTypeRef result;
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[7];
  _QWORD v31[8];

  v31[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  result = 0;
  v6 = *MEMORY[0x1E0CD6C98];
  v30[0] = *MEMORY[0x1E0CD6A90];
  v30[1] = v6;
  v7 = *MEMORY[0x1E0CD6CC0];
  v31[0] = v5;
  v31[1] = v7;
  v8 = *MEMORY[0x1E0CD6A18];
  v9 = *MEMORY[0x1E0CD70A8];
  v30[2] = *MEMORY[0x1E0CD69F8];
  v30[3] = v9;
  v10 = *MEMORY[0x1E0CD68A0];
  v30[4] = *MEMORY[0x1E0CD6B80];
  v30[5] = v10;
  v11 = *MEMORY[0x1E0CD68F0];
  v31[4] = MEMORY[0x1E0C9AAA0];
  v31[5] = v11;
  v31[2] = v8;
  v31[3] = MEMORY[0x1E0C9AAB0];
  v30[6] = *MEMORY[0x1E0CD7018];
  v31[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = SecItemCopyMatching(v12, &result);
  if (v13)
  {
    if (v13 != -25300)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2F90];
      v16 = v13;
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("Failed to retrieve symmetric key.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v18);
        else
          _HKLogDroppedError();
      }

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (!result)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("No matching key found."));
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v19 = CFGetTypeID(result);
  if (v19 != CFDataGetTypeID())
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFGetTypeID(result);
    v25 = (__CFString *)CFCopyTypeIDDescription(v24);
    objc_msgSend(v23, "hk_assignError:code:format:", a4, 3, CFSTR("Unexpected return type %@ during keychain fetch."), v25);

    CFRelease(result);
    goto LABEL_13;
  }
  v20 = [HDEncryptedArchiveSymmetricKey alloc];
  v21 = (void *)result;
  v22 = -[HDEncryptedArchiveSymmetricKey initWithData:](v20, "initWithData:", result);

LABEL_14:
  return v22;
}

- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4
{
  id v6;
  NSData *key;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  OSStatus v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[8];
  _QWORD v27[9];

  v27[8] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  key = self->_key;
  v8 = *MEMORY[0x1E0CD6C98];
  v26[0] = *MEMORY[0x1E0CD70D8];
  v26[1] = v8;
  v9 = *MEMORY[0x1E0CD6CC0];
  v27[0] = key;
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E0CD6A20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 8 * -[NSData length](key, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CD69F8];
  v12 = *MEMORY[0x1E0CD6A18];
  v27[2] = v10;
  v27[3] = v12;
  v13 = *MEMORY[0x1E0CD6A90];
  v26[3] = v11;
  v26[4] = v13;
  v14 = *MEMORY[0x1E0CD70A8];
  v27[4] = v6;
  v27[5] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0CD6B80];
  v26[5] = v14;
  v26[6] = v15;
  v26[7] = *MEMORY[0x1E0CD68A0];
  v16 = *MEMORY[0x1E0CD68F0];
  v27[6] = MEMORY[0x1E0C9AAA0];
  v27[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v18 = SecItemAdd(v17, 0);
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Failed to store public key.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v18, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError();
    }

  }
  return v18 == 0;
}

- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  OSStatus v10;
  OSStatus v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  BOOL v17;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CD6C98];
  v21[0] = *MEMORY[0x1E0CD6A90];
  v21[1] = v6;
  v7 = *MEMORY[0x1E0CD6CC0];
  v22[0] = v5;
  v22[1] = v7;
  v8 = *MEMORY[0x1E0CD6B80];
  v21[2] = *MEMORY[0x1E0CD70A8];
  v21[3] = v8;
  v22[2] = MEMORY[0x1E0C9AAB0];
  v22[3] = MEMORY[0x1E0C9AAA0];
  v21[4] = *MEMORY[0x1E0CD68A0];
  v22[4] = *MEMORY[0x1E0CD68F0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = SecItemDelete(v9);
  v11 = v10;
  if (v10 != -25300 && v10)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2F90];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Failed to delete key.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v11, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  if (v11)
    v16 = v11 == -25300;
  else
    v16 = 1;
  v17 = v16;

  return v17;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_key, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSData isEqualToData:](self->_key, "isEqualToData:", v4[1]);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDEncryptedArchiveSymmetricKey initWithData:](+[HDEncryptedArchiveSymmetricKey allocWithZone:](HDEncryptedArchiveSymmetricKey, "allocWithZone:", a3), "initWithData:", self->_key);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_key, CFSTR("sym_key"));
}

- (HDEncryptedArchiveSymmetricKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDEncryptedArchiveSymmetricKey *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sym_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HDEncryptedArchiveSymmetricKey initWithData:](self, "initWithData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)symmetric
{
  return 1;
}

- (id)keyDataForEncryptionWithError:(id *)a3
{
  return self->_key;
}

- (id)keyDataForDecryptionWithError:(id *)a3
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
