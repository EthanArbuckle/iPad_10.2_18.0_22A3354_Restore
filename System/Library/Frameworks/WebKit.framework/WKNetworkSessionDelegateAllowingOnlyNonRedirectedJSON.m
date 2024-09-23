@implementation WKNetworkSessionDelegateAllowingOnlyNonRedirectedJSON

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  const WTF::String *v7;
  WTF::StringImpl *v8;
  unsigned int isSupportedJSONMIMEType;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;

  MEMORY[0x19AEABCC8](&v11, objc_msgSend(a5, "MIMEType", a3, a4));
  isSupportedJSONMIMEType = WebCore::MIMETypeRegistry::isSupportedJSONMIMEType((WebCore::MIMETypeRegistry *)&v11, v7);
  v10 = v11;
  v11 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
  (*((void (**)(id, _QWORD))a6 + 2))(a6, isSupportedJSONMIMEType);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void *v8;
  WebCore *v9;
  __SecTrust *v10;
  __SecTrust *v11;
  uint64_t v12;
  void (*v13)(id, uint64_t, uint64_t);
  id v14;
  uint64_t v15;

  v8 = (void *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace", a3, a4), "authenticationMethod");
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C92B70])
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "host"), "isEqualToString:", CFSTR("127.0.0.1")))
  {
    goto LABEL_8;
  }
  {
    allowedLocalTestServerTrust(void)::serverTrust = 0;
LABEL_8:
    v13 = (void (*)(id, uint64_t, uint64_t))*((_QWORD *)a6 + 2);
    v14 = a6;
    v15 = 1;
    v12 = 0;
    goto LABEL_9;
  }
  v9 = (WebCore *)allowedLocalTestServerTrust(void)::serverTrust;
  if (!allowedLocalTestServerTrust(void)::serverTrust)
    goto LABEL_8;
  v10 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
  if (!WebCore::certificatesMatch(v9, v10, v11))
    goto LABEL_8;
  v12 = objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust"));
  v13 = (void (*)(id, uint64_t, uint64_t))*((_QWORD *)a6 + 2);
  v14 = a6;
  v15 = 0;
LABEL_9:
  v13(v14, v15, v12);
}

@end
