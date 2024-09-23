@implementation PKReplicaManager

- (void)setTestMode:(BOOL)a3
{
  NSMutableArray *v4;
  NSMutableArray *replicaManagerErrors;

  self->_testMode = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    replicaManagerErrors = self->_replicaManagerErrors;
    self->_replicaManagerErrors = v4;

  }
}

- (NSArray)replicaManagerErrors
{
  return (NSArray *)self->_replicaManagerErrors;
}

+ (id)sharedReplicaManager
{
  if (_MergedGlobals_161 != -1)
    dispatch_once(&_MergedGlobals_161, &__block_literal_global_92);
  return (id)qword_1ECEE6608;
}

void __40__PKReplicaManager_sharedReplicaManager__block_invoke()
{
  PKReplicaManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKReplicaManager);
  v1 = (void *)qword_1ECEE6608;
  qword_1ECEE6608 = (uint64_t)v0;

}

- (PKReplicaManager)init
{
  PKReplicaManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *uuidAccessQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKReplicaManager;
  v2 = -[PKReplicaManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.PencilKit.replicas", 0);
    uuidAccessQueue = v2->_uuidAccessQueue;
    v2->_uuidAccessQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationWillTerminate, *MEMORY[0x1E0DC4870], 0);

  }
  return v2;
}

- (void)_applicationWillTerminate
{
  NSObject *uuidAccessQueue;
  _QWORD block[5];

  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKReplicaManager__applicationWillTerminate__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_sync(uuidAccessQueue, block);
}

void *__45__PKReplicaManager__applicationWillTerminate__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
  {
    dispatch_block_cancel(result);
    return (void *)objc_msgSend(*(id *)(a1 + 32), "_saveStateImmediately");
  }
  return result;
}

- (id)checkoutReplicaUUIDForDrawing:(id)a3
{
  id v4;
  NSObject *uuidAccessQueue;
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
  v15 = __Block_byref_object_copy__36;
  v16 = __Block_byref_object_dispose__36;
  v17 = 0;
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKReplicaManager_checkoutReplicaUUIDForDrawing___block_invoke;
  block[3] = &unk_1E777B180;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(uuidAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__PKReplicaManager_checkoutReplicaUUIDForDrawing___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PKReplicaEntry *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKReplicaEntry *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  PKReplicaEntry *v35;
  PKReplicaEntry *v36;
  uint64_t v37;
  PKReplicaEntry *obj;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    objc_msgSend(v2, "_loadState");
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = (void *)v2[3];
  objc_msgSend(*(id *)(a1 + 40), "nsuuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "nsuuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

    v41 = (void *)v6;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = (PKReplicaEntry *)*(id *)(*(_QWORD *)(a1 + 32) + 16);
  v10 = -[PKReplicaEntry countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v10)
  {
    v40 = *(_QWORD *)v47;
    obj = v9;
    while (1)
    {
      v39 = v10;
      v11 = 0;
LABEL_8:
      if (*(_QWORD *)v47 != v40)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v13 = v41;
      v14 = -[PKReplicaEntry countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (!v14)
        break;
      v15 = *(_QWORD *)v43;
LABEL_12:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v16);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v17, "replicaUUIDIndex"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqual:", v12))
          break;

        if (v14 == ++v16)
        {
          v14 = -[PKReplicaEntry countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v14)
            goto LABEL_12;
          goto LABEL_36;
        }
      }
      if ((objc_msgSend(v17, "inUse") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "version");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "clockElementForUUID:", v12);
        v20 = (os_log_t)objc_claimAutoreleasedReturnValue();

        v21 = -[NSObject clock](v20, "clock");
        v22 = objc_msgSend(v17, "clock");
        v23 = -[NSObject clock](v20, "clock");
        if (v23 == objc_msgSend(v17, "clock"))
        {
          v24 = -[NSObject subclock](v20, "subclock");
          v25 = v24 > objc_msgSend(v17, "subclock");
        }
        else
        {
          v25 = 0;
        }
        if (v21 > v22 || v25)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 40), "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("Replica Manager Error: Invalid entry for drawing with UUID: %@ (%p) and replica UUID: %@"), v27, *(_QWORD *)(a1 + 40), v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v51 = (uint64_t)v28;
            _os_log_error_impl(&dword_1BE213000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          if (objc_msgSend(*(id *)(a1 + 32), "testMode"))
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v28);

        }
        v30 = -[NSObject clock](v20, "clock");
        if (v30 == objc_msgSend(v17, "clock"))
        {
          v31 = -[NSObject subclock](v20, "subclock");
          if (v31 == objc_msgSend(v17, "subclock"))
          {
            objc_msgSend(v17, "setDrawing:", *(_QWORD *)(a1 + 40));
            objc_msgSend(v17, "setInUse:", 1);
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
            goto LABEL_40;
          }
        }

      }
      if (++v11 != v39)
        goto LABEL_8;
      v9 = obj;
      v10 = -[PKReplicaEntry countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (!v10)
        goto LABEL_35;
    }
LABEL_36:

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);
    v36 = -[PKReplicaEntry initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:]([PKReplicaEntry alloc], "initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), 0, 0, 1, *(_QWORD *)(a1 + 40));
    -[PKReplicaEntry addObject:](v13, "addObject:", v36);
    if ((unint64_t)-[PKReplicaEntry count](v13, "count") < 4)
    {
      v13 = v36;
    }
    else
    {
      v20 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v37 = -[PKReplicaEntry count](v13, "count");
        *(_DWORD *)buf = 134217984;
        v51 = v37;
        _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_INFO, "Drawing has claimed %ld replicas.", buf, 0xCu);
      }
      v18 = v20;
      v13 = v36;
