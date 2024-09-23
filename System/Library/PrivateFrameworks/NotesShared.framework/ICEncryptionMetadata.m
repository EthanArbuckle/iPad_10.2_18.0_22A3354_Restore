@implementation ICEncryptionMetadata

+ (id)makeForV1CipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v9;
  id v10;
  id v11;
  ICEncryptionMetadata *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[ICEncryptionMetadata initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:]([ICEncryptionMetadata alloc], "initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:", 0, v11, v10, a5, v9, 0);

  return v12;
}

+ (id)makeForV1NeoCipherWithObjectIdentifier:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v9;
  id v10;
  id v11;
  ICEncryptionMetadata *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[ICEncryptionMetadata initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:]([ICEncryptionMetadata alloc], "initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:", 2, v11, v10, a5, v9, 0);

  return v12;
}

+ (id)makeForV1NeoSidecarCipherWithObjectIdentifier:(id)a3
{
  id v3;
  ICEncryptionMetadata *v4;

  v3 = a3;
  v4 = -[ICEncryptionMetadata initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:]([ICEncryptionMetadata alloc], "initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:", 3, v3, 0, 0, 0, 0);

  return v4;
}

+ (id)makeForV2CipherWithObjectIdentifier:(id)a3 accountKeyIdentifier:(id)a4
{
  id v5;
  id v6;
  ICEncryptionMetadata *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ICEncryptionMetadata initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:]([ICEncryptionMetadata alloc], "initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:", 1, v6, 0, 0, 0, v5);

  return v7;
}

