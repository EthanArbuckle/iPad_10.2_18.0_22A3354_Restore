@implementation RTMapItem

- (RTAddress)address
{
  return self->_address;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTMapItem)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  RTMapItem *v26;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoMapItemHandle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItemPlaceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resultProviderID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xattrs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayLanguage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("disputed"));

  LOBYTE(v17) = v15;
  v26 = -[RTMapItem initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:](self, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v24, v10, v11, v23, v22, v18, v21, v20, v19, v6, v4, v5, v13, v14, v17);

  return v26;
}

- (RTMapItem)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 address:(id)a6 location:(id)a7 source:(unint64_t)a8 mapItemPlaceType:(unint64_t)a9 muid:(unint64_t)a10 resultProviderID:(int64_t)a11 geoMapItemHandle:(id)a12 creationDate:(id)a13 expirationDate:(id)a14 extendedAttributes:(id)a15 displayLanguage:(id)a16 disputed:(BOOL)a17
{
  id v21;
  id v22;
  id v23;
  RTMapItem *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  const char *v31;
  RTMapItem *v32;
  NSObject *v34;
  RTMapItem *v35;
  RTMapItem *v36;
  id v37;
  id v39;
  id v40;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[16];

  v21 = a3;
  v45 = a4;
  v39 = a5;
  v44 = a5;
  v40 = a6;
  v22 = a6;
  v50 = a7;
  v49 = a12;
  v48 = a13;
  v47 = a14;
  v43 = a15;
  v23 = a16;
  v46 = v21;
  if (!v21)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: identifier";
LABEL_19:
    _os_log_error_impl(&dword_1A5E26000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_20;
  }
  if (!v22)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: address";
    goto LABEL_19;
  }
  if (!v50)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: location";
    goto LABEL_19;
  }
  if (!v49)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: geoMapItemHandle";
    goto LABEL_19;
  }
  if (!v48)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: creationDate";
      goto LABEL_19;
    }
LABEL_20:

    v24 = 0;
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
LABEL_21:
    v23 = v29;
    goto LABEL_22;
  }
  if (!v47)
  {
    v29 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
    }

    v24 = 0;
    goto LABEL_21;
  }
  if ((a8 & 0xFFFFFFFFFFF00020) != 0)
  {
    v24 = 0;
    v26 = v45;
    v25 = v46;
    v28 = v43;
    v27 = v44;
LABEL_22:
    v32 = self;
    goto LABEL_23;
  }
  v37 = v23;
  v51.receiver = self;
  v51.super_class = (Class)RTMapItem;
  v35 = -[RTMapItem init](&v51, sel_init);
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_identifier, a3);
    objc_storeStrong((id *)&v36->_name, a4);
    objc_storeStrong((id *)&v36->_category, v39);
    objc_storeStrong((id *)&v36->_address, v40);
    objc_storeStrong((id *)&v36->_location, a7);
    v36->_source = a8;
    v36->_mapItemPlaceType = a9;
    v36->_muid = a10;
    v36->_resultProviderID = a11;
    objc_storeStrong((id *)&v36->_geoMapItemHandle, a12);
    objc_storeStrong((id *)&v36->_creationDate, a13);
    objc_storeStrong((id *)&v36->_expirationDate, a14);
    objc_storeStrong((id *)&v36->_extendedAttributes, a15);
    objc_storeStrong((id *)&v36->_displayLanguage, a16);
    v36->_disputed = a17;
    -[RTMapItem updateWeightWithSource:extendedAttributes:](v36, "updateWeightWithSource:extendedAttributes:", v36->_source, v36->_extendedAttributes);
  }
  v32 = v36;
  v24 = v32;
  v26 = v45;
  v25 = v46;
  v28 = v43;
  v27 = v44;
  v23 = v37;
LABEL_23:

  return v24;
}

- (void)updateWeightWithSource:(unint64_t)a3 extendedAttributes:(id)a4
{
  id v6;
  double v7;
  NSString *name;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v6 = a4;
  v7 = 0.0;
  if (-[RTMapItem validMUID](self, "validMUID"))
  {
    name = self->_name;
    -[RTAddress thoroughfare](self->_address, "thoroughfare");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(name) = -[NSString isEqualToString:](name, "isEqualToString:", v9);

    if ((_DWORD)name)
      v7 = 0.0;
    else
      v7 = 50.0;
  }
  objc_msgSend((id)objc_opt_class(), "weightForSource:", a3);
  v11 = v7 + v10;
  objc_msgSend((id)objc_opt_class(), "weightForExtendedAttributes:", v6);
  v13 = v12;

  self->_weight = v11 + v13;
}

- (BOOL)validMUID
{
  return self->_muid != 0;
}

