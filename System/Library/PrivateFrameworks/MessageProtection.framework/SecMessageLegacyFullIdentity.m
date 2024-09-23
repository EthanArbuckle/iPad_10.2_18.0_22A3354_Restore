@implementation SecMessageLegacyFullIdentity

+ (id)populateIdentity:(id)a3 withSigningKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5
{
  id v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  LegacySigningKeyPrivate *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  CFErrorRef error;
  SecKeyRef key;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    error = 0;
    key = 0;
    v17 = 0;
    v8 = SecMPFICreatePrivateAndPublicKeyReadPersistentRef(&v17, (uint64_t *)a4, (uint64_t *)a5, &key, &error);
    v9 = v17;
    if (v8)
    {
      MessageProtectionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v21 = v8;
        _os_log_impl(&dword_20BABB000, v10, OS_LOG_TYPE_INFO, "Failed to lookup legacy persistent reference for signing key: %i", buf, 8u);
      }
    }
    else
    {
      objc_msgSend(v7, "setSigningKeyPersistentRef:", v9);
      v10 = SecKeyCopyExternalRepresentation(key, &error);
      if (v10)
      {
        v16 = 0;
        v12 = -[LegacySigningKeyPrivate initWithData:error:]([LegacySigningKeyPrivate alloc], "initWithData:error:", v10, &v16);
        objc_msgSend(v7, "setSigningKey:", v12);

        v10 = objc_retainAutorelease(v10);
        memset_s((void *)-[NSObject mutableBytes](v10, "mutableBytes"), -[NSObject length](v10, "length"), 0, -[NSObject length](v10, "length"));
        objc_msgSend(v7, "signingKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = v7;
        else
          v14 = 0;
        v11 = v14;

        goto LABEL_12;
      }
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)populateIdentity:(id)a3 withEncryptionKeyFromPersistentRef:(const char *)a4 size:(unint64_t *)a5
{
  id v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  SecKeyRSAPrivate *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  CFErrorRef error;
  SecKeyRef key;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    error = 0;
    key = 0;
    v17 = 0;
    v8 = SecMPFICreatePrivateAndPublicKeyReadPersistentRef(&v17, (uint64_t *)a4, (uint64_t *)a5, &key, &error);
    v9 = v17;
    if (v8)
    {
      MessageProtectionLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v21 = v8;
        _os_log_impl(&dword_20BABB000, v10, OS_LOG_TYPE_INFO, "Failed to lookup legacy persistent reference for encryption key: %i", buf, 8u);
      }
    }
    else
    {
      objc_msgSend(v7, "setEncryptionKeyPersistentRef:", v9);
      v10 = SecKeyCopyExternalRepresentation(key, &error);
      if (v10)
      {
        v16 = 0;
        v12 = -[SecKeyRSAPrivate initWithData:error:]([SecKeyRSAPrivate alloc], "initWithData:error:", v10, &v16);
        objc_msgSend(v7, "setEncryptionKey:", v12);

        v10 = objc_retainAutorelease(v10);
        memset_s((void *)-[NSObject mutableBytes](v10, "mutableBytes"), -[NSObject length](v10, "length"), 0, -[NSObject length](v10, "length"));
        objc_msgSend(v7, "encryptionKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = v7;
        else
          v14 = 0;
        v11 = v14;

        goto LABEL_12;
      }
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)identityFromV2Bytes:(const char *)a3 size:(unint64_t *)a4 error:(id *)a5
{
  SecMessageLegacyFullIdentity *v9;
  void *v10;
  void *v11;

  v9 = -[SecMessageLegacyFullIdentity initWithEncryptionKey:signingKey:]([SecMessageLegacyFullIdentity alloc], "initWithEncryptionKey:signingKey:", 0, 0);
  -[SecMessageLegacyFullIdentity setIsMigratedV2Key:](v9, "setIsMigratedV2Key:", 1);
  objc_msgSend(a1, "populateIdentity:withSigningKeyFromPersistentRef:size:", v9, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "populateIdentity:withEncryptionKeyFromPersistentRef:size:", v10, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    MPLogAndAssignError(-101, a5, CFSTR("Looking up the persistent reference failed."));
  return v11;
}

- (void)deleteItemWithPersistentRef:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  const __CFDictionary *v6;
  OSStatus v7;
  int v8;
  NSObject *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9558];
  v10[0] = *MEMORY[0x24BDE9220];
  v10[1] = v3;
  v11[0] = *MEMORY[0x24BDE9248];
  v11[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v7 = SecItemDelete(v6);
  if (v7)
  {
    v8 = v7;
    MessageProtectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SecMessageLegacyFullIdentity(Migration) deleteItemWithPersistentRef:].cold.1(v8, v9);

  }
}

- (void)deleteMigratedKeys
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[SecMessageLegacyFullIdentity encryptionKeyPersistentRef](self, "encryptionKeyPersistentRef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecMessageLegacyFullIdentity deleteItemWithPersistentRef:](self, "deleteItemWithPersistentRef:", v3);

  -[SecMessageLegacyFullIdentity signingKeyPersistentRef](self, "signingKeyPersistentRef");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecMessageLegacyFullIdentity deleteItemWithPersistentRef:](self, "deleteItemWithPersistentRef:", v4);

  -[SecMessageLegacyFullIdentity setEncryptionKeyPersistentRef:](self, "setEncryptionKeyPersistentRef:", 0);
  -[SecMessageLegacyFullIdentity setSigningKeyPersistentRef:](self, "setSigningKeyPersistentRef:", 0);
  -[SecMessageLegacyFullIdentity setIsMigratedV2Key:](self, "setIsMigratedV2Key:", 0);
  MessageProtectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20BABB000, v5, OS_LOG_TYPE_INFO, "Migration of a legacy key has completed and previous keys have been deleted.", v6, 2u);
  }

}

