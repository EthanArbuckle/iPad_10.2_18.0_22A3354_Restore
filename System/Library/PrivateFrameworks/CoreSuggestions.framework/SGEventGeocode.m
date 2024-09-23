@implementation SGEventGeocode

+ (id)_serialQueue
{
  if (_serialQueue_onceToken != -1)
    dispatch_once(&_serialQueue_onceToken, &__block_literal_global_1315);
  return (id)_serialQueue_queue;
}

+ (BOOL)locationIsAirport:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "geocodeAirportCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(a1, "locationIsGeocoded:", v4);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)locationIsGeocoded:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "geocodeLatitude");
  objc_msgSend(v3, "geocodeLongitude");

  return 1;
}

+ (BOOL)isGeocodeCandidateLocation:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  char v16;
  BOOL v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "locationIsGeocoded:", v6);
  if (!v8
    || (objc_msgSend(v6, "geocodeAirportCode"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    objc_msgSend(v6, "geocodeAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      sgEventsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_14:

        v17 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v7, "loggingIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      v15 = "SGEventGeocode isGeocodeCandidateLocation: Returning NO, event has no address. [SGEvent (%{public}@)]";
LABEL_17:
      _os_log_debug_impl(&dword_1A2267000, v13, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v19, 0xCu);

      goto LABEL_14;
    }
    if (v8)
    {
      objc_msgSend(v7, "geocodeStartTimeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 || (objc_msgSend(v6, "geocodeIsStart") & 1) == 0)
      {
        objc_msgSend(v7, "geocodeEndTimeZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {

LABEL_13:
          sgEventsLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            goto LABEL_14;
          objc_msgSend(v7, "loggingIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543362;
          v20 = v14;
          v15 = "SGEventGeocode isGeocodeCandidateLocation: Returning NO, nothing to work with. [SGEvent (%{public}@)]";
          goto LABEL_17;
        }
        v16 = objc_msgSend(v6, "geocodeIsEnd");

        if ((v16 & 1) == 0)
          goto LABEL_13;
      }
    }
  }
  v17 = 1;
LABEL_15:

  return v17;
}

+ (BOOL)isGeocodeCandidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "geocodeLocations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(a1, "isGeocodeCandidateLocation:forEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v4) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (void)geocodeAddress:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A8583A40]();
  v9 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForSearchQuery:completionItem:maxResults:traits:", v6, 0, 5, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke;
  v16[3] = &unk_1E4760288;
  v18 = a1;
  v15 = v7;
  v17 = v15;
  objc_msgSend(v14, "submitWithHandler:networkActivity:", v16, 0);

  objc_autoreleasePoolPop(v8);
}

+ (void)geocodeAddressWithCanonicalSearch:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A8583A40]();
  v9 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForCanonicalLocationSearchQueryString:traits:", v6, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke;
  v16[3] = &unk_1E4760288;
  v18 = a1;
  v15 = v7;
  v17 = v15;
  objc_msgSend(v14, "submitWithHandler:networkActivity:", v16, 0);

  objc_autoreleasePoolPop(v8);
}

+ (void)geocodePOIWithName:(id)a3 ofTypes:(id)a4 inRegion:(id)a5 withCallback:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  v14 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "defaultTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v14);
  if (v11)
    objc_msgSend(v16, "setMapRegion:", v11);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D272F8]), "initWithCategoriesToInclude:categoriesToExclude:", v10, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27440]), "initWithResultTypes:", 2);
  v19 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v24 = v10;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ticketForSearchQuery:filters:maxResults:traits:", v13, v21, 5, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v19);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke;
  v26[3] = &unk_1E4760288;
  v27 = v12;
  v28 = a1;
  v23 = v12;
  objc_msgSend(v22, "submitWithHandler:networkActivity:", v26, 0);

}

