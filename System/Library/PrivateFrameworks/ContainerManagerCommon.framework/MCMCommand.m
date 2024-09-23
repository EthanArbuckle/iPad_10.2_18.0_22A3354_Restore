@implementation MCMCommand

- (MCMCommandContext)context
{
  return self->_context;
}

- (MCMResultPromise)resultPromise
{
  return self->_resultPromise;
}

- (MCMCommand)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MCMCommand *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "resultPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMCommand initWithContext:resultPromise:](self, "initWithContext:resultPromise:", v9, v10);

  if (v11)
    objc_storeStrong((id *)&v11->_reply, a5);

  return v11;
}

- (MCMCommand)initWithContext:(id)a3 resultPromise:(id)a4
{
  id v7;
  id v8;
  MCMCommand *v9;
  MCMCommand *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMCommand;
  v9 = -[MCMCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_resultPromise, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)preflightClientAllowed
{
  return 0;
}

- (void)execute
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ was called on the base class %@"), v4, v6);

  __break(1u);
}

- (MCMReply)reply
{
  return self->_reply;
}

+ (unint64_t)command
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  unint64_t result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ was called on the base class %@"), v4, v6);

  __break(1u);
  return result;
}

+ (Class)incomingMessageClass
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  Class result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ was called on the base class %@"), v4, v6);

  __break(1u);
  return result;
}

+ (id)relayToPrivilegedDaemonMessage:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MCMError *v11;
  MCMResultRelay *v12;
  NSObject *v13;
  MCMError *v14;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  container_xpc_set_use_shared_connection();
  objc_msgSend(v6, "clientIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "createLibsystemClient");
  v8 = (void *)container_client_copy_encoded_xpc_object();
  if (v8)
  {
    objc_msgSend(v5, "xpcObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v9, "ProxyForClient", v8);

    buf[0] = 0;
    objc_msgSend(v5, "xpcObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (MCMError *)container_xpc_send_sync_message();

    if (v11)
    {
      v12 = -[MCMResultRelay initWithXPCReplyFromRelay:]([MCMResultRelay alloc], "initWithXPCReplyFromRelay:", v11);
    }
    else
    {
      v14 = -[MCMError initWithLibsystemError:]([MCMError alloc], "initWithLibsystemError:", buf[0]);
      v12 = -[MCMResultBase initWithError:]([MCMResultRelay alloc], "initWithError:", v14);

    }
    container_error_free();
  }
  else
  {
    v11 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 1, 2);
    v12 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v11);
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 134217984;
      *(_QWORD *)((char *)buf + 4) = 1;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Could not serialize client for proxy; error = %llu",
        (uint8_t *)buf,
        0xCu);
    }

  }
  container_free_client();

  return v12;
}

@end
