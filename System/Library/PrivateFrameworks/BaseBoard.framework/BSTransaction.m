@implementation BSTransaction

- (void)addMilestones:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  OS_os_log *v15;
  id v16;
  void *v17;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  BSTransaction *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v4);

  if (objc_msgSend(a3, "count"))
  {
    if (-[BSTransaction isFinishedWorking](self, "isFinishedWorking"))
    {
      if (-[BSTransaction _debugLoggingEnabled](self, "_debugLoggingEnabled"))
      {
        context = (void *)MEMORY[0x18D769AE0]();
        -[BSTransaction _descriptionProem](self, "_descriptionProem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        -[BSTransaction _debugLogCategories](self, "_debugLogCategories");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v21;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v21 != v8)
                objc_enumerationMutation(v6);
              v10 = *(NSObject **)(*((_QWORD *)&v20 + 1) + 8 * v9);
              if (v5 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v20 + 1) + 8 * v9), OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v25 = v5;
                _os_log_debug_impl(&dword_18A184000, v10, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
              }
              v11 = v10;
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                v12 = (id)objc_opt_class();
                -[BSTransaction _stringForMilestones:](self, "_stringForMilestones:", a3);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v25 = v12;
                v26 = 2048;
                v27 = self;
                v28 = 2114;
                v29 = v13;
                _os_log_debug_impl(&dword_18A184000, v11, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add milestones because we have already finished working: %{public}@", buf, 0x20u);

              }
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v7);
        }

        objc_autoreleasePoolPop(context);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_auditHistoryLog, OS_LOG_TYPE_INFO)
        || -[BSTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      {
        if (-[BSTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        {
          -[BSTransaction _stringForMilestones:](self, "_stringForMilestones:", a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Milestones added: %@"), v14);

        }
        v15 = self->_auditHistoryLog;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
        {
          v16 = (id)objc_opt_class();
          -[BSTransaction _stringForMilestones:](self, "_stringForMilestones:", a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v25 = v16;
          v26 = 2048;
          v27 = self;
          v28 = 2114;
          v29 = v17;
          _os_log_impl(&dword_18A184000, (os_log_t)v15, OS_LOG_TYPE_INFO, "<%{public}@:%p> Milestones added: %{public}@", buf, 0x20u);

        }
      }
      -[NSMutableSet unionSet:](self->_milestones, "unionSet:", a3);
    }
  }
}

- (id)_stringForMilestones:(id)a3
{
  void *v4;
  __CFString *v5;

  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(a3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("(none)");
  }
  return v5;
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  id v9;

  -[BSTransaction queue](self, "queue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v8);

  if (a3)
  {
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "count");
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v9, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))a3 + 2))(a3, v7);

      }
    }

  }
}

- (void)addChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4
{
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  _BSTransactionChildRelationship *v29;
  id v30;
  void *v31;
  void **v32;
  NSMutableSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  OS_os_log *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  _BSTransactionParentRelationship *v43;
  id v44;
  void *v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  unsigned int v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *context;
  void *contexta;
  _QWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[22];
  __int16 v71;
  void *v72;
  _BYTE buf[22];
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v7);

  if (a4 == 1)
  {
    v8 = a3;
    if (a3 && *((_QWORD *)a3 + 9))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSTransaction.m"), 262, CFSTR("Cannot add a serial child transaction if the child has already begun."));

      v8 = a3;
    }
    -[BSTransaction _inFinishedWorkingState](self);
LABEL_22:
    if (-[BSTransaction isComplete](self, "isComplete"))
    {
      if (-[BSTransaction _debugLoggingEnabled](self, "_debugLoggingEnabled"))
      {
        contexta = (void *)MEMORY[0x18D769AE0]();
        -[BSTransaction _descriptionProem](self, "_descriptionProem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        -[BSTransaction _debugLogCategories](self, "_debugLogCategories");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v57 != v22)
                objc_enumerationMutation(v20);
              v24 = *(NSObject **)(*((_QWORD *)&v56 + 1) + 8 * i);
              if (v19 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v56 + 1) + 8 * i), OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v19;
                _os_log_debug_impl(&dword_18A184000, v24, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
              }
              v25 = v24;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                v26 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v26;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = self;
                v74 = 2114;
                v75 = a3;
                v27 = v26;
                _os_log_debug_impl(&dword_18A184000, v25, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add child transaction because we have already completed: %{public}@", buf, 0x20u);

              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v21);
        }

        objc_autoreleasePoolPop(contexta);
      }
      return;
    }
    if (!v8)
      return;
    if (self)
    {
      -[BSTransaction _childRelationshipForTransaction:]((uint64_t)self, (uint64_t)v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = a3;
      if (v28)
        return;
    }
    v29 = [_BSTransactionChildRelationship alloc];
    if (v29
      && (*(_QWORD *)buf = v29,
          *(_QWORD *)&buf[8] = _BSTransactionChildRelationship,
          (v30 = objc_msgSendSuper2((objc_super *)buf, sel_init)) != 0))
    {
      v55 = v30;
      objc_storeStrong((id *)v30 + 1, v8);
      v55[2] = a4;
      if (!self)
        goto LABEL_82;
    }
    else
    {
      v55 = 0;
      if (!self)
      {
LABEL_82:

        return;
      }
    }
    if (v55)
      v31 = (void *)v55[1];
    else
      v31 = 0;
    v32 = v31;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v33 = self->_debugLogCategories;
    v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(v32, "_addDebugLogCategory:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
        }
        v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
      }
      while (v34);
    }

    objc_msgSend(v32, "setAuditHistoryEnabled:", self->_auditHistoryEnabled);
    -[BSTransaction _willAddChildTransaction:](self, "_willAddChildTransaction:", v32);
    if (os_log_type_enabled((os_log_t)self->_auditHistoryLog, OS_LOG_TYPE_INFO)
      || -[BSTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      objc_msgSend(v32, "_descriptionProem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[BSTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[BSTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Adding child transaction: %@"), v37);
      v38 = self->_auditHistoryLog;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_INFO))
      {
        v39 = (void *)objc_opt_class();
        *(_DWORD *)v70 = 138543874;
        *(_QWORD *)&v70[4] = v39;
        *(_WORD *)&v70[12] = 2048;
        *(_QWORD *)&v70[14] = self;
        v71 = 2114;
        v72 = v37;
        v40 = v39;
        _os_log_impl(&dword_18A184000, (os_log_t)v38, OS_LOG_TYPE_INFO, "<%{public}@:%p> Adding child transaction: %{public}@", v70, 0x20u);

      }
    }
    if (v55)
      v41 = v55[2];
    else
      v41 = 0;
    -[NSMutableArray addObject:](self->_childTransactionRelationships, "addObject:");
    if (v32)
    {
      -[BSTransaction _parentRelationshipForTransaction:](v32[1], (uint64_t)self);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__addParentTransaction_withSchedulingPolicy_, v32, CFSTR("BSTransaction.m"), 1090, CFSTR("Cannot add the same parent transaction twice."));

      }
      v43 = [_BSTransactionParentRelationship alloc];
      if (v43)
      {
        *(_QWORD *)v70 = v43;
        *(_QWORD *)&v70[8] = _BSTransactionParentRelationship;
        v44 = objc_msgSendSuper2((objc_super *)v70, sel_init);
        v45 = v44;
        if (v44)
        {
          *((_QWORD *)v44 + 1) = self;
          *((_QWORD *)v44 + 2) = v41;
        }
      }
      else
      {
        v45 = 0;
      }
      objc_msgSend(v32[1], "addObject:", v45);

    }
    -[BSTransaction _didAddChildTransaction:](self, "_didAddChildTransaction:", v32);
    if (!self->_inSubclassBegin)
    {
      v46 = -[BSTransaction _isDoingWork](self);
      v47 = v41 ? 0 : v46;
      if ((v47 & 1) != 0
        || ((v48 = -[BSTransaction _inFinishedWorkingState](self), v41 == 1) ? (v49 = v48) : (v49 = 0),
            v49 == 1))
      {
        -[BSTransaction _beginIfPossible]((uint64_t)v32);
        -[BSTransaction _checkAndReportIfCompleted]((id *)&self->super.isa);
      }
    }

    goto LABEL_82;
  }
  v9 = -[BSTransaction _inFinishedWorkingState](self);
  v8 = a3;
  if (a4 || !v9)
    goto LABEL_22;
  if (-[BSTransaction _debugLoggingEnabled](self, "_debugLoggingEnabled"))
  {
    context = (void *)MEMORY[0x18D769AE0]();
    -[BSTransaction _descriptionProem](self, "_descriptionProem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[BSTransaction _debugLogCategories](self, "_debugLogCategories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v12; ++k)
        {
          if (*(_QWORD *)v61 != v13)
            objc_enumerationMutation(v11);
          v15 = *(NSObject **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if (v10 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v60 + 1) + 8 * k), OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v10;
            _os_log_debug_impl(&dword_18A184000, v15, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
          }
          v16 = v15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = self;
            v74 = 2114;
            v75 = a3;
            v18 = v17;
            _os_log_debug_impl(&dword_18A184000, v16, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Cannot add concurrent child transaction because we have already finished doing work: %{public}@", buf, 0x20u);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v12);
    }

    objc_autoreleasePoolPop(context);
  }
}

