@implementation AXMCaptionDetectorNode

+ (CGSize)preferredModelInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 448.0;
  v3 = 448.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMCaptionDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v3, sel_nodeInitialize);
  self->_lock._os_unfair_lock_opaque = 0;
}

- (void)dealloc
{
  CVNLPCaptionHandler *captionHandlerRef;
  objc_super v4;

  captionHandlerRef = self->_captionHandlerRef;
  if (captionHandlerRef)
  {
    CFRelease(captionHandlerRef);
    self->_captionHandlerRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXMCaptionDetectorNode;
  -[AXMCaptionDetectorNode dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCaptionDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMCaptionDetectorNode *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMCaptionDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideModelURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMCaptionDetectorNode setOverrideModelURL:](v5, "setOverrideModelURL:", v6);

    -[AXMCaptionDetectorNode setOverrideScaleMethod:](v5, "setOverrideScaleMethod:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideScaleMethod")));
    -[AXMCaptionDetectorNode setGenderStrategy:](v5, "setGenderStrategy:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("genderStrategy")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneDetector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMCaptionDetectorNode setSceneDetector:](v5, "setSceneDetector:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMCaptionDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[AXMCaptionDetectorNode overrideModelURL](self, "overrideModelURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("overrideModelURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMCaptionDetectorNode overrideScaleMethod](self, "overrideScaleMethod") != 0, CFSTR("overrideScaleMethod"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCaptionDetectorNode genderStrategy](self, "genderStrategy"), CFSTR("genderStrategy"));
  -[AXMCaptionDetectorNode sceneDetector](self, "sceneDetector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sceneDetector"));

}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "physicalMemory") < 0x77359400)
    v3 = 0;
  else
    v3 = AXRuntimeCheck_HasANE();

  return v3;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return CFSTR("Caption Detector");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMCaptionDetectorNode;
  -[AXMEvaluationNode evaluate:metrics:](&v13, sel_evaluate_metrics_, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke;
  v10[3] = &unk_1E625D9D0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v10);

}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  AXMLanguageTranslator *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  _QWORD *v50;
  void *v51;
  id v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  _BOOL4 v58;
  _BOOL4 v59;
  NSObject *v60;
  NSObject *v61;
  id WeakRetained;
  BOOL v63;
  void *v64;
  NSObject *v65;
  CFTypeRef cf;
  unsigned int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t v78[128];
  _BYTE buf[24];
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "_withLock_captionHandlerCreateIfNeeded:", *(_QWORD *)(a1 + 40)))
  {
    AXMediaLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1();
LABEL_6:
    v6 = v5;
    goto LABEL_69;
  }
  v72 = a1;
  objc_msgSend(*(id *)(a1 + 48), "sourceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wrappedPixelBuffer");

  v68 = v3;
  if (v3)
  {
    v4 = 0;
    goto LABEL_10;
  }
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_INFO, "No CVPixelBufferRef found in pipeline context. Falling back to CGImageRef", buf, 2u);
  }

  objc_msgSend(*(id *)(v72 + 48), "sourceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "createCGImageWithMetrics:", *(_QWORD *)(v72 + 40));

  v4 = (const void *)v9;
  if (!v9)
  {
    AXMediaLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_2();
    goto LABEL_6;
  }
LABEL_10:
  cf = v4;
  objc_msgSend(*(id *)(v72 + 32), "_computeCaptionForPixelBuffer:orImage:captionHandler:metrics:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v10 = (_QWORD *)getCVNLPCaptionsSymbolLoc_ptr;
  v80 = getCVNLPCaptionsSymbolLoc_ptr;
  if (!getCVNLPCaptionsSymbolLoc_ptr)
  {
    v11 = (void *)CVNLPLibrary();
    v10 = dlsym(v11, "CVNLPCaptions");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
    getCVNLPCaptionsSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
    goto LABEL_74;
  objc_msgSend(v69, "objectForKeyedSubscript:", *v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v13 = (id *)getCVNLPGeneratedCaptionSymbolLoc_ptr;
    v80 = getCVNLPGeneratedCaptionSymbolLoc_ptr;
    if (!getCVNLPGeneratedCaptionSymbolLoc_ptr)
    {
      v14 = (void *)CVNLPLibrary();
      v13 = (id *)dlsym(v14, "CVNLPGeneratedCaption");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
      getCVNLPGeneratedCaptionSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(buf, 8);
    if (v13)
    {
      v15 = *v13;
      objc_msgSend(v70, "objectForKeyedSubscript:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v17 = (id *)getCVNLPGeneratedCaptionScoreSymbolLoc_ptr;
      v80 = getCVNLPGeneratedCaptionScoreSymbolLoc_ptr;
      if (!getCVNLPGeneratedCaptionScoreSymbolLoc_ptr)
      {
        v18 = (void *)CVNLPLibrary();
        v17 = (id *)dlsym(v18, "CVNLPGeneratedCaptionScore");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
        getCVNLPGeneratedCaptionScoreSymbolLoc_ptr = (uint64_t)v17;
      }
      _Block_object_dispose(buf, 8);
      if (v17)
      {
        v19 = *v17;
        objc_msgSend(v70, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v21 = (_QWORD *)getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr;
        v80 = getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr;
        if (!getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr)
        {
          v22 = (void *)CVNLPLibrary();
          v21 = dlsym(v22, "CVNLPGeneratedCaptionConfidenceLow");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
          getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr = (uint64_t)v21;
        }
        _Block_object_dispose(buf, 8);
        if (v21)
        {
          objc_msgSend(v70, "objectForKeyedSubscript:", *v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v23, "BOOLValue");

          AXMediaLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(v72 + 32) + 112), "version");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(v72 + 32) + 112), "stage");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2048;
            v80 = v67;
            v81 = 2112;
            v82 = v25;
            v83 = 2112;
            v84 = v26;
            _os_log_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_INFO, "Did produce caption for image. text: '%@'. confidence: %@. lowConfidence: %ld. model: [v'%@' - '%@']", buf, 0x34u);

          }
          objc_msgSend(*(id *)(v72 + 48), "analysisOptions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "preferredOutputLocale");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            AXMediaLogLanguageTranslation();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B0E3B000, v29, OS_LOG_TYPE_INFO, "preferred output language unexpectedly nil! Falling back to english", buf, 2u);
            }

            +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "en_USLocale");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

          }
          +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "localeBaseLanguageIsEnglish:", v28);

          if (v32)
          {
            AXMediaLogLanguageTranslation();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B0E3B000, v33, OS_LOG_TYPE_INFO, "preferred output language is English. Translation not required", buf, 2u);
            }

            +[AXMTranslatedText text:confidence:isLowConfidence:targetLocale:](AXMTranslatedText, "text:confidence:isLowConfidence:targetLocale:", v16, 0, v28, 1.0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = v72;
            v36 = *(void **)(*(_QWORD *)(v72 + 32) + 128);
            if (!v36)
            {
              v37 = objc_alloc_init(AXMLanguageTranslator);
              v38 = *(_QWORD *)(v72 + 32);
              v39 = *(void **)(v38 + 128);
              *(_QWORD *)(v38 + 128) = v37;

              v36 = *(void **)(*(_QWORD *)(v72 + 32) + 128);
              v35 = v72;
            }
            v40 = *(_QWORD *)(v35 + 40);
            v77 = 0;
            objc_msgSend(v36, "translateText:toLocale:respectAllowList:metrics:error:", v16, v28, 1, v40, &v77);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v77;
            if (v41)
            {
              AXMediaLogLanguageTranslation();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_9((uint64_t)v41, v42, v43, v44, v45, v46, v47, v48);

            }
          }
          objc_msgSend(v20, "floatValue");
          +[AXMVisionFeature featureWithCaptionResult:confidence:translatedCaption:modelIdentifier:canvasSize:isLowConfidence:](AXMVisionFeature, "featureWithCaptionResult:confidence:translatedCaption:modelIdentifier:canvasSize:isLowConfidence:", v16, v34, CFSTR("AXCustomModel"), v67, v49, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v71 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v72 + 48), "appendFeature:", v71);

          goto LABEL_44;
        }
      }
    }
