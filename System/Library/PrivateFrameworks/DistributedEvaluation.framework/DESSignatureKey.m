@implementation DESSignatureKey

+ (id)keyFromData:(id)a3
{
  id v3;
  __SecKey *v4;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    v4 = +[DESSignatureKey keyFromCertificateChain:](DESSignatureKey, "keyFromCertificateChain:", v3);
    if (v4)
      v4 = -[DESSignatureKey initWithKey:]([DESSignatureKey alloc], "initWithKey:", v4);
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[DESSignatureKey keyFromData:].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (__SecKey)keyFromCertificateChain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFData *v10;
  SecCertificateRef v11;
  SecCertificateRef v12;
  void *v13;
  void *v14;
  __SecCertificate *v15;
  OSStatus v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  __SecKey *v20;
  const void *ApplePinned;
  const void *v22;
  OSStatus v23;
  OSStatus v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  __SecCertificate *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  CFErrorRef error;
  SecTrustRef trust;
  CFStringRef commonName;
  id v38;

  v34 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v34, 4);
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "length"))
  {
    while (1)
    {
      v5 = (void *)MEMORY[0x1BCCC38F0]();
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCharactersToBeSkipped:", v7);

      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("-----BEGIN CERTIFICATE-----"), 0);
      objc_msgSend(v6, "scanString:intoString:", CFSTR("-----BEGIN CERTIFICATE-----"), 0);
      v38 = 0;
      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("-----END CERTIFICATE-----"), &v38);
      v8 = v38;
      if (!v8)
      {

        objc_autoreleasePoolPop(v5);
        goto LABEL_8;
      }
      v9 = v8;
      v10 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 1);
      if (!v10)
        break;
      v11 = SecCertificateCreateWithData(0, v10);
      if (!v11)
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          +[DESSignatureKey keyFromCertificateChain:].cold.9();
        goto LABEL_26;
      }
      v12 = v11;
      objc_msgSend(v4, "addObject:", v11);

      objc_msgSend(v6, "scanString:intoString:", CFSTR("-----END CERTIFICATE-----"), 0);
      objc_msgSend(v6, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v6, "scanLocation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
      v3 = v14;
      if (!objc_msgSend(v14, "length"))
        goto LABEL_9;
    }
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[DESSignatureKey keyFromCertificateChain:].cold.8();
LABEL_26:

    objc_autoreleasePoolPop(v5);
    v20 = 0;
    goto LABEL_27;
  }
LABEL_8:
  v14 = v3;
LABEL_9:
  if (objc_msgSend(v4, "count"))
  {
    commonName = 0;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v15 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
    v16 = SecCertificateCopyCommonName(v15, &commonName);

    if (v16)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v34;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        +[DESSignatureKey keyFromCertificateChain:].cold.7();
LABEL_31:
      v20 = 0;
LABEL_32:

      v3 = v14;
      goto LABEL_33;
    }
    v17 = commonName;
    if (!-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", CFSTR("DoDML"))
      || (ApplePinned = (const void *)SecPolicyCreateApplePinned()) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      v18 = v34;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        +[DESSignatureKey keyFromCertificateChain:].cold.2();

      goto LABEL_31;
    }
    v22 = ApplePinned;
    trust = 0;
    v23 = SecTrustCreateWithCertificates(v4, ApplePinned, &trust);
    if (v23)
    {
      v24 = v23;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[DESSignatureKey keyFromCertificateChain:].cold.6(v24, v25);

      v20 = 0;
      v18 = v34;
      goto LABEL_42;
    }
    error = 0;
    if (SecTrustEvaluateWithError(trust, &error))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v29 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
      v20 = SecCertificateCopyKey(v29);

      v18 = v34;
      if (v20)
      {
LABEL_42:
        if (trust)
          CFRelease(trust);
        CFRelease(v22);
        if (v20)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            +[DESSignatureKey keyFromCertificateChain:].cold.3();

        }
        goto LABEL_32;
      }
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        +[DESSignatureKey keyFromCertificateChain:].cold.4();
    }
    else
    {
      v30 = error;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        +[DESSignatureKey keyFromCertificateChain:].cold.5((uint64_t)v30, v31, v32);

      v18 = v34;
    }

    v20 = 0;
    goto LABEL_42;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    +[DESSignatureKey keyFromCertificateChain:].cold.1();

  v20 = 0;
  v3 = v14;
