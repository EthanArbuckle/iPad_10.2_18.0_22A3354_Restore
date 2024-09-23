@implementation CMPedometerData(HealthDaemon)

- (BOOL)hd_hasWorkout
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "workoutType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue") != 0;

  return v2;
}

- (uint64_t)hd_compare:()HealthDaemon
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "recordId");
  v6 = objc_msgSend(v4, "recordId");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (id)hd_unitForType:()HealthDaemon
{
  void *v3;
  int v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB5C68]);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
  else
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