LABEL_74:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_75:
    __break(1u);
  }
  AXMediaLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_INFO, "Image produced no captions", buf, 2u);
  }
  v67 = 0;
  v71 = 0;
LABEL_44:

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v50 = (_QWORD *)getCVNLPImageClassificationIdentifiersSymbolLoc_ptr;
  v80 = getCVNLPImageClassificationIdentifiersSymbolLoc_ptr;
  if (!getCVNLPImageClassificationIdentifiersSymbolLoc_ptr)
  {
    v51 = (void *)CVNLPLibrary();
    v50 = dlsym(v51, "CVNLPImageClassificationIdentifiers");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v50;
    getCVNLPImageClassificationIdentifiersSymbolLoc_ptr = (uint64_t)v50;
  }
  _Block_object_dispose(buf, 8);
  if (!v50)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_75;
  }
  objc_msgSend(v69, "objectForKeyedSubscript:", *v50);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v74 != v55)
          objc_enumerationMutation(v52);
        v57 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
        v58 = +[AXMSignificantEventDetectorNode addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMSignificantEventDetectorNode, "addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", *(_QWORD *)(v72 + 48), v57, 1, 1.0);
        v59 = +[AXMNSFWDetectorNode addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMNSFWDetectorNode, "addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", *(_QWORD *)(v72 + 48), v57, 1, 1.0);
        if (v59 || v58)
          -[NSObject setCaptionMayContainSensitiveContent:](v71, "setCaptionMayContainSensitiveContent:", 1);
        AXMediaLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v57;
          _os_log_impl(&dword_1B0E3B000, v60, OS_LOG_TYPE_INFO, "Captioned image did activate classifier: %@", buf, 0xCu);
        }

        v53 |= v59;
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v54);
  }

  if (!v68)
    CFRelease(cf);
  if (((v67 | v53) & 1) != 0)
  {
    AXMediaLogCommon();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v61, OS_LOG_TYPE_INFO, "Caption was low confidence or explicit. Requesting auxiliary scene detection", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v72 + 32) + 136));
    v63 = WeakRetained == 0;

    if (v63)
    {
      AXMediaLogCommon();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_5();
    }
    else
    {
      v64 = *(void **)(v72 + 48);
      v65 = objc_loadWeakRetained((id *)(*(_QWORD *)(v72 + 32) + 136));
      objc_msgSend(v64, "addAuxiliaryDetector:", v65);
    }

  }
  v6 = v71;
