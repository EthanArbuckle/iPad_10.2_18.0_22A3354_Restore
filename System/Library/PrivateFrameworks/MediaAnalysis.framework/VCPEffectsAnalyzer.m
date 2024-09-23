@implementation VCPEffectsAnalyzer

- (VCPEffectsAnalyzer)initWithAnalysisResults:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  VCPEffectsAnalyzer *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  v8 = -[VCPEffectsAnalyzer initWithFlagHasFaceOrPet:](self, "initWithFlagHasFaceOrPet:", v6);

  return v8;
}

- (VCPEffectsAnalyzer)initWithFlagHasFaceOrPet:(BOOL)a3
{
  VCPEffectsAnalyzer *v4;
  VCPEffectsAnalyzer *v5;
  VCPEffectsAnalyzer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPEffectsAnalyzer;
  v4 = -[VCPEffectsAnalyzer init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hasFaceOrPet = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)isAutoLoopFramworkAvailable
{
  if (isAutoLoopFramworkAvailable_once_token != -1)
    dispatch_once(&isAutoLoopFramworkAvailable_once_token, &__block_literal_global_63);
  return (isAutoLoopFramworkAvailable_available & 1) == 0;
}

void __49__VCPEffectsAnalyzer_isAutoLoopFramworkAvailable__block_invoke()
{
  uint8_t v0[8];
  uint64_t (*v1)(void);

  v1 = MEMORY[0x1E0D00538];
  if (!MEMORY[0x1E0D00538])
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AutoLoop framework not available", v0, 2u);
    }
    isAutoLoopFramworkAvailable_available = 1;
  }
}

+ (BOOL)usePHAssetScene
{
  return 1;
}

