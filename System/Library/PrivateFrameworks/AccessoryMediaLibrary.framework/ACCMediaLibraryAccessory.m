@implementation ACCMediaLibraryAccessory

- (ACCMediaLibraryAccessory)initWithUID:(id)a3 windowPerLibrary:(unsigned int)a4 provider:(id)a5
{
  id v9;
  id v10;
  ACCMediaLibraryAccessory *v11;
  ACCMediaLibraryAccessory *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *listQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *pendingUpdates;
  NSMutableDictionary *v17;
  NSMutableDictionary *waitingConfirm;
  NSMutableDictionary *v19;
  NSMutableDictionary *pendingPlaylistContentUpdates;
  NSMutableDictionary *v21;
  NSMutableDictionary *libraries;
  NSMutableDictionary *v23;
  NSMutableDictionary *confirmedRevisionList;
  objc_super v26;

  v9 = a3;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)ACCMediaLibraryAccessory;
  v11 = -[ACCMediaLibraryAccessory init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessoryUID, a3);
    objc_storeWeak((id *)&v12->_provider, v10);
    v12->_windowPerLibrary = a4;
    v13 = dispatch_queue_create("com.apple.accMediaLibraryAccessory.listQueue", 0);
    listQueue = v12->_listQueue;
    v12->_listQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingUpdates = v12->_pendingUpdates;
    v12->_pendingUpdates = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    waitingConfirm = v12->_waitingConfirm;
    v12->_waitingConfirm = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingPlaylistContentUpdates = v12->_pendingPlaylistContentUpdates;
    v12->_pendingPlaylistContentUpdates = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    libraries = v12->_libraries;
    v12->_libraries = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    confirmedRevisionList = v12->_confirmedRevisionList;
    v12->_confirmedRevisionList = v23;

  }
  return v12;
}

- (void)dealloc
{
  NSString *accessoryUID;
  OS_dispatch_queue *listQueue;
  NSMutableDictionary *pendingUpdates;
  NSMutableDictionary *waitingConfirm;
  NSMutableDictionary *pendingPlaylistContentUpdates;
  NSMutableDictionary *libraries;
  NSMutableDictionary *confirmedRevisionList;
  objc_super v10;

  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  objc_storeWeak((id *)&self->_provider, 0);
  listQueue = self->_listQueue;
  self->_listQueue = 0;

  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  waitingConfirm = self->_waitingConfirm;
  self->_waitingConfirm = 0;

  pendingPlaylistContentUpdates = self->_pendingPlaylistContentUpdates;
  self->_pendingPlaylistContentUpdates = 0;

  libraries = self->_libraries;
  self->_libraries = 0;

  confirmedRevisionList = self->_confirmedRevisionList;
  self->_confirmedRevisionList = 0;

  v10.receiver = self;
  v10.super_class = (Class)ACCMediaLibraryAccessory;
  -[ACCMediaLibraryAccessory dealloc](&v10, sel_dealloc);
}

- (id)description
{
  void *v2;
  NSString *accessoryUID;
  id WeakRetained;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessoryUID = self->_accessoryUID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ACCMediaLibraryAccessory>[%@ provider=%@]"), accessoryUID, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addLibraryInfo:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *libraries;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "libraryUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v5)
    {
      libraries = self->_libraries;
      objc_msgSend(v8, "libraryUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](libraries, "setObject:forKey:", v8, v7);

      v4 = v8;
    }
  }

}

- (unint64_t)_pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[ACCMediaLibraryAccessory _pendingUpdatesForLibrary:createIfNotExist:](self, "_pendingUpdatesForLibrary:createIfNotExist:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_waitingConfirm, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(v6, "count") + v7;

  return v8;
}

