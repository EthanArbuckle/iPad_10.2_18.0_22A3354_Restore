@implementation NSData(AppleMediaServices)

- (uint64_t)ams_compressedData
{
  return objc_msgSend(a1, "ams_compressWithAlgorithm:", 1);
}

- (id)ams_compressWithAlgorithm:()AppleMediaServices
{
  void *v3;

  if (!a3)
  {
    objc_msgSend(a1, "_compressLZMA");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "_compressGZIP");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return a2;
}

- (uint64_t)ams_decompressedData
{
  return objc_msgSend(a1, "ams_decompressWithAlgorithm:", 1);
}

- (id)ams_decompressWithAlgorithm:()AppleMediaServices
{
  void *v3;

  if (!a3)
  {
    objc_msgSend(a1, "_decompressLZMA");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "_decompressGZIP");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return a2;
}

- (id)_decompressGZIP
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  _BYTE v6[16392];
  z_stream strm;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(a1, "length");
  strm.next_in = (Bytef *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v2 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v6;
      v3 = inflate(&strm, 0);
      if (v3 > 1)
        break;
      v4 = v3;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v2, "appendBytes:length:", v6, 0x4000 - strm.avail_out);
      if (v4)
      {
        inflateEnd(&strm);
        return v2;
      }
    }
    inflateEnd(&strm);

    v2 = 0;
  }
  return v2;
}

- (id)ams_decryptUsingDataProtectionClass:()AppleMediaServices initializationVectorData:tagData:error:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99D50], "_AESKeyForDataProtectionClass:error:", a3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1, "ams_decryptUsingKey:initializationVectorData:tagData:error:", v12, v10, v11, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = objc_opt_class();
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get the AES key. Data decryption will fail. dataProtectionClass = %lu", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)ams_decryptUsingKey:()AppleMediaServices initializationVectorData:tagData:error:
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99DF0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dataWithLength:", objc_msgSend(a1, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v12);
  objc_msgSend(v14, "bytes");
  objc_msgSend(v14, "length");

  v15 = objc_retainAutorelease(v11);
  objc_msgSend(v15, "bytes");
  objc_msgSend(v15, "length");

  v16 = objc_retainAutorelease(a1);
  objc_msgSend(v16, "bytes");
  v17 = objc_msgSend(v16, "length");
  v18 = objc_retainAutorelease(v13);
  v19 = objc_msgSend(v18, "mutableBytes");
  v20 = objc_retainAutorelease(v10);
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_msgSend(v20, "length");

  v23 = CCCryptorGCMOneshotDecrypt();
  if ((_DWORD)v23)
  {
    v24 = v23;
    v25 = v18;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v17, v19, v21, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = objc_opt_class();
      v38 = 1024;
      v39 = v24;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Data decryption failed. status = %d", buf, 0x12u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decrypt data. status = %d"), v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("AMSCryptoErrorCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      AMSCustomError(CFSTR("AMSErrorDomain"), 4, CFSTR("Data Encryption"), v28, v30, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = 0;
  }
  else
  {
    v31 = v18;
    v25 = v18;
  }

  return v31;
}

