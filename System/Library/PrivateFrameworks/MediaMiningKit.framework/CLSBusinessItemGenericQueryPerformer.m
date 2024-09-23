@implementation CLSBusinessItemGenericQueryPerformer

- (CLSBusinessItemGenericQueryPerformer)initWithBusinessCategoryCache:(id)a3 locationCache:(id)a4
{
  id v7;
  id v8;
  CLSBusinessItemGenericQueryPerformer *v9;
  CLSBusinessItemGenericQueryPerformer *v10;
  double v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLSBusinessItemGenericQueryPerformer;
  v9 = -[CLSBusinessItemGenericQueryPerformer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isCancelled = 0;
    objc_msgSend((id)objc_opt_class(), "defaultPrecision");
    v10->_precision = v11;
    *(_OWORD *)&v10->_statistics.numberOfLocations = 0u;
    *(_OWORD *)&v10->_statistics.numberOfUnneededLocations = 0u;
    v10->_statistics.batchSize = 0;
    objc_storeStrong((id *)&v10->_businessCategoryCache, a3);
    objc_storeStrong((id *)&v10->_locationCache, a4);
  }

  return v10;
}

- (CLSBusinessItemGenericQueryPerformer)initWithRegions:(id)a3 categories:(id)a4 precision:(double)a5 businessCategoryCache:(id)a6 locationCache:(id)a7
{
  id v12;
  CLSBusinessItemGenericQueryPerformer *v13;
  CLSBusinessItemGenericQueryPerformer *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  NSArray *locationGeoParameters;
  id v29;
  uint64_t v30;
  GEOMapServiceBatchSpatialLookupTicket *businessGenericTicket;
  uint64_t v32;
  NSArray *regions;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v12 = a4;
  v35 = a6;
  v36 = a7;
  v13 = -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](self, "initWithBusinessCategoryCache:locationCache:", v35);
  v14 = v13;
  if (v13)
  {
    v13->_precision = a5;
    +[CLSLocationShifter sharedLocationShifter](CLSLocationShifter, "sharedLocationShifter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = v37;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v21, "center");
          v23 = v22;
          objc_msgSend(v21, "center");
          objc_msgSend(v15, "shiftedCoordinateForOriginalCoordinate:", v23);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27568]), "initWithCoordinate:radius:categories:", v12, v24, v25, a5);
          objc_msgSend(v16, "addObject:", v26);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v27 = objc_claimAutoreleasedReturnValue();
    locationGeoParameters = v14->_locationGeoParameters;
    v14->_locationGeoParameters = (NSArray *)v27;

    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v29);
    objc_msgSend(v29, "ticketForSpatialLookupParameters:traits:", v14->_locationGeoParameters, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    businessGenericTicket = v14->_businessGenericTicket;
    v14->_businessGenericTicket = (GEOMapServiceBatchSpatialLookupTicket *)v30;

    objc_sync_exit(v29);
    v32 = objc_msgSend(v17, "copy");
    regions = v14->_regions;
    v14->_regions = (NSArray *)v32;

  }
  return v14;
}

- (void)submitWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D1796094]();
  objc_initWeak(&location, self);
  -[CLSBusinessItemGenericQueryPerformer businessGenericTicket](self, "businessGenericTicket");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CLSBusinessItemGenericQueryPerformer_submitWithHandler___block_invoke;
  v8[3] = &unk_1E84F8848;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "submitWithHandler:networkActivity:", v8, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v5);

}

