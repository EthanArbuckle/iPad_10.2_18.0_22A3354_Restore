@implementation VSSubscriptionRegistrationCenter

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(a1[4], "subscriptionsByOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will return cached subscriptions: %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will fetch fresh subscriptions.", buf, 2u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v8 = a1[4];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_54;
    v22[3] = &unk_1E93A0958;
    v23 = a1[6];
    v9 = v3;
    v24 = v9;
    v10 = a1[5];
    v11 = a1[4];
    v25 = v10;
    v26 = v11;
    v27 = a1[7];
    objc_msgSend(v8, "_serviceWithErrorHandler:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2;
    v16[3] = &unk_1E93A09A8;
    v13 = a1[5];
    v17 = a1[6];
    v18 = v9;
    v14 = a1[5];
    v15 = a1[4];
    v19 = v14;
    v20 = v15;
    v21 = a1[7];
    objc_msgSend(v12, "fetchActiveSubscriptionsWithOptions:completionHandler:", v13, v16);

  }
  objc_autoreleasePoolPop(v2);
}

- (NSMutableDictionary)subscriptionsByOptions
{
  return self->_subscriptionsByOptions;
}

- (VSSubscriptionRegistrationCenter)init
{
  VSSubscriptionRegistrationCenter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *subscriptionsByOptions;
  VSRemoteNotifier *v5;
  VSRemoteNotifier *remoteNotifier;
  NSOperationQueue *v7;
  NSOperationQueue *privateQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSSubscriptionRegistrationCenter;
  v2 = -[VSSubscriptionRegistrationCenter init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subscriptionsByOptions = v2->_subscriptionsByOptions;
    v2->_subscriptionsByOptions = v3;

    v5 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSActiveSubscriptionsDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v5;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("com.apple.VideoSubscriberAccount.SubscriptionRegistrationCenter"));
  }
  return v2;
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D8236758]();
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VSSubscriptionRegistrationCenter fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options parameter must not be nil."));
    if (v7)
      goto LABEL_5;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
    goto LABEL_5;
  }
  if (!v7)
    goto LABEL_13;
