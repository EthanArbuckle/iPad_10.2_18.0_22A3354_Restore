@implementation CLSLocationQueryPerformer

- (CLSLocationQueryPerformer)initWithLocationCache:(id)a3
{
  id v5;
  CLSLocationQueryPerformer *v6;
  double v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSLocationQueryPerformer;
  v6 = -[CLSLocationQueryPerformer init](&v9, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultPrecision");
    v6->_precision = v7;
    *(_OWORD *)&v6->_statistics.numberOfLocations = 0u;
    *(_OWORD *)&v6->_statistics.numberOfUnneededLocations = 0u;
    v6->_statistics.batchSize = 0;
    v6->_statistics.batchSize = objc_msgSend((id)objc_opt_class(), "numberOfRegionsPerBatch");
    objc_storeStrong((id *)&v6->_locationCache, a3);
  }

  return v6;
}

- (CLSLocationQueryPerformer)initWithRegions:(id)a3 precision:(double)a4 locationCache:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *regions;
  id v23;
  uint64_t v24;
  GEOMapServiceTicket *ticket;
  id v27;
  id v28;
  CLSLocationQueryPerformer *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a5;
  v29 = -[CLSLocationQueryPerformer initWithLocationCache:](self, "initWithLocationCache:");
  if (v29)
  {
    v29->_precision = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v28;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v11 = *MEMORY[0x1E0C9E490];
    if (v10)
    {
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v14, "clsHorizontalAccuracy");
          v16 = v15;
          v17 = objc_alloc_init(MEMORY[0x1E0D27168]);
          v18 = objc_alloc_init(MEMORY[0x1E0D27140]);
          objc_msgSend(v14, "center");
          objc_msgSend(v18, "setLat:");
          objc_msgSend(v14, "center");
          objc_msgSend(v18, "setLng:", v19);
          objc_msgSend(v17, "setLatLng:", v18);
          objc_msgSend(v17, "setHorizontalAccuracy:", v16);
          objc_msgSend(v8, "addObject:", v17);

          v11 = fmax(v11, v16);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    if (objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", v11))
      v20 = 4;
    else
      v20 = 0;
    v21 = objc_msgSend(v9, "copy");
    regions = v29->_regions;
    v29->_regions = (NSArray *)v21;

    objc_storeStrong((id *)&v29->_geoLocations, v8);
    v29->_isCancelled = 0;
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v23);
    objc_msgSend(v23, "ticketForBatchReverseGeocodeLocations:locationShifter:additionalPlaceTypes:additionalPlaceTypesCount:placeTypeLimit:traits:", v29->_geoLocations, &__block_literal_global_700, &kPLAnalyzerAdditionalPlaceTypes, 9, v20, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    ticket = v29->_ticket;
    v29->_ticket = (GEOMapServiceTicket *)v24;

    objc_sync_exit(v23);
  }

  return v29;
}

- (unint64_t)cacheItems:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CLSLitePlacemark *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CLSLitePlacemark *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v32)
  {
    v4 = 0;
    v30 = 0;
    v31 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1D1796094]();
        objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithGEOMapItem:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v6, "areasOfInterest");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v7;
          v34 = v4;
          if (v9)
          {
            objc_msgSend(v6, "_additionalPlaceInfos");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            +[CLSLitePlacemark popularityScoresOrderedByAOIFromAdditionalPlaceInfos:areasOfInterest:](CLSLitePlacemark, "popularityScoresOrderedByAOIFromAdditionalPlaceInfos:areasOfInterest:", v10, v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v11 = 0;
          }
          v12 = -[CLSLitePlacemark initWithCLPlacemark:popularityScoresOrderedByAOI:]([CLSLitePlacemark alloc], "initWithCLPlacemark:popularityScoresOrderedByAOI:", v8, v11);
          v39 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v13);
          -[NSArray objectAtIndexedSubscript:](self->_geoLocations, "objectAtIndexedSubscript:", v30 + i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "latLng");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "horizontalAccuracy");
          v17 = v16;
          objc_msgSend(v15, "lat");
          v19 = v18;
          objc_msgSend(v15, "lng");
          v21 = v20;
          v22 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v23, v19, v21, 0.0, v17, 0.0);

          objc_msgSend(v27, "addObject:", v24);
          v4 = v34 + 1;

          v7 = v33;
        }

        objc_autoreleasePoolPop(v7);
      }
      v30 += i;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v32);
  }
  else
  {
    v4 = 0;
  }

  -[CLSLocationCache insertBatchesOfPlacemarks:forLocations:](self->_locationCache, "insertBatchesOfPlacemarks:forLocations:", v28, v27);
  return v4;
}

- (void)submitWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D1796094]();
  -[GEOMapServiceTicket submitWithHandler:networkActivity:](self->_ticket, "submitWithHandler:networkActivity:", v5, 0);
  objc_autoreleasePoolPop(v4);

}

- (void)cancel
{
  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
  self->_isCancelled = 1;
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (+[CLSLocationCache cachedRegion:isMatchingOtherRegion:](CLSLocationCache, "cachedRegion:isMatchingOtherRegion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, (_QWORD)v14))
        {

          LOBYTE(v12) = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = !-[CLSLocationCache hasRegion:](self->_locationCache, "hasRegion:", v6);
LABEL_11:

  return v12;
}

- (void)logGeoLookupCounterAndDurationWithLookupDuration:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D09910];
  v7[0] = CFSTR("reverseLookupCount");
  v7[1] = CFSTR("reverseLookupDelay");
  v8[0] = &unk_1E85118C0;
  v8[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphGeoService"), v6);

}

- (void)logGeoLookupFailureResult
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D09910];
  v4 = CFSTR("reverseLookupFailureCount");
  v5[0] = &unk_1E85118C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphGeoService"), v3);

}

- (NSArray)geoLocations
{
  return self->_geoLocations;
}

- (GEOMapServiceTicket)ticket
{
  return self->_ticket;
}

- (NSArray)regions
{
  return self->_regions;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- ($06626BA963112C91E7E52BBD3AECAE4D)statistics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var2;
  return self;
}

- (void)setStatistics:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_statistics.batchSize = a3->var4;
  *(_OWORD *)&self->_statistics.numberOfLocations = v3;
  *(_OWORD *)&self->_statistics.numberOfUnneededLocations = v4;
}

- (double)precision
{
  return self->_precision;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  self->_loggingConnection = (OS_os_log *)a3;
}

- (CLSLocationCache)locationCache
{
  return self->_locationCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_geoLocations, 0);
}

id __69__CLSLocationQueryPerformer_initWithRegions_precision_locationCache___block_invoke()
{
  void *v0;
  void *v1;

  +[CLSLocationShifter sharedLocationShifter](CLSLocationShifter, "sharedLocationShifter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "locationShifter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)queryWithTemplate:(id)a3 forRegions:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v6, "precision");
  v9 = v8;
  objc_msgSend(v6, "locationCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v7, "initWithRegions:precision:locationCache:", v5, v10, v9);
  return v11;
}

+ (unint64_t)numberOfRegionsPerBatch
{
  return 35;
}

+ (double)defaultPrecision
{
  return 0.0;
}

@end
