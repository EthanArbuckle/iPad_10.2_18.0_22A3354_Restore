@implementation EKStructuredLocationPrediction

+ (id)locationPredictionForEvent:(id)a3 error:(id *)a4 timeout:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  NSObject *v34;
  uint8_t *v35;
  id v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.CoreRoutine.LocationOfInterest")) & 1) == 0)
  {
    v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v18, OS_LOG_TYPE_INFO, "Skipping looking up predicted location because process is not entitled.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(a1, "shouldDoLocationPredictionForEvent:", v7))
  {
LABEL_8:
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationWithoutPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__24;
  v41 = __Block_byref_object_dispose__24;
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "get_suggestedLocationsTestMode");

  if (v13
    && (objc_msgSend(a1, "_mockLocationForEvent:", v7),
        v14 = objc_claimAutoreleasedReturnValue(),
        v15 = (void *)*((_QWORD *)v38 + 5),
        *((_QWORD *)v38 + 5) = v14,
        v15,
        (v16 = (void *)*((_QWORD *)v38 + 5)) != 0))
  {
    v17 = v16;
  }
  else
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0D0C340], "predictedLocationOfInterestForEventTitle:eventLocation:calendarIdentifier:timeout:error:", v8, v9, v11, dispatch_time(0, (uint64_t)(a5 * 1000000000.0)), &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v36;
    if (v19)
    {
      v21 = (void *)EKWeakLinkClass();
      v30 = v20;
      objc_msgSend(v19, "locationOfInterest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = dispatch_semaphore_create(0);
      objc_msgSend(v21, "sharedService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mapItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "geoMapItemHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke;
      v31[3] = &unk_1E4789348;
      v35 = buf;
      v27 = v22;
      v32 = v27;
      v33 = v19;
      v28 = v23;
      v34 = v28;
      objc_msgSend(v24, "resolveMapItemLocallyFromHandle:completionHandler:", v26, v31);

      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      v20 = v30;
    }
    v17 = *((id *)v38 + 5);

  }
  _Block_object_dispose(buf, 8);

LABEL_13:
  return v17;
}

void __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  EKPredictedLocationOfInterest *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[EKStructuredLocation locationWithGEOMapItem:](EKStructuredLocation, "locationWithGEOMapItem:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "horizontalUncertainty");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setRadius:");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setImprecise:", 1);
    v11 = -[EKPredictedLocationOfInterest initWithPredictedLocationOfInterest:]([EKPredictedLocationOfInterest alloc], "initWithPredictedLocationOfInterest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPredictedLOI:", v11);

  }
  else
  {
    v12 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke_cold_1(v12, v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

+ (BOOL)shouldDoLocationPredictionForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BOOL4 v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "preferredLocationWithoutPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "get_suggestEventLocations") && (objc_msgSend(v3, "isNew") & 1) == 0)
  {
    objc_msgSend(v4, "geoLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || objc_msgSend(v3, "locationPredictionState"))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "calendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "allowsContentModifications"))
      {
        objc_msgSend(v3, "calendar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "type") == 4)
        {
          v6 = 0;
        }
        else
        {
          objc_msgSend(v3, "calendar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "type") == 3)
          {
            v6 = 0;
          }
          else
          {
            objc_msgSend(v3, "calendar");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v25, "type") != 6;

          }
        }

      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v3, "externalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "locationPredictionState");
    objc_msgSend(v3, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544387;
    v27 = v10;
    v28 = 2117;
    v29 = v11;
    v30 = 1024;
    v31 = v12 != 0;
    v32 = 2048;
    v33 = v13;
    v34 = 1024;
    v35 = objc_msgSend(v14, "allowsContentModifications");
    _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_INFO, "Checking should do location prediction for event: %{public}@, title: %{sensitive}@, eventHasLocation: %{BOOL}d, locationPredictionState: %ld, allowsContentModifications: %d", (uint8_t *)&v26, 0x2Cu);

  }
  if (v6)
  {
    v15 = *MEMORY[0x1E0D0C468];
    v16 = objc_msgSend(MEMORY[0x1E0D0C330], "authorizationStatusForBundleIdentifier:", *MEMORY[0x1E0D0C468]);
    v17 = objc_msgSend(MEMORY[0x1E0D0C330], "locationPrecisionForBundleIdentifier:", v15);
    v19 = (v16 - 3) < 2 && v17 == 2;
  }
  else
  {
    v19 = 0;
  }
  v20 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v26 = 67109120;
    LODWORD(v27) = v19;
    _os_log_impl(&dword_1A2318000, v20, OS_LOG_TYPE_INFO, "shouldDoLocationPrediction: %d", (uint8_t *)&v26, 8u);
  }

  return v19;
}

+ (void)userInteractionWithPredictedLocationOfInterest:(id)a3 interaction:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "rtPredictedLocationOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (userInteractionWithPredictedLocationOfInterest_interaction__onceToken != -1)
      dispatch_once(&userInteractionWithPredictedLocationOfInterest_interaction__onceToken, &__block_literal_global_85);
    objc_msgSend((id)userInteractionWithPredictedLocationOfInterest_interaction__RTRoutineManagerClass, "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject userInteractionWithPredictedLocationOfInterest:interaction:feedback:](v7, "userInteractionWithPredictedLocationOfInterest:interaction:feedback:", v6, a4, 0);
    goto LABEL_7;
  }
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v8;
    objc_msgSend(v5, "customLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Got user interaction for mocked location of interest (%{public}@). Interaction type = %d", (uint8_t *)&v10, 0x12u);

LABEL_7:
  }

}