- (unint64_t)pendingAndWaitingConfirmUpdatesCountForLibrary:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ACCMediaLibraryAccessory_pendingAndWaitingConfirmUpdatesCountForLibrary___block_invoke;
  block[3] = &unk_24DCCDC18;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(listQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __75__ACCMediaLibraryAccessory_pendingAndWaitingConfirmUpdatesCountForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pendingAndWaitingConfirmUpdatesCountForLibrary:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_pendingPlaylistContentUpdatesCountForLibrary:(id)a3
{
  void *v3;
  unint64_t v4;

  -[ACCMediaLibraryAccessory _pendingPlaylistContentUpdatesForLibrary:createIfNotExist:](self, "_pendingPlaylistContentUpdatesForLibrary:createIfNotExist:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)pendingPlaylistContentUpdatesCountForLibrary:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ACCMediaLibraryAccessory_pendingPlaylistContentUpdatesCountForLibrary___block_invoke;
  block[3] = &unk_24DCCDC18;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(listQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __73__ACCMediaLibraryAccessory_pendingPlaylistContentUpdatesCountForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pendingPlaylistContentUpdatesCountForLibrary:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3
{
  return -[ACCMediaLibraryAccessory _pendingAndWaitingConfirmUpdatesCountForLibrary:](self, "_pendingAndWaitingConfirmUpdatesCountForLibrary:", a3) >= self->_windowPerLibrary;
}

- (BOOL)pendingUpdatesAndWaitingConfirmFullForLibrary:(id)a3
{
  id v4;
  NSObject *listQueue;
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
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCMediaLibraryAccessory_pendingUpdatesAndWaitingConfirmFullForLibrary___block_invoke;
  block[3] = &unk_24DCCDC18;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(listQueue, block);
  LOBYTE(listQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)listQueue;
}

uint64_t __74__ACCMediaLibraryAccessory_pendingUpdatesAndWaitingConfirmFullForLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pendingUpdatesAndWaitingConfirmFullForLibrary:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_pendingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKey:](self->_pendingUpdates, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (id)_waitingUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_waitingConfirm, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKey:](self->_waitingConfirm, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (id)_pendingPlaylistContentUpdatesForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingPlaylistContentUpdates, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKey:](self->_pendingPlaylistContentUpdates, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (id)_confirmedRevisionListForLibrary:(id)a3 createIfNotExist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_confirmedRevisionList, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary setObject:forKey:](self->_confirmedRevisionList, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (void)_pendingUpdatesRemoveLibraryIfEmpty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !objc_msgSend(0, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_pendingUpdates, "removeObjectForKey:", v5);

}

- (void)_waitingUpdatesRemoveLibraryIfEmpty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_waitingConfirm, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !objc_msgSend(0, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_waitingConfirm, "removeObjectForKey:", v5);

}

- (void)_pendingPlaylistContentUpdatesRemoveLibraryIfEmpty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingPlaylistContentUpdates, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !objc_msgSend(0, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_pendingPlaylistContentUpdates, "removeObjectForKey:", v5);

}

- (void)_confirmedRevisionListRemoveLibraryIfEmpty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_confirmedRevisionList, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !objc_msgSend(0, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_confirmedRevisionList, "removeObjectForKey:", v5);

}

- (void)_addToWaitlistForLibrary:(id)a3 item:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ACCMediaLibraryAccessory _waitingUpdatesForLibrary:createIfNotExist:](self, "_waitingUpdatesForLibrary:createIfNotExist:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)_addToWaitlistForLibrary:(id)a3 list:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ACCMediaLibraryAccessory _waitingUpdatesForLibrary:createIfNotExist:](self, "_waitingUpdatesForLibrary:createIfNotExist:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v6);

}

- (void)_addConfirmedRevisionForLibrary:(id)a3 revision:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ACCMediaLibraryAccessory _confirmedRevisionListForLibrary:createIfNotExist:](self, "_confirmedRevisionListForLibrary:createIfNotExist:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)_addConfirmedRevisionForLibrary:(id)a3 revisionsToAdd:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ACCMediaLibraryAccessory _confirmedRevisionListForLibrary:createIfNotExist:](self, "_confirmedRevisionListForLibrary:createIfNotExist:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v6);

}

