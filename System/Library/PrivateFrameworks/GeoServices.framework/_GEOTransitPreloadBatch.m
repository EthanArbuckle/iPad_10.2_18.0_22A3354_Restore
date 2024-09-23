@implementation _GEOTransitPreloadBatch

- (_GEOTransitPreloadBatch)init
{
  _GEOTransitPreloadBatch *v2;
  GEOTileKeyList *v3;
  GEOTileKeyList *tilesToLoad;
  uint64_t v5;
  NSMutableSet *placeDatasToLoad;
  uint64_t v7;
  NSMutableArray *latLngToLoad;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitPreloadBatch;
  v2 = -[_GEOTransitPreloadBatch init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEOTileKeyList);
    tilesToLoad = v2->_tilesToLoad;
    v2->_tilesToLoad = v3;

    if (GEOConfigGetBOOL(GeoServicesConfig_PreloadTransitPlacecards, (uint64_t)off_1EDF4CE28))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = objc_claimAutoreleasedReturnValue();
      placeDatasToLoad = v2->_placeDatasToLoad;
      v2->_placeDatasToLoad = (NSMutableSet *)v5;
    }
    else
    {
      placeDatasToLoad = v2->_placeDatasToLoad;
      v2->_placeDatasToLoad = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    latLngToLoad = v2->_latLngToLoad;
    v2->_latLngToLoad = (NSMutableArray *)v7;

  }
  return v2;
}

- (double)networkDataRateKB
{
  double v2;

  v2 = self->endTime - self->startTime;
  if (v2 >= 0.000001)
    return (double)self->bytesLoadedFromNetwork / 1000.0 / v2;
  else
    return 100000.0;
}

- (GEOTileKeyList)tilesToLoad
{
  return self->_tilesToLoad;
}

- (void)setTilesToLoad:(id)a3
{
  objc_storeStrong((id *)&self->_tilesToLoad, a3);
}

- (NSMutableSet)placeDatasToLoad
{
  return self->_placeDatasToLoad;
}

- (void)setPlaceDatasToLoad:(id)a3
{
  objc_storeStrong((id *)&self->_placeDatasToLoad, a3);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->placeDataRequestTicketForBatch, 0);
  objc_storeStrong((id *)&self->_latLngToLoad, 0);
  begin = self->coords.__begin_;
  if (begin)
  {
    self->coords.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_placeDatasToLoad, 0);
  objc_storeStrong((id *)&self->_tilesToLoad, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
