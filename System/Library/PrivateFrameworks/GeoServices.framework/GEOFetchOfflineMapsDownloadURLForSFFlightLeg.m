@implementation GEOFetchOfflineMapsDownloadURLForSFFlightLeg

void __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  GEOMapRegion *v12;
  double Double;
  GEOMapRegion *v14;
  GEOMapSubscriptionContainmentRequest *v15;
  id v16;
  GEOMapRegion *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v20[4];
  GEOMapRegion *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  GEOGetOfflineUtilitiesLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138477827;
    v26 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[Flight] Fetching offline punchout for flight leg: %{private}@", buf, 0xCu);
  }

  if ((GEOConfigGetBOOL(GeoOfflineConfig_SpotlightFlightDetailsDownloadMapEnabled, (uint64_t)off_1EDF4EAF8) & 1) != 0)
  {
    if (GEOSupportsOfflineMaps())
    {
      objc_msgSend(a1[4], "arrivalAirport");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lat");
      v7 = v6;
      objc_msgSend(a1[4], "arrivalAirport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lng");
      v11 = v10;

      v12 = [GEOMapRegion alloc];
      Double = GEOConfigGetDouble(GeoOfflineConfig_FlightLegDownloadRegionRadius, (uint64_t)off_1EDF4EB08);
      v14 = -[GEOMapRegion initWithMapRect:](v12, "initWithMapRect:", (double)GEOMapRectMakeWithRadialDistance(v7, v11, Double));
      v15 = -[GEOMapSubscriptionContainmentRequest initWithTraits:auditToken:throttleToken:]([GEOMapSubscriptionContainmentRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
      -[GEOMapSubscriptionContainmentRequest setRegion:](v15, "setRegion:", v14);
      -[GEOMapSubscriptionContainmentRequest setDataTypes:](v15, "setDataTypes:", 1024);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_7;
      v20[3] = &unk_1E1C15210;
      v16 = a1[5];
      v24 = a1[6];
      v21 = v14;
      v22 = a1[5];
      v23 = a1[4];
      v17 = v14;
      -[GEOXPCRequest send:withReply:handler:](v15, "send:withReply:handler:", 0, v16, v20);

      return;
    }
    GEOGetOfflineUtilitiesLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "[Flight] Offline is not supported";
      goto LABEL_10;
    }
  }
  else
  {
    GEOGetOfflineUtilitiesLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "[Flight] Not enabled";
LABEL_10:
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
    }
  }

  (*((void (**)(void))a1[6] + 2))();
}

void __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  GEOMapDataSubscriptionManager *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __int128 *p_buf;
  _QWORD *v21;
  _QWORD v22[5];
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (!objc_msgSend(v5, "sufficientlyContained"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__86;
      v26 = __Block_byref_object_dispose__86;
      v27 = 0;
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2810000000;
      v22[3] = "";
      v22[4] = 0;
      v8 = objc_alloc_init(GEOMapDataSubscriptionManager);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_9;
      v16[3] = &unk_1E1C151E8;
      p_buf = &buf;
      v21 = v22;
      v19 = *(id *)(a1 + 56);
      v17 = *(id *)(a1 + 32);
      v18 = *(id *)(a1 + 48);
      -[GEOMapDataSubscriptionManager determineEstimatedSizeForSubscriptionWithRegion:dataTypes:queue:completionHandler:](v8, "determineEstimatedSizeForSubscriptionWithRegion:dataTypes:queue:completionHandler:", v9, 1024, v10, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOConfigGetDouble(GeoOfflineConfig_FlightLegEligibilityTimeout, (uint64_t)off_1EDF4EB18);
      v14 = v11;
      v15 = *(id *)(a1 + 56);
      v12 = geo_dispatch_timer_create_on_queue();
      v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

      dispatch_resume(*(dispatch_object_t *)(*((_QWORD *)&buf + 1) + 40));
      _Block_object_dispose(v22, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_10;
    }
    GEOGetOfflineUtilitiesLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "[Flight] Destination is sufficiently contained. Not enabling download action", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    GEOGetOfflineUtilitiesLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "[Flight] Failed to check containment: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_10:

}

void __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    dispatch_source_cancel(v6);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_2;
  v11[3] = &unk_1E1C151C0;
  v12 = v5;
  v16 = a2;
  v15 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v10 = v5;
  GEOOnce(v9, v11);

}

void __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 64))
  {
    GEOGetOfflineUtilitiesLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v3;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "[Flight] Request failed with error: %{public}@. Not enabling download action", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", CFSTR("maps"));
    v5 = (void *)MEMORY[0x1E0CB39D8];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "northLat");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "westLng");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 40), "southLat");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 40), "eastLng");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%f,%f,%f,%f"), v8, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItemWithName:value:", CFSTR("_odr"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v16 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(*(id *)(a1 + 48), "arrivalAirport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "city");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryItemWithName:value:", CFSTR("label"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v20);

    objc_msgSend(v4, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_2_25;
  v6[3] = &unk_1E1BFFBF0;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  GEOOnce(v5, v6);

}

uint64_t __GEOFetchOfflineMapsDownloadURLForSFFlightLeg_block_invoke_2_25(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  GEOGetOfflineUtilitiesLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "[Flight] Request timed out. Not enabling download action", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
