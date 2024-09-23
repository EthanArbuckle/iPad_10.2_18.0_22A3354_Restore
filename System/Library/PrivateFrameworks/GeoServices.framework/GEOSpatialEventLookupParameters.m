@implementation GEOSpatialEventLookupParameters

- (GEOSpatialEventLookupParameters)init
{
  GEOSpatialEventLookupParameters *result;

  result = (GEOSpatialEventLookupParameters *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6
{
  return -[GEOSpatialEventLookupParameters initWithCoordinate:radius:categories:dateInterval:maxResultCount:](self, "initWithCoordinate:radius:categories:dateInterval:maxResultCount:", a5, a6, 0, a3.var0, a3.var1, a4);
}

- (GEOSpatialEventLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5 dateInterval:(id)a6 maxResultCount:(int)a7
{
  double var1;
  double var0;
  id v14;
  id v15;
  GEOSpatialEventLookupParameters *v16;
  GEOSpatialEventLookupParameters *v17;
  int UInteger;
  int v19;
  objc_super v21;

  var1 = a3.var1;
  var0 = a3.var0;
  v14 = a5;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GEOSpatialEventLookupParameters;
  v16 = -[GEOSpatialEventLookupParameters init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_coordinate.latitude = var0;
    v16->_coordinate.longitude = var1;
    v16->_radius = a4;
    objc_storeStrong((id *)&v16->_categories, a5);
    objc_storeStrong((id *)&v17->_dateInterval, a6);
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialEventLookupMaxResultCount, (uint64_t)off_1EDF4CFD8);
    if (UInteger >= a7)
      v19 = a7;
    else
      v19 = UInteger;
    v17->_maxResultCount = v19;
  }

  return v17;
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

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int)maxResultCount
{
  return self->_maxResultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
