@implementation BSXPCMessage

void __57__BSXPCMessage_sendToConnection_replyQueue_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x18D769AE0]();
  -[BSXPCMessage _errorForXPCMessageReply:](*(_QWORD *)(a1 + 32), v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
  }
  else
  {
    +[BSXPCMessage messageWithPayload:](BSXPCMessage, "messageWithPayload:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  objc_autoreleasePoolPop(v3);

}

void __33__BSXPCMessage_sendToConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7)
  {
    if (v5)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v9, "payload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    if (!v6)

  }
}

- (id)_errorForXPCMessageReply:(uint64_t)a1
{
  id v3;
  void *v4;
  unsigned int *v5;
  const char *string;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      goto LABEL_11;
    v5 = (unsigned int *)(a1 + 28);
    do
    {
      if (__ldxr(v5))
      {
        __clrex();
        goto LABEL_11;
      }
    }
    while (__stxr(1u, v5));
    if (object_getClass(v3) == (Class)MEMORY[0x1E0C812F8])
      goto LABEL_13;
    if (object_getClass(v4) == (Class)MEMORY[0x1E0C81310])
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      if (string)
      {
        v14 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      v12 = 4101;
      if (v4 == (void *)MEMORY[0x1E0C81260])
        v12 = 4099;
      if (v4 == (void *)MEMORY[0x1E0C81258])
        v13 = 4097;
      else
        v13 = v12;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v13, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4101, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_13:
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_replyHandler, 0);
}

- (BOOL)sendToConnection:(id)a3
{
  OS_dispatch_queue *replyQueue;
  _QWORD v5[5];

  replyQueue = self->_replyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BSXPCMessage_sendToConnection___block_invoke;
  v5[3] = &unk_1E1EBF328;
  v5[4] = self;
  return -[BSXPCMessage sendToConnection:replyQueue:replyHandler:](self, "sendToConnection:replyQueue:replyHandler:", a3, replyQueue, v5);
}

- (BOOL)sendToConnection:(id)a3 replyQueue:(id)a4 replyHandler:(id)a5
{
  _xpc_connection_s *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int *p_invalidated;
  id v14;
  OS_xpc_object *message;
  BOOL v16;
  OS_xpc_object *v17;
  _QWORD v19[5];
  id v20;

  v8 = (_xpc_connection_s *)a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    p_invalidated = &self->_invalidated;
    do
    {
      if (__ldxr((unsigned int *)p_invalidated))
      {
        v16 = 0;
        __clrex();
        goto LABEL_13;
      }
    }
    while (__stxr(1u, (unsigned int *)p_invalidated));
    if (v10)
    {
      if (!v9)
      {
        v9 = MEMORY[0x1E0C80D38];
        v14 = MEMORY[0x1E0C80D38];
      }
      message = self->_message;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__BSXPCMessage_sendToConnection_replyQueue_replyHandler___block_invoke;
      v19[3] = &unk_1E1EBF350;
      v19[4] = self;
      v20 = v11;
      xpc_connection_send_message_with_reply(v8, message, v9, v19);

    }
    else
    {
      xpc_connection_send_message(v8, self->_message);
    }
    v17 = self->_message;
    self->_message = 0;

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

+ (id)messageWithPacker:(id)a3
{
  void (**v3)(id, xpc_object_t);
  BSXPCMessage *v4;
  OS_xpc_object *v5;
  OS_xpc_object *message;

  v3 = (void (**)(id, xpc_object_t))a3;
  v4 = objc_alloc_init(BSXPCMessage);
  v5 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
  if (v3)
    v3[2](v3, v5);
  message = v4->_message;
  v4->_message = v5;

  return v4;
}

+ (id)messageWithPayload:(id)a3
{
  OS_xpc_object *v3;
  BSXPCMessage *v4;
  OS_xpc_object *message;

  v3 = (OS_xpc_object *)a3;
  v4 = objc_alloc_init(BSXPCMessage);
  message = v4->_message;
  v4->_message = v3;

  return v4;
}

+ (const)messageTypeKey
{
  return "message";
}

+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5
{
  objc_msgSend(a1, "sendMessage:toConnection:withMessagePacker:replyHandler:replyQueue:", a3, a4, a5, 0, 0);
}

+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4
{
  objc_msgSend(a1, "sendMessageWithPacker:toConnection:replyHandler:replyQueue:", a3, a4, 0, 0);
}

+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[BSXPCMessage initWithMessagePacker:replyHandler:replyQueue:]((id *)[BSXPCMessage alloc], v13, v10, v11);
  objc_msgSend(v12, "sendToConnection:", v9);

}

- (id)initWithMessagePacker:(void *)a3 replyHandler:(void *)a4 replyQueue:
{
  void (**v7)(id, xpc_object_t);
  id v8;
  id v9;
  xpc_object_t v10;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithMessagePacker_replyHandler_replyQueue_, a1, CFSTR("BSXPCMessage.m"), 100, CFSTR("No message packer"));

    }
    v10 = xpc_dictionary_create(0, 0, 0);
    v7[2](v7, v10);
    a1 = -[BSXPCMessage initWithMessage:replyHandler:replyQueue:](a1, v10, v8, v9);

  }
  return a1;
}

