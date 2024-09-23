@implementation MOEventRoutine

- (MOEventRoutine)init
{
  MOEventRoutine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOEventRoutine;
  result = -[MOEventRoutine init](&v3, sel_init);
  if (result)
    result->_isInvalid = 0;
  return result;
}

+ (id)descriptionOfMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Local");
  if (a3 == 2)
    return CFSTR("Tourist");
  else
    return (id)v3;
}

+ (id)stringOfPlaceUserType:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("Home");
      break;
    case 2uLL:
      result = CFSTR("Work");
      break;
    case 3uLL:
      result = CFSTR("School");
      break;
    case 4uLL:
      result = CFSTR("Gym");
      break;
    default:
      if (a3 == 100)
        result = CFSTR("Outing");
      else
        result = CFSTR("Unknown");
      break;
  }
  return result;
}

+ (id)stringOfPlaceInferencePlaceType:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;

  result = CFSTR("Unknown");
  if ((uint64_t)a3 > 99)
  {
    v4 = CFSTR("State");
    v5 = CFSTR("Country");
    if (a3 != 102)
      v5 = CFSTR("Unknown");
    if (a3 != 101)
      v4 = v5;
    if (a3 == 100)
      return CFSTR("City");
    else
      return (id)v4;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        result = CFSTR("NonClassified");
        break;
      case 2uLL:
        result = CFSTR("AreaOfInterest");
        break;
      case 3uLL:
        result = CFSTR("PointOfInterest");
        break;
      case 4uLL:
        result = CFSTR("Address");
        break;
      case 5uLL:
        result = CFSTR("CoarseAddress");
        break;
      case 6uLL:
        result = CFSTR("Custom");
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)stringOfMapItemPlaceType:(unint64_t)a3
{
  id result;

  result = CFSTR("AreaOfInterest");
  switch(a3)
  {
    case 0uLL:
      result = CFSTR("Unknown");
      break;
    case 1uLL:
      return result;
    case 2uLL:
      result = CFSTR("PointOfInterest");
      break;
    case 3uLL:
      result = CFSTR("Address");
      break;
    case 4uLL:
    case 5uLL:
      result = CFSTR("Country");
      break;
    case 6uLL:
      result = CFSTR("AdministrativeArea");
      break;
    case 7uLL:
      result = CFSTR("Locality");
      break;
    case 8uLL:
      result = CFSTR("TimeZone");
      break;
    case 9uLL:
      result = CFSTR("SubLocality");
      break;
    case 0xAuLL:
      result = CFSTR("Ocean");
      break;
    case 0xBuLL:
      result = CFSTR("InlandWater");
      break;
    case 0xCuLL:
      result = CFSTR("Island");
      break;
    case 0xDuLL:
      result = CFSTR("Street");
      break;
    case 0xEuLL:
      result = CFSTR("Admin");
      break;
    case 0xFuLL:
      result = CFSTR("Postal");
      break;
    case 0x10uLL:
      result = CFSTR("Intersection");
      break;
    case 0x11uLL:
      result = CFSTR("Building");
      break;
    case 0x12uLL:
      result = CFSTR("Continent");
      break;
    case 0x13uLL:
      result = CFSTR("Region");
      break;
    case 0x14uLL:
      result = CFSTR("Division");
      break;
    default:
      if (a3 == 1000)
        result = CFSTR("Undefined");
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isInvalid;
  double placeNameConfidence;
  id v6;

  isInvalid = self->_isInvalid;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", isInvalid, CFSTR("isInvalid"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isHighConfidence, CFSTR("isHighConfidence"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_placeName, CFSTR("placeName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeType, CFSTR("placeType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeUserType, CFSTR("placeUserType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeDiscovery, CFSTR("placeDiscovery"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_geoAddressObject, CFSTR("geoAddressObject"));
  placeNameConfidence = self->_placeNameConfidence;
  *(float *)&placeNameConfidence = placeNameConfidence;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("placeNameConfidence"), placeNameConfidence);
  objc_msgSend(v6, "encodeObject:forKey:", self->_placeMapItem, CFSTR("placeMapItem"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_poiCategory, CFSTR("poiCategory"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("familiarityIndexLOI"), self->_familiarityIndexLOI);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeSource, CFSTR("placeSource"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_predominantWeather, CFSTR("predominantWeather"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isPreOnboardedVisit, CFSTR("isPreOnboardedVisit"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mapItemLocation, CFSTR("mapItemLocation"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_mapItemID, CFSTR("mapItemID"));

}

- (MOEventRoutine)initWithCoder:(id)a3
{
  id v4;
  MOEventRoutine *v5;
  uint64_t v6;
  NSString *placeName;
  uint64_t v8;
  RTLocation *location;
  uint64_t v10;
  RTAddress *address;
  uint64_t v12;
  GEOAddressObject *geoAddressObject;
  float v14;
  uint64_t v15;
  NSData *placeMapItem;
  uint64_t v17;
  NSString *poiCategory;
  double v19;
  uint64_t v20;
  MOWeather *predominantWeather;
  uint64_t v22;
  RTLocation *mapItemLocation;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MOEventRoutine;
  v5 = -[MOEventRoutine init](&v25, sel_init);
  if (v5)
  {
    v5->_isInvalid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInvalid"));
    v5->_isHighConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHighConfidence"));
    v5->_isPreOnboardedVisit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPreOnboardedVisit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (RTLocation *)v8;

    v5->_placeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeType"));
    v5->_placeUserType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeUserType"));
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    v5->_placeDiscovery = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("placeDiscovery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v10 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (RTAddress *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoAddressObject"));
    v12 = objc_claimAutoreleasedReturnValue();
    geoAddressObject = v5->_geoAddressObject;
    v5->_geoAddressObject = (GEOAddressObject *)v12;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("placeNameConfidence"));
    v5->_placeNameConfidence = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeMapItem"));
    v15 = objc_claimAutoreleasedReturnValue();
    placeMapItem = v5->_placeMapItem;
    v5->_placeMapItem = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poiCategory"));
    v17 = objc_claimAutoreleasedReturnValue();
    poiCategory = v5->_poiCategory;
    v5->_poiCategory = (NSString *)v17;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("familiarityIndexLOI"));
    v5->_familiarityIndexLOI = v19;
    v5->_placeSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeSource"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predominantWeather"));
    v20 = objc_claimAutoreleasedReturnValue();
    predominantWeather = v5->_predominantWeather;
    v5->_predominantWeather = (MOWeather *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItemLocation"));
    v22 = objc_claimAutoreleasedReturnValue();
    mapItemLocation = v5->_mapItemLocation;
    v5->_mapItemLocation = (RTLocation *)v22;

    v5->_mapItemID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapItemID"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventRoutine *v4;

  v4 = objc_alloc_init(MOEventRoutine);
  v4->_isInvalid = self->_isInvalid;
  v4->_isHighConfidence = self->_isHighConfidence;
  objc_storeStrong((id *)&v4->_address, self->_address);
  objc_storeStrong((id *)&v4->_geoAddressObject, self->_geoAddressObject);
  v4->_mode = self->_mode;
  objc_storeStrong((id *)&v4->_location, self->_location);
  objc_storeStrong((id *)&v4->_placeName, self->_placeName);
  v4->_placeType = self->_placeType;
  v4->_placeSource = self->_placeSource;
  objc_storeStrong((id *)&v4->_poiCategory, self->_poiCategory);
  v4->_placeDiscovery = self->_placeDiscovery;
  objc_storeStrong((id *)&v4->_placeMapItem, self->_placeMapItem);
  v4->_placeUserType = self->_placeUserType;
  objc_storeStrong((id *)&v4->_predominantWeather, self->_predominantWeather);
  v4->_familiarityIndexLOI = self->_familiarityIndexLOI;
  v4->_placeNameConfidence = self->_placeNameConfidence;
  v4->_isPreOnboardedVisit = self->_isPreOnboardedVisit;
  objc_storeStrong((id *)&v4->_mapItemLocation, self->_mapItemLocation);
  v4->_mapItemID = self->_mapItemID;
  return v4;
}

- (id)description
{
  double placeNameConfidence;
  void *v4;
  unint64_t placeDiscovery;
  _BOOL8 isHighConfidence;
  _BOOL8 isInvalid;
  _BOOL8 isPreOnboardedVisit;
  unint64_t placeSource;
  NSString *poiCategory;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString mask](self->_placeName, "mask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  placeNameConfidence = self->_placeNameConfidence;
  +[MOEventRoutine descriptionOfMode:](MOEventRoutine, "descriptionOfMode:", -[MOEventRoutine mode](self, "mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  placeDiscovery = self->_placeDiscovery;
  isHighConfidence = self->_isHighConfidence;
  isInvalid = self->_isInvalid;
  isPreOnboardedVisit = self->_isPreOnboardedVisit;
  poiCategory = self->_poiCategory;
  placeSource = self->_placeSource;
  objc_msgSend((id)objc_opt_class(), "stringOfPlaceInferencePlaceType:", self->_placeType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringOfMapItemPlaceType:", self->_mapItemPlaceType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("placeName, %@, confidence, %f, locationMode, %@, new place, %lu, isHighConfidence, %d, isInvalid, %d, isPreOnboardedVisit, %d, poiCategory, %@, placeSource, %lu, placeType, %@, mapItemPlaceType, %@, userType, %lu, predominantWeather %@,familiarityIndexLOI, %.2f, mapItem, %lu"), v15, *(_QWORD *)&placeNameConfidence, v4, placeDiscovery, isHighConfidence, isInvalid, isPreOnboardedVisit, poiCategory, placeSource, v11, v12, self->_placeUserType, self->_predominantWeather, *(_QWORD *)&self->_familiarityIndexLOI, self->_mapItemID);

  return v13;
}

- (id)formatAddressCurrentFormatWithFallback:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[RTAddress countryCode](self->_address, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", CFSTR("US"));

  if (v7)
  {
    -[RTAddress getPreferredName](self->_address, "getPreferredName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTAddress countryCode](self->_address, "countryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v8;
      v12 = "%@, country code, %@, using current format output string, %@";
      v13 = v9;
      v14 = 32;
LABEL_7:
      _os_log_debug_impl(&dword_1CAE42000, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v16, v14);

    }
  }
  else
  {
    -[MOEventRoutine formatAddressParkingDisplayNameWithFallback:](self, "formatAddressParkingDisplayNameWithFallback:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTAddress countryCode](self->_address, "countryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v8;
      v22 = 1024;
      v23 = v3;
      v12 = "%@, country code, %@, using parking display name output string, %@, fallback, %i";
      v13 = v9;
      v14 = 38;
      goto LABEL_7;
    }
  }

  return v8;
}

- (id)formatAddressParkingDisplayNameWithFallback:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[GEOAddressObject parkingDisplayName](self->_geoAddressObject, "parkingDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityEventData);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    v20 = 1024;
    v21 = v3;
    _os_log_debug_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEBUG, "%@, parkingDisplayName output string, %@, fallback, %i", (uint8_t *)&v16, 0x1Cu);

  }
  if (objc_msgSend(v6, "length"))
    v8 = 1;
  else
    v8 = !v3;
  if (v8)
  {
    v9 = v6;
  }
  else
  {
    -[GEOAddressObject shortAddress](self->_geoAddressObject, "shortAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MOEventRoutine formatAddressParkingDisplayNameWithFallback:].cold.1(a2, (uint64_t)v9, v10);

  }
  _mo_log_facility_get_os_log(MOLogFacilityEventData);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v15;
    v18 = 2112;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    _os_log_debug_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEBUG, "%@, output string, %@, fallback, %i", (uint8_t *)&v16, 0x1Cu);

  }
  return v9;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    -[MOEventRoutine formatAddressCurrentFormatWithFallback:](self, "formatAddressCurrentFormatWithFallback:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")))
  {
    -[GEOAddressObject shortAddress](self->_geoAddressObject, "shortAddress");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")))
  {
    -[MOEventRoutine formatAddressParkingDisplayNameWithFallback:](self, "formatAddressParkingDisplayNameWithFallback:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress"));
  -[GEOAddressObject aboveDoorShortAddress](self->_geoAddressObject, "aboveDoorShortAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v14, 0x20u);

    }
  }
LABEL_8:
  _mo_log_facility_get_os_log(MOLogFacilityEventData);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    -[RTAddress locality](self->_address, "locality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    -[GEOAddressObject cityDisplayNameWithFallback:](self->_geoAddressObject, "cityDisplayNameWithFallback:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_debug_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v10, 0x20u);
      goto LABEL_12;
    }
  }
  else
  {
    -[GEOAddressObject cityDisplayNameWithFallback:](self->_geoAddressObject, "cityDisplayNameWithFallback:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v10, 0x20u);
LABEL_12:

    }
  }

  return v6;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    -[RTAddress administrativeArea](self->_address, "administrativeArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v11, 0x20u);
      goto LABEL_14;
    }
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEventRoutine formatAdministrativeAreaWithFormatOption:].cold.1(a2, (uint64_t)v5, v8);

    -[RTAddress administrativeArea](self->_address, "administrativeArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
  }
  else
  {
    -[RTAddress administrativeArea](self->_address, "administrativeArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v11, 0x20u);
LABEL_14:

    }
  }

  return v6;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    -[RTAddress country](self->_address, "country");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    -[GEOAddressObject countryName](self->_geoAddressObject, "countryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v10 = "%@, format option, %@, output string, %@";
      goto LABEL_12;
    }
  }
  else
  {
    -[GEOAddressObject countryName](self->_geoAddressObject, "countryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventData);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v10 = "%@, unrecognized format option, %@, will use default, %@";
LABEL_12:
      _os_log_debug_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v11, 0x20u);

    }
  }

  return v6;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)isPreOnboardedVisit
{
  return self->_isPreOnboardedVisit;
}

