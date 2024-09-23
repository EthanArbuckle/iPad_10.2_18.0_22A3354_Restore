@implementation AcmeCertRequest

- (AcmeCertRequest)initWithSubject:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  AcmeCertRequest *v8;
  AcmeCertRequest *v9;
  dispatch_queue_t v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AcmeCertRequest;
  v8 = -[AcmeCertRequest init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AcmeCertRequest setSubject:](v8, "setSubject:", v6);
    -[AcmeCertRequest setParameters:](v9, "setParameters:", v7);
    v10 = dispatch_queue_create("com.apple.certrequest", 0);
    -[AcmeCertRequest setQueue:](v9, "setQueue:", v10);

  }
  return v9;
}

- (void)dealloc
{
  __SecKey *privateKey;
  __SecKey *publicKey;
  __SecCertificate *certificate;
  __SecIdentity *identity;
  objc_super v7;

  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0;
    CFRelease(privateKey);
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
  certificate = self->_certificate;
  if (certificate)
  {
    self->_certificate = 0;
    CFRelease(certificate);
  }
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v7.receiver = self;
  v7.super_class = (Class)AcmeCertRequest;
  -[AcmeCertRequest dealloc](&v7, sel_dealloc);
}

- (id)serialNumber
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char *v6;
  char v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v9[0] = bswap64(dispatch_time(0, 0));
  v3 = 8;
  while (!*((_BYTE *)v9 + v2))
  {
    ++v2;
    if (!--v3)
    {
      v2 = 8;
      break;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (char *)v9 + v2;
  if (*v6 < 0)
  {
    v8 = 0;
    objc_msgSend(v4, "appendBytes:length:", &v8, 1);
  }
  objc_msgSend(v5, "appendBytes:length:", v6, v3);
  return v5;
}

- (id)sanitizeSubject
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12571;
  v11 = __Block_byref_object_dispose__12572;
  v12 = 0;
  -[AcmeCertRequest queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__AcmeCertRequest_sanitizeSubject__block_invoke;
  v6[3] = &unk_1E1FDBC88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)sanitizeParameters
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__12571;
  v14 = __Block_byref_object_dispose__12572;
  v15 = 0;
  -[AcmeCertRequest queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__AcmeCertRequest_sanitizeParameters__block_invoke;
  v9[3] = &unk_1E1FDBC88;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  v4 = (void *)v11[5];
  if (!v4)
  {
    -[AcmeCertRequest sanitizeSubject](self, "sanitizeSubject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

    v4 = (void *)v11[5];
  }
  v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)createKeyPair
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[AcmeCertRequest queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__AcmeCertRequest_createKeyPair__block_invoke;
  v6[3] = &unk_1E1FDBC88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)createCSR
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12571;
  v11 = __Block_byref_object_dispose__12572;
  v12 = 0;
  -[AcmeCertRequest queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__AcmeCertRequest_createCSR__block_invoke;
  v6[3] = &unk_1E1FDBC88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)deviceAttestationSupported
{
  if (deviceAttestationSupported_onceToken != -1)
    dispatch_once(&deviceAttestationSupported_onceToken, &__block_literal_global_12585);
  return deviceAttestationSupported_appAttestSupported;
}

- (id)requestAttestationChainWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  NSData *attestation;
  __SecKey *attestationCRKey;
  __SecKey *v9;
  __SecKey *v10;
  CFDataRef v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CFDataRef v17;
  dispatch_semaphore_t v18;
  int v19;
  uint64_t v20;
  void (*v21)(__SecKey *, void *, _QWORD *);
  __SecKey *privateKey;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  const void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v36;
  void *v37;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  __int128 *p_md;
  uint64_t *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int128 md;
  __int128 v57;
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__12571;
  v52 = __Block_byref_object_dispose__12572;
  v53 = 0;
  if (!-[AcmeCertRequest deviceAttestationSupported](self, "deviceAttestationSupported"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67849, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = (id)v49[5];
    goto LABEL_58;
  }
  CFAbsoluteTimeGetCurrent();
  if (requestAttestationChainWithError__onceToken != -1)
    dispatch_once(&requestAttestationChainWithError__onceToken, &__block_literal_global_108);
  -[NSString dataUsingEncoding:](self->_token, "dataUsingEncoding:", 4);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E1FFEFC8, CFSTR("Validity"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_attestationOids, CFSTR("OIDSToInclude"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("UseXPC"));
  v37 = v4;
  if (v36)
  {
    md = 0u;
    v57 = 0u;
    v5 = objc_retainAutorelease(v36);
    CC_SHA256((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (unsigned __int8 *)&md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &md, 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v6, CFSTR("nonce"));

  }
  attestation = self->_attestation;
  if (attestation)
    objc_msgSend(v37, "setObject:forKeyedSubscript:", attestation, CFSTR("ClientAttestationData"));
  attestationCRKey = self->_attestationCRKey;
  if (!attestationCRKey)
    goto LABEL_13;
  v9 = SecKeyCopyPublicKey(attestationCRKey);
  v10 = v9;
  if (!v9)
  {
    secLogObjForScope("SecError");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(md) = 0;
      _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "Failed to obtain public key for attestation key, skipping attestation", (uint8_t *)&md, 2u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67811, 0);
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  *(_QWORD *)&md = 0;
  v11 = SecKeyCopyExternalRepresentation(v9, (CFErrorRef *)&md);
  CFRelease(v10);
  if ((_QWORD)md || !v11)
  {
    secLogObjForScope("SecError");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "Failed to copy public key data for co-residency, skipping attestation", buf, 2u);
    }

    v31 = (const void *)md;
    if (a3)
    {
      *a3 = (id)md;
    }
    else if ((_QWORD)md)
    {
      *(_QWORD *)&md = 0;
      CFRelease(v31);
    }

LABEL_56:
    v26 = 0;
    goto LABEL_57;
  }
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v11, CFSTR("ClientAttestationPublicKey"));

LABEL_13:
  if (self->_attestationCRChain)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v13 = self->_attestationCRChain;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v13);
          v17 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v44 + 1) + 8 * i));
          objc_msgSend(v12, "appendData:", v17);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      }
      while (v14);
    }

    objc_msgSend(v37, "setObject:forKeyedSubscript:", v12, CFSTR("ClientDirectAttestationCertificate"));
  }
  v39 = (void *)objc_msgSend(v37, "copy");
  v18 = dispatch_semaphore_create(0);
  *(_QWORD *)&md = 0;
  *((_QWORD *)&md + 1) = &md;
  *(_QWORD *)&v57 = 0x3032000000;
  v19 = 2;
  *((_QWORD *)&v57 + 1) = __Block_byref_object_copy__12571;
  v58 = __Block_byref_object_dispose__12572;
  v59 = 0;
  v20 = MEMORY[0x1E0C809B0];
  do
  {
    v21 = (void (*)(__SecKey *, void *, _QWORD *))requestAttestationChainWithError__soft_AppAttest_DeviceAttestation_AttestKey;
    privateKey = self->_privateKey;
    v40[0] = v20;
    v40[1] = 3221225472;
    v40[2] = __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_112;
    v40[3] = &unk_1E1FDBDB0;
    p_md = &md;
    v43 = &v48;
    v23 = v18;
    v41 = v23;
    v21(privateKey, v39, v40);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    if (v49[5])
    {
      secLogObjForScope("acme");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_48:

        v25 = v41;
        goto LABEL_49;
      }
      *(_WORD *)buf = 0;
      v29 = "Successfully retrieved attestation certificate";
LABEL_47:
      _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
      goto LABEL_48;
    }
    if (objc_msgSend(*(id *)(*((_QWORD *)&md + 1) + 40), "code") != -67671)
    {
      secLogObjForScope("acme");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_msgSend(*(id *)(*((_QWORD *)&md + 1) + 40), "code");
        *(_DWORD *)buf = 134217984;
        v55 = v33;
        _os_log_impl(&dword_18A900000, v32, OS_LOG_TYPE_DEFAULT, "Attempt to fetch attestation certificate failed (error %lld)", buf, 0xCu);
      }

      secLogObjForScope("SecError");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v29 = "Failed to fetch attestation certificate, not retrying";
      goto LABEL_47;
    }
    secLogObjForScope("SecError");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = v19;
      _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "Failed to fetch attestation certificate, %u retries left", buf, 8u);
    }

    --v19;
  }
  while (v19 != -1);
  secLogObjForScope("SecError");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "Out of retries retrieving attestation certificate", buf, 2u);
  }
