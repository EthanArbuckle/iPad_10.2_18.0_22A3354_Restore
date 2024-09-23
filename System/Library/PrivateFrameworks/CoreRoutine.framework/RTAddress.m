@implementation RTAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_iso3166SubdivisionCode, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_geoAddressData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_localGeoAddressObject, 0);
}

- (NSString)thoroughfare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "thoroughfare");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_thoroughfare;
  }
  return v7;
}

- (id)geoAddressObject
{
  GEOAddressObject *localGeoAddressObject;
  GEOAddressObject *v4;
  void *v5;
  id v6;
  GEOAddressObject *v7;
  GEOAddressObject *v8;

  localGeoAddressObject = self->_localGeoAddressObject;
  if (!localGeoAddressObject)
  {
    if (self->_geoAddressData)
    {
      objc_msgSend((id)objc_opt_class(), "_decodeGeoAddressObjectFromData:decompress:", self->_geoAddressData, 1);
      v4 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();
      v5 = self->_localGeoAddressObject;
      self->_localGeoAddressObject = v4;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0D26EC8]);
      objc_msgSend((id)objc_opt_class(), "_mergedThoroughfareWithSubPremises:subThoroughfare:thoroughfare:", self->_subPremises, self->_subThoroughfare, self->_thoroughfare);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (GEOAddressObject *)objc_msgSend(v6, "initWithCurrentLocaleFullThoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:", v5, self->_subLocality, self->_locality, self->_subAdministrativeArea, self->_administrativeArea, self->_postalCode, self->_country, self->_countryCode);
      v8 = self->_localGeoAddressObject;
      self->_localGeoAddressObject = v7;

    }
    localGeoAddressObject = self->_localGeoAddressObject;
  }
  return localGeoAddressObject;
}

- (NSData)geoAddressData
{
  return self->_geoAddressData;
}