- (void)cancel
{
  void *v3;

  -[CLSBusinessItemGenericQueryPerformer businessGenericTicket](self, "businessGenericTicket");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

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
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double precision;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        if (+[CLSLocationCache cachedRegion:isMatchingOtherRegion:](CLSLocationCache, "cachedRegion:isMatchingOtherRegion:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v6, (_QWORD)v23))
        {
          LOBYTE(v21) = 0;
          v12 = v7;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[CLSBusinessItemGenericQueryPerformer businessCategoryCache](self, "businessCategoryCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(v6, "center");
  v15 = v14;
  v17 = v16;
  precision = self->_precision;
  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "initWithCenter:radius:identifier:", v19, v15, v17, precision);

  v21 = objc_msgSend(v12, "hasRegion:", v20) ^ 1;
LABEL_11:

  return v21;
}

- (unint64_t)cacheItems:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  uint64_t v30;
  uint32_t numer;
  uint32_t denom;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t spid;
  uint64_t v37;
  NSObject *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  id obj;
  uint64_t v43;
  CLSBusinessItemGenericQueryPerformer *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *context;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  double v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44 = self;
  -[CLSBusinessItemGenericQueryPerformer loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v39 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAB79000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CacheItems", (const char *)&unk_1CABE99BA, buf, 2u);
  }
  spid = v6;
  v38 = v8;

  info = 0;
  mach_timebase_info(&info);
  v37 = mach_absolute_time();
  -[CLSBusinessItemGenericQueryPerformer businessCategoryCache](v44, "businessCategoryCache");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  v45 = v9;
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v43 = *(_QWORD *)v57;
    do
    {
      v40 = v11;
      v12 = 0;
      do
      {
        v51 = v10;
        if (*(_QWORD *)v57 != v43)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1D1796094](v9);
        objc_msgSend(v13, "allKeys", spid);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();

        -[CLSLocationCache placemarksForLocation:](v44->_locationCache, "placemarksForLocation:", v15);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ISOcountryCode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Not able to hit the cache, business item will have an empty isoCountryCode", buf, 2u);
          }

        }
        v49 = (void *)v15;
        objc_msgSend(v13, "allValues");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "count");
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v24 = v21;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v53 != v27)
                objc_enumerationMutation(v24);
              v29 = -[CLSBusinessItem initFromMapItem:isoCountryCode:categoryOnly:]([CLSBusinessItem alloc], "initFromMapItem:isoCountryCode:categoryOnly:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v17, 1);
              if (v29)
                objc_msgSend(v22, "addObject:", v29);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
          }
          while (v26);
        }
        v10 = v23 + v51;

        objc_msgSend(v47, "addObject:", v22);
        objc_msgSend(v46, "addObject:", v49);
        if ((unint64_t)(v23 + v51) >= 0xC8)
        {
          objc_msgSend(v41, "insertBatchesOfBusinessItems:forRegions:", v47, v46);
          objc_msgSend(v41, "invalidateMemoryCaches");
          objc_msgSend(v47, "removeAllObjects");
          objc_msgSend(v46, "removeAllObjects");
          v10 = 0;
        }

        objc_autoreleasePoolPop(context);
        ++v12;
      }
      while (v12 != v45);
      v11 = v40 + v45;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      v45 = v9;
    }
    while (v9);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v41, "insertBatchesOfBusinessItems:forRegions:", v47, v46);
  objc_msgSend(v41, "invalidateMemoryCaches");
  v30 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v33 = v38;
  v34 = v33;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAB79000, v34, OS_SIGNPOST_INTERVAL_END, spid, "CacheItems", (const char *)&unk_1CABE99BA, buf, 2u);
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "CacheItems";
    v63 = 2048;
    v64 = (float)((float)((float)((float)(v30 - v37) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAB79000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v11;
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
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D09910];
    v7[0] = CFSTR("spatialLookupCount");
    v7[1] = CFSTR("spatialLookupDelay");
    v8[0] = &unk_1E8511BC0;
    v8[1] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphGeoService"), v6);

  }
}

- (void)logGeoLookupFailureResult
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D09910];
  v4 = CFSTR("spatialLookupFailureCount");
  v5[0] = &unk_1E8511BC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphGeoService"), v3);

}

- (NSArray)locationGeoParameters
{
  return self->_locationGeoParameters;
}

- (GEOMapServiceBatchSpatialLookupTicket)businessGenericTicket
{
  return self->_businessGenericTicket;
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

  v3 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var3;
  return self;
}

- (void)setStatistics:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_statistics.batchSize = a3->var4;
  *(_OWORD *)&self->_statistics.numberOfUnneededLocations = v4;
  *(_OWORD *)&self->_statistics.numberOfLocations = v3;
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

- (CLSBusinessCategoryCache)businessCategoryCache
{
  return self->_businessCategoryCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_businessGenericTicket, 0);
  objc_storeStrong((id *)&self->_locationGeoParameters, 0);
  objc_storeStrong((id *)&self->_businessCategoryCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
}

void __58__CLSBusinessItemGenericQueryPerformer_submitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D1796094]();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v33 = a1;
      v34 = v4;
      objc_msgSend(WeakRetained, "locationGeoParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "businessGenericTicket");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "regions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v6;
      objc_msgSend(v6, "precision");
      v10 = v9;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v7;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            objc_msgSend(v36, "mapItemsForParameters:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v39;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v39 != v21)
                    objc_enumerationMutation(v18);
                  objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
              }
              while (v20);
            }

            objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_alloc(MEMORY[0x1E0C9E368]);
            objc_msgSend(v23, "center");
            v26 = v25;
            v28 = v27;
            objc_msgSend(v23, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v24, "initWithCenter:radius:identifier:", v29, v26, v28, v10);

            v46 = v30;
            v47 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v31);
            ++v13;

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v12);
      }

      v4 = v34;
      v3 = 0;
      v6 = v32;
      a1 = v33;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)queryWithTemplate:(id)a3 forRegions:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "categories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision");
  v10 = v9;
  objc_msgSend(v6, "businessCategoryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v7, "initWithRegions:categories:precision:businessCategoryCache:locationCache:", v5, v8, v11, v12, v10);
  return v13;
}

+ (unint64_t)numberOfRegionsPerBatch
{
  return 35;
}

+ (double)defaultPrecision
{
  return 0.0;
}

+ (NSArray)categories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

@end
