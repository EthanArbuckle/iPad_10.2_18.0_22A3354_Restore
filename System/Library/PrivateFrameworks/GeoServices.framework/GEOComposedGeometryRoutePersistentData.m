@implementation GEOComposedGeometryRoutePersistentData

- (GEOComposedGeometryRoutePersistentData)init
{
  char *v2;
  GEOComposedGeometryRoutePersistentData *v3;
  uint64_t v4;
  geo_isolater *countryCodeIsolater;
  GEOComposedGeometryRoutePersistentData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOComposedGeometryRoutePersistentData;
  v2 = -[GEOComposedGeometryRoutePersistentData init](&v8, sel_init);
  v3 = (GEOComposedGeometryRoutePersistentData *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(2uLL);
    v4 = geo_isolater_create();
    countryCodeIsolater = v3->_countryCodeIsolater;
    v3->_countryCodeIsolater = (geo_isolater *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)setAddress:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!-[GEOAddressObject isEqual:](self->_address, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_address, a3);
    v6 = v5;
    geo_isolate_sync_data();

  }
}

void __53__GEOComposedGeometryRoutePersistentData_setAddress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 40), "address");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "structuredAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v4;

}

- (NSString)iso3166CountryCode
{
  NSString *v3;
  geo_isolater *v5;

  v5 = self->_countryCodeIsolater;
  _geo_isolate_lock_data();
  v3 = self->_iso3166CountryCode;
  _geo_isolate_unlock();

  return v3;
}

- (void)setIso3166CountryCode:(id)a3
{
  id v4;
  NSString *v5;
  NSString *iso3166CountryCode;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_countryCodeIsolater;
  _geo_isolate_lock_data();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  iso3166CountryCode = self->_iso3166CountryCode;
  self->_iso3166CountryCode = v5;

  _geo_isolate_unlock();
}

- (void)setWaypoints:(id)a3
{
  NSArray *v4;
  NSArray *waypoints;

  objc_msgSend(a3, "_geo_map:", &__block_literal_global_206);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

id __55__GEOComposedGeometryRoutePersistentData_setWaypoints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v2, "geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[GEOMapItemStorage mapItemStorageForGEOMapItem:forUseType:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:forUseType:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapItemStorage:", v5);

  return v3;
}

