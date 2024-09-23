@implementation GEOMapItemBuilder

+ (id)buildWithSetterBlock:(id)a3
{
  void (**v3)(id, GEOMapItemBuilder *);
  GEOMapItemBuilder *v4;
  void *v5;

  v3 = (void (**)(id, GEOMapItemBuilder *))a3;
  v4 = objc_alloc_init(GEOMapItemBuilder);
  if (v3)
    v3[2](v3, v4);
  -[GEOMapItemBuilder build](v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (GEOMapItemBuilder)init
{
  GEOMapItemBuilder *v2;
  GEOMapItemBuilder *v3;
  GEOMapItemBuilder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemBuilder;
  v2 = -[GEOMapItemBuilder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_has = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
  *(_BYTE *)&self->_has |= 1u;
}

- (id)build
{
  GEOPlace *v3;
  GEOLocation *location;
  double v5;
  double v6;
  double v7;
  double v8;
  GEOMapRegion *v9;
  GEOLatLng *v10;
  GEOLatLng *latlng;
  double v12;
  double v13;
  double v14;
  double v15;
  GEOMapRegion *v16;
  GEOLatLng *v17;
  GEOAddress *address;
  void *v19;
  GEOMapRegion *mapRegion;
  void *v21;
  NSString *name;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(GEOPlace);
  location = self->_location;
  if (location)
  {
    -[GEOLocation coordinate](location, "coordinate");
    v7 = v5;
    v8 = v6;
    if (fabs(v6 + 180.0) >= 0.00000001 || fabs(v5 + 180.0) >= 0.00000001)
    {
      v9 = -[GEOMapRegion initWithLatitude:longitude:]([GEOMapRegion alloc], "initWithLatitude:longitude:", v5, v6);
      -[GEOPlace setMapRegion:](v3, "setMapRegion:", v9);
      v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v7, v8);
      -[GEOPlace setCenter:](v3, "setCenter:", v10);

    }
  }
  latlng = self->_latlng;
  if (latlng)
  {
    -[GEOLatLng coordinate](latlng, "coordinate");
    v14 = v12;
    v15 = v13;
    if (fabs(v13 + 180.0) >= 0.00000001 || fabs(v12 + 180.0) >= 0.00000001)
    {
      v16 = -[GEOMapRegion initWithLatitude:longitude:]([GEOMapRegion alloc], "initWithLatitude:longitude:", v12, v13);
      -[GEOPlace setMapRegion:](v3, "setMapRegion:", v16);
      v17 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v14, v15);
      -[GEOPlace setCenter:](v3, "setCenter:", v17);

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    -[GEOPlace setReferenceFrame:](v3, "setReferenceFrame:", self->_referenceFrame);
  address = self->_address;
  if (address)
  {
    v19 = (void *)-[GEOAddress copy](address, "copy");
    -[GEOPlace setAddress:](v3, "setAddress:", v19);

  }
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    v21 = (void *)-[GEOMapRegion copy](mapRegion, "copy");
    -[GEOPlace setMapRegion:](v3, "setMapRegion:", v21);

  }
  name = self->_name;
  if (name)
  {
    v23 = (void *)-[NSString copy](name, "copy");
    -[GEOPlace setName:](v3, "setName:", v23);

  }
  +[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (GEOAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (GEOLatLng)latlng
{
  return self->_latlng;
}

- (void)setLatlng:(id)a3
{
  objc_storeStrong((id *)&self->_latlng, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_latlng, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
