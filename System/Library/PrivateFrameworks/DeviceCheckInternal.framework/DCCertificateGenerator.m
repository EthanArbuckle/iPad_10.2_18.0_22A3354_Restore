@implementation DCCertificateGenerator

- (DCCertificateGenerator)initWithContext:(id)a3 publicKey:(id)a4
{
  id v7;
  id v8;
  DCCertificateGenerator *v9;
  DCCertificateGenerator *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[DCCertificateGenerator init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publicKey, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (int)keybagHandle
{
  return 0;
}

- (void)generateEncryptedCertificateChainWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__DCCertificateGenerator_generateEncryptedCertificateChainWithCompletion___block_invoke;
  v6[3] = &unk_24ED116B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DCCertificateGenerator _generateCertificateChainWithCompletion:](self, "_generateCertificateChainWithCompletion:", v6);

}

void __74__DCCertificateGenerator_generateEncryptedCertificateChainWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v9 = 0;
    objc_msgSend(v4, "_encryptData:serverSyncedDate:error:", a2, a3, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);

  }
}

- (BOOL)_isNSDate:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_generateCertificateChainWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[DCCryptoUtilities identityCertificateOptions](DCCryptoUtilities, "identityCertificateOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  DeviceIdentityIssueClientCertificateWithCompletion();

}

void __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke(uint64_t a1, const void *a2, void *a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  void *v17;
  const __CFData *v18;
  void *v19;
  void *v20;
  char *v21;
  int v22;
  int v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v59;
  id v61;
  uint64_t v62;
  void *v63;
  char v64;
  char v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  char __str[16];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[16];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _DCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FB2000, v7, OS_LOG_TYPE_DEFAULT, "Certificate issued, processing..", buf, 2u);
  }

  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v9 = objc_msgSend(v5, "count"), (v9 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    v11 = 0;
    v29 = 0;
    v37 = 0;
    v36 = v8;
    goto LABEL_25;
  }
  v56 = v8;
  v57 = v9;
  v64 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 1;
  v61 = v5;
  v62 = *MEMORY[0x24BDD0FC8];
  while (1)
  {
    v15 = v14;
    v16 = v12;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = SecCertificateCopyData((SecCertificateRef)v17);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    *(_OWORD *)buf = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    *(_OWORD *)__str = 0u;
    if (!v18)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v70 = v62;
      v71 = CFSTR("Invalid inputs.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, v31);
      v21 = (char *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      goto LABEL_18;
    }
    v65 = v16;
    v19 = (void *)MEMORY[0x22768F434]();
    -[__CFData base64EncodedDataWithOptions:](v18, "base64EncodedDataWithOptions:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (char *)objc_msgSend(v20, "length");
    if (v21)
    {
      v63 = v11;
      v22 = snprintf((char *)buf, 0x50uLL, "-----BEGIN %s-----\n", "CERTIFICATE");
      v23 = snprintf(__str, 0x50uLL, "\n-----END %s-----", "CERTIFICATE");
      v24 = &v21[v22 + v23];
      v25 = (char *)malloc_type_malloc((size_t)(v24 + 1), 0x95B21735uLL);
      if (v25)
      {
        v26 = v25;
        v27 = &strncpy(v25, (const char *)buf, v22)[v22];
        objc_msgSend(v20, "getBytes:range:", v27, 0, v21);
        strncpy(&v21[(_QWORD)v27], __str, v23);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v26, v24);
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          v21 = 0;
LABEL_16:
          v5 = v61;
          v11 = v63;
          goto LABEL_17;
        }
        v34 = (void *)MEMORY[0x24BDD1540];
        v70 = v62;
        v71 = CFSTR("Failed to create pem data.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, v35);
        v21 = (char *)objc_claimAutoreleasedReturnValue();

        free(v26);
      }
      else
      {
        v32 = (void *)MEMORY[0x24BDD1540];
        v70 = v62;
        v71 = CFSTR("Failed to allocate buffer.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, v33);
        v21 = (char *)objc_claimAutoreleasedReturnValue();

      }
      v29 = 0;
      goto LABEL_16;
    }
    v29 = 0;
LABEL_17:

    objc_autoreleasePoolPop(v19);
    v16 = v65;
LABEL_18:

    if (!v29)
      break;
    if (v11)
      objc_msgSend(v11, "appendBytes:length:", "\n", 1);
    else
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v29, "length"));
    objc_msgSend(v11, "appendData:", v29);
    v14 = 0;
    v12 = 1;
    v64 = v16;
    v10 = v29;
    v13 = 1;
    if ((v15 & 1) == 0)
    {
      v8 = v56;
      v36 = v56;
      goto LABEL_36;
    }
  }
  v46 = (void *)MEMORY[0x24BDD1540];
  v68 = v62;
  v69 = CFSTR("Failed to create PEM data from cert.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v56;

  v16 = v64;
LABEL_36:
  if (v57 == 3)
  {
    v48 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = objc_msgSend(v48, "_isNSDate:", v49);

    if ((_DWORD)v48)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v50 = objc_claimAutoreleasedReturnValue();

      _DCLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224FB2000, v51, OS_LOG_TYPE_DEFAULT, "Using synced timestamp...", buf, 2u);
      }

      v37 = v16 & 1;
      v59 = (void *)v50;
    }
    else
    {
      v53 = (void *)MEMORY[0x24BDD1540];
      v66 = v62;
      v67 = CFSTR("Expected date field, failing...");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.cryptoerror"), 0, v54);
      v55 = objc_claimAutoreleasedReturnValue();

      v37 = 0;
      v36 = (void *)v55;
    }
  }
  else
  {
    _DCLogSystem();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224FB2000, v52, OS_LOG_TYPE_DEFAULT, "Using device timestamp...", buf, 2u);
    }

    v37 = v16 & 1;
  }
