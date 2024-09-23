@implementation MSPUGCFetchClientCertificate

void __MSPUGCFetchClientCertificate_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  void *v31;
  id *v32;
  void *v33;
  id v34;
  void *v35;
  id *v36;
  void *v37;
  id v38;
  void *v39;
  id *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 buf;
  uint64_t v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v54 = 0x2020000000;
    v4 = (id *)qword_1ED3283B0;
    v55 = (void *)qword_1ED3283B0;
    if (!qword_1ED3283B0)
    {
      v5 = (void *)DeviceIdentityLibrary();
      v4 = (id *)dlsym(v5, "kMAOptionsBAAKeychainLabel");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v4;
      qword_1ED3283B0 = (uint64_t)v4;
    }
    _Block_object_dispose(&buf, 8);
    if (!v4)
      goto LABEL_48;
    v6 = *v4;
    objc_msgSend(v2, "setObject:forKey:", v3, v6);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v8 = (id *)qword_1ED3283D0;
  v55 = (void *)qword_1ED3283D0;
  if (!qword_1ED3283D0)
  {
    v9 = (void *)DeviceIdentityLibrary();
    v8 = (id *)dlsym(v9, "kMAOptionsBAAOIDHardwareProperties");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v8;
    qword_1ED3283D0 = (uint64_t)v8;
  }
  _Block_object_dispose(&buf, 8);
  if (!v8)
    goto LABEL_48;
  v10 = *v8;
  objc_msgSend(v7, "addObject:", v10);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v11 = (id *)qword_1ED3283D8;
  v55 = (void *)qword_1ED3283D8;
  if (!qword_1ED3283D8)
  {
    v12 = (void *)DeviceIdentityLibrary();
    v11 = (id *)dlsym(v12, "kMAOptionsBAAOIDKeyUsageProperties");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
    qword_1ED3283D8 = (uint64_t)v11;
  }
  _Block_object_dispose(&buf, 8);
  if (!v11)
  {
LABEL_48:
    dlerror();
    abort_report_np();
LABEL_49:
    dlerror();
    abort_report_np();
    goto LABEL_55;
  }
  v13 = *v11;
  objc_msgSend(v7, "addObject:", v13);

  if (!*(_QWORD *)(a1 + 40) || !GEOConfigGetBOOL())
    goto LABEL_25;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") < 0x20)
  {
    v16 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v54 = 0x2020000000;
    v17 = (id *)qword_1ED3283B8;
    v55 = (void *)qword_1ED3283B8;
    if (!qword_1ED3283B8)
    {
      v18 = (void *)DeviceIdentityLibrary();
      v17 = (id *)dlsym(v18, "kMAOptionsBAANonce");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v17;
      qword_1ED3283B8 = (uint64_t)v17;
    }
    _Block_object_dispose(&buf, 8);
    if (v17)
    {
      v19 = *v17;
      objc_msgSend(v2, "setObject:forKey:", v16, v19);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v54 = 0x2020000000;
      v20 = (id *)qword_1ED3283C0;
      v55 = (void *)qword_1ED3283C0;
      if (!qword_1ED3283C0)
      {
        v21 = (void *)DeviceIdentityLibrary();
        v20 = (id *)dlsym(v21, "kMAOptionsBAAOIDNonce");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v20;
        qword_1ED3283C0 = (uint64_t)v20;
      }
      _Block_object_dispose(&buf, 8);
      if (v20)
      {
        v22 = *v20;
        objc_msgSend(v7, "addObject:", v22);

        goto LABEL_25;
      }
    }
    goto LABEL_48;
  }
  MSPGetUGCBAAUtilitiesLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "length");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_ERROR, "Nonce data exceeds 32 byte limit.  Nonce data is %lu bytes long", (uint8_t *)&buf, 0xCu);
  }

