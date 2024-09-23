@implementation MFAACertificateManager

- (MFAACertificateManager)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  BOOL v3;
  id v4;
  NSObject *v5;
  MFAACertificateManager *v6;
  uint64_t v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  objc_super v13;

  init_logging();
  if (gLogObjects)
    v3 = gNumLogObjects < 2;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MFAACertificateManager _init].cold.1((uint64_t)self, v5);

  v13.receiver = self;
  v13.super_class = (Class)MFAACertificateManager;
  v6 = -[MFAACertificateManager init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.MFAAuthentication.MFAANetwork"));
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5E040);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.MFAAuthentication"));
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v10;

  }
  return v6;
}

- (void)validateCertificate:(id)a3 realtime:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 2;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "YES";
    if (!v9)
      v13 = "NO";
    *(_DWORD *)buf = 136315138;
    v23 = v13;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "Validating certificate... (completionHandler: %s)", buf, 0xCu);
  }

  if (v9)
  {
    if (v6)
    {
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__MFAACertificateManager_validateCertificate_realtime_completionHandler___block_invoke;
      block[3] = &unk_24CE34D60;
      block[4] = self;
      v19 = v8;
      v21 = v6;
      v20 = v9;
      dispatch_async(v14, block);

    }
    else
    {
      v17 = 0;
      v15 = -[MFAACertificateManager validateCertificate:realtime:error:](self, "validateCertificate:realtime:error:", v8, 0, &v17);
      v16 = v17;
      (*((void (**)(id, uint64_t, id))v9 + 2))(v9, v15, v16);

    }
  }

}

void __73__MFAACertificateManager_validateCertificate_realtime_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v6 = 0;
  objc_msgSend(v2, "validateCertificate:realtime:error:", v3, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)validateCertificate:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  const void *CertificateRefWithData;
  void *v17;
  int v18;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 2;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_DEFAULT, "Validating certificate...", (uint8_t *)&v21, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v8, "length");
    v15 = "NO";
    if (v6)
      v15 = "YES";
    v21 = 134218242;
    v22 = v14;
    v23 = 2080;
    v24 = v15;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "certificate.length: %lu, realtime: %s", (uint8_t *)&v21, 0x16u);
  }

  if (v8)
  {
    CertificateRefWithData = (const void *)createCertificateRefWithData(v8, 1);
    _createCertificateArrayForCert(CertificateRefWithData);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MFAACertificateManager _validateCertificateChain:realtime:error:](self, "_validateCertificateChain:realtime:error:", v17, v6, a5);
    if (CertificateRefWithData)
      CFRelease(CertificateRefWithData);
  }
  else
  {
    logObjectForModule(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager validateCertificate:realtime:error:].cold.1();

    v18 = 0;
    v17 = 0;
  }

  return v18;
}

- (int)validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t CertificateRefWithData;
  void *v24;
  int v25;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 2;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_DEFAULT, "Validating certificates...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v8, "count");
    v15 = "NO";
    if (v6)
      v15 = "YES";
    *(_DWORD *)buf = 134218242;
    v34 = v14;
    v35 = 2080;
    v36 = v15;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "certificates.count: %lu, realtime: %s", buf, 0x16u);
  }

  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = v16;
  if (!v8)
  {
    logObjectForModule(1);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager validateCertificateChain:realtime:error:].cold.1();
    goto LABEL_38;
  }
  if (!v16)
  {
    logObjectForModule(1);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager validateCertificateChain:realtime:error:].cold.2();
LABEL_38:

    v25 = 0;
    goto LABEL_33;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        CertificateRefWithData = createCertificateRefWithData(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), 1);
        if (!CertificateRefWithData)
        {

          v25 = 2;
          goto LABEL_33;
        }
        v24 = (void *)CertificateRefWithData;
        objc_msgSend(v17, "addObject:", CertificateRefWithData, (_QWORD)v28);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v20)
        continue;
      break;
    }
  }

  v25 = -[MFAACertificateManager _validateCertificateChain:realtime:error:](self, "_validateCertificateChain:realtime:error:", v17, v6, a5);
LABEL_33:

  return v25;
}

- (int)validateCertificateChain:(id)a3 type:(int)a4 realtime:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  CFIndex v14;
  CFMutableArrayRef v15;
  __CFArray *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFAllocator *v23;
  uint64_t i;
  SecCertificateRef v25;
  SecCertificateRef v26;
  NSObject *v27;
  __CFArray *v28;
  void *v29;
  const void *CertificateRefWithData;
  BOOL v31;
  id v32;
  void *v33;
  const void *v34;
  const __CFAllocator *v35;
  __CFArray *Mutable;
  const __CFData *v37;
  SecCertificateRef v38;
  const __CFAllocator *v39;
  const __CFData *v40;
  SecCertificateRef v41;
  NSObject *v42;
  NSObject *v43;
  int v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  const char *v48;
  id v49;
  uint64_t v50;
  const __CFArray *v51;
  const __CFArray *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  id v63;
  const char *v64;
  NSObject *v65;
  uint32_t v66;
  id v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  const __CFData *v73;
  SecCertificateRef v74;
  NSObject *v75;
  id v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  id v80;
  id v82;
  const __CFData *v83;
  SecCertificateRef v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  id v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  int v97;
  SecTrustRef trust;
  uint8_t buf[4];
  _BYTE v100[10];
  __int16 v101;
  _BOOL4 v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v7 = a5;
  v106 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = v10;
  switch(a4)
  {
    case 0:
      v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      objc_msgSend(v11, "objectAtIndex:", 0);
      v37 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v38 = SecCertificateCreateWithData(v35, v37);

      if (v38)
      {
        CFArrayAppendValue(Mutable, v38);
        CFRelease(v38);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v54 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v54 = MEMORY[0x24BDACB70];
          v82 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 0;
          _os_log_impl(&dword_212836000, v54, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }

      }
      objc_msgSend(v11, "objectAtIndex:", 1);
      v83 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v84 = SecCertificateCreateWithData(v35, v83);

      if (v84)
      {
        CFArrayAppendValue(Mutable, v84);
        CFRelease(v84);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v85 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v85 = MEMORY[0x24BDACB70];
          v86 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 0;
          _os_log_impl(&dword_212836000, v85, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get intermediateCert for type %d", buf, 8u);
        }

      }
      v44 = -[MFAACertificateManager _validateBAACertificateChain:error:](self, "_validateBAACertificateChain:error:", Mutable, a6);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v87 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v87 = MEMORY[0x24BDACB70];
        v88 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v100 = 0;
        *(_WORD *)&v100[4] = 1024;
        *(_DWORD *)&v100[6] = v44;
        _os_log_impl(&dword_212836000, v87, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: type=%d, status = %d", buf, 0xEu);
      }

      if (Mutable)
        CFRelease(Mutable);
      goto LABEL_168;
    case 1:
    case 6:
      trust = 0;
      v97 = 0;
      if (!v10 || !objc_msgSend(v10, "count"))
        goto LABEL_208;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);

      v12 = SecPolicyCreateiAP();
      if (!v12)
      {
        logObjectForModule(-1);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.2();
LABEL_207:

LABEL_208:
        v44 = 0;
        v52 = 0;
        goto LABEL_67;
      }
      v13 = (const void *)v12;
      v14 = objc_msgSend(v11, "count");
      v15 = CFArrayCreateMutable(0, v14, MEMORY[0x24BDBD690]);
      if (!v15)
      {
        logObjectForModule(-1);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.3();
        goto LABEL_207;
      }
      v16 = v15;
      v17 = v11;
      v18 = v7;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v92 = v17;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v94;
        v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v94 != v22)
              objc_enumerationMutation(v19);
            v25 = SecCertificateCreateWithData(v23, *(CFDataRef *)(*((_QWORD *)&v93 + 1) + 8 * i));
            if (v25)
            {
              v26 = v25;
              CFArrayAppendValue(v16, v25);
              CFRelease(v26);
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        }
        while (v21);
      }

      SecTrustCreateWithCertificates(v16, v13, &trust);
      if (!trust)
      {
        logObjectForModule(-1);
        v90 = objc_claimAutoreleasedReturnValue();
        v7 = v18;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.4();

        v44 = 0;
        v52 = 0;
        v11 = v92;
        goto LABEL_67;
      }
      v7 = v18;
      if (a4 == 1)
      {
        v11 = v92;
        if (_anchorCertsForMFi3_onceToken != -1)
          dispatch_once(&_anchorCertsForMFi3_onceToken, &__block_literal_global_174);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v27 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v27 = MEMORY[0x24BDACB70];
          v45 = MEMORY[0x24BDACB70];
        }
        v46 = &_anchorCertsForMFi3_anchorCerts;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v47 = objc_msgSend((id)_anchorCertsForMFi3_anchorCerts, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v100 = v47;
          v48 = "%lu anchor cert(s) returned for MFi3";
LABEL_59:
          _os_log_impl(&dword_212836000, v27, OS_LOG_TYPE_INFO, v48, buf, 0xCu);
        }
      }
      else
      {
        v11 = v92;
        if (_anchorCertsForMFi2_onceToken != -1)
          dispatch_once(&_anchorCertsForMFi2_onceToken, &__block_literal_global_0);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v27 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v27 = MEMORY[0x24BDACB70];
          v49 = MEMORY[0x24BDACB70];
        }
        v46 = &_anchorCertsForMFi2_anchorCerts;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v50 = objc_msgSend((id)_anchorCertsForMFi2_anchorCerts, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v100 = v50;
          v48 = "%lu anchor cert(s) returned for MFi2";
          goto LABEL_59;
        }
      }

      v51 = (const __CFArray *)(id)*v46;
      if (!v51)
      {
        logObjectForModule(-1);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.5();
        goto LABEL_207;
      }
      v52 = v51;
      SecTrustSetAnchorCertificates(trust, v51);
      if (MEMORY[0x212BF51D4](trust, &v97))
      {
        logObjectForModule(-1);
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.7();

        goto LABEL_66;
      }
      v44 = 1;
      if (v97 != 1 && v97 != 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager validateCertificateChain:type:realtime:error:].cold.6();
LABEL_66:
        v44 = 0;
      }
LABEL_67:

