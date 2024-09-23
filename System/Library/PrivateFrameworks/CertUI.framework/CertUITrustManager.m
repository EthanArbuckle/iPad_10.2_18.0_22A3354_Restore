@implementation CertUITrustManager

void __41__CertUITrustManager_defaultTrustManager__block_invoke()
{
  CertUITrustManager *v0;
  void *v1;

  v0 = objc_alloc_init(CertUITrustManager);
  v1 = (void *)defaultTrustManager_sDefaultManager;
  defaultTrustManager_sDefaultManager = (uint64_t)v0;

}

- (CertUITrustManager)initWithAccessGroup:(id)a3
{
  id v4;
  CertUITrustManager *v5;
  uint64_t v6;
  NSString *access;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CertUITrustManager;
  v5 = -[CertUITrustManager init](&v9, sel_init);
  if (v5)
  {
    CertUILoggingInitialize();
    v6 = objc_msgSend(v4, "copy");
    access = v5->_access;
    v5->_access = (NSString *)v6;

  }
  return v5;
}

- (int)actionForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  __SecTrust *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    -[CertUITrustManager _getExceptionsForSSLTrust:hostname:service:](self, "_getExceptionsForSSLTrust:hostname:service:", a3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CertUITrustManager _actionForTrust:exceptions:](self, "_actionForTrust:exceptions:", a3, v11);

  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v17, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

- (int)_actionForTrust:(__SecTrust *)a3 exceptions:(id)a4
{
  int v5;
  int v6;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  SecTrustSetExceptions(a3, (CFDataRef)a4);
  v15 = 0;
  v5 = MEMORY[0x20BD2B2C0](a3, &v15);
  v6 = 0;
  if (!v5)
  {
    switch(v15)
    {
      case 1:
      case 4:
        v8 = _CertUILogObjects;
        v6 = 1;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v17 = v15;
          _os_log_impl(&dword_20AA96000, v8, OS_LOG_TYPE_INFO, "Got SecTrustEvaluate result %u. Allowing.", buf, 8u);
        }
        break;
      case 3:
        v13 = _CertUILogObjects;
        if (!os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
          goto LABEL_11;
        *(_DWORD *)buf = 67109120;
        v17 = v15;
        v10 = "Got SecTrustEvaluate result %u. Denying.";
        v11 = v13;
        v12 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      case 5:
        v14 = _CertUILogObjects;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v17 = v15;
          _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_INFO, "Got SecTrustEvaluate result %u. Need to prompt.", buf, 8u);
        }
        v6 = 2;
        break;
      default:
        v9 = _CertUILogObjects;
        if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v17 = v15;
          v10 = "Don't know how to handle SecTrustEvaluate result %u. Denying";
          v11 = v9;
          v12 = OS_LOG_TYPE_ERROR;
LABEL_10:
          _os_log_impl(&dword_20AA96000, v11, v12, v10, buf, 8u);
        }
LABEL_11:
        v6 = 0;
        break;
    }
  }
  return v6;
}

+ (id)defaultTrustManager
{
  if (defaultTrustManager_onceToken != -1)
    dispatch_once(&defaultTrustManager_onceToken, &__block_literal_global);
  return (id)defaultTrustManager_sDefaultManager;
}

- (CertUITrustManager)init
{
  return -[CertUITrustManager initWithAccessGroup:](self, "initWithAccessGroup:", 0);
}

- (unsigned)_rawTrustResultForTrust:(__SecTrust *)a3 exceptions:(id)a4
{
  unsigned int v6;

  SecTrustSetExceptions(a3, (CFDataRef)a4);
  v6 = 3;
  if (MEMORY[0x20BD2B2C0](a3, &v6))
    return 3;
  else
    return v6;
}

