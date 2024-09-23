@implementation EKMapsUtilities

+ (id)mapsURLForLocation:(id)a3 onEvent:(id)a4 hasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v5 = a5;
  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "preferredLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v22 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        v47 = 138412290;
        v48 = v9;
        _os_log_impl(&dword_1A2318000, v22, OS_LOG_TYPE_INFO, "No structured location found.  Will not generate URL for event: [%@]", (uint8_t *)&v47, 0xCu);
      }
      v21 = 0;
      goto LABEL_30;
    }
    v11 = (void *)EKWeakLinkClass();
    objc_msgSend(v10, "mapKitHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v10, "geoLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v27 = 0;
LABEL_18:
        objc_msgSend(v10, "mapKitHandle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v10, "mapKitHandle");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_urlForMapItemHandles:options:", v38, v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
          {
            v47 = 138412546;
            v48 = v21;
            v49 = 2112;
            v50 = v10;
            _os_log_impl(&dword_1A2318000, v39, OS_LOG_TYPE_INFO, "MapKit handle found.  Generated URL [%@] for location [%@].", (uint8_t *)&v47, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v10, "geoLocation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend((id)objc_opt_class(), "_locationStringForStructuredLocation:withTitle:", v10, v7);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "geoLocation");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "address");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_urlForLocation:address:label:options:", v42, v43, v41, v27);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              v47 = 138412546;
              v48 = v21;
              v49 = 2112;
              v50 = v10;
              _os_log_impl(&dword_1A2318000, v44, OS_LOG_TYPE_INFO, "Geolocation found.  Generated URL [%@] for location [%@].", (uint8_t *)&v47, 0x16u);
            }

          }
          else
          {
            v45 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              v47 = 138412290;
              v48 = v10;
              _os_log_impl(&dword_1A2318000, v45, OS_LOG_TYPE_INFO, "No map kit handle or geolocation found.  Will not generate URL for location: [%@]", (uint8_t *)&v47, 0xCu);
            }
            v21 = 0;
          }
        }

LABEL_30:
        goto LABEL_31;
      }
    }
    EKWeakLinkStringConstant();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
    {
      v52 = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
      v27 = 0;
    }

    goto LABEL_18;
  }
  v13 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    +[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = 0;
LABEL_31:

  return v21;
}

