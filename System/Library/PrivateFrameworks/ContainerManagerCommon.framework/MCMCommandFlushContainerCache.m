@implementation MCMCommandFlushContainerCache

- (MCMCommandFlushContainerCache)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v9;
  MCMCommandFlushContainerCache *v10;
  uint64_t v11;
  MCMContainerConfiguration *containerConfig;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMCommandFlushContainerCache;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v14, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    objc_msgSend(v9, "containerConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v11;

    v10->_transient = objc_msgSend(v9, "transient");
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
  v4 = objc_msgSend(v3, "isAllowedToControlCaches");

  return v4;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  MCMResultBase *v11;
  void *v12;
  uint8_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommand context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandFlushContainerCache containerConfig](self, "containerConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushCacheForUserIdentity:containerClass:transient:", v8, objc_msgSend(v9, "containerClass"), -[MCMCommandFlushContainerCache transient](self, "transient"));

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Cache flushed", v13, 2u);
  }

  v11 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", 0);
  -[MCMCommand resultPromise](self, "resultPromise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "completeWithResult:", v11);

  objc_autoreleasePoolPop(v3);
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (BOOL)transient
{
  return self->_transient;
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_containerConfig, 0);
}

+ (unint64_t)command
{
  return 33;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
