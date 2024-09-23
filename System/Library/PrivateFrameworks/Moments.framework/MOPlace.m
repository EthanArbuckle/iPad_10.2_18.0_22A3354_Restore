@implementation MOPlace

- (MOPlace)initWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  MOPlace *v8;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOPlace initWithIdentifier:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPlace.m"), 23, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOPlace initWithIdentifier:]", 23);

  }
  v8 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v5, &stru_1E854A388, &stru_1E854A388, 0, 0, 0, -1.0, -1.0, 0.0, -1.0, 0, &stru_1E854A388, 0, 0);

  return v8;
}

- (MOPlace)initWithPlaceName:(id)a3 enclosingArea:(id)a4 placeType:(unint64_t)a5 placeUserType:(unint64_t)a6 location:(id)a7 locationMode:(unint64_t)a8 poiCategory:(id)a9 distanceToHomeInMiles:(double)a10 placeNameConfidence:(double)a11 familiarityIndexLOI:(double)a12 startDate:(id)a13 endDate:(id)a14
{
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  MOPlace *v31;

  v23 = (void *)MEMORY[0x1E0CB3A28];
  v24 = a14;
  v25 = a13;
  v26 = a9;
  v27 = a7;
  v28 = a4;
  v29 = a3;
  objc_msgSend(v23, "UUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v30, v29, v28, a5, a6, v27, a10, a11, a12, -1.0, a8, v26, v25, v24);

  return v31;
}

- (MOPlace)initWithPlaceName:(id)a3 placeType:(unint64_t)a4 placeUserType:(unint64_t)a5 location:(id)a6 locationMode:(unint64_t)a7 poiCategory:(id)a8 distanceToHomeInMiles:(double)a9 placeNameConfidence:(double)a10 familiarityIndexLOI:(double)a11
{
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MOPlace *v25;

  v20 = (void *)MEMORY[0x1E0CB3A28];
  v21 = a8;
  v22 = a6;
  v23 = a3;
  objc_msgSend(v20, "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v24, v23, &stru_1E854A388, a4, a5, v22, a9, a10, a11, -1.0, a7, v21, 0, 0);

  return v25;
}

- (MOPlace)initWithIdentifier:(id)a3 placeName:(id)a4 enclosingArea:(id)a5 placeType:(unint64_t)a6 placeUserType:(unint64_t)a7 location:(id)a8 locationMode:(unint64_t)a9 poiCategory:(id)a10 distanceToHomeInMiles:(double)a11 placeNameConfidence:(double)a12 familiarityIndexLOI:(double)a13 priorityScore:(double)a14 startDate:(id)a15 endDate:(id)a16
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  MOPlace *v30;
  MOPlace *v31;
  id obj;
  id v36;
  id v37;
  objc_super v38;

  v25 = a3;
  v26 = a4;
  obj = a5;
  v27 = a5;
  v37 = a8;
  v36 = a10;
  v28 = a15;
  v29 = a16;
  v38.receiver = self;
  v38.super_class = (Class)MOPlace;
  v30 = -[MOPlace init](&v38, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_identifier, a3);
    v31->_placeUserType = a7;
    v31->_placeType = a6;
    objc_storeStrong((id *)&v31->_placeName, a4);
    objc_storeStrong((id *)&v31->_enclosingArea, obj);
    objc_storeStrong((id *)&v31->_location, a8);
    v31->_locationMode = a9;
    objc_storeStrong((id *)&v31->_poiCategory, a10);
    v31->_proposition = 0;
    v31->_familiarityIndexLOI = a13;
    v31->_distanceToHomeInMiles = a11;
    v31->_placeNameConfidence = a12;
    v31->_priorityScore = a14;
    objc_storeStrong((id *)&v31->_startDate, a15);
    objc_storeStrong((id *)&v31->_endDate, a16);
    v31->_sourceEventAccessType = 5;
  }

  return v31;
}

