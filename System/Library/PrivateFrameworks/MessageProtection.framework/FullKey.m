@implementation FullKey

+ (id)generateNewKeyWithAccess:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "generateNewKeyWithAccess:forceNoSEP:error:", a3, 0, a4);
}

+ (id)generateNewKeyWithAccess:(id)a3 forceNoSEP:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc((Class)a1);
  if (v6)
    +[CoreCryptoP256Private generate](CoreCryptoP256Private, "generate");
  else
    +[SecKeyP256Private generateWithAccessControl:](SecKeyP256Private, "generateWithAccessControl:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithKey:error:", v10, a5);

  return v11;
}

- (FullKey)initWithKey:(id)a3 error:(id *)a4
{
  id v7;
  FullKey *v8;
  FullKey *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v16;

  v7 = a3;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)FullKey;
    v8 = -[FullKey init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_key, a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9->_keyStore = 4;
      }
      else if (objc_opt_class())
      {
        v9->_keyStore = 0;
      }
      else
      {
        MessageProtectionLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[FullKey initWithKey:error:].cold.1((uint64_t)v9, v13, v14);

      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(0, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to initialize a full key: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(4, a4, v12);

    v9 = 0;
  }

  return v9;
}

- (FullKey)initWithProtobufferData:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *keychainTag;
  FullKey *v9;
  void *v10;
  uint64_t v11;
  FullKey *v12;
  NSObject *v13;

  v6 = a3;
  v7 = objc_msgSend(v6, "keystore");
  if (v7 != 4)
  {
    if (v7 == 3)
    {
      objc_msgSend(v6, "keychainTag");
      keychainTag = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[FullKey initWithKeychainTag:error:](self, "initWithKeychainTag:error:", keychainTag, a4);
LABEL_7:

      goto LABEL_8;
    }
    MessageProtectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[FullKey initWithProtobufferData:error:].cold.1(v6, v13);
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v6, "hasKeyData") & 1) == 0)
  {
    MessageProtectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FullKey initWithProtobufferData:error:].cold.2(v13);
    goto LABEL_13;
  }
  objc_msgSend(v6, "keyData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FullKey initWithCTKTokenOID:error:](self, "initWithCTKTokenOID:error:", v10, a4);

  if (objc_msgSend(v6, "hasKeychainTag"))
  {
    objc_msgSend(v6, "keychainTag");
    v11 = objc_claimAutoreleasedReturnValue();
    keychainTag = v9->_keychainTag;
    v9->_keychainTag = (NSString *)v11;
    goto LABEL_7;
  }
LABEL_8:
  self = v9;
  v12 = self;
LABEL_14:

  return v12;
}

- (FullKey)initWithCTKTokenOID:(id)a3 error:(id *)a4
{
  id v6;
  FullKey *v7;
  SecKeyP256Private *v8;
  P256PrivateKeyProtocol *key;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FullKey;
  v7 = -[FullKey init](&v11, sel_init);
  if (v7)
  {
    v8 = -[SecKeyP256Private initWithData:error:]([SecKeyP256Private alloc], "initWithData:error:", v6, a4);
    key = v7->_key;
    v7->_key = (P256PrivateKeyProtocol *)v8;

    v7->_keyStore = 4;
  }

  return v7;
}

- (FullKey)initWithKeychainTag:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  OSStatus v12;
  FullKey *v13;
  id v14;
  void *v15;
  SecKeyP256Private *v16;
  FullKey *v17;
  FullKey *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  CFTypeRef result;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *MEMORY[0x24BDE9230];
  v9 = *MEMORY[0x24BDE9128];
  v25[0] = *MEMORY[0x24BDE9220];
  v25[1] = v9;
  v26[0] = v8;
  v26[1] = CFSTR("com.apple.messageprotection");
  v10 = *MEMORY[0x24BDE94C8];
  v25[2] = *MEMORY[0x24BDE8FA8];
  v25[3] = v10;
  v26[2] = v7;
  v26[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v12 = SecItemCopyMatching(v11, &result);
  if (v12)
  {
    MPLogAndAssignError(v12, a4, CFSTR("Failed to initiate a full key from the passed serialization."));
    v13 = 0;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x24BDBCE50]);
    v15 = (void *)objc_msgSend(v14, "initWithData:", result);
    v16 = -[SecKeyP256Private initWithData:error:]([SecKeyP256Private alloc], "initWithData:error:", v15, a4);
    if (v16)
    {
      v23.receiver = self;
      v23.super_class = (Class)FullKey;
      v17 = -[FullKey init](&v23, sel_init);
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_key, v16);
        v18->_keyStore = 3;
        objc_storeStrong((id *)&v18->_keychainTag, a3);
      }
      self = v18;
      v13 = self;
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*a4, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("We failed to initialize a key with error: %@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MPLogAndAssignError(406, a4, v21);

      v13 = 0;
    }

  }
  return v13;
}

- (id)keyIdentifier
{
  NSString *keychainTag;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  keychainTag = self->_keychainTag;
  if (keychainTag)
  {
    v3 = keychainTag;
  }
  else
  {
    -[FullKey key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FullKey key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FullKey with public data representation: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)protobuffer
{
  NGMPBP256Key *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(NGMPBP256Key);
  -[FullKey keychainTag](self, "keychainTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBP256Key setKeychainTag:](v3, "setKeychainTag:", v4);

  -[FullKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keychainData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBP256Key setKeyData:](v3, "setKeyData:", v6);

  -[NGMPBP256Key setKeystore:](v3, "setKeystore:", 4);
  return v3;
}

- (P256PrivateKeyProtocol)key
{
  return (P256PrivateKeyProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (int)keyStore
{
  return self->_keyStore;
}

- (NSString)keychainTag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeychainTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainTag, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithKey:(uint64_t)a3 error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 8);
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_0_1(&dword_20BABB000, a2, a3, "Unsupported key store: %d", (uint8_t *)v4);
}

- (void)initWithProtobufferData:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "keystore");
  OUTLINED_FUNCTION_0_1(&dword_20BABB000, a2, v3, "Unsupported key store: %d", (uint8_t *)v4);
}

- (void)initWithProtobufferData:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

@end
