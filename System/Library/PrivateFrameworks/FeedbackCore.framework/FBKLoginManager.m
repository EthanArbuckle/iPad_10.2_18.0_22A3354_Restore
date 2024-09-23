@implementation FBKLoginManager

- (FBKLoginManager)initWithAPI:(id)a3
{
  id v4;
  FBKLoginManager *v5;
  FBKLoginManager *v6;
  uint64_t v7;
  NSMutableArray *postLoginTaskQueue;
  uint64_t v9;
  NSMutableArray *postLogOutTaskQueue;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBKLoginManager;
  v5 = -[FBKLoginManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_loggedInAsSomeoneElse = 0;
    objc_storeWeak((id *)&v5->_api, v4);
    v6->_loginState = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    postLoginTaskQueue = v6->_postLoginTaskQueue;
    v6->_postLoginTaskQueue = (NSMutableArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    postLogOutTaskQueue = v6->_postLogOutTaskQueue;
    v6->_postLogOutTaskQueue = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_sessionDidBecomeInvalid_, CFSTR("FBKSessionDidBecomeInvalidNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBKLoginManager;
  -[FBKLoginManager dealloc](&v4, sel_dealloc);
}

- (void)logOutIfNeededAndRun:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[FBKLoginManager loginState](self, "loginState");
    if (v6 - 1 > 4)
      v7 = "Logged Out";
    else
      v7 = off_24E1574A0[v6 - 1];
    *(_DWORD *)buf = 136315394;
    v17 = "-[FBKLoginManager logOutIfNeededAndRun:]";
    v18 = 2082;
    v19 = v7;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  switch(-[FBKLoginManager loginState](self, "loginState"))
  {
    case 0uLL:
      v4[2](v4);
      break;
    case 1uLL:
      -[FBKLoginManager postLogOutTaskQueue](self, "postLogOutTaskQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = _Block_copy(v4);
      objc_msgSend(v10, "addObject:", v11);

      -[FBKLoginManager logOut](self, "logOut");
      break;
    case 2uLL:
      -[FBKLoginManager postLogOutTaskQueue](self, "postLogOutTaskQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _Block_copy(v4);
      objc_msgSend(v12, "addObject:", v13);

      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      -[FBKLoginManager postLogOutTaskQueue](self, "postLogOutTaskQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = _Block_copy(v4);
      objc_msgSend(v8, "addObject:", v9);

      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke;
      v14[3] = &unk_24E156F58;
      objc_copyWeak(&v15, (id *)buf);
      -[FBKLoginManager runAfterLogin:](self, "runAfterLogin:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
      break;
    default:
      break;
  }

}

void __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke_2;
  block[3] = &unk_24E156F30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
}

void __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logOut");

}

- (void)_drainLogOutTaskQueue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKLoginManager postLogOutTaskQueue](self, "postLogOutTaskQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x24BDAC760];
    v8 = MEMORY[0x24BDAC9B8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __40__FBKLoginManager__drainLogOutTaskQueue__block_invoke;
        block[3] = &unk_24E156F80;
        block[4] = v10;
        dispatch_async(v8, block);
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[FBKLoginManager postLogOutTaskQueue](self, "postLogOutTaskQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

uint64_t __40__FBKLoginManager__drainLogOutTaskQueue__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runAfterLogin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[FBKLoginManager loginState](self, "loginState") == 1)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __33__FBKLoginManager_runAfterLogin___block_invoke;
    v7[3] = &unk_24E156FA8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    -[FBKLoginManager postLoginTaskQueue](self, "postLoginTaskQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(v4);
    objc_msgSend(v5, "addObject:", v6);

  }
}

uint64_t __33__FBKLoginManager_runAfterLogin___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "loginState"));
}

- (void)_drainLoginTaskQueue
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_INFO, "Draining login task queue.", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FBKLoginManager postLoginTaskQueue](self, "postLoginTaskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x24BDAC760];
    v9 = MEMORY[0x24BDAC9B8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __39__FBKLoginManager__drainLoginTaskQueue__block_invoke;
        v13[3] = &unk_24E156FA8;
        v13[4] = self;
        v13[5] = v11;
        dispatch_async(v9, v13);
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  -[FBKLoginManager postLoginTaskQueue](self, "postLoginTaskQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

uint64_t __39__FBKLoginManager__drainLoginTaskQueue__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "loginState"));
}

