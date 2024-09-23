@implementation AMSUIWebDelegateProxy

- (AMSUIWebDelegateProxy)initWithDelegate:(id)a3
{
  id v4;
  AMSUIWebDelegateProxy *v5;
  AMSUIWebDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebDelegateProxy;
  v5 = -[AMSUIWebDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_delegate, v4);

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  objc_super v9;

  -[AMSUIWebDelegateProxy delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AMSUIWebDelegateProxy delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AMSUIWebDelegateProxy;
    -[AMSUIWebDelegateProxy forwardingTargetForSelector:](&v9, sel_forwardingTargetForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  -[AMSUIWebDelegateProxy delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUIWebDelegateProxy;
    v6 = -[AMSUIWebDelegateProxy respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIWebDelegateProxy;
  -[AMSUIWebDelegateProxy methodSignatureForSelector:](&v5, sel_methodSignatureForSelector_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", "@:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
