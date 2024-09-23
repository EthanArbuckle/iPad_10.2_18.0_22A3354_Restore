@implementation HKWorkout(Fitness)

- (uint64_t)fi_hasNonZeroElevationGain
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fi_elevationGain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "fi_isNonzero");
  else
    v3 = 0;

  return v3;
}

- (id)fi_elevationGain
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD3188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(a1, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD4480]);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (uint64_t)fi_swimmingLocationType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD3200]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (FIWorkoutActivityType)fi_activityType
{
  return +[FIWorkoutActivityType activityTypeWithWorkout:](FIWorkoutActivityType, "activityTypeWithWorkout:", a1);
}

@end
