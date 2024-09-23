@implementation BKSApplicationStateMonitor

- (NSArray)interestedBundleIDs
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_interestedBundleIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)applicationInfoForPID:(int)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  int v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSApplicationStateMonitor.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v8 = (void *)MEMORY[0x1E0D87E18];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke;
  v11[3] = &unk_1E61698A0;
  v13 = a3;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "performBackgroundWork:", v11);

}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSApplicationStateMonitor;
  -[BKSApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id handler;
  RBSProcessMonitor *monitor;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  handler = self->_handler;
  self->_handler = 0;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id handler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  handler = self->_handler;
  self->_handler = v6;

  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(p_lock);
}

- (void)updateInterestedBundleIDs:(id)a3
{
  id v4;

  v4 = a3;
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:states:](self, "updateInterestedBundleIDs:states:", v4, -[BKSApplicationStateMonitor interestedStates](self, "interestedStates"));

}

- (void)updateInterestedBundleIDs:(id)a3 states:(unsigned int)a4
{
  NSArray *v7;
  NSArray *interestedBundleIDs;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSApplicationStateMonitor.m"), 159, CFSTR("bundleIDs must be an array"));

    }
  }
  os_unfair_lock_lock(&self->_lock);
  v7 = (NSArray *)objc_msgSend(v10, "copy");
  interestedBundleIDs = self->_interestedBundleIDs;
  self->_interestedBundleIDs = v7;

  self->_interestedStates = a4;
  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(&self->_lock);

}

- (unsigned)interestedStates
{
  BKSApplicationStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_interestedStates;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v3 = a2;
  objc_msgSend(v3, "setPredicates:", *(_QWORD *)(a1 + 32));
  RBSProcessLegacyStateDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateDescriptor:", v4);

  objc_msgSend(v3, "setServiceClass:", *(unsigned int *)(a1 + 56));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2;
    v5[3] = &unk_1E61698C8;
    objc_copyWeak(&v7, &location);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "setUpdateHandler:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v3, "setUpdateHandler:", 0);
  }

}

- (BKSApplicationStateMonitor)initWithEndpoint:(id)a3 bundleIDs:(id)a4 states:(unsigned int)a5 elevatedPriority:(BOOL)a6
{
  id v10;
  BKSApplicationStateMonitor *v11;
  RBSProcessMonitor *v12;
  RBSProcessMonitor *monitor;
  uint64_t v14;
  NSArray *interestedBundleIDs;
  void *v17;
  objc_super v18;

  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKSApplicationStateMonitor;
  v11 = -[BKSApplicationStateMonitor init](&v18, sel_init);
  if (v11)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("BKSApplicationStateMonitor.m"), 94, CFSTR("bundleIDs must be an array"));

      }
    }
    v11->_lock._os_unfair_lock_opaque = 0;
    v12 = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x1E0D87D90]);
    monitor = v11->_monitor;
    v11->_monitor = v12;

    v11->_elevatedPriority = a6;
    v14 = objc_msgSend(v10, "copy");
    interestedBundleIDs = v11->_interestedBundleIDs;
    v11->_interestedBundleIDs = (NSArray *)v14;

    v11->_interestedStates = a5;
  }

  return v11;
}

- (void)applicationInfoForApplication:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSApplicationStateMonitor.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = (void *)MEMORY[0x1E0D87E18];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke;
  v13[3] = &unk_1E6169878;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBackgroundWork:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_interestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_interestedAssertionReasons, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

- (unsigned)applicationStateForApplication:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[BKSApplicationStateMonitor applicationInfoForApplication:](self, "applicationInfoForApplication:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SBApplicationStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5;
}

void __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "applicationInfoForApplication:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "applicationInfoForPID:", *(unsigned int *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (unsigned)mostElevatedApplicationStateForPID:(int)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[BKSApplicationStateMonitor applicationInfoForPID:](self, "applicationInfoForPID:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SBMostElevatedStateForProcessID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5;
}