+ (id)_AESKeyForDataProtectionClass:()AppleMediaServices error:
{
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFDictionary *Mutable;
  const void *v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[9];
  _QWORD block[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint8_t v37[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_158 != -1)
    dispatch_once(&_MergedGlobals_158, &__block_literal_global_143);
  v7 = (id)qword_1ECEADA28;
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Running unit tests. We won't go to the keychain for the AES key. dataProtectionClass = %lu", buf, 0x16u);
    }

    +[AMSUnitTests encryptionKeyForDataProtectionClass:](AMSUnitTests, "encryptionKeyForDataProtectionClass:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1ECEADA30 != -1)
      dispatch_once(&qword_1ECEADA30, &__block_literal_global_27_1);
    v11 = (id)qword_1ECEADA38;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__77;
    v45 = __Block_byref_object_dispose__77;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v13)
    {
      v10 = v13;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("apple"));
      v15 = (const void *)objc_msgSend(a1, "_labelForDataProtectionClass:", a3);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6900], v15);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A18]);
      v16 = (const void *)objc_msgSend(a1, "_labelForDataProtectionClass:", a3);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], v16);
      v17 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70A8], (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], v17);
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v18 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_29;
      block[3] = &unk_1E2547920;
      block[4] = &v33;
      block[5] = buf;
      block[6] = Mutable;
      dispatch_sync(v7, block);
      if (*((_DWORD *)v34 + 6) == -25300)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v19, "OSLogObject");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_opt_class();
          *(_DWORD *)v37 = 138543618;
          v38 = v21;
          v39 = 2048;
          v40 = a3;
          _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating an AMSDataProtectionClass encryption/decryption key. dataProtectionClass = %lu", v37, 0x16u);
        }

        v31[0] = v18;
        v31[1] = 3221225472;
        v31[2] = __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_30;
        v31[3] = &unk_1E2547948;
        v31[6] = Mutable;
        v31[7] = a1;
        v31[8] = a3;
        v31[4] = &v33;
        v31[5] = buf;
        dispatch_barrier_sync(v7, v31);
      }
      CFRelease(Mutable);
      if (*((_DWORD *)v34 + 6))
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = objc_opt_class();
          v25 = *((_DWORD *)v34 + 6);
          *(_DWORD *)v37 = 138543874;
          v38 = v24;
          v39 = 2048;
          v40 = a3;
          v41 = 1024;
          v42 = v25;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch an AMSDataProtectionClass encryption/decryption key. dataProtectionClass = %lu | error = %d", v37, 0x1Cu);
        }

        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to fetch an AMSDataProtectionClass encryption/decryption key. error = %d"), *((unsigned int *)v34 + 6));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          AMSError(0, CFSTR("Data Encryption"), v26, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v10 = 0;
      }
      else
      {
        v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, v28);

          v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
        }
        else
        {
          v29 = 0;
        }
        v10 = v29;
      }
      _Block_object_dispose(&v33, 8);
    }
    _Block_object_dispose(buf, 8);

  }
  return v10;
}

+ (const)_labelForDataProtectionClass:()AppleMediaServices
{
  if (a3)
    return CFSTR("AMS Class C Encryption Key");
  else
    return CFSTR("None");
}

- (id)_compressGZIP
{
  void *v2;
  id v3;
  Bytef *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  z_stream v12;

  v2 = (void *)MEMORY[0x18D78A1C4]();
  v3 = objc_retainAutorelease(a1);
  v4 = (Bytef *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = 0;
  if (v4)
  {
    v7 = v5;
    if (v5)
    {
      memset(&v12.avail_in, 0, 104);
      v12.avail_in = v5;
      v12.avail_out = v5;
      v12.next_in = v4;
      v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v5));
      v12.next_out = (Bytef *)objc_msgSend(v8, "mutableBytes", v12.next_in, *(_QWORD *)&v12.avail_in);
      if (v8
        && !deflateInit2_(&v12, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (v9 = deflate(&v12, 4), v10 = deflateEnd(&v12), v9 == 1)
        && !v10
        && v7 == v12.total_in)
      {
        objc_msgSend(v8, "setLength:", v12.total_out);
        v6 = (void *)objc_msgSend(v8, "copy");
      }
      else
      {
        v6 = 0;
      }

    }
  }
  objc_autoreleasePoolPop(v2);
  return v6;
}

- (id)ams_SHA1
{
  void *v2;
  id v3;
  const void *v4;
  id v5;
  void *v6;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 20);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_retainAutorelease(a1);
    v4 = (const void *)objc_msgSend(v3, "bytes");
    LODWORD(v3) = objc_msgSend(v3, "length");
    v5 = objc_retainAutorelease(v2);
    CC_SHA1(v4, (CC_LONG)v3, (unsigned __int8 *)objc_msgSend(v5, "mutableBytes"));
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)ams_hexAddressDescription
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "string");
}

- (uint64_t)ams_nvramDescription
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "string");
}

