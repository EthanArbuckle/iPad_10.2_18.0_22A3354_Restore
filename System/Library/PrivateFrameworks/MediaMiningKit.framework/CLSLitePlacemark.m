@implementation CLSLitePlacemark

- (CLSLitePlacemark)initWithCLPlacemark:(id)a3
{
  id v4;
  CLSLitePlacemark *v5;
  uint64_t v6;
  CLCircularRegion *region;
  uint64_t v8;
  CLLocation *location;
  uint64_t v10;
  NSString *geoServiceProvider;
  void *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSArray *popularityScoresOrderedByAOI;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSLitePlacemark;
  v5 = -[CLSLitePlacemark init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "region");
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    objc_msgSend(v4, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
    v10 = objc_claimAutoreleasedReturnValue();
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v10;

    objc_msgSend(v4, "_geoMapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark _extractValuesFromGeoMapItem:](v5, "_extractValuesFromGeoMapItem:", v12);
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CLSLitePlacemark areasOfInterest](v5, "areasOfInterest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "count") && objc_msgSend(v15, "count"))
      {
        v16 = 0;
        do
          -[NSArray setObject:atIndexedSubscript:](v13, "setObject:atIndexedSubscript:", &unk_1E8511BD8, v16++);
        while (v16 < objc_msgSend(v15, "count"));
      }
    }
    else
    {

      v13 = 0;
    }
    popularityScoresOrderedByAOI = v5->_popularityScoresOrderedByAOI;
    v5->_popularityScoresOrderedByAOI = v13;

  }
  return v5;
}