LABEL_168:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v100 = v44;
        *(_WORD *)&v100[4] = 1024;
        *(_DWORD *)&v100[6] = a4;
        v101 = 1024;
        v102 = v7;
        v103 = 2112;
        v104 = v11;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "validateCertificateChain: status %d, type %d, realtime %d, certificates %@", buf, 0x1Eu);
      }

      return v44;
    case 3:
    case 5:
      v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      CertificateRefWithData = (const void *)createCertificateRefWithData(v29, 1);

      if (CertificateRefWithData)
      {
        CFArrayAppendValue(v28, CertificateRefWithData);
        CFRelease(CertificateRefWithData);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v42 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v42 = MEMORY[0x24BDACB70];
          v56 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = a4;
          _os_log_impl(&dword_212836000, v42, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }

      }
      if (a4 == 5)
      {
        _anchorCertsForComponentAuth();
        v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (_anchorCertsForDEVN_onceToken != -1)
          dispatch_once(&_anchorCertsForDEVN_onceToken, &__block_literal_global_178);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v58 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v58 = MEMORY[0x24BDACB70];
          v59 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v60 = objc_msgSend((id)_anchorCertsForDEVN_anchorCerts, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v100 = v60;
          _os_log_impl(&dword_212836000, v58, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for DEVN", buf, 0xCu);
        }

        v57 = (id)_anchorCertsForDEVN_anchorCerts;
      }
      v61 = v57;
      v44 = -[MFAACertificateManager _validateX509CertificateChain:anchorCerts:error:](self, "_validateX509CertificateChain:anchorCerts:error:", v28, v57, a6);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v62 = MEMORY[0x24BDACB70];
        v63 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        goto LABEL_165;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v100 = a4;
      *(_WORD *)&v100[4] = 1024;
      *(_DWORD *)&v100[6] = v44;
      v64 = "validateCertificateChain: type=%d, status = %d";
      v65 = v62;
      v66 = 14;
      goto LABEL_164;
    case 4:
      v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (const void *)createCertificateRefWithData(v33, 1);

      if (v34)
      {
        CFArrayAppendValue(v28, v34);
        CFRelease(v34);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v53 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v53 = MEMORY[0x24BDACB70];
          v67 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 4;
          _os_log_impl(&dword_212836000, v53, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }

      }
      if (_anchorCertsForProvenance_onceToken != -1)
        dispatch_once(&_anchorCertsForProvenance_onceToken, &__block_literal_global_179);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v68 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v68 = MEMORY[0x24BDACB70];
        v69 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v70 = objc_msgSend((id)_anchorCertsForProvenance_anchorCerts, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v100 = v70;
        _os_log_impl(&dword_212836000, v68, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for Provenance", buf, 0xCu);
      }

      v61 = (id)_anchorCertsForProvenance_anchorCerts;
      v44 = -[MFAACertificateManager _validateX509CertificateChain:anchorCerts:error:](self, "_validateX509CertificateChain:anchorCerts:error:", v28, v61, a6);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v62 = MEMORY[0x24BDACB70];
        v71 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        goto LABEL_165;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v100 = v44;
      v64 = "validateCertificateChain: Provenance status = %d";
      goto LABEL_163;
    case 7:
      v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v28 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      objc_msgSend(v11, "objectAtIndex:", 0);
      v40 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v41 = SecCertificateCreateWithData(v39, v40);

      if (v41)
      {
        CFArrayAppendValue(v28, v41);
        CFRelease(v41);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v55 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v55 = MEMORY[0x24BDACB70];
          v72 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 7;
          _os_log_impl(&dword_212836000, v55, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get leafCert for type %d", buf, 8u);
        }

      }
      objc_msgSend(v11, "objectAtIndex:", 1);
      v73 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v74 = SecCertificateCreateWithData(v39, v73);

      if (v74)
      {
        CFArrayAppendValue(v28, v74);
        CFRelease(v74);
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v75 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v75 = MEMORY[0x24BDACB70];
          v76 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v100 = 7;
          _os_log_impl(&dword_212836000, v75, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Cannot get intermediateCert for type %d", buf, 8u);
        }

      }
      if (_anchorCertsForWPC_onceToken != -1)
        dispatch_once(&_anchorCertsForWPC_onceToken, &__block_literal_global_180);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v77 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v77 = MEMORY[0x24BDACB70];
        v78 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        v79 = objc_msgSend((id)_anchorCertsForWPC_anchorCerts, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v100 = v79;
        _os_log_impl(&dword_212836000, v77, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for WPC", buf, 0xCu);
      }

      v61 = (id)_anchorCertsForWPC_anchorCerts;
      v44 = -[MFAACertificateManager _validateX509CertificateChain:anchorCerts:error:](self, "_validateX509CertificateChain:anchorCerts:error:", v28, v61, a6);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v62 = MEMORY[0x24BDACB70];
        v80 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        goto LABEL_165;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v100 = v44;
      v64 = "validateCertificateChain: WPC status = %d";
LABEL_163:
      v65 = v62;
      v66 = 8;
LABEL_164:
      _os_log_impl(&dword_212836000, v65, OS_LOG_TYPE_DEFAULT, v64, buf, v66);
LABEL_165:

      if (v28)
        CFRelease(v28);

      goto LABEL_168;
    default:
      if (gLogObjects)
        v31 = gNumLogObjects < 2;
      else
        v31 = 1;
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v43 = MEMORY[0x24BDACB70];
        v32 = MEMORY[0x24BDACB70];
      }
      else
      {
        v43 = *(id *)(gLogObjects + 8);
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v100 = a4;
        _os_log_impl(&dword_212836000, v43, OS_LOG_TYPE_DEFAULT, "validateCertificateChain: Unrecognized cert type %d for cert validation, likely not supported by this API yet", buf, 8u);
      }

      v44 = 0;
      goto LABEL_168;
  }
}

- (void)requestMetadataForCertificate:(id)a3 requestedLocale:(id)a4 requestInfo:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  id *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  dispatch_time_t v32;
  NSObject *v33;
  _QWORD block[4];
  _QWORD v35[2];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (gLogObjects)
    v14 = gNumLogObjects < 2;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v16, OS_LOG_TYPE_DEFAULT, "Processing request for certificate metadata...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v17 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v17 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v10, "length");
    objc_msgSend(v11, "localeIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = "YES";
    *(_DWORD *)buf = 134218755;
    v43 = v19;
    v44 = 2112;
    if (!v13)
      v22 = "NO";
    v45 = v20;
    v46 = 2113;
    v47 = v12;
    v48 = 2080;
    v49 = v22;
    _os_log_impl(&dword_212836000, v17, OS_LOG_TYPE_DEFAULT, "certificate.length: %lu, requestedLocale: %@, requestInfo: %{private}@, completionHandler: %s", buf, 0x2Au);

  }
  if (v13)
  {
    if (systemInfo_isInternalBuild()
      && (-[MFAACertificateManager userDefaults](self, "userDefaults"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "BOOLForKey:", CFSTR("SpoofPPIDMetadata")),
          v23,
          v24))
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v25 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v25 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212836000, v25, OS_LOG_TYPE_DEFAULT, "Spoofing PPID metadata...", buf, 2u);
      }

      if (gLogObjects && gNumLogObjects >= 2)
      {
        v30 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v30 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = 1000;
        _os_log_impl(&dword_212836000, v30, OS_LOG_TYPE_INFO, "Sleeping %dms...", buf, 8u);
      }

      v32 = dispatch_time(0, 1000000000);
      dispatch_get_global_queue(0, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke;
      v39[3] = &unk_24CE34D88;
      v27 = &v41;
      v41 = v13;
      v40 = v11;
      dispatch_after(v32, v33, v39);

      v28 = v40;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60;
      block[3] = &unk_24CE34DB0;
      v27 = (id *)v35;
      v35[0] = v10;
      v35[1] = self;
      v36 = v11;
      v38 = v13;
      v37 = v12;
      dispatch_async(v26, block);

      v28 = v36;
    }

  }
}

uint64_t __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, const __CFString *, _QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), CFSTR("000000-0000"), *(_QWORD *)(a1 + 32), &unk_24CE3A000, 0);
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60(void **a1)
{
  void *CertificateRefWithData;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  CFDataRef v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  CFDataRef v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  CertificateRefWithData = (void *)createCertificateRefWithData(a1[4], 1);
  if (SecCertificateGetiAuthVersion() == 4)
  {
    _createCertificateArrayForCert(CertificateRefWithData);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v33 = 0;
    v5 = objc_msgSend(v4, "_validateCertificateChain:realtime:error:", v3, 1, &v33);
    v6 = v33;
    if (v5 == 1)
    {
      v29 = SecCertificateCopySerialNumberData((SecCertificateRef)CertificateRefWithData, 0);
      if (v29)
      {
        v7 = (void *)SecCertificateCopyIssuerSequence();
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v8 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v8 = MEMORY[0x24BDACB70];
          v9 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_4();

        if (v7)
        {
          v10 = (void *)SecCertificateCopyIssuerSummary();
          if (v10)
          {
            v11 = (void *)SecCertificateCopyOrganization();
            v12 = v11;
            if (v11
              && objc_msgSend(v11, "count")
              && (objc_msgSend(v12, "objectAtIndexedSubscript:", 0), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v14 = (void *)v13;
              v27 = v7;
              v28 = v3;
              if (gLogObjects && gNumLogObjects >= 2)
              {
                v15 = *(id *)(gLogObjects + 8);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[MFAATokenManager _init].cold.2();
                v15 = MEMORY[0x24BDACB70];
                v16 = MEMORY[0x24BDACB70];
              }
              v26 = v6;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                v17 = -[__CFData length](v29, "length");
                objc_msgSend(a1[6], "localeIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478851;
                v35 = v29;
                v36 = 2048;
                v37 = v17;
                v38 = 2112;
                v39 = v10;
                v40 = 2113;
                v41 = v14;
                v42 = 2112;
                v43 = v18;
                _os_log_impl(&dword_212836000, v15, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu, issuer: %@, ppid: %{private}@, requestedLocale: %@", buf, 0x34u);

              }
              objc_msgSend(a1[5], "xpcConnection");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v31[0] = MEMORY[0x24BDAC760];
              v31[1] = 3221225472;
              v31[2] = __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64;
              v31[3] = &unk_24CE34358;
              v32 = a1[8];
              objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v31);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = a1[8];
              v7 = v27;
              objc_msgSend(v20, "requestMetadataForCertSerial:issuerSeq:ppid:requestedLocale:requestInfo:withReply:", v29);

              v21 = v26;
              v3 = v28;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -4);
              v14 = v6;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -4);
            v12 = v6;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -4);
          v10 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -4);
        v7 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:description:", CFSTR("MFAACertificateManagerErrorDomain"), -3, CFSTR("The provided certificate is not valid."));
      v25 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v25;
    }
  }
  else
  {
    logObjectForModule(1);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_6();

    objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (CertificateRefWithData)
    CFRelease(CertificateRefWithData);
  if (v21)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v22 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_1();

    (*((void (**)(void))a1[8] + 2))();
  }

}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_3();

  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v8 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)copyParsedCertificateChainInfo:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  char *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (uint64_t)v3;
    _os_log_impl(&dword_212836000, v6, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: certificateData %@", buf, 0xCu);
  }

  if (!v3)
  {
    logObjectForModule(1);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.2();
    goto LABEL_32;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v7)
  {
    logObjectForModule(1);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.3();
LABEL_32:

    v8 = 0;
LABEL_36:
    v15 = 0;
    goto LABEL_37;
  }
  v8 = v7;
  v9 = objc_retainAutorelease(v3);
  v10 = (char *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v12 = CTParseAccessoryCerts(v10, v11, &v29, &v28, &v27, &v26, &v25);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v31 = v11;
    v32 = 2048;
    v33 = v28;
    v34 = 2048;
    v35 = v26;
    v36 = 2048;
    v37 = v25;
    v38 = 1024;
    v39 = v12;
    _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: certData(%zu bytes), leafCertData(%zu bytes), subCACertData(%zu bytes), ctPolicyFlags 0x%llx, ret %x", buf, 0x30u);
  }

  if (v12)
  {
    logObjectForModule(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.4();

    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v29, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_37:
    v16 = 0;
    v18 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("LeafCertData"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("FullCertData"));
  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v27, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("SubCACertData"));
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("PolicyFlags"));

  v18 = (void *)objc_msgSend(v8, "copy");
LABEL_38:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v21 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (uint64_t)v18;
    _os_log_impl(&dword_212836000, v21, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo: result %@", buf, 0xCu);
  }

  v23 = v18;
  return v23;
}

- (id)copyParsedCertificateChainInfo:(id)a3 assumeType:(int)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v17;
  id v18;
  int v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 2;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109378;
    v20 = a4;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, certificateData %@", (uint8_t *)&v19, 0x12u);
  }

  if (!v6)
  {
    logObjectForModule(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.2();
    goto LABEL_35;
  }
  if ((a4 + 1) > 7)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:assumeType:].cold.3();
