@implementation MKConnection

- (MKConnection)initWithConnection:(id)a3 queue:(id)a4 hostname:(id)a5
{
  id v8;
  id v9;
  id v10;
  MKConnection *v11;
  MKConnection *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MKConnection;
  v11 = -[MKConnection init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MKConnection setConnection:](v11, "setConnection:", v8);
    -[MKConnection setQueue:](v12, "setQueue:", v9);
    -[MKConnection setHostname:](v12, "setHostname:", v10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKConnection setIdentifier:](v12, "setIdentifier:", v13);

  }
  return v12;
}

- (NSValue)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (OS_nw_connection *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
