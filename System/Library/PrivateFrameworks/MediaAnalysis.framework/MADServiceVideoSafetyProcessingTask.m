@implementation MADServiceVideoSafetyProcessingTask

- (MADServiceVideoSafetyProcessingTask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MADServiceVideoSafetyProcessingTask *v19;
  MADServiceVideoSafetyProcessingTask *v20;
  void *v21;
  id progressHandler;
  void *v23;
  id completionHandler;
  objc_super v26;
  _QWORD v27[4];
  id v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __113__MADServiceVideoSafetyProcessingTask_initWithRequest_forAsset_cancelBlock_progressHandler_andCompletionHandler___block_invoke;
  v27[3] = &unk_1E6B16938;
  v18 = v17;
  v28 = v18;
  v26.receiver = self;
  v26.super_class = (Class)MADServiceVideoSafetyProcessingTask;
  v19 = -[VCPMABaseTask initWithCompletionHandler:](&v26, sel_initWithCompletionHandler_, v27);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_request, a3);
    objc_storeStrong((id *)&v20->_asset, a4);
    v21 = _Block_copy(v16);
    progressHandler = v20->_progressHandler;
    v20->_progressHandler = v21;

    v23 = _Block_copy(v18);
    completionHandler = v20->_completionHandler;
    v20->_completionHandler = v23;

    -[VCPMABaseTask setCancelBlock:](v20, "setCancelBlock:", v15);
    v20->_enablePowerLog = 1;
  }

  return v20;
}

