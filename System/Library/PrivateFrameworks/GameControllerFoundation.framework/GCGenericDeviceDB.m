@implementation GCGenericDeviceDB

void __39___GCGenericDeviceDB_initWithProvider___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_1DC79E000, "[Generic Device DB/Config] Did Change", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_2;
    block[3] = &unk_1EA4D2DB8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);

    os_activity_scope_leave(&state);
  }

}

uint64_t __39___GCGenericDeviceDB_initWithProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateConfigurationBundles");
}

void __39___GCGenericDeviceDB_initWithProvider___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[2];
    block[1] = 3221225472;
    block[2] = __39___GCGenericDeviceDB_initWithProvider___block_invoke_4;
    block[3] = &unk_1EA4D2DB8;
    v3 = WeakRetained;
    block[0] = MEMORY[0x1E0C809B0];
    v5 = WeakRetained;
    dispatch_async_and_wait(v2, block);

    WeakRetained = v3;
  }

}

void __39___GCGenericDeviceDB_initWithProvider___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  os_activity_scope_state_s v3;

  v2 = _os_activity_create(&dword_1DC79E000, "[Generic Device DB/Config] Refresh", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateConfigurationBundles");
  os_activity_scope_leave(&v3);

}

void __37___GCGenericDeviceDB_modelForDevice___block_invoke(uint64_t a1)
{
  -[_GCGenericDeviceDB _onqueue_loadConfigurationBundlesIfNeeded](*(_QWORD *)(a1 + 32));
}

void __51___GCGenericDeviceDB_preparedModelForDevice_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[9];

  v26[8] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setElementCookie:", objc_msgSend(v8, "elementCookie"));

LABEL_7:
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if ((objc_msgSend(v5, "optional") & 1) == 0)
    {
      v16 = *MEMORY[0x1E0CB2D68];
      v23[0] = *MEMORY[0x1E0CB2D50];
      v23[1] = v16;
      v24[0] = CFSTR("Error preparing model for device.");
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Did not find required element matching predicate for '%@'."), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v18;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", 0x1EA4D51C8, 7, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      *a3 = 1;
      goto LABEL_8;
    }
    objc_msgSend(v5, "setElementCookie:", 0);
    goto LABEL_7;
  }
  v9 = *MEMORY[0x1E0CB2D68];
  v25[0] = *MEMORY[0x1E0CB2D50];
  v25[1] = v9;
  v26[0] = CFSTR("Error preparing model for device.");
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Found multiple matching elements matching predicate for '%@'."), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", 0x1EA4D51C8, 7, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  *a3 = 1;
LABEL_8:

}

@end