- (SecMessageLegacyFullIdentity)initWithEncryptionSecKey:(__SecKey *)a3 signingSecKey:(__SecKey *)a4
{
  CFDataRef v6;
  SecKeyRSAPrivate *v7;
  CFDataRef v8;
  LegacySigningKeyPrivate *v9;
  SecMessageLegacyFullIdentity *v10;

  v6 = SecKeyCopyExternalRepresentation(a3, 0);
  v7 = -[SecKeyRSAPrivate initWithData:error:]([SecKeyRSAPrivate alloc], "initWithData:error:", v6, 0);
  v8 = SecKeyCopyExternalRepresentation(a4, 0);
  v9 = -[LegacySigningKeyPrivate initWithData:error:]([LegacySigningKeyPrivate alloc], "initWithData:error:", v8, 0);
  v10 = -[SecMessageLegacyFullIdentity initWithEncryptionKey:signingKey:](self, "initWithEncryptionKey:signingKey:", v7, v9);

  return v10;
}

- (SecMessageLegacyFullIdentity)initWithProtobufData:(id)a3
{
  id v4;
  NGMPBLegacyKey *v5;
  void *v6;
  void *v7;
  SecMessageLegacyFullIdentity *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = -[NGMPBLegacyKey initWithData:]([NGMPBLegacyKey alloc], "initWithData:", v4);

  if (v5)
  {
    -[NGMPBLegacyKey encryptionKey](v5, "encryptionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMPBLegacyKey signingKey](v5, "signingKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SecMessageLegacyFullIdentity initWithEncryptionKeyData:signingKeyData:](self, "initWithEncryptionKeyData:signingKeyData:", v6, v7);

    v8 = self;
  }
  else
  {
    MessageProtectionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SecMessageLegacyFullIdentity initWithProtobufData:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v8 = 0;
  }

  return v8;
}

- (SecMessageLegacyFullIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4
{
  id v7;
  id v8;
  SecMessageLegacyFullIdentity *v9;
  SecMessageLegacyFullIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecMessageLegacyFullIdentity;
  v9 = -[SecMessageLegacyFullIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionKey, a3);
    objc_storeStrong((id *)&v10->_signingKey, a4);
    v10->_isMigratedV2Key = 0;
  }

  return v10;
}

