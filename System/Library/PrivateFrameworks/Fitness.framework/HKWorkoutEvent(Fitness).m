@implementation HKWorkoutEvent(Fitness)

- (BOOL)fi_isCustomSplitEvent
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (objc_msgSend(a1, "type") != 7)
    return 0;
  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutSegmentEventSubtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 3;

  return v4;
}

- (BOOL)fi_isDistanceGoalCompleteEvent
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (objc_msgSend(a1, "type") != 7)
    return 0;
  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutSegmentEventSubtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 2;

  return v4;
}

- (BOOL)fi_isSplitEvent
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (objc_msgSend(a1, "type") != 7)
    return 0;
  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutSegmentEventSubtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

- (double)fi_distanceGoalCompletionTime
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_HKPrivateMetadataSplitActiveDurationQuantity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)fi_splitActiveDuration
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataSplitActiveDurationQuantity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (id)fi_splitDistance
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataSplitDistanceQuantity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)fi_splitPaceInMetersPerSecond
{
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "fi_splitActiveDuration");
  v3 = v2;
  v4 = 0.0;
  if (v2 > 2.22044605e-16)
  {
    objc_msgSend(a1, "fi_splitDistance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    v4 = v7 / v3;

  }
  return v4;
}

@end