- (id)_compressLZMA
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D78A1C4]();
  v10 = 0;
  objc_msgSend(a1, "compressedDataUsingAlgorithm:error:", 2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error compressing LZMA data. %{public}@", buf, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)_decompressLZMA
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D78A1C4]();
  v10 = 0;
  objc_msgSend(a1, "decompressedDataUsingAlgorithm:error:", 2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error decompressing LZMA data. %{public}@", buf, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)ams_encryptDataUsingDataProtectionClass:()AppleMediaServices error:
{
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "_AESKeyForDataProtectionClass:error:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "ams_encryptDataUsingKey:error:", v8, a3);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543618;
      v12 = objc_opt_class();
      v13 = 2048;
      v14 = a2;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get the AES key. Data encryption will fail. dataProtectionClass = %lu", (uint8_t *)&v11, 0x16u);
    }

    __copy_constructor_8_8_s0_s8_s16(a4);
  }

}

- (void)ams_encryptDataUsingKey:()AppleMediaServices error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (objc_msgSend(v7, "length") == 32)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "_generateInitializationVectorDataWithError:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v28 = a3;
      v30 = a4;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(a1, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_retainAutorelease(v7);
      objc_msgSend(v11, "bytes");
      objc_msgSend(v11, "length");
      v29 = v8;
      v12 = objc_retainAutorelease(v8);
      objc_msgSend(v12, "bytes");
      objc_msgSend(v12, "length");
      v13 = objc_retainAutorelease(a1);
      objc_msgSend(v13, "bytes");
      v14 = objc_msgSend(v13, "length");
      v15 = objc_retainAutorelease(v10);
      v16 = objc_msgSend(v15, "mutableBytes");
      v17 = objc_retainAutorelease(v9);
      v26 = objc_msgSend(v17, "mutableBytes");
      v27 = objc_msgSend(v17, "length");
      v18 = CCCryptorGCMOneshotEncrypt();
      if ((_DWORD)v18)
      {
        v19 = v18;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v14, v16, v26, v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v32 = objc_opt_class();
          v33 = 1024;
          LODWORD(v34) = v19;
          _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Data encryption failed. status = %d", buf, 0x12u);
        }

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to encrypt data. status = %d"), v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          AMSError(3, CFSTR("Data Encryption"), v22, 0);
          *v28 = (id)objc_claimAutoreleasedReturnValue();

        }
        __copy_constructor_8_8_s0_s8_s16(v30);
      }
      else
      {
        *v30 = v15;
        v30[1] = v12;
        v30[2] = v17;
      }
      v8 = v29;

    }
    else
    {
      __copy_constructor_8_8_s0_s8_s16(a4);
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v32 = objc_opt_class();
      v33 = 2048;
      v34 = objc_msgSend(v7, "length");
      v35 = 2048;
      v36 = 32;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: The encryption key isn't valid. Data encryption will fail. length = %lu, requiredLength = %lu", buf, 0x20u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The encryption key isn't valid. Data encryption will fail. length = %lu, requiredLength = %lu"), objc_msgSend(v7, "length"), 32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(3, CFSTR("Data Encryption"), v25, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    __copy_constructor_8_8_s0_s8_s16(a4);
  }

}

+ (id)ams_generateEncryptionKey
{
  id v0;
  CCRNGStatus Bytes;
  CCRNGStatus v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  CCRNGStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Bytes = CCRandomGenerateBytes((void *)objc_msgSend(v0, "mutableBytes"), 0x20uLL);
  if (Bytes)
  {
    v2 = Bytes;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543618;
      v8 = objc_opt_class();
      v9 = 1024;
      v10 = v2;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate an encryption/decryption key. status = %d", (uint8_t *)&v7, 0x12u);
    }

    v5 = 0;
  }
  else
  {
    v5 = v0;
  }

  return v5;
}

+ (uint64_t)_accessibleAttributeForDataProtectionClass:()AppleMediaServices
{
  if (a3 == 1)
    return *MEMORY[0x1E0CD68A8];
  else
    return 0;
}

+ (id)_generateInitializationVectorDataWithError:()AppleMediaServices
{
  id v4;
  uint64_t Bytes;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Bytes = CCRandomGenerateBytes((void *)objc_msgSend(v4, "mutableBytes"), 0x10uLL);
  if ((_DWORD)Bytes)
  {
    v6 = Bytes;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = objc_opt_class();
      v14 = 1024;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate IV data. Data encryption will fail. status = %d", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate IV data. status = %d"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      AMSError(3, CFSTR("Data Encryption"), v9, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v10 = 0;
  }
  else
  {
    v10 = v4;
  }

  return v10;
}

@end
