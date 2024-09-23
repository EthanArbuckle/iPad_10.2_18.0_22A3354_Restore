@implementation HKWorkout(HKUIAdditions)

- (id)hkui_localizedActivityTypeName
{
  objc_msgSend(a1, "workoutActivityType");
  return HKUILocalizedWorkoutTypeName();
}

+ (id)hkui_localizedWorkoutStringForValue:()HKUIAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WORKOUT_NUMBERED_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
