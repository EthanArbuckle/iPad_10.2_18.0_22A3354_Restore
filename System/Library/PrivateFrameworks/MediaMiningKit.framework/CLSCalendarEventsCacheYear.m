@implementation CLSCalendarEventsCacheYear

- (CLSCalendarEventsCacheYear)initWithYear:(int64_t)a3
{
  CLSCalendarEventsCacheYear *v4;
  uint64_t v5;
  NSMutableSet *months;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheYear;
  v4 = -[CLSCalendarEventsCacheYear init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    months = v4->_months;
    v4->_months = (NSMutableSet *)v5;

    v4->_year = a3;
  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t year;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  year = self->_year;
  -[NSMutableSet debugDescription](self->_months, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %ld, months %@"), v5, self, year, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  return self->_year;
}

- (BOOL)isEqual:(id)a3
{
  CLSCalendarEventsCacheYear *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (CLSCalendarEventsCacheYear *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CLSCalendarEventsCacheYear year](v4, "year");
      v6 = v5 == -[CLSCalendarEventsCacheYear year](self, "year");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)year
{
  return self->_year;
}

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

- (NSMutableSet)months
{
  return self->_months;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_months, 0);
}

@end
