@implementation BSXPCConnectionListener

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  if (self)
  {
    connection = self->_connection;
    self->_connection = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)BSXPCConnectionListener;
  -[BSXPCConnectionListener dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_service, CFSTR("service"));
  v5 = (id)objc_msgSend(v3, "appendQueue:withName:", self->_queue, CFSTR("queue"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
