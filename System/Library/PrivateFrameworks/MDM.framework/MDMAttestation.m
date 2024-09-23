@implementation MDMAttestation

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MDMAttestation_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance__sharedInstance_0;
}

void __32__MDMAttestation_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initPrivate");
  v2 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = v1;

}

- (id)initPrivate
{
  MDMAttestation *v2;
  MDMAttestation *v3;
  NSArray *certs;
  NSData *nonce;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MDMAttestation;
  v2 = -[MDMAttestation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    certs = v2->_certs;
    v2->_key = 0;
    v2->_certs = 0;

    nonce = v3->_nonce;
    v3->_nonce = 0;

  }
  return v3;
}

- (__SecKey)attestationKey:(BOOL)a3 outError:(id *)a4
{
  _BOOL4 v5;
  MDMAttestation *v7;
  __SecKey *key;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  const __CFDictionary *v15;
  void *v16;
  void *v17;
  CFErrorRef error;
  _QWORD v20[3];
  _QWORD v21[4];

  v5 = a3;
  v21[3] = *MEMORY[0x24BDAC8D0];
  if ((MEMORY[0x22767C408](self, a2) & 1) != 0)
  {
    v7 = self;
    objc_sync_enter(v7);
    key = v7->_key;
    if (key)
    {
LABEL_19:
      objc_sync_exit(v7);

      return key;
    }
    key = (__SecKey *)objc_msgSend(MEMORY[0x24BE2A810], "retrieveAttestationKeyWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationKey"));
    if (key)
    {
LABEL_4:
      v7->_key = key;
      goto LABEL_19;
    }
    -[MDMAttestation reset](v7, "reset");
    v11 = *MEMORY[0x24BDE9170];
    v12 = *MEMORY[0x24BDE9050];
    v20[0] = *MEMORY[0x24BDE9158];
    v20[1] = v12;
    v13 = (uint64_t *)MEMORY[0x24BDE9088];
    if (!v5)
      v13 = (uint64_t *)MEMORY[0x24BDE9090];
    v14 = *v13;
    v21[0] = v11;
    v21[1] = v14;
    v20[2] = *MEMORY[0x24BDE9538];
    v21[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    error = 0;
    key = SecKeyCreateRandomKey(v15, &error);
    if (key)
    {
      if ((objc_msgSend(MEMORY[0x24BE2A810], "storeAttestationKey:withGroup:label:", key, CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationKey")) & 1) != 0)
      {

        goto LABEL_4;
      }
      if (a4)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        DMCErrorArray();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12109, v17, *MEMORY[0x24BE2A588], 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      CFRelease(key);
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease(error);
    }

    key = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12106, v10, *MEMORY[0x24BE2A588], 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)attestationCertificateChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5
{
  _BOOL8 v7;
  id v9;
  MDMAttestation *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _BOOL4 v35;
  id v36;
  id *location;
  uint8_t buf[8];
  id v39;
  id v40;
  id v41;

  v7 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_sync_enter(v10);
  if ((MEMORY[0x22767C408](v11) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24EB77AB0, &unk_24EB77AC8, &unk_24EB77AE0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2A818], "chipID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && !objc_msgSend(v12, "containsObject:", v13))
    {
      if (-[MDMAttestation attestationKey:outError:](v10, "attestationKey:outError:", v7, a5))
      {
        location = (id *)&v10->_certs;
        if (!v10->_certs)
        {
          v40 = 0;
          v41 = 0;
          v39 = 0;
          v35 = -[MDMAttestation _retrieveCerts:nonce:issued:](v10, "_retrieveCerts:nonce:issued:", &v41, &v40, &v39);
          v18 = v41;
          v34 = v41;
          v19 = v40;
          v33 = v40;
          v20 = v39;
          v21 = v39;
          if (v35)
          {
            v36 = v21;
            objc_storeStrong(location, v18);
            objc_storeStrong((id *)&v10->_nonce, v19);
            objc_storeStrong((id *)&v10->_issued, v20);
            v21 = v36;
          }

          if (!*location)
            goto LABEL_31;
        }
        if (v10->_issued
          && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[MDMAttestation _expirationForIssued:](v10, "_expirationForIssued:", v10->_issued),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v22, "compare:", v23),
              v23,
              v22,
              v24 == -1))
        {
          v29 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v29, OS_LOG_TYPE_DEFAULT, "Returning existing attestation certificate because of rate limiting", buf, 2u);
          }
        }
        else
        {
LABEL_31:
          if (!-[NSData isEqualToData:](v10->_nonce, "isEqualToData:", v9))
          {
            -[MDMAttestation _requestAttestationCertChainAnonymous:nonce:outError:](v10, "_requestAttestationCertChainAnonymous:nonce:outError:", v7, v9, a5);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = *location;
            *location = (id)v25;

            if (*location)
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[MDMAttestation _storeCerts:nonce:issued:outError:](v10, "_storeCerts:nonce:issued:outError:", v10->_certs, v9, v27, a5))
              {
                objc_storeStrong((id *)&v10->_nonce, a4);
                objc_storeStrong((id *)&v10->_issued, v27);
                a5 = v10->_certs;
              }
              else
              {
                if (a5)
                {
                  v30 = (void *)MEMORY[0x24BDD1540];
                  DMCErrorArray();
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12112, v31, *MEMORY[0x24BE2A588], 0);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                }
                v32 = *location;
                *location = 0;

                a5 = 0;
              }

              goto LABEL_20;
            }
            goto LABEL_19;
          }
        }
        a5 = (id *)*location;
        goto LABEL_20;
      }
    }
    else
    {
      if (!a5)
      {
LABEL_20:

        goto LABEL_21;
      }
      v14 = (void *)MEMORY[0x24BDD1540];
      DMCErrorArray();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12106, v15, *MEMORY[0x24BE2A588], 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_19:
    a5 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12106, v17, *MEMORY[0x24BE2A588], 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_21:
  objc_sync_exit(v10);

  return a5;
}

