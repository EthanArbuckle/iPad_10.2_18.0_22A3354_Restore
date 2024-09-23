@implementation NSXPCListener

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCListener;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ service: %@"), -[NSXPCListener description](&v3, sel_description), self->_serviceName);
}

- (id)delegate
{
  void *v2;

  v2 = (void *)atomic_load((unint64_t *)&self->_delegate);
  return (id)objc_msgSend(v2, "weakObjectValue");
}

- (id)serviceName
{
  return self->_serviceName;
}

- (void)setDelegate:(id)delegate
{
  unint64_t *p_delegate;
  void *v5;
  id v6;
  NSValue *v7;

  p_delegate = (unint64_t *)&self->_delegate;
  v5 = (void *)atomic_load((unint64_t *)&self->_delegate);
  v6 = v5;
  if (delegate)
    v7 = +[NSValue valueWithWeakObject:](NSValue, "valueWithWeakObject:", delegate);
  else
    v7 = 0;
  atomic_store((unint64_t)v7, p_delegate);
}

- (void)invalidate
{
  unsigned __int8 *p_state;
  unsigned __int8 v4;
  OS_xpc_object *xpc;
  unsigned __int8 v6;

  p_state = (unsigned __int8 *)&self->_state;
  do
    v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x20, p_state));
  if ((v4 & 0x20) == 0)
  {
    xpc = self->_connection.xpc;
    if (self->_remote)
    {
      if (xpc)
        _xpc_remote_connection_cancel(xpc);
    }
    else if (xpc)
    {
      xpc_connection_cancel(xpc);
    }
  }
  do
    v6 = __ldaxr(p_state);
  while (__stlxr(v6 & 0xEF, p_state));
  if ((v6 & 0x10) != 0)
    CFRelease(self);
}

- (NSXPCListenerEndpoint)endpoint
{
  id v4;
  NSString *v6;

  if (self->_remote)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_6;
  }
  v4 = -[NSXPCListenerEndpoint _initWithConnection:]([NSXPCListenerEndpoint alloc], "_initWithConnection:", self->_connection.xpc);
  if (!v4)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The listener connection must be resumed to create an endpoint."), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  return (NSXPCListenerEndpoint *)v4;
}

- (void)resume
{
  unsigned __int8 *p_state;
  unsigned __int8 v4;
  unsigned __int8 v5;
  OS_xpc_object *xpc;
  void *v7;

  if (self->_remote)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  p_state = (unsigned __int8 *)&self->_state;
  do
    v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x10, p_state));
  if ((v4 & 0x10) == 0)
    CFRetain(self);
  if (+[NSXPCListener serviceListener](NSXPCListener, "serviceListener") == self)
    xpc_main((xpc_connection_handler_t)service_connection_handler);
  do
    v5 = __ldaxr(p_state);
  while (__stlxr(v5 & 0xF7, p_state));
  if ((v5 & 8) != 0)
  {
    -[NSString UTF8String](self->_serviceName, "UTF8String");
    xpc_handle_service();
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
      xpc_connection_resume(xpc);
  }
}

+ (NSXPCListener)serviceListener
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__NSXPCListener_serviceListener__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (_MergedGlobals_155 != -1)
    dispatch_once(&_MergedGlobals_155, v3);
  return (NSXPCListener *)qword_1ECD0A8E0;
}

+ (NSXPCListener)anonymousListener
{
  return -[NSXPCListener initWithServiceName:]([NSXPCListener alloc], "initWithServiceName:", &stru_1E0F56070);
}

- (NSXPCListener)initWithServiceName:(id)a3
{
  NSXPCListener *v5;
  NSXPCListener *v6;
  NSObject *v7;
  qos_class_t v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  _xpc_connection_s *xpc;
  unsigned __int8 *p_state;
  unsigned __int8 v13;
  NSString *v15;
  uint64_t v16;
  objc_super v17;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NSXPCListener;
  v5 = -[NSXPCListener init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The name argument is required. To create an anonymous connection, use a zero-length string."), _NSMethodExceptionProem((objc_class *)v5, a2), v16);
      goto LABEL_12;
    }
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = qos_class_main();
    v9 = dispatch_queue_attr_make_with_qos_class(v7, v8, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSXPCListener.main", v9);
    if (objc_msgSend(a3, "isEqualToString:", &stru_1E0F56070))
    {
      v10 = xpc_connection_create(0, (dispatch_queue_t)v6->_userQueue);
      v6->_connection.xpc = v10;
      if (v10)
      {
        xpc_connection_set_target_queue(v10, (dispatch_queue_t)v6->_userQueue);
        xpc = v6->_connection.xpc;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = ___setupListenerConnection_block_invoke;
        handler[3] = &unk_1E0F4FF38;
        handler[4] = v6;
        xpc_connection_set_event_handler(xpc, handler);
        return v6;
      }
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to create anonymous listener connection with name %@"), _NSMethodExceptionProem((objc_class *)v6, a2), a3);
LABEL_12:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0));
    }
    p_state = (unsigned __int8 *)&v6->_state;
    do
      v13 = __ldxr(p_state);
    while (__stxr(v13 | 8, p_state));
    v6->_serviceName = (NSString *)objc_msgSend(a3, "copy");
    atomic_store((unint64_t)v6, &_additionalListener);
  }
  return v6;
}

