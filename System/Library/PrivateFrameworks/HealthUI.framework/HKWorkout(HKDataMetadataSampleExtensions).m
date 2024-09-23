@implementation HKWorkout(HKDataMetadataSampleExtensions)

- (id)hk_defaultDistanceQuantityType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  objc_msgSend(a1, "workoutActivityType");
  _HKWorkoutDistanceTypeForActivityType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F02237A8;
    objc_msgSendSuper2(&v7, sel_hk_defaultDistanceQuantityType);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
