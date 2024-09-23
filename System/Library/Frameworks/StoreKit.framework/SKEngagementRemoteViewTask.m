@implementation SKEngagementRemoteViewTask

- (SKEngagementRemoteViewTask)initWithRequestData:(id)a3 presentingViewController:(id)a4 windowScene:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKEngagementRemoteViewTask *v12;
  SKEngagementRemoteViewTask *v13;
  SKRemoteEngagementPresentationWindow *presentationWindow;
  dispatch_group_t v15;
  OS_dispatch_group *dispatchGroup;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SKEngagementRemoteViewTask;
  v12 = -[SKEngagementRemoteViewTask init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestData, a3);
    objc_storeStrong((id *)&v13->_viewController, a4);
    objc_storeStrong((id *)&v13->_scene, a5);
    presentationWindow = v13->_presentationWindow;
    v13->_presentationWindow = 0;

    v15 = dispatch_group_create();
    dispatchGroup = v13->_dispatchGroup;
    v13->_dispatchGroup = (OS_dispatch_group *)v15;

    v17 = dispatch_queue_create("com.StoreKit.AMSUIEngagementRemoteViewTask", 0);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v17;

  }
  return v13;
}

- (void)presentEngagement
{
  NSObject *v3;
  _QWORD block[5];

  -[SKEngagementRemoteViewTask workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke;
  block[3] = &unk_1E5B267D8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "requestData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v2;
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Presenting system engagement request. Request: %{public}@", buf, 0x16u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_1;
  block[3] = &unk_1E5B267D8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDispatchGroup:", 0);
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resultData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v10)[2](v10, v11, v12, v13);

  }
}

void __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_1(uint64_t a1)
{
  SKRemoteEngagementPresenterViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v2 = objc_alloc_init(SKRemoteEngagementPresenterViewController);
  objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_2;
  v10[3] = &unk_1E5B26708;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "presentEngagementRequestData:clientBundleID:completion:", v6, v7, v10);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "remoteViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_presentViewController:", v9);

}

uint64_t __47__SKEngagementRemoteViewTask_presentEngagement__block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setError:", a2);
    return objc_msgSend(*(id *)(v2 + 32), "_unblock");
  }
  return result;
}

- (void)engagementTaskDidFinishWithResult:(id)a3 resultData:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v16 = 138543874;
    v17 = objc_opt_class();
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: remote engagement task finished. Result: %{public}@, error: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  -[SKEngagementRemoteViewTask setResult:](self, "setResult:", v10);
  -[SKEngagementRemoteViewTask setResultData:](self, "setResultData:", v11);
  -[SKEngagementRemoteViewTask setError:](self, "setError:", v12);
  -[SKEngagementRemoteViewTask remoteViewController](self, "remoteViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SKEngagementRemoteViewTask viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SKEngagementRemoteViewTask setPresentationWindow:](self, "setPresentationWindow:", 0);
  v13[2](v13);
  -[SKEngagementRemoteViewTask _unblock](self, "_unblock");

}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  height = a3.height;
  width = a3.width;
  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = objc_opt_class();
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Preferred content size did change", (uint8_t *)&v7, 0xCu);
  }
  -[SKEngagementRemoteViewTask remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredContentSize:", width, height);

}

- (void)_unblock
{
  void *v3;
  NSObject *v4;

  -[SKEngagementRemoteViewTask dispatchGroup](self, "dispatchGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKEngagementRemoteViewTask dispatchGroup](self, "dispatchGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v4);

  }
}

- (void)_presentViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SKEngagementRemoteViewTask__presentViewController___block_invoke;
  v6[3] = &unk_1E5B27350;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__SKEngagementRemoteViewTask__presentViewController___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SKRemoteEngagementPresentationWindow *v7;
  void *v8;
  SKRemoteEngagementPresentationWindow *v9;

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
    if (v5)
      goto LABEL_4;
  }
  else
  {
    v5 = v3;
    if (v3)
    {
LABEL_4:
      v7 = [SKRemoteEngagementPresentationWindow alloc];
      objc_msgSend(*(id *)(a1 + 32), "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIApplicationRotationFollowingWindow initWithWindowScene:](v7, "initWithWindowScene:", v8);

      objc_msgSend(*(id *)(a1 + 32), "setPresentationWindow:", v9);
      -[SKRemoteEngagementPresentationWindow setHidden:](v9, "setHidden:", 0);
      -[SKRemoteEngagementPresentationWindow presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v5, 0, &__block_literal_global_8);
      objc_msgSend(*(id *)(a1 + 40), "setModalPresentationStyle:", 5);
      objc_msgSend(v5, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);

      goto LABEL_8;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __53__SKEngagementRemoteViewTask__presentViewController___block_invoke_cold_1(v2);
LABEL_8:

}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (SKRemoteEngagementPresenterViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (SKRemoteEngagementPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (NSData)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
  objc_storeStrong((id *)&self->_resultData, a3);
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

void __53__SKEngagementRemoteViewTask__presentViewController___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil", (uint8_t *)&v2, 0xCu);
}

@end
