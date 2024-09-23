@implementation MCMCommandCompleteBackgroundTasks

+ (unint64_t)command
{
  return 46;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "codeSignInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "allowed") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "testabilityAllowed");

  return v6;
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  MCMResultBase *v8;

  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = MCMSharedBackgroundQueue();
  dispatch_barrier_async_and_wait(v4, &__block_literal_global_12937);

  v5 = MCMSharedSlowWorkloop();
  dispatch_barrier_async_and_wait(v5, &__block_literal_global_1);

  v6 = MCMDataProtectionQueue();
  dispatch_barrier_async_and_wait(v6, &__block_literal_global_2_12938);

  -[MCMCommand resultPromise](self, "resultPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", 0);
  objc_msgSend(v7, "completeWithResult:", v8);

  objc_autoreleasePoolPop(v3);
}

@end
