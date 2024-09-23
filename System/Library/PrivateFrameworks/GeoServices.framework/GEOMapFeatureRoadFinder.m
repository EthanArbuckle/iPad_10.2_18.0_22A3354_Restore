@implementation GEOMapFeatureRoadFinder

- (id)findRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  _GEOMapFeatureAccessRequest *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[16];

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "joinAllRoadsByMuid");

    if ((v14 & 1) != 0)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __74__GEOMapFeatureRoadFinder_findRoadsNear_radius_handler_completionHandler___block_invoke;
      v19[3] = &unk_1E1C0FF28;
      v19[4] = self;
      v20 = v12;
      v21 = v11;
      v15 = -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:](self, "_findUnjoinedRoadsNear:radius:handler:", v19, var0, var1, a4);
      v16 = self->super._existingRequest;

    }
    else
    {
      -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:completionHandler:](self, "_findUnjoinedRoadsNear:radius:handler:completionHandler:", v11, v12, var0, var1, a4);
      v16 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "findRoadsNear requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

void __74__GEOMapFeatureRoadFinder_findRoadsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_multiSegmentRoadFinder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "findConnectedSegmentsForRoads:directionality:handler:completionHandler:", v9, 3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (id)findRoadWithID:(unint64_t)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v10;
  GEOMapFeatureTileFinder *v11;
  void *v12;
  GEOMapFeatureTileFinder *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id *p_existingRequest;
  _GEOMapFeatureAccessRequest *existingRequest;
  id v22;
  NSObject *v23;
  uint8_t v25[8];
  _QWORD v26[5];
  id v27;
  id v28;
  unint64_t v29;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 53, 0);
    v11 = [GEOMapFeatureTileFinder alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v11, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v10), v10, 0, 53, v12);

    v14 = (uint64_t)-[GEOMapFeatureTileFinder tileKeyWithX:y:](v13, "tileKeyWithX:y:", WORD2(a3), WORD1(a3));
    v16 = v15;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __68__GEOMapFeatureRoadFinder_findRoadWithID_handler_completionHandler___block_invoke;
    v26[3] = &unk_1E1C0FF50;
    v30 = v10;
    v29 = a3;
    v26[4] = self;
    v27 = v8;
    v17 = v9;
    v28 = v17;
    v18 = (void *)MEMORY[0x18D765024](v26);
    -[GEOMapFeatureTileFinder findTileWithKey:handler:completionHandler:](v13, "findTileWithKey:handler:completionHandler:", v14, v16, v18, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    existingRequest = self->super._existingRequest;
    p_existingRequest = (id *)&self->super._existingRequest;
    *p_existingRequest = (id)v19;

    v22 = *p_existingRequest;
  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "findRoadWithID requires a handler", v25, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", v25, 2u);
    }
    v22 = 0;
  }

  return v22;
}

void __68__GEOMapFeatureRoadFinder_findRoadWithID_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  GEOMapFeatureRoad *v9;
  GEOMapFeatureRoad *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _GEOMapFeatureAccessRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  void *v25;
  GEOMapFeatureRoad *v26;
  NSObject *v27;
  void *v28;
  int v29;
  _BYTE v30[10];
  _BYTE v31[6];
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(unsigned __int16 *)(a1 + 56);
  objc_msgSend(v3, "lines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= ((v4 >> 1) & 0x3FFF))
  {
    GEOGetGEOMapFeatureAccessLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = *(unsigned __int16 *)(a1 + 56);
      v23 = *(_DWORD *)(a1 + 58);
      v24 = *(_DWORD *)(a1 + 76);
      objc_msgSend(v3, "lines");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 67110144;
      *(_DWORD *)v30 = (v22 >> 1) & 0x3FFF;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = HIWORD(v23);
      *(_WORD *)v31 = 1024;
      *(_DWORD *)&v31[2] = (unsigned __int16)v23;
      v32 = 1024;
      v33 = v24;
      v34 = 1024;
      v35 = objc_msgSend(v25, "count");
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "findRoadWithID has invalid feature index (%u) for tile %u.%u.%d. Feature count: %d", (uint8_t *)&v29, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v3, "lines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", ((unint64_t)*(unsigned __int16 *)(a1 + 56) >> 1) & 0x3FFF);
    v8 = objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "_featureHasValidGeometry:", v8) & 1) != 0)
    {
      v9 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v8);
      v10 = v9;
      if ((*(_WORD *)(a1 + 56) & 1) != 0)
        -[GEOMapFeatureRoad flip](v9, "flip");
      objc_msgSend(*(id *)(a1 + 32), "requestParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "joinAllRoadsByMuid"))
      {
        v12 = -[GEOMapFeatureRoad muid](v10, "muid");

        if (v12)
        {
          v13 = *(_QWORD **)(a1 + 32);
          if (!v13[1])
          {
            v14 = [_GEOMapFeatureAccessRequest alloc];
            objc_msgSend(*(id *)(a1 + 32), "requestParameters");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "tileLoader");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v14, "initWithTileLoader:", v16);
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(void **)(v18 + 8);
            *(_QWORD *)(v18 + 8) = v17;

            v13 = *(_QWORD **)(a1 + 32);
          }
          objc_msgSend(v13, "_multiSegmentRoadFinder");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v20, "findConnectedSegmentsForRoad:directionality:handler:completionHandler:", v10, 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

          goto LABEL_17;
        }
      }
      else
      {

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

      goto LABEL_18;
    }
    v26 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v8);
    GEOGetGEOMapFeatureAccessLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[GEOMapFeatureRoad debugDescription](v26, "debugDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138478083;
      *(_QWORD *)v30 = v28;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)v31 = -[GEOMapFeatureLine coordinateCount](v26, "coordinateCount");
      _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", (uint8_t *)&v29, 0x12u);

    }
  }
