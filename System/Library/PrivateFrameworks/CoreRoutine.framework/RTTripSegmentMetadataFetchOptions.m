@implementation RTTripSegmentMetadataFetchOptions

- (RTTripSegmentMetadataFetchOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTripSegment_);
}

- (RTTripSegmentMetadataFetchOptions)initWithDateInterval:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  RTTripSegmentMetadataFetchOptions *v15;
  RTTripSegmentMetadataFetchOptions *v16;
  NSObject *v17;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTTripSegmentMetadataFetchOptions;
  v15 = -[RTTripSegmentMetadataFetchOptions init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dateInterval, a3);
    v16->_fetchRoadClass = v10;
    v16->_fetchFormOfWay = v9;
    v16->_fetchLocationType = v8;
    v16->_fetchPreferredNames = v7;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 1024;
      v31 = v10;
      v32 = 1024;
      v33 = v9;
      v34 = 1024;
      v35 = v8;
      v36 = 1024;
      v37 = v7;
      _os_log_debug_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_DEBUG, "%@ %@, dateInterval,%@,fetchRoadClass,%d,fetchFormOfWay,%d,fetchLocationType,%d,fetchPreferredNames,%d", buf, 0x38u);

    }
  }

  return v16;
}

- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v12;
  RTTripSegmentMetadataFetchOptions *v13;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RTTripSegmentMetadataFetchOptions initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:](self, "initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:", v12, v10, v9, v8, v7);

  return v13;
}

- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3
{
  void *v4;
  RTTripSegmentMetadataFetchOptions *v5;

  objc_msgSend(a3, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTTripSegmentMetadataFetchOptions initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:](self, "initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:", v4, 1, 1, 1, 1);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RTTripSegmentMetadataFetchOptions *v4;
  RTTripSegmentMetadataFetchOptions *v5;
  BOOL v6;

  v4 = (RTTripSegmentMetadataFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTTripSegmentMetadataFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSDateInterval *dateInterval;
  uint64_t v8;
  void *v9;
  NSDateInterval *v10;
  void *v11;
  char v12;
  int fetchRoadClass;
  int fetchFormOfWay;
  int fetchLocationType;
  int fetchPreferredNames;
  BOOL v17;
  BOOL v18;

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  if (!dateInterval)
  {
    objc_msgSend(v5, "dateInterval");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_dateInterval)
        goto LABEL_2;
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  objc_msgSend(v6, "dateInterval");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = self->_dateInterval;
    objc_msgSend(v6, "dateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSDateInterval isEqualToDateInterval:](v10, "isEqualToDateInterval:", v11);

    if (!dateInterval)
      goto LABEL_11;
  }
  else
  {
    v12 = 0;
    if (!dateInterval)
      goto LABEL_11;
  }
LABEL_12:
  fetchRoadClass = self->_fetchRoadClass;
  if (fetchRoadClass == objc_msgSend(v6, "fetchRoadClass")
    && (fetchFormOfWay = self->_fetchFormOfWay, fetchFormOfWay == objc_msgSend(v6, "fetchFormOfWay"))
    && (fetchLocationType = self->_fetchLocationType,
        fetchLocationType == objc_msgSend(v6, "fetchLocationType")))
  {
    fetchPreferredNames = self->_fetchPreferredNames;
    v17 = fetchPreferredNames == objc_msgSend(v6, "fetchPreferredNames");
  }
  else
  {
    v17 = 0;
  }
  v18 = v12 & v17;

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchRoadClass, CFSTR("fetchRoadClass"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchFormOfWay, CFSTR("fetchFormOfWay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchLocationType, CFSTR("fetchLocationType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchPreferredNames, CFSTR("fetchPreferredNames"));

}

- (RTTripSegmentMetadataFetchOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  RTTripSegmentMetadataFetchOptions *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchRoadClass"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchFormOfWay"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchLocationType"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchPreferredNames"));

  v10 = -[RTTripSegmentMetadataFetchOptions initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:](self, "initWithDateInterval:fetchRoadClass:fetchFormOfWay:fetchLocationType:fetchPreferredNames:", v5, v6, v7, v8, v9);
  return v10;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)fetchRoadClass
{
  return self->_fetchRoadClass;
}

- (BOOL)fetchFormOfWay
{
  return self->_fetchFormOfWay;
}

- (BOOL)fetchLocationType
{
  return self->_fetchLocationType;
}

- (BOOL)fetchPreferredNames
{
  return self->_fetchPreferredNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
