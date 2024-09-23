@implementation SGMISaliencyModelConfig

- (SGMISaliencyModelConfig)initWithSaliencyOverrideRules:(id)a3 featureNames:(id)a4 mean:(id)a5 std:(id)a6 groundTruthEstimatorRules:(id)a7 threshold:(id)a8 minCountToConsiderATokenAsHighlyDiscriminant:(id)a9 ratioToConsiderATokenAsHighlyDiscriminant:(id)a10 minCountToConsiderATokenAsExtremelyDiscriminant:(id)a11 ratioToConsiderATokenAsExtremelyDiscriminant:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  SGMISaliencyModelConfig *v22;
  SGMISaliencyModelConfig *v23;
  uint64_t v24;
  NSArray *groundTruthEstimatorFeatures;
  double v26;
  double v27;
  id obj;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v35 = a3;
  v34 = a4;
  obj = a5;
  v33 = a5;
  v32 = a6;
  v36 = a7;
  v31 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)SGMISaliencyModelConfig;
  v22 = -[SGMISaliencyModelConfig init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_saliencyOverrideRules, a3);
    objc_storeStrong((id *)&v23->_featureNames, a4);
    objc_storeStrong((id *)&v23->_mean, obj);
    objc_storeStrong((id *)&v23->_std, a6);
    objc_storeStrong((id *)&v23->_groundTruthEstimatorRules, a7);
    objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_9492);
    v24 = objc_claimAutoreleasedReturnValue();
    groundTruthEstimatorFeatures = v23->_groundTruthEstimatorFeatures;
    v23->_groundTruthEstimatorFeatures = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_threshold, a8);
    v23->_minCountToConsiderATokenAsHighlyDiscriminant = objc_msgSend(v18, "unsignedIntegerValue");
    objc_msgSend(v19, "doubleValue");
    v23->_ratioToConsiderATokenAsHighlyDiscriminant = v26;
    v23->_minCountToConsiderATokenAsExtremelyDiscriminant = objc_msgSend(v20, "unsignedIntegerValue");
    objc_msgSend(v21, "doubleValue");
    v23->_ratioToConsiderATokenAsExtremelyDiscriminant = v27;
  }

  return v23;
}

- (NSArray)saliencyOverrideRules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)featureNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)mean
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)std
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)groundTruthEstimatorRules
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)groundTruthEstimatorFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)minCountToConsiderATokenAsHighlyDiscriminant
{
  return self->_minCountToConsiderATokenAsHighlyDiscriminant;
}

- (double)ratioToConsiderATokenAsHighlyDiscriminant
{
  return self->_ratioToConsiderATokenAsHighlyDiscriminant;
}

- (unint64_t)minCountToConsiderATokenAsExtremelyDiscriminant
{
  return self->_minCountToConsiderATokenAsExtremelyDiscriminant;
}

- (double)ratioToConsiderATokenAsExtremelyDiscriminant
{
  return self->_ratioToConsiderATokenAsExtremelyDiscriminant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_groundTruthEstimatorFeatures, 0);
  objc_storeStrong((id *)&self->_groundTruthEstimatorRules, 0);
  objc_storeStrong((id *)&self->_std, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideRules, 0);
}

uint64_t __295__SGMISaliencyModelConfig_initWithSaliencyOverrideRules_featureNames_mean_std_groundTruthEstimatorRules_threshold_minCountToConsiderATokenAsHighlyDiscriminant_ratioToConsiderATokenAsHighlyDiscriminant_minCountToConsiderATokenAsExtremelyDiscriminant_ratioToConsiderATokenAsExtremelyDiscriminant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureName");
}

+ (id)rulesFromFeatures:(id)a3 lowerBounds:(id)a4 upperBounds:(id)a5 outputs:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  char v20;
  SGMISaliencyModelConfigRule *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  SGMISaliencyModelConfigRule *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v9)
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; name array from Trial is nil.";
LABEL_23:
    _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_24;
  }
  if (!v10)
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; lower bounds array from Trial is nil.";
    goto LABEL_23;
  }
  if (!v11)
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; upper bounds array from Trial is nil.";
    goto LABEL_23;
  }
  if (!v12)
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "SGMISaliencyModelConfig: Could not process rule set; outputs array from Trial is nil.";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v14 = objc_msgSend(v9, "count");
  if (v14 != objc_msgSend(v10, "count") || v14 != objc_msgSend(v11, "count") || v14 != objc_msgSend(v13, "count"))
  {
    sgMailIntelligenceLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "SGMISaliencyModelConfig: Inconsistent array sizes in Trial asset.";
      goto LABEL_23;
    }
