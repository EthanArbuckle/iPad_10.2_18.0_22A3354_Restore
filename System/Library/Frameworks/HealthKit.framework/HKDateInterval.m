@implementation HKDateInterval

- (HKDateInterval)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKDateInterval)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  HKDateInterval *v9;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDateInterval.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[startDate hk_isBeforeOrEqualToDate:endDate]"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HKDateInterval;
  v9 = -[HKDateInterval init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;

    v12 = objc_msgSend(v8, "copy");
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v12;

  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3C8280))
  {
    startDate = self->_startDate;
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isEqualToDate:](startDate, "isEqualToDate:", v6))
    {
      endDate = self->_endDate;
      objc_msgSend(v4, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSDate isEqualToDate:](endDate, "isEqualToDate:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  NSDate *startDate;
  void *v6;
  int64_t v7;
  NSDate *endDate;
  void *v9;

  v4 = a3;
  startDate = self->_startDate;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSDate compare:](startDate, "compare:", v6);

  if (!v7)
  {
    endDate = self->_endDate;
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSDate compare:](endDate, "compare:", v9);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("start"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("end"));

}

- (HKDateInterval)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  HKDateInterval *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("end"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7 || !objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", v6))
  {
    v8 = 0;
  }
  else
  {
    self = -[HKDateInterval initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
