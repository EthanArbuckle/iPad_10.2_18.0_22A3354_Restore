@implementation ATXInformationFeatureWeights

- (ATXInformationFeatureWeights)init
{
  ATXInformationFeatureWeights *v2;
  uint64_t v3;
  NSDictionary *weights;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInformationFeatureWeights;
  v2 = -[ATXInformationFeatureWeights init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    weights = v2->_weights;
    v2->_weights = (NSDictionary *)v3;

  }
  return v2;
}

- (double)weightForFeatureName:(unint64_t)a3 widgetExtensionBundleId:(id)a4 widgetKind:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  if (!self->_weights)
    return 0.0;
  v8 = a5;
  v9 = a4;
  +[ATXInformationFeatureSetBuilder stringForInfoSuggestionFeature:](ATXInformationFeatureSetBuilder, "stringForInfoSuggestionFeature:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationFeatureWeights widgetIdentifierForWidgetExtensionBundleId:widgetKind:](self, "widgetIdentifierForWidgetExtensionBundleId:widgetKind:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_weights, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12
    && (objc_msgSend(v12, "objectForKeyedSubscript:", v10),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_weights, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    if (v16 == 0.0)
      -[ATXInformationFeatureWeights defaultWeightForFeatureName:](self, "defaultWeightForFeatureName:", a3);
  }
  v17 = v16;

  return v17;
}

- (id)widgetIdentifierForWidgetExtensionBundleId:(id)a3 widgetKind:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@:%@"), v7, v6);

  return v8;
}

- (double)defaultWeightForFeatureName:(unint64_t)a3
{
  double result;
  void *v6;

  if (a3 < 0xB)
    return dbl_1C9E80180[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXInformationFeatureWeights.m"), 82, CFSTR("Unknown value for ATXInfoSuggestionFeatureName"));

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
}

@end
