@implementation AMSUIPaymentSetupTask

- (AMSUIPaymentSetupTask)initWithReferrerIdentifier:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  AMSUIPaymentSetupTask *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  AMSBinaryPromise *v12;
  AMSBinaryPromise *resultPromise;
  AMSBinaryPromise *v14;
  AMSBinaryPromise *setupControllerPromise;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIPaymentSetupTask;
  v9 = -[AMSTask init](&v17, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.AppleMediaServicesUI.AMSUIPaymentSetupTask.dispatch", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    v12 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
    resultPromise = v9->_resultPromise;
    v9->_resultPromise = v12;

    v14 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
    setupControllerPromise = v9->_setupControllerPromise;
    v9->_setupControllerPromise = v14;

    objc_storeStrong((id *)&v9->_referrerIdentifier, a3);
    objc_storeStrong((id *)&v9->_viewController, a4);
  }

  return v9;
}

- (id)present
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];

  -[AMSUIPaymentSetupTask _fetchPaymentSetupFeature](self, "_fetchPaymentSetupFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __32__AMSUIPaymentSetupTask_present__block_invoke;
  v11[3] = &unk_24CB50500;
  v11[4] = self;
  objc_msgSend(v3, "addFinishBlock:", v11);
  objc_initWeak(&location, self);
  -[AMSUIPaymentSetupTask setupControllerPromise](self, "setupControllerPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __32__AMSUIPaymentSetupTask_present__block_invoke_9;
  v8[3] = &unk_24CB50528;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "addFinishBlock:", v8);

  -[AMSUIPaymentSetupTask resultPromise](self, "resultPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __32__AMSUIPaymentSetupTask_present__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v6);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v8, "dispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __32__AMSUIPaymentSetupTask_present__block_invoke_2;
      v17 = &unk_24CB4F4C0;
      v18 = *(_QWORD *)(a1 + 32);
      v10 = v5;
      v19 = v10;
      dispatch_sync(v9, &v14);

      v11 = *(void **)(a1 + 32);
      v20[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_presentPaymentSetupControllerWithPaymentSetupFeatures:", v12);

      goto LABEL_6;
    }
    objc_msgSend(v8, "resultPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v13);

  }
LABEL_6:

}

uint64_t __32__AMSUIPaymentSetupTask_present__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initial payment setup feature state: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentSetupFeatureState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

void __32__AMSUIPaymentSetupTask_present__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchPaymentSetupFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__AMSUIPaymentSetupTask_present__block_invoke_2_10;
  v3[3] = &unk_24CB50500;
  v3[4] = WeakRetained;
  objc_msgSend(v2, "addFinishBlock:", v3);

}

void __32__AMSUIPaymentSetupTask_present__block_invoke_2_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v6, "dispatchQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__AMSUIPaymentSetupTask_present__block_invoke_3;
    block[3] = &unk_24CB4F4C0;
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    dispatch_sync(v7, block);

    objc_msgSend(*(id *)(a1 + 32), "resultPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithSuccess:error:", objc_msgSend(*(id *)(a1 + 32), "_didSucceed"), 0);

  }
  else
  {
    objc_msgSend(v6, "resultPromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v5);

  }
}

uint64_t __32__AMSUIPaymentSetupTask_present__block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Final payment setup feature state: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setPaymentSetupFeatureState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

- (id)_fetchPaymentSetupFeature
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BE08318]);
  -[AMSUIPaymentSetupTask referrerIdentifier](self, "referrerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  objc_msgSend(v5, "performPaymentSetupFeatureLookup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_didSucceed
{
  return -[AMSUIPaymentSetupTask paymentSetupFeatureState](self, "paymentSetupFeatureState") == 3;
}

- (void)_presentPaymentSetupControllerWithPaymentSetupFeatures:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  AMSUIPaymentSetupTask *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (Class (__cdecl *)())getPKPaymentSetupConfigurationClass;
  v5 = a3;
  v6 = objc_alloc_init(v4());
  -[AMSUIPaymentSetupTask referrerIdentifier](self, "referrerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferrerIdentifier:", v7);

  v8 = objc_alloc_init(getPKPaymentSetupRequestClass());
  objc_msgSend(v8, "setConfiguration:", v6);
  objc_msgSend(v8, "setPaymentSetupFeatures:", v5);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preparing to display upsell view controller", buf, 0x16u);

    }
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke;
    v19 = &unk_24CB4F4C0;
    v20 = v8;
    v21 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], &v16);
    -[AMSUIPaymentSetupTask setupControllerPromise](self, "setupControllerPromise", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addFinishBlock:", &__block_literal_global_12);

  }
  else
  {
    -[AMSUIPaymentSetupTask resultPromise](self, "resultPromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

  }
}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke(uint64_t a1)
{
  AMSUIPaymentSetupViewController *v2;
  void *v3;
  _QWORD v4[5];

  v2 = -[AMSUIPaymentSetupViewController initWithPaymentSetupRequest:]([AMSUIPaymentSetupViewController alloc], "initWithPaymentSetupRequest:", *(_QWORD *)(a1 + 32));
  -[AMSUIPaymentSetupViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_2;
  v4[3] = &unk_24CB4F0E8;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "presentViewController:animated:completion:", v2, 1, v4);

}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_2()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_opt_class();
    AMSLogKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_211102000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]: Did present upsell view controller", (uint8_t *)&v4, 0x16u);

  }
}

void __80__AMSUIPaymentSetupTask__presentPaymentSetupControllerWithPaymentSetupFeatures___block_invoke_16()
{
  void *v0;
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_211102000, v1, OS_LOG_TYPE_DEFAULT, "AMSUIPaymentSetupTask: [%{public}@] Finishing upsell view controller operation", (uint8_t *)&v3, 0xCu);

  }
}

- (void)paymentSetupViewControllerDidDismiss
{
  id v3;

  -[AMSUIPaymentSetupTask setupControllerPromise](self, "setupControllerPromise");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithSuccess:error:", -[AMSUIPaymentSetupTask _didSucceed](self, "_didSucceed"), 0);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (int64_t)paymentSetupFeatureState
{
  return self->_paymentSetupFeatureState;
}

- (void)setPaymentSetupFeatureState:(int64_t)a3
{
  self->_paymentSetupFeatureState = a3;
}

- (AMSBinaryPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_resultPromise, a3);
}

- (AMSBinaryPromise)setupControllerPromise
{
  return self->_setupControllerPromise;
}

- (void)setSetupControllerPromise:(id)a3
{
  objc_storeStrong((id *)&self->_setupControllerPromise, a3);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_referrerIdentifier, a3);
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
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_setupControllerPromise, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
