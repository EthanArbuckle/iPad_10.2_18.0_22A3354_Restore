@implementation AKSecurityHelper

+ (id)signData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5
{
  CFDataRef v6;
  CFDataRef v7;
  CFErrorRef v8;
  const __CFData *v9;
  NSObject *v10;
  _BOOL4 v11;
  __CFError *v12;
  CFErrorRef error;

  error = 0;
  v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)a3, &error);
  v7 = v6;
  v8 = error;
  if (v6)
  {
    v9 = v6;
    goto LABEL_13;
  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      +[AKSecurityHelper signData:withKey:error:].cold.2((uint64_t)v8, v10);

    if (a5)
    {
      v12 = objc_retainAutorelease(v8);
LABEL_12:
      *a5 = v12;
    }
  }
  else
  {
    if (v11)
      +[AKSecurityHelper signData:withKey:error:].cold.1(v10);

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_generalErrorWithCode:errorDomain:underlyingError:", -17001, CFSTR("AKGenericError"), 0);
      v12 = (__CFError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

+ (void)signData:(os_log_t)log withKey:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Failed to generate signature: unknown error!", v1, 2u);
}

+ (void)signData:(uint64_t)a1 withKey:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to generate signature: %@", (uint8_t *)&v2, 0xCu);
}

@end
