@implementation AXMTextDetectorNode

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMTextDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v2, sel_nodeInitialize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Text Detector");
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

- (BOOL)shouldEvaluate:(id)a3
{
  return 1;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  if (getVNRecognizeTextRequestClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)AXMTextDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v12, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMTextDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
}

+ (id)effectiveLanguagesFromOptions:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[AXMTextDetectorNode recognitionLevelFromOptions:](AXMTextDetectorNode, "recognitionLevelFromOptions:", v3);
  +[AXMTextDetectorNode textDetectionLanguagesFromOptions:](AXMTextDetectorNode, "textDetectionLanguagesFromOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMTextDetectorNode supportedDetectionLanguagesForLevel:](AXMTextDetectorNode, "supportedDetectionLanguagesForLevel:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMTextDetectorNode filterPreferredDetectionLanguages:withSupportedDetectionLanguages:](AXMTextDetectorNode, "filterPreferredDetectionLanguages:withSupportedDetectionLanguages:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  AXMSceneDetectorNode *v26;
  void *v27;
  int v28;
  AXMMediaAnalysisSceneDetectorNode *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  int v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  objc_super v85;
  uint8_t buf[4];
  NSObject *v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1B5E128FC]();
  -[AXMTextDetectorNode _textDetectionOptions:](self, "_textDetectionOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[AXMTextDetectorNode recognitionLevelFromOptions:](AXMTextDetectorNode, "recognitionLevelFromOptions:", v9);
  +[AXMTextDetectorNode effectiveLanguagesFromOptions:](AXMTextDetectorNode, "effectiveLanguagesFromOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v85.receiver = self;
    v85.super_class = (Class)AXMTextDetectorNode;
    -[AXMEvaluationNode evaluate:metrics:](&v85, sel_evaluate_metrics_, v6, v7);
    objc_msgSend(v11, "ax_mappedArrayUsingBlock:", &__block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init((Class)getVNRecognizeTextRequestClass());
    objc_msgSend(v13, "setRecognitionLanguages:", v11);
    objc_msgSend(v13, "setRecognitionLevel:", v10);
    objc_msgSend(v13, "setUsesLanguageCorrection:", objc_msgSend(v9, "usesLanguageCorrection"));
    objc_msgSend(v9, "normalizedMinimumTextHeightRatio");
    *(float *)&v14 = v14;
    objc_msgSend(v13, "setMinimumTextHeight:", v14);
    v88[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v15, v6, 0, v7, &v84);
    v16 = v84;

    if (v16)
    {
      AXMediaLogOCR();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v16;
        v18 = "Text detection error occurred: %@";
LABEL_35:
        _os_log_impl(&dword_1B0E3B000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    objc_msgSend(v13, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      v16 = 0;
      goto LABEL_33;
    }
    v78 = v12;
    objc_msgSend(v6, "sceneLabelsForOCRDocumentTypeDetection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      objc_msgSend(v6, "mediaAnalysisSceneLabelsForOCRDocumentTypeDetection");
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v22;
    }
    v77 = v21;
    v23 = objc_msgSend(v21, "count");
    v12 = v78;
    if (!v23)
    {
      objc_msgSend(v6, "analysisOptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "detectScenes");

      if (v25)
      {
        v26 = -[AXMVisionEngineNode initWithIdentifier:]([AXMSceneDetectorNode alloc], "initWithIdentifier:", CFSTR("scene"));
        -[AXMSceneDetectorNode setTaxonomyOptions:](v26, "setTaxonomyOptions:", 7);
        -[AXMSceneDetectorNode evaluate:metrics:](v26, "evaluate:metrics:", v6, v7);

      }
      if (AXRuntimeCheck_MediaAnalysisSupport())
      {
        objc_msgSend(v6, "analysisOptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "detectMADScenes");

        if (v28)
        {
          v29 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisSceneDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-scene"));
          -[AXMMediaAnalysisSceneDetectorNode setTaxonomyOptions:](v29, "setTaxonomyOptions:", 7);
          -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:](v29, "evaluate:metrics:", v6, v7);

        }
      }
    }
    v76 = v8;
    objc_msgSend(v6, "sourceInput");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ciImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      objc_msgSend(v6, "generateImageRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        AXMediaLogOCR();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0E3B000, v64, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document. Input image unexpectedly nil", buf, 2u);
        }

        v16 = 0;
        v12 = v78;
LABEL_32:
        v8 = v76;
LABEL_33:
        AXMediaLogOCR();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v16;
          v18 = "Unable to convert detected text into document: %@";
          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    objc_msgSend(v13, "results");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    -[AXMTextDetectorNode _sequencesForObservations:canvasSize:](self, "_sequencesForObservations:canvasSize:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = v33;
    objc_msgSend(v33, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_40);
    v34 = objc_claimAutoreleasedReturnValue();
    -[AXMTextDetectorNode specialCaseManager](self, "specialCaseManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)v34;
    objc_msgSend(v35, "detectSpecialCase:preferredLocales:", v34, v78);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = v36;
    if (objc_msgSend(v36, "isEqualToString:", CFSTR("NutritionLabel")))
    {
      -[AXMTextDetectorNode textLayoutManager](self, "textLayoutManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v39 = v38;
      v41 = v40;
      objc_msgSend(v6, "visionImageRequestHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v72 = v37;
      objc_msgSend(v37, "documentWithNutritionLabel:canvasSize:requestHandler:metrics:error:", v31, v42, v7, &v83, v39, v41);
      v17 = objc_claimAutoreleasedReturnValue();
      v43 = v83;
LABEL_20:
      v16 = v43;

LABEL_24:
      v55 = v77;
      goto LABEL_25;
    }
    objc_msgSend(v77, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("receipt"));

    if (v45)
    {
      -[AXMTextDetectorNode textLayoutManager](self, "textLayoutManager");
      v46 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "results");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTextDetectorNode detectTextSkew:](self, "detectTextSkew:", v71);
      v48 = v47;
      objc_msgSend(v6, "size");
      v50 = v49;
      v52 = v51;
      objc_msgSend(v6, "visionImageRequestHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      v72 = (void *)v46;
      v54 = (void *)v46;
      v12 = v78;
      objc_msgSend(v54, "documentWithReceipt:withTextSkew:canvasSize:preferredLocales:requestHandler:metrics:error:", v31, v78, v53, v7, &v82, v48, v50, v52);
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = v82;

      goto LABEL_24;
    }
    v55 = v77;
    if (objc_msgSend(v77, "containsObject:", CFSTR("envelope")))
    {
      -[AXMTextDetectorNode textLayoutManager](self, "textLayoutManager");
      v56 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v58 = v57;
      v60 = v59;
      v61 = objc_msgSend(v9, "shouldApplySemanticTextFiltering");
      v81 = 0;
      v72 = (void *)v56;
      v62 = (void *)v56;
      v12 = v78;
      objc_msgSend(v62, "envelopeWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v75, v78, v61, &v81, v58, v60);
      v17 = objc_claimAutoreleasedReturnValue();
      v63 = v81;
    }
    else
    {
      v65 = objc_msgSend(v77, "containsObject:", CFSTR("diagram"));
      -[AXMTextDetectorNode textLayoutManager](self, "textLayoutManager");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v69 = v67;
      v70 = v68;
      v12 = v78;
      v72 = v66;
      if (v65)
      {
        objc_msgSend(v6, "visionImageRequestHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0;
        objc_msgSend(v66, "documentWithTable:canvasSize:preferredLocales:requestHandler:metrics:error:", v31, v78, v42, v7, &v80, v69, v70);
        v17 = objc_claimAutoreleasedReturnValue();
        v43 = v80;
        goto LABEL_20;
      }
      v79 = 0;
      objc_msgSend(v66, "documentWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v75, v78, objc_msgSend(v9, "shouldApplySemanticTextFiltering"), &v79, v67, v68);
      v17 = objc_claimAutoreleasedReturnValue();
      v63 = v79;
    }
    v16 = v63;
LABEL_25:

    if (v17)
    {
      objc_msgSend(v6, "appendFeature:", v17);
      objc_msgSend(v6, "setEffectiveTextDetectionLocales:", v12);
      v8 = v76;
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  AXMediaLogOCR();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_DEFAULT, "Will not perform text detection. No effective languages resolved", buf, 2u);
  }
LABEL_37:

  objc_autoreleasePoolPop(v8);
}

id __40__AXMTextDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C99DC8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithLocaleIdentifier:", v3);

  return v4;
}

uint64_t __40__AXMTextDetectorNode_evaluate_metrics___block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (NSArray)sceneLabelsForOCRDocumentTypeDetection
{
  NSArray *sceneLabelsForOCRDocumentTypeDetection;
  NSArray *v4;
  NSArray *v5;

  sceneLabelsForOCRDocumentTypeDetection = self->_sceneLabelsForOCRDocumentTypeDetection;
  if (!sceneLabelsForOCRDocumentTypeDetection)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sceneLabelsForOCRDocumentTypeDetection;
    self->_sceneLabelsForOCRDocumentTypeDetection = v4;

    sceneLabelsForOCRDocumentTypeDetection = self->_sceneLabelsForOCRDocumentTypeDetection;
  }
  return sceneLabelsForOCRDocumentTypeDetection;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  AXMSemanticTextFactory *semanticTextFactory;
  AXMSemanticTextFactory *v4;
  AXMSemanticTextFactory *v5;

  semanticTextFactory = self->_semanticTextFactory;
  if (!semanticTextFactory)
  {
    v4 = objc_alloc_init(AXMSemanticTextFactory);
    v5 = self->_semanticTextFactory;
    self->_semanticTextFactory = v4;

    semanticTextFactory = self->_semanticTextFactory;
  }
  return semanticTextFactory;
}

- (AXMTextLayoutManager)textLayoutManager
{
  AXMTextLayoutManager *textLayoutManager;
  AXMTextLayoutManager *v4;
  void *v5;
  AXMTextLayoutManager *v6;
  AXMTextLayoutManager *v7;

  textLayoutManager = self->_textLayoutManager;
  if (!textLayoutManager)
  {
    v4 = [AXMTextLayoutManager alloc];
    -[AXMTextDetectorNode semanticTextFactory](self, "semanticTextFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AXMTextLayoutManager initWithSemanticTextFactory:](v4, "initWithSemanticTextFactory:", v5);
    v7 = self->_textLayoutManager;
    self->_textLayoutManager = v6;

    textLayoutManager = self->_textLayoutManager;
  }
  return textLayoutManager;
}

- (AXMTextSpecialCase)specialCaseManager
{
  AXMTextSpecialCase *specialCaseManager;
  AXMTextSpecialCase *v4;
  AXMTextSpecialCase *v5;

  specialCaseManager = self->_specialCaseManager;
  if (!specialCaseManager)
  {
    v4 = objc_alloc_init(AXMTextSpecialCase);
    v5 = self->_specialCaseManager;
    self->_specialCaseManager = v4;

    specialCaseManager = self->_specialCaseManager;
  }
  return specialCaseManager;
}

- (id)_sequencesForObservations:(id)a3 canvasSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  AXMVisionFeatureRecognizedText *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  float v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  AXMVisionFeatureRecognizedText *v35;
  _BYTE v36[128];
  uint64_t v37;

  height = a4.height;
  width = a4.width;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "topCandidates:", 1, (_QWORD)v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
          {
            objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", 0);
            if (v17 != 1 || objc_msgSend(v16, "characterAtIndex:", 0) != 0xFFFF)
            {
              v18 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v15, 0, objc_msgSend(v16, "length"));
              objc_msgSend(v13, "boundingBox");
              v20 = v19;
              v22 = v21;
              v24 = v23;
              v26 = v25;
              v35 = v18;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "confidence");
              +[AXMVisionFeature textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:](AXMVisionFeature, "textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:", v16, v27, v20, v22, v24, v26, v28, width, height);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "addObject:", v29);
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_textDetectionOptions:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "analysisOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textDetectionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[AXMTextDetectionOptions defaultOptions](AXMTextDetectionOptions, "defaultOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  AXMediaLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_INFO, "Will detect text with options: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

+ (int64_t)recognitionLevelFromOptions:(id)a3
{
  return objc_msgSend(a3, "recognitionLevel") != 1;
}

+ (id)textDetectionLanguagesFromOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "textDetectionLocales", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "languageCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v4, "count"))
  {
    AXMediaLogOCR();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AXMTextDetectorNode textDetectionLanguagesFromOptions:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(v4, "addObject:", CFSTR("en-US"));
  }

  return v4;
}

+ (id)supportedDetectionLanguagesForLevel:(int64_t)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  objc_msgSend(getVNRecognizeTextRequestClass(), "supportedRecognitionLanguagesForTextRecognitionLevel:revision:error:", a3, 2, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4 || !objc_msgSend(v3, "count"))
  {
    AXMediaLogOCR();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[AXMTextDetectorNode supportedDetectionLanguagesForLevel:].cold.1((uint64_t)v4, v5);

    v3 = &unk_1E6289458;
  }

  return v3;
}

+ (id)filterPreferredDetectionLanguages:(id)a3 withSupportedDetectionLanguages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            if (objc_msgSend(v11, "containsString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)))
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v17);

              goto LABEL_13;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_13:

      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
  }
  objc_msgSend(v7, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __89__AXMTextDetectorNode_filterPreferredDetectionLanguages_withSupportedDetectionLanguages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v4 = v2;

    v3 = v4;
  }

  return v3;
}

id __89__AXMTextDetectorNode_filterPreferredDetectionLanguages_withSupportedDetectionLanguages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v4 = v2;

    v3 = v4;
  }

  return v3;
}

- (double)detectTextSkew:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v21;
  id v22;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topCandidates:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    objc_msgSend(v6, "boundingBoxForRange:error:", 1, 1, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    objc_msgSend(v6, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    objc_msgSend(v6, "boundingBoxForRange:error:", objc_msgSend(v9, "length") - 2, 1, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    objc_msgSend(v7, "bottomLeft");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v10, "bottomRight");
    v18 = v17 - v13;
    if (v18 == 0.0)
      v19 = 0.0;
    else
      v19 = atan((v16 - v15) / v18);

  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

- (void)setSemanticTextFactory:(id)a3
{
  objc_storeStrong((id *)&self->_semanticTextFactory, a3);
}

- (void)setTextLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutManager, a3);
}

- (void)setSpecialCaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_specialCaseManager, a3);
}

- (void)setSceneLabelsForOCRDocumentTypeDetection:(id)a3
{
  objc_storeStrong((id *)&self->_sceneLabelsForOCRDocumentTypeDetection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneLabelsForOCRDocumentTypeDetection, 0);
  objc_storeStrong((id *)&self->_specialCaseManager, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. VNRecognizeTextRequestSoft was nil", a5, a6, a7, a8, 0);
}

+ (void)textDetectionLanguagesFromOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "textDetectionLocales unexpectedly empty! falling back to en-US", a5, a6, a7, a8, 0);
}

+ (void)supportedDetectionLanguagesForLevel:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not get supported text detection languages: %@", (uint8_t *)&v2, 0xCu);
}

@end
