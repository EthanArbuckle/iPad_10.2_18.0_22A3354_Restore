@implementation CNChangesNotifierProxy

void __78__CNChangesNotifierProxy_addListenerForNotificationName_registration_removal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      v6 = *(void **)(v5 + 24);
    else
      v6 = 0;
    v8 = (id)v4;
    objc_msgSend(v6, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  objc_msgSend(v8, "addObject:", v7);

}

uint64_t __69__CNChangesNotifierProxy_forwardNotificationName_asNotificationName___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[7];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (void)setRemovalBlocks:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)forwardNotificationName:(void *)a3 asNotificationName:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CNChangesNotifierProxy_forwardNotificationName_asNotificationName___block_invoke;
    block[3] = &unk_1E29F84E0;
    block[4] = a1;
    v10 = v6;
    v11 = v5;
    dispatch_async(v8, block);

  }
}

- (void)addListenerForNotificationName:(void *)a3 registration:(void *)a4 removal:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(NSObject **)(a1 + 80);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__CNChangesNotifierProxy_addListenerForNotificationName_registration_removal___block_invoke;
    v11[3] = &unk_1E29FB788;
    v14 = v8;
    v12 = v7;
    v13 = a1;
    v15 = v9;
    dispatch_async(v10, v11);

  }
}

- (id)initWithSchedulerProvider:(void *)a3 loggerProvider:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  dispatch_queue_t v18;
  id v19;
  objc_super v21;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)CNChangesNotifierProxy;
    a1 = (id *)objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[3];
      a1[3] = (id)v8;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      a1[4] = (id)v10;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[7];
      a1[7] = (id)v12;

      v14 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v15 = a1[8];
      a1[8] = v14;

      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = a1[9];
      a1[9] = v16;

      v18 = dispatch_queue_create("com.apple.Contacts.CNChangesNotifierProxy", 0);
      v19 = a1[10];
      a1[10] = v18;

      objc_storeStrong(a1 + 5, a2);
      objc_storeStrong(a1 + 6, a3);
      a1[2] = (id)0x3FF0000000000000;
    }
  }

  return a1;
}

- (void)coalesceNotificationName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);

}

- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(char)a5 isFromExternalProcess:
{
  if (result)
    return -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)result, a2, a3, a4, 0, 1, 0, a5);
  return result;
}

- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(char)a6 shouldForwardExternally:(int)a7 calledFromNotifierQueue:(char)a8 isFromExternalProcess:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD aBlock[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *(*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  if (a1)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21;
    v36 = __Block_byref_object_dispose__21;
    v37 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __152__CNChangesNotifierProxy_postNotificationName_fromSender_saveIdentifier_userInfo_shouldForwardExternally_calledFromNotifierQueue_isFromExternalProcess___block_invoke;
    aBlock[3] = &unk_1E29FB7B0;
    aBlock[4] = a1;
    v25 = v15;
    v26 = v16;
    v30 = a8;
    v31 = a6;
    v27 = v17;
    v29 = &v32;
    v28 = v18;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    v20 = v19;
    if (a7)
    {
      v19[2](v19);
      v21 = _Block_copy((const void *)v33[5]);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(a1 + 80), v19);
      v22 = v33[5];
      if (v22)
        (*(void (**)(void))(v22 + 16))();
      v21 = 0;
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __152__CNChangesNotifierProxy_postNotificationName_fromSender_saveIdentifier_userInfo_shouldForwardExternally_calledFromNotifierQueue_isFromExternalProcess___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (v5)
      v6 = *(void **)(v5 + 72);
    else
      v6 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        v9 = *(void **)(v8 + 72);
      else
        v9 = 0;
      v25 = (id)v7;
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("CNNotificationSourcesKey"));
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CNNotificationOriginationExternally"));
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("CNNotificationSaveIdentifiersKey"));
    objc_msgSend(v25, "addObject:", v11);

  }
  else
  {
    if (v5)
      v14 = *(void **)(v5 + 32);
    else
      v14 = 0;
    objc_msgSend(v14, "objectForKey:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && *(_BYTE *)(a1 + 81))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v15, "objectEnumerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i) + 16))();
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v19);
      }

    }
    -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, *(unsigned __int8 *)(a1 + 80));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

