@implementation HKWorkoutDurationNumberFormatter

- (HKWorkoutDurationNumberFormatter)init
{
  HKWorkoutDurationNumberFormatter *v2;
  HKWorkoutDurationNumberFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutDurationNumberFormatter;
  v2 = -[HKTimePeriodWithSecondsNumberFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKTimePeriodWithSecondsNumberFormatter setSecondsRoundingMode:](v2, "setSecondsRoundingMode:", 1);
  return v3;
}

@end
