@implementation SecJWSDecoder

- (SecJWSDecoder)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(__SecKey *)a5
{
  id v8;
  id v9;
  SecJWSDecoder *v10;
  SecJWSDecoder *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *verificationError;
  uint64_t v16;
  NSData *payload;
  void *v18;
  uint64_t v19;
  NSData *signature;
  NSData *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSError *v29;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SecJWSDecoder;
  v10 = -[SecJWSDecoder init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_keyID, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 1, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        verificationError = v11->_verificationError;
        v11->_verificationError = (NSError *)v25;
        goto LABEL_14;
      }
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SecJWSDecoder _validateJWSProtectedHeader:](v11, "_validateJWSProtectedHeader:", v13);

      if (v14)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        verificationError = (void *)objc_claimAutoreleasedReturnValue();
        -[SecJWSDecoder dataWithBase64URLEncodedString:](v11, "dataWithBase64URLEncodedString:", verificationError);
        v16 = objc_claimAutoreleasedReturnValue();
        payload = v11->_payload;
        v11->_payload = (NSData *)v16;

        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SecJWSDecoder dataWithBase64URLEncodedString:](v11, "dataWithBase64URLEncodedString:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        signature = v11->_signature;
        v11->_signature = (NSData *)v19;

        if (v11->_payload && v11->_signature)
        {
          if (a5)
          {
            CFRetain(a5);
            v21 = v11->_signature;
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SecJWSDecoder _validateJWSSignature:ofHeader:andPayload:withPublicKey:](v11, "_validateJWSSignature:ofHeader:andPayload:withPublicKey:", v21, v22, v23, a5);

            CFRelease(a5);
LABEL_14:

            goto LABEL_15;
          }
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v27 = 10;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v27 = 3;
        }
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), v27, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v11->_verificationError;
        v11->_verificationError = (NSError *)v28;

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 0, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v12 = v11->_verificationError;
      v11->_verificationError = (NSError *)v24;
    }
LABEL_15:

  }
  return v11;
}

- (BOOL)_validateJWSProtectedHeader:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSError *v8;
  NSError *v9;
  NSError *v10;
  BOOL v11;
  NSError *verificationError;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  NSError *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSError *v24;
  NSError *v25;
  NSError *v26;
  NSError *v27;
  void *v28;
  void *v29;
  NSError *v30;
  NSError *v31;
  NSError *v32;
  NSError *v33;
  id v34;

  -[SecJWSDecoder dataWithBase64URLEncodedString:](self, "dataWithBase64URLEncodedString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v34);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v34;
    v7 = v6;
    if (v6)
    {
      v8 = (NSError *)v6;
LABEL_12:
      v11 = 0;
      verificationError = self->_verificationError;
      self->_verificationError = v8;
LABEL_13:

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 5, 0);
      v8 = (NSError *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    verificationError = v5;
    if (-[NSError count](verificationError, "count"))
    {
      -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("alg"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("kid"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

LABEL_18:
          -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("alg"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ES256")) & 1) != 0)
          {
            -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("kid"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21
              && (-[SecJWSDecoder keyID](self, "keyID"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v22, "isEqualToString:", v21),
                  v22,
                  (v23 & 1) == 0))
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 8, 0);
              v33 = (NSError *)objc_claimAutoreleasedReturnValue();
              v11 = 0;
              v25 = self->_verificationError;
              self->_verificationError = v33;
            }
            else
            {
              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("typ"));
              v24 = (NSError *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24 && -[NSError caseInsensitiveCompare:](v24, "caseInsensitiveCompare:", CFSTR("JOSE")))
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 9, 0);
                v26 = (NSError *)objc_claimAutoreleasedReturnValue();
                v27 = self->_verificationError;
                self->_verificationError = v26;

              }
              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("cty"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28 && objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("JSON")))
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 9, 0);
                v30 = (NSError *)objc_claimAutoreleasedReturnValue();
                v31 = self->_verificationError;
                self->_verificationError = v30;

              }
              v11 = 1;
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 7, 0);
            v32 = (NSError *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v21 = self->_verificationError;
            self->_verificationError = v32;
          }

          goto LABEL_32;
        }
        v15 = (void *)v14;
        -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("kid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          goto LABEL_18;
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 6, 0);
    v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v20 = self->_verificationError;
    self->_verificationError = v19;
LABEL_32:

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), 4, 0);
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  v10 = self->_verificationError;
  self->_verificationError = v9;

  v11 = 0;
LABEL_14:

  return v11;
}

- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6
{
  void *v10;
  id v11;
  void *v12;
  const __CFData *v13;
  const __CFData *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  NSError *v18;
  NSError *verificationError;
  CFErrorRef error;

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  -[SecJWSDecoder _createASN1SignatureFromJWSSignature:](self, "_createASN1SignatureFromJWSSignature:", v11);
  v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 11;
    goto LABEL_8;
  }
  error = 0;
  if (SecKeyVerifySignature(a6, CFSTR("algid:sign:ECDSA:message-X962:SHA256"), v13, v14, &error))
    v15 = error == 0;
  else
    v15 = 0;
  if (!v15)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 12;
LABEL_8:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.security.errors.jws"), v17, 0);
    v18 = (NSError *)objc_claimAutoreleasedReturnValue();
    verificationError = self->_verificationError;
    self->_verificationError = v18;

  }
}

- (id)_createASN1SignatureFromJWSSignature:(id)a3
{
  return 0;
}

- (id)dataWithBase64URLEncodedString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "length") & 3) != 0)
  {
    do
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("="));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }
    while ((objc_msgSend(v5, "length") & 3) != 0);
  }
  else
  {
    v5 = v4;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);

  return v6;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
}

@end
