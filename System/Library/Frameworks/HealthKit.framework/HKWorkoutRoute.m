@implementation HKWorkoutRoute

+ (id)_workoutRouteWithDevice:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v8, v7, v6, &__block_literal_global_3, 2.22507386e-308, 2.22507386e-308);

  return v9;
}

uint64_t __51__HKWorkoutRoute__workoutRouteWithDevice_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCount:", 0);
}

- (HDCodableLocationSeries)_codableWorkoutRoute
{
  return self->__codableWorkoutRoute;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  id v4;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutRoute;
  v4 = -[HKSeriesSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = objc_opt_class();
  objc_msgSend(v6, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v7, a2, CFSTR("Invalid data type %@"), objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_validateSample
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutRoute;
  -[HKSeriesSample _validateSample](&v3, sel__validateSample);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_valueDescription
{
  void *v3;
  NSUInteger v4;
  _BOOL4 v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HKSeriesSample count](self, "count");
  v5 = -[HKSeriesSample _isFrozen](self, "_isFrozen");
  v6 = CFSTR("N");
  if (v5)
    v6 = CFSTR("Y");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("\ncount=%d, frozen=%@"), v4, v6);
}

- (BOOL)_requiresPrivateEntitlementForQueries
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  objc_super v8;

  -[HKObject sourceRevision](self, "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isAppleWatch");

  if (v5)
    v6 = !-[HKWorkoutRoute _isSmoothed](self, "_isSmoothed");
  else
    LOBYTE(v6) = 0;
  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutRoute;
  return -[HKSample _requiresPrivateEntitlementForQueries](&v8, sel__requiresPrivateEntitlementForQueries) | v6;
}

- (BOOL)_isSmoothed
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKObject metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKMetadataKeySyncVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue") > 1;
  else
    v4 = 0;

  return v4;
}

- (void)_setCodableWorkoutRoute:(id)a3
{
  objc_storeStrong((id *)&self->__codableWorkoutRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__codableWorkoutRoute, 0);
}

@end