LABEL_24:
    v28 = 0;
    goto LABEL_25;
  }
  v34 = v13;
  v15 = objc_opt_new();
  if (v14 < 1)
  {
LABEL_12:
    v15 = v15;
    v28 = v15;
  }
  else
  {
    v16 = 0;
    v17 = &off_1E7DA5000;
    v32 = v14;
    v33 = v11;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v16, v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17[447], "allFeaturePrettyNames");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v18);

      if ((v20 & 1) == 0)
        break;
      v21 = [SGMISaliencyModelConfigRule alloc];
      objc_msgSend(v17[447], "prettyNamesReverseMapping");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndex:", v16);
      v25 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SGMISaliencyModelConfigRule initWithFeatureName:strictLowerBound:strictUpperBound:output:](v21, "initWithFeatureName:strictLowerBound:strictUpperBound:output:", v22, v23, v24, v26);
      -[NSObject addObject:](v15, "addObject:", v27);

      v10 = v25;
      v11 = v33;

      v17 = &off_1E7DA5000;
      if (v32 == ++v16)
        goto LABEL_12;
    }
    sgMailIntelligenceLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      _os_log_error_impl(&dword_1C3607000, v31, OS_LOG_TYPE_ERROR, "SGMISaliencyModelConfig: Unexpected feature %@", buf, 0xCu);
    }

    v28 = 0;
  }
  v13 = v34;
LABEL_25:

  return v28;
}

+ (id)defaultConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  SGMISaliencyModelConfig *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v30;
  void *v31;
  uint8_t buf[16];

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saliencyOverrideFeatureNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saliencyOverrideFeatureLowerBounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saliencyOverrideFeatureUpperBounds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saliencyOverrideOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rulesFromFeatures:lowerBounds:upperBounds:outputs:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "modelFeatureNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sgMap();
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "modelFeatureStandardizationMeans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v12, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, mean for feature standardization is nil.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v3, "modelFeatureStandardizationStandardDeviations");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      sgMailIntelligenceLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, mean for feature standardization is nil.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_43;
    }
    objc_msgSend(v3, "modelGroundTruthFeatureNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelGroundTruthFeatureLowerBounds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelGroundTruthFeatureUpperBounds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelGroundTruthOutputs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rulesFromFeatures:lowerBounds:upperBounds:outputs:", v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      sgMailIntelligenceLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v18, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error in processing ground truth estimation rules.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v3, "classificationThreshold");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      sgMailIntelligenceLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v19, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, classification threshold is nil.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_41;
    }
    objc_msgSend(v3, "minCountToConsiderATokenAsHighlyDiscriminant");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      sgMailIntelligenceLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v21, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, minCountToConsiderATokenAsHighlyDiscriminant is nil.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v3, "ratioToConsiderATokenAsHighlyDiscriminant");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      sgMailIntelligenceLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      v31 = v27;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v27, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, ratioToConsiderATokenAsHighlyDiscriminant is nil.", buf, 2u);
      }
      v26 = 0;
      goto LABEL_39;
    }
    v30 = v20;
    objc_msgSend(v3, "minCountToConsiderATokenAsExtremelyDiscriminant");
    v22 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v22;
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v3, "ratioToConsiderATokenAsExtremelyDiscriminant");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = v24;
        v26 = -[SGMISaliencyModelConfig initWithSaliencyOverrideRules:featureNames:mean:std:groundTruthEstimatorRules:threshold:minCountToConsiderATokenAsHighlyDiscriminant:ratioToConsiderATokenAsHighlyDiscriminant:minCountToConsiderATokenAsExtremelyDiscriminant:ratioToConsiderATokenAsExtremelyDiscriminant:]([SGMISaliencyModelConfig alloc], "initWithSaliencyOverrideRules:featureNames:mean:std:groundTruthEstimatorRules:threshold:minCountToConsiderATokenAsHighlyDiscriminant:ratioToConsiderATokenAsHighlyDiscriminant:minCountToConsiderATokenAsExtremelyDiscriminant:ratioToConsiderATokenAsExtremelyDiscriminant:", v8, v10, v11, v12, v17, v18, v19, v30, v23, v24);
LABEL_38:

        v21 = v30;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      sgMailIntelligenceLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v28, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, ratioToConsiderATokenAsExtremelyDiscriminant is nil.", buf, 2u);
      }

      v25 = 0;
    }
    else
    {
      sgMailIntelligenceLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v25, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, minCountToConsiderATokenAsExtremelyDiscriminant is nil.", buf, 2u);
      }
    }
    v26 = 0;
    goto LABEL_38;
  }
  sgMailIntelligenceLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1C3607000, v10, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error in processing outstanding saliency rules.", buf, 2u);
  }
  v26 = 0;
LABEL_45:

  return v26;
}

+ (id)groundTruthVersion
{
  void *v2;
  void *v3;

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelGroundTruthVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)inferenceVersion
{
  void *v2;
  void *v3;

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelInferenceVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __40__SGMISaliencyModelConfig_defaultConfig__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[SGMIFeature prettyNamesReverseMapping](SGMIFeature, "prettyNamesReverseMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
