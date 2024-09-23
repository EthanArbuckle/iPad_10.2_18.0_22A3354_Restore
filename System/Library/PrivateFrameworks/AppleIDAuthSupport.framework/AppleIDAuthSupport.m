void vsetError(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, void *a5, CFStringRef format, va_list arguments)
{
  const void *v14;
  CFStringRef v15;
  const __CFString *v16;
  CFErrorDomain Domain;
  CFStringRef v18;
  void *v19;
  void *Value;
  _BOOL4 v21;
  CFIndex v22;
  const void *v23;
  NSObject *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const __CFString *v28;
  void *userInfoValues[2];
  __int128 v30;
  uint64_t v31;
  void *userInfoKeys[2];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  v14 = *a1;
  if (v14)
  {
    CFRelease(v14);
    *a1 = 0;
  }
  v15 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  v16 = v15;
  if (a4)
  {
    if (v15)
    {
      Domain = CFErrorGetDomain(a4);
      if (CFEqual(Domain, CFSTR("com.apple.AppleIDAuthSupport")))
      {
        if (CFErrorGetCode(a4) == 8)
        {
          v18 = CFStringCreateWithFormat(0, 0, CFSTR("%@: server is not matching pinning data"), v16);
          CFRelease(v16);
          v16 = v18;
        }
      }
    }
  }
  *(_OWORD *)userInfoKeys = 0u;
  v33 = 0u;
  *(_OWORD *)userInfoValues = 0u;
  v30 = 0u;
  if (!v16)
    v16 = CFSTR("out of memory");
  v19 = (void *)*MEMORY[0x24BDBD378];
  v34 = 0;
  userInfoKeys[0] = v19;
  v31 = 0;
  userInfoValues[0] = (void *)v16;
  if (isCFDictionary((_BOOL8)a3))
  {
    Value = (void *)CFDictionaryGetValue(a3, CFSTR("Status"));
    v21 = isCFDictionary((_BOOL8)Value);
    v22 = 1;
    if (Value && v21)
    {
      userInfoKeys[1] = CFSTR("Status");
      userInfoValues[1] = Value;
      v23 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("ad"));
      if (v23)
      {
        *(_QWORD *)&v33 = CFSTR("ActionData");
        *(_QWORD *)&v30 = v23;
        v22 = 3;
        if (!a4)
          goto LABEL_20;
      }
      else
      {
        v22 = 2;
        if (!a4)
          goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v22 = 1;
  }
  if (a4)
  {
LABEL_19:
    userInfoKeys[v22] = (void *)*MEMORY[0x24BDBD3B0];
    userInfoValues[v22++] = a4;
  }
LABEL_20:
  if (a5)
  {
    userInfoKeys[v22] = CFSTR("NetworkTask");
    userInfoValues[v22++] = a5;
  }
  *a1 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("com.apple.AppleIDAuthSupport"), a2, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v22);
  v24 = _AIDASOSLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v26 = a2;
    v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_2067E5000, v24, OS_LOG_TYPE_DEFAULT, "AppleIDAuthSupport: setError: %d:%{public}@", buf, 0x12u);
  }
  CFRelease(v16);
}

void setError(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  if (a1)
    vsetError(a1, a2, a3, a4, 0, format, va);
}

void setErrorNetwork(const void **a1, CFIndex a2, const __CFDictionary *a3, __CFError *a4, void *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
    vsetError(a1, a2, a3, a4, a5, a6, &a9);
}

void setErrorOOM(const void **a1)
{
  setError(a1, 1, 0, 0, 0, CFSTR("OOM"));
}

void errorNetworkProtocol(const __CFDictionary *a1, const void **a2, CFIndex a3, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  vsetError(a2, a3, a1, 0, 0, format, va);
}

void sub_2067E7608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2067E7804(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t checkChannelBindings(__SecTrust *a1, CFDictionaryRef *a2)
{
  __SecCertificate *CertificateAtIndex;
  CFDataRef v5;
  const __CFData *v6;
  CFIndex v7;
  CFDataRef v8;
  CFDataRef v9;
  CFDictionaryRef *Option;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (SecTrustGetCertificateCount(a1) < 1)
    return 0;
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a1, 0);
  if (!CertificateAtIndex)
    return 0;
  v5 = SecCertificateCopyData(CertificateAtIndex);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)ccsha256_di();
  MEMORY[0x24BDAC7A8]();
  CFDataGetLength(v6);
  CFDataGetBytePtr(v6);
  ccdigest();
  CFRelease(v6);
  v8 = CFDataCreate(0, (const UInt8 *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  if (!v8)
    return 0;
  v9 = v8;
  Option = AppleIDAuthSupportGetOption(a2, CFSTR("sc"));
  if (Option && !CFEqual(Option, v9))
  {
    v11 = 0;
  }
  else
  {
    AppleIDAuthSupportSetOption((uint64_t)a2, CFSTR("sc"), v9);
    v11 = 1;
  }
  CFRelease(v9);
  return v11;
}

void sub_2067E80E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2067E816C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

BOOL AppleIDAuthSupportAuthenticate(CFDictionaryRef *a1, void *a2, const void **a3)
{
  __CFError *Response;
  const void *Value;
  int v9[2];
  CFTypeRef cf;

  *(_QWORD *)v9 = 0;
  cf = 0;
  if (!AppleIDAuthSupportIsDone((uint64_t)a1))
  {
    Response = 0;
    while (AppleIDAuthSupportStep((uint64_t)a1, (int)Response, (uint64_t)&cf, a3))
    {
      if (Response)
        CFRelease(Response);
      if (!cf)
        return AppleIDAuthSupportSuccess((uint64_t)a1);
      Response = (__CFError *)SendRequestAndCreateResponse(a1, 0, a2, (void *)cf, (const void **)v9);
      CFRelease(cf);
      cf = 0;
      if (!Response)
      {
        setError(a3, 6, 0, *(__CFError **)v9, CFSTR("Failed to get response from server"));
        Response = *(__CFError **)v9;
        break;
      }
      Value = CFDictionaryGetValue(Response, CFSTR("Status"));
      if (isCFDictionary((_BOOL8)Value))
        _AppleIDAuthSupportSetStatus((uint64_t)a1, Value);
      if (AppleIDAuthSupportIsDone((uint64_t)a1))
        goto LABEL_14;
    }
    if (!Response)
      return AppleIDAuthSupportSuccess((uint64_t)a1);
LABEL_14:
    CFRelease(Response);
  }
  return AppleIDAuthSupportSuccess((uint64_t)a1);
}

id SendRequestAndCreateResponse(CFDictionaryRef *a1, const __CFDictionary *a2, void *a3, void *a4, const void **a5)
{
  NSObject *v10;
  void *Option;
  void *Value;
  void *v13;
  const __CFDictionary *v14;
  NSObject *v15;
  AIASSession *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  intptr_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __CFError *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  __CFError *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  const void **v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const __CFDictionary *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  _AIDASOSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    v62 = "SendRequestAndCreateResponse";
    v63 = 2112;
    v64 = a4;
    v65 = 2112;
    v66 = a3;
    _os_log_impl(&dword_2067E5000, v10, OS_LOG_TYPE_INFO, "%{public}s: sending request %@ to server %@", buf, 0x20u);
  }

  v58 = a4;
  v59 = a5;
  v57 = a3;
  if (a1 && !a2)
  {
    Option = AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportClientInfo"));
    Value = AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportProxiedClientInfo"));
    v13 = AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportCompanionClientInfo"));
    v56 = AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportAppleITeamID"));
    v55 = AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportAppleIClientID"));
    v14 = (const __CFDictionary *)AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportAdditionalHeaders"));
LABEL_8:
    a2 = v14;
    goto LABEL_9;
  }
  if (a2)
  {
    Option = (void *)CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportClientInfo"));
    Value = (void *)CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportProxiedClientInfo"));
    v13 = (void *)CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportCompanionClientInfo"));
    v56 = (void *)CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportAppleITeamID"));
    v55 = CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportAppleIClientID"));
    v14 = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("kAppleIDAuthSupportAdditionalHeaders"));
    goto LABEL_8;
  }
  v55 = 0;
  v56 = 0;
  v13 = 0;
  Value = 0;
  Option = 0;
LABEL_9:
  _AIDASOSLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136447234;
    v62 = "SendRequestAndCreateResponse";
    v63 = 2112;
    v64 = Option;
    v65 = 2112;
    v66 = Value;
    v67 = 2112;
    v68 = v13;
    v69 = 2112;
    v70 = a2;
    _os_log_impl(&dword_2067E5000, v15, OS_LOG_TYPE_INFO, "%{public}s: CI: %@ PCI: %@ CCI: %@ AH: %@", buf, 0x34u);
  }

  v16 = objc_alloc_init(AIASSession);
  objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  objc_msgSend(v18, "setWaitsForConnectivity:", 1);
  AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportOptionTimeoutIntervalForRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v19, "intValue") >= 1)
    objc_msgSend(v18, "setTimeoutIntervalForRequest:", (double)(int)objc_msgSend(v19, "intValue"));
  AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportOptionTimeoutIntervalForResource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v20, "intValue") >= 1)
    v21 = (double)(int)objc_msgSend(v20, "intValue");
  else
    v21 = 60.0;
  objc_msgSend(v18, "setTimeoutIntervalForResource:", v21);
  AppleIDAuthSupportGetOption(a1, CFSTR("kAppleIDAuthSupportSourceApplicationAuditTokenData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v18, "set_sourceApplicationAuditTokenData:", v22);
  }
  objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", v18, v16, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIASSession setURLSession:](v16, "setURLSession:", v23);

  -[AIASSession requestWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:](v16, "requestWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:", v57, v58, Option, Value, v13, v56);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _AIDASOSLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (v26)
    {
      *(_DWORD *)buf = 136446210;
      v62 = "SendRequestAndCreateResponse";
      _os_log_impl(&dword_2067E5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: failed getting session", buf, 0xCu);
    }

    errorNetworkProtocol(0, v59, 6, CFSTR("Failed getting sessionWithConfiguration"));
    goto LABEL_56;
  }
  if (v26)
  {
    *(_DWORD *)buf = 136446466;
    v62 = "SendRequestAndCreateResponse";
    v63 = 2112;
    v64 = v24;
    _os_log_impl(&dword_2067E5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: submissing a request to: %@", buf, 0x16u);
  }

  objc_msgSend(v24, "resume");
  objc_msgSend(v24, "sema");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

  if (v28)
  {
    _AIDASOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v62 = "SendRequestAndCreateResponse";
      v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_2067E5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s: request %@ timed out", buf, 0x16u);
    }

    objc_msgSend(v24, "task");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cancel");

    -[AIASSession invalidateAndCancel](v16, "invalidateAndCancel");
    objc_msgSend(v24, "networkTaskDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    setErrorNetwork(v59, 6, 0, 0, v31, CFSTR("Time out, see underlying network error"), v32, v33, v55);
    goto LABEL_28;
  }
  v34 = objc_msgSend(v24, "success");
  _AIDASOSLog();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v34)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "error");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v62 = "SendRequestAndCreateResponse";
      v63 = 2112;
      v64 = v24;
      v65 = 2112;
      v66 = v45;
      _os_log_impl(&dword_2067E5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s: failed to fetch request %@: %@", buf, 0x20u);

    }
    objc_msgSend(v24, "error");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v24, "error");
      v47 = (__CFError *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "networkTaskDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      setErrorNetwork(v59, 6, 0, v47, v48, CFSTR("Request failed, see underlying network error"), v49, v50, v55);

    }
    else
    {
      setError(v59, 10, 0, 0, CFSTR("%s: failed, but no error from NSURLSession"), "SendRequestAndCreateResponse");
    }
    -[AIASSession invalidateAndCancel](v16, "invalidateAndCancel");
    goto LABEL_56;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    SendRequestAndCreateResponse_cold_1(v36);

  if (v59 && *v59)
  {
    CFRelease(*v59);
    *v59 = 0;
  }
  -[AIASSession invalidateAndCancel](v16, "invalidateAndCancel");
  objc_msgSend(v24, "data");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (!v38)
  {
    _AIDASOSLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v62 = "SendRequestAndCreateResponse";
      v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_2067E5000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s: no data returned in request %@", buf, 0x16u);
    }

    objc_msgSend(v24, "networkTaskDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    setErrorNetwork(v59, 10, 0, 0, v31, CFSTR("%s: success with no data, no error from NSURLSession"), v52, v53, (char)"SendRequestAndCreateResponse");
    goto LABEL_28;
  }
  v39 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend(v24, "data");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v39, "propertyListWithData:options:format:error:", v40, 0, 0, &v60);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (__CFError *)v60;

  if (!v31)
  {
    setError(v59, 6, 0, v41, CFSTR("%s: Failed to parse the response"), "SendRequestAndCreateResponse");

    goto LABEL_56;
  }
  _AIDASOSLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v62 = "SendRequestAndCreateResponse";
    v63 = 2112;
    v64 = v31;
    _os_log_impl(&dword_2067E5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: completed request %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    errorNetworkProtocol(0, v59, 2, CFSTR("Not a dictionary"));

LABEL_28:
LABEL_56:
    v44 = 0;
    goto LABEL_57;
  }
  objc_msgSend(v31, "objectForKey:", CFSTR("Response"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    errorNetworkProtocol((const __CFDictionary *)v31, v59, 2, CFSTR("could not find Response key"));

    goto LABEL_28;
  }
  v44 = v43;

LABEL_57:
  return v44;
}

