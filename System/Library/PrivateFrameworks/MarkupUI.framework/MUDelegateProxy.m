@implementation MUDelegateProxy

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained(&self->_secondDelegate);
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = objc_loadWeakRetained(&self->_secondDelegate);
    objc_msgSend(v9, "methodSignatureForSelector:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  if (WeakRetained)
  {
    objc_msgSend(v6, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "invokeWithTarget:", WeakRetained);
  }
  v5 = objc_loadWeakRetained(&self->_secondDelegate);
  if (v5)
  {
    objc_msgSend(v6, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "invokeWithTarget:", v5);
  }

}

- (id)firstDelegate
{
  return objc_loadWeakRetained(&self->_firstDelegate);
}

- (void)setFirstDelegate:(id)a3
{
  objc_storeWeak(&self->_firstDelegate, a3);
}

- (id)secondDelegate
{
  return objc_loadWeakRetained(&self->_secondDelegate);
}

- (void)setSecondDelegate:(id)a3
{
  objc_storeWeak(&self->_secondDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_secondDelegate);
  objc_destroyWeak(&self->_firstDelegate);
}

@end
