@implementation _CDObservationCenter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___CDObservationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized_1 != -1)
    dispatch_once(&sharedInstance_initialized_1, block);
  return (id)sharedInstance_sharedInstance_1;
}

- (_CDObservationCenter)init
{
  _CDObservationCenter *v2;
  uint64_t v3;
  NSMapTable *senderToNotificationObservers;
  uint64_t v5;
  NSMapTable *senderToNotificationObserverObservers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CDObservationCenter;
  v2 = -[_CDObservationCenter init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    senderToNotificationObservers = v2->_senderToNotificationObservers;
    v2->_senderToNotificationObservers = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    senderToNotificationObserverObservers = v2->_senderToNotificationObserverObservers;
    v2->_senderToNotificationObserverObservers = (NSMapTable *)v5;

  }
  return v2;
}

- (id)_notificationToObserverEntriesForSender:(int)a3 observerObserver:(int)a4 shouldCreate:
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;

  v7 = a2;
  if (a1)
  {
    v8 = 8;
    if (a3)
      v8 = 16;
    v9 = *(id *)(a1 + v8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 1;
    else
      v11 = a4 == 0;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_observerToEntriesForSender:(void *)a3 name:(int)a4 observerObserver:(int)a5 shouldCreate:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a3;
  if (a1)
  {
    -[_CDObservationCenter _notificationToObserverEntriesForSender:observerObserver:shouldCreate:](a1, a2, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 && a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v9);
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_addObserver:(void *)a3 name:(void *)a4 sender:(void *)a5 queue:(int)a6 observerObserver:(void *)a7 usingCall:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  SEL v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (a1)
  {
    v18 = a1;
    objc_sync_enter(v18);
    -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v18, v15, v14, a6, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v22 = v20;
    if (v20)
    {
      objc_setProperty_atomic(v20, v21, v16, 8);
      objc_setProperty_atomic(v22, v23, v17, 16);
    }
    v24 = objc_msgSend(v19, "count");
    objc_msgSend(v19, "setObject:forKey:", v22, v13);
    if ((a6 & 1) != 0 || objc_msgSend(v19, "count") == v24)
      v25 = -1;
    else
      v25 = objc_msgSend(v18, "observerCountOnName:", v14);

    objc_sync_exit(v18);
    if ((v25 & 0x8000000000000000) == 0)
    {
      v28 = CFSTR("observerCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDObservationCenter _postNotificationName:userInfo:sender:observerObserver:](v18, v14, v27, v18, 1);

    }
  }

}

- (void)_postNotificationName:(void *)a3 userInfo:(void *)a4 sender:(int)a5 observerObserver:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  SEL v27;
  id Property;
  id v29;
  NSString *v30;
  SEL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  NSString *v46;
  _QWORD block[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v58 = a3;
  v10 = a4;
  v57 = v10;
  v36 = v9;
  if (a1)
  {
    v11 = (void *)objc_opt_new();
    v12 = a1;
    objc_sync_enter(v12);
    -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v12, v10, v9, a5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    if (v14)
      objc_msgSend(v11, "addObject:", v14);
    -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v12, 0, v36, a5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    if (v16)
      objc_msgSend(v11, "addObject:", v16);

    objc_sync_exit(v12);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v11;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v54;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v54 != v38)
          {
            v18 = v17;
            objc_enumerationMutation(obj);
            v17 = v18;
          }
          v40 = v17;
          v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v17);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v20 = v19;
          v42 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v50;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v50 != v41)
                  objc_enumerationMutation(v20);
                v22 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * v21);
                objc_msgSend(v20, "objectForKey:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v23;
                if (v23)
                {
                  v26 = objc_getProperty(v23, v24, 8, 1);
                  Property = objc_getProperty(v25, v27, 16, 1);
                }
                else
                {
                  v26 = 0;
                  Property = 0;
                }
                v29 = Property;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v30 = (NSString *)v29;
                  v31 = NSSelectorFromString(v30);
                  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setSelector:", v31);
                    objc_msgSend(v33, "setTarget:", v22);
                    objc_msgSend(v33, "setArgument:atIndex:", &v57, 2);
                    objc_msgSend(v33, "setArgument:atIndex:", &v58, 3);
                    if (v26)
                    {
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke;
                      block[3] = &unk_1E26E2F20;
                      v48 = v33;
                      dispatch_async(v26, block);

                    }
                    else
                    {
                      objc_msgSend(v33, "invoke");
                    }

                  }
                }
                else
                {
                  v34 = MEMORY[0x193FEEAF4](v29);
                  v30 = (NSString *)v34;
                  if (v34)
                  {
                    if (v26)
                    {
                      v43[0] = MEMORY[0x1E0C809B0];
                      v43[1] = 3221225472;
                      v43[2] = __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke_2;
                      v43[3] = &unk_1E26E4248;
                      v44 = v57;
                      v45 = v58;
                      v30 = v30;
                      v46 = v30;
                      dispatch_async(v26, v43);

                    }
                    else
                    {
                      (*(void (**)(uint64_t, id, id))(v34 + 16))(v34, v57, v58);
                    }
                  }
                }

                ++v21;
              }
              while (v42 != v21);
              v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              v42 = v35;
            }
            while (v35);
          }

          v17 = v40 + 1;
        }
        while (v40 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v39);
    }

    v10 = v57;
  }

}

