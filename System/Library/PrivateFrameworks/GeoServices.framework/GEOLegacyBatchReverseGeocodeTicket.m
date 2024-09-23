@implementation GEOLegacyBatchReverseGeocodeTicket

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "latLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLat:", a2);

  objc_msgSend(*(id *)(a1 + 32), "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLng:", a3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_batchReverseGeocodeWithRequest:auditToken:handler:networkActivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

void __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _GEOPlaceItem *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  GEOMapRegion *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "batchPlaceResultsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v2, "batchPlaceResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    v7 = 0.0;
    v8 = INFINITY;
    v9 = 0.0;
    v10 = INFINITY;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!v12 || (*(_BYTE *)(v12 + 20) & 1) != 0 && *(_DWORD *)(v12 + 16) || !*(_QWORD *)(v12 + 8))
        {
          v13 = 0;
        }
        else
        {
          -[GEOBatchPlaceResult placeResult]((id *)v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v14 = -[_GEOPlaceItem initWithPlaceResult:]([_GEOPlaceItem alloc], "initWithPlaceResult:", v13);
        objc_msgSend(v3, "addObject:", v14);
        objc_msgSend(v13, "place");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasMapRegion");

        if (v16)
        {
          objc_msgSend(v13, "place");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mapRegion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = GEOMapRectForMapRegion(v18);
          v10 = GEOMapRectUnion(v10, v8, v9, v7, v19, v20);
          v8 = v21;
          v9 = v22;
          v7 = v23;

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = INFINITY;
    v9 = 0.0;
    v10 = INFINITY;
  }

  if (fabs(v10 + -INFINITY) >= 0.00000001
    || fabs(v8 + -INFINITY) >= 0.00000001
    || fabs(v9) >= 0.00000001
    || fabs(v7) >= 0.00000001)
  {
    v24 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v10, v8, v9, v7);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  v27 = objc_msgSend(v3, "count");
  v28 = *(_QWORD *)(a1 + 40);
  if (v27)
  {
    (*(void (**)(_QWORD, void *, _QWORD))(v28 + 16))(*(_QWORD *)(a1 + 40), v3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v29);

  }
}

uint64_t __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
