@implementation RTPredictedLocationOfInterest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPredictedLocationOfInterest)initWithLocationOfInterest:(id)a3 confidence:(double)a4 nextEntryTime:(id)a5 modeOfTransportation:(int64_t)a6 sources:(id)a7
{
  id v13;
  id v14;
  id v15;
  RTPredictedLocationOfInterest *v16;
  RTPredictedLocationOfInterest *v17;
  RTPredictedLocationOfInterest *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[16];

  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTPredictedLocationOfInterest;
    v16 = -[RTPredictedLocationOfInterest init](&v21, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_locationOfInterest, a3);
      v17->_confidence = a4;
      objc_storeStrong((id *)&v17->_nextEntryTime, a5);
      v17->_modeOfTransportation = a6;
      objc_storeStrong((id *)&v17->_sources, a7);
    }
    self = v17;
    v18 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (RTPredictedLocationOfInterest)initWithCoder:(id)a3
{
  id v4;
  RTPredictedLocationOfInterest *v5;
  uint64_t v6;
  RTLocationOfInterest *locationOfInterest;
  double v8;
  uint64_t v9;
  NSDate *nextEntryTime;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *sources;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPredictedLocationOfInterest;
  v5 = -[RTPredictedLocationOfInterest init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationOfInterest"));
    v6 = objc_claimAutoreleasedReturnValue();
    locationOfInterest = v5->_locationOfInterest;
    v5->_locationOfInterest = (RTLocationOfInterest *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextEntryTime"));
    v9 = objc_claimAutoreleasedReturnValue();
    nextEntryTime = v5->_nextEntryTime;
    v5->_nextEntryTime = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeOfTransportation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modeOfTransportation = objc_msgSend(v11, "unsignedIntegerValue");

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sources"));
    v15 = objc_claimAutoreleasedReturnValue();
    sources = v5->_sources;
    v5->_sources = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  RTLocationOfInterest *locationOfInterest;
  void *v5;
  id v6;

  locationOfInterest = self->_locationOfInterest;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", locationOfInterest, CFSTR("locationOfInterest"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v6, "encodeObject:forKey:", self->_nextEntryTime, CFSTR("nextEntryTime"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_modeOfTransportation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("modeOfTransportation"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_sources, CFSTR("sources"));
}

- (void)setConfidence:(double)a3
{
  if (a3 <= 1.0)
  {
    if (a3 >= 0.0)
      self->_confidence = a3;
    else
      self->_confidence = 0.0;
  }
  else
  {
    self->_confidence = 1.0;
  }
}

- (RTSource)source
{
  return (RTSource *)-[NSArray firstObject](self->_sources, "firstObject");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  RTPredictedLocationOfInterest *v7;
  RTPredictedLocationOfInterest *v8;
  void *v9;
  int v10;
  char v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;

  v7 = (RTPredictedLocationOfInterest *)a3;
  if (v7 == self)
  {
    v11 = 1;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_24;
  }
  v8 = v7;
  -[RTPredictedLocationOfInterest locationOfInterest](self, "locationOfInterest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[RTPredictedLocationOfInterest locationOfInterest](v8, "locationOfInterest"),
        (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[RTPredictedLocationOfInterest locationOfInterest](self, "locationOfInterest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPredictedLocationOfInterest locationOfInterest](v8, "locationOfInterest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_21;
    }
    v10 = 1;
  }
  else
  {
    v31 = 0;
    v10 = 0;
  }
  -[RTPredictedLocationOfInterest confidence](self, "confidence");
  v13 = v12;
  -[RTPredictedLocationOfInterest confidence](v8, "confidence");
  if (v13 == v14)
  {
    -[RTPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[RTPredictedLocationOfInterest nextEntryTime](v8, "nextEntryTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v30 = v10;
        v29 = 0;
        v17 = 0;
LABEL_26:
        v19 = -[RTPredictedLocationOfInterest modeOfTransportation](self, "modeOfTransportation");
        if (v19 != -[RTPredictedLocationOfInterest modeOfTransportation](v8, "modeOfTransportation"))
        {
          v11 = 0;
          v23 = v30;
          if (!v17)
            goto LABEL_34;
          goto LABEL_33;
        }
        -[RTPredictedLocationOfInterest sources](self, "sources");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20
          || (-[RTPredictedLocationOfInterest sources](v8, "sources"), (v25 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v27 = v17;
          -[RTPredictedLocationOfInterest sources](self, "sources");
          v26 = (void *)v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPredictedLocationOfInterest sources](v8, "sources");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v21, "isEqualToArray:", v22);

          if (v26)
          {

            v23 = v30;
            if ((v27 & 1) == 0)
              goto LABEL_34;
            goto LABEL_33;
          }
          v23 = v30;
          LOBYTE(v17) = v27;
          v24 = (void *)v25;
        }
        else
        {
          v24 = 0;
          v11 = 1;
          v23 = v30;
        }

        if ((v17 & 1) == 0)
        {
LABEL_34:
          if (!v15)

          if (!v23)
            goto LABEL_21;
          goto LABEL_20;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    -[RTPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPredictedLocationOfInterest nextEntryTime](v8, "nextEntryTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToDate:", v5) & 1) != 0)
    {
      v28 = v16;
      v30 = v10;
      v17 = 1;
      goto LABEL_26;
    }

    if (v15)
    else

  }
  v11 = 0;
  if ((v10 & 1) != 0)
  {
LABEL_20:

  }
LABEL_21:
  if (!v9)

LABEL_24:
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  -[RTPredictedLocationOfInterest locationOfInterest](self, "locationOfInterest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTPredictedLocationOfInterest confidence](self, "confidence");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[RTPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ v4 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTPredictedLocationOfInterest modeOfTransportation](self, "modeOfTransportation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[RTPredictedLocationOfInterest sources](self, "sources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTPredictedLocationOfInterest locationOfInterest](self, "locationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPredictedLocationOfInterest confidence](self, "confidence");
  v6 = v5;
  -[RTPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTRoutineManager modeOfTransportationToString:](RTRoutineManager, "modeOfTransportationToString:", -[RTPredictedLocationOfInterest modeOfTransportation](self, "modeOfTransportation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPredictedLocationOfInterest sources](self, "sources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("loi, %@, prediction confidence, %f, next entry time, %@, mode of transportation, %@, sources, %@"), v4, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)nextEntryTime
{
  return self->_nextEntryTime;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void)setModeOfTransportation:(int64_t)a3
{
  self->_modeOfTransportation = a3;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_nextEntryTime, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
}

@end
