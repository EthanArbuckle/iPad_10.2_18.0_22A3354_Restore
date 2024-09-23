@implementation MRExternalDeviceMessageMetricsEntry

- (MRExternalDeviceMessageMetricsEntry)init
{
  MRExternalDeviceMessageMetricsEntry *v2;
  NSMutableArray *v3;
  NSMutableArray *values;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRExternalDeviceMessageMetricsEntry;
  v2 = -[MRExternalDeviceMessageMetricsEntry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    values = v2->_values;
    v2->_values = v3;

    v2->_min = -1;
  }
  return v2;
}

- (void)updateWithValue:(unint64_t)a3
{
  NSMutableArray *values;
  void *v6;
  NSMutableArray *v7;
  unint64_t v8;

  values = self->_values;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](values, "addObject:", v6);

  if (self->_max < a3)
    self->_max = a3;
  if (self->_min > a3)
    self->_min = a3;
  v7 = self->_values;
  v8 = self->_total + a3;
  self->_total = v8;
  self->_avg = v8 / -[NSMutableArray count](v7, "count");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Max: %lu\n Min: %lu\n Avg: %lu\n Total: %lu\n Values: %@\n"), self->_max, self->_min, self->_avg, self->_total, self->_values);
}

- (unint64_t)avg
{
  return self->_avg;
}

- (void)setAvg:(unint64_t)a3
{
  self->_avg = a3;
}

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  self->_min = a3;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  self->_max = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