- (int)analyzeAsset:(id)a3 onDemand:(BOOL)a4 cancel:(id)a5 statsFlags:(unint64_t *)a6 results:(id *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  int v32;
  NSObject *v33;
  const char *v34;
  os_log_type_t v35;
  uint32_t v36;
  int v37;
  id v38;
  id v39;
  void *v40;
  const void *v41;
  void *v42;
  const void *v43;
  char v44;
  id v45;
  int v46;
  NSObject *v47;
  const char *v48;
  os_log_type_t v49;
  uint32_t v50;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  int GatingResult;
  void *v58;
  int v59;
  uint64_t v60;
  int v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id *v88;
  const void *v89;
  void *v90;
  void *v91;
  uint64_t AutoLoopSettingsForAsset;
  CFTypeRef cf;
  void *v94;
  void *v95;
  void *v96;
  id v97[2];
  _QWORD v98[4];
  id v99;
  uint64_t v100;
  uint8_t v101[8];
  uint64_t v102;
  _QWORD aBlock[4];
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  int v108;
  const __CFString *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  uint8_t buf[16];
  _QWORD v115[2];
  _QWORD v116[2];
  const __CFString *v117;
  void *v118;
  void *v119;
  const __CFString *v120;
  _QWORD v121[4];

  v10 = a4;
  v121[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (+[VCPEffectsAnalyzer isAutoLoopFramworkAvailable](VCPEffectsAnalyzer, "isAutoLoopFramworkAvailable"))
  {
    if (objc_msgSend(v12, "isLivePhoto"))
    {
      objc_msgSend(v12, "originalMovie");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v96)
      {
        v120 = CFSTR("LivePhotoEffectsResults");
        v117 = CFSTR("attributes");
        v115[0] = CFSTR("loopSuggestionState");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v116[0] = v23;
        v115[1] = CFSTR("longExposureSuggestionState");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v116[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v121[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, &v120, 1);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        v22 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v88 = a7;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      v107 = 0;
      AutoLoopSettingsForAsset = createAutoLoopSettingsForAsset();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("autoloop-tmp-%@"), v16);
      v17 = objc_claimAutoreleasedReturnValue();

      NSTemporaryDirectory();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)v17;
      objc_msgSend(v18, "stringByAppendingPathComponent:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      v94 = (void *)v19;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v19);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      cf = (CFTypeRef)createBundleDefaultGatingClassifierURL();
      objc_msgSend(v12, "mainFileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v12, "mainFileURL");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

      v28 = AutoLoopSettingsForAsset;
      v89 = (const void *)v21;
      autoloopSettingsSetGating();
      if (!v10)
      {
        autoloopSettingsSetOptimizeForMemoryUse();
        autoloopSettingsSetDisableStabilizationGPU();
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v29, "fileExistsAtPath:", v19))
      {
LABEL_22:
        v105 = 0;
        v37 = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v95, 1, 0, &v105);
        v38 = v105;
        v39 = v38;
        if (!v37)
        {
          v40 = v38;
          v22 = -50;
          goto LABEL_26;
        }
        if (v108)
        {
          v40 = v38;
          v22 = 0;
LABEL_26:
          v41 = v89;
          v42 = v90;
          v43 = cf;
          goto LABEL_27;
        }
        v52 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke;
        aBlock[3] = &unk_1E6B19FD8;
        v104 = v13;
        v53 = _Block_copy(aBlock);
        *(_OWORD *)buf = xmmword_1B6FBF4E0;
        v87 = v53;
        v108 = runLiveAnalysisPipeline();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v94, CFSTR("gatingData.plist"));
        v54 = objc_claimAutoreleasedReturnValue();
        v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v54);
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("gatingResults"));
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v55;
        if (!v108)
        {
          v80 = (void *)v54;
          v83 = (void *)v55;
          v102 = 0;
          GatingResult = getGatingResult();
          v82 = 0;
          if (GatingResult == 1)
          {
            v84 = 2;
            if (!self->_hasFaceOrPet && v83)
            {
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Reading activity from gatingDataPlist.", v101, 2u);
              }
              objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("loopActivityDecision"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend(CFSTR("ALGatingResultPass"), "isEqualToString:", v58);
              v60 = 1;
              if (!v59)
                v60 = 2;
              v84 = v60;

            }
          }
          else
          {
            v84 = 2;
          }
          v100 = 0;
          v85 = 2;
          v61 = getGatingResult();
          v81 = 0;
          if (v61 == 1)
          {
            if (self->_hasFaceOrPet)
            {
              v85 = 2;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v98[0] = v52;
              v98[1] = 3221225472;
              v98[2] = __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke_174;
              v98[3] = &unk_1E6B1A000;
              v62 = (id)objc_claimAutoreleasedReturnValue();
              v99 = v62;
              -[VCPEffectsAnalyzer enumerateMatchingScenesOfAsset:forLongExposureUsingBlock:](self, "enumerateMatchingScenesOfAsset:forLongExposureUsingBlock:", v12, v98);
              v63 = objc_msgSend(v62, "count");
              v64 = 1;
              if (!v63)
                v64 = 2;
              v85 = v64;
              if (v63 && v10)
              {
                objc_msgSend(v62, "allObjects");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "setObject:forKeyedSubscript:", v65, CFSTR("livePhotoEffectsMatchingScenes"));

              }
            }
          }
          if (v10)
          {
            v97[1] = 0;
            getGatingResult();
            v79 = 0;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
            {
              objc_msgSend(&unk_1E6B74840, "stringValue");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v82, v67);

            }
            if (v79)
            {
              objc_msgSend(&unk_1E6B74858, "stringValue");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v79, v68);

            }
            if (v81)
            {
              objc_msgSend(&unk_1E6B74870, "stringValue");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v81, v69);

            }
            objc_msgSend(v91, "setObject:forKeyedSubscript:", v66, CFSTR("livePhotoEffectsGatingDescriptions"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v84);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKey:", v70, CFSTR("loopSuggestionState"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v85);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKey:", v71, CFSTR("longExposureSuggestionState"));

          liveAnalysisResultToDictionary();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72 && (v10 || v84 == 1 || v85 == 1))
          {
            +[VCPProtoLivePhotoEffectsRecipe resultFromLegacyDictionary:](VCPProtoLivePhotoEffectsRecipe, "resultFromLegacyDictionary:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "data");
            v74 = objc_claimAutoreleasedReturnValue();
            if (!v74)
            {
              v40 = v39;

              v22 = -50;
LABEL_86:
              v41 = v89;
              v42 = v90;
              v28 = AutoLoopSettingsForAsset;
              v43 = cf;

LABEL_27:
              if (v107)
                liveAnalysisResultDestroy();
              if (v43)
                CFRelease(v43);
              if (v41)
                CFRelease(v41);
              if (v28)
                autoloopSettingsDestroy();
              if (!objc_msgSend(v29, "fileExistsAtPath:", v94))
                goto LABEL_45;
              v97[0] = 0;
              v44 = objc_msgSend(v29, "removeItemAtPath:error:", v94, v97);
              v45 = v97[0];
              v46 = MediaAnalysisLogLevel();
              if ((v44 & 1) != 0)
              {
                if (v46 < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  goto LABEL_44;
                *(_WORD *)buf = 0;
                v47 = MEMORY[0x1E0C81028];
                v48 = "Autoloop working directory removed";
                v49 = OS_LOG_TYPE_DEBUG;
                v50 = 2;
              }
              else
              {
                if (v46 < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_44;
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v45;
                v47 = MEMORY[0x1E0C81028];
                v48 = "Failed to remove Autoloop working directory (%@)";
                v49 = OS_LOG_TYPE_DEFAULT;
                v50 = 12;
              }
              _os_log_impl(&dword_1B6C4A000, v47, v49, v48, buf, v50);
LABEL_44:

LABEL_45:
              v23 = v91;
              goto LABEL_46;
            }
            v75 = (void *)v74;
            objc_msgSend(v91, "setObject:forKey:", v74, CFSTR("livePhotoEffectsRecipe"));

          }
          v56 = v83;
          v54 = (uint64_t)v80;
        }
        v76 = (void *)v54;
        v40 = v39;
        *a6 |= -[VCPEffectsAnalyzer generateStatsToBeCollectedFrom:](self, "generateStatsToBeCollectedFrom:", v56);
        -[VCPEffectsAnalyzer reportLivePhotoEffectAnalysisResults:](self, "reportLivePhotoEffectAnalysisResults:", v56);
        if (objc_msgSend(v91, "count"))
        {
          v112 = CFSTR("LivePhotoEffectsResults");
          v109 = CFSTR("attributes");
          v110 = v91;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = v78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
          *v88 = (id)objc_claimAutoreleasedReturnValue();

        }
        v22 = 0;
        goto LABEL_86;
      }
      v106 = 0;
      v30 = objc_msgSend(v29, "removeItemAtPath:error:", v19, &v106);
      v31 = v106;
      v32 = MediaAnalysisLogLevel();
      if ((v30 & 1) != 0)
      {
        if (v32 < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          goto LABEL_21;
        *(_WORD *)buf = 0;
        v33 = MEMORY[0x1E0C81028];
        v34 = "Existing Autoloop working directory removed";
        v35 = OS_LOG_TYPE_DEBUG;
        v36 = 2;
      }
      else
      {
        if (v32 < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v31;
        v33 = MEMORY[0x1E0C81028];
        v34 = "Failed to remove existing Autoloop working directory (%@)";
        v35 = OS_LOG_TYPE_DEFAULT;
        v36 = 12;
      }
      _os_log_impl(&dword_1B6C4A000, v33, v35, v34, buf, v36);
LABEL_21:

      v28 = AutoLoopSettingsForAsset;
      goto LABEL_22;
    }
    v22 = 0;
  }
  else
  {
    v22 = -18;
  }
LABEL_47:

  return v22;
}