- (id)copyPendingNonContentUpdatesToSendForLibrary:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ACCMediaLibraryAccessory_copyPendingNonContentUpdatesToSendForLibrary___block_invoke;
  block[3] = &unk_24DCCDC40;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(listQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__ACCMediaLibraryAccessory_copyPendingNonContentUpdatesToSendForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
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

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_pendingUpdatesForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v2;
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
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "item", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "_addToWaitlistForLibrary:list:", *(_QWORD *)(a1 + 40), v6);
    objc_msgSend(v6, "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "_pendingUpdatesRemoveLibraryIfEmpty:", *(_QWORD *)(a1 + 40));
  }

}

- (id)copyPendingPlaylistContentUpdatesToSendForLibrary:(id)a3
{
  id v4;
  NSObject *listQueue;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__ACCMediaLibraryAccessory_copyPendingPlaylistContentUpdatesToSendForLibrary___block_invoke;
  block[3] = &unk_24DCCDC40;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  dispatch_sync(listQueue, block);
  v7 = (void *)v14[5];
  if (v7)
  {
    objc_msgSend(v7, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __78__ACCMediaLibraryAccessory_copyPendingPlaylistContentUpdatesToSendForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  __int128 v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  void *v44;
  id obj;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_pendingPlaylistContentUpdatesForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_confirmedRevisionListForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v36 = *(_QWORD *)(a1 + 40);
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412802;
    v63 = v37;
    v64 = 2112;
    v65 = v36;
    v66 = 2112;
    v67 = v2;
    _os_log_debug_impl(&dword_21A4E8000, v6, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, pendlist=%@", buf, 0x20u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v38 = *(_QWORD *)(a1 + 40);
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412802;
    v63 = v39;
    v64 = 2112;
    v65 = v38;
    v66 = 2112;
    v67 = v3;
    _os_log_debug_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, revisionList=%@", buf, 0x20u);
  }

  if (v2 && v3)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v44 = v3;
    obj = v3;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v48)
    {
      v10 = 0;
      v47 = *(_QWORD *)v57;
      v11 = MEMORY[0x24BDACB70];
      *(_QWORD *)&v9 = 134218240;
      v43 = v9;
      v46 = v2;
LABEL_23:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v47)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v12);
        v14 = gLogObjects;
        v15 = gNumLogObjects;
        if (!gLogObjects || gNumLogObjects < 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            v63 = v14;
            v64 = 1024;
            LODWORD(v65) = v15;
            _os_log_error_impl(&dword_21A4E8000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v17 = v11;
          v18 = v11;
        }
        else
        {
          v18 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v31 = *(_QWORD *)(v49 + 40);
          v32 = *(_QWORD *)(*(_QWORD *)(v49 + 32) + 16);
          *(_DWORD *)buf = 138412802;
          v63 = v32;
          v64 = 2112;
          v65 = v31;
          v66 = 2112;
          v67 = v13;
          _os_log_debug_impl(&dword_21A4E8000, v18, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, check for revision %@", buf, 0x20u);
        }

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v19 = v2;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v20)
        {
          v21 = v20;
          v50 = v10;
          v22 = 0;
          v23 = *(_QWORD *)v53;
          while (2)
          {
            v24 = 0;
            v51 = v22 + v21;
            do
            {
              if (*(_QWORD *)v53 != v23)
                objc_enumerationMutation(v19);
              v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v24);
              objc_msgSend(v25, "revision", v43);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", v13);

              if (v27)
              {
                v28 = v49;
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v49 + 48) + 8) + 40), v25);
                v30 = v13;

                v29 = v22 + v24;
                v10 = v30;
                v2 = v46;
                v11 = MEMORY[0x24BDACB70];
                goto LABEL_47;
              }
              ++v24;
            }
            while (v21 != v24);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            v22 = v51;
            if (v21)
              continue;
            break;
          }
          v2 = v46;
          v28 = v49;
          v10 = v50;
          v11 = MEMORY[0x24BDACB70];
          v29 = v51;
        }
        else
        {
          v29 = 0;
          v28 = v49;
        }
