@implementation AXMMediaAnalysisTextDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisTextDetectorNode)initWithCoder:(id)a3
{
  AXMMediaAnalysisTextDetectorNode *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *processResultQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  v3 = -[AXMEvaluationNode initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("process-results-queue-axmedia", 0);
    processResultQueue = v3->_processResultQueue;
    v3->_processResultQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return CFSTR("AXM Media Analysis - Text Detector Node");
}

- (void)processResults:(id)a3 context:(id)a4 metrics:(id)a5 textDetectionLocales:(id)a6 textDetectionOptions:(id)a7 requestID:(int)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char isKindOfClass;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  AXMMediaAnalysisSceneDetectorNode *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE buf[32];
  uint64_t *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  AXMediaLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "results");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = a8;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v20;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v53;
    _os_log_debug_impl(&dword_1B0E3B000, v21, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Text Detection results: requestID: %d error: %@ results: %@", buf, 0x1Cu);

  }
  if (v20)
  {
    AXMediaLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:].cold.3((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_32;
  }
  if (a8 != -1)
  {
    objc_msgSend(v16, "sourceInput");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ciImage");
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(v16, "generateImageRepresentation");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "results");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v59, "count"))
      goto LABEL_31;
    objc_msgSend(v59, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v62 = &v61;
    v63 = 0x2050000000;
    v31 = (void *)getMADVIDocumentRecognitionResultClass_softClass;
    v64 = getMADVIDocumentRecognitionResultClass_softClass;
    if (!getMADVIDocumentRecognitionResultClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMADVIDocumentRecognitionResultClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E625C4E8;
      v66 = &v61;
      __getMADVIDocumentRecognitionResultClass_block_invoke((uint64_t)buf);
      v31 = (void *)v62[3];
    }
    v32 = objc_retainAutorelease(v31);
    _Block_object_dispose(&v61, 8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_31;
    objc_msgSend(v59, "firstObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "observations");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "blocksWithTypes:inRegion:", 4, 0.0, 0.0, 1.0, 1.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "count"))
    {
      objc_msgSend(v16, "mediaAnalysisSceneLabelsForOCRDocumentTypeDetection");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      AXMediaLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:].cold.2((uint64_t)v55, v35, v36, v37, v38, v39, v40, v41);

      if (!objc_msgSend(v55, "count"))
      {
        objc_msgSend(v16, "analysisOptions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "detectMADScenes");

        if (v43)
        {
          v44 = -[AXMVisionEngineNode initWithIdentifier:]([AXMMediaAnalysisSceneDetectorNode alloc], "initWithIdentifier:", CFSTR("mad-scene"));
          -[AXMMediaAnalysisSceneDetectorNode setTaxonomyOptions:](v44, "setTaxonomyOptions:", 7);
          -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:](v44, "evaluate:metrics:", v16, v17);

        }
      }
      if (v22)
      {
        objc_msgSend(v16, "size");
        -[AXMMediaAnalysisTextDetectorNode _sequencesForObservations:canvasSize:](self, "_sequencesForObservations:canvasSize:", v58);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMMediaAnalysisTextDetectorNode textLayoutManager](self, "textLayoutManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "size");
        v60 = 0;
        objc_msgSend(v46, "documentWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v45, v18, objc_msgSend(v19, "shouldApplySemanticTextFiltering"), &v60, v47, v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v60;
        v51 = v46;
        v52 = v50;

        if (v49)
        {
          objc_msgSend(v16, "appendFeature:", v49);
          objc_msgSend(v16, "setEffectiveTextDetectionLocales:", v18);
LABEL_30:

LABEL_31:
          goto LABEL_32;
        }
LABEL_28:
        AXMediaLogOCR();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v52;
          _os_log_impl(&dword_1B0E3B000, v49, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document: %@", buf, 0xCu);
        }
        goto LABEL_30;
      }
      AXMediaLogOCR();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v54, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document. Input image unexpectedly nil", buf, 2u);
      }

    }
    v52 = 0;
    goto LABEL_28;
  }
  AXMediaLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:].cold.1(v22);