- (CLSLitePlacemark)initWithCLPlacemark:(id)a3 popularityScoresOrderedByAOI:(id)a4
{
  id v7;
  CLSLitePlacemark *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint8_t v13[16];

  v7 = a4;
  v8 = -[CLSLitePlacemark initWithCLPlacemark:](self, "initWithCLPlacemark:", a3);
  if (v8)
  {
    v9 = objc_msgSend(v7, "count");
    -[CLSLitePlacemark areasOfInterest](v8, "areasOfInterest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 == v11)
    {
      objc_storeStrong((id *)&v8->_popularityScoresOrderedByAOI, a4);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[CLSLitePlacemark] popularityScoresOrderedByAOI is not populated to be the same length as areasOfInterest.", v13, 2u);
    }
  }

  return v8;
}

- (CLSLitePlacemark)initWithRTMapItem:(id)a3
{
  id v4;
  CLSLitePlacemark *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  double v12;
  id v13;
  CLLocationCoordinate2D v14;
  void *v15;
  uint64_t v16;
  CLCircularRegion *region;
  void *v18;
  uint64_t v19;
  NSString *thoroughfare;
  uint64_t v21;
  NSString *locality;
  uint64_t v23;
  NSString *administrativeArea;
  uint64_t v25;
  NSString *subAdministrativeArea;
  uint64_t v27;
  NSString *ISOcountryCode;
  uint64_t v29;
  NSString *geoServiceProvider;
  uint64_t v31;
  NSString *subThoroughfare;
  uint64_t v33;
  NSString *administrativeAreaCode;
  uint64_t v35;
  NSString *inlandWater;
  uint64_t v37;
  NSString *ocean;
  uint64_t v39;
  NSArray *areasOfInterest;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  objc_super v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)CLSLitePlacemark;
  v5 = -[CLSLitePlacemark init](&v69, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v6, "longitude");
    v10 = v9;
    objc_msgSend(v6, "horizontalUncertainty");
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x1E0C9E368]);
    v14 = CLLocationCoordinate2DMake(v8, v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f> radius %.2f"), *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithCenter:radius:identifier:", v15, v14.latitude, v14.longitude, v12);
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v16;

    objc_msgSend(v4, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "thoroughfare");
    v19 = objc_claimAutoreleasedReturnValue();
    thoroughfare = v5->_thoroughfare;
    v5->_thoroughfare = (NSString *)v19;

    objc_msgSend(v18, "locality");
    v21 = objc_claimAutoreleasedReturnValue();
    locality = v5->_locality;
    v5->_locality = (NSString *)v21;

    objc_msgSend(v18, "administrativeArea");
    v23 = objc_claimAutoreleasedReturnValue();
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v23;

    objc_msgSend(v18, "subAdministrativeArea");
    v25 = objc_claimAutoreleasedReturnValue();
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v25;

    objc_msgSend(v18, "countryCode");
    v27 = objc_claimAutoreleasedReturnValue();
    ISOcountryCode = v5->_ISOcountryCode;
    v5->_ISOcountryCode = (NSString *)v27;

    objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
    v29 = objc_claimAutoreleasedReturnValue();
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v29;

    objc_msgSend(v18, "subThoroughfare");
    v31 = objc_claimAutoreleasedReturnValue();
    subThoroughfare = v5->_subThoroughfare;
    v5->_subThoroughfare = (NSString *)v31;

    objc_msgSend(v18, "administrativeAreaCode");
    v33 = objc_claimAutoreleasedReturnValue();
    administrativeAreaCode = v5->_administrativeAreaCode;
    v5->_administrativeAreaCode = (NSString *)v33;

    objc_msgSend(v18, "inlandWater");
    v35 = objc_claimAutoreleasedReturnValue();
    inlandWater = v5->_inlandWater;
    v5->_inlandWater = (NSString *)v35;

    objc_msgSend(v18, "ocean");
    v37 = objc_claimAutoreleasedReturnValue();
    ocean = v5->_ocean;
    v5->_ocean = (NSString *)v37;

    objc_msgSend(v18, "areasOfInterest");
    v39 = objc_claimAutoreleasedReturnValue();
    areasOfInterest = v5->_areasOfInterest;
    v5->_areasOfInterest = (NSArray *)v39;

    v5->_isIsland = objc_msgSend(v18, "isIsland");
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__6143;
    v67 = __Block_byref_object_dispose__6144;
    v68 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__6143;
    v61 = __Block_byref_object_dispose__6144;
    v62 = 0;
    -[CLSLitePlacemark areasOfInterest](v5, "areasOfInterest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoMapItemHandle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __38__CLSLitePlacemark_initWithRTMapItem___block_invoke;
    v53[3] = &unk_1E84F91B8;
    v55 = &v63;
    v44 = v42;
    v54 = v44;
    v56 = &v57;
    objc_msgSend(v41, "resolveMapItemLocallyFromHandle:completionHandler:", v43, v53);

    objc_storeStrong((id *)&v5->_popularityScoresOrderedByAOI, (id)v58[5]);
    v45 = (void *)v64[5];
    if (!v45)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "loggingConnection");
      v47 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "UUIDString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v71 = v52;
        _os_log_error_impl(&dword_1CAB79000, v47, OS_LOG_TYPE_ERROR, "Could not resolve geo map item from handle for map item %@. Using region center as fallback", buf, 0xCu);

      }
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v8, v10);
      v49 = (void *)v64[5];
      v64[5] = v48;

      v45 = (void *)v64[5];
    }
    objc_storeStrong((id *)&v5->_location, v45);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);

  }
  return v5;
}