void __113__MADServiceVideoSafetyProcessingTask_initWithRequest_forAsset_cancelBlock_progressHandler_andCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D47888];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setError:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_processFrameBuffer:(opaqueCMSampleBuffer *)a3 stop:(BOOL *)a4
{
  SCMLVideoAnalyzer *videoAnalyzer;
  char v7;
  id v8;
  SCMLVideoAnalyzer *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSError *v18;
  NSError *processError;
  void *v20;
  id v21;
  void *v22;
  NSError *v23;
  NSDictionary *v24;
  NSDictionary *scoresForLabels;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  videoAnalyzer = self->_videoAnalyzer;
  v27 = 0;
  v7 = -[SCMLVideoAnalyzer addFrameBuffer:error:](videoAnalyzer, "addFrameBuffer:error:", a3, &v27);
  v8 = v27;
  if ((v7 & 1) != 0)
  {
    v9 = self->_videoAnalyzer;
    v26 = v8;
    -[SCMLVideoAnalyzer analyze:](v9, "analyze:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;

    if (v10)
      v12 = v11 == 0;
    else
      v12 = 0;
    if (v12)
    {
      if (objc_msgSend(v10, "sensitive"))
      {
        self->_isSensitive = objc_msgSend(v10, "sensitive");
        if (-[MADVideoSafetyClassificationRequest requiresScoresAndLabels](self->_request, "requiresScoresAndLabels"))
        {
          objc_msgSend(v10, "scoresForLabels");
          v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          scoresForLabels = self->_scoresForLabels;
          self->_scoresForLabels = v24;

        }
        *a4 = 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        v15 = (void *)objc_opt_class();
        v16 = v15;
        objc_msgSend(v11, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v17;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to run %@::analyze: %@", buf, 0x20u);

      }
      v18 = (NSError *)objc_msgSend(v11, "copy");
      processError = self->_processError;
      self->_processError = v18;

    }
    v8 = v11;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      objc_msgSend(v8, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::addFrameBuffer:error: %@", buf, 0x16u);

    }
    v23 = (NSError *)objc_msgSend(v8, "copy");
    v10 = self->_processError;
    self->_processError = v23;
  }

}

- (BOOL)configureVideoProcessorWithError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MADVideoSafetyClassificationRequest *request;
  id v17;
  int v18;
  const __CFString *v19;
  void *v20;
  VCPBlockBasedVideoProcessorProtocol *videoProcessor;
  char v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  const __CFAllocator *v36;
  CFDictionaryRef v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v44;
  _QWORD aBlock[4];
  id v46;
  CMTime location;
  CMTime buf;
  double v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = objc_opt_class();
    v4 = *(id *)((char *)&buf.value + 4);
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Configuring video processor", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B72740, *MEMORY[0x1E0CA9040]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B72758, *MEMORY[0x1E0CA90E0]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B72758, *MEMORY[0x1E0CA8FD8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MADVideoSafetyClassificationRequest appliesPreferredTrackTransform](self->_request, "appliesPreferredTrackTransform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("AppliesPreferredTrackTransform"));

  -[MADVideoSafetyClassificationRequest sampling](self->_request, "sampling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend(v8, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Non-default sampling in use: %@", (uint8_t *)&buf, 0x16u);

    }
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D478A0]), "initWithFramesPerSync:frameLimit:uniformSampling:", 1, 30, 1);
  }
  if (-[MADVideoSafetyClassificationRequest requiresBlastdoor](self->_request, "requiresBlastdoor"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "framesPerSync"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C8AEC0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("FrameLimit"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "uniformSampling"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("UniformSampling"));

  }
  else
  {
    -[VCPBlockBasedVideoProcessorProtocol videoDuration](self->_videoProcessor, "videoDuration");
    v30 = v29;
    if (!objc_msgSend(v8, "frameLimit")
      && objc_msgSend(v8, "uniformSampling")
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_opt_class();
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v31;
      v32 = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Unexpected uniformSampling specified when frameLimit is 0, ignoring uniformSampling", (uint8_t *)&buf, 0xCu);

    }
    if (objc_msgSend(v8, "framesPerSync"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "framesPerSync"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0C8AEC0]);

      if (objc_msgSend(v8, "frameLimit"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("FrameLimit"));

        if (objc_msgSend(v8, "uniformSampling"))
        {
          v35 = v30 / ((double)(unint64_t)(objc_msgSend(v8, "frameLimit") - 1) + 0.1);
          if (v35 <= 0.0)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v40 = (void *)objc_opt_class();
              v41 = *MEMORY[0x1E0C8AE28];
              LODWORD(buf.value) = 138412802;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v40;
              LOWORD(buf.flags) = 2112;
              *(_QWORD *)((char *)&buf.flags + 2) = v41;
              HIWORD(buf.epoch) = 2048;
              v49 = v35;
              v42 = v40;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Invalid decoder configuration value (%@ = %f), ignoring", (uint8_t *)&buf, 0x20u);

            }
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            CMTimeMakeWithSeconds(&buf, v35, 1000);
            v36 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            location = buf;
            v37 = CMTimeCopyAsDictionary(&location, v36);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0C8AE28]);

          }
        }
      }
    }
    else if (objc_msgSend(v8, "frameLimit"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "frameLimit"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("FrameLimit"));

      if (objc_msgSend(v8, "uniformSampling"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v8, "frameLimit") / v30);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("FramesPerSecond"));

      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_opt_class();
    request = self->_request;
    v17 = v15;
    v18 = -[MADVideoSafetyClassificationRequest requiresBlastdoor](request, "requiresBlastdoor");
    v19 = CFSTR("NO");
    LODWORD(buf.value) = 138413058;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v15;
    LOWORD(buf.flags) = 2112;
    if (v18)
      v19 = CFSTR("YES");
    *(_QWORD *)((char *)&buf.flags + 2) = v19;
    HIWORD(buf.epoch) = 2112;
    v49 = *(double *)&v5;
    v50 = 2112;
    v51 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] requiresBlastdoor: %@, decoder configuration: %@, request configuration: %@", (uint8_t *)&buf, 0x2Au);

  }
  -[VCPBlockBasedVideoProcessorProtocol setDecoderSettings:](self->_videoProcessor, "setDecoderSettings:", v5);
  objc_initWeak((id *)&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MADServiceVideoSafetyProcessingTask_configureVideoProcessorWithError___block_invoke;
  aBlock[3] = &unk_1E6B16960;
  objc_copyWeak(&v46, (id *)&location);
  v20 = _Block_copy(aBlock);
  videoProcessor = self->_videoProcessor;
  v44 = 0;
  v22 = -[VCPBlockBasedVideoProcessorProtocol addFrameProcessingRequest:withConfiguration:error:](videoProcessor, "addFrameProcessingRequest:withConfiguration:error:", v20, v6, &v44);
  v23 = v44;
  if ((v22 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v24 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = (id)objc_opt_class();
        objc_msgSend(v23, "description");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v26;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to add request to video processor (%@)", (uint8_t *)&buf, 0x16u);

      }
    }
    if (a3)
      *a3 = (id)objc_msgSend(v23, "copy");
  }

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)&location);

  return v22;
}

