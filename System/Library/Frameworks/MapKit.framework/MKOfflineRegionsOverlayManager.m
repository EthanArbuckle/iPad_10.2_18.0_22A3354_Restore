@implementation MKOfflineRegionsOverlayManager

uint64_t __62___MKOfflineRegionsOverlayManager__setOverlay_customFeatures___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "removeOverlay:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
  v4 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 48))
  {
    v8 = objc_loadWeakRetained((id *)(v7 + 8));
    objc_msgSend(v8, "_addInternalOverlay:level:provider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 1);

    v7 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v7 + 72), "dataSource:featuresDidChangeForRect:", *MEMORY[0x1E0D266E8], *(double *)(MEMORY[0x1E0D266E8] + 8), *(double *)(MEMORY[0x1E0D266E8] + 16), *(double *)(MEMORY[0x1E0D266E8] + 24));
}

uint64_t __42___MKOfflineRegionsOverlayManager__update__block_invoke(uint64_t a1)
{
  unsigned int v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  _QWORD v8[5];
  unsigned int v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[2];
  if (v4 != 1)
  {
    v5 = v2;
    if (v4)
      v6 = 0;
    else
      v6 = v2 >= 2u;
    if (!v6)
      return objc_msgSend(v3, "_setOverlay:customFeatures:", 0, 0);
    if (v2 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v5;
        _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
        v3 = *(_QWORD **)(a1 + 32);
      }
      return objc_msgSend(v3, "_setOverlay:customFeatures:", 0, 0);
    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42___MKOfflineRegionsOverlayManager__update__block_invoke_2;
  v8[3] = &unk_1E20D9460;
  v9 = v2;
  v8[4] = v3;
  return objc_msgSend(v3, "_fetchFullyLoadedSubscriptionsForState:completionHandler:", v2, v8);
}

void __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

void __51___MKOfflineRegionsOverlayManager_initWithMapView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

void __42___MKOfflineRegionsOverlayManager__update__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  MKMultiPolygon *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(_DWORD *)(a1 + 40) == objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = v8;
  if (v3)
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "_geo_map:", &__block_literal_global_18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
        v6 = -[MKMultiPolygon initWithPolygons:]([MKMultiPolygon alloc], "initWithPolygons:", v5);
      else
        v6 = 0;
      objc_msgSend(v8, "_geo_map:", &__block_literal_global_64);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_setOverlay:customFeatures:", v6, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_setOverlay:customFeatures:", 0, 0);
    }
    v4 = v8;
  }

}

id __42___MKOfflineRegionsOverlayManager__update__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  CLLocationDegrees v5;
  void *v6;
  CLLocationDegrees v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  void *v11;
  CLLocationDegrees v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  void *v16;
  CLLocationDegrees v17;
  void *v18;
  double v19;
  CLLocationDegrees v20;
  void *v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v24[4];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "northLat");
  v5 = v4;
  objc_msgSend(v2, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "westLng");
  v24[0] = CLLocationCoordinate2DMake(v5, v7);
  objc_msgSend(v2, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "northLat");
  v10 = v9;
  objc_msgSend(v2, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eastLng");
  v24[1] = CLLocationCoordinate2DMake(v10, v12);
  objc_msgSend(v2, "region");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "southLat");
  v15 = v14;
  objc_msgSend(v2, "region");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eastLng");
  v24[2] = CLLocationCoordinate2DMake(v15, v17);
  objc_msgSend(v2, "region");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "southLat");
  v20 = v19;
  objc_msgSend(v2, "region");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "westLng");
  v24[3] = CLLocationCoordinate2DMake(v20, v22);

  +[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v24, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

_MKOfflineRegionCustomFeature *__42___MKOfflineRegionsOverlayManager__update__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  _MKOfflineRegionCustomFeature *v3;

  v2 = a2;
  v3 = -[_MKOfflineRegionCustomFeature initWithSubscription:]([_MKOfflineRegionCustomFeature alloc], "initWithSubscription:", v2);

  return v3;
}

void __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id obj;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "_geo_filtered:", &__block_literal_global_70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
          dispatch_group_enter(v5);
          v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_3;
          v23[3] = &unk_1E20D94C8;
          v24 = v6;
          v25 = v11;
          v26 = v5;
          objc_msgSend(v12, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v13, v14, v23);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

    v15 = *(void **)(a1 + 40);
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_4;
    block[3] = &unk_1E20D7F70;
    v21 = v6;
    v22 = v15;
    v17 = v6;
    dispatch_group_notify(v5, v16, block);

    v4 = v18;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

unint64_t __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "dataTypes") >> 10) & 1;
}

void __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && (unint64_t)(objc_msgSend(v6, "loadState") - 1) <= 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __92___MKOfflineRegionsOverlayManager__fetchFullyLoadedSubscriptionsForState_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
