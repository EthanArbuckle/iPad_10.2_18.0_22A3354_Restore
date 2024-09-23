@implementation AXMMediaAnalysisCaptionDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisCaptionDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMMediaAnalysisCaptionDetectorNode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneDetector"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMMediaAnalysisCaptionDetectorNode setSceneDetector:](v5, "setSceneDetector:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AXMMediaAnalysisCaptionDetectorNode sceneDetector](self, "sceneDetector", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sceneDetector"));

}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  if (!AXRuntimeCheck_MediaAnalysisSupport())
    return 0;
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
  return CFSTR("AXM Media Analysis - Caption Detector Node");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  dispatch_time_t v22;
  unint64_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  dispatch_semaphore_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  dispatch_time_t v32;
  unint64_t v33;
  NSObject *v34;
  dispatch_time_t v35;
  dispatch_semaphore_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  dispatch_time_t v44;
  unint64_t v45;
  NSObject *v46;
  dispatch_time_t v47;
  NSObject *v48;
  NSObject *v49;
  id *location;
  id *locationa;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  id v64;
  _QWORD v65[4];
  NSObject *v66;
  id v67;
  id v68;
  id v69;
  NSObject *v70;
  id v71;
  _QWORD v72[4];
  NSObject *v73;
  id v74;
  id v75;
  NSObject *v76;
  id v77;
  objc_super v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  NSObject *v85;
  _BYTE buf[24];
  void *v87;
  uint64_t *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v78.receiver = self;
  v78.super_class = (Class)AXMMediaAnalysisCaptionDetectorNode;
  v54 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v78, sel_evaluate_metrics_, v6);
  objc_msgSend(v6, "sourceInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phAssetLocalIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibraryURL");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ciImage");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sourceInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pixelBuffer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  AXMediaLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v57;
    _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEFAULT, "AXM Media analysis: Will evaluate media analysis caption detector node. phAssetLocalIdentifier : %@ and photoLibraryURL : %@", buf, 0x16u);
  }

  if (v57 && v56)
  {
    +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:](AXMPhotoAssetData, "phAssetFromLocalIdentifier:photoLibraryURL:", v56, v57);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      AXMediaLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      v48 = v49;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.1();
        v48 = v49;
      }
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v52 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v13 = (_QWORD *)getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
    v87 = (void *)getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
    if (!getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr)
    {
      v14 = (void *)MediaAnalysisLibrary();
      v13 = dlsym(v14, "VCPMediaAnalysisService_AllowOnDemandOption");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
      getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(buf, 8);
    if (!v13)
    {
      __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
      __break(1u);
    }
    -[NSObject setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v13);
    v15 = dispatch_semaphore_create(0);
    v79 = 0;
    v80 = &v79;
    v81 = 0x2050000000;
    v16 = (void *)getVCPMediaAnalysisServiceClass_softClass;
    v82 = getVCPMediaAnalysisServiceClass_softClass;
    if (!getVCPMediaAnalysisServiceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getVCPMediaAnalysisServiceClass_block_invoke;
      v87 = &unk_1E625C4E8;
      v88 = &v79;
      __getVCPMediaAnalysisServiceClass_block_invoke((uint64_t)buf);
      v16 = (void *)v80[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v79, 8);
    objc_msgSend(v17, "analysisService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v85 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48;
    v72[3] = &unk_1E625F038;
    location = &v77;
    objc_copyWeak(&v77, (id *)buf);
    v12 = v12;
    v73 = v12;
    v74 = v6;
    v75 = v54;
    v20 = v15;
    v76 = v20;
    v21 = objc_msgSend(v18, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", 0x100000000, v19, v52, &__block_literal_global_29, v72);

    v22 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v20, v22))
    {
      v23 = 100000000;
      do
      {
        if (v23 > 0x2540BE400)
        {
          AXMediaLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.3(&v79, (_BYTE *)&v79 + 1);

          objc_msgSend(v18, "cancelRequest:", v21, location);
        }
        v25 = dispatch_time(0, 100000000);
        v23 += 100000000;
      }
      while (dispatch_semaphore_wait(v20, v25));
    }

    objc_destroyWeak(location);
    objc_destroyWeak((id *)buf);

LABEL_37:
    v48 = v52;
LABEL_38:

    goto LABEL_39;
  }
  if (v55)
  {
    v26 = dispatch_semaphore_create(0);
    v27 = objc_alloc_init((Class)getMADImageCaptionRequestClass());
    +[AXMMADSService sharedInstance](AXMMADSService, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "service");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v84 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53;
    v65[3] = &unk_1E625F060;
    objc_copyWeak(&v71, (id *)buf);
    v52 = v27;
    v66 = v52;
    v67 = v55;
    v68 = v6;
    v69 = v54;
    v12 = v26;
    v70 = v12;
    v31 = objc_msgSend(v29, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v30, v67, 1, &stru_1E6260C18, v65);

    v32 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v12, v32))
    {
      v33 = 100000000;
      do
      {
        if (v33 > 0x2540BE400)
        {
          AXMediaLogCommon();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.5(&v79, (_BYTE *)&v79 + 1);

          objc_msgSend(v29, "cancelRequestID:", v31);
        }
        v35 = dispatch_time(0, 100000000);
        v33 += 100000000;
      }
      while (dispatch_semaphore_wait(v12, v35));
    }

    objc_destroyWeak(&v71);
    objc_destroyWeak((id *)buf);

    goto LABEL_37;
  }
  if (v53)
  {
    v36 = dispatch_semaphore_create(0);
    v37 = objc_alloc_init((Class)getMADImageCaptionRequestClass());
    +[AXMMADSService sharedInstance](AXMMADSService, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "service");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v83 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v53, "pixelBuffer");
    v42 = objc_msgSend(v53, "orientation");
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55;
    v58[3] = &unk_1E625F060;
    locationa = &v64;
    objc_copyWeak(&v64, (id *)buf);
    v52 = v37;
    v59 = v52;
    v60 = v53;
    v61 = v6;
    v62 = v54;
    v12 = v36;
    v63 = v12;
    v43 = objc_msgSend(v39, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v40, v41, v42, &stru_1E6260C18, v58);

    v44 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v12, v44))
    {
      v45 = 100000000;
      do
      {
        if (v45 > 0x2540BE400)
        {
          AXMediaLogCommon();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            -[AXMMediaAnalysisCaptionDetectorNode evaluate:metrics:].cold.4(&v79, (_BYTE *)&v79 + 1);

          objc_msgSend(v39, "cancelRequestID:", v43, locationa);
        }
        v47 = dispatch_time(0, 100000000);
        v45 += 100000000;
      }
      while (dispatch_semaphore_wait(v12, v47));
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);

    goto LABEL_37;
  }
