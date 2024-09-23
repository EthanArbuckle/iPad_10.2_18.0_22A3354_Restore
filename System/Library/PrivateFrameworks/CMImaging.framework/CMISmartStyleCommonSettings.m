@implementation CMISmartStyleCommonSettings

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance_instance;
}

void __45__CMISmartStyleCommonSettings_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;

  v0 = -[CMISmartStyleCommonSettings initLoadingSmartStyleSettings]([CMISmartStyleCommonSettings alloc]);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (void)initLoadingSmartStyleSettings
{
  id v1;
  void *v2;
  objc_super v4;

  if (!a1)
    return 0;
  v4.receiver = a1;
  v4.super_class = (Class)CMISmartStyleCommonSettings;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  v2 = v1;
  if (!v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v2;
  }
  if ((-[CMISmartStyleCommonSettings setupConfigurations]((uint64_t)v1) & 1) == 0
    || (-[CMISmartStyleCommonSettings loadTuningParameters]((uint64_t)v2) & 1) == 0
    || (-[CMISmartStyleCommonSettings loadTuningVariantAndCastSpecificStyleEngineTuningParameters]((uint64_t)v2) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v2;
}

+ (id)configurationForVariant:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[CMISmartStyleCommonSettings sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleCommonSettings configurationForVariant:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)configurationForVariant:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)tuningParametersForVariant:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[CMISmartStyleCommonSettings sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleCommonSettings tuningParametersForVariant:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tuningParametersForVariant:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)styleEngineSpecificTuningForTuningVariant:(id)a3 andCast:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[CMISmartStyleCommonSettings sharedInstance]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleCommonSettings styleEngineSpecificTuningForTuningVariant:andCast:]((uint64_t)v7, (uint64_t)v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)styleEngineSpecificTuningForTuningVariant:(void *)a3 andCast:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v5 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)setupConfigurations
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v2 && (v3 = (void *)objc_opt_new()) != 0)
  {
    v4 = v3;
    objc_msgSend(v3, "setLearningRateFramesPerSecond:", 30);
    objc_msgSend(v4, "setLearningRateMaxFramesPerSecond:", 30);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, &unk_1E9513D80);
    objc_storeStrong((id *)(a1 + 8), v2);

    v5 = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v5 = 0;
  }

  return v5;
}