- (id)_queue
{
  return self->_userQueue;
}

- (void)_setQueue:(id)a3
{
  OS_dispatch_queue *userQueue;
  BOOL v6;
  OS_xpc_object *xpc;
  NSObject *v8;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The queue parameter is NULL, which is invalid"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  userQueue = self->_userQueue;
  if (userQueue)
    v6 = userQueue == a3;
  else
    v6 = 1;
  if (!v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    xpc = self->_connection.xpc;
    v8 = self->_userQueue;
    self->_userQueue = (OS_dispatch_queue *)a3;
    if (self->_remote)
    {
      if (xpc)
        _xpc_remote_connection_set_target_queue(xpc, a3);
    }
    else if (xpc)
    {
      xpc_connection_set_target_queue(xpc, (dispatch_queue_t)a3);
    }
    dispatch_release(v8);
  }
}

- (void)dealloc
{
  NSObject *userQueue;
  OS_xpc_object *xpc;
  void *v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  userQueue = self->_userQueue;
  if (userQueue)
    dispatch_release(userQueue);
  xpc = self->_connection.xpc;
  if (xpc)
    xpc_release(xpc);

  v5 = (void *)atomic_load((unint64_t *)&self->_delegate);
  v6.receiver = self;
  v6.super_class = (Class)NSXPCListener;
  -[NSXPCListener dealloc](&v6, sel_dealloc);
}

uint64_t __32__NSXPCListener_serviceListener__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initShared");
  qword_1ECD0A8E0 = result;
  return result;
}

- (id)_initShared
{
  NSXPCListener *v2;
  NSXPCListener *v3;
  NSObject *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSXPCListener;
  v2 = -[NSXPCListener init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_remote = 0;
    v4 = MEMORY[0x1E0C80D38];
    v3->_userQueue = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    dispatch_retain(v4);
  }
  return v3;
}

- (NSXPCListener)initWithMachServiceName:(NSString *)name
{
  NSXPCListener *v5;
  NSXPCListener *v6;
  NSObject *v7;
  qos_class_t v8;
  NSObject *v9;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *xpc;
  NSString *v13;
  uint64_t v14;
  objc_super v15;
  _QWORD handler[6];

  handler[5] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSXPCListener;
  v5 = -[NSXPCListener init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    if (name)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = qos_class_main();
      v9 = dispatch_queue_attr_make_with_qos_class(v7, v8, 0);
      v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(CFSTR("com.apple.NSXPCListener.service."), "stringByAppendingString:", name), "UTF8String"), v9);
      v6->_serviceName = (NSString *)-[NSString copy](name, "copy");
      mach_service = xpc_connection_create_mach_service(-[NSString UTF8String](name, "UTF8String"), (dispatch_queue_t)v6->_userQueue, 1uLL);
      v6->_connection.xpc = mach_service;
      if (mach_service)
      {
        xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v6->_userQueue);
        xpc = v6->_connection.xpc;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = ___setupListenerConnection_block_invoke;
        handler[3] = &unk_1E0F4FF38;
        handler[4] = v6;
        xpc_connection_set_event_handler(xpc, handler);
        return v6;
      }
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to create connection with name %@"), _NSMethodExceptionProem((objc_class *)v6, a2), name);
    }
    else
    {
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The name argument is required."), _NSMethodExceptionProem((objc_class *)v5, a2), v14);
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
  }
  return v6;
}

