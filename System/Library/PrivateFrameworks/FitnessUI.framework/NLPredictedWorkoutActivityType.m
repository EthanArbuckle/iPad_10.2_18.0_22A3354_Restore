@implementation NLPredictedWorkoutActivityType

- (id)uniqueIdentifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NLPredictedWorkoutActivityType;
  -[FIUIWorkoutActivityType uniqueIdentifier](&v5, sel_uniqueIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(",predictedType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)baseMetadata
{
  void *v2;
  void *v3;

  -[FIUIWorkoutActivityType metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("BackdatedStartDate"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("PredictionSessionUUID"));
  return (NSDictionary *)v3;
}

@end