- (void)clearLoginTaskQueue
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Clearing login task queue.", v5, 2u);
  }

  -[FBKLoginManager postLoginTaskQueue](self, "postLoginTaskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)sessionDidBecomeInvalid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  -[FBKLoginManager FBKData](self, "FBKData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingConsents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Session did become invalid while holding pending consents.", buf, 2u);
    }

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Session did become invalid", buf, 2u);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke;
    v10[3] = &unk_24E157020;
    v10[4] = self;
    v11 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  id v29;
  id buf[2];

  objc_msgSend(*(id *)(a1 + 32), "setLoginState:", 0);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 40), "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "containsObject:", CFSTR("login")) & 1) != 0
        || (objc_msgSend(v9, "containsObject:", CFSTR("signout")) & 1) != 0)
      {
        Log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "Calling boxed request error handler", (uint8_t *)buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("error"));
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "errorBlock");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v6, "errorBlock");
          v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, NSObject *))v14)[2](v14, v12);

        }
      }
      else
      {
        if (objc_msgSend(v9, "containsObject:", CFSTR("alive.json")))
        {
          objc_msgSend(*(id *)(a1 + 40), "userInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("error"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "errorBlock");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v6, "errorBlock");
            v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v18)[2](v18, v16);

          }
        }
        else
        {
          objc_initWeak(buf, *(id *)(a1 + 32));
          v19 = *(void **)(a1 + 32);
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_2;
          v27[3] = &unk_24E156FD0;
          objc_copyWeak(&v29, buf);
          v28 = v6;
          objc_msgSend(v19, "runAfterLogin:", v27);

          objc_destroyWeak(&v29);
          objc_destroyWeak(buf);
        }
        Log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, "Will try to recover after login session expired", (uint8_t *)buf, 2u);
        }

        v21 = +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA");
        Log();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_DEFAULT, "Using FBA only re-authentication flow", (uint8_t *)buf, 2u);
          }

          v24 = *(void **)(a1 + 32);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_28;
          v26[3] = &unk_24E156FF8;
          v26[4] = v24;
          objc_msgSend(v24, "autoLoginWithCompletion:", v26);
          goto LABEL_10;
        }
        if (v23)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_DEFAULT, "Using FBK re-authentication flow", (uint8_t *)buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "reAuthHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(*(id *)(a1 + 32), "reAuthHandler");
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSObject appNeedsReAuthentication](v12, "appNeedsReAuthentication");
        }
        else
        {
          Log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_cold_1();
        }
      }

LABEL_10:
    }
  }
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (a2 == 1 && WeakRetained)
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "HTTPMethod");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Retrying boxed request [%{public}@ %{public}@]", (uint8_t *)&v18, 0x16u);

    }
    v12 = objc_loadWeakRetained(v4);
    objc_msgSend(v12, "api");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "foregroundClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "successBlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "errorBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataForURLRequest:success:error:", v15, v16, v17);

  }
}

uint64_t __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_28(uint64_t a1, int a2)
{
  NSObject *v4;
  uint8_t v5[16];

  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_drainLoginTaskQueue");
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Could not re-authenticate with device token, logging out", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "logOut");
}

- (void)interactiveStartupWithLaunchAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKLoginManager setLoginState:](self, "setLoginState:", 3);
  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[FBKLoginManager loginState](self, "loginState");
    if (v9 - 1 > 4)
      v10 = "Logged Out";
    else
      v10 = off_24E1574A0[v9 - 1];
    *(_DWORD *)buf = 136315394;
    v25 = "-[FBKLoginManager interactiveStartupWithLaunchAction:completion:]";
    v26 = 2082;
    v27 = v10;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if (FBKIsInternalInstall(v11, v12))
  {
    objc_msgSend(v6, "loginToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v6, "loginToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke;
    v21[3] = &unk_24E157070;
    v16 = &v23;
    v21[4] = self;
    v23 = v7;
    v22 = v6;
    v17 = v7;
    -[FBKLoginManager loginWithEphemeralDeviceToken:completion:](self, "loginWithEphemeralDeviceToken:completion:", v15, v21);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_3;
    v19[3] = &unk_24E157098;
    v16 = &v20;
    v19[4] = self;
    v20 = v7;
    v18 = v7;
    -[FBKLoginManager loginAsAnonymousUserWithLaunchAction:completion:](self, "loginAsAnonymousUserWithLaunchAction:completion:", v6, v19);
  }

}

void __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2 == 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_2;
  v6[3] = &unk_24E157048;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "handleInteractiveLoginWithError:success:completion:", a2, v5, v6);

}

uint64_t __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

void __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_4;
  v9[3] = &unk_24E157048;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "handleInteractiveLoginWithError:success:completion:", a2, a2 == 0, v9);

}

uint64_t __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

- (void)interactiveStartupWithCompletion:(id)a3
{
  -[FBKLoginManager interactiveStartupUsingSystemAccount:completion:](self, "interactiveStartupUsingSystemAccount:completion:", 0, a3);
}

