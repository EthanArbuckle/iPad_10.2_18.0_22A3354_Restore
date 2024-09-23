@implementation NEDNSProxyProvider

- (void)startProxyWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("startProxyWithOptions:completionHandler: not implemented");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = completionHandler;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NEDNSProxyProviderDefaultErrorDomain"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v9);

}

- (void)stopProxyWithReason:(NEProviderStopReason)reason completionHandler:(void *)completionHandler
{
  (*((void (**)(void *))completionHandler + 2))(completionHandler);
}

- (void)cancelProxyWithError:(NSError *)error
{
  NSError *v4;
  id v5;

  v4 = error;
  -[NEProvider context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelWithError:", v4);

}

- (BOOL)handleNewFlow:(NEAppProxyFlow *)flow
{
  return 0;
}

- (BOOL)handleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  BOOL v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[NEProvider _callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:](self, "_callSwiftHandleNewUDPFlow:initialRemoteFlowEndpoint:", v6, v7);
  if (v8 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NEDNSProxyProvider handleNewUDPFlow:initialRemoteEndpoint:](self, "handleNewUDPFlow:initialRemoteEndpoint:", v6, v10);

  }
  else
  {
    v9 = v8 != 0;
  }

  return v9;
}

- (NSArray)systemDNSSettings
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemDNSSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDNSSettings, 0);
}

@end
