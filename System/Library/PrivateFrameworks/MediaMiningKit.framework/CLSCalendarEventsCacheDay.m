@implementation CLSCalendarEventsCacheDay

- (CLSCalendarEventsCacheDay)initWithDay:(int64_t)a3
{
  CLSCalendarEventsCacheDay *v4;
  uint64_t v5;
  NSMutableSet *events;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSCalendarEventsCacheDay;
  v4 = -[CLSCalendarEventsCacheDay init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    events = v4->_events;
    v4->_events = (NSMutableSet *)v5;

    v4->_day = a3;
  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %ld, events %p"), v5, self, self->_day, self->_events);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_day;
}

- (BOOL)isEqual:(id)a3
{
  CLSCalendarEventsCacheDay *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (CLSCalendarEventsCacheDay *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CLSCalendarEventsCacheDay day](v4, "day");
      v6 = v5 == -[CLSCalendarEventsCacheDay day](self, "day");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)day
{
  return self->_day;
}

- (void)setDay:(int64_t)a3
{
  self->_day = a3;
}

- (NSMutableSet)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
