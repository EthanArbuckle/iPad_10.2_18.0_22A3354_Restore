@implementation HKAxisLabelDimensionMinuteSecond

- (HKAxisLabelDimensionMinuteSecond)initWithStartDate:(id)a3
{
  id v5;
  HKAxisLabelDimensionMinuteSecond *v6;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormatter;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKAxisLabelDimensionMinuteSecond;
  v6 = -[HKAxisLabelDimensionMinuteSecond init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v7;

    -[NSDateFormatter setDateFormat:](v6->_dateFormatter, "setDateFormat:", CFSTR(":ss"));
    objc_storeStrong((id *)&v6->_startDate, a3);
  }

  return v6;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  double v5;
  double v6;
  NSDate *startDate;
  double v8;
  NSDateFormatter *dateFormatter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(a3, "doubleValue");
  v6 = v5;
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](startDate, "timeIntervalSinceReferenceDate");
    v6 = v6 + v8;
  }
  dateFormatter = self->_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRUNCATED_SECONDS_TIME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SECONDS_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
