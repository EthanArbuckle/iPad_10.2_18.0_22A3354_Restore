@implementation RTFamiliarityIndexOptions

- (RTFamiliarityIndexOptions)init
{
  return -[RTFamiliarityIndexOptions initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:](self, "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:", 0, 0, 0, 0, 4838400.0, 0.0);
}

- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 spatialGranularity:(unint64_t)a4
{
  id v6;
  RTFamiliarityIndexOptions *v7;
  RTFamiliarityIndexOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  RTLocation *referenceLocation;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTFamiliarityIndexOptions;
  v7 = -[RTFamiliarityIndexOptions init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v7->_lookbackInterval = 4838400.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v9);
      v8->_lookbackInterval = v12 + 604800.0;

    }
    objc_storeStrong((id *)&v8->_dateInterval, v6);
    referenceLocation = v8->_referenceLocation;
    v8->_spatialGranularity = a4;
    v8->_referenceLocation = 0;

    v8->_referenceLocationSummary = 0;
    v8->_distance = 0.0;
  }

  return v8;
}

- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 lookbackInterval:(double)a4 spatialGranularity:(unint64_t)a5 referenceLocation:(id)a6 referenceLocationSummary:(BOOL)a7 distance:(double)a8
{
  id v14;
  id v15;
  RTFamiliarityIndexOptions *v16;
  RTFamiliarityIndexOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v23;

  v14 = a3;
  v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RTFamiliarityIndexOptions;
  v16 = -[RTFamiliarityIndexOptions init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    if (v14)
    {
      v16->_lookbackInterval = a4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v18, v19);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v18);
      v17->_lookbackInterval = v21 + 604800.0;

    }
    objc_storeStrong((id *)&v17->_dateInterval, v14);
    v17->_spatialGranularity = a5;
    objc_storeStrong((id *)&v17->_referenceLocation, a6);
    v17->_referenceLocationSummary = a7;
    v17->_distance = a8;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTFamiliarityIndexOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  RTFamiliarityIndexOptions *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lookbackInterval"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("spatialGranularity"));
  v9 = (unint64_t)v8;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("referenceLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("referenceLocationSummary"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("distance"));
  v13 = v12;

  v14 = -[RTFamiliarityIndexOptions initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:](self, "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:", v5, v9, v10, v11, v7, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lookbackInterval"), self->_lookbackInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("spatialGranularity"), (double)self->_spatialGranularity);
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceLocation, CFSTR("referenceLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_referenceLocationSummary, CFSTR("referenceLocationSummary"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("distance"), self->_distance);

}

- (BOOL)isEqual:(id)a3
{
  RTFamiliarityIndexOptions *v4;
  RTFamiliarityIndexOptions *v5;
  RTFamiliarityIndexOptions *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  double v18;
  double v19;
  double v20;

  v4 = (RTFamiliarityIndexOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[RTFamiliarityIndexOptions dateInterval](self, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTFamiliarityIndexOptions dateInterval](v6, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDateInterval:", v8)
      && (-[RTFamiliarityIndexOptions lookbackInterval](self, "lookbackInterval"),
          v10 = v9,
          -[RTFamiliarityIndexOptions lookbackInterval](v6, "lookbackInterval"),
          v10 == v11)
      && (v12 = -[RTFamiliarityIndexOptions spatialGranularity](self, "spatialGranularity"),
          v12 == -[RTFamiliarityIndexOptions spatialGranularity](v6, "spatialGranularity")))
    {
      -[RTFamiliarityIndexOptions referenceLocation](self, "referenceLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFamiliarityIndexOptions referenceLocation](v6, "referenceLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14
        && (v15 = -[RTFamiliarityIndexOptions referenceLocationSummary](self, "referenceLocationSummary"),
            v15 == -[RTFamiliarityIndexOptions referenceLocationSummary](v6, "referenceLocationSummary")))
      {
        -[RTFamiliarityIndexOptions distance](self, "distance");
        v19 = v18;
        -[RTFamiliarityIndexOptions distance](v6, "distance");
        v16 = v19 == v20;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RTFamiliarityIndexOptions initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:]([RTFamiliarityIndexOptions alloc], "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:", self->_dateInterval, self->_spatialGranularity, self->_referenceLocation, self->_referenceLocationSummary, self->_lookbackInterval, self->_distance);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTFamiliarityIndexOptions dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTFamiliarityIndexOptions lookbackInterval](self, "lookbackInterval");
  v6 = v5;
  v7 = -[RTFamiliarityIndexOptions spatialGranularity](self, "spatialGranularity");
  -[RTFamiliarityIndexOptions referenceLocation](self, "referenceLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RTFamiliarityIndexOptions referenceLocationSummary](self, "referenceLocationSummary");
  -[RTFamiliarityIndexOptions distance](self, "distance");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval, %@, lookbackInterval, %.2f, spatialGranularity, %lu, referenceLocation, %@, referenceLocationSummary, %d, distance, %.2f"), v4, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)lookbackInterval
{
  return self->_lookbackInterval;
}

- (unint64_t)spatialGranularity
{
  return self->_spatialGranularity;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)referenceLocationSummary
{
  return self->_referenceLocationSummary;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
