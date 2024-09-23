@implementation IMConnectionMonitor

+ (IMConnectionMonitor)alloc
{
  objc_super v4;

  if ((id)objc_opt_class() == a1)
    return (IMConnectionMonitor *)[IMNetworkConnectionMonitor alloc];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___IMConnectionMonitor;
  return (IMConnectionMonitor *)objc_msgSendSuper2(&v4, sel_alloc);
}

- (IMConnectionMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  IMConnectionMonitor *v11;
  uint64_t v12;
  NSString *remoteHost;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMConnectionMonitor;
  v11 = -[IMConnectionMonitor init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    remoteHost = v11->_remoteHost;
    v11->_remoteHost = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v7);
    objc_msgSend__setup(v11, v14, v15, v16);
  }

  return v11;
}

- (BOOL)isDataConnectionActive
{
  return 1;
}

- (BOOL)requiresDataConnectionActivation
{
  return 0;
}

- (BOOL)isImmediatelyReachable
{
  return 0;
}

- (NSString)remoteHost
{
  return self->_remoteHost;
}

- (IMConnectionMonitorDelegate)delegate
{
  return (IMConnectionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteHost, 0);
}

@end
