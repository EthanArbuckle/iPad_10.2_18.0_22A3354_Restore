@implementation GEOComposedWaypointToRoute

- (GEOComposedWaypointToRoute)initWithRoute:(id)a3
{
  id v5;
  GEOComposedWaypointToRoute *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOComposedWaypointToRoute *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedWaypointToRoute;
  v6 = -[GEOComposedWaypoint init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v6, "setUniqueWaypointID:", v8);

    -[GEOComposedWaypoint setType:](v6, "setType:", objc_msgSend(v7, "type"));
    objc_msgSend(v7, "mapItemStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setMapItemStorage:](v6, "setMapItemStorage:", v9);

    objc_msgSend(v7, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setLocation:](v6, "setLocation:", v10);

    objc_msgSend(v7, "latLng");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setLatLng:](v6, "setLatLng:", v11);

    objc_storeStrong((id *)&v6->_route, a3);
    v12 = v6;

  }
  return v6;
}

- (id)name
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  -[GEOComposedWaypointToRoute route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userProvidedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "userProvidedName");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v3, "name");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)GEOComposedWaypointToRoute;
      -[GEOComposedWaypoint name](&v11, sel_name);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = (void *)v6;

  return v9;
}

- (id)geoWaypointTyped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  GEOLatLng *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GEOComposedWaypointToRoute;
  -[GEOComposedWaypoint geoWaypointTyped](&v20, sel_geoWaypointTyped);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute tourIdentifier](self->_route, "tourIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "setWaypointType:", 2);
    objc_msgSend(v3, "setWaypointLocation:", 0);
    objc_msgSend(v3, "setWaypointPlace:", 0);
    v5 = (void *)objc_opt_new();
    -[GEOComposedRoute tourIdentifier](self->_route, "tourIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMuid:", objc_msgSend(v6, "muid"));

    -[GEOComposedRoute name](self->_route, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceNameHint:", v7);

    -[GEOComposedRoute origin](self->_route, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geoMapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "geoAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasStructuredAddress"))
    {
      objc_msgSend(v10, "structuredAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAddressHint:", v11);

    }
    if (objc_msgSend(v10, "formattedAddressLinesCount"))
    {
      objc_msgSend(v10, "formattedAddressLines");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFormattedAddressLineHints:", v12);

    }
    v13 = objc_msgSend(v9, "_addressGeocodeAccuracy");
    if (v13 < 6 || v13 != -1)
      objc_msgSend(v5, "setAddressGeocodeAccuracyHint:");
    v14 = objc_msgSend(v9, "_placeType");
    if (v14)
      objc_msgSend(v5, "setPlaceTypeHint:", _PDPlaceTypeForMapItemPlaceType(v14));
    objc_msgSend(v3, "setWaypointId:", v5);
    objc_msgSend(v3, "setWaypointLocationSource:", 3);

  }
  else
  {
    objc_msgSend(v3, "setWaypointLocationSource:", 4);
  }
  objc_msgSend(v3, "waypointId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && -[GEOComposedRoute pointCount](self->_route, "pointCount"))
  {
    -[GEOComposedRoute pointAt:](self->_route, "pointAt:", 0);
    v18 = -[GEOLatLng initWithLatitude:longitude:]([GEOLatLng alloc], "initWithLatitude:longitude:", v16, v17);
    objc_msgSend(v15, "setLocationHint:", v18);

  }
  return v3;
}

- (GEOComposedWaypointToRoute)initWithDictionary:(id)a3
{
  id v4;
  GEOComposedWaypointToRoute *v5;
  void *v6;
  void *v7;
  id v8;
  GEORouteBuilder_PersistentData *v9;
  uint64_t v10;
  GEOComposedRoute *route;
  GEOComposedWaypointToRoute *v12;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedWaypointToRoute;
  v5 = -[GEOComposedWaypoint initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_private_GEOComposedWaypointToRouteStorageKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v9 = -[GEORouteBuilder_PersistentData initWithPersistentData:]([GEORouteBuilder_PersistentData alloc], "initWithPersistentData:", v7);
      -[GEORouteBuilderBase buildRoute](v9, "buildRoute");
      v10 = objc_claimAutoreleasedReturnValue();
      route = v5->_route;
      v5->_route = (GEOComposedRoute *)v10;

    }
    v12 = v5;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWaypointToRoute;
  -[GEOComposedWaypoint dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[GEOComposedWaypointToRoute route](self, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("_private_GEOComposedWaypointToRouteStorageKey"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedWaypointToRoute;
  v4 = -[GEOComposedWaypoint copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 14, self->_route);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWaypointToRoute;
  v4 = a3;
  -[GEOComposedWaypointToRoute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_route, CFSTR("_route"), v5.receiver, v5.super_class);

}

- (GEOComposedWaypointToRoute)initWithCoder:(id)a3
{
  id v4;
  GEOComposedWaypointToRoute *v5;
  uint64_t v6;
  GEOComposedRoute *route;
  GEOComposedWaypointToRoute *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedWaypointToRoute;
  v5 = -[GEOComposedWaypointToRoute initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_route"));
    v6 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v6;

    v8 = v5;
  }

  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