- (void)interactiveStartupUsingAppleConnect:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  FBKLoginManager *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKLoginManager setLoginState:](self, "setLoginState:", 5);
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[FBKLoginManager loginState](self, "loginState");
    if (v6 - 1 > 4)
      v7 = "Logged Out";
    else
      v7 = off_24E1574A0[v6 - 1];
    *(_DWORD *)buf = 136315394;
    v17 = "-[FBKLoginManager interactiveStartupUsingAppleConnect:]";
    v18 = 2082;
    v19 = v7;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __55__FBKLoginManager_interactiveStartupUsingAppleConnect___block_invoke;
  v13 = &unk_24E1570C0;
  v14 = self;
  v15 = v4;
  v8 = v4;
  v9 = _Block_copy(&v10);
  -[FBKLoginManager autoLoginUsingSystemAccount:completion:](self, "autoLoginUsingSystemAccount:completion:", 0, v9, v10, v11, v12, v13, v14);

}

uint64_t __55__FBKLoginManager_interactiveStartupUsingAppleConnect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInteractiveLoginWithError:success:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

- (void)interactiveStartupUsingSystemAccount:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  unint64_t v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[FBKLoginManager loginState](self, "loginState");
    if (v8 - 1 > 4)
      v9 = "Logged Out";
    else
      v9 = off_24E1574A0[v8 - 1];
    *(_DWORD *)buf = 136315394;
    v25 = "-[FBKLoginManager interactiveStartupUsingSystemAccount:completion:]";
    v26 = 2082;
    v27 = v9;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if (-[FBKLoginManager loginState](self, "loginState") != 3
    && -[FBKLoginManager loginState](self, "loginState") != 4
    && -[FBKLoginManager loginState](self, "loginState") != 1)
  {
    -[FBKLoginManager setLoginState:](self, "setLoginState:", 3);
    v11 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke;
    aBlock[3] = &unk_24E1570C0;
    aBlock[4] = self;
    v12 = v6;
    v23 = v12;
    v13 = _Block_copy(aBlock);
    if (FBKIsInternalInstall(v13, v14))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "environment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FBK_FIXTURES_ENABLED"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("1"));

      if (v18)
      {
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setParticipantID:", &unk_24E18CA88);
        objc_msgSend(v19, "setUsername:", CFSTR("tony@starkenterprises.com"));
        objc_msgSend(v19, "setGivenName:", CFSTR("Tony"));
        objc_msgSend(v19, "setFamilyName:", CFSTR("Stark"));
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke_46;
        v20[3] = &unk_24E156DC8;
        v20[4] = self;
        v21 = v12;
        -[FBKLoginManager didLoginWithUserInfo:completion:](self, "didLoginWithUserInfo:completion:", v19, v20);

LABEL_19:
        goto LABEL_12;
      }
      if (-[FBKLoginManager _hasInternalDeviceToken](self, "_hasInternalDeviceToken"))
      {
        -[FBKLoginManager _internalLoginWithDeviceToken:](self, "_internalLoginWithDeviceToken:", v13);
        goto LABEL_19;
      }
    }
    -[FBKLoginManager autoLoginUsingSystemAccount:completion:](self, "autoLoginUsingSystemAccount:completion:", v4, v13);
    goto LABEL_19;
  }
  Log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "login API called while logged/logging in", buf, 2u);
  }

LABEL_12:
}

uint64_t __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInteractiveLoginWithError:success:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInteractiveLoginWithError:success:completion:", 0, 1, *(_QWORD *)(a1 + 40));
}

- (void)handleInteractiveLoginWithError:(id)a3 success:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t, uint64_t))a5;
  if (v6)
  {
    -[FBKLoginManager setLoginState:](self, "setLoginState:", 1);
    -[FBKLoginManager _drainLoginTaskQueue](self, "_drainLoginTaskQueue");
    v10 = 0;
    v11 = 0;
  }
  else
  {
    if (v8)
    {
      Log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FBKLoginManager handleInteractiveLoginWithError:success:completion:].cold.1(v8);

      objc_msgSend(v8, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD1308]);

      if (v14 && (v15 = objc_msgSend(v8, "code") + 1009, v15 <= 8))
        v16 = qword_21DACF358[v15];
      else
        v16 = 0;
      if (-[FBKLoginManager _errorIncludesOutdatedVersion:](self, "_errorIncludesOutdatedVersion:", v8))
        v16 |= 2uLL;
      if (-[FBKLoginManager _errorIncludesNotAParticipant:](self, "_errorIncludesNotAParticipant:", v8))
        v11 = v16 | 4;
      else
        v11 = v16;
    }
    else
    {
      v11 = 0;
    }
    v10 = 4;
  }
  if (+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerForKey:", CFSTR("AgreedLegalVersion"));

    if (v18 < +[FBKSharedConstants currentLegalVersion](FBKSharedConstants, "currentLegalVersion"))
    {
      v10 |= 2uLL;
      +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBool:forKey:", 0, CFSTR("FBKSuppressPrivacyNotice"));

    }
  }
  if (v9)
    v9[2](v9, v11, v10);

}