- (SecMessageLegacyFullIdentity)initWithEncryptionKeyData:(id)a3 signingKeyData:(id)a4
{
  id v6;
  id v7;
  LegacySigningKeyPrivate *v8;
  SecKeyRSAPrivate *v9;
  NSObject *v10;
  SecMessageLegacyFullIdentity *v11;
  NSObject *v12;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = -[LegacySigningKeyPrivate initWithData:error:]([LegacySigningKeyPrivate alloc], "initWithData:error:", v7, 0);

  if (v8)
  {
    v14 = 0;
    v9 = -[SecKeyRSAPrivate initWithData:error:]([SecKeyRSAPrivate alloc], "initWithData:error:", v6, &v14);
    v10 = v14;
    if (v9)
    {
      self = -[SecMessageLegacyFullIdentity initWithEncryptionKey:signingKey:](self, "initWithEncryptionKey:signingKey:", v9, v8);
      v11 = self;
    }
    else
    {
      MessageProtectionLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SecMessageLegacyFullIdentity initWithEncryptionKeyData:signingKeyData:].cold.2(v10);

      v11 = 0;
    }

  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SecMessageLegacyFullIdentity initWithEncryptionKeyData:signingKeyData:].cold.1();
    v11 = 0;
  }

  return v11;
}

+ (id)identity
{
  SecMessageLegacyFullIdentity *v2;
  LegacySigningKeyPrivate *v3;
  void *v4;
  SecKeyRSAPrivate *v5;
  void *v6;
  SecMessageLegacyFullIdentity *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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

  v2 = objc_alloc_init(SecMessageLegacyFullIdentity);
  v3 = objc_alloc_init(LegacySigningKeyPrivate);
  -[SecMessageLegacyFullIdentity setSigningKey:](v2, "setSigningKey:", v3);

  -[SecMessageLegacyFullIdentity signingKey](v2, "signingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    MessageProtectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SecMessageLegacyFullIdentity identity].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_8;
  }
  v5 = objc_alloc_init(SecKeyRSAPrivate);
  -[SecMessageLegacyFullIdentity setEncryptionKey:](v2, "setEncryptionKey:", v5);

  -[SecMessageLegacyFullIdentity encryptionKey](v2, "encryptionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    MessageProtectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SecMessageLegacyFullIdentity identity].cold.2(v8, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v7 = v2;
LABEL_9:

  return v7;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  SecMessageLegacyFullIdentity *v12;
  SecMessageLegacyFullIdentity *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_retainAutorelease(v5);
    v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "length");
    v9 = objc_retainAutorelease(v8);
    v17 = objc_msgSend(v9, "bytes");
    v10 = *v7;
    if (v10 == 2)
    {
      MessageProtectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_20BABB000, v14, OS_LOG_TYPE_INFO, "Parsing a legacy key of version 2.", v16, 2u);
      }

      +[SecMessageLegacyFullIdentity identityFromV2Bytes:size:error:](SecMessageLegacyFullIdentity, "identityFromV2Bytes:size:error:", &v17, &v18, a4);
      v12 = (SecMessageLegacyFullIdentity *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10 != 3)
      {
        MPLogAndAssignError(-100, a4, CFSTR("Failed to parse legacy key format."));
        v13 = 0;
        goto LABEL_13;
      }
      MessageProtectionLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_20BABB000, v11, OS_LOG_TYPE_INFO, "Parsing a legacy key of version 3.", v16, 2u);
      }

      v12 = -[SecMessageLegacyFullIdentity initWithProtobufData:]([SecMessageLegacyFullIdentity alloc], "initWithProtobufData:", v9);
    }
    v13 = v12;