LABEL_18:

}

- (id)findRoadWithMuid:(unint64_t)a3 nearCoordinate:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  _GEOMapFeatureAccessRequest *v13;
  void *v14;
  void *v15;
  _GEOMapFeatureAccessRequest *v16;
  _GEOMapFeatureAccessRequest *existingRequest;
  id v18;
  _GEOMapFeatureAccessRequest *v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  double v26;
  double v27;
  uint8_t buf[16];

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    if (!self->super._existingRequest)
    {
      v13 = [_GEOMapFeatureAccessRequest alloc];
      -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tileLoader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v13, "initWithTileLoader:", v15);
      existingRequest = self->super._existingRequest;
      self->super._existingRequest = v16;

    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__GEOMapFeatureRoadFinder_findRoadWithMuid_nearCoordinate_handler_completionHandler___block_invoke;
    v22[3] = &unk_1E1C0FF78;
    v25 = a3;
    v26 = var0;
    v27 = var1;
    v22[4] = self;
    v23 = v12;
    v24 = v11;
    v18 = -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:](self, "_findUnjoinedRoadsNear:radius:handler:", v22, var0, var1, 25.0);
    v19 = self->super._existingRequest;

  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "findRoadWithMuid requires a handler", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

void __85__GEOMapFeatureRoadFinder_findRoadWithMuid_nearCoordinate_handler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v25;
      v12 = 1.79769313e308;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "muid", (_QWORD)v24) == *(_QWORD *)(a1 + 56))
          {
            if (v10)
            {
              v15 = *(double *)(a1 + 64);
              v16 = *(double *)(a1 + 72);
              if (v12 == 1.79769313e308)
              {
                objc_msgSend(v10, "closestDistance2DFromCoordinate:", *(double *)(a1 + 64), *(double *)(a1 + 72), 1.79769313e308);
                v12 = v17;
              }
              objc_msgSend(v14, "closestDistance2DFromCoordinate:", v15, v16, 1.79769313e308);
              v19 = v18;
              if (v18 < v12)
              {
                v20 = v14;

                v10 = v20;
                v12 = v19;
              }
            }
            else
            {
              v10 = v14;
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "_multiSegmentRoadFinder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v21, "findConnectedSegmentsForRoad:directionality:handler:completionHandler:", v10, 3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        goto LABEL_23;
      }
    }
    else
    {

    }
    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
      (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, 0);
  }
LABEL_23:

}

- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13;
  GEOMapFeatureTileFinder *v14;
  void *v15;
  GEOMapFeatureTileFinder *v16;
  void *v17;
  _GEOMapFeatureAccessRequest *existingRequest;
  _GEOMapFeatureAccessRequest *v19;
  void *v20;
  _GEOMapFeatureAccessRequest *v21;
  _GEOMapFeatureAccessRequest *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  long double v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  id v32;
  double v33;
  uint64_t v34;
  double v35;
  uint8_t buf[16];

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 53, 0);
    v14 = [GEOMapFeatureTileFinder alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v14, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v13), v13, 0, 53, v15);

    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "joinAllRoadsByMuid"))
    {
      existingRequest = self->super._existingRequest;

      if (existingRequest)
      {
LABEL_6:
        -[GEOMapFeatureTileFinder setExistingRequest:](v16, "setExistingRequest:", self->super._existingRequest);
        v23 = GEOMapPointForCoordinate(var0, var1);
        v25 = v24;
        v26 = GEOMapPointsPerMeterAtLatitude(var0);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke;
        v31[3] = &unk_1E1C02290;
        v31[4] = self;
        v33 = v23;
        v34 = v25;
        v35 = v26 * a4;
        v32 = v11;
        v27 = (void *)MEMORY[0x18D765024](v31);
        -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v27, v12, var0, var1, a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      v19 = [_GEOMapFeatureAccessRequest alloc];
      -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tileLoader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v19, "initWithTileLoader:", v20);
      v22 = self->super._existingRequest;
      self->super._existingRequest = v21;

    }
    goto LABEL_6;
  }
  GEOGetGEOMapFeatureAccessLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "_findUnjoinedRoadsNear requires a handler", buf, 2u);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nullptr", buf, 2u);
  }
  v28 = 0;