+ (double)weightForSource:(unint64_t)a3
{
  double v3;
  double result;

  v3 = 0.0;
  if ((a3 & 1) != 0)
    v3 = 1.0;
  if ((a3 & 0x40000) != 0)
    v3 = v3 + 1.0;
  if ((a3 & 2) != 0)
    v3 = v3 + 1.0;
  result = v3 + 1.0;
  if ((a3 & 0x1000) == 0)
    result = v3;
  if ((a3 & 0x800) != 0)
    result = result + 5.0;
  if ((a3 & 0x200) != 0)
    result = result + 7.0;
  if ((a3 & 0x4000) != 0)
    result = result + 9.0;
  if ((a3 & 0x80000) != 0)
    result = result + 9.0;
  if ((a3 & 0x100) != 0)
    result = result + 11.0;
  if ((a3 & 0x40) != 0)
    result = result + 13.0;
  if ((a3 & 0x80) != 0)
    result = result + 13.0;
  if ((a3 & 8) != 0)
    result = result + 23.0;
  if ((a3 & 4) != 0)
    result = result + 23.0;
  if ((a3 & 0x10) != 0)
    return result + 23.0;
  return result;
}

+ (double)weightForExtendedAttributes:(id)a3
{
  id v3;
  double v4;
  double v5;
  int v6;
  double result;

  if (!a3)
    return 0.0;
  v3 = a3;
  objc_msgSend(v3, "wifiConfidence");
  v5 = v4 + 0.0;
  v6 = objc_msgSend(v3, "isMe");

  result = v5 + 70.0;
  if (!v6)
    return v5;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  identifier = self->_identifier;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_geoMapItemHandle, CFSTR("geoMapItemHandle"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mapItemPlaceType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("mapItemPlaceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_muid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("muid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultProviderID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("resultProviderID"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("source"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_extendedAttributes, CFSTR("xattrs"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_displayLanguage, CFSTR("displayLanguage"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_disputed, CFSTR("disputed"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_geoMapItemHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSData)geoMapItemHandle
{
  return self->_geoMapItemHandle;
}

- (RTMapItem)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_name_category_address_location_source_mapItemPlaceType_muid_resultProviderID_geoMapItemHandle_creationDate_expirationDate_extendedAttributes_displayLanguage_disputed_);
}

- (id)description
{
  void *v3;
  void *v4;
  RTAddress *address;
  RTLocation *location;
  void *v7;
  void *v8;
  unint64_t muid;
  int64_t resultProviderID;
  double weight;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __int128 v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)&self->_name;
  address = self->_address;
  location = self->_location;
  objc_msgSend((id)objc_opt_class(), "sourceToString:", self->_source);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "placeTypeToString:", self->_mapItemPlaceType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  muid = self->_muid;
  resultProviderID = self->_resultProviderID;
  weight = self->_weight;
  -[NSDate stringFromDate](self->_creationDate, "stringFromDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (self->_disputed)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, name, \"%@\", category, %@, address, %@, location, %@, source, %@, map item place type, %@, muid, %lu, result provider ID: %ld, weight, %lf, creationDate, %@, extended attributes, %@, display language, %@, disputed, %@"), v4, v17, address, location, v7, v8, muid, resultProviderID, *(_QWORD *)&weight, v12, self->_extendedAttributes, self->_displayLanguage, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  RTMapItem *v4;
  RTMapItem *v5;
  BOOL v6;

  v4 = (RTMapItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTMapItem isEqualToMapItem:](self, "isEqualToMapItem:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_muid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  if (!v4)
  {
    v5 = -[NSUUID hash](self->_identifier, "hash");
    v4 = -[NSDate hash](self->_creationDate, "hash") ^ v5;
  }

  return v4;
}

- (BOOL)isEqualToMapItem:(id)a3
{
  id v4;
  NSUUID *identifier;
  void *v6;
  char v7;
  unint64_t muid;
  int64_t resultProviderID;
  int v10;
  void *v11;
  int v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  int disputed;
  RTAddress *address;
  void *v28;

  v4 = a3;
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSUUID isEqual:](identifier, "isEqual:", v6);

  if ((identifier & 1) != 0)
    goto LABEL_2;
  muid = self->_muid;
  if (!muid)
  {
    if (!objc_msgSend(v4, "muid"))
      goto LABEL_8;
    muid = self->_muid;
  }
  if (muid == objc_msgSend(v4, "muid"))
  {
    resultProviderID = self->_resultProviderID;
    if (resultProviderID == objc_msgSend(v4, "resultProviderID"))
    {
LABEL_2:
      v7 = 1;
      goto LABEL_15;
    }
  }
LABEL_8:
  v10 = -[RTLocation referenceFrame](self->_location, "referenceFrame");
  objc_msgSend(v4, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "referenceFrame");

  if (v10 == v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[RTLocation latitude](self->_location, "latitude");
    v15 = v14;
    -[RTLocation longitude](self->_location, "longitude");
    v17 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v15, v16);
    v18 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v4, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "latitude");
    v21 = v20;
    objc_msgSend(v4, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "longitude");
    v24 = (void *)objc_msgSend(v18, "initWithLatitude:longitude:", v21, v23);

    objc_msgSend(v17, "distanceFromLocation:", v24);
    if (v25 <= 1000.0 && (disputed = self->_disputed, disputed == objc_msgSend(v4, "disputed")))
    {
      address = self->_address;
      objc_msgSend(v4, "address");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[RTAddress isEqualToAddress:](address, "isEqualToAddress:", v28);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double weight;
  double v6;
  int64_t v7;
  double v8;
  double v9;

  v4 = a3;
  weight = self->_weight;
  objc_msgSend(v4, "weight");
  if (weight >= v6)
  {
    v8 = self->_weight;
    objc_msgSend(v4, "weight");
    v7 = v8 > v9;
  }
  else
  {
    v7 = -1;
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
  LOBYTE(v6) = self->_disputed;
  return (id)objc_msgSend(v4, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", self->_identifier, self->_name, self->_category, self->_address, self->_location, self->_source, self->_mapItemPlaceType, self->_muid, self->_resultProviderID, self->_geoMapItemHandle, self->_creationDate, self->_expirationDate, self->_extendedAttributes, self->_displayLanguage, v6);
}

+ (BOOL)hasKnownTypeItem:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_0) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

uint64_t __30__RTMapItem_hasKnownTypeItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "extendedAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMe");

  return v3;
}

+ (id)placeTypeToString:(unint64_t)a3
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

+ (id)sourceToString:(unint64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3)
  {
    v7 = CFSTR("Unknown");
LABEL_42:
    objc_msgSend(v6, "addObject:", v7);
    goto LABEL_43;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ReverseGeocode"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v6, "addObject:", CFSTR("ForwardGeocode"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v6, "addObject:", CFSTR("Contacts"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v6, "addObject:", CFSTR("User"));
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v6, "addObject:", CFSTR("MapsSupportFavorite"));
  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v6, "addObject:", CFSTR("MapsSupportHistoryEntryRoute"));
  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v6, "addObject:", CFSTR("MapsSupportHistoryEntryPlaceDisplay"));
  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v6, "addObject:", CFSTR("EventKit"));
  if ((a3 & 0x200) == 0)
  {
LABEL_11:
    if ((a3 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v6, "addObject:", CFSTR("LocalSearch"));
  if ((a3 & 0x400) == 0)
  {
LABEL_12:
    if ((a3 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v6, "addObject:", CFSTR("MapItemHandle"));
  if ((a3 & 0x800) == 0)
  {
LABEL_13:
    if ((a3 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v6, "addObject:", CFSTR("ProactiveExperts"));
  if ((a3 & 0x1000) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v6, "addObject:", CFSTR("Portrait"));
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v6, "addObject:", CFSTR("LearnedPlace"));
  if ((a3 & 0x4000) == 0)
  {
LABEL_16:
    if ((a3 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v6, "addObject:", CFSTR("BluePOI"));
  if ((a3 & 0x8000) == 0)
  {
LABEL_17:
    if ((a3 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v6, "addObject:", CFSTR("MapItemURL"));
  if ((a3 & 0x10000) == 0)
  {
LABEL_18:
    if ((a3 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v6, "addObject:", CFSTR("CurrentPOI"));
  if ((a3 & 0x20000) == 0)
  {
LABEL_19:
    if ((a3 & 0x40000) == 0)
      goto LABEL_20;
LABEL_40:
    objc_msgSend(v6, "addObject:", CFSTR("ReverseGeocodeRelatedPlaces"));
    if ((a3 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_41;
  }
LABEL_39:
  objc_msgSend(v6, "addObject:", CFSTR("CurrentLocation"));
  if ((a3 & 0x40000) != 0)
    goto LABEL_40;
LABEL_20:
  if ((a3 & 0x80000) != 0)
  {
LABEL_41:
    v7 = CFSTR("POIHistory");
    goto LABEL_42;
  }
LABEL_43:
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v11;
      v14 = 2048;
      v15 = a3;
      v16 = 2080;
      v17 = "+[RTMapItem sourceToString:]";
      v18 = 1024;
      v19 = 494;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTMapItemSource, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);

    }
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E4FB1A18;
  }

  return v9;
}

- (void)setExtendedAttributes:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[RTMapItemExtendedAttributes isEqualToMapItemExtendedAttributes:](self->_extendedAttributes, "isEqualToMapItemExtendedAttributes:"))
  {
    objc_storeStrong((id *)&self->_extendedAttributes, a3);
    -[RTMapItem updateWeightWithSource:extendedAttributes:](self, "updateWeightWithSource:extendedAttributes:", self->_source, self->_extendedAttributes);
  }

}

- (void)setSource:(unint64_t)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    -[RTMapItem updateWeightWithSource:extendedAttributes:](self, "updateWeightWithSource:extendedAttributes:");
  }
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)mapItemPlaceType
{
  return self->_mapItemPlaceType;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (int64_t)resultProviderID
{
  return self->_resultProviderID;
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (RTMapItemExtendedAttributes)extendedAttributes
{
  return self->_extendedAttributes;
}

- (BOOL)disputed
{
  return self->_disputed;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)weight
{
  return self->_weight;
}

@end
