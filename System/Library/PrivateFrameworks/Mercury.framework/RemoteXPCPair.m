@implementation RemoteXPCPair

- (RemoteXPCPair)initWithClient:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  RemoteXPCPair *v9;
  RemoteXPCPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RemoteXPCPair;
  v9 = -[RemoteXPCPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_server, a4);
  }

  return v10;
}

- (OS_xpc_remote_connection)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_xpc_remote_connection)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
