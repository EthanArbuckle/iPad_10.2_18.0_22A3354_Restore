@implementation HKTimePeriodNumberFormatter

- (HKTimePeriodNumberFormatter)init
{
  HKTimePeriodNumberFormatter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKTimePeriodNumberFormatter;
  result = -[HKTimePeriodNumberFormatter init](&v3, sel_init);
  if (result)
    result->_shouldShowDays = 1;
  return result;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6;
  __int16 v7;
  __int16 v8;
  void *v9;

  v6 = a3;
  v7 = -[HKTimePeriodNumberFormatter shouldRoundToHours](self, "shouldRoundToHours");
  if (-[HKTimePeriodNumberFormatter shouldShowDays](self, "shouldShowDays"))
    v8 = v7;
  else
    v8 = v7 | 0x80;
  HKTimePeriodString(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldRoundToHours
{
  return self->_shouldRoundToHours;
}

- (void)setShouldRoundToHours:(BOOL)a3
{
  self->_shouldRoundToHours = a3;
}

- (BOOL)shouldShowDays
{
  return self->_shouldShowDays;
}

- (void)setShouldShowDays:(BOOL)a3
{
  self->_shouldShowDays = a3;
}

@end
