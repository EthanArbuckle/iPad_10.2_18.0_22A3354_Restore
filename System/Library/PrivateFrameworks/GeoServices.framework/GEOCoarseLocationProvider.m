@implementation GEOCoarseLocationProvider

- (void)_fetchRepresentativePointFromData:(void *)a3 tileKey:(uint64_t)a4 location:(void *)a5 addLocationNoise:(uint64_t)a6 callbackQueue:(void *)a7 callback:(void *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  GEOCoarseLocationData *v18;
  void *v19;
  GEOCoarseLocationData *v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  GEOLocationShifter *v25;
  void *v26;
  NSObject *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  char v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  char v41;
  _QWORD v42[4];
  id v43;
  void (**v44)(_QWORD, _QWORD);
  _QWORD v45[4];
  GEOCoarseLocationData *v46;
  id v47;
  _QWORD *v48;
  id v49;
  id v50;
  char v51;
  uint8_t buf[16];

  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a3;
  v18 = [GEOCoarseLocationData alloc];
  objc_msgSend(v17, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[GEOCoarseLocationData initWithFileURL:tileKey:](v18, "initWithFileURL:tileKey:", v19, a4);
  if (v20)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke;
    v45[3] = &unk_1E1C109E8;
    v46 = v20;
    v36 = a6;
    v51 = a6;
    v21 = v15;
    v47 = v21;
    v22 = v16;
    v50 = v22;
    v48 = a1;
    v23 = v14;
    v49 = v23;
    v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v45);
    if (objc_msgSend(v23, "referenceFrame") == 1
      && (objc_msgSend(v23, "coordinate"),
          +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
    {
      if (!a1[3])
      {
        v25 = objc_alloc_init(GEOLocationShifter);
        v26 = (void *)a1[3];
        a1[3] = v25;

      }
      GEOGetCoarseLocationLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Location requires shift", buf, 2u);
      }

      v35 = (void *)a1[3];
      objc_msgSend(v23, "coordinate");
      v29 = v28;
      v31 = v30;
      objc_msgSend(v23, "horizontalAccuracy");
      v33 = v32;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_12;
      v42[3] = &unk_1E1C10A10;
      v43 = v23;
      v44 = v24;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_14;
      v37[3] = &unk_1E1C10A38;
      v37[4] = a1;
      v38 = v43;
      v41 = v36;
      v39 = v21;
      v40 = v22;
      objc_msgSend(v35, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v42, 0, v37, a1[1], v29, v31, v33);

    }
    else
    {
      ((void (**)(_QWORD, id))v24)[2](v24, v23);
    }

  }
  else
  {
    GEOGetCoarseLocationLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v34, OS_LOG_TYPE_ERROR, "Failed to decode tile data. Falling back to base algorithm", buf, 2u);
    }

    objc_msgSend(a1, "_fetchBasicCoarseEquivalentForLocation:fallbackIsPermanent:addLocationNoise:callbackQueue:callback:", v14, 1, a6, v15, v16);
  }

}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "snappedLocationForLocation:addLocationNoise:", a2, *(unsigned __int8 *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_2;
    v5[3] = &unk_1E1BFF970;
    v7 = *(id *)(a1 + 64);
    v6 = v3;
    dispatch_async(v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_fetchBasicCoarseEquivalentForLocation:fallbackIsPermanent:addLocationNoise:callbackQueue:callback:", *(_QWORD *)(a1 + 56), 1, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }

}

void __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t buf[16];
  uint8_t v29[16];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13
    || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
    && (*(_WORD *)v29 = 0,
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _inFlightTileLoadsCount > 0", v29, 2u), v12 = *(_QWORD *)(a1 + 32), (v13 = *(_QWORD *)(v12 + 16)) != 0))
  {
    *(_QWORD *)(v12 + 16) = v13 - 1;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "closeForClient:", *(_QWORD *)(a1 + 40));

    }
  }
  if (v10)
  {
    GEOGetCoarseLocationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Failed to load tile data. Falling back to base algorithm", buf, 2u);
    }

    objc_msgSend(v10, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v17))
      v18 = objc_msgSend(v10, "code") == -5;
    else
      v18 = 0;

    v20 = *(void **)(a1 + 32);
    v21 = *(unsigned __int8 *)(a1 + 72);
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 64);
    v25 = v18;
