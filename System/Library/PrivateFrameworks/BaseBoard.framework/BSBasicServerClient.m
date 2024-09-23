@implementation BSBasicServerClient

- (void)invalidate
{
  int *p_cancelled;
  _xpc_connection_s *connection;

  -[BSBasicServerClient connection](self, "connection");
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (connection)
  {
    p_cancelled = &self->_cancelled;
    do
    {
      if (__ldxr((unsigned int *)p_cancelled))
      {
        __clrex();
        goto LABEL_8;
      }
    }
    while (__stxr(1u, (unsigned int *)p_cancelled));
    xpc_connection_cancel(connection);
    if (self->_managingResumeState)
      -[BSBasicServerClient resume](self, "resume");
  }
LABEL_8:

}

- (void)resume
{
  int *p_resumed;
  _xpc_connection_s *connection;

  -[BSBasicServerClient connection](self, "connection");
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (connection)
  {
    p_resumed = &self->_resumed;
    while (!__ldxr((unsigned int *)p_resumed))
    {
      if (!__stxr(1u, (unsigned int *)p_resumed))
      {
        self->_managingResumeState = 1;
        xpc_connection_resume(connection);
        goto LABEL_7;
      }
    }
    __clrex();
  }
LABEL_7:

}

- (OS_xpc_object)connection
{
  return self->_connection;
}

+ (id)wrapperWithConnection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnection:", v4);

  return v5;
}

- (BSBasicServerClient)initWithConnection:(id)a3
{
  id v5;
  BSBasicServerClient *v6;
  BSBasicServerClient *v7;

  v5 = a3;
  v6 = -[BSBasicServerClient init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BSBasicServerClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSBasicServerClient;
  -[BSBasicServerClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", xpc_connection_get_pid(self->_connection), CFSTR("pid"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)suspend
{
  int *p_resumed;
  unsigned int v4;
  _xpc_connection_s *connection;

  -[BSBasicServerClient connection](self, "connection");
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (connection)
  {
    p_resumed = &self->_resumed;
    while (1)
    {
      v4 = __ldxr((unsigned int *)p_resumed);
      if (v4 != 1)
        break;
      if (!__stxr(0, (unsigned int *)p_resumed))
      {
        xpc_connection_suspend(connection);
        goto LABEL_7;
      }
    }
    __clrex();
  }
LABEL_7:

}

- (void)sendMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[BSBasicServerClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendToConnection:", v4);

}

- (void)sendMessageWithPacker:(id)a3
{
  -[BSBasicServerClient sendMessageWithPacker:replyHandler:onQueue:](self, "sendMessageWithPacker:replyHandler:onQueue:", a3, 0, 0);
}

- (void)sendMessageWithPacker:(id)a3 replyHandler:(id)a4 onQueue:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if ((v9 != 0) != (v10 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBasicServerClient.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(replyHandler && queue) || (!replyHandler && !queue)"));

  }
  -[BSBasicServerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSXPCMessage sendMessageWithPacker:toConnection:replyHandler:replyQueue:](BSXPCMessage, "sendMessageWithPacker:toConnection:replyHandler:replyQueue:", v13, v11, v9, v10);

}

@end