- (RTAddress)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  RTAddress *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoAddressData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("subPremises"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subThoroughfare"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thoroughfare"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subLocality"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locality"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subAdministrativeArea"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("administrativeArea"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("administrativeAreaCode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlandWater"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ocean"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("areasOfInterest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isIsland"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iso3166CountryCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iso3166SubdivisionCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v16) = (_BYTE)v10;
  v26 = -[RTAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v30, v29, v33, v32, v31, v24, v28, v23, v22, v27, v19, v21, v20, v18, v7,
          v17,
          v16,
          v11,
          v12,
          v13,
          v14);

  return v26;
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = a6;
  return -[RTAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           MEMORY[0x1E0C9AA60],
           v11,
           a7,
           a8,
           a9,
           a10);
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23
{
  id v28;
  RTAddress *v29;
  RTAddress *v30;
  GEOAddressObject *localGeoAddressObject;
  NSString *subThoroughfare;
  NSString *thoroughfare;
  NSString *subLocality;
  NSString *locality;
  NSString *subAdministrativeArea;
  NSString *administrativeArea;
  NSString *administrativeAreaCode;
  NSString *postalCode;
  NSString *country;
  NSString *countryCode;
  NSString *inlandWater;
  NSString *ocean;
  NSArray *areasOfInterest;
  NSObject *v45;
  const char *v46;
  RTAddress *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  objc_super v81;
  uint8_t buf[16];

  v69 = a3;
  v68 = a4;
  v67 = a5;
  v66 = a6;
  v65 = a7;
  v64 = a8;
  v63 = a9;
  v62 = a10;
  v61 = a11;
  v77 = a12;
  v76 = a13;
  v75 = a14;
  v74 = a15;
  v73 = a16;
  v72 = a17;
  v78 = a18;
  v28 = a20;
  v79 = a21;
  v70 = a22;
  v71 = v28;
  v60 = a23;
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v47 = 0;
LABEL_19:
      v50 = v67;
      v49 = v68;
      v52 = v65;
      v51 = v66;
      v53 = v63;
      v56 = v64;
      v55 = v61;
      v54 = v62;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: identifier";
LABEL_22:
    _os_log_error_impl(&dword_1A5E26000, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    goto LABEL_11;
  }
  if (!v28)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: creationDate";
    goto LABEL_22;
  }
  if (v79)
  {
    v81.receiver = self;
    v81.super_class = (Class)RTAddress;
    v29 = -[RTAddress init](&v81, sel_init);
    v30 = v29;
    if (!v29)
    {
LABEL_18:
      v47 = v30;
      self = v47;
      goto LABEL_19;
    }
    objc_storeStrong((id *)&v29->_identifier, a3);
    objc_storeStrong((id *)&v30->_geoAddressData, a4);
    localGeoAddressObject = v30->_localGeoAddressObject;
    v30->_localGeoAddressObject = 0;

    objc_storeStrong((id *)&v30->_subPremises, a5);
    if (v30->_geoAddressData)
    {
      subThoroughfare = v30->_subThoroughfare;
      v30->_subThoroughfare = 0;

      thoroughfare = v30->_thoroughfare;
      v30->_thoroughfare = 0;

      subLocality = v30->_subLocality;
      v30->_subLocality = 0;

      locality = v30->_locality;
      v30->_locality = 0;

      subAdministrativeArea = v30->_subAdministrativeArea;
      v30->_subAdministrativeArea = 0;

      administrativeArea = v30->_administrativeArea;
      v30->_administrativeArea = 0;

      administrativeAreaCode = v30->_administrativeAreaCode;
      v30->_administrativeAreaCode = 0;

      postalCode = v30->_postalCode;
      v30->_postalCode = 0;

      country = v30->_country;
      v30->_country = 0;

      countryCode = v30->_countryCode;
      v30->_countryCode = 0;

      inlandWater = v30->_inlandWater;
      v30->_inlandWater = 0;

      ocean = v30->_ocean;
      v30->_ocean = 0;

    }
    else
    {
      objc_storeStrong((id *)&v30->_subThoroughfare, a6);
      objc_storeStrong((id *)&v30->_thoroughfare, a7);
      objc_storeStrong((id *)&v30->_subLocality, a8);
      objc_storeStrong((id *)&v30->_locality, a9);
      objc_storeStrong((id *)&v30->_subAdministrativeArea, a10);
      objc_storeStrong((id *)&v30->_administrativeArea, a11);
      objc_storeStrong((id *)&v30->_administrativeAreaCode, a12);
      objc_storeStrong((id *)&v30->_postalCode, a13);
      objc_storeStrong((id *)&v30->_country, a14);
      objc_storeStrong((id *)&v30->_countryCode, a15);
      objc_storeStrong((id *)&v30->_inlandWater, a16);
      objc_storeStrong((id *)&v30->_ocean, a17);
      if (objc_msgSend(v78, "count"))
      {
        v57 = objc_msgSend(v78, "copy");
        areasOfInterest = v30->_areasOfInterest;
        v30->_areasOfInterest = (NSArray *)v57;
        goto LABEL_17;
      }
    }
    areasOfInterest = v30->_areasOfInterest;
    v30->_areasOfInterest = 0;
LABEL_17:

    v30->_isIsland = a19;
    objc_storeStrong((id *)&v30->_creationDate, a20);
    objc_storeStrong((id *)&v30->_expirationDate, a21);
    objc_storeStrong((id *)&v30->_iso3166CountryCode, a22);
    objc_storeStrong((id *)&v30->_iso3166SubdivisionCode, a23);
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v48 = objc_claimAutoreleasedReturnValue();
  v50 = v67;
  v49 = v68;
  v52 = v65;
  v51 = v66;
  v54 = v62;
  v53 = v63;
  v55 = v61;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A5E26000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
  }

  v47 = 0;
  v56 = v64;
LABEL_20:

  return v47;
}

+ (id)_decodeGeoAddressObjectFromData:(id)a3 decompress:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = v7;
    if (v4)
    {
      objc_msgSend(v7, "decompressedDataUsingAlgorithm:error:", 3, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v15 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v15);
    v11 = v15;
    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "error decoding geoAddressData, %@", buf, 0xCu);
      }

      v13 = 0;
    }
    else
    {
      objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoAddress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishDecoding");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (RTAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 iso3166CountryCode:(id)a9 iso3166SubdivisionCode:(id)a10
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  RTAddress *v27;
  uint8_t buf[2];
  __int16 v30;
  __int16 v31;

  v12 = a6;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v31 = 0;
    v25 = "Invalid parameter not satisfying: identifier";
    v26 = (uint8_t *)&v31;
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_13;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v30 = 0;
    v25 = "Invalid parameter not satisfying: creationDate";
    v26 = (uint8_t *)&v30;
    goto LABEL_12;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: expirationDate";
      v26 = buf;
      goto LABEL_12;
    }