- (void)_addDebugLogCategory:(id)a3
{
  NSMutableSet *v5;
  NSMutableSet *debugLogCategories;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_debugLogCategories)
  {
    if (!a3)
      return;
  }
  else
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    debugLogCategories = self->_debugLogCategories;
    self->_debugLogCategories = v5;

    if (!a3)
      return;
  }
  -[NSMutableSet addObject:](self->_debugLogCategories, "addObject:", a3);
  if (!self->_disableDebugLogCheckForUnitTesting && os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG))
  {
    self->_debugLoggingEnabled = 1;
    -[BSTransaction _initializeAuditHistoryIfNecessary](self);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_childTransactionRelationships;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v11)
          v11 = (_QWORD *)v11[1];
        v12 = v11;
        objc_msgSend(v12, "_addDebugLogCategory:", a3, (_QWORD)v13);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_checkAndReportIfCompleted
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *context;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  _BYTE buf[24];
  void *v51;
  _BYTE v52[24];
  void *v53;
  id *v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(a1[2], "count");
    v3 = objc_msgSend(a1[7], "count");
    if ((objc_msgSend(a1, "isRunning") & 1) != 0)
    {
      v4 = objc_msgSend(a1, "isComplete");
      v5 = -[BSTransaction _areConcurrentChildTransactionsFinishedWorking]((uint64_t)a1);
      if ((v4 & 1) == 0)
      {
        v6 = v5;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v7 = MEMORY[0x1E0C809B0];
        LOBYTE(v51) = 1;
        *(_QWORD *)v52 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v52[8] = 3221225472;
        *(_QWORD *)&v52[16] = __46__BSTransaction__areChildTransactionsComplete__block_invoke;
        v53 = &unk_1E1EBEBD8;
        v54 = (id *)buf;
        -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)a1, (uint64_t)v52);
        if (v3)
          v8 = 0;
        else
          v8 = v6;
        v9 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (v2)
          v10 = 0;
        else
          v10 = v8;
        if (!v9)
          v10 = 0;
        if (v8 == 1)
        {
          v36 = v10;
          if ((objc_msgSend(a1, "isFinishedWorking") & 1) == 0)
          {
            -[BSTransaction _setState:]((uint64_t)a1, 2uLL);
            objc_msgSend(a1, "_didFinishWork");
            *(_QWORD *)v52 = v7;
            *(_QWORD *)&v52[8] = 3221225472;
            *(_QWORD *)&v52[16] = __47__BSTransaction__notifyObserversOfFinishedWork__block_invoke;
            v53 = &unk_1E1EBEBB0;
            v54 = a1;
            objc_msgSend(a1, "_enumerateObserversWithBlock:", v52);
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v52 = v7;
            *(_QWORD *)&v52[8] = 3221225472;
            *(_QWORD *)&v52[16] = __57__BSTransaction__parentTransactionsWithSchedulingPolicy___block_invoke;
            v53 = &unk_1E1EBED18;
            v55 = 0;
            v12 = v11;
            v54 = (id *)v12;
            -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:]((uint64_t)a1, (uint64_t)v52);

            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v46 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(id **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  if (v16)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "queue");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    BSDispatchQueueAssert(v17);

                    if (os_log_type_enabled((os_log_t)v16[11], OS_LOG_TYPE_INFO)
                      || objc_msgSend(v16, "isAuditHistoryEnabled"))
                    {
                      objc_msgSend(a1, "_descriptionProem");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v16, "isAuditHistoryEnabled"))
                        objc_msgSend(v16, "_addAuditHistoryItem:", CFSTR("Child transaction finished work: %@"), v18);
                      v19 = v16[11];
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                      {
                        v20 = (void *)objc_opt_class();
                        *(_DWORD *)buf = 138543874;
                        *(_QWORD *)&buf[4] = v20;
                        *(_WORD *)&buf[12] = 2048;
                        *(_QWORD *)&buf[14] = v16;
                        *(_WORD *)&buf[22] = 2114;
                        v51 = v18;
                        v21 = v20;
                        _os_log_impl(&dword_18A184000, v19, OS_LOG_TYPE_INFO, "<%{public}@:%p> Child transaction finished work: %{public}@", buf, 0x20u);

                      }
                    }
                    objc_msgSend(v16, "_childTransactionDidFinishWork:", a1);
                    -[BSTransaction _checkAndReportIfCompleted](v16);
                  }
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
              }
              while (v13);
            }

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            -[BSTransaction _childTransactionsWithSchedulingPolicy:]((uint64_t)a1, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v42 != v24)
                    objc_enumerationMutation(v22);
                  -[BSTransaction _beginIfPossible](*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
              }
              while (v23);
            }

          }
          v10 = v36;
        }
        if (v10)
        {
          if (objc_msgSend(a1, "_shouldComplete"))
          {
            objc_msgSend(a1, "_willComplete");
            -[BSTransaction _noteCompleted](a1);
          }
          else if (objc_msgSend(a1, "_debugLoggingEnabled"))
          {
            context = (void *)MEMORY[0x18D769AE0]();
            objc_msgSend(a1, "_descriptionProem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(a1, "_debugLogCategories");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v28)
            {
              v29 = *(_QWORD *)v38;
              do
              {
                v30 = 0;
                do
                {
                  if (*(_QWORD *)v38 != v29)
                    objc_enumerationMutation(v27);
                  v31 = *(NSObject **)(*((_QWORD *)&v37 + 1) + 8 * v30);
                  if (v26 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v37 + 1) + 8 * v30), OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v52 = 138412290;
                    *(_QWORD *)&v52[4] = v26;
                    _os_log_debug_impl(&dword_18A184000, v31, OS_LOG_TYPE_DEBUG, "%@:", v52, 0xCu);
                  }
                  v32 = v31;
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                  {
                    v33 = (void *)objc_opt_class();
                    *(_DWORD *)v52 = 138543618;
                    *(_QWORD *)&v52[4] = v33;
                    *(_WORD *)&v52[12] = 2048;
                    *(_QWORD *)&v52[14] = a1;
                    v34 = v33;
                    _os_log_debug_impl(&dword_18A184000, v32, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction wishes to extend its life beyond its normal completion", v52, 0x16u);

                  }
                  ++v30;
                }
                while (v28 != v30);
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              }
              while (v28);
            }

            objc_autoreleasePoolPop(context);
          }
        }
      }
    }
    else
    {
      -[BSTransaction _areConcurrentChildTransactionsFinishedWorking]((uint64_t)a1);
    }
  }
}

- (uint64_t)_areConcurrentChildTransactionsFinishedWorking
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__BSTransaction__areConcurrentChildTransactionsFinishedWorking__block_invoke;
  v3[3] = &unk_1E1EBEBD8;
  v3[4] = &v4;
  -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:](a1, (uint64_t)v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_unsafe_enumerateChildTransactionsWithBlock:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__unsafe_enumerateChildTransactionsWithBlock_, a1, CFSTR("BSTransaction.m"), 1229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    }
    v17 = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
LABEL_6:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          v9 = *(id *)(v8 + 8);
          v10 = *(_QWORD *)(v8 + 16);
        }
        else
        {
          v9 = 0;
          v10 = 0;
        }
        (*(void (**)(uint64_t, id, uint64_t, char *))(a2 + 16))(a2, v9, v10, &v17);

        if (v17)
          break;
        if (v5 == ++v7)
        {
          v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          v5 = v11;
          if (v11)
            goto LABEL_6;
          break;
        }
      }
    }

  }
}

- (void)_addAuditHistoryItem:(id)a3
{
  void *v4;
  BSAuditHistory *auditHistory;
  void *v6;
  uint64_t v7;

  if (self->_auditHistory)
  {
    if (self->_state != 3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v7);
      auditHistory = self->_auditHistory;
      +[BSAuditHistoryItem itemWithString:](BSAuditHistoryItem, "itemWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSAuditHistory addItem:](auditHistory, "addItem:", v6);

    }
  }
}

uint64_t __63__BSTransaction__areConcurrentChildTransactionsFinishedWorking__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (!a3)
  {
    v5 = result;
    result = objc_msgSend(a2, "isFinishedWorking");
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isFinishedWorking
{
  return (-[BSTransaction _inFinishedWorkingState](self) & 1) != 0
      || -[BSTransaction isComplete](self, "isComplete");
}

uint64_t __46__BSTransaction__areChildTransactionsComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isComplete");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isRunning
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  if ((-[BSTransaction _isDoingWork](self) & 1) != 0)
    return 1;
  else
    return -[BSTransaction _inFinishedWorkingState](self);
}

- (_QWORD)_isDoingWork
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "queue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert(v2);

    return (_QWORD *)(v1[9] == 1);
  }
  return result;
}