LABEL_5:
  -[VSSubscriptionRegistrationCenter currentTask](self, "currentTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.developer.video-subscription-registration")) & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.smoot.subscriptionservice")) & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.internal")) & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.all-sources.read-only")) & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", CFSTR("com.apple.private.subscriptionservice.web-sources.read-write")) & 1) != 0)
  {
    -[VSSubscriptionRegistrationCenter fetchOptionsValidator](self, "fetchOptionsValidator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "standardizedFetchOptionsFromOptions:withSecurityTask:", v6, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSSubscriptionRegistrationCenter privateQueue](self, "privateQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke;
    v16[3] = &unk_1E93A09D0;
    v16[4] = self;
    v6 = v12;
    v17 = v6;
    v18 = v13;
    v19 = v7;
    v14 = v13;
    objc_msgSend(v14, "addOperationWithBlock:", v16);

  }
  else
  {
    if (-[VSSubscriptionRegistrationCenter _shouldRaiseExceptionsForMisuse](self, "_shouldRaiseExceptionsForMisuse"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Calling this method requires an entitlement."));
    VSPrivateError(-5, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    VSErrorLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[VSSubscriptionRegistrationCenter fetchActiveSubscriptionsWithOptions:completionHandler:].cold.1(v15);

    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v14);
  }

  objc_autoreleasePoolPop(v8);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (VSSubscriptionFetchOptionsValidator)fetchOptionsValidator
{
  VSSubscriptionRegistrationCenter *v2;
  VSSubscriptionFetchOptionsValidator *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fetchOptionsValidator;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionFetchOptionsValidator);
    -[VSSubscriptionRegistrationCenter predicateFactory](v2, "predicateFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionFetchOptionsValidator setPredicateFactory:](v3, "setPredicateFactory:", v4);

    objc_storeStrong((id *)&v2->_fetchOptionsValidator, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The fetchOptionsValidatorOrNil parameter must not be nil."));
  return v3;
}

- (VSSecurityTask)currentTask
{
  VSSubscriptionRegistrationCenter *v2;
  VSSecurityTask *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentTask;
  if (!v3)
  {
    +[VSSecurityTask currentSecurityTask](VSSecurityTask, "currentSecurityTask");
    v3 = (VSSecurityTask *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_currentTask, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[VSSubscriptionRegistrationCenter dealloc]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSDelayOperation cancel](self->_expirationOperation, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)VSSubscriptionRegistrationCenter;
  -[VSSubscriptionRegistrationCenter dealloc](&v4, sel_dealloc);
}

+ (VSSubscriptionRegistrationCenter)defaultSubscriptionRegistrationCenter
{
  if (defaultSubscriptionRegistrationCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&defaultSubscriptionRegistrationCenter___vs_lazy_init_predicate, &__block_literal_global_36);
  return (VSSubscriptionRegistrationCenter *)(id)defaultSubscriptionRegistrationCenter___vs_lazy_init_variable;
}

void __73__VSSubscriptionRegistrationCenter_defaultSubscriptionRegistrationCenter__block_invoke()
{
  VSSubscriptionRegistrationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSSubscriptionRegistrationCenter);
  v1 = (void *)defaultSubscriptionRegistrationCenter___vs_lazy_init_variable;
  defaultSubscriptionRegistrationCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (void)setCurrentSubscription:(VSSubscription *)currentSubscription
{
  VSSubscription *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  char v10;
  __CFString *v11;
  VSSubscription *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  VSSubscriptionRegistrationCenter *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = currentSubscription;
  v6 = (void *)MEMORY[0x1D8236758]();
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[VSSubscriptionRegistrationCenter setCurrentSubscription:]";
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSSubscriptionRegistrationCenter currentTask](self, "currentTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("com.apple.developer.video-subscription-registration");
  v10 = objc_msgSend(v8, "shouldAllowAccessForBooleanEntitlement:", v9);
  v11 = CFSTR("com.apple.smoot.subscriptionservice");
  if ((v10 & 1) != 0 || objc_msgSend(v8, "shouldAllowAccessForBooleanEntitlement:", v11))
  {
    if (v5)
    {
      v12 = v5;
      if (-[VSSubscription accessLevel](v12, "accessLevel") == VSSubscriptionAccessLevelUnknown)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The subscription's access level must not be Unknown."));
      -[VSSubscriptionRegistrationCenter registerSubscription:](self, "registerSubscription:", v12);
    }
    else
    {
      -[VSSubscriptionRegistrationCenter predicateFactory](self, "predicateFactory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSubscriptionRegistrationCenter currentTask](self, "currentTask");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allowedSubscriptionsPredicateForTask:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke;
      v22[3] = &unk_1E93A0820;
      v23 = v15;
      v24 = self;
      v12 = v15;
      -[VSSubscriptionRegistrationCenter fetchActiveSubscriptionsWithOptions:completionHandler:](self, "fetchActiveSubscriptionsWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v22);

    }
  }
  else if (-[VSSubscriptionRegistrationCenter _shouldRaiseExceptionsForMisuse](self, "_shouldRaiseExceptionsForMisuse"))
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v12 = (VSSubscription *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("The -[%@ %@] method requires an entitlement."), v12, v19);

  }
  else
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v12 = (VSSubscription *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog((NSString *)CFSTR("The -[%@ %@] method requires an entitlement."), v12, v21);

  }
  objc_autoreleasePoolPop(v6);

}

void __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (-[NSObject count](v5, "count"))
    {
      -[NSObject filteredArrayUsingPredicate:](v5, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
      v7 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v7, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "removeSubscriptions:", v7);
      }
      else
      {
        VSDefaultLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "No app subscriptions to remove.", buf, 2u);
        }

      }
    }
    else
    {
      VSDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "No active subscriptions to remove.", v10, 2u);
      }

      v7 = v5;
    }
  }
  else
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke_cold_1();
  }

}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSSubscriptionRegistrationCenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldAllowAccessToSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VSSubscriptionRegistrationCenter predicateFactory](self, "predicateFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionRegistrationCenter currentTask](self, "currentTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedSubscriptionsPredicateForRequestKind:fromTask:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "evaluateWithObject:", v4);
  return (char)v6;
}