LABEL_13:

    v27 = 0;
    goto LABEL_16;
  }
  if (v17)
  {
    objc_msgSend((id)objc_opt_class(), "_encodeGeoAddressObject:compress:", v17, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  self = -[RTAddress initWithIdentifier:geoAddressData:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v16, v23, v18, v12, v19, v20, v21, v22);

  v27 = self;
LABEL_16:

  return v27;
}

+ (id)_encodeGeoAddressObject:(id)a3 compress:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CB36F8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("geoAddress"));

  objc_msgSend(v7, "finishEncoding");
  if (v6)
  {
    objc_msgSend(v7, "encodedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v4)
    {
      objc_msgSend(v8, "compressedDataUsingAlgorithm:error:", 3, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoAddressData, CFSTR("geoAddressData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subPremises, CFSTR("subPremises"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subThoroughfare, CFSTR("subThoroughfare"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thoroughfare, CFSTR("thoroughfare"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subLocality, CFSTR("subLocality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locality, CFSTR("locality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subAdministrativeArea, CFSTR("subAdministrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_administrativeArea, CFSTR("administrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_administrativeAreaCode, CFSTR("administrativeAreaCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("postalCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("country"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlandWater, CFSTR("inlandWater"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ocean, CFSTR("ocean"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_areasOfInterest, CFSTR("areasOfInterest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIsland, CFSTR("isIsland"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iso3166CountryCode, CFSTR("iso3166CountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iso3166SubdivisionCode, CFSTR("iso3166SubdivisionCode"));

}

- (NSString)subThoroughfare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "subThoroughfare");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_subThoroughfare;
  }
  return v7;
}

- (NSString)subLocality
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "subLocality");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_subLocality;
  }
  return v7;
}

- (NSString)subAdministrativeArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "subAdministrativeArea");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_subAdministrativeArea;
  }
  return v7;
}

- (NSString)postalCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "postCode");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_postalCode;
  }
  return v7;
}

- (NSString)ocean
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "ocean");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_ocean;
  }
  return v7;
}

- (NSString)locality
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "locality");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_locality;
  }
  return v7;
}

- (NSString)inlandWater
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "inlandWater");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_inlandWater;
  }
  return v7;
}

- (NSString)country
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "country");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_country;
  }
  return v7;
}

- (NSString)countryCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "countryCode");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_countryCode;
  }
  return v7;
}

- (NSArray)areasOfInterest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "areaOfInterests");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_areasOfInterest;
  }
  return v7;
}

- (NSString)administrativeArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "administrativeArea");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_administrativeArea;
  }
  return v7;
}

- (RTAddress)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_iso3166CountryCode_iso3166SubdivisionCode_);
}

- (RTAddress)initWithGeoDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RTAddress *v19;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", 4838400.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EC8]), "initWithContactAddressDictionary:language:country:phoneticLocale:", v14, v13, v12, v11);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[RTAddress initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v18, v17, 0, 0, v15, v16, 0, 0);

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_geoAddressData)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullAddressWithMultiline:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@, GEOAddressObject)"), v5, self->_iso3166SubdivisionCode, self->_iso3166CountryCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RTAddress mergedThoroughfare](self, "mergedThoroughfare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, %@ %@ %@ (%@, %@, legacy)"), v4, self->_locality, self->_administrativeArea, self->_postalCode, self->_country, self->_iso3166SubdivisionCode, self->_iso3166CountryCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSString)administrativeAreaCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTAddress geoAddressObject](self, "geoAddressObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "administrativeAreaCode");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self->_administrativeAreaCode;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_isIsland;
  return (id)objc_msgSend(v4, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", self->_identifier, self->_geoAddressData, self->_subPremises, self->_subThoroughfare, self->_thoroughfare, self->_subLocality, self->_locality, self->_subAdministrativeArea, self->_administrativeArea, self->_administrativeAreaCode, self->_postalCode, self->_country, self->_countryCode, self->_inlandWater, self->_ocean,
               self->_areasOfInterest,
               v6,
               self->_creationDate,
               self->_expirationDate,
               self->_iso3166CountryCode,
               self->_iso3166SubdivisionCode);
}