- (CLSLitePlacemark)initWithCoder:(id)a3
{
  id v4;
  CLSLitePlacemark *v5;
  uint64_t v6;
  CLCircularRegion *region;
  uint64_t v8;
  CLLocation *location;
  uint64_t v10;
  NSString *thoroughfare;
  uint64_t v12;
  NSString *subThoroughfare;
  uint64_t v14;
  NSString *locality;
  uint64_t v16;
  NSString *subLocality;
  uint64_t v18;
  NSString *administrativeArea;
  uint64_t v20;
  NSString *subAdministrativeArea;
  uint64_t v22;
  NSString *ISOcountryCode;
  uint64_t v24;
  NSString *inlandWater;
  uint64_t v26;
  NSString *ocean;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *areasOfInterest;
  void *v33;
  uint64_t v34;
  NSData *revGeoLocationData;
  uint64_t v36;
  NSString *geoServiceProvider;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSArray *popularityScoresOrderedByAOI;
  NSArray *v43;
  unint64_t v44;
  NSArray *v45;

  v4 = a3;
  v5 = -[CLSLitePlacemark init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thoroughfare"));
    v10 = objc_claimAutoreleasedReturnValue();
    thoroughfare = v5->_thoroughfare;
    v5->_thoroughfare = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subThoroughfare"));
    v12 = objc_claimAutoreleasedReturnValue();
    subThoroughfare = v5->_subThoroughfare;
    v5->_subThoroughfare = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locality"));
    v14 = objc_claimAutoreleasedReturnValue();
    locality = v5->_locality;
    v5->_locality = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subLocality"));
    v16 = objc_claimAutoreleasedReturnValue();
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("administrativeArea"));
    v18 = objc_claimAutoreleasedReturnValue();
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subAdministrativeArea"));
    v20 = objc_claimAutoreleasedReturnValue();
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ISOCountryCode"));
    v22 = objc_claimAutoreleasedReturnValue();
    ISOcountryCode = v5->_ISOcountryCode;
    v5->_ISOcountryCode = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlandWater"));
    v24 = objc_claimAutoreleasedReturnValue();
    inlandWater = v5->_inlandWater;
    v5->_inlandWater = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ocean"));
    v26 = objc_claimAutoreleasedReturnValue();
    ocean = v5->_ocean;
    v5->_ocean = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("areasOfInterest"));
    v31 = objc_claimAutoreleasedReturnValue();
    areasOfInterest = v5->_areasOfInterest;
    v5->_areasOfInterest = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isIsland"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isIsland = objc_msgSend(v33, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revGeoLocationData"));
    v34 = objc_claimAutoreleasedReturnValue();
    revGeoLocationData = v5->_revGeoLocationData;
    v5->_revGeoLocationData = (NSData *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoServiceProvider"));
    v36 = objc_claimAutoreleasedReturnValue();
    geoServiceProvider = v5->_geoServiceProvider;
    v5->_geoServiceProvider = (NSString *)v36;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("popularityScoresOrderedByAOI")))
    {
      v38 = (void *)MEMORY[0x1E0C99E60];
      v39 = objc_opt_class();
      objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("popularityScoresOrderedByAOI"));
      v41 = objc_claimAutoreleasedReturnValue();
      popularityScoresOrderedByAOI = v5->_popularityScoresOrderedByAOI;
      v5->_popularityScoresOrderedByAOI = (NSArray *)v41;

      if (!v5->_popularityScoresOrderedByAOI)
      {
        if (v5->_areasOfInterest)
        {
          v43 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (-[NSArray count](v5->_areasOfInterest, "count"))
          {
            v44 = 0;
            do
              -[NSArray setObject:atIndexedSubscript:](v43, "setObject:atIndexedSubscript:", &unk_1E8511BD8, v44++);
            while (v44 < -[NSArray count](v5->_areasOfInterest, "count"));
          }
          v45 = v5->_popularityScoresOrderedByAOI;
          v5->_popularityScoresOrderedByAOI = v43;

        }
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CLCircularRegion *region;
  void *v5;
  id v6;

  region = self->_region;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", region, CFSTR("region"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_thoroughfare, CFSTR("thoroughfare"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subThoroughfare, CFSTR("subThoroughfare"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locality, CFSTR("locality"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subLocality, CFSTR("subLocality"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_administrativeArea, CFSTR("administrativeArea"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subAdministrativeArea, CFSTR("subAdministrativeArea"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_ISOcountryCode, CFSTR("ISOCountryCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_inlandWater, CFSTR("inlandWater"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_ocean, CFSTR("ocean"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_areasOfInterest, CFSTR("areasOfInterest"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIsland);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("isIsland"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_revGeoLocationData, CFSTR("revGeoLocationData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_geoServiceProvider, CFSTR("geoServiceProvider"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_popularityScoresOrderedByAOI, CFSTR("popularityScoresOrderedByAOI"));

}

- (BOOL)isOcean
{
  void *v2;
  BOOL v3;

  -[CLSLitePlacemark ocean](self, "ocean");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)_extractValuesFromGeoMapItem:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *thoroughfare;
  NSString *v8;
  NSString *subThoroughfare;
  NSString *v10;
  NSString *locality;
  NSString *v12;
  NSString *subLocality;
  NSString *v14;
  NSString *administrativeArea;
  NSString *v16;
  NSString *subAdministrativeArea;
  NSString *v18;
  NSString *ISOcountryCode;
  NSString *v20;
  NSString *inlandWater;
  NSString *v22;
  NSString *ocean;
  NSArray *v24;
  NSArray *areasOfInterest;
  NSString *v26;
  NSString *administrativeAreaCode;
  void *v28;
  NSData *v29;
  NSData *revGeoLocationData;
  id v31;

  v4 = a3;
  objc_msgSend(v4, "geoAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "structuredAddress");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "thoroughfare");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  thoroughfare = self->_thoroughfare;
  self->_thoroughfare = v6;

  objc_msgSend(v31, "subThoroughfare");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  subThoroughfare = self->_subThoroughfare;
  self->_subThoroughfare = v8;

  objc_msgSend(v31, "locality");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  locality = self->_locality;
  self->_locality = v10;

  objc_msgSend(v31, "subLocality");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  subLocality = self->_subLocality;
  self->_subLocality = v12;

  objc_msgSend(v31, "administrativeArea");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  administrativeArea = self->_administrativeArea;
  self->_administrativeArea = v14;

  objc_msgSend(v31, "subAdministrativeArea");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  subAdministrativeArea = self->_subAdministrativeArea;
  self->_subAdministrativeArea = v16;

  objc_msgSend(v31, "countryCode");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  ISOcountryCode = self->_ISOcountryCode;
  self->_ISOcountryCode = v18;

  objc_msgSend(v31, "inlandWater");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  inlandWater = self->_inlandWater;
  self->_inlandWater = v20;

  objc_msgSend(v31, "ocean");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  ocean = self->_ocean;
  self->_ocean = v22;

  objc_msgSend(v31, "areaOfInterests");
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  areasOfInterest = self->_areasOfInterest;
  self->_areasOfInterest = v24;

  objc_msgSend(v31, "administrativeAreaCode");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  administrativeAreaCode = self->_administrativeAreaCode;
  self->_administrativeAreaCode = v26;

  self->_isIsland = objc_msgSend((id)objc_opt_class(), "_isIslandForGeoMapItem:", v4);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71AA0]), "initWithGEOMapItem:", v4);

  objc_msgSend(v28, "plistData");
  v29 = (NSData *)objc_claimAutoreleasedReturnValue();
  revGeoLocationData = self->_revGeoLocationData;
  self->_revGeoLocationData = v29;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CLSLitePlacemark location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    v10 = v9;

    objc_msgSend(v5, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    v13 = v12;
    v15 = v14;

    if (v8 != v13 || v10 != v15)
      goto LABEL_54;
    -[CLSLitePlacemark region](self, "region");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[CLSLitePlacemark region](self, "region");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "region");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "region");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_54;
    }
    -[CLSLitePlacemark thoroughfare](self, "thoroughfare");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[CLSLitePlacemark thoroughfare](self, "thoroughfare");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "thoroughfare");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "thoroughfare");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_54;
    }
    -[CLSLitePlacemark subThoroughfare](self, "subThoroughfare");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      -[CLSLitePlacemark subThoroughfare](self, "subThoroughfare");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subThoroughfare");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToString:", v33);

      if (!v34)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "subThoroughfare");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        goto LABEL_54;
    }
    -[CLSLitePlacemark locality](self, "locality");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      -[CLSLitePlacemark locality](self, "locality");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locality");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToString:", v39);

      if (!v40)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "locality");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        goto LABEL_54;
    }
    -[CLSLitePlacemark subLocality](self, "subLocality");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = (void *)v42;
      -[CLSLitePlacemark subLocality](self, "subLocality");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subLocality");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqualToString:", v45);

      if (!v46)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "subLocality");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
        goto LABEL_54;
    }
    -[CLSLitePlacemark administrativeArea](self, "administrativeArea");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = (void *)v48;
      -[CLSLitePlacemark administrativeArea](self, "administrativeArea");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "administrativeArea");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v50, "isEqualToString:", v51);

      if (!v52)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "administrativeArea");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
        goto LABEL_54;
    }
    -[CLSLitePlacemark ISOcountryCode](self, "ISOcountryCode");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v55 = (void *)v54;
      -[CLSLitePlacemark ISOcountryCode](self, "ISOcountryCode");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ISOcountryCode");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v56, "isEqualToString:", v57);

      if (!v58)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "ISOcountryCode");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
        goto LABEL_54;
    }
    -[CLSLitePlacemark inlandWater](self, "inlandWater");
    v60 = objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v61 = (void *)v60;
      -[CLSLitePlacemark inlandWater](self, "inlandWater");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inlandWater");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqualToString:", v63);

      if (!v64)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "inlandWater");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
        goto LABEL_54;
    }
    -[CLSLitePlacemark areasOfInterest](self, "areasOfInterest");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      v67 = (void *)v66;
      -[CLSLitePlacemark areasOfInterest](self, "areasOfInterest");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "areasOfInterest");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "isEqual:", v69);

      if (!v70)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "areasOfInterest");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
        goto LABEL_54;
    }
    -[CLSLitePlacemark ocean](self, "ocean");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v73 = (void *)v72;
      -[CLSLitePlacemark ocean](self, "ocean");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ocean");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqual:", v75);

      if (!v76)
        goto LABEL_54;
    }
    else
    {
      objc_msgSend(v5, "ocean");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v77)
        goto LABEL_54;
    }
    v78 = -[CLSLitePlacemark isIsland](self, "isIsland");
    if (v78 == objc_msgSend(v5, "isIsland"))
    {
      -[CLSLitePlacemark revGeoLocationData](self, "revGeoLocationData");
      v79 = objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        v80 = (void *)v79;
        -[CLSLitePlacemark revGeoLocationData](self, "revGeoLocationData");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "revGeoLocationData");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v81, "isEqual:", v82);

        if (v83)
        {
LABEL_51:
          -[CLSLitePlacemark popularityScoresOrderedByAOI](self, "popularityScoresOrderedByAOI");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v84)
          {
            -[CLSLitePlacemark popularityScoresOrderedByAOI](self, "popularityScoresOrderedByAOI");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "popularityScoresOrderedByAOI");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v85, "isEqual:", v86);

          }
          else
          {
            objc_msgSend(v5, "popularityScoresOrderedByAOI");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v85 == 0;
          }

          goto LABEL_55;
        }
      }
      else
      {
        objc_msgSend(v5, "revGeoLocationData");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v87)
          goto LABEL_51;
      }
    }
