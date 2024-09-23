@implementation FBSceneObserver

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  FBSceneObserver **p_observer;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  if (self->_observerFlags.clientSettingsUpdatedLEGACY)
  {
    p_observer = &self->_observer;
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v13, v12, v11, v10);

  }
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  FBSceneObserver **p_observer;
  id v6;
  id v7;
  id WeakRetained;

  if (self->_observerFlags.updatePreparedLEGACY)
  {
    p_observer = &self->_observer;
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "scene:didPrepareUpdateWithContext:", v7, v6);

  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_observerFlags.updateAppliedLEGACY && !self->_observerFlags.didUpdateSettings)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(WeakRetained, "scene:didApplyUpdateWithContext:", v8, v6);

  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  FBSceneObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if (self->_observerFlags.updateCompletedLEGACY)
  {
    p_observer = &self->_observer;
    v8 = a5;
    v9 = a4;
    v10 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "scene:didCompleteUpdateWithContext:error:", v10, v9, v8);

  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  FBSceneObserver **p_observer;
  id v4;
  id WeakRetained;

  if (self->_observerFlags.contentStateDidChange)
  {
    p_observer = &self->_observer;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "sceneContentStateDidChange:", v4);

  }
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (self->_delegateFlags.willUpdateSettingsLEGACY)
  {
    -[FBSceneObserver delegate]((id *)&self->super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scene:willUpdateSettings:withTransitionContext:", v11, v8, v9);

  }
  else if (self->_componentFlags.willUpdateSettingsLEGACY)
  {
    -[FBSceneComponent scene:willUpdateSettings:withTransitionContext:](self->_component, "scene:willUpdateSettings:withTransitionContext:", v11, v8, v9);
  }

}

- (void)sceneDidActivate:(id)a3
{
  FBSceneObserver **p_observer;
  id v4;
  id WeakRetained;

  if (self->_observerFlags.didActivate)
  {
    p_observer = &self->_observer;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "sceneDidActivate:", v4);

  }
}

- (uint64_t)component
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (id)_initWithObserver:(id)a3
{
  id v4;
  FBSceneObserver *v5;
  FBSceneObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSceneObserver;
  v5 = -[FBSceneObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_observerAddress = (unint64_t)v4;
    v5->_observerClass = (Class)objc_opt_class();
    objc_storeWeak((id *)&v6->_observer, v4);
    v6->_observerFlags.contentStateDidChange = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didUpdateSettings = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updatePreparedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updateAppliedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updateCompletedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didUpdateClientSettings = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.clientSettingsUpdatedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willActivate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didActivate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willDeactivateWithError = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willDeactivateWithContext = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didInvalidate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didInvalidateWithContext = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.clientDidConnect = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.handleActions = objc_opt_respondsToSelector() & 1;
  }

  return v6;
}

- (void)initWithObserver:(void *)a1
{
  if (a1)
    return (void *)objc_msgSend(a1, "_initWithObserver:", a2);
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  FBSceneObserver *v4;
  BOOL v5;
  id WeakRetained;
  id v8;

  v4 = (FBSceneObserver *)a3;
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

- (id)observer
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (_BYTE)initWithDelegate:(_BYTE *)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "_initWithObserver:", v3);
    a1 = (_BYTE *)v4;
    if (v4)
    {
      *(_BYTE *)(v4 + 32) = 1;
      *(_BYTE *)(v4 + 48) = objc_opt_respondsToSelector() & 1;
      a1[49] = objc_opt_respondsToSelector() & 1;
      a1[50] = objc_opt_respondsToSelector() & 1;
      a1[51] = objc_opt_respondsToSelector() & 1;
      a1[52] = objc_opt_respondsToSelector() & 1;
    }
  }

  return a1;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (self->_delegateFlags.didReceiveActions)
  {
    v6 = a4;
    v7 = a3;
    -[FBSceneObserver delegate]((id *)&self->super.isa);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scene:didReceiveActions:", v7, v6);

  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 32))
      WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    else
      WeakRetained = 0;
  }
  return WeakRetained;
}

