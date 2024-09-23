@implementation NSData

uint64_t __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(*(id *)(a1 + 40), "length");
    v8 = 134218240;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "failed to encrypt data due to invalid key (plaintext length = %lu, key length = %lu)", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = objc_msgSend(v4, "length");
    v7 = objc_msgSend(*(id *)(a1 + 40), "length");
    v9[0] = 67109632;
    v9[1] = v3;
    v10 = 2048;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "failed to encrypt data with CC error: %d (plaintext length = %lu, key length = %lu)", (uint8_t *)v9, 0x1Cu);

  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(*(id *)(a1 + 40), "length");
    v8 = 134218240;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "failed to decrypt data due to invalid key (ciphertext length = %lu, key length = %lu)", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = objc_msgSend(v4, "length");
    v7 = objc_msgSend(*(id *)(a1 + 40), "length");
    v9[0] = 67109632;
    v9[1] = v3;
    v10 = 2048;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "failed to decrypt data with CC error: %d (ciphertext length = %lu, key length = %lu)", (uint8_t *)v9, 0x1Cu);

  }
  return 0;
}

@end
