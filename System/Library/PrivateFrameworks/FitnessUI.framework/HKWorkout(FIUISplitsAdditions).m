@implementation HKWorkout(FIUISplitsAdditions)

- (id)fiui_workoutSplitsForUserPreferredDistanceUnit:()FIUISplitsAdditions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_isMetricDistance");
  objc_msgSend(a1, "workoutEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FISplitsForMeasuringSystemIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fi_flatMapUsingBlock:", &__block_literal_global_12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fiui_workoutCustomSplits
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "workoutEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FICustomSplits();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "fi_flatMapUsingBlock:", &__block_literal_global_391);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
