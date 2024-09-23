@implementation AMSUIEngagementRemoteViewTask

- (AMSUIEngagementRemoteViewTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  AMSUIEngagementRemoteViewTask *v9;
  AMSUIEngagementRemoteViewTask *v10;
  dispatch_group_t v11;
  OS_dispatch_group *dispatchGroup;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementRemoteViewTask;
  v9 = -[AMSTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_viewController, a4);
    v10->_preferredContentSize = (CGSize)*MEMORY[0x24BDBF148];
    v11 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v11;

  }
  return v10;
}

- (id)presentEngagement
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke;
  v3[3] = &unk_24CB4F9B8;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  void *v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v6;
    v48 = 2114;
    v49 = v8;
    v50 = 2114;
    v51 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system engagement request. Request: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_snapshotBagDataPromise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v11, "resultWithError:", &v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v45;

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v15;
        v48 = 2114;
        v49 = v17;
        v50 = 2114;
        v51 = v12;
        _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to snapshot bag. Error: %{public}@", buf, 0x20u);

      }
    }

  }
  v18 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3;
  aBlock[3] = &unk_24CB4F968;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v44 = v19;
  v20 = _Block_copy(aBlock);
  v42 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.AppleMediaServicesUI.EngagementViewExtension"), &v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v42;
  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v22);
    objc_msgSend(*(id *)(a1 + 32), "_unblock");
  }
  else
  {
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4;
    block[3] = &unk_24CB4F3C0;
    v40 = v21;
    v41 = v20;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v23);

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v24 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v22;
    v27 = v21;
    v28 = v19;
    v29 = a2;
    v30 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v38 = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v47 = v30;
    a2 = v29;
    v19 = v28;
    v21 = v27;
    v22 = v37;
    v48 = 2114;
    v49 = v31;
    v50 = 2114;
    v51 = v32;
    v52 = 2114;
    v53 = v33;
    _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x2Au);

    v20 = v38;
  }

  objc_msgSend(*(id *)(a1 + 32), "setDispatchGroup:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "result");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_2;
  v15[3] = &unk_24CB4F940;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v16 = v5;
  v17 = v8;
  v18 = v6;
  v19 = v9;
  v10 = v15;
  v11 = v6;
  v12 = v5;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_2;
  block[3] = &unk_24CB4F3C0;
  v21 = v13;
  v22 = v10;
  v14 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "remoteProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "clientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3;
    v12[3] = &unk_24CB4F560;
    v12[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "presentEngagementRequest:bagData:clientInfo:completion:", v5, v6, v7, v12);

    objc_msgSend(*(id *)(a1 + 40), "_presentViewController:", v3);
  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v9 = *(void **)(a1 + 40);
      v8 = (id *)(a1 + 40);
      objc_msgSend(v9, "setError:");
    }
    else
    {
      AMSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v8 = (id *)(a1 + 40);
      objc_msgSend(v11, "setError:", v10);

    }
    objc_msgSend(*v8, "_unblock");
  }

}

uint64_t __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_3(uint64_t result, uint64_t a2)
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

void __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = (void *)MEMORY[0x24BEBDCE8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_5;
  v4[3] = &unk_24CB4F990;
  v2 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend(v1, "instantiateWithExtension:completion:", v2, v4);

}

uint64_t __50__AMSUIEngagementRemoteViewTask_presentEngagement__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BE081D8];
  v11 = (void (**)(_QWORD))a5;
  objc_msgSend(v10, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    -[AMSUIEngagementRemoteViewTask request](self, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v14;
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] remote engagement task finished. Result: %{public}@, error: %{public}@", (uint8_t *)&v23, 0x2Au);

  }
  -[AMSUIEngagementRemoteViewTask setResult:](self, "setResult:", v8);
  -[AMSUIEngagementRemoteViewTask setError:](self, "setError:", v9);
  -[AMSUIEngagementRemoteViewTask presentedViewController](self, "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_opt_class();
    -[AMSUIEngagementRemoteViewTask request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v20;
    v25 = 2114;
    v26 = v22;
    _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] remote engagement task finished. Cleaning up vc references", (uint8_t *)&v23, 0x16u);

  }
  -[AMSUIEngagementRemoteViewTask setPresentedViewController:](self, "setPresentedViewController:", 0);
  -[AMSUIEngagementRemoteViewTask setViewController:](self, "setViewController:", 0);
  v11[2](v11);

  -[AMSUIEngagementRemoteViewTask _unblock](self, "_unblock");
}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  CGSize v20;

  height = a3.height;
  width = a3.width;
  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    -[AMSUIEngagementRemoteViewTask request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20.width = width;
    v20.height = height;
    AMSStringFromSize(v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preferred content size did change. Size: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  -[AMSUIEngagementRemoteViewTask presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreferredContentSize:", width, height);

}

- (id)_snapshotBagDataPromise
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[AMSUIEngagementRemoteViewTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BE08340];
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE08340]);
    -[AMSUIEngagementRemoteViewTask bag](self, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completionHandlerAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createSnapshotWithCompletion:", v7);

    objc_msgSend(v5, "thenWithBlock:", &__block_literal_global_5);
  }
  else
  {
    AMSError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseWithError:", v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__AMSUIEngagementRemoteViewTask__snapshotBagDataPromise__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compile");
}

- (void)_unblock
{
  void *v3;
  NSObject *v4;

  -[AMSUIEngagementRemoteViewTask dispatchGroup](self, "dispatchGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIEngagementRemoteViewTask dispatchGroup](self, "dispatchGroup");
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
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__AMSUIEngagementRemoteViewTask__presentViewController___block_invoke;
  v6[3] = &unk_24CB4F4C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __56__AMSUIEngagementRemoteViewTask__presentViewController___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v1 = a1;
  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_frontmostController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(v1 + 32), "setPresentedViewController:", *(_QWORD *)(v1 + 40));
    objc_msgSend(*(id *)(v1 + 40), "setModalPresentationStyle:", 5);
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(v1 + 40), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = objc_opt_class();
      v9 = v8;
      if (v6)
      {
        AMSLogKey();
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v1);
      }
      else
      {
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v10;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil!", buf, 0xCu);
      if (v6)
      {

        v10 = (void *)v1;
      }

    }
  }

}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
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

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteListener, a3);
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (AMSEngagementResult)result
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