LABEL_54:
    v22 = 0;
LABEL_55:

    goto LABEL_56;
  }
  v22 = 0;
LABEL_56:

  return v22;
}

- (id)description
{
  NSUInteger v3;
  NSUInteger v4;
  id v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  objc_super v22;

  v3 = -[NSArray count](self->_popularityScoresOrderedByAOI, "count");
  if (v3 && (v4 = v3, v3 == -[NSArray count](self->_areasOfInterest, "count")))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != v4; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_popularityScoresOrderedByAOI, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      v10 = (void *)MEMORY[0x1E0CB3940];
      -[NSArray objectAtIndexedSubscript:](self->_areasOfInterest, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %.3f"), v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    v22.receiver = self;
    v22.super_class = (Class)CLSLitePlacemark;
    -[CLSLitePlacemark description](&v22, sel_description);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark location](self, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark region](self, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ loc %@, region %@ (score(s): %@)"), v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v21.receiver = self;
    v21.super_class = (Class)CLSLitePlacemark;
    -[CLSLitePlacemark description](&v21, sel_description);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark location](self, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSLitePlacemark region](self, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ loc %@, region %@"), v5, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_thoroughfare, a3);
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
  objc_storeStrong((id *)&self->_subThoroughfare, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (NSString)ISOcountryCode
{
  return self->_ISOcountryCode;
}

- (void)setISOcountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_ISOcountryCode, a3);
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setInlandWater:(id)a3
{
  objc_storeStrong((id *)&self->_inlandWater, a3);
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setOcean:(id)a3
{
  objc_storeStrong((id *)&self->_ocean, a3);
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setAreasOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_areasOfInterest, a3);
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAdministrativeAreaCode:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeAreaCode, a3);
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (void)setIsIsland:(BOOL)a3
{
  self->_isIsland = a3;
}

- (NSData)revGeoLocationData
{
  return self->_revGeoLocationData;
}

- (void)setRevGeoLocationData:(id)a3
{
  objc_storeStrong((id *)&self->_revGeoLocationData, a3);
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (void)setGeoServiceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_geoServiceProvider, a3);
}

- (NSArray)popularityScoresOrderedByAOI
{
  return self->_popularityScoresOrderedByAOI;
}

- (void)setPopularityScoresOrderedByAOI:(id)a3
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, 0);
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_revGeoLocationData, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_ISOcountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