LABEL_49:

  v34 = *(void **)(*((_QWORD *)&md + 1) + 40);
  if (a3)
  {
    *a3 = objc_retainAutorelease(v34);
  }
  else
  {
    *(_QWORD *)(*((_QWORD *)&md + 1) + 40) = 0;

  }
  v26 = (id)v49[5];
  _Block_object_dispose(&md, 8);

LABEL_57:
LABEL_58:
  _Block_object_dispose(&v48, 8);

  return v26;
}

- (id)attestationObjectWithCertificates:(id)a3
{
  id v4;
  void *v5;
  SecCBORArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CFTypeID v10;
  CFDataRef v11;
  SecCBORData *v12;
  SecCBORMap *v13;
  SecCBORString *v14;
  SecCBORMap *v15;
  SecCBORString *v16;
  SecCBORString *v17;
  SecCBORString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D770A24]();
  v6 = objc_alloc_init(SecCBORArray);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count") == 2 && objc_msgSend(v4, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        v10 = CFGetTypeID(v9);
        if (v10 != SecCertificateGetTypeID())
          goto LABEL_10;
        v11 = SecCertificateCopyData((SecCertificateRef)v9);

        v9 = v11;
        if (v11)
          break;
      }
LABEL_11:
      if (++v7 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_12;
    }
    v12 = -[SecCBORData initWith:]([SecCBORData alloc], "initWith:", v9);
    -[SecCBORArray addObject:](v6, "addObject:", v12);

LABEL_10:
    goto LABEL_11;
  }
LABEL_12:
  v13 = objc_alloc_init(SecCBORMap);
  v14 = -[SecCBORString initWith:]([SecCBORString alloc], "initWith:", CFSTR("x5c"));
  -[SecCBORMap setKey:value:](v13, "setKey:value:", v14, v6);

  v15 = objc_alloc_init(SecCBORMap);
  v16 = -[SecCBORString initWith:]([SecCBORString alloc], "initWith:", CFSTR("fmt"));
  v17 = -[SecCBORString initWith:]([SecCBORString alloc], "initWith:", CFSTR("apple"));
  -[SecCBORMap setKey:value:](v15, "setKey:value:", v16, v17);

  v18 = -[SecCBORString initWith:]([SecCBORString alloc], "initWith:", CFSTR("attStmt"));
  -[SecCBORMap setKey:value:](v15, "setKey:value:", v18, v13);

  v19 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[SecCBORMap write:](v15, "write:", v19);
  v20 = (void *)objc_msgSend(v19, "copy");

  objc_autoreleasePoolPop(v5);
  if (v20 && self->_logAcmeCSR)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/AcmeAtt_%@"), self->_timestamp);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self->_encoder, "base64URLEncodedStringRepresentationWithData:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dataUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "writeToFile:atomically:", v21, 1);
  }

  return v20;
}

- (id)hardwareAttestationWithError:(id *)a3
{
  NSData *attestation;
  __SecKey *attestationCRKey;
  __SecKey *privateKey;
  NSData *v8;
  NSData *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  CFTypeID v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  attestation = self->_attestation;
  if (attestation)
  {
    self->_attestation = 0;

  }
  attestationCRKey = self->_attestationCRKey;
  if (attestationCRKey && (privateKey = self->_privateKey) != 0)
  {
    SecKeyCreateAttestation((uint64_t)attestationCRKey, (uint64_t)privateKey, (__CFString **)&v22);
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    v9 = self->_attestation;
    self->_attestation = v8;

    v10 = v22;
    v11 = v22 != 0;
  }
  else
  {
    secLogObjForScope("SecError");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_attestationCRKey)
        v13 = CFSTR("_privateKey");
      else
        v13 = CFSTR("_attestationCRKey");
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "missing %@ for attestation", buf, 0xCu);
    }

    v14 = -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("acmeLocalIssuer"));
    v11 = 0;
    v10 = 0;
    if (!self->_permitLocalIssuer && v14)
    {
      v15 = CFGetTypeID(v14);
      if (v15 == CFBooleanGetTypeID() && *MEMORY[0x1E0C9AE50])
        CFEqual(v14, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
      v10 = 0;
      v11 = 0;
    }
  }
  if (!self->_attestation && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create attestation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -50, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v20;
    v10 = v22;
  }
  if (a3)
  {
    *a3 = v10;
  }
  else if (v10)
  {
    v22 = 0;
    CFRelease(v10);
  }
  return self->_attestation;
}