LABEL_35:

    v10 = 0;
    goto LABEL_15;
  }
  if (((1 << (a4 + 1)) & 0xCF) == 0)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v12)
    {
      v11 = v12;
      objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("LeafCertData"));
      objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("FullCertData"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("PolicyFlags"));

      v10 = (id)objc_msgSend(v11, "copy");
      goto LABEL_18;
    }
    logObjectForModule(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfo:].cold.3();
    goto LABEL_35;
  }
  v10 = -[MFAACertificateManager copyParsedCertificateChainInfo:](self, "copyParsedCertificateChainInfo:", v6);
LABEL_15:
  v11 = 0;
LABEL_18:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109378;
    v20 = a4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_212836000, v14, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, result %@", (uint8_t *)&v19, 0x12u);
  }

  return v10;
}

- (id)copyParsedCertificateChainInfoFromCerts:(id)a3 assumeType:(int)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 2;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v28 = v4;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfoFromCerts:assumeType: %d, certificateList %@", buf, 0x12u);
  }

  if (!v6 || !objc_msgSend(v6, "count"))
  {
    logObjectForModule(1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfoFromCerts:assumeType:].cold.2();
    goto LABEL_35;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  if (!v10)
  {
    logObjectForModule(1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyParsedCertificateChainInfoFromCerts:assumeType:].cold.3();
LABEL_35:

    v11 = 0;
    v17 = 0;
    goto LABEL_22;
  }
  v11 = v10;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "appendData:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  v17 = -[MFAACertificateManager copyParsedCertificateChainInfo:assumeType:](self, "copyParsedCertificateChainInfo:assumeType:", v11, v4);
LABEL_22:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v28 = v4;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_212836000, v18, OS_LOG_TYPE_DEFAULT, "copyParsedCertificateChainInfo:assumeType: %d, result %@", buf, 0x12u);
  }

  return v17;
}

- (id)copyEvaluatedCertificateChainInfo:(id)a3
{
  return -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:](self, "copyEvaluatedCertificateChainInfo:forSpecificType:", a3, 0);
}

- (id)copyEvaluatedCertificateChainInfo:(id)a3 forSpecificType:(int)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  NSObject *v31;
  NSObject *v32;
  id v33;
  int v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  BOOL v45;
  int v46;
  void *v47;
  BOOL v48;
  int v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  NSObject *v59;
  id v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  size_t v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  id v79;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  id v85;
  unsigned int v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint8_t v107[128];
  _BYTE buf[32];
  uint64_t v109;

  v4 = *(_QWORD *)&a4;
  v109 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 2;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: certificateInfo %@, forSpecificType: 0x%02x", buf, 0x12u);
  }

  if (!v6)
  {
    logObjectForModule(1);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.2();
    goto LABEL_193;
  }
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  if (!v10)
  {
    logObjectForModule(1);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.3();
LABEL_193:

    v61 = 0;
    v64 = 0;
    v66 = 0;
    v89 = 0;
    v13 = 0;
    v67 = 0;
    v11 = 0;
    v65 = 0;
    goto LABEL_180;
  }
  v11 = v10;
  objc_msgSend(v10, "objectForKey:", CFSTR("LeafCertData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("SubCACertData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("PolicyFlags"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v88, "unsignedLongLongValue");
  if (v12)
  {
    if ((_DWORD)v4)
      +[MFAACertificateManager _anchorCertificatesDataForTypes:](MFAACertificateManager, "_anchorCertificatesDataForTypes:", v4);
    else
      -[MFAACertificateManager _getAnchorCertsForPolicy:](self, "_getAnchorCertsForPolicy:", v93);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v4;
    v15 = objc_retainAutorelease(v12);
    v91 = objc_msgSend(v15, "bytes");
    v87 = v15;
    v90 = objc_msgSend(v15, "length");
    if (v13)
    {
      v16 = objc_retainAutorelease(v13);
      v92 = objc_msgSend(v16, "bytes");
      v17 = objc_msgSend(v16, "length");
    }
    else
    {
      v92 = 0;
      v17 = 0;
    }
    v103 = 0;
    v104 = 0;
    v101 = 0;
    v102 = 0;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v18 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v93;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v17;
      _os_log_impl(&dword_212836000, v18, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: %lu anchorCerts, policy 0x%llx, subCACertLen %lu", buf, 0x20u);
    }

    v89 = v14;
    if (v14)
    {
      v84 = v11;
      v85 = v6;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v21 = v14;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
      v83 = v13;
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v98;
        v25 = MEMORY[0x24BDACB70];
LABEL_31:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v98 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v26);
          v28 = gLogObjects;
          v29 = gNumLogObjects;
          if (!gLogObjects || gNumLogObjects < 2)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v29;
              _os_log_error_impl(&dword_212836000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v31 = v25;
            v32 = v25;
          }
          else
          {
            v32 = *(id *)(gLogObjects + 8);
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v93;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v27;
            _os_log_impl(&dword_212836000, v32, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x16u);
          }

          v33 = objc_retainAutorelease(v27);
          v34 = CTEvaluateAccessoryCert(v91, v90, v92, v17, objc_msgSend(v33, "bytes"), objc_msgSend(v33, "length"), v93, &v104, &v103, &v102, &v101);
          v35 = gLogObjects;
          v36 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v37 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v35;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v36;
              _os_log_error_impl(&dword_212836000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v38 = v25;
            v37 = v25;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v34;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v93;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v33;
            _os_log_impl(&dword_212836000, v37, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: ctRet %d after try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x1Cu);
          }

          if (!v34)
            break;
          v39 = gLogObjects;
          v40 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v41 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v39;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v40;
              _os_log_error_impl(&dword_212836000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v42 = v25;
            v41 = v25;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v34;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v93;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v33;
            _os_log_debug_impl(&dword_212836000, v41, OS_LOG_TYPE_DEBUG, "copyEvaluatedCertificateChainInfo: ctRet %d after try CTEvaluateAccessoryCert for policy 0x%llx, anchorCert %@", buf, 0x1Cu);
          }

          if (v23 == ++v26)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
            if (v23)
              goto LABEL_31;
            break;
          }
        }
      }
      else
      {
        v34 = -1;
      }

      v11 = v84;
      v6 = v85;
      v13 = v83;
    }
    else
    {
      v34 = CTEvaluateAccessoryCert(v91, v90, v92, v17, 0, 0, v93, &v104, &v103, &v102, &v101);
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v43 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v43 = MEMORY[0x24BDACB70];
      v44 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      if (v104)
        v45 = v103 == 0;
      else
        v45 = 1;
      v46 = !v45;
      if (v45)
      {
        v47 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v102)
        v48 = v101 == 0;
      else
        v48 = 1;
      v49 = !v48;
      if (v48)
      {
        v50 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v34;
      _os_log_impl(&dword_212836000, v43, OS_LOG_TYPE_INFO, "copyEvaluatedCertificateChainInfo: leafKey %@, extensionValue %@, ctRet %d", buf, 0x1Cu);
      if (v49)

      if (v46)
    }

    if (!v34)
    {
LABEL_126:
      if (v104
        && v103
        && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:"),
            v61 = (id)objc_claimAutoreleasedReturnValue(),
            v61,
            v61))
      {
        objc_msgSend(v11, "setObject:forKey:", v61, CFSTR("PublicKey"));
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v62 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v62 = MEMORY[0x24BDACB70];
          v68 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212836000, v62, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: no leafKey", buf, 2u);
        }

        v61 = 0;
      }
      if (v102
        && v101
        && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:"),
            v64 = (id)objc_claimAutoreleasedReturnValue(),
            v64,
            v64))
      {
        objc_msgSend(v11, "setObject:forKey:", v64, CFSTR("ExtensionValue"));
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v69 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v69 = MEMORY[0x24BDACB70];
          v70 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212836000, v69, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: no extensionValue", buf, 2u);
        }

        v64 = 0;
      }
      if (v92 && v17)
      {
        v94 = 0;
        v95 = 0;
        v105 = 0xB6463F78648862ALL;
        v106 = 1;
        *(_QWORD *)buf = 0x66463F78648862ALL;
        *(_WORD *)&buf[8] = 327;
        v71 = &v105;
        v72 = 9;
        if (v93 != 0x40000000)
        {
          v71 = 0;
          v72 = 0;
        }
        if (v93 == 0x400000000)
          v73 = (uint64_t *)buf;
        else
          v73 = v71;
        if (v93 == 0x400000000)
          v74 = 10;
        else
          v74 = v72;
        CTParseExtensionValue(v92, v17, v73, v74, &v95, &v94);
        if (v95 && v94)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
          v75 = (id)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            objc_msgSend(v11, "setObject:forKey:", v75, CFSTR("SubCAExtensionValue"));
            v64 = v75;
            goto LABEL_171;
          }
        }
        else
        {

        }
        v64 = 0;
      }
LABEL_171:
      if (v93 == 0x40000000)
      {
        buf[8] = 2;
        *(_QWORD *)buf = 0xB6463F78648862ALL;
        v105 = 0;
        v95 = 0;
        CTParseExtensionValue(v91, v90, buf, 9uLL, &v105, &v95);
        v67 = v87;
        v66 = v88;
        if (v105 && v95)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
          v76 = (id)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            objc_msgSend(v11, "setObject:forKey:", v76, CFSTR("PartNumber"));
            v64 = v76;
LABEL_179:
            v65 = (void *)objc_msgSend(v11, "copy");
            goto LABEL_180;
          }
        }
        else
        {

        }
        v64 = 0;
        goto LABEL_179;
      }
      v67 = v87;
      v66 = v88;
      goto LABEL_179;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v51 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v51 = MEMORY[0x24BDACB70];
      v52 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212836000, v51, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: try validateCertificateChain:type:...", buf, 2u);
    }

    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v91 && v90)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v91, v90);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v54);

    }
    if (v92 && v17)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v92, v17);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v55);

    }
    if (v89)
      objc_msgSend(v53, "addObjectsFromArray:");
    if (objc_msgSend(v53, "count"))
    {
      v56 = +[MFAACertificateManager _anchorType2CertType:](MFAACertificateManager, "_anchorType2CertType:", v86);
      +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0;
      LODWORD(v56) = objc_msgSend(v57, "validateCertificateChain:type:realtime:error:", v53, v56, 0, &v96);
      v58 = v96;

      if ((_DWORD)v56 == 1)
        goto LABEL_125;
    }
    if (objc_msgSend(v53, "count"))
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v59 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v59 = MEMORY[0x24BDACB70];
        v60 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212836000, v59, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: try MFAAVerifyPublicCertificateChain", buf, 2u);
      }

      if (MFAAVerifyPublicCertificateChain((const __CFArray *)v53))
      {
LABEL_125:

        goto LABEL_126;
      }
    }

    logObjectForModule(1);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.7();

    v61 = 0;
    v64 = 0;
    v65 = 0;
    v67 = v87;
    v66 = v88;
  }
  else
  {
    logObjectForModule(1);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.4();

    v61 = 0;
    v64 = 0;
    v89 = 0;
    v67 = 0;
    v65 = 0;
    v66 = v88;
  }
LABEL_180:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v77 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v77 = MEMORY[0x24BDACB70];
    v78 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v65;
    _os_log_impl(&dword_212836000, v77, OS_LOG_TYPE_DEFAULT, "copyEvaluatedCertificateChainInfo: result %@", buf, 0xCu);
  }

  v79 = v65;
  return v79;
}

- (int)authVersionFromCertificateChainInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("PolicyFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "unsignedLongLongValue") & 0x8000000) != 0)
      {
        v7 = 2;
      }
      else if ((objc_msgSend(v6, "unsignedLongLongValue") & 4) != 0)
      {
        v7 = 3;
      }
      else if ((objc_msgSend(v6, "unsignedLongLongValue") & 0x40000000) != 0)
      {
        v7 = 4;
      }
      else if ((objc_msgSend(v6, "unsignedLongLongValue") & 0x41C00000000) != 0)
      {
        v7 = 5;
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    logObjectForModule(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.2();

    v7 = 0;
    v6 = 0;
  }
  if (gLogObjects)
    v8 = gNumLogObjects < 2;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[MFAACertificateManager authVersionFromCertificateChainInfo:].cold.1((uint64_t)v4, v7, v10);

  return v7;
}

- (id)copyCertificateSerialNumber:(id)a3 authVer:(int)a4
{
  id v5;
  void *v6;
  id v7;
  __SecCertificate *v8;
  __SecCertificate *v9;
  const __CFData *v10;
  const __CFData *v11;
  BOOL v12;
  const UInt8 *BytePtr;
  CFIndex Length;
  BOOL v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  NSObject *v20;
  CFErrorRef error;
  _BYTE buf[18];
  __int16 v23;
  const __CFData *v24;
  __int16 v25;
  CFErrorRef v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  error = 0;
  if (!v5)
  {
    logObjectForModule(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.3();
    goto LABEL_37;
  }
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");
  v8 = (__SecCertificate *)SecCertificateCreateWithBytes();
  if (!v8)
  {
    logObjectForModule(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.4();
LABEL_37:

    v11 = 0;
    goto LABEL_18;
  }
  v9 = v8;
  v10 = SecCertificateCopySerialNumberData(v8, &error);
  v11 = v10;
  if (v10)
    v12 = error == 0;
  else
    v12 = 0;
  if (v12)
  {
    if (a4 != 2)
      goto LABEL_17;
    BytePtr = CFDataGetBytePtr(v10);
    Length = CFDataGetLength(v11);
    v15 = BytePtr && Length == 15;
    if (!v15
      || ((char)BytePtr[7] & 0x80000000) == 0
      || (!MFAAIsInternalBuild() || (MFAAIsDevelopmentHW() & 1) == 0)
      && !MFAAIsDeveloperBuild())
    {
      goto LABEL_17;
    }
    v19 = *(_QWORD *)BytePtr;
    *(_QWORD *)&buf[7] = *(_QWORD *)(BytePtr + 7);
    *(_QWORD *)buf = v19;
    buf[7] = HIBYTE(v19) & 0x7F;
    CFRelease(v11);
    v11 = CFDataCreate(0, buf, 15);
    if (v11)
      goto LABEL_17;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.5();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[MFAACertificateManager copyCertificateSerialNumber:authVer:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1072;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = error;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d WARNING: pkSerNumData = %@, pCFError = %@", buf, 0x26u);
  }
  v11 = 0;
LABEL_17:
  CFRelease(v9);
LABEL_18:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v16 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[MFAACertificateManager copyCertificateSerialNumber:authVer:].cold.1();

  return v11;
}

- (id)copyLeafCertificateSerialNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    logObjectForModule(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyLeafCertificateSerialNumber:].cold.2();
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LeafCertData"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    logObjectForModule(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyLeafCertificateSerialNumber:].cold.3();
LABEL_17:

    v7 = 0;
    v8 = 0;
    goto LABEL_4;
  }
  v7 = (void *)v6;
  v8 = -[MFAACertificateManager copyCertificateSerialNumber:authVer:](self, "copyCertificateSerialNumber:authVer:", v6, -[MFAACertificateManager authVersionFromCertificateChainInfo:](self, "authVersionFromCertificateChainInfo:", v5));
LABEL_4:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v9 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "copyLeafCertificateSerialNumber: certSerial %@, certificateInfo %@", (uint8_t *)&v13, 0x16u);
  }

  return v8;
}

- (BOOL)verifyCertificateSerialNumberBySerialNumber:(id)a3 authVer:(int)a4
{
  id v5;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int NumRevokedAuthICBatches;
  _QWORD *RevokedAuthICBatches;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int NumRevokedAuth3Wafers;
  void *RevokedAuth3Wafers;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_26;
  }
  v7 = objc_retainAutorelease(v5);
  v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (!v8)
  {
    v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v32)
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_26;
  }
  if (a4 == 2 && v9 == 15)
  {
    v10 = (((unint64_t)*v8 << 56) | ((unint64_t)v8[1] << 48) | ((unint64_t)v8[3] << 40) | ((unint64_t)v8[4] << 32) | ((unint64_t)v8[5] << 24) | ((unint64_t)v8[7] << 16) | ((unint64_t)v8[9] << 8))
        + v8[10];
    v11 = v8[12];
    v12 = v8[13];
    v13 = v8[14];
    NumRevokedAuthICBatches = getNumRevokedAuthICBatches();
    RevokedAuthICBatches = getRevokedAuthICBatches();
    v16 = MFAAPrefixesBinarySearch((uint64_t)RevokedAuthICBatches, v10, NumRevokedAuthICBatches);
    if (v16 != -1
      && MFAABatchBinarySearch(RevokedAuthICBatches[3 * v16 + 2], (v11 << 16) | (v12 << 8) | v13, RevokedAuthICBatches[3 * v16 + 1]))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.4();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.3((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
LABEL_26:
      v43 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    if (a4 != 3 || v9 != 16)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.7();
      goto LABEL_26;
    }
    if ((char)*v8 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.6((uint64_t)v8, v44, v45, v46, v47, v48, v49, v50);
      goto LABEL_26;
    }
    v40 = ((unint64_t)*v8 << 40) | ((unint64_t)v8[1] << 32) | ((unint64_t)v8[2] << 24) | ((unint64_t)v8[3] << 16) | ((unint64_t)v8[4] << 8) | v8[5];
    NumRevokedAuth3Wafers = getNumRevokedAuth3Wafers();
    RevokedAuth3Wafers = getRevokedAuth3Wafers();
    if (MFAAWaferBinarySearch((uint64_t)RevokedAuth3Wafers, v40, NumRevokedAuth3Wafers))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.5();
      goto LABEL_26;
    }
  }
  v43 = 1;
LABEL_27:

  return v43;
}

- (BOOL)verifyCertificateSerialNumber:(id)a3 authVer:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[MFAACertificateManager verifyCertificateSerialNumber:authVer:].cold.2();
    goto LABEL_9;
  }
  v7 = -[MFAACertificateManager copyCertificateSerialNumber:authVer:](self, "copyCertificateSerialNumber:authVer:", v6, v4);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[MFAACertificateManager verifyCertificateSerialNumber:authVer:].cold.3();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = v7;
  if (-[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:](self, "verifyCertificateSerialNumberBySerialNumber:authVer:", v7, v4))
  {
    v9 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[MFAACertificateManager verifyCertificateSerialNumber:authVer:].cold.1(v8);
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)verifyCertificateChainInfoSerialNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  int v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    logObjectForModule(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.2();
    goto LABEL_27;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("LeafCertData"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    logObjectForModule(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyCertificateChainInfoSerialNumber:].cold.3();
LABEL_27:
    v9 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = -[MFAACertificateManager authVersionFromCertificateChainInfo:](self, "authVersionFromCertificateChainInfo:", v5);
  if ((v8 & 0xFFFFFFFE) == 2)
  {
    v9 = -[MFAACertificateManager verifyCertificateSerialNumber:authVer:](self, "verifyCertificateSerialNumber:authVer:", v7, v8);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      v16 = v8;
      _os_log_impl(&dword_212836000, v10, OS_LOG_TYPE_DEFAULT, "No certSerial support for auth type %d, skip", (uint8_t *)&v15, 8u);
    }

    v9 = 1;
  }
LABEL_14:

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109378;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "verifyCertificateLeafSerialNumber: bSerNumValid %d, certificateInfo %@", (uint8_t *)&v15, 0x12u);
  }

  return v9;
}

- (BOOL)verifyNonceSignature:(id)a3 nonce:(id)a4 signature:(id)a5
{
  id v8;
  const __CFData *v9;
  const __CFData *v10;
  const __CFData *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  MFAACertificateManager *v17;
  id v18;
  __SecCertificate *v19;
  __SecCertificate *v20;
  __SecKey *v21;
  __SecKey *v22;
  int v23;
  _BOOL4 v24;
  SecCertificateRef v25;
  __CFArray *Mutable;
  __CFArray *v27;
  const void *v28;
  const void *v29;
  __CFArray *v30;
  int v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  id v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __SecKey *v72;
  const __CFData *v73;
  const __CFData *v74;
  size_t v75;
  SecPadding v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  uint8_t *sig;
  size_t v86;
  NSObject *v87;
  const uint8_t *cf;
  __SecKey *cfa;
  MFAACertificateManager *v90;
  void *v91;
  const __CFData *v92;
  CFErrorRef error;
  SecTrustRef trust;
  uint8_t buf[4];
  _BYTE v96[18];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (const __CFData *)a4;
  v10 = (const __CFData *)a5;
  v11 = v10;
  error = 0;
  trust = 0;
  v92 = v9;
  if (!v8)
  {
    logObjectForModule(1);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager copyEvaluatedCertificateChainInfo:forSpecificType:].cold.2();
    goto LABEL_99;
  }
  if (!v9)
  {
    logObjectForModule(1);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.3();
    goto LABEL_99;
  }
  if (!v10)
  {
    logObjectForModule(1);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.4();
    goto LABEL_99;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("LeafCertData"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    logObjectForModule(1);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyCertificateChainInfoSerialNumber:].cold.3();
LABEL_99:

    v13 = 0;
LABEL_100:
    v91 = 0;
    v27 = 0;
    v30 = 0;
    v49 = 0;
    goto LABEL_65;
  }
  v13 = (void *)v12;
  objc_msgSend(v8, "objectForKey:", CFSTR("FullCertData"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    logObjectForModule(1);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.6();

    goto LABEL_100;
  }
  v15 = (void *)v14;
  v16 = -[MFAACertificateManager authVersionFromCertificateChainInfo:](self, "authVersionFromCertificateChainInfo:", v8);
  v91 = v15;
  if ((v16 - 4) <= 0xFFFFFFFD)
  {
    v17 = self;
    v18 = objc_retainAutorelease(v13);
    objc_msgSend(v18, "bytes");
    objc_msgSend(v18, "length");
    v19 = (__SecCertificate *)SecCertificateCreateWithBytes();
    if (v19)
    {
      v20 = v19;
      v21 = SecCertificateCopyKey(v19);
      if (v21)
      {
        v22 = v21;
        v23 = SecKeyVerifySignature(v21, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v9, v11, &error);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v96 = v23 != 0;
          *(_WORD *)&v96[4] = 2112;
          *(_QWORD *)&v96[6] = error;
          _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "signatureValidNoCertCheck for kSecKeyAlgorithmECDSASignatureMessageX962SHA256 = %d, error %@", buf, 0x12u);
        }
        if (error)
        {
          CFRelease(error);
          error = 0;
        }
        if (v23)
        {
          v24 = 1;
          self = v17;
        }
        else
        {
          v40 = SecKeyVerifySignature(v22, (SecKeyAlgorithm)*MEMORY[0x24BDE92D8], v9, v11, &error);
          v24 = v40 != 0;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v96 = v40 != 0;
            *(_WORD *)&v96[4] = 2112;
            *(_QWORD *)&v96[6] = error;
            _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "signatureValidNoCertCheck for kSecKeyAlgorithmECDSASignatureRFC4754 = %d, error %@", buf, 0x12u);
          }
          self = v17;
          if (error)
          {
            CFRelease(error);
            error = 0;
          }
        }
        CFRelease(v22);
        v27 = 0;
      }
      else
      {
        logObjectForModule(1);
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.8();

        v27 = 0;
        v24 = 0;
        self = v17;
      }
      goto LABEL_35;
    }
    logObjectForModule(1);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.7();

    v27 = 0;
    v30 = 0;
    v49 = 0;
    v24 = 0;
    v13 = v18;
    goto LABEL_110;
  }
  v25 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)v13);
  if (v25)
  {
    v20 = v25;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v27 = Mutable;
      CFArrayAppendValue(Mutable, v20);
      v28 = (const void *)SecPolicyCreateiAP();
      if (v28)
      {
        v29 = v28;
        SecTrustCreateWithCertificates(v27, v28, &trust);
        if (!trust)
        {
          v55 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v55)
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.12(v55, v56, v57, v58, v59, v60, v61, v62);
          v30 = 0;
          v49 = 0;
          goto LABEL_64;
        }
        *(_DWORD *)buf = 0;
        v30 = MFAACreateAnchorCertificateAuthorityArray(v16);
        if (v30)
        {
          v90 = self;
          SecTrustSetAnchorCertificates(trust, v30);
          if (MEMORY[0x212BF51D4](trust, buf))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.19();
LABEL_23:
            v31 = 0;
LABEL_63:
            v49 = v31 != 0;
LABEL_64:
            CFRelease(v20);
            CFRelease(v29);
LABEL_65:
            v24 = 0;
            goto LABEL_36;
          }
          if (*(_DWORD *)buf == 4 || *(_DWORD *)buf == 1)
          {
            v71 = MEMORY[0x212BF51BC](trust);
            if (!v71)
            {
              logObjectForModule(-1);
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.15();

              goto LABEL_23;
            }
            v72 = (__SecKey *)v71;
            v73 = objc_retainAutorelease(v92);
            cf = (const uint8_t *)-[__CFData bytes](v73, "bytes");
            v86 = -[__CFData length](v73, "length");
            v74 = objc_retainAutorelease(v11);
            sig = (uint8_t *)-[__CFData bytes](v74, "bytes");
            v75 = -[__CFData length](v74, "length");
            if ((_DWORD)v16 == 2)
            {
              v76 = 32770;
            }
            else
            {
              if ((_DWORD)v16 != 3)
              {
                cfa = v72;
                logObjectForModule(-1);
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.16();
                v31 = 1;
                goto LABEL_88;
              }
              v76 = 0x4000;
            }
            if (!SecKeyRawVerify(v72, v76, cf, v86, sig, v75))
            {
              v31 = 1;
              self = v90;
              goto LABEL_90;
            }
            logObjectForModule(-1);
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.18();
            cfa = v72;

            logObjectForModule(-1);
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.17();
            v31 = 0;
LABEL_88:
            self = v90;

            v72 = cfa;
LABEL_90:
            CFRelease(v72);
            goto LABEL_63;
          }
          logObjectForModule(-1);
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.14();

        }
        else
        {
          v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v63)
            -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.13(v63, v64, v65, v66, v67, v68, v69, v70);
        }
        v31 = 0;
        goto LABEL_63;
      }
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v41)
        -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.11(v41, v42, v43, v44, v45, v46, v47, v48);
    }
    else
    {
      v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v32)
        -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.10(v32, v33, v34, v35, v36, v37, v38, v39);
      v27 = 0;
    }
    v24 = 0;
