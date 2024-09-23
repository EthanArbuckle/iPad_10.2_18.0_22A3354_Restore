uint64_t AppAttest_AppAttestation_IsEligibleApplication(__int128 *a1)
{
  AppAttestEligibilityManager *v2;
  __int128 v3;
  NSObject *v4;
  __int128 v5;
  __int128 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;

  v2 = objc_alloc_init(AppAttestEligibilityManager);
  v3 = a1[1];
  v11 = *a1;
  v12 = v3;
  if (-[AppAttestEligibilityManager isEligibleApplicationFor:](v2, "isEligibleApplicationFor:", &v11))
  {
    _DCAALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      AppAttest_AppAttestation_IsEligibleApplication_cold_1();
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  v5 = a1[1];
  v11 = *a1;
  v12 = v5;
  if (-[AppAttestEligibilityManager isEligibleDaemonFor:](v2, "isEligibleDaemonFor:", &v11))
  {
    _DCAALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      AppAttest_AppAttestation_IsEligibleApplication_cold_2();
    goto LABEL_10;
  }
  v6 = a1[1];
  v11 = *a1;
  v12 = v6;
  v7 = -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:](v2, "isEligibleApplicationExtensionFor:", &v11);
  _DCAALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
      AppAttest_AppAttestation_IsEligibleApplication_cold_3();
    goto LABEL_10;
  }
  if (v8)
    AppAttest_AppAttestation_IsEligibleApplication_cold_4();
  v9 = 0;
LABEL_11:

  return v9;
}

id _DCAALogSystem()
{
  if (_DCAALogSystem_onceToken != -1)
    dispatch_once(&_DCAALogSystem_onceToken, &__block_literal_global_3);
  return (id)_DCAALogSystem_log;
}

void _DCLogDebugBinary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  _WORD v24[9];

  *(_QWORD *)&v24[5] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    if (objc_msgSend(v8, "BOOLForKey:", CFSTR("EnableExtendedBinaryLogs")))
    {
      v19 = v8;
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v5;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v6;
        v23 = 1024;
        *(_DWORD *)v24 = objc_msgSend(v7, "length");
        v24[2] = 1024;
        *(_DWORD *)&v24[3] = objc_msgSend(v9, "length");
        _os_log_debug_impl(&dword_2167BD000, v10, OS_LOG_TYPE_DEBUG, "**BASE64DATABEGIN(%@:%u:%u)**\n", buf, 0x18u);
      }

      v20 = v9;
      v11 = objc_msgSend(v9, "length");
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = 0;
        v15 = 128;
        do
        {
          if (v12 >= v15)
            v16 = v15;
          else
            v16 = v12;
          v17 = v10;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "substringWithRange:", v14, v16 + v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v6;
            v23 = 2112;
            *(_QWORD *)v24 = v18;
            _os_log_debug_impl(&dword_2167BD000, v17, OS_LOG_TYPE_DEBUG, "**BASE64DATA     (%@)**[%@]\n", buf, 0x16u);

          }
          v14 += 128;

          v15 += 128;
          v13 -= 128;
        }
        while (v12 > v14);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        _DCLogDebugBinary_cold_1((uint64_t)v6, v10);

      v8 = v19;
    }

  }
}

id sendServerRequestWithError(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PinnedUrlDelegate *v12;
  void *v13;
  void *v14;
  PinnedUrlDelegate *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *, void *);
  void *v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[4];

  v6 = a1;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v65[3] = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  v52 = 0;
  if (!v6)
  {
    createAppAttestError((uint64_t)"sendServerRequestWithError", 119, -2, 0, CFSTR("Invalid input."), v3, v4, v5, v37);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v29 = (void *)v48[5];
    v48[5] = v28;

    v26 = 0;
    v27 = 0;
    v22 = 0;
    v15 = 0;
    goto LABEL_11;
  }
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)v54[5];
  v54[5] = (uint64_t)v7;

  if (!v54[5])
  {
    createAppAttestError((uint64_t)"sendServerRequestWithError", 125, -1, 0, CFSTR("Failed to create semaphore."), v9, v10, v11, v37);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v12 = [PinnedUrlDelegate alloc];
  objc_msgSend(v6, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PinnedUrlDelegate initWithHost:](v12, "initWithHost:", v14);

  if (!v15)
  {
    createAppAttestError((uint64_t)"sendServerRequestWithError", 131, -1, 0, CFSTR("Failed to create delegate."), v16, v17, v18, v37);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v22, v15, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __sendServerRequestWithError_block_invoke;
      v40 = &unk_24D595958;
      v43 = v65;
      v44 = &v47;
      v41 = v6;
      v22 = v22;
      v42 = v22;
      v45 = &v59;
      v46 = &v53;
      objc_msgSend(v26, "dataTaskWithRequest:completionHandler:", v41, &v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "resume", v37, v38, v39, v40);
      dispatch_semaphore_wait((dispatch_semaphore_t)v54[5], 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      createAppAttestError((uint64_t)"sendServerRequestWithError", 143, -1, 0, CFSTR("Failed to create session."), v23, v24, v25, v37);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v48[5];
      v48[5] = v35;

      v26 = 0;
      v27 = 0;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"sendServerRequestWithError", 137, -1, 0, CFSTR("Failed to query session configuration."), v19, v20, v21, v37);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v48[5];
    v48[5] = v33;

    v26 = 0;
    v27 = 0;
    v22 = 0;
  }
LABEL_11:
  objc_msgSend(v26, "invalidateAndCancel");
  v30 = (void *)v60[5];
  if (a2 && !v30)
  {
    *a2 = objc_retainAutorelease((id)v48[5]);
    v30 = (void *)v60[5];
  }
  v31 = v30;

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v65, 8);

  return v31;
}

void sub_2167BF8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __sendServerRequestWithError_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "statusCode");
  objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("X-B3-TraceId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!v7 || v8)
  {
    if (!v15)
    {
      createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 157, -7, v8, CFSTR("Network communication error"), v12, v13, v14, v41);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 56);
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connectionProxyDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1870], "description");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 159, -1, v8, CFSTR("Failed to send HTTP request to %@ (proxy settings: %@ // session: %@): %ld"), v20, v21, v22, (uint64_t)v18);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

  }
  else
  {
    if (v15 == 200)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 64);
LABEL_17:
      v39 = *(_QWORD *)(v17 + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v16;

      goto LABEL_18;
    }
    isNSString(v10);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      isNSString(v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        _DCAALogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218498;
          v45 = v30;
          v46 = 2082;
          v47 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          v48 = 2082;
          v49 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          _os_log_impl(&dword_2167BD000, v29, OS_LOG_TYPE_DEFAULT, "Invalid server response - (%ld) (%{public}s) (%{public}s)\n", buf, 0x20u);
        }

      }
    }
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if ((unint64_t)(v31 - 500) < 0x64)
      v32 = -7;
    else
      v32 = -6;
    objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"sendServerRequestWithError_block_invoke", 177, v32, 0, CFSTR("Server error: %ld (%@)"), v33, v34, v35, v31);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

  }
LABEL_18:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

BOOL AppAttest_Common_ValidateBikParameters(__SecKey *a1)
{
  const __CFDictionary *v1;
  void *Value;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!a1)
  {
    v7 = 0;
    v6 = 0;
    v4 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v1 = SecKeyCopyAttributes(a1);
  Value = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDE9158]);
  isNSString(Value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "compare:", *MEMORY[0x24BDE9170]))
  {
    v9 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDE9048]);
    isNSNumber(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v10 && (objc_msgSend(v10, "unsignedLongValue") == 256 || objc_msgSend(v6, "unsignedLongValue") == 384))
    {
      v11 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDE9050]);
      isNSString(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v5 = v12
        && (!objc_msgSend(v12, "compare:", *MEMORY[0x24BDE9060]) || !objc_msgSend(v7, "compare:", *MEMORY[0x24BDE9068]));
      goto LABEL_6;
    }
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = 0;
LABEL_6:
  if (v1)
    CFRelease(v1);
LABEL_9:

  return v5;
}

id getSHA256(void *a1)
{
  id v1;
  void *v2;
  id v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  isNSData(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_retainAutorelease(v1);
    if (CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md))
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void AppAttest_Common_AttestKey(unsigned int a1, int a2, void *a3, __SecKey *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19 = a7;
  if (a1 == 1)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKey", 316, -1, 0, CFSTR("Invalid request type."), v16, v17, v18, v26);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_8;
    goto LABEL_7;
  }
  v27 = 0;
  createAnonymousAttestationRequest(a1, a2, v13, (uint64_t)a4, v14, v15, &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v27;
  if (v21)
  {
    AppAttest_Common_AttestKeyRequest(a1, a2, v21, a4, v19, 60.0);

  }
  else
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKey", 313, -1, v20, CFSTR("Failed to copy certificate info."), v22, v23, v24, v26);
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v25;
    if (v19)
LABEL_7:
      (*((void (**)(id, _QWORD, id))v19 + 2))(v19, 0, v20);
  }
LABEL_8:

}

id createAnonymousAttestationRequest(int a1, int a2, void *a3, uint64_t a4, void *a5, void *a6, _QWORD *a7)
{
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  __CFString *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __SecTask *v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *cf;
  void *cfb;
  void *cfc;
  void *cfd;
  void *cfe;
  __SecTask *cfa;
  CFTypeRef cff;
  __CFString *v87;
  void *v88;
  id v89[2];
  id v90;
  uint64_t v91;
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[4];
  _QWORD v96[6];

  v96[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  isNSData(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = v12;
  if (!v15)
  {
    v44 = CFSTR("AuthenticatorData cannot be empty.");
    v45 = 485;
LABEL_12:
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", v45, -2, 0, v44, v16, v17, v18, (uint64_t)v76);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    v22 = 0;
LABEL_13:
    v23 = 0;
LABEL_14:
    v32 = 0;
LABEL_15:
    v47 = 0;
    goto LABEL_16;
  }
  isNSData(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v44 = CFSTR("Nonce cannot be empty.");
    v45 = 490;
    goto LABEL_12;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v13);
  objc_msgSend(v15, "appendData:", v14);
  getSHA256(v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 499, -1, 0, CFSTR("Failed to generate nonce."), v19, v20, v21, (uint64_t)v76);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    goto LABEL_13;
  }
  v90 = 0;
  getChipIDECID(&v90);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v90;
  if (!v23)
  {
    v50 = v24;
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 505, -1, v24, CFSTR("Failed to generate chip/ecid"), v25, v26, v27, (uint64_t)v76);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    v88 = 0;
    goto LABEL_14;
  }
  cf = v24;
  v88 = v23;
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = v28;
  if (!v28)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 512, -1, 0, CFSTR("Failed to allocate dictionary."), v29, v30, v31, (uint64_t)v76);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (a1 == 2)
  {
    v51 = *MEMORY[0x24BE2C480];
    v93[0] = &unk_24D598680;
    v52 = *MEMORY[0x24BE2C448];
    v92[0] = v51;
    v92[1] = v52;
    v91 = *MEMORY[0x24BE2C438];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = *MEMORY[0x24BE2C3E8];
    v93[1] = v78;
    v93[2] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v53, "mutableCopy");

    v43 = CFSTR("webauthn");
    v41 = CFSTR("requestOrigin");
    v42 = v23;
    goto LABEL_22;
  }
  if (a1)
  {
    v32 = 0;
    goto LABEL_24;
  }
  isNSString(v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 518, -1, cf, CFSTR("Incorrect parameters for App Attestation"), v33, v34, v35, (uint64_t)v76);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v96[0] = &unk_24D598680;
  v36 = *MEMORY[0x24BE2C448];
  v95[0] = *MEMORY[0x24BE2C480];
  v95[1] = v36;
  v37 = *MEMORY[0x24BE2C410];
  v94[0] = *MEMORY[0x24BE2C430];
  v94[1] = v37;
  v94[2] = *MEMORY[0x24BE2C438];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x24BE2C3E8];
  v96[1] = v77;
  v96[2] = v22;
  v39 = *MEMORY[0x24BE2C3A0];
  v95[2] = v38;
  v95[3] = v39;
  v96[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v40, "mutableCopy");

  objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("appattestation"), CFSTR("requestOrigin"));
  v41 = CFSTR("appID");
  v42 = v23;
  v43 = v87;
LABEL_22:
  v28 = (id)objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, v41);
LABEL_24:
  if ((MEMORY[0x2199FA9A8](v28) & 1) == 0)
    objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C470]);
  if (a2 == 1)
    v54 = CFSTR("production");
  else
    v54 = CFSTR("development");
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v54, CFSTR("environment"));
  v89[1] = cf;
  DeviceIdentityCopyAttestationDictionary();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = cf;

  if (v47)
  {
    v89[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v47, 100, 0, v89);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v89[0];
    v60 = v55;
    v46 = v59;

    if (v48)
    {
      objc_msgSend(v48, "base64EncodedStringWithOptions:", 0);
      cfb = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", cfb, CFSTR("attUIKtoBIK"));

      objc_msgSend(v88, "base64EncodedStringWithOptions:", 0);
      cfc = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", cfc, CFSTR("chipIDECID"));

      objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
      cfd = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", cfd, CFSTR("authenticatorData"));

      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      cfe = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", cfe, CFSTR("clientDataHash"));

      if (!os_variant_allows_internal_security_policies())
      {
LABEL_47:
        v49 = v23;
        v23 = v49;
        goto LABEL_41;
      }
      v64 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
      if (v64)
      {
        cfa = v64;
        v65 = (void *)SecTaskCopyValueForEntitlement(v64, CFSTR("com.apple.appattest.daemoncheck"), 0);
        isNSNumber(v65);
        v66 = objc_claimAutoreleasedReturnValue();
        v79 = v65;
        if (v66)
        {
          v76 = (void *)v66;
          v67 = objc_msgSend(v65, "BOOLValue");

          LODWORD(v76) = v67 ^ 1;
        }
        else
        {
          LODWORD(v76) = 0;
        }
        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
        if ((objc_msgSend(v75, "BOOLForKey:", CFSTR("AAADisableTracking")) & 1) != 0 || (_DWORD)v76)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("DEBUG_notracking"), v76, v79, cfa);
        CFRelease(cfa);

        goto LABEL_47;
      }
      v70 = CFSTR("Failed to create self task.");
      v71 = 584;
      v72 = 0;
    }
    else
    {
      v70 = CFSTR("Could not convert dictionary to xml data.");
      v71 = 569;
      v72 = v46;
    }
    createAppAttestError((uint64_t)"createAnonymousAttestationRequest", v71, -1, v72, v70, v61, v62, v63, (uint64_t)v76);
    cff = (CFTypeRef)objc_claimAutoreleasedReturnValue();

    v46 = (id)cff;
    if (!a7)
      goto LABEL_40;
    goto LABEL_17;
  }
  createAppAttestError((uint64_t)"createAnonymousAttestationRequest", 562, -1, v55, CFSTR("Failed copy attestation dictionary."), v56, v57, v58, (uint64_t)v76);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = v55;
  v46 = (id)v68;

LABEL_16:
  v48 = 0;
  if (!a7)
  {
LABEL_40:
    v49 = 0;
    goto LABEL_41;
  }
LABEL_17:
  v46 = objc_retainAutorelease(v46);
  v49 = 0;
  *a7 = v46;
LABEL_41:
  v73 = v49;

  return v73;
}

void AppAttest_Common_AttestKeyRequest(unsigned int a1, int a2, void *a3, __SecKey *a4, void *a5, double a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, void *, id);
  const __CFData *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  CFErrorRef error;

  v11 = a3;
  v15 = a5;
  error = 0;
  if (!v11)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 361, -1, 0, CFSTR("Failed to copy certificate info."), v12, v13, v14, v50);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    a4 = 0;
LABEL_8:
    v22 = 0;
    v16 = 0;
