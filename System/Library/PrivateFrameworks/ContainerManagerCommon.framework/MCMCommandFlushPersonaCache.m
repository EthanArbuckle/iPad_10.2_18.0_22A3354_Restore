@implementation MCMCommandFlushPersonaCache

+ (unint64_t)command
{
  return 34;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
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
  NSObject *v6;
  MCMResultBase *v7;
  void *v8;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommand context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEFAULT, "Flush persona cache; error = nil", v9, 2u);
  }

  v7 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", 0);
  -[MCMCommand resultPromise](self, "resultPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeWithResult:", v7);

  objc_autoreleasePoolPop(v3);
}

@end