- (BOOL)isEqualToAddress:(id)a3
{
  id v4;
  void *v5;
  NSUUID *identifier;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _BOOL4 v17;
  int v18;
  NSArray *subPremises;
  uint64_t v20;
  int v21;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  _BOOL4 v32;
  _BOOL4 v33;
  NSData *geoAddressData;
  uint64_t v35;
  NSData *v36;
  char v37;
  int v38;
  int v39;
  int isIsland;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  _BOOL4 v171;
  void *v172;
  void *v173;
  int v174;
  __int128 v175;
  BOOL v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[5];
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _BYTE v187[12];
  NSUUID *v188;
  int v189;

  v4 = a3;
  v5 = v4;
  identifier = self->_identifier;
  v188 = identifier;
  if (!identifier)
  {
    objc_msgSend(v4, "identifier");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v169)
    {
      v169 = 0;
      v189 = 0;
      v186 = 0;
      memset(v187, 0, sizeof(v187));
      v177 = 0;
      v185 = 0;
      v8 = 0;
      v184 = 0;
      v183 = 0;
      v182 = 0;
      v175 = 0uLL;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, sizeof(v181));
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_13;
    }
    identifier = self->_identifier;
  }
  objc_msgSend(v5, "identifier");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSUUID isEqual:](identifier, "isEqual:") & 1) != 0)
  {
    v186 = 0;
    memset(v187, 0, sizeof(v187));
    v177 = 0;
    v185 = 0;
    v8 = 0;
    v184 = 0;
    v183 = 0;
    v182 = 0;
    v175 = 0uLL;
    v9 = 0;
    v10 = 0;
    memset(v181, 0, sizeof(v181));
    v11 = 0;
    v12 = 0;
    v180 = 0;
    v13 = 0;
    v179 = 0;
    v14 = 0;
    v178 = 0;
    v15 = 0;
    v174 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v189 = 1;
LABEL_13:
    v176 = 1;
    goto LABEL_14;
  }
  subPremises = self->_subPremises;
  *(_DWORD *)&v187[8] = subPremises == 0;
  if (!subPremises)
  {
    objc_msgSend(v5, "subPremises");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v172 = 0;
      v21 = 0;
      goto LABEL_115;
    }
    v172 = (void *)v20;
    subPremises = self->_subPremises;
  }
  objc_msgSend(v5, "subPremises");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray isEqual:](subPremises, "isEqual:"))
  {
    v189 = 1;
    *(_QWORD *)v187 = 0;
    v177 = 0;
    v185 = 0;
    v8 = 0;
    v184 = 0;
    v183 = 0;
    v182 = 0;
    v175 = 0uLL;
    v9 = 0;
    v10 = 0;
    memset(v181, 0, sizeof(v181));
    v11 = 0;
    v12 = 0;
    v180 = 0;
    v13 = 0;
    v179 = 0;
    v14 = 0;
    v178 = 0;
    v15 = 0;
    v174 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v176 = 0;
    v186 = 1;
    goto LABEL_14;
  }
  v21 = 1;