- (id)createCertificate
{
  uint64_t v2;
  __SecCertificate *SelfSignedCertificateWithError;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  SelfSignedCertificateWithError = (__SecCertificate *)SecGenerateSelfSignedCertificateWithError((const __CFArray *)self->_subject, (const __CFDictionary *)self->_parameters, v2, self->_privateKey, 0);
  v5 = 0;
  self->_certificate = SelfSignedCertificateWithError;
  if (!SelfSignedCertificateWithError)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create certificate (bad input values)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2F90];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -67838, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)attestationChainPEMRepresentation
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  id v7;
  CFStringRef v8;
  CFStringRef v9;

  if (self->_attestationChain)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    v4 = -[NSArray count](self->_attestationChain, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = -[NSArray objectAtIndex:](self->_attestationChain, "objectAtIndex:", i);
        if (v7)
        {
          v8 = SecCertificateCopyPEMRepresentation((uint64_t)v7);
          if (v8)
          {
            v9 = v8;
            objc_msgSend(v3, "appendString:", v8);
            CFRelease(v9);
          }
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int)errorStatusWithHTTPErrorCode:(int)a3
{
  int result;

  if (a3 > 399)
  {
    if ((a3 - 400) > 0x11)
      goto LABEL_11;
    if (((1 << (a3 + 112)) & 0x2021A) == 0)
    {
      if (a3 == 400)
        return -67847;
LABEL_11:
      if ((a3 - 500) <= 7 && ((1 << (a3 + 12)) & 0x89) != 0)
        return -67585;
      return a3;
    }
    return -67585;
  }
  result = 0;
  if ((a3 - 200) >= 2 && a3 != 100)
  {
    if (a3 != 204)
      return a3;
    return -67585;
  }
  return result;
}

- (id)sendRequestToXPCService:(id)a3 response:(id *)a4
{
  NSObject *queue;
  id v7;
  int64_t state;
  const char *v9;
  const char *v10;
  xpc_object_t v11;
  const char *v12;
  xpc_object_t v13;
  int64_t v14;
  id v15;
  const void *v16;
  size_t v17;
  xpc_object_t v18;
  void *v19;
  xpc_object_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  const char *string;
  void *v29;
  CFErrorRef CFErrorWithXPCObject;
  id v31;
  __CFError *v32;
  NSObject *v34;
  void *v35;
  void *v36;
  const char *string_ptr;
  void *v38;
  const char *v39;
  void *v40;
  int64_t value;
  const void *bytes_ptr;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  int64_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  void *v52;
  size_t length;
  __CFError *v54;
  xpc_object_t xstring;
  xpc_object_t xint;
  xpc_object_t v57;
  CFErrorRef v58;
  _QWORD block[5];
  const __CFString *v60;
  uint64_t v61;
  uint8_t buf[4];
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke;
  block[3] = &unk_1E1FDBE18;
  block[4] = self;
  v7 = a3;
  dispatch_sync(queue, block);
  state = self->_state;
  v9 = "POST";
  if (state == 1)
    v9 = "GET";
  if (state == 2)
    v10 = "HEAD";
  else
    v10 = v9;
  v11 = xpc_string_create(v10);
  v12 = -[NSString UTF8String](self->_nextMessageURL, "UTF8String");
  if (!v12)
    v12 = (const char *)&unk_18AA61AAF;
  v13 = xpc_string_create(v12);
  v14 = self->_state;
  v15 = objc_retainAutorelease(v7);
  v16 = (const void *)objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");

  v18 = xpc_data_create(v16, v17);
  v50 = v11;
  v51 = v18;
  v48 = v14;
  v49 = v13;
  xpc_create_with_format();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = xpc_connection_send_message_with_reply_sync(self->_connection, v19);
  v24 = MEMORY[0x18D7718B8](v20, v21, v22, v23);
  if (v24 == MEMORY[0x1E0C81310])
  {
    secLogObjForScope("SecError");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      string = xpc_dictionary_get_string(v20, (const char *)*MEMORY[0x1E0C81270]);
      *(_DWORD *)buf = 136315138;
      v63 = string;
      v27 = "message error: %s";
      goto LABEL_15;
    }
LABEL_16:
    v29 = 0;
    CFErrorWithXPCObject = 0;
    goto LABEL_17;
  }
  v25 = v24;
  if (v24 == MEMORY[0x1E0C812E0])
  {
    CFErrorWithXPCObject = 0;
    v29 = 0;
    v31 = 0;
    if (!a4)
      goto LABEL_23;
LABEL_22:
    v31 = objc_retainAutorelease(v29);
    *a4 = v31;
    goto LABEL_23;
  }
  if (v24 != MEMORY[0x1E0C812F8])
  {
    secLogObjForScope("SecError");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v63 = (const char *)v25;
      v27 = "unexpected message reply type %p";
LABEL_15:
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  xpc_dictionary_get_value(v20, "AcmeReply");
  v34 = objc_claimAutoreleasedReturnValue();
  v26 = v34;
  if (v34)
    length = xpc_data_get_length(v34);
  else
    length = 0;
  xpc_dictionary_get_value(v20, "AcmeError");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v20, "AcmeStatus");
  xint = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v20, "AcmeNonce");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v20, "AcmeLocation");
  v57 = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xstring = v36;
  if (v36)
  {
    string_ptr = xpc_string_get_string_ptr(v36);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", string_ptr, xpc_string_get_length(xstring), 4, v48, v13, v11, v18);
    if (objc_msgSend(v38, "length"))
      objc_storeStrong((id *)&self->_nonce, v38);

  }
  if (v57)
  {
    v39 = xpc_string_get_string_ptr(v57);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v39, xpc_string_get_length(v57), 4);
    if (objc_msgSend(v40, "length"))
      objc_storeStrong((id *)&self->_location, v40);

  }
  if (v35)
    CFErrorWithXPCObject = SecCreateCFErrorWithXPCObject(v35);
  else
    CFErrorWithXPCObject = 0;
  if (xint)
    value = xpc_int64_get_value(xint);
  else
    value = 0;
  if (-[AcmeCertRequest errorStatusWithHTTPErrorCode:](self, "errorStatusWithHTTPErrorCode:", value, v48, v49, v50, v51))
  {
    v29 = 0;
  }
  else
  {
    if (v26)
      bytes_ptr = xpc_data_get_bytes_ptr(v26);
    else
      bytes_ptr = &unk_18AA61AAF;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes_ptr, length);
    v43 = objc_claimAutoreleasedReturnValue();
    if (self->_state == 9)
    {
      v60 = CFSTR("certificate");
      v61 = v43;
      v44 = (void *)v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v44;
      v29 = (void *)v45;
    }
    else
    {
      v58 = CFErrorWithXPCObject;
      v52 = (void *)v43;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v43, 0, &v58);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v58;

      if (v54)
      {
        secLogObjForScope("SecError");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = (const char *)v54;
          _os_log_impl(&dword_18A900000, v47, OS_LOG_TYPE_DEFAULT, "error converting json to dictionary: %@", buf, 0xCu);
        }

        v46 = v52;
        CFErrorWithXPCObject = v54;
      }
      else
      {
        CFErrorWithXPCObject = 0;
        v46 = v52;
      }
    }

  }
LABEL_17:

  if (a4)
    goto LABEL_22;
  if (v29)

  v31 = 0;
LABEL_23:

  v32 = CFErrorWithXPCObject;
  return v32;
}

- (id)pollForStatus:(id)a3 until:(id)a4
{
  NSObject *v4;
  dispatch_time_t v5;

  v4 = dispatch_semaphore_create(0);
  v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);

  return 0;
}

- (id)acmeRequest
{
  void *v3;
  SecJWSEncoder *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  SecJWSEncoder *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  SecJWSEncoder *v15;
  SecJWSEncoder *encoder;
  SecJWSEncoder *v17;
  NSString *nonce;
  NSString *acmeNewAccountURL;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  SecJWSEncoder *v24;
  NSString *account;
  NSString *v26;
  NSString *nextMessageURL;
  NSObject *v28;
  SecJWSEncoder *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  void *v33;
  NSData *v35;
  NSObject *v36;
  NSData *attestation;
  NSArray *v38;
  NSArray *attestationChain;
  NSObject *v40;
  void *v41;
  _BOOL4 requireAttestation;
  NSObject *v43;
  _BOOL4 v44;
  NSUInteger v45;
  void *v46;
  void *v47;
  SecJWSEncoder *v48;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint8_t buf[4];
  NSObject *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_state)
  {
    case 3:
      if (!self->_encoder)
      {
        v15 = objc_alloc_init(SecJWSEncoder);
        encoder = self->_encoder;
        self->_encoder = v15;

      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("termsOfServiceAgreed"));
      v17 = self->_encoder;
      nonce = self->_nonce;
      acmeNewAccountURL = self->_acmeNewAccountURL;
      v59 = 0;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v17, "encodedJWSWithPayload:kid:nonce:url:error:", v3, 0, nonce, acmeNewAccountURL, &v59);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v59;
      goto LABEL_13;
    case 4:
      -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
        v21 = (__CFString *)v20;
      else
        v21 = CFSTR("TEST");
      v62[0] = CFSTR("type");
      v62[1] = CFSTR("value");
      v63[0] = CFSTR("permanent-identifier");
      v63[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("identifiers"));

      v24 = self->_encoder;
      account = self->_account;
      v26 = self->_nonce;
      nextMessageURL = self->_nextMessageURL;
      v58 = 0;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v24, "encodedJWSWithPayload:kid:nonce:url:error:", v3, account, v26, nextMessageURL, &v58);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v58;

      goto LABEL_14;
    case 5:
      v29 = self->_encoder;
      v30 = self->_account;
      v31 = self->_nonce;
      v32 = self->_nextMessageURL;
      v57 = 0;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v29, "encodedJWSWithPayload:kid:nonce:url:error:", 0, v30, v31, v32, &v57);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v57;
      goto LABEL_13;
    case 6:
      if (!self->_attestationOids)
      {
        v36 = 0;
        goto LABEL_35;
      }
      if (!self->_attestationCRKey
        || (v56 = 0,
            -[AcmeCertRequest hardwareAttestationWithError:](self, "hardwareAttestationWithError:", &v56),
            v35 = (NSData *)objc_claimAutoreleasedReturnValue(),
            v36 = v56,
            attestation = self->_attestation,
            self->_attestation = v35,
            attestation,
            !v36))
      {
        v55 = 0;
        -[AcmeCertRequest requestAttestationChainWithError:](self, "requestAttestationChainWithError:", &v55);
        v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v36 = v55;
        attestationChain = self->_attestationChain;
        self->_attestationChain = v38;

        if (!v36)
        {
          secLogObjForScope("acme");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v45 = -[NSArray count](self->_attestationChain, "count");
            *(_DWORD *)buf = 134217984;
            v61 = v45;
            _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "attestation request succeeded; got %llu certificates",
              buf,
              0xCu);
          }
          goto LABEL_31;
        }
      }
      secLogObjForScope("acme");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v36;
        _os_log_impl(&dword_18A900000, v40, OS_LOG_TYPE_DEFAULT, "attestation request failed with error %@", buf, 0xCu);
      }

      -[NSObject localizedDescription](v36, "localizedDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("error"));

      requireAttestation = self->_requireAttestation;
      secLogObjForScope("acme");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if (!requireAttestation)
      {
        if (v44)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "attestation not explicitly required, ignoring error", buf, 2u);
        }

        v43 = v36;
