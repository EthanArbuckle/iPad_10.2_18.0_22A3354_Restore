@implementation _GEOTransitRoutePreloaderData

- (_GEOTransitRoutePreloaderData)init
{
  _GEOTransitRoutePreloaderData *v2;
  _GEOTransitRoutePreloaderData *v3;
  uint64_t v4;
  GEOTileKeyList *v5;
  GEOTileKeyList *tilesLoadingOrLoaded;
  GEOTileKeyList *v7;
  GEOTileKeyList *tilesReceived;
  GEOTileKeyList *v9;
  GEOTileKeyList *tilesMissed;
  uint64_t v11;
  NSMutableSet *placecardsReceived;
  uint64_t v13;
  NSMutableSet *placecardsMissed;
  uint64_t v15;
  NSMutableArray *preloadBatches;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_GEOTransitRoutePreloaderData;
  v2 = -[_GEOTransitRoutePreloaderData init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = _TransitRoutePreloaderBatchGeneration++;
    v2->_currentBatchGeneration = v4;
    v5 = objc_alloc_init(GEOTileKeyList);
    tilesLoadingOrLoaded = v3->_tilesLoadingOrLoaded;
    v3->_tilesLoadingOrLoaded = v5;

    v7 = objc_alloc_init(GEOTileKeyList);
    tilesReceived = v3->_tilesReceived;
    v3->_tilesReceived = v7;

    v9 = objc_alloc_init(GEOTileKeyList);
    tilesMissed = v3->_tilesMissed;
    v3->_tilesMissed = v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    placecardsReceived = v3->_placecardsReceived;
    v3->_placecardsReceived = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    placecardsMissed = v3->_placecardsMissed;
    v3->_placecardsMissed = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    preloadBatches = v3->_preloadBatches;
    v3->_preloadBatches = (NSMutableArray *)v15;

  }
  return v3;
}

- (GEOTileKeyList)tilesLoadingOrLoaded
{
  return self->_tilesLoadingOrLoaded;
}

- (void)setTilesLoadingOrLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_tilesLoadingOrLoaded, a3);
}

- (GEOTileKeyList)tilesReceived
{
  return self->_tilesReceived;
}

- (void)setTilesReceived:(id)a3
{
  objc_storeStrong((id *)&self->_tilesReceived, a3);
}

- (GEOTileKeyList)tilesMissed
{
  return self->_tilesMissed;
}

- (void)setTilesMissed:(id)a3
{
  objc_storeStrong((id *)&self->_tilesMissed, a3);
}

- (NSMutableSet)placecardsReceived
{
  return self->_placecardsReceived;
}

- (void)setPlacecardsReceived:(id)a3
{
  objc_storeStrong((id *)&self->_placecardsReceived, a3);
}

- (NSMutableSet)placecardsMissed
{
  return self->_placecardsMissed;
}

- (void)setPlacecardsMissed:(id)a3
{
  objc_storeStrong((id *)&self->_placecardsMissed, a3);
}

- (NSMutableArray)preloadBatches
{
  return self->_preloadBatches;
}

- (void)setPreloadBatches:(id)a3
{
  objc_storeStrong((id *)&self->_preloadBatches, a3);
}

- (unint64_t)currentBatchGeneration
{
  return self->_currentBatchGeneration;
}

- (void)setCurrentBatchGeneration:(unint64_t)a3
{
  self->_currentBatchGeneration = a3;
}

- (_GEOTransitPreloadCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_preloadBatches, 0);
  objc_storeStrong((id *)&self->_placecardsMissed, 0);
  objc_storeStrong((id *)&self->_placecardsReceived, 0);
  objc_storeStrong((id *)&self->_tilesMissed, 0);
  objc_storeStrong((id *)&self->_tilesReceived, 0);
  objc_storeStrong((id *)&self->_tilesLoadingOrLoaded, 0);
}

@end
