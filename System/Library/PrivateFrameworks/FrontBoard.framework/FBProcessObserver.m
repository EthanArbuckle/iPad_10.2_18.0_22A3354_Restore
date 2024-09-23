@implementation FBProcessObserver

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (void)applicationProcessDidLaunch:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      -[FBProcessObserver applicationProcessWillLaunch:](self, "applicationProcessWillLaunch:", v5);
      if (self->_supportsApplicationDidLaunch
        && (BSAtomicGetFlag() & 1) == 0
        && objc_msgSend(v5, "isApplicationProcess"))
      {
        objc_msgSend(WeakRetained, "applicationProcessDidLaunch:", v5);
      }
    }

  }
}

- (void)applicationProcessWillLaunch:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (self->_supportsApplicationWillLaunch
      && (BSAtomicGetFlag() & 1) == 0
      && WeakRetained
      && objc_msgSend(v5, "isApplicationProcess"))
    {
      objc_msgSend(WeakRetained, "applicationProcessWillLaunch:", v5);
    }

  }
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (self->_supportsStateDidChange && (BSAtomicGetFlag() & 1) == 0 && WeakRetained)
    objc_msgSend(WeakRetained, "process:stateDidChangeFromState:toState:", v11, v8, v9);

}

- (FBProcessObserver)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  FBProcessObserver *v7;
  FBProcessObserver *v8;
  FBProcessObserver *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)FBProcessObserver;
    v7 = -[FBProcessObserver init](&v11, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeWeak((id *)&v7->_observer, v6);
      v8->_observerAddress = (unint64_t)v6;
      v8->_observerClass = (Class)objc_opt_class();
      v8->_supportsWillExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsDidExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsStateDidChange = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDidExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationWillLaunch = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDidLaunch = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDebugState = objc_opt_respondsToSelector() & 1;
    }

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBProcessObserver initWithObserver:].cold.1(a2, (uint64_t)self, (uint64_t)v10);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (FBProcessObserver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  FBProcessObserver *v4;
  BOOL v5;
  id WeakRetained;
  id v8;

  v4 = (FBProcessObserver *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_observerAddress == self->_observerAddress
      && v4->_observerClass == self->_observerClass)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      v8 = objc_loadWeakRetained((id *)&self->_observer);
      v5 = WeakRetained == v8;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)invalidate
{
  BSAtomicSetFlag();
}

- (void)processWillExit:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    v5 = WeakRetained;
    if (WeakRetained && self->_supportsWillExit)
      objc_msgSend(WeakRetained, "processWillExit:", v6);

  }
}

- (void)processDidExit:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      if (self->_supportsApplicationDidExit && objc_msgSend(v6, "isApplicationProcess"))
      {
        objc_msgSend(v6, "exitContext");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationProcessDidExit:withContext:", v6, v5);

      }
      if (self->_supportsDidExit)
        objc_msgSend(WeakRetained, "processDidExit:", v6);
    }

  }
}

- (void)applicationProcessDebuggingStateDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_supportsApplicationDebugState)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "isApplicationProcess");
    v5 = v8;
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      objc_msgSend(WeakRetained, "applicationProcessDebuggingStateDidChange:", v8);

      v5 = v8;
    }
  }

}

- (FBProcessObserver)observer
{
  return (FBProcessObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithObserver:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBProcessObserver.m");
  v16 = 1024;
  v17 = 34;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
