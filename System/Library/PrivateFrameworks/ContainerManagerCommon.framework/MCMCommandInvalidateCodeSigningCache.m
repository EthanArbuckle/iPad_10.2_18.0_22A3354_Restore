@implementation MCMCommandInvalidateCodeSigningCache

+ (unint64_t)command
{
  return 20;
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
  v4 = objc_msgSend(v3, "isAllowedToAccessCodesignMapping");

  return v4;
}

- (void)execute
{
  void *v3;
  uint64_t v4;
  MCMError *v5;
  NSObject *v6;
  MCMResultBase *v7;
  void *v8;
  int v9;
  MCMError *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = objc_msgSend((id)gCodeSigningMapping, "invalidateCodeSigningInfoForAppsWithoutDataContainer");
  if (v4 == 1)
    v5 = 0;
  else
    v5 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", v4);
  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEFAULT, "Invalidate codesign cache; error = %@",
      (uint8_t *)&v9,
      0xCu);
  }

  v7 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v5);
  -[MCMCommand resultPromise](self, "resultPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeWithResult:", v7);

  objc_autoreleasePoolPop(v3);
}

@end
