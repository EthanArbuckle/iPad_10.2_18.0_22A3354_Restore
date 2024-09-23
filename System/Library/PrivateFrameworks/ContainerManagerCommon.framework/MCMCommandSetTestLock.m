@implementation MCMCommandSetTestLock

- (MCMCommandSetTestLock)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v9;
  MCMCommandSetTestLock *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMCommandSetTestLock;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v12, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    v10->_requestedLocks = objc_msgSend(v9, "requestedLocks");
    v10->_enable = objc_msgSend(v9, "enable");
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToTest");

  return v4;
}

- (void)execute
{
  void *v3;
  id v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  void *v13;
  MCMError *v14;
  NSObject *v15;
  NSObject *v16;
  MCMResultBase *v17;
  MCMResultBase *v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  MCMError *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = containermanager_copy_global_configuration();
  v5 = objc_msgSend(v4, "isInternalImage");

  if (!v5)
  {
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v28) = 0;
      _os_log_fault_impl(&dword_1CF807000, v15, OS_LOG_TYPE_FAULT, "Unsupported call to set lock!", (uint8_t *)&v28, 2u);
    }

    v10 = 0;
    goto LABEL_13;
  }
  v6 = containermanager_copy_global_configuration();
  if (objc_msgSend(v6, "runmode") == 2)
    goto LABEL_5;
  v7 = containermanager_copy_global_configuration();
  if (objc_msgSend(v7, "runmode") == 3)
  {

LABEL_5:
    goto LABEL_6;
  }
  v20 = containermanager_copy_global_configuration();
  v21 = objc_msgSend(v20, "runmode");

  if (v21 != 4)
  {
    v10 = 0;
    goto LABEL_7;
  }
LABEL_6:
  -[MCMCommandSetTestLock message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMCommand relayToPrivilegedDaemonMessage:context:](MCMCommand, "relayToPrivilegedDaemonMessage:context:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v11 = -[MCMCommandSetTestLock requestedLocks](self, "requestedLocks");
  v12 = -[MCMCommandSetTestLock enable](self, "enable");
  if (v11 == 15 && !v12)
  {
    +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    v14 = 0;
    execute_gLocksEnabled = 0;
    goto LABEL_14;
  }
  if (v11 < 0xF)
  {
    v22 = (1 << v11);
    v23 = execute_gLocksEnabled & v22;
    if (v12)
    {
      if (!v23)
      {
        execute_gLocksEnabled |= v22;
        +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setEnabled:", 1);

        +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "acquireLock:", v11);

      }
    }
    else if (v23)
    {
      if (v11 < 2)
        v22 |= 3uLL;
      execute_gLocksEnabled &= ~v22;
      +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "releaseLock:", v11);

      if (!execute_gLocksEnabled)
      {
        +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setEnabled:", 0);

      }
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v14 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 38, 3);
LABEL_14:
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v14;
    _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Set test locks; error = %@", (uint8_t *)&v28, 0xCu);
  }

  v17 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v14);
  if (!v14 && v10)
  {
    v18 = v10;

    v17 = v18;
  }
  -[MCMCommand resultPromise](self, "resultPromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "completeWithResult:", v17);

  objc_autoreleasePoolPop(v3);
}

- (unint64_t)requestedLocks
{
  return self->_requestedLocks;
}

- (BOOL)enable
{
  return self->_enable;
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (unint64_t)command
{
  return 31;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