- (id)applicationInfoForPID:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 < 1)
  {
    v8 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D87D48];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legacyPredicateMatchingProcessIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSApplicationStateMonitor _legacyInfoForProcess:](self, "_legacyInfoForProcess:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)applicationInfoForApplication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D87D48], "legacyPredicateMatchingBundleIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSApplicationStateMonitor _legacyInfoForProcess:](self, "_legacyInfoForProcess:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_legacyInfoForProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  RBSProcessLegacyStateDescriptor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStateMatchingDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSApplicationStateMonitor _legacyInfoForProcess:state:](self, "_legacyInfoForProcess:state:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_clientSubscribedToThisStateChange:(id)a3 state:(id)a4 prevState:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  unsigned int interestedStates;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v8, v9);
  interestedStates = self->_interestedStates;
  if (v10)
  {
    v13 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v8, v10);
    v14 = self->_interestedStates & v13;
    if (v11 == v13)
    {
      objc_msgSend(v9, "process");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "pid");
      objc_msgSend(v10, "process");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16 != objc_msgSend(v17, "pid");

      goto LABEL_6;
    }
  }
  else
  {
    v14 = self->_interestedStates & 1;
  }
  v18 = 1;
LABEL_6:
  if (interestedStates & v11 | v14)
    v19 = v18;
  else
    v19 = 0;

  return v19;
}

- (unsigned)_legacyStateForProcess:(id)a3 state:(id)a4
{
  id v4;
  void *v5;
  int v6;
  unsigned int v7;

  v4 = a4;
  switch(objc_msgSend(v4, "taskState"))
  {
    case 1u:
      v7 = 1;
      break;
    case 2u:
    case 4u:
      objc_msgSend(v4, "endowmentNamespaces");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0D87E68]);

      if (v6)
        v7 = 8;
      else
        v7 = 4;
      break;
    case 3u:
      v7 = 2;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_legacyInfoForProcess:state:", v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!objc_msgSend(v10, "isRunning") || (objc_msgSend(v9, "isRunning") & 1) != 0)
      goto LABEL_18;
    objc_msgSend(v6, "lastExitContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "status");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "code");

    if (v14 > 3221229822)
    {
      if (v14 != 4227595259)
      {
        if (v14 == 3735943697)
        {
          v17 = 1;
          goto LABEL_16;
        }
        v15 = 3221229823;
        goto LABEL_14;
      }
    }
    else if (v14 != 732775916 && v14 != 1307235759)
    {
      v15 = 2343432205;
LABEL_14:
      if (v14 != v15)
      {
LABEL_17:

LABEL_18:
        objc_msgSend(v11, "objectForKey:", CFSTR("SBApplicationStateRunningReasonsKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(WeakRetained, "_clientSubscribedToThisStateChange:state:prevState:", v6, v9, v10) & 1) != 0
          || objc_msgSend(WeakRetained, "_clientSubscribedToThisReasonChange:", v19))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }

        goto LABEL_22;
      }
    }
    v17 = 5;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("BKSApplicationStateExitReasonKey"));

    goto LABEL_17;
  }
  rbs_shim_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v20 = 138543362;
    v21 = v6;
    _os_log_impl(&dword_1B0792000, v16, OS_LOG_TYPE_INFO, "Ignoring update for process: %{public}@", (uint8_t *)&v20, 0xCu);
  }

LABEL_22:
}

