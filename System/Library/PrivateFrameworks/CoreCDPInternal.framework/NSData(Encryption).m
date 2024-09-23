@implementation NSData(Encryption)

- (id)AESGCM256EncryptedDataWithSymmetricKey:()Encryption
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  const void *v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEC8];
  v6 = IV_LENGTH;
  v7 = objc_msgSend(a1, "length");
  objc_msgSend(v5, "dataWithLength:", v7 + v6 + TAG_LENGTH);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_randomDataGeneratorWithNumberOfBytes:", IV_LENGTH);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v38 = v4;
    v10 = objc_retainAutorelease(v4);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = objc_retainAutorelease(v9);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    v12 = objc_retainAutorelease(a1);
    objc_msgSend(v12, "bytes");
    v13 = objc_msgSend(v12, "length");
    v37 = v8;
    v14 = objc_retainAutorelease(v8);
    v15 = objc_msgSend(v14, "mutableBytes");
    v16 = v15 + IV_LENGTH;
    v17 = objc_retainAutorelease(v14);
    v18 = objc_msgSend(v17, "mutableBytes");
    v19 = IV_LENGTH;
    v35 = v18 + v19 + objc_msgSend(v12, "length");
    v36 = TAG_LENGTH;
    v20 = CCCryptorGCMOneshotEncrypt();
    if ((_DWORD)v20)
    {
      v21 = v20;
      _CDPLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NSData(Encryption) AESGCM256EncryptedDataWithSymmetricKey:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

      v29 = 0;
    }
    else
    {
      v31 = objc_retainAutorelease(v17);
      v32 = (void *)objc_msgSend(v31, "mutableBytes", v13, v16, v35, v36);
      v33 = (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
      memcpy(v32, v33, IV_LENGTH);
      v29 = (void *)objc_msgSend(v31, "copy");
    }
    v8 = v37;
    v4 = v38;
  }
  else
  {
    _CDPLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[NSData(Encryption) AESGCM256EncryptedDataWithSymmetricKey:].cold.1(v30);

    v29 = 0;
  }

  return v29;
}

- (id)AESGCM256DecryptedDataWithSymmetricKey:()Encryption
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;

  v4 = (void *)MEMORY[0x24BDBCEC8];
  v5 = a3;
  v6 = objc_msgSend(a1, "length");
  objc_msgSend(v4, "dataWithLength:", v6 - (IV_LENGTH + TAG_LENGTH));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", IV_LENGTH);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (void *)objc_msgSend(v8, "mutableBytes");
  v10 = objc_retainAutorelease(a1);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  memcpy(v9, v11, IV_LENGTH);
  v12 = objc_retainAutorelease(v5);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");

  v13 = objc_retainAutorelease(v8);
  objc_msgSend(v13, "bytes");
  objc_msgSend(v13, "length");
  v14 = objc_retainAutorelease(v10);
  objc_msgSend(v14, "bytes");
  v15 = objc_msgSend(v7, "length");
  v16 = objc_retainAutorelease(v7);
  v17 = objc_msgSend(v16, "mutableBytes");
  v18 = objc_msgSend(objc_retainAutorelease(v14), "bytes") + IV_LENGTH;
  v30 = v18 + objc_msgSend(v16, "length");
  v31 = TAG_LENGTH;
  v19 = CCCryptorGCMOneshotDecrypt();
  if ((_DWORD)v19)
  {
    v20 = v19;
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[NSData(Encryption) AESGCM256DecryptedDataWithSymmetricKey:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    v28 = 0;
  }
  else
  {
    v28 = (void *)objc_msgSend(v16, "copy", v15, v17, v30, v31);
  }

  return v28;
}

- (id)_randomDataGeneratorWithNumberOfBytes:()Encryption
{
  char *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = (char *)v6 - ((count + 15) & 0xFFFFFFFFFFFFFFF0);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], count, v4))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, count);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)AESGCM256EncryptedDataWithSymmetricKey:()Encryption .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Failed to generate random IV data. Can't perform encryption.\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)AESGCM256EncryptedDataWithSymmetricKey:()Encryption .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_20DB2C000, a2, a3, "\"Failed to encrypt data with status: %d\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)AESGCM256DecryptedDataWithSymmetricKey:()Encryption .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_20DB2C000, a2, a3, "\"Failed to decrypt data with status: %d\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

@end
