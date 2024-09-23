@implementation AAFCertificateTrustValidator

- (int64_t)validateCertificateTrustWithChallenge:(id)a3 type:(unint64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int64_t v14;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "protectionSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authenticationMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  _AAFLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v10)
      goto LABEL_11;
    LOWORD(v16) = 0;
    v11 = "Unsupported authentication method detected, proceed with default handling.";
LABEL_9:
    v12 = v9;
    v13 = 2;
    goto LABEL_10;
  }
  if (v10)
  {
    v16 = 134217984;
    v17 = a4;
    _os_log_impl(&dword_1D51A2000, v9, OS_LOG_TYPE_DEFAULT, "Validating certificate trust for type %lu.", (uint8_t *)&v16, 0xCu);
  }

  if (-[AAFCertificateTrustValidator _checkPinningPolicy:type:](self, "_checkPinningPolicy:type:", v6, a4))
  {
    _AAFLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = a4;
      v11 = "Certificate type %lu is trusted.";
      v12 = v9;
      v13 = 12;
LABEL_10:
      _os_log_impl(&dword_1D51A2000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
LABEL_11:
    v14 = 1;
    goto LABEL_12;
  }
  if (a4 && -[AAFCertificateTrustValidator _trySSLPinning:](self, "_trySSLPinning:", v6))
  {
    _AAFLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v16) = 0;
    v11 = "SSL Certificate is trusted.";
    goto LABEL_9;
  }
  _AAFLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    v14 = 2;
    _os_log_impl(&dword_1D51A2000, v9, OS_LOG_TYPE_DEFAULT, "Server cert validity check failed!", (uint8_t *)&v16, 2u);
  }
  else
  {
    v14 = 2;
  }
LABEL_12:

  return v14;
}

- (BOOL)_checkPinningPolicy:(id)a3 type:(unint64_t)a4
{
  id v6;
  __SecTrust *v7;
  void *v8;
  __SecPolicy *v9;
  __SecPolicy *v10;
  OSStatus v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFErrorRef error;

  v6 = a3;
  v7 = (__SecTrust *)objc_msgSend(v6, "serverTrust");
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AAFCertificateTrustValidator _policyForType:host:](self, "_policyForType:host:", a4, v8);
  if (!v9)
  {
    _AAFLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:].cold.1(v20);

    goto LABEL_9;
  }
  v10 = v9;
  v11 = SecTrustSetPolicies(v7, v9);
  if (v11)
  {
    v12 = (__CFString *)SecCopyErrorMessageString(v11, 0);
    _AAFLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:].cold.3((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

    CFRelease(v10);
LABEL_9:
    v21 = 0;
    goto LABEL_15;
  }
  error = 0;
  v21 = SecTrustEvaluateWithError(v7, &error);
  if (error)
  {
    _AAFLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AAFCertificateTrustValidator _checkPinningPolicy:type:].cold.2((uint64_t)&error, v22, v23, v24, v25, v26, v27, v28);

    CFRelease(error);
    error = 0;
  }
  CFRelease(v10);
LABEL_15:

  return v21;
}

- (__SecPolicy)_policyForType:(unint64_t)a3 host:(id)a4
{
  __SecPolicy *v4;
  __CFString *v6;
  uint64_t SSL;

  v6 = (__CFString *)a4;
  switch(a3)
  {
    case 0uLL:
      SSL = (uint64_t)SecPolicyCreateSSL(1u, v6);
      goto LABEL_7;
    case 2uLL:
      SSL = SecPolicyCreateAppleiCloudSetupService();
      goto LABEL_7;
    case 1uLL:
      SSL = SecPolicyCreateAppleGSService();
LABEL_7:
      v4 = (__SecPolicy *)SSL;
      break;
  }

  return v4;
}

- (BOOL)_trySSLPinning:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  uint8_t v8[16];

  v4 = a3;
  if (+[AFUtilities isInternalBuild](AFUtilities, "isInternalBuild")
    && CFPreferencesGetAppBooleanValue(CFSTR("AAFDisableCertPinning"), CFSTR("com.apple.AAAFoundation"), 0))
  {
    _AAFLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D51A2000, v5, OS_LOG_TYPE_DEFAULT, "Standard pinning is diabled, falling back to SSL pinning.", v8, 2u);
    }

    v6 = -[AAFCertificateTrustValidator _checkPinningPolicy:type:](self, "_checkPinningPolicy:type:", v4, 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_checkPinningPolicy:(os_log_t)log type:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D51A2000, log, OS_LOG_TYPE_ERROR, "Error creating trust policy.", v1, 2u);
}

- (void)_checkPinningPolicy:(uint64_t)a3 type:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "Error evaluating certificate trust: %@", a5, a6, a7, a8, 2u);
}

- (void)_checkPinningPolicy:(uint64_t)a3 type:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "Error setting trust policy: %@", a5, a6, a7, a8, 2u);
}

@end
