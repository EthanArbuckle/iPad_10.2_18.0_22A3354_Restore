@implementation GEOSpatialPlaceLookupParameters

- (GEOSpatialPlaceLookupParameters)init
{
  GEOSpatialPlaceLookupParameters *result;

  result = (GEOSpatialPlaceLookupParameters *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:categories:maxResultCount:](self, "initWithCoordinate:radius:categories:maxResultCount:", a5, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 maxResultCount:(int)a6
{
  double var1;
  double var0;
  id v12;
  GEOSpatialPlaceLookupParameters *v13;
  GEOSpatialPlaceLookupParameters *v14;
  int UInteger;
  int v16;
  objc_super v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v13 = -[GEOSpatialPlaceLookupParameters init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_coordinate.latitude = var0;
    v13->_coordinate.longitude = var1;
    v13->_radius = a4;
    objc_storeStrong((id *)&v13->_categories, a5);
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount, (uint64_t)off_1EDF4CFC8);
    if (UInteger >= a6)
      v16 = a6;
    else
      v16 = UInteger;
    v14->_maxResultCount = v16;
  }

  return v14;
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5
{
  return -[GEOSpatialPlaceLookupParameters initWithCoordinate:radius:poiCategoryFilter:maxResultCount:](self, "initWithCoordinate:radius:poiCategoryFilter:maxResultCount:", a5, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialPlaceLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 poiCategoryFilter:(id)a5 maxResultCount:(int)a6
{
  double var1;
  double var0;
  id v12;
  GEOSpatialPlaceLookupParameters *v13;
  GEOSpatialPlaceLookupParameters *v14;
  int UInteger;
  int v16;
  objc_super v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v13 = -[GEOSpatialPlaceLookupParameters init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_coordinate.latitude = var0;
    v13->_coordinate.longitude = var1;
    v13->_radius = a4;
    objc_storeStrong((id *)&v13->_poiCategoryFilter, a5);
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount, (uint64_t)off_1EDF4CFC8);
    if (UInteger >= a6)
      v16 = a6;
    else
      v16 = UInteger;
    v14->_maxResultCount = v16;
  }

  return v14;
}

- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4
{
  return -[GEOSpatialPlaceLookupParameters initWithMapRegion:poiCategoryFilter:maxResultCount:](self, "initWithMapRegion:poiCategoryFilter:maxResultCount:", a3, a4, 0);
}

- (GEOSpatialPlaceLookupParameters)initWithMapRegion:(id)a3 poiCategoryFilter:(id)a4 maxResultCount:(int)a5
{
  id v9;
  id v10;
  GEOSpatialPlaceLookupParameters *v11;
  GEOSpatialPlaceLookupParameters *v12;
  int UInteger;
  int v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOSpatialPlaceLookupParameters;
  v11 = -[GEOSpatialPlaceLookupParameters init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapRegion, a3);
    objc_storeStrong((id *)&v12->_poiCategoryFilter, a4);
    v12->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_1;
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialPlaceLookupMaxResultCount, (uint64_t)off_1EDF4CFC8);
    if (UInteger >= a5)
      v14 = a5;
    else
      v14 = UInteger;
    v12->_maxResultCount = v14;
  }

  return v12;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (NSArray)categories
{
  return self->_categories;
}

- (int)maxResultCount
{
  return self->_maxResultCount;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (GEOPOICategoryFilter)poiCategoryFilter
{
  return self->_poiCategoryFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategoryFilter, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
