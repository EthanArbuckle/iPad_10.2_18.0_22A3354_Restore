@implementation GEOMapBuildingFinder

- (GEOMapBuildingFinder)initWithMap:(id)a3 centerCoordinate:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapBuildingFinder *v10;
  uint64_t v11;
  GEOMapTileFinder *tileFinder;
  GEOMapBuildingFinder *v13;
  objc_super v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapBuildingFinder;
  v10 = -[GEOMapRequest initWithManager:](&v15, sel_initWithManager_, v9);
  if (v10)
  {
    +[GEOMapTileFinder buildingsTileFinderForMap:center:radius:](GEOMapTileFinder, "buildingsTileFinderForMap:center:radius:", v9, var0, var1, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v11;

    v10->_centerCoordinate.latitude = var0;
    v10->_centerCoordinate.longitude = var1;
    v10->_radius = a5;
    v13 = v10;
  }

  return v10;
}

- (void)cancel
{
  GEOMapTileFinder *tileFinder;
  objc_super v4;

  tileFinder = self->_tileFinder;
  if (tileFinder && !-[GEOMapRequest isFinished](tileFinder, "isFinished"))
    -[GEOMapTileFinder cancel](self->_tileFinder, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)GEOMapBuildingFinder;
  -[GEOMapRequest cancel](&v4, sel_cancel);
}

- (void)findBuildingsWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  GEOMapTileFinder *tileFinder;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke;
  v10[3] = &unk_1E1C079C0;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  -[GEOMapRequest setCompletionHandler:](self->_tileFinder, "setCompletionHandler:", v10);
  tileFinder = self->_tileFinder;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke_2;
  v8[3] = &unk_1E1C079E8;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[GEOMapTileFinder findTiles:](tileFinder, "findTiles:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "complete");

}

void __49__GEOMapBuildingFinder_findBuildingsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  GEOMapAccessBuilding *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "totalBuildingFootprintsCount"))
  {
    v4 = 0;
    v19 = v3;
    do
    {
      GEOBuildingFootprintFeatureAtIndex(v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOMapAccessBuilding initWithBuildingFeature:]([GEOMapAccessBuilding alloc], "initWithBuildingFeature:", v5);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[GEOMapAccessBuilding sections](v6, "sections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = v8;
        v20 = v5;
        v10 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v13 = (double *)(*(_QWORD *)(a1 + 32) + 48);
            objc_msgSend(v12, "centerCoordinate", v19);
            v16 = GEOCalculateDistanceRadius(*v13, v13[1], v14, v15, 6367000.0);
            v17 = *(double *)(*(_QWORD *)(a1 + 32) + 64);
            objc_msgSend(v12, "radius");
            if (v16 < v17 + v18)
            {

              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              goto LABEL_13;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v9)
            continue;
          break;
        }

LABEL_13:
        v3 = v19;
        v5 = v20;
      }
      else
      {

      }
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "totalBuildingFootprintsCount"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end
