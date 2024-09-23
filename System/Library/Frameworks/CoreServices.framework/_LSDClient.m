@implementation _LSDClient

- (void)handleXPCInvocation:(id)a3 isReply:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  const char *Name;
  const char *v11;
  _QWORD v12[6];
  BOOL v13;
  _BYTE v14[24];
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  if (self->_queue)
  {
    -[_LSDClient willHandleInvocation:isReply:](self, "willHandleInvocation:isReply:", a3, a4);
    MEMORY[0x186DAF208](objc_msgSend(a3, "retainArguments"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51___LSDClient_Private__handleXPCInvocation_isReply___block_invoke;
    v12[3] = &unk_1E1043CA0;
    v12[4] = self;
    v12[5] = a3;
    v13 = v4;
    _LSServer_MakeServiceFloorBlock(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        Name = class_getName(v9);
        v11 = sel_getName((SEL)objc_msgSend(a3, "selector"));
        -[_LSDClient(Private) handleXPCInvocation:isReply:].cold.1((uint64_t)v11, (uint64_t)v14, (uint64_t)Name, v8);
      }

      abort();
    }
    dispatch_async((dispatch_queue_t)self->_queue, v7);

  }
  else
  {
    -[_LSDClient willHandleInvocation:isReply:](self, "willHandleInvocation:isReply:", a3, a4);
    -[_LSDClient invokeServiceInvocation:isReply:](self, "invokeServiceInvocation:isReply:", a3, v4);
    -[_LSDClient didHandleInvocation:isReply:](self, "didHandleInvocation:isReply:", a3, v4);
  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  objc_msgSend(a3, "invoke");
}

- (_LSDClient)initWithXPCConnection:(id)a3 queue:(id)a4
{
  _LSDClient *v5;
  _LSDClient *v6;

  v5 = -[_LSDClient initWithXPCConnection:](self, "initWithXPCConnection:", a3);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_queue, a4);
  return v6;
}

- (_LSDClient)initWithXPCConnection:(id)a3
{
  _LSDClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSDClient;
  v4 = -[_LSDClient init](&v6, sel_init);
  _LSAssertRunningInServer((uint64_t)"-[_LSDClient initWithXPCConnection:]");
  if (v4)
    objc_storeStrong((id *)&v4->_XPCConnection, a3);
  return v4;
}

- (NSXPCConnection)XPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

@end