LABEL_32:
    v35 = 0;
    v46 = 0;
    v31 = 0;
    v26 = 0;
    goto LABEL_33;
  }
  if (!a4)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 366, -1, 0, CFSTR("Invalid key."), v12, v13, v14, v50);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v58 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v11, 1, &v58);
  v16 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v20 = v58;
  if (!v16)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 377, -1, v20, CFSTR("Failed to convert dictionary to data"), v17, v18, v19, v50);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_31:
    v22 = 0;
    goto LABEL_32;
  }
  if (a1 != 1)
  {
    a4 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v16, &error);
    if (a4)
      goto LABEL_11;
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 390, -3, 0, CFSTR("Failed to generate signature"), v23, v24, v25, v50);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  a4 = 0;
LABEL_11:
  v54 = v20;
  v26 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  objc_msgSend(v26, "setCachePolicy:", 0);
  objc_msgSend(v26, "setTimeoutInterval:", a6);
  objc_msgSend(v26, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("application/json"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forHTTPHeaderField:", v27, CFSTR("Content-Type"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), -[__CFData length](v16, "length"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forHTTPHeaderField:", v28, CFSTR("Content-Length"));

  objc_msgSend(v26, "setHTTPBody:", v16);
  v29 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (a1 > 2)
    v30 = CFSTR("???");
  else
    v30 = off_24D595978[a1];
  copy_current_process_name();
  v51 = (uint64_t)v30;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("AppAttest (%@-88.1) - %@"));

  if (v31)
  {
    if (a4)
    {
      -[__SecKey base64EncodedStringWithOptions:](a4, "base64EncodedStringWithOptions:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setValue:forHTTPHeaderField:", v22, CFSTR("signature"));
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v26, "setValue:forHTTPHeaderField:", v31, CFSTR("User-Agent"));
    if (a2 == 1)
      v36 = CFSTR("https://register.appattest.apple.com/v1/attest");
    else
      v36 = CFSTR("https://register-development.appattest.apple.com/v1/attest");
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setURL:", v37);

    if (os_variant_allows_internal_security_policies())
    {
      v38 = objc_alloc(MEMORY[0x24BDBCF50]);
      objc_msgSend(v38, "persistentDomainForName:", CFSTR("com.apple.DeviceCheck"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = v39;
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("AAAOverrideURL"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v42 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("AAAOverrideURL"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "URLWithString:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setURL:", v44);

      }
    }
    v45 = (void *)MEMORY[0x2199FAB94]();
    v57 = v54;
    sendServerRequestWithError(v26, &v57);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v57;

    objc_autoreleasePoolPop(v45);
    if (!v35)
    {
      v46 = 0;
      goto LABEL_33;
    }
    v56 = v21;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v35, 1, &v56);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v56;

    if (v46)
    {
      v21 = v55;
      goto LABEL_33;
    }
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 447, -6, v55, CFSTR("Unable to parse response"), v47, v48, v49, v51);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    createAppAttestError((uint64_t)"AppAttest_Common_AttestKeyRequest", 407, -1, 0, CFSTR("Failed to create user agent string."), v32, v33, v34, v51);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v35 = 0;
  }
  v46 = 0;
LABEL_33:
  if (error)
    CFRelease(error);
  if (v15)
    v15[2](v15, v46, v21);

}

id getChipIDECID(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)MGCopyAnswer();
  isNSNumber(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = (void *)MGCopyAnswer();
    isNSNumber(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%08llX-%016llX"), objc_msgSend(v7, "longLongValue"), objc_msgSend(v2, "longLongValue"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      if (!a1)
        goto LABEL_10;
    }
    else
    {
      createAppAttestError((uint64_t)"getChipIDECID", 283, -1, 0, CFSTR("Failed to retrieve %@."), v9, v10, v11, (uint64_t)CFSTR("ChipID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v3 = 0;
      if (!a1)
        goto LABEL_10;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"getChipIDECID", 273, -1, 0, CFSTR("Failed to retrieve %@."), v4, v5, v6, (uint64_t)CFSTR("UniqueChipID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = 0;
    if (!a1)
      goto LABEL_10;
  }
  if (!v12)
    *a1 = objc_retainAutorelease(v13);
LABEL_10:
  v14 = v12;

  return v14;
}

id createDeviceAttestationRequest(int a1, int a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  id v43[2];
  id v44;

  v8 = a4;
  isNSDictionary(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 632, -2, 0, CFSTR("Invalid options."), v10, v11, v12, v42);
    v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v21 = 0;
LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  v44 = 0;
  getChipIDECID(&v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v44;
  if (!v9)
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 638, -1, v16, CFSTR("Failed to generate chip/ecid"), v13, v14, v15, v42);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = v17;
  if (!v17)
  {
    v36 = CFSTR("Failed to allocate dictionary.");
    v37 = 645;
    v38 = 0;
LABEL_16:
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", v37, -1, v38, v36, v18, v19, v20, v42);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (a1 != 1)
  {
    v36 = CFSTR("Invalid request type.");
    v37 = 652;
    v38 = v16;
    goto LABEL_16;
  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("enterprise"), CFSTR("requestOrigin"));
  if (a2 == 1)
    v22 = CFSTR("production");
  else
    v22 = CFSTR("development");
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("environment"));
  v43[1] = v16;
  DeviceIdentityCopyAttestationDictionary();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;

  if (v23)
  {
    v43[0] = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v23, 100, 0, v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v43[0];

    if (v28)
    {
      objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, CFSTR("attUIKtoBIK"));

      objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("chipIDECID"));

      v35 = v21;
      v21 = v35;
      goto LABEL_21;
    }
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 674, -1, v29, CFSTR("Could not convert dictionary to xml data."), v30, v31, v32, v42);
    v41 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v41;
  }
  else
  {
    createAppAttestError((uint64_t)"createDeviceAttestationRequest", 667, -1, v24, CFSTR("Failed copy attestation dictionary."), v25, v26, v27, v42);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  if (a5)
  {
    v29 = objc_retainAutorelease(v29);
    v28 = 0;
    v35 = 0;
    *a5 = v29;
  }
  else
  {
    v28 = 0;
    v35 = 0;
  }
LABEL_21:
  v39 = v35;

  return v39;
}

uint64_t AppAttest_Common_ValidateEntitlements(_QWORD *a1)
{
  __SecTask *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __SecTask *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  CFErrorRef v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFErrorRef v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFErrorRef error;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  error = 0;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v6 = v2;
  if (!v2)
  {
    createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 702, -1, 0, CFSTR("Failed to create task."), v3, v4, v5, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a1)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.appattest.spi"), &error);
  isNSNumber(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8 || (v9 = (void *)v8, v10 = objc_msgSend(v7, "BOOLValue"), v9, (v10 & 1) == 0))
  {
    v17 = error;
    v33 = CFSTR("com.apple.appattest.spi");
    v34[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 708, -5, v17, CFSTR("Missing required entitlement: %@"), v19, v20, v21, (uint64_t)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a1)
      goto LABEL_11;
    goto LABEL_10;
  }
  v11 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.security.attestation.access"), &error);

  isNSNumber(v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12 || (v13 = (void *)v12, v14 = objc_msgSend(v11, "BOOLValue"), v13, (v14 & 1) == 0))
  {
    v24 = error;
    v31 = CFSTR("com.apple.security.attestation.access");
    v32 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"AppAttest_Common_ValidateEntitlements", 714, -5, v24, CFSTR("Missing required entitlement: %@"), v26, v27, v28, (uint64_t)v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v11;
    if (!a1)
    {
LABEL_11:
      v16 = 0;
      v22 = 0;
      if (!v6)
        goto LABEL_13;
      goto LABEL_12;
    }
LABEL_10:
    *a1 = objc_retainAutorelease(v15);
    goto LABEL_11;
  }
  v15 = 0;
  v16 = 1;
  v7 = v11;
LABEL_12:
  CFRelease(v6);
  v22 = v16;
LABEL_13:
  if (error)
    CFRelease(error);

  return v22;
}

id generateCredentialId(__SecKey *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __SecKey *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __SecKey *v13;
  CFDataRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFDataRef v18;
  void *v19;
  void *v20;
  uint64_t v22;
  CFErrorRef error;

  error = 0;
  if (!a1)
  {
    createAppAttestError((uint64_t)"generateCredentialId", 743, -1, 0, CFSTR("Invalid key."), a6, a7, a8, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
LABEL_8:
    v18 = 0;
    goto LABEL_10;
  }
  v9 = SecKeyCopyPublicKey(a1);
  v13 = v9;
  if (!v9)
  {
    createAppAttestError((uint64_t)"generateCredentialId", 749, -1, 0, CFSTR("Failed to copy RK public key."), v10, v11, v12, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v14 = SecKeyCopyExternalRepresentation(v9, &error);
  v18 = v14;
  if (v14)
  {
    getSHA256(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (!a2)
      goto LABEL_13;
    goto LABEL_11;
  }
  createAppAttestError((uint64_t)"generateCredentialId", 754, -1, error, CFSTR("Failed to encode RK public key as data."), v15, v16, v17, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v19 = 0;
  if (!a2)
    goto LABEL_13;
LABEL_11:
  if (!v19)
    *a2 = objc_retainAutorelease(v20);
LABEL_13:
  if (v13)
    CFRelease(v13);
  if (error)
    CFRelease(error);

  return v19;
}

id generateCredentialIdString(__SecKey *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  id v18;

  v18 = 0;
  generateCredentialId(a1, &v18, a3, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v9)
  {
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    createAppAttestError((uint64_t)"generateCredentialIdString", 779, -1, 0, CFSTR("Failed to copy RK public key."), v10, v11, v12, v17);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v13 = (id)v15;
    if (!a2)
      goto LABEL_7;
  }
  if (!v14)
    *a2 = objc_retainAutorelease(v13);
LABEL_7:

  return v14;
}

CFTypeRef createReferenceKeyBlob(const void *a1, char a2, _QWORD *a3)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  CFTypeRef v23;
  SecKeyRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SecKeyRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  CFErrorRef error;
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v6 = (id)*MEMORY[0x24BDE9060];
  error = 0;
  v7 = (void *)MGCopyAnswer();
  isNSNumber(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    createAppAttestError((uint64_t)"createReferenceKeyBlob", 43, -1, 0, CFSTR("Failed to retrieve PKA state."), v9, v10, v11, v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v13 = 0;
    if (!a3)
      goto LABEL_25;
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "BOOLValue") && (a2 & 1) == 0)
  {
    v12 = (id)*MEMORY[0x24BDE9068];

    v6 = v12;
  }
  if (!a1 || (v13 = CFRetain(a1)) == 0)
  {
    if ((isRunningInRecovery() & 1) != 0
      || (isRunningInRecovery() & 1) != 0
      || isRunningInDiagnosticsMode())
    {
      v13 = (const void *)SecAccessControlCreate();
      if (v13)
      {
        v17 = *MEMORY[0x24BDE8F90];
        if ((SecAccessControlSetProtection() & 1) == 0)
        {
          createAppAttestError((uint64_t)"createReferenceKeyBlob", 66, -1, error, CFSTR("Failed to set ACL protection to %@."), v18, v19, v20, v17);
          goto LABEL_16;
        }
        goto LABEL_19;
      }
      createAppAttestError((uint64_t)"createReferenceKeyBlob", 62, -1, error, CFSTR("Failed to create access control."), v14, v15, v16, v36);
LABEL_16:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = 0;
      v24 = 0;
      if (!a3)
        goto LABEL_25;
      goto LABEL_23;
    }
    v13 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], 0x40000000uLL, &error);
    if (!v13)
    {
      createAppAttestError((uint64_t)"createReferenceKeyBlob", 72, -1, error, CFSTR("Failed to create access control (%@)."), v25, v26, v27, *MEMORY[0x24BDE8F88]);
      goto LABEL_16;
    }
  }
LABEL_19:
  v28 = *MEMORY[0x24BDE9158];
  v38[0] = *MEMORY[0x24BDE9018];
  v38[1] = v28;
  v29 = *MEMORY[0x24BDE9170];
  v39[0] = MEMORY[0x24BDBD1C0];
  v39[1] = v29;
  v30 = *MEMORY[0x24BDE8F48];
  v38[2] = *MEMORY[0x24BDE9050];
  v38[3] = v30;
  v39[2] = v6;
  v39[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v31 = SecKeyCreateRandomKey(v22, &error);
  v24 = v31;
  if (v31)
  {
    v23 = CFRetain(v31);
    v21 = 0;
    if (!a3)
      goto LABEL_25;
  }
  else
  {
    createAppAttestError((uint64_t)"createReferenceKeyBlob", 86, -1, error, CFSTR("Failed to create ref key."), v32, v33, v34, v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    if (!a3)
      goto LABEL_25;
  }
LABEL_23:
  if (!v23)
    *a3 = objc_retainAutorelease(v21);
LABEL_25:
  if (v24)
    CFRelease(v24);
  if (v13)
    CFRelease(v13);
  if (error)
    CFRelease(error);

  return v23;
}

id lockcrypto_decode_pems(void *a1, const char *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  char __little[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char __str[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  *(_OWORD *)__str = 0u;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)__little = 0u;
  v36 = 0u;
  if (!v8 || !a2)
  {
    createAppAttestError((uint64_t)"lockcrypto_decode_pems", 40, -1, 0, CFSTR("Invalid input(s)."), v5, v6, v7, v31);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
LABEL_13:
    v12 = 0;
    goto LABEL_22;
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v12)
  {
    createAppAttestError((uint64_t)"lockcrypto_decode_pems", 46, -1, 0, CFSTR("Failed to allocate array."), v9, v10, v11, v31);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_22;
  }
  v13 = objc_retainAutorelease(v8);
  v14 = (const char *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  v16 = 0;
  if (v14)
  {
    v17 = v15;
    v18 = 0;
    if (v15 >= 1)
    {
      v33 = a3;
      v34 = v8;
      v19 = 0;
      while (1)
      {
        v20 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
        v21 = snprintf(__little, 0x50uLL, "\n-----END %s-----", a2);
        v22 = strnstr(v14, __str, v17);
        v23 = strnstr(v14, __little, v17);
        if (!v22 || (v24 = v23) == 0)
        {
          v16 = 0;
          v18 = v19;
          goto LABEL_18;
        }
        v25 = (void *)MEMORY[0x2199FAB94]();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v22[v20], v24 - &v22[v20], 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v26, 1);

        if (!v18)
          break;
        objc_msgSend(v12, "addObject:", v18);

        objc_autoreleasePoolPop(v25);
        v17 = &v14[v17] - v24;
        v14 = &v24[v21];
        v19 = v18;
        if (v17 <= 0)
        {
          v16 = 0;
          goto LABEL_18;
        }
      }
      createAppAttestError((uint64_t)"lockcrypto_decode_pems", 74, -1, 0, CFSTR("Failed to decode data."), v27, v28, v29, v32);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v25);
LABEL_18:
      a3 = v33;
      v8 = v34;
    }
  }
  else
  {
    v18 = 0;
  }
  if (!objc_msgSend(v12, "count"))
  {

    if (a3)
    {
      v16 = objc_retainAutorelease(v16);
      v12 = 0;
      *a3 = v16;
      goto LABEL_22;
    }
    goto LABEL_13;
  }
LABEL_22:

  return v12;
}

id createAppAttestError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a4;
  v14 = (objc_class *)MEMORY[0x24BDD16A8];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &a9);

  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);
  if (v13)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("SourceLine"));

    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appattest.error"), a3, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

CFTypeRef copy_keychain_item(void *a1, void *a2, OSStatus *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  OSStatus v21;
  void *v22;
  CFTypeRef v23;
  uint64_t v25;
  CFTypeRef result;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v12 = v8;
  result = 0;
  if (v8)
  {
    v13 = *MEMORY[0x24BDE9220];
    v27[0] = *MEMORY[0x24BDE90A0];
    v27[1] = v13;
    v14 = *MEMORY[0x24BDE9248];
    v28[0] = v8;
    v28[1] = v14;
    v15 = *MEMORY[0x24BDE9528];
    v27[2] = *MEMORY[0x24BDE94D8];
    v27[3] = v15;
    v28[2] = MEMORY[0x24BDBD1C8];
    v28[3] = MEMORY[0x24BDBD1C8];
    v27[4] = *MEMORY[0x24BDE9538];
    v28[4] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v7)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDE8F50]);
    v21 = SecItemCopyMatching((CFDictionaryRef)v17, &result);
    if (v21)
    {
      createAppAttestError((uint64_t)"copy_keychain_item", 53, -1, 0, CFSTR("Failed to copy keychain item %@: %d"), v18, v19, v20, (uint64_t)v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v23 = result;
      result = 0;

      v22 = 0;
      if (!a3)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  createAppAttestError((uint64_t)"copy_keychain_item", 34, -2, 0, CFSTR("Invalid input."), v9, v10, v11, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21 = -1;
  if (a3)
LABEL_8:
    *a3 = v21;
LABEL_9:
  if (a4 && !v23)
    *a4 = objc_retainAutorelease(v22);
  if (result)
    CFRelease(result);

  return v23;
}

CFTypeRef copy_all_items(void *a1, _DWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CFTypeRef v17;
  CFTypeRef result;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  result = 0;
  v6 = *MEMORY[0x24BDE9248];
  v7 = *MEMORY[0x24BDE94C0];
  v20[0] = *MEMORY[0x24BDE9220];
  v20[1] = v7;
  v8 = *MEMORY[0x24BDE93B0];
  v20[2] = *MEMORY[0x24BDE9528];
  v20[3] = v8;
  v9 = *MEMORY[0x24BDE93B8];
  v21[2] = MEMORY[0x24BDBD1C8];
  v21[3] = v9;
  v21[0] = v6;
  v21[1] = MEMORY[0x24BDBD1C8];
  v20[4] = *MEMORY[0x24BDE9538];
  v21[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v5)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDE8F50]);
  v15 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if (!(_DWORD)v15)
  {
    v16 = 0;
    v17 = result;
    result = 0;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  createAppAttestError((uint64_t)"copy_all_items", 99, -1, 0, CFSTR("Failed to copy keychain items with status: %d"), v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a2)
LABEL_5:
    *a2 = v15;
LABEL_6:
  if (a3 && !v17)
    *a3 = objc_retainAutorelease(v16);
  if (result)
    CFRelease(result);

  return v17;
}

uint64_t delete_keychain_item(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OSStatus v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v10 = v6;
  if (!v6)
  {
    createAppAttestError((uint64_t)"delete_keychain_item", 130, -2, 0, CFSTR("Invalid input(s)."), v7, v8, v9, v23);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!a3)
      goto LABEL_7;
    goto LABEL_9;
  }
  v11 = *MEMORY[0x24BDE9220];
  v24[0] = *MEMORY[0x24BDE90A0];
  v24[1] = v11;
  v12 = *MEMORY[0x24BDE9248];
  v25[0] = v6;
  v25[1] = v12;
  v13 = *MEMORY[0x24BDE9538];
  v24[2] = *MEMORY[0x24BDE9528];
  v24[3] = v13;
  v25[2] = MEMORY[0x24BDBD1C8];
  v25[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v5)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDE8F50]);
  v19 = SecItemDelete((CFDictionaryRef)v15);
  v20 = 0;
  v21 = 1;
  if (v19 != -25300 && v19)
  {
    createAppAttestError((uint64_t)"delete_keychain_item", 148, -1, 0, CFSTR("Failed to remove existing keychain item %@: %d"), v16, v17, v18, (uint64_t)v10);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      v21 = 0;
      goto LABEL_10;
    }