- (void)backgroundStartupWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__FBKLoginManager_backgroundStartupWithCompletion___block_invoke;
  v6[3] = &unk_24E1570C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FBKLoginManager autoLoginWithCompletion:](self, "autoLoginWithCompletion:", v6);

}

uint64_t __51__FBKLoginManager_backgroundStartupWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_drainLoginTaskQueue");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)logOut
{
  NSObject *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Logging out", buf, 2u);
  }

  -[FBKLoginManager setLoginState:](self, "setLoginState:", 2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("FBKUserIsLogginOut"), self);

  v5 = dispatch_time(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__FBKLoginManager_logOut__block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

void __25__FBKLoginManager_logOut__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "FBKData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BE31358];
  if (v4)
  {
    objc_msgSend(v3, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearDeviceTokenForParticipantID:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE31358], "clearAllDeviceTokens");
  }
  objc_msgSend(*(id *)(a1 + 32), "api");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__FBKLoginManager_logOut__block_invoke_2;
  v8[3] = &unk_24E156D78;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "logOutServerSideWithCompletion:", v8);

}

void __25__FBKLoginManager_logOut__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "api");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__FBKLoginManager_logOut__block_invoke_3;
  v3[3] = &unk_24E156D78;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "didLogOutWithCompletion:", v3);

}

void __25__FBKLoginManager_logOut__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "FBKData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__FBKLoginManager_logOut__block_invoke_4;
  v3[3] = &unk_24E156D78;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "didLogOutWithCompletion:", v3);

}

uint64_t __25__FBKLoginManager_logOut__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void (**v5)(void);
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "setLoginState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLoggedInAsSomeoneElse:", 0);
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Did log out", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("FBKUserDidLogOut"), *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "pendingLoginOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingLoginOperation");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    objc_msgSend(*(id *)(a1 + 32), "setPendingLoginOperation:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_drainLogOutTaskQueue");
  return +[FBKTargetedSurvey clearCachedUserSession](_TtC12FeedbackCore17FBKTargetedSurvey, "clearCachedUserSession");
}

- (void)didLoginWithUserInfo:(id)a3
{
  -[FBKLoginManager didLoginWithUserInfo:completion:](self, "didLoginWithUserInfo:completion:", a3, 0);
}

- (void)didLoginWithUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "participantID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "did login with user ID [%{public}@] username [%@]", buf, 0x16u);

  }
  v11 = -[FBKLoginManager loginState](self, "loginState") == 5;
  -[FBKLoginManager setLoginState:](self, "setLoginState:", 1);
  -[FBKLoginManager FBKData](self, "FBKData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke;
  v15[3] = &unk_24E157110;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = v11;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "didLogInWithLoginUserInfo:completion:", v14, v15);

}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "api");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2;
  v4[3] = &unk_24E1570E8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "didLogInWithLoginUserInfo:completion:", v3, v4);

}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_drainLoginTaskQueue");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("FBKUserDidLogIn"), *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 48))
  {
    Log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2_cold_1();

  }
  else
  {
    +[FBKTargetedSurvey clearCachedUserSession](_TtC12FeedbackCore17FBKTargetedSurvey, "clearCachedUserSession");
  }
}

- (void)loginWithEphemeralDeviceToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FBKLoginManager api](self, "api");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke;
    v13[3] = &unk_24E157160;
    v13[4] = self;
    v14 = v7;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_51;
    v11[3] = &unk_24E157188;
    v12 = v14;
    objc_msgSend(v8, "seedPortalLoginWithDeviceToken:success:error:", v6, v13, v11);

  }
  else
  {
    FBKErrorOfType(-1020);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);

  }
}

void __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2;
  block[3] = &unk_24E157138;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "did login with device token", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "didLoginWithUserInfo:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2_52;
  v6[3] = &unk_24E156FA8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)loginAsAnonymousUserWithLaunchAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  FBKLoginManager *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[FBKLoginManager api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke;
  v16[3] = &unk_24E1571D8;
  v17 = v6;
  v18 = self;
  v19 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_53;
  v13[3] = &unk_24E157228;
  v14 = v17;
  v15 = v19;
  v11 = v17;
  v12 = v19;
  objc_msgSend(v8, "seedPortalLoginAsAnonymousUserWithConfigurationToken:success:error:", v9, v16, v13);

}