LABEL_31:
        v36 = 0;
        goto LABEL_32;
      }
      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "attestation explicitly required, cannot continue with ACME", buf, 2u);
      }
LABEL_32:

      -[AcmeCertRequest attestationObjectWithCertificates:](self, "attestationObjectWithCertificates:", self->_attestationChain);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self->_encoder, "base64URLEncodedStringRepresentationWithData:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("attObj"));

      }
LABEL_35:
      v48 = self->_encoder;
      v49 = self->_account;
      v50 = self->_nonce;
      v51 = self->_nextMessageURL;
      v54 = v36;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v48, "encodedJWSWithPayload:kid:nonce:url:error:", v3, v49, v50, v51, &v54);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = v54;

LABEL_14:
LABEL_15:
      -[__CFString dataUsingEncoding:](v8, "dataUsingEncoding:", 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      return v33;
    case 7:
      -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:](self->_encoder, "base64URLEncodedStringRepresentationWithData:", self->_csr);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("csr"));

      v11 = self->_encoder;
      v12 = self->_account;
      v13 = self->_nonce;
      v14 = self->_nextMessageURL;
      v53 = 0;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v11, "encodedJWSWithPayload:kid:nonce:url:error:", v3, v12, v13, v14, &v53);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v53;
      goto LABEL_13;
    case 8:
    case 9:
      v4 = self->_encoder;
      v5 = self->_account;
      v6 = self->_nonce;
      v7 = self->_nextMessageURL;
      v52 = 0;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:](v4, "encodedJWSWithPayload:kid:nonce:url:error:", 0, v5, v6, v7, &v52);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v52;
LABEL_13:
      v28 = v9;
      goto LABEL_14;
    default:
      v8 = CFSTR("{}");
      goto LABEL_15;
  }
}