LABEL_69:

}

- (NSURL)overrideModelURL
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__AXMCaptionDetectorNode_overrideModelURL__block_invoke;
  v4[3] = &unk_1E625CA50;
  v4[4] = self;
  v4[5] = &v5;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __42__AXMCaptionDetectorNode_overrideModelURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setOverrideModelURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AXMCaptionDetectorNode_setOverrideModelURL___block_invoke;
  v6[3] = &unk_1E625CB18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v6);

}

void __46__AXMCaptionDetectorNode_setOverrideModelURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v3 | v2)
  {
    if ((objc_msgSend((id)v3, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = 1;
    }
  }
}

- (unint64_t)overrideScaleMethod
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__AXMCaptionDetectorNode_overrideScaleMethod__block_invoke;
  v4[3] = &unk_1E625CA50;
  v4[4] = self;
  v4[5] = &v5;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__AXMCaptionDetectorNode_overrideScaleMethod__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (void)setOverrideScaleMethod:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AXMCaptionDetectorNode_setOverrideScaleMethod___block_invoke;
  v3[3] = &unk_1E625D128;
  v3[4] = self;
  v3[5] = a3;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v3);
}

uint64_t __49__AXMCaptionDetectorNode_setOverrideScaleMethod___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 88) != v2)
  {
    *(_QWORD *)(v1 + 88) = v2;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 68) = 1;
  }
  return result;
}

- (unint64_t)genderStrategy
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__AXMCaptionDetectorNode_genderStrategy__block_invoke;
  v4[3] = &unk_1E625CA50;
  v4[4] = self;
  v4[5] = &v5;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__AXMCaptionDetectorNode_genderStrategy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (void)setGenderStrategy:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AXMCaptionDetectorNode_setGenderStrategy___block_invoke;
  v3[3] = &unk_1E625D128;
  v3[4] = self;
  v3[5] = a3;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v3);
}