- (_QWORD)_inFinishedWorkingState
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "queue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert(v2);

    return (_QWORD *)(v1[9] == 2);
  }
  return result;
}

- (BOOL)isComplete
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  return self->_state == 3 || self->_failed || self->_aborted;
}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *v2;
  id v3;

  v2 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

- (_QWORD)_parentRelationshipForTransaction:(void *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if (v7)
          v8 = v7[1];
        else
          v8 = 0;
        if (v8 == a2)
        {
          v10 = v7;
          goto LABEL_15;
        }
        ++v6;
      }
      while (v4 != v6);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v9;
    }
    while (v9);
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (void)_setState:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4 != a2)
    {
      if (!os_log_type_enabled(*(os_log_t *)(a1 + 88), OS_LOG_TYPE_INFO))
      {
        if (!objc_msgSend((id)a1, "isAuditHistoryEnabled"))
        {
LABEL_11:
          *(_QWORD *)(a1 + 72) = a2;
          return;
        }
        v4 = *(_QWORD *)(a1 + 72);
      }
      NSStringFromBSTransactionState(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBSTransactionState(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)a1, "isAuditHistoryEnabled"))
        objc_msgSend((id)a1, "_addAuditHistoryItem:", CFSTR("State changed from '%@' to '%@'"), v5, v6);
      v7 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138544130;
        v10 = (id)objc_opt_class();
        v11 = 2048;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        v15 = 2114;
        v16 = v6;
        v8 = v10;
        _os_log_impl(&dword_18A184000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> State changed from '%{public}@' to '%{public}@'", buf, 0x2Au);

      }
      goto LABEL_11;
    }
  }
}

- (BOOL)isAuditHistoryEnabled
{
  return self->_auditHistoryEnabled || self->_debugLoggingEnabled || self->_cachedDefaultBasedAuditHistoryEnabled;
}

- (id)_descriptionProem
{
  return self->_cachedDescriptionProem;
}

uint64_t __56__BSTransaction__childTransactionsWithSchedulingPolicy___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 40) == a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (void)setAuditHistoryEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_auditHistoryEnabled != a3)
  {
    self->_auditHistoryEnabled = a3;
    -[BSTransaction _initializeAuditHistoryIfNecessary](self);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[BSTransaction childTransactions](self, "childTransactions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAuditHistoryEnabled:", self->_auditHistoryEnabled);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (_QWORD)_childRelationshipForTransaction:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if (v7)
          v8 = v7[1];
        else
          v8 = 0;
        if (v8 == a2)
        {
          v10 = v7;
          goto LABEL_16;
        }
        ++v6;
      }
      while (v4 != v6);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v9;
    }
    while (v9);
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (NSArray)childTransactions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_childTransactionRelationships, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__BSTransaction_childTransactions__block_invoke;
  v7[3] = &unk_1E1EBEB88;
  v5 = v4;
  v8 = v5;
  -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)self, (uint64_t)v7);

  return (NSArray *)v5;
}

- (void)_initializeAuditHistoryIfNecessary
{
  BSAuditHistory *v2;
  void *v3;

  if (a1 && !a1[10])
  {
    if (objc_msgSend(a1, "isAuditHistoryEnabled"))
    {
      v2 = objc_alloc_init(BSAuditHistory);
      v3 = (void *)a1[10];
      a1[10] = v2;

    }
  }
}

- (uint64_t)_beginIfPossible
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if (!*(_QWORD *)(result + 72))
    {
      result = -[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:](result, 0, (uint64_t)&__block_literal_global_229);
      if ((_DWORD)result)
      {
        result = -[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:]((_BOOL8)v1, 1, (uint64_t)&__block_literal_global_230);
        if ((_DWORD)result)
          return objc_msgSend(v1, "begin");
      }
    }
  }
  return result;
}

- (BOOL)_evaluateParentTransactionsWithSchedulingPolicy:(uint64_t)a3 evaluator:
{
  _BOOL8 v3;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a1;
  if (a1)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__evaluateParentTransactionsWithSchedulingPolicy_evaluator_, v3, CFSTR("BSTransaction.m"), 1515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("evaluator"));

    }
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__BSTransaction__evaluateParentTransactionsWithSchedulingPolicy_evaluator___block_invoke;
    v8[3] = &unk_1E1EBEDC8;
    v8[5] = &v9;
    v8[6] = a2;
    v8[4] = a3;
    -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:](v3, (uint64_t)v8);
    v3 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  return v3;
}

- (void)_unsafe_enumerateParentTransactionsWithBlock:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__unsafe_enumerateParentTransactionsWithBlock_, a1, CFSTR("BSTransaction.m"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v4);
      v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        v9 = *(id *)(v8 + 8);
        v10 = *(_QWORD *)(v8 + 16);
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      (*(void (**)(uint64_t, id, uint64_t, char *))(a2 + 16))(a2, v9, v10, &v17);

      if (v17)
        break;
      if (v5 == ++v7)
      {
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        v5 = v11;
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }

}

_QWORD *__75__BSTransaction__evaluateParentTransactionsWithSchedulingPolicy_evaluator___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v5;
  uint64_t v6;

  if (result[6] == a3)
  {
    v5 = result;
    v6 = *(_QWORD *)(result[5] + 8);
    if (*(_BYTE *)(v6 + 24))
    {
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      v6 = *(_QWORD *)(v5[5] + 8);
    }
    else
    {
      result = 0;
    }
    *(_BYTE *)(v6 + 24) = (_BYTE)result;
    if (!*(_BYTE *)(*(_QWORD *)(v5[5] + 8) + 24))
      *a4 = 1;
  }
  return result;
}

_QWORD *__60__BSTransaction__areSerialParentTransactionsFinishedWorking__block_invoke(uint64_t a1, _QWORD *a2)
{
  return -[BSTransaction _inFinishedWorkingState](a2);
}

uint64_t __57__BSTransaction__parentTransactionsWithSchedulingPolicy___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 40) == a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __36__BSTransaction__parentTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

_QWORD *__58__BSTransaction__areConcurrentParentTransactionsDoingWork__block_invoke(uint64_t a1, _QWORD *a2)
{
  return -[BSTransaction _isDoingWork](a2);
}

- (BOOL)_shouldComplete
{
  return 1;
}

uint64_t __22__BSTransaction_begin__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "transactionDidBegin:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __22__BSTransaction_begin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "transactionWillBegin:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __47__BSTransaction__notifyObserversOfFinishedWork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "transactionDidFinishWork:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __45__BSTransaction__notifyObserversOfCompletion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "transactionDidComplete:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __34__BSTransaction_childTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)satisfyMilestone:(id)a3
{
  -[BSTransaction evaluateMilestone:withEvaluator:](self, "evaluateMilestone:withEvaluator:", a3, &__block_literal_global_83);
}

- (void)addChildTransaction:(id)a3
{
  -[BSTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", a3, 0);
}

- (BSTransaction)init
{
  BSTransaction *v2;
  BSTransaction *v3;
  uint64_t v4;
  NSHashTable *observers;
  NSMutableArray *v6;
  NSMutableArray *blockObservers;
  NSMutableSet *v8;
  NSMutableSet *milestones;
  NSMutableArray *v10;
  NSMutableArray *parentTransactionRelationships;
  NSMutableArray *v12;
  NSMutableArray *childTransactionRelationships;
  NSMutableDictionary *v14;
  NSMutableDictionary *milestonesToHandlers;
  NSMutableSet *v16;
  NSMutableSet *lifeAssertions;
  uint64_t v18;
  NSString *cachedDescriptionProem;
  id v20;
  uint64_t v21;
  OS_os_log *auditHistoryLog;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BSTransaction;
  v2 = -[BSTransaction init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blockObservers = v3->_blockObservers;
    v3->_blockObservers = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    milestones = v3->_milestones;
    v3->_milestones = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parentTransactionRelationships = v3->_parentTransactionRelationships;
    v3->_parentTransactionRelationships = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    childTransactionRelationships = v3->_childTransactionRelationships;
    v3->_childTransactionRelationships = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    milestonesToHandlers = v3->_milestonesToHandlers;
    v3->_milestonesToHandlers = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lifeAssertions = v3->_lifeAssertions;
    v3->_lifeAssertions = v16;

    +[BSDescriptionBuilder descriptionForObject:](BSDescriptionBuilder, "descriptionForObject:", v3);
    v18 = objc_claimAutoreleasedReturnValue();
    cachedDescriptionProem = v3->_cachedDescriptionProem;
    v3->_cachedDescriptionProem = (NSString *)v18;

    objc_opt_self();
    if (qword_1ECD39820 != -1)
      dispatch_once(&qword_1ECD39820, &__block_literal_global_6);
    v20 = (id)_MergedGlobals_8;
    v3->_cachedDefaultBasedAuditHistoryEnabled = objc_msgSend(v20, "isAuditHistoryEnabled");

    +[BSTransaction _defaultTransactionLog]();
    v21 = objc_claimAutoreleasedReturnValue();
    auditHistoryLog = v3->_auditHistoryLog;
    v3->_auditHistoryLog = (OS_os_log *)v21;

    +[BSTransaction _defaultTransactionLog]();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSTransaction _addDebugLogCategory:](v3, "_addDebugLogCategory:", v23);

  }
  return v3;
}

