@implementation AAIdentityController

- (AAIdentityController)init
{
  return -[AAIdentityController initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (AAIdentityController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4;
  AAIdentityController *v5;
  AAIdentityDaemonConnection *v6;
  AAIdentityDaemonConnection *daemonConnection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAIdentityController;
  v5 = -[AAIdentityController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AAIdentityDaemonConnection initWithListenerEndpoint:]([AAIdentityDaemonConnection alloc], "initWithListenerEndpoint:", v4);
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
