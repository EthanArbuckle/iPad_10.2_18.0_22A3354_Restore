@implementation HMXPCClientConnectionProxy

- (void)handleMessage:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v8 = a3;
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMXPCClientInitiateRefreshConfigMessage"));

  if (!v5)
  {
    -[HMFMessageTransport delegate](self, "delegate");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageTransport:didReceiveMessage:", self, v8);
    goto LABEL_5;
  }
  -[HMXPCClientConnectionProxy refreshHandler](self, "refreshHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMXPCClientConnectionProxy refreshHandler](self, "refreshHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
LABEL_5:

  }
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMXPCClientConnectionProxy)initWithUserInfo:(id)a3 refreshHandler:(id)a4
{
  id v6;
  id v7;
  HMXPCClientConnectionProxy *v8;
  uint64_t v9;
  NSDictionary *userInfo;
  void *v11;
  id refreshHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMXPCClientConnectionProxy;
  v8 = -[HMXPCClientConnectionProxy init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v9;

    v11 = _Block_copy(v7);
    refreshHandler = v8->_refreshHandler;
    v8->_refreshHandler = v11;

  }
  return v8;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  objc_msgSend(v6, "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMXPCClientConnectionProxy handleMessage:responseHandler:](self, "handleMessage:responseHandler:", v6, v7);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)handleMessage:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setResponseHandler:", v6);

  v9 = (id)objc_msgSend(v7, "copy");
  -[HMFMessageTransport delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageTransport:didReceiveMessage:", self, v9);

}

- (id)refreshHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshHandler, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
