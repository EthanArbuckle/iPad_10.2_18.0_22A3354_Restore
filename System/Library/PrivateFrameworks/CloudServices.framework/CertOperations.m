@implementation CertOperations

+ (id)certVersion:(__SecCertificate *)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  char isEqualToString;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  int v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = (id)SecCertificateCopyProperties();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v41, v46, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v42;
    v9 = &unk_24C75EB48;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v8)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
      objc_msgSend_objectForKeyedSubscript_(v11, v6, (uint64_t)CFSTR("label"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("Issuer Name"));

      if ((isEqualToString & 1) != 0)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v41, v46, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
    v15 = v11;

    if (!v15)
    {
      v9 = &unk_24C75EB48;
      goto LABEL_27;
    }
    objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)CFSTR("value"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, v45, 16);
    if (v19)
    {
      v21 = v19;
      v35 = v15;
      v22 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v24, v20, (uint64_t)CFSTR("label"), v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("2.5.4.5"));

          if (v27)
          {
            objc_msgSend_objectForKeyedSubscript_(v24, v20, (uint64_t)CFSTR("value"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_alloc(MEMORY[0x24BDD17A8]);
            v31 = (void *)objc_msgSend_initWithString_(v29, v30, (uint64_t)v28);
            v36 = 0;
            objc_msgSend_scanUnsignedLongLong_(v31, v32, (uint64_t)&v36);
            objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v33, v36);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v35;
            goto LABEL_24;
          }
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v37, v45, 16);
        if (v21)
          continue;
        break;
      }
      v15 = v35;
    }
    v9 = &unk_24C75EB48;
LABEL_24:

  }
  else
  {
    v9 = &unk_24C75EB48;
LABEL_22:
    v15 = v3;
  }

LABEL_27:
  return v9;
}

+ (id)rootBaseVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D6906E4(a3, v10, v11, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v15);
        objc_msgSend_certVersion_(a1, v18, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
    }
    while (v20);
  }
  objc_msgSend_allObjects(v14, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)rootTrustedVersionsForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5 duplicate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D6906E4(a3, v10, v11, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v15);
        objc_msgSend_certVersion_(a1, v18, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
    }
    while (v20);
  }
  objc_msgSend_allObjects(v14, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)rootCurrentVersionForRootType:(unsigned int)a3 altDSID:(id)a4 inEnvironment:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootTrustedVersionsForRootType_altDSID_inEnvironment_duplicate_(a1, v12, v6, v8, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v31, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v22 = objc_msgSend_unsignedLongLongValue(v21, v16, v17);
        if (v22 > objc_msgSend_unsignedLongLongValue(v11, v23, v24))
        {
          v25 = v21;

          v11 = v25;
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  return v11;
}

+ (BOOL)verifyCertData:(id)a3 withCert:(__SecCertificate *)a4 withPubKey:(__SecKey *)a5 stingray:(BOOL)a6 enroll:(BOOL)a7 altDSID:(id)a8 env:(id)a9 duplicate:(BOOL)a10 sigVerification:(BOOL)a11 error:(id *)a12
{
  _BOOL4 v12;
  _BOOL4 v13;
  id v17;
  id v18;
  int v19;
  const void **v20;
  int v21;
  const void **v22;
  unsigned int v23;
  const void **v24;
  const void *v25;
  SecCertificateRef v26;
  const char *v27;
  __SecCertificate *v28;
  void *v29;
  SecPolicyRef v30;
  const char *v31;
  SecPolicyRef v32;
  OSStatus v33;
  const char *v34;
  __CFError *v35;
  __CFError *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  const __CFArray *v41;
  NSObject *v42;
  NSObject *v43;
  BOOL v44;
  const __CFArray *v46;
  const char *v47;
  OSStatus v48;
  const char *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  const char *v53;
  __SecKey *v54;
  const char *v55;
  NSObject *v56;
  __CFError *v57;
  _BOOL4 v58;
  CFErrorRef error;
  SecTrustRef trust;
  SecCertificateRef v61;
  uint8_t buf[4];
  CFErrorRef v63;
  uint64_t v64;

  v12 = a7;
  v13 = a6;
  v64 = *MEMORY[0x24BDAC8D0];
  v17 = a8;
  v18 = a9;
  error = 0;
  trust = 0;
  if (v12)
    v19 = 7;
  else
    v19 = 5;
  v20 = (const void **)MEMORY[0x24BDE9420];
  if (v13)
  {
    v19 = 3;
    v20 = (const void **)MEMORY[0x24BDE9430];
    v21 = 3;
  }
  else
  {
    v21 = 5;
  }
  v22 = (const void **)MEMORY[0x24BDE9428];
  if (v13)
    v22 = (const void **)MEMORY[0x24BDE9438];
  if (a11)
    v23 = v21;
  else
    v23 = v19;
  if (a11)
    v24 = v22;
  else
    v24 = v20;
  v25 = *v24;
  v26 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)a3);
  v28 = v26;
  if (!v26)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v27, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 112, CFSTR("Error creating SecCertificateRef"));
    v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    sub_20D67C0DC();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v36;
      _os_log_impl(&dword_20D67A000, v42, OS_LOG_TYPE_DEFAULT, "Unable to create SecCertificateRef from response data: %@", buf, 0xCu);
    }

    v29 = 0;
    goto LABEL_28;
  }
  v61 = v26;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v27, (uint64_t)&v61, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = SecPolicyCreateWithProperties(v25, 0);
  if (!v30)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v31, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 113, CFSTR("Error copying escrow trust policy"));
    v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    sub_20D67C0DC();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D67A000, v43, OS_LOG_TYPE_DEFAULT, "Error copying escrow trust policy", buf, 2u);
    }

