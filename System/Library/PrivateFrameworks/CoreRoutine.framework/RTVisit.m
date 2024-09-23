@implementation RTVisit

- (NSDate)exit
{
  return self->_exit;
}

- (NSDate)entry
{
  return self->_entry;
}

- (RTLocation)location
{
  return self->_location;
}

- (int64_t)type
{
  return self->_type;
}

- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10
{
  return -[RTVisit initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:](self, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

+ (BOOL)validVisitSources:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v10) > 3)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (RTVisit)initWithDate:(id)a3 type:(int64_t)a4 location:(id)a5 entry:(id)a6 exit:(id)a7 dataPointCount:(int64_t)a8 confidence:(double)a9 placeInference:(id)a10 source:(int64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTVisit *v23;
  uint64_t v24;
  NSDate *date;
  uint64_t v26;
  RTLocation *location;
  uint64_t v28;
  NSDate *entry;
  uint64_t v30;
  NSDate *exit;
  RTVisit *v32;
  NSObject *v33;
  const char *v34;
  objc_super v36;
  uint8_t buf[16];

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: date";
LABEL_21:
    _os_log_error_impl(&dword_1A5E26000, v33, OS_LOG_TYPE_ERROR, v34, buf, 2u);
    goto LABEL_22;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: location";
    goto LABEL_21;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v34 = "Invalid parameter not satisfying: entry";
    goto LABEL_21;
  }
  if (v21 && (objc_msgSend(v20, "isOnOrBefore:", v21) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: !exit || [entry isOnOrBefore:exit]";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: confidence >= RTVisitConfidenceLow && confidence <= RTVisitConfidenceHigh";
      goto LABEL_21;
    }
LABEL_22:

    v32 = 0;
    goto LABEL_23;
  }
  v36.receiver = self;
  v36.super_class = (Class)RTVisit;
  v23 = -[RTVisit init](&v36, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v18, "copy");
    date = v23->_date;
    v23->_date = (NSDate *)v24;

    v23->_type = a4;
    v26 = objc_msgSend(v19, "copy");
    location = v23->_location;
    v23->_location = (RTLocation *)v26;

    v28 = objc_msgSend(v20, "copy");
    entry = v23->_entry;
    v23->_entry = (NSDate *)v28;

    v30 = objc_msgSend(v21, "copy");
    exit = v23->_exit;
    v23->_exit = (NSDate *)v30;

    v23->_dataPointCount = a8;
    v23->_confidence = a9;
    objc_storeStrong((id *)&v23->_placeInference, a10);
    v23->_source = a11;
  }
  self = v23;
  v32 = self;
LABEL_23:

  return v32;
}