- (id)processReply:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSString *v8;
  NSString *acmeNewAccountURL;
  NSString *v10;
  NSString *acmeNewNonceURL;
  NSString *v12;
  NSString *acmeNewOrderURL;
  NSString *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  NSString *nonce;
  void *v24;
  int v25;
  NSArray *v26;
  NSArray *authorizations;
  NSString *v28;
  NSString *authorizationURL;
  NSString *v30;
  NSString *finalizeOrderURL;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  BOOL v35;
  unint64_t i;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSString *v46;
  NSString *challengeURL;
  NSString *v48;
  NSString *token;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSString *v56;
  NSString *certificateURL;
  char v58;
  NSString *v59;
  int v60;
  __SecCertificate *v61;
  NSString *nextMessageURL;
  int64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSString *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSString *v82;
  char v83;
  void *v84;
  uint64_t v85;
  void *v86;
  char v87;
  char v88;
  void *v89;
  void *v90;
  uint64_t v91;
  const __CFString *v92;
  uint64_t v93;
  const __CFString *v94;
  uint64_t v95;
  __CFString *v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  _QWORD v110[3];

  v110[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  switch(self->_state)
  {
    case 1:
      objc_msgSend(v4, "objectForKey:", CFSTR("newAccount"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewAccountURL = self->_acmeNewAccountURL;
      self->_acmeNewAccountURL = v8;

      objc_msgSend(v5, "objectForKey:", CFSTR("newNonce"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewNonceURL = self->_acmeNewNonceURL;
      self->_acmeNewNonceURL = v10;

      objc_msgSend(v5, "objectForKey:", CFSTR("newOrder"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewOrderURL = self->_acmeNewOrderURL;
      self->_acmeNewOrderURL = v12;

      if (self->_acmeNewAccountURL)
      {
        v14 = self->_acmeNewNonceURL;
        if (v14)
        {
          if (self->_acmeNewOrderURL)
          {
            objc_storeStrong((id *)&self->_nextMessageURL, v14);
            v6 = 0;
            v7 = 0;
            v15 = 2;
            goto LABEL_9;
          }
        }
      }
      v64 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2F90];
      v6 = CFSTR("failed to get directory info");
      v109 = *MEMORY[0x1E0CB2D50];
      v110[0] = CFSTR("failed to get directory info");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -67683;
      v19 = v64;
      v20 = v65;
      goto LABEL_48;
    case 2:
      objc_msgSend(v4, "objectForKey:", CFSTR("Replay-Nonce"));
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      nonce = self->_nonce;
      self->_nonce = v22;

      if (self->_nonce)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewAccountURL);
        v6 = 0;
        v7 = 0;
        v15 = 3;
LABEL_9:
        self->_state = v15;
        goto LABEL_66;
      }
      v72 = (void *)MEMORY[0x1E0CB35C8];
      v73 = *MEMORY[0x1E0CB2F90];
      v6 = CFSTR("failed to get initial nonce");
      v107 = *MEMORY[0x1E0CB2D50];
      v108 = CFSTR("failed to get initial nonce");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v72;
      v20 = v73;
      v21 = -67673;
LABEL_48:
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    case 3:
      objc_msgSend(v4, "objectForKey:", CFSTR("orders"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("status"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("valid"));
      objc_storeStrong((id *)&self->_account, self->_location);
      if (v25 && v18)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewOrderURL);
        v6 = 0;
        v7 = 0;
        self->_state = 4;
      }
      else
      {
        v66 = (void *)MEMORY[0x1E0CB35C8];
        v67 = *MEMORY[0x1E0CB2F90];
        v105 = *MEMORY[0x1E0CB2D50];
        v6 = CFSTR("failed to establish account");
        v106 = CFSTR("failed to establish account");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", v67, -67673, v68);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_65;
    case 4:
      objc_msgSend(v4, "objectForKey:", CFSTR("status"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v89, "isEqualToString:", CFSTR("pending"));
      objc_msgSend(v5, "objectForKey:", CFSTR("authorizations"));
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      authorizations = self->_authorizations;
      self->_authorizations = v26;

      -[NSArray objectAtIndex:](self->_authorizations, "objectAtIndex:", 0);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      authorizationURL = self->_authorizationURL;
      self->_authorizationURL = v28;

      objc_msgSend(v5, "objectForKey:", CFSTR("finalize"));
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      finalizeOrderURL = self->_finalizeOrderURL;
      self->_finalizeOrderURL = v30;

      objc_storeStrong((id *)&self->_orderURL, self->_location);
      objc_msgSend(v5, "objectForKey:", CFSTR("identifiers"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");
      if (v33)
      {
        v34 = v33;
        v35 = 0;
        for (i = 0; i != v34; v35 = i >= v34)
        {
          objc_msgSend(v32, "objectAtIndex:", i);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKey:", CFSTR("type"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("permanent-identifier"));

          if (v39)
            break;
          ++i;
        }
      }
      else
      {
        v35 = 1;
      }
      v74 = self->_authorizationURL;
      if (v74 && !v35 && self->_finalizeOrderURL != 0 && (v87 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, v74);
        v6 = 0;
        v7 = 0;
        self->_state = 5;
      }
      else
      {
        if (v35)
          v6 = CFSTR("'permanent-identifier' type not supported by this server");
        else
          v6 = CFSTR("failed to submit order");
        v75 = (void *)MEMORY[0x1E0CB35C8];
        v76 = *MEMORY[0x1E0CB2F90];
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "errorWithDomain:code:userInfo:", v76, -67673, v77);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_66;
    case 5:
      objc_msgSend(v4, "objectForKey:", CFSTR("status"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v90, "isEqualToString:", CFSTR("pending"));
      objc_msgSend(v5, "objectForKey:", CFSTR("challenges"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      if (!v41)
        goto LABEL_68;
      v42 = v41;
      v43 = 0;
      break;
    case 6:
      objc_msgSend(v4, "objectForKey:", CFSTR("status"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("invalid")))
      {
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v51 = *MEMORY[0x1E0CB2F90];
        v6 = CFSTR("failed to successfully respond to challenge");
        v99 = *MEMORY[0x1E0CB2D50];
        v100 = CFSTR("failed to successfully respond to challenge");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, -67673, v52);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_65;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("valid")) & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[AcmeCertRequest pollForStatus:until:](self, "pollForStatus:until:", self->_orderURL, CFSTR("ready"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 0;
        if (v7)
          goto LABEL_65;
      }
      objc_storeStrong((id *)&self->_nextMessageURL, self->_finalizeOrderURL);
      v7 = 0;
      v63 = 7;
      goto LABEL_64;
    case 7:
      objc_msgSend(v4, "objectForKey:", CFSTR("status"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("invalid")))
      {
        v53 = (void *)MEMORY[0x1E0CB35C8];
        v54 = *MEMORY[0x1E0CB2F90];
        v6 = CFSTR("failed to finalize order");
        v97 = *MEMORY[0x1E0CB2D50];
        v98 = CFSTR("failed to finalize order");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, -67673, v55);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_65;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("valid")) & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[AcmeCertRequest pollForStatus:until:](self, "pollForStatus:until:", self->_orderURL, CFSTR("valid"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 0;
        if (v7)
          goto LABEL_65;
      }
      objc_storeStrong((id *)&self->_nextMessageURL, self->_orderURL);
      v7 = 0;
      v63 = 8;
      goto LABEL_64;
    case 8:
      objc_msgSend(v4, "objectForKey:", CFSTR("certificate"));
      v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      certificateURL = self->_certificateURL;
      self->_certificateURL = v56;

      objc_msgSend(v5, "objectForKey:", CFSTR("status"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v18, "isEqualToString:", CFSTR("valid"));
      v59 = self->_certificateURL;
      if (v59 && (v58 & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("order status is \"%@\", not yet \"valid\"), v18);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v70 = *MEMORY[0x1E0CB2F90];
        v95 = *MEMORY[0x1E0CB2D50];
        v96 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithDomain:code:userInfo:", v70, -67673, v71);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_65;
        v59 = self->_certificateURL;
      }
      objc_storeStrong((id *)&self->_nextMessageURL, v59);
      v7 = 0;
      v63 = 9;
      goto LABEL_64;
    case 9:
      objc_msgSend(v4, "objectForKey:", CFSTR("certificate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Got certificate: %@"), v18);
      v61 = (__SecCertificate *)SecCertificateCreateWithPEM(v60, (CFDataRef)v18);
      self->_certificate = v61;
      if (v61)
      {
        v6 = 0;
      }
      else
      {
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v79 = *MEMORY[0x1E0CB2F90];
        v6 = CFSTR("failed to obtain certificate");
        v93 = *MEMORY[0x1E0CB2D50];
        v94 = CFSTR("failed to obtain certificate");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "errorWithDomain:code:userInfo:", v79, -67673, v80);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_65;
      }
      nextMessageURL = self->_nextMessageURL;
      self->_nextMessageURL = 0;

      v7 = 0;
      v63 = 10;
LABEL_64:
      self->_state = v63;
LABEL_65:

      goto LABEL_66;
    case 0xALL:
      goto LABEL_66;
    default:
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2F90];
      v6 = CFSTR("unknown or uninitialized ACME state");
      v91 = *MEMORY[0x1E0CB2D50];
      v92 = CFSTR("unknown or uninitialized ACME state");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v16;
      v20 = v17;
      v21 = -909;
      goto LABEL_48;
  }
  while (1)
  {
    objc_msgSend(v40, "objectAtIndex:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", CFSTR("type"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", CFSTR("url"));
    v46 = (NSString *)objc_claimAutoreleasedReturnValue();
    challengeURL = self->_challengeURL;
    self->_challengeURL = v46;

    objc_msgSend(v44, "objectForKey:", CFSTR("token"));
    v48 = (NSString *)objc_claimAutoreleasedReturnValue();
    token = self->_token;
    self->_token = v48;

    if (objc_msgSend(v45, "isEqualToString:", CFSTR("device-attest-01")))
    {
      if (self->_challengeURL && self->_token)
        break;
    }

    if (v42 == ++v43)
      goto LABEL_68;
  }

LABEL_68:
  v82 = self->_challengeURL;
  if (!v82)
    goto LABEL_73;
  v83 = v88;
  if (!self->_token)
    v83 = 0;
  if ((v83 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_nextMessageURL, v82);
    v6 = 0;
    v7 = 0;
    self->_state = 6;
  }
  else
  {
LABEL_73:
    v84 = (void *)MEMORY[0x1E0CB35C8];
    v85 = *MEMORY[0x1E0CB2F90];
    v6 = CFSTR("failed to request authorization");
    v101 = *MEMORY[0x1E0CB2D50];
    v102 = CFSTR("failed to request authorization");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "errorWithDomain:code:userInfo:", v85, -67673, v86);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_66:

  return v7;
}

- (BOOL)valueForBooleanDefault:(id)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  int Value;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.security"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
      Value = CFBooleanGetValue(v4);
    else
      Value = 0;
    CFRelease(v4);
  }
  else
  {
    Value = 0;
  }
  return Value != 0;
}

- (id)executeRequest
{
  int64_t state;
  void *v4;
  const void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *queue;
  NSObject *v10;
  int64_t v11;
  id v12;
  const void *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v17;
  NSString *v18;
  NSString *nextMessageURL;
  int64_t v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  id v25;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state > 0)
  {
    v4 = 0;
    goto LABEL_3;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AcmeCertRequest_executeRequest__block_invoke;
  block[3] = &unk_1E1FDBE18;
  block[4] = self;
  dispatch_sync(queue, block);
  -[AcmeCertRequest createKeyPair](self, "createKeyPair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_11;
  -[AcmeCertRequest createCSR](self, "createCSR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_11;
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("acmeDirectory"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  nextMessageURL = self->_nextMessageURL;
  self->_nextMessageURL = v18;

  if (self->_nextMessageURL)
  {
    v4 = 0;
    v20 = 1;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("acmeServerURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_nextMessageURL;
    self->_nextMessageURL = v22;

    v24 = self->_nextMessageURL;
    self->_state = 1;
    if (v24)
    {
      v4 = 0;
      goto LABEL_31;
    }
    -[AcmeCertRequest createCertificate](self, "createCertificate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 10;
  }
  self->_state = v20;
LABEL_31:
  state = self->_state;
LABEL_3:
  if (state <= 9)
  {
    v5 = (const void *)*MEMORY[0x1E0C9AE50];

    v6 = 0;
    while (1)
    {

      -[AcmeCertRequest acmeRequest](self, "acmeRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      -[AcmeCertRequest sendRequestToXPCService:response:](self, "sendRequestToXPCService:response:", v7, &v25);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v25;

      if (v4)
        break;
      -[AcmeCertRequest processReply:](self, "processReply:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v4 = (void *)v8;
        break;
      }
      if (self->_state >= 10)
      {
        v4 = 0;
        goto LABEL_25;
      }
    }
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_state;
      *(_DWORD *)buf = 134218242;
      v28 = v11;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "ACME request flow failed at step %lld: %@", buf, 0x16u);
    }

    v12 = -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", CFSTR("acmeLocalIssuer"));
    v13 = v12;
    if (v12)
    {
      CFRetain(v12);
      if (!self->_permitLocalIssuer)
      {
        v14 = CFGetTypeID(v13);
        if (v14 != CFBooleanGetTypeID() || !v5 || !CFEqual(v13, v5))
          goto LABEL_23;
      }
    }
    else if (!self->_permitLocalIssuer)
    {
      goto LABEL_24;
    }
    -[AcmeCertRequest createCertificate](self, "createCertificate");
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v15;
    if (v13)
LABEL_23:
      CFRelease(v13);
LABEL_24:
    self->_state = 10;
    goto LABEL_25;
  }
LABEL_11:
  v6 = 0;
LABEL_25:

  return v4;
}

- (__SecIdentity)identityWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  __SecCertificate *certificate;
  __SecKey *privateKey;
  __SecIdentity *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __SecKey *v14;
  const __CFDictionary *v15;
  __SecKey *publicKey;
  const __CFDictionary *v17;
  NSObject *v18;
  int v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  self->_identity = 0;
  -[AcmeCertRequest executeRequest](self, "executeRequest");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    if (self->_identity)
      goto LABEL_12;
    goto LABEL_8;
  }
  certificate = self->_certificate;
  if (!certificate || (privateKey = self->_privateKey) == 0)
  {
    if (!self->_identity)
      goto LABEL_7;
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v9 = (__SecIdentity *)SecIdentityCreate(*MEMORY[0x1E0C9AE00], certificate, privateKey);
  self->_identity = v9;
  if (v9)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create identity (check input values)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2F90];
  v26 = *MEMORY[0x1E0CB2D50];
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -67838, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v14 = self->_privateKey;
  if (v14)
  {
    v24[0] = CFSTR("class");
    v24[1] = CFSTR("v_Ref");
    v25[0] = CFSTR("keys");
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    SecItemDelete(v15);

  }
LABEL_12:
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v22[0] = CFSTR("class");
    v22[1] = CFSTR("v_Ref");
    v23[0] = CFSTR("keys");
    v23[1] = publicKey;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    SecItemDelete(v17);

  }
  if (v6)
  {
    secLogObjForScope("SecError");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "identityWithError: %@", (uint8_t *)&v20, 0xCu);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return self->_identity;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)logAcmeCSR
{
  return self->_logAcmeCSR;
}

- (void)setLogAcmeCSR:(BOOL)a3
{
  self->_logAcmeCSR = a3;
}

- (BOOL)permitLocalIssuer
{
  return self->_permitLocalIssuer;
}

- (void)setPermitLocalIssuer:(BOOL)a3
{
  self->_permitLocalIssuer = a3;
}

- (BOOL)requireAttestation
{
  return self->_requireAttestation;
}

- (void)setRequireAttestation:(BOOL)a3
{
  self->_requireAttestation = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)subject
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)keyParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)attestationOids
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAttestationOids:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)attestationChain
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAttestationChain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (__SecKey)attestationCRKey
{
  return self->_attestationCRKey;
}

- (void)setAttestationCRKey:(__SecKey *)a3
{
  self->_attestationCRKey = a3;
}

- (NSArray)attestationCRChain
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAttestationCRChain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)attestation
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAttestation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCsr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNonce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)timestamp
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)authorizations
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAuthorizations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)authorizationURL
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAuthorizationURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)challengeURL
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setChallengeURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)finalizeOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFinalizeOrderURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)orderURL
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOrderURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)certificateURL
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)nextMessageURL
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNextMessageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)acmeNewAccountURL
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAcmeNewAccountURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)acmeNewNonceURL
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAcmeNewNonceURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)acmeNewOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAcmeNewOrderURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (OS_dispatch_queue)xpc_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 224, 1);
}

