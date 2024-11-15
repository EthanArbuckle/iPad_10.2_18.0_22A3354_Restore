@implementation GEOSpatialPlaceLookupResultItem

- (GEOSpatialPlaceLookupResultItem)initWithMapItems:(id)a3 boundingRegion:(id)a4
{
  id v7;
  id v8;
  GEOSpatialPlaceLookupResultItem *v9;
  GEOSpatialPlaceLookupResultItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOSpatialPlaceLookupResultItem;
  v9 = -[GEOSpatialPlaceLookupResultItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItems, a3);
    objc_storeStrong((id *)&v10->_boundingRegion, a4);
  }

  return v10;
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (GEOMapRegion)boundingRegion
{
  return self->_boundingRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingRegion, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end