- ($1AB5FA073B851C12C2339EC22442E995)originCoordinate
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteAnchorPointList firstObject](self->_anchorPoints, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "locationCoordinate");
    v5 = v4;
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v9 = 0x7FEFFFFFFFFFFFFFLL;
    v5 = 0xC066800000000000;
    v7 = 0xC066800000000000;
  }

  v10 = *(double *)&v5;
  v11 = *(double *)&v7;
  v12 = *(double *)&v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)destinationCoordinate
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedRouteAnchorPointList lastObject](self->_anchorPoints, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "locationCoordinate");
    v5 = v4;
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v9 = 0x7FEFFFFFFFFFFFFFLL;
    v5 = 0xC066800000000000;
    v7 = 0xC066800000000000;
  }

  v10 = *(double *)&v5;
  v11 = *(double *)&v7;
  v12 = *(double *)&v9;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSUUID isEqual:](self->_routeID, "isEqual:", v4[8]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_routeID, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("_version"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_originalVersion, CFSTR("_originalVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storageID, CFSTR("_storageID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userProvidedName, CFSTR("_userProvidedName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userProvidedNotes, CFSTR("_userProvidedNotes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeName, CFSTR("_routeName"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_source, CFSTR("_source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tourIdentifier, CFSTR("_tourIdentifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_tourMuid, CFSTR("_tourMuid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawRouteGeometry, CFSTR("_rawRouteGeometry"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_waypoints, CFSTR("_waypoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorPoints, CFSTR("_anchorPoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeAttributes, CFSTR("_routeAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_address, CFSTR("_address"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transportType, CFSTR("_transportType"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_distance"), self->_distance);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_duration"), self->_duration);
  objc_msgSend(v4, "encodeObject:forKey:", self->_elevationProfile, CFSTR("_elevationProfile"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_elevationModel, CFSTR("_elevationModel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_travelDirectionArrows, CFSTR("_travelDirectionArrows"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeNameLabels, CFSTR("_routeNameLabels"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_boundingMapRegion, CFSTR("_boundingMapRegion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disclaimerText, CFSTR("_disclaimerText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disclaimerURL, CFSTR("_disclaimerURL"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__100;
  v10 = __Block_byref_object_dispose__100;
  v11 = 0;
  v5 = MEMORY[0x1E0C809B0];
  geo_isolate_sync_data();
  objc_msgSend(v4, "encodeObject:forKey:", v7[5], CFSTR("iso3166CountryCode"), v5, 3221225472, __58__GEOComposedGeometryRoutePersistentData_encodeWithCoder___block_invoke, &unk_1E1C00760, self, &v6);
  _Block_object_dispose(&v6, 8);

}

void __58__GEOComposedGeometryRoutePersistentData_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (GEOComposedGeometryRoutePersistentData)initWithCoder:(id)a3
{
  id v4;
  GEOComposedGeometryRoutePersistentData *v5;
  uint64_t v6;
  NSUUID *storageID;
  uint64_t v8;
  NSString *userProvidedName;
  uint64_t v10;
  NSString *userProvidedNotes;
  uint64_t v12;
  NSUUID *routeID;
  uint64_t v14;
  NSString *routeName;
  uint64_t v16;
  GEOMapItemIdentifier *tourIdentifier;
  uint64_t v18;
  GEORawRouteGeometry *rawRouteGeometry;
  uint64_t v20;
  NSArray *waypoints;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  GEOComposedRouteAnchorPointList *anchorPoints;
  uint64_t v26;
  GEORouteAttributes *routeAttributes;
  uint64_t v28;
  GEOAddressObject *address;
  double v30;
  double v31;
  uint64_t v32;
  GEOElevationProfile *elevationProfile;
  uint64_t v34;
  NSArray *travelDirectionArrows;
  uint64_t v36;
  NSArray *routeNameLabels;
  uint64_t v38;
  GEOMapRegion *boundingMapRegion;
  uint64_t v40;
  NSString *disclaimerText;
  uint64_t v42;
  GEOPDURLData *disclaimerURL;
  void *v44;
  id v45;
  GEOComposedGeometryRoutePersistentData *v46;
  GEOComposedGeometryRoutePersistentData *v48;
  void *v49;

  v4 = a3;
  v5 = -[GEOComposedGeometryRoutePersistentData init](self, "init");
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version"));
    v5->_originalVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_originalVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_storageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    storageID = v5->_storageID;
    v5->_storageID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userProvidedName"));
    v8 = objc_claimAutoreleasedReturnValue();
    userProvidedName = v5->_userProvidedName;
    v5->_userProvidedName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userProvidedNotes"));
    v10 = objc_claimAutoreleasedReturnValue();
    userProvidedNotes = v5->_userProvidedNotes;
    v5->_userProvidedNotes = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v12 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeName"));
    v14 = objc_claimAutoreleasedReturnValue();
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v14;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tourIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    tourIdentifier = v5->_tourIdentifier;
    v5->_tourIdentifier = (GEOMapItemIdentifier *)v16;

    v5->_tourMuid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_tourMuid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rawRouteGeometry"));
    v18 = objc_claimAutoreleasedReturnValue();
    rawRouteGeometry = v5->_rawRouteGeometry;
    v5->_rawRouteGeometry = (GEORawRouteGeometry *)v18;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_waypoints"));
    v20 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v20;

    if (v5->_version < 2)
    {
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoints"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOComposedRouteAnchorPointList listWithAnchorPoints:](GEOComposedRouteAnchorPointList, "listWithAnchorPoints:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      anchorPoints = v5->_anchorPoints;
      v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v24;

    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoints"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v5->_anchorPoints;
      v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v22;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeAttributes"));
    v26 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address"));
    v28 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (GEOAddressObject *)v28;

    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_transportType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distance"));
    v5->_distance = v30;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_duration"));
    v5->_duration = v31;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_elevationProfile"));
    v32 = objc_claimAutoreleasedReturnValue();
    elevationProfile = v5->_elevationProfile;
    v5->_elevationProfile = (GEOElevationProfile *)v32;

    v5->_elevationModel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_elevationModel"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_travelDirectionArrows"));
    v34 = objc_claimAutoreleasedReturnValue();
    travelDirectionArrows = v5->_travelDirectionArrows;
    v5->_travelDirectionArrows = (NSArray *)v34;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_routeNameLabels"));
    v36 = objc_claimAutoreleasedReturnValue();
    routeNameLabels = v5->_routeNameLabels;
    v5->_routeNameLabels = (NSArray *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_boundingMapRegion"));
    v38 = objc_claimAutoreleasedReturnValue();
    boundingMapRegion = v5->_boundingMapRegion;
    v5->_boundingMapRegion = (GEOMapRegion *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_disclaimerText"));
    v40 = objc_claimAutoreleasedReturnValue();
    disclaimerText = v5->_disclaimerText;
    v5->_disclaimerText = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_disclaimerURL"));
    v42 = objc_claimAutoreleasedReturnValue();
    disclaimerURL = v5->_disclaimerURL;
    v5->_disclaimerURL = (GEOPDURLData *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iso3166CountryCode"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v5;
    v49 = v44;
    v45 = v44;
    geo_isolate_sync_data();
    v5->_version = 2;
    v46 = v48;

  }
  return v5;
}

void __56__GEOComposedGeometryRoutePersistentData_initWithCoder___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)originalVersion
{
  return self->_originalVersion;
}

- (NSUUID)storageID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStorageID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)userProvidedName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserProvidedName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)userProvidedNotes
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserProvidedNotes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (GEOMapItemIdentifier)tourIdentifier
{
  return self->_tourIdentifier;
}

- (void)setTourIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tourIdentifier, a3);
}

- (unint64_t)tourMuid
{
  return self->_tourMuid;
}

- (void)setTourMuid:(unint64_t)a3
{
  self->_tourMuid = a3;
}

- (GEORawRouteGeometry)rawRouteGeometry
{
  return self->_rawRouteGeometry;
}

- (void)setRawRouteGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_rawRouteGeometry, a3);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (GEOElevationProfile)elevationProfile
{
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
  objc_storeStrong((id *)&self->_elevationProfile, a3);
}

- (int)elevationModel
{
  return self->_elevationModel;
}

- (void)setElevationModel:(int)a3
{
  self->_elevationModel = a3;
}

- (NSArray)travelDirectionArrows
{
  return self->_travelDirectionArrows;
}

- (void)setTravelDirectionArrows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)routeNameLabels
{
  return self->_routeNameLabels;
}

- (void)setRouteNameLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (void)setBoundingMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundingMapRegion, a3);
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (void)setDisclaimerText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (GEOPDURLData)disclaimerURL
{
  return self->_disclaimerURL;
}

- (void)setDisclaimerURL:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclaimerURL, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_routeNameLabels, 0);
  objc_storeStrong((id *)&self->_travelDirectionArrows, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_rawRouteGeometry, 0);
  objc_storeStrong((id *)&self->_tourIdentifier, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_userProvidedNotes, 0);
  objc_storeStrong((id *)&self->_userProvidedName, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_countryCodeIsolater, 0);
}

- (BOOL)isAvailableForCurrentCountry
{
  void *v2;
  char v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__100;
  v11 = __Block_byref_object_dispose__100;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  geo_isolate_sync_data();
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration", v5, 3221225472, __91__GEOComposedGeometryRoutePersistentData_CountryAvailability__isAvailableForCurrentCountry__block_invoke, &unk_1E1C00760, self, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countryCode:supportsFeature:", v8[5], 8);

  _Block_object_dispose(&v7, 8);
  return v3;
}

void __91__GEOComposedGeometryRoutePersistentData_CountryAvailability__isAvailableForCurrentCountry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateCountryIfNecessaryWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  GEOAddressObject *address;
  void *v10;
  GEOComposedRouteAnchorPointList *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  GEOAddressObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *global_queue;
  NSObject *v31;
  id v32;
  _QWORD v33[5];
  void (**v34)(id, _QWORD);
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  GEOComposedGeometryRoutePersistentData *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  GEOComposedGeometryRoutePersistentData *v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  GEOAddressObject *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[GEOAddressObject address](self->_address, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "structuredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "length") < 2)
  {
    GEOGetGEOComposedRouteLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      address = self->_address;
      -[GEOAddressObject addressDictionary](address, "addressDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218243;
      v56 = address;
      v57 = 2113;
      v58 = v10;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "No country code from address. Address (%p) is: %{private}@", buf, 0x16u);

    }
    v46 = 0u;
    v47 = 0u;
    v45 = 0u;
    v44 = 0u;
    v11 = self->_anchorPoints;
    v12 = -[GEOComposedRouteAnchorPointList countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          v16 = *(GEOAddressObject **)(*((_QWORD *)&v44 + 1) + 8 * i);
          -[GEOAddressObject countryCode](v16, "countryCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v17, "length") >= 2)
          {
            GEOGetGEOComposedRouteLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v56 = v16;
              _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_DEFAULT, "Using country code from anchor point:\n%{private}@", buf, 0xCu);
            }

            v38 = MEMORY[0x1E0C809B0];
            v39 = 3221225472;
            v40 = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_241;
            v41 = &unk_1E1C00738;
            v42 = self;
            v43 = v17;
            v32 = v17;
            geo_isolate_sync_data();
            if (v4)
              v4[2](v4, 0);

            goto LABEL_21;
          }

        }
        v13 = -[GEOComposedRouteAnchorPointList countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v13)
          continue;
        break;
      }
    }

    -[GEOComposedGeometryRoutePersistentData originCoordinate](self, "originCoordinate");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[GEOComposedGeometryRoutePersistentData destinationCoordinate](self, "destinationCoordinate");
    v25 = v19 + (v24 - v19) * 0.5;
    v27 = v21 + (v26 - v21) * 0.5;
    v29 = v23 + (v28 - v23) * 0.5;
    v11 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", v25, v27);
    global_queue = (void *)geo_get_global_queue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_2;
    v33[3] = &unk_1E1C20EC8;
    v33[4] = self;
    v35 = v25;
    v36 = v27;
    v37 = v29;
    v34 = v4;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:](GEOGeographicMetadataRequester, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:", v11, global_queue, v33);

LABEL_21:
  }
  else
  {
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke;
    v51 = &unk_1E1C00738;
    v52 = self;
    v53 = v7;
    geo_isolate_sync_data();
    if (v4)
      v4[2](v4, 0);

  }
}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_241(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iso3166CountryCode2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") < 2)
  {
    GEOGetGEOComposedRouteLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Error getting country code from route geometry.", buf, 2u);
    }

  }
  else
  {
    v8 = v7;
    geo_isolate_sync_data();
    GEOGetGEOComposedRouteLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[6];
      v11 = a1[7];
      *(_DWORD *)buf = 138412803;
      v15 = v8;
      v16 = 2049;
      v17 = v10;
      v18 = 2049;
      v19 = v11;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEFAULT, "Found country code (%@) from route geometry at %{private}f, %{private}f.", buf, 0x20u);
    }

  }
  v13 = a1[5];
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);

}

void __109__GEOComposedGeometryRoutePersistentData_CountryAvailability__updateCountryIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

@end
