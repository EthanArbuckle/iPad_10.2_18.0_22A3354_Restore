@implementation MCMCommandGetCodeSignMapping

- (MCMCommandGetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandGetCodeSignMapping *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandGetCodeSignMapping;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

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
  id v6;
  id v7;
  MCMError *v8;
  uint64_t v9;
  uint64_t v10;
  MCMError *v11;
  NSObject *v12;
  MCMResultGetCodeSignMapping *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  MCMError *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = (void *)gCodeSigningMapping;
  -[MCMCommandGetCodeSignMapping identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCodeSigningInfoForIdentifier:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

    if (v6)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v8 = [MCMError alloc];
    v9 = 93;
    v10 = 5;
  }
  else
  {
    v8 = [MCMError alloc];
    v9 = 21;
    v10 = 3;
  }
  v11 = -[MCMError initWithErrorType:category:](v8, "initWithErrorType:category:", v9, v10);
LABEL_10:
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEFAULT, "Get codesign info; error = %@", (uint8_t *)&v17, 0xCu);
  }

  v13 = [MCMResultGetCodeSignMapping alloc];
  if (v6)
    v14 = -[MCMResultGetCodeSignMapping initWithInfo:](v13, "initWithInfo:", v6);
  else
    v14 = -[MCMResultBase initWithError:](v13, "initWithError:", v11);
  v15 = (void *)v14;
  -[MCMCommand resultPromise](self, "resultPromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "completeWithResult:", v15);

  objc_autoreleasePoolPop(v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unint64_t)command
{
  return 19;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