LABEL_35:
    CFRelease(v20);
    v30 = 0;
    v49 = 0;
    goto LABEL_36;
  }
  v17 = self;
  logObjectForModule(1);
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.7();

  v27 = 0;
  v30 = 0;
  v49 = 0;
  v24 = 0;
LABEL_110:
  self = v17;
LABEL_36:
  if (trust)
  {
    CFRelease(trust);
    trust = 0;
  }
  if (v30)
    CFRelease(v30);
  if (v27)
    CFRelease(v27);
  if (v49)
  {
    LOBYTE(v24) = 1;
  }
  else
  {
    v50 = -[MFAACertificateManager copyLeafCertificateSerialNumber:](self, "copyLeafCertificateSerialNumber:", v8);
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v51 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v51 = MEMORY[0x24BDACB70];
      v52 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v53 = objc_msgSend(v50, "length");
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)v96 = v50;
      *(_WORD *)&v96[8] = 2048;
      *(_QWORD *)&v96[10] = v53;
      _os_log_impl(&dword_212836000, v51, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu", buf, 0x16u);
    }

    if (v24 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "auth cert validity check failed, but signature was signed by certificate ... treating as success", buf, 2u);
    }

  }
  return v24;
}

- (id)createVeridianNonce:(id)a3 withChallenge:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v5);
  v8 = (void *)SecSHA256DigestCreateFromData();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138413058;
    v11 = v6;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "createVeridianNonce: %@ + %@ -> %@ -> %@", (uint8_t *)&v10, 0x2Au);
  }

  return v8;
}

- (int)_validateCertificateChain:(id)a3 realtime:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  unint64_t v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  CFDataRef v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  int v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  id v50;
  int v51;
  void *v52;
  int v53;
  BOOL v54;
  int v55;
  NSObject *v56;
  const void *BasicX509;
  id v58;
  const void *v59;
  __SecTrust *v60;
  const __CFArray *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  void *v65;
  unint64_t v66;
  CFDataRef v67;
  id v68;
  id v69;
  const char *v70;
  const void *v71;
  const void *v72;
  __SecTrust *v73;
  uint64_t v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  id v80;
  int v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  id v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  id v95;
  uint64_t v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  id v101;
  uint64_t v102;
  NSObject *v103;
  id v104;
  uint64_t v105;
  NSObject *v106;
  id v107;
  NSObject *v109;
  id *v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  CFDataRef v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD block[5];
  const __CFData *v119;
  id v120;
  id v121;
  id v122;
  int v123;
  _BYTE buf[14];
  uint64_t v125;
  __int16 v126;
  void *v127;
  uint8_t v128[8];
  _QWORD v129[4];
  _QWORD v130[6];

  v6 = a4;
  v130[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = 0x253E6C000uLL;
  if (gLogObjects)
    v10 = gNumLogObjects < 2;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "Validating certificate... (internal)", buf, 2u);
  }

  if (systemInfo_isInternalBuild())
  {
    -[MFAACertificateManager userDefaults](self, "userDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringForKey:", CFSTR("SpoofCertificateStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v129[0] = CFSTR("default");
      v129[1] = CFSTR("valid");
      v130[0] = &unk_24CE39F28;
      v130[1] = &unk_24CE39F40;
      v129[2] = CFSTR("invalid");
      v129[3] = CFSTR("revoked");
      v130[2] = &unk_24CE39F58;
      v130[3] = &unk_24CE39F70;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v130, v129, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        if (v18)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v19 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAATokenManager _init].cold.2();
            v19 = MEMORY[0x24BDACB70];
            v21 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v18;
            _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "Spoofing certificate status: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
          }

          v22 = 0;
          goto LABEL_251;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v20 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v20 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.26((uint64_t)v14, v20, v24, v25, v26, v27, v28, v29);

      }
    }
  }
  objc_msgSend(v8, "objectAtIndex:", 0);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = SecCertificateCopySerialNumberData((SecCertificateRef)v30, 0);
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v32 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v32 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    v111 = v6;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl(&dword_212836000, v32, OS_LOG_TYPE_DEFAULT, "certSerial: %@", buf, 0xCu);
    }

    v35 = SecCertificateCopyIssuerSummary();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v36 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v36 = MEMORY[0x24BDACB70];
      v37 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v35;
      _os_log_impl(&dword_212836000, v36, OS_LOG_TYPE_DEFAULT, "certIssuer: %@", buf, 0xCu);
    }

    v38 = (void *)MEMORY[0x24BDBCE60];
    SecCertificateNotValidBefore();
    objc_msgSend(v38, "dateWithTimeIntervalSinceReferenceDate:");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDBCE60];
    SecCertificateNotValidAfter();
    objc_msgSend(v39, "dateWithTimeIntervalSinceReferenceDate:");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v40 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v40 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v116;
      *(_WORD *)&buf[12] = 2112;
      v125 = (uint64_t)v117;
      _os_log_impl(&dword_212836000, v40, OS_LOG_TYPE_DEFAULT, "expirationDate: %@, issueDate: %@", buf, 0x16u);
    }

    v115 = (void *)SecCertificateCopySubjectString();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v42 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v42 = MEMORY[0x24BDACB70];
      v43 = MEMORY[0x24BDACB70];
    }
    v112 = (void *)v35;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v115;
      _os_log_impl(&dword_212836000, v42, OS_LOG_TYPE_DEFAULT, "certSubject: %@", buf, 0xCu);
    }

    v44 = SecCertificateGetiAuthVersion();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v45 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v45 = MEMORY[0x24BDACB70];
      v46 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v44;
      _os_log_impl(&dword_212836000, v45, OS_LOG_TYPE_DEFAULT, "authVersion: %{coreacc:SeciAuthVersion}d", buf, 8u);
    }

    v113 = (void *)SecCertificateCopyComponentType();
    v114 = v31;
    if (!v113)
    {
      if (v44 == 4)
        goto LABEL_92;
      v48 = v112;
      if (!v44)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v49 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v49 = MEMORY[0x24BDACB70];
          v101 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.6();

        objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -3);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v18 = 2;
        goto LABEL_250;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        if (objc_msgSend(v8, "count"))
        {
          v66 = 0;
          do
          {
            v67 = SecCertificateCopyData((SecCertificateRef)objc_msgSend(v8, "objectAtIndex:", v66));
            objc_msgSend(v65, "addObject:", v67);

            ++v66;
          }
          while (objc_msgSend(v8, "count") > v66);
        }
        if (MFAAVerifyPublicCertificateChain((const __CFArray *)v65))
          v18 = 1;
        else
          v18 = 2;
        v48 = v112;
      }
      else
      {
        v18 = 0;
      }

LABEL_249:
      v22 = 0;
