@implementation SGMISaliencyModel

+ (id)defaultModel
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sgMailIntelligenceLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGMISaliencyModel: Loading CoreML model.", buf, 2u);
  }

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    sgMailIntelligenceLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "SGMISaliencyModel: Invalid model path specifeid via Trial configuration.";
      goto LABEL_22;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_20;
  }
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGMISaliencyModel: Loading model from Trial at path: %@", buf, 0xCu);
  }

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v5);
  if (!v7)
  {
    sgMailIntelligenceLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "SGMISaliencyModel: Error converting model path to file URL";
LABEL_22:
      _os_log_fault_impl(&dword_1C3607000, v8, OS_LOG_TYPE_FAULT, v15, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v8 = v7;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setComputeUnits:", 0);
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "SGMISaliencyModel: Finished loading CoreML model.", buf, 2u);
    }

    v14 = v10;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_fault_impl(&dword_1C3607000, v13, OS_LOG_TYPE_FAULT, "SGMISaliencyModel: Error while initializing MLModel: %@", buf, 0xCu);
    }

  }
LABEL_20:

  return v10;
}

+ (int64_t)ruleBasedInferenceFor:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SGMISaliencyModel ruleBasedInferenceFor:config:](SGMISaliencyModel, "ruleBasedInferenceFor:config:", v3, v4);

  return v5;
}

+ (int64_t)ruleBasedInferenceFor:(id)a3 config:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  if (!a4)
    return 2;
  v5 = a3;
  objc_msgSend(a4, "saliencyOverrideRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "evaluateFirstMatchAmong:defaultValue:", v6, 2);

  return v7;
}

+ (id)saliencyForFeatureVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  SGMISaliencyModelFeatureProvider *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SGMISaliencyModelOutput *v42;
  long double v43;
  double v44;
  long double v45;
  long double v46;
  long double v47;
  long double v48;
  _BOOL8 v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "featureNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "defaultModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v65 = a1;
      objc_msgSend(v4, "flatVectorForFeatureNames:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v8;
      objc_msgSend(v8, "modelDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputDescriptionsByName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("featureVector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "multiArrayConstraint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15;
      v17 = objc_msgSend(v9, "count");
      if (v17 == objc_msgSend(v15, "unsignedIntegerValue"))
      {
        v18 = objc_alloc(MEMORY[0x1E0C9E970]);
        v70[0] = &unk_1E7E0C128;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        v21 = (void *)objc_msgSend(v18, "initWithShape:dataType:error:", v20, 65568, &v68);
        v22 = v68;

        if (v21)
        {
          v63 = v22;
          v64 = v15;
          if (objc_msgSend(v9, "count"))
          {
            v23 = 0;
            do
            {
              objc_msgSend(v9, "objectAtIndexedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "doubleValue");
              v26 = v25;

              objc_msgSend(v6, "mean");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectAtIndexedSubscript:", v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              v30 = v29;

              objc_msgSend(v6, "std");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectAtIndexedSubscript:", v23);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "doubleValue");
              v34 = v33;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v26 - v30) / v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v69[0] = &unk_1E7E0C110;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v69[1] = v36;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, v37);

              ++v23;
            }
            while (objc_msgSend(v9, "count") > v23);
          }
          v38 = -[SGMISaliencyModelFeatureProvider initWithData:]([SGMISaliencyModelFeatureProvider alloc], "initWithData:", v21);
          v67 = v63;
          v8 = v66;
          objc_msgSend(v66, "predictionFromFeatures:error:", v38, &v67);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v67;

          if (v39)
          {
            objc_msgSend(v39, "featureValueForName:", CFSTR("Identity"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "multiArrayValue");
            v41 = objc_claimAutoreleasedReturnValue();

            v61 = v39;
            if (v41)
            {
              v42 = -[SGMISaliencyModelOutput initWithData:]([SGMISaliencyModelOutput alloc], "initWithData:", v41);
              -[SGMISaliencyModelOutput regularScore](v42, "regularScore");
              v44 = exp(v43);
              -[SGMISaliencyModelOutput salientScore](v42, "salientScore");
              v46 = exp(v45);
              v47 = v46 / (v44 + v46);
              objc_msgSend(v65, "saliencyThreshold");
              v49 = v47 > v48;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v47);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v49;
              v8 = v66;
              objc_msgSend(v4, "saliencyWithScore:isSalient:", v50, v51);
              v52 = (void *)v41;
              v53 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              sgMailIntelligenceLogHandle();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1C3607000, v59, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while parsing SGMISaliencyModel inference.", buf, 2u);
              }

              objc_msgSend(v4, "defaultSaliencyOnError");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0;
            }
            v16 = v64;
            v22 = v62;

            v39 = v61;
          }
          else
          {
            sgMailIntelligenceLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            v22 = v62;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v72 = v62;
              _os_log_error_impl(&dword_1C3607000, v58, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while running SGMISaliencyModel inference: %@", buf, 0xCu);
            }

            objc_msgSend(v4, "defaultSaliencyOnError");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v64;
          }

        }
        else
        {
          sgMailIntelligenceLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v72 = v22;
            _os_log_error_impl(&dword_1C3607000, v57, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while initializing MLMultiArray for SGMISaliencyModel inference: %@", buf, 0xCu);
          }

          objc_msgSend(v4, "defaultSaliencyOnError");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v66;
        }

      }
      else
      {
        sgMailIntelligenceLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v15;
          v73 = 2048;
          v74 = objc_msgSend(v9, "count");
          _os_log_error_impl(&dword_1C3607000, v56, OS_LOG_TYPE_ERROR, "Error while preparing feature vector for mlmodel: dimension mismatch, expecting %@ got %lu", buf, 0x16u);
        }

        objc_msgSend(v4, "defaultSaliencyOnError");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v66;
      }

    }
    else
    {
      sgMailIntelligenceLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v55, OS_LOG_TYPE_ERROR, "Error - Couldn't get default saliency model when trying to run inference.", buf, 2u);
      }

      objc_msgSend(v4, "defaultSaliencyOnError");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v54, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Unable to load SGMISaliencyModelConfig defaultConfig", buf, 2u);
    }

    objc_msgSend(v4, "defaultSaliencyOnError");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v53;
}

+ (double)saliencyThreshold
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "threshold");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

  }
  else
  {
    v6 = 2.0;
  }

  return v6;
}

+ (id)getSaliencyOutputOf:(id)a3 forArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SGMISaliencyModelFeatureProvider *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SGMISaliencyModelOutput *v21;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  v26[0] = &unk_1E7E0C128;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v10 = (void *)objc_msgSend(v7, "initWithShape:dataType:error:", v9, 65568, &v24);
  v11 = v24;

  if (v10)
  {
    if (objc_msgSend(v6, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = &unk_1E7E0C110;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v15);

        ++v12;
      }
      while (objc_msgSend(v6, "count") > v12);
    }
    v16 = -[SGMISaliencyModelFeatureProvider initWithData:]([SGMISaliencyModelFeatureProvider alloc], "initWithData:", v10);
    v23 = v11;
    objc_msgSend(v5, "predictionFromFeatures:error:", v16, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;

    if (v17)
    {
      objc_msgSend(v17, "featureValueForName:", CFSTR("Identity"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "multiArrayValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = -[SGMISaliencyModelOutput initWithData:]([SGMISaliencyModelOutput alloc], "initWithData:", v20);
      else
        v21 = 0;

    }
    else
    {
      v21 = 0;
    }

    v11 = v18;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