- (id)_legacyInfoForProcess:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v40;
  unsigned int v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  unsigned int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[16];
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddedApplicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "xpcServiceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v11 = v12;
    }
    else
    {
      objc_msgSend(v6, "bundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  if (v6 && v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v8, "isXPCService");
    if (v46)
    {
      objc_msgSend(v8, "hostIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rbs_pid");

    }
    else
    {
      v17 = 0;
    }
    v19 = -[BKSApplicationStateMonitor _legacyStateForProcess:state:](self, "_legacyStateForProcess:state:", v6, v7);
    objc_msgSend(v7, "assertions");
    v18 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v18, "count"))
    {
      v40 = v19;
      v41 = v17;
      v42 = v15;
      v43 = v8;
      v44 = v7;
      v45 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v21 = v18;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v48 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v26, "reason"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "explanation");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            if (v27)
              v30 = v28 == 0;
            else
              v30 = 1;
            if (!v30)
            {
              v52[0] = CFSTR("SBApplicationStateRunningReasonAssertionReasonKey");
              v52[1] = CFSTR("SBApplicationStateRunningReasonAssertionIdentifierKey");
              v53[0] = v27;
              v53[1] = v28;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v31);

            }
          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        }
        while (v23);
      }

      v15 = v42;
      if (objc_msgSend(v20, "count"))
        objc_msgSend(v42, "setObject:forKey:", v20, CFSTR("SBApplicationStateRunningReasonsKey"));

      v7 = v44;
      v6 = v45;
      v8 = v43;
      v19 = v40;
      v17 = v41;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v32, CFSTR("SBApplicationStateKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v33, CFSTR("SBMostElevatedStateForProcessID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_DWORD)v19 == 8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v34, CFSTR("BKSApplicationStateAppIsFrontmost"));

    objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("SBApplicationStateDisplayIDKey"));
    v35 = objc_msgSend(v6, "pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35 & ~(v35 >> 31));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v36, CFSTR("SBApplicationStateProcessIDKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v37, CFSTR("BKSApplicationStateExtensionKey"));

    if ((int)v17 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v38, CFSTR("BKSApplicationStateHostPIDKey"));

    }
  }
  else
  {
    rbs_shim_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0792000, v18, OS_LOG_TYPE_INFO, "BKSApplicationStateMonitor resolved state as not running with no bundleID", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)bundleInfoValueForKey:(id)a3 PID:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D87D68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleForIdentifier:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C9AE78]);
  objc_msgSend(v8, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v7)
    objc_msgSend(v9, "identifier");
  else
    objc_msgSend(v9, "bundleInfoValueForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_clientSubscribedToThisReasonChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_interestedAssertionReasons)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKey:", CFSTR("SBApplicationStateRunningReasonAssertionReasonKey"), (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSArray containsObject:](self->_interestedAssertionReasons, "containsObject:", v11);

          if (v12)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)lock_updateConfiguration
{
  void *v3;
  NSArray *interestedBundleIDs;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  RBSProcessMonitor *monitor;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  BKSApplicationStateMonitor *v18;
  id v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  interestedBundleIDs = self->_interestedBundleIDs;
  if (interestedBundleIDs)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = interestedBundleIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0D87D48], "legacyPredicateMatchingBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D87D48], "legacyPredicate");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);
  }

  if (self->_elevatedPriority)
    v11 = 25;
  else
    v11 = 17;
  v12 = (void *)MEMORY[0x1B5E0B334](self->_handler);
  monitor = self->_monitor;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke;
  v16[3] = &unk_1E61698F0;
  v20 = v11;
  v18 = self;
  v19 = v12;
  v17 = v3;
  v14 = v12;
  v15 = v3;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v16);

}

- (BKSApplicationStateMonitor)init
{
  return -[BKSApplicationStateMonitor initWithBundleIDs:states:elevatedPriority:](self, "initWithBundleIDs:states:elevatedPriority:", 0, 0xFFFFFFFFLL, 0);
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5
{
  return -[BKSApplicationStateMonitor initWithEndpoint:bundleIDs:states:elevatedPriority:](self, "initWithEndpoint:bundleIDs:states:elevatedPriority:", 0, a3, *(_QWORD *)&a4, a5);
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4
{
  return -[BKSApplicationStateMonitor initWithBundleIDs:states:elevatedPriority:](self, "initWithBundleIDs:states:elevatedPriority:", a3, *(_QWORD *)&a4, 0);
}

- (id)handler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1B5E0B334](self->_handler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1B5E0B334](v4);

  return v5;
}

- (BOOL)elevatedPriority
{
  BKSApplicationStateMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_elevatedPriority;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateInterestedStates:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[BKSApplicationStateMonitor interestedBundleIDs](self, "interestedBundleIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:states:](self, "updateInterestedBundleIDs:states:", v5, v3);

}

- (void)updateInterestedAssertionReasons:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSArray *v6;
  NSArray *interestedAssertionReasons;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  interestedAssertionReasons = self->_interestedAssertionReasons;
  self->_interestedAssertionReasons = v6;

  -[BKSApplicationStateMonitor lock_updateConfiguration](self, "lock_updateConfiguration");
  os_unfair_lock_unlock(p_lock);
}

@end