LABEL_13:
    objc_msgSend(v20, "_fetchBasicCoarseEquivalentForLocation:fallbackIsPermanent:addLocationNoise:callbackQueue:callback:", v22, v25, v21, v23, v24);
    goto LABEL_14;
  }
  objc_msgSend(v9, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    GEOGetCoarseLocationLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Received tile with no corresponding file URL. Falling back to base algorithm", v27, 2u);
    }

    v20 = *(void **)(a1 + 32);
    v21 = *(unsigned __int8 *)(a1 + 72);
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 64);
    v25 = 1;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "_fetchRepresentativePointFromData:tileKey:location:addLocationNoise:callbackQueue:callback:", v9, a1 + 73, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_14:

}

void __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  char v7;
  uint64_t v8;
  const unsigned __int8 *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  __int128 v29;
  uint8_t buf[16];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_snapNonMercatorCoordinateIfNecessary:callbackQueue:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeTileGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeTileSetForTileType:scale:", 65, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "coordinate");
      v7 = objc_msgSend(v4, "maximumZoomLevelForMapPoint:", GEOTilePointForCoordinate(v5, v6, 20.0));
      objc_msgSend(*(id *)(a1 + 40), "coordinate");
      *(_QWORD *)buf = GEOGloriaQuadIDTileKeyMakeWithCoordinate(v7, v10, v11, 65, v8, v9);
      *(_QWORD *)&buf[8] = v12;
      GEOTileLoaderClientIdentifier(*(void **)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(v14 + 16);
      if (!v15)
      {
        +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "openForClient:", v13);

        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(v14 + 16);
      }
      *(_QWORD *)(v14 + 16) = v15 + 1;
      +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(v18 + 8);
      v23[2] = __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke_7;
      v23[3] = &unk_1E1C10998;
      v23[1] = 3221225472;
      v23[4] = v18;
      v24 = v13;
      v25 = v19;
      v28 = *(_BYTE *)(a1 + 64);
      v26 = *(id *)(a1 + 48);
      v27 = *(id *)(a1 + 56);
      v29 = *(_OWORD *)buf;
      v21 = v13;
      objc_msgSend(v17, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", buf, 0x3FFFFFFFLL, v21, 3, 4, v20, 0, v23);

    }
    else
    {
      GEOGetCoarseLocationLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_INFO, "No matching tileset exists. Falling back to base algorithm", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_fetchBasicCoarseEquivalentForLocation:fallbackIsPermanent:addLocationNoise:callbackQueue:callback:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }

  }
}

- (BOOL)_snapNonMercatorCoordinateIfNecessary:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  GEOLatLng *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  GEOCoarseLocationMetadata *v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];
  uint8_t buf[4];
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _QWORD *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = GEOCoordinate2DForMapPoint(0.0, 0.0);
  v12 = v11;
  v13 = GEOCoordinate2DForMapPoint(268435456.0, 268435456.0);
  v15 = v14;
  objc_msgSend(v7, "coordinate");
  if (v16 >= v10)
  {
    v18 = 90.0;
    v19 = 90.0;
    v20 = v10;
    v21 = v12;
  }
  else
  {
    if (v16 > v13)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v18 = -90.0;
    v19 = -90.0;
    v20 = v13;
    v21 = v15;
  }
  v22 = GEOCalculateDistanceRadius(v19, 0.0, v20, v21, 6367000.0);
  v23 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v23, "clearSensitiveFieldsForCoarseLocation");
  v24 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v18, 0.0);
  objc_msgSend(v23, "setLatLng:", v24);

  objc_msgSend(v23, "setHorizontalAccuracy:", v22);
  objc_msgSend(v23, "latLng");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "coordinate");
  v35[0] = v26;
  v35[1] = v27;

  GEOGetCoarseLocationLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218755;
    v37 = v13;
    v38 = 2048;
    v39 = v10;
    v40 = 1040;
    v41 = 16;
    v42 = 2097;
    v43 = v35;
    _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_INFO, "Location is outside of the Mercator projection's bounds (%.2f -> %.2f). Snapping to nearest pole (%{private,geo:coordinate}.*P)", buf, 0x26u);
  }

  v29 = objc_alloc_init(GEOCoarseLocationMetadata);
  v17 = 1;
  -[GEOCoarseLocationMetadata setType:](v29, "setType:", 1);
  objc_msgSend(v23, "setCoarseMetadata:", v29);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __90__GEOCoarseLocationProvider__snapNonMercatorCoordinateIfNecessary_callbackQueue_callback___block_invoke;
  v32[3] = &unk_1E1BFF970;
  v33 = v23;
  v34 = v9;
  v30 = v23;
  dispatch_async(v8, v32);