uint64_t __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __70__VCPEffectsAnalyzer_analyzeAsset_onDemand_cancel_statsFlags_results___block_invoke_174(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  *a3 = 1;
  return result;
}

- (id)matchingNodeForSceneClassification:(id)a3 inSceneNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__39;
  v21 = __Block_byref_object_dispose__39;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeForSceneClassId:", objc_msgSend(v5, "sceneIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v5, "confidence"), v10 = v9, objc_msgSend(v8, "searchThreshold"), v10 >= v11))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__VCPEffectsAnalyzer_matchingNodeForSceneClassification_inSceneNames___block_invoke;
    v14[3] = &unk_1E6B1A028;
    v15 = v6;
    v16 = &v17;
    objc_msgSend(v8, "traverse:visitor:", 0, v14);
    v12 = (id)v18[5];

  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __70__VCPEffectsAnalyzer_matchingNodeForSceneClassification_inSceneNames___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v7;
}

- (id)performanSceneClassificationOfImageFileAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  float v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1BCCA1B2C]();
  v5 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v6 = objc_msgSend(v5, "initWithURL:options:", v3, MEMORY[0x1E0C9AA70]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_alloc_init(MEMORY[0x1E0CEE020]);
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setPreferBackgroundProcessing:", 1);
      objc_msgSend(v9, "setRevision:", 2);
      v36[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "performRequests:error:", v10, 0);

      v12 = 0;
      if (v11)
      {
        v28 = v4;
        v29 = v3;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v9, "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "nodeForName:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = (void *)MEMORY[0x1E0CD1758];
              v23 = objc_msgSend(v21, "extendedSceneClassId");
              objc_msgSend(v18, "confidence");
              objc_msgSend(v22, "vcp_instanceWithExtendedSceneIdentifier:confidence:", v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v25);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v15);
        }

        v3 = v29;
        v12 = v30;
        v4 = v28;
      }
    }
    else
    {
      v12 = 0;
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_autoreleasePoolPop(v4);
    v12 = 0;
  }
  v26 = v12;

  return v26;
}