LABEL_27:
  v18 = v34;
LABEL_33:

  return v20;
}

- (DESSignatureKey)initWithKey:(__SecKey *)a3
{
  DESSignatureKey *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DESSignatureKey;
  result = -[DESSignatureKey init](&v5, sel_init);
  if (result)
    result->_key = a3;
  return result;
}

- (void)dealloc
{
  __SecKey *key;
  objc_super v4;

  key = self->_key;
  if (key)
    CFRelease(key);
  v4.receiver = self;
  v4.super_class = (Class)DESSignatureKey;
  -[DESSignatureKey dealloc](&v4, sel_dealloc);
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4
{
  return -[DESSignatureKey validateBase64Signature:data:algorithm:](self, "validateBase64Signature:data:algorithm:", a3, a4, *MEMORY[0x1E0CD6DF8]);
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  BOOL v11;

  v8 = a4;
  if (a3)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D50];
    v10 = a3;
    a3 = (id)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 1);

  }
  v11 = -[DESSignatureKey validateSignature:data:algorithm:](self, "validateSignature:data:algorithm:", a3, v8, a5);

  return v11;
}

- (BOOL)validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  const __CFData *v9;
  const __CFData *v10;
  const __CFData *v11;
  BOOL v12;
  __SecKey *key;
  int v14;
  CFErrorRef v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  CFErrorRef error;

  v9 = (const __CFData *)a3;
  v10 = (const __CFData *)a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    key = self->_key;
    if (!key)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DESSignatureKey.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_key"));

      key = self->_key;
    }
    if (SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeVerify, a5))
    {
      error = 0;
      v14 = SecKeyVerifySignature(self->_key, a5, v11, v9, &error);
      v12 = v14 != 0;
      if (!v14)
      {
        v15 = error;
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[DESSignatureKey validateSignature:data:algorithm:].cold.2((uint64_t)v15, v16, v17);

      }
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[DESSignatureKey validateSignature:data:algorithm:].cold.1();

      v12 = 0;
    }
  }

  return v12;
}

+ (void)keyFromData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1B96E5000, v0, v1, "DESSignatureKey: No certificate data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B96E5000, v0, v1, "DESSignatureKey: No certificates in cert chain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B96E5000, v0, v1, "DESSignatureKey: failed to create security policy.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1B96E5000, v0, v1, "DESSignatureKey: successfully created public key from the certificate chain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B96E5000, v0, v1, "DESSignatureKey: failed to create public key from the certificate chain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, a3, "DESSignatureKey: certificate chain validation failed with error: %@.", (uint8_t *)&v3);
}

+ (void)keyFromCertificateChain:(OSStatus)a1 .cold.6(OSStatus a1, NSObject *a2)
{
  __CFString *v3;
  uint64_t v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)SecCopyErrorMessageString(a1, 0);
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v4, "DESSignatureKey: trust creation for the certificate chain failed with error: %@", (uint8_t *)&v5);

}

+ (void)keyFromCertificateChain:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B96E5000, v0, v1, "DESSignatureKey: failed to get leaf common name.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1B96E5000, v0, v1, "DESSignatureKey: malformed certificate string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)keyFromCertificateChain:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1B96E5000, v0, v1, "DESSignatureKey: invalid certificate data in certificate chain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)validateSignature:data:algorithm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B96E5000, v0, v1, "DESSignatureKey: key/algorithm mismatch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)validateSignature:(uint64_t)a1 data:(NSObject *)a2 algorithm:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, a3, "DESSignatureKey: signature validation failed -- %@", (uint8_t *)&v3);
}

@end