+ (id)makeFromMetadata:(id)a3 forObjectIdentifier:(id)a4
{
  id v5;
  id v6;
  ICEncryptionMetadata *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ICEncryptionMetadata *v13;

  v5 = a4;
  v6 = a3;
  v7 = [ICEncryptionMetadata alloc];
  v8 = objc_msgSend(v6, "cipherVersion");
  objc_msgSend(v6, "passphraseSalt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "passphraseIterationCount");
  objc_msgSend(v6, "passphraseHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountKeyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ICEncryptionMetadata initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:](v7, "initWithCipherVersion:objectIdentifier:passphraseSalt:passphraseIterationCount:passphraseHint:accountKeyIdentifier:", v8, v5, v9, v10, v11, v12);
  return v13;
}

- (ICEncryptionMetadata)initWithCipherVersion:(int64_t)a3 objectIdentifier:(id)a4 passphraseSalt:(id)a5 passphraseIterationCount:(unint64_t)a6 passphraseHint:(id)a7 accountKeyIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ICEncryptionMetadata *v18;
  ICEncryptionMetadata *v19;
  uint64_t v20;
  NSString *objectIdentifier;
  uint64_t v22;
  NSData *passphraseSalt;
  uint64_t v24;
  NSString *passphraseHint;
  uint64_t v26;
  NSString *accountKeyIdentifier;
  ICEncryptionMetadata *v28;
  objc_super v30;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ICEncryptionMetadata;
  v18 = -[ICEncryptionMetadata init](&v30, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_4;
  v18->_cipherVersion = a3;
  v20 = objc_msgSend(v14, "copy");
  objectIdentifier = v19->_objectIdentifier;
  v19->_objectIdentifier = (NSString *)v20;

  v22 = objc_msgSend(v15, "copy");
  passphraseSalt = v19->_passphraseSalt;
  v19->_passphraseSalt = (NSData *)v22;

  v19->_passphraseIterationCount = a6;
  v24 = objc_msgSend(v16, "copy");
  passphraseHint = v19->_passphraseHint;
  v19->_passphraseHint = (NSString *)v24;

  v26 = objc_msgSend(v17, "copy");
  accountKeyIdentifier = v19->_accountKeyIdentifier;
  v19->_accountKeyIdentifier = (NSString *)v26;

  if (!-[ICEncryptionMetadata validate](v19, "validate"))
    goto LABEL_5;
  if (-[ICEncryptionMetadata serialize](v19, "serialize"))
LABEL_4:
    v28 = v19;
  else
LABEL_5:
    v28 = 0;

  return v28;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCipherNameForCipherVersion(-[ICEncryptionMetadata cipherVersion](self, "cipherVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionMetadata objectIdentifier](self, "objectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionMetadata passphraseSalt](self, "passphraseSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_sha256");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICEncryptionMetadata passphraseIterationCount](self, "passphraseIterationCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionMetadata passphraseHint](self, "passphraseHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionMetadata accountKeyIdentifier](self, "accountKeyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, cipherVersion: %@, objectIdentifier: %@, passphraseSalt.sha256: %@, passphraseIterationCount: %@, passphraseHint: %@, accountKeyIdentifier: %@>"), v5, self, v6, v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  void *v41;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "cipherVersion");
    if (v6 != -[ICEncryptionMetadata cipherVersion](self, "cipherVersion"))
    {
      LOBYTE(v22) = 0;
LABEL_56:

      return v22;
    }
    objc_msgSend(v5, "objectIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICEncryptionMetadata objectIdentifier](self, "objectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v7)
      v10 = 0;
    else
      v10 = v7;
    v11 = v10;
    if (v9 == v8)
      v12 = 0;
    else
      v12 = v8;
    v13 = v12;
    if (v11 | v13)
    {
      v14 = (void *)v13;
      if (v11)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
        goto LABEL_48;
      v16 = objc_msgSend((id)v11, "isEqual:", v13);

      if (!v16)
      {
        LOBYTE(v22) = 0;
LABEL_55:

        goto LABEL_56;
      }
    }
    objc_msgSend(v5, "passphraseSalt");
    v11 = objc_claimAutoreleasedReturnValue();
    -[ICEncryptionMetadata passphraseSalt](self, "passphraseSalt");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v11)
      v17 = 0;
    else
      v17 = (void *)v11;
    v18 = v17;
    if (v9 == v14)
      v19 = 0;
    else
      v19 = v14;
    v20 = v19;
    if (v18 | v20)
    {
      v21 = (void *)v20;
      LOBYTE(v22) = 0;
      if (!v18 || !v20)
        goto LABEL_53;
      LODWORD(v22) = objc_msgSend((id)v18, "isEqual:", v20);

      if (!(_DWORD)v22)
      {
LABEL_54:

        goto LABEL_55;
      }
    }
    v23 = objc_msgSend(v5, "passphraseIterationCount");
    if (v23 == -[ICEncryptionMetadata passphraseIterationCount](self, "passphraseIterationCount"))
    {
      objc_msgSend(v5, "passphraseHint");
      v18 = objc_claimAutoreleasedReturnValue();
      -[ICEncryptionMetadata passphraseHint](self, "passphraseHint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == (void *)v18)
        v24 = 0;
      else
        v24 = (void *)v18;
      v22 = v24;
      if (v9 == v21)
        v25 = 0;
      else
        v25 = v21;
      v26 = v25;
      if (v22 | v26)
      {
        v27 = (void *)v26;
        v28 = (void *)v22;
        LOBYTE(v22) = 0;
        v41 = v28;
        if (!v28 || !v26)
        {
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        v29 = (void *)v26;
        LODWORD(v39) = objc_msgSend(v28, "isEqual:", v26);

        if (!(_DWORD)v39)
        {
          LOBYTE(v22) = 0;
          goto LABEL_53;
        }
      }
      objc_msgSend(v5, "accountKeyIdentifier", v39);
      v30 = objc_claimAutoreleasedReturnValue();
      -[ICEncryptionMetadata accountKeyIdentifier](self, "accountKeyIdentifier");
      v31 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v30;
      if (v9 == (void *)v30)
        v32 = 0;
      else
        v32 = (void *)v30;
      v22 = v32;
      v40 = (void *)v31;
      if (v9 == (void *)v31)
        v33 = 0;
      else
        v33 = (void *)v31;
      v34 = v33;
      v35 = (void *)v34;
      if (v22 | v34)
      {
        v36 = (void *)v22;
        LOBYTE(v22) = 0;
        v37 = v36;
        if (v36 && v34)
          LOBYTE(v22) = objc_msgSend(v36, "isEqual:", v34);
      }
      else
      {
        v37 = (void *)v22;
        LOBYTE(v22) = 1;
      }

      v27 = v40;
      goto LABEL_52;
    }
LABEL_48:
    LOBYTE(v22) = 0;
    goto LABEL_54;
  }
  LOBYTE(v22) = 1;
  return v22;
}

- (unint64_t)hash
{
  unint64_t result;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICEncryptionMetadata cipherVersion](self, "cipherVersion");
    -[ICEncryptionMetadata objectIdentifier](self, "objectIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "hash");

    }
    -[ICEncryptionMetadata passphraseSalt](self, "passphraseSalt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hash");

    }
    v10 = v4 + 1;
    -[ICEncryptionMetadata passphraseIterationCount](self, "passphraseIterationCount");
    -[ICEncryptionMetadata passphraseHint](self, "passphraseHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hash");

    }
    -[ICEncryptionMetadata accountKeyIdentifier](self, "accountKeyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "hash"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = v6;
      v6 = (uint64_t)v8;
      v21 = v10;
      v22 = v5;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hash");

      v5 = v22;
      v10 = v21;
      v8 = (void *)v6;
      LOBYTE(v6) = v24;
    }
    self->_hash = ICHashWithHashKeys(v10, v14, v15, v16, v17, v18, v19, v20, v6);

    return self->_hash;
  }
  return result;
}