+ (id)_defaultTransactionLog
{
  objc_opt_self();
  if (qword_1ECD39830 != -1)
    dispatch_once(&qword_1ECD39830, &__block_literal_global_88);
  return (id)qword_1ECD39828;
}

- (BOOL)isInterrupted
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  return self->_interrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_blockObservers, 0);
  objc_storeStrong((id *)&self->_cachedDescriptionProem, 0);
  objc_storeStrong((id *)&self->_debugLogCategories, 0);
  objc_storeStrong((id *)&self->_auditHistoryLog, 0);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_childTransactionRelationships, 0);
  objc_storeStrong((id *)&self->_milestonesToHandlers, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_lifeAssertions, 0);
  objc_storeStrong((id *)&self->_parentTransactionRelationships, 0);
}

- (void)removeChildTransaction:(id)a3
{
  id v5;
  id v6;

  -[BSTransaction queue](self, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  if (a3)
  {
    -[BSTransaction _childRelationshipForTransaction:]((uint64_t)self, (uint64_t)a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, (uint64_t)v6);

  }
}

- (void)_removeChildTransactionRelationship:(id *)a1
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
      v4 = *(void **)(a2 + 8);
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(a1, "_willRemoveChildTransaction:", v5);
    if (os_log_type_enabled((os_log_t)a1[11], OS_LOG_TYPE_INFO)
      || objc_msgSend(a1, "isAuditHistoryEnabled"))
    {
      objc_msgSend(v5, "_descriptionProem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "isAuditHistoryEnabled"))
        objc_msgSend(a1, "_addAuditHistoryItem:", CFSTR("Removing child transaction: %@"), v6);
      v7 = a1[11];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v10 = (id)objc_opt_class();
        v11 = 2048;
        v12 = a1;
        v13 = 2114;
        v14 = v6;
        v8 = v10;
        _os_log_impl(&dword_18A184000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> Removing child transaction: %{public}@", buf, 0x20u);

      }
    }
    -[BSTransaction _removeParentTransaction:]((uint64_t)v5, (uint64_t)a1);
    objc_msgSend(a1[6], "removeObject:", a2);
    objc_msgSend(a1, "_didRemoveChildTransaction:", v5);
    if (objc_msgSend(a1, "isRunning"))
      -[BSTransaction _checkAndReportIfCompleted](a1);

  }
}

- (BOOL)removeMilestone:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BSTransaction removeMilestones:](self, "removeMilestones:", v4);

  return (char)self;
}

- (BOOL)removeMilestones:(id)a3
{
  void *v5;

  -[BSTransaction queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  return -[BSTransaction _removeMilestones:ignoringAuditHistory:]((id *)&self->super.isa, a3, 0);
}

- (void)evaluateMilestone:(id)a3 withEvaluator:(id)a4
{
  void *v7;
  void *v8;
  OS_os_log *v9;
  id v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  BSTransaction *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v7);

  if (a4
    && !-[BSTransaction isComplete](self, "isComplete")
    && -[BSTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", a3)
    && (*((unsigned int (**)(id))a4 + 2))(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Milestone satisfied: %@"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("%@"), v8);
    v9 = self->_auditHistoryLog;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v13 = (id)objc_opt_class();
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = a3;
      v10 = v13;
      _os_log_impl(&dword_18A184000, (os_log_t)v9, OS_LOG_TYPE_INFO, "<%{public}@:%p> Milestone satisfied: %{public}@", buf, 0x20u);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__BSTransaction_evaluateMilestone_withEvaluator___block_invoke;
    v11[3] = &unk_1E1EBE700;
    v11[4] = self;
    v11[5] = a3;
    -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:]((uint64_t)self, (uint64_t)v8, 1, (uint64_t)v11);

  }
}

- (BOOL)isWaitingForMilestone:(id)a3
{
  void *v5;

  -[BSTransaction queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  return -[NSMutableSet containsObject:](self->_milestones, "containsObject:", a3);
}

uint64_t __34__BSTransaction_satisfyMilestone___block_invoke()
{
  return 1;
}

- (void)_noteCompleted
{
  _QWORD *v1;
  double v2;
  double v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *context;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _BYTE v55[128];
  uint8_t v56[128];
  _BYTE buf[24];
  double v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (a1[9] != 3)
  {
    v1 = a1;
    -[BSTransaction _setState:]((uint64_t)v1, 3uLL);
    objc_msgSend((id)v1[4], "timeIntervalSinceNow");
    v3 = -v2;
    if (objc_msgSend(v1, "isAuditHistoryEnabled"))
      objc_msgSend(v1, "_addAuditHistoryItem:", CFSTR("Completed after %.2fs."), *(_QWORD *)&v3);
    v4 = (id)v1[11];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v1;
      *(_WORD *)&buf[22] = 2050;
      v58 = v3;
      v5 = *(id *)&buf[4];
      _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "<%{public}@:%p> Completed after %{public}.2fs.", buf, 0x20u);

    }
    objc_msgSend(v1, "_didComplete");
    v6 = v1[16];
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, objc_msgSend(v1, "isFailed") ^ 1);
      v7 = (void *)v1[16];
      v1[16] = 0;

    }
    objc_msgSend((id)v1[5], "removeAllObjects");
    v8 = (void *)v1[5];
    v1[5] = 0;

    v9 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __45__BSTransaction__notifyObserversOfCompletion__block_invoke;
    v54[3] = &unk_1E1EBEBB0;
    v54[4] = v1;
    objc_msgSend(v1, "_enumerateObserversWithBlock:", v54);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v10 = (id)v1[15];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v51 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend((id)v1[8], "removeObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
      }
      while (v11);
    }

    objc_msgSend((id)v1[15], "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("BSTransactionCompletedNotification"), v1);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __36__BSTransaction__parentTransactions__block_invoke;
    v58 = COERCE_DOUBLE(&unk_1E1EBEB88);
    v16 = v15;
    v59 = v16;
    -[BSTransaction _unsafe_enumerateParentTransactionsWithBlock:]((uint64_t)v1, (uint64_t)buf);

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v16);
          v20 = *(id **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if (v20)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "queue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            BSDispatchQueueAssert(v21);

            if (objc_msgSend(v1, "isFailed"))
              v22 = objc_msgSend(v20, "_shouldFailForChildTransaction:", v1);
            else
              v22 = 0;
            if (os_log_type_enabled((os_log_t)v20[11], OS_LOG_TYPE_INFO)
              || objc_msgSend(v20, "isAuditHistoryEnabled"))
            {
              objc_msgSend(v1, "_descriptionProem");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "isAuditHistoryEnabled"))
                objc_msgSend(v20, "_addAuditHistoryItem:", CFSTR("Child transaction completed: %@"), v23);
              v24 = v20[11];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                v25 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v25;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v20;
                *(_WORD *)&buf[22] = 2114;
                v58 = *(double *)&v23;
                v26 = v25;
                _os_log_impl(&dword_18A184000, v24, OS_LOG_TYPE_INFO, "<%{public}@:%p> Child transaction completed: %{public}@", buf, 0x20u);

              }
            }
            objc_msgSend(v20, "_childTransactionDidComplete:", v1);
            if (v22)
            {
              v27 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v1, "_descriptionProem");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", CFSTR("Child transaction failed: %@"), v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v1, "error");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)v20, 1, (uint64_t)CFSTR("child transaction"), (uint64_t)v29, (uint64_t)v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              -[BSTransaction _failWithError:]((uint64_t)v20, v31);
            }
            -[BSTransaction _checkAndReportIfCompleted](v20);
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v1, "_isRootTransaction") && objc_msgSend(v1, "_debugLoggingEnabled"))
    {
      context = (void *)MEMORY[0x18D769AE0]();
      objc_msgSend(v1, "_descriptionProem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v1, "_debugLogCategories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v43;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v43 != v35)
              objc_enumerationMutation(v33);
            v37 = *(NSObject **)(*((_QWORD *)&v42 + 1) + 8 * v36);
            if (v32 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v42 + 1) + 8 * v36), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v32;
              _os_log_debug_impl(&dword_18A184000, v37, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            v38 = v37;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v39 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v39;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v1;
              *(_WORD *)&buf[22] = 2114;
              v58 = *(double *)&v1;
              v40 = v39;
              _os_log_debug_impl(&dword_18A184000, v38, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction completed: %{public}@", buf, 0x20u);

            }
            ++v36;
          }
          while (v34 != v36);
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        }
        while (v34);
      }

      objc_autoreleasePoolPop(context);
    }

  }
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  _QWORD *v17;
  void *context;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  BSTransaction *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[BSTransaction _debugLoggingEnabled](self, "_debugLoggingEnabled"))
  {
    context = (void *)MEMORY[0x18D769AE0]();
    -[BSTransaction _descriptionProem](self, "_descriptionProem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[BSTransaction _debugLogCategories](self, "_debugLogCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v25;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(v4);
          v8 = *(NSObject **)(*((_QWORD *)&v24 + 1) + 8 * v7);
          if (v3 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v24 + 1) + 8 * v7), OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v3;
            _os_log_debug_impl(&dword_18A184000, v8, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
          }
          v9 = v8;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v10 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v30 = v10;
            v31 = 2048;
            v32 = self;
            v11 = v10;
            _os_log_debug_impl(&dword_18A184000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Dealloc", buf, 0x16u);

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v5);
    }

    objc_autoreleasePoolPop(context);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)-[NSMutableArray copy](self->_childTransactionRelationships, "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v16)
          v16 = (_QWORD *)v16[1];
        v17 = v16;
        -[BSTransaction _removeParentTransaction:]((uint64_t)v17, (uint64_t)self);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  v19.receiver = self;
  v19.super_class = (Class)BSTransaction;
  -[BSTransaction dealloc](&v19, sel_dealloc);
}

