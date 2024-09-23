@implementation RTStoredElevationEnumerationOptions

- (RTStoredElevationEnumerationOptions)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  RTStoredElevationEnumerationOptions *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v7 = -[RTStoredElevationEnumerationOptions initWithDateInterval:batchSize:](self, "initWithDateInterval:batchSize:", v6, 0);
  return v7;
}

- (RTStoredElevationEnumerationOptions)initWithDateInterval:(id)a3 batchSize:(unint64_t)a4
{
  id v7;
  RTStoredElevationEnumerationOptions *v8;
  RTStoredElevationEnumerationOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStoredElevationEnumerationOptions;
  v8 = -[RTStoredElevationEnumerationOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDateInterval:batchSize:", self->_dateInterval, self->_batchSize);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dateInterval, %@, batchSize, %lu"), self->_dateInterval, self->_batchSize);
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));

}

- (RTStoredElevationEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RTStoredElevationEnumerationOptions *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));

  v7 = -[RTStoredElevationEnumerationOptions initWithDateInterval:batchSize:](self, "initWithDateInterval:batchSize:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredElevationEnumerationOptions *v4;
  RTStoredElevationEnumerationOptions *v5;
  BOOL v6;

  v4 = (RTStoredElevationEnumerationOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTStoredElevationEnumerationOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

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
  unint64_t batchSize;
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
  batchSize = self->_batchSize;
  if (batchSize == objc_msgSend(v6, "batchSize"))
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
