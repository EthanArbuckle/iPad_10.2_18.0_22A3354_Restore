@implementation GEOMapFeatureTransitPointFinder

- (id)findTransitPointsOfType:(unint64_t)a3 near:(id)a4 radius:(double)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  long double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  GEOMapFeatureTransitPointFinder *v28;
  id v29;
  double v30;
  uint64_t v31;
  double v32;
  unint64_t v33;

  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a6;
  v14 = a7;
  v15 = GEOTilePointForCoordinate(var0, var1, 20.0);
  v17 = v16;
  v18 = GEOMapPointsPerMeterAtLatitude(var0);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __97__GEOMapFeatureTransitPointFinder_findTransitPointsOfType_near_radius_handler_completionHandler___block_invoke;
  v27 = &unk_1E1C20A68;
  v28 = self;
  v30 = v15;
  v31 = v17;
  v32 = v18 * a5;
  v33 = a3;
  v19 = v13;
  v29 = v19;
  v20 = (void *)MEMORY[0x18D765024](&v24);
  -[GEOMapFeatureTransitPointFinder _tileFinder](self, "_tileFinder", v24, v25, v26, v27, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "findTilesAround:radius:handler:completionHandler:", v20, v14, var0, var1, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __97__GEOMapFeatureTransitPointFinder_findTransitPointsOfType_near_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int8x8_t v11;
  __int128 v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  float v19;
  uint64_t i;
  uint64_t v21;
  int v22;
  void *v23;
  id v24;
  __int128 v25;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  v24 = v3;
  v8 = objc_msgSend(v3, "tileKey");
  v9 = *(unsigned __int8 *)(v8 + 10);
  v10 = *(unsigned __int16 *)(v8 + 8);
  v11 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v10 & 0xFFFFFFFFFF00FFFFLL | (v9 << 16)) >> 2), (int32x2_t)(v9 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  *(_QWORD *)((char *)&v25 + 1) = (*(_QWORD *)v8 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v8 >> 8) & 0x3F) << 40);
  LOBYTE(v25) = *(_QWORD *)v8;
  *((_QWORD *)&v12 + 1) = BYTE4(*(_QWORD *)v8) | ((((*(_QWORD *)v8 >> 40) | ((_DWORD)v10 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v11.u32[0] << 34) | ((unint64_t)v11.u32[1] << 48) | (v9 << 48) & 0xF0000000000000;
  *(_QWORD *)&v12 = *(_QWORD *)v8 << 32;
  objc_msgSend(v4, "_boundingCircleWithCenter:radius:inTile:", (_QWORD)v25, (unint64_t)(v12 >> 56), v5, v6, v7);
  if ((*(_BYTE *)(a1 + 72) & 0xE) != 0)
  {
    v16 = v13;
    v17 = v14;
    v18 = 0;
    v19 = v15 * v15;
    for (i = 272; v18 < objc_msgSend(v24, "transitNodeCount"); i += 344)
    {
      v21 = objc_msgSend(v24, "transitNodes");
      if (v21)
      {
        v22 = *(unsigned __int8 *)(v21 + i);
        if (v22 == 3)
        {
          if ((*(_BYTE *)(a1 + 72) & 4) == 0)
            goto LABEL_15;
          goto LABEL_13;
        }
        if (v22 == 1)
        {
          if ((*(_BYTE *)(a1 + 72) & 8) == 0)
            goto LABEL_15;
LABEL_13:
          if ((float)((float)((float)((float)(v16 - *(float *)(v21 + i - 184))
                                     * (float)(v16 - *(float *)(v21 + i - 184)))
                             + 0.0)
                     + (float)((float)(v17 - *(float *)(v21 + i - 180)) * (float)(v17 - *(float *)(v21 + i - 180)))) < v19)
          {
            objc_msgSend(*(id *)(a1 + 32), "_transitPointForFeature:", v21 + i - 272);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          }
          goto LABEL_15;
        }
        if (!*(_BYTE *)(v21 + i) && (*(_BYTE *)(a1 + 72) & 2) != 0)
          goto LABEL_13;
      }
LABEL_15:
      ++v18;
    }
  }

}

- (id)findTransitPointWithID:(unint64_t)a3 near:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  GEOMapFeatureTransitPointFinder *v22;
  id v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v26[3];
  char v27;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __89__GEOMapFeatureTransitPointFinder_findTransitPointWithID_near_handler_completionHandler___block_invoke;
  v21 = &unk_1E1C20A90;
  v24 = v26;
  v25 = a3;
  v22 = self;
  v13 = v11;
  v23 = v13;
  v14 = (void *)MEMORY[0x18D765024](&v18);
  -[GEOMapFeatureTransitPointFinder _tileFinder](self, "_tileFinder", v18, v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "findTilesAround:radius:handler:completionHandler:", v14, v12, var0, var1, 500.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v26, 8);
  return v16;
}

void __89__GEOMapFeatureTransitPointFinder_findTransitPointWithID_near_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = -1;
    v4 = 40;
    while (++v3 < (unint64_t)objc_msgSend(v9, "transitNodeCount"))
    {
      v5 = objc_msgSend(v9, "transitNodes");
      v6 = v4 + 344;
      v7 = *(_QWORD *)(v5 + v4);
      v4 += 344;
      if (v7 == *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 32), "_transitPointForFeature:", v5 + v6 - 384);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

        break;
      }
    }
  }

}

