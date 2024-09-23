@implementation GEOSpatialLookupParameters

- (GEOSpatialLookupParameters)initWithCoordinate:(id)a3 radius:(double)a4 categories:(id)a5
{
  double var1;
  double var0;
  id v9;
  GEOSpatialLookupParameters *v10;
  GEOSpatialLookupParameters *v11;
  uint64_t v12;
  NSArray *categories;
  GEOSpatialLookupParameters *v14;
  objc_super v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOSpatialLookupParameters;
  v10 = -[GEOSpatialLookupParameters init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_coordinate.latitude = var0;
    v10->_coordinate.longitude = var1;
    v10->_radius = a4;
    v12 = objc_msgSend(v9, "copy");
    categories = v11->_categories;
    v11->_categories = (NSArray *)v12;

    v14 = v11;
  }

  return v11;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
