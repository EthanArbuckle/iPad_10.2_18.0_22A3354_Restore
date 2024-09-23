@implementation RTStoredLocationEnumerationOptions

- (RTStoredLocationEnumerationOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTStoredLocationEnumerationOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v6, 0, 0, 0.0);
  return v7;
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5
{
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:", a3, a5, 0, 14, 0, a4, 0.0);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 ascending:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = a6;
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", a3, a5, 0, 14, 0, 0, a4, 0.0, v7);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6
{
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:", a3, a5, a6, 14, 0, a4, 0.0);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7
{
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:", a3, a5, a6, *(_QWORD *)&a7, 0, a4, 0.0);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8
{
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:downsampleRequired:smoothingErrorThreshold:", a3, a5, a6, *(_QWORD *)&a7, a8, a4, 0.0);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8 smoothingErrorThreshold:(double)a9
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", a3, a5, a6, *(_QWORD *)&a7, 0, a8, a4, a9, v10);
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 smoothingRequired:(BOOL)a8 downsampleRequired:(BOOL)a9 smoothingErrorThreshold:(double)a10 ascending:(BOOL)a11
{
  void *v11;
  id v20;
  id v21;
  void *v22;
  double v23;
  RTStoredLocationEnumerationOptions *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  RTStoredLocationEnumerationOptions *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CLLocation *boundingBoxLocation;
  void *v36;
  objc_super v37;
  uint8_t buf[16];

  v20 = a3;
  v21 = a6;
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "horizontalAccuracy");
    if (v23 <= 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v27 = "Invalid parameter not satisfying: boundingBoxLocation.horizontalAccuracy > 0";
        goto LABEL_18;
      }
LABEL_10:

      v28 = 0;
      goto LABEL_16;
    }
  }
  if (a7 >= 0xF)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: type >= kCLLocationType_Unknown && type <= kCLLocationType_Max";
LABEL_18:
      _os_log_error_impl(&dword_1A5E26000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)RTStoredLocationEnumerationOptions;
  v24 = -[RTStoredLocationEnumerationOptions init](&v37, sel_init);
  if (v24)
  {
    if (v20)
    {
      v25 = (void *)objc_msgSend(v20, "copy");
    }
    else
    {
      v29 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v31 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v30;
      v32 = v30;
      v11 = (void *)v31;
      v25 = (void *)objc_msgSend(v29, "initWithStartDate:endDate:", v32, v31);
    }
    objc_storeStrong((id *)&v24->_dateInterval, v25);
    if (!v20)
    {

      v25 = v36;
    }

    v24->_horizontalAccuracy = a4;
    v24->_batchSize = a5;
    v33 = objc_msgSend(v22, "copy");
    boundingBoxLocation = v24->_boundingBoxLocation;
    v24->_boundingBoxLocation = (CLLocation *)v33;

    v24->_type = a7;
    v24->_smoothingRequired = a8;
    v24->_downsampleRequired = a9;
    v24->_smoothingErrorThreshold = a10;
    v24->_ascending = a11;
  }
  self = v24;
  v28 = self;
LABEL_16:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v17;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTStoredLocationEnumerationOptions dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStoredLocationEnumerationOptions horizontalAccuracy](self, "horizontalAccuracy");
  v7 = v6;
  v8 = -[RTStoredLocationEnumerationOptions batchSize](self, "batchSize");
  -[RTStoredLocationEnumerationOptions boundingBoxLocation](self, "boundingBoxLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTStoredLocationEnumerationOptions type](self, "type");
  v11 = -[RTStoredLocationEnumerationOptions smoothingRequired](self, "smoothingRequired");
  v12 = -[RTStoredLocationEnumerationOptions downsampleRequired](self, "downsampleRequired");
  -[RTStoredLocationEnumerationOptions smoothingErrorThreshold](self, "smoothingErrorThreshold");
  v14 = v13;
  LOBYTE(v17) = -[RTStoredLocationEnumerationOptions ascending](self, "ascending");
  v15 = (void *)objc_msgSend(v4, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", v5, v8, v9, v10, v11, v12, v7, v14, v17);

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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boundingBoxLocation, CFSTR("boundingBoxLocation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_smoothingRequired, CFSTR("smoothingRequired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_downsampleRequired, CFSTR("downsampleRequired"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("smoothingErrorThreshold"), self->_smoothingErrorThreshold);
  objc_msgSend(v5, "encodeBool:forKey:", self->_ascending, CFSTR("ascending"));

}

- (RTStoredLocationEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  char v15;
  RTStoredLocationEnumerationOptions *v16;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
  v7 = v6;
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundingBoxLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("smoothingRequired"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downsampleRequired"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("smoothingErrorThreshold"));
  v14 = v13;
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));

  LOBYTE(v18) = v15;
  v16 = -[RTStoredLocationEnumerationOptions initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:](self, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:smoothingRequired:downsampleRequired:smoothingErrorThreshold:ascending:", v5, v8, v9, v10, v11, v12, v7, v14, v18);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredLocationEnumerationOptions *v4;
  RTStoredLocationEnumerationOptions *v5;
  BOOL v6;

  v4 = (RTStoredLocationEnumerationOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTStoredLocationEnumerationOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

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
  double horizontalAccuracy;
  double v11;
  double v12;
  unint64_t batchSize;
  uint64_t v14;
  CLLocation *boundingBoxLocation;
  CLLocation *v16;
  void *v17;
  char v18;
  int smoothingRequired;
  int v20;
  int downsampleRequired;
  int v22;
  double smoothingErrorThreshold;
  double v24;
  double v25;
  int ascending;
  int v27;
  char v28;
  char v29;
  BOOL v30;
  char v32;

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    objc_msgSend(v6, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[NSDateInterval isEqual:](v8, "isEqual:", v9);

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
  v32 = 1;
LABEL_7:

LABEL_8:
  horizontalAccuracy = self->_horizontalAccuracy;
  objc_msgSend(v6, "horizontalAccuracy");
  v12 = v11;
  batchSize = self->_batchSize;
  v14 = objc_msgSend(v6, "batchSize");
  boundingBoxLocation = self->_boundingBoxLocation;
  v16 = boundingBoxLocation;
  if (boundingBoxLocation)
    goto LABEL_11;
  objc_msgSend(v6, "boundingBoxLocation");
  dateInterval = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  if (dateInterval)
  {
    v16 = self->_boundingBoxLocation;
LABEL_11:
    objc_msgSend(v6, "boundingBoxLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CLLocation isEqual:](v16, "isEqual:", v17);

    if (boundingBoxLocation)
      goto LABEL_15;
    goto LABEL_14;
  }
  v18 = 1;
LABEL_14:

LABEL_15:
  smoothingRequired = self->_smoothingRequired;
  v20 = objc_msgSend(v6, "smoothingRequired");
  downsampleRequired = self->_downsampleRequired;
  v22 = objc_msgSend(v6, "downsampleRequired");
  smoothingErrorThreshold = self->_smoothingErrorThreshold;
  objc_msgSend(v6, "smoothingErrorThreshold");
  v25 = v24;
  ascending = self->_ascending;
  v27 = objc_msgSend(v6, "ascending");
  v28 = v32;
  if (horizontalAccuracy != v12)
    v28 = 0;
  if (batchSize != v14)
    v28 = 0;
  v29 = v28 & v18;
  if (smoothingRequired != v20)
    v29 = 0;
  if (downsampleRequired != v22)
    v29 = 0;
  if (smoothingErrorThreshold != v25)
    v29 = 0;
  if (ascending == v27)
    v30 = v29;
  else
    v30 = 0;

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v19;

  v3 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_horizontalAccuracy);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v19, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ v6 ^ -[CLLocation hash](self->_boundingBoxLocation, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_smoothingRequired);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_downsampleRequired);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smoothingErrorThreshold);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("YES");
  if (self->_smoothingRequired)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_downsampleRequired)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!self->_ascending)
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start date, %@, end date, %@, horizontal accuracy, %lf, batchSize, %lu, boundingBoxLocation, %@, type, %lu, smoothingRequired, %@, downsampleRequired, %@, smoothingErrorThreshold, %lf, ascending, %@"), v5, v7, *(_QWORD *)&self->_horizontalAccuracy, self->_batchSize, self->_boundingBoxLocation, self->_type, v10, v11, *(_QWORD *)&self->_smoothingErrorThreshold, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)smoothingRequired
{
  return self->_smoothingRequired;
}

- (void)setSmoothingRequired:(BOOL)a3
{
  self->_smoothingRequired = a3;
}

- (BOOL)downsampleRequired
{
  return self->_downsampleRequired;
}

- (void)setDownsampleRequired:(BOOL)a3
{
  self->_downsampleRequired = a3;
}

- (double)smoothingErrorThreshold
{
  return self->_smoothingErrorThreshold;
}

- (void)setSmoothingErrorThreshold:(double)a3
{
  self->_smoothingErrorThreshold = a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