- (id)_getExceptionsForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v9;
  __CFString *v10;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestHostService;
  __CFDictionary *v13;
  void *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  __SecTrust *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (__CFString *)a5;
  if (!a3 || !v9 || SecTrustGetCertificateCount(a3) <= 0)
  {
    v17 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v19;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = a3;
      _os_log_impl(&dword_20AA96000, v18, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v21, 0x20u);

    }
    goto LABEL_10;
  }
  SecTrustGetCertificateAtIndex(a3, 0);
  SHA1Digest = (void *)SecCertificateGetSHA1Digest();
  DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
  if (!DictionaryForDigestHostService
    || (v13 = DictionaryForDigestHostService,
        v14 = (void *)_CopyExceptionsForMutableQuery(DictionaryForDigestHostService),
        CFRelease(v13),
        !v14))
  {
    v15 = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, 0);
    if (v15)
    {
      v16 = v15;
      v14 = (void *)_CopyExceptionsForMutableQuery(v15);
      CFRelease(v16);
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unsigned)rawTrustResultForSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  __SecTrust *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    -[CertUITrustManager _getExceptionsForSSLTrust:hostname:service:](self, "_getExceptionsForSSLTrust:hostname:service:", a3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CertUITrustManager _rawTrustResultForTrust:exceptions:](self, "_rawTrustResultForTrust:exceptions:", a3, v11);

  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v17, 0x20u);

    }
    v12 = 3;
  }

  return v12;
}

- (int)actionForSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  id v7;
  void *v8;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestSender;
  __CFDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __SecTrust *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    if (DictionaryForDigestSender)
    {
      v11 = DictionaryForDigestSender;
      v12 = (void *)_CopyExceptionsForMutableQuery(DictionaryForDigestSender);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    v16 = -[CertUITrustManager _actionForTrust:exceptions:](self, "_actionForTrust:exceptions:", a3, v12);

  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = a3;
      _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v18, 0x20u);

    }
    v16 = 0;
  }

  return v16;
}