LABEL_40:

    }
    v35 = obj;
  }
  else
  {
LABEL_35:

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v35 = -[PKReplicaEntry initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:]([PKReplicaEntry alloc], "initWithReplicaUUIDIndex:clock:subclock:inUse:forDrawing:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), 0, 0, 1, *(_QWORD *)(a1 + 40));
    objc_msgSend(v41, "addObject:", v35);
  }

}

- (void)updateVersionForDrawing:(id)a3
{
  id v4;
  NSObject *uuidAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKReplicaManager_updateVersionForDrawing___block_invoke;
  block[3] = &unk_1E7777440;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(uuidAccessQueue, block);

}

void __44__PKReplicaManager_updateVersionForDrawing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "nsuuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v9, "replicaUUIDIndex"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v10);

        if (v12)
        {
          if ((objc_msgSend(v9, "inUse") & 1) == 0)
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", CFSTR("Replica Manager Error: Attempt to update version of replica UUID %@ for drawing with UUID: %@ (%p)"), v14, v15, *(_QWORD *)(a1 + 40));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v16;
              _os_log_error_impl(&dword_1BE213000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if (objc_msgSend(*(id *)(a1 + 32), "testMode"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v16);

          }
          v18 = *(void **)(a1 + 40);
          objc_msgSend(v9, "drawing");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v18) = v18 == v19;

          if ((v18 & 1) == 0)
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "drawing");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("Replica Manager Error: Attempt to update version of replica UUID %@ for drawing with UUID: %@ (%p) from invalid drawing instance (%p)"), v21, v22, v23, *(_QWORD *)(a1 + 40), (_QWORD)v29);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v24;
              _os_log_error_impl(&dword_1BE213000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if (objc_msgSend(*(id *)(a1 + 32), "testMode"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v24);

          }
          objc_msgSend(*(id *)(a1 + 40), "version");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "clockElementForUUID:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setClock:", objc_msgSend(v28, "clock"));
          objc_msgSend(v9, "setSubclock:", objc_msgSend(v28, "subclock"));

          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
          goto LABEL_24;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v6)
        continue;
      break;
    }
  }

LABEL_24:
}

- (void)persistIfNeeded
{
  NSObject *uuidAccessQueue;
  _QWORD block[5];

  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PKReplicaManager_persistIfNeeded__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_sync(uuidAccessQueue, block);
}

_BYTE *__35__PKReplicaManager_persistIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[49])
  {
    objc_msgSend(result, "_setReplicasDirtyToken");
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_scheduleSaveState");
  }
  return result;
}

- (void)returnReplicaForDrawing:(id)a3
{
  id v4;
  NSObject *uuidAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PKReplicaManager updateVersionForDrawing:](self, "updateVersionForDrawing:", v4);
  uuidAccessQueue = self->_uuidAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKReplicaManager_returnReplicaForDrawing___block_invoke;
  block[3] = &unk_1E7777440;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(uuidAccessQueue, block);

}

void __44__PKReplicaManager_returnReplicaForDrawing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "nsuuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", objc_msgSend(v8, "replicaUUIDIndex"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v9);

        if (v11)
        {
          if ((objc_msgSend(v8, "inUse") & 1) == 0)
          {
            v12 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringWithFormat:", CFSTR("Replica Manager Error: Attempt to return unused replica UUID %@ for drawing with UUID: %@ (%p)"), v13, v14, *(_QWORD *)(a1 + 40));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v15;
              _os_log_error_impl(&dword_1BE213000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if (objc_msgSend(*(id *)(a1 + 32), "testMode"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v15);

          }
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v8, "drawing");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = v17 == v18;

          if ((v17 & 1) == 0)
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 40), "replicaUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "drawing");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("Replica Manager Error: Attempt to return replica UUID %@ for drawing with UUID: %@ (%p) from invalid drawing instance (%p)"), v20, v21, v22, *(_QWORD *)(a1 + 40));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v23;
              _os_log_error_impl(&dword_1BE213000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
            }

            if (objc_msgSend(*(id *)(a1 + 32), "testMode"))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v23);

          }
          objc_msgSend(v8, "setInUse:", 0);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

}

- (BOOL)isValidBundleIDForSaving:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.quicklook")) ^ 1;
}