LABEL_250:
      CFRelease(v30);

      goto LABEL_251;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v47 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v47 = MEMORY[0x24BDACB70];
      v50 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v113;
      _os_log_impl(&dword_212836000, v47, OS_LOG_TYPE_DEFAULT, "componentType is present in certificate, value is %@", buf, 0xCu);
    }

    if (v44 == 4)
    {
LABEL_92:
      v110 = a5;
      *(_QWORD *)v128 = 0;
      v51 = mfaa_certificateManager_SWAuthCertType((uint64_t)v30);
      if ((systemInfo_isInternalBuild() & 1) == 0 && (systemInfo_isDeveloperBuild() & 1) == 0 && v51 != 1)
      {
        logObjectForModule(1);
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.17();

        v22 = 0;
        v18 = 2;
        goto LABEL_234;
      }
      -[MFAACertificateManager userDefaults](self, "userDefaults");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "BOOLForKey:", CFSTR("BypassCertificateExpirationCheck"));

      if (gLogObjects)
        v54 = gNumLogObjects <= 1;
      else
        v54 = 1;
      v55 = !v54;
      if (v53)
      {
        if (v55)
        {
          v56 = *(id *)(gLogObjects + 8);
          v9 = 0x253E6C000;
        }
        else
        {
          v9 = 0x253E6C000;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v56 = MEMORY[0x24BDACB70];
          v68 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "NO";
          _os_log_impl(&dword_212836000, v56, OS_LOG_TYPE_DEFAULT, "enforceExpiration: %s (overridden by internal setting)", buf, 0xCu);
        }
      }
      else
      {
        if (v55)
        {
          v56 = *(id *)(gLogObjects + 8);
          v9 = 0x253E6C000;
        }
        else
        {
          v9 = 0x253E6C000uLL;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v56 = MEMORY[0x24BDACB70];
          v69 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v70 = "NO";
          if (v51 == 2)
            v70 = "YES";
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v70;
          _os_log_impl(&dword_212836000, v56, OS_LOG_TYPE_DEFAULT, "enforceExpiration: %s", buf, 0xCu);
        }
      }

      v71 = (const void *)SecPolicyCreateiAPSWAuthWithExpiration();
      if (!v71)
      {
        v18 = 0;
        v22 = 0;
LABEL_234:
        v48 = v112;
        if (*(_QWORD *)v128)
          CFRelease(*(CFTypeRef *)v128);
        goto LABEL_250;
      }
      v72 = v71;
      if (SecTrustCreateWithCertificates(v30, v71, (SecTrustRef *)v128))
        goto LABEL_272;
      v73 = *(__SecTrust **)v128;
      if (_anchorCertsForSWAuth_onceToken != -1)
        dispatch_once(&_anchorCertsForSWAuth_onceToken, &__block_literal_global_175);
      v74 = *(_QWORD *)(v9 + 2088);
      if (v74 && gNumLogObjects >= 2)
      {
        v75 = *(id *)(v74 + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v75 = MEMORY[0x24BDACB70];
        v76 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        v77 = objc_msgSend((id)_anchorCertsForSWAuth_anchorCerts, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v77;
        _os_log_impl(&dword_212836000, v75, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for SW Auth", buf, 0xCu);
      }

      SecTrustSetAnchorCertificates(v73, (CFArrayRef)objc_retainAutorelease((id)_anchorCertsForSWAuth_anchorCerts));
      v123 = 0;
      if (MEMORY[0x212BF51D4](*(_QWORD *)v128, &v123))
      {
LABEL_272:
        v22 = 0;
        v18 = 0;
      }
      else
      {
        v78 = *(_QWORD *)(v9 + 2088);
        if (v78 && gNumLogObjects >= 2)
        {
          v79 = *(id *)(v78 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v79 = MEMORY[0x24BDACB70];
          v80 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v123;
          _os_log_impl(&dword_212836000, v79, OS_LOG_TYPE_DEFAULT, "trustResult: %d", buf, 8u);
        }

        v81 = v123;
        if (v123 == 4)
        {
          v18 = 1;
        }
        else if (v123 == 6)
        {
          v18 = 3;
        }
        else
        {
          *(_QWORD *)buf = 0;
          SecTrustEvaluateWithError(*(SecTrustRef *)v128, (CFErrorRef *)buf);
          if (*(_QWORD *)buf)
          {
            logObjectForModule(1);
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.12();

            if (*(_QWORD *)buf)
              CFRelease(*(CFTypeRef *)buf);
          }
          v18 = 2;
        }
        v83 = *(_QWORD *)(v9 + 2088);
        if (v83 && gNumLogObjects >= 2)
        {
          v84 = *(id *)(v83 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[MFAATokenManager _init].cold.2();
          v84 = MEMORY[0x24BDACB70];
          v85 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v18;
          _os_log_impl(&dword_212836000, v84, OS_LOG_TYPE_DEFAULT, "certStatus (local): %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
        }

        if (v81 == 4)
        {
          v86 = (void *)SecCertificateCopyIssuerSequence();
          v87 = *(_QWORD *)(v9 + 2088);
          if (v87 && gNumLogObjects >= 2)
          {
            v88 = *(id *)(v87 + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAATokenManager _init].cold.2();
            v88 = MEMORY[0x24BDACB70];
            v89 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_4();

          if (v86)
          {
            v90 = (void *)SecCertificateCopyOrganization();
            v91 = v90;
            if (v90
              && objc_msgSend(v90, "count")
              && (objc_msgSend(v91, "objectAtIndexedSubscript:", 0), (v92 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v93 = (void *)v92;
              if (gLogObjects && gNumLogObjects >= 2)
              {
                v94 = *(id *)(gLogObjects + 8);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[MFAATokenManager _init].cold.2();
                v94 = MEMORY[0x24BDACB70];
                v95 = MEMORY[0x24BDACB70];
              }
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                v96 = -[__CFData length](v114, "length");
                *(_DWORD *)buf = 138478339;
                *(_QWORD *)&buf[4] = v114;
                *(_WORD *)&buf[12] = 2048;
                v125 = v96;
                v126 = 2113;
                v127 = v93;
                _os_log_impl(&dword_212836000, v94, OS_LOG_TYPE_INFO, "certSerial: %{private}@, certSerial.length: %lu, ppid: %{private}@", buf, 0x20u);
              }

              if (v111)
              {
                v122 = 0;
                v18 = -[MFAACertificateManager _validateCertificateWithServer:issuerSeq:ppid:error:](self, "_validateCertificateWithServer:issuerSeq:ppid:error:", v114, v86, v93, &v122);
                v22 = v122;
                logObjectForModule(1);
                v97 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_212836000, v97, OS_LOG_TYPE_DEFAULT, "Finished sync server query!", buf, 2u);
                }

                logObjectForModule(1);
                v98 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v18;
                  _os_log_impl(&dword_212836000, v98, OS_LOG_TYPE_DEFAULT, "certStatus (remote): %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
                }

              }
              else
              {
                v18 = -[MFAACertificateManager _getCachedCertStatus:issuerSeq:ppid:](self, "_getCachedCertStatus:issuerSeq:ppid:", v114, v86, v93);
                logObjectForModule(1);
                v99 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = 1;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v18;
                  _os_log_impl(&dword_212836000, v99, OS_LOG_TYPE_INFO, "certStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d, cachedCertStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 0xEu);
                }

                if (v18 <= 1)
                  v18 = 1;
                dispatch_get_global_queue(-32768, 0);
                v100 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __67__MFAACertificateManager__validateCertificateChain_realtime_error___block_invoke;
                block[3] = &unk_24CE34DD8;
                block[4] = self;
                v119 = v114;
                v120 = v86;
                v121 = v93;
                dispatch_async(v100, block);

                v22 = 0;
              }

            }
            else
            {
              v22 = 0;
              v18 = 2;
            }

          }
          else
          {
            v22 = 0;
            v18 = 2;
          }

          a5 = v110;
          v9 = 0x253E6C000;
          goto LABEL_233;
        }
        v22 = 0;
      }
      a5 = v110;
LABEL_233:
      CFRelease(v72);
      goto LABEL_234;
    }
    *(_QWORD *)buf = 0;
    if (MFAAIsDevelopmentHW())
    {
      NSLog(CFSTR("Use BasicX509 policy for dev hw"));
      BasicX509 = SecPolicyCreateBasicX509();
    }
    else
    {
      BasicX509 = (const void *)SecPolicyCreateAppleComponentCertificate();
    }
    v59 = BasicX509;
    if (!BasicX509)
    {
      v18 = 0;
      v48 = v112;
LABEL_239:
      if (*(_QWORD *)buf)
        CFRelease(*(CFTypeRef *)buf);
      goto LABEL_249;
    }
    if (SecTrustCreateWithCertificates(v8, BasicX509, (SecTrustRef *)buf)
      || (v60 = *(__SecTrust **)buf,
          v61 = (const __CFArray *)_anchorCertsForComponentAuth(),
          SecTrustSetAnchorCertificates(v60, v61),
          v123 = 0,
          MEMORY[0x212BF51D4](*(_QWORD *)buf, &v123)))
    {
      v18 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v62 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v62 = MEMORY[0x24BDACB70];
        v63 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v128 = 67109120;
        *(_DWORD *)&v128[4] = v123;
        _os_log_impl(&dword_212836000, v62, OS_LOG_TYPE_DEFAULT, "trustResult: %d", v128, 8u);
      }

      if (v123 != 4)
      {
        v48 = v112;
        if (v123 == 5 && SecTrustIsExpiredOnly())
        {
          v18 = 1;
        }
        else
        {
          *(_QWORD *)v128 = 0;
          SecTrustEvaluateWithError(*(SecTrustRef *)buf, (CFErrorRef *)v128);
          if (*(_QWORD *)v128)
          {
            logObjectForModule(1);
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.12();

            if (*(_QWORD *)v128)
              CFRelease(*(CFTypeRef *)v128);
          }
          v18 = 2;
        }
        goto LABEL_238;
      }
      v18 = 1;
    }
    v48 = v112;
LABEL_238:
    CFRelease(v59);
    goto LABEL_239;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v33 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v33 = MEMORY[0x24BDACB70];
    v58 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.4();

  objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:", CFSTR("MFAACertificateManagerErrorDomain"), -3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 2;
LABEL_251:
  v102 = *(_QWORD *)(v9 + 2088);
  if (v102 && gNumLogObjects >= 2)
  {
    v103 = *(id *)(v102 + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v103 = MEMORY[0x24BDACB70];
    v104 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v18;
    _os_log_impl(&dword_212836000, v103, OS_LOG_TYPE_DEFAULT, "Returning certStatus: %{coreacc:MFAACertificateManager_CertStatus_t}d", buf, 8u);
  }

  if (v22)
  {
    v105 = *(_QWORD *)(v9 + 2088);
    if (v105 && gNumLogObjects >= 2)
    {
      v106 = *(id *)(v105 + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v106 = MEMORY[0x24BDACB70];
      v107 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_1();

  }
  if (a5)
    *a5 = objc_retainAutorelease(v22);

  return v18;
}

void __67__MFAACertificateManager__validateCertificateChain_realtime_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v15 = 0;
  v5 = objc_msgSend(v2, "_validateCertificateWithServer:issuerSeq:ppid:error:", v1, v3, v4, &v15);
  v6 = v15;
  if (v6)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 2;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_1();

  }
  if (gLogObjects)
    v10 = gNumLogObjects < 2;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v12, OS_LOG_TYPE_DEFAULT, "Finished async server query!", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v5;
    _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "certStatus (remote): %{coreacc:MFAACertificateManager_CertStatus_t}d)", buf, 8u);
  }

}

- (int)_validateBAACertificateChain:(id)a3 error:(id *)a4
{
  id v4;
  const void *AppleBasicAttestationUser;
  const void *v6;
  __SecTrust *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  int v19;
  SecTrustRef trust;
  _BYTE buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  trust = 0;
  AppleBasicAttestationUser = (const void *)SecPolicyCreateAppleBasicAttestationUser();
  if (AppleBasicAttestationUser)
  {
    v6 = AppleBasicAttestationUser;
    if (SecTrustCreateWithCertificates(v4, AppleBasicAttestationUser, &trust))
      goto LABEL_50;
    v7 = trust;
    if (_anchorCertsForBAAUser_onceToken != -1)
      dispatch_once(&_anchorCertsForBAAUser_onceToken, &__block_literal_global_177);
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend((id)_anchorCertsForBAAUser_anchorCerts, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_212836000, v8, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for BAA User", buf, 0xCu);
    }

    SecTrustSetAnchorCertificates(v7, (CFArrayRef)objc_retainAutorelease((id)_anchorCertsForBAAUser_anchorCerts));
    v19 = 0;
    if (MEMORY[0x212BF51D4](trust, &v19))
    {
LABEL_50:
      v13 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v19;
        _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_DEFAULT, "BAA trustResult: %d", buf, 8u);
      }

      if (v19 == 4 || v19 == 5 && SecTrustIsExpiredOnly())
      {
        v13 = 1;
      }
      else
      {
        *(_QWORD *)buf = 0;
        SecTrustEvaluateWithError(trust, (CFErrorRef *)buf);
        if (*(_QWORD *)buf)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v14 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAATokenManager _init].cold.2();
            v14 = MEMORY[0x24BDACB70];
            v15 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.12();

          if (*(_QWORD *)buf)
            CFRelease(*(CFTypeRef *)buf);
        }
        v13 = 2;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v13;
        _os_log_impl(&dword_212836000, v16, OS_LOG_TYPE_DEFAULT, "after verifying BAA cert chain, certStatus = %d", buf, 8u);
      }

    }
    CFRelease(v6);
    if (trust)
      CFRelease(trust);
  }
  else
  {
    v13 = 2;
  }

  return v13;
}