LABEL_32:

}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  double v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  dispatch_time_t v27;
  unint64_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  objc_super v48;
  id location[6];
  uint8_t buf[8];
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  v36 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v48, sel_evaluate_metrics_, v6);
  objc_msgSend(v6, "sourceInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phAssetLocalIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibraryURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ciImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pixelBuffer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMMediaAnalysisTextDetectorNode _textDetectionOptions:](self, "_textDetectionOptions:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[AXMTextDetectorNode recognitionLevelFromOptions:](AXMTextDetectorNode, "recognitionLevelFromOptions:", v11);
  +[AXMTextDetectorNode effectiveLanguagesFromOptions:](AXMTextDetectorNode, "effectiveLanguagesFromOptions:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "count"))
  {
    objc_msgSend(v39, "ax_mappedArrayUsingBlock:", &__block_literal_global_18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v51 = buf;
    v52 = 0x2050000000;
    v14 = (void *)getMADVIDocumentRecognitionRequestClass_softClass;
    v53 = getMADVIDocumentRecognitionRequestClass_softClass;
    v15 = MEMORY[0x1E0C809B0];
    if (!getMADVIDocumentRecognitionRequestClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getMADVIDocumentRecognitionRequestClass_block_invoke;
      location[3] = &unk_1E625C4E8;
      location[4] = buf;
      __getMADVIDocumentRecognitionRequestClass_block_invoke((uint64_t)location);
      v14 = (void *)*((_QWORD *)v51 + 3);
    }
    v16 = objc_retainAutorelease(v14);
    _Block_object_dispose(buf, 8);
    v17 = objc_alloc_init(v16);
    objc_msgSend(v17, "setRecognitionLevel:", v12);
    objc_msgSend(v17, "setLanguages:", v39);
    objc_msgSend(v11, "normalizedMinimumTextHeightRatio");
    *(float *)&v18 = v18;
    objc_msgSend(v17, "setMinimumTextHeight:", v18);
    objc_msgSend(v17, "setUsesLanguageCorrection:", objc_msgSend(v11, "usesLanguageCorrection"));
    v19 = dispatch_semaphore_create(0);
    objc_initWeak(location, self);
    v40[0] = v15;
    v40[1] = 3221225472;
    v40[2] = __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_2;
    v40[3] = &unk_1E625E7A0;
    v40[4] = self;
    objc_copyWeak(&v47, location);
    v32 = v17;
    v41 = v32;
    v42 = v6;
    v43 = v36;
    v31 = v13;
    v44 = v31;
    v45 = v11;
    v20 = v19;
    v46 = v20;
    v33 = (void *)MEMORY[0x1B5E12AE8](v40);
    +[AXMMADSService sharedInstance](AXMMADSService, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38 && v37)
    {
      v56[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v23, v37, v38, v33);
    }
    else if (v35)
    {
      v55 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v23, v35, 1, &stru_1E6260C18, v33);
    }
    else
    {
      if (!v34)
      {
        v26 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
      v54 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v23, objc_msgSend(v34, "pixelBuffer"), objc_msgSend(v34, "orientation"), &stru_1E6260C18, v33);
    }
    v26 = v24;

LABEL_14:
    v27 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v20, v27))
    {
      v28 = 100000000;
      do
      {
        if (v28 >= 0x2540BE401)
        {
          AXMediaLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[AXMMediaAnalysisTextDetectorNode evaluate:metrics:].cold.1(buf, &buf[1], v29);

          objc_msgSend(v22, "cancelRequestID:", v26);
        }
        v30 = dispatch_time(0, 100000000);
        v28 += 100000000;
      }
      while (dispatch_semaphore_wait(v20, v30));
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(location);

    v25 = v31;
    goto LABEL_22;
  }
  AXMediaLogOCR();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1B0E3B000, v25, OS_LOG_TYPE_DEFAULT, "Will not perform text detection. No effective languages resolved", (uint8_t *)location, 2u);
  }
LABEL_22:

}

id __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C99DC8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithLocaleIdentifier:", v3);

  return v4;
}

void __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_3;
  block[3] = &unk_1E625E778;
  objc_copyWeak(&v17, (id *)(a1 + 88));
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v18 = a2;
  v14 = v7;
  v15 = v5;
  v16 = *(id *)(a1 + 80);
  v8 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v17);
}

intptr_t __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 72));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
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
    -[AXMMediaAnalysisTextDetectorNode semanticTextFactory](self, "semanticTextFactory");
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
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_INFO, "AXM Media analysis: Will detect text with options: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

+ (int64_t)recognitionLevelFromOptions:(id)a3
{
  return objc_msgSend(a3, "recognitionLevel") != 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialCaseManager, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
  objc_storeStrong((id *)&self->_processResultQueue, 0);
}

- (void)processResults:(os_log_t)log context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVIDocumentRecognitionRequest", v1, 2u);
}

- (void)processResults:(uint64_t)a3 context:(uint64_t)a4 metrics:(uint64_t)a5 textDetectionLocales:(uint64_t)a6 textDetectionOptions:(uint64_t)a7 requestID:(uint64_t)a8 error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, a2, a3, "AXM Media analysis: sceneLabelsForOCRDocumentTypeDetection : %@", a5, a6, a7, a8, 2u);
}

- (void)processResults:(uint64_t)a3 context:(uint64_t)a4 metrics:(uint64_t)a5 textDetectionLocales:(uint64_t)a6 textDetectionOptions:(uint64_t)a7 requestID:(uint64_t)a8 error:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, a2, a3, "AXM Media analysis: Error in text analysis: %@", a5, a6, a7, a8, 2u);
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Text Detection request timed out", buf, 2u);
}

@end