- (void)_loadState
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *replicaUUIDs;
  NSMutableDictionary *v14;
  NSMutableDictionary *replicaEntries;
  NSMutableOrderedSet *v16;
  NSMutableOrderedSet *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  __CFString *applicationID;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  applicationID = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[PKReplicaManager isValidBundleIDForSaving:](self, "isValidBundleIDForSaving:", applicationID))
  {
    v4 = -[PKReplicaManager testMode](self, "testMode");
    v5 = applicationID;
    if (applicationID)
      v6 = v4;
    else
      v6 = 1;
    if (v6 == 1)
    {

      v5 = CFSTR("com.apple.replicas.test");
    }
    v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v8 = (const __CFString *)*MEMORY[0x1E0C9B250];
    applicationID = (__CFString *)v5;
    v9 = (void *)CFPreferencesCopyValue(CFSTR("com.apple.PencilKit.replicasDirtyToken"), v5, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (v9)
    {
      -[PKReplicaManager _resetAllReplicaUUIDs](self, "_resetAllReplicaUUIDs");
    }
    else
    {
      v10 = (void *)CFPreferencesCopyValue(CFSTR("com.apple.PencilKit.replicas"), applicationID, v7, v8);
      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, 0);
        objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReplicaUUIDs"));
        v12 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
        replicaUUIDs = self->_replicaUUIDs;
        self->_replicaUUIDs = v12;

        objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReplicaEntries"));
        v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        replicaEntries = self->_replicaEntries;
        self->_replicaEntries = v14;

      }
      if (!self->_replicaUUIDs)
      {
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
        v16 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
        v17 = self->_replicaUUIDs;
        self->_replicaUUIDs = v16;

      }
      if (!self->_replicaEntries)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v19 = self->_replicaEntries;
        self->_replicaEntries = v18;

      }
    }

  }
}

- (void)_setReplicasDirtyToken
{
  void *v3;
  __CFString *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  char v10;

  if (!self->_dirtyTokenSet)
  {
    self->_dirtyTokenSet = 1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v5 = -[PKReplicaManager testMode](self, "testMode");
    if (v4)
      v6 = v5;
    else
      v6 = 1;
    if (v6 == 1)
    {

      v4 = CFSTR("com.apple.replicas.test");
    }
    v10 = 1;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v10, 1);
    v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v9 = (const __CFString *)*MEMORY[0x1E0C9B250];
    CFPreferencesSetValue(CFSTR("com.apple.PencilKit.replicasDirtyToken"), v7, v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(v4, v8, v9);

  }
}

- (void)_scheduleSaveState
{
  id saveStateBlock;
  dispatch_block_t v4;
  id v5;
  dispatch_time_t v6;
  _QWORD block[5];

  saveStateBlock = self->_saveStateBlock;
  if (saveStateBlock)
    dispatch_block_cancel(saveStateBlock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PKReplicaManager__scheduleSaveState__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v5 = self->_saveStateBlock;
  self->_saveStateBlock = v4;

  v6 = dispatch_time(0, 2500000000);
  dispatch_after(v6, (dispatch_queue_t)self->_uuidAccessQueue, self->_saveStateBlock);
}

uint64_t __38__PKReplicaManager__scheduleSaveState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_saveStateImmediately");
}

- (void)_saveStateImmediately
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  __CFString *v10;

  if (self->_replicaUUIDs && self->_replicaEntries)
  {
    if (-[PKReplicaManager testMode](self, "testMode"))
    {
      v3 = CFSTR("com.apple.replicas.test");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (const __CFString *)v4;
    }
    v10 = (__CFString *)v3;
    if (-[PKReplicaManager isValidBundleIDForSaving:](self, "isValidBundleIDForSaving:"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 0);
      objc_msgSend(v5, "encodeObject:forKey:", self->_replicaUUIDs, CFSTR("ReplicaUUIDs"));
      objc_msgSend(v5, "encodeObject:forKey:", self->_replicaEntries, CFSTR("ReplicaEntries"));
      objc_msgSend(v5, "finishEncoding");
      objc_msgSend(v5, "encodedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v8 = (const __CFString *)*MEMORY[0x1E0C9B250];
      CFPreferencesSetValue(CFSTR("com.apple.PencilKit.replicasDirtyToken"), 0, v10, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      *(_WORD *)&self->_dirtyTokenSet = 0;
      CFPreferencesSetValue(CFSTR("com.apple.PencilKit.replicas"), v6, v10, v7, v8);
      CFPreferencesSynchronize(v10, v7, v8);

    }
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Replica UUIDs: %@\nReplica Entries: %@\n"), self->_replicaUUIDs, self->_replicaEntries);
}

- (void)_resetAllReplicaUUIDs
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *replicaUUIDs;
  NSMutableDictionary *v5;
  NSMutableDictionary *replicaEntries;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  replicaUUIDs = self->_replicaUUIDs;
  self->_replicaUUIDs = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  replicaEntries = self->_replicaEntries;
  self->_replicaEntries = v5;

  -[PKReplicaManager _saveStateImmediately](self, "_saveStateImmediately");
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveStateBlock, 0);
  objc_storeStrong((id *)&self->_replicaManagerErrors, 0);
  objc_storeStrong((id *)&self->_replicaEntries, 0);
  objc_storeStrong((id *)&self->_replicaUUIDs, 0);
  objc_storeStrong((id *)&self->_uuidAccessQueue, 0);
}

@end