uint64_t __93__EKStructuredLocationPrediction_userInteractionWithPredictedLocationOfInterest_interaction___block_invoke()
{
  uint64_t result;

  result = EKWeakLinkClass();
  userInteractionWithPredictedLocationOfInterest_interaction__RTRoutineManagerClass = result;
  return result;
}

+ (id)_mockLocationForEvent:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = _mockLocationForEvent__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_mockLocationForEvent__onceToken, &__block_literal_global_18_4);
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%@ CONTAINS SELF"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_mockLocationForEvent__s_mockLocations, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_mockLocationForEvent__s_mockLocations, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duplicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = EKWeakLinkClass();
  v1 = EKWeakLinkClass();
  v2 = EKWeakLinkClass();
  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_76;
  v7[3] = &unk_1E4789398;
  v9 = v0;
  v10 = v1;
  v11 = v2;
  v4 = v3;
  v8 = v4;
  objc_msgSend(&unk_1E47B5DD0, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v7);
  v5 = (void *)_mockLocationForEvent__s_mockLocations;
  _mockLocationForEvent__s_mockLocations = (uint64_t)v4;
  v6 = v4;

}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  id v16;
  id v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  __int128 v32;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Lat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Lon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 40), "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", 1, 0, v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2;
  v27[3] = &unk_1E4789370;
  v16 = v5;
  v28 = v16;
  v32 = *(_OWORD *)(a1 + 48);
  v17 = v6;
  v29 = v17;
  v30 = *(id *)(a1 + 32);
  v18 = v15;
  v31 = v18;
  objc_msgSend(v14, "submitWithHandler:networkActivity:", v27, 0);
  v19 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v18, v19))
  {
    v20 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_76_cold_1((uint64_t)v16, v20, v21, v22, v23, v24, v25, v26);
  }

}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  EKPredictedLocationOfInterest *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  EKPredictedLocationOfInterest *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "coordinate");
    v17 = v16;
    objc_msgSend(v15, "coordinate");
    v19 = v18;
    objc_msgSend(v15, "addressDictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(*(Class *)(a1 + 64));
    v47 = (void *)v20;
    v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithCoordinate:addressDictionary:", v20, v17, v19);
    v23 = (void *)objc_msgSend(v21, "initWithPlacemark:", v22);

    objc_msgSend(v15, "geoAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "structuredAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v6;
    v49 = v5;
    v46 = v26;
    if (v26)
      v27 = objc_msgSend(v26, "integerValue");
    else
      v27 = -1;
    v35 = [EKPredictedLocationOfInterest alloc];
    v36 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v23, "name");
    v37 = v23;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "countryCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "thoroughfare");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "locality");
    v45 = v25;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[EKPredictedLocationOfInterest initWithType:customLabel:mapItemName:addressCountryCode:addressThoroughFare:addressLocality:](v35, "initWithType:customLabel:mapItemName:addressCountryCode:addressThoroughFare:addressLocality:", v27, v36, v38, v39, v40, v41);

    +[EKStructuredLocation locationWithMapItem:](EKStructuredLocation, "locationWithMapItem:", v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setImprecise:", 1);
    objc_msgSend(v43, "setPredictedLOI:", v42);
    v44 = *(id *)(a1 + 48);
    objc_sync_enter(v44);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v43, *(_QWORD *)(a1 + 32));
    objc_sync_exit(v44);

    v6 = v48;
    v5 = v49;
  }
  else
  {
    v28 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_1(a1, v28, v29, v30, v31, v32, v33, v34);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __75__EKStructuredLocationPrediction_locationPredictionForEvent_error_timeout___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(a2, "code");
  objc_msgSend(a2, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Failed to get map item from GEOMapService. error code = %ld, domain = %{public}@, error = %@", (uint8_t *)&v6, 0x20u);

}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_76_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "reverse geocode timeout for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "no results from reverse geocode for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __56__EKStructuredLocationPrediction__mockLocationForEvent___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "error reverse geocoding: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