- (void)_removeParentTransaction:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    -[BSTransaction _parentRelationshipForTransaction:](*(void **)(a1 + 8), a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeParentTransaction_, a1, CFSTR("BSTransaction.m"), 1099, CFSTR("Cannot remove a parent transaction that is not actually a parent."));

      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 8), "removeObject:", v3);
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      if (!*(_QWORD *)(a1 + 72))
        -[BSTransaction _beginIfPossible](a1);
    }

  }
}

- (BOOL)_debugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

- (void)begin
{
  void *v4;
  BSTransaction *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *context;
  void *contexta;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v4);

  v5 = self;
  v6 = (uint64_t)v5;
  if (v5->_failed)
  {
    if (-[BSTransaction _debugLoggingEnabled](v5, "_debugLoggingEnabled"))
    {
      context = (void *)MEMORY[0x18D769AE0]();
      objc_msgSend((id)v6, "_descriptionProem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend((id)v6, "_debugLogCategories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v37;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v37 != v10)
              objc_enumerationMutation(v8);
            v12 = *(NSObject **)(*((_QWORD *)&v36 + 1) + 8 * v11);
            if (v7 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v36 + 1) + 8 * v11), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v7;
              _os_log_debug_impl(&dword_18A184000, v12, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            v13 = v12;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v14 = (id)objc_opt_class();
              objc_msgSend(*(id *)(v6 + 144), "localizedDescription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v42 = v14;
              v43 = 2048;
              v44 = v6;
              v45 = 2114;
              v46 = (uint64_t)v15;
              _os_log_debug_impl(&dword_18A184000, v13, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Unable to begin transaction, because the transaction failed prior to starting with error: %{public}@", buf, 0x20u);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v9);
      }

      objc_autoreleasePoolPop(context);
    }
  }
  else
  {
    if (v5->_state)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("BSTransaction.m"), 386, CFSTR("Cannot begin a transaction that has already begun or completed."));

    }
    if (!-[BSTransaction _evaluateParentTransactionsWithSchedulingPolicy:evaluator:](v6, 1, (uint64_t)&__block_literal_global_230))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("BSTransaction.m"), 387, CFSTR("Cannot begin a serial child transaction if all parents are not finished doing work."));

    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v17 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v16;

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __22__BSTransaction_begin__block_invoke;
    v35[3] = &unk_1E1EBE890;
    v35[4] = v6;
    -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:](v6, (uint64_t)CFSTR("beginning"), 0, (uint64_t)v35);
    if (objc_msgSend((id)v6, "_isRootTransaction")
      && (objc_msgSend((id)v6, "isComplete") & 1) == 0
      && objc_msgSend((id)v6, "_debugLoggingEnabled"))
    {
      contexta = (void *)MEMORY[0x18D769AE0]();
      objc_msgSend((id)v6, "_descriptionProem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend((id)v6, "_debugLogCategories");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v32;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v19);
            v23 = *(NSObject **)(*((_QWORD *)&v31 + 1) + 8 * v22);
            if (v18 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v31 + 1) + 8 * v22), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v18;
              _os_log_debug_impl(&dword_18A184000, v23, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            v24 = v23;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v25 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v42 = v25;
              v43 = 2048;
              v44 = v6;
              v45 = 2114;
              v46 = v6;
              v26 = v25;
              _os_log_debug_impl(&dword_18A184000, v24, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Transaction started: %{public}@", buf, 0x20u);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v20);
      }

      objc_autoreleasePoolPop(contexta);
    }
  }

}

- (BOOL)_isRootTransaction
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  return -[NSMutableArray count](self->_parentTransactionRelationships, "count") == 0;
}

- (void)_preventTransactionCompletionForReason:(char)a3 ignoringAuditHistory:(uint64_t)a4 andExecuteBlock:
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1 && a4)
  {
    objc_msgSend(*(id *)(a1 + 16), "addObject:", a2);
    if ((a3 & 1) == 0)
    {
      if (objc_msgSend((id)a1, "isAuditHistoryEnabled"))
        objc_msgSend((id)a1, "_addAuditHistoryItem:", CFSTR("Life assertion taken for reason: %@"), a2);
      v8 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v14 = (id)objc_opt_class();
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = a2;
        v9 = v14;
        _os_log_impl(&dword_18A184000, v8, OS_LOG_TYPE_INFO, "<%{public}@:%p> Life assertion taken for reason: %{public}@", buf, 0x20u);

      }
    }
    (*(void (**)(uint64_t))(a4 + 16))(a4);
    if (a2 && objc_msgSend(*(id *)(a1 + 16), "containsObject:", a2))
    {
      if ((a3 & 1) == 0)
      {
        if (objc_msgSend((id)a1, "isAuditHistoryEnabled"))
          objc_msgSend((id)a1, "_addAuditHistoryItem:", CFSTR("Life assertion removed for reason: %@"), a2);
        v10 = *(id *)(a1 + 88);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v14 = v11;
          v15 = 2048;
          v16 = a1;
          v17 = 2114;
          v18 = a2;
          v12 = v11;
          _os_log_impl(&dword_18A184000, v10, OS_LOG_TYPE_INFO, "<%{public}@:%p> Life assertion removed for reason: %{public}@", buf, 0x20u);

        }
      }
      objc_msgSend(*(id *)(a1 + 16), "removeObject:", a2);
      if (!objc_msgSend(*(id *)(a1 + 16), "count"))
      {
        if (*(_BYTE *)(a1 + 137) || *(_BYTE *)(a1 + 24))
        {
          if (objc_msgSend((id)a1, "isRunning"))
            -[BSTransaction _terminateNow](a1);
        }
        -[BSTransaction _checkAndReportIfCompleted]((id *)a1);
      }
    }
  }
}

uint64_t __22__BSTransaction_begin__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_willBegin");
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __22__BSTransaction_begin__block_invoke_2;
  v15[3] = &unk_1E1EBEBB0;
  v15[4] = v3;
  objc_msgSend(v3, "_enumerateObserversWithBlock:", v15);
  -[BSTransaction _setState:](*(_QWORD *)(a1 + 32), 1uLL);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_begin");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BSTransaction _childTransactionsWithSchedulingPolicy:](*(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        -[BSTransaction _beginIfPossible](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didBegin");
  v8 = *(void **)(a1 + 32);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __22__BSTransaction_begin__block_invoke_3;
  v10[3] = &unk_1E1EBEBB0;
  v10[4] = v8;
  return objc_msgSend(v8, "_enumerateObserversWithBlock:", v10);
}

- (id)_childTransactionsWithSchedulingPolicy:(uint64_t)a1
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__BSTransaction__childTransactionsWithSchedulingPolicy___block_invoke;
  v7[3] = &unk_1E1EBED18;
  v9 = a2;
  v5 = v4;
  v8 = v5;
  -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:](a1, (uint64_t)v7);

  return v5;
}

