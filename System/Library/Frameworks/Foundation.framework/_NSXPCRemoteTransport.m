@implementation _NSXPCRemoteTransport

- (_NSXPCRemoteTransport)initWithConnection:(id)a3
{
  _NSXPCRemoteTransport *v4;
  OS_xpc_remote_connection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_NSXPCRemoteTransport;
  v4 = -[_NSXPCRemoteTransport init](&v11, sel_init);
  if (_MergedGlobals_112 != -1)
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  v5 = (OS_xpc_remote_connection *)xpc_retain(a3);
  v4->_connection = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44___NSXPCRemoteTransport_initWithConnection___block_invoke;
  v10[3] = &unk_1E0F4FF38;
  v10[4] = v4;
  _xpc_remote_connection_set_event_handler(v5, v10, v6, v7, v8);
  return v4;
}

- (_NSXPCRemoteTransport)initWithRemoteService:(id)a3 name:(id)a4 queue:(id)a5 mode:(unint64_t)a6
{
  _NSXPCRemoteTransport *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  _QWORD v18[5];
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_NSXPCRemoteTransport;
  v11 = -[_NSXPCRemoteTransport init](&v19, sel_init);
  if (_MergedGlobals_112 != -1)
    dispatch_once(&_MergedGlobals_112, &__block_literal_global_36);
  v12 = off_1ECD09FC8(a3, a5, a6);
  v11->_connection = (OS_xpc_remote_connection *)v12;
  if (!v12)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to connect to the specified name (%@). No connection was created."), _NSMethodExceptionProem((objc_class *)v11, a2), a4), 0);
    objc_exception_throw(v17);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63___NSXPCRemoteTransport_initWithRemoteService_name_queue_mode___block_invoke;
  v18[3] = &unk_1E0F4FF38;
  v18[4] = v11;
  _xpc_remote_connection_set_event_handler(v12, v18, v13, v14, v15);
  return v11;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_release(self->_connection);
  _Block_release(self->_errorHandler);
  _Block_release(self->_messageHandler);
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCRemoteTransport;
  -[_NSXPCRemoteTransport dealloc](&v3, sel_dealloc);
}

- (void)setErrorHandler:(id)a3
{
  _Block_release(self->_errorHandler);
  self->_errorHandler = _Block_copy(a3);
}

- (void)setMessageHandler:(id)a3
{
  _Block_release(self->_messageHandler);
  self->_messageHandler = _Block_copy(a3);
}

- (void)sendMessage:(id)a3
{
  off_1ECD09FD8(self->_connection, a3);
}

- (id)sendMessageWithReplySync:(id)a3
{
  return (id)__NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REMOTE_REPLY__();
}

- (void)sendMessageWithReply:(id)a3 onQueue:(id)a4 replyHandler:(id)a5
{
  off_1ECD09FE0(self->_connection, a3, a4, a5);
}

- (void)sendNotification:(id)a3
{
  off_1ECD09FD8(self->_connection, a3);
}

- (void)sendBarrierBlock:(id)a3
{
  off_1ECD09FD0(self->_connection, a3);
}

- (void)setTargetQueue:(id)a3
{
  _xpc_remote_connection_set_target_queue(self->_connection, a3);
}

- (void)activate
{
  _xpc_remote_connection_activate(self->_connection);
}

- (void)suspend
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (void)resume
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (void)cancel
{
  _xpc_remote_connection_cancel(self->_connection);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a3)), 0);
  objc_exception_throw(v3);
}

- (int)auditSessionIdentifier
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (int)processIdentifier
{
  return 0;
}

- (unsigned)effectiveUserIdentifier
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (unsigned)effectiveGroupIdentifier
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

@end