__CFDictionary *AppleIDAuthSupportCopyAppToken(uint64_t a1, void *a2, int a3, const __CFString *a4, const void **a5)
{
  return AppleIDAuthSupportCopyAppTokensOptions(a1, a2, a4, 0, a5);
}

__CFDictionary *AppleIDAuthSupportCopyAppTokens(uint64_t a1, void *a2, const __CFString *a3, const void **a4)
{
  return AppleIDAuthSupportCopyAppTokensOptions(a1, a2, a3, 0, a4);
}

CFDataRef _AppleIDAuthSupportCreateEncryptedData(const __CFData *a1, const char *a2, const void *a3)
{
  __CFData *DerivedKey;
  __CFData *v8;
  UInt8 *v9;
  rsize_t Length;
  rsize_t v11;
  const __CFData *Data;
  const __CFData *v13;
  CFIndex v14;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;

  ccaes_gcm_encrypt_mode();
  ccgcm_context_size();
  MEMORY[0x24BDAC7A8]();
  if (allowSkipSettingOnInternalHardware(CFSTR("AppleIDAuthSupportNoEncryption"), 0))
    return CFPropertyListCreateData(0, a3, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!a2)
  {
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    ccgcm_init();
LABEL_7:
    Data = CFPropertyListCreateData(0, a3, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data)
      return 0;
    v13 = Data;
    v14 = CFDataGetLength(Data) + 35;
    Mutable = CFDataCreateMutable(0, v14);
    v8 = Mutable;
    if (Mutable)
    {
      CFDataSetLength(Mutable, v14);
      MutableBytePtr = CFDataGetMutableBytePtr(v8);
      *(_WORD *)MutableBytePtr = 22872;
      MutableBytePtr[2] = 90;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x10uLL, MutableBytePtr + 3))
        abort();
      ccgcm_set_iv();
      ccgcm_aad();
      CFDataGetLength(v13);
      CFDataGetBytePtr(v13);
      ccgcm_update();
      CFDataGetLength(v13);
      ccgcm_finalize();
    }
    CFRelease(v13);
    return v8;
  }
  DerivedKey = CreateDerivedKey(a1, a2);
  v8 = DerivedKey;
  if (DerivedKey)
  {
    CFDataGetLength(DerivedKey);
    CFDataGetBytePtr(v8);
    ccgcm_init();
    v9 = CFDataGetMutableBytePtr(v8);
    Length = CFDataGetLength(v8);
    v11 = CFDataGetLength(v8);
    memset_s(v9, Length, 0, v11);
    CFRelease(v8);
    goto LABEL_7;
  }
  return v8;
}

__CFData *CreateDerivedKey(const __CFData *a1, const char *a2)
{
  rsize_t *v4;
  __CFData *Mutable;
  CFIndex Length;
  CFIndex v7;
  uint64_t v8;
  char *v9;
  UInt8 *MutableBytePtr;
  size_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (rsize_t *)ccsha256_di();
  if (CFDataGetLength(a1) > *v4)
    return 0;
  Length = CFDataGetLength(a1);
  Mutable = CFDataCreateMutable(0, Length);
  if (Mutable)
  {
    v7 = CFDataGetLength(a1);
    CFDataSetLength(Mutable, v7);
    MEMORY[0x24BDAC7A8]();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    strlen(a2);
    cchmac();
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v11 = CFDataGetLength(a1);
    memcpy(MutableBytePtr, v9, v11);
    memset_s(v9, *v4, 0, *v4);
  }
  return Mutable;
}

CFPropertyListRef _AppleIDAuthSupportCreateDecryptedData(const __CFData *a1, const char *a2, const __CFData *a3, const void **a4)
{
  CFPropertyListRef v8;
  __CFData *DerivedKey;
  const __CFData *v10;
  UInt8 *MutableBytePtr;
  size_t Length;
  CFIndex v13;
  CFIndex v15;
  __CFData *Mutable;
  CFErrorRef v17;
  CFErrorRef error[4];

  error[3] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  ccaes_gcm_decrypt_mode();
  error[0] = 0;
  ccgcm_context_size();
  MEMORY[0x24BDAC7A8]();
  if (!allowSkipSettingOnInternalHardware(CFSTR("AppleIDAuthSupportNoEncryption"), 0))
  {
    if (a2)
    {
      DerivedKey = CreateDerivedKey(a1, a2);
      if (!DerivedKey)
        return 0;
      v10 = DerivedKey;
      CFDataGetLength(DerivedKey);
      CFDataGetBytePtr(v10);
      ccgcm_init();
      MutableBytePtr = CFDataGetMutableBytePtr(v10);
      Length = CFDataGetLength(v10);
      bzero(MutableBytePtr, Length);
      CFRelease(v10);
    }
    else
    {
      CFDataGetLength(a1);
      CFDataGetBytePtr(a1);
      ccgcm_init();
    }
    v13 = CFDataGetLength(a3);
    CFDataGetBytePtr(a3);
    if (v13 > 34)
    {
      if (cc_cmp_safe())
      {
        setError(a4, 5, 0, 0, CFSTR("encrypted token wrong version"), error[0]);
      }
      else
      {
        v15 = v13 - 35;
        ccgcm_set_iv();
        ccgcm_aad();
        Mutable = CFDataCreateMutable(0, v15);
        CFDataSetLength(Mutable, v15);
        CFDataGetMutableBytePtr(Mutable);
        ccgcm_update();
        ccgcm_finalize();
        if (cc_cmp_safe())
        {
          setError(a4, 5, 0, 0, CFSTR("tag version"));
          v17 = Mutable;
        }
        else
        {
          v8 = CFPropertyListCreateWithData(0, Mutable, 0, 0, error);
          CFRelease(Mutable);
          if (v8)
            return v8;
          setError(a4, 5, 0, error[0], CFSTR("failed to decode decrypted data"));
          v17 = error[0];
          if (!error[0])
            return 0;
        }
        CFRelease(v17);
      }
    }
    else
    {
      setError(a4, 5, 0, 0, CFSTR("encrypted token too short"), error[0]);
    }
    return 0;
  }
  return CFPropertyListCreateWithData(0, a3, 0, 0, (CFErrorRef *)a4);
}

__CFDictionary *AppleIDAuthSupportCopyAppTokensOptions(uint64_t a1, void *a2, const __CFString *a3, const __CFDictionary *a4, const void **a5)
{
  const void *Value;
  const void *v11;
  CFTypeID v12;
  const void *v13;
  __CFDictionary *MutableCopy;
  __CFData *AppTokensChecksum;
  __CFData *v17;
  __CFDictionary *Mutable;
  __CFDictionary *v19;
  const __CFDictionary *Response;
  const __CFData *v21;
  const __CFDictionary *DecryptedData;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  __CFError *v25;
  const void *v26;
  int v27[2];

  *(_QWORD *)v27 = 0;
  if (!a1)
  {
    setError(a5, 7, 0, 0, CFSTR("Caller passed a NULL token to CopyAppTokens"));
    return 0;
  }
  if (!isCFArray((_BOOL8)a3))
  {
    setError(a5, 7, 0, 0, CFSTR("Caller passed a non array as apps to CopyAppTokens: %@"), a3);
    return 0;
  }
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, CFSTR("cpd"));
    v11 = Value;
    if (Value)
    {
      v12 = CFGetTypeID(Value);
      if (v12 != CFDictionaryGetTypeID())
        return 0;
    }
    v13 = CFDictionaryGetValue(a4, CFSTR("aa"));
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  AppTokensChecksum = CreateAppTokensChecksum(a1, a3, a5);
  if (!AppTokensChecksum)
    return 0;
  v17 = AppTokensChecksum;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v25 = v17;
LABEL_38:
    CFRelease(v25);
    return 0;
  }
  v19 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("o"), CFSTR("apptokens"));
  CFDictionarySetValue(v19, CFSTR("u"), *(const void **)(a1 + 40));
  CFDictionarySetValue(v19, CFSTR("app"), a3);
  CFDictionarySetValue(v19, CFSTR("t"), *(const void **)(a1 + 16));
  CFDictionarySetValue(v19, CFSTR("c"), *(const void **)(a1 + 32));
  CFDictionarySetValue(v19, CFSTR("checksum"), v17);
  CFRelease(v17);
  if (v11)
    CFDictionarySetValue(v19, CFSTR("cpd"), v11);
  if (v13)
    CFDictionarySetValue(v19, CFSTR("aa"), v13);
  Response = (const __CFDictionary *)SendRequestAndCreateResponse(0, a4, a2, v19, (const void **)v27);
  CFRelease(v19);
  if (!Response)
  {
    setError(a5, 6, 0, *(__CFError **)v27, CFSTR("Failed to get response from server"));
    v25 = *(__CFError **)v27;
    if (!*(_QWORD *)v27)
      return 0;
    goto LABEL_38;
  }
  v21 = (const __CFData *)CFDictionaryGetValue(Response, CFSTR("et"));
  if (!v21)
  {
    errorNetworkProtocol(Response, a5, 2, CFSTR("Could not find encrypted token key"));
    v25 = Response;
    goto LABEL_38;
  }
  DecryptedData = (const __CFDictionary *)_AppleIDAuthSupportCreateDecryptedData(*(const __CFData **)(a1 + 24), 0, v21, a5);
  if (!isCFDictionary((_BOOL8)DecryptedData))
  {
    errorNetworkProtocol(Response, a5, 5, CFSTR("Failed to decrypt EncryptedToken (et)"));
    CFRelease(Response);
    if (!DecryptedData)
      return 0;
    goto LABEL_37;
  }
  v23 = (const __CFDictionary *)CFDictionaryGetValue(DecryptedData, CFSTR("t"));
  if (v23)
  {
    v24 = v23;
    if (isCFDictionary((_BOOL8)v23))
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v24);
      goto LABEL_31;
    }
    errorNetworkProtocol(Response, a5, 2, CFSTR("Could not find token data"));
    CFRelease(Response);
LABEL_37:
    v25 = DecryptedData;
    goto LABEL_38;
  }
  MutableCopy = 0;
LABEL_31:
  v26 = CFDictionaryGetValue(Response, CFSTR("Status"));
  if (isCFDictionary((_BOOL8)v26)
    && (MutableCopy
     || (MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0))
  {
    CFDictionarySetValue(MutableCopy, CFSTR("Status"), v26);
  }
  CFRelease(Response);
  CFRelease(DecryptedData);
  return MutableCopy;
}

__CFData *CreateAppTokensChecksum(uint64_t a1, const __CFString *a2, const void **a3)
{
  CFIndex *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __CFData *Mutable;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = (CFIndex *)ccsha256_di();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v12 - v7;
  CFDataGetLength(*(CFDataRef *)(a1 + 24));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 24));
  cchmac_init();
  cchmac_update();
  v9 = AppleIDAuthSupportCopyString(*(const __CFString **)(a1 + 40), 1);
  strlen(v9);
  cchmac_update();
  free(v9);
  if (!cfHMAC((uint64_t)v6, (uint64_t)v8, a2, a3))
    return 0;
  Mutable = CFDataCreateMutable(0, *v6);
  CFDataSetLength(Mutable, *v6);
  CFDataGetMutableBytePtr(Mutable);
  cchmac_final();
  return Mutable;
}