- (uint64_t)loadTuningParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CMISmartStyleTuning *v17;
  CMISmartStyleTuning *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  id v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2
    || (v4 = (void *)MEMORY[0x1E0C99D80],
        objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SmartStyleTuning"), CFSTR("plist")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_42:
    v7 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V1"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)v7, "count"));
    if (v34)
    {
      v31 = a1;
      v32 = v6;
      v33 = v3;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = (id)v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SRLParameters"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1E95142C8, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16 || (v17 = objc_alloc_init(CMISmartStyleTuning)) == 0)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              goto LABEL_35;
            }
            v18 = v17;
            -[CMISmartStyleTuning setApplyMaxTemporalFilterOrder:](v17, "setApplyMaxTemporalFilterOrder:", objc_msgSend(v14, "cmi_unsignedIntValueForKey:defaultValue:found:", CFSTR("ApplyMaxTemporalFilterOrder"), 0, &v39));
            if (!v39)
              goto LABEL_32;
            -[CMISmartStyleTuning setLearningRate:](v18, "setLearningRate:", objc_msgSend(v14, "cmi_unsignedIntValueForKey:defaultValue:found:", CFSTR("LearningRate"), 0, &v39));
            if (!v39)
              goto LABEL_32;
            LODWORD(v19) = 0;
            objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("StatsUpdateDeltaTimeThreshold"), &v39, v19);
            -[CMISmartStyleTuning setStatsUpdateDeltaTimeThreshold:](v18, "setStatsUpdateDeltaTimeThreshold:");
            if (!v39)
              goto LABEL_32;
            LODWORD(v20) = 0;
            objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ANSTMasksMatchingTimeInSecondsThreshold"), &v39, v20);
            -[CMISmartStyleTuning setAnstMasksMatchingTimeInSecondsThreshold:](v18, "setAnstMasksMatchingTimeInSecondsThreshold:");
            if (!v39)
              goto LABEL_32;
            LODWORD(v21) = 0;
            objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CoefficientsFilteringHalfWindowTime"), &v39, v21);
            -[CMISmartStyleTuning setCoefficientsFilteringHalfWindowTime:](v18, "setCoefficientsFilteringHalfWindowTime:");
            if (!v39)
              goto LABEL_32;
            LODWORD(v22) = 0;
            objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CoefficientsFilteringGaussianScale"), &v39, v22);
            -[CMISmartStyleTuning setCoefficientsFilteringGaussianScale:](v18, "setCoefficientsFilteringGaussianScale:");
            if (!v39
              || (LODWORD(v23) = 0,
                  objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CoefficientsFilteringIIR1InitialHistoryFactor"), &v39, v23), -[CMISmartStyleTuning setCoefficientsFilteringIIR1InitialHistoryFactor:](v18, "setCoefficientsFilteringIIR1InitialHistoryFactor:"), !v39)|| (LODWORD(v24) = 0, objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CoefficientsFilteringIIR1MaxHistoryFactor"), &v39, v24), -[CMISmartStyleTuning setCoefficientsFilteringIIR1MaxHistoryFactor:](v18, "setCoefficientsFilteringIIR1MaxHistoryFactor:"),
                  !v39))
            {
LABEL_32:
              fig_log_get_emitter();
              FigDebugAssert3();
              goto LABEL_34;
            }
            LODWORD(v25) = 0;
            objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("CoefficientsFilteringIIR1HistoryFactorRampUpStep"), &v39, v25);
            -[CMISmartStyleTuning setCoefficientsFilteringIIR1HistoryFactorRampUpStep:](v18, "setCoefficientsFilteringIIR1HistoryFactorRampUpStep:");
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CoefficientsFilteringIIR3"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || objc_msgSend(v26, "count") != 5
              || (objc_msgSend(v26, "cmi_copyFloatValuesToBuffer:startingIndex:count:", -[CMISmartStyleTuning coefficientsFilteringIIR3](v18, "coefficientsFilteringIIR3"), 0, 5) & 1) == 0|| (LODWORD(v27) = 1036831949, objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", CFSTR("SRLCurrentValueWeight"), &v39, v27), -[CMISmartStyleTuning setSrlCurrentValueWeight:](v18, "setSrlCurrentValueWeight:"), !v39)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (-[CMISmartStyleTuning setSrlParameters:](v18, "setSrlParameters:", v15), -[CMISmartStyleTuning setSrlSkinToneLevelFilterMaxAgeFrames:](v18, "setSrlSkinToneLevelFilterMaxAgeFrames:",
                    objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", CFSTR("SRLSkinToneLevelFilterMaxAgeFrames"), 100, &v39)), !v39)|| (-[CMISmartStyleTuning setSrlSkinToneLevelFilterMaxFaceHistory:](v18, "setSrlSkinToneLevelFilterMaxFaceHistory:", objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", CFSTR("SRLSkinToneLevelFilterMaxFaceHistory"), 10, &v39)), !v39))
            {
              fig_log_get_emitter();
              FigDebugAssert3();

LABEL_34:
LABEL_35:

              v7 = v39 != 0;
              goto LABEL_36;
            }
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v18, v16);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v10)
            continue;
          break;
        }
      }

      v28 = *(void **)(v31 + 16);
      *(_QWORD *)(v31 + 16) = v34;
      v29 = v34;

      v7 = 1;
      v39 = 1;

LABEL_36:
      v3 = v33;
      goto LABEL_37;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_42;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_37:
  return v7;
}

- (uint64_t)loadTuningVariantAndCastSpecificStyleEngineTuningParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2
    || (v4 = (void *)MEMORY[0x1E0C99D80],
        objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SmartStyleCastSpecificStyleEngineTuning"), CFSTR("plist")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_10:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("V1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_10;
  }
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  v10 = 1;
LABEL_6:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineTuningsBySmartStyleTuningVariantAndCast, 0);
  objc_storeStrong((id *)&self->_tuningParametersByVariant, 0);
  objc_storeStrong((id *)&self->_configurationByVariant, 0);
}

@end
