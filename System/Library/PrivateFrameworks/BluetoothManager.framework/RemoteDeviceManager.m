@implementation RemoteDeviceManager

- (RemoteDeviceManager)init
{
  RemoteDeviceManager *v2;
  _xpc_connection_s *mach_service;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RemoteDeviceManager;
  v2 = -[RemoteDeviceManager init](&v5, sel_init);
  if (v2)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.BTServer.le", 0, 0);
    v2->_connection = mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
    xpc_connection_resume(v2->_connection);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  xpc_release(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)RemoteDeviceManager;
  -[RemoteDeviceManager dealloc](&v3, sel_dealloc);
}

- (void)disconnectDevice:(id)a3
{
  xpc_object_t v5;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "kDeviceAddress", (const char *)objc_msgSend((id)objc_msgSend(a3, "address"), "UTF8String"));
  -[RemoteDeviceManager sendMessage:args:](self, "sendMessage:args:", "DisconnectClassicDevice", v5);
  xpc_release(v5);
}

- (void)sendMessage:(const char *)a3 args:(id)a4
{
  xpc_object_t v7;

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "kMsgId", a3);
  if (a4)
    xpc_dictionary_set_value(v7, "kMsgArgs", a4);
  xpc_connection_send_message(self->_connection, v7);
  xpc_release(v7);
}

@end
