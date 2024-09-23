@implementation LSObserver

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.launchservices", "observer");
    v3 = (void *)_LSObserverLog;
    _LSObserverLog = (uint64_t)v2;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[LSObserver _tearDownCallbacks](self, "_tearDownCallbacks");
  v3.receiver = self;
  v3.super_class = (Class)LSObserver;
  -[LSObserver dealloc](&v3, sel_dealloc);
}

- (LSObserverDelegate)delegate
{
  id WeakRetained;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_recursive_lock_unlock();
  return (LSObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  void *v5;
  id obj;

  obj = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSObserver.mm"), 68, CFSTR("Attempting to set an observer's delegate while it is already observing."));

  }
  objc_storeWeak((id *)&self->_delegate, obj);
  os_unfair_recursive_lock_unlock();

}

- (NSOperationQueue)queue
{
  NSOperationQueue *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_queue;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setQueue:(id)a3
{
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  void *v7;

  v5 = (NSOperationQueue *)a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSObserver.mm"), 87, CFSTR("Attempting to set an observer's queue while it is already observing."));

  }
  queue = self->_queue;
  self->_queue = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)startObserving
{
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSObserver.mm"), 95, CFSTR("Already invoked -startObserving on this observer."));

  }
  -[LSObserver _configureCallbacks](self, "_configureCallbacks");
  *((_BYTE *)self + 32) |= 1u;
  os_unfair_recursive_lock_unlock();
}

- (void)stopObserving
{
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  if ((*((_BYTE *)self + 32) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSObserver.mm"), 106, CFSTR("Invoked -stopObserving on this observer without first invoking -startObserving."));

  }
  -[LSObserver _tearDownCallbacks](self, "_tearDownCallbacks");
  *((_BYTE *)self + 32) &= ~1u;
  os_unfair_recursive_lock_unlock();
}

- (void)_configureCallbacks
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Delegate %@ does not respond to -observerDidObserveDatabaseChange:, will not notify it of anything.", (uint8_t *)&v2, 0xCu);
}

void __33__LSObserver__configureCallbacks__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[6];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__LSObserver__configureCallbacks__block_invoke_2;
  v13[3] = &unk_1E10445D8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v5 = MEMORY[0x186DAE9BC](v13);
  v6 = (void *)v5;
  if (*(_QWORD *)(a1 + 32))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3812000000;
    v11[3] = __Block_byref_object_copy__33;
    v11[4] = __Block_byref_object_dispose__33;
    v11[5] = 256;
    v12 = *a2;
    v7 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __33__LSObserver__configureCallbacks__block_invoke_17;
    v8[3] = &unk_1E1044600;
    v9 = v6;
    v10 = v11;
    objc_msgSend(v7, "addOperationWithBlock:", v8);

    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*(void (**)(uint64_t, id *))(v5 + 16))(v5, a2);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __33__LSObserver__configureCallbacks__block_invoke_2(uint64_t a1, LaunchServices::DatabaseContext *a2)
{
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__LSObserver__configureCallbacks__block_invoke_3;
    v6[3] = &unk_1E10422C8;
    v7 = v4;
    v8 = WeakRetained;
    _LSDatabaseContextAccessContextUsingBlock(a2, (uint64_t)v6);

  }
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidObserveDatabaseChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
}

- (void)_tearDownCallbacks
{
  NSObject *changeObserver;
  NSObject *v4;

  changeObserver = self->_changeObserver;
  if (changeObserver)
  {
    _LSContextRemoveChangeObserver(changeObserver);
    v4 = self->_changeObserver;
    self->_changeObserver = 0;

  }
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[LSObserver name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> \"%@\"), objc_opt_class(), self, v3);
  }
  else
  {
    -[LSObserver description](self, "description");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_changeObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
