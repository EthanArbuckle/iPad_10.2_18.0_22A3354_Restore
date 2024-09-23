@implementation XPCNSServiceListener

- (XPCNSServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  XPCNSServiceListenerDelegate *v10;
  XPCNSServiceListener *v11;
  XPCServiceListener *v12;
  XPCServiceListener *serviceListener;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = (XPCNSServiceListenerDelegate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)XPCNSServiceListener;
  v11 = -[XPCNSServiceListener init](&v15, sel_init);
  if (v11)
  {
    v12 = -[XPCServiceListener initWithServiceName:queue:delegate:]([XPCServiceListener alloc], "initWithServiceName:queue:delegate:", v8, v9, v11);
    serviceListener = v11->_serviceListener;
    v11->_serviceListener = v12;

    v11->_delegate = v10;
  }

  return v11;
}

- (void)start
{
  -[XPCServiceListener start](self->_serviceListener, "start");
}

- (void)shutDownCompletionBlock:(id)a3
{
  -[XPCServiceListener shutDownCompletionBlock:](self->_serviceListener, "shutDownCompletionBlock:", a3);
}

- (NSString)serviceName
{
  return -[XPCServiceListener serviceName](self->_serviceListener, "serviceName");
}

- (BOOL)XPCServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[XPCNSServiceListenerDelegate XPCNSServiceListener:shouldReceiveNewConnection:](self->_delegate, "XPCNSServiceListener:shouldReceiveNewConnection:", self, v5);
  else
    v6 = 1;

  return v6;
}

- (void)XPCServiceListener:(id)a3 didReceiveNewConnection:(id)a4
{
  id v5;
  XPCNSServiceConnection *v6;

  v5 = a4;
  v6 = -[XPCNSServiceConnection initWithXPCServiceConnection:]([XPCNSServiceConnection alloc], "initWithXPCServiceConnection:", v5);

  -[XPCNSServiceListenerDelegate XPCNSServiceListener:didReceiveNewConnection:](self->_delegate, "XPCNSServiceListener:didReceiveNewConnection:", self, v6);
}

- (XPCNSServiceListenerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceListener, 0);
}

@end
