@implementation LKLoginSupport

+ (id)findLeastRecentlyUsedCleanUser
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allUsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasDataToSync") & 1) == 0)
          objc_msgSend(v2, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_3);
    objc_msgSend(v2, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __48__LKLoginSupport_findLeastRecentlyUsedCleanUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastLoginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastLoginDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (BOOL)hasCleanUser
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasDataToSync"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isNewUserAbleToLogin
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4 < 0x20 || +[LKLoginSupport hasCleanUser](LKLoginSupport, "hasCleanUser");
}

- (LKLoginSupport)init
{
  LKLoginSupport *v2;
  uint64_t v3;
  NSOperationQueue *listenerQueue;
  uint64_t v5;
  NSOperationQueue *completionQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LKLoginSupport;
  v2 = -[LKLoginSupport init](&v8, sel_init);
  if (v2)
  {
    LKRegisterLoginKitLogging();
    v3 = objc_opt_new();
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (NSOperationQueue *)v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_listenerQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = objc_opt_new();
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (NSOperationQueue *)v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_completionQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (id)_errorForNotificationType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a3)
  {
    v5 = 26;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v5 = 25;
LABEL_5:
    +[LKError errorWithCode:](LKError, "errorWithCode:", v5, v3, v4);
    self = (LKLoginSupport *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_notificationForNotificationType:(unint64_t)a3
{
  __CFString **v3;

  if (!a3)
  {
    v3 = LKReadyToLoginNotificationName;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = LKLoggedInNotificationName;
LABEL_5:
    self = *v3;
  }
  return self;
}

- (void)_timeOutAfterTimePeriod:(double)a3 withError:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  double v15;

  v7 = a4;
  v8 = a5;
  v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__LKLoginSupport__timeOutAfterTimePeriod_withError_block___block_invoke;
  block[3] = &unk_24D59AFB0;
  v15 = a3;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

}

uint64_t __58__LKLoginSupport__timeOutAfterTimePeriod_withError_block___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_2167FC000, v2, OS_LOG_TYPE_DEFAULT, "Notification hasn't posted in the given period (%f seconds). Timing out.", (uint8_t *)&v5, 0xCu);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[4]);
  return result;
}

- (void)_runWhenDarwinNotificationPosted:(unint64_t)a3 timeOutPeriod:(double)a4 block:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint32_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[LKLoginSupport _notificationForNotificationType:](self, "_notificationForNotificationType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v11;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2167FC000, v10, OS_LOG_TYPE_DEFAULT, "Waiting for notification (%@) to be posted for %f seconds", buf, 0x16u);

  }
  -[LKLoginSupport _errorForNotificationType:](self, "_errorForNotificationType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LKLoginSupport _timeOutAfterTimePeriod:withError:block:](self, "_timeOutAfterTimePeriod:withError:block:", v12, v8, a4);

  -[LKLoginSupport _notificationForNotificationType:](self, "_notificationForNotificationType:", a3);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __71__LKLoginSupport__runWhenDarwinNotificationPosted_timeOutPeriod_block___block_invoke;
  v24 = &unk_24D59AEB0;
  v16 = v13;
  v25 = v16;
  v17 = v8;
  v26 = v17;
  v18 = notify_register_dispatch(v14, (int *)&_runWhenDarwinNotificationPosted_timeOutPeriod_block__notifyToken, v15, &v21);

  if (v18)
  {
    v19 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      v29 = 1026;
      LODWORD(v30) = v18;
      _os_log_impl(&dword_2167FC000, v19, OS_LOG_TYPE_DEFAULT, "Could not register for %@ notification error %{public}d", buf, 0x12u);
    }
    if (v17)
    {
      +[LKError errorWithCode:](LKError, "errorWithCode:", 27, v21, v22, v23, v24, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v17 + 2))(v17, v20);

    }
  }

}

uint64_t __71__LKLoginSupport__runWhenDarwinNotificationPosted_timeOutPeriod_block___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2167FC000, v2, OS_LOG_TYPE_DEFAULT, "Notified with %@", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_runWithTimeOutPeriod:(double)a3 notificationType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  LKNotificationListenerOperation *v9;
  uint64_t v10;
  id v11;
  id v12;
  LKNotificationListenerOperation *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  _QWORD v19[5];
  LKNotificationListenerOperation *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v8 = a5;
  v9 = [LKNotificationListenerOperation alloc];
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke;
  v22[3] = &unk_24D59B000;
  v22[4] = self;
  v11 = v8;
  v23 = v11;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_3;
  v19[3] = &unk_24D59B050;
  v19[4] = self;
  v20 = -[LKNotificationListenerOperation initWithNotificationType:timeOutPeriod:completionBlock:](v9, "initWithNotificationType:timeOutPeriod:completionBlock:", a4, v22, a3);
  v21 = v11;
  v12 = v11;
  v13 = v20;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_5;
  v16[3] = &unk_24D59B078;
  v17 = (id)MEMORY[0x2199FBC14](v19);
  v18 = a4;
  v14 = v17;
  -[LKNotificationListenerOperation setListenerStartedBlock:](v13, "setListenerStartedBlock:", v16);
  -[LKLoginSupport listenerQueue](self, "listenerQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v13);

}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_2;
  v7[3] = &unk_24D59AFD8;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v7);

}

uint64_t __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "completionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_4;
  v6[3] = &unk_24D59B028;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

uint64_t __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      result = objc_msgSend((id)result, "isFinished");
      if ((result & 1) == 0)
      {
        objc_msgSend(*(id *)(v1 + 40), "cancel");
        result = *(_QWORD *)(v1 + 48);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
      }
    }
  }
  return result;
}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2167FC000, v2, OS_LOG_TYPE_DEFAULT, "Listener has started. Check with logind now", v6, 2u);
  }
  +[LKLoginController sharedController](LKLoginController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 1)
  {
    objc_msgSend(v3, "isReadyToLogoutWithCompletionHandler:", *(_QWORD *)(a1 + 32));
  }
  else if (!v5)
  {
    objc_msgSend(v3, "isReadyToLoginWithCompletionHandler:", *(_QWORD *)(a1 + 32));
  }

}

- (void)runWithTimeOutPeriod:(double)a3 loggedInBlock:(id)a4
{
  -[LKLoginSupport _runWithTimeOutPeriod:notificationType:completionBlock:](self, "_runWithTimeOutPeriod:notificationType:completionBlock:", 1, a4, a3);
}

- (void)runWithTimeOutPeriod:(double)a3 readyToLoginBlock:(id)a4
{
  -[LKLoginSupport _runWithTimeOutPeriod:notificationType:completionBlock:](self, "_runWithTimeOutPeriod:notificationType:completionBlock:", 0, a4, a3);
}

- (NSOperationQueue)listenerQueue
{
  return self->_listenerQueue;
}

- (void)setListenerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_listenerQueue, a3);
}

- (NSOperationQueue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
}

@end
