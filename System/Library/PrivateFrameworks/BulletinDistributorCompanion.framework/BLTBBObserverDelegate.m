@implementation BLTBBObserverDelegate

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "noteServerConnectionStateChanged:", v4);

}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTBBObserverDelegate forwarding transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTBBObserverDelegate actualDelegate](self, "actualDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selector");
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[BLTBBObserverDelegate actualDelegate](self, "actualDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v8);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BLTBBObserverDelegate;
    -[BLTBBObserverDelegate forwardInvocation:](&v9, sel_forwardInvocation_, v4);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLTBBObserverDelegate;
  if (-[BLTBBObserverDelegate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[BLTBBObserverDelegate actualDelegate](self, "actualDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v4;
  char isKindOfClass;

  if ((Class)objc_opt_class() == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[BLTBBObserverDelegate actualDelegate](self, "actualDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BLTBBObserverDelegate;
  -[BLTBBObserverDelegate methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[BLTBBObserverDelegate actualDelegate](self, "actualDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BBObserverDelegate)actualDelegate
{
  return (BBObserverDelegate *)objc_loadWeakRetained((id *)&self->_actualDelegate);
}

- (void)setActualDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actualDelegate, a3);
}

- (BLTBBObserverDelegateDelegate)delegate
{
  return (BLTBBObserverDelegateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_actualDelegate);
}

@end
