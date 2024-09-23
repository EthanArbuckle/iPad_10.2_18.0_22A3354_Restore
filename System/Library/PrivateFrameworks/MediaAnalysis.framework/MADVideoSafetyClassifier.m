@implementation MADVideoSafetyClassifier

+ (id)analyzeVideoAssetOnDemandWithURL:(id)a3 localIdentifier:(id)a4 timeRange:(id *)a5 cancelBlock:(id)a6 andProgressHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  CMTime *p_var1;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *context;
  void *v44;
  id v45;
  CMTime v46;
  CMTime var0;
  _QWORD v48[4];
  id v49;
  uint8_t v50[16];
  _QWORD aBlock[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  __int16 v55;
  const __CFString *v56;
  void *v57;
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[2];
  _QWORD v61[2];
  __int128 buf;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5->var0.var2 & 1) != 0 && (a5->var1.var2 & 1) != 0 && !a5->var1.var3)
  {
    p_var1 = (CMTime *)&a5->var1;
    if ((a5->var1.var0 & 0x8000000000000000) == 0)
    {
      context = (void *)MEMORY[0x1BCCA1B2C]();
      v45 = objc_alloc_init(MEMORY[0x1E0D47890]);
      objc_msgSend(v45, "setRequiresScoresAndLabels:", 1);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MADServiceVideoAsset assetWithURL:identifier:clientBundleID:clientTeamID:](MADServiceVideoAsset, "assetWithURL:identifier:clientBundleID:clientTeamID:", v11, v12, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = v21;
      if (!v21)
      {
        v30 = 0;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create MADServiceVideoAsset with %@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_35;
      }
      objc_msgSend(v21, "setUserSafetyEligible:", 1);
      v52 = 0;
      v53 = &v52;
      v54 = 0x2020000000;
      v55 = -1;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__36;
      v65 = __Block_byref_object_dispose__36;
      v66 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke;
      aBlock[3] = &unk_1E6B19B08;
      aBlock[4] = &v52;
      aBlock[5] = &buf;
      v42 = _Block_copy(aBlock);
      +[MADServiceVideoProcessingSubtask taskWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:](MADServiceVideoSafetyProcessingTask, "taskWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:", v45, v21, v13, v14, v42);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v22)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_WORD *)v50 = 0;
        v28 = MEMORY[0x1E0C81028];
        v29 = "Failed to create the safety analyze task";
        goto LABEL_25;
      }
      v41 = v22;
      objc_msgSend(v22, "setEnablePowerLog:", 0);
      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_signpost_id_generate(v24);

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)v50 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "MADServiceVideoSafetyProcessingTask_Run", ", v50, 2u);
      }

      if (objc_msgSend(v41, "run"))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v23 = v41;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v50 = 0;
            v28 = MEMORY[0x1E0C81028];
            v29 = "Failed to run the safety analyze task";
LABEL_25:
            _os_log_impl(&dword_1B6C4A000, v28, OS_LOG_TYPE_ERROR, v29, v50, 2u);
          }
LABEL_34:

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v52, 8);
          v30 = v44;
LABEL_35:

          objc_autoreleasePoolPop(context);
          goto LABEL_7;
        }
      }
      else
      {
        VCPSignPostLog();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)v50 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, v25, "MADServiceVideoSafetyProcessingTask_Run", ", v50, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        v35 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        if (v35)
        {
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke_134;
          v48[3] = &unk_1E6B174E8;
          v49 = v33;
          objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v48);

        }
        v60[0] = CFSTR("Sensitivity");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *((__int16 *)v53 + 12));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = CFSTR("SensitivitySceneResults");
        v61[0] = v36;
        v61[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v58[0] = CFSTR("start");
        var0 = (CMTime)a5->var0;
        CMTimeToNSDictionary(&var0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v37;
        v58[1] = CFSTR("duration");
        v46 = *p_var1;
        CMTimeToNSDictionary(&v46);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58[2] = CFSTR("attributes");
        v59[1] = v38;
        v59[2] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v39);

      }
      v23 = v41;
      goto LABEL_34;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid video time range", (uint8_t *)&buf, 2u);
  }
