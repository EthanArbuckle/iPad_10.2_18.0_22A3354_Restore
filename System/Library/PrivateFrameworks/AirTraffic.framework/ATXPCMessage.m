@implementation ATXPCMessage

- (ATXPCMessage)initWithName:(id)a3
{
  id v4;
  ATXPCMessage *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXPCMessage;
  v5 = -[ATXPCMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATXPCMessage;
  -[ATXPCMessage dealloc](&v2, sel_dealloc);
}

- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  ATXPCMessage *v8;
  ATXPCMessage *v9;
  const char *string;
  uint64_t v11;
  NSString *name;
  const void *data;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  OS_xpc_object *reply;
  OS_xpc_object *x_reply;
  uint64_t v21;
  OS_xpc_object *x_reply_connection;
  size_t v24;
  objc_super v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ATXPCMessage;
  v8 = -[ATXPCMessage init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_receivingConnection, a4);
    string = xpc_dictionary_get_string(v6, "kDKMessageNameKey");
    if (string)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
      name = v9->_name;
      v9->_name = (NSString *)v11;
    }
    else
    {
      name = v9->_name;
      v9->_name = 0;
    }

    v24 = 0;
    data = xpc_dictionary_get_data(v6, "kDKMessageInfoKey", &v24);
    v14 = 0;
    if (data && v24)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", data, v24, 0);
      if (v15)
      {
        v26 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v15, 0, 0, &v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v26;
        if (v16)
        {
          v17 = v16;
          v18 = os_log_create("com.apple.amp.AirTraffic", "XPC");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v17;
            _os_log_impl(&dword_20BB5D000, v18, OS_LOG_TYPE_ERROR, "Error deserializing plist %{public}@", buf, 0xCu);
          }

        }
      }
      else
      {
        v14 = 0;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v9->_info, v14);
    reply = (OS_xpc_object *)xpc_dictionary_create_reply(v6);
    x_reply = v9->_x_reply;
    v9->_x_reply = reply;

    if (v9->_x_reply)
    {
      -[ATXPCConnection _registerMessage:](v9->_receivingConnection, "_registerMessage:", v9);
      xpc_dictionary_get_remote_connection(v6);
      v21 = objc_claimAutoreleasedReturnValue();
      x_reply_connection = v9->_x_reply_connection;
      v9->_x_reply_connection = (OS_xpc_object *)v21;

    }
  }

  return v9;
}

- (id)_createXPCMessage
{
  xpc_object_t v3;
  NSDictionary *info;
  void *v5;
  id v6;
  xpc_object_t v7;
  id v8;
  id v9;
  xpc_object_t v10;
  uint64_t i;
  xpc_object_t v13[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_string_create(-[NSString UTF8String](self->_name, "UTF8String"));
  info = self->_info;
  if (info
    && (objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", info, 200, 0, 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_retainAutorelease(v5);
    v7 = xpc_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *(_OWORD *)keys = xmmword_24C4CA438;
  v8 = v3;
  v13[0] = v8;
  v9 = v7;
  v13[1] = v9;
  v10 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  for (i = 1; i != -1; --i)

  return v10;
}

- (void)sendReply:(id)a3
{
  id v5;
  OS_xpc_object *x_reply;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  x_reply = self->_x_reply;
  v10 = v5;
  if (x_reply && self->_x_reply_connection)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      x_reply = self->_x_reply;
      if (v7)
      {
        v8 = objc_retainAutorelease(v7);
        xpc_dictionary_set_data(x_reply, "kDKMessageInfoKey", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

        x_reply = self->_x_reply;
      }
    }
    xpc_connection_send_message(self->_x_reply_connection, x_reply);
    -[ATXPCConnection _removeMessage:](self->_receivingConnection, "_removeMessage:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXPCConnection.m"), 471, CFSTR("Trying to send reply where one isn't expected"));

  }
}

- (BOOL)needsReply
{
  return self->_x_reply && self->_x_reply_connection != 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_x_reply, 0);
  objc_storeStrong((id *)&self->_x_reply_connection, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_receivingConnection, 0);
}

@end
