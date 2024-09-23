@implementation IMSingletonProxy

- (BOOL)__isSingletonProxy__im
{
  return 1;
}

+ (void)initialize
{
  if ((byte_1EE5041D1 & 1) == 0)
  {
    byte_1EE5041D1 = 1;
    if (NSClassFromString(CFSTR("XCTestCase")))
      IMSetAlwaysUseSingletonProxies(1);
  }
}

- (id)singletonRef
{
  return self->_singleton;
}

- (id)singletonOverrideRef
{
  return objc_loadWeakRetained(&self->_singletonOverride);
}

- (IMSingletonProxy)initWithSingleton:(id)a3 singletonOverride:(id)a4
{
  id v6;

  objc_storeStrong(&self->_singleton, a3);
  v6 = a4;
  -[IMSingletonProxy setSingletonOverride:](self, "setSingletonOverride:", v6);

  return self;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id singleton;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (!WeakRetained)
  {
    singleton = self->_singleton;
LABEL_5:
    v6 = v8;
    goto LABEL_10;
  }
  v5 = objc_msgSend(v8, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v8;
    singleton = WeakRetained;
LABEL_10:
    objc_msgSend(v6, "setTarget:", singleton);
    objc_msgSend(v8, "invoke");
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = v8;
    singleton = self->_singleton;
    goto LABEL_10;
  }
  if (objc_msgSend(WeakRetained, "shouldInvokeSelector:onSingleton:", v5, self->_singleton))
  {
    singleton = self->_singleton;
    goto LABEL_5;
  }
LABEL_11:

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id *p_singletonOverride;
  id WeakRetained;
  NSObject *v7;
  id singleton;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  p_singletonOverride = &self->_singletonOverride;
  WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (!WeakRetained && self->_overrideClass)
  {
    IMLogHandleForCategory("IMSingletonLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_19E36E550(&self->_overrideClass);

    self->_overrideClass = 0;
  }
  singleton = self->_singleton;
  if (!singleton
    || (objc_msgSend(singleton, "methodSignatureForSelector:", a3),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    && (objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = objc_loadWeakRetained(p_singletonOverride);

    if (!v10
      || (v11 = objc_loadWeakRetained(p_singletonOverride),
          objc_msgSend(v11, "methodSignatureForSelector:", a3),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v9))
    {
      v13.receiver = self;
      v13.super_class = (Class)IMSingletonProxy;
      -[IMSingletonProxy methodSignatureForSelector:](&v13, sel_methodSignatureForSelector_, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (void)setSingletonOverride:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *overrideClass;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didOverrideSingleton:", 0);
  v6 = objc_storeWeak(&self->_singletonOverride, v4);

  if (v4)
  {
    v7 = objc_loadWeakRetained(&self->_singletonOverride);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained(&self->_singletonOverride);
      objc_msgSend(v9, "didOverrideSingleton:", self->_singleton);

    }
    v10 = objc_loadWeakRetained(&self->_singletonOverride);
    self->_overrideClass = (Class)objc_opt_class();

    IMLogHandleForCategory("IMSingletonLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_19E36E698(self);
  }
  else
  {
    overrideClass = self->_overrideClass;
    self->_overrideClass = 0;
    IMLogHandleForCategory("IMSingletonLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_19E36E5CC(overrideClass, (uint64_t)self, v11);
  }

}

- (id)description
{
  id *p_singletonOverride;
  id WeakRetained;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;

  p_singletonOverride = &self->_singletonOverride;
  WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained(p_singletonOverride);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("IMSingletonProxy: singleton class: %@ overridden by class: %@"), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("IMSingletonProxy: singleton class: %@ not overridden"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_singletonOverride);
  objc_storeStrong(&self->_singleton, 0);
}

@end