void *AppleIDAuthSupportCopyAppNewAppTokensWithAuthAttribute(void *a1, void *a2, const __CFString *a3, CFDictionaryRef theDict, const void **a5)
{
  void *DecryptedData;
  const void *Value;
  const void *v11;
  CFTypeID v12;
  __CFData *AppTokensChecksum;
  __CFData *v14;
  __CFDictionary *Mutable;
  __CFDictionary *v16;
  const __CFDictionary *Response;
  const __CFData *v18;
  __CFError *v19;
  int v21[2];

  DecryptedData = a1;
  *(_QWORD *)v21 = 0;
  if (a1)
  {
    if (a3)
    {
      if (theDict)
      {
        Value = CFDictionaryGetValue(theDict, CFSTR("cpd"));
        v11 = Value;
        if (Value)
        {
          v12 = CFGetTypeID(Value);
          if (v12 != CFDictionaryGetTypeID())
            return 0;
        }
      }
      else
      {
        v11 = 0;
      }
      AppTokensChecksum = CreateAppTokensChecksum((uint64_t)DecryptedData, a3, a5);
      if (AppTokensChecksum)
      {
        v14 = AppTokensChecksum;
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (Mutable)
        {
          v16 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("o"), CFSTR("apptokens"));
          CFDictionarySetValue(v16, CFSTR("u"), *((const void **)DecryptedData + 5));
          CFDictionarySetValue(v16, CFSTR("aa"), a3);
          CFDictionarySetValue(v16, CFSTR("t"), *((const void **)DecryptedData + 2));
          CFDictionarySetValue(v16, CFSTR("c"), *((const void **)DecryptedData + 4));
          CFDictionarySetValue(v16, CFSTR("checksum"), v14);
          CFRelease(v14);
          if (v11)
            CFDictionarySetValue(v16, CFSTR("cpd"), v11);
          Response = (const __CFDictionary *)SendRequestAndCreateResponse(0, theDict, a2, v16, (const void **)v21);
          CFRelease(v16);
          if (Response)
          {
            v18 = (const __CFData *)CFDictionaryGetValue(Response, CFSTR("et"));
            if (v18)
            {
              DecryptedData = (void *)_AppleIDAuthSupportCreateDecryptedData(*((const __CFData **)DecryptedData + 3), 0, v18, a5);
              if (isCFDictionary((_BOOL8)DecryptedData))
              {
                CFRelease(Response);
                return DecryptedData;
              }
              errorNetworkProtocol(Response, a5, 5, CFSTR("Failed to decrypt EncryptedToken (et)"));
              CFRelease(Response);
              if (!DecryptedData)
                return DecryptedData;
              v19 = (__CFError *)DecryptedData;
            }
            else
            {
              errorNetworkProtocol(Response, a5, 2, CFSTR("Could not find encrypted token key"));
              v19 = Response;
            }
          }
          else
          {
            setError(a5, 6, 0, *(__CFError **)v21, CFSTR("Failed to get response from server"));
            v19 = *(__CFError **)v21;
            if (!*(_QWORD *)v21)
              return 0;
          }
        }
        else
        {
          v19 = v14;
        }
        CFRelease(v19);
      }
    }
    else
    {
      setError(a5, 7, 0, 0, CFSTR("Caller passed a NULL authAttribtue to CopyAppTokensWithAA"));
    }
    return 0;
  }
  setError(a5, 7, 0, 0, CFSTR("Caller passed a NULL token to CopyAppTokensWithAA"));
  return DecryptedData;
}

uint64_t AppleIDAuthSupportGSGetID()
{
  if (AppleIDAuthSupportGSGetID_inited != -1)
    dispatch_once(&AppleIDAuthSupportGSGetID_inited, &__block_literal_global);
  return GSid;
}

void GSRelease(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = (const void *)a1[3];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[4];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[5];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[6];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[7];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[8];
  if (v7)
    CFRelease(v7);
}

uint64_t AppleIDAuthSupportGSCreateContext(const void *a1, const void *a2, const void *a3, const void **a4)
{
  uint64_t Instance;

  if (AppleIDAuthSupportGSGetID_inited != -1)
    dispatch_once(&AppleIDAuthSupportGSGetID_inited, &__block_literal_global);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
      *(_QWORD *)(Instance + 24) = CFRetain(a1);
    *(_QWORD *)(Instance + 56) = CFRetain(a2);
    if (isCFDictionary((_BOOL8)a3))
      *(_QWORD *)(Instance + 48) = CFRetain(a3);
    *(_QWORD *)(Instance + 72) = SendRequestAndCreateResponse;
    *(_BYTE *)(Instance + 16) = 0;
    if (a3 && CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("maybeSkipEncrypt")))
      *(_BYTE *)(Instance + 16) = 1;
  }
  else
  {
    setErrorOOM(a4);
  }
  return Instance;
}

uint64_t _AppleIDAuthSupportGSSetRPC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 72) = a2;
  return result;
}

const void *AppleIDAuthSupportGSRequestCopyResponse(_QWORD *a1, const __CFDictionary *cf, const void **a3)
{
  const void *v4;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  const void *v9;
  _QWORD *Token;
  const void *v11;
  const void *v12;
  const void *v13;

  if (!a1[4])
  {
    v6 = GSRequestCopyResponse((uint64_t)a1, "2SV-c2s", "2SV-s2c", CFSTR("2sv-auth"), cf, a3);
    if (!v6)
      return 0;
    v7 = v6;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("new-t"));
    if (!isCFDictionary((_BOOL8)Value))
      goto LABEL_9;
    v9 = (const void *)a1[4];
    if (v9)
      CFRelease(v9);
    Token = _AppleIDAuthSupportCreateToken(Value, *(const void **)(a1[3] + 48), *(const void **)(a1[3] + 40));
    a1[4] = Token;
    if (!Token)
    {
      setErrorOOM(a3);
    }
    else
    {
LABEL_9:
      v11 = CFDictionaryGetValue(v7, CFSTR("new-app-tokens"));
      if (isCFDictionary((_BOOL8)v11))
      {
        v12 = (const void *)a1[5];
        if (v12)
          CFRelease(v12);
        a1[5] = CFRetain(v11);
      }
      v13 = (const void *)a1[8];
      if (v13)
        CFRelease(v13);
      v4 = CFDictionaryGetValue(v7, CFSTR("BML"));
      if (isCFDictionary((_BOOL8)v4))
      {
        CFRetain(v4);
LABEL_19:
        CFRelease(v7);
        return v4;
      }
    }
    v4 = 0;
    goto LABEL_19;
  }
  setError(a3, 5, 0, 0, CFSTR("Already have a new token"));
  return 0;
}

const __CFDictionary *GSRequestCopyResponse(uint64_t a1, const char *a2, const char *a3, const void *a4, const __CFDictionary *cf, const void **a6)
{
  const __CFDictionary *v7;
  __CFDictionary *MutableCopy;
  __CFDictionary *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  uint64_t v16;
  CFDataRef Data;
  int v18;
  __CFString **v19;
  uint64_t v20;
  const __CFData *v21;
  const __CFDictionary *DecryptedData;
  const __CFData *Value;
  const void *v24;
  CFErrorRef error;

  v7 = cf;
  error = 0;
  if (*(_QWORD *)(a1 + 64))
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, cf);
    if (!MutableCopy)
    {
LABEL_32:
      setErrorOOM(a6);
      Data = 0;
      goto LABEL_20;
    }
    v13 = MutableCopy;
    CFDictionarySetValue(MutableCopy, CFSTR("ServerState"), *(const void **)(a1 + 64));
    v7 = v13;
  }
  else
  {
    CFRetain(cf);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    goto LABEL_32;
  v15 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("o"), a4);
  if ((allowSkipSettingOnInternalHardware(CFSTR("AppleIDAuthSupportNoEncryption"), *(_BYTE *)(a1 + 16)) & 1) != 0
    || (v16 = *(_QWORD *)(a1 + 24)) == 0)
  {
    Data = CFPropertyListCreateData(0, v7, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data)
    {
      setErrorOOM(a6);
      goto LABEL_20;
    }
    v18 = 1;
    v19 = kAppleIDAuthSupportClearData;
  }
  else
  {
    Data = _AppleIDAuthSupportCreateEncryptedData(*(const __CFData **)(v16 + 24), a2, v7);
    if (!Data)
    {
LABEL_20:
      DecryptedData = 0;
      goto LABEL_25;
    }
    v18 = 0;
    v19 = kAppleIDAuthSupportData;
  }
  CFDictionarySetValue(v15, *v19, Data);
  v20 = *(_QWORD *)(a1 + 24);
  if (v20)
  {
    CFDictionarySetValue(v15, CFSTR("t"), *(const void **)(v20 + 16));
    CFDictionarySetValue(v15, CFSTR("c"), *(const void **)(*(_QWORD *)(a1 + 24) + 32));
  }
  CFRelease(Data);
  Data = (CFDataRef)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, __CFDictionary *, CFErrorRef *))(a1 + 72))(0, 0, *(_QWORD *)(a1 + 56), v15, &error);
  CFRelease(v15);
  if (!Data)
  {
    setError(a6, 6, 0, error, CFSTR("Failed to get response from server"));
    goto LABEL_20;
  }
  if (!v18)
  {
    Value = (const __CFData *)CFDictionaryGetValue(Data, CFSTR("data"));
    if (isCFData((_BOOL8)Value))
    {
      DecryptedData = (const __CFDictionary *)_AppleIDAuthSupportCreateDecryptedData(*(const __CFData **)(*(_QWORD *)(a1 + 24) + 24), a3, Value, a6);
      if (!DecryptedData)
        goto LABEL_25;
      goto LABEL_23;
    }
    goto LABEL_34;
  }
  v21 = (const __CFData *)CFDictionaryGetValue(Data, CFSTR("clearData"));
  if (!isCFData((_BOOL8)v21))
  {
LABEL_34:
    setError(a6, 2, 0, 0, CFSTR("data missing for server request"));
    goto LABEL_20;
  }
  DecryptedData = (const __CFDictionary *)CFPropertyListCreateWithData(0, v21, 0, 0, &error);
  if (!DecryptedData)
  {
    setError(a6, 5, 0, error, CFSTR("failed to decode data"));
    goto LABEL_25;
  }
LABEL_23:
  v24 = CFDictionaryGetValue(DecryptedData, CFSTR("ServerState"));
  *(_QWORD *)(a1 + 64) = v24;
  if (v24)
    CFRetain(v24);
LABEL_25:
  if (v7)
    CFRelease(v7);
  if (Data)
    CFRelease(Data);
  if (error)
    CFRelease(error);
  return DecryptedData;
}

CFTypeRef AppleIDAuthSupportGSCopyNewIdentityToken(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 32);
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef AppleIDAuthSupportGSCopyAppTokens(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 40);
  if (result)
    return CFRetain(result);
  return result;
}

const __CFDictionary *AppleIDAuthSupportGSRPC(uint64_t a1, const void *a2, const __CFDictionary *cf, const void **a4)
{
  return GSRequestCopyResponse(a1, "gs-operation-c2s", "gs-operation-s2c", a2, cf, a4);
}

uint64_t AppleIDAuthSupportGSOperation(const void *a1, const void *a2, const __CFDictionary *a3, const void *a4, const void *a5, const void **a6)
{
  uint64_t result;
  const void *v10;
  const __CFDictionary *v11;

  result = AppleIDAuthSupportGSCreateContext(a1, a4, a5, a6);
  if (result)
  {
    v10 = (const void *)result;
    v11 = GSRequestCopyResponse(result, "gs-operation-c2s", "gs-operation-s2c", a2, a3, a6);
    CFRelease(v10);
    return (uint64_t)v11;
  }
  return result;
}

uint64_t allowSkipSettingOnInternalHardware(const __CFString *a1, char a2)
{
  uint64_t v2;
  NSObject *v3;

  if ((a2 & 1) == 0 && !CFPreferencesGetAppBooleanValue(a1, CFSTR(".GlobalPreferences"), 0))
    return 0;
  v2 = os_variant_allows_internal_security_policies();
  _AIDASOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    allowSkipSettingOnInternalHardware_cold_1(v2, v3);

  return v2;
}

uint64_t cfHMAC(uint64_t a1, uint64_t a2, const __CFString *a3, const void **a4)
{
  CFTypeID v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  const void *ValueAtIndex;
  uint64_t result;
  char *v15;

  v8 = CFGetTypeID(a3);
  if (v8 != CFArrayGetTypeID())
  {
    if (v8 == CFStringGetTypeID())
    {
      v15 = AppleIDAuthSupportCopyString(a3, 0);
      strlen(v15);
      cchmac_update();
      free(v15);
    }
    else
    {
      if (v8 != CFDataGetTypeID())
      {
        setError(a4, 7, 0, 0, CFSTR("Caller passed a app name as a non string: %@"), a3);
        return 0;
      }
      CFDataGetLength((CFDataRef)a3);
      CFDataGetBytePtr((CFDataRef)a3);
      cchmac_update();
    }
    return 1;
  }
  Count = CFArrayGetCount((CFArrayRef)a3);
  v10 = Count - 1;
  if (Count < 1)
    return 1;
  v11 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, v11);
    result = cfHMAC(a1, a2, ValueAtIndex, a4);
    if (!(_DWORD)result)
      break;
  }
  while (v10 != v11++);
  return result;
}

uint64_t AppleIDAuthSupportGetClientInfo()
{
  if (AppleIDAuthSupportGetClientInfo_onceToken != -1)
    dispatch_once(&AppleIDAuthSupportGetClientInfo_onceToken, &__block_literal_global_0);
  return AppleIDAuthSupportGetClientInfo_clientInfo;
}

