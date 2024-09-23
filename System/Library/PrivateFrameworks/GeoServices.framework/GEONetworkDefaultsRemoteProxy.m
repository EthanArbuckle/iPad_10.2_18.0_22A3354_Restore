@implementation GEONetworkDefaultsRemoteProxy

void __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") != 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "addObject:", v6);

}

void __38___GEONetworkDefaultsRemoteProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_networkDefaultsDidChange");

}

void __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__47;
  v26 = __Block_byref_object_dispose__47;
  v27 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2_176;
  v19 = &unk_1E1C00760;
  v20 = v7;
  v21 = &v22;
  geo_isolate_sync_data();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = (id)v23[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v28, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2_176(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

@end
