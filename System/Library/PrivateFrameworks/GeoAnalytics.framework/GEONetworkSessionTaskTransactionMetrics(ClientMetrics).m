@implementation GEONetworkSessionTaskTransactionMetrics(ClientMetrics)

- (id)initWithClientNetworkTransactionMetrics:()ClientMetrics
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&off_256C39010;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasConnectStart"))
    {
      objc_msgSend(v4, "connectStart");
      objc_msgSend(v5, "setConnectStart:");
    }
    if (objc_msgSend(v4, "hasConnectEnd"))
    {
      objc_msgSend(v4, "connectEnd");
      objc_msgSend(v5, "setConnectEnd:");
    }
    if (objc_msgSend(v4, "hasDomainLookupStart"))
    {
      objc_msgSend(v4, "domainLookupStart");
      objc_msgSend(v5, "setDomainLookupStart:");
    }
    if (objc_msgSend(v4, "hasDomainLookupEnd"))
    {
      objc_msgSend(v4, "domainLookupEnd");
      objc_msgSend(v5, "setDomainLookupEnd:");
    }
    if (objc_msgSend(v4, "hasFetchStart"))
    {
      objc_msgSend(v4, "fetchStart");
      objc_msgSend(v5, "setFetchStart:");
    }
    if (objc_msgSend(v4, "hasRequestStart"))
    {
      objc_msgSend(v4, "requestStart");
      objc_msgSend(v5, "setRequestStart:");
    }
    if (objc_msgSend(v4, "hasRequestEnd"))
    {
      objc_msgSend(v4, "requestEnd");
      objc_msgSend(v5, "setRequestEnd:");
    }
    if (objc_msgSend(v4, "hasResponseStart"))
    {
      objc_msgSend(v4, "responseStart");
      objc_msgSend(v5, "setResponseStart:");
    }
    if (objc_msgSend(v4, "hasResponseEnd"))
    {
      objc_msgSend(v4, "responseEnd");
      objc_msgSend(v5, "setResponseEnd:");
    }
    if (objc_msgSend(v4, "hasSecureConnectStart"))
    {
      objc_msgSend(v4, "secureConnectStart");
      objc_msgSend(v5, "setSecureConnectStart:");
    }
    if (objc_msgSend(v4, "hasSecureConnectEnd"))
    {
      objc_msgSend(v4, "secureConnectEnd");
      objc_msgSend(v5, "setSecureConnectEnd:");
    }
    if (objc_msgSend(v4, "hasProxyConnection"))
      objc_msgSend(v5, "setProxyConnection:", objc_msgSend(v4, "proxyConnection"));
    if (objc_msgSend(v4, "hasReusedConnection"))
      objc_msgSend(v5, "setReusedConnection:", objc_msgSend(v4, "reusedConnection"));
  }

  return v5;
}

@end
