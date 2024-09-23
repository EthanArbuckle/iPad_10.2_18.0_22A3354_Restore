@implementation MSResetServerProtocol

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSResetServerProtocol;
  -[MSStreamsProtocol delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSResetServerProtocol;
  -[MSStreamsProtocol setDelegate:](&v3, sel_setDelegate_, a3);
}

- (MSResetServerProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSResetServerProtocol *v7;
  MSResetServerProtocol *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSResetServerProtocol;
  v7 = -[MSStreamsProtocol initWithPersonID:baseURL:](&v10, sel_initWithPersonID_baseURL_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish_2294;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication_2295;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion_2296;
  }

  return v8;
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
}

- (void)dealloc
{
  __MSRSPCContext *p_context;
  objc_super v4;

  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSResetServerProtocol;
  -[MSResetServerProtocol dealloc](&v4, sel_dealloc);
}

- (void)resetServerState
{
  __MSRSPCContext *p_context;
  NSURL *v4;
  const __CFDictionary *v5;

  p_context = &self->_context;
  -[MSStreamsProtocol _refreshAuthTokenForContext:](self, "_refreshAuthTokenForContext:", &self->_context);
  v4 = -[MSStreamsProtocol resetURL](self, "resetURL");
  v5 = (const __CFDictionary *)MSPURLConnectionProperties();
  p_context->_super.__didReceiveDataCallback = 0;
  p_context->_super.__didFinishCallback = _didFinish_2223;
  p_context->_super.__didFailAuthenticationCallback = _didFailAuthentication_2224;
  p_context->_super.__didReceiveServerSideConfigVersionCallback = _didReceiveServerSideConfigurationVersion_2225;
  MSSPCStartHTTPTransaction((uint64_t)p_context, (uint64_t)CFSTR("POST"), (uint64_t)v4, v5, 0, 0, 0);
}

- (void)_coreProtocolDidFinishError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSStreamsProtocol personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSVerboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reset server state protocol has failed. Error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MSResetServerProtocol delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetServerProtocol:didFinishWithError:", self, v4);

}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSStreamsProtocol personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSVerboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MSResetServerProtocol delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetServerProtocol:didReceiveAuthenticationError:", self, v4);

}

@end
