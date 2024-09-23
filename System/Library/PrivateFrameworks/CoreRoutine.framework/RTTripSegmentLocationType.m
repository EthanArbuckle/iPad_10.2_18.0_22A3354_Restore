@implementation RTTripSegmentLocationType

- (RTTripSegmentLocationType)initWithDateInterval:(id)a3 distanceInterval:(id)a4 locationType:(int64_t)a5
{
  id v9;
  id v10;
  RTTripSegmentLocationType *v11;
  RTTripSegmentLocationType *v12;
  NSObject *v13;
  RTTripSegmentLocationType *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  RTTripSegmentLocationType *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTTripSegmentLocationType;
    v11 = -[RTTripSegmentLocationType init](&v17, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dateInterval, a3);
      objc_storeStrong((id *)&v12->_distanceInterval, a4);
      v12->_locationType = a5;
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v12;
        _os_log_debug_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_DEBUG, "tripSegmentLocationType, %@", buf, 0xCu);
      }

    }
    self = v12;
    v14 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_distanceInterval, CFSTR("distanceInterval"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_locationType, CFSTR("locationType"));

}

- (RTTripSegmentLocationType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  RTTripSegmentLocationType *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distanceInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("locationType"));

  v8 = -[RTTripSegmentLocationType initWithDateInterval:distanceInterval:locationType:](self, "initWithDateInterval:distanceInterval:locationType:", v5, v6, v7);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSDateInterval *dateInterval;
  void *v7;
  char v8;
  RTDistanceInterval *distanceInterval;
  void *v10;
  _BOOL4 v11;
  int64_t locationType;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  dateInterval = self->_dateInterval;
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSDateInterval isEqual:](dateInterval, "isEqual:", v7);

  distanceInterval = self->_distanceInterval;
  objc_msgSend(v4, "distanceInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTDistanceInterval isEqual:](distanceInterval, "isEqual:", v10);

  locationType = self->_locationType;
  v13 = objc_msgSend(v4, "locationType");

  if (locationType == v13)
    v14 = v8;
  else
    v14 = 0;
  if (!v11)
    v14 = 0;
  return v5 && v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateInterval description](self->_dateInterval, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDistanceInterval description](self->_distanceInterval, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval,%@,distanceInterval,%@,locationType,%ld"), v4, v5, self->_locationType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (RTDistanceInterval)distanceInterval
{
  return self->_distanceInterval;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceInterval, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
