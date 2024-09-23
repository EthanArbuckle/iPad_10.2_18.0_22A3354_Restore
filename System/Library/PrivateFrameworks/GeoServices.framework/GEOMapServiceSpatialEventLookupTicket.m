@implementation GEOMapServiceSpatialEventLookupTicket

void __77___GEOMapServiceSpatialEventLookupTicket_submitWithHandler_auditToken_queue___block_invoke(uint64_t a1, void *a2, void *a3)
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
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "SpatialEventLookup received error %@", (uint8_t *)&v13, 0xCu);
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
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "SpatialEventLookup received empty response", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Received unexpected response"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "callCompletion:onQueue:withResult:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v12);

    }
  }

}

void __118___GEOMapServiceSpatialEventLookupTicket_createSpatialEventLookupResultForLookupResults_usingPlaces_completion_queue___block_invoke(uint64_t a1, id *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[GEOPDSpatialEventLookupResult events](a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count")
    || (objc_msgSend(*(id *)(a1 + 32), "eventsForEventLookupResponses:usingIdentifierToEventMap:", v10, *(_QWORD *)(a1 + 40)), v5 = (void *)objc_claimAutoreleasedReturnValue(), (v6 = v5) == 0))
  {
    v5 = 0;
    v6 = *(void **)(a1 + 48);
  }
  v7 = v6;

  v8 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

uint64_t __82___GEOMapServiceSpatialEventLookupTicket_callCompletion_onQueue_withResult_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return result;
}

@end