BOOL isCFArray(_BOOL8 result)
{
  const void *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = (const void *)result;
    TypeID = CFArrayGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFString(_BOOL8 result)
{
  const void *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = (const void *)result;
    TypeID = CFStringGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFData(_BOOL8 result)
{
  const void *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = (const void *)result;
    TypeID = CFDataGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

BOOL isCFDictionary(_BOOL8 result)
{
  const void *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = (const void *)result;
    TypeID = CFDictionaryGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

uint64_t _AIDASOSLog()
{
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  return _AIDASOSLog_log;
}

char *AppleIDAuthSupportCopyString(const __CFString *a1, int a2)
{
  CFIndex Length;
  CFIndex v5;
  char *v6;
  int v7;
  int32_t v8;
  UChar *v9;
  UChar *v10;
  int v11;
  void *v12;
  int32_t v13;
  __darwin_ct_rune_t v15;
  unsigned __int8 *v16;
  __darwin_ct_rune_t v17;
  int32_t v18;
  char *v19;
  UErrorCode pErrorCode;
  int32_t pDestLength;

  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x67FA95C4uLL);
  if (!v6)
    return v6;
  if (!CFStringGetCString(a1, v6, v5, 0x8000100u))
  {
LABEL_23:
    v19 = v6;
LABEL_24:
    free(v19);
    return 0;
  }
  if (a2 == 1)
  {
    v15 = *v6;
    if (*v6)
    {
      v16 = (unsigned __int8 *)(v6 + 1);
      do
      {
        *(v16 - 1) = __tolower(v15);
        v17 = *v16++;
        v15 = v17;
      }
      while (v17);
    }
    return v6;
  }
  if (a2 != 2)
    return v6;
  v7 = strlen(v6);
  pDestLength = 0;
  if (AppleIDAuthSupportCopyString_onceToken != -1)
    dispatch_once(&AppleIDAuthSupportCopyString_onceToken, &__block_literal_global_127);
  if (!AppleIDAuthSupportCopyString_profile)
    goto LABEL_23;
  v8 = v7 + 1;
  v9 = (UChar *)malloc_type_malloc(2 * (v7 + 1), 0x1000040BDFB0063uLL);
  if (!v9)
    goto LABEL_23;
  v10 = v9;
  pErrorCode = U_ZERO_ERROR;
  u_strFromUTF8(v9, v8, &pDestLength, v6, -1, &pErrorCode);
  free(v6);
  if (pErrorCode)
  {
LABEL_27:
    v19 = (char *)v10;
    goto LABEL_24;
  }
  v11 = 2 * pDestLength;
  while (1)
  {
    v12 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    pErrorCode = U_ZERO_ERROR;
    v13 = usprep_prepare();
    if (pErrorCode != U_STRING_NOT_TERMINATED_WARNING && pErrorCode != U_BUFFER_OVERFLOW_ERROR)
      break;
    v11 += pDestLength;
    free(v12);
  }
  if (pErrorCode)
  {
    free(v12);
    goto LABEL_27;
  }
  v18 = v13;
  free(v10);
  u_strToUTF8(0, 0, &pDestLength, (const UChar *)v12, v18, &pErrorCode);
  v6 = (char *)malloc_type_malloc(pDestLength + 1, 0x80205F31uLL);
  pErrorCode = U_ZERO_ERROR;
  u_strToUTF8(v6, pDestLength + 1, 0, (const UChar *)v12, v18, &pErrorCode);
  free(v12);
  v6[pDestLength] = 0;
  if (pErrorCode)
    goto LABEL_23;
  return v6;
}

uint64_t AppleIDAuthSupportDeterministicRandomCreate(const __CFString *a1)
{
  uint64_t Instance;
  char *v3;

  if (AppleIDAuthSupportRandomGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_169);
  Instance = _CFRuntimeCreateInstance();
  *(_QWORD *)(Instance + 16) = malloc_type_calloc(1uLL, 0x1010uLL, 0x10800408508BC16uLL);
  v3 = AppleIDAuthSupportCopyString(a1, 0);
  *(_QWORD *)(Instance + 24) = v3;
  strlen(v3);
  ccrng_pbkdf2_prng_init();
  return Instance;
}

uint64_t AppleIDAuthSupportRandomGet(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t AppleIDAuthSupportGetTypeID()
{
  if (AppleIDAuthSupportGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportGetTypeID_inited, &__block_literal_global_130);
  return haid;
}

void GSRelease_0(_QWORD *a1)
{
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  v2 = (void *)a1[13];
  if (v2)
    free(v2);
  v3 = (void *)a1[17];
  if (v3)
    free(v3);
  v4 = (const void *)a1[11];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[6];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[8];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[7];
  if (v7)
    CFRelease(v7);
  v8 = (const void *)a1[2];
  if (v8)
    CFRelease(v8);
  v9 = (const void *)a1[9];
  if (v9)
    CFRelease(v9);
}

__CFDictionary *_PIICreateClearedOptions(CFDictionaryRef theDict)
{
  __CFDictionary *MutableCopy;
  __CFDictionary *v2;

  if (!theDict)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  v2 = MutableCopy;
  if (MutableCopy)
  {
    _HideKeyValue(MutableCopy, CFSTR("Password"));
    _HideKeyValue(v2, CFSTR("adsid"));
    _HideKeyValue(v2, CFSTR("kAppleIDAuthSupportSRPRandomSource"));
  }
  return v2;
}

void _HideKeyValue(__CFDictionary *a1, const void *a2)
{
  if (CFDictionaryGetValue(a1, a2))
    CFDictionarySetValue(a1, a2, CFSTR("<<VALUE>>"));
}

uint64_t AppleIDAuthSupportCreate(int a1, const __CFDictionary *a2, const void **a3)
{
  __CFDictionary *v6;
  NSObject *v7;
  uint64_t Instance;
  CFTypeID TypeID;
  CFMutableDictionaryRef Mutable;
  const __CFString *v11;
  char v12;
  uint64_t v13;
  void *v14;
  const __CFNumber *v15;
  const void *v16;
  const void *v17;
  CFTypeID v18;
  __CFArray *v19;
  __CFArray *v20;
  const __CFString *v21;
  const void *Value;
  const void *v23;
  CFTypeID v24;
  const void *v25;
  const void *v26;
  CFTypeID v27;
  const void *v28;
  const __CFString *v29;
  const __CFString *v30;
  CFTypeID v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFDictionary *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    v6 = _PIICreateClearedOptions(a2);
    if (_AIDASOSLog_onceToken != -1)
      dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
    v7 = _AIDASOSLog_log;
    if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "AppleIDAuthSupportCreate";
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_2067E5000, v7, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
    }
    if (v6)
      CFRelease(v6);
  }
  if (AppleIDAuthSupportGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportGetTypeID_inited, &__block_literal_global_130);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    setErrorOOM(a3);
    return Instance;
  }
  if (a2)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(a2))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 7, 0, 0, CFSTR("Options argument is not a dictionary"));
      return 0;
    }
    *(_QWORD *)(Instance + 16) = CFDictionaryCreateMutableCopy(0, 0, a2);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(Instance + 16) = Mutable;
    if (!Mutable)
    {
LABEL_30:
      CFRelease((CFTypeRef)Instance);
      setErrorOOM(a3);
      return 0;
    }
  }
  if (a1)
  {
    v11 = 0;
    *(_QWORD *)(Instance + 96) = stateServerNeg1;
  }
  else
  {
    *(_QWORD *)(Instance + 96) = stateClientNeg1;
    Value = CFDictionaryGetValue(a2, CFSTR("u"));
    if (Value)
    {
      v23 = Value;
      v24 = CFStringGetTypeID();
      if (v24 != CFGetTypeID(v23))
      {
        CFRelease((CFTypeRef)Instance);
        setError(a3, 2, 0, 0, CFSTR("Create function for client passed invalid username key"));
        return 0;
      }
      *(_QWORD *)(Instance + 24) = CFRetain(v23);
    }
    v25 = CFDictionaryGetValue(a2, CFSTR("adsid"));
    if (v25)
    {
      v26 = v25;
      v27 = CFStringGetTypeID();
      if (v27 != CFGetTypeID(v26))
      {
        CFRelease((CFTypeRef)Instance);
        setError(a3, 2, 0, 0, CFSTR("Create function for client passed invalid altDSID key"));
        return 0;
      }
      *(_QWORD *)(Instance + 32) = CFRetain(v26);
    }
    if (!*(_QWORD *)(Instance + 24))
    {
      v28 = *(const void **)(Instance + 32);
      if (!v28)
      {
        CFRelease((CFTypeRef)Instance);
        setError(a3, 2, 0, 0, CFSTR("Create function for client have no username nor dsid"));
        return 0;
      }
      *(_QWORD *)(Instance + 24) = CFRetain(v28);
    }
    v29 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("Protocol"));
    if (v29)
    {
      v30 = v29;
      v31 = CFStringGetTypeID();
      if (v31 == CFGetTypeID(v30))
      {
        v11 = CFSTR("s2k");
        if (CFStringCompare(v30, CFSTR("s2k"), 0) == kCFCompareEqualTo
          || (v11 = CFSTR("s2k_fo"), CFStringCompare(v30, CFSTR("s2k_fo"), 0) == kCFCompareEqualTo))
        {
          v12 = 0;
          goto LABEL_21;
        }
        CFRelease((CFTypeRef)Instance);
        v32 = CFSTR("Protocol selected %@ is not supported");
      }
      else
      {
        CFRelease((CFTypeRef)Instance);
        v32 = CFSTR("Protocol selected for client was not a string: %@");
      }
      setError(a3, 2, 0, 0, v32, v30);
      return 0;
    }
    v11 = 0;
  }
  v12 = 1;
LABEL_21:
  *(_QWORD *)(Instance + 112) = ccsha256_di();
  *(_QWORD *)(Instance + 120) = ccsrp_gp_rfc5054_2048();
  v13 = ccsha256_di();
  *(_QWORD *)(Instance + 128) = v13;
  v14 = malloc_type_calloc(1uLL, *(_QWORD *)(v13 + 8) + *(_QWORD *)(v13 + 16) + 12, 0x56E25510uLL);
  *(_QWORD *)(Instance + 136) = v14;
  if (!v14)
    goto LABEL_30;
  v15 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(Instance + 16), CFSTR("dch"));
  if (v15)
    *(_DWORD *)(Instance + 80) = getIntValue(v15);
  v16 = CFDictionaryGetValue(*(CFDictionaryRef *)(Instance + 16), CFSTR("cpd"));
  *(_QWORD *)(Instance + 56) = v16;
  if (v16)
  {
    v17 = v16;
    v18 = CFDictionaryGetTypeID();
    if (v18 != CFGetTypeID(v17))
    {
      CFRelease((CFTypeRef)Instance);
      setError(a3, 2, 0, 0, CFSTR("client provided data is no a dictionary"));
      return 0;
    }
    CFRetain(*(CFTypeRef *)(Instance + 56));
  }
  ccdigest_init();
  v19 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v19)
    goto LABEL_30;
  v20 = v19;
  *(_QWORD *)(Instance + 88) = v19;
  if ((v12 & 1) != 0)
  {
    CFArrayAppendValue(v19, CFSTR("s2k"));
    v21 = CFSTR("s2k_fo");
    v19 = v20;
  }
  else
  {
    v21 = v11;
  }
  CFArrayAppendValue(v19, v21);
  return Instance;
}

uint64_t stateServerNeg1(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  NSObject *v8;
  const void *Value;
  const void *v10;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  const __CFString *ValueAtIndex;
  const __CFString *v17;
  CFTypeID v18;
  uint64_t result;
  const void *v20;
  const void *v21;
  CFTypeID v22;
  const __CFString *v23;
  const __CFString *v24;
  CFTypeID v25;
  CFIndex v26;
  CFIndex v27;
  CFIndex v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  const void **v32;
  CFIndex v33;
  const __CFDictionary *v34;
  const void *v35;
  uint64_t v36;
  const __CFData *v37;
  const void *v38;
  const __CFData *v39;
  CFIndex v40;
  const __CFData *v41;
  CFIndex Length;
  _QWORD *v43;
  _QWORD *v44;
  CFTypeID v45;
  char *v46;
  char *v47;
  uint64_t v48;
  CFIndex v49;
  UInt8 *v50;
  int started;
  void *v52;
  size_t v53;
  CFDataRef v54;
  __CFDictionary *Mutable;
  __CFDictionary *v56;
  CFIndex v57[4];
  uint64_t v58;
  __CFDictionary **v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const __CFDictionary *v63;
  uint64_t v64;
  CFRange v65;

  v64 = *MEMORY[0x24BDAC8D0];
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v8 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v61 = "stateServerNeg1";
    v62 = 2112;
    v63 = a2;
    _os_log_impl(&dword_2067E5000, v8, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    v31 = CFSTR("server neg1: input dict missing");
    goto LABEL_29;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("ps"));
  if (!Value || (v10 = Value, TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(v10)))
  {
    v31 = CFSTR("key Protocols missing");
    goto LABEL_29;
  }
  v59 = a3;
  Count = CFArrayGetCount((CFArrayRef)v10);
  v13 = Count - 1;
  if (Count >= 1)
  {
    v14 = Count;
    v15 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v10, v15);
      if (!ValueAtIndex)
        break;
      v17 = ValueAtIndex;
      v18 = CFStringGetTypeID();
      if (v18 != CFGetTypeID(v17))
        break;
      result = validateProtocolName(a1, v17, a4);
      if (!(_DWORD)result)
        return result;
      addStringToNegProt(a1, v17);
      if (v13 != v15)
        addStringToNegProt(a1, CFSTR(","));
      if (v14 == ++v15)
        goto LABEL_16;
    }
    v31 = CFSTR("protocol not a string");
    goto LABEL_35;
  }
