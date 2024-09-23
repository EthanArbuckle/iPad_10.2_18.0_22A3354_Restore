@implementation LNWeakProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained;
  void (**wrapper)(id, void *, id);
  void *v7;

  WeakRetained = objc_loadWeakRetained(&self->_value);
  if (WeakRetained)
  {
    wrapper = (void (**)(id, void *, id))self->_wrapper;
    if (wrapper)
    {
      NSStringFromSelector(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      wrapper[2](wrapper, v7, WeakRetained);

    }
  }
  return WeakRetained;
}

- (LNWeakProxy)initWithValue:(id)a3 wrapper:(id)a4
{
  id v6;
  LNWeakProxy *v7;
  void *v8;
  id wrapper;
  LNWeakProxy *v10;

  v6 = a4;
  v7 = -[LNWeakProxy initWithValue:](self, "initWithValue:", a3);
  if (v7)
  {
    v8 = _Block_copy(v6);
    wrapper = v7->_wrapper;
    v7->_wrapper = v8;

    v10 = v7;
  }

  return v7;
}

- (LNWeakProxy)initWithValue:(id)a3
{
  id v4;
  LNWeakProxy *v5;
  LNWeakProxy *v6;
  LNWeakProxy *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNWeakProxy;
  v5 = -[LNWeakProxy init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_value, v4);
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_value);
  objc_storeStrong(&self->_wrapper, 0);
}

- (id)value
{
  return objc_loadWeakRetained(&self->_value);
}

@end
