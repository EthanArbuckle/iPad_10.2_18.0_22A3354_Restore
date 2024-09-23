@implementation SecJWSEncoder

- (SecJWSEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SecJWSEncoder;
  return -[SecJWSEncoder init](&v3, sel_init);
}

- (SecJWSEncoder)initWithPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4
{
  SecJWSEncoder *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecJWSEncoder;
  result = -[SecJWSEncoder init](&v7, sel_init);
  if (result)
  {
    result->_publicKey = a3;
    result->_privateKey = a4;
  }
  return result;
}

- (void)dealloc
{
  __SecKey *publicKey;
  __SecKey *privateKey;
  objc_super v5;

  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0;
    CFRelease(privateKey);
  }
  v5.receiver = self;
  v5.super_class = (Class)SecJWSEncoder;
  -[SecJWSEncoder dealloc](&v5, sel_dealloc);
}

- (id)createKeyPair
{
  const __CFDictionary *v3;
  __SecKey *RandomKey;
  __SecKey *v5;
  __SecKey *privateKey;
  __SecKey *publicKey;
  CFErrorRef v8;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11[0] = CFSTR("type");
  v11[1] = CFSTR("bsiz");
  v12[0] = CFSTR("73");
  v12[1] = &unk_1E1FFEF68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  RandomKey = SecKeyCreateRandomKey(v3, (CFErrorRef *)&v10);
  self->_privateKey = RandomKey;
  if (RandomKey)
  {
    v5 = SecKeyCopyPublicKey(RandomKey);
    self->_publicKey = v5;
    if (self->_privateKey)
    {
      if ((unint64_t)v5 | v10)
      {
        if (!v10)
          goto LABEL_12;
LABEL_8:
        privateKey = self->_privateKey;
        if (privateKey)
        {
          self->_privateKey = 0;
          CFRelease(privateKey);
        }
        goto LABEL_10;
      }
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -26275, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_12;
      goto LABEL_8;
    }
  }
  if (!v10)
    goto LABEL_7;
LABEL_10:
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
LABEL_12:
  v8 = (CFErrorRef)v10;

  return v8;
}

