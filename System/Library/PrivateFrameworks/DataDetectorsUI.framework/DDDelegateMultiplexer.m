@implementation DDDelegateMultiplexer

- (DDDelegateMultiplexer)initWithDelegate:(id)a3 andDelegate:(id)a4
{
  NSObject **p_delegateA;
  id v7;

  p_delegateA = &self->_delegateA;
  v7 = a4;
  objc_storeWeak((id *)p_delegateA, a3);
  objc_storeWeak((id *)&self->_delegateB, v7);

  return self;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSObject **p_delegateA;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  _BOOL4 v10;
  NSObject **p_delegateB;
  id v12;
  id v13;

  p_delegateA = &self->_delegateA;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained
    && (v7 = WeakRetained,
        v8 = objc_loadWeakRetained((id *)p_delegateA),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    p_delegateB = &self->_delegateB;
    v12 = objc_loadWeakRetained((id *)&self->_delegateB);
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)p_delegateB);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && !sel_isEqual(a3, sel_adaptivePresentationStyleForPresentationController_traitCollection_))
      {
        v10 = !sel_isEqual(a3, sel_adaptivePresentationStyleForPresentationController_);
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject **p_delegateB;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "selector");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegateA);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegateA);
      objc_msgSend(v15, "invokeWithTarget:", v8);

    }
  }
  p_delegateB = &self->_delegateB;
  v10 = objc_loadWeakRetained((id *)p_delegateB);
  if (v10)
  {
    v11 = v10;
    v12 = objc_loadWeakRetained((id *)p_delegateB);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_delegateB);
      objc_msgSend(v15, "invokeWithTarget:", v14);

    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegateB);
    objc_msgSend(v7, "methodSignatureForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  char v9;
  NSObject **p_delegateB;
  id v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegateA);
  if (WeakRetained
    && (v6 = WeakRetained,
        v7 = objc_loadWeakRetained((id *)&self->_delegateA),
        v8 = objc_msgSend(v7, "conformsToProtocol:", v4),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    p_delegateB = &self->_delegateB;
    v11 = objc_loadWeakRetained((id *)&self->_delegateB);
    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)p_delegateB);
      v9 = objc_msgSend(v12, "conformsToProtocol:", v4);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateB);
  objc_destroyWeak((id *)&self->_delegateA);
}

@end
