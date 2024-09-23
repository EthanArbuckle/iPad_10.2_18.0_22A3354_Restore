@implementation _HKActivityStatisticsStandHourInfo

- (_HKActivityStatisticsStandHourInfo)initWithTimeStamp:(double)a3 state:(int64_t)a4
{
  _HKActivityStatisticsStandHourInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  result = -[_HKActivityStatisticsStandHourInfo init](&v7, sel_init);
  if (result)
  {
    result->_timeStamp = a3;
    result->_state = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp;
  id v5;
  void *v6;
  int64_t state;
  id v8;

  timeStamp = self->_timeStamp;
  v5 = a3;
  NSStringFromSelector(sel_timeStamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v6, timeStamp);

  state = self->_state;
  NSStringFromSelector(sel_state);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", state, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKActivityStatisticsStandHourInfo)initWithCoder:(id)a3
{
  id v4;
  _HKActivityStatisticsStandHourInfo *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  v5 = -[_HKActivityStatisticsStandHourInfo init](&v10, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_timeStamp);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v6);
    v5->_timeStamp = v7;

    NSStringFromSelector(sel_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const __CFAllocator *v5;
  CFAbsoluteTime v6;
  CFDateRef v7;
  CFAbsoluteTime v8;
  CFDateRef v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend(v4, "timeStamp");
    v7 = CFDateCreate(v5, v6);
    -[_HKActivityStatisticsStandHourInfo timeStamp](self, "timeStamp");
    v9 = CFDateCreate(v5, v8);
    if (-[__CFDate isEqualToDate:](v7, "isEqualToDate:", v9))
    {
      v10 = objc_msgSend(v4, "state");
      v11 = v10 == -[_HKActivityStatisticsStandHourInfo state](self, "state");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  -[_HKActivityStatisticsStandHourInfo description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[_HKActivityStatisticsStandHourInfo timeStamp](self, "timeStamp");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_HKActivityStatisticsStandHourInfo state](self, "state");
  v8 = CFSTR("Idle");
  if (!v7)
    v8 = CFSTR("Stood");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Start Date %@; State: %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