LABEL_9:
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a3 = v20;
  }
LABEL_10:

  return v21;
}

uint64_t store_keychain_item(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  id v32;
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v12 = v8;
  if (a1 && v8)
  {
    v32 = 0;
    v13 = delete_keychain_item(v7, v8, &v32);
    v17 = v32;
    if ((v13 & 1) != 0)
    {
      v18 = *MEMORY[0x24BDE9220];
      v33[0] = *MEMORY[0x24BDE90A0];
      v33[1] = v18;
      v19 = *MEMORY[0x24BDE9248];
      v34[0] = v12;
      v34[1] = v19;
      v20 = *MEMORY[0x24BDE9528];
      v33[2] = *MEMORY[0x24BDE9560];
      v33[3] = v20;
      v21 = *MEMORY[0x24BDE8F60];
      v33[4] = *MEMORY[0x24BDE9538];
      v33[5] = v21;
      v34[2] = a1;
      v34[3] = MEMORY[0x24BDBD1C8];
      v22 = *MEMORY[0x24BDE8F88];
      v34[4] = MEMORY[0x24BDBD1C8];
      v34[5] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      if (v7)
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDE8F50]);
      if (!SecItemAdd((CFDictionaryRef)v24, 0))
      {
        v29 = 1;
        goto LABEL_14;
      }
      createAppAttestError((uint64_t)"store_keychain_item", 198, -1, 0, CFSTR("Failed to add %@ to keychain: %d"), v25, v26, v27, (uint64_t)v12);
      v28 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      createAppAttestError((uint64_t)"store_keychain_item", 178, -1, v17, CFSTR("Failed to delete existing keychain item."), v14, v15, v16, v31);
      v28 = objc_claimAutoreleasedReturnValue();

      v24 = 0;
    }
    v17 = (id)v28;
    if (!a4)
      goto LABEL_12;
  }
  else
  {
    createAppAttestError((uint64_t)"store_keychain_item", 173, -2, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v31);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (!a4)
    {
LABEL_12:
      v29 = 0;
      goto LABEL_14;
    }
  }
  v17 = objc_retainAutorelease(v17);
  v29 = 0;
  *a4 = v17;
LABEL_14:

  return v29;
}

id copy_keychain_data(void *a1, void *a2, OSStatus *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  OSStatus v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  CFTypeRef result;
  _QWORD v30[8];
  _QWORD v31[9];

  v31[8] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v12 = v8;
  result = 0;
  if (v8)
  {
    v13 = *MEMORY[0x24BDE9000];
    v30[0] = *MEMORY[0x24BDE90A0];
    v30[1] = v13;
    v31[0] = v8;
    v31[1] = v8;
    v14 = *MEMORY[0x24BDE9128];
    v30[2] = *MEMORY[0x24BDE8FA8];
    v30[3] = v14;
    v31[2] = v8;
    v31[3] = v8;
    v15 = *MEMORY[0x24BDE9230];
    v16 = *MEMORY[0x24BDE94C8];
    v30[4] = *MEMORY[0x24BDE9220];
    v30[5] = v16;
    v31[4] = v15;
    v31[5] = MEMORY[0x24BDBD1C8];
    v17 = *MEMORY[0x24BDE9538];
    v30[6] = *MEMORY[0x24BDE9528];
    v30[7] = v17;
    v31[6] = MEMORY[0x24BDBD1C8];
    v31[7] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (v7)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDE8F50]);
    v23 = SecItemCopyMatching((CFDictionaryRef)v19, &result);
    if (v23)
    {
      createAppAttestError((uint64_t)"copy_keychain_data", 247, -1, 0, CFSTR("Failed to copy keychain item %@: %d"), v20, v21, v22, (uint64_t)v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v24 = 0;
      v25 = (void *)result;
      result = 0;
      if (!a3)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  createAppAttestError((uint64_t)"copy_keychain_data", 223, -2, 0, CFSTR("Invalid input."), v9, v10, v11, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v19 = 0;
  v23 = -1;
  if (a3)
LABEL_8:
    *a3 = v23;
LABEL_9:
  if (a4 && !v25)
    *a4 = objc_retainAutorelease(v24);
  if (result)
    CFRelease(result);
  v26 = v25;

  return v26;
}

CFTypeRef copy_all_datas(void *a1, _DWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CFTypeRef v17;
  CFTypeRef result;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  result = 0;
  v6 = *MEMORY[0x24BDE9230];
  v7 = *MEMORY[0x24BDE94C0];
  v20[0] = *MEMORY[0x24BDE9220];
  v20[1] = v7;
  v21[0] = v6;
  v21[1] = MEMORY[0x24BDBD1C8];
  v8 = *MEMORY[0x24BDE9528];
  v20[2] = *MEMORY[0x24BDE94C8];
  v20[3] = v8;
  v9 = *MEMORY[0x24BDE9538];
  v20[4] = *MEMORY[0x24BDE93B0];
  v20[5] = v9;
  v21[2] = MEMORY[0x24BDBD1C8];
  v21[3] = MEMORY[0x24BDBD1C8];
  v21[4] = *MEMORY[0x24BDE93B8];
  v21[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v5)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDE8F50]);
  v15 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if (!(_DWORD)v15)
  {
    v16 = 0;
    v17 = result;
    result = 0;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  createAppAttestError((uint64_t)"copy_all_datas", 294, -1, 0, CFSTR("Failed to copy keychain items with status: %d"), v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a2)
LABEL_5:
    *a2 = v15;
LABEL_6:
  if (a3 && !v17)
    *a3 = objc_retainAutorelease(v16);
  if (result)
    CFRelease(result);

  return v17;
}

uint64_t delete_keychain_data(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  OSStatus v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD v25[7];
  _QWORD v26[8];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v10 = v6;
  if (!v6)
  {
    createAppAttestError((uint64_t)"delete_keychain_data", 325, -2, 0, CFSTR("Invalid input(s)."), v7, v8, v9, v24);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!a3)
      goto LABEL_7;
    goto LABEL_9;
  }
  v11 = *MEMORY[0x24BDE9000];
  v25[0] = *MEMORY[0x24BDE90A0];
  v25[1] = v11;
  v26[0] = v6;
  v26[1] = v6;
  v12 = *MEMORY[0x24BDE9128];
  v25[2] = *MEMORY[0x24BDE8FA8];
  v25[3] = v12;
  v26[2] = v6;
  v26[3] = v6;
  v13 = *MEMORY[0x24BDE9230];
  v14 = *MEMORY[0x24BDE9528];
  v25[4] = *MEMORY[0x24BDE9220];
  v25[5] = v14;
  v26[4] = v13;
  v26[5] = MEMORY[0x24BDBD1C8];
  v25[6] = *MEMORY[0x24BDE9538];
  v26[6] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v5)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDE8F50]);
  v20 = SecItemDelete((CFDictionaryRef)v16);
  v21 = 0;
  v22 = 1;
  if (v20 != -25300 && v20)
  {
    createAppAttestError((uint64_t)"delete_keychain_data", 348, -1, 0, CFSTR("Failed to remove existing keychain item %@: %d"), v17, v18, v19, (uint64_t)v10);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      v22 = 0;
      goto LABEL_10;
    }
LABEL_9:
    v21 = objc_retainAutorelease(v21);
    v22 = 0;
    *a3 = v21;
  }
LABEL_10:

  return v22;
}

uint64_t store_keychain_data(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  id v33;
  _QWORD v34[9];
  _QWORD v35[10];

  v35[9] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v13 = v9;
  if (v7 && v9)
  {
    v33 = 0;
    v14 = delete_keychain_data(v8, v9, &v33);
    v18 = v33;
    if ((v14 & 1) != 0)
    {
      v19 = *MEMORY[0x24BDE9000];
      v34[0] = *MEMORY[0x24BDE90A0];
      v34[1] = v19;
      v35[0] = v13;
      v35[1] = v13;
      v20 = *MEMORY[0x24BDE9128];
      v34[2] = *MEMORY[0x24BDE8FA8];
      v34[3] = v20;
      v35[2] = v13;
      v35[3] = v13;
      v21 = *MEMORY[0x24BDE9230];
      v22 = *MEMORY[0x24BDE9550];
      v34[4] = *MEMORY[0x24BDE9220];
      v34[5] = v22;
      v35[4] = v21;
      v35[5] = v7;
      v23 = *MEMORY[0x24BDE9538];
      v34[6] = *MEMORY[0x24BDE9528];
      v34[7] = v23;
      v35[6] = MEMORY[0x24BDBD1C8];
      v35[7] = MEMORY[0x24BDBD1C8];
      v34[8] = *MEMORY[0x24BDE8F60];
      v35[8] = *MEMORY[0x24BDE8F88];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      if (v8)
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDE8F50]);
      if (!SecItemAdd((CFDictionaryRef)v25, 0))
      {
        v30 = 1;
        goto LABEL_14;
      }
      createAppAttestError((uint64_t)"store_keychain_data", 403, -1, 0, CFSTR("Failed to add %@ to keychain: %d"), v26, v27, v28, (uint64_t)v13);
      v29 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      createAppAttestError((uint64_t)"store_keychain_data", 378, -1, v18, CFSTR("Failed to delete existing keychain item."), v15, v16, v17, v32);
      v29 = objc_claimAutoreleasedReturnValue();

      v25 = 0;
    }
    v18 = (id)v29;
    if (!a4)
      goto LABEL_12;
  }
  else
  {
    createAppAttestError((uint64_t)"store_keychain_data", 373, -2, 0, CFSTR("Invalid input(s)."), v10, v11, v12, v32);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (!a4)
    {
LABEL_12:
      v30 = 0;
      goto LABEL_14;
    }
  }
  v18 = objc_retainAutorelease(v18);
  v30 = 0;
  *a4 = v18;
LABEL_14:

  return v30;
}