LABEL_7:
  v56 = CFSTR("SafetyResults");
  v57 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1, v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    LOWORD(v18) = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "Empty resultPayload";
    goto LABEL_22;
  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid resultPayload with error %@", (uint8_t *)&v18, 0xCu);

      }
      goto LABEL_23;
    }
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    LOWORD(v18) = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "No results in resultPayload";
LABEL_22:
    _os_log_impl(&dword_1B6C4A000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v18, 2u);
    goto LABEL_23;
  }
  objc_msgSend(v4, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  objc_msgSend(v4, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_4;
  objc_msgSend(v4, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v14, "isSensitive");
  objc_msgSend(v14, "scoresForLabels");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (objc_msgSend(v14, "isSensitive")
    && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count")
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Empty scoresForLabels for sensitive content", (uint8_t *)&v18, 2u);
  }

LABEL_23:
}

void __118__MADVideoSafetyClassifier_analyzeVideoAssetOnDemandWithURL_localIdentifier_timeRange_cancelBlock_andProgressHandler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VCPSpecialLabelToExtendedSceneClassificationID(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v11, 0xCu);
  }

}

- (MADVideoSafetyClassifier)init
{
  char *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  MADVideoSafetyClassifier *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)MADVideoSafetyClassifier;
  v2 = -[MADVideoSafetyClassifier init](&v25, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_16;
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0CA2E28];
  *((_QWORD *)v2 + 3) = v4;
  v5 = MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *((_OWORD *)v2 + 2) = *MEMORY[0x1E0CA2E18];
  *((_QWORD *)v2 + 6) = v6;
  v7 = *(_QWORD *)(v5 + 16);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)v5;
  *((_QWORD *)v2 + 9) = v7;
  *((_DWORD *)v2 + 20) = 1065353216;
  *((_WORD *)v2 + 42) = -1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[11];
  v3[11] = v8;

  if (!v3[11])
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create _results", buf, 2u);
    }
    goto LABEL_16;
  }
  v10 = objc_alloc(MEMORY[0x1E0D8C998]);
  v30 = *MEMORY[0x1E0D8C9D8];
  v31[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = objc_msgSend(v10, "initWithOptions:error:", v11, &v24);
  v13 = v24;
  v14 = (void *)v3[13];
  v3[13] = v12;

  if (!v3[13] || v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v13;
      v21 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create %@: %@", buf, 0x16u);

    }
    goto LABEL_15;
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C9A8]), "initWithMLHandler:", v3[13]);
  v16 = (void *)v3[14];
  v3[14] = v15;

  v17 = v3;
  if (!v3[14])
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      v19 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier] Failed to create %@", buf, 0xCu);

    }
LABEL_15:

LABEL_16:
    v17 = 0;
  }
  v22 = v17;

  return v22;
}

- (void)configureProcessTimeIntervalFrom:(id *)a3
{
  float processTimeInterval;
  uint8_t v5[16];
  CMTime time;

  if ((a3->var2 & 1) != 0)
  {
    time = *(CMTime *)a3;
    processTimeInterval = CMTimeGetSeconds(&time) / 30.0;
    if (self->_processTimeInterval >= processTimeInterval)
      processTimeInterval = self->_processTimeInterval;
    self->_processTimeInterval = processTimeInterval;
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid videoDuration, processTimeInterval unchanged.", v5, 2u);
  }
}

- (int)configureAndStartVideoAnalyzer
{
  void *v3;
  int v4;
  id v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C9A0]), "initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:", 0, 1, &unk_1E6B74768, 2, 1);
  if (v3)
  {
    -[SCMLVideoAnalyzer startAnalysisWithConfig:](self->_videoAnalyzer, "startAnalysisWithConfig:", v3);
    v4 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVideoSafetyClassifier]: Failed to create %@", (uint8_t *)&v7, 0xCu);

    }
    v4 = -108;
  }

  return v4;
}