- (uint64_t)delegateReceivesActions
{
  uint64_t v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
        v1 = *(_BYTE *)(v1 + 50) != 0;
      else
        v1 = 0;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (_BYTE)initWithComponent:(_BYTE *)a1
{
  id v4;
  uint64_t v5;

  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend(a1, "_initWithObserver:", v4);
    a1 = (_BYTE *)v5;
    if (v5)
    {
      objc_storeStrong((id *)(v5 + 56), a2);
      a1[53] = objc_opt_respondsToSelector() & 1;
      a1[54] = objc_opt_respondsToSelector() & 1;
      a1[55] = objc_opt_respondsToSelector() & 1;
    }
  }

  return a1;
}

- (uint64_t)observerHandlesActions
{
  uint64_t v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
      v1 = *(_BYTE *)(v1 + 47) != 0;
    else
      v1 = 0;

  }
  return v1;
}

- (unint64_t)receiverImplementsWillUpdate
{
  if (result)
    return *(_BYTE *)(result + 49) || *(_BYTE *)(result + 54) || *(_BYTE *)(result + 48) || *(_BYTE *)(result + 53) != 0;
  return result;
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_delegateFlags.willUpdateSettings)
  {
    -[FBSceneObserver delegate]((id *)&self->super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scene:willUpdateSettings:", v11, v7);

  }
  else if (self->_componentFlags.willUpdateSettings)
  {
    -[FBSceneComponent scene:willUpdateSettings:](self->_component, "scene:willUpdateSettings:", v11, v6);
  }
  else
  {
    objc_msgSend(v6, "mutableSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSceneObserver scene:willUpdateSettings:withTransitionContext:](self, "scene:willUpdateSettings:withTransitionContext:", v11, v9, v10);

  }
}

- (void)sceneDidDeactivate:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[FBSceneObserver delegate]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (self->_delegateFlags.didDeactivateWithContext)
    {
      objc_msgSend(v7, "sceneDidDeactivate:withContext:", v10, v6);
    }
    else if (self->_delegateFlags.didDeactivateWithError)
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneDidDeactivate:withError:", v10, v9);

    }
  }

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("call sceneDidDeactivate:withContext:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneObserver.m");
    v21 = 1024;
    v22 = 218;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  FBSceneObserver **p_observer;
  id v6;
  id v7;
  id WeakRetained;

  if (self->_observerFlags.didUpdateSettings)
  {
    p_observer = &self->_observer;
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "scene:didUpdateSettings:", v7, v6);

  }
}

- (void)sceneWillActivate:(id)a3
{
  FBSceneObserver **p_observer;
  id v4;
  id WeakRetained;

  if (self->_observerFlags.willActivate)
  {
    p_observer = &self->_observer;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "sceneWillActivate:", v4);

  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSceneObserver *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("call sceneWillDeactivate:withContext:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSceneObserver.m");
    v21 = 1024;
    v22 = 274;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (self->_observerFlags.willDeactivateWithContext)
    {
      objc_msgSend(WeakRetained, "sceneWillDeactivate:withContext:", v10, v6);
    }
    else if (self->_observerFlags.willDeactivateWithError)
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneWillDeactivate:withError:", v10, v9);

    }
  }

}

