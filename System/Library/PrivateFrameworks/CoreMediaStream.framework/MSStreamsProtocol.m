@implementation MSStreamsProtocol

- (MSStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSStreamsProtocol *v7;
  MSStreamsProtocol *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSStreamsProtocol;
  v7 = -[MSStreamsProtocol init](&v13, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  objc_storeStrong((id *)&v7->_personID, a3);
  MSPlatform();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  MSPlatform();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldEnableNewFeatures") & 1) == 0)
  {

    goto LABEL_7;
  }
  v11 = _MSSPCForcedProtocolVersionString;

  if (!v11)
    _MSSPCForcedProtocolVersionString = (uint64_t)CFSTR("kfjVrXr0t5Dl");
LABEL_8:

  return v8;
}

- (NSURL)getURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/getmetadata"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)putURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/putmetadata"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)resetURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/reset"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)reauthorizeURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/gettokens"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)uploadCompleteURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/uploadcomplete"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (NSURL)deleteURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/streams/deletemetadata"), self->_personID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURLForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (void)abort
{
  __assert_rtn("-[MSStreamsProtocol abort]", "MSStreamsProtocol.m", 64, "0");
}

- (id)deviceInfoDict
{
  void *v2;
  void *v3;

  -[MSStreamsProtocol personID](self, "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSProtocolUtilities deviceInfoDictForPersonID:](MSProtocolUtilities, "deviceInfoDictForPersonID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_didFindServerSideConfigurationVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  MSPlatform();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theDaemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStreamsProtocol personID](self, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveServerSideConfigurationVersion:forPersonID:", v4, v6);

}

- (void)_didReceiveRetryAfterDate:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MSStreamsProtocolDelegate protocol:didReceiveRetryAfterDate:](self->_delegate, "protocol:didReceiveRetryAfterDate:", self, v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved a retry-after header, but we're ignoring it.", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_refreshAuthTokenForContext:(__MSSPCContext *)a3
{
  __CFString *authToken;
  id v6;

  authToken = a3->authToken;
  if (authToken)
    CFRelease(authToken);
  MSPlatform();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authTokenForPersonID:", self->_personID);
  a3->authToken = (__CFString *)objc_claimAutoreleasedReturnValue();

}

- (MSStreamsProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSStreamsProtocolDelegate *)a3;
}

- (NSString)personID
{
  return self->_personID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
