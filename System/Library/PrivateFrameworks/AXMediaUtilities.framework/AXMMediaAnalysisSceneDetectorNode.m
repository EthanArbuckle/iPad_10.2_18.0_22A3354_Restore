@implementation AXMMediaAnalysisSceneDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisSceneDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMMediaAnalysisSceneDetectorNode *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_taxonomyOptions = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("taxonomyOptions"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_taxonomyOptions, CFSTR("taxonomyOptions"), v5.receiver, v5.super_class);

}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  if (!AXRuntimeCheck_MediaAnalysisSupport())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "physicalMemory") > 0x773593FF;

  return v3;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return CFSTR("AXM Media analysis - Scene Detector Node");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  dispatch_semaphore_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  unint64_t v27;
  NSObject *v28;
  dispatch_time_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  objc_super v41;
  id location[5];
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  v31 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v41, sel_evaluate_metrics_, v6);
  objc_msgSend(v6, "sourceInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phAssetLocalIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibraryURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ciImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pixelBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMMediaAnalysisSceneDetectorNode _sceneClassificationRequest](self, "_sceneClassificationRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v11 == 0;

  v12 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v10)
  {
    *(_QWORD *)buf = 0;
    v44 = buf;
    v45 = 0x2050000000;
    v13 = (void *)getMADVISceneClassificationRequestClass_softClass;
    v46 = getMADVISceneClassificationRequestClass_softClass;
    if (!getMADVISceneClassificationRequestClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getMADVISceneClassificationRequestClass_block_invoke;
      location[3] = &unk_1E625C4E8;
      location[4] = buf;
      __getMADVISceneClassificationRequestClass_block_invoke((uint64_t)location);
      v13 = (void *)*((_QWORD *)v44 + 3);
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(buf, 8);
    v15 = objc_alloc_init(v14);
    -[AXMMediaAnalysisSceneDetectorNode _setSceneClassificationRequest:](self, "_setSceneClassificationRequest:", v15);

  }
  -[AXMMediaAnalysisSceneDetectorNode _sceneClassificationRequest](self, "_sceneClassificationRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_semaphore_create(0);
  objc_initWeak(location, self);
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke;
  v36[3] = &unk_1E625EBB0;
  objc_copyWeak(&v40, location);
  v18 = v16;
  v37 = v18;
  v30 = v6;
  v38 = v30;
  v19 = v17;
  v39 = v19;
  v20 = (void *)MEMORY[0x1B5E12AE8](v36);
  +[AXMMADSService sharedInstance](AXMMADSService, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35 && v34)
  {
    v49[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v23, v34, v35, v20);
LABEL_12:
    v25 = v24;

    goto LABEL_13;
  }
  if (v33)
  {
    v48 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v23, v33, 1, &stru_1E6260C18, v20);
    goto LABEL_12;
  }
  if (v32)
  {
    v47 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v23, objc_msgSend(v32, "pixelBuffer"), objc_msgSend(v32, "orientation"), &stru_1E6260C18, v20);
    goto LABEL_12;
  }
  v25 = 0xFFFFFFFFLL;