- (void)setXpc_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 232, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (SecJWSEncoder)encoder
{
  return (SecJWSEncoder *)objc_getProperty(self, a2, 240, 1);
}

- (void)setEncoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_xpc_queue, 0);
  objc_storeStrong((id *)&self->_acmeNewOrderURL, 0);
  objc_storeStrong((id *)&self->_acmeNewNonceURL, 0);
  objc_storeStrong((id *)&self->_acmeNewAccountURL, 0);
  objc_storeStrong((id *)&self->_nextMessageURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_orderURL, 0);
  objc_storeStrong((id *)&self->_finalizeOrderURL, 0);
  objc_storeStrong((id *)&self->_challengeURL, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_authorizations, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_csr, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_attestationCRChain, 0);
  objc_storeStrong((id *)&self->_attestationChain, 0);
  objc_storeStrong((id *)&self->_attestationOids, 0);
  objc_storeStrong((id *)&self->_keyParams, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__AcmeCertRequest_executeRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 264);
  if (v3)
  {
    *(_QWORD *)(v2 + 264) = 0;
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 272);
  if (v4)
  {
    *(_QWORD *)(v2 + 272) = 0;
    CFRelease(v4);
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v5);

  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss-SSSS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 32), "valueForBooleanDefault:", CFSTR("LogAcmeCSR"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(*(id *)(a1 + 32), "valueForBooleanDefault:", CFSTR("PermitLocalIssuer"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = objc_msgSend(*(id *)(a1 + 32), "valueForBooleanDefault:", CFSTR("RequireAttestation"));

}

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_queue_t v3;
  uint64_t v4;
  void *v5;
  xpc_connection_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 224))
  {
    v3 = dispatch_queue_create("com.apple.security.XPCAcmeService", 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 224);
    *(_QWORD *)(v4 + 224) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 232))
  {
    v6 = xpc_connection_create("com.apple.security.XPCAcmeService", *(dispatch_queue_t *)(v2 + 224));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 232);
    *(_QWORD *)(v7 + 232) = v6;

    xpc_connection_set_event_handler(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 232), &__block_literal_global_140);
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 232));
  }
}

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  const char *string;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = MEMORY[0x18D7718B8]();
  v4 = MEMORY[0x1E0C81310];
  secLogObjForScope("SecError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]);
      v9 = 136315138;
      v10 = string;
      v7 = "connection error: %s";
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    v9 = 134217984;
    v10 = (const char *)v2;
    v7 = "unexpected connection event %p";
LABEL_6:
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
  }

}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
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
    if (!v13 || objc_msgSend(v13, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67671, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
      goto LABEL_8;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v13;
  }
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;
LABEL_8:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke()
{
  _getAppAttestInternalSymbol(&requestAttestationChainWithError__soft_AppAttest_DeviceAttestation_AttestKey, "AppAttest_DeviceAttestation_AttestKey");
}

uint64_t __45__AcmeCertRequest_deviceAttestationSupported__block_invoke()
{
  uint64_t result;
  uint64_t (*v1)(void);

  v1 = 0;
  _getAppAttestInternalSymbol(&v1, "AppAttest_DeviceAttestation_IsSupported");
  result = v1();
  deviceAttestationSupported_appAttestSupported = result;
  return result;
}

void __28__AcmeCertRequest_createCSR__block_invoke(uint64_t a1)
{
  CFDataRef CertificateRequest;
  uint64_t v3;
  void *v4;
  CFDataRef v5;
  CFDataRef v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CFDataRef v10;

  CertificateRequest = SecGenerateCertificateRequest(*(const __CFArray **)(*(_QWORD *)(a1 + 32) + 32), *(const __CFDictionary **)(*(_QWORD *)(a1 + 32) + 40), *(void **)(*(_QWORD *)(a1 + 32) + 248), *(__SecKey **)(*(_QWORD *)(a1 + 32) + 256));
  v3 = *(_QWORD *)(a1 + 32);
  v10 = CertificateRequest;
  if (*(_BYTE *)(v3 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/AcmeCsr_%@"), *(_QWORD *)(v3 + 136));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFData writeToFile:atomically:](v10, "writeToFile:atomically:", v4, 1);

    v5 = v10;
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = CertificateRequest;
  }
  objc_storeStrong((id *)(v3 + 96), v5);
  v6 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -67838, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = 0;
  }

}

void __32__AcmeCertRequest_createKeyPair__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  __SecKey *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const void *v9;
  const void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 256);
  if (v3)
  {
    *(_QWORD *)(v2 + 256) = 0;
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 248);
  if (v4)
  {
    *(_QWORD *)(v2 + 248) = 0;
    CFRelease(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = SecKeyCreateRandomKey(*(CFDictionaryRef *)(v2 + 48), (CFErrorRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v5 = *(__SecKey **)(*(_QWORD *)(a1 + 32) + 256);
  if (!v5
    || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = SecKeyCopyPublicKey(v5),
        v6 = *(_QWORD *)(a1 + 32),
        !*(_QWORD *)(v6 + 256))
    || !*(_QWORD *)(v6 + 248))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -26275, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(const void **)(v8 + 256);
    if (v9)
    {
      *(_QWORD *)(v8 + 256) = 0;
      CFRelease(v9);
      v8 = *(_QWORD *)(a1 + 32);
    }
    v10 = *(const void **)(v8 + 248);
    if (v10)
    {
      *(_QWORD *)(v8 + 248) = 0;
      CFRelease(v10);
    }
  }
}

void __37__AcmeCertRequest_sanitizeParameters__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const void *v5;
  const void *v6;
  CFTypeID v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  const char *v11;
  const void *v12;
  _BOOL4 v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CFTypeID v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  const void *v36;
  const void *v37;
  CFTypeID v38;
  CFTypeID TypeID;
  const void *v40;
  const void *v41;
  CFTypeID v42;
  CFTypeID v43;
  const void *v44;
  const void *v45;
  CFTypeID v46;
  CFTypeID v47;
  const void *v48;
  const void *v49;
  CFTypeID v50;
  CFTypeID v51;
  const void *v52;
  const void *v53;
  CFTypeID v54;
  CFTypeID v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  const void *v75;
  CFTypeID v76;
  void *v77;
  char v78;
  const void *v79;
  const void *v80;
  CFTypeID v81;
  void *v82;
  char v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictionary:", v4);

  v5 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("hardwareBound"));
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFBooleanGetTypeID())
    {
      v11 = "kSecUseHardwareBoundKey";
      goto LABEL_86;
    }
    if (*MEMORY[0x1E0C9AE50] && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.setoken"), CFSTR("tkid"));
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("type"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v11 = 0;
    else
      v11 = "kSecAttrKeyType";
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

    if ((isKindOfClass & 1) == 0)
      goto LABEL_86;
  }
  else
  {
    v12 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v6 && v12)
      v13 = CFEqual(v6, v12) != 0;
    else
      v13 = v6 == v12;
    if (v13)
      v14 = CFSTR("73");
    else
      v14 = CFSTR("42");
    v15 = v14;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("type"));

  }
  objc_msgSend(v2, "objectForKey:", CFSTR("bsiz"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();
    if ((v18 & 1) != 0)
      v11 = 0;
    else
      v11 = "kSecAttrKeySizeInBits";
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("bsiz"));

    if ((v18 & 1) == 0)
      goto LABEL_86;
    goto LABEL_36;
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (const void *)*MEMORY[0x1E0C9AE50];
  if (!v6 || !v20)
  {
    if (v6 != v20)
      goto LABEL_32;
LABEL_34:
    v21 = &unk_1E1FFEF80;
    goto LABEL_35;
  }
  if (CFEqual(v6, v20))
    goto LABEL_34;
LABEL_32:
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("42")) & 1) == 0)
    goto LABEL_34;
  v21 = &unk_1E1FFEF98;
