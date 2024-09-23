@implementation LAKeyStoreKey

void __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, void *a4)
{
  void (**v6)(id, CFErrorRef);
  CFDataRef v7;
  uint64_t v8;
  void *v9;
  CFErrorRef error;

  error = 0;
  v6 = a4;
  v7 = SecKeyCopyExternalRepresentation(a3, &error);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v6[2](v6, error);
}

uint64_t __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke(_QWORD *a1, __SecKey *a2, uint64_t a3, void *a4)
{
  const __CFString *v6;
  const __CFData *v7;
  void (**v8)(id, CFErrorRef);
  CFDataRef v9;
  uint64_t v10;
  void *v11;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFString *)a1[6];
  v7 = (const __CFData *)a1[4];
  v8 = a4;
  v9 = SecKeyCreateSignature(a2, v6, v7, &error);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke(_QWORD *a1, __SecKey *a2, uint64_t a3, void *a4)
{
  const __CFString *v6;
  const __CFData *v7;
  void (**v8)(id, CFErrorRef);
  CFDataRef v9;
  uint64_t v10;
  void *v11;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFString *)a1[6];
  v7 = (const __CFData *)a1[4];
  v8 = a4;
  v9 = SecKeyCreateDecryptedData(a2, v6, v7, &error);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  __SecKey *v6;
  void (**v7)(id, void *);
  const __CFData *v8;
  uint64_t v9;
  uint64_t v10;
  __SecKey *v11;
  CFErrorRef v12;
  CFDataRef v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CFErrorRef v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v17 = 0;
  v8 = *(const __CFData **)(a1 + 32);
  v9 = *MEMORY[0x1E0CD69F8];
  v18[0] = *MEMORY[0x1E0CD6A38];
  v18[1] = v9;
  v10 = *MEMORY[0x1E0CD6A10];
  v19[0] = *MEMORY[0x1E0CD6A50];
  v19[1] = v10;
  v11 = SecKeyCreateWithData(v8, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2), &v17);
  v12 = v17;
  if (!v11 || v17)
  {
    if (!v17)
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Cannot perform a key exchange with the given public key."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v16);

      goto LABEL_6;
    }
  }
  else
  {
    v13 = SecKeyCopyKeyExchangeResult(v6, *(SecKeyAlgorithm *)(a1 + 56), v11, *(CFDictionaryRef *)(a1 + 40), &v17);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v12 = v17;
  }
  v7[2](v7, v12);
LABEL_6:

}

uint64_t __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke(_QWORD *a1, uint64_t a2, __SecKey *a3, void *a4)
{
  const __CFString *v6;
  const __CFData *v7;
  void (**v8)(id, CFErrorRef);
  CFDataRef v9;
  uint64_t v10;
  void *v11;
  CFErrorRef error;

  error = 0;
  v6 = (const __CFString *)a1[6];
  v7 = (const __CFData *)a1[4];
  v8 = a4;
  v9 = SecKeyCreateEncryptedData(a3, v6, v7, &error);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    v5 = 0;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __66___LAKeyStoreKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke(_QWORD *a1, uint64_t a2, __SecKey *a3, void *a4)
{
  const __CFString *v5;
  const __CFData *v6;
  const __CFData *v7;
  void (**v8)(id, CFErrorRef);
  CFErrorRef error;

  error = 0;
  v6 = (const __CFData *)a1[5];
  v5 = (const __CFString *)a1[6];
  v7 = (const __CFData *)a1[4];
  v8 = a4;
  SecKeyVerifySignature(a3, v5, v7, v6, &error);
  v8[2](v8, error);

}

void __68___LAKeyStoreKey__performOperationWithContext_operation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  SecKeySetParameter();
  if (v3)
    v4 = v3;
  else
    v4 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);

}

@end
