@implementation MSPStorageTipsManager

- (MSPStorageTipsManager)init
{
  MSPStorageTipsManager *v2;
  id v3;
  uint64_t v4;
  id offlineOptimizeStorageEnabledListener;
  MSPStorageTipsManager *v6;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSPStorageTipsManager;
  v2 = -[MSPStorageTipsManager init](&v10, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v8, &location);
    _GEOConfigAddBlockListenerForKey();
    v4 = objc_claimAutoreleasedReturnValue();
    offlineOptimizeStorageEnabledListener = v2->_offlineOptimizeStorageEnabledListener;
    v2->_offlineOptimizeStorageEnabledListener = (id)v4;

    v6 = v2;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __29__MSPStorageTipsManager_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("MSPStorageTipsManagerTipDidChangeNotification"), WeakRetained);

  }
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)MSPStorageTipsManager;
  -[MSPStorageTipsManager dealloc](&v3, sel_dealloc);
}

- (void)fetchProposedTipWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *global_queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a3;
  if (GEOConfigGetBOOL())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke;
    block[3] = &unk_1E6653508;
    v13 = v3;
    v4 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v13;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D27190]);
    global_queue = (void *)geo_get_global_queue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6653E10;
    v10 = v6;
    v11 = v3;
    v5 = v6;
    v8 = v3;
    objc_msgSend(v5, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", global_queue, v9);

  }
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *global_queue;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id obj;
  _QWORD block[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  int v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v18 = v4;
  v19 = a3;
  if (v4)
  {
    if (objc_msgSend(v4, "count", v4, v19))
    {
      objc_msgSend(v4, "_geo_filtered:", &__block_literal_global_13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x2810000000;
        v44[3] = &unk_1B3A46DC5;
        v45 = 0;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = __Block_byref_object_copy__5;
        v42[4] = __Block_byref_object_dispose__5;
        v43 = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x2020000000;
        v41 = 0;
        v6 = dispatch_group_create();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = v5;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v37 != v8)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              dispatch_group_enter(v6);
              v11 = *(void **)(a1 + 32);
              objc_msgSend(v10, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              global_queue = (void *)geo_get_global_queue();
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_7;
              v31[3] = &unk_1E6653D30;
              v33 = v42;
              v34 = v44;
              v35 = v40;
              v32 = v6;
              objc_msgSend(v11, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v12, global_queue, v31);

            }
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
          }
          while (v7);
        }

        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x2020000000;
        v30[3] = 0;
        dispatch_group_enter(v6);
        v14 = *(void **)(a1 + 32);
        v15 = (void *)geo_get_global_queue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2_9;
        v27[3] = &unk_1E6653D58;
        v29 = v30;
        v16 = v6;
        v28 = v16;
        objc_msgSend(v14, "_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:completionHandler:", v15, v27);

        v17 = geo_get_global_queue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3_11;
        block[3] = &unk_1E6653DE8;
        v24 = v40;
        v25 = v30;
        v23 = *(id *)(a1 + 40);
        v26 = v42;
        dispatch_group_notify(v16, v17, block);

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(v40, 8);
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        v5 = obj;
      }
      else
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6;
        v46[3] = &unk_1E6653508;
        v47 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x1E0C80D38], v46);

      }
    }
    else
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4;
      v48[3] = &unk_1E6653508;
      v49 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], v48);
      v5 = v49;
    }
  }
  else
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3;
    v50[3] = &unk_1E6653330;
    v52 = *(id *)(a1 + 40);
    v51 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v50);

    v5 = v52;
  }

}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

unint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    if ((unint64_t)(objc_msgSend(v7, "loadState") - 1) <= 2)
    {
      v6 = a1 + 48;
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 32));
    }
  }
  else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = a1 + 48;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    goto LABEL_6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2_9(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 < 0x7FFFFFFFFFFFFFFFLL)
    v3 = a2;
  if (a3)
    v3 = -1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3_11(uint64_t a1)
{
  void *v2;
  void *v3;
  MSPStorageTip *v4;
  void *v5;
  void *v6;
  MSPStorageTip *v7;
  id v8;
  MSPStorageTip *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD block[4];
  MSPStorageTip *v16;
  id v17;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MapsSupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OFFLINE_OPTIMIZE_STORAGE_TIP_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = [MSPStorageTip alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MapsSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OFFLINE_OPTIMIZE_STORAGE_TIP_TITLE"), CFSTR("localized string not found"), CFSTR("Offline"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MSPStorageTip initWithTitle:message:expectedSize:enablementAction:](v4, "initWithTitle:message:expectedSize:enablementAction:", v6, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &__block_literal_global_26_0);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5_27;
    block[3] = &unk_1E6653330;
    v8 = *(id *)(a1 + 32);
    v16 = v7;
    v17 = v8;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6_28;
    v12[3] = &unk_1E6653DC0;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    v13 = v10;
    v14 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v12);
    v3 = v13;
  }

}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4_24(uint64_t a1, void *a2)
{
  void (**v2)(id, _QWORD);

  v2 = a2;
  GEOConfigSetBOOL();
  v2[2](v2, 0);

}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_offlineOptimizeStorageEnabledListener, 0);
}

@end