uint64_t __44__AXMCaptionDetectorNode_setGenderStrategy___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 96) != v2)
  {
    *(_QWORD *)(v1 + 96) = v2;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 68) = 1;
  }
  return result;
}

- (NSURL)effectiveModelURL
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AXMCaptionDetectorNode_effectiveModelURL__block_invoke;
  v4[3] = &unk_1E625CA50;
  v4[4] = self;
  v4[5] = &v5;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __43__AXMCaptionDetectorNode_effectiveModelURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

- (AXImageCaptionModel)effectiveCaptionModelInfo
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__AXMCaptionDetectorNode_effectiveCaptionModelInfo__block_invoke;
  v4[3] = &unk_1E625CA50;
  v4[4] = self;
  v4[5] = &v5;
  -[AXMCaptionDetectorNode _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AXImageCaptionModel *)v2;
}

void __51__AXMCaptionDetectorNode_effectiveCaptionModelInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_withLock_modelURLForOverrideURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("model_info.json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  if (v7)
  {
    v8 = v3;
LABEL_5:
    v12 = v8;
    goto LABEL_7;
  }
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ImageCaptionModel/model_info.json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "fileExistsAtPath:", v10);

  if (v11)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ImageCaptionModel"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:
  AXMediaLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_INFO, "Fixed up URL for override URL for image caption model: %@", (uint8_t *)&v16, 0xCu);

  }
  return v12;
}

- (id)_withLock_captionModelURLCloningAssetIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_overrideModelURL)
  {
    AXMediaLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[NSURL path](self->_overrideModelURL, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_INFO, "Override URL specified for image caption model: %@", (uint8_t *)&v12, 0xCu);

    }
    -[AXMCaptionDetectorNode _withLock_modelURLForOverrideURL:](self, "_withLock_modelURLForOverrideURL:", self->_overrideModelURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AXMImageCaptionModelAssetManager sharedInstance](AXMImageCaptionModelAssetManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelURLForType:timeout:", 0, 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_INFO, "Original URL for caption model [type:AXMCaptionModelTypeImage] before cloning: %@", (uint8_t *)&v12, 0xCu);

    }
    -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:](self, "_withLock_cloneCaptionModelIfNeeded:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXMCaptionDetectorNode _withLock_captionModelURLCloningAssetIfNeeded].cold.1();

    v10 = 0;
  }

  return v10;
}

- (id)_withLock_cloneCaptionModelIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  const char *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  id v42;
  id v43;
  char v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXMCaptionDetectorNode _captionModelCloningIsNeeded](self, "_captionModelCloningIsNeeded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("ClonedImageCaptionModel"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0;
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v10, &v44);

    if ((_DWORD)v8)
    {
      AXMediaLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v9;
        _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_INFO, "Deleting old clone directory for caption model: %@", buf, 0xCu);
      }

      v43 = 0;
      v12 = objc_msgSend(v5, "removeItemAtURL:error:", v9, &v43);
      v13 = v43;
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        AXMediaLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:].cold.4();

        goto LABEL_20;
      }
      v15 = v13;
    }
    else
    {
      v15 = 0;
    }
    AXMediaLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v9;
      _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_INFO, "Creating clone directory for caption model: %@", buf, 0xCu);
    }

    v42 = v15;
    v20 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v42);
    v14 = v42;

    if ((v20 & 1) == 0)
    {
      AXMediaLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:].cold.3();
      v18 = 0;
LABEL_31:

      goto LABEL_32;
    }
