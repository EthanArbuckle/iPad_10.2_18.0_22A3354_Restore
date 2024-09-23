@implementation ATXFocusModeModelsUtil

+ (id)setupPredictionModelNameForMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("ATXModeHomeSetupPredictionModel");
  if (a3 != 1)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("ATXModeWorkingSetupPredictionModel");
  else
    return (id)v3;
}

@end
