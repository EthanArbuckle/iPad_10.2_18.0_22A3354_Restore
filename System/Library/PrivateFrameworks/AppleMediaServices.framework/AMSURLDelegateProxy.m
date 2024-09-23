@implementation AMSURLDelegateProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  -[AMSURLDelegateProxy session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AMSURLDelegateProxy session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSURLDelegateProxy delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[AMSURLDelegateProxy delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)AMSURLDelegateProxy;
      -[AMSURLDelegateProxy forwardingTargetForSelector:](&v11, sel_forwardingTargetForSelector_, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  -[AMSURLDelegateProxy session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[AMSURLDelegateProxy delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)AMSURLDelegateProxy;
      v6 = -[AMSURLDelegateProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
    }

  }
  return v6;
}

- (AMSURLSession)session
{
  return (AMSURLSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)invalidate
{
  -[AMSURLDelegateProxy setSession:](self, "setSession:", 0);
  -[AMSURLDelegateProxy setDelegate:](self, "setDelegate:", 0);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (AMSURLDelegateProxy)initWithSession:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AMSURLDelegateProxy *v8;
  AMSURLDelegateProxy *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLDelegateProxy;
  v8 = -[AMSURLDelegateProxy init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_session, v6);
    objc_storeWeak(&v9->_delegate, v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSURLDelegateProxy;
  -[AMSURLDelegateProxy methodSignatureForSelector:](&v5, sel_methodSignatureForSelector_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", "@:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