void AppAttest_WebAuthentication_AttestKey(__SecKey *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  int v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  NSObject *v56;
  uint64_t *v57;
  id obj;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[24];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  v64 = 0;
  if (!v9)
  {
    _DCAALogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      AppAttest_WebAuthentication_AttestKey_cold_1(v38, v39, v40, v41, v42, v43, v44, v45);
    goto LABEL_24;
  }
  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 102, -4, 0, CFSTR("Not supported"), v10, v11, v12, v53);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v13 = (id *)(v60 + 5);
  v14 = (void *)v60[5];
  if (isSupportedSPIClient_onceToken != -1)
    dispatch_once(&isSupportedSPIClient_onceToken, &__block_literal_global_1);
  copy_current_process_name();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    createAppAttestError((uint64_t)"isSupportedSPIClient", 67, -1, 0, CFSTR("Failed to query process name."), v15, v16, v17, v53);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v48 = objc_retainAutorelease(v46);

    objc_storeStrong(v13, v48);
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 107, -1, (void *)v60[5], CFSTR("Client is not supported."), v49, v50, v51, v54);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ((objc_msgSend((id)isSupportedSPIClient_supportedList, "containsObject:", v18) & 1) == 0)
  {
    createAppAttestError((uint64_t)"isSupportedSPIClient", 72, -1, 0, CFSTR("%@ is not allowed to use this API.  Please refer to the header file for onboarding information."), v19, v20, v21, (uint64_t)v18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v46, "localizedDescription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      AppAttest_WebAuthentication_AttestKey_cold_2(v47, buf);
    }
    goto LABEL_19;
  }

  objc_storeStrong(v13, v14);
  v22 = (id *)(v60 + 5);
  obj = (id)v60[5];
  v23 = AppAttest_Common_ValidateEntitlements(&obj);
  objc_storeStrong(v22, obj);
  if (!v23)
    goto LABEL_21;
  isNSData(v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (v25)
  {
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 117, -2, 0, CFSTR("Invalid authenticatorData"), v26, v27, v28, v53);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (!AppAttest_Common_ValidateBikParameters(a1))
  {
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 122, -3, 0, CFSTR("Invalid referenceKey"), v29, v30, v31, v53);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  isNSData(v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35 || (v36 = (unint64_t)objc_msgSend(v8, "length") > 0x20, v35, v36))
  {
    createAppAttestError((uint64_t)"AppAttest_WebAuthentication_AttestKey", 127, -2, 0, CFSTR("Invalid clientDataHash"), v32, v33, v34, v53);
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v52 = (void *)v60[5];
    v60[5] = v37;

  }
LABEL_21:
  if (!v60[5])
  {
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __AppAttest_WebAuthentication_AttestKey_block_invoke;
    v55[3] = &unk_24D5959F0;
    v57 = &v59;
    v56 = v9;
    AppAttest_Common_AttestKey(2u, 1, 0, a1, v7, v8, v55);
    v38 = v56;
LABEL_24:

    goto LABEL_25;
  }
  (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_25:
  _Block_object_dispose(&v59, 8);

}

void sub_2167C3DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __isSupportedSPIClient_block_invoke()
{
  void *v0;

  v0 = (void *)isSupportedSPIClient_supportedList;
  isSupportedSPIClient_supportedList = (uint64_t)&unk_24D598750;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id buildApplicationIdentifierKeychainLabel(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  getSHA256(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), CFSTR("au:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id resolveAppUUIDKeychain(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  OSStatus v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  char v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  id v47[3];
  id v48;
  OSStatus v49;

  v46 = a1;
  v5 = a2;
  v6 = a3;
  v49 = -1;
  buildApplicationIdentifierKeychainLabel(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  copy_keychain_data(CFSTR("com.apple.appattest.identities"), v7, &v49, &v48);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v48;
  v10 = v49;
  v44 = v7;
  v45 = (void *)v8;
  if (v49)
  {
    _DCAALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      resolveAppUUIDKeychain_cold_14();
LABEL_4:
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_31;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
  _DCAALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    resolveAppUUIDKeychain_cold_13();

  if (!v11)
    goto LABEL_4;
  -[NSObject componentsSeparatedByString:](v11, "componentsSeparatedByString:", CFSTR(":"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") == 1)
  {
    v13 = v6;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _DCAALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      resolveAppUUIDKeychain_cold_10();
    v14 = 1;
    goto LABEL_29;
  }
  if (objc_msgSend(v16, "count") == 3)
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v17, "isEqualToString:", CFSTR("m")) & 1) != 0)
    {
      v42 = v17;
      v14 = 1;
    }
    else
    {
      if ((-[NSObject isEqualToString:](v17, "isEqualToString:", CFSTR("c")) & 1) == 0)
      {
        _DCAALogSystem();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          resolveAppUUIDKeychain_cold_12();
        v12 = 0;
        v13 = 0;
        v14 = 0;
        goto LABEL_28;
      }
      v42 = v17;
      v14 = 2;
    }
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v18, "initWithUUIDString:", v19);

    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "hasPrefix:", v6);

    if ((_DWORD)v19 && v43)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _DCAALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        resolveAppUUIDKeychain_cold_11();

      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    v17 = v42;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v12 = 0;
  v13 = 0;
  v14 = 0;
LABEL_30:

LABEL_31:
  v22 = v46;
  if ((objc_msgSend(v5, "hasPrefix:", v6) & 1) == 0)
  {
    _DCAALogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      resolveAppUUIDKeychain_cold_9();

  }
  v24 = objc_msgSend(v6, "isEqualToString:", v5);
  if (v14 && v13 && v12)
  {
    v25 = v24;
    if (v46 && objc_msgSend(v12, "isEqualToString:", v46))
    {
      v26 = v12;
      _DCAALogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        goto LABEL_55;
      goto LABEL_56;
    }
    if (objc_msgSend(v5, "isEqualToString:", v13))
    {
      _DCAALogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
LABEL_46:
        resolveAppUUIDKeychain_cold_3(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      if (v14 == 2)
      {
        v26 = v12;
        _DCAALogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
LABEL_55:
          resolveAppUUIDKeychain_cold_5();
LABEL_56:
        v36 = v44;
        goto LABEL_57;
      }
      if ((v25 & 1) == 0)
      {
        v47[2] = 0;
        v28 = 0;
        CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
        v26 = 0;
        v36 = v44;
        _DCAALogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          resolveAppUUIDKeychain_cold_7();

        goto LABEL_48;
      }
      _DCAALogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        goto LABEL_46;
    }
  }
  else
  {
    _DCAALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      goto LABEL_46;
  }
  v26 = 0;
  v36 = v44;
LABEL_48:

  if (v10)
  {
    v22 = v46;
    goto LABEL_58;
  }
  v47[0] = v9;
  delete_keychain_data(CFSTR("com.apple.appattest.identities"), v36, v47);
  v37 = v47[0];

  _DCAALogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    resolveAppUUIDKeychain_cold_2();
  v26 = 0;
  v9 = v37;
  v22 = v46;
LABEL_57:

LABEL_58:
  _DCAALogSystem();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    resolveAppUUIDKeychain_cold_1();

  v39 = v26;
  return v39;
}

uint64_t saveAppUUIDKeychain(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  const char *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  isNSString(v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    isNSString(v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      isNSString(v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(v6, "hasPrefix:", v7);

        if ((v14 & 1) != 0)
          goto LABEL_11;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  _DCAALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    saveAppUUIDKeychain_cold_1(v15, v16, v17);

LABEL_11:
  buildApplicationIdentifierKeychainLabel(v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("m");
  v20 = objc_msgSend(v6, "length");
  if (v20 > objc_msgSend(v7, "length"))
  {
    v21 = CFSTR("c");

    v19 = v21;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@"), v19, v6, v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v24 = store_keychain_data(v23, CFSTR("com.apple.appattest.identities"), v18, &v29);
  v25 = v29;
  _DCAALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v28 = "FAILED";
    *(_DWORD *)buf = 136315650;
    if ((_DWORD)v24)
      v28 = "SUCCESS";
    v31 = v28;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v22;
    _os_log_debug_impl(&dword_2167BD000, v26, OS_LOG_TYPE_DEBUG, "saveAppUUIDKeychain - (%s) - %@ - (%@)\n", buf, 0x20u);
  }

  return v24;
}

id encodeKeyToCOSE(__SecKey *a1, _QWORD *a2)
{
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28[5];
  _QWORD v29[5];

  fetchPublicKey(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = SecKeyCopyAttributes(a1);
    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x24BDE9048]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "intValue") == 256 || objc_msgSend(v7, "intValue") == 384)
      {
        v8 = objc_msgSend(v7, "integerValue") / 8;
        v9 = malloc_type_malloc(v8, 0x9CCD4D4BuLL);
        v10 = MEMORY[0x24BDAC760];
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __encodeKeyToCOSE_block_invoke;
        v29[3] = &__block_descriptor_40_e5_v8__0l;
        v29[4] = v9;
        v11 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v29);
        objc_msgSend(v4, "getBytes:range:", v9, 1, v8);
        v12 = malloc_type_malloc(v8, 0x3C8DFB9uLL);
        v28[0] = v10;
        v28[1] = 3221225472;
        v28[2] = (uint64_t)__encodeKeyToCOSE_block_invoke_2;
        v28[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
        v28[4] = (uint64_t)v12;
        v13 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v28);
        objc_msgSend(v4, "getBytes:range:", v12, v8 + 1, v8);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        generateCOSEForKeySize(v8, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v13[2](v13);
        v11[2](v11);

LABEL_16:
        goto LABEL_17;
      }
      _DCAALogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        encodeKeyToCOSE_cold_3(v7, v26);

      v25 = 277;
    }
    else
    {
      _DCAALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        encodeKeyToCOSE_cold_2();

      v25 = 271;
    }
    createAppAttestError((uint64_t)"encodeKeyToCOSE", v25, -3, 0, CFSTR("Failed to fetch size of public key."), v22, v23, v24, v28[0]);
    v16 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  _DCAALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    encodeKeyToCOSE_cold_1();

  createAppAttestError((uint64_t)"encodeKeyToCOSE", 263, -3, 0, CFSTR("Failed to fetch data representation of public key."), v18, v19, v20, v28[0]);
  v16 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v16;
}

void sub_2167C4E5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

const __CFData *fetchPublicKey(__SecKey *a1)
{
  __SecKey *v2;
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  CFDataRef v6;
  CFDataRef v7;
  NSObject *v8;
  __CFString *v9;
  const __CFData *v10;
  NSObject *v11;
  _QWORD v13[5];
  CFErrorRef error;
  _QWORD v15[5];
  char v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (AppAttest_Common_ValidateBikParameters(a1))
  {
    v2 = SecKeyCopyPublicKey(a1);
    v3 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __fetchPublicKey_block_invoke;
    v15[3] = &__block_descriptor_40_e5_v8__0l;
    v15[4] = v2;
    v4 = MEMORY[0x2199FACE4](v15);
    if (!v2)
    {
      _DCAALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        fetchPublicKey_cold_1();

      v10 = 0;
      goto LABEL_16;
    }
    v13[4] = 0;
    error = 0;
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __fetchPublicKey_block_invoke_116;
    v13[3] = &__block_descriptor_40_e5_v8__0l;
    v5 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v13);
    v6 = SecKeyCopyExternalRepresentation(v2, &error);
    v7 = v6;
    if (error)
    {
      _DCAALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (__CFString *)CFErrorCopyDescription(error);
        fetchPublicKey_cold_3(v9, (uint64_t)v16, v8);
      }
    }
    else
    {
      if (v6)
      {
        v10 = v6;
        goto LABEL_15;
      }
      _DCAALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        encodeKeyToCOSE_cold_1();
    }

    v10 = 0;
LABEL_15:

    v5[2](v5);
LABEL_16:
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    goto LABEL_17;
  }
  _DCAALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    fetchPublicKey_cold_4();
  v10 = 0;
LABEL_17:

  return v10;
}

void sub_2167C5078(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void __encodeKeyToCOSE_block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

void __encodeKeyToCOSE_block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

id generateCOSEForKeySize(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CBORMap *v7;
  CBORUnsigned *v8;
  CBORUnsigned *v9;
  CBORUnsigned *v10;
  CBORNegative *v11;
  CBORNegative *v12;
  CBORUnsigned *v13;
  unint64_t v14;
  id v15;
  CBORUnsigned *v16;
  CBORNegative *v17;
  CBORNegative *v18;
  CBORData *v19;
  CBORNegative *v20;
  CBORData *v21;
  id v22;
  NSObject *v23;

  v5 = a2;
  v6 = a3;
  if ((a1 & 0xFFFFFFFFFFFFFFEFLL) == 0x20)
  {
    v7 = objc_alloc_init(CBORMap);
    v8 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 1);
    v9 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 2);
    -[CBORMap setKey:value:](v7, "setKey:value:", v8, v9);

    if (a1 == 48)
    {
      v16 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 3);
      v17 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -35);
      -[CBORMap setKey:value:](v7, "setKey:value:", v16, v17);

      v12 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -1);
      v13 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 2);
      -[CBORMap setKey:value:](v7, "setKey:value:", v12, v13);
      v14 = 110;
    }
    else
    {
      if (a1 != 32)
      {
        v14 = 110;
        goto LABEL_11;
      }
      v10 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 3);
      v11 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -7);
      -[CBORMap setKey:value:](v7, "setKey:value:", v10, v11);

      v12 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -1);
      v13 = -[CBORUnsigned initWith:]([CBORUnsigned alloc], "initWith:", 1);
      -[CBORMap setKey:value:](v7, "setKey:value:", v12, v13);
      v14 = 77;
    }

LABEL_11:
    v18 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -2);
    v19 = -[CBORData initWith:]([CBORData alloc], "initWith:", v5);
    -[CBORMap setKey:value:](v7, "setKey:value:", v18, v19);

    v20 = -[CBORNegative initWith:]([CBORNegative alloc], "initWith:", -3);
    v21 = -[CBORData initWith:]([CBORData alloc], "initWith:", v6);
    -[CBORMap setKey:value:](v7, "setKey:value:", v20, v21);

    v22 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[CBORMap write:](v7, "write:", v22);
    if (objc_msgSend(v22, "length") <= v14)
    {
      v15 = v22;
    }
    else
    {
      _DCAALogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        generateCOSEForKeySize_cold_1(v22, v14, v23);

      v15 = 0;
    }

    goto LABEL_17;
  }
  _DCAALogSystem();
  v7 = (CBORMap *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEBUG))
    generateCOSEForKeySize_cold_2();
  v15 = 0;
LABEL_17:

  return v15;
}

id createAppAttestationAuthenticatorDataShort(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  id v16;

  v5 = a1;
  v6 = a2;
  isNSString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getSHA256(v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    createGenericAuthenticatorDataShort(v7, 64, v6, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataShort", 314, -2, 0, CFSTR("Invalid counter"), v8, v9, v10, v15);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v12)
    *a3 = objc_retainAutorelease(v13);
LABEL_7:

  return v12;
}

id createAppAttestationAuthenticatorDataFull(int a1, void *a2, void *a3, __SecKey *a4, _QWORD *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25;
  id v26;

  v9 = a2;
  v10 = a3;
  isNSString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getSHA256(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1 == 1)
      v16 = "appattest";
    else
      v16 = "appattestdevelop";
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v16, 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length") == 16)
    {
      v26 = 0;
      createGenericAuthenticatorDataFull(v17, v11, 64, v10, a4, &v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v26;
      if (!a5)
        goto LABEL_13;
    }
    else
    {
      createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataFull", 357, -1, 0, CFSTR("Invalid aaguid length!"), v18, v19, v20, v25);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if (!a5)
        goto LABEL_13;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"createAppAttestationAuthenticatorDataFull", 345, -2, 0, CFSTR("Invalid counter"), v12, v13, v14, v25);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v17 = 0;
    if (!a5)
      goto LABEL_13;
  }
  if (!v21)
    *a5 = objc_retainAutorelease(v22);
LABEL_13:
  v23 = v21;

  return v23;
}

uint64_t generateEnvironmentByAppSigning(_OWORD *a1)
{
  __int128 v2;
  void *v3;
  AppAttestEligibilityManager *v4;
  __int128 v5;
  uint64_t v6;
  AppAttestEligibilityManager *v7;
  __int128 v8;
  id v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  const __CFAllocator *v13;
  __int128 v14;
  __SecTask *v15;
  __SecTask *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v26;

  v26 = 0;
  v2 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v2;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", &token, &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v7 = objc_alloc_init(AppAttestEligibilityManager);
    v8 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v8;
    v6 = -[AppAttestEligibilityManager isEligibleDaemonFor:](v7, "isEligibleDaemonFor:", &token);
    v9 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(AppAttestEligibilityManager);
    v5 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v5;
    v6 = -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:](v4, "isEligibleApplicationExtensionFor:", &token);

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
LABEL_23:
    error = 0;
    v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v14 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v14;
    v15 = SecTaskCreateWithAuditToken(v13, &token);
    if (v15)
    {
      v16 = v15;
      v17 = SecTaskCopyValueForEntitlement(v15, CFSTR("com.apple.developer.devicecheck.appattest-environment"), &error);
      isNSString(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        if (objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("production")))
        {
          v20 = objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("development"));
          _DCAALogSystem();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
          if (v20)
          {
            if (v22)
              generateEnvironmentByAppSigning_cold_4();
          }
          else
          {
            if (v22)
              generateEnvironmentByAppSigning_cold_3();
            v6 = 0;
          }
        }
        else
        {
          _DCAALogSystem();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            generateEnvironmentByAppSigning_cold_2();
          v6 = 1;
        }

      }
      CFRelease(v16);
    }
    else
    {
      _DCAALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        generateEnvironmentByAppSigning_cold_1();
    }

    goto LABEL_40;
  }
  v9 = v3;
  if (objc_msgSend(v9, "isProfileValidated"))
  {
    if (objc_msgSend(v9, "isUPPValidated"))
    {
      _DCAALogSystem();
      v7 = (AppAttestEligibilityManager *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
        generateEnvironmentByAppSigning_cold_5();
    }
    else
    {
      v11 = objc_msgSend(v9, "isBeta");
      _DCAALogSystem();
      v7 = (AppAttestEligibilityManager *)objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG);
      if (!v11)
      {
        if (v12)
          generateEnvironmentByAppSigning_cold_7();
        v6 = 0;
        goto LABEL_22;
      }
      if (v12)
        generateEnvironmentByAppSigning_cold_6();
    }
    v6 = 1;
LABEL_22:

    goto LABEL_23;
  }
  _DCAALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    generateEnvironmentByAppSigning_cold_8();

  v6 = 1;
LABEL_40:

  return v6;
}

id buildAppAttestApplicationIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (v3 && objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", CFSTR("0000000000")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  NSObject *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(v5, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  buildAppAttestApplicationIdentifier(v6, v7);
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appClipMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "parentApplicationIdentifiers");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v22 = a3;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          _DCAALogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v15;
            _os_log_debug_impl(&dword_2167BD000, v16, OS_LOG_TYPE_DEBUG, "AppClip found: Parent (%@)\n", buf, 0xCu);
          }

          *(_QWORD *)buf = 0;
          if (CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
            v17 = *(_QWORD *)buf == 0;
          else
            v17 = 1;
          if (!v17)
          {
            _DCAALogSystem();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_2();

            v20 = *(void **)buf;
            _DCAALogSystem();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_1();

            v7 = v20;
            goto LABEL_22;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          continue;
        break;
      }
LABEL_22:
      a3 = v22;
    }

  }
  buildAppAttestApplicationIdentifier(v6, v7);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

}

void resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;

  if (a1)
  {
    v5 = a1;
    objc_msgSend(v5, "teamIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    buildAppAttestApplicationIdentifier(v7, v6);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    buildAppAttestApplicationIdentifier(v7, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    *a2 = 0;
    *a3 = 0;
  }
}

uint64_t extractApplicationIdentifiers(_OWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  const __CFAllocator *v8;
  __SecTask *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void (**v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CFTypeRef v20;
  void (**v21)(_QWORD);
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  AppAttestEligibilityManager *v29;
  AppAttestEligibilityManager *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __SecTask *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  id v50;
  NSObject *v51;
  uint64_t v53;
  void (**v54)(_QWORD);
  void (**v55)(_QWORD);
  AppAttestEligibilityManager *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  audit_token_t token;
  _QWORD v63[5];
  _QWORD v64[5];
  CFErrorRef error;
  _QWORD v66[7];

  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v10 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __extractApplicationIdentifiers_block_invoke;
  v66[3] = &__block_descriptor_40_e5_v8__0l;
  v66[4] = v9;
  v14 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v66);
  if (v9)
  {
    v58 = a2;
    v64[4] = 0;
    error = 0;
    v64[0] = v10;
    v64[1] = 3221225472;
    v64[2] = __extractApplicationIdentifiers_block_invoke_2;
    v64[3] = &__block_descriptor_40_e5_v8__0l;
    v15 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v64);
    v19 = (void *)SecTaskCopyValueForEntitlement(v9, CFSTR("application-identifier"), &error);
    if (error)
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 572, -1, error, CFSTR("Failed to fetch connecting client application identifier."), v16, v17, v18, v53);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v19)
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 576, -1, 0, CFSTR("Failed to fetch connecting client application identifier."), v16, v17, v18, v53);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

      v15[2](v15);
      goto LABEL_42;
    }
    v57 = a3;
    v20 = SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.appattest.daemoncheck"), 0);
    v63[0] = v10;
    v63[1] = 3221225472;
    v63[2] = __extractApplicationIdentifiers_block_invoke_3;
    v63[3] = &__block_descriptor_40_e5_v8__0l;
    v63[4] = v20;
    v21 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v63);
    if (v20 && v20 == (CFTypeRef)*MEMORY[0x24BDBD268])
    {
      _DCAALogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        extractApplicationIdentifiers_cold_2();

    }
    else if (objc_msgSend(CFSTR("com.apple.devicecheckd"), "compare:", v19))
    {
      createAppAttestError((uint64_t)"extractApplicationIdentifiers", 588, -1, error, CFSTR("Failed to query code signing identifier.."), v24, v25, v26, v53);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
      v21[2](v21);

      goto LABEL_41;
    }
    v27 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v27;
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", &token, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v28;
        resolveAppAttestApplicationIdentifiersForApplicationRecord(v29, v58, v57);
        v23 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = 0;
