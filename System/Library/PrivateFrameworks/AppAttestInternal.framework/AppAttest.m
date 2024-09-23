@implementation AppAttest

void __AppAttest_WebAuthentication_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFAllocator *v31;
  uint64_t i;
  SecCertificateRef v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  SecCertificateRef v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id obj;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2199FAB94]();
  isNSDictionary(v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = (void *)v8;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithBase64EncodedData:options:", v16, 1);

      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v18 + 40);
      lockcrypto_decode_pems(v17, "CERTIFICATE", &obj);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v18 + 40), obj);
      v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (!v23)
      {
        createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 154, -1, 0, CFSTR("Failed to allocate array."), v20, v21, v22, v59);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v61 = v17;
        v62 = v7;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v60 = v19;
        v27 = v19;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v64;
          v31 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v64 != v30)
                objc_enumerationMutation(v27);
              v33 = SecCertificateCreateWithData(v31, *(CFDataRef *)(*((_QWORD *)&v63 + 1) + 8 * i));
              if (!v33)
              {
                createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 166, -1, 0, CFSTR("Failed to create certificate."), v34, v35, v36, v59);
                v43 = objc_claimAutoreleasedReturnValue();
                v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v45 = *(void **)(v44 + 40);
                *(_QWORD *)(v44 + 40) = v43;

                goto LABEL_21;
              }
              v37 = v33;
              objc_msgSend(v23, "addObject:", v33);
              CFRelease(v37);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
            if (v29)
              continue;
            break;
          }
        }
LABEL_21:

        v17 = v61;
        v7 = v62;
        v19 = v60;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          if (objc_msgSend(v23, "count") == 2)
          {
LABEL_25:

            goto LABEL_26;
          }
          createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 178, -1, 0, CFSTR("The received cert chain length must be 2!"), v46, v47, v48, v59);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v51 = *(void **)(v50 + 40);
          *(_QWORD *)(v50 + 40) = v49;

        }
      }

      v23 = 0;
      goto LABEL_25;
    }
  }
  if (v6
    && (objc_msgSend(v6, "domain"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.appattest.error")),
        v38,
        v39))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey_block_invoke", 146, -6, v6, CFSTR("Invalid server response"), v9, v10, v11, v59);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
  v23 = 0;
LABEL_26:
  _DCAALogSystem();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    __AppAttest_WebAuthentication_AttestKey_block_invoke_cold_1(a1, v52, v53, v54, v55, v56, v57, v58);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v7);

}

void __AppAttest_DeviceAttestation_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFAllocator *v31;
  uint64_t i;
  SecCertificateRef v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  SecCertificateRef v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id obj;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2199FAB94]();
  isNSDictionary(v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = (void *)v8;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithBase64EncodedData:options:", v16, 1);

      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v18 + 40);
      lockcrypto_decode_pems(v17, "CERTIFICATE", &obj);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v18 + 40), obj);
      v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (!v23)
      {
        createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 279, -1, 0, CFSTR("Failed to allocate array."), v20, v21, v22, v59);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v61 = v17;
        v62 = v7;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v60 = v19;
        v27 = v19;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v64;
          v31 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v64 != v30)
                objc_enumerationMutation(v27);
              v33 = SecCertificateCreateWithData(v31, *(CFDataRef *)(*((_QWORD *)&v63 + 1) + 8 * i));
              if (!v33)
              {
                createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 291, -1, 0, CFSTR("Failed to create certificate."), v34, v35, v36, v59);
                v43 = objc_claimAutoreleasedReturnValue();
                v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v45 = *(void **)(v44 + 40);
                *(_QWORD *)(v44 + 40) = v43;

                goto LABEL_21;
              }
              v37 = v33;
              objc_msgSend(v23, "addObject:", v33);
              CFRelease(v37);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
            if (v29)
              continue;
            break;
          }
        }
LABEL_21:

        v17 = v61;
        v7 = v62;
        v19 = v60;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          if (objc_msgSend(v23, "count") == 2)
          {
LABEL_25:

            goto LABEL_26;
          }
          createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 303, -1, 0, CFSTR("The received cert chain length must be 2!"), v46, v47, v48, v59);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v51 = *(void **)(v50 + 40);
          *(_QWORD *)(v50 + 40) = v49;

        }
      }

      v23 = 0;
      goto LABEL_25;
    }
  }
  if (v6
    && (objc_msgSend(v6, "domain"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.appattest.error")),
        v38,
        v39))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey_block_invoke", 271, -6, v6, CFSTR("Invalid server response"), v9, v10, v11, v59);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
  v23 = 0;
LABEL_26:
  _DCAALogSystem();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    __AppAttest_DeviceAttestation_AttestKey_block_invoke_cold_1(a1, v52, v53, v54, v55, v56, v57, v58);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v7);

}

