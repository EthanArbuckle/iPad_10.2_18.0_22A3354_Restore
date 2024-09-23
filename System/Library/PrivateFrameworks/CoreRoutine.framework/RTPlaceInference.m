@implementation RTPlaceInference

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)encodeWithCoder:(id)a3
{
  RTMapItem *mapItem;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  mapItem = self->_mapItem;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", mapItem, CFSTR("mapItem"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_finerGranularityMapItem, CFSTR("finerGranularityMapItem"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_userType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("userType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_userTypeSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("userTypeSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_placeType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("placeType"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_referenceLocation, CFSTR("referenceLocation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("confidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_finerGranularityMapItemConfidence);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("finerGranularityMapItemConfidence"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_loiIdentifier, CFSTR("loiIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_preferredName, CFSTR("preferredName"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_finerGranularityMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

- (unint64_t)userType
{
  return self->_userType;
}

- (unint64_t)userTypeSource
{
  return self->_userTypeSource;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (id)nameFromUserType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 > 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutine_LocalizedStringForKey:", off_1E4FB0970[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
}

- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9 preferredName:(id)a10
{
  return -[RTPlaceInference initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:](self, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:", a3, 0, a4, a5, a6, a7, a8, 0.0, a9, a10);
}

- (RTPlaceInference)initWithMapItem:(id)a3 userType:(unint64_t)a4 userTypeSource:(unint64_t)a5 placeType:(unint64_t)a6 referenceLocation:(id)a7 confidence:(double)a8 loiIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  RTPlaceInference *v21;

  v16 = a3;
  v17 = a7;
  v18 = a9;
  -[RTPlaceInference nameFromUserType:](self, "nameFromUserType:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {
    objc_msgSend(v16, "name");
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  v21 = -[RTPlaceInference initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:preferredName:](self, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:preferredName:", v16, a4, a5, a6, v17, v18, a8, v19);

  return v21;
}

- (RTPlaceInference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  RTPlaceInference *v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finerGranularityMapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userTypeSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceLocation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finerGranularityMapItemConfidence"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loiIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[RTPlaceInference initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:](self, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:", v5, v6, v8, v10, v12, v13, v16, v19, v20, v21);
  return v22;
}

+ (unint64_t)placeInferencePlaceTypeFromMapItem:(id)a3 userType:(unint64_t)a4 source:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  unint64_t v9;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    v9 = 1;
  }
  else if (objc_msgSend(v7, "mapItemPlaceType") == 1)
  {
    v9 = 2;
  }
  else if ((v5 & 1) != 0 || (objc_msgSend(v8, "validMUID") & 1) == 0)
  {
    v9 = 4;
  }
  else
  {
    v9 = 3;
  }

  return v9;
}

- (RTPlaceInference)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_finerGranularityMapItem_userType_userTypeSource_placeType_referenceLocation_confidence_finerGranularityMapItemConfidence_loiIdentifier_preferredName_);
}

- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  RTPlaceInference *v25;

  v19 = a3;
  v20 = a4;
  v21 = a8;
  v22 = a11;
  -[RTPlaceInference nameFromUserType:](self, "nameFromUserType:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "length"))
  {
    objc_msgSend(v19, "name");
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  v25 = -[RTPlaceInference initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:](self, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:", v19, v20, a5, a6, a7, v21, a9, a10, v22, v23);

  return v25;
}

- (RTPlaceInference)initWithMapItem:(id)a3 finerGranularityMapItem:(id)a4 userType:(unint64_t)a5 userTypeSource:(unint64_t)a6 placeType:(unint64_t)a7 referenceLocation:(id)a8 confidence:(double)a9 finerGranularityMapItemConfidence:(double)a10 loiIdentifier:(id)a11 preferredName:(id)a12
{
  id v20;
  id v21;
  id v22;
  RTPlaceInference *v23;
  RTPlaceInference *v24;
  RTPlaceInference *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v31;
  id v32;
  RTPlaceInference *v34;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[16];

  v20 = a3;
  v21 = a4;
  v36 = a8;
  v35 = a11;
  v22 = a12;
  if (a5 >= 8)
  {
    v27 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferenceUserSpecificPlaceTypeValid(userType)";
LABEL_22:
    _os_log_error_impl(&dword_1A5E26000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_23;
  }
  if (a6 >= 8)
  {
    v27 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferenceUserSpecificPlaceTypeSourceValid(userTypeSource)";
    goto LABEL_22;
  }
  if (a7 >= 8)
  {
    v27 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: RTPlaceInferencePlaceTypeValid(placeType)";
    goto LABEL_22;
  }
  if (!v36)
  {
    v27 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: referenceLocation";
    goto LABEL_22;
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    v27 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: RTPlaceInferenceConfidenceValid(confidence)";
      goto LABEL_22;
    }
LABEL_23:

    v25 = 0;
    v24 = self;
    v26 = v35;
    goto LABEL_24;
  }
  v32 = v22;
  if (a10 < 0.0 || a10 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    v26 = v35;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTPlaceInferenceConfidenceValid(finerGranularityMapItemConfidence)", buf, 2u);
    }

    v25 = 0;
    v27 = v32;
    v24 = self;
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)RTPlaceInference;
    v23 = -[RTPlaceInference init](&v37, sel_init);
    if (v23)
    {
      v34 = v23;
      objc_storeStrong((id *)&v23->_mapItem, a3);
      objc_storeStrong((id *)&v34->_finerGranularityMapItem, a4);
      v34->_userType = a5;
      v34->_userTypeSource = a6;
      v34->_placeType = a7;
      objc_storeStrong((id *)&v34->_referenceLocation, a8);
      v34->_confidence = a9;
      v34->_finerGranularityMapItemConfidence = a10;
      objc_storeStrong((id *)&v34->_loiIdentifier, a11);
      objc_storeStrong((id *)&v34->_preferredName, a12);
      v23 = v34;
    }
    v24 = v23;
    v25 = v24;
    v26 = v35;
    v27 = v32;
  }
LABEL_24:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTPlaceInference referenceLocation](self, "referenceLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userSpecificPlaceTypeToString:", -[RTPlaceInference userType](self, "userType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userSpecificPlaceTypeSourceToString:", -[RTPlaceInference userTypeSource](self, "userTypeSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "placeTypeToString:", -[RTPlaceInference placeType](self, "placeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInference mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInference finerGranularityMapItem](self, "finerGranularityMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInference preferredName](self, "preferredName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInference confidence](self, "confidence");
  v12 = v11;
  -[RTPlaceInference finerGranularityMapItemConfidence](self, "finerGranularityMapItemConfidence");
  v14 = v13;
  -[RTPlaceInference loiIdentifier](self, "loiIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("location, %@, userType, %@, userTypeSource, %@, placeType, %@, map item, %@, finerGranularityMapItem, %@, preferredName, %@, confidence, %f, finerGranularityMapItemConfidence, %f, related LOI identifier, %@"), v4, v5, v6, v7, v8, v9, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)userSpecificPlaceTypeToString:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Home");
  else
    return off_1E4FB0990[a3];
}

+ (id)userSpecificPlaceTypeSourceToString:(unint64_t)a3
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
LABEL_10:
    objc_msgSend(v6, "addObject:", v7);
    goto LABEL_11;
  }
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0)
      goto LABEL_4;