+ (id)_locationStringForStructuredLocation:(id)a3 withTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "title");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_8;
    }
    if ((objc_msgSend(v7, "hasPrefix:", v8) & 1) != 0 || !objc_msgSend(v7, "CalContainsSubstring:", v8))
    {
      objc_msgSend(MEMORY[0x1E0D0C328], "fullDisplayStringWithTitle:address:", v8, v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_8:
    v10 = v7;
LABEL_10:
    v9 = v10;

    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (void)geocodeEventIfNeeded:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[EKFeatureSet isTravelAdvisorySupported](EKFeatureSet, "isTravelAdvisorySupported"))
  {
    objc_msgSend(v3, "locationWithoutPrediction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      objc_msgSend(v3, "structuredLocationWithoutPrediction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "geoLocation");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "mapKitHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v11 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v3;
            v12 = "Event has geoLocation but no mapKitHandle.  Will not attempt geocode for event: [%@]";
            goto LABEL_18;
          }
          goto LABEL_36;
        }
      }
      objc_msgSend(v3, "suggestionInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v3;
          v12 = "Event is a suggested event.  Will not attempt geocode for event: [%@]";
LABEL_18:
          _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      if (objc_msgSend(v3, "_hasChangesForKey:", *MEMORY[0x1E0D0B3E0]))
      {
        v11 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v3;
          v12 = "Event has unsaved location changes.  Will not attempt geocode for event: [%@]";
          goto LABEL_18;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (geocodeEventIfNeeded__onceToken != -1)
        dispatch_once(&geocodeEventIfNeeded__onceToken, &__block_literal_global_74);
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "rowID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "locationWithoutPrediction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v18);

      if (v20)
      {
        objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent, "objectForKeyedSubscript:", v17);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)objc_opt_new();
          objc_msgSend(v22, "timeIntervalSinceDate:", v21);
          v24 = v23;

          if (v24 < 86400.0)
          {
            v25 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v3;
              _os_log_impl(&dword_1A2318000, v25, OS_LOG_TYPE_INFO, "Event location hasn't changed since we geocoded 24 hours ago.  Will not attempt geocode for event: [%@]", buf, 0xCu);
            }
            goto LABEL_35;
          }
        }

      }
      v50 = v18;
      v26 = (void *)objc_opt_new();
      objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent, "setObject:forKeyedSubscript:", v26, v17);

      objc_msgSend(v3, "locationWithoutPrediction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v17;
      objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent, "setObject:forKeyedSubscript:", v27, v17);

      objc_msgSend((id)geocodeEventIfNeeded__storeForSavingProvider, "eventStore");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "eventForObjectID:occurrenceDate:checkValid:", v29, v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "locationWithoutPrediction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "clientLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "mapKitHandle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_msgSend(v31, "clientLocation");
      else
        objc_msgSend(v31, "structuredLocationWithoutPrediction");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mapKitHandle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = MEMORY[0x1E0C809B0];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_19;
      v56[3] = &unk_1E4788040;
      v38 = v31;
      v57 = v38;
      v39 = v32;
      v58 = v39;
      v40 = v36;
      v59 = v40;
      v60 = v51;
      v21 = v28;
      v61 = v21;
      v41 = (void *)MEMORY[0x1A85849D4](v56);
      if (v40)
      {
        v42 = v39;
        v43 = (void *)EKWeakLinkClass();
        v44 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v3;
          _os_log_impl(&dword_1A2318000, v44, OS_LOG_TYPE_DEFAULT, "Starting geocode of mapHandle for event: [%@]", buf, 0xCu);
        }
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_25;
        v52[3] = &unk_1E4788068;
        v53 = v41;
        objc_msgSend(v43, "_mapItemFromHandle:completionHandler:", v40, v52);

        v39 = v42;
        goto LABEL_34;
      }
      if (objc_msgSend(v38, "locationIsAConferenceRoom"))
      {
        v45 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v46 = "The event has a location that is a conference room.  Will not attempt to geocode its location string.";
LABEL_47:
          _os_log_impl(&dword_1A2318000, v45, OS_LOG_TYPE_INFO, v46, buf, 2u);
        }
      }
      else
      {
        v47 = v37;
        v48 = objc_msgSend(v38, "automaticLocationGeocodingAllowed");
        v45 = EKLogHandle;
        if ((v48 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v3;
            _os_log_impl(&dword_1A2318000, v45, OS_LOG_TYPE_DEFAULT, "Starting geocode of location string for event: [%@]", buf, 0xCu);
          }
          v49 = (void *)MEMORY[0x1E0D0C300];
          v54[0] = v47;
          v54[1] = 3221225472;
          v54[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_23;
          v54[3] = &unk_1E4788068;
          v55 = v41;
          objc_msgSend(v49, "geocodeLocationString:withCompletionBlock:", v39, v54);

          goto LABEL_34;
        }
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v46 = "Automatic location geocoding is disallowed.  Will not attempt to geocode this event's location string.";
          goto LABEL_47;
        }
      }
LABEL_34:

      v18 = v50;
      v17 = v51;
LABEL_35:

      goto LABEL_36;
    }
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v3;
      v14 = "Event has no location.  Will not attempt geocode for event: [%@]";
      goto LABEL_12;
    }
  }
  else
  {
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v3;
      v14 = "Travel advisory not supported.  Will not attempt geocode for event: [%@]";
LABEL_12:
      _os_log_impl(&dword_1A2318000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }
LABEL_37:

}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  EKEphemeralCacheEventStoreProvider *v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)geocodeEventIfNeeded__s_lastGeocodeDateForEvent;
  geocodeEventIfNeeded__s_lastGeocodeDateForEvent = v0;

  v2 = objc_opt_new();
  v3 = (void *)geocodeEventIfNeeded__s_lastGeocodedStringForEvent;
  geocodeEventIfNeeded__s_lastGeocodedStringForEvent = v2;

  v4 = -[EKEphemeralCacheEventStoreProvider initWithCreationBlock:]([EKEphemeralCacheEventStoreProvider alloc], "initWithCreationBlock:", &__block_literal_global_16_2);
  v5 = (void *)geocodeEventIfNeeded__storeForSavingProvider;
  geocodeEventIfNeeded__storeForSavingProvider = (uint64_t)v4;

}