LABEL_47:

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v28 + 48) + 8) + 40))
          break;
        if (++v12 == v48)
        {
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          if (v48)
            goto LABEL_23;
          break;
        }
      }
    }
    else
    {
      v29 = 0;
      v10 = 0;
      v28 = a1;
    }

    v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v28 + 48) + 8) + 40);
    v3 = v44;
    if (v33)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v34 = MEMORY[0x24BDACB70];
        v35 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v40 = *(_QWORD *)(v49 + 40);
        v41 = *(_QWORD *)(*(_QWORD *)(v49 + 32) + 16);
        v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(v49 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v63 = v41;
        v64 = 2112;
        v65 = v40;
        v66 = 2112;
        v67 = v42;
        _os_log_debug_impl(&dword_21A4E8000, v34, OS_LOG_TYPE_DEBUG, "copyPendingPlaylistContentUpdatesToSendForLibrary: %@, library %@, found %@", buf, 0x20u);
      }

      if (v29 < objc_msgSend(v2, "count"))
        objc_msgSend(v2, "removeObjectAtIndex:", v29);
      if (v10)
        objc_msgSend(obj, "removeObject:", v10);
      objc_msgSend(*(id *)(v49 + 32), "_pendingPlaylistContentUpdatesRemoveLibraryIfEmpty:", *(_QWORD *)(v49 + 40), v43);
      objc_msgSend(*(id *)(v49 + 32), "_confirmedRevisionListRemoveLibraryIfEmpty:", *(_QWORD *)(v49 + 40));
    }

  }
}

- (BOOL)addUpdate:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *listQueue;
  id v12;
  id v13;
  BOOL v14;
  NSString *accessoryUID;
  _QWORD block[4];
  id v18;
  ACCMediaLibraryAccessory *v19;
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    v22 = accessoryUID;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_DEBUG, "addUpdate: %@, library %@, updateDict=%@", buf, 0x20u);
  }

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke;
  block[3] = &unk_24DCCDC68;
  v12 = v7;
  v18 = v12;
  v19 = self;
  v20 = v6;
  v13 = v6;
  dispatch_sync(listQueue, block);
  if (v12)
    v14 = -[ACCMediaLibraryAccessory pendingUpdatesAndWaitingConfirmFullForLibrary:](self, "pendingUpdatesAndWaitingConfirmFullForLibrary:", v12);
  else
    v14 = 0;

  return v14;
}

void __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  _ACCMediaLibraryAccessoryPendingUpdateItem *v7;
  id v8;

  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "_pendingUpdatesAndWaitingConfirmFullForLibrary:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_pendingUpdatesForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 32), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_ACCMediaLibraryAccessoryPendingUpdateItem initWithLibrary:revision:type:item:]([_ACCMediaLibraryAccessoryPendingUpdateItem alloc], "initWithLibrary:revision:type:item:", *(_QWORD *)(a1 + 32), v8, 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke_cold_1(a1, v2, v5);

  }
}

- (BOOL)addPlaylistContentUpdate:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *listQueue;
  id v12;
  NSString *accessoryUID;
  _QWORD v15[4];
  id v16;
  ACCMediaLibraryAccessory *v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138412802;
    v19 = accessoryUID;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_DEBUG, "addPlaylistContentUpdate: %@, library %@, updateDict=%@", buf, 0x20u);
  }

  listQueue = self->_listQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__ACCMediaLibraryAccessory_addPlaylistContentUpdate_library___block_invoke;
  v15[3] = &unk_24DCCDC90;
  v16 = v6;
  v17 = self;
  v12 = v6;
  dispatch_sync(listQueue, v15);

  return 0;
}