void __49__BSTransaction_evaluateMilestone_withEvaluator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*v2 + 40), "removeObjectForKey:", v2[1]);
  v4 = *(id **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _removeMilestones:ignoringAuditHistory:](v4, v5, 1);

  objc_msgSend(*(id *)(a1 + 32), "_didSatisfyMilestone:", *(_QWORD *)(a1 + 40));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)_removeMilestones:(char)a3 ignoringAuditHistory:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a1, "isComplete"))
  {
    if (objc_msgSend(a1, "_debugLoggingEnabled"))
    {
      context = (void *)MEMORY[0x18D769AE0]();
      objc_msgSend(a1, "_descriptionProem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(a1, "_debugLogCategories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v24;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(v6);
            v10 = *(NSObject **)(*((_QWORD *)&v23 + 1) + 8 * v9);
            if (v5 && os_log_type_enabled(*(os_log_t *)(*((_QWORD *)&v23 + 1) + 8 * v9), OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v5;
              _os_log_debug_impl(&dword_18A184000, v10, OS_LOG_TYPE_DEBUG, "%@:", buf, 0xCu);
            }
            v11 = v10;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v12 = (id)objc_opt_class();
              objc_msgSend(a1, "_stringForMilestones:", a2);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v28 = v12;
              v29 = 2048;
              v30 = a1;
              v31 = 2114;
              v32 = v13;
              _os_log_debug_impl(&dword_18A184000, v11, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Attempt to remove milestones once completed: %{public}@", buf, 0x20u);

            }
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        }
        while (v7);
      }

      objc_autoreleasePoolPop(context);
    }
    return 0;
  }
  v14 = objc_msgSend(a2, "count");
  v15 = v14 != 0;
  if (v14 && (a3 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)a1[11], OS_LOG_TYPE_INFO)
      || objc_msgSend(a1, "isAuditHistoryEnabled"))
    {
      if (objc_msgSend(a1, "isAuditHistoryEnabled"))
      {
        objc_msgSend(a1, "_stringForMilestones:", a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addAuditHistoryItem:", CFSTR("Removed milestones: %@"), v16);

      }
      v17 = a1[11];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (id)objc_opt_class();
        objc_msgSend(a1, "_stringForMilestones:", a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v18;
        v29 = 2048;
        v30 = a1;
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_18A184000, v17, OS_LOG_TYPE_INFO, "<%{public}@:%p> Removed milestones: %{public}@", buf, 0x20u);

      }
    }
    goto LABEL_27;
  }
  if (!v14)
    return 0;
LABEL_27:
  objc_msgSend(a1[7], "minusSet:", a2);
  -[BSTransaction _checkAndReportIfCompleted](a1);
  return v15;
}

- (void)addMilestone:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction addMilestones:](self, "addMilestones:");

}

- (void)addObserver:(id)a3
{
  void *v5;

  -[BSTransaction queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  if (a3)
  {
    if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", a3))
      -[NSHashTable addObject:](self->_observers, "addObject:", a3);
  }
}

- (BOOL)hasStarted
{
  return -[BSTransaction isRunning](self, "isRunning") || -[BSTransaction isComplete](self, "isComplete");
}

- (id)completionBlock
{
  return (id)MEMORY[0x18D769CFC](self->_completionBlock, a2);
}

- (void)setCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  if (self->_completionBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    completionBlock = self->_completionBlock;
    self->_completionBlock = v4;

  }
}

- (void)removeObserver:(id)a3
{
  void *v5;

  -[BSTransaction queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  if (a3)
  {
    if (-[NSHashTable containsObject:](self->_observers, "containsObject:", a3))
    {
      -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
      -[NSMutableArray removeObject:](self->_blockObservers, "removeObject:", a3);
    }
  }
}

- (BOOL)isInterruptible
{
  void *v3;
  _BOOL4 v4;
  char v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = -[BSTransaction _canBeInterrupted](self, "_canBeInterrupted");
  v5 = 0;
  if (v4)
    v5 = !-[BSTransaction isComplete](self, "isComplete");
  v12 = v5;
  if (*((_BYTE *)v10 + 24))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__BSTransaction_isInterruptible__block_invoke;
    v8[3] = &unk_1E1EBEBD8;
    v8[4] = &v9;
    -[BSTransaction _unsafe_enumerateChildTransactionsWithBlock:]((uint64_t)self, (uint64_t)v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSSet)milestones
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  return (NSSet *)self->_milestones;
}

- (BOOL)hasChildTransactionsOfClass:(Class)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  _QWORD *v10;
  char isKindOfClass;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_childTransactionRelationships;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v9)
          v9 = (_QWORD *)v9[1];
        v10 = v9;
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)childTransactionsOfClass:(Class)a3
{
  void *v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_childTransactionRelationships;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          v10 = (_QWORD *)v10[1];
        v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)removeAllChildTransactionsOfClass:(Class)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  char isKindOfClass;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)-[NSMutableArray copy](self->_childTransactionRelationships, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if (v9)
          v10 = *(void **)(v9 + 8);
        else
          v10 = 0;
        v11 = v10;
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, v9);
        ++v8;
      }
      while (v6 != v8);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = v13;
    }
    while (v13);
  }

}

- (void)removeAllChildTransactions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_childTransactionRelationships, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[BSTransaction _removeChildTransactionRelationship:]((id *)&self->super.isa, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)allErrors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BSTransaction childTransactions](self, "childTransactions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "allErrors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  if (self->_error)
    objc_msgSend(v3, "addObject:");
  return (NSArray *)v3;
}

- (void)registerBlockObserver:(id)a3
{
  id v6;
  BSTransactionBlockObserver *v7;
  id v8;

  -[BSTransaction queue](self, "queue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v6);

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSTransaction.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blockObserverCallback"));

  }
  v7 = objc_alloc_init(BSTransactionBlockObserver);
  (*((void (**)(id))a3 + 2))(a3);
  -[NSMutableArray addObject:](self->_blockObservers, "addObject:", v7);
  -[BSTransaction addObserver:](self, "addObserver:", v7);

}

uint64_t __32__BSTransaction_isInterruptible__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isComplete");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a2, "isInterruptible");
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      if (a4)
        *a4 = 1;
    }
  }
  return result;
}

- (void)interrupt
{
  -[BSTransaction interruptWithReason:](self, "interruptWithReason:", CFSTR("unspecified"));
}

- (void)interruptWithReason:(id)a3
{
  void *v5;

  -[BSTransaction queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v5);

  -[BSTransaction _interruptWithReason:force:](self, (uint64_t)a3, 0);
}

- (void)_interruptWithReason:(char)a3 force:
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  char v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a1;
    v6 = (uint64_t)v5;
    if ((a3 & 1) != 0 || (objc_msgSend(v5, "isInterruptible") & 1) != 0)
    {
      if (objc_msgSend((id)v6, "isComplete"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__interruptWithReason_force_, v6, CFSTR("BSTransaction.m"), 1407, CFSTR("Cannot interrupt a completed transaction."));

      }
      if ((objc_msgSend((id)v6, "isRunning") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__interruptWithReason_force_, v6, CFSTR("BSTransaction.m"), 1408, CFSTR("Cannot interrupt a non-running transaction."));

      }
      if (*(_BYTE *)(v6 + 25))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__interruptWithReason_force_, v6, CFSTR("BSTransaction.m"), 1409, CFSTR("Cannot interrupt an already interrupted transaction."));

      }
      if (objc_msgSend((id)v6, "isAuditHistoryEnabled"))
        objc_msgSend((id)v6, "_addAuditHistoryItem:", CFSTR("Interrupting for reason: %@"), a2);
      v7 = *(id *)(v6 + 88);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v22 = (id)objc_opt_class();
        v23 = 2048;
        v24 = v6;
        v25 = 2114;
        v26 = a2;
        v8 = v22;
        _os_log_impl(&dword_18A184000, v7, OS_LOG_TYPE_INFO, "<%{public}@:%p> Interrupting for reason: %{public}@", buf, 0x20u);

      }
      if (!*(_QWORD *)(v6 + 144))
      {
        -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](v6, 2, a2, 0, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(v6 + 144);
        *(_QWORD *)(v6 + 144) = v9;

      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __44__BSTransaction__interruptWithReason_force___block_invoke;
      v19[3] = &unk_1E1EBED40;
      v19[4] = v6;
      v19[5] = a2;
      v20 = a3;
      -[BSTransaction _preventTransactionCompletionForReason:ignoringAuditHistory:andExecuteBlock:](v6, (uint64_t)CFSTR("interruption"), 0, (uint64_t)v19);
      if ((objc_msgSend((id)v6, "isComplete") & 1) == 0)
      {
        v11 = *(id *)(v6 + 88);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v22 = v12;
          v23 = 2048;
          v24 = v6;
          v13 = v12;
          _os_log_impl(&dword_18A184000, v11, OS_LOG_TYPE_INFO, "<%{public}@:%p> Interrupted but not yet done. Waiting.", buf, 0x16u);

        }
      }
    }
    else
    {
      v14 = *(id *)(v6 + 88);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v22 = (id)objc_opt_class();
        v23 = 2048;
        v24 = v6;
        v25 = 2114;
        v26 = a2;
        v15 = v22;
        _os_log_impl(&dword_18A184000, v14, OS_LOG_TYPE_INFO, "<%{public}@:%p> Cannot be interrupted for reason \"%{public}@\". Ignoring.", buf, 0x20u);

      }
    }

  }
}

- (void)failWithReason:(id)a3
{
  id v4;

  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, (uint64_t)a3, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v4);

}

