@implementation CMSJSONWebSignature

- (CMSJSONWebSignature)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  CMSJSONWebSignature *v11;
  CMSJSONWebSignature *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *verificationError;
  uint64_t v17;
  NSData *payload;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSError *v31;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)CMSJSONWebSignature;
  v11 = -[CMSJSONWebSignature init](&v33, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyID, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") != 3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 1, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        verificationError = v12->_verificationError;
        v12->_verificationError = (NSError *)v27;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CMSJSONWebSignature _validateJWSProtectedHeader:](v12, "_validateJWSProtectedHeader:", v14);

      if (v15)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        verificationError = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64URLEncodedString:", verificationError);
        payload = v12->_payload;
        v12->_payload = (NSData *)v17;

        v19 = objc_alloc(MEMORY[0x24BDBCE50]);
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithBase64URLEncodedString:", v20);

        if (v12->_payload && v21)
        {
          v22 = -[CMSJSONWebSignature _createPublicKeyFromPEM:](v12, "_createPublicKeyFromPEM:", v10);
          if (v22)
          {
            v23 = (const void *)v22;
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMSJSONWebSignature _validateJWSSignature:ofHeader:andPayload:withPublicKey:](v12, "_validateJWSSignature:ofHeader:andPayload:withPublicKey:", v21, v24, v25, v23);

            CFRelease(v23);
LABEL_14:

            goto LABEL_15;
          }
          v28 = (void *)MEMORY[0x24BDD1540];
          v29 = 10;
        }
        else
        {
          v28 = (void *)MEMORY[0x24BDD1540];
          v29 = 3;
        }
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), v29, 0);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v12->_verificationError;
        v12->_verificationError = (NSError *)v30;

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v13 = v12->_verificationError;
      v12->_verificationError = (NSError *)v26;
    }
LABEL_16:

  }
  return v12;
}

- (BOOL)_validateJWSProtectedHeader:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSError *v10;
  NSError *v11;
  NSError *v12;
  char v13;
  NSError *verificationError;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  NSError *v21;
  NSError *v22;
  NSError *v23;
  NSError *v24;
  void *v25;
  void *v26;
  NSError *v27;
  NSError *v28;
  NSError *v30;
  NSError *v31;
  NSError *v32;
  id v33;

  v4 = (objc_class *)MEMORY[0x24BDBCE50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBase64URLEncodedString:", v5);

  if (v6)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;
    v9 = v8;
    if (v8)
    {
      v10 = (NSError *)v8;
LABEL_19:
      v13 = 0;
      verificationError = self->_verificationError;
      self->_verificationError = v10;
LABEL_20:

      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 5, 0);
      v10 = (NSError *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    verificationError = v7;
    if ((unint64_t)-[NSError count](verificationError, "count") >= 2)
    {
      -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("alg"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("kid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("alg"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("ES256")) & 1) != 0)
          {
            -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("kid"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMSJSONWebSignature keyID](self, "keyID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v20, "isEqualToString:", v19);

            if ((v13 & 1) != 0)
            {
              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("typ"));
              v21 = (NSError *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21 && -[NSError caseInsensitiveCompare:](v21, "caseInsensitiveCompare:", CFSTR("JOSE")))
              {
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 9, 0);
                v23 = (NSError *)objc_claimAutoreleasedReturnValue();
                v24 = self->_verificationError;
                self->_verificationError = v23;

              }
              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", CFSTR("cty"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              if (v25 && objc_msgSend(v25, "caseInsensitiveCompare:", CFSTR("JSON")))
              {
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 9, 0);
                v27 = (NSError *)objc_claimAutoreleasedReturnValue();
                v28 = self->_verificationError;
                self->_verificationError = v27;

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 8, 0);
              v32 = (NSError *)objc_claimAutoreleasedReturnValue();
              v22 = self->_verificationError;
              self->_verificationError = v32;
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 7, 0);
            v31 = (NSError *)objc_claimAutoreleasedReturnValue();
            v13 = 0;
            v19 = self->_verificationError;
            self->_verificationError = v31;
          }

          goto LABEL_24;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 6, 0);
    v30 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v18 = self->_verificationError;
    self->_verificationError = v30;
LABEL_24:

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), 4, 0);
  v11 = (NSError *)objc_claimAutoreleasedReturnValue();
  v12 = self->_verificationError;
  self->_verificationError = v11;

  v13 = 0;
LABEL_21:

  return v13;
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

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  -[CMSJSONWebSignature _createASN1SignatureFromJWSSignature:](self, "_createASN1SignatureFromJWSSignature:", v11);
  v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 11;
    goto LABEL_8;
  }
  error = 0;
  if (SecKeyVerifySignature(a6, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v13, v14, &error))
    v15 = error == 0;
  else
    v15 = 0;
  if (!v15)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 12;
