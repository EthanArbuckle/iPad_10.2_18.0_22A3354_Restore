@implementation TKTokenKeychainKey

- (TKTokenKeychainKey)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  TKTokenKeychainKey *v5;
  TKTokenKeychainKey *v6;
  __CFString *v7;
  SecKeyRef v8;
  void *v9;
  uint64_t v10;
  TKTokenKeychainKey *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TKTokenKeychainKey;
  v5 = -[TKTokenKeychainItem initWithObjectID:](&v21, sel_initWithObjectID_, objectID);
  v6 = v5;
  if (certificateRef && v5)
  {
    v7 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    v8 = SecCertificateCopyKey(certificateRef);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", SecCertificateGetKeyUsage());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedCharValue");

      -[TKTokenKeychainKey setCanSign:](v6, "setCanSign:", +[TKTokenKeychainKey canSign:](TKTokenKeychainKey, "canSign:", v10));
      -[TKTokenKeychainKey setCanDecrypt:](v6, "setCanDecrypt:", +[TKTokenKeychainKey canDecrypt:](TKTokenKeychainKey, "canDecrypt:", v10));
      -[TKTokenKeychainKey setCanPerformKeyExchange:](v6, "setCanPerformKeyExchange:", +[TKTokenKeychainKey canPerformKeyExchange:](TKTokenKeychainKey, "canPerformKeyExchange:", v10));
      -[TKTokenKeychainKey setSuitableForLogin:](v6, "setSuitableForLogin:", -[TKTokenKeychainKey canSign](v6, "canSign"));
      if (-[TKTokenKeychainKey setupWithPublicKey:label:](v6, "setupWithPublicKey:label:", v8, v7))
      {
        v11 = v6;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      TK_LOG_token_2();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TKTokenKeychainKey initWithCertificate:objectID:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
    v11 = 0;
    goto LABEL_11;
  }
  v11 = v5;
LABEL_12:

  return v11;
}

- (TKTokenKeychainKey)initWithPublicKey:(__SecKey *)a3 label:(id)a4 objectID:(id)a5 canSign:(BOOL)a6 canDecrypt:(BOOL)a7 canPerformKeyExchange:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  TKTokenKeychainKey *v15;
  TKTokenKeychainKey *v16;
  TKTokenKeychainKey *v17;
  objc_super v19;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TKTokenKeychainKey;
  v15 = -[TKTokenKeychainItem initWithObjectID:](&v19, sel_initWithObjectID_, a5);
  v16 = v15;
  if (v15
    && (-[TKTokenKeychainKey setCanSign:](v15, "setCanSign:", v10),
        -[TKTokenKeychainKey setCanDecrypt:](v16, "setCanDecrypt:", v9),
        -[TKTokenKeychainKey setCanPerformKeyExchange:](v16, "setCanPerformKeyExchange:", v8),
        -[TKTokenKeychainKey setSuitableForLogin:](v16, "setSuitableForLogin:", -[TKTokenKeychainKey canSign](v16, "canSign")), -[TKTokenKeychainKey setupWithPublicKey:label:](v16, "setupWithPublicKey:label:", a3, v14)))
  {
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)setupWithPublicKey:(__SecKey *)a3 label:(id)a4
{
  CFDictionaryRef v6;
  NSData *v7;
  NSData *publicKeyData;
  NSData *v9;
  NSString *v10;
  NSString *keyType;
  void *v12;
  NSData *v13;
  NSData *publicKeyHash;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  -[TKTokenKeychainItem setLabel:](self, "setLabel:", a4);
  v6 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKeyData = self->_publicKeyData;
  self->_publicKeyData = v7;

  v9 = self->_publicKeyData;
  if (v9)
  {
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A38]);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyType = self->_keyType;
    self->_keyType = v10;

    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A20]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_keySizeInBits = objc_msgSend(v12, "integerValue");

    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6900]);
    v13 = (NSData *)objc_claimAutoreleasedReturnValue();
    publicKeyHash = self->_publicKeyHash;
    self->_publicKeyHash = v13;

    v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    if (-[TKTokenKeychainKey canSign](self, "canSign"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E70977B0);
    if (-[TKTokenKeychainKey canDecrypt](self, "canDecrypt"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E70977C8);
    if (-[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange"))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E70977E0);
    v16 = (void *)objc_msgSend(v15, "copy");
    -[TKTokenKeychainItem setConstraints:](self, "setConstraints:", v16);

  }
  else
  {
    TK_LOG_token_2();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TKTokenKeychainKey setupWithPublicKey:label:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  }
  return v9 != 0;
}

- (id)keychainAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TKTokenKeychainKey;
  -[TKTokenKeychainItem keychainAttributes](&v18, sel_keychainAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD69E0]);
  -[TKTokenKeychainKey keyType](self, "keyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD6A38]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TKTokenKeychainKey keySizeInBits](self, "keySizeInBits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6A20]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6940]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TKTokenKeychainKey canSign](self, "canSign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6958]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6960]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6948]);

  -[TKTokenKeychainKey applicationTag](self, "applicationTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TKTokenKeychainKey applicationTag](self, "applicationTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6908]);

  }
  -[TKTokenKeychainKey publicKeyHash](self, "publicKeyHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TKTokenKeychainKey publicKeyHash](self, "publicKeyHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CD6900]);

  }
  -[TKTokenKeychainKey publicKeyData](self, "publicKeyData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TKTokenKeychainKey publicKeyData](self, "publicKeyData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pubk"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TKTokenKeychainKey keyUsage](self, "keyUsage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("keyUsage"));

  return v3;
}

