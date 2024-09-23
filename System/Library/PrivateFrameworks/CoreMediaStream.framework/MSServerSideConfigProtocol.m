@implementation MSServerSideConfigProtocol

- (MSServerSideConfigProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  MSServerSideConfigProtocol *v9;
  MSServerSideConfigProtocol *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSURL *configURL;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSServerSideConfigProtocol;
  v9 = -[MSServerSideConfigProtocol init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    v10->_context._super.owner = v10;
    v11 = (__CFString *)v7;
    v10->_context._super.personID = v11;
    MSPlatform();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "authTokenForPersonID:", v11);
    v10->_context._super.authToken = (__CFString *)objc_claimAutoreleasedReturnValue();

    +[MSProtocolUtilities deviceInfoDictForPersonID:](MSProtocolUtilities, "deviceInfoDictForPersonID:", v11);
    v10->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10->_context._super.connectionTimeout = 0.0;
    v10->_context.didFinishCallback = _didFinish_2019;
    v10->_context.didFailAuthenticationCallback = _didFailAuthentication_2020;
    if (v8)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/configuration"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithString:relativeToURL:", v14, v8);
      configURL = v10->_configURL;
      v10->_configURL = (NSURL *)v15;

    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSServerSideConfigProtocol;
  -[MSServerSideConfigProtocol dealloc](&v3, sel_dealloc);
}

- (void)queryConfiguration
{
  __MSSSCPCContext *p_context;
  NSURL *configURL;
  const __CFDictionary *v4;

  p_context = &self->_context;
  configURL = self->_configURL;
  v4 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSSSCPCQueryConfiguration(p_context, (uint64_t)configURL, v4);
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
}

- (void)_didFinishWithResponse:(id)a3 error:(id)a4
{
  -[MSServerSideConfigProtocolDelegate serverSideConfigProtocol:didFinishWithConfiguration:error:](self->_delegate, "serverSideConfigProtocol:didFinishWithConfiguration:error:", self, a3, a4);
}

- (void)_didFailAuthenticationWithError:(id)a3
{
  -[MSServerSideConfigProtocolDelegate serverSideConfigProtocol:didReceiveAuthenticationError:](self->_delegate, "serverSideConfigProtocol:didReceiveAuthenticationError:", self, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (MSServerSideConfigProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSServerSideConfigProtocolDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