- (void)sceneDidInvalidate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSceneObserver *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("call sceneDidInvalidate:withContext:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("FBSceneObserver.m");
    v18 = 1024;
    v19 = 291;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->_component && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[FBSceneComponent componentWillInvalidate:](self->_component, "componentWillInvalidate:", v8);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (self->_observerFlags.didInvalidateWithContext)
    {
      objc_msgSend(WeakRetained, "sceneDidInvalidate:withContext:", v11, v6);
    }
    else if (self->_observerFlags.didInvalidate)
    {
      objc_msgSend(WeakRetained, "sceneDidInvalidate:", v11);
    }
  }
  -[FBSceneComponent invalidate](self->_component, "invalidate");

}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  if (self->_observerFlags.didUpdateClientSettings)
  {
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(WeakRetained, "scene:didUpdateClientSettings:", v7, v6);
  }
  else
  {
    v8 = a4;
    v9 = a3;
    objc_msgSend(v8, "settingsDiff");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previousSettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[FBSceneObserver scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](self, "scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:", v9, WeakRetained, v7, v6);
  }

}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  FBSceneObserver **p_observer;
  id v6;
  id v7;
  id WeakRetained;

  if (self->_observerFlags.clientDidConnect)
  {
    p_observer = &self->_observer;
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "scene:clientDidConnect:", v7, v6);

  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_observerFlags.handleActions && objc_msgSend(v7, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(WeakRetained, "scene:handleActions:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)scene:(id)a3 handlePrivateActions:(id)a4
{
  id v6;
  id v7;
  FBSceneComponent *component;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  component = self->_component;
  if (component && self->_componentFlags.handlePrivateActions)
  {
    -[FBSceneComponent handlePrivateActions:](component, "handlePrivateActions:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBSceneObserver scene:handleActions:](self, "scene:handleActions:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (FBSceneObserver)initWithScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  FBSceneObserver *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  FBSceneObserver *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("called before this object is created"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("FBSceneObserver.m");
    v19 = 1024;
    v20 = 362;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (FBSceneObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
  -[FBSceneComponent invalidate](self->_component, "invalidate");
}

- (void)configureInitialSettings:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSceneObserver *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("called before this object is created"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("FBSceneObserver.m");
    v18 = 1024;
    v19 = 375;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)componentWillInvalidate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSceneObserver *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not handled by this object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("FBSceneObserver.m");
    v18 = 1024;
    v19 = 379;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (NSString)description
{
  return (NSString *)-[FBSceneObserver descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneObserver succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  id WeakRetained;
  id v7;

  if (self->_isDelegate)
  {
    v3 = CFSTR("delegate");
  }
  else if (self->_component)
  {
    v3 = CFSTR("component");
  }
  else
  {
    v3 = CFSTR("observer");
  }
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", WeakRetained, v4);

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  FBSceneObserver *v26;
  _QWORD v27[4];
  id v28;
  FBSceneObserver *v29;

  v4 = a3;
  -[FBSceneObserver descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  if (self->_isDelegate)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke;
    v27[3] = &unk_1E4A11FD0;
    v28 = v5;
    v29 = self;
    objc_msgSend(v28, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("delegate"), v4, v27);

  }
  if (self->_component)
  {
    v21 = v7;
    v22 = 3221225472;
    v23 = __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke_2;
    v24 = &unk_1E4A11FD0;
    v25 = v6;
    v26 = self;
    objc_msgSend(v25, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("component"), v4, &v21);

  }
  v8 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.didUpdateSettings, CFSTR("RespondsToDidUpdateSettings"), 1, v21, v22, v23, v24);
  v9 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.didUpdateClientSettings, CFSTR("RespondsToDidUpdateClientSettings"), 1);
  v10 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.updatePreparedLEGACY, CFSTR("RespondsToPrepared"), 1);
  v11 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.updateAppliedLEGACY, CFSTR("RespondsToApplied"), 1);
  v12 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.updateCompletedLEGACY, CFSTR("RespondsToCompleted"), 1);
  v13 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.didInvalidate, CFSTR("RespondsToInvalidated"), 1);
  v14 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.clientSettingsUpdatedLEGACY, CFSTR("RespondsToClientSettingsUpdated"), 1);
  v15 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.didActivate, CFSTR("RespondsToDidActivate"), 1);
  v16 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.willDeactivateWithError, CFSTR("RespondsToWillDeactivate"), 1);
  v17 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.clientDidConnect, CFSTR("RespondsToClientDidConnect"), 1);
  v18 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.handleActions, CFSTR("RespondsToHandleActions"), 1);
  objc_msgSend(v6, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("RespondsToWillUpdateSettingsWithTransitionContext"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 49), CFSTR("RespondsToWillUpdateSettings"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 50), CFSTR("RespondsToDidReceiveActions"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 51), CFSTR("RespondsToDidDeactivateWithError"), 1);
}

id __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 53), CFSTR("RespondsToWillUpdateSettingsWithTransitionContext"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 54), CFSTR("RespondsToWillUpdateSettings"), 1);
}

@end
