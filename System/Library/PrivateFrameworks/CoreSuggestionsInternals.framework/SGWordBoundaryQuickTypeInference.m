@implementation SGWordBoundaryQuickTypeInference

+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6
{
  return +[SGWordBoundaryQuickTypeInference quickTypeTriggerForContext:localeIdentifier:modelConfigPath:espressoBinFilePath:useContactNames:](SGWordBoundaryQuickTypeInference, "quickTypeTriggerForContext:localeIdentifier:modelConfigPath:espressoBinFilePath:useContactNames:", a3, a4, a5, a6, 1);
}

+ (id)quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6 useContactNames:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void (**v50)(void);
  int64_t v51;
  NSObject *log;
  void *v53;
  NSObject *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  _BYTE *v60;
  BOOL v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  int64_t v71;
  __int16 v72;
  void *v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  __CFString *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0D19EC0], "languageForLocaleIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v13);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TARGET_LANGUAGE"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = -[NSObject isEqualToString:](v20, "isEqualToString:", v15);

        if ((v22 & 1) != 0)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PREDICTION_PARAMETERS"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("CONFIDENCE_THRESHOLDS"));
          v54 = objc_claimAutoreleasedReturnValue();

          if (!v54 || -[NSObject count](v54, "count") != 7)
          {
            sgQuicktypeLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v38 = (uint64_t)v54;
              if (v54)
                v38 = -[NSObject count](v54, "count");
              *(_DWORD *)v76 = 134218240;
              *(_QWORD *)&v76[4] = v38;
              *(_WORD *)&v76[12] = 2048;
              *(_QWORD *)&v76[14] = 7;
              _os_log_error_impl(&dword_1C3607000, v35, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - Unexpected number of confidence thresholds (%ld rather than %ld)", v76, 0x16u);
            }

            v33 = 0;
            goto LABEL_31;
          }
          if (quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__onceToken != -1)
            dispatch_once(&quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__onceToken, &__block_literal_global_1296);
          *(_QWORD *)v76 = 0;
          *(_QWORD *)&v76[8] = v76;
          *(_QWORD *)&v76[16] = 0x3032000000;
          v77 = __Block_byref_object_copy__1287;
          v78 = __Block_byref_object_dispose__1288;
          v79 = &stru_1E7DB83A8;
          v62 = 0;
          v63 = &v62;
          v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__1287;
          v66 = __Block_byref_object_dispose__1288;
          v67 = 0;
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_17;
          v56[3] = &unk_1E7DA8120;
          v59 = &v62;
          v60 = v76;
          v61 = a7;
          v57 = v15;
          v24 = v55;
          v58 = v24;
          v50 = (void (**)(void))MEMORY[0x1C3BD5158](v56);
          v74[0] = CFSTR("INPUT_TEXT");
          v74[1] = CFSTR("NEGATIVE_SAMPLE_CHOPLESS");
          v75[0] = v24;
          v75[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGEspressoModel modelWithConfigPath:binPath:](SGContactSharingModel, "modelWithConfigPath:binPath:", v13, v14);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v25;
          if (!v25)
          {
            sgQuicktypeLogHandle();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v69 = (uint64_t)v13;
              v70 = 2112;
              v71 = (int64_t)v14;
              _os_log_fault_impl(&dword_1C3607000, log, OS_LOG_TYPE_FAULT, "SGWordBoundaryQuickTypeInference - Could not initialize model with config path: %@, bin path: %@", buf, 0x16u);
            }
            v33 = 0;
            goto LABEL_30;
          }
          objc_msgSend(v25, "predictForInput:", v53);
          log = objc_claimAutoreleasedReturnValue();
          v51 = +[SGContactSharingModel labelForProbabilities:](SGContactSharingModel, "labelForProbabilities:");
          if (!v51)
          {
            sgQuicktypeLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v69 = (uint64_t)v45;
              _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - Irrelevant Label predicted with score: %@", buf, 0xCu);

            }
            goto LABEL_28;
          }
          -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;
          -[NSObject objectAtIndexedSubscript:](v54, "objectAtIndexedSubscript:", v51);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          v47 = v28 < v30;

          if (v47)
          {
            sgQuicktypeLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", v51);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectAtIndexedSubscript:](v54, "objectAtIndexedSubscript:", v51);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v69 = v51;
              v70 = 2112;
              v71 = (int64_t)v48;
              v72 = 2112;
              v73 = v32;
              _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - Predicted label (%ld) confidence (%@), falls below confidence threshold (%@)!", buf, 0x20u);

            }
          }
          else
          {
            if (!objc_msgSend(a1, "_probablePriorPredictionInContext:predictedLabel:", v24, v51))
            {
              sgQuicktypeLogHandle();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", v51);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v69 = 4;
                v70 = 2048;
                v71 = v51;
                v72 = 2112;
                v73 = v46;
                _os_log_debug_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - objective: %lu, prediction: %ld, score: %@", buf, 0x20u);

              }
              v40 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectForKeyedSubscript:", v41);
              v31 = objc_claimAutoreleasedReturnValue();

              if ((unint64_t)(v51 - 4) > 2)
              {
                v43 = v31;
                v31 = v43;
              }
              else
              {
                v50[2]();
                v42 = (void *)v63[5];
                if (v42 == *(void **)(*(_QWORD *)&v76[8] + 40))
                {
                  sgQuicktypeLogHandle();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    v69 = v51;
                    _os_log_debug_impl(&dword_1C3607000, v44, OS_LOG_TYPE_DEBUG, "SGWordBoundaryQuickTypeInference - No name found for thirdparty objective: %ld", buf, 0xCu);
                  }

                  goto LABEL_28;
                }
                __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_2(v31, v42);
                v43 = objc_claimAutoreleasedReturnValue();
              }
              v33 = v43;
              goto LABEL_29;
            }
            sgQuicktypeLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", v51);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v69 = v51;
              v70 = 2112;
              v71 = (int64_t)v37;
              _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "SGWordBoundaryQuickTypeInference - probable prior prediction of label %ld (score: %@) detected.", buf, 0x16u);

            }
          }
