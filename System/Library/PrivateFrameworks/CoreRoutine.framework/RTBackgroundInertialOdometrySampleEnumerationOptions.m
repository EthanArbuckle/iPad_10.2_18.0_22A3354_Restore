@implementation RTBackgroundInertialOdometrySampleEnumerationOptions

- (RTBackgroundInertialOdometrySampleEnumerationOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTBackgroundInertialOdometrySampleEnumerationOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTBackgroundInertialOdometrySampleEnumerationOptions initWithDateInterval:](self, "initWithDateInterval:", v6);
  return v7;
}

- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithDateInterval:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  RTBackgroundInertialOdometrySampleEnumerationOptions *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTBackgroundInertialOdometrySampleEnumerationOptions;
  v7 = -[RTBackgroundInertialOdometrySampleEnumerationOptions init](&v11, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "copy");
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v3, v4);
    }
    objc_storeStrong((id *)&v7->_dateInterval, v8);
    if (!v6)
    {

      v8 = (void *)v3;
    }

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTBackgroundInertialOdometrySampleEnumerationOptions dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDateInterval:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
}

- (RTBackgroundInertialOdometrySampleEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  RTBackgroundInertialOdometrySampleEnumerationOptions *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[RTBackgroundInertialOdometrySampleEnumerationOptions initWithDateInterval:](self, "initWithDateInterval:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RTBackgroundInertialOdometrySampleEnumerationOptions *v4;
  RTBackgroundInertialOdometrySampleEnumerationOptions *v5;
  BOOL v6;

  v4 = (RTBackgroundInertialOdometrySampleEnumerationOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTBackgroundInertialOdometrySampleEnumerationOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

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

  v5 = a3;
  v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (!dateInterval)
  {
    objc_msgSend(v5, "dateInterval");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_7:

      goto LABEL_8;
    }
    v8 = self->_dateInterval;
  }
  objc_msgSend(v6, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSDateInterval isEqual:](v8, "isEqual:", v9);

  if (!dateInterval)
    goto LABEL_7;
LABEL_8:

  return v10;
}

- (unint64_t)hash
{
  return -[NSDateInterval hash](self->_dateInterval, "hash");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start date, %@, end date, %@"), v5, v7);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
