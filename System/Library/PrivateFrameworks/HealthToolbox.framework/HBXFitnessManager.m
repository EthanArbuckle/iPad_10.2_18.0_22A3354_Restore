@implementation HBXFitnessManager

+ (id)fitnessIconFor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE37950], "activityTypeWithWorkout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIStaticWorkoutIconImage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fitnessNonGradientTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE01CA8], "keyColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonGradientTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)divingFitnessNonGradientTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE01CA8], "diveColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonGradientTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