void __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2;
  v6[3] = &unk_24E1571B0;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "did login with configuration", v6, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCustomBehavior:", v4);

  objc_msgSend(*(id *)(a1 + 48), "didLoginWithUserInfo:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2_54;
  block[3] = &unk_24E157200;
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2_54(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)autoLoginWithCompletion:(id)a3
{
  -[FBKLoginManager autoLoginUsingSystemAccount:completion:](self, "autoLoginUsingSystemAccount:completion:", 0, a3);
}

- (void)autoLoginUsingSystemAccount:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  FBKLoginManager *v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  if (v6)
    v7 = v6;
  else
    v7 = &__block_literal_global_7;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", *MEMORY[0x24BE31308]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || v4)
  {
    -[FBKLoginManager FBKData](self, "FBKData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userForUsername:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "ID");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerForKey:", *MEMORY[0x24BE31300]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      dispatch_get_global_queue(25, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_56;
      block[3] = &unk_24E1572B8;
      v19 = v15;
      v20 = self;
      v21 = v9;
      v23 = v4;
      v22 = v7;
      dispatch_async(v16, block);

    }
    else
    {
      Log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "No userID. Cannot auto-login.", buf, 2u);
      }

      if (v4)
      {
        -[FBKLoginManager loginWithSystemAccountWithCompletion:](self, "loginWithSystemAccountWithCompletion:", v7);
      }
      else
      {
        -[FBKLoginManager setLoginState:](self, "setLoginState:", 0);
        (*((void (**)(void *, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      }
    }

  }
  else
  {
    Log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "No username. Cannot auto-login", buf, 2u);
    }

    -[FBKLoginManager setLoginState:](self, "setLoginState:", 0);
    (*((void (**)(void *, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_56(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  int8x16_t v5;
  _QWORD block[4];
  int8x16_t v7;
  id v8;
  id v9;
  id v10;
  char v11;

  objc_msgSend(MEMORY[0x24BE31358], "fetchDeviceTokenForParticipantID:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_2;
  block[3] = &unk_24E157290;
  v5 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  v9 = v2;
  v11 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoLoginWithUserID:userName:deviceToken:usesSystemAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

- (void)loginWithSystemAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  FBKLoginManager *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Performing system account login.", buf, 2u);
  }

  -[FBKLoginManager setLoginState:](self, "setLoginState:", 4);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithAccountType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v8, "count"))
  {
    v24 = self;
    v25 = v8;
    v26 = v7;
    v27 = v4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
LABEL_7:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
        objc_msgSend(v15, "username");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "username");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (v18)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v12)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      Log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_INFO, "Found Apple ID Authentication account matching Apple Account.", buf, 2u);
      }

      v21 = v15;
      v7 = v26;
      v4 = v27;
      if (v21)
      {
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke;
        v28[3] = &unk_24E157330;
        v28[4] = v24;
        v29 = v21;
        v30 = v27;
        v22 = v21;
        objc_msgSend(v22, "aida_tokenForService:completionHandler:", CFSTR("com.apple.gs.beta.auth"), v28);

        goto LABEL_24;
      }
    }
    else
    {
LABEL_13:

      v7 = v26;
      v4 = v27;
    }
    Log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FBKLoginManager loginWithSystemAccountWithCompletion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_24:
    v8 = v25;
  }
  else
  {
    Log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "No system accounts exist.", buf, 2u);
    }

    -[FBKLoginManager setLoginState:](self, "setLoginState:", 0);
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_2(v6);

    Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1();

  }
  if (v5)
  {
    objc_msgSend(a1[4], "_completeAuthenticationWith:credentialToken:completion:", a1[5], v5, a1[6]);
  }
  else
  {
    Log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "Nil credential token for FBK IDMS Service. Will renew", buf, 2u);
    }

    objc_msgSend(a1[5], "accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    v19[0] = CFSTR("com.apple.gs.beta.auth");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59;
    v14[3] = &unk_24E157308;
    v15 = a1[5];
    v13 = a1[6];
    v16 = a1[4];
    v17 = v13;
    objc_msgSend(v10, "aida_renewCredentialsForAccount:services:completion:", v11, v12, v14);

  }
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  switch(a2)
  {
    case 2:
      Log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: failed";
      goto LABEL_10;
    case 1:
      Log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: rejected";
      goto LABEL_10;
    case 0:
      Log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: renewed";
LABEL_10:
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_13;
  }
  Log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59_cold_2();
