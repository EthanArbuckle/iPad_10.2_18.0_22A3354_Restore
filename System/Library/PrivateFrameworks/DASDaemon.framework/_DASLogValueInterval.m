@implementation _DASLogValueInterval

- (BOOL)isEqual:(id)a3
{
  NSObject *value;
  void *v4;

  value = self->_value;
  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(value) = -[NSObject isEqual:](value, "isEqual:", v4);

  return (char)value;
}

- (id)intervalString
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  defaultFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_endDate)
  {
    objc_msgSend(v3, "stringFromDate:");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("End of Log");
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[_DASLogValueInterval startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@ - %@]"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_DASLogValueInterval intervalString](self, "intervalString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject description](self->_value, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)duration
{
  NSDate *endDate;
  BOOL v4;
  double result;
  void *v6;
  void *v7;
  double v8;
  double v9;

  endDate = self->_endDate;
  if (!endDate)
    return -2147483650.0;
  v4 = -[NSDate isEqualToDate:](endDate, "isEqualToDate:", self->_startDate);
  result = 0.5;
  if (!v4)
  {
    -[_DASLogValueInterval endDate](self, "endDate", 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASLogValueInterval startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    return v9;
  }
  return result;
}

- (id)durationString
{
  double v2;
  double v4;
  const __CFString *v5;

  -[_DASLogValueInterval duration](self, "duration");
  if (v2 < 0.0)
    return &stru_24E138A50;
  if (v2 >= 3600.0)
  {
    v4 = v2 / 3600.0;
  }
  else
  {
    v4 = v2 / 60.0;
    if (v2 < 60.0)
      v4 = v2;
  }
  v5 = CFSTR("minutes");
  if (v2 < 60.0)
    v5 = CFSTR("seconds");
  if (v2 >= 3600.0)
    v5 = CFSTR("hours");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%3.2lf %@"), *(_QWORD *)&v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
