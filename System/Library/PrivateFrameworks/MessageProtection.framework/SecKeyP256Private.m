@implementation SecKeyP256Private

+ (id)defaultProtectionClassForPlatform
{
  return (id)*MEMORY[0x24BDE8F70];
}

+ (id)generate
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultProtectionClassForPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "generateWithAccessControl:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)compactPrivateKeyWithAccessControl:(id)a3
{
  id v3;
  const __CFAllocator *v4;
  SecAccessControlRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  int v10;
  __SecKey *v11;
  __SecKey *v12;
  __SecKey *v13;
  __SecKey *v14;
  CFDataRef v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  SecAccessControlRef v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFDictionaryRef v34;
  SecAccessControlRef v36;
  id v37;
  CFErrorRef error;
  _QWORD v39[5];
  _QWORD v40[6];

  v40[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  error = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v37 = v3;
  v5 = SecAccessControlCreateWithFlags(v4, v3, 0x40000000uLL, 0);
  v6 = *MEMORY[0x24BDE9060];
  v7 = *MEMORY[0x24BDE9048];
  v39[0] = *MEMORY[0x24BDE9050];
  v39[1] = v7;
  v40[0] = v6;
  v40[1] = &unk_24C4C91B0;
  v8 = *MEMORY[0x24BDE8F48];
  v39[2] = *MEMORY[0x24BDE9018];
  v39[3] = v8;
  v40[2] = MEMORY[0x24BDBD1C0];
  v40[3] = v5;
  v36 = v5;
  v39[4] = *MEMORY[0x24BDE9158];
  v40[4] = *MEMORY[0x24BDE9160];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = 1000;
  while (1)
  {
    v11 = SecKeyCreateRandomKey(v9, &error);
    if (!v11)
      break;
    v12 = v11;
    v13 = SecKeyCopyPublicKey(v11);
    if (!v13)
    {
      CFRelease(v12);
      MessageProtectionLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      v23 = v37;
      if (v26)
        +[SecKeyP256Private compactPrivateKeyWithAccessControl:].cold.2(v19, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_19;
    }
    v14 = v13;
    v15 = SecKeyCopyExternalRepresentation(v13, &error);
    CFRelease(v14);
    if (v15)
    {
      v16 = MEMORY[0x20BD3BE74]();
      MEMORY[0x24BDAC7A8](v16);
      v18 = (SecAccessControlRef *)((char *)&v36 - v17);
      -[__CFData length](v15, "length");
      v19 = objc_retainAutorelease(v15);
      -[NSObject bytes](v19, "bytes");
      v20 = ccec_x963_import_pub();
      if (ccec_validate_pub())
        v21 = v20 == 0;
      else
        v21 = 0;
      if (v21)
      {
        MEMORY[0x24BDAC7A8](*v18);
        cczp_prime();
        ccn_sub();
        if ((ccn_cmp() & 0x80000000) == 0)
        {
          v34 = SecKeyCopyAttributes(v12);
          -[__CFDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", *MEMORY[0x24BDE9178]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          CFRelease(v12);
          goto LABEL_21;
        }
      }
      CFRelease(v12);

    }
    else
    {
      CFRelease(v12);
    }
    if (!--v10)
    {
      v22 = 0;
      v24 = v36;
      v23 = v37;
      goto LABEL_23;
    }
  }
  MessageProtectionLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v23 = v37;
    +[SecKeyP256Private compactPrivateKeyWithAccessControl:].cold.1((uint64_t)v37, v19, v25);
LABEL_19:
    v22 = 0;
    goto LABEL_22;
  }
  v22 = 0;
LABEL_21:
  v23 = v37;
LABEL_22:
  v24 = v36;

LABEL_23:
  return v22;
}

+ (id)generateWithAccessControl:(id)a3
{
  void *v3;
  SecKeyP256Private *v4;

  objc_msgSend(a1, "compactPrivateKeyWithAccessControl:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SecKeyP256Private initWithData:error:]([SecKeyP256Private alloc], "initWithData:error:", v3, 0);

  return v4;
}

- (id)getPrivateKeyRefWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *v8;
  const __CFData *v9;
  SecKeyRef v10;
  __CFString *v11;
  void *v12;
  CFErrorRef error;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDE9158];
  v16[0] = *MEMORY[0x24BDE9160];
  v6 = *MEMORY[0x24BDE9178];
  v15[0] = v5;
  v15[1] = v6;
  -[SecKeyP256Private privateKeyBlob](self, "privateKeyBlob");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  -[SecKeyP256Private privateKeyBlob](self, "privateKeyBlob");
  v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v10 = SecKeyCreateWithData(v9, v8, &error);

  if (error)
  {
    v11 = (__CFString *)CFErrorCopyDescription(error);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Deserialization of SecKey failed with description: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(3, a3, v12);

    CFRelease(error);
  }

  return v10;
}

- (id)keyAgreement:(id)a3 error:(id *)a4
{
  return -[SecKeyP256Private keyAgreement:error:isRetry:](self, "keyAgreement:error:isRetry:", a3, a4, 0);
}

- (id)keyAgreement:(id)a3 error:(id *)a4 isRetry:(BOOL)a5
{
  id v7;
  const __CFString *v8;
  void *v9;
  SecKeyP256Public *v10;
  SecKeyP256Public *v11;
  __SecKey *privateKey;
  __SecKey *v13;
  CFDataRef v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  CFErrorRef error;

  v7 = a3;
  v8 = (const __CFString *)*MEMORY[0x24BDE9280];
  if (SecKeyIsAlgorithmSupported((SecKeyRef)self->_privateKey, kSecKeyOperationTypeKeyExchange, (SecKeyAlgorithm)*MEMORY[0x24BDE9280]))
  {
    error = 0;
    objc_msgSend(v7, "dataRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[SecKeyP256Public initWithData:error:]([SecKeyP256Public alloc], "initWithData:error:", v9, a4);
      v11 = v10;
      if (v10)
      {
        privateKey = (__SecKey *)self->_privateKey;
        v13 = -[SecKeyP256Public publicKeyRef](v10, "publicKeyRef");
        v14 = SecKeyCopyKeyExchangeResult(privateKey, v8, v13, MEMORY[0x24BDBD1B8], &error);
        v15 = v14;
        if (v14)
        {
          v15 = v14;
          v16 = v15;
        }
        else
        {
          if (a4)
            *a4 = error;
          else
            CFRelease(error);
          v16 = 0;
        }
      }
      else
      {
        MessageProtectionLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[SecKeyP256Private keyAgreement:error:isRetry:].cold.1(a4, v15, v17);
        v16 = 0;
      }

    }
    else
    {
      MPLogAndAssignError(7, a4, CFSTR("Failed to obtain data for the public key."));
      v16 = 0;
    }

  }
  else
  {
    MPLogAndAssignError(3, a4, CFSTR("This key is not allowed to do a DH key agreement."));
    v16 = 0;
  }

  return v16;
}

- (SecKeyP256Public)publicKey
{
  SecKeyP256Public *publicKey;
  SecKeyRef v4;
  SecKeyP256Public *v5;
  SecKeyP256Public *v6;
  SecKeyP256Public *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  publicKey = self->_publicKey;
  if (publicKey)
    goto LABEL_4;
  v4 = SecKeyCopyPublicKey((SecKeyRef)self->_privateKey);
  if (v4)
  {
    v5 = -[SecKeyP256Public initWithSecKeyRef:]([SecKeyP256Public alloc], "initWithSecKeyRef:", v4);
    v6 = self->_publicKey;
    self->_publicKey = v5;

    publicKey = self->_publicKey;
LABEL_4:
    v7 = publicKey;
    return v7;
  }
  MessageProtectionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[SecKeyP256Private compactPrivateKeyWithAccessControl:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

  v7 = 0;
  return v7;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  const void *v10;
  id v11;
  CFDataRef v12;
  CFDataRef v13;
  const __CFData *v14;
  CFErrorRef error;

  v6 = a3;
  v7 = (const __CFString *)*MEMORY[0x24BDE92D8];
  if (SecKeyIsAlgorithmSupported((SecKeyRef)self->_privateKey, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x24BDE92D8]))
  {
    error = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v6);
    v10 = (const void *)objc_msgSend(v9, "bytes");
    LODWORD(v9) = objc_msgSend(v9, "length");
    v11 = objc_retainAutorelease(v8);
    CC_SHA256(v10, (CC_LONG)v9, (unsigned __int8 *)objc_msgSend(v11, "bytes"));
    v12 = SecKeyCreateSignature((SecKeyRef)self->_privateKey, v7, (CFDataRef)v11, &error);
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else if (a4)
    {
      *a4 = error;
    }

  }
  else
  {
    MPLogAndAssignError(2, a4, CFSTR("Attempting to sign with a key that doesn't support that operation."));
    v13 = 0;
  }

  return v13;
}

