@implementation BSXPCReply

- (id)_initWithReply:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSXPCReply;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

+ (id)replyForMessage:(id)a3
{
  id v5;
  xpc_object_t reply;
  id *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSXPCMessage.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalMessage"));

  }
  reply = xpc_dictionary_create_reply(v5);
  if (reply)
    v7 = -[BSXPCReply _initWithReply:]((id *)objc_alloc((Class)a1), reply);
  else
    v7 = 0;

  return v7;
}

- (id)initForMessage:(id)a3
{
  id v5;
  xpc_object_t reply;
  id *v7;
  id *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCMessage.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalMessage"));

  }
  reply = xpc_dictionary_create_reply(v5);
  v7 = -[BSXPCReply _initWithReply:]((id *)&self->super.isa, reply);
  v8 = v7;
  if (!reply)
  {

    v8 = 0;
  }

  return v8;
}

- (void)sendReply:(id)a3
{
  OS_xpc_object *reply;
  int *p_sent;
  _xpc_connection_s *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  reply = self->_reply;
  if (reply)
  {
    p_sent = &self->_sent;
    do
    {
      if (__ldxr((unsigned int *)p_sent))
      {
        __clrex();
        goto LABEL_9;
      }
    }
    while (__stxr(1u, (unsigned int *)p_sent));
    if (v8)
    {
      v8[2]();
      reply = self->_reply;
    }
    xpc_dictionary_get_remote_connection(reply);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v7, self->_reply);

  }
LABEL_9:

}

+ (id)messageWithReply:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReply:", v4);

  return v5;
}

- (BSXPCReply)initWithReply:(id)a3
{
  xpc_object_t reply;
  BSXPCReply *v5;

  reply = xpc_dictionary_create_reply(a3);
  v5 = (BSXPCReply *)-[BSXPCReply _initWithReply:]((id *)&self->super.isa, reply);

  return v5;
}

- (int64_t)messageKind
{
  return -1;
}

- (id)message
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
}

@end
