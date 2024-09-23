@implementation RTLocationsForTripSegmentFetchOptions

- (RTLocationsForTripSegmentFetchOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTripSegment_preferredDownsamplingLevel_boundingBoxLocation_batchSize_offset_);
}

- (RTLocationsForTripSegmentFetchOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7
{
  id v14;
  id v15;
  RTLocationsForTripSegmentFetchOptions *v16;
  RTLocationsForTripSegmentFetchOptions *v17;
  NSObject *v18;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)RTLocationsForTripSegmentFetchOptions;
  v16 = -[RTLocationsForTripSegmentFetchOptions init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dateInterval, a3);
    v17->_preferredDownsamplingLevel = a4;
    objc_storeStrong((id *)&v17->_boundingBoxLocation, a5);
    v17->_batchSize = a6;
    v17->_offset = a7;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2048;
      v32 = a4;
      v33 = 2048;
      v34 = a6;
      v35 = 2048;
      v36 = a7;
      _os_log_debug_impl(&dword_1A5E26000, v18, OS_LOG_TYPE_DEBUG, "%@ %@, dateInterval, %@,preferredDownsamplingLevel,%ld,batchSize,%lu,offset,%lu.", buf, 0x3Eu);

    }
  }

  return v17;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7
{
  id v12;
  void *v13;
  RTLocationsForTripSegmentFetchOptions *v14;

  v12 = a5;
  objc_msgSend(a3, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[RTLocationsForTripSegmentFetchOptions initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:](self, "initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:", v13, a4, v12, a6, a7);

  return v14;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6
{
  void *v10;
  RTLocationsForTripSegmentFetchOptions *v11;

  objc_msgSend(a3, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTLocationsForTripSegmentFetchOptions initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:](self, "initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:", v10, a4, 0, a5, a6);

  return v11;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4
{
  void *v6;
  RTLocationsForTripSegmentFetchOptions *v7;

  objc_msgSend(a3, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RTLocationsForTripSegmentFetchOptions initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:](self, "initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:", v6, a4, 0, 0, 0);

  return v7;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3
{
  void *v4;
  RTLocationsForTripSegmentFetchOptions *v5;

  objc_msgSend(a3, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTLocationsForTripSegmentFetchOptions initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:](self, "initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:", v4, 0, 0, 0, 0);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RTLocationsForTripSegmentFetchOptions *v4;
  RTLocationsForTripSegmentFetchOptions *v5;
  BOOL v6;

  v4 = (RTLocationsForTripSegmentFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTLocationsForTripSegmentFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

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
  int v12;
  unint64_t batchSize;
  BOOL v14;
  unint64_t v15;
  unint64_t offset;
  BOOL v17;

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  if (dateInterval)
    goto LABEL_2;
  objc_msgSend(v5, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v12 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
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

      if (dateInterval)
        goto LABEL_12;
    }
    else
    {
      v12 = 0;
      if (dateInterval)
        goto LABEL_12;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

  if (!self->_batchSize)
  {
    if (!objc_msgSend(v6, "batchSize"))
    {
      v14 = 1;
      goto LABEL_19;
    }
    if (!self->_batchSize)
      goto LABEL_17;
  }
LABEL_12:
  if (objc_msgSend(v6, "batchSize"))
  {
    batchSize = self->_batchSize;
    v14 = batchSize == objc_msgSend(v6, "batchSize");
  }
  else
  {
LABEL_17:
    v14 = 0;
  }
LABEL_19:
  if (!self->_offset)
  {
    if (!objc_msgSend(v6, "offset"))
    {
      LOBYTE(offset) = 1;
      if (v12)
        goto LABEL_28;
      goto LABEL_30;
    }
    offset = self->_offset;
    if (!offset)
    {
LABEL_27:
      if (v12)
        goto LABEL_28;
LABEL_30:
      v17 = 0;
      goto LABEL_31;
    }
  }
  if (!objc_msgSend(v6, "offset"))
  {
    LOBYTE(offset) = 0;
    goto LABEL_27;
  }
  v15 = self->_offset;
  LOBYTE(offset) = v15 == objc_msgSend(v6, "offset");
  if (!v12)
    goto LABEL_30;
LABEL_28:
  v17 = v14 & offset;
LABEL_31:

  return v17;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredDownsamplingLevel, CFSTR("downsamplingLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boundingBoxLocation, CFSTR("boundingBoxLocation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_offset, CFSTR("offset"));

}

- (RTLocationsForTripSegmentFetchOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  RTLocationsForTripSegmentFetchOptions *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downsamplingLevel"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundingBoxLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offset"));

  v10 = -[RTLocationsForTripSegmentFetchOptions initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:](self, "initWithDateInterval:preferredDownsamplingLevel:boundingBoxLocation:batchSize:offset:", v5, v6, v7, v8, v9);
  return v10;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (CLLocation)boundingBoxLocation
{
  return self->_boundingBoxLocation;
}

- (void)setBoundingBoxLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