LABEL_13:
  v26 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v19, v26))
  {
    v27 = 100000000;
    do
    {
      if (v27 >= 0x2540BE401)
      {
        AXMediaLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:].cold.1(buf, &buf[1], v28);

        objc_msgSend(v22, "cancelRequestID:", v25);
      }
      v29 = dispatch_time(0, 100000000);
      v27 += 100000000;
    }
    while (dispatch_semaphore_wait(v19, v29));
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109634;
    v11[1] = a2;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Scene Classification results: requestID: %d error: %@ results: %@", (uint8_t *)v11, 0x1Cu);

  }
  if (v5)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_2((uint64_t)v5, v8);
  }
  else if (a2 == -1)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_1(v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_addSceneDetectorFeaturesToContext:fromResults:", v9, v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_addSceneDetectorFeaturesToContext:(id)a3 fromResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v9 = (void *)getMADVISceneClassificationResultClass_softClass;
    v26 = getMADVISceneClassificationResultClass_softClass;
    if (!getMADVISceneClassificationResultClass_softClass)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __getMADVISceneClassificationResultClass_block_invoke;
      v22[3] = &unk_1E625C4E8;
      v22[4] = &v23;
      __getMADVISceneClassificationResultClass_block_invoke((uint64_t)v22);
      v9 = (void *)v24[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classificationObservations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMMediaAnalysisSceneDetectorNode _addSceneClassificationObservations:toContext:](self, "_addSceneClassificationObservations:toContext:", v13, v6);

      objc_msgSend(v6, "analysisOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "detectMADScenesNSFW");

      if (v15)
      {
        objc_msgSend(v12, "nsfwObservations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMMediaAnalysisSceneDetectorNode _addNSFWClassificationObservations:toContext:](self, "_addNSFWClassificationObservations:toContext:", v16, v6);

      }
      objc_msgSend(v6, "analysisOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "detectMADScenesSignificantEvents");

      if (v18)
      {
        objc_msgSend(v12, "significantEventObservations");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMMediaAnalysisSceneDetectorNode _addSignificantEventClassificationObservations:toContext:](self, "_addSignificantEventClassificationObservations:toContext:", v19, v6);

      }
      objc_msgSend(v12, "recognizedObjectObservations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMMediaAnalysisSceneDetectorNode _addRecognizedObjectObservations:toContext:](self, "_addRecognizedObjectObservations:toContext:", v20, v6);

      objc_msgSend(v12, "saliencyObservations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMMediaAnalysisSceneDetectorNode _addSaliencyImageObservations:toContext:](self, "_addSaliencyImageObservations:toContext:", v21, v6);

    }
  }

}

- (void)_addSceneClassificationObservations:(id)a3 toContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[AXMMediaAnalysisSceneDetectorNode taxonomyOptions](self, "taxonomyOptions"))
  {
    +[AXMPhotoVisionSupport processSceneClassifications:withOptions:](AXMPhotoVisionSupport, "processSceneClassifications:withOptions:", v6, -[AXMMediaAnalysisSceneDetectorNode taxonomyOptions](self, "taxonomyOptions"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v7, "size");
          +[AXMVisionFeature featureWithMediaAnalysisTaxonomyNode:canvasSize:](AXMVisionFeature, "featureWithMediaAnalysisTaxonomyNode:canvasSize:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFeature:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v10);
    }
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v6;
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v15)
    {
      v16 = v15;
      v35 = v6;
      v17 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v8);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          +[AXMPhotoVisionSupport localizedLabelForClassificationObservation:](AXMPhotoVisionSupport, "localizedLabelForClassificationObservation:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "confidence");
          v23 = v22;
          objc_msgSend(v7, "size");
          v25 = v24;
          LODWORD(v24) = v23;
          +[AXMVisionFeature mediaAnalysisSceneClassificationWithLabel:localizedValue:confidence:canvasSize:](AXMVisionFeature, "mediaAnalysisSceneClassificationWithLabel:localizedValue:confidence:canvasSize:", v21, v20, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFeature:", v27);

        }
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v16);
      v6 = v35;
    }
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = v6;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
        if (-[AXMMediaAnalysisSceneDetectorNode _shouldIncludeSceneLabelForOCRDocumenTypeDetection:](self, "_shouldIncludeSceneLabelForOCRDocumenTypeDetection:", v33))
        {
          objc_msgSend(v33, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addMediaAnalysisSceneLabelForOCRDocumentTypeDetection:", v34);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v30);
  }

  objc_msgSend(v7, "addEvaluatedFeatureType:", 26);
}

+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  int v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _Unwind_Exception *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v11 = (_QWORD *)getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0;
  v24 = getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0;
  if (!getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0)
  {
    v12 = (void *)VisionLibrary_8();
    v11 = dlsym(v12, "VN81aedeb999c79d74e79af7f1c922cf97");
    v22[3] = (uint64_t)v11;
    getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0 = (uint64_t)v11;
  }
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    v20 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
  v13 = objc_msgSend(v10, "isEqualToString:", *v11, v21);
  if (v13)
  {
    objc_msgSend(v9, "size");
    v16 = v15;
    v14 = a5;
    *(float *)&v15 = v14;
    +[AXMVisionFeature mediaAnalysisNSFWClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "mediaAnalysisNSFWClassificationWithCategory:confidence:canvasSize:", CFSTR("NSFW Explicit"), v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCaptionMayContainSensitiveContent:", v6);
    objc_msgSend(v9, "appendFeature:", v18);

  }
  return v13;
}

+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  __CFString **v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  float v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  BOOL v39;
  _Unwind_Exception *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v11 = (_QWORD *)getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr;
  v45 = getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr;
  if (!getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr)
  {
    v12 = (void *)VisionLibrary_8();
    v11 = dlsym(v12, "VN3FNQUJVIs2puI1uPc9mxh7");
    v43[3] = (uint64_t)v11;
    getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v42, 8);
  if (!v11)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_44:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_45:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_46:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_47:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_48;
  }
  if ((objc_msgSend(v10, "isEqualToString:", *v11, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryBlood;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v14 = (_QWORD *)getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr;
  v45 = getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr;
  if (!getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr)
  {
    v15 = (void *)VisionLibrary_8();
    v14 = dlsym(v15, "VNSY8t4EoTztuqIL02g8uVA0");
    v43[3] = (uint64_t)v14;
    getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v42, 8);
  if (!v14)
    goto LABEL_44;
  if ((objc_msgSend(v10, "isEqualToString:", *v14, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryDemonstration;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v16 = (_QWORD *)getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr;
  v45 = getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr;
  if (!getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr)
  {
    v17 = (void *)VisionLibrary_8();
    v16 = dlsym(v17, "VN6XNMvaRunPpzWjGa9uUHD6");
    v43[3] = (uint64_t)v16;
    getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v42, 8);
  if (!v16)
    goto LABEL_45;
  if ((objc_msgSend(v10, "isEqualToString:", *v16, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryDestruction;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v18 = (_QWORD *)getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr;
  v45 = getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr;
  if (!getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr)
  {
    v19 = (void *)VisionLibrary_8();
    v18 = dlsym(v19, "VN4QuphG8kE4qDaDycivBkX5");
    v43[3] = (uint64_t)v18;
    getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v42, 8);
  if (!v18)
    goto LABEL_46;
  if ((objc_msgSend(v10, "isEqualToString:", *v18, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFireDevastation;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v20 = (_QWORD *)getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr;
  v45 = getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr;
  if (!getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr)
  {
    v21 = (void *)VisionLibrary_8();
    v20 = dlsym(v21, "VN7gQUejje8mmnE9GSTsVBVV");
    v43[3] = (uint64_t)v20;
    getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v42, 8);
  if (!v20)
    goto LABEL_47;
  if ((objc_msgSend(v10, "isEqualToString:", *v20, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFloodDevastation;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v22 = (_QWORD *)getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr;
  v45 = getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr;
  if (!getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr)
  {
    v23 = (void *)VisionLibrary_8();
    v22 = dlsym(v23, "VNa9xpOJNvRoaW9plFGZ9Eo0");
    v43[3] = (uint64_t)v22;
    getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v42, 8);
  if (!v22)
  {
LABEL_48:
    v41 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v41);
  }
  if ((objc_msgSend(v10, "isEqualToString:", *v22, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFuneral;
  }
  else
  {
    getVN2vIWnsZbk4Su55oeWfKDq1();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "isEqualToString:", v24);

    if ((v25 & 1) != 0)
    {
      v13 = AXMSignificantEventCategoryHospital;
    }
    else
    {
      getVNmNJnu0xlW8CZXt6hJ7Rpb0();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v10, "isEqualToString:", v26);

      if ((v27 & 1) != 0)
      {
        v13 = AXMSignificantEventCategoryReligiousSetting;
      }
      else
      {
        getVN35FOB1QhtSfYGRIJvTgtTq();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v10, "isEqualToString:", v28);

        if ((v29 & 1) != 0)
        {
          v13 = AXMSignificantEventCategoryVehicleCrash;
        }
        else
        {
          getVN6ZsEIQ9ri2eF1vhsxw5COm();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v10, "isEqualToString:", v30);

          if (!v31)
          {
LABEL_41:
            v39 = 0;
            goto LABEL_42;
          }
          v13 = &AXMSignificantEventCategoryWar;
        }
      }
    }
  }
LABEL_39:
  v32 = *v13;
  if (!v32)
    goto LABEL_41;
  v33 = v32;
  objc_msgSend(v9, "size");
  v36 = v35;
  v34 = a5;
  *(float *)&v35 = v34;
  +[AXMVisionFeature mediaAnalysisSignificantEventClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "mediaAnalysisSignificantEventClassificationWithCategory:confidence:canvasSize:", v33, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCaptionMayContainSensitiveContent:", v6);
  objc_msgSend(v9, "appendFeature:", v38);

  v39 = 1;
LABEL_42:

  return v39;
}

- (void)_addNSFWClassificationObservations:(id)a3 toContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "confidence");
        +[AXMMediaAnalysisSceneDetectorNode addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMMediaAnalysisSceneDetectorNode, "addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v6, v12, 0, v13);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(v6, "addEvaluatedFeatureType:", 29);

}

- (void)_addSignificantEventClassificationObservations:(id)a3 toContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "confidence");
        +[AXMMediaAnalysisSceneDetectorNode addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMMediaAnalysisSceneDetectorNode, "addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v6, v12, 0, v13);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(v6, "addEvaluatedFeatureType:", 30);

}

- (void)_addRecognizedObjectObservations:(id)a3 toContext:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  __int128 v42;
  id v43;
  uint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  NSObject *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v47;
    *(_QWORD *)&v7 = 138412290;
    v42 = v7;
    do
    {
      v10 = 0;
      v44 = v8;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        +[AXMPhotoVisionSupport axmTaxonomyNodeForObjectObservation:](AXMPhotoVisionSupport, "axmTaxonomyNodeForObjectObservation:", v11, v42);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "label");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            +[AXMPhotoVisionSupport _deniedVoiceOverObjectClassificationLabels](AXMPhotoVisionSupport, "_deniedVoiceOverObjectClassificationLabels");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "label");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "containsObject:", v17);

            if (v18)
            {
              AXMediaLogCommon();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                goto LABEL_20;
              objc_msgSend(v13, "label");
              v20 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v42;
              v51 = v20;
              _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_INFO, "Object classifier detected but denied for VoiceOver: %@", buf, 0xCu);
              goto LABEL_17;
            }
          }
          objc_msgSend(v13, "localizedName");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!-[NSObject length](v19, "length"))
          {
            AXMediaLogCommon();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v42;
              v51 = v19;
              _os_log_impl(&dword_1B0E3B000, v21, OS_LOG_TYPE_DEFAULT, "Could not get localized value for label: %@. Falling back to raw value", buf, 0xCu);
            }

            objc_msgSend(v13, "label");
            v22 = objc_claimAutoreleasedReturnValue();

            v19 = v22;
          }
          objc_msgSend(v11, "confidence");
          if (v23 > 0.4)
          {
            objc_msgSend(v13, "label");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "boundingBox");
            v26 = v25;
            v28 = v27;
            v30 = v29;
            v32 = v31;
            objc_msgSend(v11, "confidence");
            v34 = v33;
            objc_msgSend(v43, "size");
            v36 = v35;
            v38 = v37;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "sceneClassId"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringValue");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v41) = v34;
            +[AXMVisionFeature mediaAnalysisObjectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:](AXMVisionFeature, "mediaAnalysisObjectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:", v24, v19, v40, v26, v28, v30, v32, v41, v36, v38);
            v20 = objc_claimAutoreleasedReturnValue();

            v8 = v44;
            objc_msgSend(v43, "appendFeature:", v20);
LABEL_17:

          }
        }
        else
        {
          AXMediaLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_DEFAULT, "Recognized object result produced no labels", buf, 2u);
          }
        }
