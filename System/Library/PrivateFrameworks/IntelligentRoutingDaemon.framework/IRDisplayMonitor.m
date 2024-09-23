@implementation IRDisplayMonitor

void __24__IRDisplayMonitor_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didUpdateMainDisplayLayout:", v4);

}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (BOOL)displayLocked
{
  return self->_displayLocked;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (void)setDisplayLocked:(BOOL)a3
{
  self->_displayLocked = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setAppInFocus:(id)a3
{
  objc_storeStrong((id *)&self->_appInFocus, a3);
}

- (IRDisplayMonitor)init
{
  IRDisplayMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IRDisplayMonitor;
  v2 = -[IRDisplayMonitor init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRDisplayMonitor setObservers:](v2, "setObservers:", v3);

    -[IRDisplayMonitor setLock:](v2, "setLock:", 0);
    objc_initWeak(&location, v2);
    v4 = (void *)MEMORY[0x24BE38438];
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __24__IRDisplayMonitor_init__block_invoke;
    v18[3] = &unk_251044E20;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v5, "setTransitionHandler:", v18);
    objc_destroyWeak(&v19);
    objc_msgSend(v4, "monitorWithConfiguration:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRDisplayMonitor setDefaultMainDisplayMonitor:](v2, "setDefaultMainDisplayMonitor:", v7);

    -[IRDisplayMonitor defaultMainDisplayMonitor](v2, "defaultMainDisplayMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRDisplayMonitor _didUpdateMainDisplayLayout:](v2, "_didUpdateMainDisplayLayout:", v9);

    v10 = (void *)MEMORY[0x24BE38438];
    objc_msgSend(MEMORY[0x24BE38448], "configurationForContinuityDisplay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __24__IRDisplayMonitor_init__block_invoke_2;
    v16[3] = &unk_251044E20;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "setTransitionHandler:", v16);
    objc_destroyWeak(&v17);
    objc_msgSend(v10, "monitorWithConfiguration:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRDisplayMonitor setContinuityDisplayMonitor:](v2, "setContinuityDisplayMonitor:", v12);

    -[IRDisplayMonitor continuityDisplayMonitor](v2, "continuityDisplayMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRDisplayMonitor _didUpdateContinuityDisplay:](v2, "_didUpdateContinuityDisplay:", v14);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__IRDisplayMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didUpdateContinuityDisplay:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[IRDisplayMonitor defaultMainDisplayMonitor](self, "defaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[IRDisplayMonitor continuityDisplayMonitor](self, "continuityDisplayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)IRDisplayMonitor;
  -[IRDisplayMonitor dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRDisplayMonitor observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    -[IRDisplayMonitor observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRDisplayMonitor observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) != 0)
  {
    -[IRDisplayMonitor observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)getAppInFocus
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRDisplayMonitor appInFocus](self, "appInFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_didUpdateMainDisplayLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[IRDisplayMonitor appInFocus](self, "appInFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstWhere:", &__block_literal_global_15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRDisplayMonitor setAppInFocus:](self, "setAppInFocus:", v8);

  LODWORD(v6) = -[IRDisplayMonitor displayOn](self, "displayOn");
  -[IRDisplayMonitor setDisplayOn:](self, "setDisplayOn:", objc_msgSend(v4, "displayBacklightLevel") > 0);
  if ((_DWORD)v6 != -[IRDisplayMonitor displayOn](self, "displayOn"))
  {
    v9 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[IRDisplayMonitor displayOn](self, "displayOn");
      v11 = CFSTR("off");
      if (v10)
        v11 = CFSTR("on");
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "#display-monitor, Display: %@", buf, 0xCu);
    }

  }
  v12 = -[IRDisplayMonitor displayLocked](self, "displayLocked");
  objc_msgSend(v4, "elements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstWhere:", &__block_literal_global_10_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRDisplayMonitor setDisplayLocked:](self, "setDisplayLocked:", v14 != 0);

  if (v12 == -[IRDisplayMonitor displayLocked](self, "displayLocked"))
  {
    v18 = 0;
  }
  else
  {
    v15 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[IRDisplayMonitor displayLocked](self, "displayLocked");
      v17 = CFSTR("unlocked");
      if (v16)
        v17 = CFSTR("locked");
      *(_DWORD *)buf = 138412290;
      v36 = v17;
      _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_DEFAULT, "#display-monitor, Display: %@", buf, 0xCu);
    }

    v18 = -[IRDisplayMonitor displayLocked](self, "displayLocked") ^ 1;
  }
  +[IRPreferences shared](IRPreferences, "shared");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bannersFromScreenUnlockToAppInFocusEnable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "BOOLValue"))
  {
    v21 = -[IRDisplayMonitor displayLocked](self, "displayLocked");

    if (v21)
      -[IRDisplayMonitor setAppInFocus:](self, "setAppInFocus:", 0);
  }
  else
  {

  }
  -[IRDisplayMonitor appInFocus](self, "appInFocus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v5, "isEqual:", v22);

  if ((v23 & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[IRDisplayMonitor observers](self, "observers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[IRDisplayMonitor appInFocus](self, "appInFocus");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "monitor:didUpdateAppInFocus:isScreenUnlockEvent:", self, v29, v18);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v25);
    }

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __48__IRDisplayMonitor__didUpdateMainDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v2, "layoutRole") == 1)
    v4 = objc_msgSend(v2, "isUIApplicationElement");
  else
    v4 = 0;

  return v4;
}

uint64_t __48__IRDisplayMonitor__didUpdateMainDisplayLayout___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x24BE38278]);

  return v3;
}

- (void)_didUpdateContinuityDisplay:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[IRDisplayMonitor isContinuityDisplay](self, "isContinuityDisplay");
  objc_msgSend(v4, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRDisplayMonitor setIsContinuityDisplay:](self, "setIsContinuityDisplay:", v7 != 0);

  if (v5 != -[IRDisplayMonitor isContinuityDisplay](self, "isContinuityDisplay"))
  {
    v8 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[IRDisplayMonitor isContinuityDisplay](self, "isContinuityDisplay");
      v10 = CFSTR("off");
      if (v9)
        v10 = CFSTR("on");
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_DEFAULT, "#display-monitor, Continuity Display: %@", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[IRDisplayMonitor observers](self, "observers", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "monitor:didUpdateIsContinuityDisplay:", self, -[IRDisplayMonitor isContinuityDisplay](self, "isContinuityDisplay"));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)isContinuityDisplay
{
  return self->_isContinuityDisplay;
}

- (void)setIsContinuityDisplay:(BOOL)a3
{
  self->_isContinuityDisplay = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (FBSDisplayLayoutMonitor)defaultMainDisplayMonitor
{
  return self->_defaultMainDisplayMonitor;
}

- (void)setDefaultMainDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMainDisplayMonitor, a3);
}

- (FBSDisplayLayoutMonitor)continuityDisplayMonitor
{
  return self->_continuityDisplayMonitor;
}

- (void)setContinuityDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocus, 0);
  objc_storeStrong((id *)&self->_continuityDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_defaultMainDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