+ (id)stringFromVisitIncidentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("RTVisitTypeUnknown");
  else
    return off_1E4FB09E0[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInference, 0);
  objc_storeStrong((id *)&self->_exit, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (RTVisit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDate_type_location_entry_exit_dataPointCount_confidence_placeInference_source_);
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
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[RTVisit date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTVisit stringFromVisitIncidentType:](RTVisit, "stringFromVisitIncidentType:", -[RTVisit type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisit location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisit entry](self, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisit exit](self, "exit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTVisit dataPointCount](self, "dataPointCount");
  -[RTVisit confidence](self, "confidence");
  v12 = v11;
  -[RTVisit placeInference](self, "placeInference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("date, %@, type, %@, location, %@, entry, %@, exit, %@, dataPointCount, %lu, confidence, %.2f, placeInference, %@, source, %lu"), v3, v4, v5, v7, v9, v10, v12, v13, -[RTVisit source](self, "source"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (int64_t)visitIncidentTypeFromString:(id)a3
{
  id v3;
  NSObject *v4;
  int64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[RTVisit visitIncidentTypeFromString:]";
      v10 = 1024;
      LODWORD(v11) = 126;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: typeString (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTVisitTypeUnknown")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTVisitTypeEntry")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_13;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTVisitTypeEntryResume")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_13;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTVisitTypeExit")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_13;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412802;
      v9 = (const char *)v3;
      v10 = 2080;
      v11 = "+[RTVisit visitIncidentTypeFromString:]";
      v12 = 1024;
      v13 = 136;
      _os_log_error_impl(&dword_1A5E26000, v7, OS_LOG_TYPE_ERROR, "Invalid type string, %@. (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }

  }
  v5 = 0;
LABEL_13:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entry, CFSTR("entry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exit, CFSTR("exit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dataPointCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("dataPointCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("confidence"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_placeInference, CFSTR("placeInference"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("source"));

}

- (RTVisit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  RTVisit *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  self->_type = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataPointCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (double)objc_msgSend(v13, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeInference"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntValue");
  v18 = -[RTVisit initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:](self, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v5, v7, v8, v9, v10, v12, v14, v15, v17);

  return v18;
}

- (BOOL)isEqualToVisit:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  NSDate *date;
  NSDate *v11;
  void *v12;
  RTLocation *location;
  RTLocation *v14;
  NSDate *entry;
  NSDate *v16;
  char v17;
  NSDate *exit;
  NSDate *v19;
  char v20;
  int64_t dataPointCount;
  uint64_t v22;
  double confidence;
  double v24;
  double v25;
  RTPlaceInference *placeInference;
  RTPlaceInference *v27;
  void *v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v34;
  uint64_t v35;
  int64_t type;
  char v37;

  v8 = a3;
  v9 = v8;
  date = self->_date;
  v11 = date;
  if (date)
  {
LABEL_4:
    objc_msgSend(v9, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[NSDate isEqualToDate:](v11, "isEqualToDate:", v12);

    if (date)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v8, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = self->_date;
    goto LABEL_4;
  }
  v37 = 1;
LABEL_7:

LABEL_8:
  type = self->_type;
  v35 = objc_msgSend(v9, "type");
  location = self->_location;
  v14 = location;
  if (location)
    goto LABEL_11;
  objc_msgSend(v9, "location");
  date = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (date)
  {
    v14 = self->_location;
LABEL_11:
    objc_msgSend(v9, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[RTLocation isEqualToLocation:](v14, "isEqualToLocation:", v4);

    if (location)
      goto LABEL_15;
    goto LABEL_14;
  }
  v34 = 1;
LABEL_14:

LABEL_15:
  entry = self->_entry;
  v16 = entry;
  if (entry)
    goto LABEL_18;
  objc_msgSend(v9, "entry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = self->_entry;
LABEL_18:
    objc_msgSend(v9, "entry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSDate isEqualToDate:](v16, "isEqualToDate:", v5);

    if (entry)
      goto LABEL_22;
    goto LABEL_21;
  }
  v17 = 1;
LABEL_21:

LABEL_22:
  exit = self->_exit;
  v19 = exit;
  if (exit)
    goto LABEL_25;
  objc_msgSend(v9, "exit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v19 = self->_exit;
LABEL_25:
    objc_msgSend(v9, "exit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NSDate isEqualToDate:](v19, "isEqualToDate:", v6);

    if (exit)
      goto LABEL_29;
    goto LABEL_28;
  }
  v20 = 1;
LABEL_28:

LABEL_29:
  dataPointCount = self->_dataPointCount;
  v22 = objc_msgSend(v9, "dataPointCount");
  confidence = self->_confidence;
  objc_msgSend(v9, "confidence");
  v25 = v24;
  placeInference = self->_placeInference;
  v27 = placeInference;
  if (placeInference)
    goto LABEL_32;
  objc_msgSend(v9, "placeInference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v27 = self->_placeInference;
LABEL_32:
    objc_msgSend(v9, "placeInference");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[RTPlaceInference isEqual:](v27, "isEqual:", v28);

    if (placeInference)
      goto LABEL_36;
    goto LABEL_35;
  }
  v29 = 1;
LABEL_35:

LABEL_36:
  v30 = v37;
  if (type != v35)
    v30 = 0;
  v31 = v30 & v34 & v17 & v20;
  if (dataPointCount != v22)
    v31 = 0;
  if (confidence != v25)
    v31 = 0;
  v32 = v31 & v29;

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  RTVisit *v4;
  RTVisit *v5;
  BOOL v6;

  v4 = (RTVisit *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTVisit isEqualToVisit:](self, "isEqualToVisit:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  v3 = -[NSDate hash](self->_date, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[RTLocation hash](self->_location, "hash");
  v7 = v5 ^ v6 ^ -[NSDate hash](self->_entry, "hash");
  v8 = -[NSDate hash](self->_exit, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dataPointCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v10 ^ v12 ^ -[RTPlaceInference hash](self->_placeInference, "hash");

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)source
{
  return self->_source;
}

- (RTPlaceInference)placeInference
{
  return self->_placeInference;
}

- (void)setPlaceInference:(id)a3
{
  objc_storeStrong((id *)&self->_placeInference, a3);
}

- (int64_t)dataPointCount
{
  return self->_dataPointCount;
}

@end
