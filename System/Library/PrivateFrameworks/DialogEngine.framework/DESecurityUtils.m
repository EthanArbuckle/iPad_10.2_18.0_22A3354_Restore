@implementation DESecurityUtils

+ (id)getRandomKey
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  size_t v6;
  id v7;
  const uint8_t *v8;
  size_t v9;
  id v10;
  void *v11;
  id v12;
  void *v14;

  +[DESecurityUtils randomDataOfLength:](DESecurityUtils, "randomDataOfLength:", 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESecurityUtils randomDataOfLength:](DESecurityUtils, "randomDataOfLength:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(v14);
  v5 = (const char *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = objc_retainAutorelease(v2);
  v8 = (const uint8_t *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v3);
  if (CCKeyDerivationPBKDF(2u, v5, v6, v8, v9, 3u, 0x3E8u, (uint8_t *)objc_msgSend(v10, "mutableBytes"), objc_msgSend(v10, "length")))
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;

  return v12;
}

+ (id)getKeyFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  size_t v7;
  id v8;
  const uint8_t *v9;
  size_t v10;
  id v11;
  void *v12;
  id v13;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v15);
  v6 = (const char *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = (const uint8_t *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = objc_retainAutorelease(v3);
  if (CCKeyDerivationPBKDF(2u, v6, v7, v9, v10, 3u, 0x3E8u, (uint8_t *)objc_msgSend(v11, "mutableBytes"), objc_msgSend(v11, "length")))
  {
    v12 = 0;
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

+ (id)getRandomIV
{
  return +[DESecurityUtils randomDataOfLength:](DESecurityUtils, "randomDataOfLength:", 16);
}

+ (id)randomDataOfLength:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (void *)objc_msgSend(v4, "mutableBytes");
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], a3, v5))
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)sign:(id)a3 privateKey:(id)a4
{
  const __CFData *v5;
  const __CFData *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __SecKey *v10;
  CFErrorRef v11;
  CFDataRef v12;
  CFDataRef v13;
  CFErrorRef v14;
  _QWORD v16[5];
  CFErrorRef error;
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v6 = (const __CFData *)a4;
  v7 = *MEMORY[0x1E0CD6A00];
  v8 = *MEMORY[0x1E0CD6A38];
  v19[0] = *MEMORY[0x1E0CD69F8];
  v19[1] = v8;
  v9 = *MEMORY[0x1E0CD6A50];
  v20[0] = v7;
  v20[1] = v9;
  v19[2] = *MEMORY[0x1E0CD6A20];
  v20[2] = &unk_1E7944908;
  error = 0;
  v10 = SecKeyCreateWithData(v6, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3), &error);
  v11 = error;
  if (!error)
  {
    if (!v10)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to load private key"));
      goto LABEL_3;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __35__DESecurityUtils_sign_privateKey___block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0l;
    v16[4] = v10;
    error = 0;
    v18[0] = v16;
    v18[4] = 0;
    v13 = SecKeyCreateSignature(v10, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], v5, &error);
    v14 = error;
    if (error)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to sign: %@"), error);

    }
    else
    {
      v12 = v13;
      if (v13)
        goto LABEL_10;
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to sign"));
    }
    v12 = 0;
LABEL_10:
    siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v18);
    goto LABEL_11;
  }
  +[DELogging error:](DELogging, "error:", CFSTR("Failed to load private key: %@"), error);

LABEL_3:
  v12 = 0;
LABEL_11:

  return v12;
}

+ (BOOL)verify:(id)a3 expected:(id)a4 publicKey:(id)a5
{
  const __CFData *v7;
  const __CFData *v8;
  const __CFData *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __SecKey *v13;
  CFErrorRef v14;
  BOOL v15;
  CFErrorRef v16;
  _QWORD v18[5];
  CFErrorRef error;
  _QWORD v20[5];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFData *)a3;
  v8 = (const __CFData *)a4;
  v9 = (const __CFData *)a5;
  v10 = *MEMORY[0x1E0CD6A10];
  v11 = *MEMORY[0x1E0CD6A38];
  v21[0] = *MEMORY[0x1E0CD69F8];
  v21[1] = v11;
  v12 = *MEMORY[0x1E0CD6A50];
  v22[0] = v10;
  v22[1] = v12;
  v21[2] = *MEMORY[0x1E0CD6A20];
  v22[2] = &unk_1E7944908;
  error = 0;
  v13 = SecKeyCreateWithData(v9, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3), &error);
  v14 = error;
  if (error)
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to load public key: %@"), error);

LABEL_3:
    v15 = 0;
    goto LABEL_8;
  }
  if (!v13)
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to load public key"));
    goto LABEL_3;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__DESecurityUtils_verify_expected_publicKey___block_invoke;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = v13;
  v20[0] = v18;
  v20[4] = 0;
  v15 = SecKeyVerifySignature(v13, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], v8, v7, &error) != 0;
  v16 = error;
  if (error)
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to verify signature: %@"), error);

    v15 = 0;
  }
  siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v20);
LABEL_8:

  return v15;
}

void __45__DESecurityUtils_verify_expected_publicKey___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __35__DESecurityUtils_sign_privateKey___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
