@implementation APBrokerHTTPUtilsTaskDelegate

- (APBrokerHTTPUtilsTaskDelegate)initWithLogContext:(void *)a3 sslCertificateHostName:(id)a4
{
  APBrokerHTTPUtilsTaskDelegate *v6;
  APBrokerHTTPUtilsTaskDelegate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APBrokerHTTPUtilsTaskDelegate;
  v6 = -[APBrokerHTTPUtilsTaskDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_logContext = a3;
    if (a4)
    {
      v6->_sslCertificateHostName = (NSString *)a4;
    }
    else
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_sslCertificateHostName = 0;
  v3.receiver = self;
  v3.super_class = (Class)APBrokerHTTPUtilsTaskDelegate;
  -[APBrokerHTTPUtilsTaskDelegate dealloc](&v3, sel_dealloc);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  __SecTrust *v11;
  void *logContext;
  void *v13;
  BOOL v14;
  uint64_t v15;
  SecPolicyRef v16;
  uint64_t v17;
  SecPolicyRef SSL;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  CFErrorRef error;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  error = 0;
  v11 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
  if (gLogCategory_APBrokerHTTPUtils <= 30
    && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
  {
    logContext = self->_logContext;
    v21 = a4;
    v22 = objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
    v19 = logContext;
    v20 = a3;
    LogPrintF();
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace", v19, v20, v21, v22), "authenticationMethod");
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32C8]))
    v14 = v11 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    SSL = SecPolicyCreateSSL(1u, (CFStringRef)self->_sslCertificateHostName);
    v16 = SSL;
    if (SSL)
    {
      v24[0] = SSL;
      SecTrustSetPolicies(v11, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1));
      if (SecTrustEvaluateWithError(v11, &error))
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", v11);
        v17 = 0;
        goto LABEL_20;
      }
      if (gLogCategory_APBrokerHTTPUtils >= 91)
      {
        (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 2, 0);
LABEL_25:
        CFRelease(v16);
        goto LABEL_26;
      }
      if (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize())
        LogPrintF();
    }
    else
    {
      APSLogErrorAt();
    }
    v15 = 0;
    v17 = 2;
    goto LABEL_20;
  }
  v15 = 0;
  v16 = 0;
  v17 = 1;
LABEL_20:
  if (gLogCategory_APBrokerHTTPUtils <= 30
    && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, uint64_t, uint64_t))a6 + 2))(a6, v17, v15);
  if (v16)
    goto LABEL_25;
LABEL_26:
  if (error)
    CFRelease(error);
}

@end