LABEL_20:

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v8);
  }
  objc_msgSend(v43, "addEvaluatedFeatureType:", 27);

}

- (void)_addSaliencyImageObservations:(id)a3 toContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "salientObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AXMMediaAnalysisSceneDetectorNode__addSaliencyImageObservations_toContext___block_invoke;
  v10[3] = &unk_1E625EBD8;
  v11 = v6;
  v12 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v7, "addEvaluatedFeatureType:", 28);

}

void __77__AXMMediaAnalysisSceneDetectorNode__addSaliencyImageObservations_toContext___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
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
  float v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29 = a2;
  objc_msgSend(v29, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "narrowedBoundingBox");
  v32.origin.x = v11;
  v32.origin.y = v12;
  v32.size.width = v13;
  v32.size.height = v14;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v31 = CGRectIntersection(v30, v32);
  if (!CGRectIsEmpty(v31))
  {
    objc_msgSend(v29, "boundingBox");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = 1.0 - v21 - v19;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v29, "confidence");
    +[AXMVisionFeature mediaAnalysisProminentObjectWithBoundingBox:canvasSize:confidence:](AXMVisionFeature, "mediaAnalysisProminentObjectWithBoundingBox:canvasSize:confidence:", v16, v22, v18, v20, v24, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appendFeature:", v28);

  }
}

- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3
{
  id v3;
  void *v4;
  double v5;
  float v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.35;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("diagram")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("envelope")) & 1) == 0)
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("receipt")))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v5 = 0.65;
  }
  objc_msgSend(v3, "confidence");
  v7 = v5 < v6;
LABEL_6:

  return v7;
}

- (unsigned)taxonomyOptions
{
  return self->_taxonomyOptions;
}

- (void)setTaxonomyOptions:(unsigned int)a3
{
  self->_taxonomyOptions = a3;
}

- (MADVISceneClassificationRequest)_sceneClassificationRequest
{
  return self->__sceneClassificationRequest;
}

- (void)_setSceneClassificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->__sceneClassificationRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sceneClassificationRequest, 0);
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Scene Detection request timed out", buf, 2u);
}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVISceneClassificationRequest", v1, 2u);
}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Error in scene analysis: %@", (uint8_t *)&v2, 0xCu);
}

@end