LABEL_20:
    objc_msgSend(v4, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v23, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v21, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    AXMediaLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      _os_log_impl(&dword_1B0E3B000, v26, OS_LOG_TYPE_INFO, "Cloning caption model: '%@' to: '%@'", buf, 0x16u);
    }

    v27 = objc_retainAutorelease(v24);
    v28 = (const char *)objc_msgSend(v27, "UTF8String");
    v29 = objc_retainAutorelease(v25);
    if (!clonefile(v28, (const char *)objc_msgSend(v29, "UTF8String"), 3u))
      goto LABEL_29;
    AXMediaLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:].cold.2((uint64_t)v27, (uint64_t)v29, v30);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v31, "copyItemAtPath:toPath:error:", v27, v29, &v41);
    v32 = v41;

    if (v32)
    {
      AXMediaLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[AXMCaptionDetectorNode _withLock_cloneCaptionModelIfNeeded:].cold.1((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);

      v18 = 0;
    }
    else
    {
LABEL_29:
      v18 = v21;
    }

    goto LABEL_31;
  }
  AXMediaLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v17;
    _os_log_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_INFO, "Will not clone caption model. Using original location: %@", buf, 0xCu);

  }
  v18 = v4;
LABEL_32:

  return v18;
}

- (BOOL)_captionModelCloningIsNeeded
{
  return 1;
}

