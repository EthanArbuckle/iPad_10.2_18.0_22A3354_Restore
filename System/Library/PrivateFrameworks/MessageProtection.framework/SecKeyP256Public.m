@implementation SecKeyP256Public

- (SecKeyP256Public)initWithSecKeyRef:(__SecKey *)a3
{
  SecKeyP256Public *v4;
  SecKeyP256Public *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecKeyP256Public;
  v4 = -[SecKeyP256Public init](&v7, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (a3)
  {
    v4->_publicKeyRef = a3;
LABEL_4:
    a3 = v4;
  }

  return (SecKeyP256Public *)a3;
}

- (id)dataRepresentation
{
  NSData *serializedKey;
  CFDataRef v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  NSData *v10;
  NSObject *v11;
  uint64_t v12;
  NSData *v13;
  NSData *v14;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  serializedKey = self->_serializedKey;
  if (serializedKey)
    return serializedKey;
  error[0] = 0;
  v5 = SecKeyCopyExternalRepresentation(-[SecKeyP256Public publicKeyRef](self, "publicKeyRef"), error);
  if (v5)
  {
    v6 = MEMORY[0x20BD3BE74]();
    MEMORY[0x24BDAC7A8](v6);
    -[__CFData length](v5, "length");
    -[__CFData bytes](objc_retainAutorelease(v5), "bytes");
    v7 = ccec_import_pub();
    if (v7)
    {
      v8 = v7;
      MessageProtectionLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SecKeyP256Public dataRepresentation].cold.2(v8, v9);
      v10 = 0;
    }
    else
    {
      v13 = (NSData *)objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (unint64_t)(cczp_bitlen() + 7) >> 3));
      -[NSData bytes](v13, "bytes");
      ccec_compact_export_pub();
      v14 = self->_serializedKey;
      self->_serializedKey = v13;
      v9 = v13;

      v10 = self->_serializedKey;
    }

  }
  else
  {
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SecKeyP256Public dataRepresentation].cold.1((CFTypeRef *)error, v11, v12);

    if (error[0])
      CFRelease(error[0]);
    v10 = 0;
  }

  return v10;
}

- (SecKeyP256Public)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SecKeyRef v16;
  SecKeyP256Public *v17;
  NSObject *v19;
  CFErrorRef error;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MEMORY[0x20BD3BE74]();
  MEMORY[0x24BDAC7A8](v7);
  objc_msgSend(v6, "length");
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  if (ccec_compact_import_pub())
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "description");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Incorrect data for public key: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(7, a4, v11);
  }
  else
  {
    v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1));
    objc_msgSend(v10, "bytes");
    ccec_export_pub();
    v12 = *MEMORY[0x24BDE9060];
    v13 = *MEMORY[0x24BDE9028];
    v21[0] = *MEMORY[0x24BDE9050];
    v21[1] = v13;
    v14 = *MEMORY[0x24BDE9038];
    v22[0] = v12;
    v22[1] = v14;
    v15 = *MEMORY[0x24BDE9018];
    v21[2] = *MEMORY[0x24BDE9048];
    v21[3] = v15;
    v22[2] = &unk_24C4C91B0;
    v22[3] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    error = 0;
    v16 = SecKeyCreateWithData((CFDataRef)v10, (CFDictionaryRef)v11, &error);
    v17 = -[SecKeyP256Public init](self, "init");
    self = v17;
    if (v16)
    {
      v17->_publicKeyRef = v16;
      a4 = v17;
      goto LABEL_6;
    }
    if (!a4)
      goto LABEL_6;
    *a4 = error;
    MessageProtectionLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SecKeyP256Public initWithData:error:].cold.1((uint64_t *)a4, (uint64_t)v8, v19);

  }
  a4 = 0;
LABEL_6:

  return (SecKeyP256Public *)a4;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4
{
  void *v6;
  id v7;
  const __CFData *v8;
  void *v9;
  id v10;
  const void *v11;
  CC_LONG v12;
  id v13;
  __SecKey *v14;
  int v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  BOOL v19;
  CFErrorRef error;

  error = 0;
  v6 = (void *)MEMORY[0x24BDBCEC8];
  v7 = a4;
  v8 = (const __CFData *)a3;
  objc_msgSend(v6, "dataWithLength:", 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v7);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  v13 = objc_retainAutorelease(v9);
  CC_SHA256(v11, v12, (unsigned __int8 *)objc_msgSend(v13, "bytes"));
  v14 = -[SecKeyP256Public publicKeyRef](self, "publicKeyRef");
  v15 = SecKeyVerifySignature(v14, (SecKeyAlgorithm)*MEMORY[0x24BDE92D8], (CFDataRef)v13, v8, &error);

  if (error)
  {
    v16 = (__CFString *)CFErrorCopyDescription(error);
    MessageProtectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SecKeyP256Public verifySignature:data:].cold.1((uint64_t)v16, v17, v18);

    CFRelease(error);
    v19 = 0;
  }
  else
  {
    v19 = v15 != 0;
  }

  return v19;
}

- (void)dealloc
{
  __SecKey *publicKeyRef;
  objc_super v4;

  publicKeyRef = self->_publicKeyRef;
  if (publicKeyRef)
    CFRelease(publicKeyRef);
  v4.receiver = self;
  v4.super_class = (Class)SecKeyP256Public;
  -[SecKeyP256Public dealloc](&v4, sel_dealloc);
}

- (__SecKey)publicKeyRef
{
  return self->_publicKeyRef;
}

- (void)setPublicKeyRef:(__SecKey *)a3
{
  self->_publicKeyRef = a3;
}

- (NSData)serializedKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSerializedKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedKey, 0);
}

- (void)dataRepresentation
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Failed to import key from SecKeyCopyExternalRepresentation into ccec: %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithData:(os_log_t)log error:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "Failed to initialize public key from data with error: %@ for data: %@.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)verifySignature:(uint64_t)a3 data:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_20BABB000, a2, a3, "Failed verifying P-256 signature: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
