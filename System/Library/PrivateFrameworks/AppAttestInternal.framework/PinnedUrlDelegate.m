@implementation PinnedUrlDelegate

- (PinnedUrlDelegate)initWithHost:(id)a3
{
  id v5;
  PinnedUrlDelegate *v6;
  PinnedUrlDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PinnedUrlDelegate;
  v6 = -[PinnedUrlDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->m_host, a3);

  return v7;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t AppleSSLPinned;
  const void *v14;
  void *v15;
  __SecTrust *v16;
  void *v17;
  NSObject *v18;
  CFErrorRef error;

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  if (!os_variant_allows_internal_security_policies())
  {
LABEL_7:
    objc_msgSend(v6, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authenticationMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD12F8]);

    if (!v12)
    {
      v7[2](v7, 1, 0);
      goto LABEL_17;
    }
    AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
    if (AppleSSLPinned)
    {
      v14 = (const void *)AppleSSLPinned;
      objc_msgSend(v6, "protectionSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (__SecTrust *)objc_msgSend(v15, "serverTrust");

      LODWORD(v15) = SecTrustSetPolicies(v16, v14);
      CFRelease(v14);
      if (!(_DWORD)v15)
      {
        error = 0;
        if (SecTrustEvaluateWithError(v16, &error))
        {
          objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v17);

          goto LABEL_17;
        }
        _DCAALogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PinnedUrlDelegate URLSession:didReceiveChallenge:completionHandler:].cold.2((uint64_t *)&error, v18);

      }
    }
    v7[2](v7, 2, 0);
    goto LABEL_17;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
  if (!objc_msgSend(v8, "BOOLForKey:", CFSTR("AAADisablePinning")))
  {

    goto LABEL_7;
  }
  _DCAALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PinnedUrlDelegate URLSession:didReceiveChallenge:completionHandler:].cold.1(v9);

  v7[2](v7, 1, 0);
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_host, 0);
}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2167BD000, log, OS_LOG_TYPE_DEBUG, "WARNING: pinning disabled\n", v1, 2u);
}

- (void)URLSession:(uint64_t *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_2167BD000, a2, OS_LOG_TYPE_DEBUG, "Failed pinning check - (%@)\n", (uint8_t *)&v3, 0xCu);
}

@end