- (id)_initWithRemoteName:(id)a3
{
  NSXPCListener *v6;
  NSXPCListener *v7;
  NSObject *v8;
  qos_class_t v9;
  NSObject *v10;
  uint64_t v11;
  OS_xpc_object *xpc;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v17;
  uint64_t v18;
  objc_super v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  _NSXPCConnectionInitRemoteXPC();
  v19.receiver = self;
  v19.super_class = (Class)NSXPCListener;
  v6 = -[NSXPCListener init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = qos_class_main();
      v10 = dispatch_queue_attr_make_with_qos_class(v8, v9, 0);
      v7->_userQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(CFSTR("com.apple.NSXPCListener.remote."), "stringByAppendingString:", a3), "UTF8String"), v10);
      v7->_serviceName = (NSString *)objc_msgSend(a3, "copy");
      v7->_remote = 1;
      v11 = ((uint64_t (*)(uint64_t, OS_dispatch_queue *, _QWORD))_xpc_remote_connection_create_remote_service_listener)(objc_msgSend(a3, "UTF8String"), v7->_userQueue, 0);
      v7->_connection.xpc = (OS_xpc_object *)v11;
      if (v11)
      {
        _xpc_remote_connection_set_target_queue(v11, v7->_userQueue);
        xpc = v7->_connection.xpc;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = ___setupRemoteListenerConnection_block_invoke;
        v20[3] = &unk_1E0F4FF38;
        v20[4] = v7;
        _xpc_remote_connection_set_event_handler(xpc, v20, v13, v14, v15);
        return v7;
      }
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to create remote connection with name %@"), _NSMethodExceptionProem((objc_class *)v7, a2), a3);
    }
    else
    {
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The name argument is required."), _NSMethodExceptionProem((objc_class *)v6, a2), v18);
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
  }
  return v7;
}

- (id)__initWithoutRemoteConnection
{
  NSXPCListener *v3;
  NSObject *v4;
  qos_class_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_xpc_object *xpc;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  _NSXPCConnectionInitRemoteXPC();
  v13.receiver = self;
  v13.super_class = (Class)NSXPCListener;
  v3 = -[NSXPCListener init](&v13, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = qos_class_main();
    v6 = dispatch_queue_attr_make_with_qos_class(v4, v5, 0);
    v7 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.NSXPCListener.remote.__initWithoutRemoteConnection"), "UTF8String"), v6);
    v3->_userQueue = (OS_dispatch_queue *)v7;
    v3->_serviceName = (NSString *)CFSTR("__initWithoutRemoteConnection");
    v3->_remote = 1;
    _xpc_remote_connection_set_target_queue(v3->_connection.xpc, v7);
    xpc = v3->_connection.xpc;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___setupRemoteListenerConnection_block_invoke;
    v14[3] = &unk_1E0F4FF38;
    v14[4] = v3;
    _xpc_remote_connection_set_event_handler(xpc, v14, v9, v10, v11);
  }
  return v3;
}

- (void)__receiveRemoteConnection:(id)a3
{
  if (self->_remote)
    service_connection_handler_make_remote_connection(self, (uint64_t)a3);
}

- (void)suspend
{
  OS_xpc_object *xpc;
  void *v3;

  if (self->_remote)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v3);
  }
  xpc = self->_connection.xpc;
  if (xpc)
    xpc_connection_suspend(xpc);
}

- (void)activate
{
  unsigned __int8 *p_state;
  unsigned __int8 v4;
  unsigned __int8 v5;
  OS_xpc_object *xpc;

  p_state = (unsigned __int8 *)&self->_state;
  do
    v4 = __ldaxr(p_state);
  while (__stlxr(v4 | 0x10, p_state));
  if ((v4 & 0x10) == 0)
    CFRetain(self);
  if (+[NSXPCListener serviceListener](NSXPCListener, "serviceListener") == self)
    xpc_main((xpc_connection_handler_t)service_connection_handler);
  do
    v5 = __ldaxr(p_state);
  while (__stlxr(v5 & 0xF7, p_state));
  if ((v5 & 8) != 0)
  {
    -[NSString UTF8String](self->_serviceName, "UTF8String");
    xpc_handle_service();
  }
  else
  {
    xpc = self->_connection.xpc;
    if (self->_remote)
    {
      if (xpc)
        _xpc_remote_connection_activate(xpc);
    }
    else if (xpc)
    {
      xpc_connection_activate(xpc);
    }
  }
}

- (void)setOptions:(unint64_t)a3
{
  __int16 v3;
  void *v6;

  v3 = a3;
  if ((a3 & 0x100) != 0)
  {
    if (self->_remote)
      goto LABEL_7;
    xpc_connection_set_legacy();
  }
  if ((v3 & 0x1000) == 0)
    return;
  if (self->_remote)
  {
LABEL_7:
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  xpc_connection_set_privileged();
}

- (id)_xpcConnection
{
  void *v3;

  if (self->_remote)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Remote connections do not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v3);
  }
  return self->_connection.xpc;
}

+ (void)enableTransactions
{
  if (enableTransactions_onceToken != -1)
    dispatch_once(&enableTransactions_onceToken, &__block_literal_global_87);
}

+ (id)_UUID
{
  id result;

  result = getenv("LaunchInstanceID");
  if (result)
    return -[NSUUID initWithUUIDString:]([NSUUID alloc], "initWithUUIDString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", result));
  return result;
}

@end
