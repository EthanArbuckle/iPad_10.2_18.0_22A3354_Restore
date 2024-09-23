@implementation DNDModeAssertionDateIntervalLifetime

- (DNDModeAssertionDateIntervalLifetime)initWithDateInterval:(id)a3
{
  id v4;
  DNDModeAssertionDateIntervalLifetime *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDModeAssertionDateIntervalLifetime;
  v5 = -[DNDModeAssertionLifetime _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

  }
  return v5;
}

- (BOOL)isActiveForDate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[NSDateInterval containsDate:](self->_dateInterval, "containsDate:", v4))
  {
    -[NSDateInterval endDate](self->_dateInterval, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compare:", v4) != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeAssertionDateIntervalLifetime *v4;
  DNDModeAssertionDateIntervalLifetime *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDModeAssertionDateIntervalLifetime *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionDateIntervalLifetime dateInterval](v5, "dateInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDModeAssertionDateIntervalLifetime dateInterval](v5, "dateInterval");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionDateIntervalLifetime dateInterval](v5, "dateInterval");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; dateInterval: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)lifetimeType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionDateIntervalLifetime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DNDModeAssertionDateIntervalLifetime *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DNDModeAssertionDateIntervalLifetime initWithDateInterval:](self, "initWithDateInterval:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DNDModeAssertionDateIntervalLifetime dateInterval](self, "dateInterval");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateInterval"));

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
