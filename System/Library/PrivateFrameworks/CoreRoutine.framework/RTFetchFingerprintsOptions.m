@implementation RTFetchFingerprintsOptions

- (RTFetchFingerprintsOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTFetchFingerprintsOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTFetchFingerprintsOptions initWithDateInterval:settledState:](self, "initWithDateInterval:settledState:", v6, 2);
  return v7;
}

- (RTFetchFingerprintsOptions)initWithDateInterval:(id)a3 settledState:(unint64_t)a4
{
  id v6;
  RTFetchFingerprintsOptions *v7;
  uint64_t v8;
  void *dateInterval;
  id v10;
  void *v11;
  uint64_t v12;
  NSDateInterval *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTFetchFingerprintsOptions;
  v7 = -[RTFetchFingerprintsOptions init](&v15, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "copy");
      dateInterval = v7->_dateInterval;
      v7->_dateInterval = (NSDateInterval *)v8;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      dateInterval = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithStartDate:endDate:", dateInterval, v11);
      v13 = v7->_dateInterval;
      v7->_dateInterval = (NSDateInterval *)v12;

    }
    v7->_settledState = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDateInterval:settledState:", self->_dateInterval, self->_settledState);
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_settledState, CFSTR("settledState"));

}

- (RTFetchFingerprintsOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RTFetchFingerprintsOptions *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("settledState"));

  v7 = -[RTFetchFingerprintsOptions initWithDateInterval:settledState:](self, "initWithDateInterval:settledState:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RTFetchFingerprintsOptions *v4;
  RTFetchFingerprintsOptions *v5;
  BOOL v6;

  v4 = (RTFetchFingerprintsOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTFetchFingerprintsOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

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
  char v10;
  unint64_t settledState;
  BOOL v12;

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    objc_msgSend(v6, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSDateInterval isEqual:](v8, "isEqual:", v9);

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
  v10 = 1;
LABEL_7:

LABEL_8:
  settledState = self->_settledState;
  if (settledState == objc_msgSend(v6, "settledState"))
    v12 = v10;
  else
    v12 = 0;

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_settledState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start date, %@, end date, %@, settledState, %lu"), v4, v5, self->_settledState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setSettledState:(unint64_t)a3
{
  self->_settledState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
