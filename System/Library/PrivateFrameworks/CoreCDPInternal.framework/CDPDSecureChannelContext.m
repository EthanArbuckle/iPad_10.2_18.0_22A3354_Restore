@implementation CDPDSecureChannelContext

- (CDPDSecureChannelContext)initWithContext:(id)a3 circleProxy:(id)a4
{
  id v7;
  id v8;
  CDPDSecureChannelContext *v9;
  CDPDSecureChannelContext *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPDSecureChannelContext init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_circleProxy, a4);
  }

  return v10;
}

- (CDPDSecureChannelContext)initWithContext:(id)a3 channel:(id)a4 dataProvider:(id)a5 circleProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CDPDSecureChannelContext *v15;
  CDPDSecureChannelContext *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[CDPDSecureChannelContext init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_keychainCircleProxy, a5);
    objc_storeStrong((id *)&v16->_secureChannelProxy, a4);
    objc_storeStrong((id *)&v16->_circleProxy, a6);
  }

  return v16;
}

- (BOOL)initialize:(id *)a3
{
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t v17[16];
  uint8_t buf[16];

  if (self->_keychainCircleProxy && self->_secureChannelProxy)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Context already initialized, returning...\", buf, 2u);
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *MEMORY[0x24BE1A798], *MEMORY[0x24BE1A860]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[CDPContext isPiggybackingRecovery](self->_context, "isPiggybackingRecovery"))
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Initializing piggybacking channel\", v17, 2u);
      }

      self->_secureChannelType = 1;
      v16 = 0;
      v6 = -[CDPDSecureChannelContext initializePiggybackingChannel:](self, "initializePiggybackingChannel:", &v16);
      v8 = v16;
    }
    else if (-[CDPContext isTTSURecovery](self->_context, "isTTSURecovery"))
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Initializing TTSU channel\", v15, 2u);
      }

      self->_secureChannelType = 2;
      -[CDPDSecureChannelContext initializeTTSUChannel](self, "initializeTTSUChannel");
      v8 = 0;
      v6 = 1;
    }
    else
    {
      _CDPStateError();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self, "secureChannelType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE1A7C0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE1A640]);

    -[NSObject populateUnderlyingErrorsStartingWithRootError:](v5, "populateUnderlyingErrorsStartingWithRootError:", v8);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:", v5);

    if (v8)
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CDPDSecureChannelContext initialize:].cold.1((uint64_t)v8, v13);

      if (a3)
        *a3 = objc_retainAutorelease(v8);
    }

  }
  return v6;
}

- (BOOL)initializePiggybackingChannel:(id *)a3
{
  void *v5;
  CDPKeychainCircleProxy *v6;
  id v7;
  CDPKeychainCircleProxy *keychainCircleProxy;
  CDPPiggybackingChannel *v9;
  CDPSecureChannelProxy *secureChannelProxy;
  id v12;

  -[CDPContext duplexSession](self->_context, "duplexSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[CDPPiggybackingPayloadProvider proxyWithSession:error:](CDPPiggybackingPayloadProvider, "proxyWithSession:error:", v5, &v12);
  v6 = (CDPKeychainCircleProxy *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  keychainCircleProxy = self->_keychainCircleProxy;
  self->_keychainCircleProxy = v6;

  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = -[CDPPiggybackingChannel initWithContext:]([CDPPiggybackingChannel alloc], "initWithContext:", self->_context);
    secureChannelProxy = self->_secureChannelProxy;
    self->_secureChannelProxy = (CDPSecureChannelProxy *)v9;

  }
  return v7 == 0;
}

- (void)initializeTTSUChannel
{
  CDPTTSUPayloadProvider *v3;
  CDPKeychainCircleProxy *keychainCircleProxy;
  CDPTTSUChannel *v5;
  CDPSecureChannelProxy *secureChannelProxy;

  v3 = -[CDPTTSUPayloadProvider initWithCircleProxy:]([CDPTTSUPayloadProvider alloc], "initWithCircleProxy:", self->_circleProxy);
  keychainCircleProxy = self->_keychainCircleProxy;
  self->_keychainCircleProxy = (CDPKeychainCircleProxy *)v3;

  v5 = -[CDPTTSUChannel initWithContext:]([CDPTTSUChannel alloc], "initWithContext:", self->_context);
  secureChannelProxy = self->_secureChannelProxy;
  self->_secureChannelProxy = (CDPSecureChannelProxy *)v5;

}

- (void)setFlowIDFromRequester:(id)a3
{
  CDPDCircleProxy *circleProxy;
  id v4;
  id v5;

  circleProxy = self->_circleProxy;
  v4 = a3;
  -[CDPDCircleProxy cdpContext](circleProxy, "cdpContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTelemetryFlowID:", v4);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Secure channel proxy going away...\", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CDPDSecureChannelContext;
  -[CDPDSecureChannelContext dealloc](&v4, sel_dealloc);
}

- (CDPKeychainCircleProxy)keychainCircleProxy
{
  return self->_keychainCircleProxy;
}

- (void)setKeychainCircleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_keychainCircleProxy, a3);
}

- (CDPSecureChannelProxy)secureChannelProxy
{
  return self->_secureChannelProxy;
}

- (void)setSecureChannelProxy:(id)a3
{
  objc_storeStrong((id *)&self->_secureChannelProxy, a3);
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_circleProxy, a3);
}

- (CDPContext)context
{
  return self->_context;
}

- (unint64_t)secureChannelType
{
  return self->_secureChannelType;
}

- (void)setSecureChannelType:(unint64_t)a3
{
  self->_secureChannelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_secureChannelProxy, 0);
  objc_storeStrong((id *)&self->_keychainCircleProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initialize:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to initialize a channel %@\", (uint8_t *)&v2, 0xCu);
}

@end
