@implementation NRMutableStateBase

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (NRMutableStateBase)init
{
  NRMutableStateBase *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRMutableStateBase;
  result = -[NRMutableStateBase init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setParentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parentDelegate, a3);
}

- (id)addObserverQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  _QWORD *v11;
  NRMutableStateBase *v12;
  id v13;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  NRMutableStateBase *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = __49__NRMutableStateBase_addObserverQueue_withBlock___block_invoke;
  v17 = &unk_1E4495F38;
  v18 = self;
  v8 = v7;
  v20 = v8;
  v9 = v6;
  v19 = v9;
  v21 = &v22;
  p_lock = &self->_lock;
  v11 = v15;
  v12 = self;
  os_unfair_lock_lock_with_options();
  v16((uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
  v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __49__NRMutableStateBase_addObserverQueue_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NRMutableStateBaseObserverWrapper *self;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

  }
  self = objc_alloc_init(NRMutableStateBaseObserverWrapper);
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v5, *(id *)(a1 + 48), 8);
    objc_storeStrong((id *)&self->_queue, *(id *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)parentDelegate
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  NRMutableStateBase *v5;
  id v6;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  NRMutableStateBase *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __36__NRMutableStateBase_parentDelegate__block_invoke;
  v10 = &unk_1E4495A48;
  p_lock = &self->_lock;
  v11 = self;
  v12 = &v13;
  v4 = v8;
  v5 = self;
  os_unfair_lock_lock_with_options();
  v9((uint64_t)v4);

  os_unfair_lock_unlock(p_lock);
  v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __36__NRMutableStateBase_parentDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)applyDiff:(id)a3
{
  if (!a3)
    return 0;
  -[NRMutableStateBase applyDiff:upOnly:notifyParent:unconditional:](self, "applyDiff:upOnly:notifyParent:unconditional:", a3, 0, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  return 0;
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  return 0;
}

+ (id)enclosedClassTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)classTypes
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "enclosedClassTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)notifyParentWithDiff:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NRMutableStateBase parentDelegate](self, "parentDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "child:didApplyDiff:", self, v4);

}

- (void)notifyObserversWithDiff:(id)a3
{
  id v4;
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  _QWORD *v7;
  NRMutableStateBase *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void (**v16)(id, id, _QWORD);
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  void (*v25)(uint64_t);
  void *v26;
  NRMutableStateBase *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke;
  v26 = &unk_1E4495A48;
  p_lock = &self->_lock;
  v27 = self;
  v28 = &v29;
  v7 = v24;
  v8 = self;
  os_unfair_lock_lock_with_options();
  v25((uint64_t)v7);

  os_unfair_lock_unlock(p_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)v30[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        if (v13)
        {
          v14 = *(NSObject **)(v13 + 16);
          if (v14)
          {
            v18[0] = v5;
            v18[1] = 3221225472;
            v18[2] = __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke_2;
            v18[3] = &unk_1E4495030;
            v18[4] = v13;
            v19 = v4;
            dispatch_async(v14, v18);

            goto LABEL_11;
          }
          v15 = *(void **)(v13 + 8);
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;
        v16[2](v16, v4, v13);

LABEL_11:
        ++v12;
      }
      while (v10 != v12);
      v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
      v10 = v17;
    }
    while (v17);
  }

  _Block_object_dispose(&v29, 8);
}

void __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __46__NRMutableStateBase_notifyObserversWithDiff___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 8);
  else
    v2 = 0;
  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NRMutableStateBase *v6;
  id v7;
  _QWORD v8[6];

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__NRMutableStateBase_removeObserver___block_invoke;
  v8[3] = &unk_1E4495030;
  v8[4] = self;
  v8[5] = v4;
  p_lock = &self->_lock;
  v6 = self;
  v7 = v4;
  os_unfair_lock_lock_with_options();
  __37__NRMutableStateBase_removeObserver___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(p_lock);

}

void __37__NRMutableStateBase_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "nonretainedObjectValue");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", v2);

  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NRMutableStateBase *v3;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&v3->_parentDelegate, 0);
  -[NSMutableSet removeAllObjects](v3->_observers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (self)
    v6 = v4 == 0;
  else
    v6 = 0;
  v7 = !v6;
  return (isKindOfClass & 1) != 0 && v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

@end