void __72__MADServiceVideoSafetyProcessingTask_configureVideoProcessorWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_processFrameBuffer:stop:", a2, a3);
    WeakRetained = v6;
  }

}

- (id)finalizeSafetyResultsWithError:(id *)a3
{
  id v5;
  SCMLVideoAnalyzer *videoAnalyzer;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSDictionary *v17;
  NSDictionary *scoresForLabels;
  id v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = (id)objc_opt_class();
    v5 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Finalizing results", buf, 0xCu);

  }
  if (self->_isSensitive)
    goto LABEL_17;
  videoAnalyzer = self->_videoAnalyzer;
  v20 = 0;
  -[SCMLVideoAnalyzer finalizeAnalysis:](videoAnalyzer, "finalizeAnalysis:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    self->_isSensitive = objc_msgSend(v7, "sensitive");
    if (-[MADVideoSafetyClassificationRequest requiresScoresAndLabels](self->_request, "requiresScoresAndLabels"))
    {
      objc_msgSend(v7, "scoresForLabels");
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      scoresForLabels = self->_scoresForLabels;
      self->_scoresForLabels = v17;

    }
LABEL_17:
    v16 = objc_alloc_init(MEMORY[0x1E0D47888]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47898]), "initWithIsSensitive:scoresForLabels:", self->_isSensitive, self->_scoresForLabels);
    v21 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setResults:", v7);
    goto LABEL_18;
  }
  v10 = v8;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    v13 = (void *)objc_opt_class();
    v14 = v13;
    objc_msgSend(v10, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v11;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to run %@::finalizeAnalysis: %@", buf, 0x20u);

  }
  v16 = 0;
  if (a3)
    *a3 = (id)objc_msgSend(v10, "copy");
LABEL_18:

  return v16;
}

