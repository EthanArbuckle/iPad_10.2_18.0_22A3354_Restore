@implementation GEOMapFeatureRunningTrackFinder

- (id)_fail:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _InvalidRequest *v7;
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
    block[2] = __41__GEOMapFeatureRunningTrackFinder__fail___block_invoke;
    block[3] = &unk_1E1C05D48;
    v10 = v4;
    dispatch_async(v6, block);

  }
  v7 = objc_alloc_init(_InvalidRequest);

  return v7;
}

void __41__GEOMapFeatureRunningTrackFinder__fail___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (id)findRunningTrackFlagsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
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
  void *v18;
  _QWORD v20[4];
  id v21;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 62, 0);
  if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
  {
    -[GEOMapFeatureRunningTrackFinder _fail:](self, "_fail:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = [GEOMapFeatureTileFinder alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v14, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v13), v13, 0, 62, v15);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__GEOMapFeatureRunningTrackFinder_findRunningTrackFlagsNear_radius_handler_completionHandler___block_invoke;
    v20[3] = &unk_1E1C101D8;
    v21 = v11;
    v17 = (void *)MEMORY[0x18D765024](v20);
    -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v17, v12, var0, var1, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

void __94__GEOMapFeatureRunningTrackFinder_findRunningTrackFlagsNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  GEOMapRegion *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10[0] = objc_msgSend(v3, "geoTileKey");
  v10[1] = v4;
  v5 = GEOMapRectForGEOTileKey((uint64_t)v10);
  v9 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v5, v6, v7, v8);
  (*(void (**)(_QWORD, GEOMapRegion *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, objc_msgSend(v3, "runningTrackFlags"));

}

- (id)findRunningTracksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
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
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 62, 0);
  if (HIDWORD(*(unint64_t *)&v13) == 0xFFFFFFFF)
  {
    -[GEOMapFeatureRunningTrackFinder _fail:](self, "_fail:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = [GEOMapFeatureTileFinder alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v14, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v13), v13, 0, 62, v15);

    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke;
    v23 = &unk_1E1C10228;
    v25 = var0;
    v26 = var1;
    v27 = a4;
    v24 = v11;
    v17 = (void *)MEMORY[0x18D765024](&v20);
    -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v17, v12, var0, var1, a4, v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

void __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;
  __int128 v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke_2;
  v3[3] = &unk_1E1C10200;
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "forEachRunningTrack:", v3);

}

void __90__GEOMapFeatureRunningTrackFinder_findRunningTracksNear_radius_handler_completionHandler___block_invoke_2(uint64_t a1, double *a2)
{
  void *v4;
  GEOMapRegion *v5;
  GEOMapFeatureRunningTrack *v6;

  v4 = (void *)MEMORY[0x18D764E2C]();
  v5 = objc_alloc_init(GEOMapRegion);
  -[GEOMapRegion setNorthLat:](v5, "setNorthLat:", a2[5]);
  -[GEOMapRegion setWestLng:](v5, "setWestLng:", a2[2]);
  -[GEOMapRegion setSouthLat:](v5, "setSouthLat:", a2[3]);
  -[GEOMapRegion setEastLng:](v5, "setEastLng:", a2[4]);
  if (-[GEOMapRegion containsCoordinate:radius:](v5, "containsCoordinate:radius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56)))
  {
    v6 = -[GEOMapFeatureRunningTrack initWithVMP4Track:boundingBox:]([GEOMapFeatureRunningTrack alloc], "initWithVMP4Track:boundingBox:", a2, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  objc_autoreleasePoolPop(v4);
}

@end