LABEL_13:

  if (v5)
  {
    Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59_cold_1();

  }
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60;
  v12[3] = &unk_24E1572E0;
  v14 = *(id *)(a1 + 48);
  v11 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  objc_msgSend(v9, "aida_tokenForService:completionHandler:", CFSTR("com.apple.gs.beta.auth"), v12);

}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60_cold_3(v6);

    Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1();

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeAuthenticationWith:credentialToken:completion:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  }
  else
  {
    Log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60_cold_1();

    FBKErrorOfType(16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_61;
    v13[3] = &unk_24E156FA8;
    v11 = *(id *)(a1 + 48);
    v14 = v10;
    v15 = v11;
    v12 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

uint64_t __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_completeAuthenticationWith:(id)a3 credentialToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "aida_alternateDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("com.apple.gs.beta.auth"));
  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  Log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478339;
    v23 = v8;
    v24 = 2113;
    v25 = v11;
    v26 = 1024;
    v27 = v9 != 0;
    _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "Performing authentication with account [%{private}@] alternate DSID [%{private}@] has credential token? [%i]", buf, 0x1Cu);
  }

  -[FBKLoginManager api](self, "api");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke;
  v20[3] = &unk_24E157160;
  v20[4] = self;
  v21 = v10;
  v18[0] = v16;
  v18[1] = 3221225472;
  v18[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2_67;
  v18[3] = &unk_24E157380;
  v18[4] = self;
  v19 = v21;
  v17 = v21;
  objc_msgSend(v15, "seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:", v12, v13, v9, v11, v20, v18);

}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2;
  block[3] = &unk_24E157138;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "Did log in with system account. %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setIsSystemAccount:", 1);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_66;
  v6[3] = &unk_24E156F80;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "didLoginWithUserInfo:completion:", v5, v6);

}

uint64_t __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_3;
  block[3] = &unk_24E157358;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoginState:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)autoLoginWithUserID:(id)a3 userName:(id)a4 deviceToken:(id)a5 usesSystemAccount:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD v19[5];
  id v20;

  v8 = a6;
  v10 = a5;
  v11 = a7;
  if (v10)
  {
    -[FBKLoginManager setLoginState:](self, "setLoginState:", 3);
    -[FBKLoginManager api](self, "api");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke;
    v19[3] = &unk_24E157160;
    v19[4] = self;
    v20 = v11;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2_69;
    v16[3] = &unk_24E1573A8;
    v18 = v8;
    v16[4] = self;
    v17 = v20;
    objc_msgSend(v12, "seedPortalLoginWithDeviceToken:success:error:", v10, v19, v16);

  }
  else
  {
    Log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "No token. Cannot auto-login.", v15, 2u);
    }

    if (v8)
    {
      -[FBKLoginManager loginWithSystemAccountWithCompletion:](self, "loginWithSystemAccountWithCompletion:", v11);
    }
    else
    {
      -[FBKLoginManager setLoginState:](self, "setLoginState:", 0);
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    }
  }

}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2;
  block[3] = &unk_24E157138;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    v9 = v3;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "Did login with device token for [%{private}@]", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "saveDeviceTokenLookupInformation");
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_68;
  v6[3] = &unk_24E156F80;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "didLoginWithUserInfo:completion:", v5, v6);

}

uint64_t __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2_69(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3;
  v7[3] = &unk_24E157110;
  v11 = *(_BYTE *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3_cold_1(a1);

  v3 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(v3, "loginWithSystemAccountWithCompletion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setLoginState:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)loginAsUnauthenticatedUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FBKLoginManager api](self, "api");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke;
  v10[3] = &unk_24E157160;
  v10[4] = self;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_4;
  v8[3] = &unk_24E157188;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "seedPortalLoginAsUnauthenticatedUserWithSuccessHandler:error:", v10, v8);

}

void __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_2;
  block[3] = &unk_24E157138;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_3;
  v3[3] = &unk_24E156F80;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "didLoginWithUserInfo:completion:", v2, v3);

}

uint64_t __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  FBKLoginManager *v22;
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  Log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "Will login with AuthKit", buf, 2u);
  }

  -[FBKLoginManager setLoginState:](self, "setLoginState:", 4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("com.apple.gs.beta.auth"));
  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKLoginManager api](self, "api");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke;
  v20[3] = &unk_24E1571D8;
  v21 = v8;
  v22 = self;
  v23 = v9;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_3;
  v18[3] = &unk_24E157380;
  v18[4] = self;
  v19 = v23;
  v16 = v23;
  v17 = v8;
  objc_msgSend(v14, "seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:", v12, v13, v10, v20, v18);

}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v3;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "Did login with username and AuthKit for [%{private}@]", buf, 0xCu);
  }

  v5 = (void *)MEMORY[0x24BE31358];
  objc_msgSend(v3, "deviceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceToken:forParticipantID:", v6, v7);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_70;
  v12[3] = &unk_24E1571B0;
  v13 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v14 = v8;
  v15 = v9;
  v16 = v10;
  v11 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_70(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setUsername:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "saveDeviceTokenLookupInformation");
  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_2;
  v4[3] = &unk_24E156F80;
  v3 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "didLoginWithUserInfo:completion:", v2, v4);

}