- (BOOL)_shouldRaiseExceptionsForMisuse
{
  void *v2;
  char v3;

  -[VSSubscriptionRegistrationCenter linkedOnOrAfterChecker](self, "linkedOnOrAfterChecker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPerformBehavior:", 0);

  return v3;
}

- (void)_sendLocalNotificationWithUserInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__VSSubscriptionRegistrationCenter__sendLocalNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E939F138;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  VSPerformCompletionHandler(v6);

}

void __71__VSSubscriptionRegistrationCenter__sendLocalNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VSActiveSubscriptionsDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_refreshCachedSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VSSubscriptionRegistrationCenter *v9;

  v3 = (void *)MEMORY[0x1D8236758](self, a2);
  -[VSSubscriptionRegistrationCenter subscriptionsByOptions](self, "subscriptionsByOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke;
  v7[3] = &unk_1E93A0870;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_autoreleasePoolPop(v3);
}

void __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);
  v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke_2;
  v12[3] = &unk_1E93A0848;
  v9 = v6;
  v13 = v9;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 40);
  v14 = v10;
  v15 = v11;
  objc_msgSend(v8, "fetchActiveSubscriptionsWithOptions:completionHandler:", v10, v12);

  objc_autoreleasePoolPop(v7);
}

void __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8236758]();
  if ((objc_msgSend(a1[4], "isEqual:", v5) & 1) == 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("VSFetchOptionsKey"));

    if (v5)
    {
      objc_msgSend(a1[4], "valueForKeyPath:", CFSTR("source"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForKeyPath:", CFSTR("source"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v10 && v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT %K IN %@"), CFSTR("source"), v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "filteredArrayUsingPredicate:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("VSRemovedSubscriptionsKey"));
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT %K IN %@"), CFSTR("source"), v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "filteredArrayUsingPredicate:", v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("VSAddedSubscriptionsKey"));
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("source"), v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT self IN %@"), a1[4]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3528];
        v23[0] = v18;
        v23[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "filteredArrayUsingPredicate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("VSUpdatedSubscriptionsKey"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to obtain latest and cached subscription sources."));
      }

    }
    objc_msgSend(a1[6], "_sendLocalNotificationWithUserInfo:", v8);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)_resetExpirationOperation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *context;
  VSSubscriptionRegistrationCenter *v26;
  id obj;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  VSOptional *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8236758](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v26 = self;
  -[VSSubscriptionRegistrationCenter subscriptionsByOptions](self, "subscriptionsByOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v50;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v8);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v54, 16, context);
        if (v11)
        {
          v12 = *(_QWORD *)v46;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v46 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v6);
  }

  -[VSSubscriptionRegistrationCenter expirationOperation](v26, "expirationOperation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancel");

  if (objc_msgSend(v3, "count"))
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__11;
    v43 = __Block_byref_object_dispose__11;
    v44 = objc_alloc_init(VSOptional);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v3;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v17 = *(_QWORD *)v36;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1D8236758]();
          objc_msgSend(v19, "expirationDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)v40[5];
          v32[0] = v16;
          v32[1] = 3221225472;
          v32[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke;
          v32[3] = &unk_1E93A0898;
          v34 = &v39;
          v33 = v21;
          v29[0] = v16;
          v29[1] = 3221225472;
          v29[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2;
          v29[3] = &unk_1E93A08C0;
          v31 = &v39;
          v23 = v33;
          v30 = v23;
          objc_msgSend(v22, "conditionallyUnwrapObject:otherwise:", v32, v29);

          objc_autoreleasePoolPop(v20);
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
      }
      while (v15);
    }

    v24 = (void *)v40[5];
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_3;
    v28[3] = &unk_1E93A08E8;
    v28[4] = v26;
    objc_msgSend(v24, "conditionallyUnwrapObject:otherwise:", v28, &__block_literal_global_38);
    _Block_object_dispose(&v39, 8);

  }
  objc_autoreleasePoolPop(context);
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "earlierDate:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "vs_isBefore:", v4);

  if (v5)
  {
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Creating delay operation with fireDate: %@", buf, 0xCu);
    }

    +[VSDelayOperation delayOperationWithFireDate:](VSDelayOperation, "delayOperationWithFireDate:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExpirationOperation:", v7);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_initWeak(&location, v7);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_35;
    v8[3] = &unk_1E939ED60;
    objc_copyWeak(&v9, (id *)buf);
    objc_copyWeak(&v10, &location);
    objc_msgSend(v7, "setCompletionBlock:", v8);
    objc_msgSend(v7, "start");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_35(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(WeakRetained, "privateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2_36;
    v6[3] = &unk_1E939F138;
    v7 = v4;
    v8 = WeakRetained;
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

uint64_t __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2_36(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
  {
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Operation is not canceled, refreshing subscriptions.", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_refreshCachedSubscriptions");
  }
  return result;
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_37()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D2419000, v0, OS_LOG_TYPE_DEFAULT, "No Subscriptions Expired that have not been recently modified", v1, 2u);
  }

}

