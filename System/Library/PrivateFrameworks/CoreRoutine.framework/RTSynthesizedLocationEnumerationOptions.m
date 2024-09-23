@implementation RTSynthesizedLocationEnumerationOptions

- (RTSynthesizedLocationEnumerationOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTSynthesizedLocationEnumerationOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTSynthesizedLocationEnumerationOptions initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:](self, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v6, 0, 0, 0);
  return v7;
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3
{
  return -[RTSynthesizedLocationEnumerationOptions initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:](self, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", a3, 0, 0, 0);
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4
{
  return -[RTSynthesizedLocationEnumerationOptions initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:](self, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", a3, a4, 0, 0);
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5
{
  return -[RTSynthesizedLocationEnumerationOptions initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:](self, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", a3, a4, a5, 0);
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6
{
  uint64_t v6;
  void *v7;
  id v12;
  id v13;
  void *v14;
  double v15;
  RTSynthesizedLocationEnumerationOptions *v16;
  void *v17;
  NSObject *v18;
  RTSynthesizedLocationEnumerationOptions *v19;
  id v20;
  uint64_t v21;
  CLLocation *boundingBoxLocation;
  objc_super v24;
  uint8_t buf[16];

  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "horizontalAccuracy"), v15 <= 0.0))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxLocation.horizontalAccuracy > 0", buf, 2u);
    }

    v19 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)RTSynthesizedLocationEnumerationOptions;
    v16 = -[RTSynthesizedLocationEnumerationOptions init](&v24, sel_init);
    if (v16)
    {
      if (v12)
      {
        v17 = (void *)objc_msgSend(v12, "copy");
      }
      else
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v6, v7);
      }
      objc_storeStrong((id *)&v16->_dateInterval, v17);
      if (!v12)
      {

        v17 = (void *)v6;
      }

      v16->_preferredDownsamplingLevel = a4;
      v16->_batchSize = a5;
      v21 = objc_msgSend(v14, "copy");
      boundingBoxLocation = v16->_boundingBoxLocation;
      v16->_boundingBoxLocation = (CLLocation *)v21;

    }
    self = v16;
    v19 = self;
  }

  return v19;
}

+ (int64_t)NextLessDecimatedDownsamplingPreference:(int64_t)a3
{
  return a3 == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTSynthesizedLocationEnumerationOptions dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTSynthesizedLocationEnumerationOptions preferredDownsamplingLevel](self, "preferredDownsamplingLevel");
  v7 = -[RTSynthesizedLocationEnumerationOptions batchSize](self, "batchSize");
  -[RTSynthesizedLocationEnumerationOptions boundingBoxLocation](self, "boundingBoxLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v5, v6, v7, v8);

  return v9;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredDownsamplingLevel, CFSTR("preferredDownsamplingLevel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boundingBoxLocation, CFSTR("boundingBoxLocation"));

}

- (RTSynthesizedLocationEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  RTSynthesizedLocationEnumerationOptions *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredDownsamplingLevel"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundingBoxLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[RTSynthesizedLocationEnumerationOptions initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:](self, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTSynthesizedLocationEnumerationOptions *v4;
  RTSynthesizedLocationEnumerationOptions *v5;
  BOOL v6;

  v4 = (RTSynthesizedLocationEnumerationOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTSynthesizedLocationEnumerationOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSDateInterval *dateInterval;
  NSDateInterval *v8;
  void *v9;
  int64_t preferredDownsamplingLevel;
  uint64_t v11;
  unint64_t batchSize;
  uint64_t v13;
  CLLocation *boundingBoxLocation;
  CLLocation *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  char v21;

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    objc_msgSend(v6, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NSDateInterval isEqual:](v8, "isEqual:", v9);

    if (dateInterval)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v5, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_dateInterval;
    goto LABEL_4;
  }
  v21 = 1;
LABEL_7:

LABEL_8:
  preferredDownsamplingLevel = self->_preferredDownsamplingLevel;
  v11 = objc_msgSend(v6, "preferredDownsamplingLevel");
  batchSize = self->_batchSize;
  v13 = objc_msgSend(v6, "batchSize");
  boundingBoxLocation = self->_boundingBoxLocation;
  v15 = boundingBoxLocation;
  if (boundingBoxLocation)
    goto LABEL_11;
  objc_msgSend(v6, "boundingBoxLocation");
  dateInterval = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  if (dateInterval)
  {
    v15 = self->_boundingBoxLocation;
LABEL_11:
    objc_msgSend(v6, "boundingBoxLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CLLocation isEqual:](v15, "isEqual:", v16);

    if (boundingBoxLocation)
      goto LABEL_15;
    goto LABEL_14;
  }
  v17 = 1;
LABEL_14:

LABEL_15:
  v18 = v21;
  if (preferredDownsamplingLevel != v11)
    v18 = 0;
  if (batchSize != v13)
    v18 = 0;
  v19 = v18 & v17;

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredDownsamplingLevel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[CLLocation hash](self->_boundingBoxLocation, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start date, %@, end date, %@, horizontal accuracy, %lu, batchSize, %lu, boundingBoxLocation, %@"), v5, v7, self->_preferredDownsamplingLevel, self->_batchSize, self->_boundingBoxLocation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)processingBlock
{
  return 0;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (CLLocation)boundingBoxLocation
{
  return self->_boundingBoxLocation;
}

- (void)setBoundingBoxLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)preferredDownsamplingLevel
{
  return self->_preferredDownsamplingLevel;
}

- (void)setPreferredDownsamplingLevel:(int64_t)a3
{
  self->_preferredDownsamplingLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
