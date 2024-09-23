@implementation HKMedicationDayInCycleResult

- (HKMedicationDayInCycleResult)initWithDaysIntoCycle:(int64_t)a3 isInPauseInterval:(BOOL)a4
{
  HKMedicationDayInCycleResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicationDayInCycleResult;
  result = -[HKMedicationDayInCycleResult init](&v7, sel_init);
  if (result)
  {
    result->_daysIntoCycle = a3;
    result->_isInPauseInterval = a4;
  }
  return result;
}

- (int64_t)daysIntoCycle
{
  return self->_daysIntoCycle;
}

- (BOOL)isInPauseInterval
{
  return self->_isInPauseInterval;
}

@end
