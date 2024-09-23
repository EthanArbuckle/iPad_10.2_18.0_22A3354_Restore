@implementation _CDRateAndTotalLimiter

- (BOOL)debited
{
  _CDRateAndTotalLimiter *v2;
  int64_t currentTotal;
  BOOL v4;
  objc_super v6;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)_CDRateAndTotalLimiter;
  if (!-[_CDRateLimiter debited](&v7, sel_debited))
    goto LABEL_5;
  currentTotal = v2->_currentTotal;
  v2->_currentTotal = currentTotal + 1;
  if (currentTotal >= v2->_totalCount)
  {
    v2->_currentTotal = currentTotal;
    v6.receiver = v2;
    v6.super_class = (Class)_CDRateAndTotalLimiter;
    -[_CDRateLimiter credit](&v6, sel_credit);
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:
  objc_sync_exit(v2);

  return v4;
}

- (_CDRateAndTotalLimiter)initWithCount:(int64_t)a3 perPeriod:(double)a4 totalCountLimit:(int64_t)a5
{
  _CDRateAndTotalLimiter *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CDRateAndTotalLimiter;
  result = -[_CDRateLimiter initWithCount:perPeriod:](&v7, sel_initWithCount_perPeriod_, a3, a4);
  if (result)
    result->_totalCount = a5;
  return result;
}

- (_CDRateAndTotalLimiter)initWithCount:(int64_t)a3 perPeriod:(double)a4
{
  return -[_CDRateAndTotalLimiter initWithCount:perPeriod:totalCountLimit:](self, "initWithCount:perPeriod:totalCountLimit:", a3, 5000, a4);
}

- (BOOL)credit
{
  _CDRateAndTotalLimiter *v2;
  BOOL v3;
  objc_super v5;

  v2 = self;
  objc_sync_enter(v2);
  v5.receiver = v2;
  v5.super_class = (Class)_CDRateAndTotalLimiter;
  v3 = -[_CDRateLimiter credit](&v5, sel_credit);
  --v2->_currentTotal;
  objc_sync_exit(v2);

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDRateLimiter period](self, "period");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { period=%f, count=%ld, totalCount=%ld }"), v5, v6, -[_CDRateLimiter count](self, "count"), -[_CDRateAndTotalLimiter totalCount](self, "totalCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (int64_t)currentTotal
{
  return self->_currentTotal;
}

- (void)setCurrentTotal:(int64_t)a3
{
  self->_currentTotal = a3;
}

@end