LABEL_16:
  addStringToNegProt(a1, CFSTR("|"));
  v20 = CFDictionaryGetValue(a2, CFSTR("dch"));
  if (v20)
  {
    v21 = v20;
    v22 = CFNumberGetTypeID();
    if (v22 == CFGetTypeID(v21))
    {
      addStringToNegProt(a1, CFSTR("DisregardChannelBindings"));
      *(_DWORD *)(a1 + 80) = 1;
    }
  }
  v23 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("u"));
  if (!v23 || (v24 = v23, v25 = CFStringGetTypeID(), v25 != CFGetTypeID(v24)))
  {
    v31 = CFSTR("username missing");
    goto LABEL_29;
  }
  if (!*(_QWORD *)(a1 + 144))
  {
    v31 = CFSTR("no callback set by server");
    goto LABEL_37;
  }
  v26 = CFArrayGetCount((CFArrayRef)v10);
  if (v26 < 1)
  {
LABEL_26:
    v31 = CFSTR("server callback failed");
LABEL_37:
    v32 = a4;
    v33 = 4;
    goto LABEL_30;
  }
  v27 = v26;
  v28 = 0;
  while (1)
  {
    v29 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v10, v28);
    v30 = (*(uint64_t (**)(const __CFString *, const __CFString *, _QWORD))(a1 + 144))(v29, v24, *(_QWORD *)(a1 + 152));
    if (v30)
      break;
    if (v27 == ++v28)
      goto LABEL_26;
  }
  v34 = (const __CFDictionary *)v30;
  addStringToNegProt(a1, CFSTR("|"));
  addStringToNegProt(a1, v29);
  v35 = CFDictionaryGetValue(a2, CFSTR("cpd"));
  *(_QWORD *)(a1 + 56) = v35;
  if (v35)
  {
    CFRetain(v35);
    if (!isCFDictionary(*(_QWORD *)(a1 + 56)))
    {
      v31 = CFSTR("Client provided data not a dictionary");
LABEL_35:
      v32 = a4;
      v33 = 3;
      goto LABEL_30;
    }
  }
  v36 = ccdh_ccn_size();
  *(_QWORD *)(a1 + 104) = malloc_type_calloc(1uLL, 4 * (**(_QWORD **)(a1 + 112) + v36) + 48, 0xB9C2C5E9uLL);
  ccsrp_ctx_init();
  if (*(_QWORD *)(a1 + 24))
    abort();
  *(_QWORD *)(a1 + 24) = v24;
  CFRetain(v24);
  v37 = (const __CFData *)CFDictionaryGetValue(v34, CFSTR("s"));
  v38 = CFDictionaryGetValue(v34, CFSTR("i"));
  v39 = (const __CFData *)CFDictionaryGetValue(v34, CFSTR("SRP2KVerifier"));
  CFRelease(v34);
  v65.length = CFArrayGetCount((CFArrayRef)v10);
  v65.location = 0;
  if (CFArrayContainsValue((CFArrayRef)v10, v65, v29))
  {
    if (isCFData((_BOOL8)v37) && isCFNumber((_BOOL8)v38) && isCFData((_BOOL8)v39))
    {
      if (isCFData((_BOOL8)v39)
        && (v40 = CFDataGetLength(v39), v40 == 8 * MEMORY[0x20BCFD788](*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8))))
      {
        v41 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("A2k"));
        if (isCFData((_BOOL8)v41))
        {
          Length = CFDataGetLength(v41);
          if (Length == 8 * MEMORY[0x20BCFD788](*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)))
          {
            v43 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kAppleIDAuthSupportSRPRandomSource"));
            if (!v43)
              goto LABEL_59;
            v44 = v43;
            v45 = CFGetTypeID(v43);
            if (AppleIDAuthSupportRandomGetTypeID_inited != -1)
              dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_169);
            if (v45 == AppleIDAuthSupportRandomGetTypeID_type)
              v58 = v44[2];
            else
LABEL_59:
              v58 = ccDRBGGetRngState();
            v46 = AppleIDAuthSupportCopyString(v24, 1);
            if (!v46)
            {
              setErrorOOM(a4);
              goto LABEL_31;
            }
            v47 = v46;
            v48 = MEMORY[0x20BCFD788](*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8));
            v57[3] = (CFIndex)v57;
            MEMORY[0x24BDAC7A8](v48);
            v57[0] = v49;
            v50 = (UInt8 *)v57 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
            v57[2] = *(_QWORD *)(a1 + 104);
            v57[1] = CFDataGetLength(v37);
            CFDataGetBytePtr(v37);
            CFDataGetBytePtr(v39);
            CFDataGetBytePtr(v41);
            started = ccsrp_server_start_authentication();
            free(v47);
            if (started || (v53 = v57[0], v54 = CFDataCreate(0, v50, v57[0]), bzero(v50, v53), !v54))
            {
              setErrorOOM(a4);
            }
            else
            {
              Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              if (Mutable)
              {
                v56 = Mutable;
                CFDictionarySetValue(Mutable, CFSTR("sp"), v29);
                CFDictionarySetValue(v56, CFSTR("B"), v54);
                CFDictionarySetValue(v56, CFSTR("s"), v37);
                CFDictionarySetValue(v56, CFSTR("i"), v38);
                CFRelease(v54);
                *v59 = v56;
                result = 1;
                v52 = stateServerNeg2;
                goto LABEL_64;
              }
              setErrorOOM(a4);
              CFRelease(v54);
            }
            result = 0;
            v52 = stateInvalid;
LABEL_64:
            *(_QWORD *)(a1 + 96) = v52;
            return result;
          }
        }
        v31 = CFSTR("A wrong size");
      }
      else
      {
        v31 = CFSTR("verifier wrong size");
      }
    }
    else
    {
      v31 = CFSTR("PBKDF or verifier missing");
    }
  }
  else
  {
    v31 = CFSTR("proto not supported");
  }
LABEL_29:
  v32 = a4;
  v33 = 2;
LABEL_30:
  setError(v32, v33, 0, 0, v31);
LABEL_31:
  result = 0;
  *(_QWORD *)(a1 + 96) = stateInvalid;
  return result;
}

uint64_t stateClientNeg1(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  NSObject *v8;
  CFTypeID TypeID;
  uint64_t result;
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v16;
  CFTypeID v17;
  const void *Value;
  CFTypeID v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  CFDataRef v23;
  CFDataRef v24;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v26;
  CFNumberRef v27;
  const void *v28;
  const void *v29;
  const void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFDictionary *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v8 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v33 = "stateClientNeg1";
    v34 = 2112;
    v35 = a2;
    _os_log_impl(&dword_2067E5000, v8, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (a2)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(a2))
    {
      if (CFDictionaryGetCount(a2))
      {
        setError(a4, 2, 0, 0, CFSTR("client neg1: input dict with content"));
        result = 0;
        *(_QWORD *)(a1 + 96) = stateInvalid;
        return result;
      }
    }
  }
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 88));
  v12 = Count - 1;
  if (Count >= 1)
  {
    v13 = Count;
    for (i = 0; i != v13; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 88), i);
      if (!ValueAtIndex || (v16 = ValueAtIndex, v17 = CFStringGetTypeID(), v17 != CFGetTypeID(v16)))
        abort();
      addStringToNegProt(a1, v16);
      if (v12 != i)
        addStringToNegProt(a1, CFSTR(","));
    }
  }
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("kAppleIDAuthSupportSRPRandomSource"));
  if (!Value)
    goto LABEL_20;
  v19 = CFGetTypeID(Value);
  if (AppleIDAuthSupportRandomGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportRandomGetTypeID_inited, &__block_literal_global_169);
  if (v19 != AppleIDAuthSupportRandomGetTypeID_type)
LABEL_20:
    ccDRBGGetRngState();
  v20 = ccdh_ccn_size();
  *(_QWORD *)(a1 + 104) = malloc_type_calloc(1uLL, 4 * (**(_QWORD **)(a1 + 112) + v20) + 48, 0xB4322532uLL);
  ccsrp_ctx_init();
  ccsrp_client_set_noUsernameInX();
  v21 = MEMORY[0x20BCFD788](*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8));
  v22 = 8 * v21;
  MEMORY[0x24BDAC7A8](v21);
  ccsrp_client_start_authentication();
  v23 = CFDataCreate(0, &buf[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)], v22);
  if (v23)
  {
    v24 = v23;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v26 = Mutable;
      addStringToNegProt(a1, CFSTR("|"));
      if (*(_DWORD *)(a1 + 80))
      {
        *(_DWORD *)buf = 1;
        v27 = CFNumberCreate(0, kCFNumberIntType, buf);
        CFDictionarySetValue(v26, CFSTR("dch"), v27);
        addStringToNegProt(a1, CFSTR("DisregardChannelBindings"));
        CFRelease(v27);
      }
      v28 = *(const void **)(a1 + 56);
      if (v28)
        CFDictionarySetValue(v26, CFSTR("cpd"), v28);
      CFDictionarySetValue(v26, CFSTR("A2k"), v24);
      CFDictionarySetValue(v26, CFSTR("ps"), *(const void **)(a1 + 88));
      CFRelease(v24);
      v29 = *(const void **)(a1 + 24);
      if (v29)
        CFDictionarySetValue(v26, CFSTR("u"), v29);
      v30 = *(const void **)(a1 + 32);
      if (v30)
        CFDictionarySetValue(v26, CFSTR("u"), v30);
      CFDictionarySetValue(v26, CFSTR("o"), CFSTR("init"));
      *a3 = v26;
      result = 1;
      v31 = stateClientNeg2;
      goto LABEL_35;
    }
    setErrorOOM(a4);
    CFRelease(v24);
  }
  else
  {
    setErrorOOM(a4);
  }
  result = 0;
  v31 = stateInvalid;
LABEL_35:
  *(_QWORD *)(a1 + 96) = v31;
  return result;
}

const __CFNumber *getIntValue(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID TypeID;
  unsigned int valuePtr;

  valuePtr = 0;
  if (result)
  {
    v1 = result;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      if (CFNumberGetValue(v1, kCFNumberIntType, &valuePtr))
        return (const __CFNumber *)valuePtr;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void AppleIDAuthSupportSetOption(uint64_t a1, const void *a2, const void *a3)
{
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const void *v10;
  __int16 v11;
  const void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v6 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    v7 = 136446722;
    v8 = "AppleIDAuthSupportSetOption";
    v9 = 2112;
    v10 = a2;
    v11 = 2112;
    v12 = a3;
    _os_log_impl(&dword_2067E5000, v6, OS_LOG_TYPE_INFO, "%{public}s: %@ : %@", (uint8_t *)&v7, 0x20u);
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, a3);
}

CFDictionaryRef *AppleIDAuthSupportGetOption(CFDictionaryRef *result, const void *a2)
{
  if (result)
    return (CFDictionaryRef *)CFDictionaryGetValue(result[2], a2);
  return result;
}

uint64_t AppleIDAuthSupportServerSetCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 144) = a2;
  *(_QWORD *)(result + 152) = a3;
  return result;
}

uint64_t AppleIDAuthSupportServerSetServerDataCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 160) = a2;
  *(_QWORD *)(result + 168) = a3;
  return result;
}

