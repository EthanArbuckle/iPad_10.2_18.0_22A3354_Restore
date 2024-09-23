@implementation MCMCommandFetchPersonaUniqueStrings

+ (unint64_t)command
{
  return 32;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  return 1;
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
  void *v10;
  NSObject *v11;
  MCMResultFetchPersonaUniqueStrings *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isNoSpecificPersona"))
  {
    -[MCMCommand context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIdentityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke;
    v14[3] = &unk_1E8CB4A08;
    v15 = v4;
    objc_msgSend(v9, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v14);

  }
  else
  {
    objc_msgSend(v7, "personaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v4, "addObject:", v10);

  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = 0;
    _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "Fetch persona unique strings result: %@; error = %@",
      buf,
      0x16u);
  }

  v12 = -[MCMResultFetchPersonaUniqueStrings initWithPersonaUniqueStrings:]([MCMResultFetchPersonaUniqueStrings alloc], "initWithPersonaUniqueStrings:", v4);
  -[MCMCommand resultPromise](self, "resultPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "completeWithResult:", v12);

  objc_autoreleasePoolPop(v3);
}

void __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "personaUniqueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