LABEL_25:
  if (a2)
    CFRelease(a2);
  _DCLogSystem();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v37)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl(&dword_224FB2000, v39, OS_LOG_TYPE_DEFAULT, "Certificate processed... (%lu)", buf, 0xCu);
    }

    v41 = *(_QWORD *)(a1 + 40);
    v42 = (void *)objc_msgSend(v11, "copy");
    v43 = v59;
    v44 = (void *)objc_msgSend(v59, "copy");
    (*(void (**)(uint64_t, void *, void *))(v41 + 16))(v41, v42, v44);

  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke_cold_1((uint64_t)v36, v39);

    v43 = v59;
    v45 = *(_QWORD *)(a1 + 40);
    v42 = (void *)objc_msgSend(v59, "copy");
    (*(void (**)(uint64_t, _QWORD, void *))(v45 + 16))(v45, 0, v42);
  }

}

- (id)_encryptData:(id)a3 serverSyncedDate:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const void *v12;
  unsigned int v13;
  id v14;
  const void *v15;
  size_t v16;
  _DWORD *v17;
  _DWORD *v18;
  char *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t public_key;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t i;
  uint64_t *v34;
  const void *v35;
  char *v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void **v46;
  uint8_t v47[4];
  uint64_t v48;
  uint8_t buf[16];
  _DWORD v50[7];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v42 = a4;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Encrypting data...", buf, 2u);
  }

  -[DCContext clientAppID](self->_context, "clientAppID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "length");
  v41 = objc_retainAutorelease(v10);
  v12 = (const void *)objc_msgSend(v41, "bytes");
  v13 = objc_msgSend(v7, "length");
  v14 = objc_retainAutorelease(v7);
  v15 = (const void *)objc_msgSend(v14, "bytes");
  v45 = 0;
  v46 = 0;
  v44 = 0;
  ccaes_gcm_encrypt_mode();
  *(_OWORD *)buf = 0u;
  memset(v50, 0, sizeof(v50));
  v16 = v13 + v11 + 235;
  v17 = malloc_type_calloc(1uLL, v16, 0x5FE01201uLL);
  v18 = v17;
  if (v17)
  {
    *(_DWORD *)((char *)v17 + 150) = v13 + v11 + 81;
    *v17 = 2;
    memcpy(v17 + 5, -[NSData bytes](self->_publicKey, "bytes"), -[NSData length](self->_publicKey, "length"));
    v19 = (char *)malloc_type_calloc(1uLL, *(unsigned int *)((char *)v18 + 150), 0x5A1EBE7EuLL);
    *(_DWORD *)(v19 + 73) = v13;
    memcpy(v19 + 81, v15, v13);
    *(_DWORD *)(v19 + 77) = v11;
    memcpy(&v19[v13 + 81], v12, v11);
    v20 = v42;
    objc_msgSend(v42, "timeIntervalSince1970");
    *(_QWORD *)(v19 + 65) = v21;
    _DCLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(v19 + 65);
      *(_DWORD *)v47 = 134217984;
      v48 = v23;
      _os_log_impl(&dword_224FB2000, v22, OS_LOG_TYPE_DEFAULT, "Token timestamp: %f", v47, 0xCu);
    }

    if (aks_ref_key_create(-[DCCertificateGenerator keybagHandle](self, "keybagHandle"), 11, 4u, 0, 0, &v46))
    {
      _DCLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.6();
LABEL_20:
      v25 = 0;
      goto LABEL_21;
    }
    v43 = 0;
    public_key = aks_ref_key_get_public_key(v46, &v43);
    if (v43 != 65)
    {
      _DCLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.5(&v43, v24);
      goto LABEL_20;
    }
    *(_OWORD *)((char *)v18 + 85) = *(_OWORD *)public_key;
    v27 = *(_OWORD *)(public_key + 16);
    v28 = *(_OWORD *)(public_key + 32);
    v29 = *(_OWORD *)(public_key + 48);
    *((_BYTE *)v18 + 149) = *(_BYTE *)(public_key + 64);
    *(_OWORD *)((char *)v18 + 133) = v29;
    *(_OWORD *)((char *)v18 + 117) = v28;
    *(_OWORD *)((char *)v18 + 101) = v27;
    v31 = *(_OWORD *)(public_key + 32);
    v30 = *(_OWORD *)(public_key + 48);
    v32 = *(_OWORD *)(public_key + 16);
    v19[64] = *(_BYTE *)(public_key + 64);
    *((_OWORD *)v19 + 2) = v31;
    *((_OWORD *)v19 + 3) = v30;
    *((_OWORD *)v19 + 1) = v32;
    *(_OWORD *)v19 = *(_OWORD *)public_key;
    printf("%-25.25s = ", "random_pubkey");
    for (i = 85; i != 150; ++i)
      printf("%02x", *((unsigned __int8 *)v18 + i));
    putchar(10);
    v34 = (uint64_t *)v46;
    v35 = -[NSData bytes](self->_publicKey, "bytes");
    -[NSData length](self->_publicKey, "length");
    if (aks_ref_key_compute_key(v34, 0, 0, (uint64_t)v35))
    {
      _DCLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.4();
      goto LABEL_20;
    }
    v37 = (char *)v45;
    v38 = v44 - 2;
    printf("%-25.25s = ", "ECDH shared key");
    if (v38)
    {
      v39 = (unsigned __int8 *)(v37 + 2);
      do
      {
        v40 = *v39++;
        printf("%02x", v40);
        --v38;
      }
      while (v38);
    }
    putchar(10);
    if (cchkdf())
    {
      _DCLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.3();
      goto LABEL_20;
    }
    hex((std::ios_base *)"HKDF derived key");
    hex((std::ios_base *)"HKDF derived iv");
    if (ccgcm_one_shot())
    {
      _DCLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.2();
      goto LABEL_20;
    }
    hex((std::ios_base *)"tag");
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "encrypted_data_len: %d\n", *(_DWORD *)((char *)v18 + 150));
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v18, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _DCLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    _DCLogDebugBinary(v24, CFSTR("Token"), v25);
  }
  else
  {
    _DCLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DCCertificateGenerator _encryptData:serverSyncedDate:error:].cold.1(v24);
    v19 = 0;
    v25 = 0;
    v20 = v42;
  }
