@implementation MCMCommandDispatcher

- (void)dispatchMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  MCMError *v13;
  MCMError *v14;
  MCMResultBase *v15;
  MCMError *v16;
  uint64_t v17;
  void *v18;
  MCMResultBase *v19;
  MCMResultBase *v20;
  MCMError *v21;
  MCMError *v22;
  id v23[2];

  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "resultPromise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v12 = -[MCMCommandDispatcher _commandClassFromXPCMessage:context:error:](self, "_commandClassFromXPCMessage:context:error:", v8, v9, v23);
  v13 = (MCMError *)v23[0];
  v14 = v13;
  if (v12)
  {
    v22 = v13;
    -[MCMCommandDispatcher _messageFromCommandClass:xpcMessage:context:error:](self, "_messageFromCommandClass:xpcMessage:context:error:", v12, v8, v9, &v22);
    v15 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
    v16 = v22;

    if (v15)
    {
      -[MCMCommandDispatcher _ifNeededRelayMessage:context:](self, "_ifNeededRelayMessage:context:", v15, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v21 = v16;
        -[MCMCommandDispatcher _commandFromCommandClass:message:context:reply:error:](self, "_commandFromCommandClass:message:context:reply:error:", v12, v15, v9, v10, &v21);
        v19 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (v19)
        {
          if ((-[MCMResultBase preflightClientAllowed](v19, "preflightClientAllowed") & 1) == 0)
          {
            v16 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);

            v20 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v16);
            objc_msgSend(v11, "completeWithResult:", v20);

            goto LABEL_7;
          }
          -[MCMResultBase execute](v19, "execute");
        }
        else
        {
          v19 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v14);
          objc_msgSend(v11, "completeWithResult:", v19);
        }

        goto LABEL_8;
      }
      v18 = (void *)v17;
      objc_msgSend(v11, "completeWithResult:", v17);

    }
    else
    {
      v15 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v16);
      objc_msgSend(v11, "completeWithResult:", v15);
    }
LABEL_7:
    v14 = v16;
    goto LABEL_8;
  }
  v15 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v13);
  objc_msgSend(v11, "completeWithResult:", v15);
LABEL_8:

}

- (id)_messageFromCommandClass:(Class)a3 xpcMessage:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MCMError *v14;
  MCMError *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v19[0] = 1;
  v11 = (void *)-[objc_class incomingMessageClass](a3, "incomingMessageClass");
  if (v11)
  {
    objc_msgSend(v11, "xpcMessageFromXPCObject:context:error:", v9, v10, v19);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = 0;
      goto LABEL_9;
    }
    v15 = [MCMError alloc];
    v16 = v19[0];
    v17 = 3;
  }
  else
  {
    v15 = [MCMError alloc];
    v16 = 40;
    v17 = 4;
  }
  v14 = -[MCMError initWithErrorType:category:](v15, "initWithErrorType:category:", v16, v17);
  if (a6)
  {
    v14 = objc_retainAutorelease(v14);
    v13 = 0;
    *a6 = v14;
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (id)_ifNeededRelayMessage:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  int v7;
  id v8;
  int v9;
  MCMError *v10;
  uint64_t v11;
  NSObject *v12;
  MCMResultBase *v13;
  MCMError *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "disposition");
  if (v7 == 2)
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = objc_msgSend(v5, "command");
      _os_log_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEFAULT, "Relaying [%llu] to daemon.", (uint8_t *)&v16, 0xCu);
    }

    +[MCMCommand relayToPrivilegedDaemonMessage:context:](MCMCommand, "relayToPrivilegedDaemonMessage:context:", v5, v6);
    v13 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 == 1)
    {
      v8 = containermanager_copy_global_configuration();
      v9 = objc_msgSend(v8, "runmode");

      if (v9 != 3)
      {
        v13 = 0;
        goto LABEL_11;
      }
      v10 = [MCMError alloc];
      v11 = 100;
    }
    else
    {
      v10 = [MCMError alloc];
      v11 = 72;
    }
    v14 = -[MCMError initWithErrorType:category:](v10, "initWithErrorType:category:", v11, 3);
    v13 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v14);

  }
LABEL_11:

  return v13;
}

- (id)_commandFromCommandClass:(Class)a3 message:(id)a4 context:(id)a5 reply:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend([a3 alloc], "initWithMessage:context:reply:", v13, v12, v11);

  if (a7 && !v14)
    *a7 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 38, 3);
  return v14;
}

- (Class)_commandClassFromXPCMessage:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t uint64;
  void *v8;
  void *v9;
  void *v10;

  uint64 = xpc_dictionary_get_uint64(a3, "Command");
  -[MCMCommandDispatcher messageToCommandClassMap](self, "messageToCommandClassMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v9);

  if (a5 && !v10)
    *a5 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 72, 3);
  return (Class)v10;
}

- (NSMutableDictionary)messageToCommandClassMap
{
  return self->_messageToCommandClassMap;
}

- (MCMCommandDispatcher)init
{
  MCMCommandDispatcher *v2;
  uint64_t v3;
  NSMutableDictionary *messageToCommandClassMap;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMCommandDispatcher;
  v2 = -[MCMCommandDispatcher init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    messageToCommandClassMap = v2->_messageToCommandClassMap;
    v2->_messageToCommandClassMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerCommandClass:(Class)a3
{
  void *v4;
  id v5;

  -[MCMCommandDispatcher messageToCommandClassMap](self, "messageToCommandClassMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[objc_class command](a3, "command"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a3, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageToCommandClassMap, 0);
}

@end
