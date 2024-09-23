@implementation SecKeyRSAPrivate

- (SecKeyRSAPrivate)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *v8;
  SecKeyRef v9;
  SecKeyRSAPrivate *v10;
  SecKeyRSAPrivate *v11;
  SecKeyRSAPrivate *v12;
  NSObject *v13;
  objc_super v15;
  CFErrorRef error;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  error = 0;
  v3 = *MEMORY[0x24BDE9080];
  v4 = *MEMORY[0x24BDE9048];
  v19[0] = *MEMORY[0x24BDE9050];
  v19[1] = v4;
  v20[0] = v3;
  v20[1] = &unk_24C4C91C8;
  v5 = *MEMORY[0x24BDE9018];
  v20[2] = MEMORY[0x24BDBD1C0];
  v6 = *MEMORY[0x24BDE9468];
  v19[2] = v5;
  v19[3] = v6;
  v17 = v5;
  v18 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v9 = SecKeyCreateRandomKey(v8, &error);
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)SecKeyRSAPrivate;
    v10 = -[SecKeyRSAPrivate init](&v15, sel_init);
    v11 = v10;
    if (v10)
      objc_storeStrong(&v10->_secKeyRef, v9);
    self = v11;
    v12 = self;
  }
  else
  {
    MessageProtectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SecKeyRSAPrivate init].cold.1((CFTypeRef *)&error);

    v12 = 0;
  }

  return v12;
}

- (SecKeyRSAPrivate)initWithData:(id)a3 error:(id *)a4
{
  const __CFData *v4;
  SecKeyRSAPrivate *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SecKeyRef v9;
  void *v10;
  SecKeyRSAPrivate *v11;
  NSObject *v12;
  objc_super v14;
  CFErrorRef error;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SecKeyRSAPrivate;
  error = 0;
  v4 = (const __CFData *)a3;
  v5 = -[SecKeyRSAPrivate init](&v14, sel_init);
  v6 = *MEMORY[0x24BDE9080];
  v7 = *MEMORY[0x24BDE9028];
  v16[0] = *MEMORY[0x24BDE9050];
  v16[1] = v7;
  v8 = *MEMORY[0x24BDE9030];
  v17[0] = v6;
  v17[1] = v8;
  v16[2] = *MEMORY[0x24BDE9048];
  v17[2] = &unk_24C4C91C8;
  v9 = SecKeyCreateWithData(v4, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3, v14.receiver, v14.super_class, error), &error);

  -[SecKeyRSAPrivate setSecKeyRef:](v5, "setSecKeyRef:", v9);
  -[SecKeyRSAPrivate secKeyRef](v5, "secKeyRef");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v5;
  }
  else
  {
    MessageProtectionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SecKeyRSAPublic initWithData:error:].cold.1((CFTypeRef *)&error);

    v11 = 0;
  }

  return v11;
}

- (id)publicKey
{
  SecKeyRSAPublic *v3;
  __SecKey *v4;
  SecKeyRef v5;
  SecKeyRSAPublic *v6;

  v3 = [SecKeyRSAPublic alloc];
  -[SecKeyRSAPrivate secKeyRef](self, "secKeyRef");
  v4 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  v5 = SecKeyCopyPublicKey(v4);
  v6 = -[SecKeyRSAPublic initWithSecKeyRef:](v3, "initWithSecKeyRef:", v5);

  return v6;
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  __SecKey *v7;
  CFDataRef v8;
  const __CFData *v9;
  NSObject *v10;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFData *)a3;
  -[SecKeyRSAPrivate secKeyRef](self, "secKeyRef");
  v7 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  v8 = SecKeyCreateDecryptedData(v7, (SecKeyAlgorithm)*MEMORY[0x24BDE9318], v6, &error);

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SecKeyRSAPrivate decryptData:error:].cold.1((CFTypeRef *)&error);

    if (a4)
      *a4 = error;
  }

  return v8;
}

- (id)dataRepresentation
{
  __SecKey *v2;
  CFDataRef v3;

  -[SecKeyRSAPrivate secKeyRef](self, "secKeyRef");
  v2 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  v3 = SecKeyCopyExternalRepresentation(v2, 0);

  return v3;
}

- (id)secKeyRef
{
  return self->_secKeyRef;
}

- (void)setSecKeyRef:(id)a3
{
  objc_storeStrong(&self->_secKeyRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secKeyRef, 0);
}

- (void)init
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (__CFString *)OUTLINED_FUNCTION_2_0(a1);
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to generate an RSA Key with error: %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)decryptData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (__CFString *)OUTLINED_FUNCTION_2_0(a1);
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to decrypt with RSA: %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