void __61__ACCMediaLibraryAccessory_addPlaylistContentUpdate_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _ACCMediaLibraryAccessoryPendingUpdateItem *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ACCMediaLibraryUIDKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_pendingPlaylistContentUpdatesForLibrary:createIfNotExist:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ACCMediaLibraryAccessoryPendingUpdateItem initWithLibrary:revision:type:item:]([_ACCMediaLibraryAccessoryPendingUpdateItem alloc], "initWithLibrary:revision:type:item:", v5, v2, 1, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", v4);

}

- (id)confirmUpdates:(id)a3 revision:(id)a4 count:(unsigned int)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *listQueue;
  id v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSString *accessoryUID;
  _QWORD block[5];
  id v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  _BYTE *v22;
  unsigned int v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = accessoryUID;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v25 = v9;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = a5;
    HIWORD(v26) = 2048;
    v27 = -[ACCMediaLibraryAccessory pendingAndWaitingConfirmUpdatesCountForLibrary:](self, "pendingAndWaitingConfirmUpdatesCountForLibrary:", v8);
    _os_log_debug_impl(&dword_21A4E8000, v12, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, revision %@, updateCount %u, pendingUpdatesCount=%lu", buf, 0x30u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACCMediaLibraryAccessory_confirmUpdates_revision_count___block_invoke;
  block[3] = &unk_24DCCDCB8;
  block[4] = self;
  v14 = v8;
  v20 = v14;
  v22 = buf;
  v15 = v9;
  v21 = v15;
  v23 = a5;
  dispatch_sync(listQueue, block);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v16;
}