LABEL_39:

          goto LABEL_40;
        }
        v29 = v28;
        resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v29, v58, v57);
        if (v58)
          v49 = v57 == 0;
        else
          v49 = 1;
        v23 = !v49;
        if (v49)
        {
          createAppAttestError((uint64_t)"extractApplicationIdentifiers", 665, -1, 0, CFSTR("Failed to fetch identifiers, unsupported application extension."), v46, v47, v48, v53);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      v30 = objc_alloc_init(AppAttestEligibilityManager);
      v31 = a1[1];
      *(_OWORD *)token.val = *a1;
      *(_OWORD *)&token.val[4] = v31;
      v56 = v30;
      if (-[AppAttestEligibilityManager isEligibleDaemonFor:](v30, "isEligibleDaemonFor:", &token))
      {
        v35 = a1[1];
        *(_OWORD *)token.val = *a1;
        *(_OWORD *)&token.val[4] = v35;
        v36 = SecTaskCreateWithAuditToken(v8, &token);
        v61[0] = v10;
        v61[1] = 3221225472;
        v61[2] = __extractApplicationIdentifiers_block_invoke_40;
        v61[3] = &__block_descriptor_40_e5_v8__0l;
        v61[4] = v36;
        v54 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v61);
        *(_QWORD *)token.val = 0;
        v60[0] = v10;
        v60[1] = 3221225472;
        v60[2] = __extractApplicationIdentifiers_block_invoke_2_41;
        v60[3] = &__block_descriptor_40_e5_v8__0l;
        v60[4] = 0;
        v55 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v60);
        v37 = (void *)SecTaskCopyValueForEntitlement(v36, CFSTR("application-identifier"), (CFErrorRef *)&token);
        v59[0] = v10;
        v59[1] = 3221225472;
        v59[2] = __extractApplicationIdentifiers_block_invoke_3_44;
        v59[3] = &__block_descriptor_40_e5_v8__0l;
        v59[4] = v37;
        v41 = (void (**)(_QWORD))MEMORY[0x2199FACE4](v59);
        if (v37)
        {
          if (*(_QWORD *)token.val)
          {
            objc_msgSend(*(id *)token.val, "localizedDescription");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            createAppAttestError((uint64_t)"extractApplicationIdentifiers", 636, -1, 0, CFSTR("Failed to fetch application identifier entitlement for daemon. { error=%@ }"), v43, v44, v45, (uint64_t)v42);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v23 = 0;
          }
          else
          {
            v50 = v37;
            *v58 = v50;
            *v57 = objc_retainAutorelease(v50);
            _DCAALogSystem();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              extractApplicationIdentifiers_cold_1(v58, v57, v51);

            v23 = 1;
          }
        }
        else
        {
          createAppAttestError((uint64_t)"extractApplicationIdentifiers", 631, -2, 0, CFSTR("Daemon client connection is missing application identifier entitlement."), v38, v39, v40, v53);
          v23 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v41[2](v41);

        v55[2](v55);
        v54[2](v54);
        v29 = v56;

      }
      else
      {
        createAppAttestError((uint64_t)"extractApplicationIdentifiers", 617, -2, 0, CFSTR("Invalid daemon client connection."), v32, v33, v34, v53);
        v23 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v29 = v56;
      }
    }

    goto LABEL_39;
  }
  createAppAttestError((uint64_t)"extractApplicationIdentifiers", 563, -1, 0, CFSTR("Failed to create security task."), v11, v12, v13, v53);
  v23 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
  v14[2](v14);

  return v23;
}

void sub_2167C62FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(uint64_t))(v16 + 16))(v16);
  (*(void (**)(void))(a11 + 16))();
  (*(void (**)(void))(a10 + 16))();
  (*(void (**)(void))(a14 + 16))();
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  (*(void (**)(uint64_t))(v14 + 16))(v14);
  _Unwind_Resume(a1);
}

void __extractApplicationIdentifiers_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __extractApplicationIdentifiers_block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __extractApplicationIdentifiers_block_invoke_3(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __extractApplicationIdentifiers_block_invoke_40(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __extractApplicationIdentifiers_block_invoke_2_41(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __extractApplicationIdentifiers_block_invoke_3_44(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

id generateAttestationObject(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  id v8;
  CBORArray *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  CBORData *v13;
  void *v14;
  CBORData *v15;
  CBORMap *v16;
  CBORString *v17;
  CBORString *v18;
  CBORData *v19;
  CBORMap *v20;
  void *v21;
  CBORString *v22;
  CBORData *v23;
  CBORString *v24;
  CBORString *v25;
  CBORString *v26;
  id v27;
  void *v28;
  void *v29;
  void *context;

  v6 = a1;
  v7 = a2;
  v8 = a3;
  context = (void *)MEMORY[0x2199FAB94]();
  v9 = objc_alloc_init(CBORArray);
  if (v7 && objc_msgSend(v7, "count", context) == 2 && objc_msgSend(v7, "count"))
  {
    v10 = 0;
    do
    {
      _DCAALogSystem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _DCLogDebugBinary(v11, CFSTR("generateAttestationObject:cert"), v12);

      v13 = [CBORData alloc];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CBORData initWith:](v13, "initWith:", v14);
      -[CBORArray addObject:](v9, "addObject:", v15);

      ++v10;
    }
    while (v10 < objc_msgSend(v7, "count"));
  }
  v16 = objc_alloc_init(CBORMap);
  v17 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("x5c"));
  -[CBORMap setKey:value:](v16, "setKey:value:", v17, v9);

  v18 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("receipt"));
  v19 = -[CBORData initWith:]([CBORData alloc], "initWith:", v8);
  -[CBORMap setKey:value:](v16, "setKey:value:", v18, v19);

  v20 = objc_alloc_init(CBORMap);
  _DCAALogSystem();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _DCLogDebugBinary(v21, CFSTR("generateAttestationObject:authData"), v6);

  v22 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("authData"));
  v23 = -[CBORData initWith:]([CBORData alloc], "initWith:", v6);
  -[CBORMap setKey:value:](v20, "setKey:value:", v22, v23);

  v24 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("fmt"));
  v25 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("apple-appattest"));
  -[CBORMap setKey:value:](v20, "setKey:value:", v24, v25);

  v26 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("attStmt"));
  -[CBORMap setKey:value:](v20, "setKey:value:", v26, v16);

  v27 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[CBORMap write:](v20, "write:", v27);
  v28 = (void *)objc_msgSend(v27, "copy");
  _DCAALogSystem();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _DCLogDebugBinary(v29, CFSTR("generateAttestationObject:finalObject"), v27);

  objc_autoreleasePoolPop(context);
  if (a4 && !v28)
    *a4 = 0;

  return v28;
}

id generateAssertionObject(__SecKey *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  void *v11;
  const __CFData *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFDataRef v16;
  CBORMap *v17;
  CBORString *v18;
  CBORData *v19;
  CBORString *v20;
  CBORData *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  void *contexta;
  _QWORD *v29;
  id v30;
  CFErrorRef error;

  v30 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v9);
  objc_msgSend(v11, "appendData:", v10);
  getSHA256(v11);
  v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v16 = SecKeyCreateSignature(a1, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v12, &error);
  if (v16)
  {
    contexta = (void *)MEMORY[0x2199FAB94]();
    v17 = objc_alloc_init(CBORMap);
    v18 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("authenticatorData"));
    v29 = a5;
    v19 = -[CBORData initWith:]([CBORData alloc], "initWith:", v9);
    -[CBORMap setKey:value:](v17, "setKey:value:", v18, v19);

    v20 = -[CBORString initWith:]([CBORString alloc], "initWith:", CFSTR("signature"));
    v21 = -[CBORData initWith:]([CBORData alloc], "initWith:", v16);
    -[CBORMap setKey:value:](v17, "setKey:value:", v20, v21);

    v22 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    -[CBORMap write:](v17, "write:", v22);
    v23 = (void *)objc_msgSend(v22, "copy");
    _DCAALogSystem();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _DCLogDebugBinary(v24, CFSTR("generateAssertionObject:finalObject"), v22);

    a5 = v29;
    objc_autoreleasePoolPop(contexta);
    v25 = 0;
    if (!v29)
      goto LABEL_7;
  }
  else
  {
    createAppAttestError((uint64_t)"generateAssertionObject", 756, -1, error, CFSTR("Failed to sign data with ref key."), v13, v14, v15, (uint64_t)context);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v23)
    *a5 = objc_retainAutorelease(v25);
LABEL_7:
  if (error)
    CFRelease(error);

  return v23;
}

uint64_t saveCredentialKeychain(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v11;

  buildKeychainLabel(a2, a3, a4, a5, CFSTR("rk"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = store_keychain_item(a1, CFSTR("com.apple.appattest.identities"), v6, &v11);
  v8 = v11;
  _DCAALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    saveCredentialKeychain_cold_1();

  return v7;
}

id buildKeychainLabel(int a1, void *a2, void *a3, void *a4, void *a5)
{
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  id v13;
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

  v9 = CFSTR("d");
  if (a1 == 1)
    v9 = CFSTR("p");
  v10 = v9;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getSHA256(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  getSHA256(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  getSHA256(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@%@:%@:%@:%@"), CFSTR("aa:"), v21, v10, v22, v23, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

CFTypeRef loadCredentialKeychain(int a1, void *a2, void *a3, void *a4)
{
  void *v4;
  CFTypeRef v5;
  id v6;
  CFTypeRef v7;
  NSObject *v8;
  id v10;
  OSStatus v11;

  v11 = -1;
  buildKeychainLabel(a1, a2, a3, a4, CFSTR("rk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = copy_keychain_item(CFSTR("com.apple.appattest.identities"), v4, &v11, &v10);
  v6 = v10;
  v7 = 0;
  if (!v11)
    v7 = CFRetain(v5);
  _DCAALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    loadCredentialKeychain_cold_1();

  if (v5)
    CFRelease(v5);

  return v7;
}

uint64_t deleteCredentialKeychainWithLabel(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v6;

  v1 = a1;
  v6 = 0;
  v2 = delete_keychain_item(CFSTR("com.apple.appattest.identities"), v1, &v6);
  v3 = v6;
  _DCAALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    deleteCredentialKeychainWithLabel_cold_1();

  return v2;
}

id getAllCredentialKeychainLabels()
{
  void *v0;
  const __CFArray *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const void *v6;
  const __CFDictionary *ValueAtIndex;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  int v13;

  v13 = -1;
  v0 = (void *)objc_opt_new();
  v12 = 0;
  v1 = (const __CFArray *)copy_all_items(CFSTR("com.apple.appattest.identities"), &v13, &v12);
  if (v1)
  {
    v2 = v1;
    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      v6 = (const void *)*MEMORY[0x24BDE90A0];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
        CFDictionaryGetValue(ValueAtIndex, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("aa:")))
          objc_msgSend(v0, "addObject:", v8);

        ++v5;
      }
      while (v4 != v5);
    }
    CFRelease(v2);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;

  return v10;
}

uint64_t saveAssertionCounterKeychain(void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;

  v9 = a1;
  buildKeychainLabel(a2, a3, a4, a5, CFSTR("ct"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v18;
  v17 = v12;
  v13 = store_keychain_data(v11, CFSTR("com.apple.appattest.identities"), v10, &v17);
  v14 = v17;

  _DCAALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    saveAssertionCounterKeychain_cold_1();

  return v13;
}

id loadAssertionCounterKeychain(int a1, void *a2, void *a3, void *a4)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;
  OSStatus v13;

  v13 = -1;
  buildKeychainLabel(a1, a2, a3, a4, CFSTR("ct"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  copy_keychain_data(CFSTR("com.apple.appattest.identities"), v4, &v13, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v13)
  {
    v7 = 0;
  }
  else
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    v6 = v8;
  }
  _DCAALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    loadAssertionCounterKeychain_cold_1();

  return v7;
}

uint64_t deleteAssertionCounterKeychainWithLabel(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v6;

  v1 = a1;
  v6 = 0;
  v2 = delete_keychain_data(CFSTR("com.apple.appattest.identities"), v1, &v6);
  v3 = v6;
  _DCAALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    deleteAssertionCounterKeychainWithLabel_cold_1();

  return v2;
}

id getAllAssertionCounterKeychainLabels()
{
  void *v0;
  const __CFArray *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const void *v6;
  const __CFDictionary *ValueAtIndex;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  int v13;

  v13 = -1;
  v0 = (void *)objc_opt_new();
  v12 = 0;
  v1 = (const __CFArray *)copy_all_datas(CFSTR("com.apple.appattest.identities"), &v13, &v12);
  if (v1)
  {
    v2 = v1;
    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      v6 = (const void *)*MEMORY[0x24BDE90A0];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
        CFDictionaryGetValue(ValueAtIndex, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("aa:")))
          objc_msgSend(v0, "addObject:", v8);

        ++v5;
      }
      while (v4 != v5);
    }
    CFRelease(v2);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;

  return v10;
}

id getApplicationIdentifierHashFromKeychainLabel(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(":"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "count") > 4)
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DCAALogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      getApplicationIdentifierHashFromKeychainLabel_cold_1();

    v3 = 0;
  }

  return v3;
}

id getAllAppUUIDKeychainLabels()
{
  void *v0;
  const __CFArray *v1;
  id v2;
  void *v3;
  NSObject *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const void *v8;
  const __CFDictionary *ValueAtIndex;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  __CFString *v20;
  char v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v32;
  void *key;
  const void *v34;
  CFIndex v35;
  const __CFArray *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  _BYTE v42[15];
  id v43;
  int v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v44 = -1;
  v0 = (void *)objc_opt_new();
  v43 = 0;
  v1 = (const __CFArray *)copy_all_datas(CFSTR("com.apple.appattest.identities"), &v44, &v43);
  v2 = v43;
  v3 = v2;
  if (v1)
  {
    v32 = v2;
    _DCAALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      getAllAppUUIDKeychainLabels_cold_2();

    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      v8 = (const void *)*MEMORY[0x24BDE90A0];
      key = (void *)*MEMORY[0x24BDE9550];
      v35 = Count;
      v36 = v1;
      v34 = (const void *)*MEMORY[0x24BDE90A0];
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v1, v7);
        CFDictionaryGetValue(ValueAtIndex, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("au:")))
          break;
LABEL_28:

        if (++v7 == v6)
          goto LABEL_29;
      }
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") != 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      v40 = v10;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetValue(ValueAtIndex, key);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
      v38 = (void *)v13;
      v39 = v11;
      v37 = v14;
      if (!v14)
      {
        v17 = 0;
LABEL_17:
        isNSString(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = 1;
          v20 = CFSTR("d");
          do
          {
            v21 = v19;
            v22 = v20;
            objc_msgSend(v17, "dataUsingEncoding:", 4);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            getSHA256(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%@%@:%@"), CFSTR("aa:"), v26, v22, v12);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            _DCAALogSystem();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v27;
              _os_log_debug_impl(&dword_2167BD000, v28, OS_LOG_TYPE_DEBUG, "    %@\n", buf, 0xCu);
            }

            objc_msgSend(v0, "addObject:", v27);
            v19 = 0;
            v20 = CFSTR("p");
          }
          while ((v21 & 1) != 0);
        }
        else
        {
          _DCAALogSystem();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            getAllAppUUIDKeychainLabels_cold_1(&v41, v42);

        }
        v6 = v35;
        v1 = v36;
        v8 = v34;
        v11 = v39;
        v10 = v40;
        goto LABEL_27;
      }
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count") == 1)
      {
        v16 = 0;
      }
      else
      {
        if (objc_msgSend(v15, "count") != 3)
        {
          v17 = 0;
          goto LABEL_16;
        }
        v16 = 2;
      }
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
LABEL_29:
    CFRelease(v1);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v32;
  }
  else
  {
    v30 = (void *)objc_opt_new();
  }

  return v30;
}

id listKeychainItems()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  AppAttestEligibilityManager *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v0, "nextObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      v51 = 0;
      v52 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationRecord(v3, &v52, &v51);
      v4 = v52;
      v5 = v51;
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      getSHA256(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, v8);

      objc_msgSend(v0, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
    while (v9);
  }
  v40 = objc_alloc_init(AppAttestEligibilityManager);
  -[AppAttestEligibilityManager allowlistedDaemons](v40, "allowlistedDaemons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v15, "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        getSHA256(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v15, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }
  objc_msgSend(MEMORY[0x24BDC1528], "enumeratorWithOptions:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "nextObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    do
    {
      v45 = 0;
      v46 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v21, &v46, &v45);
      v22 = v46;
      v23 = v45;
      v24 = v23;
      if (v22)
        v25 = v23 == 0;
      else
        v25 = 1;
      if (!v25)
      {
        objc_msgSend(v23, "dataUsingEncoding:", 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        getSHA256(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "base64EncodedStringWithOptions:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v24, v28);

      }
      objc_msgSend(v19, "nextObject");
      v29 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v29;
    }
    while (v29);
  }
  getAllCredentialKeychainLabels();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v30;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        getApplicationIdentifierHashFromKeychainLabel(*(void **)(*((_QWORD *)&v41 + 1) + 8 * j));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "objectForKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend(v31, "addObject:", v38);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v34);
  }

  return v31;
}

void removeAllKeychainItemsForMissingApps()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  _DCAALogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2167BD000, v0, OS_LOG_TYPE_DEFAULT, "Cleaning up keychain", v12, 2u);
  }

  v1 = objc_alloc(MEMORY[0x24BDBCEB8]);
  listOfInstalledAppHashes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithArray:", v2);

  listOfAllowlistedDaemonHashes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  listOfInstalledExtensionHashes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _DCAALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    removeAllKeychainItemsForMissingApps_cold_2();

  getAllCredentialKeychainLabels();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __removeAllKeychainItemsForMissingApps_block_invoke((uint64_t)v9, v9, v7, &__block_literal_global_111);

  _DCAALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    removeAllKeychainItemsForMissingApps_cold_1();

  getAllAssertionCounterKeychainLabels();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __removeAllKeychainItemsForMissingApps_block_invoke((uint64_t)v11, v11, v7, &__block_literal_global_113);

}