- (void)setIsPreOnboardedVisit:(BOOL)a3
{
  self->_isPreOnboardedVisit = a3;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setIsHighConfidence:(BOOL)a3
{
  self->_isHighConfidence = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(double)a3
{
  self->_placeNameConfidence = a3;
}

- (unint64_t)placeDiscovery
{
  return self->_placeDiscovery;
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  self->_placeDiscovery = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (RTAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (GEOAddressObject)geoAddressObject
{
  return self->_geoAddressObject;
}

- (void)setGeoAddressObject:(id)a3
{
  objc_storeStrong((id *)&self->_geoAddressObject, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSData)placeMapItem
{
  return self->_placeMapItem;
}

- (void)setPlaceMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeMapItem, a3);
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (unint64_t)placeSource
{
  return self->_placeSource;
}

- (void)setPlaceSource:(unint64_t)a3
{
  self->_placeSource = a3;
}

- (unint64_t)mapItemPlaceType
{
  return self->_mapItemPlaceType;
}

- (void)setMapItemPlaceType:(unint64_t)a3
{
  self->_mapItemPlaceType = a3;
}

- (RTLocation)mapItemLocation
{
  return self->_mapItemLocation;
}

- (void)setMapItemLocation:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemLocation, a3);
}

- (unint64_t)mapItemID
{
  return self->_mapItemID;
}

- (void)setMapItemID:(unint64_t)a3
{
  self->_mapItemID = a3;
}

- (double)distanceFromVisitToPlace
{
  return self->_distanceFromVisitToPlace;
}

- (void)setDistanceFromVisitToPlace:(double)a3
{
  self->_distanceFromVisitToPlace = a3;
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_familiarityIndexLOI = a3;
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
  objc_storeStrong((id *)&self->_predominantWeather, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_mapItemLocation, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_placeMapItem, 0);
  objc_storeStrong((id *)&self->_geoAddressObject, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
}

- (void)formatAddressParkingDisplayNameWithFallback:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[22];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  v6 = 1024;
  v7 = 1;
  _os_log_debug_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_DEBUG, "%@, shortAddress output string, %@, fallback, %i", v5, 0x1Cu);

}

- (void)formatAdministrativeAreaWithFormatOption:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_ERROR, "%@, short address format doesn't support the administrative area (state), option, %@, will use default", v5, 0x16u);

}

@end