- (VSSubscriptionServiceConnection)connection
{
  VSSubscriptionRegistrationCenter *v2;
  VSSubscriptionServiceConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker
{
  VSSubscriptionRegistrationCenter *v2;
  VSLinkedOnOrAfterChecker *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_linkedOnOrAfterChecker;
  if (!v3)
  {
    v3 = objc_alloc_init(VSLinkedOnOrAfterChecker);
    objc_storeStrong((id *)&v2->_linkedOnOrAfterChecker, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (VSSubscriptionPredicateFactory)predicateFactory
{
  VSSubscriptionRegistrationCenter *v2;
  VSSubscriptionPredicateFactory *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_predicateFactory;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)setPredicateFactory:(id)a3
{
  VSSubscriptionRegistrationCenter *v5;
  void *v6;
  VSSubscriptionPredicateFactory *v7;

  v7 = (VSSubscriptionPredicateFactory *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_predicateFactory != v7)
  {
    objc_storeStrong((id *)&v5->_predicateFactory, a3);
    -[VSSubscriptionRegistrationCenter fetchOptionsValidator](v5, "fetchOptionsValidator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicateFactory:", v7);

  }
  objc_sync_exit(v5);

}

- (void)setFetchOptionsValidator:(id)a3
{
  VSSubscriptionRegistrationCenter *v5;
  void *v6;
  VSSubscriptionFetchOptionsValidator *v7;

  v7 = (VSSubscriptionFetchOptionsValidator *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchOptionsValidator != v7)
  {
    objc_storeStrong((id *)&v5->_fetchOptionsValidator, a3);
    -[VSSubscriptionFetchOptionsValidator predicateFactory](v7, "predicateFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionRegistrationCenter setPredicateFactory:](v5, "setPredicateFactory:", v6);

  }
  objc_sync_exit(v5);

}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[VSSubscriptionRegistrationCenter privateQueue](self, "privateQueue", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__VSSubscriptionRegistrationCenter_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E939EE88;
  v6[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v6);

}

uint64_t __92__VSSubscriptionRegistrationCenter_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshCachedSubscriptions");
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_54_cold_1();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_55;
  v10[3] = &unk_1E93A0930;
  v5 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v14 = v3;
  v15 = v8;
  v9 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v10);

}

uint64_t __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_55(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_resetExpirationOperation");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Fetched subscriptions: %@", buf, 0xCu);
    }
  }
  else
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1();
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_57;
  v14[3] = &unk_1E93A0980;
  v15 = v5;
  v8 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 64);
  v17 = v9;
  v18 = v10;
  v19 = v6;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v8, "addOperationWithBlock:", v14);

}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_57(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = v2;
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 56), "_resetExpirationOperation");
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 64);
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will call registration center fetch completion handler with subscriptions %@ or error %@.", (uint8_t *)&v12, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Did call registration center fetch completion handler with subscriptions %@ or error %@.", (uint8_t *)&v12, 0x16u);
  }

}