+ (void)geocodeLocation:(id)a3 usingMode:(unint64_t)a4 withGeoFilters:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  char v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  id *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  char v42;
  _QWORD v43[10];
  _QWORD v44[9];
  char v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__1278;
  v48[4] = __Block_byref_object_dispose__1279;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__1278;
  v46[4] = __Block_byref_object_dispose__1279;
  v47 = 0;
  v13 = objc_msgSend(a1, "locationIsAirport:", v10);
  v14 = v13;
  v15 = v13;
  if (a4)
    v15 = a4;
  switch(v15)
  {
    case 1uLL:
      if (v13)
      {
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "geocodeAirportCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@ airport"), v20);
      }
      else
      {
        v23 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "geocodeLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "geocodeAddress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@, %@"), v20, v24);

      }
      v25 = (void *)objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_40;
      v39[3] = &unk_1E4760328;
      v41[1] = v46;
      v41[3] = a1;
      v40 = v10;
      v41[2] = v48;
      v42 = v14;
      v41[0] = v12;
      objc_msgSend(v25, "geocodeAddress:withCallback:", v16, v39);
      v26 = &v40;
      v27 = (id *)v41;
      break;
    case 2uLL:
      if (v13)
      {
        objc_msgSend(v10, "geocodeAirportCode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "geocodeLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "geocodeAddress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@, %@"), v29, v30);

      }
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke;
      v44[3] = &unk_1E47602B0;
      v44[7] = v46;
      v45 = v14;
      v18 = v44;
      v31 = v11;
      v44[4] = v31;
      v44[8] = v48;
      v44[5] = v10;
      v44[6] = v12;
      objc_msgSend(a1, "geocodePOIWithName:ofTypes:inRegion:withCallback:", v16, v31, 0, v44);
      goto LABEL_17;
    case 3uLL:
      objc_msgSend(v10, "geocodeAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_opt_class();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_33;
      v43[3] = &unk_1E4760300;
      v43[7] = v46;
      v43[8] = v48;
      v18 = v43;
      v43[4] = v10;
      v43[5] = v11;
      v43[9] = a1;
      v43[6] = v12;
      objc_msgSend(v17, "geocodeAddress:withCallback:", v16, v43);
LABEL_17:
      v26 = (id *)(v18 + 4);
      v27 = (id *)(v18 + 5);

      break;
    default:
      if (v13)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "geocodeAirportCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@ airport"), v22);
      }
      else
      {
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "geocodeLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "geocodeAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("%@, %@"), v22, v33);

      }
      v34 = (void *)objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_41;
      v35[3] = &unk_1E4760350;
      v37[1] = v46;
      v37[2] = v48;
      v36 = v10;
      v38 = v14;
      v37[0] = v12;
      objc_msgSend(v34, "geocodeAddressWithCanonicalSearch:withCallback:", v16, v35);
      v26 = &v36;
      v27 = (id *)v37;
      break;
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

}

+ (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "components:fromDate:", 1048828, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTimeZone:", v6);
  objc_msgSend(v9, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)geocodeEvent:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SGEventGeocode_geocodeEvent___block_invoke;
  v9[3] = &unk_1E47603C8;
  v10 = v5;
  v11 = a1;
  v6 = v5;
  +[SGFuture futureForObject:withKey:onCreate:](SGFuture, "futureForObject:withKey:onCreate:", v6, a2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)geocodeEvent:(id)a3 withCallback:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(a1, "geocodeEvent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SGEventGeocode_geocodeEvent_withCallback___block_invoke;
  v9[3] = &unk_1E47603F0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "wait:", v9);

}

+ (id)poiCategoriesFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  char v16;
  char v17;
  char v18;
  char v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *context;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1A8583A40]();
  v26 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v27 = (void *)*MEMORY[0x1E0D268E0];
    v28 = (void *)*MEMORY[0x1E0D26948];
    v29 = (void *)*MEMORY[0x1E0D268A0];
    v30 = (void *)*MEMORY[0x1E0D26820];
    v10 = (void *)*MEMORY[0x1E0D26798];
    v11 = (void *)*MEMORY[0x1E0D26960];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("restaurant"));
        v15 = v11;
        if ((v14 & 1) != 0)
          goto LABEL_12;
        v16 = objc_msgSend(v13, "isEqualToString:", CFSTR("airport"));
        v15 = v10;
        if ((v16 & 1) != 0)
          goto LABEL_12;
        v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("car-rental"));
        v15 = v30;
        if ((v17 & 1) == 0)
        {
          v18 = objc_msgSend(v13, "isEqualToString:", CFSTR("hotel"));
          v15 = v29;
          if ((v18 & 1) == 0)
          {
            v19 = objc_msgSend(v13, "isEqualToString:", CFSTR("public-transport"));
            v15 = v28;
            if ((v19 & 1) == 0)
            {
              v20 = objc_msgSend(v13, "isEqualToString:", CFSTR("movie-theater"));
              v15 = v27;
              if (!v20)
                continue;
            }
          }
        }