- (id)_requestAttestationCertChainAnonymous:(BOOL)a3 nonce:(id)a4 outError:(id *)a5
{
  _BOOL8 v5;
  dispatch_semaphore_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  id v16;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v5 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v19 = a4;
  objc_msgSend(MEMORY[0x24BE60DB8], "oidsAnonymous:nonce:coresidency:", v5, v19 != 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24EB77AF8, *MEMORY[0x24BE2C480]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE2C448]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE2C3E8]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C460]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24EB77B10, *MEMORY[0x24BE2C3E0]);
  v22 = (void *)objc_msgSend(v20, "copy");
  v6 = dispatch_semaphore_create(0);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v7 = 2;
  v28 = 0;
  do
  {
    v8 = v6;
    AppAttest_DeviceAttestation_AttestKey();
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v30[5])
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "Successfully retrieved attestation certificate";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
LABEL_13:
        _os_log_impl(&dword_222CB9000, v13, v14, v12, buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    }
    if (objc_msgSend((id)v24[5], "code") != -7)
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "Failed to fetch attestation certificate, not retrying";
        v13 = v15;
        v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v7;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch attestation certificate, %u retries left", buf, 8u);
    }

    --v7;
  }
  while (v7 != -1);
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_ERROR, "Out of retries retrieving attestation certificate", buf, 2u);
  }
LABEL_15:
  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v16 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __71__MDMAttestation__requestAttestationCertChainAnonymous_nonce_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (v5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v5;
  }
  else
  {
    if (!v16 || objc_msgSend(v16, "count") != 2)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12107, v10, *MEMORY[0x24BE2A588], 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      goto LABEL_8;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v16;
  }
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;
LABEL_8:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reset
{
  MDMAttestation *v2;
  __SecKey *key;
  NSArray *certs;
  NSData *nonce;
  MDMAttestation *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  key = obj->_key;
  if (key)
  {
    CFRelease(key);
    v2 = obj;
    obj->_key = 0;
  }
  certs = v2->_certs;
  v2->_certs = 0;

  nonce = obj->_nonce;
  obj->_nonce = 0;

  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationKeyWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationKey"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationCert"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationIntermediate"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationMetadataWithGroup:service:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationMetadata"));
  objc_sync_exit(obj);

}

- (BOOL)_storeCerts:(id)a3 nonce:(id)a4 issued:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationCert"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationIntermediate"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationMetadataWithGroup:service:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationMetadata"));
  v12 = (void *)MEMORY[0x24BE2A810];
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "storeAttestationCert:withGroup:label:", v13, CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationCert"));

  if ((v14 & 1) != 0)
  {
    v15 = (void *)MEMORY[0x24BE2A810];
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "storeAttestationCert:withGroup:label:", v16, CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationIntermediate"));

    if (a6 && (v17 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BE2A588];
      v22 = v18;
      v23 = v19;
      v24 = 12111;
LABEL_7:
      objc_msgSend(v22, "DMCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v20, v21, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
      a6 = 0;
      goto LABEL_9;
    }
    if (!v17)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v11, CFSTR("issued"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v10, CFSTR("nonce"));
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v29, 200, 0, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();

    if (!a6
      || (objc_msgSend(MEMORY[0x24BE2A810], "storeAttestationMetadata:withGroup:service:", a6, CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationMetadata")) & 1) != 0)
    {
      v27 = 1;
      goto LABEL_10;
    }
  }
  else if (a6)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE2A588];
    v22 = v25;
    v23 = v26;
    v24 = 12110;
    goto LABEL_7;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationCert"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationIntermediate"));
  objc_msgSend(MEMORY[0x24BE2A810], "deleteAttestationMetadataWithGroup:service:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationMetadata"));
  v27 = 0;
LABEL_10:

  return v27;
}

- (BOOL)_retrieveCerts:(id *)a3 nonce:(id *)a4 issued:(id *)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend(MEMORY[0x24BE2A810], "retrieveAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationCert"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(MEMORY[0x24BE2A810], "retrieveAttestationCertWithGroup:label:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationIntermediate"));
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x24BE2A810], "retrieveAttestationMetadataWithGroup:service:", CFSTR("com.apple.mdm.attestation"), CFSTR("MDMAttestationMetadata"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v12, 0, 0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v16[0] = v9;
          v16[1] = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("nonce"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("issued"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          LOBYTE(v8) = 1;
          return v8;
        }
      }
      CFRelease(v9);
      CFRelease(v11);

    }
    else
    {
      CFRelease(v9);
    }
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_expirationForIssued:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BE2A7F0], "attestationRateLimitOverrideMinutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v5, "setMinute:", objc_msgSend(v6, "integerValue"));
  else
    objc_msgSend(v5, "setDay:", 7);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issued, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certs, 0);
}

@end