- (id)encodedObjectID
{
  void *v2;
  void *v3;

  -[TKTokenKeychainItem objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TKTokenID encodedKeyID:](TKTokenID, "encodedKeyID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TKTokenKeychainKey)initWithItemInfo:(id)a3
{
  id v4;
  TKTokenKeychainKey *v5;
  uint64_t v6;
  NSData *publicKeyData;
  uint64_t v8;
  NSString *keyType;
  void *v10;
  uint64_t v11;
  NSData *publicKeyHash;
  uint64_t v13;
  NSData *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TKTokenKeychainKey;
  v5 = -[TKTokenKeychainItem initWithItemInfo:](&v21, sel_initWithItemInfo_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v6 = objc_claimAutoreleasedReturnValue();
    publicKeyData = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A38]);
    v8 = objc_claimAutoreleasedReturnValue();
    keyType = v5->_keyType;
    v5->_keyType = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keySizeInBits = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6900]);
    v11 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pubk"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6940]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDecrypt = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6958]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canSign = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6960]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDecrypt = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6948]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canPerformKeyExchange = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyUsage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suitableForLogin = objc_msgSend(v19, "integerValue") & 1;

  }
  return v5;
}

+ (BOOL)canSign:(unsigned __int8)a3
{
  return (a3 & 0x63) != 0;
}

+ (BOOL)canDecrypt:(unsigned __int8)a3
{
  return (a3 & 0x1C) != 0;
}

+ (BOOL)canPerformKeyExchange:(unsigned __int8)a3
{
  return (a3 >> 4) & 1;
}

- (unint64_t)keyUsage
{
  unint64_t v3;

  v3 = -[TKTokenKeychainKey isSuitableForLogin](self, "isSuitableForLogin");
  if (-[TKTokenKeychainKey canSign](self, "canSign"))
    v3 |= 8uLL;
  if (-[TKTokenKeychainKey canDecrypt](self, "canDecrypt"))
    v3 |= 2uLL;
  if (-[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange"))
    return v3 | 4;
  else
    return v3;
}

- (BOOL)satisfiesKeyUsage:(unint64_t)a3
{
  return !a3 || (-[TKTokenKeychainKey keyUsage](self, "keyUsage") & a3) != 0;
}

- (NSString)keyType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyType:(NSString *)keyType
{
  objc_setProperty_atomic_copy(self, a2, keyType, 56);
}

- (NSData)applicationTag
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationTag:(NSData *)applicationTag
{
  objc_setProperty_atomic_copy(self, a2, applicationTag, 64);
}

- (NSInteger)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeySizeInBits:(NSInteger)keySizeInBits
{
  self->_keySizeInBits = keySizeInBits;
}

- (NSData)publicKeyData
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPublicKeyData:(NSData *)publicKeyData
{
  objc_setProperty_atomic_copy(self, a2, publicKeyData, 80);
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublicKeyHash:(NSData *)publicKeyHash
{
  objc_setProperty_atomic_copy(self, a2, publicKeyHash, 88);
}

- (BOOL)canDecrypt
{
  return self->_canDecrypt;
}

- (void)setCanDecrypt:(BOOL)canDecrypt
{
  self->_canDecrypt = canDecrypt;
}

- (BOOL)canSign
{
  return self->_canSign;
}

- (void)setCanSign:(BOOL)canSign
{
  self->_canSign = canSign;
}

- (BOOL)canPerformKeyExchange
{
  return self->_canPerformKeyExchange;
}

- (void)setCanPerformKeyExchange:(BOOL)canPerformKeyExchange
{
  self->_canPerformKeyExchange = canPerformKeyExchange;
}

- (BOOL)isSuitableForLogin
{
  return self->_suitableForLogin;
}

- (void)setSuitableForLogin:(BOOL)suitableForLogin
{
  self->_suitableForLogin = suitableForLogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
}

- (void)initWithCertificate:(uint64_t)a3 objectID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, a1, a3, "Failed to get public key from certificate", a5, a6, a7, a8, 0);
}

- (void)setupWithPublicKey:(uint64_t)a3 label:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, a1, a3, "Failed to get public key data", a5, a6, a7, a8, 0);
}

@end