LABEL_39:

}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  AXMediaLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  AXMediaLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_5();

  if (v6)
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_4();
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(WeakRetained, "_addCaptionFeaturesToContext:metrics:fromResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11);
      }
      else
      {
        AXMediaLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_3((id *)(a1 + 32), v12);

      }
    }
    else
    {
      AXMediaLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_2((id *)(a1 + 32), v11);
    }

  }
  else
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_1(a1, v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109634;
    v12[1] = a2;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v11;
    _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Caption Detection (CIImage) results: requestID: %d error: %@ results: %@", (uint8_t *)v12, 0x1Cu);

  }
  if (v5)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_3();
  }
  else if (a2 == -1)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_mediaAnalysisCaptionResultFromResults:", v9);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "_addCaptionFeaturesToContext:metrics:fromResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);
    }
    else
    {
      AXMediaLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_2();

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109634;
    v12[1] = a2;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v11;
    _os_log_debug_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Caption Detection (PixelBuffer) results: requestID: %d. error: %@ results: %@", (uint8_t *)v12, 0x1Cu);

  }
  if (v5)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_3();
  }
  else if (a2 == -1)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_mediaAnalysisCaptionResultFromResults:", v9);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "_addCaptionFeaturesToContext:metrics:fromResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);
    }
    else
    {
      AXMediaLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_2();

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (id)translatedTextForCaption:(id)a3 withContext:(id)a4 metrics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  AXMLanguageTranslator *languageTranslator;
  AXMLanguageTranslator *v19;
  AXMLanguageTranslator *v20;
  id v21;
  NSObject *v22;
  id v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "analysisOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredOutputLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    AXMediaLogLanguageTranslation();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_INFO, "preferred output language unexpectedly nil! Falling back to english", buf, 2u);
    }

    +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "en_USLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "localeBaseLanguageIsEnglish:", v11);

  if (v15)
  {
    AXMediaLogLanguageTranslation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_INFO, "preferred output language is English. Translation not required", v25, 2u);
    }

    +[AXMTranslatedText text:confidence:isLowConfidence:targetLocale:](AXMTranslatedText, "text:confidence:isLowConfidence:targetLocale:", v8, 0, v11, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    languageTranslator = self->_languageTranslator;
    if (!languageTranslator)
    {
      v19 = objc_alloc_init(AXMLanguageTranslator);
      v20 = self->_languageTranslator;
      self->_languageTranslator = v19;

      languageTranslator = self->_languageTranslator;
    }
    v24 = 0;
    -[AXMLanguageTranslator translateText:toLocale:respectAllowList:metrics:error:](languageTranslator, "translateText:toLocale:respectAllowList:metrics:error:", v8, v11, 1, v9, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (v21)
    {
      AXMediaLogLanguageTranslation();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[AXMMediaAnalysisCaptionDetectorNode translatedTextForCaption:withContext:metrics:].cold.1();

    }
  }

  return v17;
}

