@implementation LACPreboardLauncher

- (LACPreboardLauncher)init
{
  LACPreboardLauncher *v2;
  LACPreboardLauncher *v3;
  id launchCompletion;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LACPreboardLauncher;
  v2 = -[LACPreboardLauncher init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    launchCompletion = v2->_launchCompletion;
    v2->_launchCompletion = 0;

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (void)launchPreboardWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__LACPreboardLauncher_launchPreboardWithCompletion___block_invoke;
  v7[3] = &unk_2510C0B08;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__LACPreboardLauncher_launchPreboardWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_alternateSystemApp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      {
        +[LACPreboardErrorBuilder genericErrorWithMessage:](_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder, "genericErrorWithMessage:", CFSTR("Preboard is already launched"));
        v6 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v5 + 16))(v5, v6);
      }
      else
      {
        v9 = _Block_copy(*(const void **)(a1 + 40));
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 8);
        *(_QWORD *)(v10 + 8) = v9;

        objc_msgSend(v4, "setDelegate:", v3);
        objc_msgSend(v4, "activate");
        LACLogPreboard();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Preboard activated", v12, 2u);
        }
      }

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 40);
      +[LACPreboardErrorBuilder genericErrorWithMessage:](_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder, "genericErrorWithMessage:", CFSTR("Unable to load BKSAlternateSystemApp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
  }

}

- (void)alternateSystemAppDidLaunch:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  LACLogPreboard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "Preboard launched", v5, 2u);
  }

  -[LACPreboardLauncher _finishLaunchingWithError:](self, "_finishLaunchingWithError:", 0);
}

- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  LACLogPreboard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[LACPreboardLauncher alternateSystemApp:didFailToLaunchWithError:].cold.1((uint64_t)v5, v6);

  -[LACPreboardLauncher _finishLaunchingWithError:](self, "_finishLaunchingWithError:", v5);
}

- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LACLogPreboard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Preboard terminated with signal: %d", (uint8_t *)v6, 8u);
  }

}

- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4
{
  id v6;
  NSObject *v7;
  NSObject *workQueue;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  LACLogPreboard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = a4;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Preboard exited with code: %d", buf, 8u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__LACPreboardLauncher_alternateSystemApp_didExitWithStatus___block_invoke;
  block[3] = &unk_2510C0B30;
  v11 = v6;
  v9 = v6;
  dispatch_async(workQueue, block);

}

uint64_t __60__LACPreboardLauncher_alternateSystemApp_didExitWithStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "terminate");
}

- (id)_alternateSystemApp
{
  void *v2;
  NSObject *v3;

  if (getBKSAlternateSystemAppClass())
  {
    v2 = (void *)objc_msgSend(objc_alloc((Class)getBKSAlternateSystemAppClass()), "initWithBundleId:", CFSTR("com.apple.PreBoard"));
  }
  else
  {
    LACLogPreboard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[LACPreboardLauncher _alternateSystemApp].cold.1(v3);

    v2 = 0;
  }
  return v2;
}

- (void)_finishLaunchingWithError:(id)a3
{
  id v4;
  id launchCompletion;
  void (**v6)(void *, void *);
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  launchCompletion = self->_launchCompletion;
  if (launchCompletion)
  {
    v9 = v4;
    v6 = (void (**)(void *, void *))_Block_copy(launchCompletion);
    v7 = self->_launchCompletion;
    self->_launchCompletion = 0;

    if (v9)
    {
      +[LACPreboardErrorBuilder genericErrorWithUnderlyingError:](_TtC23LocalAuthenticationCore23LACPreboardErrorBuilder, "genericErrorWithUnderlyingError:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v6[2](v6, v8);

    v4 = v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_launchCompletion, 0);
}

- (void)alternateSystemApp:(uint64_t)a1 didFailToLaunchWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "Preboard did not launch with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_alternateSystemApp
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "BKSAlternateSystemApp not available", v1, 2u);
}

@end
