@implementation EKChangeListener

- (EKChangeListener)init
{
  EKChangeListener *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKChangeListener;
  v2 = -[EKChangeListener init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKChangeListener setDelegates:](v2, "setDelegates:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_objectsChangedNotification_, CFSTR("EKEventModifiedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_objectsChangedNotification_, CFSTR("EKEventStoreChangedNotification"), 0);

  }
  return v2;
}

- (void)setDelegates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)registerDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKChangeListener delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPointer:", v4);

}

- (id)_orderedDelegates
{
  void *v2;
  void *v3;
  void *v4;

  -[EKChangeListener delegates](self, "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __37__EKChangeListener__orderedDelegates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "hasUpdatePriority") & 1) != 0)
    v6 = -1;
  else
    v6 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "hasUpdatePriority") & 1) != 0;

  return v6;
}

- (void)objectsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  id obj;
  int v37;
  EKChangeListener *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[EKChangeListener isSyncStatusChangeNotification:](EKChangeListener, "isSyncStatusChangeNotification:", v4))
  {
    -[EKChangeListener delegates](self, "delegates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compact");

    objc_msgSend(v4, "userInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("EKEventStoreRevert"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EKEventStoreModifiedEventIdentifier"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[EKChangeListener _orderedDelegates](self, "_orderedDelegates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v42)
    {
      v40 = *(_QWORD *)v63;
      v38 = self;
      v39 = v4;
      v37 = v7;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v63 != v40)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __47__EKChangeListener_objectsChangedNotification___block_invoke;
          v56[3] = &unk_1E4785620;
          v56[4] = self;
          v57 = v4;
          v13 = v11;
          v58 = v13;
          v61 = v7;
          v59 = v41;
          v14 = v12;
          v60 = v14;
          v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85849D4](v56);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v10, "trackedObjectMap");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
            if (v17)
            {
              v18 = v17;
              v43 = v14;
              v19 = *(_QWORD *)v53;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v53 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
                  objc_msgSend(v16, "objectForKeyedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, uint64_t, void *))v15)[2](v15, v21, v22);

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
              }
              while (v18);
LABEL_26:
              self = v38;
              v4 = v39;
              v7 = v37;
              v14 = v43;
            }
          }
          else
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            objc_msgSend(v10, "trackedObjects");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
            if (v23)
            {
              v24 = v23;
              v43 = v14;
              v25 = *(_QWORD *)v49;
              do
              {
                for (k = 0; k != v24; ++k)
                {
                  if (*(_QWORD *)v49 != v25)
                    objc_enumerationMutation(v16);
                  v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                  objc_msgSend(v27, "specificIdentifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *, void *))v15)[2](v15, v28, v27);

                }
                v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v67, 16);
              }
              while (v24);
              goto LABEL_26;
            }
          }

          if (v7 && objc_msgSend(v14, "count") && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "trackedObjectsDidRevert:", v14);
          objc_msgSend(v10, "trackedObjectsDidUpdate:", v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v35, "addObject:", v10);

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v42);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v29 = v35;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v45;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v45 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "notifyObservers");
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v66, 16);
      }
      while (v31);
    }

  }
}

void __47__EKChangeListener_objectsChangedNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "updatedObjectFor:changeNotification:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specificIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v6);
    if (*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v6))
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);
  }
  else
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKChangeListener_objectsChangedNotification___block_invoke_cold_1((uint64_t)v4, v7);
  }

}

+ (id)updatedObjectFor:(id)a3 changeNotification:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EKEventStoreChangeTypeUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "integerValue") != 1)
  {
    v13 = v5;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EKEventStoreRevert"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (!v11
      || (objc_msgSend(v6, "object"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "changedIdentifiersForNotification:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "containsObject:", v18);

      if ((v19 & 1) != 0 || !v17)
      {
        if (objc_msgSend(v5, "_refreshable"))
        {
          if ((objc_msgSend(v5, "refreshAndNotify:", 0) & 1) == 0)
          {
            v13 = 0;
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          objc_msgSend(v6, "object");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_17;
          }

        }
      }
      v13 = v5;
      goto LABEL_17;
    }
    objc_msgSend(v6, "object");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "specificIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specificIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {

      goto LABEL_7;
    }
  }
LABEL_18:

  return v13;
}

+ (id)changedIdentifiersForNotification:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v4 = v4;
      v5 = v4;
    }
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EKEventStoreModifiedEventIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v5, (void *)1);
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EKEventStoreChangedObjectIDsUserInfoKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              if (objc_msgSend(v16, "entityType", (_QWORD)v20) == 2)
                objc_msgSend(v11, "addObject:", v16);
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v13);
        }

        objc_msgSend(v10, "uniqueIdentifiersForEventsWithObjectIDs:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v17, (void *)1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v18, (void *)1);

        }
        v4 = v17;

      }
      else
      {
        v4 = 0;
      }

      v5 = v4;
    }

  }
  objc_sync_exit(v3);

  return v5;
}

+ (BOOL)isSyncStatusChangeNotification:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EKEventStoreChangeTypeUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntegerValue") == 2;
  else
    v5 = 0;

  return v5;
}

- (NSPointerArray)delegates
{
  return (NSPointerArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
}

void __47__EKChangeListener_objectsChangedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Unexpected nil specificIdentifier for object: %@", (uint8_t *)&v2, 0xCu);
}

@end
