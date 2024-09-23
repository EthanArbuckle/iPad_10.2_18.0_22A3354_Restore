@implementation QLDelegateProxy

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
  void *v5;
  id v6;
  char v7;
  id v8;
  id *p_secondDelegate;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_firstDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained(&self->_firstDelegate);
    objc_msgSend(v15, "selector");
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_firstDelegate);
      objc_msgSend(v15, "invokeWithTarget:", v8);

    }
  }
  p_secondDelegate = &self->_secondDelegate;
  v10 = objc_loadWeakRetained(p_secondDelegate);
  if (v10)
  {
    v11 = v10;
    v12 = objc_loadWeakRetained(p_secondDelegate);
    objc_msgSend(v15, "selector");
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained(p_secondDelegate);
      objc_msgSend(v15, "invokeWithTarget:", v14);

    }
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
