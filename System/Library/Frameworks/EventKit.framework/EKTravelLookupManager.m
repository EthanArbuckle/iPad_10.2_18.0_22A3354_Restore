@implementation EKTravelLookupManager

+ (id)defaultManager
{
  id v2;
  EKTravelLookupManager *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!defaultManager__defaultManager)
  {
    v3 = objc_alloc_init(EKTravelLookupManager);
    v4 = (void *)defaultManager__defaultManager;
    defaultManager__defaultManager = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)defaultManager__defaultManager;
}

- (void)_travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v14;
    _os_log_debug_impl(&dword_1A2318000, v17, OS_LOG_TYPE_DEBUG, "Received request to find travel time from %@ to %@ by %@ arriving on date %@", buf, 0x2Au);
  }
  dispatch_get_global_queue(0, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke;
  v24[3] = &unk_1E4787DC8;
  v24[4] = self;
  v25 = v12;
  v26 = v13;
  v27 = v15;
  v28 = v14;
  v29 = v16;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v16;
  v23 = v12;
  dispatch_async(v18, v24);

}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E4787DA0;
  v4 = *(id *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v6[4] = v5;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_findCoordinatesForLocation:completionBlock:", v3, v6);

}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3;
    v7[3] = &unk_1E4787DA0;
    v13 = *(id *)(a1 + 72);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 56);
    v5 = *(id *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v3, "_findCoordinatesForLocation:completionBlock:", v4, v7);

  }
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3_cold_1();
    objc_msgSend(*(id *)(a1 + 64), "_travelTimeWithStartCoordinate:endCoordinate:arrivalDate:withRouteType:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  }

}

- (void)travelTimeFrom:(id)a3 to:(id)a4 arrivalDate:(id)a5 withRouteTypes:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  EKTravelLookupManager *v33;
  id v34;
  id v35;
  id v36;
  _BYTE *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  uint8_t v44[128];
  _BYTE buf[24];
  uint64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v12 = a6;
  v24 = a7;
  v13 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v46 = (uint64_t)v12;
    v47 = 2112;
    v48 = v25;
    _os_log_debug_impl(&dword_1A2318000, v13, OS_LOG_TYPE_DEBUG, "Received request to find travel time from %@ to %@ by %@ arriving on date %@", buf, 0x2Au);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v46 = 0;
  v46 = objc_msgSend(v12, "count");
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v40;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v17);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke;
        v28[3] = &unk_1E4787DF0;
        v29 = v23;
        v30 = v18;
        v37 = buf;
        v38 = v43;
        v19 = v14;
        v31 = v19;
        v20 = v27;
        v32 = v20;
        v33 = self;
        v21 = v26;
        v34 = v21;
        v22 = v25;
        v35 = v22;
        v36 = v24;
        -[EKTravelLookupManager _travelTimeFrom:to:arrivalDate:withRouteType:withCompletionBlock:](self, "_travelTimeFrom:to:arrivalDate:withRouteType:withCompletionBlock:", v20, v21, v22, v18, v28);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v15);
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);

}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v6, "code") == 5 || objc_msgSend(v6, "code") == 4)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_4();
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    if (v8 == objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v9 = objc_msgSend(*(id *)(a1 + 56), "isCurrentLocation");
      v10 = EKLogHandle;
      v11 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
      if ((v9 & 1) == 0)
      {
        if (v11)
          __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_2(v10, v12, v13, v14, v15, v16, v17, v18);
        v20 = objc_alloc_init(MEMORY[0x1E0D0C328]);
        objc_msgSend(v20, "setType:", 2);
        objc_msgSend(*(id *)(a1 + 64), "travelTimeFrom:to:arrivalDate:withRouteTypes:withCompletionBlock:", v20, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));
        goto LABEL_21;
      }
      if (v11)
        __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_3();
    }
    v19 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v20);
LABEL_21:

  }
  objc_sync_exit(v7);

}