- (id)jwkPublicKey
{
  CFDataRef v3;
  const __CFData *v4;
  _BYTE *v5;
  BOOL v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CFErrorRef v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v3 = SecKeyCopyExternalRepresentation(self->_publicKey, &v17);
  if (!v3)
    return 0;
  v4 = objc_retainAutorelease(v3);
  v5 = (_BYTE *)-[__CFData bytes](v4, "bytes");
  v6 = (unint64_t)-[__CFData length](v4, "length") < 0x41 || v5 == 0;
  if (v6 || *v5 != 4)
  {
    v14 = 0;
  }
  else
  {
    v7 = v5 + 1;
    v8 = -[__CFData length](v4, "length") - 1;
    v9 = -[__CFData length](v4, "length") + ~(v8 >> 1);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5 + 1, v8 >> 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7[v8 >> 1], v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self, "base64URLEncodedStringRepresentationWithData:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self, "base64URLEncodedStringRepresentationWithData:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("kty");
    v18[1] = CFSTR("crv");
    v19[0] = CFSTR("EC");
    v19[1] = CFSTR("P-256");
    v18[2] = CFSTR("x");
    v18[3] = CFSTR("y");
    v19[2] = v12;
    v19[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  CFRelease(v4);
  v15 = v14;

  return v15;
}

- (BOOL)appendPaddedToData:(id)a3 ptr:(const char *)a4 len:(unint64_t)a5 expected:(unint64_t)a6
{
  id v9;
  int v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  char v15;

  v9 = a3;
  if (a5 <= a6)
  {
    if (a5 < a6)
    {
      v15 = 0;
      do
      {
        objc_msgSend(v9, "appendBytes:length:", &v15, 1);
        --a6;
      }
      while (a5 != a6);
    }
    a6 = a5;
    goto LABEL_13;
  }
  if (!*a4)
  {
    do
    {
      v10 = *(unsigned __int8 *)++a4;
      --a5;
      if (v10)
        v11 = 0;
      else
        v11 = a5 > a6;
    }
    while (v11);
  }
  if (a5 == a6)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendData:", v13);

    v12 = 1;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)signatureWithProtectedHeader:(id)a3 payload:(id)a4
{
  void *v5;
  const __CFData *v6;
  const __CFData *v7;
  NSObject *v8;
  CFErrorRef v9;
  void *v10;
  __int128 v11;
  int v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _QWORD v19[2];
  CFErrorRef error;
  uint8_t v21[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint8_t buf[16];
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v7 = SecKeyCreateSignature(self->_privateKey, CFSTR("algid:sign:ECDSA:message-X962:SHA256"), v6, &error);
  if (error)
  {
    secLogObjForScope("SecError");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = error;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create signature: %@", buf, 0xCu);
    }

    v9 = error;
    if (error)
    {
      error = 0;
      CFRelease(v9);
    }
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    v26 = v11;
    v19[0] = CFDataGetBytePtr(v7);
    v19[1] = CFDataGetLength(v7);
    v12 = DERParseSequence((uint64_t)v19, 2u, (uint64_t)&DER_ECDSASigItemSpecs, (unint64_t)buf, 0x20uLL);
    if (!v12 && *(_QWORD *)buf && *(_QWORD *)&buf[8] && (_QWORD)v26 && *((_QWORD *)&v26 + 1))
    {
      if (-[SecJWSEncoder appendPaddedToData:ptr:len:expected:](self, "appendPaddedToData:ptr:len:expected:", v10))
      {
        if (-[SecJWSEncoder appendPaddedToData:ptr:len:expected:](self, "appendPaddedToData:ptr:len:expected:", v10, v26, 32))
        {
          -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self, "base64URLEncodedStringRepresentationWithData:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
          CFRelease(v7);

          goto LABEL_26;
        }
        secLogObjForScope("SecError");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 134218240;
          v22 = *((_QWORD *)&v26 + 1);
          v23 = 2048;
          v24 = 32;
          v15 = "Non-compliant signature: s is %lld bytes, expected %lld";
          goto LABEL_22;
        }
      }
      else
      {
        secLogObjForScope("SecError");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 134218240;
          v22 = *(_QWORD *)&buf[8];
          v23 = 2048;
          v24 = 32;
          v15 = "Non-compliant signature: r is %lld bytes, expected %lld";
LABEL_22:
          v16 = v14;
          v17 = 22;
          goto LABEL_23;
        }
      }
    }
    else
    {
      secLogObjForScope("SecError");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 67109120;
        LODWORD(v22) = v12;
        v15 = "Failed to parse signature: %d";
        v16 = v14;
        v17 = 8;
LABEL_23:
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, v15, v21, v17);
      }
    }

    v13 = 0;
    goto LABEL_25;
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (id)encodedJWSWithPayload:(id)a3 kid:(id)a4 nonce:(id)a5 url:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (self->_privateKey && self->_publicKey)
  {
    v16 = 0;
  }
  else
  {
    -[SecJWSEncoder createKeyPair](self, "createKeyPair");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("ES256"), CFSTR("alg"));
  if (v13)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("kid"));
  }
  else
  {
    -[SecJWSEncoder jwkPublicKey](self, "jwkPublicKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("jwk"));

  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("nonce"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("url"));
  if (v16)
  {
    v19 = 0;
    if (a7)
LABEL_10:
      *a7 = objc_retainAutorelease(v16);
  }
  else
  {
    v24 = v12;
    if (v12)
    {
      -[SecJWSEncoder base64URLEncodedStringRepresentationWithDictionary:](self, "base64URLEncodedStringRepresentationWithDictionary:", v12);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = &stru_1E1FDD448;
    }
    -[SecJWSEncoder base64URLEncodedStringRepresentationWithDictionary:](self, "base64URLEncodedStringRepresentationWithDictionary:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecJWSEncoder signatureWithProtectedHeader:payload:](self, "signatureWithProtectedHeader:payload:", v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", CFSTR("{"));
    objc_msgSend(v19, "appendFormat:", CFSTR("\"protected\":\"%@\","), v22);
    objc_msgSend(v19, "appendFormat:", CFSTR("\"payload\":\"%@\","), v21);
    objc_msgSend(v19, "appendFormat:", CFSTR("\"signature\":\"%@\"), v23);
    objc_msgSend(v19, "appendString:", CFSTR("}"));

    v12 = v24;
    if (a7)
      goto LABEL_10;
  }

  return v19;
}

- (id)base64URLEncodedStringRepresentationWithData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    while (objc_msgSend(v5, "hasSuffix:", CFSTR("=")))
    {
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      if ((unint64_t)objc_msgSend(v6, "length") <= 1)
        return v6;
    }
  }
  v6 = v5;
  return v6;
}

- (id)base64URLEncodedStringRepresentationWithDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 10, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    while (objc_msgSend(v6, "hasSuffix:", CFSTR("=")))
    {
      objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v7;
      if (!objc_msgSend(v7, "length"))
        goto LABEL_6;
    }
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (id)compactJSONStringRepresentationWithDictionary:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 10, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_retainAutorelease(v3);
  v6 = (void *)objc_msgSend(v4, "initWithBytes:length:encoding:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), 4);

  return v6;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

@end
