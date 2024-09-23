@implementation AACertificatePinner

+ (AACertificatePinner)sharedPinner
{
  if (sharedPinner_onceToken != -1)
    dispatch_once(&sharedPinner_onceToken, &__block_literal_global_0);
  return (AACertificatePinner *)(id)sharedPinner_sharedPinner;
}

void __35__AACertificatePinner_sharedPinner__block_invoke()
{
  AACertificatePinner *v0;
  void *v1;

  v0 = objc_alloc_init(AACertificatePinner);
  v1 = (void *)sharedPinner_sharedPinner;
  sharedPinner_sharedPinner = (uint64_t)v0;

}

+ (BOOL)isSetupServiceHost:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("setup.icloud.com")) & 1) != 0
    || objc_msgSend(v3, "rangeOfString:options:", CFSTR("^p\\d{2}-setup\\.icloud\\.com\\z"), 1024) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3
{
  void *v8;
  int v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AACertificatePinner.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trustRef"));

  }
  if (SecTrustSetPinningPolicyName())
    return 0;
  v9 = 0;
  if (MEMORY[0x1A1AED32C](a3, &v9))
    return 0;
  return v9 == 4 || v9 == 1;
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a4;
  objc_msgSend(v4, "protectionSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if ((v7 & 1) == 0)
    goto LABEL_6;
  v8 = objc_opt_class();
  objc_msgSend(v4, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "isSetupServiceHost:", v10);

  if ((v8 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v4, "sender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performDefaultHandlingForAuthenticationChallenge:", v4);
    goto LABEL_7;
  }
  objc_msgSend(v4, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "serverTrust");

  if (!v12)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:].cold.1();
    goto LABEL_12;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isValidCertificateTrust:", v12) & 1) == 0)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:].cold.2();
LABEL_12:

    objc_msgSend(v4, "sender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelAuthenticationChallenge:", v4);
    goto LABEL_7;
  }
  objc_msgSend(v4, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "useCredential:forAuthenticationChallenge:", v14, v4);

LABEL_7:
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v6, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticationMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if ((v10 & 1) == 0)
    goto LABEL_6;
  v11 = objc_opt_class();
  objc_msgSend(v6, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend((id)v11, "isSetupServiceHost:", v13);

  if ((v11 & 1) == 0)
  {
LABEL_6:
    v7[2](v7, 1, 0);
    goto LABEL_7;
  }
  objc_msgSend(v6, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "serverTrust");

  if (!v15)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:].cold.1();
    goto LABEL_12;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isValidCertificateTrust:", v15) & 1) == 0)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AACertificatePinner(NSURLUtilities) connection:willSendRequestForAuthenticationChallenge:].cold.2();
LABEL_12:

    v7[2](v7, 2, 0);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);

LABEL_7:
}

@end