LABEL_21:

  if (v46)
    aks_ref_key_free((uint64_t *)&v46);
  if (v18)
    free(v18);
  if (v19)
    free(v19);
  if (v45)
    free(v45);

  return v25;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _DCLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FB2000, v3, OS_LOG_TYPE_DEFAULT, "DCCertificateGenerator generator going away...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)DCCertificateGenerator;
  -[DCCertificateGenerator dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

void __66__DCCertificateGenerator__generateCertificateChainWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_224FB2000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain valid certificates from server: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_encryptData:(os_log_t)log serverSyncedDate:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224FB2000, log, OS_LOG_TYPE_ERROR, "out_data_to_send is NULL!\n", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_encryptData:serverSyncedDate:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_224FB2000, v0, v1, "Failed to perform AES-GSM encryption with shared key: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_encryptData:serverSyncedDate:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_224FB2000, v0, v1, "Failed to perform HKDF with shared key: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_encryptData:serverSyncedDate:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_224FB2000, v0, v1, "Failed to perform ECDH with server pubkey: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_encryptData:(uint64_t *)a1 serverSyncedDate:(NSObject *)a2 error:.cold.5(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134218240;
  v4 = 65;
  v5 = 2048;
  v6 = v2;
  _os_log_error_impl(&dword_224FB2000, a2, OS_LOG_TYPE_ERROR, "Unexpected pubkey size. expected %ld got %ld\n", (uint8_t *)&v3, 0x16u);
}

- (void)_encryptData:serverSyncedDate:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_224FB2000, v0, v1, "Failed to create ECDH key: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