LABEL_25:
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v23 = off_1ED328398;
  v55 = off_1ED328398;
  if (!off_1ED328398)
  {
    v24 = (void *)DeviceIdentityLibrary();
    v23 = dlsym(v24, "DeviceIdentityUCRTAttestationSupported");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v23;
    off_1ED328398 = v23;
  }
  _Block_object_dispose(&buf, 8);
  if (!v23)
    goto LABEL_49;
  v25 = ((uint64_t (*)(void))v23)();
  if ((v25 & 1) == 0)
  {
    MSPGetUGCBAAUtilitiesLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B39C0000, v26, OS_LOG_TYPE_ERROR, "Device doesn't support UCRT attestation, use SCRT attestation instead", (uint8_t *)&buf, 2u);
    }

  }
  v27 = (void *)objc_msgSend(v7, "copy");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v28 = (id *)qword_1ED3283C8;
  v55 = (void *)qword_1ED3283C8;
  if (!qword_1ED3283C8)
  {
    v29 = (void *)DeviceIdentityLibrary();
    v28 = (id *)dlsym(v29, "kMAOptionsBAAOIDSToInclude");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v28;
    qword_1ED3283C8 = (uint64_t)v28;
  }
  _Block_object_dispose(&buf, 8);
  if (!v28)
    goto LABEL_49;
  v30 = *v28;
  objc_msgSend(v2, "setObject:forKey:", v27, v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v32 = (id *)qword_1ED3283A0;
  v55 = (void *)qword_1ED3283A0;
  if (!qword_1ED3283A0)
  {
    v33 = (void *)DeviceIdentityLibrary();
    v32 = (id *)dlsym(v33, "kMAOptionsResuseExistingKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v32;
    qword_1ED3283A0 = (uint64_t)v32;
  }
  _Block_object_dispose(&buf, 8);
  if (!v32)
    goto LABEL_49;
  v34 = *v32;
  objc_msgSend(v2, "setObject:forKey:", v31, v34);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v36 = (id *)qword_1ED3283A8;
  v55 = (void *)qword_1ED3283A8;
  if (!qword_1ED3283A8)
  {
    v37 = (void *)DeviceIdentityLibrary();
    v36 = (id *)dlsym(v37, "kMAOptionsBAAValidity");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v36;
    qword_1ED3283A8 = (uint64_t)v36;
  }
  _Block_object_dispose(&buf, 8);
  if (!v36)
    goto LABEL_49;
  v38 = *v36;
  objc_msgSend(v2, "setObject:forKey:", v35, v38);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25 ^ 1u);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v40 = (id *)qword_1ED3283E0;
  v55 = (void *)qword_1ED3283E0;
  if (!qword_1ED3283E0)
  {
    v41 = (void *)DeviceIdentityLibrary();
    v40 = (id *)dlsym(v41, "kMAOptionsBAASCRTAttestation");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v40;
    qword_1ED3283E0 = (uint64_t)v40;
  }
  _Block_object_dispose(&buf, 8);
  if (!v40)
    goto LABEL_49;
  v42 = *v40;
  objc_msgSend(v2, "setObject:forKey:", v39, v42);

  v43 = *(void **)(a1 + 48);
  v44 = (void *)objc_msgSend(v2, "copy");
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __MSPUGCFetchClientCertificate_block_invoke_19;
  v50[3] = &unk_1E66522B0;
  v52 = *(id *)(a1 + 64);
  v51 = *(id *)(a1 + 56);
  v45 = v43;
  v46 = v44;
  v47 = v50;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v48 = _MergedGlobals_38;
  v55 = _MergedGlobals_38;
  if (!_MergedGlobals_38)
  {
    v49 = (void *)DeviceIdentityLibrary();
    v48 = dlsym(v49, "DeviceIdentityIssueClientCertificateWithCompletion");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v48;
    _MergedGlobals_38 = v48;
  }
  _Block_object_dispose(&buf, 8);
  if (!v48)
  {
    dlerror();
    abort_report_np();
LABEL_55:
    __break(1u);
  }
  ((void (*)(id, id, _QWORD *))v48)(v45, v46, v47);

}

void __MSPUGCFetchClientCertificate_block_invoke_19(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __CFError *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  uint64_t v19;
  void *v20;
  CFDataRef v21;
  CFDataRef v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  CFDataRef Signature;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  _BYTE v34[22];
  CFErrorRef error[3];

  error[2] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    MSPGetUGCBAAUtilitiesLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = v8;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_ERROR, "Failed certificate request with error %@", v34, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (__CFError *)*MEMORY[0x1E0CB3388];
    error[0] = *(CFErrorRef *)MEMORY[0x1E0CB2D50];
    error[1] = v12;
    *(_QWORD *)v34 = CFSTR("Failed certificate request");
    *(_QWORD *)&v34[8] = v8;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v8;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v34, error, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("UGCBAAErrorDomain"), -3, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v16);
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v7 && objc_msgSend(v7, "count") == 2)
    {
      if (objc_msgSend(v7, "count"))
      {
        v18 = 0;
        v19 = 0;
        while (1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = SecCertificateCopyData((SecCertificateRef)v20);
          if (!v21)
            break;
          v22 = v21;
          objc_msgSend(v17, "addObject:", v21);
          if (v19 == objc_msgSend(v7, "count") - 1)
            v18 = 1;

          if (++v19 >= (unint64_t)objc_msgSend(v7, "count"))
          {
            v16 = 0;
            if ((v18 & 1) == 0)
              goto LABEL_18;
            goto LABEL_25;
          }
        }
        v27 = (void *)MEMORY[0x1E0CB35C8];
        error[0] = *(CFErrorRef *)MEMORY[0x1E0CB2D50];
        *(_QWORD *)v34 = CFSTR("Certificate is nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, error, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("UGCBAAErrorDomain"), -4, v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        MSPGetUGCBAAUtilitiesLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v34 = 134218242;
          *(_QWORD *)&v34[4] = v19;
          *(_WORD *)&v34[12] = 2112;
          *(_QWORD *)&v34[14] = v16;
          _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_ERROR, "Failed to create data from certificate at index %lu with error %@", v34, 0x16u);
        }

        if ((v18 & 1) != 0)
        {
LABEL_25:
          error[0] = 0;
          Signature = SecKeyCreateSignature(a2, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], *(CFDataRef *)(a1 + 32), error);
          if (a2)
            CFRelease(a2);
          if (Signature)
          {
            v31 = *(_QWORD *)(a1 + 40);
            v32 = (void *)objc_msgSend(v17, "copy");
            (*(void (**)(uint64_t, void *, CFDataRef, _QWORD))(v31 + 16))(v31, v32, Signature, 0);

          }
          else
          {
            MSPGetUGCBAAUtilitiesLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v34 = 138412290;
              *(_QWORD *)&v34[4] = 0;
              _os_log_impl(&dword_1B39C0000, v33, OS_LOG_TYPE_ERROR, "Unable to create signature with error %@", v34, 0xCu);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          }

          goto LABEL_19;
        }
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      error[0] = *(CFErrorRef *)MEMORY[0x1E0CB2D50];
      *(_QWORD *)v34 = CFSTR("BAA service did not return enough certificates");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, error, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("UGCBAAErrorDomain"), -5, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      MSPGetUGCBAAUtilitiesLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(v7, "count");
        *(_DWORD *)v34 = 134217984;
        *(_QWORD *)&v34[4] = v26;
        _os_log_impl(&dword_1B39C0000, v25, OS_LOG_TYPE_ERROR, "BAA service did not return enough certificates.  Only returned %lu certificate(s)", v34, 0xCu);
      }

    }
LABEL_18:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

  }
}

@end