LABEL_9:
  return v17;
}

uint64_t __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

- (void)_fetchCoarseEquivalentForLocation:(id)a3 addLocationNoise:(BOOL)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *workQueue;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v25[2];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "coordinate");
  v25[0] = v13;
  v25[1] = v14;
  GEOGetCoarseLocationLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68157955;
    v27 = 16;
    v28 = 2097;
    v29 = v25;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Fetching coarse location for coordinate %{private,geo:coordinate}.*P", buf, 0x12u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke;
  block[3] = &unk_1E1C109C0;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a4;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(workQueue, block);

}

- (void)fetchCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  -[GEOCoarseLocationProvider _fetchCoarseEquivalentForLocation:addLocationNoise:callbackQueue:callback:](self, "_fetchCoarseEquivalentForLocation:addLocationNoise:callbackQueue:callback:", a3, 1, a4, a5);
}

- (GEOCoarseLocationProvider)init
{
  GEOCoarseLocationProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  GEOCoarseLocationProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCoarseLocationProvider;
  v2 = -[GEOCoarseLocationProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = MEMORY[0x18D764A24]("com.apple.GeoServices.CoarseLocation");
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

uint64_t __90__GEOCoarseLocationProvider__snapNonMercatorCoordinateIfNecessary_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 3);
}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_12(uint64_t a1, double a2, double a3, double a4)
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  GEOGetCoarseLocationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Successfully shifted location", v12, 2u);
  }

  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v9, "latLng");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLat:", a2);

  objc_msgSend(v9, "latLng");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLng:", a3);

  objc_msgSend(v9, "setHorizontalAccuracy:", a4);
  objc_msgSend(v9, "setReferenceFrame:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOGetCoarseLocationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Failed to shift location: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_fetchBasicCoarseEquivalentForLocation:fallbackIsPermanent:addLocationNoise:callbackQueue:callback:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchBasicCoarseEquivalentForLocation:(id)a3 fallbackIsPermanent:(BOOL)a4 addLocationNoise:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t UInteger;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  long double v51;
  GEOLatLng *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  GEOCoarseLocationMetadata *v59;
  id v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  BOOL v65;
  _QWORD v66[2];
  uint8_t buf[4];
  _DWORD v68[7];

  v9 = a5;
  *(_QWORD *)&v68[5] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = GeoServicesConfig_CoarseLocationGridZoomLevel;
  v14 = off_1EDF4DC08;
  v15 = a6;
  UInteger = GEOConfigGetUInteger(v13, (uint64_t)v14);
  GEOGetCoarseLocationLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)v68 = UInteger;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Falling back to grid-snapped location (grid at z=%{public}llu)", buf, 0xCu);
  }

  v18 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v18, "clearSensitiveFieldsForCoarseLocation");
  objc_msgSend(v11, "coordinate");
  v21 = (double)(1 << UInteger) * 0.0000000037252903;
  v22 = vcvtmd_u64_f64(v21 * GEOTilePointForCoordinate(v19, v20, 20.0));
  v24 = vcvtmd_u64_f64(v21 * v23);
  objc_msgSend(v11, "coordinate");
  v26 = v25;
  objc_msgSend(v11, "coordinate");
  if (v26 >= 0.0)
    v28 = v27;
  else
    v28 = -v27;
  v34 = v28 < GEOConfigGetDouble(GeoServicesConfig_CoarseLocationGridMergeLatitudeThreshold, (uint64_t)off_1EDF4DC48);
  v29 = 1.0;
  if (!v34)
  {
    objc_msgSend(v11, "coordinate", 1.0);
    v31 = v30;
    objc_msgSend(v11, "coordinate");
    if (v31 >= 0.0)
      v33 = v32;
    else
      v33 = -v32;
    v34 = v33 < GEOConfigGetDouble(GeoServicesConfig_CoarseLocationGridMergeLatitudeExtremeThreshold, (uint64_t)off_1EDF4DC58);
    v29 = 4.0;
    if (v34)
      v29 = 2.0;
    if (v34)
      v22 &= ~1uLL;
    else
      v22 &= 0xFFFFFFFFFFFFFFFCLL;
  }
  v35 = (double)v22 / v21;
  v36 = v29 / v21;
  v37 = 1.0 / v21;
  v38 = v29 / v21 * 0.5 + v35;
  v39 = 1.0 / v21 * 0.5;
  v40 = (double)v24 / v21;
  v41 = GEOCoordinate2DForMapPoint(v38, v39 + v40);
  v43 = v42;
  v44 = v36 + v35;
  v45 = v37 + v40;
  v46 = GEOCoordinate2DForMapPoint(v35, v40);
  v48 = v47;
  v49 = GEOCoordinate2DForMapPoint(v44, v45);
  v51 = GEOCalculateDistanceRadius(v46, v48, v49, v50, 6367000.0) * 0.5;
  v52 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v41, v43);
  objc_msgSend(v18, "setLatLng:", v52);

  objc_msgSend(v18, "setHorizontalAccuracy:", (double)v51);
  if (v9
    && GEOConfigGetBOOL(GeoServicesConfig_CoarseLocationRandomizeGridSnappedLocations, (uint64_t)off_1EDF4DC38))
  {
    v53 = GEOConfigGetUInteger(GeoServicesConfig_CoarseLocationRepresentativePointRandomizationDistance, (uint64_t)off_1EDF4DC18);
    GEOGetCoarseLocationLog();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)v68 = v53;
      _os_log_impl(&dword_1885A9000, v54, OS_LOG_TYPE_INFO, "Applying randomization <= %{public}llu meters", buf, 0xCu);
    }

    objc_msgSend(v18, "applyCoarseLocationRandomizationWithMaximumDistance:", (double)(unint64_t)v53);
  }
  objc_msgSend(v18, "latLng");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "coordinate");
  v66[0] = v56;
  v66[1] = v57;

  GEOGetCoarseLocationLog();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68157955;
    v68[0] = 16;
    LOWORD(v68[1]) = 2097;
    *(_QWORD *)((char *)&v68[1] + 2) = v66;
    _os_log_impl(&dword_1885A9000, v58, OS_LOG_TYPE_INFO, "Returning grid-snapped fallback location (%{private,geo:coordinate}.*P)", buf, 0x12u);
  }

  v59 = objc_alloc_init(GEOCoarseLocationMetadata);
  -[GEOCoarseLocationMetadata setType:](v59, "setType:", 1);
  objc_msgSend(v18, "setCoarseMetadata:", v59);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__GEOCoarseLocationProvider__fetchBasicCoarseEquivalentForLocation_fallbackIsPermanent_addLocationNoise_callbackQueue_callback___block_invoke;
  block[3] = &unk_1E1C01240;
  v63 = v18;
  v64 = v12;
  v65 = a4;
  v60 = v18;
  v61 = v12;
  dispatch_async(v15, block);

}

uint64_t __128__GEOCoarseLocationProvider__fetchBasicCoarseEquivalentForLocation_fallbackIsPermanent_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 3;
  else
    v1 = 2;
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)fetchConsistentCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  -[GEOCoarseLocationProvider _fetchCoarseEquivalentForLocation:addLocationNoise:callbackQueue:callback:](self, "_fetchCoarseEquivalentForLocation:addLocationNoise:callbackQueue:callback:", a3, 0, a4, a5);
}

@end
