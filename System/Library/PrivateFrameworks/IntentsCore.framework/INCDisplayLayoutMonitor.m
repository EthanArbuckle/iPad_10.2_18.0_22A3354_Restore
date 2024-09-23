@implementation INCDisplayLayoutMonitor

- (INCDisplayLayoutMonitor)init
{
  INCDisplayLayoutMonitor *v2;
  INCDisplayLayoutMonitor *v3;
  FBSDisplayMonitor *v4;
  FBSDisplayMonitor *displayMonitor;
  FBSDisplayMonitor *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *layoutMonitorsByIdentity;
  NSObject *v9;
  INCDisplayLayoutMonitor *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)INCDisplayLayoutMonitor;
  v2 = -[INCDisplayLayoutMonitor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[INCDisplayLayoutMonitor shouldObserveMultipleDisplays](v2, "shouldObserveMultipleDisplays"))
    {
      v4 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x1E0D23100]);
      displayMonitor = v3->_displayMonitor;
      v3->_displayMonitor = v4;
      v6 = v4;

      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      layoutMonitorsByIdentity = v3->_layoutMonitorsByIdentity;
      v3->_layoutMonitorsByIdentity = v7;

    }
    else
    {
      v9 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[INCDisplayLayoutMonitor init]";
        _os_log_fault_impl(&dword_1B727D000, v9, OS_LOG_TYPE_FAULT, "%s Process is using INCDisplayLayoutMonitor but doesn't have access to the render server — multiple display observing will not work", buf, 0xCu);
      }
    }
    v3->_lock._os_unfair_lock_opaque = 0;
    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[INCDisplayLayoutMonitor lock_invalidate](self, "lock_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)INCDisplayLayoutMonitor;
  -[INCDisplayLayoutMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldObserveMultipleDisplays
{
  _BOOL4 v3;

  v3 = -[INCDisplayLayoutMonitor hasRenderServerAccess](self, "hasRenderServerAccess");
  if (v3)
    LOBYTE(v3) = -[INCDisplayLayoutMonitor platformSupportsMultipleDisplays](self, "platformSupportsMultipleDisplays");
  return v3;
}

- (BOOL)hasRenderServerAccess
{
  getpid();
  return sandbox_check() == 0;
}

- (BOOL)platformSupportsMultipleDisplays
{
  return 1;
}

- (void)lock_resume
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  FBSDisplayLayoutMonitor *v10;
  FBSDisplayLayoutMonitor *singleDisplayLayoutMonitor;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v3 = MEMORY[0x1E0C809B0];
  v24 = *MEMORY[0x1E0C80C00];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__INCDisplayLayoutMonitor_lock_resume__block_invoke;
  v22[3] = &unk_1E6BC42F8;
  v22[4] = self;
  -[INCDisplayLayoutMonitor executeBlockWithLock:](self, "executeBlockWithLock:", v22);
  if (-[INCDisplayLayoutMonitor shouldObserveMultipleDisplays](self, "shouldObserveMultipleDisplays"))
  {
    -[INCDisplayLayoutMonitor displayMonitor](self, "displayMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", self);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[INCDisplayLayoutMonitor displayMonitor](self, "displayMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedIdentities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          -[INCDisplayLayoutMonitor lock_startLayoutMonitorForDisplay:](self, "lock_startLayoutMonitorForDisplay:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUserInteractivePriority:", 1);
    objc_initWeak(&location, self);
    v12 = v3;
    v13 = 3221225472;
    v14 = __38__INCDisplayLayoutMonitor_lock_resume__block_invoke_2;
    v15 = &unk_1E6BC4320;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v6, "setTransitionHandler:", &v12);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v6, v12, v13, v14, v15);
    v10 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
    singleDisplayLayoutMonitor = self->_singleDisplayLayoutMonitor;
    self->_singleDisplayLayoutMonitor = v10;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)lock_invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__INCDisplayLayoutMonitor_lock_invalidate__block_invoke;
  v2[3] = &unk_1E6BC42F8;
  v2[4] = self;
  -[INCDisplayLayoutMonitor executeBlockWithLock:](self, "executeBlockWithLock:", v2);
}