id listOfInstalledAppHashes()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  _DCAALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    listOfInstalledAppHashes_cold_1();

  objc_msgSend(v0, "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)v3;
    *(_QWORD *)&v4 = 138412546;
    v14 = v4;
    do
    {
      v15 = 0;
      v16 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationRecord(v5, &v16, &v15);
      v6 = v16;
      v7 = v15;
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      getSHA256(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
      {
        _DCAALogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          v18 = v7;
          v19 = 2112;
          v20 = v10;
          _os_log_debug_impl(&dword_2167BD000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }

      }
      objc_msgSend(v1, "addObject:", v10, v14);

      objc_msgSend(v0, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
    while (v12);
  }

  return v1;
}

id listOfAllowlistedDaemonHashes()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  AppAttestEligibilityManager *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = objc_alloc_init(AppAttestEligibilityManager);
  -[AppAttestEligibilityManager allowlistedDaemons](v13, "allowlistedDaemons");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "dataUsingEncoding:", 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        getSHA256(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v10);
        _DCAALogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v7;
          v20 = 2112;
          v21 = v10;
          _os_log_debug_impl(&dword_2167BD000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v4);
  }

  return v1;
}

id listOfInstalledExtensionHashes()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1528], "enumeratorWithOptions:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  _DCAALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    listOfInstalledExtensionHashes_cold_1();

  objc_msgSend(v0, "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v14 = 0;
      v15 = 0;
      resolveAppAttestApplicationIdentifiersForApplicationExtensionRecord(v4, &v15, &v14);
      v5 = v15;
      v6 = v14;
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "dataUsingEncoding:", 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        getSHA256(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _DCAALogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v7;
          v18 = 2112;
          v19 = v10;
          _os_log_debug_impl(&dword_2167BD000, v11, OS_LOG_TYPE_DEBUG, "    %@ -> %@\n", buf, 0x16u);
        }

        objc_msgSend(v1, "addObject:", v10);
      }

      objc_msgSend(v0, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v12;
    }
    while (v12);
  }

  return v1;
}

void __removeAllKeychainItemsForMissingApps_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSObject *v26;
  void (**v27)(id, void *);
  void *v28;
  void *v29;
  id obj;
  char v31;
  _BYTE v32[15];
  char v33;
  _BYTE v34[15];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _BYTE v40[15];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v27 = a4;
  getAllAppUUIDKeychainLabels();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
        _DCAALogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v12;
          _os_log_debug_impl(&dword_2167BD000, v13, OS_LOG_TYPE_DEBUG, "    Checking %@\n", buf, 0xCu);
        }

        getApplicationIdentifierHashFromKeychainLabel(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v15 = v7;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v42;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v42 != v18)
                  objc_enumerationMutation(v15);
                if ((objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v27) & 1) != 0)
                {

                  v37 = 0u;
                  v38 = 0u;
                  v35 = 0u;
                  v36 = 0u;
                  v21 = v28;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v36;
                    while (2)
                    {
                      for (j = 0; j != v23; ++j)
                      {
                        if (*(_QWORD *)v36 != v24)
                          objc_enumerationMutation(v21);
                        if (objc_msgSend(v12, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j)))
                        {
                          _DCAALogSystem();
                          v26 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                            __removeAllKeychainItemsForMissingApps_block_invoke_cold_3(&v33, v34);

                          goto LABEL_33;
                        }
                      }
                      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
                      if (v23)
                        continue;
                      break;
                    }
                  }

                  _DCAALogSystem();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    __removeAllKeychainItemsForMissingApps_block_invoke_cold_2(&v31, v32);
                  goto LABEL_29;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
              if (v17)
                continue;
              break;
            }
          }

          _DCAALogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            __removeAllKeychainItemsForMissingApps_block_invoke_cold_1(&v39, v40);
LABEL_29:

          objc_msgSend(v29, "addObject:", v12);
        }
LABEL_33:

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v9);
  }

  v27[2](v27, v29);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_109(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        _DCAALogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_debug_impl(&dword_2167BD000, v8, OS_LOG_TYPE_DEBUG, "    Removing %@\n", buf, 0xCu);
        }

        deleteCredentialKeychainWithLabel(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

void __removeAllKeychainItemsForMissingApps_block_invoke_112(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        _DCAALogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_debug_impl(&dword_2167BD000, v8, OS_LOG_TYPE_DEBUG, "    Removing %@\n", buf, 0xCu);
        }

        deleteAssertionCounterKeychainWithLabel(v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

void __fetchPublicKey_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void __fetchPublicKey_block_invoke_116(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

_BYTE *OUTLINED_FUNCTION_11(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_2167C8E6C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t))(v3 + 16))(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2167C91E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t))(v4 + 16))(v4);
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2167C941C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1)
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global_2);
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  isNSNumber(v1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
    isRunningInDiagnosticsMode_retval = objc_msgSend(v1, "BOOLValue");

}

id isNSNumber(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSString(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSData(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id copy_current_process_name()
{
  return copy_process_name();
}

id copy_process_name()
{
  int v0;
  void *v1;
  void *v2;
  pid_t v3;
  int v4;
  _OWORD v7[16];
  char buffer[4096];
  uint64_t v9;

  v0 = MEMORY[0x24BDAC7A8]();
  v9 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x1000uLL);
  memset(v7, 0, sizeof(v7));
  if (v0
    && (objc_msgSend(MEMORY[0x24BDD1988], "currentConnection"), (v1 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "processIdentifier");

  }
  else
  {
    v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47)
        break;
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), v7);
}

void AppAttest_DeviceAttestation_AttestKey(__SecKey *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  id v21;
  __SecTask *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __SecTask *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  CFErrorRef v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  CFErrorRef v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CFDictionary *v68;
  void *Value;
  void *v70;
  void *v71;
  BOOL v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  CFErrorRef v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[4];
  NSObject *v105;
  uint64_t *v106;
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  CFErrorRef error[2];
  const __CFString *v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__1;
  v112 = __Block_byref_object_dispose__1;
  v113 = 0;
  if (!v6)
  {
    _DCAALogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      AppAttest_DeviceAttestation_AttestKey_cold_1(v37, v38, v39, v40, v41, v42, v43, v44);
    v45 = 0;
    goto LABEL_28;
  }
  v10 = 60.0;
  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 216, -4, 0, CFSTR("Not supported"), v7, v8, v9, v102);
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v11 = (id *)(v109 + 5);
  v12 = (void *)v109[5];
  if (isSupportedSPIClient_onceToken_0 != -1)
    dispatch_once(&isSupportedSPIClient_onceToken_0, &__block_literal_global_3);
  copy_current_process_name();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    createAppAttestError((uint64_t)"isSupportedSPIClient", 176, -1, 0, CFSTR("Failed to query process name."), v13, v14, v15, v102);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v49 = objc_retainAutorelease(v47);

    objc_storeStrong(v11, v49);
    createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 221, -1, (void *)v109[5], CFSTR("Client is not supported."), v50, v51, v52, v103);
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((objc_msgSend((id)isSupportedSPIClient_supportedList_0, "containsObject:", v16) & 1) == 0)
  {
    createAppAttestError((uint64_t)"isSupportedSPIClient", 181, -1, 0, CFSTR("%@ is not allowed to use this API.  Please refer to the header file for onboarding information."), v17, v18, v19, (uint64_t)v16);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v47, "localizedDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      AppAttest_WebAuthentication_AttestKey_cold_2(v48, (uint8_t *)error);
    }
    goto LABEL_22;
  }

  objc_storeStrong(v11, v12);
  v20 = (id *)(v109 + 5);
  v21 = (id)v109[5];
  error[0] = 0;
  v22 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v26 = v22;
  if (!v22)
  {
    createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 58, -1, 0, CFSTR("Failed to create task."), v23, v24, v25, v102);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = 0;
    v36 = 0;
    v35 = v21;
    goto LABEL_36;
  }
  v27 = (void *)SecTaskCopyValueForEntitlement(v22, CFSTR("com.apple.appattest.spi"), error);
  isNSNumber(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28 || (v29 = objc_msgSend(v27, "BOOLValue"), v28, (v29 & 1) == 0))
  {
    v54 = error[0];
    v115 = CFSTR("com.apple.appattest.spi");
    v116[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 64, -5, v54, CFSTR("Missing required entitlement: %@"), v56, v57, v58, (uint64_t)v55);
    v59 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v60 = (void *)v59;
LABEL_34:

    v21 = objc_retainAutorelease(v60);
    v36 = 0;
    v35 = v21;
    goto LABEL_35;
  }
  v30 = (void *)SecTaskCopyValueForEntitlement(v26, CFSTR("com.apple.mobileactivationd.eda"), error);

  isNSNumber(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || (v32 = objc_msgSend(v30, "BOOLValue"), v31, (v32 & 1) == 0))
  {
    v61 = error[0];
    v115 = CFSTR("com.apple.mobileactivationd.eda");
    v116[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 70, -5, v61, CFSTR("Missing required entitlement: %@"), v62, v63, v64, (uint64_t)v55);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v30;
    goto LABEL_34;
  }
  v27 = (void *)SecTaskCopyValueForEntitlement(v26, CFSTR("com.apple.security.attestation.access"), error);

  isNSNumber(v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33 || (v34 = objc_msgSend(v27, "BOOLValue"), v33, (v34 & 1) == 0))
  {
    v98 = error[0];
    v115 = CFSTR("com.apple.security.attestation.access");
    v116[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    createAppAttestError((uint64_t)"validateDeviceAttestationEntitlements", 76, -5, v98, CFSTR("Missing required entitlement: %@"), v99, v100, v101, (uint64_t)v55);
    v59 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v35 = 0;
  v36 = 1;
LABEL_35:
  CFRelease(v26);
LABEL_36:
  if (error[0])
    CFRelease(error[0]);

  objc_storeStrong(v20, v21);
  if (v36)
  {
    if (!a1)
      goto LABEL_53;
    v68 = SecKeyCopyAttributes(a1);
    Value = (void *)CFDictionaryGetValue(v68, (const void *)*MEMORY[0x24BDE9158]);
    isNSString(Value);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70 && !objc_msgSend(v70, "compare:", *MEMORY[0x24BDE9170]))
    {
      v94 = (void *)CFDictionaryGetValue(v68, (const void *)*MEMORY[0x24BDE9048]);
      isNSNumber(v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v95;
      if (v95 && (objc_msgSend(v95, "unsignedLongValue") == 256 || objc_msgSend(v73, "unsignedLongValue") == 384))
      {
        v96 = (void *)CFDictionaryGetValue(v68, (const void *)*MEMORY[0x24BDE9050]);
        isNSString(v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v97;
        v72 = v97
           && (!objc_msgSend(v97, "compare:", *MEMORY[0x24BDE9090])
            || !objc_msgSend(v74, "compare:", *MEMORY[0x24BDE9088])
            || !objc_msgSend(v74, "compare:", *MEMORY[0x24BDE9060])
            || !objc_msgSend(v74, "compare:", *MEMORY[0x24BDE9068]));
        goto LABEL_44;
      }
      v72 = 0;
    }
    else
    {
      v72 = 0;
      v73 = 0;
    }
    v74 = 0;
LABEL_44:
    if (v68)
      CFRelease(v68);

    if (v72)
    {
      v75 = v5;
      v76 = *MEMORY[0x24BE2C460];
      objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x24BE2C460]);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      isNSNumber(v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78)
      {
        objc_msgSend(v75, "objectForKeyedSubscript:", v76);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "BOOLValue");

        if ((v80 & 1) != 0)
        {
          v84 = *MEMORY[0x24BE2C3E0];
          objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x24BE2C3E0]);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          isNSNumber(v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v86
            || (objc_msgSend(v75, "objectForKeyedSubscript:", v84),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v87, "doubleValue"),
                v10 = v88,
                v87,
                v10 > 0.0))
          {
            v92 = v109;
            v107 = (id)v109[5];
            createDeviceAttestationRequest(1, 1, (uint64_t)a1, v75, &v107);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v107;
            v53 = (void *)v92[5];
            v92[5] = (uint64_t)v93;
            goto LABEL_24;
          }
          createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 244, -2, 0, CFSTR("Invalid network timeout requested"), v89, v90, v91, v102);
          v46 = objc_claimAutoreleasedReturnValue();
LABEL_23:
          v45 = 0;
          v53 = (void *)v109[5];
          v109[5] = v46;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

      }
      createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 236, -3, 0, CFSTR("Invalid options"), v81, v82, v83, v102);
      v46 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_53:
    createAppAttestError((uint64_t)"AppAttest_DeviceAttestation_AttestKey", 231, -3, 0, CFSTR("Invalid referenceKey"), v65, v66, v67, v102);
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v45 = 0;
LABEL_25:
  if (!v109[5])
  {
    v104[0] = MEMORY[0x24BDAC760];
    v104[1] = 3221225472;
    v104[2] = __AppAttest_DeviceAttestation_AttestKey_block_invoke;
    v104[3] = &unk_24D5959F0;
    v106 = &v108;
    v105 = v6;
    AppAttest_Common_AttestKeyRequest(1u, 1, v45, a1, v104, v10);
    v37 = v105;
LABEL_28:

    goto LABEL_29;
  }
  (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_29:

  _Block_object_dispose(&v108, 8);
}

void sub_2167CA0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __isSupportedSPIClient_block_invoke_0()
{
  void *v0;

  v0 = (void *)isSupportedSPIClient_supportedList_0;
  isSupportedSPIClient_supportedList_0 = (uint64_t)&unk_24D598798;

}

