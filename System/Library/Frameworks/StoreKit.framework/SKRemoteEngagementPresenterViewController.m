@implementation SKRemoteEngagementPresenterViewController

- (SKRemoteEngagementPresenterViewController)init
{
  SKRemoteEngagementPresenterViewController *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *remoteViewControllerSemaphore;
  dispatch_queue_t v5;
  OS_dispatch_queue *engagementPresentationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKRemoteEngagementPresenterViewController;
  v2 = -[SKRemoteEngagementPresenterViewController init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    remoteViewControllerSemaphore = v2->_remoteViewControllerSemaphore;
    v2->_remoteViewControllerSemaphore = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_queue_create("SKRemoteEngagementPresenterViewController engagement presentation queue", 0);
    engagementPresentationQueue = v2->_engagementPresentationQueue;
    v2->_engagementPresentationQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKRemoteEngagementPresenterViewController;
  -[SKRemoteEngagementPresenterViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SKRemoteEngagementPresenterViewController _loadRemoteViewController](self, "_loadRemoteViewController");
}

- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *engagementPresentationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Present engagement request: %{public}@, clientBundleID: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  engagementPresentationQueue = self->_engagementPresentationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke;
  block[3] = &unk_1E5B26C58;
  objc_copyWeak(&v19, (id *)buf);
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(engagementPresentationQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "remoteViewControllerSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 60000000000);
  v5 = dispatch_semaphore_wait(v3, v4);

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_cold_1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3;
    v8[3] = &unk_1E5B26C30;
    v8[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy_;
  v19[3] = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4;
  v17[3] = &unk_1E5B26BE0;
  v17[4] = &v18;
  objc_msgSend(v2, "serviceViewControllerProxyWithErrorHandler:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(v19[0] + 40))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3_cold_1((uint64_t)v19, v5, v6, v7, v8, v9, v10, v11);
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(v19[0] + 40));
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6;
    v15[3] = &unk_1E5B26C08;
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v4, "presentEngagementRequestData:clientBundleID:completion:", v13, v14, v15);

  }
  _Block_object_dispose(&v18, 8);

}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Finished presenting engagement request with view service", buf, 2u);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_7;
  v13[3] = &unk_1E5B26970;
  v11 = *(id *)(a1 + 32);
  v14 = v3;
  v15 = v11;
  v12 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_loadRemoteViewController
{
  id v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SKRemoteEngagementPresenterViewController__loadRemoteViewController__block_invoke;
  v4[3] = &unk_1E5B268E0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  v3 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteEngagementRemoteViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceRemoteEngagementViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__SKRemoteEngagementPresenterViewController__loadRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v12)
  {
    objc_msgSend(WeakRetained, "setRemoteViewController:", v12);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v8);

    objc_msgSend(v7, "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
    objc_msgSend(v7, "_addRemoteView");
  }
  else
  {
    NSLog(CFSTR("Could not request view controller: %@"), v5);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(v7, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "engagementTaskDidFinishWithResult:resultData:error:completion:", 0, 0, v5, &__block_literal_global_3);

  }
  objc_msgSend(v7, "remoteViewControllerSemaphore");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v11);

}

- (void)_addRemoteView
{
  void *v3;
  id v4;

  if (self->_remoteViewController)
  {
    if (-[SKRemoteEngagementPresenterViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKRemoteEngagementPresenterViewController view](self, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[SKRemoteEngagementRemoteViewController view](self->_remoteViewController, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      objc_msgSend(v3, "setFrame:");
      objc_msgSend(v3, "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", v3);

    }
  }
}

- (SKEngagementPresenterProtocol)delegate
{
  return (SKEngagementPresenterProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKRemoteEngagementRemoteViewController)remoteViewController
{
  return (SKRemoteEngagementRemoteViewController *)objc_getProperty(self, a2, 976, 1);
}

- (void)setRemoteViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (OS_dispatch_queue)engagementPresentationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 984, 1);
}

- (OS_dispatch_semaphore)remoteViewControllerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 992, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerSemaphore, 0);
  objc_storeStrong((id *)&self->_engagementPresentationQueue, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Timed out waiting to view service", v0, 2u);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "View service not available to present engagement request due to error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "View service not available to present engagement request %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "Error presenting engagement request with view service - %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