- (id)lock_currentDisplayLayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!-[INCDisplayLayoutMonitor lock_alive](self, "lock_alive"))
    -[INCDisplayLayoutMonitor resume](self, "resume");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__320;
  v14 = __Block_byref_object_dispose__321;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[INCDisplayLayoutMonitor shouldObserveMultipleDisplays](self, "shouldObserveMultipleDisplays"))
  {
    -[INCDisplayLayoutMonitor lock_layoutMonitorsByIdentity](self, "lock_layoutMonitorsByIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__INCDisplayLayoutMonitor_lock_currentDisplayLayouts__block_invoke;
    v9[3] = &unk_1E6BC40D0;
    v9[4] = &v10;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  }
  else
  {
    -[INCDisplayLayoutMonitor singleDisplayLayoutMonitor](self, "singleDisplayLayoutMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "displayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && v6)
      objc_msgSend((id)v11[5], "setObject:forKey:", v3, v6);

  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)lock_startLayoutMonitorForDisplay:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isMainDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v8 = (void *)v5;
    if (v5)
      goto LABEL_11;
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isExternal"))
  {
    if (objc_msgSend(v4, "isCarDisplay"))
    {
      CarPlayServicesLibrary();
      objc_msgSend(MEMORY[0x1E0D230E0], "configurationForCarDisplayMonitor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isCarInstrumentsDisplay"))
        goto LABEL_12;
      CarPlayServicesLibrary();
      objc_msgSend(MEMORY[0x1E0D230E0], "configurationForCarInstrumentsDisplayMonitor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x1E0D230E0];
  SBSCreateLayoutServiceEndpointForExternalDisplay();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithEndpoint:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_11:
    objc_msgSend(v8, "setNeedsUserInteractivePriority:", 1);
    objc_initWeak((id *)location, self);
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke;
    v17[3] = &unk_1E6BC40F8;
    objc_copyWeak(&v19, (id *)location);
    v10 = v4;
    v18 = v10;
    objc_msgSend(v8, "setTransitionHandler:", v17);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke_2;
    v14[3] = &unk_1E6BC4120;
    v14[4] = self;
    v15 = v10;
    v12 = v11;
    v16 = v12;
    -[INCDisplayLayoutMonitor executeBlockWithLock:](self, "executeBlockWithLock:", v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);

    goto LABEL_14;
  }
LABEL_12:
  v13 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[INCDisplayLayoutMonitor lock_startLayoutMonitorForDisplay:]";
    v21 = 2112;
    v22 = v4;
    _os_log_error_impl(&dword_1B727D000, v13, OS_LOG_TYPE_ERROR, "%s Unable to start layout monitoring for display because there wasn't a suitable configuration available: %@", location, 0x16u);
  }
LABEL_14:

}

- (BOOL)alive
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_alive;
}

- (NSMutableDictionary)layoutMonitorsByIdentity
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_layoutMonitorsByIdentity;
}

- (void)setLayoutMonitorsByIdentity:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *layoutMonitorsByIdentity;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  layoutMonitorsByIdentity = self->_layoutMonitorsByIdentity;
  self->_layoutMonitorsByIdentity = v4;

}

- (BOOL)lock_alive
{
  INCDisplayLayoutMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[INCDisplayLayoutMonitor alive](v2, "alive");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)lock_layoutMonitorsByIdentity
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[INCDisplayLayoutMonitor layoutMonitorsByIdentity](self, "layoutMonitorsByIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)executeBlockWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  -[INCDisplayLayoutMonitor lock_startLayoutMonitorForDisplay:](self, "lock_startLayoutMonitorForDisplay:", a4);
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__INCDisplayLayoutMonitor_displayMonitor_willDisconnectIdentity___block_invoke;
  v7[3] = &unk_1E6BC41E0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[INCDisplayLayoutMonitor executeBlockWithLock:](self, "executeBlockWithLock:", v7);

}

- (id)transitionHandler
{
  return self->_transitionHandler;
}

- (void)setTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setAlive:(BOOL)a3
{
  self->_alive = a3;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (FBSDisplayLayoutMonitor)singleDisplayLayoutMonitor
{
  return self->_singleDisplayLayoutMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong(&self->_transitionHandler, 0);
  objc_storeStrong((id *)&self->_layoutMonitorsByIdentity, 0);
}

void __65__INCDisplayLayoutMonitor_displayMonitor_willDisconnectIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "transitionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    objc_msgSend(WeakRetained, "transitionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, id, id))v11)[2](v11, v12, *(_QWORD *)(a1 + 32), v7, v8);

  }
}

void __61__INCDisplayLayoutMonitor_lock_startLayoutMonitorForDisplay___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __53__INCDisplayLayoutMonitor_lock_currentDisplayLayouts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v5, "currentLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

void __42__INCDisplayLayoutMonitor_lock_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAlive:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldObserveMultipleDisplays"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "invalidate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "layoutMonitorsByIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "displayMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "displayMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "singleDisplayLayoutMonitor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

  }
}

uint64_t __38__INCDisplayLayoutMonitor_lock_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlive:", 1);
}

void __38__INCDisplayLayoutMonitor_lock_resume__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transitionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    objc_msgSend(WeakRetained, "transitionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, id, id))v11)[2](v11, v14, v13, v7, v8);

  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
