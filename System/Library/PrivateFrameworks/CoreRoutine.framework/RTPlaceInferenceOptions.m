@implementation RTPlaceInferenceOptions

- (unint64_t)fidelityPolicy
{
  return self->_fidelityPolicy;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (RTLocation)location
{
  return self->_location;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

- (RTPlaceInferenceOptions)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  RTPlaceInferenceOptions *v23;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("policy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("locations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("accessPoints"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  LOBYTE(v20) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("useBackground"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v25) = (_BYTE)v20;
  v23 = -[RTPlaceInferenceOptions initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:](self, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", v5, v9, v13, v17, v18, v19, v16, v21, v25, v22);

  return v23;
}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 distance:(double)a6 location:(id)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10 useBackground:(BOOL)a11 clientIdentifier:(id)a12
{
  id v20;
  id v21;
  RTPlaceInferenceOptions *v22;
  RTPlaceInferenceOptions *v23;
  RTPlaceInferenceOptions *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[16];

  v30 = a4;
  v29 = a5;
  v28 = a7;
  v27 = a8;
  v20 = a9;
  v21 = a12;
  if (a3 >= 0x40)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTFidelityPolicyMaskValid(policy)", buf, 2u);
    }

    v24 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)RTPlaceInferenceOptions;
    v22 = -[RTPlaceInferenceOptions init](&v31, sel_init);
    v23 = v22;
    if (v22)
    {
      v22->_fidelityPolicy = a3;
      objc_storeStrong((id *)&v22->_locations, a4);
      objc_storeStrong((id *)&v23->_accessPoints, a5);
      v23->_distance = a6;
      objc_storeStrong((id *)&v23->_location, a7);
      objc_storeStrong((id *)&v23->_startDate, a8);
      objc_storeStrong((id *)&v23->_endDate, a9);
      v23->_limit = a10;
      v23->_useBackground = a11;
      objc_storeStrong((id *)&v23->_clientIdentifier, a12);
    }
    self = v23;
    v24 = self;
  }

  return v24;
}

- (BOOL)useBackground
{
  return self->_useBackground;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)limit
{
  return self->_limit;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t fidelityPolicy;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  fidelityPolicy = self->_fidelityPolicy;
  v9 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", fidelityPolicy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("policy"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_locations, CFSTR("locations"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_accessPoints, CFSTR("accessPoints"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distance);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("distance"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_limit);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("limit"));

  objc_msgSend(v9, "encodeBool:forKey:", self->_useBackground, CFSTR("useBackground"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));

}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 clientIdentifier:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[RTPlaceInferenceOptions initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:](self, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", a3, a4, a5, 0, 0, 0, 0.0, -1, v7, a6);
}

- (RTPlaceInferenceOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFidelityPolicy_locations_accessPoints_distance_location_startDate_endDate_limit_useBackground_clientIdentifier_);
}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 1;
  return -[RTPlaceInferenceOptions initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:](self, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", a3, a4, a5, 0, 0, 0, 0.0, -1, v6, 0);
}

- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  return -[RTPlaceInferenceOptions initWithinDistance:location:startDate:endDate:clientIdentifier:](self, "initWithinDistance:location:startDate:endDate:clientIdentifier:", a4, a5, a6, 0, a3);
}

- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 clientIdentifier:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[RTPlaceInferenceOptions initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:](self, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", 4, 0, 0, a4, a5, a6, a3, -1, v8, a7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fidelityPolicyMaskToString:(unint64_t)a3
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
    v7 = CFSTR("Local");
LABEL_16:
    objc_msgSend(v6, "addObject:", v7);
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("Network"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v6, "addObject:", CFSTR("High Fidelity Location"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v6, "addObject:", CFSTR("Fallback"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
LABEL_14:
    objc_msgSend(v6, "addObject:", CFSTR("Skip Labelling"));
    if ((a3 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(v6, "addObject:", CFSTR("Best Reference Location"));
  if ((a3 & 0x10) != 0)
    goto LABEL_14;
LABEL_7:
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    v7 = CFSTR("Blue POI Only");
    goto LABEL_16;
  }
LABEL_17:
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
      v17 = "+[RTPlaceInferenceOptions fidelityPolicyMaskToString:]";
      v18 = 1024;
      v19 = 232;
      _os_log_error_impl(&dword_1A5E26000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTFidelityPolicyMask, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);

    }
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" + "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E4FB1A18;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  NSUInteger v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  RTLocation *location;
  double distance;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "fidelityPolicyMaskToString:", self->_fidelityPolicy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray count](self->_locations, "count");
  -[NSArray lastObject](self->_locations, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSArray count](self->_accessPoints, "count");
  -[NSArray lastObject](self->_accessPoints, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  distance = self->_distance;
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_endDate, "stringFromDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (self->_useBackground)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("fidelityPolicy, %@, locations count, %lu, last location, %@, accessPoints count, %lu, last accessPoint, %@, location, %@, distance, %f, startDate, %@, endDate, %@, limit, %ld, useBackground, %@, clientIdentifier, %@"), v4, v5, v6, v7, v8, location, *(_QWORD *)&distance, v11, v12, self->_limit, v14, self->_clientIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