- (BOOL)run:(id *)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  MADUserSafetyVideoQRCodeDetector *v10;
  MADServiceVideoAsset *asset;
  MADVideoSafetyClassificationRequest *request;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __objc2_class *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  VCPBlockBasedVideoProcessorProtocol *v57;
  VCPBlockBasedVideoProcessorProtocol *videoProcessor;
  id progressHandler;
  void *v60;
  NSObject *v61;
  os_signpost_id_t v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  void *v66;
  SCMLHandler *v67;
  SCMLHandler *handler;
  NSObject *v69;
  NSObject *v70;
  SCMLVideoAnalyzer *v71;
  SCMLVideoAnalyzer *videoAnalyzer;
  BOOL v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  MADVideoSafetyClassificationRequest *v86;
  id v87;
  MADVideoSafetyClassificationRequest *v88;
  int v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  int v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  os_signpost_id_t v132;
  NSObject *v133;
  NSObject *v134;
  void *v135;
  VCPBlockBasedVideoProcessorProtocol *v136;
  char v137;
  NSObject *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  NSError *processError;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v152;
  id v153;
  BOOL v154;
  void *v155;
  void *v156;
  id v157;
  int v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  id v163;
  void *v165;
  uint64_t v166;
  id v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  uint64_t v181;
  id v182;
  uint8_t buf[4];
  id v184;
  __int16 v185;
  uint64_t v186;
  __int16 v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  id v196;
  void *v197;
  void *v198;
  uint64_t v199;
  _QWORD v200[3];

  v200[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v184 = (id)objc_opt_class();
    v5 = v184;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);

  }
  if (-[MADServiceVideoAsset userSafetyEligible](self->_asset, "userSafetyEligible"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;

    if (+[MADUserSafetyQRCodeDetector enabled](MADUserSafetyQRCodeDetector, "enabled"))
    {
      v9 = (void *)MEMORY[0x1BCCA1B2C]();
      v10 = objc_alloc_init(MADUserSafetyVideoQRCodeDetector);
      asset = self->_asset;
      request = self->_request;
      -[MADServiceVideoProcessingSubtask signpostPayload](self, "signpostPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADUserSafetyVideoQRCodeDetector sensitivityFromQRCodeInVideo:request:signpostPayload:progressHandler:](v10, "sensitivityFromQRCodeInVideo:request:signpostPayload:progressHandler:", asset, request, v13, self->_progressHandler);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (objc_msgSend(v14, "BOOLValue"))
        {
          if (-[MADVideoSafetyClassificationRequest requiresScoresAndLabels](self->_request, "requiresScoresAndLabels")&& (int)MediaAnalysisLogLevel() >= 4&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v184 = v15;
            v16 = v15;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] ignore scores&labels request", buf, 0xCu);

          }
          v17 = objc_alloc_init(MEMORY[0x1E0D47888]);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47898]), "initWithIsSensitive:scoresForLabels:", 1, 0);
          v198 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v198, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setResults:", v19);

          (*((void (**)(void))self->_completionHandler + 2))();
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v20 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v184 = v20;
            v21 = v20;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v9);
          return 1;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v184 = v29;
        v30 = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] processing failed.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
    -[MADServiceVideoAsset isSensitive](self->_asset, "isSensitive");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADServiceVideoAsset scoresForLabels](self->_asset, "scoresForLabels");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v31
      && (v32
       || (-[MADVideoSafetyClassificationRequest requiresScoresAndLabels](self->_request, "requiresScoresAndLabels") & 1) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v34 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v184 = v34;
        v35 = v34;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Leveraging pre-computed IVS result", buf, 0xCu);

      }
      v36 = objc_alloc_init(MEMORY[0x1E0D47888]);
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47898]), "initWithIsSensitive:scoresForLabels:", self->_isSensitive | objc_msgSend(v31, "BOOLValue"), v33);
      v197 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setResults:", v38);

      (*((void (**)(void))self->_completionHandler + 2))();
      if (self->_enablePowerLog)
      {
        -[MADServiceVideoAsset clientBundleID](self->_asset, "clientBundleID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        MADPLLogIVSProcessing(v39, 1, -[MADServiceVideoAsset assetType](self->_asset, "assetType"), v8);

      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v40 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v184 = v40;
        v41 = v40;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);

      }
      v22 = 1;
      goto LABEL_152;
    }
    -[MADVideoSafetyClassificationRequest sensitiveFrameCountThreshold](self->_request, "sensitiveFrameCountThreshold");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42
      && (v43 = (void *)v42,
          -[MADVideoSafetyClassificationRequest sensitiveFrameCountThreshold](self->_request, "sensitiveFrameCountThreshold"), v44 = (void *)objc_claimAutoreleasedReturnValue(), v45 = objc_msgSend(v44, "unsignedIntegerValue"), v44, v43, !v45))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v77 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v184 = v77;
        v78 = v77;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0", buf, 0xCu);

      }
      if (!a3)
      {
        v22 = 0;
LABEL_153:

        return v22;
      }
      v79 = (void *)MEMORY[0x1E0CB35C8];
      v80 = *MEMORY[0x1E0CB2F90];
      v195 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0"), objc_opt_class());
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v196 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "errorWithDomain:code:userInfo:", v80, -50, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = *a3;
      *a3 = v82;

      v22 = 0;
    }
    else
    {
      -[MADServiceVideoAsset url](self->_asset, "url");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        v47 = v33;
        v48 = v31;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v184 = v49;
          v50 = v49;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to obtain video resource", buf, 0xCu);

        }
        v51 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0CB2F90];
        v193 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to obtain video resource"), objc_opt_class());
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "errorWithDomain:code:userInfo:", v52, -18, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = *a3;
        *a3 = v55;

        v22 = 0;
        v31 = v48;
        goto LABEL_77;
      }
      if (-[MADVideoSafetyClassificationRequest requiresBlastdoor](self->_request, "requiresBlastdoor"))
        v46 = VCPBlastdoorVideoProcessor;
      else
        v46 = VCPVideoProcessor;
      v57 = (VCPBlockBasedVideoProcessorProtocol *)objc_msgSend([v46 alloc], "initWithURL:", v36);
      videoProcessor = self->_videoProcessor;
      self->_videoProcessor = v57;

      if (self->_videoProcessor)
      {
        progressHandler = self->_progressHandler;
        if (progressHandler)
        {
          v60 = _Block_copy(progressHandler);
          -[VCPBlockBasedVideoProcessorProtocol setProgressHandler:](self->_videoProcessor, "setProgressHandler:", v60);

        }
        v174 = v31;
        v175 = v33;
        VCPSignPostLog();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = os_signpost_id_generate(v61);

        VCPSignPostLog();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "CommSafetyHandler_Init", ", buf, 2u);
        }

        v65 = objc_alloc(MEMORY[0x1E0D8C998]);
        v189 = *MEMORY[0x1E0D8C9D8];
        v190 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = 0;
        v67 = (SCMLHandler *)objc_msgSend(v65, "initWithOptions:error:", v66, &v180);
        v176 = v180;
        handler = self->_handler;
        self->_handler = v67;

        VCPSignPostLog();
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v69;
        if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v70, OS_SIGNPOST_INTERVAL_END, v62, "CommSafetyHandler_Init", ", buf, 2u);
        }

        v33 = v175;
        if (!self->_handler || v176)
        {
          v53 = v176;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v101 = (void *)objc_opt_class();
            v102 = v101;
            v103 = (void *)objc_opt_class();
            v104 = v103;
            objc_msgSend(v176, "description");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v184 = v101;
            v185 = 2112;
            v186 = (uint64_t)v103;
            v187 = 2112;
            v188 = v105;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create %@ (%@)", buf, 0x20u);

            v33 = v175;
          }
          if (a3)
          {
            v106 = (void *)objc_msgSend(v176, "copy");
            v22 = 0;
            v54 = *a3;
            *a3 = v106;
LABEL_83:
            v31 = v174;
            goto LABEL_150;
          }
          v22 = 0;
          v31 = v174;
        }
        else
        {
          v71 = (SCMLVideoAnalyzer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C9A8]), "initWithMLHandler:", self->_handler);
          videoAnalyzer = self->_videoAnalyzer;
          self->_videoAnalyzer = v71;

          if (self->_videoAnalyzer)
          {
            v179 = 0;
            v73 = -[MADServiceVideoSafetyProcessingTask configureVideoProcessorWithError:](self, "configureVideoProcessorWithError:", &v179);
            v54 = v179;
            if (v73)
            {
              -[MADVideoSafetyClassificationRequest sensitiveFrameCountThreshold](self->_request, "sensitiveFrameCountThreshold");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (v74)
              {
                -[MADVideoSafetyClassificationRequest sensitiveFrameCountThreshold](self->_request, "sensitiveFrameCountThreshold");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend(v75, "unsignedIntegerValue");

              }
              else
              {
                v76 = 2;
              }

              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v125 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v184 = v125;
                v185 = 1024;
                LODWORD(v186) = v76;
                v126 = v125;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Configuring sensitiveFrameCountThreshold: %u", buf, 0x12u);

              }
              v167 = objc_alloc(MEMORY[0x1E0D8C9A0]);
              -[MADVideoSafetyClassificationRequest sampling](self->_request, "sampling");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = objc_msgSend(v171, "framesPerSync");
              -[MADVideoSafetyClassificationRequest sampling](self->_request, "sampling");
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = objc_msgSend(v169, "frameLimit");
              if (v127)
              {
                v128 = (void *)MEMORY[0x1E0CB37E8];
                -[MADVideoSafetyClassificationRequest sampling](self->_request, "sampling");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "numberWithUnsignedInteger:", objc_msgSend(v165, "frameLimit"));
                v129 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v129 = 0;
              }
              -[MADVideoSafetyClassificationRequest sampling](self->_request, "sampling");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = (id)objc_msgSend(v167, "initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:", 0, v166, v129, v76, objc_msgSend(v130, "uniformSampling"));

              if (v127)
              {

              }
              v172 = v124;
              -[SCMLVideoAnalyzer startAnalysisWithConfig:](self->_videoAnalyzer, "startAnalysisWithConfig:", v124);
              VCPSignPostLog();
              v131 = objc_claimAutoreleasedReturnValue();
              v132 = os_signpost_id_generate(v131);

              VCPSignPostLog();
              v133 = objc_claimAutoreleasedReturnValue();
              v134 = v133;
              if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
              {
                -[MADServiceVideoProcessingSubtask signpostPayload](self, "signpostPayload");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v184 = v135;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v134, OS_SIGNPOST_INTERVAL_BEGIN, v132, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);

              }
              v136 = self->_videoProcessor;
              v178 = 0;
              v137 = -[VCPBlockBasedVideoProcessorProtocol analyzeWithError:](v136, "analyzeWithError:", &v178);
              v173 = v178;
              v53 = 0;
              if ((v137 & 1) != 0)
              {
                VCPSignPostLog();
                v138 = objc_claimAutoreleasedReturnValue();
                v139 = v138;
                if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v138))
                {
                  -[MADServiceVideoProcessingSubtask signpostPayload](self, "signpostPayload");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v184 = v140;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v139, OS_SIGNPOST_INTERVAL_END, v132, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);

                }
                if (!self->_processError)
                {
                  v177 = 0;
                  -[MADServiceVideoSafetyProcessingTask finalizeSafetyResultsWithError:](self, "finalizeSafetyResultsWithError:", &v177);
                  v152 = objc_claimAutoreleasedReturnValue();
                  v153 = v177;
                  v147 = v153;
                  if (v152)
                    v154 = v153 == 0;
                  else
                    v154 = 0;
                  v22 = v154;
                  v170 = (void *)v152;
                  if (v154)
                  {
                    (*((void (**)(void))self->_completionHandler + 2))();
                    v31 = v174;
                    v124 = v172;
                    if (self->_enablePowerLog)
                    {
                      -[MADServiceVideoAsset clientBundleID](self->_asset, "clientBundleID");
                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                      MADPLLogIVSProcessing(v155, 0, -[MADServiceVideoAsset assetType](self->_asset, "assetType"), v8);

                    }
                    v145 = v173;
                    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      v156 = (void *)objc_opt_class();
                      *(_DWORD *)buf = 138412290;
                      v184 = v156;
                      v157 = v156;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);

                    }
                  }
                  else
                  {
                    v158 = MediaAnalysisLogLevel();
                    v124 = v172;
                    v145 = v173;
                    if (v158 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      v159 = (void *)objc_opt_class();
                      v168 = v159;
                      objc_msgSend(v147, "description");
                      v160 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v184 = v159;
                      v185 = 2112;
                      v186 = v160;
                      v161 = (void *)v160;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to finalize results (%@)", buf, 0x16u);

                    }
                    v31 = v174;
                    if (a3)
                    {
                      v162 = (void *)objc_msgSend(v147, "copy");
                      v163 = *a3;
                      *a3 = v162;

                    }
                  }

                  goto LABEL_147;
                }
                if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  v141 = (void *)objc_opt_class();
                  processError = self->_processError;
                  v143 = v141;
                  -[NSError description](processError, "description");
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v184 = v141;
                  v185 = 2112;
                  v186 = (uint64_t)v144;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to process frame buffer (%@)", buf, 0x16u);

                }
                v145 = v173;
                if (a3)
                {
                  v146 = (void *)-[NSError copy](self->_processError, "copy");
                  v22 = 0;
                  v147 = *a3;
                  *a3 = v146;
                  v31 = v174;
LABEL_147:

                  goto LABEL_148;
                }
                v22 = 0;
                v31 = v174;
              }
              else
              {
                v145 = v173;
                if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  v148 = (void *)objc_opt_class();
                  v149 = v148;
                  objc_msgSend(v173, "description");
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v184 = v148;
                  v185 = 2112;
                  v186 = (uint64_t)v150;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to process video (%@)", buf, 0x16u);

                }
                if (a3)
                {
                  v151 = (void *)objc_msgSend(v173, "copy");
                  v22 = 0;
                  v147 = *a3;
                  *a3 = v151;
                  v31 = v174;
                  goto LABEL_147;
                }
                v22 = 0;
                v31 = v174;
              }