- (void)_addCaptionFeaturesToContext:(id)a3 metrics:(id)a4 fromResult:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  _BOOL4 v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  id WeakRetained;
  NSObject *v27;
  AXMMediaAnalysisCaptionDetectorNode *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "imageCaptionResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    v31 = v9;
    -[AXMMediaAnalysisCaptionDetectorNode translatedTextForCaption:withContext:metrics:](self, "translatedTextForCaption:withContext:metrics:", v12, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "confidence");
    v29 = (void *)v13;
    +[AXMVisionFeature featureWithMediaAnalysisImageCaptionResult:confidence:translatedCaption:](AXMVisionFeature, "featureWithMediaAnalysisImageCaptionResult:confidence:translatedCaption:", v14, v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v11;
    objc_msgSend(v11, "classificationIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v22 = +[AXMMediaAnalysisSceneDetectorNode addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMMediaAnalysisSceneDetectorNode, "addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v8, v21, 1, 1.0);
          v23 = +[AXMMediaAnalysisSceneDetectorNode addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMMediaAnalysisSceneDetectorNode, "addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v8, v21, 1, 1.0);
          if (v23 || v22)
            objc_msgSend(v32, "setCaptionMayContainSensitiveContent:", 1);
          AXMediaLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v21;
            _os_log_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_INFO, "Captioned image did activate classifier: %@", buf, 0xCu);
          }
          v18 |= v23;

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v8, "appendFeature:", v32);
    objc_msgSend(v8, "addEvaluatedFeatureType:", 25);
    v11 = v30;
    if ((objc_msgSend(v30, "isLowConfidence") & 1) != 0 || (v18 & 1) != 0)
    {
      AXMediaLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v25, OS_LOG_TYPE_INFO, "Caption was low confidence or explicit. Requesting auxiliary scene detection", buf, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&v28->_sceneDetector);
      if (WeakRetained)
      {
        v27 = objc_loadWeakRetained((id *)&v28->_sceneDetector);
        objc_msgSend(v8, "addAuxiliaryDetector:", v27);
      }
      else
      {
        AXMediaLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[AXMMediaAnalysisCaptionDetectorNode _addCaptionFeaturesToContext:metrics:fromResult:].cold.1(v27);
      }

    }
    v9 = v31;
  }

}

