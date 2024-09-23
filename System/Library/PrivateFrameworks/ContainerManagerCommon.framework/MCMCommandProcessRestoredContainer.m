@implementation MCMCommandProcessRestoredContainer

- (MCMCommandProcessRestoredContainer)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  id v9;
  MCMCommandProcessRestoredContainer *v10;
  MCMCommandProcessRestoredContainer *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandProcessRestoredContainer;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);

  return v11;
}

- (MCMCommandProcessRestoredContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandProcessRestoredContainer *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandProcessRestoredContainer;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "concreteContainerIdentity");
    v10 = objc_claimAutoreleasedReturnValue();
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

  }
  return v9;
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
  v4 = objc_msgSend(v3, "isAllowedToRestoreContainer");

  return v4;
}

- (void)execute
{
  void *v3;
  MCMCommandRecreateContainerStructure *v4;
  void *v5;
  void *v6;
  void *v7;
  MCMCommandRecreateContainerStructure *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = [MCMCommandRecreateContainerStructure alloc];
  -[MCMCommandProcessRestoredContainer concreteContainerIdentity](self, "concreteContainerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand resultPromise](self, "resultPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMCommandRecreateContainerStructure initWithConcreteContainerIdentity:context:resultPromise:](v4, "initWithConcreteContainerIdentity:context:resultPromise:", v5, v6, v7);

  -[MCMCommandRecreateContainerStructure execute](v8, "execute");
  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Process restored container result; error = %@",
      (uint8_t *)&v13,
      0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

+ (unint64_t)command
{
  return 22;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
