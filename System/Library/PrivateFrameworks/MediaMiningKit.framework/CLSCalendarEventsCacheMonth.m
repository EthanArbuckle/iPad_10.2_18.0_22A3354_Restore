@implementation CLSCalendarEventsCacheMonth

- (CLSCalendarEventsCacheMonth)initWithMonth:(int64_t)a3
{
  CLSCalendarEventsCacheMonth *v4;
  uint64_t v5;
  NSMutableSet *days;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheMonth;
  v4 = -[CLSCalendarEventsCacheMonth init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    days = v4->_days;
    v4->_days = (NSMutableSet *)v5;

    v4->_month = a3;
  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t month;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  month = self->_month;
  -[NSMutableSet debugDescription](self->_days, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %ld, days %@"), v5, self, month, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  return self->_month;
}

- (BOOL)isEqual:(id)a3
{
  CLSCalendarEventsCacheMonth *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (CLSCalendarEventsCacheMonth *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CLSCalendarEventsCacheMonth month](v4, "month");
      v6 = v5 == -[CLSCalendarEventsCacheMonth month](self, "month");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)month
{
  return self->_month;
}

- (void)setMonth:(int64_t)a3
{
  self->_month = a3;
}

- (NSMutableSet)days
{
  return self->_days;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_days, 0);
}

@end
