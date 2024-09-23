@implementation CoreCryptoP256Private

- (CoreCryptoP256Private)initWithKey:(ccec_full_ctx *)a3
{
  CoreCryptoP256Private *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CoreCryptoP256Private;
  result = -[CoreCryptoP256Private init](&v5, sel_init);
  if (result)
    result->_full_key = a3;
  return result;
}

+ (id)generate
{
  _QWORD *v3;
  void *v4;
  int key;
  void *v6;
  int v7;
  NSObject *v8;

  v3 = (_QWORD *)MEMORY[0x20BD3BE74](a1, a2);
  v4 = malloc_type_malloc((32 * *v3) | 0x10, 0x1B4A19E0uLL);
  ccrng();
  key = ccec_compact_generate_key();
  if (key)
  {
    v7 = key;
    MessageProtectionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CoreCryptoP256Private generate].cold.1(v7, v8);

    free(v4);
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:", v4);
  }
  return v6;
}

- (id)keyAgreement:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  uint64_t v10;

  objc_msgSend(a3, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    MPLogAndAssignError(7, a4, CFSTR("Failed to obtain data for the public key."));
    v6 = 0;
    goto LABEL_12;
  }
  MEMORY[0x20BD3BE74]();
  MEMORY[0x24BDAC7A8]();
  objc_msgSend(v5, "length");
  objc_msgSend(objc_retainAutorelease(v5), "bytes");
  if (!ccec_compact_import_pub())
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32);
    if (ccrng())
    {
      v8 = objc_retainAutorelease(v7);
      objc_msgSend(v8, "mutableBytes");
      if (!ccecdh_compute_shared_secret())
      {
        v6 = v8;
LABEL_11:

        goto LABEL_12;
      }
      v9 = CFSTR("Failure to compute a shared secret with corecrypto.");
      v10 = 405;
    }
    else
    {
      v9 = CFSTR("Failed to initialize masking rng for corecrypto key agreement.");
      v10 = 7;
    }
    MPLogAndAssignError(v10, a4, v9);
    v6 = 0;
    goto LABEL_11;
  }
  MPLogAndAssignError(7, a4, CFSTR("Failed to initialize compact corecrypto public key."));
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)publicKey
{
  id v2;
  SecKeyP256Public *v3;
  uint64_t v5;

  v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (unint64_t)(cczp_bitlen() + 7) >> 3));
  objc_msgSend(v2, "mutableBytes");
  ccec_compact_export_pub();
  v5 = 0;
  v3 = -[SecKeyP256Public initWithData:error:]([SecKeyP256Public alloc], "initWithData:error:", v2, &v5);

  return v3;
}

- (void)dealloc
{
  ccec_full_ctx *full_key;
  objc_super v4;

  full_key = self->_full_key;
  if (full_key)
    free(full_key);
  v4.receiver = self;
  v4.super_class = (Class)CoreCryptoP256Private;
  -[CoreCryptoP256Private dealloc](&v4, sel_dealloc);
}

- (id)keychainData
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  MessageProtectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[CoreCryptoP256Private keychainData].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_alloc_init(MEMORY[0x24BDBCE50]);
}

- (id)signData:(id)a3 error:(id *)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  MessageProtectionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[CoreCryptoP256Private signData:error:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (CoreCryptoP256Private)initWithData:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  MessageProtectionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[CoreCryptoP256Private initWithData:error:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  return 0;
}

- (ccec_full_ctx)full_key
{
  return self->_full_key;
}

- (void)setFull_key:(ccec_full_ctx *)a3
{
  self->_full_key = a3;
}

+ (void)generate
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Failed to generate an ephemeral ECDH key error code: %i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_1();
}

- (void)keychainData
{
  OUTLINED_FUNCTION_0_4(&dword_20BABB000, a1, a3, "Reached the unimplemented keychainData method on CoreCryptoP256.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)signData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_20BABB000, a1, a3, "Reached the unimplemented sign method on CoreCryptoP256.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_20BABB000, a1, a3, "Reached the unimplemented initWithData method on CoreCryptoP256.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