- (int)enumerateMatchingScenesOfAsset:(id)a3 forLongExposureUsingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76818);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          v11 = +[VCPEffectsAnalyzer usePHAssetScene](VCPEffectsAnalyzer, "usePHAssetScene"),
          v10,
          !v11)
      || (objc_msgSend(v6, "allScenes"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v6, "mainFileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPEffectsAnalyzer performanSceneClassificationOfImageFileAtURL:](self, "performanSceneClassificationOfImageFileAtURL:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          -[VCPEffectsAnalyzer matchingNodeForSceneClassification:inSceneNames:](self, "matchingNodeForSceneClassification:inSceneNames:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v24 = 0;
            objc_msgSend(v19, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v21, &v24);

            if (v24)
            {

              goto LABEL_18;
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_18:

    v22 = 0;
  }
  else
  {
    v22 = -50;
  }

  return v22;
}

+ (id)gatingTypeKeys
{
  if (gatingTypeKeys_once != -1)
    dispatch_once(&gatingTypeKeys_once, &__block_literal_global_201);
  return (id)gatingTypeKeys_gatingTypeKeys;
}

void __36__VCPEffectsAnalyzer_gatingTypeKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mShortInputDecision");
  v2[1] = CFSTR("mPreGateStillMetadataDecision");
  v2[2] = CFSTR("mPreGateVideoTrimDecision");
  v2[3] = CFSTR("mPreGateVideoMLDecision");
  v2[4] = CFSTR("mPreGateFacesDecision");
  v2[5] = CFSTR("stabilizeGateDecision");
  v2[6] = CFSTR("postGateDecision");
  v2[7] = CFSTR("finalDecision");
  v2[8] = CFSTR("loopActivityDecision");
  v2[9] = CFSTR("bounceActivityDecision");
  v2[10] = CFSTR("longexpActivityDecision");
  v2[11] = CFSTR("stabilizeResult");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gatingTypeKeys_gatingTypeKeys;
  gatingTypeKeys_gatingTypeKeys = v0;

}

+ (id)gatingResultKeyToIndex
{
  if (gatingResultKeyToIndex_once != -1)
    dispatch_once(&gatingResultKeyToIndex_once, &__block_literal_global_202);
  return (id)gatingResultKeyToIndex_gatingResultKeyToIndex;
}

void __44__VCPEffectsAnalyzer_gatingResultKeyToIndex__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ALGatingResultError");
  v2[1] = CFSTR("ALGatingResultUnset");
  v3[0] = &unk_1E6B74888;
  v3[1] = &unk_1E6B748A0;
  v2[2] = CFSTR("ALGatingResultFail");
  v2[3] = CFSTR("ALGatingResultPass");
  v3[2] = &unk_1E6B748B8;
  v3[3] = &unk_1E6B748D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gatingResultKeyToIndex_gatingResultKeyToIndex;
  gatingResultKeyToIndex_gatingResultKeyToIndex = v0;

}

