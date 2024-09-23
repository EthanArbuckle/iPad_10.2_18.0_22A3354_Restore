@implementation AMSUIEngagementRemoteViewController

- (AMSUIEngagementTaskRemoteInterface)remoteProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__AMSUIEngagementRemoteViewController_remoteProxy__block_invoke;
  v3[3] = &unk_24CB4F560;
  v3[4] = self;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v3);
  return (AMSUIEngagementTaskRemoteInterface *)(id)objc_claimAutoreleasedReturnValue();
}

void __50__AMSUIEngagementRemoteViewController_remoteProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote proxy. Error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__AMSUIEngagementRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v6[3] = &unk_24CB4F4C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AMSUIEngagementRemoteViewController engagementTaskDidFinishWithResult:error:completion:](self, "engagementTaskDidFinishWithResult:error:completion:", 0, v5, v6);

}

void __72__AMSUIEngagementRemoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] View service termination handled. Error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B1F340);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE1DC8);
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "engagementTaskDidFinishWithResult:error:completion:", v15, v8, v9);

    }
  }

}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  height = a3.height;
  width = a3.width;
  -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[AMSUIEngagementRemoteViewController delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredContentSizeDidChange:", width, height);

    }
  }
}

- (AMSUIEngagementTaskHostInterface)delegate
{
  return (AMSUIEngagementTaskHostInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)preferredContentSizeOverride
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSizeOverride.width;
  height = self->_preferredContentSizeOverride.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSizeOverride:(CGSize)a3
{
  self->_preferredContentSizeOverride = a3;
}

- (NSValue)internalPreferredContentSizeOverride
{
  return self->_internalPreferredContentSizeOverride;
}

- (void)setInternalPreferredContentSizeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_internalPreferredContentSizeOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPreferredContentSizeOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
