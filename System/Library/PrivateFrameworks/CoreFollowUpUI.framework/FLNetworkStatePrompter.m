@implementation FLNetworkStatePrompter

- (FLNetworkStatePrompter)initWithPresenter:(id)a3
{
  id v5;
  FLNetworkStatePrompter *v6;
  FLNetworkStatePrompter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLNetworkStatePrompter;
  v6 = -[FLNetworkStatePrompter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_presenter, a3);

  return v7;
}

- (void)preflightNetworkStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Starting to preflight network state...", buf, 2u);
  }

  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D55CB40;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  char v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[FLNetworkObserver sharedNetworkObserver](FLNetworkObserver, "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if (v3)
  {
    _FLLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21641D000, v4, OS_LOG_TYPE_DEFAULT, "Network is reachable, moving on...", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_1;
    block[3] = &unk_24D55CAF0;
    v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v5 = v14;
  }
  else
  {
    +[FLNetworkObserver sharedNetworkObserver](FLNetworkObserver, "sharedNetworkObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAirplaneModeActiveWithoutWiFi");

    _FLLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      _os_log_impl(&dword_21641D000, v8, OS_LOG_TYPE_DEFAULT, "Network is unreachable and airplane mode state is: %d", buf, 8u);
    }

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_24D55CB18;
    v12 = v7;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
    v5 = v11;
  }

}

uint64_t __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_mainQueue_promptToDisableAirplaneModeWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "_mainQueue_verificationFailedAlert");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_mainQueue_promptToDisableAirplaneModeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint8_t buf[8];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Prompting to disable airplane mode...", buf, 2u);
  }

  -[FLNetworkStatePrompter _disableAirplaneActionWithCompletionHandler:](self, "_disableAirplaneActionWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[FLNetworkStatePrompter _cancelActionWithCompletionHandler:](self, "_cancelActionWithCompletionHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MGGetBoolAnswer();
  v10 = CFSTR("WIFI");
  if (v9)
    v10 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AIRPLANE_MODE_DISABLE_TITLE_%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FLLoc();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[FLAlertControllerHelper presentAlertWithTitle:message:actions:presentingController:](FLAlertControllerHelper, "presentAlertWithTitle:message:actions:presentingController:", v12, 0, v8, self->_presenter);
}

- (id)_disableAirplaneActionWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  FLLoc();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D55CBB8;
  v9 = v3;
  v5 = v3;
  +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", v4, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, int);
  void *v12;
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21641D000, v4, OS_LOG_TYPE_DEFAULT, "Disable airplane mode action initiated...", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  +[FLNetworkObserver sharedNetworkObserver](FLNetworkObserver, "sharedNetworkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_16;
  v12 = &unk_24D55CB90;
  v13 = *(id *)(a1 + 32);
  v14 = buf;
  objc_msgSend(v5, "addNetworkReachableBlock:", &v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v16 + 5);
  *((_QWORD *)v16 + 5) = v6;

  +[FLNetworkObserver sharedNetworkObserver](FLNetworkObserver, "sharedNetworkObserver", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disableAirplaneMode");

  _Block_object_dispose(buf, 8);
}

void __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_16(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = a2;
    _os_log_impl(&dword_21641D000, v4, OS_LOG_TYPE_DEFAULT, "Finished disabling with result... %d", buf, 8u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_17;
  v7[3] = &unk_24D55CB68;
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

uint64_t __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (id)_cancelActionWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  FLLoc();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__FLNetworkStatePrompter__cancelActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D55CBB8;
  v9 = v3;
  v5 = v3;
  +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", v4, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __61__FLNetworkStatePrompter__cancelActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _FLLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21641D000, v2, OS_LOG_TYPE_DEFAULT, "Dismiss action initiated, bailing...", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  FLError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

- (void)_mainQueue_verificationFailedAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21641D000, v3, OS_LOG_TYPE_DEFAULT, "Showing verification failed...", v9, 2u);
  }

  FLLoc();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  FLLoc();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FLLoc();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FLAlertControllerHelper presentAlertWithTitle:message:actions:presentingController:](FLAlertControllerHelper, "presentAlertWithTitle:message:actions:presentingController:", v7, v8, v6, self->_presenter);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FLNetworkStatePrompter *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_21641D000, v3, OS_LOG_TYPE_DEFAULT, "<%@> : checking out...", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLNetworkStatePrompter;
  -[FLNetworkStatePrompter dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
