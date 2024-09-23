@implementation SecKeyRSAPublic

- (SecKeyRSAPublic)initWithSecKeyRef:(id)a3
{
  id v4;
  SecKeyRSAPublic *v5;
  SecKeyRSAPublic *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SecKeyRSAPublic;
  v5 = -[SecKeyRSAPublic init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SecKeyRSAPublic setSecKeyRef:](v5, "setSecKeyRef:", v4);

  return v6;
}

- (SecKeyRSAPublic)initWithData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  SecKeyRSAPublic *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SecKeyRef v11;
  id secKeyRef;
  void *v13;
  SecKeyRSAPublic *v14;
  NSObject *v15;
  objc_super v17;
  CFErrorRef error;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v6 = (const __CFData *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SecKeyRSAPublic;
  error = 0;
  v7 = -[SecKeyRSAPublic init](&v17, sel_init);
  if (v7)
  {
    v8 = *MEMORY[0x24BDE9080];
    v9 = *MEMORY[0x24BDE9028];
    v19[0] = *MEMORY[0x24BDE9050];
    v19[1] = v9;
    v10 = *MEMORY[0x24BDE9038];
    v20[0] = v8;
    v20[1] = v10;
    v19[2] = *MEMORY[0x24BDE9048];
    v20[2] = &unk_24C4C9120;
    v11 = SecKeyCreateWithData(v6, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3), &error);
    secKeyRef = v7->_secKeyRef;
    v7->_secKeyRef = v11;

  }
  -[SecKeyRSAPublic secKeyRef](v7, "secKeyRef");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v7;
  }
  else
  {
    MessageProtectionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SecKeyRSAPublic initWithData:error:].cold.1((CFTypeRef *)&error);

    v14 = 0;
    if (a4)
      *a4 = error;
  }

  return v14;
}

- (id)encryptData:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  __SecKey *v7;
  CFDataRef v8;
  const __CFData *v9;
  NSObject *v10;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFData *)a3;
  -[SecKeyRSAPublic secKeyRef](self, "secKeyRef");
  v7 = (__SecKey *)objc_claimAutoreleasedReturnValue();
  v8 = SecKeyCreateEncryptedData(v7, (SecKeyAlgorithm)*MEMORY[0x24BDE9318], v6, &error);

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SecKeyRSAPublic encryptData:error:].cold.1((CFTypeRef *)&error);

    if (a4)
      *a4 = error;
  }

  return v8;
}

- (id)dataRepresentation
{
  __SecKey *v2;
  CFDataRef v3;

  -[SecKeyRSAPublic secKeyRef](self, "secKeyRef");
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

- (void)initWithData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (__CFString *)OUTLINED_FUNCTION_2_0(a1);
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to initialize an RSA Key with error: %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)encryptData:(CFTypeRef *)a1 error:.cold.1(CFTypeRef *a1)
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (__CFString *)OUTLINED_FUNCTION_2_0(a1);
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Failed to encrypt with RSA: %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