void __58__ACCMediaLibraryAccessory_confirmUpdates_revision_count___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  int *v4;
  int *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  int *v35;
  int *v36;
  id *v37;
  void *v38;
  void *v39;
  int v40;
  unint64_t v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  id *v45;
  id *v46;
  NSObject *v47;
  id v48;
  id *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  id *v53;
  int *v54;
  void *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  id *v60;
  __int128 v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  id *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  id v80;
  __int16 v81;
  _BYTE v82[14];
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v1 = a1;
  v88 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_waitingUpdatesForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = &OBJC_IVAR___ACCMediaLibraryUpdatePlaylist__radioStationOrdering;
  v5 = &OBJC_IVAR___ACCMediaLibraryUpdatePlaylist__radioStationOrdering;
  if (!v2)
    goto LABEL_58;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(v1 + 48))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v42 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v42 = MEMORY[0x24BDACB70];
      v43 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v44 = *(_QWORD *)(v1 + 40);
      v45 = *(id **)(*(_QWORD *)(v1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      v76 = v45;
      v77 = 2112;
      v78 = v44;
      _os_log_impl(&dword_21A4E8000, v42, OS_LOG_TYPE_DEFAULT, "confirmUpdates: %@, library %@, WARNING!!! no revision specified so using updateCount only!", buf, 0x16u);
    }

    v41 = *(unsigned int *)(v1 + 64);
    goto LABEL_46;
  }
  v64 = v2;
  v65 = v3;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v9 = v2;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
  if (!v10)
  {
    v41 = 0;
    goto LABEL_39;
  }
  v12 = 0;
  v13 = *(_QWORD *)v72;
  *(_QWORD *)&v11 = 134218240;
  v61 = v11;
  v66 = v9;
  while (2)
  {
    v14 = 0;
    v62 = v12 + v10;
    v63 = v12;
    v68 = v10;
    do
    {
      if (*(_QWORD *)v72 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v14);
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40);
      objc_msgSend(v15, "item", v61);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      objc_msgSend(v15, "item");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", CFSTR("ACCMediaLibraryUpdateTypeKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = v19;
      if (objc_msgSend(v19, "integerValue") == 2)
      {
        objc_msgSend(v15, "item");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistDictionary"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = MEMORY[0x24BDACB70];
          if (v22)
          {
            v69 = v22;
            if (objc_msgSend(v22, "integerValue"))
            {
              objc_msgSend(v15, "revision");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "addObject:", v24);

            }
          }
          else
          {
            v69 = 0;
          }
        }
        else
        {
          v69 = 0;
          v23 = MEMORY[0x24BDACB70];
        }

      }
      else
      {
        v69 = 0;
        v23 = MEMORY[0x24BDACB70];
      }
      objc_msgSend(v15, "revision");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "integerValue"))
      {
        v26 = objc_msgSend(*(id *)(v1 + 48), "integerValue");

        if (v26)
        {
          v27 = objc_msgSend(*(id *)(v1 + 48), "integerValue");
          objc_msgSend(v15, "revision");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "integerValue");

          if (v27 <= v29)
            goto LABEL_34;
          goto LABEL_31;
        }
      }
      else
      {

      }
      v30 = (id *)*((_QWORD *)v4 + 198);
      v31 = v5[398];
      if (v30 && v31 >= 1)
      {
        v32 = *v30;
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v61;
          v76 = v30;
          v77 = 1024;
          LODWORD(v78) = v31;
          _os_log_error_impl(&dword_21A4E8000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v33 = v23;
        v32 = v23;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(_QWORD *)(v1 + 40);
        v35 = v4;
        v36 = v5;
        v37 = *(id **)(*(_QWORD *)(v1 + 32) + 16);
        v67 = *(void **)(v1 + 48);
        objc_msgSend(v15, "revision");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v76 = v37;
        v5 = v36;
        v4 = v35;
        v77 = 2112;
        v78 = v34;
        v9 = v66;
        v79 = 2112;
        v80 = v67;
        v81 = 2112;
        *(_QWORD *)v82 = v38;
        _os_log_impl(&dword_21A4E8000, v32, OS_LOG_TYPE_DEFAULT, "confirmUpdates: %@, library %@, WARNING!!! either revision (%@) or item.revision (%@) were not numbers! using string compare", buf, 0x2Au);

      }
      objc_msgSend(v15, "revision");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", *(_QWORD *)(v1 + 48));

      if (v40)
      {
LABEL_34:

        v41 = v63 + v14;
        goto LABEL_39;
      }
LABEL_31:

      ++v14;
    }
    while (v68 != v14);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    v41 = v62;
    v12 = v62;
    if (v10)
      continue;
    break;
  }
LABEL_39:

  v2 = v64;
  v3 = v65;