- (id)receiveNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(int)a6 calledFromNotifierQueue:(char)a7 isFromExternalProcess:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *(*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (a1)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__21;
    v44 = __Block_byref_object_dispose__21;
    v45 = 0;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v17, "contactsLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke;
    v32[3] = &unk_1E29FB850;
    v32[4] = a1;
    v33 = v13;
    v38 = &v40;
    v34 = v14;
    v35 = v15;
    v36 = v16;
    v39 = a7;
    v19 = v18;
    v37 = v19;
    v20 = (void (**)(_QWORD))_Block_copy(v32);
    v21 = v20;
    if (a6)
    {
      v20[2](v20);
      v22 = _Block_copy((const void *)v41[5]);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(a1 + 80), v20);
      v30 = v41[5];
      if (v30)
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v30 + 16))(v30, v23, v24, v25, v26, v27, v28, v29, v32[0]);
      v22 = 0;
    }

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)removeAllRegisteredNotificationSources
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CNChangesNotifierProxy_removeAllRegisteredNotificationSources__block_invoke;
    block[3] = &unk_1E29F8508;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __64__CNChangesNotifierProxy_removeAllRegisteredNotificationSources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(a1 + 32);
        if (v8)
          v9 = *(void **)(v8 + 24);
        else
          v9 = 0;
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v10, "objectEnumerator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v21 != v15)
                  objc_enumerationMutation(v12);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i) + 16))();
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v14);
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v5 = v17;
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangesNotifierProxy setRemovalBlocks:](*(_QWORD *)(a1 + 32), v18);

}

- (void)supressNotificationName:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 80);
    block[1] = 3221225472;
    block[2] = __50__CNChangesNotifierProxy_supressNotificationName___block_invoke;
    block[3] = &unk_1E29F7CE0;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

uint64_t __50__CNChangesNotifierProxy_supressNotificationName___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[8];
  return objc_msgSend(v1, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)stopSupressionOfNotificationName:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *(*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__21;
    v14 = __Block_byref_object_dispose__21;
    v15 = 0;
    v5 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__CNChangesNotifierProxy_stopSupressionOfNotificationName___block_invoke;
    block[3] = &unk_1E29F8C68;
    block[4] = a1;
    v8 = v3;
    v9 = &v10;
    dispatch_sync(v5, block);
    v6 = v11[5];
    if (v6)
      (*(void (**)(void))(v6 + 16))();

    _Block_object_dispose(&v10, 8);
  }

}

void __59__CNChangesNotifierProxy_stopSupressionOfNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(v1 + 40));
  v4 = *(_QWORD **)(v1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[8];
  v33 = v4;
  if (objc_msgSend(v33, "countForObject:", *(_QWORD *)(v1 + 40)))
  {

  }
  else
  {
    v5 = *(_QWORD **)(v1 + 32);
    if (v5)
      v5 = (_QWORD *)v5[9];
    v6 = v5;
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(v1 + 40));

    if (v8)
    {
      v9 = *(_QWORD *)(v1 + 32);
      if (v9)
        v10 = *(void **)(v9 + 72);
      else
        v10 = 0;
      objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(v1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(v1 + 32);
      if (v12)
        v13 = *(void **)(v12 + 72);
      else
        v13 = 0;
      objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(v1 + 40));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v11, "objectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v16)
      {
        v17 = v16;
        v29 = v14;
        v30 = v11;
        v31 = v1;
        v18 = 0;
        v19 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CNNotificationOriginationExternally"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "BOOLValue");

            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CNNotificationSourcesKey"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v34, "addObject:", v24);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CNNotificationSaveIdentifiersKey"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
              objc_msgSend(v32, "addObject:", v25);
            v18 |= v23;

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v17);

        v11 = v30;
        v1 = v31;
        v14 = v29;
        if ((v18 & 1) != 0)
          objc_msgSend(v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CNNotificationOriginationExternally"));
      }
      else
      {

      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("CNNotificationSourcesKey"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("CNNotificationSaveIdentifiersKey"));
      -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:](*(_QWORD *)(v1 + 32), *(void **)(v1 + 40), 0, 0, v14, 1, 1, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

    }
  }
}