LABEL_8:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.jsonwebsignature"), v17, 0);
    v18 = (NSError *)objc_claimAutoreleasedReturnValue();
    verificationError = self->_verificationError;
    self->_verificationError = v18;

  }
}

- (__SecKey)_createPublicKeyFromPEM:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  __SecKey *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SecAsn1Coder *v14;
  id v15;
  int v16;
  size_t v17;
  unint64_t v19;
  const __CFData *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  SecKeyRef v25;
  CFErrorRef v26;
  SecAsn1CoderRef coder;
  __int128 dest;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  SecAsn1Template templates;
  uint64_t v34;
  __int128 *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-----BEGIN PUBLIC KEY-----"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-----END PUBLIC KEY-----"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v7 = 0;
LABEL_20:

      v5 = v8;
      goto LABEL_21;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", &stru_24E1CDD40);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
    if (v13)
    {
      v29 = 0u;
      v30 = 0u;
      dest = 0u;
      v43 = 0u;
      v44 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      LODWORD(v43) = 16;
      LODWORD(v44) = 32;
      DWORD2(v44) = 6;
      *(_QWORD *)&v46 = 0x1000000500;
      *(_QWORD *)&templates.kind = 16;
      templates.sub = 0;
      templates.size = 48;
      v34 = 2048;
      v35 = &v43;
      v36 = 0;
      v37 = 0x2000000003;
      v38 = 0;
      v39 = 0;
      v41 = 0;
      v42 = 0;
      v40 = 0;
      coder = 0;
      v7 = 0;
      if (SecAsn1CoderCreate(&coder))
      {
LABEL_19:

        goto LABEL_20;
      }
      v14 = coder;
      v15 = objc_retainAutorelease(v13);
      if (!SecAsn1Decode(v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), &templates, &dest)
        && ((_QWORD)dest == 7 && !memcmp(*((const void **)&dest + 1), &_oidEcPubKey, 7uLL) ? (v16 = 0) : (v16 = 1),
            (v17 = v29 - 2, (_QWORD)v29 == 10)
         && **((_BYTE **)&v29 + 1) == 6
         && v17 == *(unsigned __int8 *)(*((_QWORD *)&v29 + 1) + 1)
         && ((memcmp((const void *)(*((_QWORD *)&v29 + 1) + 2), &_oidEcPrime256v1, v17) == 0) & ~v16) != 0))
      {
        if ((v30 & 7) != 0)
          v19 = ((unint64_t)v30 >> 3) + 1;
        else
          v19 = (unint64_t)v30 >> 3;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *((_QWORD *)&v30 + 1), v19);
        v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        SecAsn1CoderRelease(coder);
        if (v20)
        {
          v21 = *MEMORY[0x24BDE9060];
          v22 = *MEMORY[0x24BDE9028];
          v31[0] = *MEMORY[0x24BDE9050];
          v31[1] = v22;
          v23 = *MEMORY[0x24BDE9038];
          v32[0] = v21;
          v32[1] = v23;
          v31[2] = *MEMORY[0x24BDE9048];
          v32[2] = &unk_24E1D84F8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
          v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v25 = SecKeyCreateWithData(v20, v24, &v26);
          v7 = v25;
          if (v26 && v25)
          {
            CFRelease(v25);
            v7 = 0;
          }

          goto LABEL_19;
        }
      }
      else
      {
        SecAsn1CoderRelease(coder);
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (id)_createASN1SignatureFromJWSSignature:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SecAsn1Item dest;
  SecAsn1CoderRef coder;
  _QWORD src[4];
  _BYTE templates[32];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 64)
  {
    objc_msgSend(v3, "subdataWithRange:", 0, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subdataWithRange:", 32, 32);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = 0;
    if (v4)
    {
      if (v5)
      {
        src[0] = objc_msgSend(v4, "length");
        src[1] = objc_msgSend(objc_retainAutorelease(v4), "bytes");
        src[2] = objc_msgSend(v6, "length");
        src[3] = objc_msgSend(objc_retainAutorelease(v6), "bytes");
        memset(templates, 0, sizeof(templates));
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        *(_DWORD *)templates = 16;
        *(_DWORD *)&templates[16] = 32;
        *(_DWORD *)&templates[24] = 2;
        v14 = 0x1000000002uLL;
        dest.Data = 0;
        coder = 0;
        dest.Length = 0;
        v7 = 0;
        if (!SecAsn1CoderCreate(&coder))
        {
          if (SecAsn1EncodeItem(coder, src, (const SecAsn1Template *)templates, &dest))
            SecAsn1CoderRelease(coder);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", dest.Data, dest.Length);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          SecAsn1CoderRelease(coder);
        }
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
}

@end