- (ICEncryptionMetadata)initWithSerializedData:(id)a3 authenticatedData:(id)a4
{
  id v6;
  id v7;
  ICEncryptionMetadata *v8;
  ICEncryptionMetadata *v9;
  ICEncryptionMetadata *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICEncryptionMetadata;
  v8 = -[ICEncryptionMetadata init](&v12, sel_init);
  v9 = v8;
  if (!v8
    || -[ICEncryptionMetadata deserializeWithData:authenticatedData:](v8, "deserializeWithData:authenticatedData:", v6, v7)&& -[ICEncryptionMetadata validate](v9, "validate"))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSData *v7;
  id v8;
  NSData *serializedData;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSData *v14;
  id v15;
  NSData *authenticatedData;
  NSData *v17;
  BOOL v18;
  NSObject *v19;
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_passphraseSalt, CFSTR("passphraseSalt"));
  if (self->_passphraseIterationCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_setNonNilObject:forKey:", v4, CFSTR("passphraseIterationCount"));

  }
  else
  {
    objc_msgSend(v3, "ic_setNonNilObject:forKey:", 0, CFSTR("passphraseIterationCount"));
  }
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_passphraseHint, CFSTR("passphraseHint"));
  v5 = (void *)MEMORY[0x1E0CB38B0];
  v6 = (void *)objc_msgSend(v3, "copy");
  v22 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v22);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  serializedData = self->_serializedData;
  self->_serializedData = v7;

  if (self->_serializedData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cipherVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject ic_setNonNilObject:forKey:](v10, "ic_setNonNilObject:forKey:", v11, CFSTR("cipherVersion"));

    -[NSObject ic_setNonNilObject:forKey:](v10, "ic_setNonNilObject:forKey:", self->_objectIdentifier, CFSTR("objectIdentifier"));
    -[NSObject ic_setNonNilObject:forKey:](v10, "ic_setNonNilObject:forKey:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));
    v12 = (void *)MEMORY[0x1E0CB38B0];
    v13 = -[NSObject copy](v10, "copy");
    v21 = 0;
    objc_msgSend(v12, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v21);
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    authenticatedData = self->_authenticatedData;
    self->_authenticatedData = v14;

    v17 = self->_authenticatedData;
    v18 = v17 != 0;
    if (!v17)
    {
      v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata serialize].cold.2();

      v18 = 0;
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICEncryptionMetadata serialize].cold.1();
    v18 = 0;
    v15 = v8;
  }

  return v18;
}

