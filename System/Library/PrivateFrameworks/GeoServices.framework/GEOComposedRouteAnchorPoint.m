@implementation GEOComposedRouteAnchorPoint

- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3
{
  return -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:isCurrentLocation:name:](self, "initWithLocationCoordinate:isCurrentLocation:name:", 0, 0, a3.var0, a3.var1, a3.var2);
}

- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5
{
  double var2;
  double var1;
  double var0;
  id v10;
  GEOComposedRouteAnchorPoint *v11;
  uint64_t v12;
  NSUUID *uniqueID;
  void *v14;
  uint64_t v15;
  NSString *name;
  GEOComposedRouteAnchorPoint *v17;
  objc_super v19;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedRouteAnchorPoint;
  v11 = -[GEOComposedWaypoint init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueID = v11->_uniqueID;
    v11->_uniqueID = (NSUUID *)v12;

    -[GEOComposedWaypoint setType:](v11, "setType:", 1);
    -[NSUUID _geo_data](v11->_uniqueID, "_geo_data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v11, "setUniqueWaypointID:", v14);

    v11->_locationCoordinate.latitude = var0;
    v11->_locationCoordinate.longitude = var1;
    v11->_locationCoordinate.altitude = var2;
    v11->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v15 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v15;

    v11->_mapDisplayType = 0;
    v11->_elevation = NAN;
    v11->_isCurrentLocation = a4;
    v11->_isCoordinate = 1;
    v11->_anchorPointType = 0;
    v17 = v11;
  }

  return v11;
}

- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPoint *v5;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v5 = -[GEOComposedRouteAnchorPoint initWithMapItem:coordinate:](self, "initWithMapItem:coordinate:", v4);

  return v5;
}

- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3 coordinate:(id)a4
{
  double var2;
  double var1;
  double var0;
  id v8;
  GEOComposedRouteAnchorPoint *v9;
  uint64_t v10;
  NSUUID *uniqueID;
  void *v12;
  GEOComposedRouteAnchorPoint *v13;
  objc_super v15;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteAnchorPoint;
  v9 = -[GEOComposedWaypoint init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueID = v9->_uniqueID;
    v9->_uniqueID = (NSUUID *)v10;

    -[GEOComposedWaypoint setType:](v9, "setType:", 1);
    -[NSUUID _geo_data](v9->_uniqueID, "_geo_data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v9, "setUniqueWaypointID:", v12);

    v9->_locationCoordinate.latitude = var0;
    v9->_locationCoordinate.longitude = var1;
    v9->_locationCoordinate.altitude = var2;
    v9->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v9->_anchorPointType = 0;
    -[GEOComposedRouteAnchorPoint refineWithMapItem:](v9, "refineWithMapItem:", v8);
    v13 = v9;
  }

  return v9;
}

- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPoint *v5;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v5 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:](self, "initWithMapItemIdentifier:coordinate:", v4);

  return v5;
}

- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3 coordinate:(id)a4
{
  double var2;
  double var1;
  double var0;
  id v8;
  GEOComposedRouteAnchorPoint *v9;
  GEOComposedRouteAnchorPoint *v10;
  uint64_t v11;
  GEOMapItemIdentifier *mapItemIdentifier;
  GEOComposedRouteAnchorPoint *v13;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v9 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:](self, "initWithLocationCoordinate:", var0, var1, var2);
  v10 = v9;
  if (v9)
  {
    v9->_isCoordinate = 0;
    v11 = objc_msgSend(v8, "copy");
    mapItemIdentifier = v10->_mapItemIdentifier;
    v10->_mapItemIdentifier = (GEOMapItemIdentifier *)v11;

    v13 = v10;
  }

  return v10;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3
{
  return (GEOComposedRouteAnchorPoint *)objc_msgSend(a1, "anchorPointWithCoordinate:isCurrentLocation:name:", 0, 0, a3.var0, a3.var1, a3.var2);
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5
{
  _BOOL8 v5;
  double var2;
  double var1;
  double var0;
  id v9;
  GEOComposedRouteAnchorPoint *v10;

  v5 = a4;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v10 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:isCurrentLocation:name:]([GEOComposedRouteAnchorPoint alloc], "initWithLocationCoordinate:isCurrentLocation:name:", v5, v9, var0, var1, var2);

  return v10;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItem:(id)a3 coordinate:(id)a4
{
  double var2;
  double var1;
  double var0;
  id v7;
  GEOComposedRouteAnchorPoint *v8;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = -[GEOComposedRouteAnchorPoint initWithMapItem:coordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItem:coordinate:", v7, var0, var1, var2);

  return v8;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItemIdentifier:(id)a3 coordinate:(id)a4
{
  double var2;
  double var1;
  double var0;
  id v7;
  GEOComposedRouteAnchorPoint *v8;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItemIdentifier:coordinate:", v7, var0, var1, var2);

  return v8;
}

- (void)refineWithMapItem:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *name;
  GEOFeatureStyleAttributes *v8;
  GEOFeatureStyleAttributes *styleAttributes;
  void *v10;
  GEOMapItemIdentifier *v11;
  GEOMapItemIdentifier *mapItemIdentifier;
  void *v13;
  NSString *v14;
  NSString *countryCode;
  id v16;

  if (a3)
  {
    v16 = a3;
    objc_msgSend(v16, "_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setMuid:](self, "setMuid:", objc_msgSend(v4, "muid"));

    objc_msgSend(v16, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v16, "_styleAttributes");
    v8 = (GEOFeatureStyleAttributes *)objc_claimAutoreleasedReturnValue();
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v8;

    objc_msgSend(v16, "_identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (GEOMapItemIdentifier *)objc_msgSend(v10, "copy");
    mapItemIdentifier = self->_mapItemIdentifier;
    self->_mapItemIdentifier = v11;

    self->_mapDisplayType = objc_msgSend(v16, "mapDisplayType");
    self->_isAddress = objc_msgSend(v16, "_placeDisplayType") == 3;
    objc_msgSend(v16, "_bestAvailableCountryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)objc_msgSend(v13, "copy");
    countryCode = self->_countryCode;
    self->_countryCode = v14;

    -[GEOComposedRouteAnchorPoint _setElevationIfNecessaryForMapItem:](self, "_setElevationIfNecessaryForMapItem:", v16);
  }
}

- (id)duplicate
{
  id *v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = (id *)-[GEOComposedRouteAnchorPoint copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v2[18];
  v2[18] = (id)v3;

  objc_msgSend(v2[18], "_geo_data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUniqueWaypointID:", v5);

  return v2;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  void *v2;
  GEOFeatureStyleAttributes *styleAttributes;

  if (self->_anchorPointType - 3 > 1 || !self->_isCoordinate)
  {
    styleAttributes = self->_styleAttributes;
    if (styleAttributes)
      return styleAttributes;
    if (self->_isCurrentLocation)
    {
      +[GEOFeatureStyleAttributes customRouteCreationCurrentLocationStyleAttributes](GEOFeatureStyleAttributes, "customRouteCreationCurrentLocationStyleAttributes");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return (GEOFeatureStyleAttributes *)v2;
    }
    if (self->_isCuratedRoute)
    {
      +[GEOFeatureStyleAttributes curatedRouteStyleAttributes](GEOFeatureStyleAttributes, "curatedRouteStyleAttributes");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return (GEOFeatureStyleAttributes *)v2;
    }
  }
  +[GEOFeatureStyleAttributes customRouteGenericAnchorPointStyleAttributes](GEOFeatureStyleAttributes, "customRouteGenericAnchorPointStyleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return (GEOFeatureStyleAttributes *)v2;
}

- (BOOL)elevationIsValid
{
  return 1;
}

- (void)_setElevationIfNecessaryForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_elevation = NAN;
  if (objc_msgSend(v4, "_placeCategoryType") - 3 <= 1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "_encyclopedicInfo", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "factoids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "semantic") == 5)
          {
            objc_msgSend(v11, "value");
            self->_elevation = v12;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)_defaultDisplayInfo
{
  void *v3;
  void *v4;
  void *v5;
  GEOComposedString *v6;

  v3 = (void *)objc_opt_new();
  -[GEOComposedRouteAnchorPoint name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  objc_msgSend(v3, "setPosition:", self->_locationCoordinate.latitude, self->_locationCoordinate.longitude);
  if (-[GEOComposedRouteAnchorPoint elevationIsValid](self, "elevationIsValid"))
  {
    GEOStringForDistance(97, self->_elevation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOComposedString initWithString:]([GEOComposedString alloc], "initWithString:", v5);
    objc_msgSend(v3, "setWaypointCaption:", v6);

  }
  return v3;
}

- (id)location
{
  $5B2A0FEE2A1717E36A90D599307F83D1 *p_locationCoordinate;
  GEOLocation *v3;

  p_locationCoordinate = &self->_locationCoordinate;
  v3 = -[GEOLocation initWithLatitude:longitude:]([GEOLocation alloc], "initWithLatitude:longitude:", self->_locationCoordinate.latitude, self->_locationCoordinate.longitude);
  -[GEOLocation setAltitude:](v3, "setAltitude:", (int)p_locationCoordinate->altitude);
  return v3;
}

- (NSString)name
{
  void *name;
  void *v4;
  NSString *v5;

  -[GEOComposedWaypointDisplayInfo name](self->_displayInfo, "name");
  name = (void *)objc_claimAutoreleasedReturnValue();
  v4 = name;
  if (!name)
    name = self->_name;
  v5 = name;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRouteAnchorPoint;
  v4 = -[GEOComposedWaypoint copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 18, self->_uniqueID);
  v5 = *(_OWORD *)&self->_locationCoordinate.latitude;
  *((_QWORD *)v4 + 27) = *(_QWORD *)&self->_locationCoordinate.altitude;
  *(_OWORD *)(v4 + 200) = v5;
  *((_QWORD *)v4 + 19) = self->_routeCoordinate;
  v6 = -[NSString copy](self->_name, "copy");
  v7 = (void *)*((_QWORD *)v4 + 20);
  *((_QWORD *)v4 + 20) = v6;

  objc_storeStrong((id *)v4 + 21, self->_styleAttributes);
  objc_storeStrong((id *)v4 + 22, self->_mapItemIdentifier);
  *((_DWORD *)v4 + 34) = self->_mapDisplayType;
  v8 = -[NSString copy](self->_countryCode, "copy");
  v9 = (void *)*((_QWORD *)v4 + 23);
  *((_QWORD *)v4 + 23) = v8;

  *((_QWORD *)v4 + 24) = *(_QWORD *)&self->_elevation;
  v4[112] = self->_isCurrentLocation;
  v4[113] = self->_isCoordinate;
  v4[114] = self->_isAddress;
  v4[115] = self->_isCuratedRoute;
  *((_QWORD *)v4 + 15) = self->_anchorPointType;
  objc_storeStrong((id *)v4 + 16, self->_displayInfo);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("_uniqueID"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_locationCoordinate, 24, CFSTR("_locationCoordinate"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("_styleAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItemIdentifier, CFSTR("_mapItemIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mapDisplayType, CFSTR("_mapDisplayType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("_countryCode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_elevation"), self->_elevation);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentLocation, CFSTR("_isCurrentLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCoordinate, CFSTR("_isCoordinate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAddress, CFSTR("_isAddress"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCuratedRoute, CFSTR("_isCuratedRoute"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_anchorPointType, CFSTR("_anchorPointType"));

}

- (GEOComposedRouteAnchorPoint)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPoint *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  id v8;
  const void *v9;
  size_t v10;
  id v11;
  const void *v12;
  size_t v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  GEOFeatureStyleAttributes *styleAttributes;
  uint64_t v18;
  GEOMapItemIdentifier *mapItemIdentifier;
  uint64_t v20;
  NSString *countryCode;
  double v22;
  void *v23;
  GEOComposedRouteAnchorPoint *v24;
  unint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedRouteAnchorPoint;
  v5 = -[GEOComposedWaypoint init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v26 = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = (const void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("_locationCoordinate"), &v26);
    if (v26 && v9)
    {
      if (v26 >= 0x18)
        v10 = 24;
      else
        v10 = v26;
      memcpy(&v5->_locationCoordinate, v9, v10);
    }
    v26 = 0;
    v11 = objc_retainAutorelease(v8);
    v12 = (const void *)objc_msgSend(v11, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v26);
    if (v26 && v12)
    {
      if (v26 >= 8)
        v13 = 8;
      else
        v13 = v26;
      memcpy(&v5->_routeCoordinate, v12, v13);
    }
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v14;

    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_styleAttributes"));
    v16 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v16;

    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapItemIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    mapItemIdentifier = v5->_mapItemIdentifier;
    v5->_mapItemIdentifier = (GEOMapItemIdentifier *)v18;

    v5->_mapDisplayType = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("_mapDisplayType"));
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_countryCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    objc_msgSend(v11, "decodeDoubleForKey:", CFSTR("_elevation"));
    v5->_elevation = v22;
    v5->_isCurrentLocation = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("_isCurrentLocation"));
    v5->_isCoordinate = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("_isCoordinate"));
    v5->_isAddress = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("_isAddress"));
    v5->_isCuratedRoute = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("_isCuratedRoute"));
    v5->_anchorPointType = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("_anchorPointType"));
    -[NSUUID _geo_data](v5->_uniqueID, "_geo_data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v5, "setUniqueWaypointID:", v23);

    -[GEOComposedWaypoint setType:](v5, "setType:", 1);
    -[GEOComposedWaypoint setMuid:](v5, "setMuid:", -[GEOMapItemIdentifier muid](v5->_mapItemIdentifier, "muid"));
    v24 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *uniqueID;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uniqueID = self->_uniqueID;
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](uniqueID, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uniqueID, "hash");
}

- (id)description
{
  void *v3;
  double altitude;
  void *v5;
  const __CFString *name;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  int mapDisplayType;
  __CFString *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  altitude = self->_locationCoordinate.altitude;
  if (altitude == 1.79769313e308)
    altitude = 0.0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f, %f, %g"), *(_QWORD *)&self->_locationCoordinate.latitude, *(_QWORD *)&self->_locationCoordinate.longitude, *(_QWORD *)&altitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("(No name)");
  objc_msgSend(v3, "addObject:", name);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_isCurrentLocation)
    objc_msgSend(v7, "addObject:", CFSTR("Current Location"));
  if (self->_isCoordinate)
    objc_msgSend(v8, "addObject:", CFSTR("Coordinate"));
  if (self->_isAddress)
    objc_msgSend(v8, "addObject:", CFSTR("Address"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (self->_countryCode)
    objc_msgSend(v3, "addObject:");
  v12 = self->_anchorPointType - 1;
  if (v12 > 3)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E1C11BA8[v12];
  objc_msgSend(v3, "addObject:", v13);
  mapDisplayType = self->_mapDisplayType;
  if (mapDisplayType)
  {
    if (mapDisplayType == 1)
    {
      v15 = CFSTR("TOPOGRAPHIC");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mapDisplayType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v15 = CFSTR("DEFAULT");
  }
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_routeCoordinate, 1, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@]"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  if (-[GEOMapItemIdentifier muid](self->_mapItemIdentifier, "muid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%llu)"), -[GEOMapItemIdentifier muid](self->_mapItemIdentifier, "muid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  -[NSUUID UUIDString](self->_uniqueID, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  altitude = self->_locationCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (double)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (BOOL)isCoordinate
{
  return self->_isCoordinate;
}

- (void)setIsCoordinate:(BOOL)a3
{
  self->_isCoordinate = a3;
}

- (BOOL)isAddress
{
  return self->_isAddress;
}

- (void)setIsAddress:(BOOL)a3
{
  self->_isAddress = a3;
}

- (BOOL)isCuratedRoute
{
  return self->_isCuratedRoute;
}

- (void)setIsCuratedRoute:(BOOL)a3
{
  self->_isCuratedRoute = a3;
}

- (unint64_t)anchorPointType
{
  return self->_anchorPointType;
}

- (void)setAnchorPointType:(unint64_t)a3
{
  self->_anchorPointType = a3;
}

- (GEOComposedWaypointDisplayInfo)displayInfo
{
  GEOComposedWaypointDisplayInfo *displayInfo;
  GEOComposedWaypointDisplayInfo *v4;
  GEOComposedWaypointDisplayInfo *v5;

  displayInfo = self->_displayInfo;
  if (!displayInfo)
  {
    -[GEOComposedRouteAnchorPoint _defaultDisplayInfo](self, "_defaultDisplayInfo");
    v4 = (GEOComposedWaypointDisplayInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayInfo;
    self->_displayInfo = v4;

    displayInfo = self->_displayInfo;
  }
  return displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
  objc_storeStrong((id *)&self->_displayInfo, a3);
}

- (id)updatedAnchorPointWithLocationCoordinate:(id)a3 routeCoordinate:(id)a4
{
  double var2;
  double var1;
  double var0;
  uint64_t v8;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8 = -[GEOComposedRouteAnchorPoint copy](self, "copy");
  *(double *)(v8 + 200) = var0;
  *(double *)(v8 + 208) = var1;
  *(double *)(v8 + 216) = var2;
  *($212C09783140BCCD23384160D545CE0D *)(v8 + 152) = a4;
  return (id)v8;
}

@end
