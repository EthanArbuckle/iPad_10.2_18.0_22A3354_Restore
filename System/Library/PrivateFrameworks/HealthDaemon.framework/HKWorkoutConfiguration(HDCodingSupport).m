@implementation HKWorkoutConfiguration(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0CB6E20]);
    objc_msgSend(v5, "setActivityType:", objc_msgSend(v4, "activityType"));
    objc_msgSend(v5, "setLocationType:", objc_msgSend(v4, "locationType"));
    objc_msgSend(v5, "setSwimmingLocationType:", objc_msgSend(v4, "wLocationType"));
    if (objc_msgSend(v4, "hasWLengthUnitString"))
    {
      v6 = (void *)MEMORY[0x1E0CB6CD0];
      objc_msgSend(v4, "wLengthUnitString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unitFromString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v4, "wLengthValue");
      objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLapLength:", v10);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HDCodableWorkoutConfiguration)codableRepresentationForSync
{
  HDCodableWorkoutConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(HDCodableWorkoutConfiguration);
  -[HDCodableWorkoutConfiguration setActivityType:](v2, "setActivityType:", objc_msgSend(a1, "activityType"));
  -[HDCodableWorkoutConfiguration setLocationType:](v2, "setLocationType:", objc_msgSend(a1, "locationType"));
  -[HDCodableWorkoutConfiguration setWLocationType:](v2, "setWLocationType:", objc_msgSend(a1, "swimmingLocationType"));
  objc_msgSend(a1, "lapLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_unit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValueForUnit:", v5);
    -[HDCodableWorkoutConfiguration setWLengthValue:](v2, "setWLengthValue:");
    objc_msgSend(v5, "unitString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableWorkoutConfiguration setWLengthUnitString:](v2, "setWLengthUnitString:", v6);

  }
  return v2;
}

@end