uint64_t __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_4;
  block[3] = &unk_24E157138;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_4(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setLoginState:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_errorIncludesOutdatedVersion:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "_errorIncludesNotAParticipant:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    v5 = 2;
    if (!v2)
      v5 = 0;
    if (v3)
      v6 = v5 | 4;
    else
      v6 = v5;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, v6);
  }
  return result;
}

- (void)loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[FBKLoginManager loginState](self, "loginState");
    if (v12 - 1 > 4)
      v13 = "Logged Out";
    else
      v13 = off_24E1574A0[v12 - 1];
    *(_DWORD *)buf = 136315394;
    v21 = "-[FBKLoginManager loginWithUsername:authenticationResults:completion:]";
    v22 = 2082;
    v23 = v13;
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if (-[FBKLoginManager loginState](self, "loginState") == 2)
  {
    Log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Logout in progress - will proceed with login when done.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__FBKLoginManager_loginWithUsername_authenticationResults_completion___block_invoke;
    v15[3] = &unk_24E1573D0;
    objc_copyWeak(&v19, (id *)buf);
    v16 = v8;
    v17 = v9;
    v18 = v10;
    -[FBKLoginManager setPendingLoginOperation:](self, "setPendingLoginOperation:", v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[FBKLoginManager _loginWithUsername:authenticationResults:completion:](self, "_loginWithUsername:authenticationResults:completion:", v8, v9, v10);
  }

}

void __70__FBKLoginManager_loginWithUsername_authenticationResults_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_loginWithUsername:authenticationResults:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)loginWithAppleConnectToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  Log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Will login with AppleConnect", buf, 2u);
  }

  -[FBKLoginManager setLoginState:](self, "setLoginState:", 5);
  -[FBKLoginManager api](self, "api");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke;
  v14[3] = &unk_24E157160;
  v14[4] = self;
  v15 = v6;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_3;
  v12[3] = &unk_24E157380;
  v12[4] = self;
  v13 = v15;
  v11 = v15;
  objc_msgSend(v9, "seedPortalLoginWithAppleConnectSession:success:error:", v7, v14, v12);

}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v11 = v3;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "Did login with token and AppleConnect for [%{private}@]", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_71;
  block[3] = &unk_24E157138;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_71(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_2;
  v3[3] = &unk_24E156F80;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "didLoginWithUserInfo:completion:", v2, v3);

}

uint64_t __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_4;
  block[3] = &unk_24E157138;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_4(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "setLoginState:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_errorIncludesOutdatedVersion:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "_errorIncludesNotAParticipant:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    v5 = 2;
    if (!v2)
      v5 = 0;
    if (v3)
      v6 = v5 | 4;
    else
      v6 = v5;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, v6);
  }
  return result;
}

- (BOOL)_errorIncludesOutdatedVersion:(id)a3
{
  return FBKSErrorContainsSP2ErrorCode();
}

- (BOOL)_errorIncludesNotAParticipant:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE312E8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 10)
    {
      v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE31310]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8 && objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_73) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v6;
}

BOOL __49__FBKLoginManager__errorIncludesNotAParticipant___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "code");
  if (v5 == 10)
    *a4 = 1;
  return v5 == 10;
}

- (unint64_t)loginState
{
  FBKLoginManager *v2;
  unint64_t loginState;

  v2 = self;
  objc_sync_enter(v2);
  loginState = v2->_loginState;
  objc_sync_exit(v2);

  return loginState;
}

- (void)setLoginState:(unint64_t)a3
{
  FBKLoginManager *v4;
  unint64_t loginState;
  _QWORD v6[6];

  v4 = self;
  objc_sync_enter(v4);
  loginState = v4->_loginState;
  v4->_loginState = a3;
  objc_sync_exit(v4);

  if (loginState != a3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __33__FBKLoginManager_setLoginState___block_invoke;
    v6[3] = &unk_24E157438;
    v6[4] = v4;
    v6[5] = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  }
}

