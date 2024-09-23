@implementation AMSUIDynamicViewControllerDelegateProxy

- (AMSUIDynamicViewControllerDelegateProxy)initWithDynamicViewController:(id)a3
{
  id v4;
  AMSUIDynamicViewControllerDelegateProxy *v5;
  AMSUIDynamicViewControllerDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIDynamicViewControllerDelegateProxy;
  v5 = -[AMSUIDynamicViewControllerDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dynamicViewController, v4);

  return v6;
}

- (id)dynamicViewController:(id)a3 contentViewControllerWithDictionary:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dynamicViewController:contentViewControllerWithDictionary:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dynamicViewController:contentViewWithDictionary:frame:", v14, v10, x, y, width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forwarding carrier link result to delegate", (uint8_t *)&v17, 0x16u);

    }
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dynamicViewController:didFinishCarrierLinkingWithResult:error:", v16, v7, v8);

  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dynamicViewController:didFinishPurchaseWithResult:error:", v11, v12, v7);

  }
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dynamicViewController:didFinishWithPurchaseResult:error:", v11, v12, v7);

  }
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dynamicViewController:didResolveWithResult:error:", v11, v12, v7);

  }
}

- (BOOL)dynamicViewController:(id)a3 handleDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;

  v7 = a4;
  v8 = a5;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewControllerDelegateProxy dynamicViewController](self, "dynamicViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "dynamicViewController:handleDelegateAction:completionHandler:", v12, v7, v8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AMSUIDynamicViewControllerDelegateProxy delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dynamicViewControllerShouldDismiss:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (AMSUIDynamicViewControllerDelegate)delegate
{
  return (AMSUIDynamicViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSUIDynamicViewController)dynamicViewController
{
  return (AMSUIDynamicViewController *)objc_loadWeakRetained((id *)&self->_dynamicViewController);
}

- (void)setDynamicViewController:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dynamicViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