- (SecKeyP256Private)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  SecKeyP256Private *v8;
  SecKeyP256Private *v9;
  uint64_t v10;
  id privateKey;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  SecKeyP256Private *v16;
  __CFString *v17;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SecKeyP256Private;
  v8 = -[SecKeyP256Private init](&v19, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  if (!v7)
  {
    MPLogAndAssignError(1, a4, CFSTR("Attempting to initialize a key with missing OID data."));
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v8->_privateKeyBlob, a3);
  -[SecKeyP256Private getPrivateKeyRefWithError:](v9, "getPrivateKeyRefWithError:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  privateKey = v9->_privateKey;
  v9->_privateKey = (id)v10;

  if (!v9->_privateKey)
  {
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SecKeyP256Private initWithData:error:].cold.1(a4, v12);
    goto LABEL_14;
  }
  objc_msgSend(CFSTR("Key Validation String"), "dataUsingEncoding:", 4);
  v12 = objc_claimAutoreleasedReturnValue();
  -[SecKeyP256Private signData:error:](v9, "signData:error:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v17 = CFSTR("Failed to test sign with SecKeyP256 during initialization.");
LABEL_13:
    MPLogAndAssignError(407, a4, v17);

LABEL_14:
    goto LABEL_15;
  }
  -[SecKeyP256Private publicKey](v9, "publicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "verifySignature:data:", v13, v12);

  if (!v15)
  {
    v17 = CFSTR("Failed to verify signature with SecKeyP256 during initialization.");
    goto LABEL_13;
  }

LABEL_7:
  v16 = v9;
LABEL_16:

  return v16;
}

- (id)privateKey
{
  return self->_privateKey;
}

- (NSData)privateKeyBlob
{
  return self->_privateKeyBlob;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_privateKeyBlob, 0);
  objc_storeStrong(&self->_privateKey, 0);
}

+ (void)compactPrivateKeyWithAccessControl:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_20BABB000, a2, a3, "Failed to generate a P-256 Key with access control %@.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)compactPrivateKeyWithAccessControl:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, a1, a3, "Failed to establish public DH Key.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)keyAgreement:(id *)a1 error:(NSObject *)a2 isRetry:(uint64_t)a3 .cold.1(id *a1, NSObject *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(*a1, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_0_5(&dword_20BABB000, a2, a3, "Failed to initialize the public key with error: %@", (uint8_t *)&v6);
  if (a1)

  OUTLINED_FUNCTION_1_2();
}

- (void)initWithData:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_5(&dword_20BABB000, a2, v4, "Failed to get a Private Key Ref with error while initializing SecKeyP256: %@", (uint8_t *)&v5);

}

@end
