@implementation HKWorkoutZonesType

+ (id)heartRateType
{
  return (id)objc_msgSend(a1, "workoutZonesTypeForIdentifier:", CFSTR("HKWorkoutZonesTypeIdentifierHeartRate"));
}

+ (id)cyclingPowerType
{
  return (id)objc_msgSend(a1, "workoutZonesTypeForIdentifier:", CFSTR("HKWorkoutZonesTypeIdentifierCyclingPower"));
}

- (Class)dataObjectClass
{
  return (Class)objc_opt_class();
}

@end
