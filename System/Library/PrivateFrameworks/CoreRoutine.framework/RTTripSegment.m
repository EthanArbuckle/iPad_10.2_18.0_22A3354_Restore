@implementation RTTripSegment

- (RTTripSegment)initWithTripSegmentIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7
{
  id v13;
  id v14;
  RTTripSegment *v15;
  RTTripSegment *v16;
  RTTripSegment *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  if (v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)RTTripSegment;
    v15 = -[RTTripSegment init](&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_identifier, a3);
      objc_storeStrong((id *)&v16->_dateInterval, a4);
      v16->_tripDistance = a5;
      v16->_tripDistanceUncertainty = a6;
      v16->_modeOfTransportation = a7;
    }
    self = v16;
    v17 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

+ (id)mergeTripSegment:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
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
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  RTTripSegment *v47;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tripDistance");
  v8 = v7;
  objc_msgSend(v6, "tripDistance");
  if (v8 <= v9)
    v10 = v6;
  else
    v10 = v5;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "earlierDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "laterDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v21);
  objc_msgSend(v5, "tripDistance");
  v24 = v23;
  objc_msgSend(v6, "tripDistance");
  if (v24 <= v25)
    v26 = v6;
  else
    v26 = v5;
  v27 = objc_msgSend(v26, "modeOfTransportation");
  objc_msgSend(v5, "tripDistance");
  v29 = v28;
  objc_msgSend(v5, "tripDistanceUncertainty");
  v31 = v29 * v30;
  objc_msgSend(v5, "tripDistanceUncertainty");
  v33 = v32;
  objc_msgSend(v6, "tripDistance");
  v35 = v34;
  objc_msgSend(v6, "tripDistanceUncertainty");
  v37 = v35 * v36;
  objc_msgSend(v6, "tripDistanceUncertainty");
  v39 = v37 * v38 + v31 * v33;
  objc_msgSend(v5, "tripDistance");
  v41 = v40;
  objc_msgSend(v6, "tripDistance");
  v43 = sqrt(v39 / (v41 + v42));
  objc_msgSend(v5, "tripDistance");
  v45 = v44;
  objc_msgSend(v6, "tripDistance");
  v47 = -[RTTripSegment initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:]([RTTripSegment alloc], "initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:", v11, v22, v27, v45 + v46, v43);

  return v47;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("tripSegmentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tripDistance"), self->_tripDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tripDistanceUncertainty"), self->_tripDistanceUncertainty);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_modeOfTransportation, CFSTR("modeOfTransportation"));

}

- (RTTripSegment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  RTTripSegment *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripSegmentIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tripDistance"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tripDistanceUncertainty"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modeOfTransportation"));

  v12 = -[RTTripSegment initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:](self, "initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:", v5, v6, v11, v8, v10);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSUUID *identifier;
  void *v7;
  NSDateInterval *dateInterval;
  void *v9;
  double tripDistance;
  double v11;
  double v12;
  double tripDistanceUncertainty;
  double v14;
  double v15;
  int64_t modeOfTransportation;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSUUID isEqual:](identifier, "isEqual:", v7);

  dateInterval = self->_dateInterval;
  objc_msgSend(v4, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(dateInterval) = -[NSDateInterval isEqual:](dateInterval, "isEqual:", v9);

  tripDistance = self->_tripDistance;
  objc_msgSend(v4, "tripDistance");
  v12 = v11;
  tripDistanceUncertainty = self->_tripDistanceUncertainty;
  objc_msgSend(v4, "tripDistanceUncertainty");
  v15 = v14;
  modeOfTransportation = self->_modeOfTransportation;
  v17 = objc_msgSend(v4, "modeOfTransportation");

  v18 = v5 & identifier & dateInterval;
  if (tripDistance != v12)
    v18 = 0;
  if (tripDistanceUncertainty != v15)
    v18 = 0;
  if (modeOfTransportation == v17)
    return v18;
  else
    return 0;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  -[NSDateInterval description](self->_dateInterval, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UUID,%s,dateInterval,%@,tripDistance,%.1f,tripDistanceUncertainty,%.1f,modeOfTransportation,%llu"), v5, v6, *(_QWORD *)&self->_tripDistance, *(_QWORD *)&self->_tripDistanceUncertainty, self->_modeOfTransportation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)tripDistance
{
  return self->_tripDistance;
}

- (double)tripDistanceUncertainty
{
  return self->_tripDistanceUncertainty;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
