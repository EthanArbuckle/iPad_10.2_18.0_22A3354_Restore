@implementation RTTripSegmentFormOfWay

- (RTTripSegmentFormOfWay)initWithDateInterval:(id)a3 distanceInterval:(id)a4 geoFormOfWay:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  RTTripSegmentFormOfWay *v12;
  RTTripSegmentFormOfWay *v13;
  NSObject *v14;
  RTTripSegmentFormOfWay *v15;
  NSObject *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  RTTripSegmentFormOfWay *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v15 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: dateInterval";
LABEL_14:
    _os_log_error_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: distanceInterval";
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)RTTripSegmentFormOfWay;
  v12 = -[RTTripSegmentFormOfWay init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateInterval, a3);
    objc_storeStrong((id *)&v13->_distanceInterval, a4);
    v13->_geoFormOfWay = a5;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_debug_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_DEBUG, "tripSegmentFormOfWay, %@", buf, 0xCu);
    }

  }
  self = v13;
  v15 = self;
LABEL_12:

  return v15;
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
  objc_msgSend(v5, "encodeInt64:forKey:", self->_geoFormOfWay, CFSTR("geoFormOfWay"));

}

- (RTTripSegmentFormOfWay)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  RTTripSegmentFormOfWay *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distanceInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("geoFormOfWay"));

  v8 = -[RTTripSegmentFormOfWay initWithDateInterval:distanceInterval:geoFormOfWay:](self, "initWithDateInterval:distanceInterval:geoFormOfWay:", v5, v6, v7);
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
  int64_t geoFormOfWay;
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

  geoFormOfWay = self->_geoFormOfWay;
  v13 = objc_msgSend(v4, "geoFormOfWay");

  if (geoFormOfWay == v13)
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval,%@,distanceInterval,%@,geoFormOfWay,%lu"), v4, v5, self->_geoFormOfWay);
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

- (int64_t)geoFormOfWay
{
  return self->_geoFormOfWay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceInterval, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
