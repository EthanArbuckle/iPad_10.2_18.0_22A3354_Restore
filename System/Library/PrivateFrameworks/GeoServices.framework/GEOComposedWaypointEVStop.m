@implementation GEOComposedWaypointEVStop

- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3 mapItem:(id)a4
{
  id v6;
  id v7;
  GEOComposedWaypointEVStop *v8;
  GEOComposedWaypointEVStop *v9;
  void *v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  GEOTransitArtworkDataSource *artwork;
  GEOComposedRouteEVChargingStationInfo *v18;
  void *v19;
  uint64_t v20;
  GEOComposedRouteEVChargingStationInfo *chargingInfo;
  GEOLocation *v22;
  void *v23;
  GEOLocation *v24;
  void *v25;
  void *v26;
  void *v27;
  GEOComposedWaypointEVStop *v28;
  objc_super v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v31.receiver = self;
    v31.super_class = (Class)GEOComposedWaypointEVStop;
    v8 = -[GEOComposedWaypoint initWithMapItem:](&v31, sel_initWithMapItem_, v7);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)GEOComposedWaypointEVStop;
    v8 = -[GEOComposedWaypoint init](&v30, sel_init);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v11;

    v9->_muid = objc_msgSend(v6, "muid");
    objc_msgSend(v6, "position");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinate");
    v9->_coordinate.latitude = v14;
    v9->_coordinate.longitude = v15;
    v9->_coordinate.altitude = 1.79769313e308;

    objc_msgSend(v6, "artwork");
    v16 = objc_claimAutoreleasedReturnValue();
    artwork = v9->_artwork;
    v9->_artwork = (GEOTransitArtworkDataSource *)v16;

    v9->_isServerProvidedWaypoint = objc_msgSend(v6, "source") == 2;
    v18 = [GEOComposedRouteEVChargingStationInfo alloc];
    objc_msgSend(v6, "evChargingInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[GEOComposedRouteEVChargingStationInfo initWithGeoEVChargingInfo:muid:name:](v18, "initWithGeoEVChargingInfo:muid:name:", v19, v9->_muid, v9->_name);
    chargingInfo = v9->_chargingInfo;
    v9->_chargingInfo = (GEOComposedRouteEVChargingStationInfo *)v20;

    v22 = [GEOLocation alloc];
    objc_msgSend(v6, "position");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[GEOLocation initWithLocation:](v22, "initWithLocation:", v23);
    -[GEOComposedWaypoint setLocation:](v9, "setLocation:", v24);

    objc_msgSend(v6, "position");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setLatLng:](v9, "setLatLng:", v25);

    -[GEOComposedWaypoint uniqueWaypointID](v9, "uniqueWaypointID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedWaypoint setUniqueWaypointID:](v9, "setUniqueWaypointID:", v27);

    }
    v28 = v9;
  }

  return v9;
}

- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3
{
  return -[GEOComposedWaypointEVStop initWithGeoWaypointInfo:mapItem:](self, "initWithGeoWaypointInfo:mapItem:", a3, 0);
}

- (id)name
{
  return self->_name;
}

- (unint64_t)muid
{
  return self->_muid;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  altitude = self->_coordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)artwork
{
  return self->_artwork;
}

- (BOOL)isServerProvidedWaypoint
{
  return self->_isServerProvidedWaypoint;
}

- (id)chargingInfo
{
  return self->_chargingInfo;
}

- (id)geoWaypointTyped
{
  objc_super v3;

  if (self->_isServerProvidedWaypoint)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)GEOComposedWaypointEVStop;
  -[GEOComposedWaypoint geoWaypointTyped](&v3, sel_geoWaypointTyped);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWaypointEVStop)initWithCoder:(id)a3
{
  id v4;
  GEOComposedWaypointEVStop *v5;
  uint64_t v6;
  NSString *name;
  id v8;
  const void *v9;
  size_t v10;
  uint64_t v11;
  GEOTransitArtworkDataSource *artwork;
  uint64_t v13;
  GEOComposedRouteEVChargingStationInfo *chargingInfo;
  GEOComposedWaypointEVStop *v15;
  unint64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedWaypointEVStop;
  v5 = -[GEOComposedWaypointEVStop initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_muid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_muid"));
    v17 = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = (const void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("_coordinate"), &v17);
    if (v17 && v9)
    {
      if (v17 >= 0x18)
        v10 = 24;
      else
        v10 = v17;
      memcpy(&v5->_coordinate, v9, v10);
    }
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artwork"));
    v11 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (GEOTransitArtworkDataSource *)v11;

    v5->_isServerProvidedWaypoint = objc_msgSend(v8, "decodeBoolForKey:", CFSTR("_isServerProvidedWaypoint"));
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chargingInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    chargingInfo = v5->_chargingInfo;
    v5->_chargingInfo = (GEOComposedRouteEVChargingStationInfo *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWaypointEVStop;
  v4 = a3;
  -[GEOComposedWaypointEVStop encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_muid, CFSTR("_muid"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_coordinate, 24, CFSTR("_coordinate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_artwork, CFSTR("_artwork"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isServerProvidedWaypoint, CFSTR("_isServerProvidedWaypoint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chargingInfo, CFSTR("_chargingInfo"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
