@implementation _BKSTouchDeliveryPolicyConcreteServerInterface

- (_BKSTouchDeliveryPolicyConcreteServerInterface)init
{
  _BKSTouchDeliveryPolicyConcreteServerInterface *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_BKSTouchDeliveryPolicyConcreteServerInterface;
  v2 = -[_BKSTouchDeliveryPolicyConcreteServerInterface init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.backboard.TouchDeliveryPolicyServer"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF5D080);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