CFDataRef AppleIDAuthSupportCreateVerifier(const __CFString *a1, uint64_t a2, const __CFData *a3, const __CFNumber *a4, const __CFString *a5, const void **a6)
{
  CFIndex *v11;
  int v12;
  __CFData *v13;
  const __CFData *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UInt8 *v22;
  int verifier;
  CFDataRef v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  if (CFStringCompare(a1, CFSTR("s2k"), 0))
  {
    if (CFStringCompare(a1, CFSTR("s2k_fo"), 0) == kCFCompareEqualTo)
    {
      v11 = (CFIndex *)ccsha256_di();
      v12 = 1;
      ccsrp_gp_rfc5054_2048();
      goto LABEL_9;
    }
    if (CFStringCompare(a1, CFSTR("s4k"), 0))
    {
      setError(a6, 3, 0, 0, CFSTR("Unsupported protocol: %@"), a1);
      return 0;
    }
    v11 = (CFIndex *)ccsha256_di();
    ccsrp_gp_rfc5054_4096();
  }
  else
  {
    v11 = (CFIndex *)ccsha256_di();
    ccsrp_gp_rfc5054_2048();
  }
  v12 = 0;
LABEL_9:
  if (!getIntValue(a4))
  {
    setError(a6, 2, 0, 0, CFSTR("iteration count invalid %@"), a4);
    return 0;
  }
  v13 = AppleIDAuthSupportPBKDF2SRP(v11, v12, a5, a3, a4, 2, a6);
  if (!v13)
    return 0;
  v14 = v13;
  v15 = ccdh_ccn_size();
  v26[0] = v26;
  v16 = 48 * ((4 * (*v11 + v15) + 95) / 0x30uLL);
  MEMORY[0x24BDAC7A8](v15);
  v18 = &v26[-2 * v17];
  ccsrp_ctx_init();
  v19 = MEMORY[0x20BCFD788](v18[1]);
  v20 = 8 * v19;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (UInt8 *)v26 - v21;
  CFDataGetLength(v14);
  CFDataGetBytePtr(v14);
  CFDataGetLength(a3);
  CFDataGetBytePtr(a3);
  verifier = ccsrp_generate_verifier();
  CFRelease(v14);
  bzero(v18, v16);
  if (verifier || (v24 = CFDataCreate(0, v22, v20), bzero(v22, v20), !v24))
  {
    setErrorOOM(a6);
    return 0;
  }
  return v24;
}

__CFData *AppleIDAuthSupportPBKDF2SRP(CFIndex *a1, int a2, const __CFString *a3, const __CFData *a4, const __CFNumber *a5, int a6, const void **a7)
{
  char *v14;
  char *v15;
  size_t v16;
  uint64_t v17;
  _BYTE *v18;
  unint64_t v19;
  __CFData *Mutable;
  __CFData *v21;
  int v22;
  CFIndex Length;
  size_t v24;
  char *v25;
  size_t v26;
  _QWORD valuePtr[5];
  _BYTE v29[64];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  ccsha256_di();
  valuePtr[0] = 0;
  if (!CFNumberGetValue(a5, kCFNumberLongType, valuePtr))
  {
    setError(a7, 2, 0, 0, CFSTR("Could not get iteration: %@"), a5);
    return 0;
  }
  if (!a2)
  {
    if (valuePtr[0] <= 998)
    {
      setError(a7, 2, 0, 0, CFSTR("iteration too few, server sent %ld"), valuePtr[0]);
      return 0;
    }
    if (CFDataGetLength(a4) <= 7)
    {
      Length = CFDataGetLength(a4);
      setError(a7, 2, 0, 0, CFSTR("salt too short: %ld"), Length);
      return 0;
    }
    v25 = AppleIDAuthSupportCopyString(a3, a6);
    if (v25)
    {
      v15 = v25;
      strlen(v25);
      ccdigest();
      v26 = strlen(v15);
      bzero(v15, v26);
      goto LABEL_7;
    }
LABEL_19:
    setErrorOOM(a7);
    return 0;
  }
  v14 = AppleIDAuthSupportCopyString(a3, a6);
  if (!v14)
    goto LABEL_19;
  v15 = v14;
  strlen(v14);
  ccdigest();
  v16 = strlen(v15);
  bzero(v15, v16);
  v17 = 0;
  v18 = v29;
  do
  {
    v19 = *((unsigned __int8 *)&valuePtr[1] + v17 + 7);
    *(v18 - 1) = hexchar[v19 >> 4];
    *v18 = hexchar[v19 & 0xF];
    v18 += 2;
    ++v17;
  }
  while (v17 != 32);
  v29[63] = 0;
LABEL_7:
  Mutable = CFDataCreateMutable(0, *a1);
  v21 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, *a1);
    CFDataGetLength(a4);
    CFDataGetBytePtr(a4);
    CFDataGetMutableBytePtr(v21);
    v22 = ccpbkdf2_hmac();
    __memset_chk();
    free(v15);
    if (v22)
    {
      setErrorOOM(a7);
      CFRelease(v21);
      return 0;
    }
  }
  else
  {
    setErrorOOM(a7);
    v24 = strlen(v15);
    bzero(v15, v24);
    free(v15);
  }
  return v21;
}

CFDataRef SRPCreateSessionKey(uint64_t a1, const char *a2)
{
  const UInt8 *session_key;
  CFDataRef v5;
  size_t *v6;
  CFIndex v7;
  CFDataRef v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!ccsrp_is_authenticated())
    return 0;
  if (!*(_QWORD *)(a1 + 48))
  {
    v10[0] = 0;
    session_key = (const UInt8 *)ccsrp_get_session_key();
    v5 = CFDataCreate(0, session_key, 0);
    *(_QWORD *)(a1 + 48) = v5;
    if (!v5)
      return 0;
  }
  v6 = (size_t *)ccsha256_di();
  v7 = *v6;
  MEMORY[0x24BDAC7A8]();
  CFDataGetLength(*(CFDataRef *)(a1 + 48));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  strlen(a2);
  cchmac();
  v8 = CFDataCreate(0, (const UInt8 *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  bzero((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), *v6);
  return v8;
}

__CFData *CreateEncryptedData(uint64_t a1, CFDataRef theData, const void **a3)
{
  CFIndex Length;
  unint64_t v7;
  const __CFData *v8;
  const __CFData *v9;
  CFDataRef v10;
  const __CFData *v11;
  CFIndex v12;
  __CFData *Mutable;
  __CFData *v14;
  uint64_t v15;
  const __CFData *v16;

  Length = CFDataGetLength(theData);
  v7 = *(_QWORD *)(ccaes_cbc_encrypt_mode() + 8);
  v8 = SRPCreateSessionKey(a1, "extra data key:");
  if (!v8)
    goto LABEL_8;
  v9 = v8;
  if ((unint64_t)CFDataGetLength(v8) <= 0x1F || (v10 = SRPCreateSessionKey(a1, "extra data iv:")) == 0)
  {
    v16 = v9;
LABEL_7:
    CFRelease(v16);
LABEL_8:
    setErrorOOM(a3);
    v14 = 0;
    *(_QWORD *)(a1 + 96) = stateInvalid;
    return v14;
  }
  v11 = v10;
  v12 = (v7 + Length - 1) / v7 * v7;
  Mutable = CFDataCreateMutable(0, v12);
  if (!theData)
  {
    CFRelease(v9);
    v16 = v11;
    goto LABEL_7;
  }
  v14 = Mutable;
  CFDataSetLength(Mutable, v12);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  CFDataGetBytePtr(v11);
  v15 = cccbc_set_iv();
  MEMORY[0x24BDAC7A8](v15);
  CFDataGetBytePtr(v9);
  cccbc_init();
  CFDataGetLength(theData);
  CFDataGetBytePtr(theData);
  CFDataGetMutableBytePtr(v14);
  ccpad_pkcs7_encrypt();
  CFRelease(v9);
  CFRelease(v11);
  return v14;
}

uint64_t stateInvalid(int a1, int a2, int a3, const void **a4)
{
  setError(a4, 5, 0, 0, CFSTR("Called Step function one too many times (at error)"));
  return 0;
}

uint64_t AppleIDAuthSupportStep(uint64_t a1, int a2, uint64_t a3, const void **a4)
{
  if (a3)
    return (*(uint64_t (**)(void))(a1 + 96))();
  setError(a4, 2, 0, 0, CFSTR("Missing output data ptr"));
  return 0;
}

BOOL AppleIDAuthSupportIsDone(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, int, int, const void **);

  v1 = *(uint64_t (**)(uint64_t, int, int, const void **))(a1 + 96);
  return (char *)v1 == (char *)stateInvalid || v1 == stateDone;
}

uint64_t stateDone(uint64_t a1, int a2, int a3, const void **a4)
{
  *(_QWORD *)(a1 + 96) = stateInvalid;
  setError(a4, 5, 0, 0, CFSTR("Called Step function one too many times (at done)"));
  return 0;
}

BOOL AppleIDAuthSupportSuccess(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96) == (_QWORD)stateDone;
}

uint64_t AppleIDAuthSupportCopyProvidedData(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 56;
  if (a2)
    v2 = 64;
  v3 = *(_QWORD *)(a1 + v2);
  if (v3)
    CFRetain(*(CFTypeRef *)(a1 + v2));
  return v3;
}

CFTypeRef AppleIDAuthSupportCopyContextAppTokens(uint64_t a1)
{
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;
  CFTypeID TypeID;

  v1 = *(const __CFDictionary **)(a1 + 64);
  if (v1
    && (Value = CFDictionaryGetValue(v1, CFSTR("t"))) != 0
    && (v3 = Value, TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v3)))
  {
    return CFRetain(v3);
  }
  else
  {
    return 0;
  }
}

CFDataRef AppleIDAuthSupportCopySessionKey(uint64_t a1)
{
  return SRPCreateSessionKey(a1, "user session key:");
}

CFTypeRef _AppleIDAuthSupportSetStatus(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  CFTypeRef result;

  v4 = *(const void **)(a1 + 72);
  if (v4)
    CFRelease(v4);
  result = CFRetain(cf);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

uint64_t AppleIDAuthSupportGetStatus(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t AppleIDAuthSupportTokenGetTypeID()
{
  if (AppleIDAuthSupportTokenGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_154);
  return tokenid;
}

void GSTokenRelease(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  v2 = (const void *)a1[3];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[4];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[6];
  if (v6)
    CFRelease(v6);
}

_QWORD *_AppleIDAuthSupportCreateToken(const __CFDictionary *a1, const void *a2, const void *a3)
{
  const void *Value;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  _QWORD *Instance;

  Value = CFDictionaryGetValue(a1, CFSTR("GsIdmsToken"));
  if (!Value)
    return 0;
  v7 = Value;
  v8 = CFDictionaryGetValue(a1, CFSTR("sk"));
  if (!v8)
    return 0;
  v9 = v8;
  v10 = CFDictionaryGetValue(a1, CFSTR("c"));
  if (!v10)
    return 0;
  v11 = v10;
  v12 = CFDictionaryGetValue(a1, CFSTR("adsid"));
  if (v12)
    a3 = v12;
  if (AppleIDAuthSupportTokenGetTypeID_inited != -1)
    dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_154);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    Instance[2] = CFRetain(v7);
    Instance[4] = CFRetain(v11);
    Instance[3] = CFRetain(v9);
    Instance[5] = CFRetain(a3);
    Instance[6] = CFRetain(a2);
  }
  return Instance;
}

const __CFDictionary *AppleIDAuthSupportCopyToken(uint64_t a1)
{
  const __CFDictionary *result;

  result = *(const __CFDictionary **)(a1 + 64);
  if (result)
    return (const __CFDictionary *)_AppleIDAuthSupportCreateToken(result, *(const void **)(a1 + 24), *(const void **)(a1 + 24));
  return result;
}

uint64_t AppleIDAuthSupportTokenUpdate(CFTypeRef *a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  const void *v6;
  const void *v7;
  CFTypeID TypeID;
  const void *v9;
  const void *v10;
  CFTypeID v11;

  Value = CFDictionaryGetValue(theDict, CFSTR("GsIdmsToken"));
  if (Value)
  {
    v5 = Value;
    CFRelease(a1[2]);
    a1[2] = CFRetain(v5);
  }
  v6 = CFDictionaryGetValue(theDict, CFSTR("sk"));
  if (v6)
  {
    v7 = v6;
    TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      CFRelease(a1[3]);
      a1[3] = CFRetain(v7);
    }
  }
  v9 = CFDictionaryGetValue(theDict, CFSTR("c"));
  if (v9)
  {
    v10 = v9;
    v11 = CFDataGetTypeID();
    if (v11 == CFGetTypeID(v10))
    {
      CFRelease(a1[4]);
      a1[4] = CFRetain(v10);
    }
  }
  return 1;
}

CFDataRef AppleIDAuthSupportTokenCopyExternalizedVersion(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  CFDataRef Data;
  void *values[2];
  __int128 v8;
  uint64_t v9;
  void *keys[2];
  __int128 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = CFSTR("adsid");
  v2 = *(_QWORD *)(a1 + 40);
  v1 = *(void **)(a1 + 48);
  values[0] = *(void **)(a1 + 16);
  values[1] = v1;
  *(_OWORD *)keys = xmmword_24BFE1008;
  v11 = *(_OWORD *)off_24BFE1018;
  v8 = *(_OWORD *)(a1 + 24);
  v9 = v2;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v3)
    return 0;
  v4 = v3;
  Data = CFPropertyListCreateData(0, v3, kCFPropertyListXMLFormat_v1_0, 0, 0);
  CFRelease(v4);
  return Data;
}

