@implementation _CDContextPredictionQueries

- (_CDContextPredictionQueries)init
{

  return 0;
}

+ (id)keyPathForWiFiQualityPrediction
{
  if (keyPathForWiFiQualityPrediction_onceToken != -1)
    dispatch_once(&keyPathForWiFiQualityPrediction_onceToken, &__block_literal_global_25);
  return (id)keyPathForWiFiQualityPrediction_wifiQualityPrediction;
}

+ (id)keyPathForCellQualityPrediction
{
  if (keyPathForCellQualityPrediction_onceToken != -1)
    dispatch_once(&keyPathForCellQualityPrediction_onceToken, &__block_literal_global_4_0);
  return (id)keyPathForCellQualityPrediction_cellQualityPrediction;
}

@end