- (void)_travelTimeWithStartCoordinate:(id)a3 endCoordinate:(id)a4 arrivalDate:(id)a5 withRouteType:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint64_t v17;
  int v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  EKTravelLookupManager *v28;
  void (**v29)(id, _QWORD, void *);
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  if (((objc_msgSend(v12, "isCurrentLocation") & 1) != 0 || objc_msgSend(v13, "isCurrentLocation"))
    && ((v17 = *MEMORY[0x1E0D0C468],
         v18 = objc_msgSend(MEMORY[0x1E0D0C330], "authorizationStatusForBundleIdentifier:", *MEMORY[0x1E0D0C468]),
         v19 = objc_msgSend(MEMORY[0x1E0D0C330], "preciseLocationAuthorizedForBundleIdentifier:", v17),
         v18 < 3)
     || (v19 & 1) == 0))
  {
    v21 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v21, OS_LOG_TYPE_DEFAULT, "Can't use current location for travel time estimation because Calendar is not authorized for precise location access.", buf, 2u);
    }
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", EKTravelLookupErrorDomain, 0, 0);
    v16[2](v16, 0, v20);
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke;
    v23[3] = &unk_1E4787E40;
    v24 = v12;
    v25 = v13;
    v26 = v15;
    v27 = v14;
    v28 = self;
    v29 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

    v20 = v24;
  }

}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;

  v2 = (objc_class *)EKWeakLinkClass();
  v3 = (void *)EKWeakLinkClass();
  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentLocation"))
  {
    objc_msgSend(v3, "mapItemForCurrentLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [v2 alloc];
    objc_msgSend(*(id *)(a1 + 32), "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "placemark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addressDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v5, "initWithCoordinate:addressDictionary:", v12, v8, v10);

    v4 = (void *)objc_msgSend(objc_alloc((Class)v3), "initWithPlacemark:", v13);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCurrentLocation"))
  {
    objc_msgSend(v3, "mapItemForCurrentLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = [v2 alloc];
    objc_msgSend(*(id *)(a1 + 40), "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    v18 = v17;
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 40), "placemark");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addressDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v15, "initWithCoordinate:addressDictionary:", v22, v18, v20);

    v14 = (void *)objc_msgSend(objc_alloc((Class)v3), "initWithPlacemark:", v23);
  }
  v24 = (objc_class *)EKWeakLinkClass();
  v25 = (objc_class *)EKWeakLinkClass();
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x1E0D0C178]) & 1) != 0)
  {
    v26 = 2;
  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x1E0D0C168]) & 1) != 0)
  {
    v26 = 1;
  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x1E0D0C170]) & 1) != 0)
  {
    v26 = 4;
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x1E0D0C160]))
  {
    v26 = 8;
  }
  else
  {
    v26 = 1;
  }
  v27 = objc_alloc_init(v24);
  objc_msgSend(v27, "setSource:", v4);
  objc_msgSend(v27, "setDestination:", v14);
  objc_msgSend(v27, "setArrivalDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v27, "setTransportType:", v26);
  v28 = (void *)objc_msgSend([v25 alloc], "initWithRequest:", v27);
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_cold_1();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21;
  v31[3] = &unk_1E4787E18;
  v36 = *(id *)(a1 + 72);
  v32 = *(id *)(a1 + 32);
  v33 = *(id *)(a1 + 40);
  v29 = *(id *)(a1 + 48);
  v30 = *(_QWORD *)(a1 + 64);
  v34 = v29;
  v35 = v30;
  objc_msgSend(v28, "calculateETAWithCompletionHandler:", v31);

}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend(v6, "code");
    if ((unint64_t)(v7 - 1) > 4)
      v8 = CFSTR("EKTravelLookupErrorUnknown");
    else
      v8 = off_1E4787ED8[v7 - 1];
    v23 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_3((uint64_t)v8, v23, v6);
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    objc_msgSend(v5, "expectedTravelTime");
    v10 = v9;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_2();
    v11 = objc_alloc_init(MEMORY[0x1E0D0C390]);
    objc_msgSend(v11, "setStart:", a1[4]);
    objc_msgSend(v11, "setEnd:", a1[5]);
    objc_msgSend(v11, "setDuration:", v10);
    objc_msgSend(v11, "setRoute:", a1[6]);
    if (objc_msgSend((id)a1[4], "isCurrentLocation"))
    {
      v12 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      v20 = (void *)a1[7];
      v21 = a1[4];
      objc_msgSend(v5, "source");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_updateLocation:withMapItem:forRoute:withCompletionBlock:", v21, v22, v11, a1[8]);

    }
    else
    {
      (*(void (**)(void))(a1[8] + 16))();
    }

  }
}

- (void)_updateLocation:(id)a3 withMapItem:(id)a4 forRoute:(id)a5 withCompletionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a4, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLocation:", v13);
  v14 = (void *)MEMORY[0x1E0D0C338];
  objc_msgSend(v9, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke;
  v20[3] = &unk_1E4787E68;
  v22 = v10;
  v23 = v11;
  v21 = v9;
  v16 = v10;
  v17 = v11;
  v18 = v9;
  v19 = (id)objc_msgSend(v14, "placemarkForLocation:withCompletionBlock:", v15, v20);

}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_1();
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", EKTravelLookupErrorDomain, 1, 0);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(v5, "addressDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithAddressBookDictionaryRepresentation:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAddress:", v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "setPlacemark:", v5);
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v11);

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_2();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v12();

}

