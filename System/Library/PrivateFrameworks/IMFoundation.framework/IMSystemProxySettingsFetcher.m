@implementation IMSystemProxySettingsFetcher

- (void)_callProxySettingsDelegateMethod
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_delegate(self, a2, v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemProxySettingsFetcher_retrievedHost_port_protocol_(v6, v5, (uint64_t)self, (uint64_t)self->_proxyHost, self->_proxyPort, self->_proxyProtocol);

}

- (void)_callAccountSettingsDelegateMethod
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_delegate(self, a2, v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemProxySettingsFetcher_retrievedAccount_password_(v6, v5, (uint64_t)self, (uint64_t)self->_proxyAccount, self->_proxyPassword);

}

- (void)_getProxyAccountAndPasswordFromKeychain
{
  void *v3;
  const char *v4;

  v3 = (void *)MEMORY[0x19400E788](self, a2);
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v4, (uint64_t)sel__callAccountSettingsDelegateMethod, 0, 0);
  objc_autoreleasePoolPop(v3);
}

- (IMSystemProxySettingsFetcher)initWithHost:(id)a3 port:(unsigned __int16)a4 delegate:(id)a5
{
  id v9;
  id v10;
  IMSystemProxySettingsFetcher *v11;
  IMSystemProxySettingsFetcher *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMSystemProxySettingsFetcher;
  v11 = -[IMSystemProxySettingsFetcher init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_proxyProtocol = 4;
    v11->_delegate = v10;
    objc_storeStrong((id *)&v11->_host, a3);
    v12->_port = a4;
  }

  return v12;
}

- (IMSystemProxySettingsFetcher)initWithProxyProtocol:(int64_t)a3 proxyHost:(id)a4 proxyPort:(unsigned __int16)a5 delegate:(id)a6
{
  id v11;
  id v12;
  IMSystemProxySettingsFetcher *v13;
  IMSystemProxySettingsFetcher *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)IMSystemProxySettingsFetcher;
  v13 = -[IMSystemProxySettingsFetcher init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_proxyProtocol = a3;
    v13->_delegate = v12;
    objc_storeStrong((id *)&v13->_proxyHost, a4);
    v14->_proxyPort = a5;
  }

  return v14;
}

- (void)retrieveProxyAccountSettings
{
  if (self->_proxyAccount)
    ((void (*)(IMSystemProxySettingsFetcher *, char *))MEMORY[0x1E0DE7D20])(self, sel__callAccountSettingsDelegateMethod);
  else
    objc_msgSend_performSelectorInBackground_withObject_(self, a2, (uint64_t)sel__getProxyAccountAndPasswordFromKeychain, 0);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSString)_host
{
  return self->_host;
}

- (void)set_host:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)_port
{
  return self->_port;
}

- (void)set_port:(unsigned __int16)a3
{
  self->_port = a3;
}

- (int64_t)_proxyProtocol
{
  return self->_proxyProtocol;
}

- (void)set_proxyProtocol:(int64_t)a3
{
  self->_proxyProtocol = a3;
}

- (NSString)_proxyHost
{
  return self->_proxyHost;
}

- (void)set_proxyHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)_proxyPort
{
  return self->_proxyPort;
}

- (void)set_proxyPort:(unsigned __int16)a3
{
  self->_proxyPort = a3;
}

- (NSString)_proxyAccount
{
  return self->_proxyAccount;
}

- (void)set_proxyAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)_proxyPassword
{
  return self->_proxyPassword;
}

- (void)set_proxyPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyAccount, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
