@implementation GEOTerritoryLookupRequestTicket

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "placeRequestParameters");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters territoryLookupParameters](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTerritoryLookupParameters setLocations:]((uint64_t)v4, v2);

  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5[37];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
  v8[3] = &unk_1E1C021B8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:", v7, v6, v8, 0, *(_QWORD *)(a1 + 56), 0.0);

}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_606(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "coordinate");
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "count"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v9);

  }
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2_611(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *global_queue;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v4 = objc_msgSend(a3, "unsignedIntegerValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectAtIndexedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v8 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v18[3] = &unk_1E1C06850;
  v19 = *(id *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v22 = v4;
  v21 = *(id *)(a1 + 40);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5;
  v16[3] = &unk_1E1C01F48;
  v17 = *(id *)(a1 + 80);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_6;
  v11[3] = &unk_1E1C068A0;
  v12 = *(id *)(a1 + 64);
  v13 = v5;
  v15 = *(_OWORD *)(a1 + 88);
  v14 = *(id *)(a1 + 40);
  v9 = v5;
  global_queue = (void *)geo_get_global_queue();
  objc_msgSend(v8, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v9, v7, v18, v16, v11, global_queue, 0.0);

}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  GEOLatLngE7 *v2;

  v2 = -[GEOLatLngE7 initWithCoordinate:]([GEOLatLngE7 alloc], "initWithCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_7(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1EDF51148 != -1)
    dispatch_once(&qword_1EDF51148, &__block_literal_global_1019);
  v2 = qword_1EDF51140;
  if (os_log_type_enabled((os_log_t)qword_1EDF51140, OS_LOG_TYPE_ERROR))
  {
    v3 = a1[4];
    v9 = 138477827;
    v10 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_ERROR, "Unable to shift coordinate: %{private}@ will not resolve territory information.", (uint8_t *)&v9, 0xCu);
  }
  v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "count"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return objc_msgSend(v4, "addObject:", a1[5]);
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_613(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v6);

  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 352);
    *(_QWORD *)(v4 + 352) = v3;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
