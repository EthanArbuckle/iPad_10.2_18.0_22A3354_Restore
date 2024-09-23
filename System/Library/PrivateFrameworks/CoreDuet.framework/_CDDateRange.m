@implementation _CDDateRange

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[_CDDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    v8 = 0;
  }
  else
  {
    -[_CDDateRange endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "compare:", v7) != 1;

  }
  return v8;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (_CDDateRange)initWithStart:(id)a3 andEnd:(id)a4
{
  id v7;
  id v8;
  _CDDateRange *v9;
  _CDDateRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDDateRange;
  v9 = -[_CDDateRange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

+ (id)periodWithStart:(id)a3 duration:(double)a4
{
  id v5;
  _CDDateRange *v6;
  void *v7;
  _CDDateRange *v8;

  v5 = a3;
  v6 = [_CDDateRange alloc];
  objc_msgSend(v5, "dateByAddingTimeInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CDDateRange initWithStart:andEnd:](v6, "initWithStart:andEnd:", v5, v7);

  return v8;
}

+ (id)periodWithEnd:(id)a3 duration:(double)a4
{
  id v5;
  _CDDateRange *v6;
  void *v7;
  _CDDateRange *v8;

  v5 = a3;
  v6 = [_CDDateRange alloc];
  objc_msgSend(v5, "dateByAddingTimeInterval:", -a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CDDateRange initWithStart:andEnd:](v6, "initWithStart:andEnd:", v7, v5);

  return v8;
}

+ (id)periodWithStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  _CDDateRange *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CDDateRange initWithStart:andEnd:]([_CDDateRange alloc], "initWithStart:andEnd:", v6, v5);

  return v7;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[_CDDateRange endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTimeZone:", v3);
  objc_msgSend(v4, "setDateStyle:", 2);
  objc_msgSend(v4, "setTimeStyle:", 3);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[_CDDateRange startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDDateRange endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ to %@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