- (void)_findCoordinatesForLocation:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  EKTravelLookupManager *v22;
  void (**v23)(id, _QWORD);
  CLLocationCoordinate2D v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.6();
  objc_msgSend(v6, "location");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v11 = CLLocationCoordinate2DIsValid(v24);

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.5();
LABEL_10:
      v7[2](v7, 0);
      goto LABEL_20;
    }
  }
  v12 = objc_msgSend(v6, "isCurrentLocation");
  v13 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v13)
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.1();
    goto LABEL_10;
  }
  if (v13)
    -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.4();
  objc_msgSend(v6, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.3();
    v15 = (void *)MEMORY[0x1E0D0C338];
    objc_msgSend(v6, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke;
    v20[3] = &unk_1E4787E90;
    v21 = v6;
    v22 = self;
    v23 = v7;
    v17 = (id)objc_msgSend(v15, "placemarkForAddress:withCompletionBlock:", v16, v20);

  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", EKTravelLookupErrorDomain, 1, 0);
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKTravelLookupManager _findCoordinatesForLocation:completionBlock:].cold.2();
    ((void (**)(id, void *))v7)[2](v7, v19);

  }
LABEL_20:

}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  CLLocationCoordinate2D v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v9 = CLLocationCoordinate2DIsValid(v12);

    if (v9)
    {
      objc_msgSend(v5, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLocation:", v10);

      objc_msgSend(*(id *)(a1 + 32), "setPlacemark:", v5);
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_3();
    }
  }
  else if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_2();
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", EKTravelLookupErrorDomain, 2, 0);
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)estimateGeolocationFromHistoricDevicePositionAtLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a4;
  v6 = a3;
  v7 = (objc_class *)EKWeakLinkClass();
  v8 = EKWeakLinkClass();
  v9 = objc_alloc_init(v7);
  CFRetain(v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__EKTravelLookupManager_estimateGeolocationFromHistoricDevicePositionAtLocation_withCompletionBlock___block_invoke;
  v12[3] = &unk_1E4787EB8;
  v14 = v5;
  v15 = v8;
  v13 = v9;
  v10 = v9;
  v11 = v5;
  objc_msgSend(v10, "fetchLocationsOfInterestAssociatedToIdentifier:withHandler:", v6, v12);

}

void __101__EKTravelLookupManager_estimateGeolocationFromHistoricDevicePositionAtLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confidence");
    if (v5 >= 0.5)
    {
      v6 = objc_alloc(*(Class *)(a1 + 48));
      objc_msgSend(v4, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "latitude");
      v9 = v8;
      objc_msgSend(v4, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "longitude");
      v12 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v9, v11);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __90__EKTravelLookupManager__travelTimeFrom_to_arrivalDate_withRouteType_withCompletionBlock___block_invoke_3_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t v5[14];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  v6 = v0;
  v7 = v1;
  v8 = v2;
  v9 = v1;
  v10 = v3;
  _os_log_debug_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEBUG, "Calculating travel time from %@ to %@ by %@ on date %@", v5, 0x2Au);
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Found no travel times, only errors.  Bailing.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Found no travel times, only errors.  Trying again with start as current location", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Finished finding travel times with results %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKTravelLookupManager_travelTimeFrom_to_arrivalDate_withRouteTypes_withCompletionBlock___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Didn't find route or error for routeType %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, (uint64_t)v1, "Getting directions %@ with request %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "Updating start location with current location information", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Found travel time in seconds %lul", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __112__EKTravelLookupManager__travelTimeWithStartCoordinate_endCoordinate_arrivalDate_withRouteType_completionBlock___block_invoke_21_cold_3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v5, v7, "Travel time lookup failed with error code %@: %@", (uint8_t *)&v8);

}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Failed to get placemark with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __82__EKTravelLookupManager__updateLocation_withMapItem_forRoute_withCompletionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Updated location to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "%@ is for current location.  Let MapKit handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "%@ has no address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "%@ has an address.  Looking up coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "%@ doesn't have coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "%@ already has coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_findCoordinatesForLocation:completionBlock:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Making sure that %@ has coordinates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Couldn't find coordinates for address for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  v3 = v0;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, (uint64_t)v1, "Couldn't find coordinates for address for %@ and failed with error %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __69__EKTravelLookupManager__findCoordinatesForLocation_completionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Found coordinates for address. Updated location to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