- (id)_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:(id)a3
{
  id v4;
  AXMMediaAnalysisCaptionsResult *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_alloc_init(AXMMediaAnalysisCaptionsResult);
  -[AXMMediaAnalysisCaptionDetectorNode _captionsFromAnalysis:forType:](self, "_captionsFromAnalysis:forType:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[AXMMediaAnalysisCaptionsResult setImageCaptionResults:](v5, "setImageCaptionResults:", v6);
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXMMediaAnalysisCaptionDetectorNode _mediaAnalysisCaptionResultForPHAssetsFromAnalysis:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v5;
}

- (id)_captionsFromAnalysis:(id)a3 forType:(unint64_t)a4
{
  id *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  id v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  AXMMediaAnalysisCaptions *v31;
  void *v33;
  id v34;
  id v35;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  __int128 buf;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v5 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  v48 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    v6 = (void *)MediaAnalysisLibrary();
    v5 = (id *)dlsym(v6, "MediaAnalysisResultAttributesKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
    goto LABEL_38;
  v40 = *v5;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v7 = (id *)getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr;
  v48 = getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr)
  {
    v8 = (void *)MediaAnalysisLibrary();
    v7 = (id *)dlsym(v8, "MediaAnalysisResultImageCaptionLowConfidenceAttributeKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
    getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&buf, 8);
  if (!v7)
    goto LABEL_38;
  v39 = *v7;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v9 = (id *)getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr;
  v48 = getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr)
  {
    v10 = (void *)MediaAnalysisLibrary();
    v9 = (id *)dlsym(v10, "MediaAnalysisResultClassificationIdentifiersAttributeKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
    getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&buf, 8);
  if (!v9)
    goto LABEL_38;
  v38 = *v9;
  if (a4)
  {
    v11 = 0;
    v12 = 0;
    v35 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v13 = (id *)getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr;
  v48 = getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr)
  {
    v14 = (void *)MediaAnalysisLibrary();
    v13 = (id *)dlsym(v14, "MediaAnalysisImageCaptionResultsKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v13;
    getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&buf, 8);
  if (!v13)
    goto LABEL_38;
  v35 = *v13;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v15 = (id *)getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  v48 = getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr)
  {
    v16 = (void *)MediaAnalysisLibrary();
    v15 = (id *)dlsym(v16, "MediaAnalysisResultImageCaptionTextAttributeKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
    getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&buf, 8);
  if (!v15)
    goto LABEL_38;
  v12 = *v15;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v17 = (id *)getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr;
  v48 = getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr)
  {
    v18 = (void *)MediaAnalysisLibrary();
    v17 = (id *)dlsym(v18, "MediaAnalysisResultImageCaptionConfidenceAttributeKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v17;
    getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&buf, 8);
  if (!v17)
  {
LABEL_38:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v11 = *v17;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = v33;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v22, "objectForKeyedSubscript:", v40);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v11);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;

            objc_msgSend(v23, "objectForKeyedSubscript:", v39);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "BOOLValue");

            objc_msgSend(v23, "objectForKeyedSubscript:", v38);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "length"))
            {
              v31 = -[AXMMediaAnalysisCaptions initWithText:confidence:isLowConfidence:classificationIdentifiers:]([AXMMediaAnalysisCaptions alloc], "initWithText:confidence:isLowConfidence:classificationIdentifiers:", v24, v29, v30, v27);
              objc_msgSend(v37, "addObject:", v31);
            }
            else
            {
              AXMediaLogCommon();
              v31 = (AXMMediaAnalysisCaptions *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v22;
                _os_log_debug_impl(&dword_1B0E3B000, &v31->super, OS_LOG_TYPE_DEBUG, "AXM Media analysis: No caption attrs unexpected: %@", (uint8_t *)&buf, 0xCu);
              }
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v19);
      }

    }
  }

  return v37;
}