- (int)_validateX509CertificateChain:(id)a3 anchorCerts:(id)a4 error:(id *)a5
{
  id v6;
  const __CFArray *v7;
  SecPolicyRef BasicX509;
  SecPolicyRef v9;
  NSObject *v10;
  id v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v18;
  SecTrustRef trust;
  uint8_t buf[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (const __CFArray *)a4;
  trust = 0;
  BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    v9 = BasicX509;
    if (SecTrustCreateWithCertificates(v6, BasicX509, &trust)
      || (SecTrustSetAnchorCertificates(trust, v7), v18 = 0, MEMORY[0x212BF51D4](trust, &v18)))
    {
      v12 = 0;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v18;
        _os_log_impl(&dword_212836000, v10, OS_LOG_TYPE_DEFAULT, "X509 trustResult: %d", buf, 8u);
      }

      if (v18 == 4 || v18 == 5 && SecTrustIsExpiredOnly())
      {
        v12 = 1;
      }
      else
      {
        *(_QWORD *)buf = 0;
        SecTrustEvaluateWithError(trust, (CFErrorRef *)buf);
        if (*(_QWORD *)buf)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v13 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[MFAATokenManager _init].cold.2();
            v13 = MEMORY[0x24BDACB70];
            v14 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[MFAACertificateManager _validateCertificateChain:realtime:error:].cold.12();

          if (*(_QWORD *)buf)
            CFRelease(*(CFTypeRef *)buf);
        }
        v12 = 2;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v15 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v12;
        _os_log_impl(&dword_212836000, v15, OS_LOG_TYPE_DEFAULT, "after verifying standard X509 cert chain, certStatus = %d", buf, 8u);
      }

    }
    CFRelease(v9);
    if (trust)
      CFRelease(trust);
  }
  else
  {
    v12 = 2;
  }

  return v12;
}

- (int)_validateCertificateWithServer:(id)a3 issuerSeq:(id)a4 ppid:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  dispatch_semaphore_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint8_t buf[8];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212836000, v13, OS_LOG_TYPE_DEFAULT, "Validating certificate with server...", buf, 2u);
  }

  v15 = dispatch_semaphore_create(0);
  -[MFAACertificateManager xpcConnection](self, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke;
  v32[3] = &unk_24CE34E00;
  v34 = &v36;
  v18 = v15;
  v33 = v18;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke_99;
  v28[3] = &unk_24CE34E28;
  v30 = &v42;
  v31 = &v36;
  v20 = v18;
  v29 = v20;
  objc_msgSend(v19, "validateCertSerial:issuerSeq:ppid:withReply:", v10, v11, v12, v28);

  v21 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v20, v21))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:description:", CFSTR("MFAACertificateManagerErrorDomain"), -4, CFSTR("Timed out waiting for XPC reply!"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v37[5];
    v37[5] = v22;

  }
  if (v37[5])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v24 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager _validateCertificateWithServer:issuerSeq:ppid:error:].cold.1();

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v37[5]);
  v26 = *((_DWORD *)v43 + 6);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v26;
}

void __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_3();

  v7 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MFAA_errorWithDomain:code:description:", CFSTR("MFAACertificateManagerErrorDomain"), -4, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__MFAACertificateManager__validateCertificateWithServer_issuerSeq_ppid_error___block_invoke_99(uint64_t a1, int a2, id obj)
{
  id v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (int)_getCachedCertStatus:(id)a3 issuerSeq:(id)a4 ppid:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  int v24;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v11 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v44 = v8;
    _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_DEFAULT, "Checking cached cert status... (certSerial: %{private}@)", buf, 0xCu);
  }

  v13 = dispatch_semaphore_create(0);
  -[MFAACertificateManager xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke;
  v30[3] = &unk_24CE34E00;
  v32 = &v33;
  v16 = v13;
  v31 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke_103;
  v26[3] = &unk_24CE34E28;
  v28 = &v39;
  v29 = &v33;
  v18 = v16;
  v27 = v18;
  objc_msgSend(v17, "getCachedStatusForCertSerial:issuerSeq:ppid:withReply:", v8, v9, v10, v26);

  v19 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "MFAA_errorWithDomain:code:description:", CFSTR("MFAACertificateManagerErrorDomain"), -4, CFSTR("Timed out waiting for XPC reply!"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v34[5];
    v34[5] = v20;

  }
  if (v34[5])
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v22 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MFAACertificateManager _validateCertificateWithServer:issuerSeq:ppid:error:].cold.1();

  }
  v24 = *((_DWORD *)v40 + 6);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v24;
}

void __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_3();

  v7 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MFAA_errorWithDomain:code:description:", CFSTR("MFAACertificateManagerErrorDomain"), -4, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__MFAACertificateManager__getCachedCertStatus_issuerSeq_ppid___block_invoke_103(uint64_t a1, int a2, id obj)
{
  id v5;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)_anchorCertificatesDataForTypes:(int)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  init_logging();
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v34 = 67109120;
    LODWORD(v35) = a3;
    _os_log_impl(&dword_212836000, v7, OS_LOG_TYPE_INFO, "Generating anchor cert(s) for types: 0x%02X", (uint8_t *)&v34, 8u);
  }

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kiPodAccessoryCA1, 1091);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kiPodAccessoryCA2, 1026);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kAuth3ECSSubCAProd, 667);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kAuth3ECSSubCADev, 667);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kiPodAccessoryTestAuth3CA, 667);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    if (systemInfo_isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kiPodAccessoryTestCAProto, 637);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kAuth3ECSSubCASimu, 667);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", kAuth3ECSSubCADev0, 667);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

    }
  }
  if ((a3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_SWAuth_ProdRoot, 573);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    if (systemInfo_isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_SWAuth_TestRoot, 584);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

    }
  }
  if ((a3 & 8) != 0)
  {
    if (systemInfo_isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_VeridianAuth_SoftCA, 512);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_ComponentAuth_ComponentRoot, 517);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

  }
  if ((a3 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_BAAAuth_UserRoot, 542);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

  }
  if ((a3 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_DEVN_Root, 467);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v21);

  }
  if ((a3 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_Prov_Root, 1500);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  if ((a3 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_WPCCA1, 304);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    if (systemInfo_isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_TSTWPC1, 305);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_WPCDevCACert, 328);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v25);

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_WPCCAX, 304);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kCertDER_WPCDUMCA1, 306);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

    }
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v28 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v28 = MEMORY[0x24BDACB70];
    v29 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v4, "count");
    v34 = 134218240;
    v35 = v30;
    v36 = 1024;
    v37 = a3;
    _os_log_impl(&dword_212836000, v28, OS_LOG_TYPE_DEFAULT, "Returning %lu anchor cert(s) for types: 0x%02X", (uint8_t *)&v34, 0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v31 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v31 = MEMORY[0x24BDACB70];
    v32 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v34 = 138412290;
    v35 = (uint64_t)v4;
    _os_log_impl(&dword_212836000, v31, OS_LOG_TYPE_INFO, "anchorCerts: %@", (uint8_t *)&v34, 0xCu);
  }

  return v4;
}

+ (int)_anchorType2CertType:(int)a3
{
  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 == 64)
        return 4;
      if (a3 == 128)
        return 7;
    }
    else
    {
      if (a3 == 16)
        return 0;
      if (a3 == 32)
        return 3;
    }
    return -1;
  }
  if (a3 == 1)
    return 6;
  if (a3 != 2)
  {
    if (a3 == 8)
      return 5;
    return -1;
  }
  return 1;
}

- (id)_getAnchorCertsForPolicy:(unint64_t)a3
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (+[MFAACertificateManager isMFi2_3Policy:](MFAACertificateManager, "isMFi2_3Policy:"))
    v4 = 3;
  else
    v4 = 0;
  v5 = (a3 >> 27) & 8 | (a3 >> 38) & 0x10 | v4;
  if ((a3 & 0x30000000) != 0)
    v6 = v5 | 4;
  else
    v6 = v5;
  +[MFAACertificateManager _anchorCertificatesDataForTypes:](MFAACertificateManager, "_anchorCertificatesDataForTypes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_msgSend(v7, "copy");
  else
    v8 = 0;

  return v8;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MFAACertificateManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_1 != -1)
    dispatch_once(&sharedManager_once_1, block);
  return (id)sharedManager_sharedInstance_1;
}

void __39__MFAACertificateManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance_1;
  sharedManager_sharedInstance_1 = v1;

}

+ (id)anchorCertificatesForTypes:(int)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t CertificateRefWithBytes;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id v53;
  int v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  init_logging();
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v55 = 67109120;
    LODWORD(v56) = a3;
    _os_log_impl(&dword_212836000, v7, OS_LOG_TYPE_INFO, "Generating anchor cert(s) for types: 0x%02X", (uint8_t *)&v55, 8u);
  }

  if ((a3 & 1) != 0)
  {
    CertificateRefWithBytes = createCertificateRefWithBytes((uint64_t)&kiPodAccessoryCA1, 1091, 1);
    if (CertificateRefWithBytes)
    {
      v9 = (void *)CertificateRefWithBytes;
      objc_msgSend(v4, "addObject:", CertificateRefWithBytes);

    }
    v10 = createCertificateRefWithBytes((uint64_t)&kiPodAccessoryCA2, 1026, 1);
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "addObject:", v10);

    }
  }
  if ((a3 & 2) != 0)
  {
    v12 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCAProd, 667, 1);
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v4, "addObject:", v12);

    }
    v14 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCADev, 667, 1);
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v4, "addObject:", v14);

    }
    v16 = createCertificateRefWithBytes((uint64_t)kiPodAccessoryTestAuth3CA, 667, 1);
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v4, "addObject:", v16);

    }
    if (systemInfo_isInternalBuild())
    {
      v18 = createCertificateRefWithBytes((uint64_t)kiPodAccessoryTestCAProto, 637, 1);
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v4, "addObject:", v18);

      }
      v20 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCASimu, 667, 1);
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(v4, "addObject:", v20);

      }
      v22 = createCertificateRefWithBytes((uint64_t)kAuth3ECSSubCADev0, 667, 1);
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(v4, "addObject:", v22);

      }
    }
  }
  if ((a3 & 4) != 0)
  {
    v24 = createCertificateRefWithBytes((uint64_t)&kCertDER_SWAuth_ProdRoot, 573, 1);
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v4, "addObject:", v24);

    }
    if (systemInfo_isInternalBuild())
    {
      v26 = createCertificateRefWithBytes((uint64_t)&kCertDER_SWAuth_TestRoot, 584, 1);
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v4, "addObject:", v26);

      }
    }
  }
  if ((a3 & 8) != 0)
  {
    if (systemInfo_isInternalBuild())
    {
      v28 = createCertificateRefWithBytes((uint64_t)&kCertDER_VeridianAuth_SoftCA, 512, 1);
      if (v28)
      {
        v29 = (void *)v28;
        objc_msgSend(v4, "addObject:", v28);

      }
    }
    v30 = createCertificateRefWithBytes((uint64_t)&kCertDER_ComponentAuth_ComponentRoot, 517, 1);
    if (v30)
    {
      v31 = (void *)v30;
      objc_msgSend(v4, "addObject:", v30);

    }
  }
  if ((a3 & 0x10) != 0)
  {
    v32 = createCertificateRefWithBytes((uint64_t)&kCertDER_BAAAuth_UserRoot, 542, 1);
    if (v32)
    {
      v33 = (void *)v32;
      objc_msgSend(v4, "addObject:", v32);

    }
  }
  if ((a3 & 0x20) != 0)
  {
    v34 = createCertificateRefWithBytes((uint64_t)&kCertDER_DEVN_Root, 467, 1);
    if (v34)
    {
      v35 = (void *)v34;
      objc_msgSend(v4, "addObject:", v34);

    }
  }
  if ((a3 & 0x40) != 0)
  {
    v36 = createCertificateRefWithBytes((uint64_t)&kCertDER_Prov_Root, 1500, 1);
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(v4, "addObject:", v36);

    }
  }
  if ((a3 & 0x80) != 0)
  {
    v38 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCCA1, 304, 1);
    if (v38)
    {
      v39 = (void *)v38;
      objc_msgSend(v4, "addObject:", v38);

    }
    if (systemInfo_isInternalBuild())
    {
      v40 = createCertificateRefWithBytes((uint64_t)&kCertDER_TSTWPC1, 305, 1);
      if (v40)
      {
        v41 = (void *)v40;
        objc_msgSend(v4, "addObject:", v40);

      }
      v42 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCDevCACert, 328, 1);
      if (v42)
      {
        v43 = (void *)v42;
        objc_msgSend(v4, "addObject:", v42);

      }
      v44 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCCAX, 304, 1);
      if (v44)
      {
        v45 = (void *)v44;
        objc_msgSend(v4, "addObject:", v44);

      }
      v46 = createCertificateRefWithBytes((uint64_t)&kCertDER_WPCDUMCA1, 306, 1);
      if (v46)
      {
        v47 = (void *)v46;
        objc_msgSend(v4, "addObject:", v46);

      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v48 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v48 = MEMORY[0x24BDACB70];
    v49 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v50 = objc_msgSend(v4, "count");
    v55 = 134218240;
    v56 = v50;
    v57 = 1024;
    v58 = a3;
    _os_log_impl(&dword_212836000, v48, OS_LOG_TYPE_DEFAULT, "Returning %lu anchor cert(s) for types: 0x%02X", (uint8_t *)&v55, 0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v51 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v51 = MEMORY[0x24BDACB70];
    v52 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v55 = 138412290;
    v56 = (uint64_t)v4;
    _os_log_impl(&dword_212836000, v51, OS_LOG_TYPE_INFO, "anchorCerts: %@", (uint8_t *)&v55, 0xCu);
  }

  v53 = v4;
  return v53;
}

