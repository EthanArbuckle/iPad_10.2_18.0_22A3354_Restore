@implementation RTFamiliarityIndexResult

- (RTFamiliarityIndexResult)initWithDateInterval:(id)a3 familiarityIndex:(double)a4
{
  id v7;
  RTFamiliarityIndexResult *v8;
  RTFamiliarityIndexResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTFamiliarityIndexResult;
  v8 = -[RTFamiliarityIndexResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_familiarityIndex = a4;
  }

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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("familiarityIndex"), self->_familiarityIndex);

}

- (RTFamiliarityIndexResult)initWithCoder:(id)a3
{
  id v4;
  RTFamiliarityIndexResult *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTFamiliarityIndexResult;
  v5 = -[RTFamiliarityIndexResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("familiarityIndex"));
    v5->_familiarityIndex = v8;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RTFamiliarityIndexResult initWithDateInterval:familiarityIndex:]([RTFamiliarityIndexResult alloc], "initWithDateInterval:familiarityIndex:", self->_dateInterval, self->_familiarityIndex);
}

- (BOOL)isEqual:(id)a3
{
  RTFamiliarityIndexResult *v4;
  RTFamiliarityIndexResult *v5;
  RTFamiliarityIndexResult *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (RTFamiliarityIndexResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[RTFamiliarityIndexResult dateInterval](self, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTFamiliarityIndexResult dateInterval](v6, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDateInterval:", v8))
    {
      -[RTFamiliarityIndexResult familiarityIndex](self, "familiarityIndex");
      v10 = v9;
      -[RTFamiliarityIndexResult familiarityIndex](v6, "familiarityIndex");
      v12 = v10 == v11;
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

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTFamiliarityIndexResult dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTFamiliarityIndexResult familiarityIndex](self, "familiarityIndex");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval, %@, index, %.2f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)familiarityIndex
{
  return self->_familiarityIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
