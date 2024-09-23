@implementation HKHeartRateDisplayTypeContextResult

- (HKHeartRateDisplayTypeContextResult)initWithContext:(int64_t)a3 statistics:(id)a4
{
  id v6;
  HKHeartRateDisplayTypeContextResult *v7;
  HKHeartRateDisplayTypeContextResult *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKHeartRateDisplayTypeContextResult;
  v7 = -[HKHeartRateDisplayTypeContextResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HKHeartRateDisplayTypeContextResult setContext:](v7, "setContext:", a3);
    -[HKHeartRateDisplayTypeContextResult setStatistics:](v8, "setStatistics:", v6);
  }

  return v8;
}

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HKHeartRateDisplayTypeContextResult context](self, "context");
  -[HKHeartRateDisplayTypeContextResult statistics](self, "statistics");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("None");
  if (v5)
    v7 = (const __CFString *)v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Context Display Type: %ld, Statistics: %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (HKStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