LABEL_115:
  geoAddressData = self->_geoAddressData;
  *(_DWORD *)&v187[4] = geoAddressData != 0;
  LODWORD(v186) = v21;
  if (geoAddressData)
  {
    objc_msgSend(v5, "geoAddressData");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v162 = (void *)v35;
      v36 = self->_geoAddressData;
      objc_msgSend(v5, "geoAddressData");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[NSData isEqual:](v36, "isEqual:");
      v38 = 1;
      if ((v37 & 1) != 0)
      {
        HIDWORD(v186) = 0;
        *(_DWORD *)v187 = 1;
        v185 = 0;
        v184 = 0;
        v183 = 0;
        v182 = 0;
        memset(v181, 0, sizeof(v181));
        v180 = 0;
        v179 = 0;
        v178 = 0;
        v174 = 0;
        v39 = 0;
        v171 = 0;
        v84 = 0;
        goto LABEL_119;
      }
    }
    else
    {
      v162 = 0;
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }
  -[RTAddress subThoroughfare](self, "subThoroughfare");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v186) = v167 == 0;
  *(_DWORD *)v187 = v38;
  if (v167 || (objc_msgSend(v5, "subThoroughfare"), (v160 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress subThoroughfare](self, "subThoroughfare");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "lowercaseString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subThoroughfare");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "lowercaseString");
    v165 = v41;
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v41, "isEqual:"))
    {
      v189 = 1;
      v8 = 0;
      v184 = 0;
      v183 = 0;
      v182 = 0;
      v175 = 0uLL;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, sizeof(v181));
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v185 = 1;
      goto LABEL_14;
    }
    v42 = 1;
  }
  else
  {
    v160 = 0;
    v42 = 0;
  }
  -[RTAddress thoroughfare](self, "thoroughfare");
  v43 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v185) = v43 == 0;
  v161 = (void *)v43;
  LODWORD(v185) = v42;
  if (v43 || (objc_msgSend(v5, "thoroughfare"), (v153 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress thoroughfare](self, "thoroughfare");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "lowercaseString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thoroughfare");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "lowercaseString");
    v158 = v44;
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "isEqual:"))
    {
      v189 = 1;
      v184 = 0;
      v183 = 0;
      v182 = 0;
      v175 = 0uLL;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, 36);
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      HIDWORD(v181[4]) = 1;
      goto LABEL_14;
    }
    HIDWORD(v181[4]) = 1;
  }
  else
  {
    v153 = 0;
    HIDWORD(v181[4]) = 0;
  }
  -[RTAddress mergedThoroughfare](self, "mergedThoroughfare");
  v45 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v184) = v45 == 0;
  v154 = (void *)v45;
  if (v45 || (objc_msgSend(v5, "mergedThoroughfare"), (v146 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress mergedThoroughfare](self, "mergedThoroughfare");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "lowercaseString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergedThoroughfare");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "lowercaseString");
    v151 = v46;
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v46, "isEqual:"))
    {
      v189 = 1;
      *(_QWORD *)((char *)&v175 + 4) = 0;
      v183 = 0;
      v182 = 0;
      v174 = 0;
      LODWORD(v175) = 0;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, 36);
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      HIDWORD(v175) = 1;
      LODWORD(v184) = 1;
      goto LABEL_14;
    }
    LODWORD(v184) = 1;
  }
  else
  {
    v146 = 0;
    LODWORD(v184) = 0;
  }
  -[RTAddress subLocality](self, "subLocality");
  v47 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v183) = v47 == 0;
  v148 = (void *)v47;
  if (v47 || (objc_msgSend(v5, "subLocality"), (v141 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress subLocality](self, "subLocality");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "lowercaseString");
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subLocality");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "lowercaseString");
    v49 = objc_claimAutoreleasedReturnValue();
    v144 = (void *)v48;
    v50 = (void *)v48;
    v42 = v49;
    v189 = 1;
    if (!objc_msgSend(v50, "isEqual:", v49))
    {
      v147 = (void *)v42;
      *(_QWORD *)&v175 = 0;
      LODWORD(v183) = 0;
      v182 = 0x100000000;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, 36);
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      goto LABEL_14;
    }
    HIDWORD(v182) = 1;
  }
  else
  {
    v141 = 0;
    HIDWORD(v182) = 0;
  }
  -[RTAddress locality](self, "locality");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v183) = v142 == 0;
  v147 = (void *)v42;
  if (v142 || (objc_msgSend(v5, "locality"), (v135 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress locality](self, "locality");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "lowercaseString");
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locality");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "lowercaseString");
    v139 = (void *)v42;
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v42, "isEqual:"))
    {
      v189 = 1;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000000;
      LODWORD(v182) = 0;
      v9 = 0;
      v10 = 0;
      memset(v181, 0, 32);
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      LODWORD(v181[4]) = 1;
      goto LABEL_14;
    }
    LODWORD(v181[4]) = 1;
  }
  else
  {
    v135 = 0;
    LODWORD(v181[4]) = 0;
  }
  -[RTAddress subAdministrativeArea](self, "subAdministrativeArea");
  v51 = objc_claimAutoreleasedReturnValue();
  LODWORD(v182) = v51 == 0;
  v136 = (void *)v51;
  if (v51 || (objc_msgSend(v5, "subAdministrativeArea"), (v129 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress subAdministrativeArea](self, "subAdministrativeArea");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "lowercaseString");
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subAdministrativeArea");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "lowercaseString");
    v53 = objc_claimAutoreleasedReturnValue();
    v133 = (void *)v52;
    v54 = (void *)v52;
    v42 = v53;
    v189 = 1;
    v131 = (void *)v53;
    if (!objc_msgSend(v54, "isEqual:", v53))
    {
      v9 = 0;
      v10 = 0;
      memset(v181, 0, 24);
      v11 = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v181[3] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[3]) = 1;
  }
  else
  {
    v129 = 0;
    LODWORD(v181[3]) = 0;
  }
  -[RTAddress administrativeArea](self, "administrativeArea");
  v55 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v181[3]) = v55 == 0;
  v130 = (void *)v55;
  if (v55 || (objc_msgSend(v5, "administrativeArea"), (v123 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress administrativeArea](self, "administrativeArea");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "lowercaseString");
    v56 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "administrativeArea");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "lowercaseString");
    v57 = objc_claimAutoreleasedReturnValue();
    v127 = (void *)v56;
    v58 = (void *)v56;
    v42 = v57;
    v189 = 1;
    v125 = (void *)v57;
    if (!objc_msgSend(v58, "isEqual:", v57))
    {
      v10 = 0;
      v181[0] = 0;
      v11 = 0;
      v181[1] = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v181[2] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[2]) = 1;
  }
  else
  {
    v123 = 0;
    LODWORD(v181[2]) = 0;
  }
  -[RTAddress administrativeAreaCode](self, "administrativeAreaCode");
  v59 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v181[2]) = v59 == 0;
  v124 = (void *)v59;
  if (v59 || (objc_msgSend(v5, "administrativeAreaCode"), (v117 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress administrativeAreaCode](self, "administrativeAreaCode");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "lowercaseString");
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "administrativeAreaCode");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "lowercaseString");
    v61 = objc_claimAutoreleasedReturnValue();
    v121 = (void *)v60;
    v62 = (void *)v60;
    v42 = v61;
    v189 = 1;
    v119 = (void *)v61;
    if (!objc_msgSend(v62, "isEqual:", v61))
    {
      v11 = 0;
      v181[1] = 0;
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v10 = 1;
      v181[0] = 1;
      goto LABEL_14;
    }
    LODWORD(v181[0]) = 1;
  }
  else
  {
    v117 = 0;
    LODWORD(v181[0]) = 0;
  }
  -[RTAddress postalCode](self, "postalCode");
  v63 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v181[1]) = v63 == 0;
  v118 = (void *)v63;
  if (v63 || (objc_msgSend(v5, "postalCode"), (v111 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress postalCode](self, "postalCode");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "lowercaseString");
    v64 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postalCode");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "lowercaseString");
    v65 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)v64;
    v66 = (void *)v64;
    v42 = v65;
    v189 = 1;
    v113 = (void *)v65;
    if (!objc_msgSend(v66, "isEqual:", v65))
    {
      v12 = 0;
      v180 = 0;
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      *(_QWORD *)((char *)v181 + 4) = 1;
      goto LABEL_14;
    }
    HIDWORD(v181[0]) = 1;
  }
  else
  {
    v111 = 0;
    HIDWORD(v181[0]) = 0;
  }
  -[RTAddress country](self, "country");
  v67 = objc_claimAutoreleasedReturnValue();
  LODWORD(v181[1]) = v67 == 0;
  v112 = (void *)v67;
  if (v67 || (objc_msgSend(v5, "country"), (v105 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress country](self, "country");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "lowercaseString");
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "lowercaseString");
    v69 = objc_claimAutoreleasedReturnValue();
    v109 = (void *)v68;
    v70 = (void *)v68;
    v42 = v69;
    v189 = 1;
    v107 = (void *)v69;
    if (!objc_msgSend(v70, "isEqual:", v69))
    {
      v13 = 0;
      v179 = 0;
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v180 = 1;
      goto LABEL_14;
    }
    LODWORD(v180) = 1;
  }
  else
  {
    v105 = 0;
    LODWORD(v180) = 0;
  }
  -[RTAddress countryCode](self, "countryCode");
  v71 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v180) = v71 == 0;
  v106 = (void *)v71;
  if (v71 || (objc_msgSend(v5, "countryCode"), (v98 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress countryCode](self, "countryCode");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "lowercaseString");
    v72 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "lowercaseString");
    v73 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)v72;
    v74 = (void *)v72;
    v42 = v73;
    v189 = 1;
    v101 = (void *)v73;
    if (!objc_msgSend(v74, "isEqual:", v73))
    {
      v14 = 0;
      v178 = 0;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v179 = 1;
      goto LABEL_14;
    }
    LODWORD(v179) = 1;
  }
  else
  {
    v98 = 0;
    LODWORD(v179) = 0;
  }
  -[RTAddress inlandWater](self, "inlandWater");
  v75 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v179) = v75 == 0;
  v100 = (void *)v75;
  if (v75 || (objc_msgSend(v5, "inlandWater"), (v93 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTAddress inlandWater](self, "inlandWater");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "lowercaseString");
    v76 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlandWater");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "lowercaseString");
    v77 = objc_claimAutoreleasedReturnValue();
    v96 = (void *)v76;
    v78 = (void *)v76;
    v42 = v77;
    v189 = 1;
    if (!objc_msgSend(v78, "isEqual:", v77))
    {
      v99 = (void *)v42;
      v15 = 0;
      v174 = 0;
      *(_QWORD *)&v175 = 0x100000001;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v176 = 0;
      v177 = 1;
      v8 = 1;
      *((_QWORD *)&v175 + 1) = 0x100000001;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v14 = 1;
      v178 = 1;
      goto LABEL_14;
    }
    LODWORD(v178) = 1;
  }
  else
  {
    v93 = 0;
    LODWORD(v178) = 0;
  }
  v99 = (void *)v42;
  -[RTAddress ocean](self, "ocean");
  v79 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v178) = v79 == 0;
  v94 = (void *)v79;
  if (!v79)
  {
    objc_msgSend(v5, "ocean");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v87)
    {
      v87 = 0;
      v174 = 0;
      goto LABEL_201;
    }
  }
  -[RTAddress ocean](self, "ocean");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "lowercaseString");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ocean");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "lowercaseString");
  v91 = v80;
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = 1;
  if (objc_msgSend(v80, "isEqual:"))
  {
    v174 = 1;
LABEL_201:
    -[RTAddress areasOfInterest](self, "areasOfInterest");
    v81 = objc_claimAutoreleasedReturnValue();
    v171 = v81 == 0;
    v88 = (void *)v81;
    if (v81 || (objc_msgSend(v5, "areasOfInterest"), (v85 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RTAddress areasOfInterest](self, "areasOfInterest");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "areasOfInterest");
      v86 = v82;
      v83 = objc_claimAutoreleasedReturnValue();
      v189 = 1;
      if (!objc_msgSend(v82, "isEqualToArray:"))
      {
        v176 = 0;
        v177 = 1;
        v8 = 1;
        *((_QWORD *)&v175 + 1) = 0x100000001;
        *(_QWORD *)&v175 = 0x100000001;
        v9 = 1;
        v10 = 1;
        v11 = 1;
        v12 = 1;
        v13 = 1;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v18 = 1;
        v17 = v171;
        goto LABEL_120;
      }
      v84 = 1;
      v39 = 1;
    }
    else
    {
      v88 = 0;
      v85 = 0;
      v84 = 0;
      v39 = 1;
      v171 = 1;
    }
LABEL_119:
    v16 = v39;
    isIsland = self->_isIsland;
    HIDWORD(v175) = v39;
    v176 = isIsland == objc_msgSend(v5, "isIsland");
    v189 = 1;
    v8 = v16;
    DWORD1(v175) = v16;
    DWORD2(v175) = v16;
    LODWORD(v175) = v16;
    v9 = v16;
    v10 = v16;
    v11 = v16;
    v12 = v16;
    v13 = v16;
    v14 = v16;
    v15 = v16;
    v177 = v16;
    v17 = v171;
    v18 = v84;
LABEL_120:
    v7 = (void *)v83;
    goto LABEL_14;
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v176 = 0;
  v177 = 1;
  v8 = 1;
  *((_QWORD *)&v175 + 1) = 0x100000001;
  *(_QWORD *)&v175 = 0x100000001;
  v9 = 1;
  v10 = 1;
  v11 = 1;
  v12 = 1;
  v13 = 1;
  v14 = 1;
  v15 = 1;
  v174 = 1;
LABEL_14:
  if (v18)
  {
    v170 = v5;
    v23 = v12;
    v24 = v13;
    v25 = v11;
    v26 = v14;
    v27 = v10;
    v28 = v15;
    v29 = v9;
    v30 = v16;
    v31 = v8;
    v32 = v17;

    v33 = v32;
    v8 = v31;
    v16 = v30;
    v9 = v29;
    v15 = v28;
    v10 = v27;
    v14 = v26;
    v11 = v25;
    v13 = v24;
    v12 = v23;
    v5 = v170;
    if (!v33)
    {
LABEL_16:
      if (!v16)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if (!v17)
  {
    goto LABEL_16;
  }

  if (v16)
LABEL_17:

LABEL_18:
  if (v174)
  {

  }
  if (HIDWORD(v178))

  if (v15)
  if ((_DWORD)v178)
  {

  }
  if (HIDWORD(v179))

  if (v14)
  if ((_DWORD)v179)
  {

  }
  if (HIDWORD(v180))

  if (v13)
  if ((_DWORD)v180)
  {

  }
  if (LODWORD(v181[1]))

  if (v12)
  if (HIDWORD(v181[0]))
  {

  }
  if (HIDWORD(v181[1]))

  if (v11)
  if (LODWORD(v181[0]))
  {

  }
  if (HIDWORD(v181[2]))

  if (v10)
  if (LODWORD(v181[2]))
  {

  }
  if (HIDWORD(v181[3]))

  if (v9)
  if (LODWORD(v181[3]))
  {

  }
  if ((_DWORD)v182)

  if ((_DWORD)v175)
  if (LODWORD(v181[4]))
  {

  }
  if ((_DWORD)v183)

  if (DWORD1(v175))
  if (HIDWORD(v182))
  {

  }
  if (HIDWORD(v183))

  if (DWORD2(v175))
  if ((_DWORD)v184)
  {

  }
  if (HIDWORD(v184))

  if (HIDWORD(v175))
  if (HIDWORD(v181[4]))
  {

    if (!HIDWORD(v185))
    {
LABEL_86:
      if (!v8)
        goto LABEL_88;
      goto LABEL_87;
    }
  }
  else if (!HIDWORD(v185))
  {
    goto LABEL_86;
  }

  if (v8)
LABEL_87:

LABEL_88:
  if ((_DWORD)v185)
  {

  }
  if (HIDWORD(v186))

  if (v177)
  if (*(_DWORD *)v187)
  {

    if (!*(_DWORD *)&v187[4])
    {
LABEL_96:
      if (!(_DWORD)v186)
        goto LABEL_98;
      goto LABEL_97;
    }
  }
  else if (!*(_DWORD *)&v187[4])
  {
    goto LABEL_96;
  }

  if ((_DWORD)v186)
LABEL_97:

LABEL_98:
  if (!*(_DWORD *)&v187[8])
  {
    if (!v189)
      goto LABEL_100;
LABEL_112:

    if (v188)
      goto LABEL_101;
LABEL_113:

    goto LABEL_101;
  }

  if (v189)
    goto LABEL_112;
LABEL_100:
  if (!v188)
    goto LABEL_113;
LABEL_101:

  return v176;
}

- (BOOL)isEqual:(id)a3
{
  RTAddress *v4;
  RTAddress *v5;
  BOOL v6;

  v4 = (RTAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTAddress isEqualToAddress:](self, "isEqualToAddress:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSData hash](self->_geoAddressData, "hash") ^ v3;
  v5 = -[NSArray hash](self->_subPremises, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_subThoroughfare, "hash");
  v7 = -[NSString hash](self->_thoroughfare, "hash");
  v8 = v7 ^ -[NSString hash](self->_subLocality, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_locality, "hash");
  v10 = -[NSString hash](self->_subAdministrativeArea, "hash");
  v11 = v10 ^ -[NSString hash](self->_administrativeArea, "hash");
  v12 = v11 ^ -[NSString hash](self->_administrativeAreaCode, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_postalCode, "hash");
  v14 = -[NSString hash](self->_country, "hash");
  v15 = v14 ^ -[NSString hash](self->_countryCode, "hash");
  v16 = v15 ^ -[NSString hash](self->_inlandWater, "hash");
  v17 = v16 ^ -[NSString hash](self->_ocean, "hash");
  v18 = v13 ^ v17 ^ -[NSArray hash](self->_areasOfInterest, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIsland);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  v21 = v20 ^ -[NSString hash](self->_iso3166CountryCode, "hash");
  v22 = v18 ^ v21 ^ -[NSString hash](self->_iso3166SubdivisionCode, "hash");

  return v22;
}

+ (id)_mergedThoroughfareWithSubPremises:(id)a3 subThoroughfare:(id)a4 thoroughfare:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v9);
  }
  else
  {
    if (!objc_msgSend(v9, "length"))
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9, v15);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  if (objc_msgSend(v10, "length") && objc_msgSend(v7, "count"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v10, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v10 && !objc_msgSend(v7, "count"))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)mergedThoroughfare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *subPremises;
  void *v11;

  -[RTAddress geoAddressData](self, "geoAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  -[RTAddress geoAddressObject](self, "geoAddressObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "structuredAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fullThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

LABEL_5:
    v9 = (void *)objc_opt_class();
    subPremises = self->_subPremises;
    -[RTAddress subThoroughfare](self, "subThoroughfare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAddress thoroughfare](self, "thoroughfare");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_mergedThoroughfareWithSubPremises:subThoroughfare:thoroughfare:", subPremises, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v6, "fullThoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSString *)v8;
}

- (id)geoDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[RTAddress geoAddressObject](self, "geoAddressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)subPremises
{
  return self->_subPremises;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (NSString)iso3166CountryCode
{
  return self->_iso3166CountryCode;
}

- (NSString)iso3166SubdivisionCode
{
  return self->_iso3166SubdivisionCode;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end
