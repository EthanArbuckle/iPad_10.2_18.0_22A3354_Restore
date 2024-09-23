@implementation ICCipherV1

+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  size_t v17;
  id v18;
  const uint8_t *v19;
  size_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v10, "length") == 16)
    {
      v31 = a6;
      if (a5 - 0x100000000 <= 0xFFFFFFFF00000000)
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:].cold.1(v11);

        LODWORD(a5) = 20000;
      }
      objc_msgSend(v9, "precomposedStringWithCanonicalMapping");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_retainAutorelease(v13);
      v16 = (const char *)objc_msgSend(v15, "bytes");
      v17 = objc_msgSend(v15, "length");
      v18 = objc_retainAutorelease(v10);
      v19 = (const uint8_t *)objc_msgSend(v18, "bytes");
      v20 = objc_msgSend(v18, "length");
      v21 = objc_retainAutorelease(v14);
      v22 = CCKeyDerivationPBKDF(2u, v16, v17, v19, v20, 3u, a5, (uint8_t *)objc_msgSend(v21, "mutableBytes"), objc_msgSend(v21, "length"));
      if ((_DWORD)v22)
      {
        if (v31)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v32 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCKeyDerivationPBKDF() key derivation failed with status %d"), v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 13, v25);
          *v31 = (id)objc_claimAutoreleasedReturnValue();

        }
        v26 = 0;
      }
      else
      {
        v26 = v21;
      }

      goto LABEL_18;
    }
    if (a6)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Salt length is %lu, but should be %lu"), objc_msgSend(v10, "length"), 16);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v35 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 12, v29);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      goto LABEL_18;
    }
  }
  else if (a6)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("Passphrase is nil or zero length");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 18, v15);
    v26 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v26 = 0;
LABEL_19:

  return v26;
}

+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICAESCipherUtils _ic_wrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:](ICAESCipherUtils, "_ic_wrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:", a3, a4, 16, 24, a5);
}

+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICAESCipherUtils _ic_unwrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:](ICAESCipherUtils, "_ic_unwrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:", a3, a4, 16, 24, a5);
}

+ (id)encryptData:(id)a3 withKey:(id)a4 tag:(id *)a5 initializationVector:(id *)a6 error:(id *)a7
{
  return +[ICAESCipherUtils _ic_encrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:outputTag:standardTagLength:outputInitializationVector:standardInitializationVectorLength:error:](ICAESCipherUtils, "_ic_encrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:outputTag:standardTagLength:outputInitializationVector:standardInitializationVectorLength:error:", a3, a4, 16, 0, a5, 16, a6, 16, a7);
}

+ (id)decryptData:(id)a3 withKey:(id)a4 tag:(id)a5 initializationVector:(id)a6 error:(id *)a7
{
  return +[ICAESCipherUtils _ic_decrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:inputTag:standardTagLength:inputInitializationVector:standardInitializationVectorLength:error:](ICAESCipherUtils, "_ic_decrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:inputTag:standardTagLength:inputInitializationVector:standardInitializationVectorLength:error:", a3, a4, 16, 0, a5, 16, a6, 16, a7);
}

+ (void)keyForPassphrase:(os_log_t)log salt:iterationCount:error:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 20000;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Attempting to derive key with an invalid iteration count, using default v1 iteration count %lu", (uint8_t *)&v1, 0xCu);
}

@end