LABEL_46:
  v46 = (id *)*((_QWORD *)v4 + 198);
  if (v46 && v5[398] >= 1)
  {
    v47 = *v46;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v47 = MEMORY[0x24BDACB70];
    v48 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v52 = *(_QWORD *)(v1 + 40);
    v53 = *(id **)(*(_QWORD *)(v1 + 32) + 16);
    v54 = v5;
    v55 = *(void **)(v1 + 48);
    v56 = v1;
    v57 = *(_DWORD *)(v1 + 64);
    v58 = objc_msgSend(v2, "count");
    *(_DWORD *)buf = 138413826;
    v76 = v53;
    v77 = 2112;
    v78 = v52;
    v79 = 2112;
    v80 = v55;
    v5 = v54;
    v81 = 1024;
    *(_DWORD *)v82 = v57;
    v1 = v56;
    v4 = &OBJC_IVAR___ACCMediaLibraryUpdatePlaylist__radioStationOrdering;
    *(_WORD *)&v82[4] = 2048;
    *(_QWORD *)&v82[6] = v41;
    v83 = 2048;
    v84 = v58;
    v85 = 2112;
    v86 = v3;
    _os_log_debug_impl(&dword_21A4E8000, v47, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, revision %@, updateCount %u, index=%lu waitlist.count=%lu playlistRevisionToAdd=%@", buf, 0x44u);
  }

  if (v41 >= objc_msgSend(v2, "count"))
    objc_msgSend(v2, "removeAllObjects");
  else
    objc_msgSend(v2, "removeObjectsInRange:", 0, v41 + 1);
  objc_msgSend(*(id *)(v1 + 32), "_waitingUpdatesRemoveLibraryIfEmpty:", *(_QWORD *)(v1 + 40));
LABEL_58:
  if (objc_msgSend(v3, "count"))
  {
    v49 = (id *)*((_QWORD *)v4 + 198);
    if (v49 && v5[398] >= 1)
    {
      v50 = *v49;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v50 = MEMORY[0x24BDACB70];
      v51 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      v59 = *(_QWORD *)(v1 + 40);
      v60 = *(id **)(*(_QWORD *)(v1 + 32) + 16);
      *(_DWORD *)buf = 138412802;
      v76 = v60;
      v77 = 2112;
      v78 = v59;
      v79 = 2112;
      v80 = v3;
      _os_log_debug_impl(&dword_21A4E8000, v50, OS_LOG_TYPE_DEBUG, "confirmUpdates: %@, library %@, wasPlaylistUpdates, _addConfirmedRevisionForLibrary playlistRevisionToAdd=%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(v1 + 32), "_addConfirmedRevisionForLibrary:revisionsToAdd:", *(_QWORD *)(v1 + 40), v3);
  }

}

- (void)confirmPlaylistContentUpdates:(id)a3 revision:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *listQueue;
  id v12;
  id v13;
  NSString *accessoryUID;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    accessoryUID = self->_accessoryUID;
    *(_DWORD *)buf = 138413058;
    v19 = accessoryUID;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2048;
    v25 = -[ACCMediaLibraryAccessory pendingPlaylistContentUpdatesCountForLibrary:](self, "pendingPlaylistContentUpdatesCountForLibrary:", v6);
    _os_log_debug_impl(&dword_21A4E8000, v10, OS_LOG_TYPE_DEBUG, "confirmPlaylistContentUpdates: %@, library %@, revision %@, pendingUpdatesCount=%lu", buf, 0x2Au);
  }

  listQueue = self->_listQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ACCMediaLibraryAccessory_confirmPlaylistContentUpdates_revision___block_invoke;
  block[3] = &unk_24DCCDC68;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_sync(listQueue, block);

}

void __67__ACCMediaLibraryAccessory_confirmPlaylistContentUpdates_revision___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_waitingUpdatesForLibrary:createIfNotExist:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        v10 = v7 + v6;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "revision", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 48));

          if ((v12 & 1) != 0)
          {
            v10 = v7 + v9;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v7 = v10;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_13:

    if (v10 < objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "removeObjectAtIndex:", v10);
      objc_msgSend(*(id *)(a1 + 32), "_waitingUpdatesRemoveLibraryIfEmpty:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)clearAllUpdates
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *accessoryUID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingUpdates;
  NSMutableDictionary *v13;
  NSMutableDictionary *waitingConfirm;
  NSMutableDictionary *v15;
  NSMutableDictionary *pendingPlaylistContentUpdates;
  NSMutableDictionary *v17;
  NSMutableDictionary *confirmedRevisionList;
  int v19;
  NSString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    accessoryUID = self->_accessoryUID;
    v7 = -[NSMutableDictionary count](self->_pendingUpdates, "count");
    v8 = -[NSMutableDictionary count](self->_waitingConfirm, "count");
    v9 = -[NSMutableDictionary count](self->_pendingPlaylistContentUpdates, "count");
    v10 = -[NSMutableDictionary count](self->_confirmedRevisionList, "count");
    v19 = 138413314;
    v20 = accessoryUID;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v10;
    _os_log_impl(&dword_21A4E8000, v5, OS_LOG_TYPE_INFO, "clearAllUpdates: %@, pendingUpdates.count=%lu waitingConfirm.count=%lu pendingUpdates.count=%lu waitingConfirm.count=%lu", (uint8_t *)&v19, 0x34u);
  }

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  waitingConfirm = self->_waitingConfirm;
  self->_waitingConfirm = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  pendingPlaylistContentUpdates = self->_pendingPlaylistContentUpdates;
  self->_pendingPlaylistContentUpdates = v15;

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  confirmedRevisionList = self->_confirmedRevisionList;
  self->_confirmedRevisionList = v17;

}