- (id)promptDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[MOPlace placeName](self, "placeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[MOPlace proposition](self, "proposition");
    v5 = CFSTR("at");
    if (v4 == 2)
      v5 = CFSTR("on");
    if (v4 == 3)
      v6 = CFSTR("in");
    else
      v6 = v5;
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MOPlace placeName](self, "placeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E854A388;
  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOPlace identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPlace placeName](self, "placeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPlace placeNameConfidence](self, "placeNameConfidence");
  v8 = v7;
  v9 = -[MOPlace placeType](self, "placeType");
  v10 = -[MOPlace placeUserType](self, "placeUserType");
  v11 = -[MOPlace proposition](self, "proposition");
  v12 = -[MOPlace locationMode](self, "locationMode");
  -[MOPlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
  v14 = v13;
  -[MOPlace poiCategory](self, "poiCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPlace familiarityIndexLOI](self, "familiarityIndexLOI");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOPlace identifier, %@, name, %@, confidence, %f, placeType, %lu, placeUserType, %lu, preposition, %lu, locationMode, %lu, distanceToHomeInMiles, %f, poiCategory, %@, familiarityIndexLOI, %f>"), v4, v6, v8, v9, v10, v11, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOPlace)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  uint64_t v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  MOPlace *v21;
  MOPlace *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enclosingArea"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("placeType"));
  v26 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("placeUserType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("proposition"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("placeNameConfidence"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("locationMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poiCategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distanceToHomeInMiles"));
  v13 = v12;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("familiarityIndexLOI"));
  v15 = v14;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("priorityScore"));
  v17 = v16;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v5;
  v21 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](self, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v5, v6, v28, v27, v26, v7, v13, v9, v15, v17, v10, v11, v18, v19);
  v22 = v21;
  if (v21)
  {
    -[MOPlace setProposition:](v21, "setProposition:", v25);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEventIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOPlace setSourceEventIdentifier:](v22, "setSourceEventIdentifier:", v23);

    -[MOPlace setSourceEventAccessType:](v22, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  double priorityScore;
  double distanceToHomeInMiles;
  double placeNameConfidence;
  double familiarityIndexLOI;
  id v9;

  identifier = self->_identifier;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_placeName, CFSTR("placeName"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_placeType, CFSTR("placeType"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_placeUserType, CFSTR("placeUserType"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_proposition, CFSTR("proposition"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_locationMode, CFSTR("locationMode"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_poiCategory, CFSTR("poiCategory"));
  priorityScore = self->_priorityScore;
  *(float *)&priorityScore = priorityScore;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("priorityScore"), priorityScore);
  distanceToHomeInMiles = self->_distanceToHomeInMiles;
  *(float *)&distanceToHomeInMiles = distanceToHomeInMiles;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("distanceToHomeInMiles"), distanceToHomeInMiles);
  placeNameConfidence = self->_placeNameConfidence;
  *(float *)&placeNameConfidence = placeNameConfidence;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("placeNameConfidence"), placeNameConfidence);
  familiarityIndexLOI = self->_familiarityIndexLOI;
  *(float *)&familiarityIndexLOI = familiarityIndexLOI;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("familiarityIndexLOI"), familiarityIndexLOI);
  objc_msgSend(v9, "encodeObject:forKey:", self->_enclosingArea, CFSTR("enclosingArea"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOPlace identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOPlace *v5;
  MOPlace *v6;
  MOPlace *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOPlace *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOPlace identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 || (-[MOPlace identifier](v7, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOPlace identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOPlace identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
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

- (double)priorityScore
{
  return self->_priorityScore;
}

- (void)setPriorityScore:(double)a3
{
  self->_priorityScore = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (unint64_t)proposition
{
  return self->_proposition;
}

- (void)setProposition:(unint64_t)a3
{
  self->_proposition = a3;
}

- (unint64_t)locationMode
{
  return self->_locationMode;
}

- (void)setLocationMode:(unint64_t)a3
{
  self->_locationMode = a3;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_familiarityIndexLOI = a3;
}

- (double)distanceToHomeInMiles
{
  return self->_distanceToHomeInMiles;
}

- (void)setDistanceToHomeInMiles:(double)a3
{
  self->_distanceToHomeInMiles = a3;
}

- (NSString)enclosingArea
{
  return self->_enclosingArea;
}

- (void)setEnclosingArea:(id)a3
{
  objc_storeStrong((id *)&self->_enclosingArea, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_enclosingArea, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOPlace initWithIdentifier:]";
  v3 = 1024;
  v4 = 23;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