- (void)_removeObserver:(int)a3 observerObserver:
{
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    v7 = a1;
    objc_sync_enter(v7);
    v8 = 8;
    if (a3)
      v8 = 16;
    v9 = *(id *)&v7[v8];
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v9;
    objc_msgSend(v9, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v23 = v12;
      v24 = *(_QWORD *)v33;
      do
      {
        v26 = v13;
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v12);
          v15 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v27 = v16;
          objc_msgSend(v16, "keyEnumerator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "allObjects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "copy");

          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v29 != v21)
                  objc_enumerationMutation(v19);
                -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](v7, v5, *(void **)(*((_QWORD *)&v28 + 1) + 8 * j), v15, a3, v6);
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v20);
          }

          v12 = v23;
        }
        v13 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }

    objc_sync_exit(v7);
    if (objc_msgSend(v6, "count"))
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v7, v6);

  }
}

- (void)_removeObserver:(void *)a3 name:(void *)a4 sender:(int)a5 observerObserver:(void *)a6 observerCounts:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (a1)
  {
    v15 = v13;
    if (!v13)
      v15 = (void *)objc_opt_new();
    v16 = a1;
    objc_sync_enter(v16);
    v17 = 8;
    if (a5)
      v17 = 16;
    v18 = *(id *)&v16[v17];
    objc_msgSend(v18, "objectForKey:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "objectForKey:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = objc_msgSend(v21, "count");
        objc_msgSend(v22, "removeObjectForKey:", v26);
        if ((a5 & 1) == 0 && objc_msgSend(v22, "count") != v23)
        {
          v24 = objc_msgSend(v16, "observerCountOnName:", v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v25, v11);

        }
        if (!objc_msgSend(v22, "count"))
          objc_msgSend(v20, "removeObjectForKey:", v11);
      }
      if (!objc_msgSend(v20, "count"))
        objc_msgSend(v18, "removeObjectForKey:", v12);

    }
    objc_sync_exit(v16);

    if (!v14)
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v16, v15);
  }
  else
  {
    v15 = v13;
  }

}

- (void)_postObserverChangesNotificationWithObserverCounts:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedIntegerValue");
          v20 = CFSTR("observerCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDObservationCenter _postNotificationName:userInfo:sender:observerObserver:](a1, v10, v14, a1, 1);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    v4 = v15;
  }

}

- (void)_removeObserver:(void *)a3 name:(int)a4 observerObserver:
{
  id v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = (void *)objc_opt_new();
    v10 = a1;
    objc_sync_enter(v10);
    v11 = 8;
    if (a4)
      v11 = 16;
    v12 = *(id *)&v10[v11];
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v12;
    objc_msgSend(v12, "keyEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          v19 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v18);
          -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](v10, v7, v8, v19, a4, v9);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    objc_sync_exit(v10);
    if (objc_msgSend(v9, "count"))
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v10, v9);

  }
}

- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingSelector:(SEL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  NSStringFromSelector(a7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](self, v15, v14, v13, v12, 0, v16);

}

- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (id)MEMORY[0x193FEEAF4](a7);
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](self, v15, v14, v13, v12, 0, v16);

}

- (void)postNotificationName:(id)a3 userInfo:(id)a4 sender:(id)a5
{
  -[_CDObservationCenter _postNotificationName:userInfo:sender:observerObserver:](self, a3, a4, a5, 0);
}

- (void)removeObserver:(id)a3
{
  -[_CDObservationCenter _removeObserver:observerObserver:](self, a3, 0);
}

- (void)removeObserver:(id)a3 name:(id)a4
{
  -[_CDObservationCenter _removeObserver:name:observerObserver:](self, a3, a4, 0);
}

- (void)removeObserver:(id)a3 name:(id)a4 sender:(id)a5
{
  -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](self, a3, a4, a5, 0, 0);
}

- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingSelector:(SEL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v18 = a4;
  v11 = a5;
  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelector:", a6);
    objc_msgSend(v13, "setTarget:", v10);
    objc_msgSend(v13, "setArgument:atIndex:", &v18, 2);
    v14 = v18;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78___CDObservationCenter_addObserverChangesObserver_onName_queue_usingSelector___block_invoke;
    v16[3] = &unk_1E26E4270;
    v17 = v13;
    v15 = v13;
    -[_CDObservationCenter addObserverChangesObserver:onName:queue:usingBlock:](self, "addObserverChangesObserver:onName:queue:usingBlock:", v10, v14, v11, v16);

  }
}

- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _CDObservationCenter *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75___CDObservationCenter_addObserverChangesObserver_onName_queue_usingBlock___block_invoke;
  v18[3] = &unk_1E26E4298;
  v15 = v13;
  v20 = v15;
  v16 = v11;
  v19 = v16;
  v17 = (void *)MEMORY[0x193FEEAF4](v18);
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](v14, v10, v16, v14, v12, 1, v17);

  objc_sync_exit(v14);
}

- (void)removeObserverChangesObserver:(id)a3 onName:(id)a4
{
  -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](self, a3, a4, self, 1, 0);
}

- (unint64_t)observerCountOnName:(id)a3
{
  id v4;
  _CDObservationCenter *v5;
  NSMapTable *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_senderToNotificationObservers;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMapTable keyEnumerator](v6, "keyEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v5, v13, v4, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v9 += objc_msgSend(v14, "count");

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderToNotificationObserverObservers, 0);
  objc_storeStrong((id *)&self->_senderToNotificationObservers, 0);
}

@end