- (id)findParentOfTransitPoint:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  _GEOMapFeatureAccessRequest *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  GEOMapFeatureTransitPointFinder *v27;
  void (**v28)(id, void *);
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[3];
  char v32;

  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = objc_msgSend(v8, "feature");
  v12 = *(uint64_t **)(v11 + 256);
  if (v12)
  {
    if (*(_QWORD *)(v11 + 248))
    {
      -[GEOMapFeatureTransitPointFinder _transitPointForFeature:](self, "_transitPointForFeature:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13);
      if (v10)
        v10[2](v10, 0);
      v14 = objc_alloc_init(_GEOMapFeatureAccessRequest);

    }
    else
    {
      v15 = *v12;
      objc_msgSend(v8, "coordinate");
      v17 = v16;
      v19 = v18;
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x2020000000;
      v32 = 0;
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __86__GEOMapFeatureTransitPointFinder_findParentOfTransitPoint_handler_completionHandler___block_invoke;
      v26 = &unk_1E1C20A90;
      v29 = v31;
      v30 = v15;
      v27 = self;
      v28 = v9;
      v20 = (void *)MEMORY[0x18D765024](&v23);
      -[GEOMapFeatureTransitPointFinder _tileFinder](self, "_tileFinder", v23, v24, v25, v26, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "findTilesAround:radius:handler:completionHandler:", v20, v10, v17, v19, 500.0);
      v14 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v31, 8);
    }
  }
  else
  {
    if (v10)
      v10[2](v10, 0);
    v14 = objc_alloc_init(_GEOMapFeatureAccessRequest);
  }

  return v14;
}

void __86__GEOMapFeatureTransitPointFinder_findParentOfTransitPoint_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = -1;
    v4 = 40;
    while (++v3 < (unint64_t)objc_msgSend(v9, "transitNodeCount"))
    {
      v5 = objc_msgSend(v9, "transitNodes");
      v6 = v4 + 344;
      v7 = *(_QWORD *)(v5 + v4);
      v4 += 344;
      if (v7 == *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 32), "_transitPointForFeature:", v5 + v6 - 384);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

        break;
      }
    }
  }

}

