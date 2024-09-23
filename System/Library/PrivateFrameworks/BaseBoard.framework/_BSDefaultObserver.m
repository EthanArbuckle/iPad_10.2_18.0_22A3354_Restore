@implementation _BSDefaultObserver

- (id)initWithAbstractDefaultDomain:(void *)a3 defaultsToObserve:(void *)a4 onQueue:(void *)a5 withBlock:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  id *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v30 = a3;
  v11 = a4;
  v12 = a5;
  v29 = v10;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (v10)
  {
    if (v11)
      goto LABEL_4;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, CFSTR("_BSDefaultObserver.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v12)
      goto LABEL_5;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, CFSTR("_BSDefaultObserver.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, CFSTR("_BSDefaultObserver.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultDomain"));

  if (!v11)
    goto LABEL_18;
LABEL_4:
  if (!v12)
    goto LABEL_19;
LABEL_5:
  if (!objc_msgSend(v30, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, CFSTR("_BSDefaultObserver.m"), 36, CFSTR("Must have at least one default to observe."));

  }
  v35.receiver = a1;
  v35.super_class = (Class)_BSDefaultObserver;
  v13 = (id *)objc_msgSendSuper2(&v35, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = v13 + 1;
    objc_storeStrong(v13 + 1, a2);
    objc_storeStrong(v14 + 2, a4);
    v16 = objc_msgSend(v12, "copy");
    v17 = v14[4];
    v14[4] = (id)v16;

    objc_storeStrong(v14 + 3, a3);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v14[3];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v18);
          -[BSAbstractDefaultDomain _defaultKeyFromPropertyName:](*v15, *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v15, "_store");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v14, v22, 1, 0);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v19);
    }

    -[BSAbstractDefaultDomain _addObserver:]((uint64_t)v14[1], v14);
  }
LABEL_16:

  return v14;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BSDefaultObserver.m"), 56, CFSTR("We must be explicitly invalidated in order to be deallocated."));

  }
  v5.receiver = self;
  v5.super_class = (Class)_BSDefaultObserver;
  -[_BSDefaultObserver dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_defaultsToObserve;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          -[BSAbstractDefaultDomain _defaultKeyFromPropertyName:](self->_defaults, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSAbstractDefaultDomain _store](self->_defaults, "_store", (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObserver:forKeyPath:", self, v7);

          ++v6;
        }
        while (v4 != v6);
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

    -[BSAbstractDefaultDomain _removeObserver:]((uint64_t)self->_defaults, self);
    self->_invalidated = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unsigned int *p_debounceCounter;
  unsigned int v8;
  unsigned int v9;
  dispatch_time_t v10;
  NSObject *queue;
  _QWORD v12[5];
  unsigned int v13;

  p_debounceCounter = &self->_debounceCounter;
  do
  {
    v8 = __ldxr(p_debounceCounter);
    v9 = v8 + 1;
  }
  while (__stxr(v8 + 1, p_debounceCounter));
  v10 = dispatch_time(0, 100000000);
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69___BSDefaultObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v12[3] = &unk_1E1EBF620;
  v13 = v9;
  v12[4] = self;
  dispatch_after(v10, queue, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_defaultsToObserve, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