- (void)addSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v9;
  __CFString *v10;
  CFDataRef v11;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestHostService;
  __CFDictionary *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __SecTrust *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (__CFString *)a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    v11 = SecTrustCopyExceptions(a3);
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
    if (DictionaryForDigestHostService)
    {
      v14 = DictionaryForDigestHostService;
      _SaveExceptionsForMutableQuery(DictionaryForDigestHostService, v11, (const void *)*MEMORY[0x24BDE8F78]);
      CFRelease(v14);
    }
    if (v11)
      CFRelease(v11);
  }
  else
  {
    v15 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = a3;
      _os_log_impl(&dword_20AA96000, v16, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)addSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  id v7;
  void *v8;
  CFDataRef v9;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestSender;
  __CFDictionary *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __SecTrust *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    v9 = SecTrustCopyExceptions(a3);
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    if (DictionaryForDigestSender)
    {
      v12 = DictionaryForDigestSender;
      _SaveExceptionsForMutableQuery(DictionaryForDigestSender, v9, 0);
      CFRelease(v12);
    }
    if (v9)
      CFRelease(v9);
  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v15;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = a3;
      _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (void)removeSSLTrust:(__SecTrust *)a3 hostname:(id)a4 service:(id)a5
{
  id v9;
  __CFString *v10;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestHostService;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  __SecTrust *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (__CFString *)a5;
  if (a3 && v9 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestHostService = _CopyVersion2QueryDictionaryForDigestHostService(self->_access, SHA1Digest, v9, v10);
    _DeleteExceptionsForQuery(DictionaryForDigestHostService);
    if (DictionaryForDigestHostService)
      CFRelease(DictionaryForDigestHostService);
  }
  else
  {
    v13 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v15;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = a3;
      _os_log_impl(&dword_20AA96000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid arguments host: %@ trust: %@", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (void)removeSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  id v7;
  void *v8;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestSender;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __SecTrust *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (a3 && v7 && SecTrustGetCertificateCount(a3) > 0)
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    SHA1Digest = (void *)SecCertificateGetSHA1Digest();
    DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
    _DeleteExceptionsForQuery(DictionaryForDigestSender);
    if (DictionaryForDigestSender)
      CFRelease(DictionaryForDigestSender);
  }
  else
  {
    v11 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = a3;
      _os_log_impl(&dword_20AA96000, v12, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)removeAllTrusts
{
  __CFDictionary *DictionaryForDigest;

  DictionaryForDigest = _CopyVersion2QueryDictionaryForDigest(self->_access, 0);
  _DeleteExceptionsForQuery(DictionaryForDigest);
  if (DictionaryForDigest)
    CFRelease(DictionaryForDigest);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

- (BOOL)_hasExceptionsForSMIMETrust:(__SecTrust *)a3 sender:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  void *SHA1Digest;
  __CFDictionary *DictionaryForDigestSender;
  void *v11;
  const void *v12;
  NSObject *v13;
  void *Value;
  const void *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  __CFDictionary *MutableCopy;
  OSStatus v20;
  CFTypeRef v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  const void *v30;
  NSObject *v31;
  void *v32;
  const void *v33;
  id v34;
  const __CFString *v35;
  const __CFString *v36;
  CFTypeRef result;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  __SecTrust *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a4;
  v8 = v7;
  if (!a3 || !v7 || SecTrustGetCertificateCount(a3) <= 0)
  {
    v24 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v26;
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = a3;
      _os_log_impl(&dword_20AA96000, v25, OS_LOG_TYPE_ERROR, "%@ Invalid arguments sender: %@ trust: %@", buf, 0x20u);

    }
    goto LABEL_19;
  }
  SecTrustGetCertificateAtIndex(a3, 0);
  SHA1Digest = (void *)SecCertificateGetSHA1Digest();
  DictionaryForDigestSender = _CopyVersion2QueryDictionaryForDigestSender(self->_access, SHA1Digest, v8);
  v11 = (void *)_CertUILogObjects;
  if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_INFO))
  {
    v12 = (const void *)*MEMORY[0x24BDE8FA8];
    v13 = v11;
    Value = (void *)CFDictionaryGetValue(DictionaryForDigestSender, v12);
    v15 = (const void *)*MEMORY[0x24BDE8F50];
    v16 = Value;
    v17 = (const __CFString *)CFDictionaryGetValue(DictionaryForDigestSender, v15);
    v18 = CFSTR("global");
    if (v17)
      v18 = v17;
    *(_DWORD *)buf = 138412546;
    v39 = Value;
    v40 = 2112;
    v41 = v18;
    _os_log_impl(&dword_20AA96000, v13, OS_LOG_TYPE_INFO, "Finding exceptions for %@ in %@ access group", buf, 0x16u);

  }
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, DictionaryForDigestSender);
  CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x24BDE93B0], (const void *)*MEMORY[0x24BDE93B8]);
  result = 0;
  v20 = SecItemCopyMatching(MutableCopy, &result);
  CFRelease(MutableCopy);
  if (v20 != -25300 && v20 != 0)
  {
    v28 = (void *)_CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v30 = (const void *)*MEMORY[0x24BDE8FA8];
      v31 = v28;
      v32 = (void *)CFDictionaryGetValue(DictionaryForDigestSender, v30);
      v33 = (const void *)*MEMORY[0x24BDE8F50];
      v34 = v32;
      v35 = (const __CFString *)CFDictionaryGetValue(DictionaryForDigestSender, v33);
      v36 = CFSTR("global");
      *(_DWORD *)buf = 138412802;
      v39 = v32;
      if (v35)
        v36 = v35;
      v40 = 2112;
      v41 = v36;
      v42 = 1024;
      LODWORD(v43) = v20;
      _os_log_impl(&dword_20AA96000, v31, OS_LOG_TYPE_ERROR, "Couldn't find trust settings for %@ in %@ access group (%d)", buf, 0x1Cu);

    }
  }
  v22 = result;
  if (DictionaryForDigestSender)
    CFRelease(DictionaryForDigestSender);
  if (!v22)
  {
LABEL_19:
    v23 = 0;
    goto LABEL_20;
  }
  CFRelease(v22);
  v23 = 1;
LABEL_20:

  return v23;
}

@end