- (id)findTransitPointsWithParent:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "transitID");
  objc_msgSend(v8, "coordinate");
  v13 = v12;
  v15 = v14;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__GEOMapFeatureTransitPointFinder_findTransitPointsWithParent_handler_completionHandler___block_invoke;
  v21[3] = &unk_1E1C20AB8;
  v23 = v11;
  v21[4] = self;
  v16 = v9;
  v22 = v16;
  v17 = (void *)MEMORY[0x18D765024](v21);
  -[GEOMapFeatureTransitPointFinder _tileFinder](self, "_tileFinder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "findTilesAround:radius:handler:completionHandler:", v17, v10, v13, v15, 500.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __89__GEOMapFeatureTransitPointFinder_findTransitPointsWithParent_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t i;
  _QWORD *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = 0;
  for (i = 0; i < objc_msgSend(v7, "transitNodeCount"); ++i)
  {
    v5 = *(_QWORD **)(objc_msgSend(v7, "transitNodes") + v3 + 256);
    if (v5)
    {
      if (*v5 == *(_QWORD *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "_transitPointForFeature:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }
    v3 += 344;
  }

}

- (id)findTransitAccessPointsForStation:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "transitID");
  objc_msgSend(v8, "coordinate");
  v13 = v12;
  v15 = v14;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __95__GEOMapFeatureTransitPointFinder_findTransitAccessPointsForStation_handler_completionHandler___block_invoke;
  v24 = &unk_1E1C06E50;
  v26 = v11;
  v16 = v9;
  v25 = v16;
  v17 = (void *)MEMORY[0x18D765024](&v21);
  -[GEOMapFeatureTransitPointFinder _tileFinder](self, "_tileFinder", v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "findTilesAround:radius:handler:completionHandler:", v17, v10, v13, v15, 500.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __95__GEOMapFeatureTransitPointFinder_findTransitAccessPointsForStation_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t i;
  uint64_t v5;
  GEOMapFeatureTransitAccessPoint *v6;
  id v7;

  v7 = a2;
  v3 = 0;
  for (i = 0; i < objc_msgSend(v7, "transitAccessPointCount"); ++i)
  {
    v5 = objc_msgSend(v7, "transitAccessPoints") + v3;
    if (*(_QWORD *)(v5 + 224) == *(_QWORD *)(a1 + 40))
    {
      v6 = -[GEOMapFeatureTransitAccessPoint initWithFeature:]([GEOMapFeatureTransitAccessPoint alloc], "initWithFeature:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    v3 += 248;
  }

}

- (id)findGeometryForTransitPoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "transitID");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__GEOMapFeatureTransitPointFinder_findGeometryForTransitPoint_completionHandler___block_invoke;
  v17 = &unk_1E1C20AE0;
  v19 = v8;
  v9 = v6;
  v18 = v9;
  v10 = (void *)MEMORY[0x18D765024](&v14);
  -[GEOMapFeatureTransitPointFinder _geometryTileFinder](self, "_geometryTileFinder", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v11, "findTilesAround:radius:handler:completionHandler:", v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __81__GEOMapFeatureTransitPointFinder_findGeometryForTransitPoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t i;
  id v5;

  v5 = a2;
  v3 = 0;
  for (i = 0; i < objc_msgSend(v5, "polygonsCount"); ++i)
  {
    if (*(_QWORD *)(objc_msgSend(v5, "polygons") + v3 + 40) == *(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "updateWithGeometryFeature:");
    v3 += 128;
  }

}

- (id)_tileFinder
{
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v3;
  GEOMapFeatureTileFinder *v4;
  void *v5;
  GEOMapFeatureTileFinder *v6;

  v3 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 37, 0);
  v4 = [GEOMapFeatureTileFinder alloc];
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v4, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v3), v3, 0, 37, v5);

  return v6;
}

- (id)_geometryTileFinder
{
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v3;
  GEOMapFeatureTileFinder *v4;
  void *v5;
  GEOMapFeatureTileFinder *v6;

  v3 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 1, 0);
  v4 = [GEOMapFeatureTileFinder alloc];
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v4, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v3), v3, 0, 1, v5);

  return v6;
}

- (id)_transitPointForFeature:(void *)a3
{
  int v3;
  __objc2_class **v4;
  void *v5;

  v3 = *((char *)a3 + 272);
  if (*((_BYTE *)a3 + 272))
  {
    if (v3 == 1)
    {
      v4 = off_1E1BECDF0;
    }
    else
    {
      if (v3 != 3)
      {
        v5 = 0;
        return v5;
      }
      v4 = off_1E1BECDE0;
    }
  }
  else
  {
    v4 = off_1E1BECDF8;
  }
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithFeature:", a3);
  return v5;
}

@end