LABEL_12:

  return v28;
}

void __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x8_t v9;
  unint64_t v10;
  __int128 v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  _QWORD v16[5];
  id v17;
  int v18;
  int v19;
  int v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(unsigned __int8 *)(v4 + 10);
  v6 = *(unsigned __int16 *)(v4 + 8);
  v7 = *(_QWORD *)v4;
  v8 = *(_QWORD *)v4 << 32;
  v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  v10 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | ((_DWORD)v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(_QWORD *)((char *)v21 + 1) = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v21[0]) = v7;
  *((_QWORD *)&v11 + 1) = v10;
  *(_QWORD *)&v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", v21[0], (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke_2;
  v16[3] = &unk_1E1C0FFA0;
  v12 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v18 = v13;
  v19 = v14;
  v20 = v15;
  v17 = v12;
  objc_msgSend(v3, "forEachRoad:", v16);

}

void __83__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  GEOMapFeatureRoad *v4;
  void *v5;
  int v6;
  GEOMapFeatureRoad *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  GEOMapFeatureRoad *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_featureHasValidGeometry:", v3) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_boundingCircle:intersectsFeature:", a1 + 48, v3))
    {
      v4 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v3);
      objc_msgSend(*(id *)(a1 + 32), "requestParameters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "flipNegativeTravelDirectionRoads"))
      {
        v6 = -[GEOMapFeatureRoad travelDirection](v4, "travelDirection");

        if (v6 == 2)
          -[GEOMapFeatureRoad flip](v4, "flip");
      }
      else
      {

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "requestParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "visitDoubleTravelDirectionRoadsTwice");

      if (v11)
      {
        v12 = -[GEOMapFeatureRoad travelDirection](v4, "travelDirection");
        if (!v12 || v12 == 6)
        {
          v13 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v3);
          -[GEOMapFeatureRoad flip](v13, "flip");
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        }
      }

    }
  }
  else
  {
    v7 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v3);
    GEOGetGEOMapFeatureAccessLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[GEOMapFeatureRoad debugDescription](v7, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138478083;
      v15 = v9;
      v16 = 1024;
      v17 = -[GEOMapFeatureLine coordinateCount](v7, "coordinateCount");
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", (uint8_t *)&v14, 0x12u);

    }
  }

}

- (id)_findUnjoinedRoadsNear:(id)a3 radius:(double)a4 handler:(id)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__61;
    v17[4] = __Block_byref_object_dispose__61;
    v18 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke;
    v16[3] = &unk_1E1C06D60;
    v16[4] = v17;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke_2;
    v13[3] = &unk_1E1C0FFC8;
    v14 = v9;
    v15 = v17;
    -[GEOMapFeatureRoadFinder _findUnjoinedRoadsNear:radius:handler:completionHandler:](self, "_findUnjoinedRoadsNear:radius:handler:completionHandler:", v16, v13, var0, var1, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v3 = v8;
  }
  objc_msgSend(v4, "addObject:", v3);

}

uint64_t __65__GEOMapFeatureRoadFinder__findUnjoinedRoadsNear_radius_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)_multiSegmentRoadFinder
{
  GEOMapFeatureMultiSegmentRoadFinder *multiSegmentRoadFinder;
  GEOMapFeatureMultiSegmentRoadFinder *v4;
  void *v5;
  GEOMapFeatureMultiSegmentRoadFinder *v6;
  GEOMapFeatureMultiSegmentRoadFinder *v7;

  multiSegmentRoadFinder = self->_multiSegmentRoadFinder;
  if (!multiSegmentRoadFinder)
  {
    v4 = [GEOMapFeatureMultiSegmentRoadFinder alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v4, "initWithRequestParameters:", v5);
    v7 = self->_multiSegmentRoadFinder;
    self->_multiSegmentRoadFinder = v6;

    -[GEOMapFeatureAccessFinder setExistingRequest:](self->_multiSegmentRoadFinder, "setExistingRequest:", self->super._existingRequest);
    multiSegmentRoadFinder = self->_multiSegmentRoadFinder;
  }
  return multiSegmentRoadFinder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSegmentRoadFinder, 0);
}

@end
