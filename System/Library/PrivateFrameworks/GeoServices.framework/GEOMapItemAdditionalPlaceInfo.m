@implementation GEOMapItemAdditionalPlaceInfo

- (GEOMapItemAdditionalPlaceInfo)initWithPlace:(id)a3
{
  id v5;
  GEOMapItemAdditionalPlaceInfo *v6;
  GEOMapItemAdditionalPlaceInfo *v7;
  GEOMapItemAdditionalPlaceInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemAdditionalPlaceInfo;
  v6 = -[GEOMapItemAdditionalPlaceInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_place, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapItemAdditionalPlaceInfo)initWithMapItem:(id)a3
{
  id v5;
  GEOMapItemAdditionalPlaceInfo *v6;
  GEOMapItemAdditionalPlaceInfo *v7;
  GEOMapItemAdditionalPlaceInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemAdditionalPlaceInfo;
  v6 = -[GEOMapItemAdditionalPlaceInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOMapItemAdditionalPlaceInfo)initWithName:(id)a3 placeType:(int)a4 areaInMeters:(double)a5
{
  uint64_t v6;
  id v8;
  GEOPlace *v9;
  GEOMapItemAdditionalPlaceInfo *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = -[GEOPlace initWithName:placeType:areaInMeters:]([GEOPlace alloc], "initWithName:placeType:areaInMeters:", v8, v6, a5);

  v10 = -[GEOMapItemAdditionalPlaceInfo initWithPlace:](self, "initWithPlace:", v9);
  return v10;
}

- (NSString)name
{
  void *mapItem;

  mapItem = self->_mapItem;
  if (!mapItem)
    mapItem = self->_place;
  objc_msgSend(mapItem, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)placeType
{
  GEOMapItem *mapItem;

  mapItem = self->_mapItem;
  if (mapItem)
    return -[GEOMapItem _placeType](mapItem, "_placeType");
  else
    return _MapItemPlaceTypeForPlaceType(-[GEOPlace type](self->_place, "type"));
}

- (double)areaInMeters
{
  GEOMapItem *mapItem;
  double result;

  mapItem = self->_mapItem;
  if (mapItem)
    -[GEOMapItem _areaInMeters](mapItem, "_areaInMeters");
  else
    -[GEOPlace area](self->_place, "area");
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *mapItem;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  mapItem = self->_mapItem;
  if (!mapItem)
    mapItem = self->_place;
  objc_msgSend(mapItem, "coordinate");
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (GEOMapRegion)mapRegion
{
  GEOMapItem *mapItem;

  mapItem = self->_mapItem;
  if (mapItem)
    -[GEOMapItem geoFenceMapRegion](mapItem, "geoFenceMapRegion");
  else
    -[GEOPlace mapRegion](self->_place, "mapRegion");
  return (GEOMapRegion *)(id)objc_claimAutoreleasedReturnValue();
}

- (float)photosMemoryScore
{
  GEOMapItem *mapItem;
  float result;

  mapItem = self->_mapItem;
  if (!mapItem)
    return -1.0;
  -[GEOMapItem _photosMemoryScore](mapItem, "_photosMemoryScore");
  return result;
}

- (GEOMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_place, 0);
}

@end
