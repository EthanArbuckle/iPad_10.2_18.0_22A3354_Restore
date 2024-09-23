@implementation MAXpcConnection

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (MAXpcConnection)initWithServiceName:(id)a3
{
  id v4;
  MAXpcConnection *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  void *v8;
  uint64_t v9;
  NSString *connectionId;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAXpcConnection;
  v5 = -[MAXpcConnection init](&v12, sel_init);
  if (v5)
  {
    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), 0, 0);
    connection = v5->_connection;
    v5->_connection = mach_service;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    connectionId = v5->_connectionId;
    v5->_connectionId = (NSString *)v9;

  }
  return v5;
}

- (BOOL)notValid
{
  return !self->_connection || !self->_connectionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