id createGenericAuthenticatorDataShort(void *a1, char a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  unsigned int v23;
  char v24;

  v7 = a1;
  v24 = a2;
  v8 = a3;
  v23 = 0;
  isNSData(v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9 && (v13 = (void *)v9, v14 = objc_msgSend(v7, "length"), v13, v14 == 32))
  {
    isNSNumber(v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v7);
      objc_msgSend(v19, "appendBytes:length:", &v24, 1);
      v23 = bswap32(objc_msgSend(v8, "unsignedIntValue"));
      objc_msgSend(v19, "appendBytes:length:", &v23, 4);
      v15 = v19;
      v20 = 0;
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      createAppAttestError((uint64_t)"createGenericAuthenticatorDataShort", 41, -2, 0, CFSTR("Invalid counter"), v16, v17, v18, v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_9;
    }
  }
  else
  {
    createAppAttestError((uint64_t)"createGenericAuthenticatorDataShort", 36, -2, 0, CFSTR("Invalid rpID"), v10, v11, v12, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!a4)
      goto LABEL_9;
  }
  if (!v15)
    *a4 = objc_retainAutorelease(v20);
LABEL_9:

  return v15;
}

id createGenericAuthenticatorDataFull(void *a1, void *a2, char a3, void *a4, __SecKey *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v39;
  __int16 v40;
  id v41;
  id v42;

  v11 = a1;
  v12 = a2;
  v13 = a4;
  v42 = 0;
  encodeKeyToCOSE(a5, &v42);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v42;
  if (v15)
  {
    v19 = v15;
    createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", 80, -3, v15, CFSTR("Unable to generate credentialId."), v16, v17, v18, (uint64_t)v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    goto LABEL_12;
  }
  v41 = 0;
  createGenericAuthenticatorDataShort(v12, a3, v13, &v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v41;
  if (!v21)
  {
    v34 = CFSTR("Unable to generate authenticator data");
    v35 = 86;
    v36 = v26;
LABEL_10:
    createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", v35, -1, v36, v34, v23, v24, v25, (uint64_t)v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v19 = v26;
    goto LABEL_12;
  }
  objc_msgSend(v21, "appendData:", v11);
  if (objc_msgSend(v11, "length") != 16)
  {
    v34 = CFSTR("Invalid aaguid length!");
    v35 = 92;
    v36 = 0;
    goto LABEL_10;
  }
  v40 = 0;
  v39 = v26;
  generateCredentialId(a5, &v39, v27, v28, v29, v23, v24, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v39;

  if (v22 && objc_msgSend(v22, "length") == 32)
  {
    v40 = 0x2000;
    objc_msgSend(v21, "appendBytes:length:", &v40, 2);
    objc_msgSend(v21, "appendData:", v22);
    objc_msgSend(v21, "appendData:", v14);
    v33 = v21;
    v21 = v33;
    goto LABEL_15;
  }
  createAppAttestError((uint64_t)"createGenericAuthenticatorDataFull", 99, -1, v19, CFSTR("Invalid credentialId length!"), v30, v31, v32, (uint64_t)v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  if (a6)
  {
    v19 = objc_retainAutorelease(v20);
    v33 = 0;
    *a6 = v19;
  }
  else
  {
    v33 = 0;
    v19 = v20;
  }
LABEL_15:
  v37 = v33;

  return v37;
}

void AppAttest_AppAttestation_CreateKey(__int128 *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id, NSObject *, id);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  int v24;
  __int128 v25;
  char v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  __SecKey *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v5;
    if ((DeviceIdentityIsSupported() & 1) != 0)
    {
      v78 = 0;
      v11 = IsSupportedSPIClient(&v78);
      v12 = v78;
      v16 = v12;
      if ((v11 & 1) != 0)
      {
        v77 = v12;
        v17 = AppAttest_Common_ValidateEntitlements(&v77);
        v18 = v77;

        if (v17)
        {
          v19 = a1[1];
          v75 = *a1;
          v76 = v19;
          if ((AppAttest_AppAttestation_IsEligibleApplication(&v75) & 1) == 0)
          {
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 123, -4, 0, CFSTR("Application not eligible"), v20, v21, v22, v69);
            v68 = objc_claimAutoreleasedReturnValue();

            v28 = 0;
            v27 = 0;
            v43 = 0;
            v18 = (id)v68;
            goto LABEL_21;
          }
          v23 = a1[1];
          v75 = *a1;
          v76 = v23;
          v24 = generateEnvironmentByAppSigning(&v75);
          v73 = 0;
          v74 = 0;
          v72 = v18;
          v25 = a1[1];
          v75 = *a1;
          v76 = v25;
          v26 = extractApplicationIdentifiers(&v75, &v74, &v73, &v72);
          v27 = v74;
          v28 = v73;
          v29 = v72;

          if ((v26 & 1) != 0)
          {
            HIDWORD(v69) = v24;
            resolveAppUUIDKeychain(v7, v27, v28);
            v33 = (id)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "UUIDString");
              v33 = (id)objc_claimAutoreleasedReturnValue();

            }
            v71 = v29;
            v35 = (__SecKey *)createReferenceKeyBlob(0, 0, &v71);
            v36 = v71;

            if (v35)
            {
              v70 = v36;
              generateCredentialIdString(v35, &v70, v37, v38, v39, v40, v41, v42);
              v43 = objc_claimAutoreleasedReturnValue();
              v18 = v70;

              if (v43)
              {
                if ((saveCredentialKeychain((uint64_t)v35, SHIDWORD(v69), v33, v28, v43) & 1) != 0)
                {
                  if (v33 == v7)
                  {
LABEL_33:
                    CFRelease(v35);
                    goto LABEL_21;
                  }
                  if ((saveAppUUIDKeychain(v33, v27, v28) & 1) != 0)
                  {
LABEL_32:
                    v7 = v33;
                    goto LABEL_33;
                  }
                  createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 163, -3, 0, CFSTR("Failed to refresh appUUID keychain"), v50, v51, v52, v69);
                  v53 = objc_claimAutoreleasedReturnValue();

                  v33 = 0;
                }
                else
                {
                  createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 156, -3, 0, CFSTR("Failed to store keychain"), v47, v48, v49, v69);
                  v53 = objc_claimAutoreleasedReturnValue();

                }
                v18 = v43;
              }
              else
              {
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 151, -3, v18, CFSTR("Failed to generate credentialId"), v44, v45, v46, v69);
                v53 = objc_claimAutoreleasedReturnValue();
              }

              v43 = 0;
              v18 = (id)v53;
              goto LABEL_32;
            }
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 145, -3, v36, CFSTR("Failed to create bik"), v40, v41, v42, v69);
            v18 = (id)objc_claimAutoreleasedReturnValue();

            v43 = 0;
            v7 = v33;
LABEL_21:
            _DCAALogSystem();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              AppAttest_AppAttestation_CreateKey_cold_2((uint64_t)v18, v61, v62, v63, v64, v65, v66, v67);

            v6[2](v6, v7, v43, v18);
            goto LABEL_24;
          }
          createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 132, -2, v29, CFSTR("Unable to fetch application identifier"), v30, v31, v32, v69);
          v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
          v43 = 0;
          goto LABEL_21;
        }
      }
      else
      {
        createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 113, -4, v12, CFSTR("Client is not supported."), v13, v14, v15, v69);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_CreateKey", 108, -4, 0, CFSTR("Not supported"), v8, v9, v10, v69);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = 0;
    v27 = 0;
    goto LABEL_20;
  }
  _DCAALogSystem();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    AppAttest_AppAttestation_CreateKey_cold_1(v43, v54, v55, v56, v57, v58, v59, v60);
LABEL_24:

}

uint64_t IsSupportedSPIClient(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  if (IsSupportedSPIClient_onceToken != -1)
    dispatch_once(&IsSupportedSPIClient_onceToken, &__block_literal_global_4);
  copy_current_process_name();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    createAppAttestError((uint64_t)"IsSupportedSPIClient", 493, -1, 0, CFSTR("Failed to query process name."), v2, v3, v4, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (a1)
    {
LABEL_10:
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a1 = v9;
      goto LABEL_13;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend((id)IsSupportedSPIClient_supportedList, "containsObject:", v5) & 1) == 0)
  {
    createAppAttestError((uint64_t)"IsSupportedSPIClient", 498, -1, 0, CFSTR("%@ is not allowed to use this API.  Please refer to the header file for onboarding information."), v6, v7, v8, (uint64_t)v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      IsSupportedSPIClient_cold_1(v9);
      if (a1)
        goto LABEL_10;
    }
    else if (a1)
    {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  v9 = 0;
  v10 = 1;
LABEL_13:

  return v10;
}

void AppAttest_AppAttestation_AttestKey(_OWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  char v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  BOOL v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  __SecKey *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __CFString *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  __SecKey *CredentialKeychain;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  uint64_t v97;
  dispatch_semaphore_t v98;
  void *v99;
  int EnvironmentByAppSigning;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  _QWORD v106[4];
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  NSObject *v112;
  dispatch_semaphore_t v113;
  void (**v114)(id, _QWORD, id);
  int v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  uint8_t buf[56];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    if ((DeviceIdentityIsSupported() & 1) != 0)
    {
      v121 = 0;
      v16 = IsSupportedSPIClient(&v121);
      v17 = v121;
      v21 = v17;
      if ((v16 & 1) != 0)
      {
        v120 = v17;
        v22 = AppAttest_Common_ValidateEntitlements(&v120);
        v23 = v120;

        if (v22)
        {
          v24 = a1[1];
          *(_OWORD *)buf = *a1;
          *(_OWORD *)&buf[16] = v24;
          if ((AppAttest_AppAttestation_IsEligibleApplication((__int128 *)buf) & 1) != 0)
          {
            v28 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&buf[16] = v28;
            EnvironmentByAppSigning = generateEnvironmentByAppSigning(buf);
            v118 = 0;
            v119 = 0;
            v117 = v23;
            v29 = a1[1];
            *(_OWORD *)buf = *a1;
            *(_OWORD *)&buf[16] = v29;
            v30 = extractApplicationIdentifiers(buf, &v119, &v118, &v117);
            v31 = v119;
            v32 = v118;
            v33 = v117;

            if ((v30 & 1) != 0)
            {
              resolveAppUUIDKeychain(v9, v31, v32);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              if (v99)
              {
                isNSString(v10);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  isNSData(v11);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (v35)
                  {
                    v36 = (void *)v35;
                    v104 = v33;
                    v37 = objc_msgSend(v11, "length");

                    v38 = v37 >= 0x21;
                    v33 = v104;
                    if (!v38)
                    {
                      CredentialKeychain = (__SecKey *)loadCredentialKeychain(EnvironmentByAppSigning, v99, v32, v10);
                      if (CredentialKeychain)
                      {
                        v57 = CredentialKeychain;
                        loadAssertionCounterKeychain(EnvironmentByAppSigning, v99, v32, v10);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        v79 = v78;
                        if (v78 && (int)objc_msgSend(v78, "intValue") >= 2)
                        {
                          v102 = v79;
                          _DCAALogSystem();
                          v80 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                          {
                            v95 = objc_msgSend(v102, "intValue");
                            *(_DWORD *)buf = 138413314;
                            *(_QWORD *)&buf[4] = v10;
                            *(_WORD *)&buf[12] = 1024;
                            *(_DWORD *)&buf[14] = v95;
                            *(_WORD *)&buf[18] = 2112;
                            *(_QWORD *)&buf[20] = v99;
                            *(_WORD *)&buf[28] = 2112;
                            *(_QWORD *)&buf[30] = v32;
                            *(_WORD *)&buf[38] = 2112;
                            *(_QWORD *)&buf[40] = v31;
                            _os_log_error_impl(&dword_2167BD000, v80, OS_LOG_TYPE_ERROR, "Key already used, cannot be re-attested. { keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x30u);
                          }

                          createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 257, -3, 0, CFSTR("Key already used, cannot be reattested."), v81, v82, v83, v97);
                          v54 = (id)objc_claimAutoreleasedReturnValue();

                          v105 = 0;
                          v56 = v99;
                          v55 = v102;
LABEL_21:
                          v101 = v55;
                          if (v54)
                          {
                            _DCAALogSystem();
                            v58 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                              AppAttest_AppAttestation_AttestKey_cold_1(v58, v59, v60, v61, v62, v63, v64, v65);

                            _DCAALogSystem();
                            v66 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                              AppAttest_AppAttestation_AttestKey_cold_2(v54);

                            v12[2](v12, 0, v54);
                            if (!v57)
                              goto LABEL_28;
                          }
                          else
                          {
                            v98 = dispatch_semaphore_create(0);
                            v106[0] = MEMORY[0x24BDAC760];
                            v106[1] = 3221225472;
                            v106[2] = __AppAttest_AppAttestation_AttestKey_block_invoke;
                            v106[3] = &unk_24D595B98;
                            v115 = EnvironmentByAppSigning;
                            v107 = v10;
                            v108 = v55;
                            v109 = v56;
                            v110 = v32;
                            v111 = v31;
                            v112 = v105;
                            v113 = v98;
                            v114 = v12;
                            v67 = v98;
                            v54 = 0;
                            AppAttest_Common_AttestKey(0, EnvironmentByAppSigning, v110, v57, v112, v11, v106);
                            dispatch_semaphore_wait(v67, 0xFFFFFFFFFFFFFFFFLL);

                            if (!v57)
                              goto LABEL_28;
                          }
                          CFRelease(v57);
LABEL_28:

                          v46 = v105;
                          goto LABEL_29;
                        }
                        v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", 0);

                        v116 = v104;
                        v103 = v84;
                        createAppAttestationAuthenticatorDataFull(EnvironmentByAppSigning, v32, v84, v57, &v116);
                        v85 = objc_claimAutoreleasedReturnValue();
                        v54 = v116;

                        v105 = v85;
                        if (!v85)
                        {
                          v86 = v54;
                          _DCAALogSystem();
                          v87 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                          {
                            v96 = objc_msgSend(v103, "intValue");
                            *(_DWORD *)buf = 67110402;
                            *(_DWORD *)&buf[4] = EnvironmentByAppSigning;
                            *(_WORD *)&buf[8] = 2112;
                            *(_QWORD *)&buf[10] = v10;
                            *(_WORD *)&buf[18] = 1024;
                            *(_DWORD *)&buf[20] = v96;
                            *(_WORD *)&buf[24] = 2112;
                            *(_QWORD *)&buf[26] = v99;
                            *(_WORD *)&buf[34] = 2112;
                            *(_QWORD *)&buf[36] = v32;
                            *(_WORD *)&buf[44] = 2112;
                            *(_QWORD *)&buf[46] = v31;
                            _os_log_error_impl(&dword_2167BD000, v87, OS_LOG_TYPE_ERROR, "Failed to create authenticator data for attestation. { env=%d, keyID=%@, counter=%d, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x36u);
                          }

                          createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 268, -3, v86, CFSTR("Failed to generate authenticator data"), v88, v89, v90, v97);
                          v54 = (id)objc_claimAutoreleasedReturnValue();

                          v105 = 0;
                        }
                        v55 = v103;
LABEL_47:
                        v56 = v99;
                        goto LABEL_21;
                      }
                      _DCAALogSystem();
                      v91 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67110146;
                        *(_DWORD *)&buf[4] = EnvironmentByAppSigning;
                        *(_WORD *)&buf[8] = 2112;
                        *(_QWORD *)&buf[10] = v10;
                        *(_WORD *)&buf[18] = 2112;
                        *(_QWORD *)&buf[20] = v99;
                        *(_WORD *)&buf[28] = 2112;
                        *(_QWORD *)&buf[30] = v32;
                        *(_WORD *)&buf[38] = 2112;
                        *(_QWORD *)&buf[40] = v31;
                        _os_log_error_impl(&dword_2167BD000, v91, OS_LOG_TYPE_ERROR, "Failed to load BIK from Keychain. { env=%d, keyID=%@, appUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x30u);
                      }

                      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 250, -3, 0, CFSTR("Failed to load keychain"), v92, v93, v94, v97);
                      v54 = (id)objc_claimAutoreleasedReturnValue();

LABEL_46:
                      v55 = 0;
                      v105 = 0;
                      v57 = 0;
                      goto LABEL_47;
                    }
                  }
                  _DCAALogSystem();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    AppAttest_AppAttestation_AttestKey_cold_5(v11);

                  v43 = CFSTR("Invalid clientDataHash");
                  v44 = 242;
                  v45 = 0;
                }
                else
                {
                  _DCAALogSystem();
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                    AppAttest_AppAttestation_AttestKey_cold_4();

                  v43 = CFSTR("Invalid keyId");
                  v44 = 236;
                  v45 = v33;
                }
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", v44, -2, v45, v43, v40, v41, v42, v97);
                v54 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_46;
              }
              _DCAALogSystem();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v9;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v32;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)&buf[24] = v31;
                _os_log_error_impl(&dword_2167BD000, v75, OS_LOG_TYPE_ERROR, "Failed resolved App UUID. { incomingAppUUID=%@, resolvedAppID=%@, realAppID=%@ }", buf, 0x20u);
              }

              v72 = CFSTR("Invalid appUUID");
              v73 = 230;
              v74 = 0;
            }
            else
            {
              _DCAALogSystem();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                AppAttest_AppAttestation_AttestKey_cold_6(v33);

              v72 = CFSTR("Unable to fetch application identifier");
              v73 = 223;
              v74 = v33;
            }
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", v73, -2, v74, v72, v69, v70, v71, v97);
            v54 = (id)objc_claimAutoreleasedReturnValue();

            v55 = 0;
            v105 = 0;
            v57 = 0;
          }
          else
          {
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 213, -4, 0, CFSTR("Application not eligible"), v25, v26, v27, v97);
            v54 = (id)objc_claimAutoreleasedReturnValue();

            EnvironmentByAppSigning = 0;
            v32 = 0;
            v31 = 0;
            v105 = 0;
            v57 = 0;
            v55 = 0;
          }
          v56 = 0;
          goto LABEL_21;
        }
        EnvironmentByAppSigning = 0;
        v55 = 0;
        v32 = 0;
        v31 = 0;
        v56 = 0;
        v105 = 0;
        v54 = v23;
