@implementation CRURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __SecTrust *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  __SecCertificate *ValueAtIndex;
  CFDataRef v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int IsValidWithProtectionSpace;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  int v42;
  CFDataRef v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  handleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v42) = 0;
    _os_log_impl(&dword_1D1401000, v8, OS_LOG_TYPE_DEFAULT, "didReceiveChallenge", (uint8_t *)&v42, 2u);
  }

  objc_msgSend_protectionSpace(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__SecTrust *)objc_msgSend_serverTrust(v12, v13, v14, v15);

  v17 = SecTrustCopyCertificateChain(v16);
  if (v17)
  {
    v18 = v17;
    if (CFArrayGetCount(v17) < 1)
      ValueAtIndex = 0;
    else
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v18, 0);
    CFRelease(v18);
  }
  else
  {
    ValueAtIndex = 0;
  }
  v20 = SecCertificateCopyData(ValueAtIndex);
  objc_msgSend_protectionSpace(v6, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  IsValidWithProtectionSpace = objc_msgSend_trustIsValidWithProtectionSpace_(CRURLSessionDelegate, v25, (uint64_t)v24, v26);

  handleForCategory();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 138412546;
    v43 = v20;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_1D1401000, v28, OS_LOG_TYPE_DEFAULT, "Certificate:%@:%@", (uint8_t *)&v42, 0x16u);
  }

  if (IsValidWithProtectionSpace)
  {
    v32 = (void *)MEMORY[0x1E0CB39A8];
    objc_msgSend_protectionSpace(v6, v29, v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_serverTrust(v33, v34, v35, v36);
    objc_msgSend_credentialForTrust_(v32, v38, v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v40);
  }
  else
  {
    handleForCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1D140D4F4();

    v7[2](v7, 2, 0);
  }

}

+ (BOOL)trustIsValidWithProtectionSpace:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __SecTrust *v12;
  void *v13;
  const void *AppleAST2Service;
  NSObject *v15;
  OSStatus v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  OSStatus TrustResult;
  NSObject *v22;
  BOOL v24;
  NSObject *v25;
  SecTrustResultType result;
  CFErrorRef error;
  uint8_t buf[4];
  OSStatus v30;
  __int16 v31;
  SecTrustResultType v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7 = v3;
  error = 0;
  if (!v3)
  {
    handleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1D140D5E8();

    goto LABEL_10;
  }
  v8 = objc_msgSend_serverTrust(v3, v4, v5, v6);
  if (!v8)
  {
LABEL_10:
    handleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1D140D5BC();

    v12 = 0;
    v19 = 0;
    goto LABEL_13;
  }
  v12 = (__SecTrust *)v8;
  objc_msgSend_host(v7, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AppleAST2Service = (const void *)SecPolicyCreateAppleAST2Service();

  handleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1401000, v15, OS_LOG_TYPE_DEFAULT, "got policy", buf, 2u);
  }

  if (AppleAST2Service)
  {
    v16 = SecTrustSetPolicies(v12, AppleAST2Service);
    CFRelease(AppleAST2Service);
    goto LABEL_16;
  }
  v19 = 1;
LABEL_13:
  handleForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_1D140D590();

  v16 = 0;
  if (!v19)
    goto LABEL_26;
LABEL_16:
  if (v16)
  {
LABEL_26:
    handleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1D140D520(v16, v25);

    goto LABEL_29;
  }
  result = kSecTrustResultInvalid;
  SecTrustEvaluateWithError(v12, &error);
  TrustResult = SecTrustGetTrustResult(v12, &result);
  handleForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v30 = TrustResult;
    v31 = 1024;
    v32 = result;
    _os_log_impl(&dword_1D1401000, v22, OS_LOG_TYPE_DEFAULT, "SecTrust result: %d, evaluated: %u", buf, 0xEu);
  }

  if (TrustResult)
  {
LABEL_29:
    v24 = 0;
    goto LABEL_30;
  }
  v24 = result == kSecTrustResultProceed || result == kSecTrustResultUnspecified;
LABEL_30:

  return v24;
}

@end