- (void)registerSubscription:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[VSSubscriptionRegistrationCenter registerSubscription:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The subscription parameter must not be nil."));
  v6 = -[VSSubscriptionRegistrationCenter _shouldRaiseExceptionsForMisuse](self, "_shouldRaiseExceptionsForMisuse");
  if (!-[VSSubscriptionRegistrationCenter _shouldAllowAccessToSubscription:](self, "_shouldAllowAccessToSubscription:", v4))
  {
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Registering this subscription (%@) requires an entitlement."), v4);
    else
      NSLog((NSString *)CFSTR("Registering this subscription (%@) requires an entitlement."), v4);
    goto LABEL_36;
  }
  objc_msgSend(v4, "subscriptionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = objc_msgSend(v4, "accessLevel");
  if (v8)
  {
    if (v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only subscriptions with an unknown access level may be registered with an info string."));
    objc_msgSend(v4, "tierIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
      goto LABEL_22;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("Only subscriptions without any tier identifiers may be registered with an info string.");
  }
  else
  {
    if ((unint64_t)(v9 - 1) < 2)
      goto LABEL_22;
    if (v9)
    {
      if (!v6)
        goto LABEL_22;
      v15 = *MEMORY[0x1E0C99778];
    }
    else
    {
      if (!v6)
        goto LABEL_22;
      v15 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Only subscriptions with an info string may be registered with an unknown access level."));
    }
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v14 = CFSTR("Attempt to register a subscription with an unexpected access level.");
    v13 = v15;
  }
  objc_msgSend(v12, "raise:format:", v13, v14);
LABEL_22:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = v4;
  objc_msgSend(v4, "tierIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    v20 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v20, CFSTR("Attempt to register subscription with a non-string object as a tier identifier."));
        if (!objc_msgSend(v22, "length"))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v20, CFSTR("Attempt to register subscription with an empty string as a tier identifier."));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

  VSDefaultLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  v4 = v25;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = (const char *)v25;
    _os_log_impl(&dword_1D2419000, v23, OS_LOG_TYPE_DEFAULT, "Will register subscription: %@", buf, 0xCu);
  }

  -[VSSubscriptionRegistrationCenter _serviceWithErrorHandler:](self, "_serviceWithErrorHandler:", &__block_literal_global_75);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerSubscription:", v25);

LABEL_36:
}

void __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke_cold_1();

}

- (void)removeSubscriptions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSSubscriptionRegistrationCenter removeSubscriptions:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The subscriptions parameter must not be nil."));
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The subscriptions array must not be empty."));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v10 = v10
           && -[VSSubscriptionRegistrationCenter _shouldAllowAccessToSubscription:](self, "_shouldAllowAccessToSubscription:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if (!v10)
    {
      if (-[VSSubscriptionRegistrationCenter _shouldRaiseExceptionsForMisuse](self, "_shouldRaiseExceptionsForMisuse"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Removing thess subscriptions (%@) requires an entitlement."), v6);
      else
        NSLog((NSString *)CFSTR("Removing these subscriptions (%@) requires an entitlement."), v6);
      goto LABEL_24;
    }
  }
  else
  {

  }
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = (const char *)v6;
    _os_log_impl(&dword_1D2419000, v12, OS_LOG_TYPE_DEFAULT, "Will remove subscriptions: %@", buf, 0xCu);
  }

  -[VSSubscriptionRegistrationCenter _serviceWithErrorHandler:](self, "_serviceWithErrorHandler:", &__block_literal_global_82);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeSubscriptions:", v6);

LABEL_24:
}

void __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke_cold_1();

}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void)setSubscriptionsByOptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsByOptions, a3);
}

- (VSDelayOperation)expirationOperation
{
  return self->_expirationOperation;
}

- (void)setExpirationOperation:(id)a3
{
  objc_storeStrong((id *)&self->_expirationOperation, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (void)setLinkedOnOrAfterChecker:(id)a3
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_expirationOperation, 0);
  objc_storeStrong((id *)&self->_subscriptionsByOptions, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_fetchOptionsValidator, 0);
  objc_storeStrong((id *)&self->_predicateFactory, 0);
}

void __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching active subscriptions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fetchActiveSubscriptionsWithOptions:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Attempt to fetch active subscriptions without appropriate entitlements.", v1, 2u);
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_54_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching from service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to fetch subscriptions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error registering subscription: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error removing subscriptions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
