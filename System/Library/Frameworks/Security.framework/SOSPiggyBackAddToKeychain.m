@implementation SOSPiggyBackAddToKeychain

void __SOSPiggyBackAddToKeychain_block_invoke_9(uint64_t a1, void *a2)
{
  const __CFData *v2;
  const __CFDictionary *v3;
  __SecKey *v4;
  __SecKey *v5;
  SecKeyRef v6;
  SecKeyRef v7;
  __CFData *v8;
  CFStringRef v9;
  void *v10;
  uint64_t v11;
  const __CFData *v12;
  void *v13;
  const __CFDictionary *v14;
  OSStatus v15;
  void *v16;
  const __CFDictionary *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFDictionary *v22;
  uint8_t buf[4];
  OSStatus v24;
  const __CFString *v25;
  const __CFData *v26;
  _QWORD v27[8];
  _QWORD v28[8];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v29[0] = CFSTR("kcls");
  v29[1] = CFSTR("type");
  v30[0] = CFSTR("1");
  v30[1] = CFSTR("73");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v4 = SecKeyCreateWithData(v2, v3, 0);
  if (!v4)
  {
    secLogObjForScope("piggy");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "privKey failed to be created", buf, 2u);
    }

    goto LABEL_25;
  }
  v5 = v4;
  v6 = SecKeyCopyPublicKey(v4);
  if (!v6)
  {
    secLogObjForScope("piggy");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "public key failed to be created", buf, 2u);
    }

    CFRelease(v5);
LABEL_25:
    v14 = 0;
    goto LABEL_16;
  }
  v7 = v6;
  v8 = SecKeyCopyPublicKeyHash(v6);
  if (v8)
  {
    v22 = v3;
    v9 = SOSCopyIDOfKey((uint64_t)v7, 0);
    v27[0] = CFSTR("class");
    v27[1] = CFSTR("nleg");
    v28[0] = CFSTR("keys");
    v28[1] = MEMORY[0x1E0C9AAB0];
    v27[2] = CFSTR("agrp");
    v27[3] = CFSTR("klbl");
    v28[2] = CFSTR("com.apple.security.sos");
    v28[3] = v8;
    v27[4] = CFSTR("labl");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cloud Identity-piggy-%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C9AE50];
    v28[4] = v10;
    v28[5] = v11;
    v27[5] = CFSTR("sync");
    v27[6] = CFSTR("u_Tomb");
    v27[7] = CFSTR("v_Data");
    v28[6] = v11;
    v28[7] = v2;
    v12 = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __CFDictionary *)objc_msgSend(v13, "mutableCopy");

    v15 = SecItemAdd(v14, 0);
    if (v15 == -25299)
    {
      v25 = CFSTR("v_Data");
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (const __CFDictionary *)objc_msgSend(v16, "mutableCopy");

      -[__CFDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, CFSTR("v_Data"));
      v15 = SecItemUpdate(v14, v17);

    }
    if (!v15)
    {
      v3 = v22;
      v2 = v12;
      goto LABEL_12;
    }
    secLogObjForScope("SecError");
    v18 = objc_claimAutoreleasedReturnValue();
    v2 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v24 = v15;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't save backupV0 to keychain %d", buf, 8u);
    }
    v3 = v22;
  }
  else
  {
    secLogObjForScope("piggy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "can't create public key hash", buf, 2u);
    }
    v9 = 0;
    v14 = 0;
  }

LABEL_12:
  CFRelease(v7);
  CFRelease(v5);
  if (v9)
    CFRelease(v9);
  if (v8)
    CFRelease(v8);
LABEL_16:
  secLogObjForScope("piggy");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "key not available", buf, 2u);
  }

}

void __SOSPiggyBackAddToKeychain_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  OSStatus v12;
  void *v13;
  const __CFDictionary *v14;
  NSObject *v15;
  uint8_t buf[4];
  OSStatus v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[11];
  _QWORD v21[12];

  v21[11] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("v_Data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("acct"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("srvr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "base64EncodedDataWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("class");
  v20[1] = CFSTR("nleg");
  v7 = MEMORY[0x1E0C9AAB0];
  v21[0] = CFSTR("inet");
  v21[1] = MEMORY[0x1E0C9AAB0];
  v20[2] = CFSTR("agrp");
  v20[3] = CFSTR("desc");
  v21[2] = CFSTR("com.apple.security.ckks");
  v21[3] = CFSTR("tlk-piggy");
  v8 = *MEMORY[0x1E0C9AE40];
  v20[4] = CFSTR("sync");
  v20[5] = CFSTR("vwht");
  v21[4] = v8;
  v21[5] = CFSTR("PCS-MasterKey");
  v21[6] = v5;
  v20[6] = CFSTR("srvr");
  v20[7] = CFSTR("acct");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-piggy"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v9;
  v21[8] = v4;
  v20[8] = CFSTR("path");
  v20[9] = CFSTR("invi");
  v20[10] = CFSTR("v_Data");
  v21[9] = v7;
  v21[10] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFDictionary *)objc_msgSend(v10, "mutableCopy");

  v12 = SecItemAdd(v11, 0);
  if (v12 == -25299)
  {
    v18 = CFSTR("v_Data");
    v19 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __CFDictionary *)objc_msgSend(v13, "mutableCopy");

    v12 = SecItemUpdate(v11, v14);
  }
  if (v12)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v12;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't save tlks to keychain %d", buf, 8u);
    }

  }
}

@end