LABEL_8:
    objc_msgSend(v6, "addObject:", CFSTR("MeCard"));
    if ((a3 & 4) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Inferred"));
  if ((a3 & 2) != 0)
    goto LABEL_8;
LABEL_4:
  if ((a3 & 4) != 0)
  {
LABEL_9:
    v7 = CFSTR("User");
    goto LABEL_10;
  }
LABEL_11:
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
      v17 = "+[RTPlaceInference userSpecificPlaceTypeSourceToString:]";
      v18 = 1024;
      v19 = 299;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTPlaceInferenceUserSpecificPlaceTypeSource, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);

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

+ (id)placeTypeToString:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("NonClassified");
  else
    return off_1E4FB09B8[a3];
}

- (BOOL)isEqualToPlaceInference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  RTLocation *referenceLocation;
  RTLocation *v10;
  RTMapItem *mapItem;
  RTMapItem *v12;
  RTMapItem *finerGranularityMapItem;
  RTMapItem *v14;
  unint64_t userType;
  unint64_t userTypeSource;
  unint64_t placeType;
  BOOL v18;
  double confidence;
  double v20;
  double v21;
  BOOL v22;
  double finerGranularityMapItemConfidence;
  double v24;
  double v25;
  BOOL v26;
  NSString *preferredName;
  NSString *v28;
  void *v29;
  char v30;
  NSUUID *loiIdentifier;
  NSUUID *v32;
  void *v33;
  char v34;
  BOOL v36;
  BOOL v37;
  char v38;
  char v39;
  char v40;

  v7 = a3;
  v8 = v7;
  referenceLocation = self->_referenceLocation;
  v10 = referenceLocation;
  if (referenceLocation)
  {
LABEL_4:
    objc_msgSend(v8, "referenceLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[RTLocation isEqual:](v10, "isEqual:", v4);

    if (referenceLocation)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v7, "referenceLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = self->_referenceLocation;
    goto LABEL_4;
  }
  v40 = 1;
LABEL_7:

LABEL_8:
  mapItem = self->_mapItem;
  v12 = mapItem;
  if (mapItem)
    goto LABEL_11;
  objc_msgSend(v8, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = self->_mapItem;
LABEL_11:
    objc_msgSend(v8, "mapItem");
    referenceLocation = (RTLocation *)objc_claimAutoreleasedReturnValue();
    v39 = -[RTMapItem isEqual:](v12, "isEqual:", referenceLocation);

    if (mapItem)
      goto LABEL_15;
    goto LABEL_14;
  }
  v39 = 1;
LABEL_14:

LABEL_15:
  finerGranularityMapItem = self->_finerGranularityMapItem;
  v14 = finerGranularityMapItem;
  if (finerGranularityMapItem)
    goto LABEL_18;
  objc_msgSend(v8, "finerGranularityMapItem");
  referenceLocation = (RTLocation *)objc_claimAutoreleasedReturnValue();
  if (referenceLocation)
  {
    v14 = self->_finerGranularityMapItem;
LABEL_18:
    objc_msgSend(v8, "finerGranularityMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[RTMapItem isEqual:](v14, "isEqual:", v5);

    if (finerGranularityMapItem)
      goto LABEL_22;
    goto LABEL_21;
  }
  v38 = 1;
LABEL_21:

LABEL_22:
  userType = self->_userType;
  if (userType)
  {
LABEL_25:
    v37 = userType != objc_msgSend(v8, "userType");
    goto LABEL_26;
  }
  if (objc_msgSend(v8, "userType"))
  {
    userType = self->_userType;
    goto LABEL_25;
  }
  v37 = 0;
LABEL_26:
  userTypeSource = self->_userTypeSource;
  if (userTypeSource)
  {
LABEL_29:
    v36 = userTypeSource != objc_msgSend(v8, "userTypeSource");
    goto LABEL_30;
  }
  if (objc_msgSend(v8, "userTypeSource"))
  {
    userTypeSource = self->_userTypeSource;
    goto LABEL_29;
  }
  v36 = 0;
LABEL_30:
  placeType = self->_placeType;
  if (placeType)
  {
LABEL_33:
    v18 = placeType != objc_msgSend(v8, "placeType");
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "placeType"))
  {
    placeType = self->_placeType;
    goto LABEL_33;
  }
  v18 = 0;
LABEL_34:
  confidence = self->_confidence;
  if (confidence != 0.0)
  {
LABEL_37:
    objc_msgSend(v8, "confidence");
    v22 = confidence != v21;
    goto LABEL_38;
  }
  objc_msgSend(v8, "confidence");
  if (v20 != 0.0)
  {
    confidence = self->_confidence;
    goto LABEL_37;
  }
  v22 = 0;
LABEL_38:
  finerGranularityMapItemConfidence = self->_finerGranularityMapItemConfidence;
  if (finerGranularityMapItemConfidence != 0.0)
  {
LABEL_41:
    objc_msgSend(v8, "finerGranularityMapItemConfidence");
    v26 = finerGranularityMapItemConfidence != v25;
    goto LABEL_42;
  }
  objc_msgSend(v8, "finerGranularityMapItemConfidence");
  if (v24 != 0.0)
  {
    finerGranularityMapItemConfidence = self->_finerGranularityMapItemConfidence;
    goto LABEL_41;
  }
  v26 = 0;
LABEL_42:
  preferredName = self->_preferredName;
  v28 = preferredName;
  if (preferredName)
    goto LABEL_45;
  objc_msgSend(v8, "preferredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v28 = self->_preferredName;
LABEL_45:
    objc_msgSend(v8, "preferredName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[NSString isEqualToString:](v28, "isEqualToString:", v29);

    if (preferredName)
      goto LABEL_54;
    goto LABEL_53;
  }
  v30 = 1;
LABEL_53:

LABEL_54:
  loiIdentifier = self->_loiIdentifier;
  v32 = loiIdentifier;
  if (!loiIdentifier)
  {
    objc_msgSend(v8, "loiIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v34 = 1;
LABEL_60:

      goto LABEL_61;
    }
    v32 = self->_loiIdentifier;
  }
  objc_msgSend(v8, "loiIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[NSUUID isEqual:](v32, "isEqual:", v33);

  if (!loiIdentifier)
    goto LABEL_60;
LABEL_61:

  return v30 & ~(v40 & v39 & v38 ^ 1 | (v37 || v36 || v18 || v22 || v26)) & v34;
}

- (BOOL)isEqual:(id)a3
{
  RTPlaceInference *v4;
  RTPlaceInference *v5;
  BOOL v6;

  v4 = (RTPlaceInference *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTPlaceInference isEqualToPlaceInference:](self, "isEqualToPlaceInference:", v5);

  return v6;
}

- (RTMapItem)finerGranularityMapItem
{
  return self->_finerGranularityMapItem;
}

- (double)finerGranularityMapItemConfidence
{
  return self->_finerGranularityMapItemConfidence;
}

@end