LABEL_12:
        v21 = v15;
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v5, "addObject:", v21);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(v5, "copy");
  objc_autoreleasePoolPop(context);

  return v23;
}

uint64_t __44__SGEventGeocode_geocodeEvent_withCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__SGEventGeocode_geocodeEvent___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[3];
  char v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v3 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "geocodeLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__1278;
  v43[4] = __Block_byref_object_dispose__1279;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__1278;
  v41[4] = __Block_byref_object_dispose__1279;
  v42 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 32), "geocodingMode");
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "poiFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "poiCategoriesFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; objc_msgSend(v5, "count") > i; ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isGeocodeCandidateLocation:forEvent:", v11, *(_QWORD *)(a1 + 32)))
    {
      dispatch_group_enter(v3);
      sgEventsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "loggingIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v48 = i;
        v49 = 2114;
        v50 = v13;
        _os_log_impl(&dword_1A2267000, v12, OS_LOG_TYPE_DEFAULT, "SGEventGeocode geocodeEvent: Starting geocoding location at index %d. [SGEvent (%{public}@)]", buf, 0x12u);

      }
      v14 = (void *)objc_opt_class();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __31__SGEventGeocode_geocodeEvent___block_invoke_45;
      v31[3] = &unk_1E4760378;
      v32 = *(id *)(a1 + 32);
      v36 = v43;
      v15 = v11;
      v33 = v15;
      v37 = v41;
      v16 = *(_QWORD *)(a1 + 40);
      v38 = v45;
      v39 = v16;
      v34 = v5;
      v40 = i;
      v35 = v3;
      objc_msgSend(v14, "geocodeLocation:usingMode:withGeoFilters:withCallback:", v15, v6, v9, v31);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_serialQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SGEventGeocode_geocodeEvent___block_invoke_2;
  block[3] = &unk_1E47603A0;
  v27 = v41;
  v18 = *(id *)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v29 = v45;
  v30 = v19;
  v24 = v18;
  v25 = v5;
  v28 = v43;
  v26 = v22;
  v20 = v22;
  v21 = v5;
  dispatch_group_notify(v3, v17, block);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(v45, 8);
}

void __31__SGEventGeocode_geocodeEvent___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v5)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "geocodeStartTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_7;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = 0;
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "geocodeIsStart"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = v5;
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "geocodeEndTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_13:

    goto LABEL_14;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "geocodeIsEnd"))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = v5;
    v9 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
    goto LABEL_13;
  }
LABEL_14:
  if (v12
    && (!objc_msgSend(*(id *)(a1 + 88), "locationIsGeocoded:", *(_QWORD *)(a1 + 40))
     || objc_msgSend(*(id *)(a1 + 88), "locationIsAirport:", *(_QWORD *)(a1 + 40))))
  {
    if (objc_msgSend(*(id *)(a1 + 88), "locationIsGeocoded:", v12))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v12, *(int *)(a1 + 96));
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __31__SGEventGeocode_geocodeEvent___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  Class isa;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v2 = a1;
  v66 = *MEMORY[0x1E0C80C00];
  v59 = a1 + 56;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "geocodeEndTimeZone");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v57 = v2;
  v58 = v2 + 64;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 40);
  if (v6)
  {
    v7 = v6;
    goto LABEL_34;
  }
  objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v5;
  v7 = v10;

  if (!v7)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(*(id *)(v2 + 32), "geocodeLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (!v12)
    {
      v7 = 0;
      goto LABEL_33;
    }
    v13 = v12;
    v7 = 0;
    v14 = *(_QWORD *)v62;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v62 != v14)
          objc_enumerationMutation(v11);
        v1 = *(NSObject **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (-[NSObject geocodeIsStart](v1, "geocodeIsStart"))
        {
          -[NSObject geocodeAddress](v1, "geocodeAddress");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGTimeZone timeZoneForAddress:](SGTimeZone, "timeZoneForAddress:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v58 + 8) + 40), v17);
            if (-[NSObject geocodeIsEnd](v1, "geocodeIsEnd"))
            {
              v1 = *(NSObject **)(*(_QWORD *)v59 + 8);
              v18 = v17;
              v7 = v18;
LABEL_26:
              isa = v1[5].isa;
              v1[5].isa = (Class)v18;

              continue;
            }
            v7 = v17;
          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          if (-[NSObject geocodeIsEnd](v1, "geocodeIsEnd"))
            v19 = v5 == 0;
          else
            v19 = 0;
          if (v19)
          {
            -[NSObject geocodeAddress](v1, "geocodeAddress");
            v1 = objc_claimAutoreleasedReturnValue();
            +[SGTimeZone timeZoneForAddress:](SGTimeZone, "timeZoneForAddress:", v1);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            if (v5)
            {
              v1 = *(NSObject **)(*(_QWORD *)v59 + 8);
              v18 = v5;
              v5 = v18;
              goto LABEL_26;
            }
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (!v13)
      {
LABEL_33:

        break;
      }
    }
  }
LABEL_34:
  objc_msgSend(*(id *)(v2 + 32), "geocodeEndTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

  }
  else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v59 + 8) + 40))
  {
    objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v26 = v2 + 64;
    v25 = v59;
LABEL_41:
    v22 = (void *)v23;
    if (!v23)
    {
      v22 = v24;
      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)v26 + 8) + 40);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v25 + 8) + 40), v24);
    goto LABEL_44;
  }
  objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v58 + 8) + 40))
      goto LABEL_45;
    objc_msgSend(*(id *)(v2 + 32), "geocodeEndTimeZone");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = v2 + 64;
    v26 = v59;
    goto LABEL_41;
  }
