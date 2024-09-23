@implementation ECDKIMCryptoUtil

void ___ef_log_ECDKIMCryptoUtil_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECDKIMCryptoUtil");
  v1 = (void *)_ef_log_ECDKIMCryptoUtil_log;
  _ef_log_ECDKIMCryptoUtil_log = (uint64_t)v0;

}

+ (BOOL)verifySignedData:(id)a3 withSignatureData:(id)a4 publicKeyData:(id)a5 hashingAlgorithm:(unint64_t)a6 error:(id *)a7
{
  id v11;
  const __CFData *v12;
  const __CFData *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  __SecKey *v16;
  id v17;
  const __CFData *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFError *v45;
  CFErrorRef error;
  unsigned __int8 md[40];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (const __CFData *)a4;
  v13 = (const __CFData *)a5;
  if (v12)
  {
    error = 0;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v15 = Mutable;
    if (!Mutable)
    {
      v19 = 0;
LABEL_28:
      if (error)
      {
        if (a7)
        {
          v45 = objc_retainAutorelease(error);
          *a7 = v45;

        }
        else
        {
          CFRelease(error);
        }
      }
      v28 = v19 == 1;
      goto LABEL_33;
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A38], (const void *)*MEMORY[0x1E0CD6A70]);
    CFDictionaryAddValue(v15, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A10]);
    CFDictionaryAddValue(v15, (const void *)*MEMORY[0x1E0CD7020], (const void *)*MEMORY[0x1E0C9AE50]);
    v16 = SecKeyCreateWithData(v13, v15, &error);
    if (v16)
    {
      if (a6 == 1)
      {
        *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)md = v36;
        *(_OWORD *)&md[16] = v36;
        v37 = objc_retainAutorelease(v11);
        CC_SHA256((const void *)objc_msgSend(v37, "bytes"), objc_msgSend(v37, "length"), md);
        v18 = CFDataCreate(0, md, 32);
        v19 = SecKeyVerifySignature(v16, (SecKeyAlgorithm)*MEMORY[0x1E0CD6E68], v18, v12, &error);
        if (!v19)
        {
          _ef_log_ECDKIMCryptoUtil();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:].cold.3((uint64_t)&error, v38, v39, v40, v41, v42, v43, v44);

        }
        goto LABEL_25;
      }
      if (!a6)
      {
        memset(md, 170, 20);
        v17 = objc_retainAutorelease(v11);
        CC_SHA1((const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), md);
        v18 = CFDataCreate(0, md, 20);
        v19 = SecKeyVerifySignature(v16, (SecKeyAlgorithm)*MEMORY[0x1E0CD6E58], v18, v12, &error);
        if (!v19)
        {
          _ef_log_ECDKIMCryptoUtil();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:].cold.3((uint64_t)&error, v20, v21, v22, v23, v24, v25, v26);

        }
LABEL_25:
        CFRelease(v18);
LABEL_26:
        CFRelease(v15);
        if (v16)
          CFRelease(v16);
        goto LABEL_28;
      }
    }
    else
    {
      _ef_log_ECDKIMCryptoUtil();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:].cold.2((uint64_t)&error, v29, v30, v31, v32, v33, v34, v35);

    }
    v19 = 0;
    goto LABEL_26;
  }
  _ef_log_ECDKIMCryptoUtil();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:].cold.1(v27);

  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67688, 0);
    v28 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_33:

  return v28;
}

+ (void)verifySignedData:(os_log_t)log withSignatureData:publicKeyData:hashingAlgorithm:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9ADE000, log, OS_LOG_TYPE_ERROR, "Unable to verify signed data because signature is nil.", v1, 2u);
}

+ (void)verifySignedData:(uint64_t)a3 withSignatureData:(uint64_t)a4 publicKeyData:(uint64_t)a5 hashingAlgorithm:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9ADE000, a2, a3, "Unable to get SecKeyRef with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)verifySignedData:(uint64_t)a3 withSignatureData:(uint64_t)a4 publicKeyData:(uint64_t)a5 hashingAlgorithm:(uint64_t)a6 error:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9ADE000, a2, a3, "Unable to verify signature with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