void __33__FBKLoginManager_setLoginState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  const char *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40) - 1;
    if (v3 > 4)
      v4 = "Logged Out";
    else
      v4 = off_24E1574A0[v3];
    v6 = 136446210;
    v7 = v4;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "New login state: [%{public}s]", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("FBKDidChangeLogInState"), *(_QWORD *)(a1 + 32), 0);

}

- (void)_internalLoginWithDeviceToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Using loginInfo file", buf, 2u);
  }

  -[FBKLoginManager _loginInfo](self, "_loginInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__FBKLoginManager__internalLoginWithDeviceToken___block_invoke;
  v12[3] = &unk_24E157460;
  v12[4] = self;
  v13 = v6;
  v14 = v4;
  v10 = v4;
  v11 = v6;
  -[FBKLoginManager autoLoginWithUserID:userName:deviceToken:usesSystemAccount:completion:](self, "autoLoginWithUserID:userName:deviceToken:usesSystemAccount:completion:", v7, v8, v9, 0, v12);

}

void __49__FBKLoginManager__internalLoginWithDeviceToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setLoggedInAsSomeoneElse:", a2);
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "DEV: saving loginInfo.json token to keychain", v11, 2u);
  }

  v8 = (void *)MEMORY[0x24BE31358];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceToken:forParticipantID:", v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)_hasInternalDeviceToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[FBKLoginManager _loginInfo](self, "_loginInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("username"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("token"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_loginInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  +[FBKFileManager applicationSupportDirectory](FBKFileManager, "applicationSupportDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("loginInfo.json"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v13 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v13;
        if (v10)
        {
          Log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[FBKLoginManager _loginInfo].cold.1();

        }
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)authenticationContextForUsername:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v4, "setAuthenticationType:", 2);
  if (v3)
    objc_msgSend(v4, "setUsername:", v3);
  objc_msgSend(v4, "setServiceIdentifier:", CFSTR("com.apple.gs.beta.auth"));
  objc_msgSend(v4, "setIsEphemeral:", 1);

  return v4;
}

- (FBKReAuthenticationHandler)reAuthHandler
{
  return (FBKReAuthenticationHandler *)objc_loadWeakRetained((id *)&self->_reAuthHandler);
}

- (void)setReAuthHandler:(id)a3
{
  objc_storeWeak((id *)&self->_reAuthHandler, a3);
}

- (FBKLoginManagerDelegate)api
{
  return (FBKLoginManagerDelegate *)objc_loadWeakRetained((id *)&self->_api);
}

- (void)setApi:(id)a3
{
  objc_storeWeak((id *)&self->_api, a3);
}

- (FBKLoginManagerDelegate)FBKData
{
  return (FBKLoginManagerDelegate *)objc_loadWeakRetained((id *)&self->_FBKData);
}

- (void)setFBKData:(id)a3
{
  objc_storeWeak((id *)&self->_FBKData, a3);
}

- (BOOL)loggedInAsSomeoneElse
{
  return self->_loggedInAsSomeoneElse;
}

- (void)setLoggedInAsSomeoneElse:(BOOL)a3
{
  self->_loggedInAsSomeoneElse = a3;
}

- (NSMutableArray)postLoginTaskQueue
{
  return self->_postLoginTaskQueue;
}

- (void)setPostLoginTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_postLoginTaskQueue, a3);
}

- (NSMutableArray)postLogOutTaskQueue
{
  return self->_postLogOutTaskQueue;
}

- (void)setPostLogOutTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_postLogOutTaskQueue, a3);
}

- (id)pendingLoginOperation
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingLoginOperation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingLoginOperation, 0);
  objc_storeStrong((id *)&self->_postLogOutTaskQueue, 0);
  objc_storeStrong((id *)&self->_postLoginTaskQueue, 0);
  objc_destroyWeak((id *)&self->_FBKData);
  objc_destroyWeak((id *)&self->_api);
  objc_destroyWeak((id *)&self->_reAuthHandler);
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_FAULT, "Re-authentication delegate is nil. Cannot recover from invalid session", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleInteractiveLoginWithError:(void *)a1 success:completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_21D9A9000, v2, v3, "Failed to log in with error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_DEBUG, "Not clearing out User in feedbackd on internal AppleConnect flow", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loginWithSystemAccountWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Found no Apple ID Authentication account matching the current Apple Account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Error details: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_21D9A9000, v2, v3, "Failed to get token for FBK IDMS Service: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Credential renewal failed with [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_59_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "renewal result: unhandled case", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Credential token for FBK IDMS is nil after renewing credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_60_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_21D9A9000, v2, v3, "Failed to get token after renewal: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_21D9A9000, v2, v3, "Failed to auto-login with token: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_loginInfo
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "error reading loginInfo.json: %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

@end
