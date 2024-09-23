@implementation NEIKEv2EncryptedKeyIDIdentifier

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5
{
  id v9;
  NEIKEv2EncryptedKeyIDIdentifier *v10;
  const char *v11;
  id *p_isa;
  NEIKEv2EncryptedKeyIDIdentifier *v13;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a5)
  {
    v10 = -[NEIKEv2KeyIDIdentifier initWithKeyID:](self, "initWithKeyID:", a3);
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_setProperty_nonatomic(v10, v11, a5, 16);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = 136315138;
      v17 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyID:aad:keyRef:]";
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "%s called with null keyRef", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyID:(id)a3 aad:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NEIKEv2EncryptedKeyIDIdentifier *v12;
  NEIKEv2EncryptedKeyIDIdentifier *v13;
  NSObject *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v13 = 0;
      goto LABEL_4;
    }
    v17 = 136315138;
    v18 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyID:aad:key:]";
    v16 = "%s called with null key";
LABEL_10:
    _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v17, 0xCu);
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "length") != 32)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v17 = 134217984;
    v18 = (const char *)objc_msgSend(v11, "length");
    v16 = "Invalid key length %tu!";
    goto LABEL_10;
  }
  v12 = -[NEIKEv2KeyIDIdentifier initWithKeyID:](self, "initWithKeyID:", v8);
  -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v12, v11);
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v12, v9);
  self = v12;
  v13 = self;
LABEL_4:

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 keyRef:(__SecKey *)a5
{
  id v9;
  NEIKEv2EncryptedKeyIDIdentifier *v10;
  const char *v11;
  id *p_isa;
  NEIKEv2EncryptedKeyIDIdentifier *v13;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a5)
  {
    v10 = -[NEIKEv2KeyIDIdentifier initWithKeyIDString:](self, "initWithKeyIDString:", a3);
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      objc_setProperty_nonatomic(v10, v11, a5, 16);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = 136315138;
      v17 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyIDString:aad:keyRef:]";
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "%s called with null keyRef", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (NEIKEv2EncryptedKeyIDIdentifier)initWithKeyIDString:(id)a3 aad:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NEIKEv2EncryptedKeyIDIdentifier *v12;
  NEIKEv2EncryptedKeyIDIdentifier *v13;
  NSObject *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v13 = 0;
      goto LABEL_4;
    }
    v17 = 136315138;
    v18 = "-[NEIKEv2EncryptedKeyIDIdentifier initWithKeyIDString:aad:key:]";
    v16 = "%s called with null key";
LABEL_10:
    _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)&v17, 0xCu);
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "length") != 32)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v17 = 134217984;
    v18 = (const char *)objc_msgSend(v11, "length");
    v16 = "Invalid key length %tu!";
    goto LABEL_10;
  }
  v12 = -[NEIKEv2KeyIDIdentifier initWithKeyIDString:](self, "initWithKeyIDString:", v8);
  -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v12, v11);
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v12, v9);
  self = v12;
  v13 = self;