- (id)_createErrorWithCode:(uint64_t)a3 reason:(uint64_t)a4 description:(uint64_t)a5 precipitatingError:
{
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 2)
      v10 = CFSTR("completed");
    else
      v10 = off_1E1EBEDE8[a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transaction %@."), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
    {
      objc_msgSend(v12, "setObject:forKey:", a4, CFSTR("error-description"));
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" %@"), a4);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    if (a3)
    {
      objc_msgSend(v13, "setObject:forKey:", a3, CFSTR("error-reason"));
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" (%@)"), a3);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    if (a5)
      objc_msgSend(v13, "setObject:forKey:", a5, CFSTR("precipitating-error"));
    +[BSDescriptionBuilder succinctDescriptionForObject:](BSDescriptionBuilder, "succinctDescriptionForObject:", a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("transaction"));

    objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D68]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("BSTransactionError"), a2, v13);

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void)_failWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert(v4);

    if (!*(_BYTE *)(a1 + 24) && !*(_BYTE *)(a1 + 137) && (objc_msgSend((id)a1, "isComplete") & 1) == 0)
    {
      v5 = *(_QWORD *)(a1 + 144);
      *(_BYTE *)(a1 + 137) = 1;
      if (!v5)
      {
        if (!v3)
        {
          -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](a1, 1, 0, 0, 0);
          v3 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)(a1 + 144), v3);
      }
      objc_msgSend(v3, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("error-reason"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v8 = CFSTR("(unspecified)");
      if (v7)
        v8 = v7;
      v9 = v8;
      if (objc_msgSend((id)a1, "isAuditHistoryEnabled"))
        objc_msgSend((id)a1, "_addAuditHistoryItem:", CFSTR("Failing for reason: %@"), v9);
      v10 = *(id *)(a1 + 88);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v13 = (id)objc_opt_class();
        v14 = 2048;
        v15 = a1;
        v16 = 2114;
        v17 = v9;
        v11 = v13;
        _os_log_impl(&dword_18A184000, v10, OS_LOG_TYPE_INFO, "<%{public}@:%p> Failing for reason: %{public}@", buf, 0x20u);

      }
      if (!objc_msgSend(*(id *)(a1 + 16), "count"))
        -[BSTransaction _terminateNow](a1);

    }
  }

}

- (void)removeAllMilestones
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  -[BSTransaction removeMilestones:](self, "removeMilestones:", self->_milestones);
}

- (void)listenForSatisfiedMilestone:(id)a3 withBlock:(id)a4
{
  void *v7;
  id v8;
  id v9;

  -[BSTransaction queue](self, "queue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v8);

  if (a3 && a4)
  {
    -[NSMutableDictionary objectForKey:](self->_milestonesToHandlers, "objectForKey:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_milestonesToHandlers, "setObject:forKey:");
    }
    v7 = (void *)objc_msgSend(a4, "copy");
    objc_msgSend(v9, "addObject:", v7);

  }
}

- (NSString)description
{
  return (NSString *)-[BSTransaction _descriptionForDebugging:indentLevel:]((uint64_t)self, 0);
}

- (id)_descriptionForDebugging:(uint64_t)a1 indentLevel:(int)a2
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a1, a2, 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[BSTransaction _descriptionForDebugging:indentLevel:]((uint64_t)self, 1);
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return 0;
}

- (BOOL)_revertWithReason:(id)a3
{
  return 0;
}

- (id)_debugLogCategories
{
  return self->_debugLogCategories;
}

- (id)_customizedDescriptionProperties
{
  return 0;
}

- (void)_evaluateCompletion
{
  void *v3;

  -[BSTransaction queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert(v3);

  -[BSTransaction _checkAndReportIfCompleted]((id *)&self->super.isa);
}

- (void)_failForTimeoutWithDescription:(id)a3
{
  id v4;

  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, (uint64_t)CFSTR("timeout"), (uint64_t)a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v4);

}

- (void)_failWithReason:(id)a3 description:(id)a4
{
  -[BSTransaction _failWithReason:description:precipitatingError:](self, "_failWithReason:description:precipitatingError:", a3, a4, 0);
}

- (void)_failWithReason:(id)a3 description:(id)a4 precipitatingError:(id)a5
{
  id v6;

  -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:]((uint64_t)self, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSTransaction _failWithError:]((uint64_t)self, v6);

}

void __39__BSTransaction__defaultTransactionLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "Transaction");
  v1 = (void *)qword_1ECD39828;
  qword_1ECD39828 = (uint64_t)v0;

}

- (id)_graphNodeIdentifier
{
  id v1;
  void *v2;
  objc_class *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%p"), v4, v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_graphNodeDebugName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_populateGraphIntoNodes:(void *)a3 edges:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_customizedDescriptionProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "bs_filter:", &__block_literal_global_106);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v6, "addEntriesFromDictionary:", v9);
    -[BSTransaction _graphNodeIdentifier]((id)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("id"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("pointer"));

    objc_msgSend((id)a1, "_graphNodeDebugName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("name"));

    NSStringFromBSTransactionState(*(_QWORD *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("state"));

    if (*(_BYTE *)(a1 + 25))
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("interrupted"));
    if (*(_BYTE *)(a1 + 24))
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("aborted"));
    if (*(_BYTE *)(a1 + 137))
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("failed"));
    v14 = *(void **)(a1 + 144);
    if (v14)
    {
      objc_msgSend(v14, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("error"));

    }
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      objc_msgSend((id)a1, "_stringForMilestones:", *(_QWORD *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("milestonesRemaining"));

    }
    objc_msgSend(a2, "addObject:", v6);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = *(id *)(a1 + 48);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x18D769AE0]();
          if (!v21)
          {
            v23 = 0;
LABEL_26:
            -[BSTransaction _buildGraphEdgeDescriptionWithType:fromTransaction:toTransaction:]((uint64_t)CFSTR("childConcurrent"), (id)a1, v23);
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
          v23 = *(id *)(v21 + 8);
          v24 = *(_QWORD *)(v21 + 16);
          if (!v24)
            goto LABEL_26;
          if (v24 != 1)
          {
            v26 = 0;
            goto LABEL_28;
          }
          -[BSTransaction _buildGraphEdgeDescriptionWithType:fromTransaction:toTransaction:]((uint64_t)CFSTR("childSerial"), (id)a1, v23);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v26 = (void *)v25;
LABEL_28:
          objc_msgSend(a3, "addObject:", v26);
          -[BSTransaction _populateGraphIntoNodes:edges:](v23, a2, a3);

          objc_autoreleasePoolPop(v22);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

  }
}

uint64_t __54__BSTransaction__sanitizedCustomDescriptionProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "bs_isPlistableType");
  if ((_DWORD)result)
    return objc_msgSend(a3, "bs_isPlistableType");
  return result;
}

