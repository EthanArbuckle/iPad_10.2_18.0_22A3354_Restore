@implementation RTStoredVehicleFetchOptions

- (RTStoredVehicleFetchOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDateInterval_limit_);
}

- (RTStoredVehicleFetchOptions)initWithDateInterval:(id)a3 limit:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTStoredVehicleFetchOptions *v10;
  id *p_isa;
  RTStoredVehicleFetchOptions *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && !objc_msgSend(v8, "unsignedIntegerValue"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)", buf, 2u);
    }

    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)RTStoredVehicleFetchOptions;
    v10 = -[RTStoredVehicleFetchOptions init](&v15, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_dateInterval, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredVehicleFetchOptions *v4;
  RTStoredVehicleFetchOptions *v5;
  BOOL v6;

  v4 = (RTStoredVehicleFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTStoredVehicleFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

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
  NSNumber *limit;
  uint64_t v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  char v18;

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

LABEL_12:
  limit = self->_limit;
  if (limit)
    goto LABEL_13;
  objc_msgSend(v6, "limit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v18 = 1;
    goto LABEL_22;
  }
  if (!self->_limit)
  {
    v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_13:
  objc_msgSend(v6, "limit");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = self->_limit;
    objc_msgSend(v6, "limit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSNumber isEqualToNumber:](v16, "isEqualToNumber:", v17);

    if (!limit)
      goto LABEL_22;
  }
  else
  {
    v18 = 0;
    if (!limit)
      goto LABEL_22;
  }
LABEL_23:

  return v12 & v18;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_limit, CFSTR("limit"));

}

- (RTStoredVehicleFetchOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RTStoredVehicleFetchOptions *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RTStoredVehicleFetchOptions initWithDateInterval:limit:](self, "initWithDateInterval:limit:", v5, v6);
  return v7;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
