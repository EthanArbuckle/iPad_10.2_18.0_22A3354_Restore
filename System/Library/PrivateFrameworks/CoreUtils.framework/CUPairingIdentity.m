@implementation CUPairingIdentity

- (NSData)altIRK
{
  return self->_altIRK;
}

- (CUPairingIdentity)initWithCoder:(id)a3
{
  id v4;
  CUPairingIdentity *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  CUPairingIdentity *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CUPairingIdentity;
  v5 = -[CUPairingIdentity init](&v16, sel_init);
  if (v5)
  {
    v6 = v4;
    v7 = objc_opt_class();
    NSDecodeObjectIfPresent(v6, CFSTR("altIRK"), v7, (void **)&v5->_altIRK);

    v8 = v6;
    v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, CFSTR("ident"), v9, (void **)&v5->_identifier);

    v10 = v8;
    v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, CFSTR("pk"), v11, (void **)&v5->_publicKey);

    v12 = v10;
    v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, CFSTR("sk"), v13, (void **)&v5->_secretKey);

    v14 = v5;
  }

  return v5;
}

- (void)setRandomKeyPair
{
  NSData *v3;
  NSData *publicKey;
  NSData *v5;
  NSData *secretKey;
  _BYTE v7[32];
  _BYTE v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  cced25519_make_key_pair_compat();
  v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, 32);
  publicKey = self->_publicKey;
  self->_publicKey = v3;

  v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 32);
  secretKey = self->_secretKey;
  self->_secretKey = v5;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *altIRK;
  NSUUID *identifier;
  NSData *publicKey;
  NSData *secretKey;
  id v9;

  v4 = a3;
  altIRK = self->_altIRK;
  v9 = v4;
  if (altIRK)
  {
    objc_msgSend(v4, "encodeObject:forKey:", altIRK, CFSTR("altIRK"));
    v4 = v9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("ident"));
    v4 = v9;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend(v9, "encodeObject:forKey:", publicKey, CFSTR("pk"));
    v4 = v9;
  }
  secretKey = self->_secretKey;
  if (secretKey)
  {
    objc_msgSend(v9, "encodeObject:forKey:", secretKey, CFSTR("sk"));
    v4 = v9;
  }

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSUUID *identifier;
  __CFString *v18;
  NSData *publicKey;
  __CFString *v20;
  NSData *secretKey;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v32;
  NSData *altIRK;
  CFMutableStringRef v34;
  CFMutableStringRef v35;
  CFMutableStringRef v36;
  CFMutableStringRef v37;
  CFMutableStringRef v38;

  v38 = 0;
  NSAppendPrintF(&v38, (uint64_t)"CUPairingIdentity", v2, v3, v4, v5, v6, v7, v32);
  v9 = v38;
  v16 = v9;
  identifier = self->_identifier;
  if (identifier)
  {
    v37 = v9;
    NSAppendPrintF(&v37, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
    v18 = v37;

    v16 = v18;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v36 = v16;
    NSAppendPrintF(&v36, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    v20 = v36;

    v16 = v20;
  }
  secretKey = self->_secretKey;
  if (secretKey)
  {
    v35 = v16;
    v22 = -[NSData length](secretKey, "length");
    NSAppendPrintF(&v35, (uint64_t)", SK %ld", v23, v24, v25, v26, v27, v28, v22);
    v29 = v35;

    v16 = v29;
  }
  if (self->_altIRK)
  {
    altIRK = self->_altIRK;
    v34 = v16;
    NSAppendPrintF(&v34, (uint64_t)", IRK %{mask}", v10, v11, v12, v13, v14, v15, (uint64_t)altIRK);
    v30 = v34;

    v16 = v30;
  }
  return v16;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[64];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  if (-[CUPairingIdentity signDataPtr:dataLen:signatureBytes:error:](self, "signDataPtr:dataLen:signatureBytes:error:", v7, v8, v10, a4))
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v10, 64);
  }
  else
  {
    return 0;
  }
}

- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6
{
  NSData *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSData *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v23;

  v8 = self->_publicKey;
  if (-[NSData length](v8, "length") == 32)
  {
    v14 = self->_secretKey;
    v15 = -[NSData length](v14, "length");
    v21 = v15 == 32;
    if (v15 == 32)
    {
      -[NSData bytes](objc_retainAutorelease(v8), "bytes");
      -[NSData bytes](objc_retainAutorelease(v14), "bytes");
      ccsha512_di();
      cced25519_sign();
    }
    else if (a6)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294896142, (uint64_t)"No EdSK", v16, v17, v18, v19, v20, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a6)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294896141, (uint64_t)"No EdPK", v9, v10, v11, v12, v13, v23);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  return -[CUPairingIdentity verifySignaturePtr:signatureLen:dataPtr:dataLen:error:](self, "verifySignaturePtr:signatureLen:dataPtr:dataLen:error:", v11, v12, v14, v15, a5);
}

- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7;
  NSData *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v21;

  if (a4 == 64)
  {
    v9 = self->_publicKey;
    if (-[NSData length](v9, "length") == 32)
    {
      -[NSData bytes](objc_retainAutorelease(v9), "bytes");
      ccsha512_di();
      v15 = cced25519_verify();
      v16 = v15 == 0;
      if (!a7 || !v15)
        goto LABEL_13;
      v17 = (void *)*MEMORY[0x1E0CB2F90];
      v18 = "Signature verify failed";
      v19 = 4294960542;
    }
    else
    {
      if (!a7)
      {
        v16 = 0;
        goto LABEL_13;
      }
      v17 = (void *)*MEMORY[0x1E0CB2F90];
      v18 = "No EdPK";
      v19 = 4294896141;
    }
    NSErrorF_safe(v17, v19, (uint64_t)v18, v10, v11, v12, v13, v14, v21);
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    return v16;
  }
  if (!a7)
    return 0;
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960580, (uint64_t)"Bad signature size (%zu)", a4, (uint64_t)a5, a6, (uint64_t)a7, v7, a4);
  v16 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v16;
}

- (void)setAltIRK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)secretKey
{
  return self->_secretKey;
}

- (void)setSecretKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secretKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_altIRK, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
