@implementation ATXSigtermListener

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ATXSigtermListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __36__ATXSigtermListener_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA46674]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSigtermListener)init
{
  ATXSigtermListener *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXSigtermListener;
  v2 = -[ATXSigtermListener init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    signal(15, (void (__cdecl *)(int))1);
    v5 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, 0);
    v6 = (void *)init_sigterm_source;
    init_sigterm_source = (uint64_t)v5;

    objc_initWeak(&location, v2);
    v7 = init_sigterm_source;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__ATXSigtermListener_init__block_invoke;
    v9[3] = &unk_1E82BF590;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v7, v9);
    dispatch_activate((dispatch_object_t)init_sigterm_source);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__ATXSigtermListener_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversOfSigterm");

}

- (void)_notifyObserversOfSigterm
{
  ATXSigtermListener *v2;
  NSHashTable *v3;
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
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "handleSigterm", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)registerObserver:(id)a3
{
  ATXSigtermListener *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  ATXSigtermListener *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
