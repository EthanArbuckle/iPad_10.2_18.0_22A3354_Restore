@implementation CLCertificatePinningHelper

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global);
}

id __40__CLCertificatePinningHelper_initialize__block_invoke()
{
  id result;
  _QWORD v1[10];
  _QWORD v2[11];

  v2[10] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("gsp10-ssl.apple.com");
  v2[0] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[1] = CFSTR("gs-loc.apple.com");
  v2[1] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2[2] = CFSTR("1.2.840.113635.100.6.27.35");
  v1[2] = CFSTR("iphone-ld.apple.com");
  v1[3] = CFSTR("configuration.apple.com");
  v2[3] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[4] = CFSTR("cl5.apple.com");
  v2[4] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[5] = CFSTR("cl4.apple.com");
  v2[5] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[6] = CFSTR("cl3.apple.com");
  v2[6] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[7] = CFSTR("cl2.apple.com");
  v2[7] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[8] = CFSTR("ingest.apple-studies.com");
  v2[8] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v1[9] = CFSTR("ingest.stg.apple-studies.com");
  v2[9] = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  result = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 10);
  sLeafOIDs = (uint64_t)result;
  return result;
}

+ (id)knownHosts
{
  return (id)objc_msgSend((id)sLeafOIDs, "allKeys");
}

+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  __SecTrust *v9;
  uint64_t v10;
  void *v11;
  const void *AppleSSLPinned;
  const void *v13;
  OSStatus v14;
  SecTrustResultType v15;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  CFIndex Code;
  CFErrorDomain Domain;
  uint64_t v32;
  CFIndex v33;
  CFErrorDomain v34;
  CFErrorRef err;
  SecTrustResultType result;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB7410]))
    goto LABEL_18;
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "host");
  v9 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust");
  v10 = objc_msgSend((id)sLeafOIDs, "objectForKeyedSubscript:", v8);
  if (v10)
  {
    v11 = (void *)v10;
    if (v10 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    {
      if (onceToken_Utility_Default != -1)
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
      v21 = logObject_Utility_Default;
      if (!os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_INFO))
      {
        v17 = 3;
        goto LABEL_21;
      }
      *(_DWORD *)buf = 68289283;
      v38 = 0;
      v39 = 2082;
      v40 = &unk_2392598E1;
      v41 = 2081;
      v42 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_239256000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning Empty pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
      v17 = 3;
      goto LABEL_19;
    }
    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();
    if (AppleSSLPinned)
    {
      v13 = AppleSSLPinned;
      v14 = SecTrustSetPolicies(v9, AppleSSLPinned);
      CFRelease(v13);
      v15 = kSecTrustResultInvalid;
      result = kSecTrustResultInvalid;
      if (v14)
      {
LABEL_8:
        if (v15 == kSecTrustResultProceed || v15 == kSecTrustResultUnspecified)
          v17 = 1;
        else
          v17 = 2;
LABEL_19:
        if (onceToken_Utility_Default != -1)
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
        goto LABEL_21;
      }
      err = 0;
      if (SecTrustEvaluateWithError(v9, &err))
      {
        SecTrustGetTrustResult(v9, &result);
        v15 = result;
        goto LABEL_8;
      }
      if (onceToken_Utility_Default != -1)
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
      v29 = logObject_Utility_Default;
      if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_ERROR))
      {
        Code = CFErrorGetCode(err);
        Domain = CFErrorGetDomain(err);
        *(_DWORD *)buf = 68289539;
        v38 = 0;
        v39 = 2082;
        v40 = &unk_2392598E1;
        v41 = 2049;
        v42 = Code;
        v43 = 2113;
        v44 = (uint64_t)Domain;
        _os_log_impl(&dword_239256000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (onceToken_Utility_Default != -1)
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
      }
      v32 = logObject_Utility_Default;
      if (!os_signpost_enabled((os_log_t)logObject_Utility_Default))
      {
LABEL_50:
        v17 = 2;
        goto LABEL_19;
      }
      v33 = CFErrorGetCode(err);
      v34 = CFErrorGetDomain(err);
      *(_DWORD *)buf = 68289539;
      v38 = 0;
      v39 = 2082;
      v40 = &unk_2392598E1;
      v41 = 2049;
      v42 = v33;
      v43 = 2113;
      v44 = (uint64_t)v34;
      v26 = "Can't SecTrustEvaluate returned the error";
      v27 = "{\"msg%{public}.0s\":\"Can't SecTrustEvaluate returned the error\", \"errorCode\":%{private}ld, \"error\":%{"
            "private, location:escape_only}@}";
      v28 = v32;
    }
    else
    {
      if (onceToken_Utility_Default != -1)
        dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
      v22 = logObject_Utility_Default;
      if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        v38 = 0;
        v39 = 2082;
        v40 = &unk_2392598E1;
        v41 = 2082;
        v42 = objc_msgSend(v8, "UTF8String");
        v43 = 2082;
        v44 = objc_msgSend(v11, "UTF8String");
        _os_log_impl(&dword_239256000, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"leafOID\":%{public, location:escape_only}s}", buf, 0x26u);
        if (onceToken_Utility_Default != -1)
          dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
      }
      v23 = logObject_Utility_Default;
      if (!os_signpost_enabled((os_log_t)logObject_Utility_Default))
      {
        v17 = 2;
        goto LABEL_21;
      }
      v24 = objc_msgSend(v8, "UTF8String");
      v25 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 68289538;
      v38 = 0;
      v39 = 2082;
      v40 = &unk_2392598E1;
      v41 = 2082;
      v42 = v24;
      v43 = 2082;
      v44 = v25;
      v26 = "Unable to create a security policy";
      v27 = "{\"msg%{public}.0s\":\"Unable to create a security policy\", \"host\":%{public, location:escape_only}s, \"le"
            "afOID\":%{public, location:escape_only}s}";
      v28 = v23;
    }
    _os_signpost_emit_with_name_impl(&dword_239256000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v26, v27, buf, 0x26u);
    goto LABEL_50;
  }
  if (onceToken_Utility_Default != -1)
    dispatch_once(&onceToken_Utility_Default, &__block_literal_global_29);
  v18 = logObject_Utility_Default;
  v17 = 0;
  if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v38 = 0;
    v39 = 2082;
    v40 = &unk_2392598E1;
    v41 = 2081;
    v42 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_239256000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning No pinning rule for host\", \"host\":%{private, location:escape_only}s}", buf, 0x1Cu);
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
LABEL_21:
  v19 = logObject_Utility_Default;
  if (os_log_type_enabled((os_log_t)logObject_Utility_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v38 = 0;
    v39 = 2082;
    v40 = &unk_2392598E1;
    v41 = 2049;
    v42 = v17;
    _os_log_impl(&dword_239256000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#VerifyHost result\", \"result\":%{private}lu}", buf, 0x1Cu);
  }
  if (v17 == 2)
  {
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 2, 0);
  }
  else if (v17 == 1)
  {
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
  }
  return v17;
}

@end