void __AppAttest_AppAttestation_AttestKey_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint8_t buf[4];
  _BYTE v70[14];
  __int16 v71;
  _BYTE v72[14];
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  isNSDictionary(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (v6
      && (objc_msgSend(v6, "domain"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.appattest.error")),
          v31,
          v32))
    {
      v33 = v6;
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 290, -6, v6, CFSTR("Invalid server response"), v8, v9, v10, v63);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v30 = v33;
    _DCAALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attestationDataReceipt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_15:
    createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 296, -6, 0, CFSTR("Invalid response"), v16, v17, v18, v63);
    v30 = objc_claimAutoreleasedReturnValue();
    _DCAALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v29 = 0;
      goto LABEL_29;
    }
LABEL_16:
    __AppAttest_AppAttestation_AttestKey_block_invoke_cold_2(v6);
    goto LABEL_17;
  }
  v13 = (void *)v12;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_15;
  v19 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attestationDataReceipt"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithBase64EncodedData:options:", v20, 1);

  v22 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithBase64EncodedData:options:", v23, 1);

  v68 = 0;
  lockcrypto_decode_pems(v24, "CERTIFICATE", &v68);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v68;
  if (v26)
  {
    v27 = v26;
    _DCAALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __AppAttest_AppAttestation_AttestKey_block_invoke_cold_5(v27);

    v29 = 0;
    v30 = v27;
  }
  else
  {
    if (-[NSObject count](v25, "count") == 2)
    {
      v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", 1);
      if ((saveAssertionCounterKeychain(v27, *(_DWORD *)(a1 + 96), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 32)) & 1) != 0)
      {
        v40 = *(void **)(a1 + 72);
        v67 = 0;
        generateAttestationObject(v40, v25, v21, &v67);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v67;
        v43 = v42;
        if (v41)
        {
          v29 = v41;

          v30 = 0;
          v27 = v29;
        }
        else
        {
          v30 = v42;
          _DCAALogSystem();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            -[NSObject localizedDescription](v30, "localizedDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = *(_DWORD *)(a1 + 96);
            v66 = *(_QWORD *)(a1 + 32);
            v59 = objc_msgSend(*(id *)(a1 + 40), "intValue");
            v60 = *(_QWORD *)(a1 + 48);
            v61 = *(_QWORD *)(a1 + 56);
            v62 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 138413826;
            *(_QWORD *)v70 = v58;
            *(_WORD *)&v70[8] = 1024;
            *(_DWORD *)&v70[10] = v64;
            v71 = 2112;
            *(_QWORD *)v72 = v66;
            *(_WORD *)&v72[8] = 1024;
            *(_DWORD *)&v72[10] = v59;
            v73 = 2112;
            v74 = v60;
            v75 = 2112;
            v76 = v61;
            v77 = 2112;
            v78 = v62;
            _os_log_error_impl(&dword_2167BD000, v52, OS_LOG_TYPE_ERROR, "Failed to generate attestation object. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x40u);

          }
          v29 = 0;
          v27 = v30;
        }
        goto LABEL_28;
      }
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 321, -3, 0, CFSTR("Unable to set counter for authenticator data"), v37, v38, v39, v63);
      v30 = objc_claimAutoreleasedReturnValue();
      _DCAALogSystem();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v53 = *(_DWORD *)(a1 + 96);
        v65 = *(_QWORD *)(a1 + 32);
        v54 = -[NSObject intValue](v27, "intValue");
        v55 = *(_QWORD *)(a1 + 48);
        v56 = *(_QWORD *)(a1 + 56);
        v57 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v70 = v53;
        *(_WORD *)&v70[4] = 2112;
        *(_QWORD *)&v70[6] = v65;
        v71 = 1024;
        *(_DWORD *)v72 = v54;
        *(_WORD *)&v72[4] = 2112;
        *(_QWORD *)&v72[6] = v55;
        v73 = 2112;
        v74 = v56;
        v75 = 2112;
        v76 = v57;
        _os_log_error_impl(&dword_2167BD000, v44, OS_LOG_TYPE_ERROR, "Failed to update assertion counter. { env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x36u);
      }

    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey_block_invoke", 315, -3, 0, CFSTR("The received cert chain length must be 2!"), v34, v35, v36, v63);
      v30 = objc_claimAutoreleasedReturnValue();
      _DCAALogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __AppAttest_AppAttestation_AttestKey_block_invoke_cold_4();
    }
    v29 = 0;
  }
LABEL_28:

LABEL_29:
  _DCAALogSystem();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    __AppAttest_AppAttestation_AttestKey_block_invoke_cold_1((uint64_t)v30, v45, v46, v47, v48, v49, v50, v51);

  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));

}

void __AppAttest_WebAuthentication_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a2, a3, "AppAttest_WebAuthentication_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
}

void __AppAttest_DeviceAttestation_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a2, a3, "AppAttest_DeviceAttestation_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a2, a3, "AppAttest_AppAttestation_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_2167BD000, v2, v3, "Failed to attest key. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(0, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_2167BD000, v1, v2, "Certificate chain length is invalid. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

void __AppAttest_AppAttestation_AttestKey_block_invoke_cold_5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_2167BD000, v2, v3, "Failed to decode certificates. { error=%@, env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