- (void)clearAllUpdatesForLibrary:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *accessoryUID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *listQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    accessoryUID = self->_accessoryUID;
    v9 = -[NSMutableDictionary count](self->_pendingUpdates, "count");
    v10 = -[NSMutableDictionary count](self->_waitingConfirm, "count");
    v11 = -[NSMutableDictionary count](self->_pendingPlaylistContentUpdates, "count");
    v12 = -[NSMutableDictionary count](self->_confirmedRevisionList, "count");
    *(_DWORD *)buf = 138413570;
    v18 = accessoryUID;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v10;
    v25 = 2048;
    v26 = v11;
    v27 = 2048;
    v28 = v12;
    _os_log_impl(&dword_21A4E8000, v7, OS_LOG_TYPE_INFO, "clearAllUpdatesForLibrary: %@, libraryUID %@, pendingUpdates.count=%lu waitingConfirm.count=%lu pendingUpdates.count=%lu waitingConfirm.count=%lu", buf, 0x3Eu);
  }

  listQueue = self->_listQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__ACCMediaLibraryAccessory_clearAllUpdatesForLibrary___block_invoke;
  v15[3] = &unk_24DCCDC90;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_sync(listQueue, v15);

}

void __54__ACCMediaLibraryAccessory_clearAllUpdatesForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));

  }
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (ACCMediaLibraryProvider)provider
{
  return (ACCMediaLibraryProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (unsigned)windowPerLibrary
{
  return self->_windowPerLibrary;
}

- (void)setWindowPerLibrary:(unsigned int)a3
{
  self->_windowPerLibrary = a3;
}

- (NSMutableDictionary)libraries
{
  return self->_libraries;
}

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (NSMutableDictionary)waitingConfirm
{
  return self->_waitingConfirm;
}

- (void)setWaitingConfirm:(id)a3
{
  objc_storeStrong((id *)&self->_waitingConfirm, a3);
}

- (NSMutableDictionary)pendingPlaylistContentUpdates
{
  return self->_pendingPlaylistContentUpdates;
}

- (void)setPendingPlaylistContentUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPlaylistContentUpdates, a3);
}

- (NSMutableDictionary)confirmedRevisionList
{
  return self->_confirmedRevisionList;
}

- (void)setConfirmedRevisionList:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedRevisionList, a3);
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listQueue, 0);
  objc_storeStrong((id *)&self->_confirmedRevisionList, 0);
  objc_storeStrong((id *)&self->_pendingPlaylistContentUpdates, 0);
  objc_storeStrong((id *)&self->_waitingConfirm, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

void __46__ACCMediaLibraryAccessory_addUpdate_library___block_invoke_cold_1(uint64_t a1, _QWORD *a2, os_log_t log)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD **)(a1 + 40);
  v6 = v5[2];
  v7 = *a2;
  if (*a2)
    v8 = objc_msgSend(v5, "_pendingUpdatesAndWaitingConfirmFullForLibrary:", *a2) ^ 1;
  else
    v8 = -1;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 1024;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_21A4E8000, log, OS_LOG_TYPE_ERROR, "addUpdate: %@, pendingUpdatesAndWaitingConfirmFullForLibrary:%@ (%d), unable to addUpdate! updateDict=%@", (uint8_t *)&v10, 0x26u);
}

@end
