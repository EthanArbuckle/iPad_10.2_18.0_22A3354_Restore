@implementation SGCuratedChangeNotificationsBaseListener

- (SGCuratedChangeNotificationsBaseListener)init
{
  SGCuratedChangeNotificationsBaseListener *v2;
  uint64_t v3;
  NSMapTable *liveObserversMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGCuratedChangeNotificationsBaseListener;
  v2 = -[SGCuratedChangeNotificationsBaseListener init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    liveObserversMap = v2->_liveObserversMap;
    v2->_liveObserversMap = (NSMapTable *)v3;

    -[SGCuratedChangeNotificationsBaseListener startListening](v2, "startListening");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SGCuratedChangeNotificationsBaseListener stopListening](self, "stopListening");
  v3.receiver = self;
  v3.super_class = (Class)SGCuratedChangeNotificationsBaseListener;
  -[SGCuratedChangeNotificationsBaseListener dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3 forObjectLifetime:(id)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *liveObserversMap;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self->_liveObserversMap;
  objc_sync_enter(v7);
  liveObserversMap = self->_liveObserversMap;
  v9 = (void *)objc_msgSend(v11, "copy");
  v10 = (void *)MEMORY[0x1C3BD5158]();
  -[NSMapTable setObject:forKey:](liveObserversMap, "setObject:forKey:", v10, v6);

  objc_sync_exit(v7);
}

- (void)fire
{
  NSMapTable *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_liveObserversMap;
  v4 = objc_sync_enter(v3);
  v5 = (void *)MEMORY[0x1C3BD4F6C](v4);
  -[NSMapTable objectEnumerator](self->_liveObserversMap, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  objc_sync_exit(v3);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v10 = v9;
  if (v9)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD4F6C](v9);
        (*(void (**)(uint64_t))(v13 + 16))(v13);
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = v9;
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveObserversMap, 0);
}

@end