LABEL_35:

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("bsiz"));
LABEL_36:
  objc_msgSend(v2, "objectForKey:", CFSTR("private"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("private"));

      v11 = "kSecPrivateKeyAttrs";
      goto LABEL_86;
    }
    if (!v6 || (v24 = CFGetTypeID(v6), v24 != CFBooleanGetTypeID()))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("private"));
      objc_msgSend(v23, "objectForKey:", CFSTR("labl"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("labl"));
      objc_msgSend(v23, "objectForKey:", CFSTR("atag"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("atag"));
      v27 = objc_msgSend(v23, "objectForKey:", CFSTR("perm"));
      if (v27)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("perm"));
      v28 = objc_msgSend(v23, "objectForKey:", CFSTR("extr"));
      if (v28)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("extr"));
      v29 = objc_msgSend(v23, "objectForKey:", CFSTR("sens"));
      if (v29)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sens"));
      v30 = objc_msgSend(v23, "objectForKey:", CFSTR("nleg"));
      if (v30)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("nleg"));
      v31 = objc_msgSend(v23, "objectForKey:", CFSTR("accc"));
      if (v31)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("accc"));

    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("private"));

  }
  objc_msgSend(v2, "objectForKey:", CFSTR("labl"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_opt_class();
    v33 = objc_opt_isKindOfClass();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("labl"));
    if ((v33 & 1) == 0)
    {

      v11 = "kSecAttrLabel";
      goto LABEL_86;
    }
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("atag"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("atag"));
    if ((v35 & 1) == 0)
    {

      v11 = "kSecAttrApplicationTag";
      goto LABEL_86;
    }
  }

  v36 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("perm"));
  if (v36)
  {
    v37 = v36;
    v38 = CFGetTypeID(v36);
    TypeID = CFBooleanGetTypeID();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("perm"));
    if (v38 != TypeID)
    {
      v11 = "kSecAttrIsPermanent";
      goto LABEL_86;
    }
  }
  v40 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("extr"));
  if (v40)
  {
    v41 = v40;
    v42 = CFGetTypeID(v40);
    v43 = CFBooleanGetTypeID();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("extr"));
    if (v42 != v43)
    {
      v11 = "kSecAttrIsExtractable";
      goto LABEL_86;
    }
  }
  v44 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("sens"));
  if (v44)
  {
    v45 = v44;
    v46 = CFGetTypeID(v44);
    v47 = CFBooleanGetTypeID();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("sens"));
    if (v46 != v47)
    {
      v11 = "kSecAttrIsSensitive";
      goto LABEL_86;
    }
  }
  v48 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("nleg"));
  if (v48)
  {
    v49 = v48;
    v50 = CFGetTypeID(v48);
    v51 = CFBooleanGetTypeID();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("nleg"));
    if (v50 != v51)
    {
      v11 = "kSecUseDataProtectionKeychain";
      goto LABEL_86;
    }
  }
  v52 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("accc"));
  if (v52)
  {
    v53 = v52;
    v54 = CFGetTypeID(v52);
    v55 = SecAccessControlGetTypeID();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("accc"));
    if (v54 != v55)
    {
      v11 = "kSecAttrAccessControl";
      goto LABEL_86;
    }
  }
  objc_msgSend(v2, "objectForKey:", CFSTR("clientIdentifier"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v11 = "kSecClientIdentifier";
    goto LABEL_86;
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("certificateLifetime"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = "kSecCertificateLifetime";
      goto LABEL_86;
    }
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("certificateSerial"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = "kSecCertificateSerialNumber";
      goto LABEL_86;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serialNumber");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v66, CFSTR("certificateSerial"));

  }
  objc_msgSend(v2, "objectForKey:", CFSTR("keyUsage"));
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = "kSecCertificateKeyUsage";
      goto LABEL_86;
    }
  }
  else
  {
    v68 = &unk_1E1FFEFB0;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E1FFEFB0, CFSTR("keyUsage"));
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("certificateEKUs"));
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = "kSecCertificateExtendedKeyUsage";
      goto LABEL_86;
    }
  }
  else
  {
    v86[0] = CFSTR("1.3.6.1.5.5.7.3.2");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v70, CFSTR("certificateEKUs"));
  }

  objc_msgSend(v2, "objectForKey:", kSecCMSSignHashAlgorithm);
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (id)v71;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = "kSecCMSSignHashAlgorithm";
      goto LABEL_86;
    }
  }
  else
  {
    v72 = (id)kSecCMSHashingAlgorithmSHA256;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v72, kSecCMSSignHashAlgorithm);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("subjectAltName"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v11 = "kSecSubjectAltName";
  }
  else
  {

    objc_msgSend(v2, "objectForKey:", CFSTR("acmeDirectory"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v11 = "kSecACMEDirectoryURL";
    }
    else
    {

      v75 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("attestationIdentity"));
      if (v75 && (v76 = CFGetTypeID(v75), v76 != SecIdentityGetTypeID()))
      {
        v11 = "kSecAttestationIdentity";
      }
      else
      {
        objc_msgSend(v2, "objectForKey:", CFSTR("attestationOids"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          objc_opt_class();
          v78 = objc_opt_isKindOfClass();
          if ((v78 & 1) != 0)
            v11 = 0;
          else
            v11 = "kSecAttestationOids";
        }
        else
        {
          v11 = 0;
          v78 = 1;
        }
        objc_msgSend(*(id *)(a1 + 32), "setAttestationOids:", v77);

        if ((v78 & 1) != 0)
        {
          v79 = (const void *)objc_msgSend(v2, "objectForKey:", CFSTR("attestationKey"));
          v80 = v79;
          if (v79 && (v81 = CFGetTypeID(v79), v81 != SecKeyGetTypeID()))
          {
            objc_msgSend(*(id *)(a1 + 32), "setAttestationCRKey:", v80);
            v11 = "kSecAttestationKey";
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "setAttestationCRKey:", v80);
            objc_msgSend(v2, "objectForKey:", CFSTR("attestationChain"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
            {
              objc_opt_class();
              v83 = objc_opt_isKindOfClass();
              if ((v83 & 1) != 0)
                v11 = 0;
              else
                v11 = "kSecAttestationChain";
            }
            else
            {
              v11 = 0;
              v83 = 1;
            }
            objc_msgSend(*(id *)(a1 + 32), "setAttestationCRChain:", v82);

            if ((v83 & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "setParameters:", v2);
              objc_msgSend(*(id *)(a1 + 32), "setKeyParams:", v3);
              goto LABEL_87;
            }
          }
        }
      }
    }
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRequestClientIdentity parameters dictionary has missing value or wrong type for %s key"), v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0CB35C8];
  v61 = *MEMORY[0x1E0CB2F90];
  v84 = *MEMORY[0x1E0CB2D50];
  v85 = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "errorWithDomain:code:userInfo:", v61, -50, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v65 = *(void **)(v64 + 40);
  *(_QWORD *)(v64 + 40) = v63;

LABEL_87:
}

void __34__AcmeCertRequest_sanitizeSubject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  const char *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = 0;
LABEL_6:
    v4 = "unknown";
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = 0;
    LODWORD(v2) = 0;
    goto LABEL_6;
  }
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  v4 = 0;
  LODWORD(v2) = 1;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (_DWORD)v2)
  {
    v5 = 1;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndex:", v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index %lu"), v5 - 1);
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "UTF8String");

        v7 = 0;
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index %lu"), v5 - 1);
        v8 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v4 = (const char *)-[__CFString UTF8String](v8, "UTF8String");
        goto LABEL_23;
      }
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_22;
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v26 = v9;
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".0123456789"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invertedSet");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (-[__CFString rangeOfCharacterFromSet:](v8, "rangeOfCharacterFromSet:", v11) == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_30;
        if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("EMAIL")))
        {

          v8 = CFSTR("1.2.840.113549.1.9.1");
LABEL_30:
          v9 = v26;

LABEL_31:
          v30[0] = v8;
          v30[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
          v13 = v9;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v13;
          objc_msgSend(v27, "addObject:", v15);

          v4 = 0;
          goto LABEL_32;
        }
        if ((objc_msgSend(&unk_1E1FFEEA8, "containsObject:", v8) & 1) != 0)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index %lu \"%@\"), v5 - 1, v8);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v4 = (const char *)objc_msgSend(v16, "UTF8String");

        v9 = v26;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index %lu"), v5 - 1);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v4 = (const char *)objc_msgSend(v11, "UTF8String");
      }

      if (!v4)
        goto LABEL_31;
LABEL_32:

LABEL_23:
      LOBYTE(v2) = v4 == 0;
      if (v5 < v3)
      {
        ++v5;
        if (!v4)
          continue;
      }
      break;
    }
  }
  if ((v2 & 1) != 0)
  {
    v17 = *(void **)(a1 + 32);
    v18 = v27;
    objc_msgSend(v17, "setSubject:", v27);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecRequestClientIdentity: subject array has missing value or wrong type for %s key"), v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2F90];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -50, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    v18 = v27;
  }

}

@end