LABEL_20:
        v57 = 0;
        goto LABEL_21;
      }
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 203, -4, v17, CFSTR("Client is not supported."), v18, v19, v20, v97);
      v54 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_AttestKey", 198, -4, 0, CFSTR("Not supported"), v13, v14, v15, v97);
      v54 = (id)objc_claimAutoreleasedReturnValue();
    }
    EnvironmentByAppSigning = 0;
    v55 = 0;
    v32 = 0;
    v31 = 0;
    v56 = 0;
    v105 = 0;
    goto LABEL_20;
  }
  _DCAALogSystem();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    AppAttest_AppAttestation_AttestKey_cold_1(v46, v47, v48, v49, v50, v51, v52, v53);
LABEL_29:

}

void AppAttest_AppAttestation_Assert(_OWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  __CFString *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  int EnvironmentByAppSigning;
  __int128 v65;
  char v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __SecKey *CredentialKeychain;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __SecKey *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  __CFString *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  void *v103;
  void *v104;
  __SecKey *cf;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[16];
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    v102 = v9;
    v103 = v11;
    v104 = v10;
    if (os_variant_allows_internal_security_policies())
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("__debug_aa_kc_cleanup__")))
      {
        removeAllKeychainItemsForMissingApps();
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("__debug_aa_kc_list__")))
      {
        listKeychainItems();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v114;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v114 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v25);
              _DCAALogSystem();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v26;
                _os_log_debug_impl(&dword_2167BD000, v27, OS_LOG_TYPE_DEBUG, "Found app ID in keychain. { appID=%@ }", buf, 0xCu);
              }

              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
          }
          while (v23);
        }
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

        v11 = v103;
        v10 = v104;
      }
    }
    if ((DeviceIdentityIsSupported() & 1) != 0)
    {
      v112 = 0;
      v31 = IsSupportedSPIClient(&v112);
      v32 = v112;
      v36 = v32;
      if ((v31 & 1) != 0)
      {
        v111 = v32;
        v37 = AppAttest_Common_ValidateEntitlements(&v111);
        v38 = v111;

        if (v37)
        {
          isNSData(v11);
          v39 = objc_claimAutoreleasedReturnValue();
          if (!v39 || (v43 = (void *)v39, v44 = objc_msgSend(v11, "length"), v43, v44 >= 0x21))
          {
            v45 = CFSTR("Invalid clientDataHash");
            v46 = 399;
            v47 = -2;
LABEL_24:
            createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", v46, v47, 0, v45, v40, v41, v42, v101);
            v48 = objc_claimAutoreleasedReturnValue();

            v49 = 0;
            v50 = 0;
            v51 = 0;
            v52 = 0;
            v53 = 0;
            v54 = 0;
            v13 = 0;
            v38 = (id)v48;
LABEL_30:
            _DCAALogSystem();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              AppAttest_AppAttestation_Assert_cold_2((uint64_t)v51, v55, v56, v57, v58, v59, v60, v61);

            (*((void (**)(id, void *, id))v12 + 2))(v12, v51, v38);
            v9 = v102;
            v11 = v103;
            v10 = v104;
            goto LABEL_33;
          }
          v62 = a1[1];
          *(_OWORD *)buf = *a1;
          v118 = v62;
          if ((AppAttest_AppAttestation_IsEligibleApplication((__int128 *)buf) & 1) == 0)
          {
            v45 = CFSTR("Application not eligible");
            v46 = 404;
            v47 = -4;
            goto LABEL_24;
          }
          v63 = a1[1];
          *(_OWORD *)buf = *a1;
          v118 = v63;
          EnvironmentByAppSigning = generateEnvironmentByAppSigning(buf);
          v109 = 0;
          v110 = 0;
          v108 = v38;
          v65 = a1[1];
          *(_OWORD *)buf = *a1;
          v118 = v65;
          v66 = extractApplicationIdentifiers(buf, &v110, &v109, &v108);
          v67 = v110;
          v52 = v109;
          v68 = v108;

          if ((v66 & 1) != 0)
          {
            v72 = EnvironmentByAppSigning;
            resolveAppUUIDKeychain(v9, v67, v52);
            v73 = objc_claimAutoreleasedReturnValue();
            if (v73)
            {
              v74 = (void *)v73;
              isNSString(v10);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                CredentialKeychain = (__SecKey *)loadCredentialKeychain(v72, v74, v52, v10);
                if (CredentialKeychain)
                {
                  v82 = CredentialKeychain;
                  loadAssertionCounterKeychain(v72, v74, v52, v10);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  isNSNumber(v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  cf = v82;
                  if (v51)
                  {
                    if (objc_msgSend(v50, "unsignedIntValue") != -1)
                    {
                      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", objc_msgSend(v50, "unsignedIntValue") + 1);
                      v54 = v74;
                      if ((saveAssertionCounterKeychain(v49, v72, v74, v52, v104) & 1) != 0)
                      {
                        v53 = v67;
                        v107 = v68;
                        createAppAttestationAuthenticatorDataShort(v52, v50, &v107);
                        v92 = v68;
                        v13 = objc_claimAutoreleasedReturnValue();
                        v93 = v107;

                        if (v104 && v13)
                        {
                          v97 = v93;
                          v106 = v93;
                          generateAssertionObject(cf, v104, v13, v103, &v106);
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v38 = v106;
LABEL_57:

                          CFRelease(cf);
                          goto LABEL_30;
                        }
                        v97 = v93;
                        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 457, -3, v93, CFSTR("Failed to generate authenticator data"), v94, v95, v96, v101);
                        v38 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v53 = v67;
                        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 450, -3, v68, CFSTR("Unable to update counter for authenticator data"), v89, v90, v91, v101);
                        v97 = v68;
                        v38 = (id)objc_claimAutoreleasedReturnValue();
                        v13 = 0;
                      }
                      v51 = 0;
                      goto LABEL_57;
                    }
                    v54 = v74;
                    v53 = v67;
                    createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 442, -3, 0, CFSTR("Unable to update counter for authenticator data"), v86, v87, v88, v101);
                    v97 = v68;
                    v38 = (id)objc_claimAutoreleasedReturnValue();
                    v13 = 0;
                    v51 = 0;
                  }
                  else
                  {
                    v54 = v74;
                    v53 = v67;
                    createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 436, -3, v68, CFSTR("Key not yet attested"), v83, v84, v85, v101);
                    v97 = v68;
                    v38 = (id)objc_claimAutoreleasedReturnValue();
                    v13 = 0;
                  }
                  v49 = 0;
                  goto LABEL_57;
                }
                v54 = v74;
                v53 = v67;
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 430, -3, 0, CFSTR("Failed to load keychain"), v79, v80, v81, v101);
                v38 = (id)objc_claimAutoreleasedReturnValue();

                v49 = 0;
                v50 = 0;
                v51 = 0;
              }
              else
              {
                v54 = v74;
                v53 = v67;
                createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 424, -2, v68, CFSTR("Invalid keyId"), v75, v76, v77, v101);
                v38 = (id)objc_claimAutoreleasedReturnValue();

                v49 = 0;
                v50 = 0;
              }
LABEL_29:
              v13 = 0;
              goto LABEL_30;
            }
            v53 = v67;
            v98 = CFSTR("Invalid appUUID");
            v99 = 419;
            v100 = 0;
          }
          else
          {
            v53 = v67;
            v98 = CFSTR("Unable to fetch application identifier");
            v99 = 413;
            v100 = v68;
          }
          createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", v99, -2, v100, v98, v69, v70, v71, v101);
          v38 = (id)objc_claimAutoreleasedReturnValue();

          v49 = 0;
          v50 = 0;
          v51 = 0;
LABEL_28:
          v54 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 389, -4, v32, CFSTR("Client is not supported."), v33, v34, v35, v101);
        v38 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      createAppAttestError((uint64_t)"AppAttest_AppAttestation_Assert", 384, -4, 0, CFSTR("Not supported"), v28, v29, v30, v101);
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 0;
    v53 = 0;
    goto LABEL_28;
  }
  _DCAALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    AppAttest_AppAttestation_Assert_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_33:

}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x40u);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 40), "intValue");
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _DCLogDebugBinary_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2167BD000, a2, OS_LOG_TYPE_DEBUG, "**BASE64DATAEND  (%@)**\n", (uint8_t *)&v2, 0xCu);
}

void AppAttest_WebAuthentication_AttestKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "AppAttest_WebAuthentication_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
}

void AppAttest_WebAuthentication_AttestKey_cold_2(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_2167BD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);

}

void resolveAppUUIDKeychain_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "validateAppUUIDKeychain - (%@)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "validateAppUUIDKeychain(deleteMismatch) - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "resolveAppUUIDKeychain - (%@)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - (%@)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - (%@) - exists(%@)\n");
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - invalid input identifiers!\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void resolveAppUUIDKeychain_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - loaded first gen key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void resolveAppUUIDKeychain_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - invalid loaded application identifier / uuid - tampered?\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void resolveAppUUIDKeychain_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - invalid loaded app class - tampered?\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void resolveAppUUIDKeychain_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain -   loaded existing key <- (%@)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void resolveAppUUIDKeychain_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "resolveAppUUIDKeychain - failed or no existing key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void saveAppUUIDKeychain_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "FAILED";
  v5 = 2112;
  v6 = CFSTR("Invalid inputs");
  OUTLINED_FUNCTION_9(&dword_2167BD000, a1, a3, "saveAppUUIDKeychain - (%s) - %@\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void encodeKeyToCOSE_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to fetch data representation of public key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void encodeKeyToCOSE_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to fetch size of public key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void encodeKeyToCOSE_cold_3(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = (int)objc_msgSend(a1, "intValue");
  _os_log_debug_impl(&dword_2167BD000, a2, OS_LOG_TYPE_DEBUG, "Unsupported key coordinate size. { size=%ld }", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_12();
}

void fetchPublicKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Failed to fetch public key from BIK.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void fetchPublicKey_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_debug_impl(&dword_2167BD000, a3, OS_LOG_TYPE_DEBUG, "Failed to fetch data representation of public key. { error=%@ }", (uint8_t *)a2, 0xCu);

}

void fetchPublicKey_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Key has invalid properties.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateCOSEForKeySize_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_10();
  v7 = 2048;
  v8 = a2;
  OUTLINED_FUNCTION_9(&dword_2167BD000, a3, v5, "COSE key representation of public key is of unexpected length. { length=%zu, expected=%ld }", v6);
  OUTLINED_FUNCTION_12();
}

void generateCOSEForKeySize_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "Cannot generate COSE encoding for key, unsupported coordinate size. { coordinateSize=%ld }", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void generateEnvironmentByAppSigning_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment override disabled\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment override -> production\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment override -> development\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment override -> invalid value, not touched\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment detected as: Enterprise\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment detected as: Testflight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment detected as: FreeDev, Dev", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void generateEnvironmentByAppSigning_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Environment detected as: Store, Adhoc, Internal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "   Overriding: (%@)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void resolveAppAttestApplicationIdentifiersForApplicationRecord_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_2167BD000, v0, v1, "Original Clip: (%@)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void extractApplicationIdentifiers_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2(&dword_2167BD000, (uint64_t)a2, a3, "Extracted application identifiers for daemon client connection. { realApplicationIdentifier=%@, resolvedApplicationIdentifier=%@ }", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_8();
}

void extractApplicationIdentifiers_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Connecting application identifier check is disabled, not comparing self identifier to connection identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void saveCredentialKeychain_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "saveCredentialKeychain - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void loadCredentialKeychain_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "loadCredentialKeychain - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void deleteCredentialKeychainWithLabel_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "deleteCredentialKeychainWithLabel - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void saveAssertionCounterKeychain_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "saveAssertionCounterKeychain - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void loadAssertionCounterKeychain_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "loadAssertionCounterKeychain - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void deleteAssertionCounterKeychainWithLabel_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2167BD000, v0, v1, "deleteAssertionCounterKeychainWithLabel - (%s) - %@\n");
  OUTLINED_FUNCTION_8();
}

void getApplicationIdentifierHashFromKeychainLabel_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2167BD000, v0, OS_LOG_TYPE_ERROR, "Error getting app identifier from keychain label – not enough components", v1, 2u);
  OUTLINED_FUNCTION_6();
}

void getAllAppUUIDKeychainLabels_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_11(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2167BD000, v2, (uint64_t)v2, "    Invalid appUUID found, skipping\n", v3);
}

void getAllAppUUIDKeychainLabels_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "  Valid appUUIDs\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void removeAllKeychainItemsForMissingApps_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "  Cleaning getAllAssertionCounterKeychainLabels\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void removeAllKeychainItemsForMissingApps_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "  Cleaning getAllCredentialKeychainLabels\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void listOfInstalledAppHashes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "  Installed apps\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void listOfInstalledExtensionHashes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "  Installed extensions\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_11(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2167BD000, v2, (uint64_t)v2, "        App no longer installed - adding to remove list\n", v3);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_11(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2167BD000, v2, (uint64_t)v2, "        AppUUID not current - adding to remove list\n", v3);
}

void __removeAllKeychainItemsForMissingApps_block_invoke_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_11(a1, a2);
  OUTLINED_FUNCTION_1(&dword_2167BD000, v2, (uint64_t)v2, "        App still installed, AppUUID current - keeping\n", v3);
}

void AppAttest_DeviceAttestation_AttestKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "AppAttest_DeviceAttestation_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Client is an eligible application.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Client is an eligible daemon.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Client is an eligible application extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void AppAttest_AppAttestation_IsEligibleApplication_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_2167BD000, v0, v1, "Client is of ineligible type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void AppAttest_AppAttestation_CreateKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "AppAttest_AppAttestation_CreateKey - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void AppAttest_AppAttestation_CreateKey_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a2, a3, "AppAttest_AppAttestation_CreateKey - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void IsSupportedSPIClient_cold_1(void *a1)
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_2167BD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%@", v2, 0xCu);

  OUTLINED_FUNCTION_12();
}

void AppAttest_AppAttestation_AttestKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "AppAttest_AppAttestation_AttestKey - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void AppAttest_AppAttestation_AttestKey_cold_2(void *a1)
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
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_0(&dword_2167BD000, v2, v3, "Key attestation failed. { error=%@ }", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void AppAttest_AppAttestation_AttestKey_cold_4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_2167BD000, v0, OS_LOG_TYPE_ERROR, "Key ID is invalid. { keyID=%@ }", v1, 0xCu);
  OUTLINED_FUNCTION_8();
}

void AppAttest_AppAttestation_AttestKey_cold_5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_0(&dword_2167BD000, v2, v3, "Invalid client data hash. { clientDataHash=%@ }", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void AppAttest_AppAttestation_AttestKey_cold_6(void *a1)
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
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6_0(&dword_2167BD000, v2, v3, "Failed to fetch identifiers. { error=%@ }", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void AppAttest_AppAttestation_Assert_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a1, a3, "AppAttest_AppAttestation_Assert - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void AppAttest_AppAttestation_Assert_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2167BD000, a2, a3, "AppAttest_AppAttestation_Assert - (%s)\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x24BE04650]();
}

uint64_t DeviceIdentityCopyAttestationDictionary()
{
  return MEMORY[0x24BE2C360]();
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x24BE2C370]();
}

uint64_t DeviceIdentityUCRTAttestationSupported()
{
  return MEMORY[0x24BE2C380]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B30](table);
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x24BDE8790]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x24BDE87C8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x24BDE8A98](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x24BDE8C20]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