LABEL_28:
    v41 = 0;
    v32 = 0;
    goto LABEL_29;
  }
  v32 = v30;
  v33 = SecTrustCreateWithCertificates(v29, v30, &trust);
  if (v33)
  {
    v35 = (__CFError *)v33;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v34, *MEMORY[0x24BDD1100], v33, 0);
    v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    sub_20D67C0DC();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      v41 = 0;
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    v63 = v35;
    v38 = "SecTrustCreateWithCertificates failed: %ld";
    v39 = v37;
    v40 = 12;
LABEL_20:
    _os_log_impl(&dword_20D67A000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
    goto LABEL_21;
  }
  sub_20D6906E4(v23, v17, v18, a10);
  v46 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v47, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 114, CFSTR("Error copying root cert array"));
    v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
    sub_20D67C0DC();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v38 = "Error copying root cert array";
    v39 = v37;
    v40 = 2;
    goto LABEL_20;
  }
  v41 = v46;
  v48 = SecTrustSetAnchorCertificates(trust, v46);
  if (!v48)
  {
    v58 = SecTrustEvaluateWithError(trust, &error);
    sub_20D67C0DC();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "false";
      if (v58)
        v53 = "true";
      *(_DWORD *)buf = 136315138;
      v63 = (CFErrorRef)v53;
      _os_log_impl(&dword_20D67A000, v52, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateWithError() trust result = %s", buf, 0xCu);
    }

    if (v58)
    {
      if (a5)
      {
        v54 = SecTrustCopyKey(trust);
        if (v54)
        {
          v36 = 0;
          *a5 = v54;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v55, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 115, CFSTR("Unable to extract public key"));
          v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
          sub_20D67C0DC();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D67A000, v56, OS_LOG_TYPE_DEFAULT, "Error extracting public key from certificate", buf, 2u);
          }

        }
      }
      else
      {
        v36 = 0;
      }
      v44 = 1;
      if (a12)
        goto LABEL_30;
      goto LABEL_31;
    }
    v36 = error;
    sub_20D67C0DC();
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_58;
    *(_DWORD *)buf = 138412290;
    v63 = error;
    v51 = "SecTrustEvaluate failed: %@";
    goto LABEL_57;
  }
  v57 = (__CFError *)v48;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v49, *MEMORY[0x24BDD1100]);
  v36 = (__CFError *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = v57;
    v51 = "SecTrustSetAnchorCertificates failed: %ld";
LABEL_57:
    _os_log_impl(&dword_20D67A000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
  }
LABEL_58:

LABEL_29:
  v44 = 0;
  if (a12)
LABEL_30:
    *a12 = objc_retainAutorelease(v36);
LABEL_31:
  if (a4 && v28)
  {
    *a4 = v28;
  }
  else if (v28)
  {
    CFRelease(v28);
  }
  if (v32)
    CFRelease(v32);
  if (trust)
  {
    CFRelease(trust);
    trust = 0;
  }

  return v44;
}