- (id)_buildGraphEdgeDescriptionWithType:(uint64_t)a1 fromTransaction:(id)a2 toTransaction:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v9[0] = a1;
  v8[0] = CFSTR("type");
  v8[1] = CFSTR("from");
  -[BSTransaction _graphNodeIdentifier](a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("to");
  -[BSTransaction _graphNodeIdentifier](a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_descriptionForDebugging:(uint64_t)a3 indentLevel:(void *)a4 visited:
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v36;
  const __CFString *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v47;
  void *v48;
  uint64_t i;
  void *v52;
  uint64_t v53;
  id v54;
  _QWORD v55[4];
  id v56;
  void *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[4];
  id v61;
  void *v62;
  uint64_t v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id *v73;
  uint64_t v74;
  _BYTE v75[128];
  id v76;
  id *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = a1;
    v54 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    for (i = a3; a3; --a3)
      objc_msgSend(v54, "appendString:", CFSTR("    "));
    v52 = (void *)objc_msgSend(v54, "mutableCopy");
    objc_msgSend(v52, "appendString:", CFSTR("    "));
    v6 = (void *)objc_msgSend(v52, "mutableCopy");
    objc_msgSend(v6, "appendString:", CFSTR("    "));
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend((id)v5, "_descriptionProem");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E1EC08D0;
    if (!i)
      v10 = CFSTR("\n");
    objc_msgSend(v7, "appendFormat:", CFSTR("%@%@%@\n"), v10, v54, v8);

    if ((objc_msgSend(a4, "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(a4, "addObject:", v5);
      if (*(_QWORD *)(v5 + 72) == 3)
        v11 = CFSTR("YES\n");
      else
        v11 = CFSTR("NO\n");
      objc_msgSend(v7, "appendFormat:", CFSTR("%@Completed: %@"), v52, v11);
      objc_msgSend((id)v5, "_customizedDescriptionProperties");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v48, "count");
      if (v48)
      {
        v13 = v12;
        if (v12)
        {
          v76 = 0;
          v77 = &v76;
          v78 = 0x2020000000;
          v79 = 0;
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke;
          v69[3] = &unk_1E1EBECC8;
          v14 = v7;
          v70 = v14;
          v71 = v52;
          v72 = v6;
          v73 = &v76;
          v74 = v13;
          objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v69);
          objc_msgSend(v14, "appendString:", CFSTR("\n"));

          _Block_object_dispose(&v76, 8);
        }
      }
      if ((objc_msgSend((id)v5, "isComplete") & 1) == 0)
      {
        if (objc_msgSend((id)v5, "isInterruptible"))
          v15 = CFSTR("YES\n");
        else
          v15 = CFSTR("NO\n");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Interruptible? %@"), v52, v15);
      }
      if (*(_BYTE *)(v5 + 25))
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Interrupted: %@"), v52, CFSTR("YES\n"));
      if (*(_BYTE *)(v5 + 137))
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Failed: %@"), v52, CFSTR("YES\n"));
      if (*(_BYTE *)(v5 + 24))
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Aborted: %@"), v52, CFSTR("YES\n"));
      v16 = *(void **)(v5 + 144);
      if (v16)
      {
        objc_msgSend(v16, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Error domain: %@; Code: %d\n"),
          v52,
          v17,
          objc_msgSend(*(id *)(v5 + 144), "code"));

        objc_msgSend(*(id *)(v5 + 144), "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Error description: %@\n"), v52, v18);

      }
      v19 = objc_msgSend(*(id *)(v5 + 56), "count");
      if (v19)
        v20 = CFSTR("\n");
      else
        v20 = CFSTR("(none)\n");
      objc_msgSend(v7, "appendFormat:", CFSTR("%@Milestones pending: %@"), v52, v20);
      if (v19)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v47 = v5;
        v21 = *(id *)(v5 + 56);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        if (v22)
        {
          v23 = 0;
          v24 = *(_QWORD *)v66;
          do
          {
            v25 = 0;
            v26 = v23 + 1;
            v53 = v22 + v23;
            do
            {
              if (*(_QWORD *)v66 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v6, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v25));
              if (v26 + v25 < v19)
                objc_msgSend(v7, "appendString:", CFSTR("\n"));
              ++v25;
            }
            while (v22 != v25);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
            v23 = v53;
          }
          while (v22);
        }

        v5 = v47;
        objc_msgSend(v7, "appendString:", CFSTR("\n"));
      }
      v27 = *(void **)(v5 + 80);
      if (v27)
      {
        objc_msgSend(v27, "items");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");
        if (v29)
          v30 = CFSTR("\n");
        else
          v30 = CFSTR("(none)\n");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Audit history: %@"), v52, v30);
        if (v29)
        {
          v31 = 0;
          do
          {
            objc_msgSend(v28, "objectAtIndex:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v6, v32);

            if (++v31 < v29)
              objc_msgSend(v7, "appendString:", CFSTR("\n"));
          }
          while (v29 != v31);
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
        }

      }
      -[BSTransaction _childTransactionsWithSchedulingPolicy:](v5, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSTransaction _childTransactionsWithSchedulingPolicy:](v5, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
        v35 = CFSTR("\n");
      else
        v35 = CFSTR("(none)\n");
      objc_msgSend(v7, "appendFormat:", CFSTR("%@Concurrent child transactions: %@"), v52, v35);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_3;
      v60[3] = &unk_1E1EBECF0;
      v36 = v7;
      v64 = a2;
      v61 = v36;
      v62 = a4;
      v63 = i;
      objc_msgSend(v34, "enumerateObjectsUsingBlock:", v60);
      if (objc_msgSend(v33, "count"))
        v37 = CFSTR("\n");
      else
        v37 = CFSTR("(none)\n");
      objc_msgSend(v36, "appendFormat:", CFSTR("%@Serial child transactions: %@"), v52, v37);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_4;
      v55[3] = &unk_1E1EBECF0;
      v38 = v36;
      v59 = a2;
      v57 = a4;
      v58 = i;
      v56 = v38;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v55);
      if (!i && a2)
      {
        v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[BSTransaction _populateGraphIntoNodes:edges:](v5, v39, v40);
        v80[0] = CFSTR("nodes");
        v80[1] = CFSTR("edges");
        v76 = v39;
        v77 = (id *)v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, v80, 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v41, 0, &v76);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v76;
        objc_msgSend(v42, "base64EncodedStringWithOptions:", 32);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "appendFormat:", CFSTR("graph-base64-encoded: %@"), v44);
        objc_msgSend(v38, "appendString:", CFSTR("\n"));
      }
      v45 = v38;

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke(uint64_t a1, uint64_t a2, __CFString *a3)
{
  char isKindOfClass;
  char v7;
  __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  unint64_t v22;
  __CFString *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 || (v7 & 1) != 0)
  {
    v11 = a3;
    v12 = -[__CFString count](v11, "count");
    v13 = CFSTR("\n");
    if (!v12)
      v13 = CFSTR("(none)\n");
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%@: %@"), *(_QWORD *)(a1 + 40), a2, v13);
    if (v12)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v23 = v11;
      v14 = v11;
      v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v15)
      {
        v16 = 0;
        v17 = *(_QWORD *)v31;
        do
        {
          v18 = 0;
          v19 = v16 + 1;
          v16 += v15;
          do
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18));
            if (v19 + v18 < v12)
              objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
            ++v18;
          }
          while (v15 != v18);
          v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      v11 = v23;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = a3;
      v9 = -[__CFString count](v8, "count");
      v10 = CFSTR("\n");
      if (!v9)
        v10 = CFSTR("(none)\n");
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%@: %@"), *(_QWORD *)(a1 + 40), a2, v10);
      if (v9)
      {
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x2020000000;
        v29[3] = 0;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_2;
        v24[3] = &unk_1E1EBECA0;
        v25 = *(id *)(a1 + 32);
        v26 = *(id *)(a1 + 48);
        v27 = v29;
        v28 = v9;
        -[__CFString enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v24);

        _Block_object_dispose(v29, 8);
      }

    }
    else
    {
      v20 = CFSTR("(none)\n");
      if (a3)
        v20 = a3;
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%@: %@"), *(_QWORD *)(a1 + 40), a2, v20);
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(_QWORD *)(v21 + 24) + 1;
  if (v22 < *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(_QWORD *)(v21 + 24) + 1;
  }
  *(_QWORD *)(v21 + 24) = v22;
}

uint64_t __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%@ = %@"), *(_QWORD *)(a1 + 40), a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v5 + 24) + 1;
  if (v6 < *(_QWORD *)(a1 + 56))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24) + 1;
  }
  *(_QWORD *)(v5 + 24) = v6;
  return result;
}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48) + 2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@"), v3);

}

void __62__BSTransaction__descriptionForDebugging_indentLevel_visited___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  -[BSTransaction _descriptionForDebugging:indentLevel:visited:](a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48) + 2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@"), v3);

}

- (uint64_t)_terminateNow
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 137))
  {
    objc_msgSend(*(id *)(a1 + 144), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("error-reason"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_willFailWithReason:", v3);

  }
  objc_msgSend((id)a1, "_willComplete");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)a1, "childTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 144);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "queue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          BSDispatchQueueAssert(v10);

          if (!*(_BYTE *)(v8 + 24) && !*(_BYTE *)(v8 + 137) && (objc_msgSend((id)v8, "isComplete") & 1) == 0)
          {
            *(_BYTE *)(v8 + 24) = 1;
            if (!*(_QWORD *)(v8 + 144))
            {
              -[BSTransaction _createErrorWithCode:reason:description:precipitatingError:](v8, 3, (uint64_t)CFSTR("parent transaction"), 0, v9);
              v11 = objc_claimAutoreleasedReturnValue();
              v12 = *(void **)(v8 + 144);
              *(_QWORD *)(v8 + 144) = v11;

            }
            if (os_log_type_enabled(*(os_log_t *)(v8 + 88), OS_LOG_TYPE_INFO)
              || objc_msgSend((id)v8, "isAuditHistoryEnabled"))
            {
              if (objc_msgSend((id)v8, "isAuditHistoryEnabled"))
              {
                objc_msgSend(*(id *)(v8 + 144), "description");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v8, "_addAuditHistoryItem:", CFSTR("Aborting with error: %@"), v13);

              }
              v14 = *(id *)(v8 + 88);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = (id)objc_opt_class();
                objc_msgSend(*(id *)(v8 + 144), "description");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v24 = v15;
                v25 = 2048;
                v26 = v8;
                v27 = 2114;
                v28 = v16;
                _os_log_impl(&dword_18A184000, v14, OS_LOG_TYPE_INFO, "<%{public}@:%p> Aborting with error: %{public}@", buf, 0x20u);

              }
            }
            if (!objc_msgSend(*(id *)(v8 + 16), "count"))
              -[BSTransaction _terminateNow](v8);
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  return -[BSTransaction _noteCompleted](a1);
}

uint64_t __44__BSTransaction__interruptWithReason_force___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_willInterruptWithReason:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "childTransactions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isRunning")
          && (objc_msgSend(v6, "isComplete") & 1) == 0
          && (objc_msgSend(v6, "isInterrupted") & 1) == 0)
        {
          -[BSTransaction _interruptWithReason:force:](v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didInterruptWithReason:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "removeAllMilestones");
}

- (BOOL)shouldWatchdog:(id *)a3
{
  return 1;
}

- (double)watchdogTimeout
{
  return 30.0;
}

- (void)_removeDebugLogCategory:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_debugLogCategories, "removeObject:");
}

- (id)_loggingProem
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[BSTransaction _descriptionProem](self, "_descriptionProem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: "), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSError)error
{
  return self->_error;
}

@end
