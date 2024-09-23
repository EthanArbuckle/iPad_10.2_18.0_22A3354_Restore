@implementation CDPController

- (void)invalidate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_DEBUG, "\"Invalidating connection for controller %@\", (uint8_t *)&v2, 0xCu);
}

- (CDPController)init
{
  CDPController *v2;
  CDPDaemonConnection *v3;
  CDPDaemonConnection *daemonConn;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPController;
  v2 = -[CDPController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;

  }
  return v2;
}

- (CDPController)initWithContext:(id)a3
{
  id v4;
  CDPController *v5;
  uint64_t v6;
  CDPContext *context;

  v4 = a3;
  v5 = -[CDPController init](self, "init");
  if (v5)
  {
    +[CDPContext preflightContext:](CDPContext, "preflightContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (CDPContext *)v6;

  }
  return v5;
}

- (void)dealloc
{
  CDPDaemonConnection *daemonConn;
  CDPContext *context;
  CDPStateUIProvider *uiProvider;
  CDPStateUIProviderProxy *uiProviderProxy;
  objc_super v7;

  daemonConn = self->_daemonConn;
  self->_daemonConn = 0;

  context = self->_context;
  self->_context = 0;

  uiProvider = self->_uiProvider;
  self->_uiProvider = 0;

  uiProviderProxy = self->_uiProviderProxy;
  self->_uiProviderProxy = 0;

  v7.receiver = self;
  v7.super_class = (Class)CDPController;
  -[CDPController dealloc](&v7, sel_dealloc);
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProviderProxy, 0);
  objc_storeStrong((id *)&self->_daemonConn, 0);
  objc_storeStrong((id *)&self->_authProvider, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (CDPController)initWithXpcEndpoint:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  CDPController *v8;
  CDPController *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[CDPController init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[CDPDaemonConnection setDaemonXPCEndpoint:](v8->_daemonConn, "setDaemonXPCEndpoint:", v6);
    objc_storeStrong((id *)&v9->_context, a4);
  }

  return v9;
}

- (CDPStateUIProviderProxy)uiProviderProxy
{
  CDPStateUIProviderProxy *v3;
  CDPStateUIProviderProxy *uiProviderProxy;

  if (self->_uiProvider)
  {
    v3 = -[CDPStateUIProviderProxy initWithUIProvider:]([CDPStateUIProviderProxy alloc], "initWithUIProvider:", self->_uiProvider);
    uiProviderProxy = self->_uiProviderProxy;
    self->_uiProviderProxy = v3;

  }
  return self->_uiProviderProxy;
}

- (CDPStateUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (CDPAuthProvider)authProvider
{
  return self->_authProvider;
}

- (void)setAuthProvider:(id)a3
{
  objc_storeStrong((id *)&self->_authProvider, a3);
}

- (CDPDaemonConnection)daemonConn
{
  return self->_daemonConn;
}

- (void)setDaemonConn:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConn, a3);
}

- (void)setUiProviderProxy:(id)a3
{
  objc_storeStrong((id *)&self->_uiProviderProxy, a3);
}

@end
