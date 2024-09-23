@implementation IMDMessageServicesCenter

+ (id)sharedInstance
{
  if (qword_253E79AB8 != -1)
    dispatch_once(&qword_253E79AB8, &unk_24DE4DFB0);
  return (id)qword_253E79AC0;
}

- (IMDMessageServicesCenter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDMessageServicesCenter;
  return -[IMDMessageServicesCenter init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMDMessageServicesCenter;
  -[IMDMessageServicesCenter dealloc](&v2, sel_dealloc);
}

- (void)_disconnected
{
  NSObject *v3;
  OS_xpc_object *connection;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21B13F000, v3, OS_LOG_TYPE_DEBUG, "Clearing out _connection, we're disconnected", v5, 2u);
    }
  }
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    xpc_release(self->_connection);
    self->_connection = 0;
  }
}

- (BOOL)_disconnect
{
  NSObject *v3;
  uint8_t v5[16];

  if (self->_connection)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21B13F000, v3, OS_LOG_TYPE_DEBUG, "Forcing a disconnect, terminating connection", v5, 2u);
      }
    }
    xpc_connection_cancel(self->_connection);
    xpc_release(self->_connection);
    self->_connection = 0;
  }
  return 1;
}

- (BOOL)_connect
{
  OS_xpc_object *connection;
  NSObject *v4;
  uint8_t buf[16];

  connection = self->_connection;
  if (!connection)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B13F000, v4, OS_LOG_TYPE_INFO, "Connecting to message services agent", buf, 2u);
      }
    }
    self->_connection = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)_requestRoutingWithGUID:(id)a3 chatGUID:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 handler:(id)a7
{
  uint64_t v8;
  xpc_object_t v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[8];
  _QWORD handler[5];

  v8 = *(_QWORD *)&a6;
  if (-[IMDMessageServicesCenter _connect](self, "_connect"))
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    v15 = v8;
    IMInsertIntsToXPCDictionary();
    if (a3)
    {
      v15 = objc_msgSend(a3, "UTF8String", v8, 0);
      IMInsertStringsToXPCDictionary();
    }
    if (a4)
    {
      v15 = objc_msgSend(a4, "UTF8String");
      IMInsertStringsToXPCDictionary();
    }
    if (objc_msgSend(a5, "count", v15, 0))
      IMInsertArraysToXPCDictionary();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B1405BC;
    handler[3] = &unk_24DE4E000;
    handler[4] = a7;
    xpc_connection_send_message_with_reply(self->_connection, v13, MEMORY[0x24BDAC9B8], handler);
    xpc_release(v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B13F000, v14, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a7)
      (*((void (**)(id, _QWORD, double))a7 + 2))(a7, 0, 0.0);
  }
}

- (void)requestRoutingWithDowngradableServices:(id)a3 completion:(id)a4
{
  NSObject *v7;
  uint8_t v8[16];

  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21B13F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for routing", v8, 2u);
    }
  }
  -[IMDMessageServicesCenter _requestRoutingWithGUID:chatGUID:downgradableServices:error:handler:](self, "_requestRoutingWithGUID:chatGUID:downgradableServices:error:handler:", 0, 0, a3, 0, a4);
}

- (void)requestRoutingForMessageGuid:(id)a3 inChat:(id)a4 downgradableServices:(id)a5 error:(unsigned int)a6 completionBlock:(id)a7
{
  uint64_t v8;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v8 = *(_QWORD *)&a6;
  v18 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = a3;
      v16 = 1024;
      v17 = v8;
      _os_log_impl(&dword_21B13F000, v13, OS_LOG_TYPE_INFO, "MessageServices received request for routing for guid:%@  error:%d", (uint8_t *)&v14, 0x12u);
    }
  }
  -[IMDMessageServicesCenter _requestRoutingWithGUID:chatGUID:downgradableServices:error:handler:](self, "_requestRoutingWithGUID:chatGUID:downgradableServices:error:handler:", a3, a4, a5, v8, a7);
}

- (void)_requestExpireStateWithGUID:(id)a3 handler:(id)a4
{
  xpc_object_t v7;
  NSObject *v8;
  uint8_t buf[8];
  _QWORD handler[5];

  if (-[IMDMessageServicesCenter _connect](self, "_connect"))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "expire", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B140BF8;
    handler[3] = &unk_24DE4E000;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x24BDAC9B8], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4)
      (*((void (**)(id, _QWORD, double))a4 + 2))(a4, 0, 0.0);
  }
}

- (void)requestExpireStateWithCompletion:(id)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for expire state", v6, 2u);
    }
  }
  -[IMDMessageServicesCenter _requestExpireStateWithGUID:handler:](self, "_requestExpireStateWithGUID:handler:", 0, a3);
}

- (void)requestExpireStateForMessageGuid:(id)a3 completionBlock:(id)a4
{
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_21B13F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for expire state for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  -[IMDMessageServicesCenter _requestExpireStateWithGUID:handler:](self, "_requestExpireStateWithGUID:handler:", a3, a4);
}

- (void)_requestWatchdogWithGUID:(id)a3 handler:(id)a4
{
  xpc_object_t v7;
  NSObject *v8;
  uint8_t buf[8];
  _QWORD handler[5];

  if (-[IMDMessageServicesCenter _connect](self, "_connect"))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "watchdog", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B1411F0;
    handler[3] = &unk_24DE4E000;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x24BDAC9B8], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4)
      (*((void (**)(id, _QWORD, double))a4 + 2))(a4, 0, 0.0);
  }
}

- (void)requestWatchdogWithCompletion:(id)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for watchdog", v6, 2u);
    }
  }
  -[IMDMessageServicesCenter _requestWatchdogWithGUID:handler:](self, "_requestWatchdogWithGUID:handler:", 0, a3);
}

- (void)requestWatchdogForMessageGuid:(id)a3 completionBlock:(id)a4
{
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_21B13F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for watchdog for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  -[IMDMessageServicesCenter _requestWatchdogWithGUID:handler:](self, "_requestWatchdogWithGUID:handler:", a3, a4);
}

- (void)_requestScheduleMessagesWithGUID:(id)a3 handler:(id)a4
{
  xpc_object_t v7;
  NSObject *v8;
  uint8_t buf[8];
  _QWORD handler[5];

  if (-[IMDMessageServicesCenter _connect](self, "_connect"))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    IMInsertStringsToXPCDictionary();
    if (a3)
    {
      objc_msgSend(a3, "UTF8String", "scheduled", 0);
      IMInsertStringsToXPCDictionary();
    }
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B1417EC;
    handler[3] = &unk_24DE4E000;
    handler[4] = a4;
    xpc_connection_send_message_with_reply(self->_connection, v7, MEMORY[0x24BDAC9B8], handler);
    xpc_release(v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Unable to connect to message services agent", buf, 2u);
      }
    }
    if (a4)
      (*((void (**)(id, _QWORD, double))a4 + 2))(a4, 0, 60.0);
  }
}

- (void)requestScheduledMessagesWithCompletion:(id)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "MessageServices received request for Schedule Messages", v6, 2u);
    }
  }
  -[IMDMessageServicesCenter _requestScheduleMessagesWithGUID:handler:](self, "_requestScheduleMessagesWithGUID:handler:", 0, a3);
}

- (void)requestScheduledMessageForGuid:(id)a3 completionBlock:(id)a4
{
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_21B13F000, v7, OS_LOG_TYPE_INFO, "MessageServices received request for Schedule Messages for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  -[IMDMessageServicesCenter _requestScheduleMessagesWithGUID:handler:](self, "_requestScheduleMessagesWithGUID:handler:", a3, a4);
}

@end
