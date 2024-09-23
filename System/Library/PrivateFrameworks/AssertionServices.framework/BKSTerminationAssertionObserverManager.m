@implementation BKSTerminationAssertionObserverManager

- (BKSTerminationAssertionObserverManager)init
{
  BKSTerminationAssertionObserverManager *v2;
  BKSTerminationAssertionObserverManager *v3;
  uint64_t v4;
  OS_dispatch_queue *calloutQueue;
  uint64_t v6;
  NSMutableSet *launchPreventedBundleIDs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSTerminationAssertionObserverManager;
  v2 = -[BKSTerminationAssertionObserverManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(MEMORY[0x1E0D87E18], "createBackgroundQueue:", CFSTR("com.apple.runningboardservices.bksterminationassertion.callout"));
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    launchPreventedBundleIDs = v3->_launchPreventedBundleIDs;
    v3->_launchPreventedBundleIDs = (NSMutableSet *)v6;

    -[BKSTerminationAssertionObserverManager _createMonitor](v3, "_createMonitor");
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  NSMutableSet *observers;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSMutableSet addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableSet *observers;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)efficacyForBundleID:(id)a3
{
  if (-[BKSTerminationAssertionObserverManager hasTerminationAssertionForBundleID:](self, "hasTerminationAssertionForBundleID:", a3))
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasTerminationAssertionForBundleID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_monitorIsReady)
  {
    LOBYTE(v6) = -[NSMutableSet containsObject:](self->_launchPreventedBundleIDs, "containsObject:", v4);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D87D68]);
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:", v4, v4, geteuid(), 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentity:", v8);

    objc_msgSend(MEMORY[0x1E0D87CB8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preventLaunchPredicatesWithError:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = v11;
    v6 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "matchesProcess:", v9, (_QWORD)v16) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)_createMonitor
{
  RBSProcessMonitor *v3;
  RBSProcessMonitor *monitor;
  _QWORD v5[5];

  self->_monitorIsReady = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke;
  v5[3] = &unk_1E61697A8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v5);
  v3 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  monitor = self->_monitor;
  self->_monitor = v3;

}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_msgSend(v3, "setEvents:", 2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2;
  v4[3] = &unk_1E6169780;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setPreventLaunchUpdateHandle:", v4);

}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  char v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  char v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[4];
  id v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v56 = a1;
  v55 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v74 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v8);
  }
  v51 = v6;

  v14 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v14, "minusSet:", *(_QWORD *)(*(_QWORD *)(v56 + 32) + 48));
  v49 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v56 + 32) + 48), "mutableCopy");
  objc_msgSend(v49, "minusSet:", v5);
  v52 = v5;
  objc_storeStrong((id *)(*(_QWORD *)(v56 + 32) + 48), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v56 + 32) + 32));
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v70;
    v53 = *MEMORY[0x1E0CB2D68];
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v70 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x1E0D87D68];
        objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        objc_msgSend(v21, "handleForPredicate:error:", v22, &v68);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v68;

        if (v23)
        {
          objc_msgSend(v23, "currentState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isRunning");

          if ((v26 & 1) == 0)
            goto LABEL_23;
        }
        else
        {
          objc_msgSend(v24, "userInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v53);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v28 == CFSTR("Specified predicate matched multiple processes"))
            goto LABEL_24;
          v29 = v28;
          if (!v28)
          {

LABEL_23:
            v31 = *(NSObject **)(*(_QWORD *)(v56 + 32) + 40);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3;
            block[3] = &unk_1E6169758;
            v66 = v55;
            v67 = v20;
            dispatch_async(v31, block);
            v27 = v66;
LABEL_24:

            goto LABEL_25;
          }
          v30 = -[__CFString isEqual:](v28, "isEqual:", CFSTR("Specified predicate matched multiple processes"));

          if ((v30 & 1) == 0)
            goto LABEL_23;
        }
LABEL_25:

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v17);
  }
  v50 = v15;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v32 = v49;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v62;
    v54 = *MEMORY[0x1E0CB2D68];
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v62 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
        v38 = (void *)MEMORY[0x1E0D87D68];
        objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        objc_msgSend(v38, "handleForPredicate:error:", v39, &v60);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v60;

        if (v40)
        {
          objc_msgSend(v40, "currentState");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isRunning");

          if ((v43 & 1) == 0)
            goto LABEL_40;
        }
        else
        {
          objc_msgSend(v41, "userInfo");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v54);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v45 == CFSTR("Specified predicate matched multiple processes"))
            goto LABEL_41;
          v46 = v45;
          if (!v45)
          {

LABEL_40:
            v48 = *(NSObject **)(*(_QWORD *)(v56 + 32) + 40);
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4;
            v57[3] = &unk_1E6169758;
            v58 = v55;
            v59 = v37;
            dispatch_async(v48, v57);
            v44 = v58;
LABEL_41:

            goto LABEL_42;
          }
          v47 = -[__CFString isEqual:](v45, "isEqual:", CFSTR("Specified predicate matched multiple processes"));

          if ((v47 & 1) == 0)
            goto LABEL_40;
        }
LABEL_42:

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    }
    while (v34);
  }

}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:", 3, *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:", 0, *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  __assert_rtn("-[BKSTerminationAssertionObserverManager dealloc]", "BKSTerminationAssertion.m", 177, "false");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPreventedBundleIDs, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
