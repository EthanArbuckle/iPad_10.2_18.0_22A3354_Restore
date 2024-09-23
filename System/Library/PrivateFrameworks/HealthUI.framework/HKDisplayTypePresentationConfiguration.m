@implementation HKDisplayTypePresentationConfiguration

- (HKDisplayTypePresentationConfiguration)initWithCurrentValue:(int64_t)a3 secondaryValue:(int64_t)a4 detailChart:(int64_t)a5 singleDailyValue:(BOOL)a6
{
  HKDisplayTypePresentationConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKDisplayTypePresentationConfiguration;
  result = -[HKDisplayTypePresentationConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_currentValue = a3;
    result->_secondaryValue = a4;
    result->_detailChart = a5;
    result->_singleDailyValue = a6;
  }
  return result;
}

- (HKDisplayTypePresentationConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (unint64_t)hash
{
  return self->_secondaryValue ^ self->_currentValue ^ self->_detailChart ^ ((unint64_t)self->_singleDailyValue << 10);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_currentValue == v4[2]
    && self->_secondaryValue == v4[3]
    && self->_detailChart == v4[4]
    && self->_singleDailyValue == *((unsigned __int8 *)v4 + 8);

  return v5;
}

- (int64_t)currentValue
{
  return self->_currentValue;
}

- (int64_t)secondaryValue
{
  return self->_secondaryValue;
}

- (int64_t)detailChart
{
  return self->_detailChart;
}

- (BOOL)singleDailyValue
{
  return self->_singleDailyValue;
}

@end