+ (void)storeTerms:(id)a3 withAltDSID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id);
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char isEqualToString;
  StoredTermsInfo *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[8];

  v48[6] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  objc_msgSend_altDSID(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12);

  if ((isEqualToString & 1) == 0)
    sub_20D696854();
  v15 = objc_alloc_init(StoredTermsInfo);
  objc_msgSend_setStorageVersion_(v15, v16, 1);
  objc_msgSend_setTermsInfo_(v15, v17, (uint64_t)v7);
  v18 = *MEMORY[0x24BDE9230];
  v19 = *MEMORY[0x24BDE9140];
  v47[0] = *MEMORY[0x24BDE9220];
  v47[1] = v19;
  v20 = *MEMORY[0x24BDBD270];
  v48[0] = v18;
  v48[1] = v20;
  v21 = *MEMORY[0x24BDE8F68];
  v22 = *MEMORY[0x24BDE8F50];
  v47[2] = *MEMORY[0x24BDE8F60];
  v47[3] = v22;
  v48[2] = v21;
  v48[3] = CFSTR("com.apple.sbd");
  v23 = *MEMORY[0x24BDE8FA8];
  v47[4] = *MEMORY[0x24BDE9128];
  v47[5] = v23;
  v48[4] = CFSTR("SecureBackupTerms");
  v48[5] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v48, v47, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x24BDE9550];
  objc_msgSend_data(v15, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v28;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)&v46, &v45, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v31 = sub_20D690100(v25, v30, &v40);
  v32 = v40;
  sub_20D67C0DC();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D67A000, v33, OS_LOG_TYPE_DEFAULT, "Successfully stored terms", buf, 2u);
    }
    v35 = 0;
    goto LABEL_10;
  }
  if (v34)
  {
    *(_DWORD *)buf = 138412290;
    v44 = v32;
    _os_log_impl(&dword_20D67A000, v33, OS_LOG_TYPE_DEFAULT, "Failed to store terms: %@", buf, 0xCu);
  }

  v37 = v32;
  if (!v32)
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42 = CFSTR("unknown error");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v36, (uint64_t)&v42, &v41, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v38, v39, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 1, v33);
    v35 = objc_claimAutoreleasedReturnValue();
    v32 = (id)v35;
LABEL_10:
    v37 = v32;

    v32 = (id)v35;
  }
  v9[2](v9, v32);

}

+ (void)fetchTermsWithAltDSID:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  OSStatus v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  CFIndex Count;
  id v28;
  const char *v29;
  CFIndex i;
  void *v31;
  StoredTermsInfo *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  CFArrayRef theArray;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[7];
  _QWORD v43[8];

  v43[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v7 = *MEMORY[0x24BDE9230];
  v8 = *MEMORY[0x24BDE9140];
  v42[0] = *MEMORY[0x24BDE9220];
  v42[1] = v8;
  v43[0] = v7;
  v43[1] = MEMORY[0x24BDBD1C8];
  v9 = *MEMORY[0x24BDE8F68];
  v10 = *MEMORY[0x24BDE8F50];
  v42[2] = *MEMORY[0x24BDE8F60];
  v42[3] = v10;
  v43[2] = v9;
  v43[3] = CFSTR("com.apple.sbd");
  v11 = *MEMORY[0x24BDE94C8];
  v42[4] = *MEMORY[0x24BDE9128];
  v42[5] = v11;
  v43[4] = CFSTR("SecureBackupTerms");
  v43[5] = MEMORY[0x24BDBD1C8];
  v42[6] = *MEMORY[0x24BDE93B0];
  v43[6] = *MEMORY[0x24BDE93B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v43, v42, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_mutableCopy(v13, v14, v15);

  if (v5)
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v5, *MEMORY[0x24BDE8FA8]);
  theArray = 0;
  v18 = SecItemCopyMatching((CFDictionaryRef)v16, (CFTypeRef *)&theArray);
  if (v18)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD1100];
    v22 = v18;
    v40 = *MEMORY[0x24BDD0FC8];
    v41 = CFSTR("Unable to find terms in keychain");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v41, &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v24, v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
  }
  else
  {
    Count = CFArrayGetCount(theArray);
    v28 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v26 = (void *)objc_msgSend_initWithCapacity_(v28, v29, Count);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(theArray, i);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = [StoredTermsInfo alloc];
        v34 = (void *)objc_msgSend_initWithData_(v32, v33, (uint64_t)v31);
        objc_msgSend_termsInfo(v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v26, v38, (uint64_t)v37);

      }
    }
    if (theArray)
    {
      CFRelease(theArray);
      v25 = 0;
      theArray = 0;
    }
    else
    {
      v25 = 0;
    }
  }
  v6[2](v6, v26, v25);

}

+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v5 = a4;
  v8 = objc_msgSend_integerValue(a3, v6, v7);
  v9 = (unint64_t)(v8 - 101) < 3 || v8 == 310 && sub_20D691A5C(v5);

  return v9;
}

+ (id)knownICDPFederations
{
  id v2;
  uint64_t i;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 16; i += 4)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v6 = (void *)objc_msgSend_initWithFormat_(v4, v5, (uint64_t)CFSTR("%d"), dword_24C75A498[i]);
    objc_msgSend_addObject_(v2, v7, (uint64_t)v6);

  }
  return v2;
}

@end