+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5 replyHandler:(id)a6 replyQueue:(id)a7
{
  id v11;
  id v12;
  id v13;
  BSXPCMessage *v14;
  id v15;

  v15 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = -[BSXPCMessage initWithMessage:packer:replyHandler:replyQueue:]([BSXPCMessage alloc], "initWithMessage:packer:replyHandler:replyQueue:", a3, v11, v12, v13);
  -[BSXPCMessage sendToConnection:](v14, "sendToConnection:", v15);

}

+ (id)message:(int64_t)a3 withPacker:(id)a4
{
  +[BSXPCMessage message:withPacker:replyHandler:replyQueue:](BSXPCMessage, "message:withPacker:replyHandler:replyQueue:", a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)message:(int64_t)a3 withPacker:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  BSXPCMessage *v12;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[BSXPCMessage initWithMessage:packer:replyHandler:replyQueue:]([BSXPCMessage alloc], "initWithMessage:packer:replyHandler:replyQueue:", a3, v9, v10, v11);

  return v12;
}

+ (id)messageWithPacker:(id)a3 replyHandler:(id)a4 replyQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  id *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[BSXPCMessage initWithMessagePacker:replyHandler:replyQueue:]((id *)[BSXPCMessage alloc], v7, v8, v9);

  return v10;
}

- (id)initWithMessage:(void *)a3 replyHandler:(void *)a4 replyQueue:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v14;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)BSXPCMessage;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithMessage_replyHandler_replyQueue_, a1, CFSTR("BSXPCMessage.m"), 82, CFSTR("No message packer"));

      }
      objc_storeStrong(a1 + 4, a2);
      if (v9)
      {
        v11 = objc_msgSend(v9, "copy");
        v12 = a1[1];
        a1[1] = (id)v11;

      }
      if (v10)
        objc_storeStrong(a1 + 2, a4);
    }
  }

  return a1;
}

- (BSXPCMessage)initWithMessage:(int64_t)a3 packer:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  void (**v11)(id, xpc_object_t);
  id v12;
  id v13;
  xpc_object_t v14;
  const char *v15;
  BSXPCMessage *v16;
  void *v18;

  v11 = (void (**)(id, xpc_object_t))a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSXPCMessage.m"), 112, CFSTR("No message packer"));

  }
  v14 = xpc_dictionary_create(0, 0, 0);
  v15 = (const char *)objc_msgSend((id)objc_opt_class(), "messageTypeKey");
  xpc_dictionary_set_int64(v14, v15, a3);
  v11[2](v11, v14);
  v16 = (BSXPCMessage *)-[BSXPCMessage initWithMessage:replyHandler:replyQueue:]((id *)&self->super.isa, v14, v12, v13);

  return v16;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_message, CFSTR("payload"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendSynchronouslyToConnection:(id)a3 error:(id *)a4
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  int *p_invalidated;
  xpc_object_t v10;
  void *v11;
  int *p_replied;
  void *v14;

  v6 = (_xpc_connection_s *)a3;
  v7 = v6;
  if (v6)
  {
    p_invalidated = &self->_invalidated;
    do
    {
      if (__ldxr((unsigned int *)p_invalidated))
      {
        v14 = 0;
        __clrex();
        goto LABEL_18;
      }
    }
    while (__stxr(1u, (unsigned int *)p_invalidated));
    v10 = xpc_connection_send_message_with_reply_sync(v6, self->_message);
    v11 = v10;
    if (v10)
    {
      p_replied = &self->_replied;
      do
      {
        if (__ldxr((unsigned int *)p_replied))
        {
          v14 = 0;
          __clrex();
          goto LABEL_17;
        }
      }
      while (__stxr(1u, (unsigned int *)p_replied));
      if (object_getClass(v10) == (Class)MEMORY[0x1E0C812F8])
      {
        +[BSXPCMessage messageWithPayload:](BSXPCMessage, "messageWithPayload:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a4)
          goto LABEL_14;
        -[BSXPCMessage _errorForXPCMessageReply:]((uint64_t)self, v11);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_14:
      v14 = 0;
    }
LABEL_17:

  }
  else
  {
    v14 = 0;
  }
LABEL_18:

  return v14;
}

- (void)forcefullyInvokeReplyHandler:(id)a3
{
  id v4;
  void (**replyHandler)(void);
  int *p_replied;
  id v8;
  id v9;

  v4 = a3;
  replyHandler = (void (**)(void))self->_replyHandler;
  if (replyHandler)
  {
    p_replied = &self->_replied;
    while (!__ldxr((unsigned int *)p_replied))
    {
      if (!__stxr(1u, (unsigned int *)p_replied))
      {
        v9 = v4;
        replyHandler[2]();
        v8 = self->_replyHandler;
        self->_replyHandler = 0;

        v4 = v9;
        goto LABEL_7;
      }
    }
    __clrex();
  }
LABEL_7:

}

- (OS_xpc_object)payload
{
  return self->_message;
}

@end