LABEL_148:

              v33 = v175;
              goto LABEL_149;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v118 = (void *)objc_opt_class();
              v119 = v118;
              v120 = (void *)objc_opt_class();
              v121 = v120;
              objc_msgSend(v54, "description");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v184 = v118;
              v33 = v175;
              v185 = 2112;
              v186 = (uint64_t)v120;
              v187 = 2112;
              v188 = v122;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to configure %@ (%@)", buf, 0x20u);

            }
            v53 = 0;
            if (a3)
            {
              v123 = (void *)objc_msgSend(v54, "copy");
              v22 = 0;
              v124 = *a3;
              *a3 = v123;
              v31 = v174;
LABEL_149:

              goto LABEL_150;
            }
            v22 = 0;
            goto LABEL_83;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v107 = (void *)objc_opt_class();
            v108 = v107;
            v109 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v184 = v107;
            v185 = 2112;
            v186 = (uint64_t)v109;
            v110 = v109;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create %@", buf, 0x16u);

          }
          v53 = 0;
          if (a3)
          {
            v111 = (void *)MEMORY[0x1E0CB35C8];
            v112 = *MEMORY[0x1E0CB2F90];
            v181 = *MEMORY[0x1E0CB2D50];
            v113 = (void *)MEMORY[0x1E0CB3940];
            v114 = objc_opt_class();
            objc_msgSend(v113, "stringWithFormat:", CFSTR("[%@] Failed to create %@"), v114, objc_opt_class());
            v54 = (id)objc_claimAutoreleasedReturnValue();
            v182 = v54;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "errorWithDomain:code:userInfo:", v112, -50, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = *a3;
            *a3 = v116;

            v22 = 0;
            v31 = v174;
            v33 = v175;
            goto LABEL_150;
          }
          v22 = 0;
          v31 = v174;
          v33 = v175;
        }
