@implementation GEOMapFeatureRayTracingFinder

- (id)_fail:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _InvalidRayTracingTileRequest *v7;
  _QWORD block[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__GEOMapFeatureRayTracingFinder__fail___block_invoke;
    block[3] = &unk_1E1C05D48;
    v10 = v4;
    dispatch_async(v6, block);

  }
  v7 = objc_alloc_init(_InvalidRayTracingTileRequest);

  return v7;
}

void __39__GEOMapFeatureRayTracingFinder__fail___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (id)findRaytracingDataNear:(void *)a3 radius:(double)a4 handler:(double)a5 completionHandler:(double)a6
{
  id v11;
  id v12;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13;
  GEOMapFeatureTileFinder *v14;
  void *v15;
  GEOMapFeatureTileFinder *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v11 = a2;
  v12 = a3;
  if (a1)
  {
    v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 89, 0);
    if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
    {
      objc_msgSend(a1, "_fail:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = [GEOMapFeatureTileFinder alloc];
      objc_msgSend(a1, "requestParameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v14, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v13), v13, 0, 89, v15);

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __89__GEOMapFeatureRayTracingFinder_findRaytracingDataNear_radius_handler_completionHandler___block_invoke;
      v20[3] = &unk_1E1C0D010;
      v21 = v11;
      v17 = (void *)MEMORY[0x18D765024](v20);
      -[GEOMapFeatureTileFinder findTileDataAround:radius:handler:completionHandler:](v16, "findTileDataAround:radius:handler:completionHandler:", v17, v12, a4, a5, a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __89__GEOMapFeatureRayTracingFinder_findRaytracingDataNear_radius_handler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  GEOMapFeatureRayTracingTile *v5;
  id v6;

  v6 = a3;
  v5 = -[GEOMapFeatureRayTracingTile initWithTileKey:tileData:]([GEOMapFeatureRayTracingTile alloc], "initWithTileKey:tileData:", a2, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