- (void)addAnalysisResults
{
  CMTime *p_start;
  CMTime *p_end;
  void *v5;
  void *v6;
  NSDictionary *scoresForLabels;
  void *v8;
  void *v9;
  NSMutableArray *results;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  void *v13;
  CMTime v14;
  _QWORD v15[4];
  id v16;
  CMTime rhs;
  CMTime time;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_results, "count"))
  {
    p_start = (CMTime *)&self->_start;
    if ((self->_start.flags & 1) != 0)
    {
      p_end = (CMTime *)&self->_end;
      if ((self->_end.flags & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        scoresForLabels = self->_scoresForLabels;
        if (scoresForLabels)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __46__MADVideoSafetyClassifier_addAnalysisResults__block_invoke;
          v15[3] = &unk_1E6B174E8;
          v16 = v5;
          -[NSDictionary enumerateKeysAndObjectsUsingBlock:](scoresForLabels, "enumerateKeysAndObjectsUsingBlock:", v15);

        }
        v21[0] = CFSTR("Sensitivity");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_sensitivity);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = CFSTR("SensitivitySceneResults");
        v22[0] = v8;
        v22[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        results = self->_results;
        *(_OWORD *)&time.value = *(_OWORD *)&p_start->value;
        time.epoch = self->_start.epoch;
        v19[0] = CFSTR("start");
        v11 = CMTimeCopyAsDictionary(&time, 0);
        v20[0] = v11;
        v19[1] = CFSTR("duration");
        time = *p_end;
        rhs = *p_start;
        CMTimeSubtract(&v14, &time, &rhs);
        time = v14;
        v12 = CMTimeCopyAsDictionary(&time, 0);
        v19[2] = CFSTR("attributes");
        v20[1] = v12;
        v20[2] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](results, "addObject:", v13);

      }
    }
  }
}

void __46__MADVideoSafetyClassifier_addAnalysisResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VCPSpecialLabelToExtendedSceneClassificationID(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v11, 0xCu);
  }

}

