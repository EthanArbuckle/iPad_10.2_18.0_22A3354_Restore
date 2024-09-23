@implementation BCCryptor

+ (void)encryptData:(id)a3 key:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t *v12;
  const __CFData *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  SecKeyRef v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, __SecKey *, void *);
  void *v31;
  id v32;
  id v33;
  CFErrorRef error;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  uint8_t v40[16];
  _QWORD v41[2];
  __int128 buf;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 1);
    if (v10)
    {
      LogCategory_Daemon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_21C655000, v11, OS_LOG_TYPE_DEFAULT, "BCCryptor: encrypt data for key %@", (uint8_t *)&buf, 0xCu);
      }

      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __40__BCCryptor_encryptData_key_completion___block_invoke;
      v31 = &unk_24E064F78;
      v33 = v9;
      v32 = v7;
      v12 = &v28;
      v13 = v10;
      objc_opt_self();
      v14 = *MEMORY[0x24BDE9038];
      v15 = *MEMORY[0x24BDE9050];
      v41[0] = *MEMORY[0x24BDE9028];
      v41[1] = v15;
      v16 = *MEMORY[0x24BDE9058];
      *(_QWORD *)&buf = v14;
      *((_QWORD *)&buf + 1) = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v41, 2, v28, v29);
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      error = 0;
      v18 = SecKeyCreateWithData(v13, v17, &error);

      LogCategory_Daemon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v40 = 138412290;
        *(_QWORD *)&v40[4] = error;
        _os_log_impl(&dword_21C655000, v19, OS_LOG_TYPE_DEFAULT, "BCCryptor: publicKeyFromData %@", v40, 0xCu);
      }

      if (v18)
      {
        v30((uint64_t)v12, v18, 0);
        CFRelease(v18);
      }
      else
      {
        v25 = objc_alloc(MEMORY[0x24BDD1540]);
        v39 = *MEMORY[0x24BDD0FC8];
        *(_QWORD *)v40 = CFSTR("Failed creating key");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.cryptor"), 2, v26);

        v30((uint64_t)v12, 0, v27);
      }

      v23 = v33;
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x24BDD1540]);
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = CFSTR("Key is not UTF8");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.cryptor"), 1, v23);
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v24);

    }
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x24BDD1540]);
    v37 = *MEMORY[0x24BDD0FC8];
    v38 = CFSTR("Empty string received for key");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.cryptor"), 0, v21);

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v10);
  }

}

void __40__BCCryptor_encryptData_key_completion___block_invoke(uint64_t a1, __SecKey *a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  CFDataRef v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  __CFError *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CFErrorRef error;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  CFErrorRef v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = a2;
    _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCCryptor: public key %@", buf, 0xCu);
  }

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (a2
         && (v7 = (const __CFString *)*MEMORY[0x24BDE92E0],
             SecKeyIsAlgorithmSupported(a2, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E0])))
  {
    error = 0;
    v8 = SecKeyCreateEncryptedData(a2, v7, *(CFDataRef *)(a1 + 32), &error);
    -[__CFData base64EncodedStringWithOptions:](v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = error;
      _os_log_impl(&dword_21C655000, v10, OS_LOG_TYPE_DEFAULT, "BCCryptor: Encryption result %@", buf, 0xCu);
    }

    LogCategory_Daemon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFData description](v8, "description");
      v12 = (__CFError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_21C655000, v11, OS_LOG_TYPE_DEFAULT, "BCCryptor: Encrypted data %@", buf, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v9, 0);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x24BDD1540]);
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("Unable to encrypt token");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.cryptor"), 4, v19);
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v20);

    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v24 = *MEMORY[0x24BDD0FC8];
    v25 = CFSTR("Public key invalid");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.cryptor"), 3, v16);
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v17);

  }
}

@end