LABEL_4:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_setProperty_nonatomic(self, a2, 0, 16);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  -[NEIKEv2EncryptedKeyIDIdentifier dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  void *v6;
  __SecKey *keyRef;
  NSData *aad;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  v4 = -[NEIKEv2Identifier copyWithZone:](&v10, sel_copyWithZone_, a3);
  v6 = v4;
  if (self)
  {
    keyRef = self->_keyRef;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  keyRef = 0;
  if (v4)
LABEL_3:
    objc_setProperty_nonatomic(v4, v5, keyRef, 16);
LABEL_4:
  if (self)
  {
    -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v6, self->_keyData);
    aad = self->_aad;
  }
  else
  {
    -[NEIKEv2EncryptedKeyIDIdentifier setKeyData:]((uint64_t)v6, 0);
    aad = 0;
  }
  -[NEIKEv2EncryptedKeyIDIdentifier setAad:]((uint64_t)v6, aad);
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSData *keyData;
  NSData *aad;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  v3 = -[NEIKEv2Identifier hash](&v10, sel_hash);
  if (self)
  {
    if (self->_keyRef)
    {
      v4 = (void *)SecKeyCopyPublicKeyHash();
      v5 = objc_msgSend(v4, "hash");

      v6 = v5 ^ v3;
      goto LABEL_6;
    }
    keyData = self->_keyData;
  }
  else
  {
    keyData = 0;
  }
  v6 = -[NSData hash](keyData, "hash") ^ v3;
  if (!self)
  {
    aad = 0;
    return -[NSData hash](aad, "hash") ^ v6;
  }
LABEL_6:
  aad = self->_aad;
  return -[NSData hash](aad, "hash") ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *aad;
  NSData *v7;
  void *v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  uint64_t v12;
  NSData *v13;
  int v14;
  BOOL v15;
  NSData *v16;
  uint64_t v17;
  NSData *keyData;
  uint64_t v19;
  NSData *v20;
  __SecKey *keyRef;
  const void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NEIKEv2EncryptedKeyIDIdentifier;
  if (-[NEIKEv2Identifier isEqual:](&v24, sel_isEqual_, v4))
  {
    v5 = v4;
    if (self)
      aad = self->_aad;
    else
      aad = 0;
    v7 = aad;
    if (v5)
      v8 = (void *)v5[4];
    else
      v8 = 0;
    v9 = v8;
    if (v7 == v9)
    {

      if (!self)
        goto LABEL_28;
      goto LABEL_15;
    }
    v10 = v9;
    if (self)
    {
      v11 = self->_aad;
      if (v5)
      {
LABEL_9:
        v12 = v5[4];
LABEL_10:
        v13 = v11;
        v14 = -[NSData isEqual:](v13, "isEqual:", v12);

        v15 = 0;
        if (!v14 || !self)
          goto LABEL_29;
LABEL_15:
        v16 = self->_keyData;
        if (v16)
        {
          if (!v5)
          {

            goto LABEL_28;
          }
          v17 = v5[3];

          if (v17)
          {
            keyData = self->_keyData;
            v19 = v5[3];
            v20 = keyData;
            v15 = -[NSData isEqualToData:](v20, "isEqualToData:", v19);

LABEL_29:
            goto LABEL_30;
          }
        }
        v15 = 0;
        if (!v5)
          goto LABEL_29;
        keyRef = self->_keyRef;
        if (!keyRef)
          goto LABEL_29;
        v22 = (const void *)v5[2];
        if (v22)
        {
          v15 = CFEqual(keyRef, v22) != 0;
          goto LABEL_29;
        }
LABEL_28:
        v15 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v11 = 0;
      if (v5)
        goto LABEL_9;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v15 = 0;
LABEL_30:

  return v15;
}

- (id)decryptWithSession:(id)a3 returnError:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v10;
  _BYTE *v11;
  NEIKEv2EncryptedKeyIDIdentifier *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *ErrorPeerInvalidSyntax;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v29;
  void *v30;
  NSData *v31;
  NSData *keyData;
  NSData *v33;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v34;
  __SecKey *keyRef;
  id ErrorInternal;
  id v37;
  uint64_t v39;
  id obj;
  id location;

  if (!a3 || (v10 = objc_getProperty(a3, a2, 336, 1)) == 0)
  {
    ErrorInternal = (id)NEIKEv2CreateErrorInternal(CFSTR("Missing IKE SA"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v39);
    v11 = 0;
    v25 = 0;
    if (!a4)
      goto LABEL_23;
    goto LABEL_22;
  }
  v11 = v10;
  v12 = self;
  location = 0;
  -[NEIKEv2Identifier identifierData](v12, "identifierData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14 <= 0x20)
  {
    -[NEIKEv2Identifier identifierData](v12, "identifierData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Encrypted identifier length %u too short"), v17, v18, v19, v20, v21, v22, v23, v16);
    location = ErrorPeerInvalidSyntax;

    v25 = 0;
    goto LABEL_18;
  }
  v26 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v11, (char *)&location);
  if (!v26)
  {
    v25 = 0;
    goto LABEL_17;
  }
  v27 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v11, (char *)&location);
  if (!v27)
  {
    v25 = 0;
    goto LABEL_16;
  }
  if (v12)
    v28 = v12->_keyRef == 0;
  else
    v28 = 1;
  v29 = [_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE alloc];
  -[NEIKEv2Identifier identifierData](v12, "identifierData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v31 = 0;
    keyRef = 0;
    keyData = 0;
    if (v28)
      goto LABEL_12;
LABEL_14:
    v34 = -[NEIKEv2CryptoKitHPKE initWithPayload:aad:psk:pskID:keyRef:](v29, "initWithPayload:aad:psk:pskID:keyRef:", v30, v31, v27, v26, keyRef);
    goto LABEL_15;
  }
  v31 = v12->_aad;
  if (!v28)
  {
    keyRef = v12->_keyRef;
    goto LABEL_14;
  }
  keyData = v12->_keyData;
LABEL_12:
  v33 = keyData;
  v34 = -[NEIKEv2CryptoKitHPKE initWithPayload:aad:psk:pskID:keyData:](v29, "initWithPayload:aad:psk:pskID:keyData:", v30, v31, v27, v26, v33);

LABEL_15:
  obj = location;
  -[NEIKEv2CryptoKitHPKE performHPKEOpenAndReturnError:](v34, "performHPKEOpenAndReturnError:", &obj);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&location, obj);

LABEL_16:
LABEL_17:

  ErrorPeerInvalidSyntax = location;
LABEL_18:
  ErrorInternal = ErrorPeerInvalidSyntax;
  if (ErrorInternal)
  {

    v25 = 0;
    v37 = location;
  }
  else
  {
    v37 = 0;
  }

  if (a4)
LABEL_22:
    *a4 = objc_retainAutorelease(ErrorInternal);
LABEL_23:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aad, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

- (void)setKeyData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setAad:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

+ (id)copyTypeDescription
{
  return CFSTR("KeyID (Encrypted)");
}

@end