_QWORD *AppleIDAuthSupportTokenCreateWithExternalizedVersion(CFDataRef data, CFErrorRef *error)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID v5;
  const void *Value;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  _QWORD *Instance;

  v3 = (const __CFDictionary *)CFPropertyListCreateWithData(0, data, 0, 0, error);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFGetTypeID(v3);
  if (v5 == CFDictionaryGetTypeID())
  {
    Value = CFDictionaryGetValue(v4, CFSTR("GsIdmsToken"));
    if (Value)
    {
      v7 = Value;
      v8 = CFDictionaryGetValue(v4, CFSTR("sk"));
      if (v8)
      {
        v9 = v8;
        v10 = CFDictionaryGetValue(v4, CFSTR("c"));
        if (v10)
        {
          v11 = v10;
          v12 = CFDictionaryGetValue(v4, CFSTR("adsid"));
          if (v12)
          {
            v13 = v12;
            v14 = CFDictionaryGetValue(v4, CFSTR("u"));
            if (v14)
            {
              v15 = v14;
              if (AppleIDAuthSupportTokenGetTypeID_inited != -1)
                dispatch_once(&AppleIDAuthSupportTokenGetTypeID_inited, &__block_literal_global_154);
              Instance = (_QWORD *)_CFRuntimeCreateInstance();
              if (Instance)
              {
                Instance[2] = CFRetain(v7);
                Instance[4] = CFRetain(v11);
                Instance[3] = CFRetain(v9);
                Instance[5] = CFRetain(v13);
                Instance[6] = CFRetain(v15);
              }
              else
              {
                setErrorOOM((const void **)error);
              }
              goto LABEL_12;
            }
            setError((const void **)error, 2, 0, 0, CFSTR("Missing username key"));
          }
          else
          {
            setError((const void **)error, 2, 0, 0, CFSTR("Missing aDSID key"));
          }
        }
        else
        {
          setError((const void **)error, 2, 0, 0, CFSTR("Missing cookie key"));
        }
      }
      else
      {
        setError((const void **)error, 2, 0, 0, CFSTR("Missing session key"));
      }
    }
    else
    {
      setError((const void **)error, 2, 0, 0, CFSTR("Missing GS iDMS key"));
    }
  }
  else
  {
    setError((const void **)error, 2, 0, 0, CFSTR("token is not a property list"));
  }
  Instance = 0;
LABEL_12:
  CFRelease(v4);
  return Instance;
}

void RandomRelease(uint64_t a1)
{
  free(*(void **)(a1 + 16));
  free(*(void **)(a1 + 24));
}

void addStringToNegProt(uint64_t a1, const __CFString *a2)
{
  char *v2;
  char *v3;

  v2 = AppleIDAuthSupportCopyString(a2, 0);
  if (v2)
  {
    v3 = v2;
    strlen(v2);
    ccdigest_update();
    free(v3);
  }
}

uint64_t stateClientNeg2(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t session_key_length;
  UInt8 *v9;
  NSObject *v10;
  const __CFString *Value;
  const __CFString *v12;
  CFTypeID TypeID;
  const __CFString *v14;
  const void **v15;
  const __CFDictionary *v16;
  uint64_t result;
  void *v18;
  int v19;
  const void *v20;
  CFTypeID v21;
  CFTypeID v22;
  const __CFString *v23;
  const __CFString *v24;
  CFTypeID v25;
  const __CFData *v26;
  const __CFData *v27;
  CFTypeID v28;
  const __CFNumber *v29;
  const __CFNumber *v30;
  CFTypeID v31;
  const __CFData *v32;
  const void *v33;
  _BOOL4 v34;
  int v35;
  unint64_t Length;
  const __CFString *v37;
  char *v38;
  const __CFData *v39;
  char *v40;
  __CFData *v41;
  const __CFData *v42;
  int v43;
  CFDataRef v44;
  __CFDictionary *Mutable;
  __CFDictionary *v46;
  const void *v47;
  const void *v48;
  const UInt8 *BytePtr;
  const __CFString *v50;
  CFDataRef v51;
  const __CFNumber *v52;
  const __CFData *v53;
  uint64_t v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  const __CFDictionary *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  session_key_length = ccsrp_get_session_key_length();
  v9 = (UInt8 *)&BytePtr - ((MEMORY[0x24BDAC7A8](session_key_length) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v10 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v56 = "stateClientNeg2";
    v57 = 2112;
    v58 = a2;
    _os_log_impl(&dword_2067E5000, v10, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    v14 = CFSTR("client neg2: input dict missing");
    goto LABEL_14;
  }
  Value = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("sp"));
  if (!Value || (v12 = Value, TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v12)))
  {
    v14 = CFSTR("selected protocol key missing");
    goto LABEL_12;
  }
  if (CFStringCompare(v12, CFSTR("s2k"), 0))
  {
    if (CFStringCompare(v12, CFSTR("s2k_fo"), 0))
    {
      setError(a4, 3, a2, 0, CFSTR("unknown protocol: %@"), v12);
      goto LABEL_16;
    }
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  result = validateProtocolName(a1, v12, a4);
  if ((_DWORD)result)
  {
    addStringToNegProt(a1, CFSTR("|"));
    addStringToNegProt(a1, v12);
    v20 = CFDictionaryGetValue(a2, CFSTR("c"));
    if (v20)
    {
      v21 = CFStringGetTypeID();
      if (v21 != CFGetTypeID(v20))
      {
        v22 = CFDataGetTypeID();
        if (v22 != CFGetTypeID(v20))
        {
          v14 = CFSTR("cookie not a data object");
          goto LABEL_12;
        }
      }
    }
    v23 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("Password"));
    if (v23)
    {
      v24 = v23;
      v25 = CFStringGetTypeID();
      if (v25 == CFGetTypeID(v24))
      {
        LODWORD(v54) = v19;
        v26 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("s"));
        if (v26 && (v27 = v26, v28 = CFDataGetTypeID(), v28 == CFGetTypeID(v27)))
        {
          v53 = v27;
          v29 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("i"));
          if (v29 && (v30 = v29, v31 = CFNumberGetTypeID(), v31 == CFGetTypeID(v30)))
          {
            v52 = v30;
            v32 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("B"));
            if (isCFData((_BOOL8)v32))
            {
              v33 = CFDictionaryGetValue(a2, CFSTR("p"));
              v34 = v33 != 0;
              if (v33)
                v35 = 2;
              else
                v35 = 1;
              v51 = v32;
              Length = CFDataGetLength(v32);
              if (Length >= ccsrp_get_session_key_length())
              {
                v37 = *(const __CFString **)(a1 + 32);
                if (!v37)
                  v37 = *(const __CFString **)(a1 + 24);
                v50 = v37;
                v38 = AppleIDAuthSupportCopyString(v37, v35);
                v39 = v53;
                if (!v38)
                  goto LABEL_47;
                v40 = v38;
                v41 = AppleIDAuthSupportPBKDF2SRP(*(CFIndex **)(a1 + 112), v54, v24, v53, v52, 2 * v34, a4);
                if (!v41)
                {
                  free(v40);
                  goto LABEL_16;
                }
                v42 = v41;
                v54 = *(_QWORD *)(a1 + 104);
                v52 = (const __CFNumber *)CFDataGetLength(v41);
                BytePtr = CFDataGetBytePtr(v42);
                CFDataGetLength(v39);
                CFDataGetBytePtr(v39);
                CFDataGetBytePtr(v51);
                v43 = ccsrp_client_process_challenge();
                CFRelease(v42);
                free(v40);
                if (v43)
                  goto LABEL_47;
                v44 = CFDataCreate(0, v9, session_key_length);
                bzero(v9, session_key_length);
                if (v44)
                {
                  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  if (Mutable)
                  {
                    v46 = Mutable;
                    CFDictionarySetValue(Mutable, CFSTR("u"), v50);
                    CFDictionarySetValue(v46, CFSTR("M1"), v44);
                    CFDictionarySetValue(v46, CFSTR("o"), CFSTR("complete"));
                    if (v20)
                      CFDictionarySetValue(v46, CFSTR("c"), v20);
                    v47 = *(const void **)(a1 + 56);
                    if (v47)
                      CFDictionarySetValue(v46, CFSTR("cpd"), v47);
                    v48 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("sc"));
                    if (isCFData((_BOOL8)v48))
                      CFDictionarySetValue(v46, CFSTR("sc"), v48);
                    CFRelease(v44);
                    *a3 = v46;
                    result = 1;
                    v18 = stateClientNeg3;
                    goto LABEL_17;
                  }
                  setErrorOOM(a4);
                  CFRelease(v44);
                }
                else
                {
LABEL_47:
                  setErrorOOM(a4);
                }
LABEL_16:
                result = 0;
                v18 = stateInvalid;
LABEL_17:
                *(_QWORD *)(a1 + 96) = v18;
                return result;
              }
              v14 = CFSTR("B wrong size");
              goto LABEL_14;
            }
            v14 = CFSTR("B missing from server");
          }
          else
          {
            v14 = CFSTR("iteration missing from server");
          }
        }
        else
        {
          v14 = CFSTR("salt missing from server");
        }
LABEL_12:
        v15 = a4;
        v16 = a2;
LABEL_15:
        setError(v15, 2, v16, 0, v14);
        goto LABEL_16;
      }
    }
    v14 = CFSTR("password missing in options");
LABEL_14:
    v15 = a4;
    v16 = 0;
    goto LABEL_15;
  }
  return result;
}

uint64_t validateProtocolName(uint64_t a1, CFStringRef theString, const void **a3)
{
  uint64_t result;

  if (CFStringFind(theString, CFSTR(","), 0).location != -1)
  {
    setError(a3, 3, 0, 0, CFSTR("protocol with , not supporteted"));
LABEL_5:
    result = 0;
    *(_QWORD *)(a1 + 96) = stateInvalid;
    return result;
  }
  if (CFStringFind(theString, CFSTR("|"), 0).location != -1)
  {
    setError(a3, 3, 0, 0, CFSTR("protocol with | not supporteted"));
    goto LABEL_5;
  }
  return 1;
}

BOOL isCFNumber(_BOOL8 result)
{
  const void *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = (const void *)result;
    TypeID = CFNumberGetTypeID();
    return TypeID == CFGetTypeID(v1);
  }
  return result;
}