- (id)_mediaAnalysisCaptionResultFromResults:(id)a3
{
  id v3;
  AXMMediaAnalysisCaptionsResult *v4;
  void *v5;
  void *v6;
  id v7;
  char isKindOfClass;
  NSObject *v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  AXMMediaAnalysisCaptions *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  v4 = objc_alloc_init(AXMMediaAnalysisCaptionsResult);
  if (!objc_msgSend(v3, "count"))
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AXMMediaAnalysisCaptionDetectorNode _mediaAnalysisCaptionResultFromResults:].cold.1(v9, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_12;
  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v6 = (void *)getMADCaptionResultClass_softClass;
  v29 = getMADCaptionResultClass_softClass;
  if (!getMADCaptionResultClass_softClass)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __getMADCaptionResultClass_block_invoke;
    v25[3] = &unk_1E625C4E8;
    v25[4] = &v26;
    __getMADCaptionResultClass_block_invoke((uint64_t)v25);
    v6 = (void *)v27[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v26, 8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject caption](v9, "caption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject score](v9, "score");
    v12 = v11;
    v13 = -[NSObject isLowConfidence](v9, "isLowConfidence");
    -[NSObject classificationIdentifiers](v9, "classificationIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v16 = -[AXMMediaAnalysisCaptions initWithText:confidence:isLowConfidence:classificationIdentifiers:]([AXMMediaAnalysisCaptions alloc], "initWithText:confidence:isLowConfidence:classificationIdentifiers:", v10, v13, v14, v12);
      objc_msgSend(v15, "addObject:", v16);

    }
    if (objc_msgSend(v15, "count"))
      -[AXMMediaAnalysisCaptionsResult setImageCaptionResults:](v4, "setImageCaptionResults:", v15);

LABEL_12:
  }

  return v4;
}

- (AXMMediaAnalysisSceneDetectorNode)sceneDetector
{
  return (AXMMediaAnalysisSceneDetectorNode *)objc_loadWeakRetained((id *)&self->_sceneDetector);
}

- (void)setSceneDetector:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDetector, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDetector);
  objc_storeStrong((id *)&self->_languageTranslator, 0);
}

- (void)evaluate:metrics:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1B0E3B000, v0, v1, "AXM Media analysis: PHAsset is nil for phAssetLocalIdentifier : %@ and photoLibraryURL : %@");
  OUTLINED_FUNCTION_1();
}

- (void)evaluate:(_BYTE *)a1 metrics:(_BYTE *)a2 .cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_3_4(&dword_1B0E3B000, v2, v3, "AXM Media Analysis: Caption Detection (PHAsset) request timed out", v4);
}

- (void)evaluate:(_BYTE *)a1 metrics:(_BYTE *)a2 .cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_3_4(&dword_1B0E3B000, v2, v3, "AXM Media Analysis: Caption Detection (PixelBuffer) request timed out", v4);
}

- (void)evaluate:(_BYTE *)a1 metrics:(_BYTE *)a2 .cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_3_4(&dword_1B0E3B000, v2, v3, "AXM Media Analysis: Caption Detection (CIImage) request timed out", v4);
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, a1, a3, "AXM Media analysis: progress: %.2f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a2, v4, "AXM Media analysis: No analysis result or error produced for asset with ID: %@", v5);

  OUTLINED_FUNCTION_7();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a2, v4, "AXM Media analysis: No analysis dict found for asset with ID: %@", v5);

  OUTLINED_FUNCTION_7();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a2, v4, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil for asset with ID: %@", v5);

  OUTLINED_FUNCTION_7();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Error in caption analysis with PHAsset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_48_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Caption Detection (PHAsset) results: result: %@ error: %@");
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Invalid request - MADImageCaptionRequest on ciimage : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil on ciimage : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_53_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Error in caption analysis with CIImage: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Invalid request - MADImageCaptionRequest on pixelBuffer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: AXMMediaAnalysisCaptionsResult is nil on pixelBuffer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__AXMMediaAnalysisCaptionDetectorNode_evaluate_metrics___block_invoke_55_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1B0E3B000, v0, v1, "AXM Media analysis: Error in caption analysis with CVPixelBuffer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)translatedTextForCaption:withContext:metrics:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_ERROR, "Caption translation failed: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_addCaptionFeaturesToContext:(os_log_t)log metrics:fromResult:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Cannot run auxiliary scene detection, detector was nil.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_mediaAnalysisCaptionResultForPHAssetsFromAnalysis:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "AXM Media analysis: No image captions result", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_mediaAnalysisCaptionResultFromResults:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "AXM Media analysis: No results available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
