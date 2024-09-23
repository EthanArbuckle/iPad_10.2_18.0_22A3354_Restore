@implementation NSURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __SecTrust *v15;
  CFMutableArrayRef Mutable;
  __CFArray *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const void *AppleSSLPinned;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  SecPolicyRef SSL;
  SecPolicyRef v32;
  NSObject *v33;
  SecPolicyRef Revocation;
  SecPolicyRef v35;
  OSStatus v36;
  OSStatus v37;
  NSObject *v38;
  __CFString *v39;
  NSObject *v40;
  void (**v41)(id, uint64_t, _QWORD);
  OSStatus v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  NSObject *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  _QWORD result[5];
  id v54;
  id v55;
  uint8_t buf[4];
  __CFString *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "sessionDescription");
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protectionSpace");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v57 = v44;
    v58 = 2048;
    v59 = objc_msgSend(v45, "serverTrust");
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Received an authentication challenge for %@, serverTrust = %p", buf, 0x16u);

  }
  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "serverTrust");

  if (!v13)
  {
    v10[2](v10, 1, 0);
    goto LABEL_41;
  }
  objc_msgSend(v9, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (__SecTrust *)objc_msgSend(v14, "serverTrust");

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v17 = Mutable;
    -[NSURLSessionDelegate leafOID](self, "leafOID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      nplog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "sessionDescription");
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[NSURLSessionDelegate validationHostname](self, "validationHostname");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURLSessionDelegate leafOID](self, "leafOID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v47;
        v58 = 2112;
        v59 = (uint64_t)v48;
        v60 = 2112;
        v61 = v49;
        _os_log_debug_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEBUG, "Creating a pinning policy with name %@, hostname %@, and leaf OID %@", buf, 0x20u);

      }
      objc_msgSend(v8, "sessionDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLSessionDelegate validationHostname](self, "validationHostname");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLSessionDelegate leafOID](self, "leafOID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();

      if (!AppleSSLPinned)
      {
        nplog_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "sessionDescription");
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[NSURLSessionDelegate validationHostname](self, "validationHostname");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURLSessionDelegate leafOID](self, "leafOID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v57 = v50;
          v58 = 2112;
          v59 = (uint64_t)v51;
          v60 = 2112;
          v61 = v52;
          _os_log_error_impl(&dword_19E8FE000, v40, OS_LOG_TYPE_ERROR, "Failed to create a pinning policy from name %@, hostname %@, and OID %@", buf, 0x20u);

        }
        goto LABEL_40;
      }
      CFArrayAppendValue(v17, AppleSSLPinned);
      CFRelease(AppleSSLPinned);
    }
    else
    {
      -[NSURLSessionDelegate validationHostname](self, "validationHostname");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[NSURLSessionDelegate validationHostname](self, "validationHostname");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "protectionSpace");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "host");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("gateway.icloud.com"));

        if (v29)
        {

          v26 = CFSTR("gateway.icloud.com");
        }
        nplog_obj();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v26;
          _os_log_debug_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_DEBUG, "Creating a server trust policy with hostname %@", buf, 0xCu);
        }

        SSL = SecPolicyCreateSSL(1u, v26);
        if (!SSL)
        {
          nplog_obj();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v26;
            _os_log_error_impl(&dword_19E8FE000, v46, OS_LOG_TYPE_ERROR, "Failed to create a SSL policy from hostname %@", buf, 0xCu);
          }

          v10[2](v10, 3, 0);
          CFRelease(v17);

          goto LABEL_41;
        }
        v32 = SSL;
        CFArrayAppendValue(v17, SSL);
        CFRelease(v32);

      }
    }
    if (-[NSURLSessionDelegate revocationFailClosed](self, "revocationFailClosed"))
    {
      nplog_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19E8FE000, v33, OS_LOG_TYPE_DEBUG, "Creating a policy to require revocation check success", buf, 2u);
      }

      Revocation = SecPolicyCreateRevocation(0x18uLL);
      if (!Revocation)
      {
        nplog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v38, OS_LOG_TYPE_ERROR, "Failed to create a revocation policy", buf, 2u);
        }
        goto LABEL_39;
      }
      v35 = Revocation;
      CFArrayAppendValue(v17, Revocation);
      CFRelease(v35);
    }
    v36 = SecTrustSetPolicies(v15, v17);
    if (v36)
    {
      v37 = v36;
      nplog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "sessionDescription");
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v39;
        v58 = 1024;
        LODWORD(v59) = v37;
        _os_log_error_impl(&dword_19E8FE000, v38, OS_LOG_TYPE_ERROR, "Failed to set the trust policies for %@: %d", buf, 0x12u);

      }