- (BOOL)deserializeWithData:(id)a3 authenticatedData:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  NSData *v17;
  NSData *passphraseSalt;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *passphraseHint;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *objectIdentifier;
  NSObject *v29;
  NSString *v30;
  NSString *accountKeyIdentifier;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = 0;
  }
  else
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", MEMORY[0x1E0C9AA70], 200, 0, &v35);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v35;

    if (!v9)
    {
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata deserializeWithData:authenticatedData:].cold.1();
      v6 = 0;
      goto LABEL_17;
    }
    v6 = (id)v9;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICEncryptionMetadata deserializeWithData:authenticatedData:].cold.2();
LABEL_17:
    v15 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v34;

  ICCheckedDynamicCast();
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;

    ICCheckedDynamicCast();
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = v14 != 0;
    if (v14)
    {
      objc_storeStrong((id *)&self->_serializedData, v6);
      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("passphraseSalt"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v17 = (NSData *)objc_claimAutoreleasedReturnValue();
      passphraseSalt = self->_passphraseSalt;
      self->_passphraseSalt = v17;

      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("passphraseIterationCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self->_passphraseIterationCount = objc_msgSend(v20, "unsignedIntegerValue");

      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("passphraseHint"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      passphraseHint = self->_passphraseHint;
      self->_passphraseHint = v22;

      objc_storeStrong((id *)&self->_authenticatedData, a4);
      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("cipherVersion"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cipherVersion = objc_msgSend(v25, "unsignedIntegerValue");

      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("objectIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      objectIdentifier = self->_objectIdentifier;
      self->_objectIdentifier = v27;

      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("accountKeyIdentifier"));
      v29 = objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      accountKeyIdentifier = self->_accountKeyIdentifier;
      self->_accountKeyIdentifier = v30;

    }
    else
    {
      v29 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata deserializeWithData:authenticatedData:].cold.4();
    }

  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICEncryptionMetadata deserializeWithData:authenticatedData:].cold.3();
    v15 = 0;
    v8 = v11;
  }

LABEL_22:
  return v15;
}

- (BOOL)validate
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  switch(-[ICEncryptionMetadata cipherVersion](self, "cipherVersion"))
  {
    case 0:
      -[ICEncryptionMetadata passphraseSalt](self, "passphraseSalt");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "length");

      if (v4)
        return 1;
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata validate].cold.2();
      goto LABEL_24;
    case 1:
      -[ICEncryptionMetadata accountKeyIdentifier](self, "accountKeyIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        return 1;
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata validate].cold.7();
      goto LABEL_24;
    case 2:
      -[ICEncryptionMetadata objectIdentifier](self, "objectIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[ICEncryptionMetadata passphraseSalt](self, "passphraseSalt");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          if (-[ICEncryptionMetadata passphraseIterationCount](self, "passphraseIterationCount"))
            return 1;
          v5 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            -[ICEncryptionMetadata validate].cold.5();
        }
        else
        {
          v5 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            -[ICEncryptionMetadata validate].cold.4();
        }
      }
      else
      {
        v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[ICEncryptionMetadata validate].cold.3();
      }
LABEL_24:
      v6 = 0;
LABEL_25:

      return v6;
    case 3:
      -[ICEncryptionMetadata objectIdentifier](self, "objectIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
        return 1;
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata validate].cold.6();
      goto LABEL_24;
    default:
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICEncryptionMetadata validate].cold.1();
      v6 = 1;
      goto LABEL_25;
  }
}

- (int64_t)cipherVersion
{
  return self->_cipherVersion;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSData)passphraseSalt
{
  return self->_passphraseSalt;
}

- (unint64_t)passphraseIterationCount
{
  return self->_passphraseIterationCount;
}

- (NSString)passphraseHint
{
  return self->_passphraseHint;
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (NSData)authenticatedData
{
  return self->_authenticatedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedData, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_passphraseHint, 0);
  objc_storeStrong((id *)&self->_passphraseSalt, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

- (void)serialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot encode authenticated encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deserializeWithData:authenticatedData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot encode empty encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deserializeWithData:authenticatedData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Cannot decode empty authenticated encryption metadata — failing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deserializeWithData:authenticatedData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot decode encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deserializeWithData:authenticatedData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot decode authenticated encryption metadata — failing {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)validate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Cipher v2 doesn't have account key identifier — failing encryption metadata validation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
