@implementation GEOMapServiceSpatialPlaceLookupTicket

void __77___GEOMapServiceSpatialPlaceLookupTicket_submitWithHandler_auditToken_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequestEND"), v5);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      GEOGetGEOBatchSpatialLookupLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup received error %@", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "callCompletion:onQueue:withResult:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v6);
    }
    else if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "handleResponse:completion:queue:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      GEOGetGEOBatchSpatialLookupLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup received empty response", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Received unexpected response"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "callCompletion:onQueue:withResult:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v12);

    }
  }

}

void __74___GEOMapServiceSpatialPlaceLookupTicket_handleResponse_completion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "callCompletion:onQueue:withResult:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v13, "_identifier", (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v13, "_identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v13, v15);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      objc_msgSend(*(id *)(a1 + 32), "createSpatialPlaceLookupResultForLookupResults:mapItems:completion:queue:", *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }
  }

}

void __115___GEOMapServiceSpatialPlaceLookupTicket_createSpatialPlaceLookupResultForLookupResults_mapItems_completion_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  GEOSpatialPlaceLookupResultItem *v12;
  void *v13;
  GEOSpatialPlaceLookupResultItem *v14;
  void *v15;
  id v16;

  v5 = a2;
  -[GEOPDSpatialPlaceLookupResult places](v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count")
    || (objc_msgSend(*(id *)(a1 + 32), "mapItemsForPlaceLookupResponses:usingIdentifierToMapItemMap:", v16, *(_QWORD *)(a1 + 40)), v6 = (void *)objc_claimAutoreleasedReturnValue(), (v7 = v6) == 0))
  {
    v6 = 0;
    v7 = *(void **)(a1 + 48);
  }
  v8 = v7;

  v9 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

  v11 = *(void **)(a1 + 64);
  v12 = [GEOSpatialPlaceLookupResultItem alloc];
  -[GEOPDSpatialPlaceLookupResult displayMapRegion](v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[GEOSpatialPlaceLookupResultItem initWithMapItems:boundingRegion:](v12, "initWithMapItems:boundingRegion:", v8, v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v14, v15);

}

uint64_t __82___GEOMapServiceSpatialPlaceLookupTicket_callCompletion_onQueue_withResult_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return result;
}

@end