LABEL_151:

        goto LABEL_152;
      }
      v47 = v33;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v84 = (void *)objc_opt_class();
        v85 = v31;
        v86 = self->_request;
        v87 = v84;
        v88 = v86;
        v31 = v85;
        v89 = -[MADVideoSafetyClassificationRequest requiresBlastdoor](v88, "requiresBlastdoor");
        v90 = CFSTR("NO");
        if (v89)
          v90 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v184 = v84;
        v185 = 2112;
        v186 = (uint64_t)v90;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create video processor (requiresBlastdoor: %@)", buf, 0x16u);

      }
      if (a3)
      {
        v91 = v31;
        v92 = (void *)MEMORY[0x1E0CB35C8];
        v93 = *MEMORY[0x1E0CB2F90];
        v191 = *MEMORY[0x1E0CB2D50];
        v94 = (void *)MEMORY[0x1E0CB3940];
        v95 = objc_opt_class();
        v96 = -[MADVideoSafetyClassificationRequest requiresBlastdoor](self->_request, "requiresBlastdoor");
        v97 = CFSTR("NO");
        if (v96)
          v97 = CFSTR("YES");
        objc_msgSend(v94, "stringWithFormat:", CFSTR("[%@] Failed to create video processor (requiresBlastdoor: %@)"), v95, v97);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v98 = v92;
        v31 = v91;
        objc_msgSend(v98, "errorWithDomain:code:userInfo:", v93, -50, v54);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = *a3;
        *a3 = v99;

        v22 = 0;
LABEL_77:
        v33 = v47;
LABEL_150:

        goto LABEL_151;
      }
      v22 = 0;
      v33 = v47;
    }
LABEL_152:

    goto LABEL_153;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "User Safety either not entitled for client or not enabled", buf, 2u);
  }
  if (a3)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2F90];
    v199 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User Safety either not entitled for client or not enabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v200[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v200, &v199, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, -18, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *a3;
    *a3 = v27;

  }
  return 0;
}

- (BOOL)enablePowerLog
{
  return self->_enablePowerLog;
}

- (void)setEnablePowerLog:(BOOL)a3
{
  self->_enablePowerLog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_scoresForLabels, 0);
  objc_storeStrong((id *)&self->_processError, 0);
  objc_storeStrong((id *)&self->_videoAnalyzer, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_videoProcessor, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
