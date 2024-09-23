@implementation _BMXPCTransport

- (_BMXPCTransport)initWithConnection:(id)a3
{
  id v5;
  _BMXPCTransport *v6;
  uint64_t v7;
  NSMutableDictionary *exportedUserInfo;
  uint64_t v9;
  NSDictionary *remoteUserInfo;
  _xpc_connection_s *connection;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BMXPCTransport;
  v6 = -[_BMXPCTransport init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    exportedUserInfo = v6->_exportedUserInfo;
    v6->_exportedUserInfo = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    remoteUserInfo = v6->_remoteUserInfo;
    v6->_remoteUserInfo = (NSDictionary *)v9;

    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    -[_BMXPCTransport _handleEvent](v6, "_handleEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_event_handler(connection, v12);

  }
  return v6;
}

- (id)_handleEvent
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31___BMXPCTransport__handleEvent__block_invoke;
  v3[3] = &unk_1E5E3CB88;
  v3[4] = self;
  return (id)MEMORY[0x1AF456B84](v3, a2);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_BMXPCTransport;
  -[_BMXPCTransport dealloc](&v2, sel_dealloc);
}

- (void)activate
{
  xpc_connection_activate(self->_connection);
}

- (int)auditSessionIdentifier
{
  return xpc_connection_get_asid(self->_connection);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)xpc_connection_get_audit_token();
}

- (void)cancel
{
  xpc_connection_cancel(self->_connection);
}

- (unsigned)effectiveGroupIdentifier
{
  return xpc_connection_get_egid(self->_connection);
}

- (unsigned)effectiveUserIdentifier
{
  return xpc_connection_get_euid(self->_connection);
}

- (int)processIdentifier
{
  return xpc_connection_get_pid(self->_connection);
}

- (void)resume
{
  xpc_connection_resume(self->_connection);
}

- (void)sendBarrierBlock:(id)a3
{
  xpc_connection_send_barrier(self->_connection, a3);
}

- (void)_willSendMessage:(id)a3
{
  void *v4;
  void *v5;
  xpc_object_t xdict;

  xdict = a3;
  -[_BMXPCTransport exportedUserInfo](self, "exportedUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(xdict, "bm_info", v5);

  }
}

- (void)sendMessage:(id)a3
{
  xpc_object_t message;

  message = a3;
  -[_BMXPCTransport _willSendMessage:](self, "_willSendMessage:", message);
  xpc_connection_send_message(self->_connection, message);

}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSObject *v9;
  xpc_object_t message;

  v8 = a5;
  v9 = a4;
  message = a3;
  -[_BMXPCTransport _willSendMessage:](self, "_willSendMessage:", message);
  xpc_connection_send_message_with_reply(self->_connection, message, v9, v8);

}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4;
  xpc_object_t v5;

  v4 = a3;
  -[_BMXPCTransport _willSendMessage:](self, "_willSendMessage:", v4);
  v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);

  return v5;
}

- (void)sendNotification:(id)a3
{
  id v4;

  v4 = a3;
  -[_BMXPCTransport _willSendMessage:](self, "_willSendMessage:", v4);
  xpc_connection_send_notification();

}

- (void)setTargetQueue:(id)a3
{
  NSObject *targetq;

  targetq = a3;
  if (self->_queue != targetq)
  {
    objc_storeStrong((id *)&self->_queue, a3);
    xpc_connection_set_target_queue(self->_connection, targetq);
  }

}

- (void)suspend
{
  xpc_connection_suspend(self->_connection);
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  NSObject *v3;

  if (a3)
  {
    xpc_connection_set_target_uid();
  }
  else
  {
    __biome_log_for_category(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[_BMXPCTransport _setTargetUserIdentifier:].cold.1(v3);

  }
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)exportedUserInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExportedUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)remoteUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRemoteUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUserInfo, 0);
  objc_storeStrong((id *)&self->_exportedUserInfo, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_setTargetUserIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AEB31000, log, OS_LOG_TYPE_FAULT, "Ignoring _setTargetUserIdentifier: because chosen UID is 0", v1, 2u);
}

@end
