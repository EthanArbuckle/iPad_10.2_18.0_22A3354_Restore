@implementation ATXFeaturizedInfoSuggestion

- (ATXFeaturizedInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4
{
  id v7;
  id v8;
  ATXFeaturizedInfoSuggestion *v9;
  ATXFeaturizedInfoSuggestion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFeaturizedInfoSuggestion;
  v9 = -[ATXFeaturizedInfoSuggestion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_featureSet, a4);
  }

  return v10;
}

- (double)scoreWithFeatureWeights:(id)a3
{
  ATXInfoSuggestion *suggestion;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;

  suggestion = self->_suggestion;
  v5 = a3;
  -[ATXInfoSuggestion widgetBundleIdentifier](suggestion, "widgetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInfoSuggestion widgetKind](self->_suggestion, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 1);
  v44 = v8;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 2);
  v43 = v9;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 3);
  v42 = v10;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 4);
  v41 = v11;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 5);
  v40 = v12;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 6);
  v39 = v13;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 7);
  v38 = v14;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 9);
  v37 = v15;
  -[ATXInformationFeatureSet valueForFeature:](self->_featureSet, "valueForFeature:", 8);
  v36 = v16;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 1, v6, v7);
  v35 = v17;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 2, v6, v7);
  v19 = v18;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 3, v6, v7);
  v21 = v20;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 4, v6, v7);
  v23 = v22;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 5, v6, v7);
  v25 = v24;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 6, v6, v7);
  v27 = v26;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 7, v6, v7);
  v29 = v28;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 9, v6, v7);
  v31 = v30;
  objc_msgSend(v5, "weightForFeatureName:widgetExtensionBundleId:widgetKind:", 8, v6, v7);
  v33 = v32;

  return v43 * v19 + v35 * v44 + v21 * v42 + v23 * v41 + v25 * v40 + v27 * v39 + v29 * v38 + v31 * v37 + v33 * v36;
}

- (ATXInfoSuggestion)suggestion
{
  return self->_suggestion;
}

- (ATXInformationFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
