@implementation RTStoredTripSegmentFetchOptions

- (RTStoredTripSegmentFetchOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAscending_dateInterval_limit_);
}

- (RTStoredTripSegmentFetchOptions)initWithAscending:(BOOL)a3 dateInterval:(id)a4 limit:(id)a5
{
  id v9;
  id v10;
  void *v11;
  RTStoredTripSegmentFetchOptions *v12;
  id *p_isa;
  RTStoredTripSegmentFetchOptions *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && !objc_msgSend(v10, "unsignedIntegerValue"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)", buf, 2u);
    }

    v14 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RTStoredTripSegmentFetchOptions;
    v12 = -[RTStoredTripSegmentFetchOptions init](&v17, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      v12->_ascending = a3;
      objc_storeStrong((id *)&v12->_dateInterval, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredTripSegmentFetchOptions *v4;
  RTStoredTripSegmentFetchOptions *v5;
  BOOL v6;

  v4 = (RTStoredTripSegmentFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTStoredTripSegmentFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  id v5;
  int ascending;
  int v7;
  NSDateInterval *dateInterval;
  uint64_t v9;
  void *v10;
  NSDateInterval *v11;
  void *v12;
  char v13;
  NSNumber *limit;
  uint64_t v15;
  void *v16;
  NSNumber *v17;
  void *v18;
  char v19;
  char v20;
  char v21;

  v5 = a3;
  ascending = self->_ascending;
  v7 = objc_msgSend(v5, "isAscending");
  dateInterval = self->_dateInterval;
  if (!dateInterval)
  {
    objc_msgSend(v5, "dateInterval");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_dateInterval)
        goto LABEL_2;
      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  objc_msgSend(v5, "dateInterval");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = self->_dateInterval;
    objc_msgSend(v5, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSDateInterval isEqualToDateInterval:](v11, "isEqualToDateInterval:", v12);

    if (!dateInterval)
      goto LABEL_11;
  }
  else
  {
    v13 = 0;
    if (!dateInterval)
      goto LABEL_11;
  }
LABEL_12:
  limit = self->_limit;
  if (limit)
    goto LABEL_13;
  objc_msgSend(v5, "limit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v19 = 1;
    goto LABEL_22;
  }
  if (self->_limit)
  {
LABEL_13:
    objc_msgSend(v5, "limit");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = self->_limit;
      objc_msgSend(v5, "limit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSNumber isEqualToNumber:](v17, "isEqualToNumber:", v18);

      if (limit)
        goto LABEL_23;
    }
    else
    {
      v19 = 0;
      if (limit)
        goto LABEL_23;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

LABEL_23:
  if (ascending == v7)
    v20 = v13;
  else
    v20 = 0;
  v21 = v20 & v19;

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 ascending;
  id v5;

  ascending = self->_ascending;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_limit, CFSTR("limit"));

}

- (RTStoredTripSegmentFetchOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  RTStoredTripSegmentFetchOptions *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RTStoredTripSegmentFetchOptions initWithAscending:dateInterval:limit:](self, "initWithAscending:dateInterval:limit:", v5, v6, v7);
  return v8;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