+ (id)getResultIndex:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = &unk_1E6B748E8;
  if (a3)
  {
    v4 = a3;
    +[VCPEffectsAnalyzer gatingResultKeyToIndex](VCPEffectsAnalyzer, "gatingResultKeyToIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v6;
    else
      v7 = &unk_1E6B748E8;
    v3 = v7;

  }
  return v3;
}

- (void)reportLivePhotoEffectAnalysisResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(void *, const __CFString *, const __CFString *);
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  VCPEffectsAnalyzer *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VCPEffectsAnalyzer_reportLivePhotoEffectAnalysisResults___block_invoke;
  aBlock[3] = &unk_1E6B1A050;
  v12 = v5;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = v5;
  v8 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stabilizeResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("LivePhotoEffectsStabilizeResult"));

  v8[2](v8, CFSTR("LivePhotoEffectsShortInputDecision"), CFSTR("mShortInputDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsPreGateStillMetadataDecision"), CFSTR("mPreGateStillMetadataDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsPreGateVideoTrimDecision"), CFSTR("mPreGateVideoTrimDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsPreGateVideoMLDecision"), CFSTR("mPreGateVideoMLDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsPreGateFacesDecision"), CFSTR("mPreGateFacesDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsStabilizeGateDecision"), CFSTR("stabilizeGateDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsPostGateDecision"), CFSTR("postGateDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsFinalGateDecision"), CFSTR("finalDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsLoopActivityDecision"), CFSTR("loopActivityDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsBounceActivityDecision"), CFSTR("bounceActivityDecision"));
  v8[2](v8, CFSTR("LivePhotoEffectsLongexpActivityDecision"), CFSTR("longexpActivityDecision"));
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.livephotoeffectanalysisresults"), v7);

}

void __59__VCPEffectsAnalyzer_reportLivePhotoEffectAnalysisResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getResultIndex:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

}

- (unint64_t)generateStatsToBeCollectedFrom:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v17;

  v3 = a3;
  +[VCPEffectsAnalyzer gatingTypeKeys](VCPEffectsAnalyzer, "gatingTypeKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPEffectsAnalyzer gatingResultKeyToIndex](VCPEffectsAnalyzer, "gatingResultKeyToIndex");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = 2;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MediaAnalysisLivePhotoGatingResultKeyToType(v7);
      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("stabilizeResult"));
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          v13 = objc_msgSend(v11, "integerValue");

          v14 = v13 + 3;
          if (v14 >= 8)
            goto LABEL_12;
        }
        else
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v15, "integerValue");

          if (v14 > 3)
          {
LABEL_12:

            v6 = 0;
            goto LABEL_13;
          }
        }
        v6 |= 1 << v9 << v14;
      }

      if (objc_msgSend(v4, "count") <= (unint64_t)++v5)
        goto LABEL_13;
    }
  }
  v6 = 2;
LABEL_13:

  return v6;
}

@end