- (CVNLPCaptionHandler)_withLock_captionHandlerCreateIfNeeded:(id)a3
{
  NSObject *v4;
  CVNLPCaptionHandler *captionHandlerRef;
  NSURL *effectiveModelURL;
  AXImageCaptionModel *effectiveCaptionModelInfo;
  CVNLPCaptionHandler *v8;
  void *v9;
  void *v10;
  AXImageCaptionModel *v11;
  AXImageCaptionModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  void *v32;
  unint64_t genderStrategy;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CVNLPCaptionHandler *v52;
  id v54;
  id obj;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[5];
  _BYTE buf[24];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (self->_needsCaptionHandlerRefresh)
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v4, OS_LOG_TYPE_INFO, "image caption model overrides changed. Will recreate _captionHandlerRef", buf, 2u);
    }

    captionHandlerRef = self->_captionHandlerRef;
    if (captionHandlerRef)
    {
      CFRelease(captionHandlerRef);
      self->_captionHandlerRef = 0;
    }
    effectiveModelURL = self->_effectiveModelURL;
    self->_effectiveModelURL = 0;

    effectiveCaptionModelInfo = self->_effectiveCaptionModelInfo;
    self->_effectiveCaptionModelInfo = 0;

    self->_needsCaptionHandlerRefresh = 0;
  }
  v8 = self->_captionHandlerRef;
  if (!v8)
  {
    -[AXMCaptionDetectorNode _withLock_captionModelURLCloningAssetIfNeeded](self, "_withLock_captionModelURLCloningAssetIfNeeded");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = obj;
    if (!obj)
    {
      v8 = 0;
LABEL_48:

      goto LABEL_49;
    }
    objc_storeStrong((id *)&self->_effectiveModelURL, obj);
    +[AXMImageCaptionModelAssetManager sharedInstance](AXMImageCaptionModelAssetManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "infoForModelAtURL:", self->_effectiveModelURL);
    v11 = (AXImageCaptionModel *)objc_claimAutoreleasedReturnValue();
    v12 = self->_effectiveCaptionModelInfo;
    self->_effectiveCaptionModelInfo = v11;

    AXMediaLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[AXImageCaptionModel version](self->_effectiveCaptionModelInfo, "version");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXImageCaptionModel stage](self->_effectiveCaptionModelInfo, "stage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_INFO, "Did load image caption model: [v'%@' - '%@']", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v16 = (id *)getCVNLPCaptionModelPathSymbolLoc_ptr;
    v62 = (void *)getCVNLPCaptionModelPathSymbolLoc_ptr;
    if (!getCVNLPCaptionModelPathSymbolLoc_ptr)
    {
      v17 = (void *)CVNLPLibrary();
      v16 = (id *)dlsym(v17, "CVNLPCaptionModelPath");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v16;
      getCVNLPCaptionModelPathSymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(buf, 8);
    if (!v16)
      goto LABEL_50;
    v54 = *v16;
    v58[0] = v54;
    v60[0] = obj;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v18 = (id *)getCVNLPCaptionLanguageSymbolLoc_ptr;
    v62 = (void *)getCVNLPCaptionLanguageSymbolLoc_ptr;
    if (!getCVNLPCaptionLanguageSymbolLoc_ptr)
    {
      v19 = (void *)CVNLPLibrary();
      v18 = (id *)dlsym(v19, "CVNLPCaptionLanguage");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
      getCVNLPCaptionLanguageSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(buf, 8);
    if (!v18)
      goto LABEL_50;
    v20 = *v18;
    v58[1] = v20;
    v60[1] = CFSTR("en-US");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v21 = (id *)getCVNLPBeamSearchSizeSymbolLoc_ptr;
    v62 = (void *)getCVNLPBeamSearchSizeSymbolLoc_ptr;
    if (!getCVNLPBeamSearchSizeSymbolLoc_ptr)
    {
      v22 = (void *)CVNLPLibrary();
      v21 = (id *)dlsym(v22, "CVNLPBeamSearchSize");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
      getCVNLPBeamSearchSizeSymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(buf, 8);
    if (!v21)
      goto LABEL_50;
    v23 = *v21;
    v58[2] = v23;
    v60[2] = &unk_1E6288AC8;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v24 = (id *)getCVNLPCaptionModelTypeSymbolLoc_ptr;
    v62 = (void *)getCVNLPCaptionModelTypeSymbolLoc_ptr;
    if (!getCVNLPCaptionModelTypeSymbolLoc_ptr)
    {
      v25 = (void *)CVNLPLibrary();
      v24 = (id *)dlsym(v25, "CVNLPCaptionModelType");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v24;
      getCVNLPCaptionModelTypeSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(buf, 8);
    if (!v24)
      goto LABEL_50;
    v26 = *v24;
    v58[3] = v26;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v27 = (id *)getCVNLPCaptionModelTransformerSymbolLoc_ptr;
    v62 = (void *)getCVNLPCaptionModelTransformerSymbolLoc_ptr;
    if (!getCVNLPCaptionModelTransformerSymbolLoc_ptr)
    {
      v28 = (void *)CVNLPLibrary();
      v27 = (id *)dlsym(v28, "CVNLPCaptionModelTransformer");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
      getCVNLPCaptionModelTransformerSymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(buf, 8);
    if (!v27)
      goto LABEL_50;
    v29 = *v27;
    v60[3] = v29;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v30 = (id *)getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr;
    v62 = (void *)getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr;
    if (!getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr)
    {
      v31 = (void *)CVNLPLibrary();
      v30 = (id *)dlsym(v31, "CVNLPCaptionEnableGenderedCaptions");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v30;
      getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr = (uint64_t)v30;
    }
    _Block_object_dispose(buf, 8);
    if (!v30)
    {
LABEL_50:
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
      goto LABEL_55;
    }
    v59 = *v30;
    v32 = (void *)MEMORY[0x1E0CB37E8];
    genderStrategy = self->_genderStrategy;
    v34 = v59;
    objc_msgSend(v32, "numberWithUnsignedInteger:", genderStrategy);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v58, 5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "mutableCopy");

    -[AXMCaptionDetectorNode _withLock_valueForOverrideScaleMethod](self, "_withLock_valueForOverrideScaleMethod");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v39 = (_QWORD *)getCVNLPCaptionScaleMethodSymbolLoc_ptr;
      v62 = (void *)getCVNLPCaptionScaleMethodSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodSymbolLoc_ptr)
      {
        v40 = (void *)CVNLPLibrary();
        v39 = dlsym(v40, "CVNLPCaptionScaleMethod");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v39;
        getCVNLPCaptionScaleMethodSymbolLoc_ptr = (uint64_t)v39;
      }
      _Block_object_dispose(buf, 8);
      if (!v39)
      {
LABEL_54:
        __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_55:
        __break(1u);
      }
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, *v39);
    }
    AXMediaLogCommon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl(&dword_1B0E3B000, v41, OS_LOG_TYPE_INFO, "Will generate captions with options: %@", buf, 0xCu);
    }

    v57 = 0;
    objc_msgSend(v56, "startMeasure:", CFSTR("CVNLPCaptionHandlerCreate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v43 = getCVNLPCaptionHandlerCreateSymbolLoc_ptr;
    v62 = getCVNLPCaptionHandlerCreateSymbolLoc_ptr;
    if (!getCVNLPCaptionHandlerCreateSymbolLoc_ptr)
    {
      v44 = (void *)CVNLPLibrary();
      v43 = dlsym(v44, "CVNLPCaptionHandlerCreate");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v43;
      getCVNLPCaptionHandlerCreateSymbolLoc_ptr = v43;
    }
    _Block_object_dispose(buf, 8);
    if (v43)
    {
      self->_captionHandlerRef = (CVNLPCaptionHandler *)((uint64_t (*)(void *, uint64_t *))v43)(v37, &v57);
      objc_msgSend(v42, "endMeasurement");
      if (v57)
      {
        AXMediaLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[AXMCaptionDetectorNode _withLock_captionHandlerCreateIfNeeded:].cold.8((uint64_t)&v57, v45, v46, v47, v48, v49, v50, v51);

        v52 = self->_captionHandlerRef;
        if (v52)
        {
          CFRelease(v52);
          v8 = 0;
          self->_captionHandlerRef = 0;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = self->_captionHandlerRef;
      }

      v9 = obj;
      goto LABEL_48;
    }
    goto LABEL_54;
  }
LABEL_49:

  return v8;
}

- (id)_withLock_valueForOverrideScaleMethod
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  switch(self->_overrideScaleMethod)
  {
    case 1uLL:
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr;
      v13 = getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr)
      {
        v3 = (void *)CVNLPLibrary();
        v2 = (id *)dlsym(v3, "CVNLPCaptionScaleMethodCGInterpolationNone");
        v11[3] = (uint64_t)v2;
        getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v10, 8);
      if (v2)
        return *v2;
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
      goto LABEL_6;
    case 2uLL:
LABEL_6:
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr;
      v13 = getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr)
      {
        v4 = (void *)CVNLPLibrary();
        v2 = (id *)dlsym(v4, "CVNLPCaptionScaleMethodCGInterpolationLow");
        v11[3] = (uint64_t)v2;
        getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v10, 8);
      if (v2)
        return *v2;
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_10:
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr;
      v13 = getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr;
      if (!getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr)
      {
        v5 = (void *)CVNLPLibrary();
        v2 = (id *)dlsym(v5, "CVNLPCaptionScaleMethodCGInterpolationMedium");
        v11[3] = (uint64_t)v2;
        getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr = (uint64_t)v2;
      }
      _Block_object_dispose(&v10, 8);
      if (!v2)
      {
        __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_14:
        v10 = 0;
        v11 = &v10;
        v12 = 0x2020000000;
        v2 = (id *)getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr;
        v13 = getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr;
        if (!getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr)
        {
          v6 = (void *)CVNLPLibrary();
          v2 = (id *)dlsym(v6, "CVNLPCaptionScaleMethodCGInterpolationHigh");
          v11[3] = (uint64_t)v2;
          getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr = (uint64_t)v2;
        }
        _Block_object_dispose(&v10, 8);
        if (!v2)
        {
          __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_18:
          v10 = 0;
          v11 = &v10;
          v12 = 0x2020000000;
          v2 = (id *)getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr;
          v13 = getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr;
          if (!getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr)
          {
            v7 = (void *)CVNLPLibrary();
            v2 = (id *)dlsym(v7, "CVNLPCaptionScaleMethodvImage");
            v11[3] = (uint64_t)v2;
            getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr = (uint64_t)v2;
          }
          _Block_object_dispose(&v10, 8);
          if (!v2)
          {
            v9 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
            _Block_object_dispose(&v10, 8);
            _Unwind_Resume(v9);
          }
        }
      }
      return *v2;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_14;
    case 5uLL:
      goto LABEL_18;
    default:
      return 0;
  }
}

