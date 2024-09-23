@implementation _ATXFeedbackConstants

+ (double)baseAlpha
{
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  return *(double *)&_ATXFeedbackConstantsData_0;
}

+ (double)baseBeta
{
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  return *(double *)&_ATXFeedbackConstantsData_1;
}

+ (double)multiplierForAppAlphasAndBetas
{
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  return *(double *)&_ATXFeedbackConstantsData_2;
}

+ (double)decayHalfLifeSeconds
{
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  return *(double *)&_ATXFeedbackConstantsData_3;
}

+ (double)actionDecayHalfLifeSeconds
{
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  return *(double *)&_ATXFeedbackConstantsData_4;
}

+ (double)alphaForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  v3 = a3;
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  objc_msgSend((id)_ATXFeedbackConstantsData_5, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && ((objc_msgSend((id)_ATXFeedbackConstantsData_5, "objectForKeyedSubscript:", v3),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "doubleValue"),
         v7 = v6,
         v5,
         v7 > 0.0)
      ? (v8 = v7 < 1.0)
      : (v8 = 0),
        v8))
  {
    v9 = v7 * *(double *)&_ATXFeedbackConstantsData_2;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

+ (double)betaForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;

  v3 = a3;
  if (initFeedbackConstantsData_onceToken != -1)
    dispatch_once(&initFeedbackConstantsData_onceToken, &__block_literal_global_39);
  objc_msgSend((id)_ATXFeedbackConstantsData_5, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && ((objc_msgSend((id)_ATXFeedbackConstantsData_5, "objectForKeyedSubscript:", v3),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "doubleValue"),
         v7 = 1.0 - v6,
         v5,
         v7 > 0.0)
      ? (v8 = v7 < 1.0)
      : (v8 = 0),
        v8))
  {
    v9 = v7 * *(double *)&_ATXFeedbackConstantsData_2;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

@end
