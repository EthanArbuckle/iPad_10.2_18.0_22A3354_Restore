@implementation ML3LibraryNotificationManager

void __74__ML3LibraryNotificationManager_initWithLibrary_distributedAndLocalNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D4D068];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithDistributedName:localName:queue:", v7, v6, 0);

  objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v8);

}

- (ML3LibraryNotificationManager)initWithLibrary:(id)a3 distributedAndLocalNames:(id)a4
{
  id v7;
  id v8;
  ML3LibraryNotificationManager *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v17;
  NSMutableArray *notificationObservers;
  NSMutableOrderedSet *v19;
  NSMutableOrderedSet *queuedLocalNotifications;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *queuedDistributedNotificationNames;
  void *v24;
  _QWORD v25[4];
  ML3LibraryNotificationManager *v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ML3LibraryNotificationManager;
  v9 = -[ML3LibraryNotificationManager init](&v27, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("ML3LibraryNotificationManager.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

    }
    objc_storeWeak((id *)&v9->_library, v7);
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.MusicLibrary.%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    notificationObservers = v9->_notificationObservers;
    v9->_notificationObservers = v17;

    v19 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    queuedLocalNotifications = v9->_queuedLocalNotifications;
    v9->_queuedLocalNotifications = v19;

    v21 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    queuedDistributedNotificationNames = v9->_queuedDistributedNotificationNames;
    v9->_queuedDistributedNotificationNames = v21;

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__ML3LibraryNotificationManager_initWithLibrary_distributedAndLocalNames___block_invoke;
    v25[3] = &unk_1E5B65448;
    v26 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
  return v9;
}

- (void)addObserverForDistributedName:(id)a3 localName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0D4D068];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithDistributedName:localName:queue:", v8, v7, 0);

  -[NSMutableArray addObject:](self->_notificationObservers, "addObject:", v9);
}

- (void)removeObserverWithDistributedName:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_notificationObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "distributedName", (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    -[NSMutableArray removeObject:](self->_notificationObservers, "removeObject:", v13);
    v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)removeObserverWithLocalName:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_notificationObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "localName", (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    -[NSMutableArray removeObject:](self->_notificationObservers, "removeObject:", v13);
    v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)enqueueLocalNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)enqueueLocalNotificationNamed:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB37C0];
  v5 = a3;
  v6 = [v4 alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v8 = (id)objc_msgSend(v6, "initWithName:object:userInfo:", v5, WeakRetained, 0);

  -[ML3LibraryNotificationManager enqueueLocalNotification:](self, "enqueueLocalNotification:", v8);
}

- (void)enqueueDistributedNotificationNamed:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ML3LibraryNotificationManager_enqueueDistributedNotificationNamed___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (BOOL)observerShouldForwardDistributedNotification:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "localName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    objc_msgSend(WeakRetained, "databasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

    v13 = 0;
    notify_get_state(objc_msgSend(v4, "notifyToken"), &v13);
    if (v13 == v8)
    {
      v14 = CFSTR("isSourceExternal");
      v15[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)&self->_library);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", v5, v10, v9);
      -[ML3LibraryNotificationManager enqueueLocalNotification:](self, "enqueueLocalNotification:", v11);

    }
  }

  return 0;
}

- (id)_observerForLocalName:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_notificationObservers;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "localName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_observerForDistributedName:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_notificationObservers;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "distributedName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_postEnqueuedLocalNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_postEnqueuedDistributedNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (ML3MusicLibrary)library
{
  return (ML3MusicLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_queuedDistributedNotificationNames, 0);
  objc_storeStrong((id *)&self->_queuedLocalNotifications, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14336;
  v24 = __Block_byref_object_dispose__14337;
  v25 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke_2;
  block[3] = &unk_1E5B65E48;
  block[4] = v2;
  block[5] = &v20;
  dispatch_sync(v3, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)v21[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_observerForDistributedName:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = objc_msgSend(v8, "notifyToken");
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
          objc_msgSend(WeakRetained, "databasePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hash");

          notify_set_state(v10, v13);
        }
        notify_post((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14336;
  v17 = __Block_byref_object_dispose__14337;
  v18 = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke_18;
  block[3] = &unk_1E5B65E48;
  block[4] = v1;
  block[5] = &v13;
  dispatch_sync(v2, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
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
        objc_msgSend(v3, "postNotification:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

uint64_t __69__ML3LibraryNotificationManager_enqueueDistributedNotificationNamed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_postEnqueuedDistributedNotifications");
  }
  return result;
}

void __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke_2;
  v4[3] = &unk_1E5B638B0;
  v5 = v2;
  if (objc_msgSend(v3, "indexOfObjectPassingTest:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_postEnqueuedLocalNotifications");
  }

}

uint64_t __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
