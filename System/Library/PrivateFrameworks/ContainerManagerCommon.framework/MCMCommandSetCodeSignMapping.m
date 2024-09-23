@implementation MCMCommandSetCodeSignMapping

- (MCMCommandSetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandSetCodeSignMapping *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  id options;
  uint64_t v14;
  id info;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandSetCodeSignMapping;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(v8, "options");
    v12 = objc_claimAutoreleasedReturnValue();
    options = v9->_options;
    v9->_options = (id)v12;

    objc_msgSend(v8, "info");
    v14 = objc_claimAutoreleasedReturnValue();
    info = v9->_info;
    v9->_info = (id)v14;

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
  v4 = objc_msgSend(v3, "isAllowedToAccessCodesignMapping");

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
  id v9;
  MCMResultPromise *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  MCMResultBase *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = (void *)gCodeSigningMapping;
  -[MCMCommandSetCodeSignMapping info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandSetCodeSignMapping identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandSetCodeSignMapping options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v4, "processCodeSigningInfo:identifier:options:error:", v5, v6, v7, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc_init(MCMResultPromise);
    objc_msgSend(v8, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v11, 0, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "execute");
    -[MCMResultPromise result](v10, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) during setCodeSigningMapping; error = %@",
          buf,
          0xCu);
      }

    }
  }
  container_log_handle_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "Set code sign mapping; error = %@", buf, 0xCu);
  }

  v18 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v9);
  -[MCMCommand resultPromise](self, "resultPromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "completeWithResult:", v18);

  objc_autoreleasePoolPop(v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)info
{
  return self->_info;
}

- (id)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_options, 0);
  objc_storeStrong(&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unint64_t)command
{
  return 18;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
