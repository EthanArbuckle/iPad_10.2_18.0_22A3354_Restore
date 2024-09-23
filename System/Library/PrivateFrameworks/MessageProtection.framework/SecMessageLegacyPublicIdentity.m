@implementation SecMessageLegacyPublicIdentity

- (SecMessageLegacyPublicIdentity)initWithEncryptionKey:(id)a3 signingKey:(id)a4
{
  id v7;
  id v8;
  SecMessageLegacyPublicIdentity *v9;
  SecMessageLegacyPublicIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecMessageLegacyPublicIdentity;
  v9 = -[SecMessageLegacyPublicIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingKey, a4);
    objc_storeStrong((id *)&v10->_encryptionKey, a3);
  }

  return v10;
}

+ (id)identityWithIdentityData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LegacySigningKeyPublic *v10;
  void *v11;
  SecKeyRSAPublic *v12;
  void *v13;
  SecKeyRSAPublic *v14;
  SecMessageLegacyPublicIdentity *v15;

  v5 = a3;
  objc_msgSend(v5, "length");
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "bytes");

  if (!ccder_decode_sequence_tl())
    return 0;
  v7 = ccder_decode_tl();
  if (!v7)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lengthValidatedBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[LegacySigningKeyPublic initWithData:error:]([LegacySigningKeyPublic alloc], "initWithData:error:", v9, a4);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", ccder_decode_tl(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [SecKeyRSAPublic alloc];
    objc_msgSend(v11, "lengthValidatedBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SecKeyRSAPublic initWithData:error:](v12, "initWithData:error:", v13, a4);

    if (v14)
      v15 = -[SecMessageLegacyPublicIdentity initWithEncryptionKey:signingKey:]([SecMessageLegacyPublicIdentity alloc], "initWithEncryptionKey:signingKey:", v14, v10);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)identityData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecMessageLegacyPublicIdentity signingKey](self, "signingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDataAndSize:", v6);

  -[SecMessageLegacyPublicIdentity encryptionKey](self, "encryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDataAndSize:", v8);

  objc_msgSend(v3, "length");
  ccder_sizeof();
  objc_msgSend(v4, "length");
  ccder_sizeof();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", ccder_sizeof());
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "mutableBytes");
  objc_msgSend(v3, "length");
  v11 = objc_retainAutorelease(v3);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v4, "length");
  v12 = objc_retainAutorelease(v4);
  objc_msgSend(v12, "bytes");
  ccder_encode_implicit_raw_octet_string();
  ccder_encode_implicit_raw_octet_string();
  if (ccder_encode_constructed_tl() == v10)
    v13 = v9;
  else
    v13 = 0;

  return v13;
}

- (id)encryptData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SecMessageLegacyPublicIdentity encryptionKey](self, "encryptionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encryptData:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  const __CFData *v10;
  const __CFData *v11;
  _SecMPPublicIdentity *v12;
  const void *v13;
  const __CFData *v14;
  id v16;

  v16 = 0;
  v8 = (void *)MEMORY[0x24BDBCEC8];
  v9 = a4;
  v10 = (const __CFData *)a3;
  objc_msgSend(v8, "data");
  v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v12 = -[SecMessageLegacyPublicIdentity asRef](self, "asRef");
  v13 = (const void *)objc_msgSend(v9, "asRef");

  LODWORD(v9) = SecMPSignAndProtectMessage(v10, (uint64_t)v13, (uint64_t)v12, v11, (CFErrorRef *)&v16);
  CFRelease(v12);
  CFRelease(v13);
  if ((_DWORD)v9)
  {
    v14 = v11;
  }
  else
  {
    v14 = 0;
    if (a5)
      *a5 = v16;
  }

  return v14;
}

- (id)publicIDHash
{
  void *v3;
  id v4;
  const void *v5;
  CC_LONG v6;
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 20);
  -[SecMessageLegacyPublicIdentity identityData](self, "identityData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = objc_retainAutorelease(v3);
  CC_SHA1(v5, v6, (unsigned __int8 *)objc_msgSend(v7, "mutableBytes"));

  return v7;
}

- (id)publicIDCanonicalHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const void *v10;
  id v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecMessageLegacyPublicIdentity signingKey](self, "signingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDataAndSize:", v6);

  -[SecMessageLegacyPublicIdentity encryptionKey](self, "encryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDataAndSize:", v8);

  v9 = objc_retainAutorelease(v4);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  LODWORD(v8) = objc_msgSend(v9, "length");
  v11 = objc_retainAutorelease(v3);
  CC_SHA256(v10, (CC_LONG)v8, (unsigned __int8 *)objc_msgSend(v11, "mutableBytes"));

  return v11;
}

- (unint64_t)encryptionSize
{
  void *v2;
  void *v3;
  unint64_t Size;

  -[SecMessageLegacyPublicIdentity encryptionKey](self, "encryptionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secKeyRef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Size = SecKeyGetSize();

  return Size;
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[SecMessageLegacyPublicIdentity signingKey](self, "signingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verifySignature:ofData:", v7, v6);

  return v9;
}

- (_SecMPPublicIdentity)asRef
{
  _SecMPPublicIdentity *Instance;
  void *v4;
  __SecKey *v5;
  void *v6;
  __SecKey *v7;

  SecMPPublicIdentityGetTypeID();
  Instance = (_SecMPPublicIdentity *)_CFRuntimeCreateInstance();
  Instance->var3 = (id)CFRetain(self);
  -[SecMessageLegacyPublicIdentity encryptionKey](self, "encryptionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secKeyRef");
  v5 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  Instance->var2 = v5;

  -[SecMessageLegacyPublicIdentity signingKey](self, "signingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secKeyRef");
  v7 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  Instance->var1 = v7;

  return Instance;
}

- (__SecKey)publicSigningKeyForTerminusMigration
{
  void *v2;
  __SecKey *v3;

  -[SecMessageLegacyPublicIdentity signingKey](self, "signingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secKeyRef");
  v3 = (__SecKey *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (LegacySigningKeyPublic)signingKey
{
  return self->_signingKey;
}

- (SecKeyRSAPublic)encryptionKey
{
  return self->_encryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

@end