void __38__CLSLitePlacemark_initWithRTMapItem___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    objc_msgSend(v15, "coordinate");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v6, v7);
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (a1[4])
    {
      objc_msgSend(v15, "_additionalPlaceInfos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLSLitePlacemark popularityScoresOrderedByAOIFromAdditionalPlaceInfos:areasOfInterest:](CLSLitePlacemark, "popularityScoresOrderedByAOIFromAdditionalPlaceInfos:areasOfInterest:", v11, a1[4]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }

}

+ (id)popularityScoresOrderedByAOIFromAdditionalPlaceInfos:(id)a3 areasOfInterest:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    v30 = v6;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v13, "placeType", v30) == 8)
          {
            objc_msgSend(v13, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "photosMemoryScore");
              objc_msgSend(v15, "numberWithFloat:");
              v16 = objc_claimAutoreleasedReturnValue();
              if (v16)
                v17 = (void *)v16;
              else
                v17 = &unk_1E8511BD8;
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v14);

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v10);
    }

    v6 = v30;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v6;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CLSLitePlacemark] additionalPlaceInfos is nil for AOI array %@", buf, 0xCu);
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    v23 = MEMORY[0x1E0C81028];
    v31 = 138477827;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v7, "objectForKeyedSubscript:", v25, v31);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
          v27 = (void *)v26;
        else
          v27 = &unk_1E8511BD8;
        if (v26)
          v28 = 1;
        else
          v28 = v5 == 0;
        if (!v28)
        {
          v27 = &unk_1E8511BD8;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v43 = v25;
            _os_log_error_impl(&dword_1CAB79000, v23, OS_LOG_TYPE_ERROR, "[CLSLitePlacemark] AOI %{private}@ in mapItem.areasOfInterest isn't in mapItem.additionalPlaces.", buf, 0xCu);
            v27 = &unk_1E8511BD8;
          }
        }
        objc_msgSend(v18, "addObject:", v27);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v21);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_isIslandForGeoMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(v3, "areasOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_14;
  objc_msgSend(v3, "_additionalPlaceInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
  {

LABEL_14:
    v10 = objc_msgSend(v3, "_placeType");
    goto LABEL_15;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v7);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "placeType");
      if (v13 > v10)
        v10 = v13;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v9);

  if (!v10)
    goto LABEL_14;
LABEL_15:
  objc_autoreleasePoolPop(v4);

  return v10 == 11;
}

@end
