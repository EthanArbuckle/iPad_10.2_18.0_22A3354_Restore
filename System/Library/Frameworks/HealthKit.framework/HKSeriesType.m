@implementation HKSeriesType

+ (HKSeriesType)workoutRouteType
{
  return (HKSeriesType *)objc_msgSend(a1, "seriesTypeForIdentifier:", CFSTR("HKWorkoutRouteTypeIdentifier"));
}

+ (HKSeriesType)heartbeatSeriesType
{
  return (HKSeriesType *)objc_msgSend(a1, "seriesTypeForIdentifier:", CFSTR("HKDataTypeIdentifierHeartbeatSeries"));
}

- (Class)dataObjectClass
{
  int64_t v2;
  void *v3;

  v2 = -[HKObjectType code](self, "code");
  if (v2 == 102 || v2 == 119)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

@end