const __CFData *stateClientNeg3(uint64_t a1, const __CFDictionary *a2, uint64_t a3, const void **a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const void *Value;
  const void *v11;
  CFTypeID TypeID;
  CFIndex Length;
  const __CFData *v14;
  CFTypeID v15;
  const __CFData *v16;
  const __CFData *v17;
  CFTypeID v18;
  const __CFData *v19;
  const __CFData *v20;
  CFTypeID v21;
  CFIndex v22;
  uint64_t v23;
  const __CFData *v24;
  const __CFData *v25;
  const __CFString *v26;
  const void **v27;
  CFIndex v28;
  const __CFDictionary *v29;
  const __CFData *result;
  void *v31;
  const void *v32;
  CFIndex v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const __CFDictionary *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = **(_QWORD **)(a1 + 128);
  v8 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v8);
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v9 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v35 = "stateClientNeg3";
    v36 = 2112;
    v37 = a2;
    _os_log_impl(&dword_2067E5000, v9, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    v26 = CFSTR("client neg3: input dict missing");
LABEL_26:
    v27 = a4;
    v28 = 2;
LABEL_27:
    v29 = 0;
    goto LABEL_28;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("M2"));
  if (!Value || (v11 = Value, TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(v11)))
  {
    v26 = CFSTR("M2 missing (bad password)");
    goto LABEL_23;
  }
  Length = CFDataGetLength((CFDataRef)v11);
  if (Length != ccsrp_get_session_key_length())
  {
    v26 = CFSTR("M2 wrong size");
    goto LABEL_26;
  }
  CFDataGetBytePtr((CFDataRef)v11);
  if ((ccsrp_client_verify_session() & 1) == 0)
  {
    v26 = CFSTR("server passed bad M2");
    goto LABEL_33;
  }
  addStringToNegProt(a1, CFSTR("|"));
  v14 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("spd"));
  if (v14)
  {
    v15 = CFDataGetTypeID();
    if (v15 == CFGetTypeID(v14))
      addDataToNegProt(a1, v14);
  }
  addStringToNegProt(a1, CFSTR("|"));
  v16 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("sc"));
  if (v16)
  {
    v17 = v16;
    v18 = CFDataGetTypeID();
    if (v18 == CFGetTypeID(v17))
      addDataToNegProt(a1, v17);
  }
  addStringToNegProt(a1, CFSTR("|"));
  v19 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("np"));
  if (v19)
  {
    v20 = v19;
    v21 = CFDataGetTypeID();
    if (v21 == CFGetTypeID(v20))
    {
      v22 = CFDataGetLength(v20);
      v23 = *(_QWORD *)(a1 + 128);
      if (v22 != *(_QWORD *)v23)
      {
        v33 = CFDataGetLength(v20);
        setError(a4, 2, 0, 0, CFSTR("NegProto hash too short: %d"), v33);
        goto LABEL_29;
      }
      (*(void (**)(uint64_t, _QWORD, uint8_t *))(v23 + 56))(v23, *(_QWORD *)(a1 + 136), &buf[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      v24 = SRPCreateSessionKey(a1, "HMAC key:");
      if (!v24)
      {
        setErrorOOM(a4);
        goto LABEL_29;
      }
      v25 = v24;
      CFDataGetLength(v24);
      CFDataGetBytePtr(v25);
      cchmac();
      CFRelease(v25);
      CFDataGetBytePtr(v20);
      if (cc_cmp_safe())
      {
        v26 = CFSTR("NegotationProtection HMAC invalid");
LABEL_33:
        v27 = a4;
        v28 = 5;
        goto LABEL_27;
      }
      goto LABEL_34;
    }
    v26 = CFSTR("neg proto field missing");
LABEL_23:
    v27 = a4;
    v28 = 2;
    v29 = a2;
LABEL_28:
    setError(v27, v28, v29, 0, v26);
LABEL_29:
    result = 0;
    goto LABEL_30;
  }
LABEL_34:
  if (!v14
    || (result = CreateDecryptedData(a1, v14, a4)) != 0
    && (v32 = result,
        *(_QWORD *)(a1 + 64) = CFPropertyListCreateWithData(0, result, 0, 0, (CFErrorRef *)a4),
        CFRelease(v32),
        result = (const __CFData *)isCFDictionary(*(_QWORD *)(a1 + 64)),
        (_DWORD)result))
  {
    result = (const __CFData *)1;
    v31 = stateDone;
    goto LABEL_31;
  }
LABEL_30:
  v31 = stateInvalid;
LABEL_31:
  *(_QWORD *)(a1 + 96) = v31;
  return result;
}

uint64_t addDataToNegProt(int a1, CFDataRef theData)
{
  CFDataGetLength(theData);
  ccdigest_update();
  CFDataGetLength(theData);
  CFDataGetBytePtr(theData);
  return ccdigest_update();
}

__CFData *CreateDecryptedData(uint64_t a1, const __CFData *a2, const void **a3)
{
  uint64_t v6;
  const __CFData *v7;
  const __CFData *v8;
  CFDataRef v9;
  CFDataRef v10;
  CFIndex Length;
  __CFData *Mutable;
  CFIndex v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v6 = ccaes_cbc_decrypt_mode();
  if ((unint64_t)CFDataGetLength(a2) % *(_QWORD *)(v6 + 8))
  {
    setError(a3, 5, 0, 0, CFSTR("Encrypted PKCS7 padded data not on block aligned"));
LABEL_11:
    Mutable = 0;
LABEL_12:
    *(_QWORD *)(a1 + 96) = stateInvalid;
    return Mutable;
  }
  v7 = SRPCreateSessionKey(a1, "extra data key:");
  if (!v7)
  {
LABEL_10:
    setErrorOOM(a3);
    goto LABEL_11;
  }
  v8 = v7;
  if ((unint64_t)CFDataGetLength(v7) <= 0x1F || (v9 = SRPCreateSessionKey(a1, "extra data iv:")) == 0)
  {
    CFRelease(v8);
    goto LABEL_10;
  }
  v10 = v9;
  Length = CFDataGetLength(a2);
  Mutable = CFDataCreateMutable(0, Length);
  if (!Mutable)
  {
    CFRelease(v8);
    CFRelease(v10);
    setErrorOOM(a3);
    goto LABEL_12;
  }
  v13 = CFDataGetLength(a2);
  CFDataSetLength(Mutable, v13);
  MEMORY[0x24BDAC7A8](v14);
  CFDataGetBytePtr(v10);
  v15 = cccbc_set_iv();
  MEMORY[0x24BDAC7A8](v15);
  CFDataGetBytePtr(v8);
  cccbc_init();
  CFDataGetLength(a2);
  CFDataGetBytePtr(a2);
  CFDataGetMutableBytePtr(Mutable);
  v16 = ccpad_pkcs7_decrypt();
  if (v16 >= CFDataGetLength(a2))
    CreateDecryptedData_cold_1();
  CFDataSetLength(Mutable, v16);
  CFRelease(v10);
  CFRelease(v8);
  return Mutable;
}

uint64_t stateServerNeg2(uint64_t a1, const __CFDictionary *a2, __CFDictionary **a3, const void **a4)
{
  uint64_t session_key_length;
  uint64_t v9;
  UInt8 *v10;
  CFIndex v11;
  uint64_t v12;
  uint64_t v13;
  const UInt8 *v14;
  NSObject *v15;
  const void *Value;
  const void *v17;
  CFTypeID TypeID;
  CFIndex Length;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v21;
  CFDataRef v22;
  uint64_t (*v23)(_QWORD, _QWORD);
  __CFData *EncryptedData;
  const __CFData *Data;
  const __CFData *v26;
  uint64_t result;
  __CFDictionary *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  CFTypeID v32;
  const __CFData *v33;
  const __CFData *v34;
  CFDataRef v35;
  CFDataRef v36;
  NSObject *v37;
  __CFDictionary *v38;
  uint64_t v39;
  __CFDictionary **v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const __CFDictionary *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  session_key_length = ccsrp_get_session_key_length();
  v9 = MEMORY[0x24BDAC7A8](session_key_length);
  v10 = (UInt8 *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = **(_QWORD **)(a1 + 128);
  v12 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (const UInt8 *)&v39 - v13;
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v15 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v42 = "stateServerNeg2";
    v43 = 2112;
    v44 = a2;
    _os_log_impl(&dword_2067E5000, v15, OS_LOG_TYPE_INFO, "%{public}s: %@", buf, 0x16u);
  }
  if (!a2)
  {
    setError(a4, 2, 0, 0, CFSTR("server neg2: input dict missing"));
    goto LABEL_21;
  }
  v40 = a3;
  Value = CFDictionaryGetValue(a2, CFSTR("M1"));
  if (!Value || (v17 = Value, TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(v17)))
  {
    setError(a4, 2, 0, 0, CFSTR("M1 missing"));
    goto LABEL_21;
  }
  Length = CFDataGetLength((CFDataRef)v17);
  if (Length != ccsrp_get_session_key_length())
  {
    setError(a4, 2, 0, 0, CFSTR("M1 wrong size"));
    goto LABEL_21;
  }
  CFDataGetBytePtr((CFDataRef)v17);
  if ((ccsrp_server_verify_session() & 1) == 0)
  {
    setError(a4, 2, 0, 0, CFSTR("session bad"));
    goto LABEL_21;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
LABEL_23:
    setErrorOOM(a4);
    goto LABEL_21;
  }
  v21 = Mutable;
  v22 = CFDataCreate(0, v10, session_key_length);
  bzero(v10, session_key_length);
  if (!v22)
    goto LABEL_22;
  CFDictionarySetValue(v21, CFSTR("M2"), v22);
  CFRelease(v22);
  addStringToNegProt(a1, CFSTR("|"));
  v23 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 160);
  if (!v23)
    goto LABEL_26;
  EncryptedData = (__CFData *)v23(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 168));
  if (!isCFDictionary((_BOOL8)EncryptedData))
  {
    if (!EncryptedData)
      goto LABEL_26;
    goto LABEL_25;
  }
  Data = CFPropertyListCreateData(0, EncryptedData, kCFPropertyListXMLFormat_v1_0, 0, 0);
  *(_QWORD *)(a1 + 64) = EncryptedData;
  if (!Data)
  {
LABEL_22:
    CFRelease(v21);
    goto LABEL_23;
  }
  v26 = Data;
  EncryptedData = CreateEncryptedData(a1, Data, a4);
  CFRelease(v26);
  if (!EncryptedData)
  {
    CFRelease(v21);
    return 0;
  }
  CFDictionarySetValue(v21, CFSTR("spd"), EncryptedData);
  addDataToNegProt(a1, EncryptedData);
LABEL_25:
  CFRelease(EncryptedData);
LABEL_26:
  v28 = v21;
  addStringToNegProt(a1, CFSTR("|"));
  v29 = CFDictionaryGetValue(a2, CFSTR("sc"));
  v30 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("sc"));
  v31 = v30;
  if (!v29)
  {
    if (!v30)
      goto LABEL_34;
    CFRelease(v21);
    setError(a4, 2, 0, 0, CFSTR("server certificate field is missing from client"));
LABEL_21:
    result = 0;
    *(_QWORD *)(a1 + 96) = stateInvalid;
    return result;
  }
  v32 = CFDataGetTypeID();
  if (v32 != CFGetTypeID(v29))
  {
    CFRelease(v28);
    setError(a4, 2, 0, 0, CFSTR("server certificate field is not a data element"));
    goto LABEL_21;
  }
  v21 = v28;
  if (isCFData((_BOOL8)v31) && !CFEqual(v31, v29) && !*(_DWORD *)(a1 + 80))
  {
    CFRelease(v28);
    setError(a4, 2, 0, 0, CFSTR("server certificate field is not a same"));
    goto LABEL_21;
  }
  addDataToNegProt(a1, (CFDataRef)v29);
LABEL_34:
  addStringToNegProt(a1, CFSTR("|"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 56))();
  v33 = SRPCreateSessionKey(a1, "HMAC key:");
  if (!v33)
  {
    setErrorOOM(a4);
    v38 = v21;
LABEL_44:
    CFRelease(v38);
    goto LABEL_21;
  }
  v34 = v33;
  CFDataGetLength(v33);
  CFDataGetBytePtr(v34);
  cchmac();
  CFRelease(v34);
  v35 = CFDataCreate(0, v14, v11);
  if (!v35)
  {
    setErrorOOM(a4);
    v38 = v28;
    goto LABEL_44;
  }
  v36 = v35;
  CFDictionarySetValue(v28, CFSTR("np"), v35);
  CFRelease(v36);
  *v40 = v28;
  if (_AIDASOSLog_onceToken != -1)
    dispatch_once(&_AIDASOSLog_onceToken, &__block_literal_global_1);
  v37 = _AIDASOSLog_log;
  if (os_log_type_enabled((os_log_t)_AIDASOSLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v42 = "stateServerNeg2";
    _os_log_impl(&dword_2067E5000, v37, OS_LOG_TYPE_INFO, "%{public}s: auth done", buf, 0xCu);
  }
  *(_QWORD *)(a1 + 96) = stateDone;
  return 1;
}

void SendRequestAndCreateResponse_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2067E5000, log, OS_LOG_TYPE_DEBUG, "success", v1, 2u);
}

void allowSkipSettingOnInternalHardware_cold_1(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "allowSkipSettingOnInternalHardware";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_2067E5000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: isInternal: %d", (uint8_t *)&v2, 0x12u);
}

void CreateDecryptedData_cold_1()
{
  __assert_rtn("CreateDecryptedData", "AppleIDAuthSupport.c", 970, "size < CFDataGetLength(encData)");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecPolicyCreateAppleGSService()
{
  return MEMORY[0x24BDE8C08]();
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C78](server, hostname);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x24BDAD340]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x24BDAD378]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x24BDAD380]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x24BDAD3B0]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x24BDAD528]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x24BDAD530]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x24BDAD640]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x24BDAD648]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x24BDAD650]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x24BDAD660]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x24BDAD680]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x24BDAD688]();
}

uint64_t cchmac()
{
  return MEMORY[0x24BDAD6A8]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x24BDAD6B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x24BDAD6B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x24BDAD6C0]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x24BDAD740]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x24BDAD748]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng_pbkdf2_prng_init()
{
  return MEMORY[0x24BDAD760]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x24BDAD850]();
}

uint64_t ccsrp_client_set_noUsernameInX()
{
  return MEMORY[0x24BDAD858]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x24BDAD860]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x24BDAD868]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x24BDAD870]();
}

uint64_t ccsrp_generate_verifier()
{
  return MEMORY[0x24BDAD890]();
}

uint64_t ccsrp_get_session_key()
{
  return MEMORY[0x24BDAD898]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x24BDAD8A0]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x24BDAD8B0]();
}

uint64_t ccsrp_gp_rfc5054_4096()
{
  return MEMORY[0x24BDAD8C0]();
}

uint64_t ccsrp_is_authenticated()
{
  return MEMORY[0x24BDAD8D0]();
}

uint64_t ccsrp_server_start_authentication()
{
  return MEMORY[0x24BDAD8D8]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x24BDAD8E0]();
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x24BEDBFE8](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x24BEDC000](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t usprep_openByType()
{
  return MEMORY[0x24BEDC318]();
}

uint64_t usprep_prepare()
{
  return MEMORY[0x24BEDC320]();
}

