@implementation AMSBiometricsPresentationProxy

- (AMSBiometricsPresentationProxy)initWithSession:(id)a3 task:(id)a4
{
  id v7;
  id v8;
  AMSBiometricsPresentationProxy *v9;
  AMSBiometricsPresentationProxy *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *delegateQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSBiometricsPresentationProxy;
  v9 = -[AMSBiometricsPresentationProxy init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_task, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBiometricsPresentationProxy.delegatePresentQueue", v11);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *delegateQueue;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[AMSBiometricsPresentationProxy session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__AMSBiometricsPresentationProxy_handleAuthenticateRequest_completion___block_invoke;
    block[3] = &unk_1E253F738;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    AMSError(6, CFSTR("Biometrics presentation error"), CFSTR("Delegate doesn't respond to AMSURLSession:task:handleAuthenticateRequest:completion:"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __71__AMSBiometricsPresentationProxy_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running on delegate queue, calling handleAuthenticateRequest with Request: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "AMSURLSession:task:handleAuthenticateRequest:completion:", v10, v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[AMSBiometricsPresentationProxy session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AMSBiometricsPresentationProxy session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBiometricsPresentationProxy session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBiometricsPresentationProxy task](self, "task");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "AMSURLSession:task:handleDialogRequest:completion:", v12, v13, v14, v6);

    v6 = v11;
  }
  else
  {
    AMSError(6, CFSTR("Biometrics presentation error"), CFSTR("Delegate doesn't respond to AMSURLSession:task:handleDialogRequest:completion:"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);
  }

}

- (AMSURLSession)session
{
  return self->_session;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
