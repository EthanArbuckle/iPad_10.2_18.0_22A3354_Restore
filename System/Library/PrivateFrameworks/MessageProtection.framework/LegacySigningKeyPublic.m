@implementation LegacySigningKeyPublic

- (LegacySigningKeyPublic)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFData *v11;
  const __CFDictionary *v12;
  SecKeyRef v13;
  LegacySigningKeyPublic *v14;
  id secKeyRef;
  LegacySigningKeyPublic *v16;
  NSObject *v17;
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDE9060];
  v7 = *MEMORY[0x24BDE9028];
  v20[0] = *MEMORY[0x24BDE9050];
  v20[1] = v7;
  v8 = *MEMORY[0x24BDE9038];
  v21[0] = v6;
  v21[1] = v8;
  v9 = *MEMORY[0x24BDE9018];
  v20[2] = *MEMORY[0x24BDE9048];
  v20[3] = v9;
  v21[2] = &unk_24C4C9168;
  v21[3] = MEMORY[0x24BDBD1C0];
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (const __CFData *)a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = SecKeyCreateWithData(v11, v12, (CFErrorRef *)&v19);

  if (v13)
  {
    v14 = -[LegacySigningKeyPublic init](self, "init");
    secKeyRef = v14->_secKeyRef;
    v14->_secKeyRef = v13;

    self = v14;
    v16 = self;
  }
  else
  {
    MessageProtectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LegacySigningKeyPublic initWithData:error:].cold.1((CFTypeRef *)&v19, v17);

    v16 = 0;
    if (a4)
      *a4 = v19;
  }

  return v16;
}

- (id)dataRepresentation
{
  return SecKeyCopyExternalRepresentation((SecKeyRef)self->_secKeyRef, 0);
}

- (BOOL)verifySignature:(id)a3 ofData:(id)a4
{
  return SecKeyVerifySignature((SecKeyRef)self->_secKeyRef, (SecKeyAlgorithm)*MEMORY[0x24BDE92C8], (CFDataRef)a4, (CFDataRef)a3, 0) == 1;
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

- (void)initWithData:(CFTypeRef *)a1 error:(NSObject *)a2 .cold.1(CFTypeRef *a1, NSObject *a2)
{
  __CFString *v3;
  int v4;
  __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)CFCopyDescription(*a1);
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize a legacy ECDSA key with error: %@.", (uint8_t *)&v4, 0xCu);

}

@end
