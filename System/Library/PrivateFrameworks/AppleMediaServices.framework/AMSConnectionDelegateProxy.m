@implementation AMSConnectionDelegateProxy

+ (id)proxyWithDelegate:(id)a3
{
  id v3;
  AMSConnectionDelegateProxy *v4;

  v3 = a3;
  v4 = objc_alloc_init(AMSConnectionDelegateProxy);
  -[AMSConnectionDelegateProxy setDelegate:](v4, "setDelegate:", v3);

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[AMSConnectionDelegateProxy delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AMSConnectionDelegateProxy delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "invokeWithTarget:", v4);

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
