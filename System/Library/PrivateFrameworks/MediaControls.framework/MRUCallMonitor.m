@implementation MRUCallMonitor

+ (MRUCallMonitor)sharedMonitor
{
  if (sharedMonitor___once != -1)
    dispatch_once(&sharedMonitor___once, &__block_literal_global_42);
  return (MRUCallMonitor *)(id)sharedMonitor___sharedMonitor;
}

void __31__MRUCallMonitor_sharedMonitor__block_invoke()
{
  MRUCallMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MRUCallMonitor);
  v1 = (void *)sharedMonitor___sharedMonitor;
  sharedMonitor___sharedMonitor = (uint64_t)v0;

}

- (MRUCallMonitor)init
{
  MRUCallMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CXCallObserver *v8;
  CXCallObserver *callObserver;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUCallMonitor;
  v2 = -[MRUCallMonitor init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.amp.MediaRemote.UI.MRUCallMonitor.shared", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E0C932E0]);
    callObserver = v2->_callObserver;
    v2->_callObserver = v8;

    -[CXCallObserver setDelegate:queue:](v2->_callObserver, "setDelegate:queue:", v2, v2->_queue);
    -[MRUCallMonitor updateOnCall](v2, "updateOnCall");
  }
  return v2;
}

- (BOOL)isCallActive
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  -[CXCallObserver calls](self->_callObserver, "calls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasEnded"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setOnCall:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_onCall != a3)
  {
    self->_onCall = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __28__MRUCallMonitor_setOnCall___block_invoke;
    v3[3] = &unk_1E5818D00;
    v3[4] = self;
    v4 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v3);
  }
}

void __28__MRUCallMonitor_setOnCall___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "callMonitorDidUpdateOnCall:isOnCall:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)updateOnCall
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MRUCallMonitor_updateOnCall__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__MRUCallMonitor_updateOnCall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOnCall:", objc_msgSend(*(id *)(a1 + 32), "isCallActive"));
}

- (BOOL)isOnCall
{
  return self->_onCall;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