- (id)_computeCaptionForPixelBuffer:(__CVBuffer *)a3 orImage:(CGImage *)a4 captionHandler:(CVNLPCaptionHandler *)a5 metrics:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _Unwind_Exception *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;

  v9 = a6;
  v10 = v9;
  v28 = 0;
  if (a3)
  {
    objc_msgSend(v9, "startMeasure:", CFSTR("CVNLPCaptionCopyForCVPixelBuffer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v12 = getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr;
    v32 = getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr;
    if (!getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr)
    {
      v13 = (void *)CVNLPLibrary();
      v12 = dlsym(v13, "CVNLPCaptionCopyForCVPixelBuffer");
      v30[3] = (uint64_t)v12;
      getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr = v12;
    }
    _Block_object_dispose(&v29, 8);
    if (v12)
    {
      v14 = ((uint64_t (*)(CVNLPCaptionHandler *, __CVBuffer *, _QWORD, uint64_t *))v12)(a5, a3, 0, &v28);
      goto LABEL_10;
    }
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_17:
    v27 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v27);
  }
  objc_msgSend(v9, "startMeasure:", CFSTR("CVNLPCaptionCreateForImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v15 = getCVNLPCaptionCopyForImageSymbolLoc_ptr;
  v32 = getCVNLPCaptionCopyForImageSymbolLoc_ptr;
  if (!getCVNLPCaptionCopyForImageSymbolLoc_ptr)
  {
    v16 = (void *)CVNLPLibrary();
    v15 = dlsym(v16, "CVNLPCaptionCopyForImage");
    v30[3] = (uint64_t)v15;
    getCVNLPCaptionCopyForImageSymbolLoc_ptr = v15;
  }
  _Block_object_dispose(&v29, 8);
  if (!v15)
    goto LABEL_17;
  v14 = ((uint64_t (*)(CVNLPCaptionHandler *, CGImage *, _QWORD, uint64_t *))v15)(a5, a4, 0, &v28);
LABEL_10:
  v17 = (void *)v14;
  objc_msgSend(v11, "endMeasurement");
  if (v28)
  {
    AXMediaLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AXMCaptionDetectorNode _computeCaptionForPixelBuffer:orImage:captionHandler:metrics:].cold.2((uint64_t)&v28, v18, v19, v20, v21, v22, v23, v24);

    v25 = 0;
  }
  else
  {
    v25 = v17;
  }

  return v25;
}

- (AXMSceneDetectorNode)sceneDetector
{
  return (AXMSceneDetectorNode *)objc_loadWeakRetained((id *)&self->_sceneDetector);
}

- (void)setSceneDetector:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDetector, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDetector);
  objc_storeStrong((id *)&self->_languageTranslator, 0);
  objc_storeStrong((id *)&self->_effectiveModelURL, 0);
  objc_storeStrong((id *)&self->_effectiveCaptionModelInfo, 0);
  objc_storeStrong((id *)&self->_overrideModelURL, 0);
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Caption handler is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not extract CGImageRef or CVPixelBufferRef from pipeline context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Cannot run auxiliary scene detection, detector was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Caption translation failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_withLock_captionModelURLCloningAssetIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not retrieve caption model asset URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_withLock_cloneCaptionModelIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not copy caption model. %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_withLock_cloneCaptionModelIfNeeded:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  int *v7;
  char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = *__error();
  v7 = __error();
  v8 = strerror(*v7);
  v9 = 138413314;
  v10 = a1;
  v11 = 2112;
  v12 = a2;
  v13 = 1024;
  v14 = 1;
  v15 = 1024;
  v16 = v6;
  v17 = 2080;
  v18 = v8;
  _os_log_error_impl(&dword_1B0E3B000, a3, OS_LOG_TYPE_ERROR, "Could not clone caption model. clonefile(%@, %@, %o) FAILED with (%d : %s) - trying copy", (uint8_t *)&v9, 0x2Cu);
}

- (void)_withLock_cloneCaptionModelIfNeeded:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_6(&dword_1B0E3B000, v0, v1, "Could not create clone directory for caption model: %@. error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_withLock_cloneCaptionModelIfNeeded:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_6(&dword_1B0E3B000, v0, v1, "Could not delete old clone directory for caption model: %@. error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_withLock_captionHandlerCreateIfNeeded:(uint64_t)a3 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Failed to create CVNLPCaptionHandler: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_computeCaptionForPixelBuffer:(uint64_t)a3 orImage:(uint64_t)a4 captionHandler:(uint64_t)a5 metrics:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Could not evaluate: Caption error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
