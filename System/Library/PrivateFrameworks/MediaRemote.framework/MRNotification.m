@implementation MRNotification

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (OS_xpc_object)xpcMessage
{
  return self->_xpcMessage;
}

- (NSString)notification
{
  return self->_notification;
}

- (MRNotification)initWithNotification:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  MRNotification *v9;
  MRNotification *v10;
  OS_xpc_object *v11;
  OS_xpc_object *xpcMessage;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRNotification;
  v9 = -[MRNotification init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
    v11 = (OS_xpc_object *)-[MRNotification _createNotificationMessage:userInfo:]((uint64_t)v10, v7, v8);
    xpcMessage = v10->_xpcMessage;
    v10->_xpcMessage = v11;

  }
  return v10;
}

- (xpc_object_t)_createNotificationMessage:(void *)a3 userInfo:
{
  id v4;
  id v5;
  xpc_object_t v6;
  id v7;
  const char *v8;
  void *v9;

  if (!a1)
    return 0;
  v4 = a3;
  v5 = a2;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000001uLL);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  xpc_dictionary_set_string(v6, "MRXPC_NOTIFICATION_NAME_KEY", v8);
  MRCreateEncodedUserInfo(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MRAddPropertyListToXPCMessage(v6, (uint64_t)v9, "MRXPC_NOTIFICATION_USERINFO_DATA_KEY");
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcMessage, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (void)setXpcMessage:(id)a3
{
  objc_storeStrong((id *)&self->_xpcMessage, a3);
}

@end