id __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2()
{
  return (id)objc_opt_new();
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_19(id *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v7 = a2;
  v8 = a3;
  dispatch_get_global_queue(9, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20;
  v12[3] = &unk_1E4788018;
  v13 = a1[4];
  v20 = a4;
  v14 = a1[5];
  v15 = a1[6];
  v16 = v8;
  v17 = a1[7];
  v18 = v7;
  v19 = a1[8];
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint8_t buf[8];
  id v37;
  uint8_t v38[2];

  objc_msgSend(*(id *)(a1 + 32), "refreshIfRefreshableAndNotify:", 1);
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 88))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "locationWithoutPrediction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v3, "isEqualToString:", v4);

    if ((v3 & 1) != 0)
      goto LABEL_3;
LABEL_16:
    v26 = EKLogHandle;
    if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)v38 = 0;
    v27 = "Geocoding finished but the event location changed. Not saving results of geocode.";
    v28 = v38;
    goto LABEL_18;
  }
  v12 = *(void **)(a1 + 48);
  objc_msgSend(v2, "clientLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapKitHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 32);
  if (v14)
  {
    objc_msgSend(v15, "clientLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapKitHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "isEqualToData:", v17);

  }
  else
  {
    objc_msgSend(v15, "structuredLocationWithoutPrediction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapKitHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "isEqualToData:", v16);
  }

  if ((v18 & 1) == 0)
    goto LABEL_16;
LABEL_3:
  if (*(_QWORD *)(a1 + 56))
  {
    v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20_cold_2(a1 + 56, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodeDateForEvent, "removeObjectForKey:", *(_QWORD *)(a1 + 64));
    objc_msgSend((id)geocodeEventIfNeeded__s_lastGeocodedStringForEvent, "removeObjectForKey:", *(_QWORD *)(a1 + 64));
    return;
  }
  v19 = *(_QWORD *)(a1 + 72);
  if (!v19)
  {
    v26 = EKLogHandle;
    if (!os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      return;
    v35 = 0;
    v27 = "Geocoding finished but the location string was not geocodable.";
    v28 = (uint8_t *)&v35;
LABEL_18:
    _os_log_impl(&dword_1A2318000, v26, OS_LOG_TYPE_DEFAULT, v27, v28, 2u);
    return;
  }
  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 80);
  v37 = 0;
  v22 = objc_msgSend(v20, "updateWithGeocodedMapItemAndSaveWithCommit:eventStore:error:", v19, v21, &v37);
  v23 = v37;
  v24 = v23;
  v25 = EKLogHandle;
  if (!v22 || v23)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20_cold_1((uint64_t)v24, v25, v29, v30, v31, v32, v33, v34);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2318000, v25, OS_LOG_TYPE_DEFAULT, "Geocoding finished and event was updated.", buf, 2u);
  }

}

uint64_t __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)mapsURLForLocation:(uint64_t)a3 onEvent:(uint64_t)a4 hasMapItemLaunchOptionFromTimeToLeaveNotification:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "'nil' 'event' provided.  Will not generate URL for an event location.", a5, a6, a7, a8, 0);
}

+ (void)mapsURLForLocation:(uint64_t)a3 onEvent:(uint64_t)a4 hasMapItemLaunchOptionFromTimeToLeaveNotification:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Error: Could not weak link MapKit string constant symbol '_MKLaunchOptionsFromTimeToLeaveNotificationKey'. Cannot add '_MKLaunchOptionsFromTimeToLeaveNotificationKey' map item URL option as a result.", a5, a6, a7, a8, 0);
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Failed to save geocoded event: [%@]", a5, a6, a7, a8, 2u);
}

void __40__EKMapsUtilities_geocodeEventIfNeeded___block_invoke_2_20_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Geocoding finished with an error: [%@]", a5, a6, a7, a8, 2u);
}

@end