LABEL_13:

    goto LABEL_14;
  }
  MPLogAndAssignError(-100, a4, CFSTR("The passed legacy key representation is of incorrect size."));
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SecMessageLegacyFullIdentity signingKey](self, "signingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SecMessageLegacyFullIdentity encryptionKey](self, "encryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decryptData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dataRepresentationWithError:(id *)a3
{
  NGMPBLegacyKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v4 = objc_alloc_init(NGMPBLegacyKey);
  -[SecMessageLegacyFullIdentity encryptionKey](self, "encryptionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBLegacyKey setEncryptionKey:](v4, "setEncryptionKey:", v6);

  -[SecMessageLegacyFullIdentity signingKey](self, "signingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBLegacyKey setSigningKey:](v4, "setSigningKey:", v8);

  v12 = 3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBLegacyKey data](v4, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendData:", v10);

  if (-[SecMessageLegacyFullIdentity isMigratedV2Key](self, "isMigratedV2Key"))
    -[SecMessageLegacyFullIdentity deleteMigratedKeys](self, "deleteMigratedKeys");

  return v9;
}

- (id)publicIdentity
{
  SecMessageLegacyPublicIdentity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SecMessageLegacyPublicIdentity *v8;

  v3 = [SecMessageLegacyPublicIdentity alloc];
  -[SecMessageLegacyFullIdentity encryptionKey](self, "encryptionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecMessageLegacyFullIdentity signingKey](self, "signingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SecMessageLegacyPublicIdentity initWithEncryptionKey:signingKey:](v3, "initWithEncryptionKey:signingKey:", v5, v7);

  return v8;
}

- (unint64_t)encryptionSize
{
  void *v2;
  unint64_t v3;

  -[SecMessageLegacyFullIdentity publicIdentity](self, "publicIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "encryptionSize");

  return v3;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  const __CFData *v10;
  const __CFData *v11;
  const void *v12;
  _SecMPFullIdentity *v13;
  int v14;
  const __CFData *v15;
  id v17;

  v17 = 0;
  v8 = (void *)MEMORY[0x24BDBCEC8];
  v9 = a4;
  v10 = (const __CFData *)a3;
  objc_msgSend(v8, "data");
  v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)objc_msgSend(v9, "asRef");

  v13 = -[SecMessageLegacyFullIdentity asRef](self, "asRef");
  v14 = SecMPVerifyAndExposeMessage(v10, (uint64_t)v12, (uint64_t)v13, v11, (CFErrorRef *)&v17);

  if (v12)
    CFRelease(v12);
  if (v13)
    CFRelease(v13);
  if (v14)
  {
    v15 = v11;
  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = v17;
  }

  return v15;
}

- (__SecKey)privateSigningKeyForTerminusMigration
{
  void *v2;
  __SecKey *v3;

  -[SecMessageLegacyFullIdentity signingKey](self, "signingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secKeyRef");
  v3 = (__SecKey *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_SecMPFullIdentity)asRef
{
  _SecMPFullIdentity *Instance;
  void *v4;
  __SecKey *v5;
  void *v6;
  __SecKey *v7;

  SecMPFullIdentityGetTypeID();
  Instance = (_SecMPFullIdentity *)_CFRuntimeCreateInstance();
  Instance->var5 = (id)CFRetain(self);
  -[SecMessageLegacyFullIdentity signingKey](self, "signingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secKeyRef");
  v5 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  Instance->var2 = v5;

  -[SecMessageLegacyFullIdentity encryptionKey](self, "encryptionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secKeyRef");
  v7 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  Instance->var4 = v7;

  Instance->var1 = 0;
  Instance->var3 = 0;
  return Instance;
}

- (LegacySigningKeyPrivate)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingKey, a3);
}

- (SecKeyRSAPrivate)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSData)encryptionKeyPersistentRef
{
  return self->_encryptionKeyPersistentRef;
}

- (void)setEncryptionKeyPersistentRef:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKeyPersistentRef, a3);
}

- (NSData)signingKeyPersistentRef
{
  return self->_signingKeyPersistentRef;
}

- (void)setSigningKeyPersistentRef:(id)a3
{
  objc_storeStrong((id *)&self->_signingKeyPersistentRef, a3);
}

- (BOOL)isMigratedV2Key
{
  return self->_isMigratedV2Key;
}

- (void)setIsMigratedV2Key:(BOOL)a3
{
  self->_isMigratedV2Key = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKeyPersistentRef, 0);
  objc_storeStrong((id *)&self->_encryptionKeyPersistentRef, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (void)initWithProtobufData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, a1, a3, "Failed to deserialize the legacy key's protocol buffer.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithEncryptionKeyData:signingKeyData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(0, "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v1, v2, "Failed to initialize signing key: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithEncryptionKeyData:(void *)a1 signingKeyData:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to initialize encryption key: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)identity
{
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, a1, a3, "Failed to generate legacy encryption key.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
