@implementation GEOLocationShifterRemoteProxy

void __56___GEOLocationShifterRemoteProxy_isLocationShiftEnabled__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __38___GEOLocationShifterRemoteProxy_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[3];
    v4[3] = 0;

    WeakRetained = v4;
  }

}

void __75___GEOLocationShifterRemoteProxy_shiftLatLng_auditToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "function");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    objc_msgSend(v9, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
}

void __62___GEOLocationShifterRemoteProxy_locationShiftFunctionVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __67___GEOLocationShifterRemoteProxy_getAllShiftEntries_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a2, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v8, "addDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "coordinate");
        v12 = v11;
        objc_msgSend(v8, "coordinate");
        v14 = v13;
        objc_msgSend(v8, "radiusMeters");
        (*(void (**)(uint64_t, void *, double, double, double))(v9 + 16))(v9, v10, v12, v14, v15);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __110___GEOLocationShifterRemoteProxy_fetchCachedShiftFunctionResponseForLocation_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "function");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    objc_msgSend(v9, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
}

@end
