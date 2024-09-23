@implementation CDContextPredictionQueries

void __62___CDContextPredictionQueries_keyPathForWiFiQualityPrediction__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/predicted/wifi/quality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiFiQualityPrediction_wifiQualityPrediction;
  keyPathForWiFiQualityPrediction_wifiQualityPrediction = v0;

}

void __62___CDContextPredictionQueries_keyPathForCellQualityPrediction__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/predicted/cell/quality"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCellQualityPrediction_cellQualityPrediction;
  keyPathForCellQualityPrediction_cellQualityPrediction = v0;

}

@end