- (void)receiveExternalNotificationName:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *v6;
  unint64_t v7;
  void *v8;
  int v9;
  CNSchedulerProvider *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = (unint64_t)a3;
  if (!self)
    goto LABEL_9;
  v5 = self->_coalescingNotificationName;
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  v7 = self->_coalescingNotificationName;
  if (v4 | v7)
  {
    v8 = (void *)v7;
    v9 = -[NSString isEqual:](self->_coalescingNotificationName, "isEqual:", v4);

    if (v9)
      goto LABEL_6;
LABEL_9:
    v16 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)self, (void *)v4, 0, 0, 0, 0, 1);
    goto LABEL_10;
  }

LABEL_6:
  if (!self->_coalescingTimer)
  {
    objc_initWeak(&location, self);
    v10 = self->_schedulerProvider;
    v11 = objc_alloc(MEMORY[0x1E0D139C8]);
    -[CNChangesNotifierProxy externalNotificationCoalescingDelay](self, "externalNotificationCoalescingDelay");
    v13 = v12;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__CNChangesNotifierProxy_receiveExternalNotificationName___block_invoke;
    v17[3] = &unk_1E29FB7D8;
    objc_copyWeak(&v19, &location);
    v18 = (id)v4;
    -[CNSchedulerProvider mainThreadScheduler](v10, "mainThreadScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithDelay:options:block:schedulerProvider:downstreamScheduler:", 1, v17, v10, v14, v13);
    -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)self, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  -[CNCoalescingTimer handleEvent](self->_coalescingTimer, "handleEvent");
LABEL_10:

}

void __58__CNChangesNotifierProxy_receiveExternalNotificationName___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0, 0, 0, 0, 1);

}

- (void)setCoalescingTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)receiveNotificationName:(id)a3 fromSender:(id)a4 saveIdentifier:(id)a5 userInfo:(id)a6 isFromExternalProcess:(BOOL)a7
{
  id v7;

  v7 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)self, a3, a4, a5, a6, 0, a7);
}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:](v5, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, *(unsigned __int8 *)(a1 + 88));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    goto LABEL_10;
  }
  if (v5)
    v5 = (_QWORD *)v5[8];
  if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), 0, 1, *(_BYTE *)(a1 + 88));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 64);
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    if (*(_BYTE *)(a1 + 88))
      objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CNNotificationOriginationExternally"));
    if (v9)
    {
      v26[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("CNNotificationSourcesKey"));

    }
    else
    {
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("CNNotificationSourcesKey"));
    }
    if (*(_QWORD *)(a1 + 56))
    {
      v25 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("CNNotificationSaveIdentifiersKey"));

    }
    else
    {
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("CNNotificationSaveIdentifiersKey"));
    }

    v9 = 0;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_2;
  v20[3] = &unk_1E29FB828;
  v21 = *(id *)(a1 + 72);
  v22 = *(id *)(a1 + 40);
  v23 = v9;
  v24 = v11;
  v15 = v11;
  v16 = v9;
  v17 = objc_msgSend(v20, "copy");
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

LABEL_10:
}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_3;
  v3[3] = &unk_1E29FB800;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "postingNotification:", v3);

}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "postingNotificationWithName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)waitForCurrentTasksToFinish
{
  dispatch_sync((dispatch_queue_t)self->_notifierQueue, &__block_literal_global_76);
}

- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications
{
  return self->forwardsSelfGeneratedDistributedSaveNotifications;
}

- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3
{
  self->forwardsSelfGeneratedDistributedSaveNotifications = a3;
}

- (double)externalNotificationCoalescingDelay
{
  return self->_externalNotificationCoalescingDelay;
}

- (void)setExternalNotificationCoalescingDelay:(double)a3
{
  self->_externalNotificationCoalescingDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingNotificationName, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_notifierQueue, 0);
  objc_storeStrong((id *)&self->_notificationsToBeSentOnceAllowed, 0);
  objc_storeStrong((id *)&self->_supressedNotificationNames, 0);
  objc_storeStrong((id *)&self->_notificationForwardingMapping, 0);
  objc_storeStrong((id *)&self->_loggerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_notifyingBlocks, 0);
  objc_storeStrong((id *)&self->_removalBlocks, 0);
}

@end
