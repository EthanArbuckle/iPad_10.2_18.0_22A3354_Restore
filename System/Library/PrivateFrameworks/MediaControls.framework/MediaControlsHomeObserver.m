@implementation MediaControlsHomeObserver

- (MediaControlsHomeObserver)init
{
  MediaControlsHomeObserver *v2;
  MediaControlsHomeObserver *v3;
  id v4;
  const char *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  uint64_t v8;
  OS_dispatch_queue *notifyQueue;
  NSMutableSet *v10;
  NSMutableSet *knownUIDs;
  void *v12;
  id v13;
  uint64_t v14;
  HMHomeManager *homeManager;
  NSObject *v16;
  _QWORD block[4];
  MediaControlsHomeObserver *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MediaControlsHomeObserver;
  v2 = -[MediaControlsHomeObserver init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MediaControlsHomeObserver description](v2, "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");

    v6 = dispatch_queue_create(v5, 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v6;

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownUIDs = v3->_knownUIDs;
    v3->_knownUIDs = v10;

    objc_msgSend(MEMORY[0x1E0CBA6C8], "defaultPrivateConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOptions:", 1344);
    objc_msgSend(v12, "setDiscretionary:", 1);
    v13 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v13, "setUnderlyingQueue:", v3->_serialQueue);
    objc_msgSend(v13, "setQualityOfService:", -1);
    objc_msgSend(v12, "setDelegateQueue:", v13);
    objc_msgSend(v12, "setAdaptive:", 1);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA550]), "initWithHomeMangerConfiguration:", v12);
    homeManager = v3->_homeManager;
    v3->_homeManager = (HMHomeManager *)v14;

    v16 = v3->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__MediaControlsHomeObserver_init__block_invoke;
    block[3] = &unk_1E5818C88;
    v19 = v3;
    dispatch_async(v16, block);

  }
  return v3;
}

uint64_t __33__MediaControlsHomeObserver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIDs");
}

- (void)beginObserving
{
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
  -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[HMHomeManager homes](self->_homeManager, "homes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDelegate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)stopObserving
{
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
  -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[HMHomeManager homes](self->_homeManager, "homes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)hasAccessoryWithUID:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MediaControlsHomeObserver_hasAccessoryWithUID___block_invoke;
  block[3] = &unk_1E5819700;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __49__MediaControlsHomeObserver_hasAccessoryWithUID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_updateUIDs
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMHomeManager homes](self->_homeManager, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v7, "accessories");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "mediaProfile");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "routeUID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v14, "length"))
                -[NSMutableSet addObject:](self->_knownUIDs, "addObject:", v14);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  -[MediaControlsHomeObserver _notifyDelegate](self, "_notifyDelegate");
}

- (void)_notifyDelegate
{
  void *v3;
  char v4;
  NSObject *notifyQueue;
  _QWORD block[5];

  -[MediaControlsHomeObserver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    notifyQueue = self->_notifyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MediaControlsHomeObserver__notifyDelegate__block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_async(notifyQueue, block);
  }
}

void __44__MediaControlsHomeObserver__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeObserverDidUpdateKnownUIDs:", *(_QWORD *)(a1 + 32));

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  void *v4;
  uint64_t v5;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "homes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setDelegate:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MediaControlsHomeObserver _updateUIDs](self, "_updateUIDs");
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "setDelegate:", self);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "accessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "mediaProfile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "routeUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          -[NSMutableSet addObject:](self->_knownUIDs, "addObject:", v12);
          -[MediaControlsHomeObserver _notifyDelegate](self, "_notifyDelegate");
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  objc_msgSend(a4, "accessories", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "mediaProfile");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "routeUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
        {
          -[NSMutableSet removeObject:](self->_knownUIDs, "removeObject:", v11);
          -[MediaControlsHomeObserver _notifyDelegate](self, "_notifyDelegate");
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "mediaProfile", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableSet addObject:](self->_knownUIDs, "addObject:", v6);
    -[MediaControlsHomeObserver _notifyDelegate](self, "_notifyDelegate");
  }

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "mediaProfile", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableSet removeObject:](self->_knownUIDs, "removeObject:", v6);
    -[MediaControlsHomeObserver _notifyDelegate](self, "_notifyDelegate");
  }

}

- (MediaControlsHomeObserverDelegate)delegate
{
  return (MediaControlsHomeObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_knownUIDs, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