- (int)analyzeFrameWithSampleBuffer:(opaqueCMSampleBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 andFlags:(unint64_t *)a6
{
  int result;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLastProcess;
  __int128 v11;
  __int128 v12;
  int64_t var3;
  void *v14;
  SCMLVideoAnalyzer *videoAnalyzer;
  char v16;
  id v17;
  char v18;
  SCMLVideoAnalyzer *v19;
  void *v20;
  id v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *scoresForLabels;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  CMTime time;
  CMTime rhs;
  CMTime buf;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((a4->var2 & 1) != 0)
  {
    p_timeLastProcess = &self->_timeLastProcess;
    buf = *(CMTime *)a4;
    rhs = (CMTime)self->_timeLastProcess;
    CMTimeSubtract(&time, &buf, &rhs);
    if (CMTimeGetSeconds(&time) < self->_processTimeInterval)
      return 0;
    v11 = *(_OWORD *)&a4->var0;
    p_timeLastProcess->epoch = a4->var3;
    *(_OWORD *)&p_timeLastProcess->value = v11;
    if ((self->_start.flags & 1) == 0)
    {
      result = -[MADVideoSafetyClassifier configureAndStartVideoAnalyzer](self, "configureAndStartVideoAnalyzer");
      if (result)
        return result;
      v12 = *(_OWORD *)&a4->var0;
      self->_start.epoch = a4->var3;
      *(_OWORD *)&self->_start.value = v12;
    }
    var3 = a4->var3;
    *(_OWORD *)&self->_end.value = *(_OWORD *)&a4->var0;
    self->_end.epoch = var3;
    if (self->_sensitivity == 1)
      return 0;
    v14 = (void *)MEMORY[0x1BCCA1B2C]();
    videoAnalyzer = self->_videoAnalyzer;
    v31 = 0;
    v16 = -[SCMLVideoAnalyzer addFrameBuffer:error:](videoAnalyzer, "addFrameBuffer:error:", a3, &v31);
    v17 = v31;
    if (v17)
      v18 = 0;
    else
      v18 = v16;
    if ((v18 & 1) != 0)
    {
      v19 = self->_videoAnalyzer;
      v30 = 0;
      -[SCMLVideoAnalyzer analyze:](v19, "analyze:", &v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v30;
      v22 = v21;
      if (v20 && !v21)
      {
        self->_sensitivity = objc_msgSend(v20, "sensitive");
        objc_msgSend(v20, "scoresForLabels");
        v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        scoresForLabels = self->_scoresForLabels;
        self->_scoresForLabels = v23;

        objc_autoreleasePoolPop(v14);
        return 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_opt_class();
        LODWORD(buf.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v28;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v22;
        v29 = v28;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::analyze: %@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    else
    {
      v25 = v17;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        LODWORD(buf.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v26;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v25;
        v27 = v26;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::addFrameBuffer:error: %@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    return -18;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid frame timestamp", (uint8_t *)&buf, 2u);
  }
  return -50;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  OSStatus v11;
  NSObject *v12;
  const char *v13;
  uint8_t *p_sampleTiming;
  __int128 v16;
  int64_t v17;
  __int128 v18;
  int64_t var3;
  CMTime v20;
  CMSampleBufferRef sampleBufferOut;
  uint8_t buf[2];
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  v20 = *(CMTime *)a4;
  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v11 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    LOWORD(sampleTiming.duration.value) = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "[CVPixelBuffer->CMSampleBuffer] Failed to create format description";
    p_sampleTiming = (uint8_t *)&sampleTiming;
    goto LABEL_9;
  }
  *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
  sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  sampleTiming.presentationTimeStamp = v20;
  sampleTiming.decodeTimeStamp = sampleTiming.duration;
  v11 = CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
  if (!v11)
  {
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
    v18 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v16 = *(_OWORD *)&a5->var0;
    v17 = a5->var3;
    v11 = -[MADVideoSafetyClassifier analyzeFrameWithSampleBuffer:timestamp:duration:andFlags:](self, "analyzeFrameWithSampleBuffer:timestamp:duration:andFlags:", sampleBufferOut, &v18, &v16, a6);
    goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer";
    p_sampleTiming = buf;
LABEL_9:
    _os_log_impl(&dword_1B6C4A000, v12, OS_LOG_TYPE_ERROR, v13, p_sampleTiming, 2u);
  }
LABEL_10:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
LABEL_11:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
  return v11;
}

- (int)finishAnalysisPass:(id *)a3
{
  __int128 v5;
  SCMLVideoAnalyzer *videoAnalyzer;
  void *v7;
  id v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *scoresForLabels;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  CMTimeRange range;
  $95D729B680665BEAEFA1D6FCA8238556 buf;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid frame timerange", (uint8_t *)&buf, 2u);
    }
    return -50;
  }
  else
  {
    v5 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v5;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd((CMTime *)&buf, &range);
    self->_end = buf;
    if (self->_sensitivity == 1 || (self->_start.flags & 1) == 0)
      goto LABEL_17;
    videoAnalyzer = self->_videoAnalyzer;
    v16 = 0;
    -[SCMLVideoAnalyzer finalizeAnalysis:](videoAnalyzer, "finalizeAnalysis:", &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    v9 = v8;
    if (!v7 || v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        LODWORD(buf.value) = 138412546;
        *(int64_t *)((char *)&buf.value + 4) = (int64_t)v12;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v9;
        v13 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::finalizeAnalysis: %@", (uint8_t *)&buf, 0x16u);

      }
    }
    else
    {
      self->_sensitivity = objc_msgSend(v7, "sensitive");
      objc_msgSend(v7, "scoresForLabels");
      v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      scoresForLabels = self->_scoresForLabels;
      self->_scoresForLabels = v10;

      if (!objc_msgSend(v7, "sensitive") || -[NSDictionary count](self->_scoresForLabels, "count"))
      {

LABEL_17:
        -[MADVideoSafetyClassifier addAnalysisResults](self, "addAnalysisResults");
        return 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_opt_class();
        LODWORD(buf.value) = 138412290;
        *(int64_t *)((char *)&buf.value + 4) = (int64_t)v14;
        v15 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::finalizeAnalysis: No scoresForLabels results", (uint8_t *)&buf, 0xCu);

      }
    }

    return -18;
  }
}

- (id)results
{
  NSMutableArray *results;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  results = self->_results;
  v4 = CFSTR("SafetyResults");
  v5[0] = results;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
