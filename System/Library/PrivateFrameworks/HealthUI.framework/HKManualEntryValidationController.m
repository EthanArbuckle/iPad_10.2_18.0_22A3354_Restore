@implementation HKManualEntryValidationController

- (id)supportedQuantityTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A70], "typeIdentifiersSupportingManualEntryValidation");
}

- (unint64_t)validateQuantity:(id)a3 ofType:(id)a4
{
  return objc_msgSend(a4, "validateQuantityForManualEntry:", a3);
}

- (unint64_t)validateWorkoutDistance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  _workoutValidationRanges();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_HKManualEntryWorkoutDistanceKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_HKManualEntryAbsoluteRangeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _workoutValidationRanges();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_HKManualEntryWorkoutDistanceKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_HKManualEntryConfirmRangeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKManualEntryValidationController _validateQuantity:withAbsoluteRange:confirmRange:](self, "_validateQuantity:withAbsoluteRange:confirmRange:", v4, v7, v10);
  return v11;
}

- (unint64_t)validateWorkoutEnergyBurned:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  _workoutValidationRanges();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_HKManualEntryWorkoutEnergyBurnedKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_HKManualEntryAbsoluteRangeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _workoutValidationRanges();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_HKManualEntryWorkoutEnergyBurnedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_HKManualEntryConfirmRangeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKManualEntryValidationController _validateQuantity:withAbsoluteRange:confirmRange:](self, "_validateQuantity:withAbsoluteRange:confirmRange:", v4, v7, v10);
  return v11;
}

- (unint64_t)validateMaximumAllowedDuration:(double)a3 ofType:(id)a4
{
  id v5;
  double v6;
  unint64_t v7;

  v5 = a4;
  if (objc_msgSend(v5, "isMaximumDurationRestricted")
    && (objc_msgSend(v5, "maximumAllowedDuration"), v6 < a3))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)validateMinimumAllowedDuration:(double)a3 ofType:(id)a4
{
  id v5;
  double v6;
  unint64_t v7;

  v5 = a4;
  if (objc_msgSend(v5, "isMinimumDurationRestricted")
    && (objc_msgSend(v5, "minimumAllowedDuration"), v6 > a3))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_validateQuantity:(id)a3 withAbsoluteRange:(id)a4 confirmRange:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "containsQuantity:", v7))
    v9 = objc_msgSend(v8, "containsQuantity:", v7) ^ 1;
  else
    v9 = 2;

  return v9;
}

@end