LABEL_39:

LABEL_40:
      v10[2](v10, 3, 0);
      CFRelease(v17);
      goto LABEL_41;
    }
    result[0] = MEMORY[0x1E0C809B0];
    result[1] = 3221225472;
    result[2] = __73__NSURLSessionDelegate_URLSession_didReceiveChallenge_completionHandler___block_invoke;
    result[3] = &unk_1E4138148;
    result[4] = self;
    v54 = v8;
    v41 = v10;
    v55 = v41;
    v42 = SecTrustEvaluateAsyncWithError(v15, MEMORY[0x1E0C80D38], result);
    CFRelease(v17);
    if (v42)
    {
      nplog_obj();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v42;
        _os_log_error_impl(&dword_19E8FE000, v43, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsync returned an error: %d", buf, 8u);
      }

      v41[2](v41, 1, 0);
    }

  }
  else
  {
    nplog_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_ERROR, "Failed to create an array to hold policies", buf, 2u);
    }

    v10[2](v10, 3, 0);
  }
LABEL_41:

}

void __73__NSURLSessionDelegate_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1, __SecTrust *a2, int a3, NSObject *a4)
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  CFTypeID v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  SecTrustResultType result;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_INFO, "SecTrustEvaluateAsyncWithError success", buf, 2u);
    }

    result = kSecTrustResultInvalid;
    if (SecTrustGetTrustResult(a2, &result) || result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 1024;
      LODWORD(v24) = result;
      _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEFAULT, "%@ TLS certificate failed validation with result %d", buf, 0x12u);
      goto LABEL_7;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "enableExtendedValidation"))
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Extended validation for %@ is not enabled", buf, 0xCu);
      goto LABEL_13;
    }
    v9 = SecTrustCopyResult(a2);
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
        v19 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        v23 = 2112;
        v24 = v9;
        _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Got trust result info for %@: %@", buf, 0x16u);

      }
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD7040]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = CFGetTypeID(v15);
        if (v16 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)v15))
            goto LABEL_14;
        }
      }
      nplog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      v18 = "%@ TLS certificate failed extended validation";
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      v18 = "Failed to get validation results for %@ TLS certificate";
    }
    _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    goto LABEL_7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = a4;
    _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsyncWithError failed with %@", buf, 0xCu);
  }
LABEL_10:

  if (objc_msgSend(*(id *)(a1 + 32), "ignoreInvalidCerts"))
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "sessionDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring invalid %@ TLS cert", buf, 0xCu);
LABEL_13:

    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (NSString)validationHostname
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValidationHostname:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)enableExtendedValidation
{
  return self->_enableExtendedValidation;
}

- (void)setEnableExtendedValidation:(BOOL)a3
{
  self->_enableExtendedValidation = a3;
}

- (BOOL)ignoreInvalidCerts
{
  return self->_ignoreInvalidCerts;
}

- (void)setIgnoreInvalidCerts:(BOOL)a3
{
  self->_ignoreInvalidCerts = a3;
}

- (NSString)leafOID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLeafOID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)revocationFailClosed
{
  return self->_revocationFailClosed;
}

- (void)setRevocationFailClosed:(BOOL)a3
{
  self->_revocationFailClosed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafOID, 0);
  objc_storeStrong((id *)&self->_validationHostname, 0);
}

@end