LABEL_44:

LABEL_45:
  v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 72) + 8) + 24))
  {
    if (!v27)
      goto LABEL_57;
LABEL_49:
    objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
    if (objc_claimAutoreleasedReturnValue())
      __assert_rtn("+[SGEventGeocode geocodeEvent:]_block_invoke_2", "SGEventGeocode.m", 408, "![event geocodeStartTimeZone]");
    objc_msgSend(*(id *)(v2 + 32), "geocodeStartDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = *(void **)(v2 + 80);
      objc_msgSend(*(id *)(v2 + 32), "geocodeStartDate");
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dateForUTCDate:withTimeZone:", v30, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 40));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sgEventsLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A2267000, v30, OS_LOG_TYPE_ERROR, "SGGeocodeEvent: event geocodeStartDate is nil", buf, 2u);
      }
      v31 = 0;
    }

LABEL_58:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v59 + 8) + 40))
    {
      objc_msgSend(*(id *)(v2 + 32), "geocodeEndTimeZone");
      if (objc_claimAutoreleasedReturnValue())
        __assert_rtn("+[SGEventGeocode geocodeEvent:]_block_invoke", "SGEventGeocode.m", 422, "![event geocodeEndTimeZone]");
      objc_msgSend(*(id *)(v2 + 32), "geocodeEndDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = *(void **)(v2 + 80);
        objc_msgSend(*(id *)(v2 + 32), "geocodeEndDate");
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dateForUTCDate:withTimeZone:", v1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 40));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sgEventsLogHandle();
        v1 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A2267000, v1, OS_LOG_TYPE_ERROR, "SGGeocodeEvent: event geocodeEndDate is nil", buf, 2u);
        }
        v34 = 0;
      }

      if (v31)
      {
        if (v34)
        {
          v55 = 0;
          v35 = 0;
          v36 = *(void **)(v2 + 32);
LABEL_80:
          v53 = v31;
          v56 = v31;
LABEL_81:
          v40 = *(void **)(*(_QWORD *)(*(_QWORD *)v58 + 8) + 40);
          v41 = v40;
          if (!v40)
          {
            objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v42 = v34;
          if (v35)
          {
            objc_msgSend(*(id *)(v2 + 32), "geocodeEndDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v43 = *(void **)(*(_QWORD *)(*(_QWORD *)v59 + 8) + 40);
          v44 = v43;
          if (!v43)
          {
            objc_msgSend(*(id *)(v57 + 32), "geocodeEndTimeZone");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v36, "geocodedEventWithStartDate:startTimeZone:endDate:endTimeZone:locations:", v56, v41, v42, v44, *(_QWORD *)(v57 + 40), v53);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            if (!v35)
            {
LABEL_90:
              v2 = v57;
              if (!v40)

              if (v55)
              v31 = v54;
LABEL_101:

              goto LABEL_102;
            }
          }
          else
          {

            if (!v35)
              goto LABEL_90;
          }

          goto LABEL_90;
        }
        goto LABEL_70;
      }
    }
    else
    {
      if (v31)
      {
LABEL_70:
        v37 = 0;
        goto LABEL_71;
      }
      v34 = 0;
    }
    objc_msgSend(*(id *)(v2 + 32), "geocodeStartDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_98;
    v1 = v39;
    if (v34)
    {

      v35 = 0;
      goto LABEL_77;
    }
    v37 = 1;
LABEL_71:
    objc_msgSend(*(id *)(v2 + 32), "geocodeEndDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {

      v34 = 0;
      if (v38)
      {
        v35 = 1;
LABEL_77:
        v36 = *(void **)(v2 + 32);
        objc_msgSend(v36, "geocodeStartDate", v31);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 1;
        goto LABEL_81;
      }
    }
    else
    {
      if (v38)
      {
        v55 = 0;
        v34 = 0;
        v36 = *(void **)(v2 + 32);
        v35 = 1;
        goto LABEL_80;
      }
      v34 = 0;
    }
LABEL_98:
    sgEventsLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A2267000, v46, OS_LOG_TYPE_FAULT, "SGGeocodeEvent: Missing start or end date, going with existing event to avoid creating a new faulty event", buf, 2u);
    }

    v45 = *(id *)(v2 + 32);
    goto LABEL_101;
  }
  if (v27)
    goto LABEL_49;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v59 + 8) + 40))
  {
LABEL_57:
    v31 = 0;
    goto LABEL_58;
  }
  v45 = *(id *)(v2 + 32);