+ (BOOL)isMFi2_3Policy:(unint64_t)a3
{
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[MFAACertificateManager isMFi2_3Policy:].cold.1();

  return (v3 & 0x8000004) != 0;
}

+ (BOOL)isMFi2_3CertInfo:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("PolicyFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = +[MFAACertificateManager isMFi2_3Policy:](MFAACertificateManager, "isMFi2_3Policy:", objc_msgSend(v3, "unsignedLongLongValue"));
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isBAAUserPolicy:(unint64_t)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;

  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[MFAACertificateManager isBAAUserPolicy:].cold.1();

  return (a3 & 0x40000000000) != 0;
}

+ (BOOL)isBAAUserCertInfo:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("PolicyFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = +[MFAACertificateManager isBAAUserPolicy:](MFAACertificateManager, "isBAAUserPolicy:", objc_msgSend(v3, "unsignedLongLongValue"));
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isComponentPolicy:(unint64_t)a3
{
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[MFAACertificateManager isComponentPolicy:].cold.1();

  return (v3 & 0x40000000) != 0;
}

+ (BOOL)isComponentCertInfo:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("PolicyFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = +[MFAACertificateManager isComponentPolicy:](MFAACertificateManager, "isComponentPolicy:", objc_msgSend(v3, "unsignedLongLongValue"));
  else
    v5 = 0;

  return v5;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)_init
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_16(&dword_212836000, a2, v5, "Initializing %@...", v6);

  OUTLINED_FUNCTION_20();
}

- (void)validateCertificate:realtime:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "certificate is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:realtime:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "certificates are nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:realtime:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "failed array allocation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:type:realtime:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "validateCertificateChain: SecPolicyCreate pSecPolicyRef = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:type:realtime:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "validateCertificateChain: pArrayAccCert = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:type:realtime:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "validateCertificateChain: SecTrustCreateWithCertificates pSecTrustRef = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:type:realtime:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "validateCertificateChain: anchorCerts = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)validateCertificateChain:type:realtime:error:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "validateCertificateChain: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)validateCertificateChain:type:realtime:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "validateCertificateChain: SecTrustEvaluate failed osStatus:%02X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212836000, v0, v1, "error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_16(&dword_212836000, v0, v1, "issuerSeq: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_60_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Certificate is not valid for SW Auth! (authVersion: %{coreacc:SeciAuthVersion}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212836000, v0, v1, "error_int: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__MFAACertificateManager_requestMetadataForCertificate_requestedLocale_requestInfo_completionHandler___block_invoke_64_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14(&dword_212836000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)copyParsedCertificateChainInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter certificateData = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyParsedCertificateChainInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Failed to allocate certListDict!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyParsedCertificateChainInfo:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Failed to parse accessory cert chain: %x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyParsedCertificateChainInfo:assumeType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Unrecognized certType: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyParsedCertificateChainInfoFromCerts:assumeType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter certificateList!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyParsedCertificateChainInfoFromCerts:assumeType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Failed to allocate certData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter certficateInfo = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Unable to create mutable copy of certficateInfo!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "No leafCertData in certficateInfo!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyEvaluatedCertificateChainInfo:forSpecificType:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Failed to evaluate accessory cert chain: %x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)authVersionFromCertificateChainInfo:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  OUTLINED_FUNCTION_15(&dword_212836000, a3, (uint64_t)a3, "authVersionFromCertificateChainInfo: authVerMajor %d, certificateInfo %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

- (void)copyCertificateSerialNumber:authVer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_212836000, v1, OS_LOG_TYPE_DEBUG, "copyCertificateSerialNumber: certSerial %@, certificateData %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)copyCertificateSerialNumber:authVer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "copyCertificateSerialNumber: Invalid parameter certificateData = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyCertificateSerialNumber:authVer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "copyCertificateSerialNumber: Invalid pkSecCertRef = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyCertificateSerialNumber:authVer:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "%s:%d pkSerNumData == NULL!", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)copyLeafCertificateSerialNumber:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "copyLeafCertificateSerialNumber: Invalid parameter certficateInfo = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)copyLeafCertificateSerialNumber:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "copyLeafCertificateSerialNumber: Invalid leafCert == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateCertificateSerialNumber pkCertSerNum:NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDataGetBytePtr pkSerNumBytes:NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], a3, "Certificate serial number: <%{coreacc:bytes}.*P>\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212836000, MEMORY[0x24BDACB70], v0, "AuthV2 Found match revoked batchNum:%08llX", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_212836000, MEMORY[0x24BDACB70], v0, "AuthV3 found match revoked certWaferID:%08llX!", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateSerialNumberBySerialNumber:(uint64_t)a3 authVer:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Invalid AuthV3 WaferID MSB byte:%02X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyCertificateSerialNumberBySerialNumber:authVer:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "Unsupported authVerMajor:%02X, serNumLen:%02lX", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateSerialNumber:(void *)a1 authVer:.cold.1(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "length");
  objc_msgSend(objc_retainAutorelease(a1), "bytes");
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], v2, "Certificate serial number: <%{coreacc:bytes}.*P>\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_20();
}

- (void)verifyCertificateSerialNumber:authVer:.cold.2()
{
  uint64_t v0;
  uint8_t v1[14];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11_0();
  v2 = 1238;
  OUTLINED_FUNCTION_15(&dword_212836000, MEMORY[0x24BDACB70], v0, "%s:%d pkCertData = NULL!!", v1);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateSerialNumber:authVer:.cold.3()
{
  uint64_t v0;
  uint8_t v1[14];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11_0();
  v2 = 1233;
  OUTLINED_FUNCTION_15(&dword_212836000, MEMORY[0x24BDACB70], v0, "%s:%d pkCertSerNum = NULL!!", v1);
  OUTLINED_FUNCTION_2();
}

- (void)verifyCertificateChainInfoSerialNumber:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter certficateInfo, no leafCert!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter nonceData = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter signatureData = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Invalid parameter certficateInfo, no fullCert!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Failed to create CertRef = NULL! (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Failed to get publicKeyRef = NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFArrayCreateMutable pArrayAccCert = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecPolicyCreateXxx pSecPolicyRef = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecTrustCreateWithCertificates pSecTrustRef = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:(uint64_t)a3 nonce:(uint64_t)a4 signature:(uint64_t)a5 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateAnchorCertificateAuthorityArray pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0(&dword_212836000, v0, v1, "SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyNonceSignature:nonce:signature:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "SecTrustCopyPublicKey pSecKeyRef = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Unsupported authVerMajor %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, v0, v1, "Sec signature verification failed authVerMajor:%02X\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)verifyNonceSignature:nonce:signature:.cold.18()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_212836000, v1, OS_LOG_TYPE_ERROR, "SecKeyRawVerify osStatus:%02X, authVerMajor:%02X\n", v2, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)verifyNonceSignature:nonce:signature:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "SecTrustSetAnchorCertificates fail osStatus:%02X\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateCertificateChain:realtime:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "certRef is NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateCertificateChain:realtime:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Unable to extract auth version from certificate!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateCertificateChain:realtime:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_212836000, v0, v1, "trustError: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_validateCertificateChain:realtime:error:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_212836000, v0, v1, "Only production certs are valid on production builds!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_validateCertificateChain:(uint64_t)a3 realtime:(uint64_t)a4 error:(uint64_t)a5 .cold.26(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_212836000, a2, a3, "Unknown spoof status selected: '%@'. Falling back to %{coreacc:MFAACertificateManager_CertStatus_t}d...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_validateCertificateWithServer:issuerSeq:ppid:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_212836000, v0, v1, "error_int: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isMFi2_3Policy:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  LODWORD(v2) = 136316162;
  *(_QWORD *)((char *)&v2 + 4) = "+[MFAACertificateManager isMFi2_3Policy:]";
  OUTLINED_FUNCTION_12();
  HIWORD(v4) = 4;
  OUTLINED_FUNCTION_10_0(&dword_212836000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isMFi2_3Policy:]" >> 32, v3, v4, 2048);
  OUTLINED_FUNCTION_19();
}

+ (void)isBAAUserPolicy:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  LODWORD(v2) = 136316162;
  *(_QWORD *)((char *)&v2 + 4) = "+[MFAACertificateManager isBAAUserPolicy:]";
  OUTLINED_FUNCTION_12();
  HIWORD(v4) = 0;
  OUTLINED_FUNCTION_10_0(&dword_212836000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isBAAUserPolicy:]" >> 32, v3, v4, 0x4000000);
  OUTLINED_FUNCTION_19();
}

+ (void)isComponentPolicy:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  LODWORD(v2) = 136316162;
  *(_QWORD *)((char *)&v2 + 4) = "+[MFAACertificateManager isComponentPolicy:]";
  OUTLINED_FUNCTION_12();
  HIWORD(v4) = 0;
  OUTLINED_FUNCTION_10_0(&dword_212836000, v0, v1, "%s:%d policyFlags 0x%llx, check 0x%llx, result %d", (const char *)v2, (unint64_t)"+[MFAACertificateManager isComponentPolicy:]" >> 32, v3, v4, 0x4000);
  OUTLINED_FUNCTION_19();
}

@end
