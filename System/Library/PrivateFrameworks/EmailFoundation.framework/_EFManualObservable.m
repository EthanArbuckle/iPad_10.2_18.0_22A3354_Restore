@implementation _EFManualObservable

- (id)subscribe:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  EFCancelationToken *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v12 = 0;
  v5 = -[_EFManualObservable _addObserver:failureError:](self, "_addObserver:failureError:", v4, &v12);
  v6 = v12;
  v7 = objc_alloc_init(EFCancelationToken);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33___EFManualObservable_subscribe___block_invoke;
  v10[3] = &unk_1E62A58B0;
  v10[4] = self;
  v8 = v4;
  v11 = v8;
  -[EFCancelationToken addCancelationBlock:](v7, "addCancelationBlock:", v10);
  if (v5)
  {
    if (v6)
      objc_msgSend(v8, "observerDidFailWithError:", v6);
    else
      objc_msgSend(v8, "observerDidComplete");
  }

  return v7;
}

- (BOOL)_addObserver:(id)a3 failureError:(id *)a4
{
  _EFManualObservable *v7;
  _BOOL4 didCompleteOrFail;
  void *v10;
  void *v11;

  v7 = (_EFManualObservable *)a3;
  if (v7 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_EFManualObservable.m"), 107, CFSTR("can't observe self"));

    if (a4)
      goto LABEL_3;
  }
  else if (a4)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_EFManualObservable.m"), 108, CFSTR("out variable should always be provided"));

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  didCompleteOrFail = self->_didCompleteOrFail;
  if (self->_didCompleteOrFail)
    *a4 = objc_retainAutorelease(self->_failureError);
  else
    -[NSMutableArray addObject:](self->_observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

  return didCompleteOrFail;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail)
    v6 = 0;
  else
    v6 = (void *)-[NSMutableArray copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "observerDidReceiveResult:", v4, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (_EFManualObservable)init
{
  _EFManualObservable *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSError *failureError;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_EFManualObservable;
  v2 = -[_EFManualObservable init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v3;

    failureError = v2->_failureError;
    v2->_failureError = 0;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_didCompleteOrFail = 0;
  }
  return v2;
}

- (void)_removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)observerDidComplete
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail)
  {
    v4 = 0;
  }
  else
  {
    self->_didCompleteOrFail = 1;
    v4 = (void *)-[NSMutableArray copy](self->_observers, "copy");
  }
  os_unfair_lock_unlock(p_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "observerDidComplete", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)observerDidFailWithError:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didCompleteOrFail)
  {
    v7 = 0;
  }
  else
  {
    self->_didCompleteOrFail = 1;
    objc_storeStrong((id *)&self->_failureError, a3);
    v7 = (void *)-[NSMutableArray copy](self->_observers, "copy");
  }
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "observerDidFailWithError:", v5, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureError, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