LABEL_102:
  if (v45 == *(id *)(v2 + 32))
  {
    objc_msgSend(v45, "geocodeStartDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "geocodeStartTimeZone");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "geocodeEndDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "geocodeEndTimeZone");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "geocodeLocations");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "geocodedEventWithStartDate:startTimeZone:endDate:endTimeZone:locations:", v47, v48, v49, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();

    v45 = (id)v52;
    v2 = v57;
  }
  objc_msgSend(*(id *)(v2 + 48), "succeed:", v45);

}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "timezone");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 72))
      v22 = CFSTR("Yes");
    else
      v22 = CFSTR("No");
    objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v22;
    v26 = 2112;
    v27 = v23;
    _os_log_debug_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModePOIOnly (isAirport? : %@, filters: %@)", (uint8_t *)&v24, 0x16u);

  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v3, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geoAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "formattedAddressLines");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleForMapItem:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "geocodedLocationWithLabel:address:latitude:longitude:accuracy:handle:", v13, v16, v18, v5, v7, 1.0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  int8x16_t v33;
  __int128 *p_buf;
  double v35;
  double v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timezone");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "coordinate");
    v9 = v8;
    v11 = v10;
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleForMapItem:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "geocodedLocationWithLatitude:longitude:accuracy:handle:", v14, v9, v11, 1.0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    sgEventsLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "_pas_componentsJoinedByString:", CFSTR(","));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_log_debug_impl(&dword_1A2267000, v18, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGeocodingModeAddressThenPOI. Now trying to refine and look for a relevant POI w/ filters: %@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", &stru_1E4762D08))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "geocodeAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v23 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc(MEMORY[0x1E0D27208]);
          GEOCoordinateRegionMakeWithDistance();
          v26 = (void *)objc_msgSend(v25, "initWithCoordinateRegion:");
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v38 = 0x3032000000;
          v39 = __Block_byref_object_copy__1278;
          v40 = __Block_byref_object_dispose__1279;
          v41 = 0;
          objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_opt_class();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_37;
          v30[3] = &unk_1E47602D8;
          v35 = v9;
          v36 = v11;
          v28 = *(_QWORD *)(a1 + 40);
          v32 = *(id *)(a1 + 48);
          v33 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
          p_buf = &buf;
          v31 = *(id *)(a1 + 32);
          objc_msgSend(v27, "geocodePOIWithName:ofTypes:inRegion:withCallback:", v24, v28, v26, v30);

          _Block_object_dispose(&buf, 8);
          goto LABEL_10;
        }
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_10:

}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "timezone");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v4, "coordinate");
  v9 = v8;
  v11 = v10;
  if (!objc_msgSend(*(id *)(a1 + 64), "locationIsGeocoded:", *(_QWORD *)(a1 + 32))
    || (objc_msgSend(*(id *)(a1 + 32), "geocodeAirportCode"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleForMapItem:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "geocodedLocationWithLatitude:longitude:accuracy:handle:", v26, v9, v11, 1.0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "geocodeLatitude");
  objc_msgSend(*(id *)(a1 + 32), "geocodeLongitude");
  GEOMapPointForCoordinate();
  GEOMapPointForCoordinate();
  GEOMetersBetweenMapPoints();
  v13 = *(void **)(a1 + 32);
  if (v14 <= 10000.0)
  {
    objc_msgSend(v4, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "formattedAddressLines");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_pas_componentsJoinedByString:", CFSTR(", "));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleForMapItem:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "geocodedLocationWithLabel:address:latitude:longitude:accuracy:handle:", v24, v32, v34, v9, v11, 1.0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "geocodeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "geocodeAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "geocodeLatitude");
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "geocodeLongitude");
  objc_msgSend(v13, "geocodedLocationWithLabel:address:latitude:longitude:accuracy:handle:", v15, v16, 0, v18, v19, 1.0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = 0;
LABEL_8:

  sgEventsLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 72))
      v38 = CFSTR("Yes");
    else
      v38 = CFSTR("No");
    v39 = 138412290;
    v40 = v38;
    _os_log_debug_impl(&dword_1A2267000, v30, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGecodingModeAddressOnly. (isAirport? : %@)", (uint8_t *)&v39, 0xCu);
  }

LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "timezone");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleForMapItem:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "geocodedLocationWithLatitude:longitude:accuracy:handle:", v13, v5, v7, 1.0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 64))
        v19 = CFSTR("Yes");
      else
        v19 = CFSTR("No");
      v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_1A2267000, v17, OS_LOG_TYPE_DEBUG, "SGEventGeocode geocodeLocation: Found address using mode SGGeocodingModeAddressWithCanonicalSearch. (isAirport? : %@)", (uint8_t *)&v20, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__SGEventGeocode_geocodeLocation_usingMode_withGeoFilters_withCallback___block_invoke_37(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    v7 = v6;
    v9 = v8;
    GEOMapPointForCoordinate();
    GEOMapPointForCoordinate();
    GEOMetersBetweenMapPoints();
    if (v10 <= 500.0)
    {
      objc_msgSend(v5, "timezone");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1[7] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(v5, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        v18 = (void *)a1[4];
        objc_msgSend(v5, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "geoAddress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "formattedAddressLines");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_pas_componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleForMapItem:", v5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "geocodedLocationWithLabel:address:latitude:longitude:accuracy:handle:", v19, v22, v24, v7, v9, 1.0);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1[6] + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        sgEventsLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138739971;
          v35 = v29;
          v30 = "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModeAddressThenPOI %{sensitive}@";
          v31 = v28;
          v32 = 12;
LABEL_10:
          _os_log_debug_impl(&dword_1A2267000, v31, OS_LOG_TYPE_DEBUG, v30, (uint8_t *)&v34, v32);

        }
      }
      else
      {
        sgEventsLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
          v34 = 138740227;
          v35 = v29;
          v36 = 2117;
          v37 = v33;
          v30 = "SGEventGeocode geocodeLocation: Found POI using mode SGGeocodingModeAddressThenPOI: %{sensitive}@, but d"
                "idn't match exactly the extracted label (%{sensitive}@). Falling back on address location only";
          v31 = v28;
          v32 = 22;
          goto LABEL_10;
        }
      }

    }
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v4);

}

void __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke_2;
  v6[3] = &unk_1E4760260;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __67__SGEventGeocode_geocodePOIWithName_ofTypes_inRegion_withCallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke_2;
  v6[3] = &unk_1E4760260;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __65__SGEventGeocode_geocodeAddressWithCanonicalSearch_withCallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke_2;
  v6[3] = &unk_1E4760260;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __46__SGEventGeocode_geocodeAddress_withCallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __30__SGEventGeocode__serialQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.suggestions.SGEventGeocode", attr);
  v2 = (void *)_serialQueue_queue;
  _serialQueue_queue = (uint64_t)v1;

}

@end