LABEL_28:
          v33 = 0;
LABEL_29:

LABEL_30:
          _Block_object_dispose(&v62, 8);

          _Block_object_dispose(v76, 8);
LABEL_31:
          v34 = v54;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {

      }
      sgQuicktypeLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v76 = 138412802;
        *(_QWORD *)&v76[4] = v12;
        *(_WORD *)&v76[12] = 2112;
        *(_QWORD *)&v76[14] = v15;
        *(_WORD *)&v76[22] = 2112;
        v77 = (uint64_t (*)(uint64_t, uint64_t))v21;
        _os_log_error_impl(&dword_1C3607000, v34, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - localeIdentifier/language (%@/%@) do not match configured target language (%@)", v76, 0x20u);
      }
      v33 = 0;
      goto LABEL_32;
    }
  }
  sgQuicktypeLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v76 = 0;
    _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGWordBoundaryQuickTypeInference - Invalid model config!", v76, 2u);
  }
  v33 = 0;
LABEL_33:

  return v33;
}

+ (BOOL)_probablePriorPredictionInContext:(id)a3 predictedLabel:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__1287;
  v12[4] = __Block_byref_object_dispose__1288;
  v13 = 0;
  +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v5, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__SGWordBoundaryQuickTypeInference__probablePriorPredictionInContext_predictedLabel___block_invoke;
  v11[3] = &unk_1E7DA8148;
  v11[4] = v12;
  v6 = MEMORY[0x1C3BD5158](v11);
  v7 = (void *)v6;
  if ((unint64_t)(a4 - 1) >= 6)
  {
    sgQuicktypeLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a4;
      _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "SGWordBoundaryQuickTypeInference - Unexpected label %ld", buf, 0xCu);
    }

    v8 = 1;
  }
  else
  {
    v8 = (*(uint64_t (**)(uint64_t, _QWORD))(v6 + 16))(v6, dword_1C3853530[a4 - 1]);
  }

  _Block_object_dispose(v12, 8);
  return v8;
}

uint64_t __85__SGWordBoundaryQuickTypeInference__probablePriorPredictionInContext_predictedLabel___block_invoke(uint64_t a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "matchType", (_QWORD)v10) == a2)
        {
          v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

void __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  SGNameDetector *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
  {
    objc_storeStrong(v3, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v5 = 2 * (*(_BYTE *)(a1 + 64) == 0);
    v6 = -[SGNameDetector initWithLanguage:]([SGNameDetector alloc], "initWithLanguage:", *(_QWORD *)(a1 + 32));
    -[SGNameDetector detectNames:algorithm:](v6, "detectNames:algorithm:", *(_QWORD *)(a1 + 40), v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      v9 = objc_msgSend(v7, "range");
      objc_msgSend(v8, "substringWithRange:", v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }
}

id __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v7 = quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__givenNameQualifier;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey);

  return v4;
}

void __132__SGWordBoundaryQuickTypeInference_quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[6];
  _QWORD v42[8];

  v42[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)*MEMORY[0x1E0D432C8];
  v1 = (void *)*MEMORY[0x1E0D433C0];
  v2 = (void *)*MEMORY[0x1E0D432F8];
  v3 = (void *)*MEMORY[0x1E0D432A8];
  v4 = (void *)*MEMORY[0x1E0D43428];
  v5 = (void *)*MEMORY[0x1E0D433B8];
  v6 = (void *)*MEMORY[0x1E0D43400];
  v7 = (void *)*MEMORY[0x1E0D43320];
  v8 = (void *)*MEMORY[0x1E0D43418];
  v9 = (id)*MEMORY[0x1E0D433D0];
  v10 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey;
  quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__qualifiersKey = (uint64_t)v9;
  v27 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v14 = v4;
  v15 = v3;
  v16 = v2;
  v17 = v1;
  v18 = v0;

  objc_storeStrong((id *)&quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__givenNameQualifier, (id)*MEMORY[0x1E0D43340]);
  v40[2] = v11;
  v41[0] = &unk_1E7E0BD68;
  v39[0] = v18;
  v39[1] = v14;
  v40[0] = v17;
  v40[1] = v13;
  v39[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v28;
  v41[1] = &unk_1E7E0BD80;
  v37[0] = v18;
  v37[1] = v14;
  v38[0] = v16;
  v38[1] = v13;
  v37[2] = v12;
  v38[2] = v11;
  v26 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v25;
  v41[2] = &unk_1E7E0BD98;
  v35[0] = v18;
  v35[1] = v14;
  v36[0] = v15;
  v36[1] = v13;
  v35[2] = v12;
  v36[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v24;
  v41[3] = &unk_1E7E0BDB0;
  v33[0] = v18;
  v33[1] = v14;
  v34[0] = v17;
  v34[1] = v13;
  v33[2] = v12;
  v34[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v19;
  v41[4] = &unk_1E7E0BDC8;
  v31[0] = v18;
  v31[1] = v14;
  v32[0] = v16;
  v32[1] = v13;
  v31[2] = v12;
  v32[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v20;
  v41[5] = &unk_1E7E0BDE0;
  v29[0] = v18;
  v29[1] = v14;
  v30[0] = v15;
  v30[1] = v13;
  v29[2] = v12;
  v30[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel;
  quickTypeTriggerForContext_localeIdentifier_modelConfigPath_espressoBinFilePath_useContactNames__triggerForLabel = v22;

}

@end
