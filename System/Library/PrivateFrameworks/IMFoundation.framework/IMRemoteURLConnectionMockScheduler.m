@implementation IMRemoteURLConnectionMockScheduler

- (IMRemoteURLConnectionMockScheduler)init
{
  IMRemoteURLConnectionMockScheduler *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  IMRemoteURLConnectionMockScheduler *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMRemoteURLConnectionMockScheduler;
  v2 = -[IMRemoteURLConnectionMockScheduler init](&v8, sel_init);
  v6 = v2;
  if (v2)
    objc_msgSend__connect(v2, v3, v4, v5);
  return v6;
}

- (BOOL)_connect
{
  OS_xpc_object *connection;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS_xpc_object *v9;
  OS_xpc_object *v10;
  char v12;

  connection = self->_connection;
  if (!connection)
  {
    if (_IMWillLog(CFSTR("IMRemoteURLMockScheduler")))
      _IMAlwaysLog(0, CFSTR("IMRemoteURLMockScheduler"), CFSTR("Connecting to URLLoading agent"), v4, v5, v6, v7, v8, v12);
    v9 = IMXPCCreateConnectionForServiceWithQueue(0, 0, "com.apple.imfoundation.IMRemoteURLConnectionAgent", MEMORY[0x1E0C80D38], 0, 0);
    v10 = self->_connection;
    self->_connection = v9;

    IMXPCConfigureConnection(self->_connection, &unk_1E2C42EA8, 0);
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)scheduleMockResponse:(id)a3 forURL:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (objc_msgSend__connect(self, v5, v6, v7))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    IMInsertKeyedCodableObjectsToXPCDictionary(v8, "mockResponse", v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    xpc_connection_send_message(self->_connection, v8);

  }
}

- (void)scheduleMockResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v4 = a3;
  objc_msgSend_response(v4, v5, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v17, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_scheduleMockResponse_forURL_(self, v16, (uint64_t)v4, (uint64_t)v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
