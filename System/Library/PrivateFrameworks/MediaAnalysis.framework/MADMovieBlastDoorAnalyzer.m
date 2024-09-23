@implementation MADMovieBlastDoorAnalyzer

- (MADMovieBlastDoorAnalyzer)initWithMovieURL:(id)a3 analysisTypes:(unint64_t)a4 cancelBlock:(id)a5
{
  id v9;
  id v10;
  MADMovieBlastDoorAnalyzer *v11;
  MADMovieBlastDoorAnalyzer *v12;
  uint64_t v13;
  void *v14;
  id cancelBlock;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADMovieBlastDoorAnalyzer;
  v11 = -[MADMovieBlastDoorAnalyzer init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_movieURL, a3);
    v12->_analysisTypes = a4;
    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(&v12->_orientation + 1) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&v12->_timeRange.start.flags = *(_QWORD *)(v13 + 16);
    v14 = _Block_copy(v10);
    cancelBlock = v12->_cancelBlock;
    v12->_cancelBlock = v14;

  }
  return v12;
}

- (int)configureAnalyzers
{
  NSMutableDictionary *v4;
  NSMutableDictionary *privateResults;
  void *v6;
  unint64_t analysisTypes;
  VCPVideoSceneClassifier *v8;
  VCPVideoSceneClassifier *sceneClassifier;
  MADVideoSafetyClassifier *v10;
  MADVideoSafetyClassifier *safetyClassifier;
  MADVideoSafetyClassifier *v12;
  VCPVideoEmbeddings *v13;
  void *v14;
  VCPVideoEmbeddings *v15;
  VCPVideoEmbeddings *videoEmbeddings;
  VCPFullVideoAnalyzer *v17;
  uint64_t orientation;
  __int128 v19;
  double v20;
  double v21;
  VCPFullVideoAnalyzer *v22;
  VCPFullVideoAnalyzer *videoAnalysis;
  VCPVideoHumanActionAnalyzer *v24;
  VCPVideoHumanActionAnalyzer *humanActionAnalyzer;
  VCPVideoCNNAnalyzer *v26;
  double frameRate;
  __int128 v28;
  double v29;
  VCPVideoCNNAnalyzer *v30;
  VCPVideoCNNAnalyzer *videoCNNAnalyzer;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint8_t buf[16];

  if ((self->_analysisTypes & 0xFFFFF3FFBFFFBFFFLL) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported analysis type requested", buf, 2u);
    }
    return -50;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    privateResults = self->_privateResults;
    self->_privateResults = v4;

    -[NSMutableDictionary objectForKey:](self->_privateResults, "objectForKey:", CFSTR("OrientationResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    analysisTypes = self->_analysisTypes;
    if ((analysisTypes & 0x4000) != 0)
    {
      v8 = objc_alloc_init(VCPVideoSceneClassifier);
      sceneClassifier = self->_sceneClassifier;
      self->_sceneClassifier = v8;

      analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x40000000000) != 0)
    {
      v10 = objc_alloc_init(MADVideoSafetyClassifier);
      safetyClassifier = self->_safetyClassifier;
      self->_safetyClassifier = v10;

      v12 = self->_safetyClassifier;
      v37 = *(_OWORD *)((char *)&self->_timeRange.start.epoch + 4);
      v38 = *(_QWORD *)&self->_timeRange.duration.flags;
      -[MADVideoSafetyClassifier configureProcessTimeIntervalFrom:](v12, "configureProcessTimeIntervalFrom:", &v37);
      analysisTypes = self->_analysisTypes;
    }
    if ((analysisTypes & 0x80040000000) != 0)
    {
      v13 = [VCPVideoEmbeddings alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[VCPVideoEmbeddings initWithEmbeddingType:version:](v13, "initWithEmbeddingType:version:", 2, v14);
      videoEmbeddings = self->_videoEmbeddings;
      self->_videoEmbeddings = v15;

      v17 = [VCPFullVideoAnalyzer alloc];
      orientation = self->_orientation;
      v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v35[0] = *MEMORY[0x1E0C9BAA8];
      v35[1] = v19;
      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      HIDWORD(v20) = DWORD1(v36);
      LOWORD(v32) = 0;
      LODWORD(v20) = 0;
      LODWORD(v19) = 0;
      LODWORD(v21) = 1.0;
      v22 = -[VCPFullVideoAnalyzer initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:](v17, "initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:", orientation, v35, v6, self->_privateResults, self->_videoEmbeddings, 0, v20, *(double *)&v19, v21, v32);
      videoAnalysis = self->_videoAnalysis;
      self->_videoAnalysis = v22;

      v24 = -[VCPVideoHumanActionAnalyzer initWithTimeOfInterest:phFaces:]([VCPVideoHumanActionAnalyzer alloc], "initWithTimeOfInterest:phFaces:", 0, 0);
      humanActionAnalyzer = self->_humanActionAnalyzer;
      self->_humanActionAnalyzer = v24;

      v26 = [VCPVideoCNNAnalyzer alloc];
      frameRate = self->_frameRate;
      *(float *)&frameRate = frameRate;
      v28 = *(_OWORD *)&self->_timeRange.start.flags;
      v33[0] = *(_OWORD *)(&self->_orientation + 1);
      v33[1] = v28;
      v34 = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
      HIDWORD(v29) = DWORD1(v34);
      LODWORD(v29) = 0;
      v30 = -[VCPVideoCNNAnalyzer initWithTimeOfInteret:frameRate:isLivePhoto:phFaces:timeRange:withEmbeddings:requestedAnalyses:photoOffset:](v26, "initWithTimeOfInteret:frameRate:isLivePhoto:phFaces:timeRange:withEmbeddings:requestedAnalyses:photoOffset:", 0, 0, 0, v33, self->_videoEmbeddings, self->_analysisTypes, frameRate, v29);
      videoCNNAnalyzer = self->_videoCNNAnalyzer;
      self->_videoCNNAnalyzer = v30;

    }
    return 0;
  }
}

- (int)queryVideoProperties:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t height;
  unint64_t width;
  NSObject *v13;
  const char *v14;
  int v15;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  int v23;
  int orientation;
  double v25;
  double v26;
  double frameRate;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[16];
  _BYTE v42[14];
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __50__MADMovieBlastDoorAnalyzer_queryVideoProperties___block_invoke;
  v32 = &unk_1E6B15518;
  v34 = &v35;
  v6 = v5;
  v33 = v6;
  v7 = _Block_copy(&v29);
  objc_msgSend(v4, "generateMetadataforAttachmentWithfileURL:resultHandler:", self->_movieURL, v7, v29, v30, v31, v32);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (void *)v36[5];
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Failed to query movie metadata";
    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "has_rawPixelWidth")
    || !objc_msgSend((id)v36[5], "has_rawPixelHeight")
    || (objc_msgSend((id)v36[5], "has_rawOrientation") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Movie metadata missing dimensions";
    goto LABEL_16;
  }
  if (!objc_msgSend((id)v36[5], "has_videoDurationValue")
    || (objc_msgSend((id)v36[5], "has_videoDurationTimescale") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Movie metadata missing duration";
    goto LABEL_16;
  }
  if ((objc_msgSend((id)v36[5], "has_avFPS") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Movie metadata missing frame rate";
LABEL_16:
    _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
LABEL_17:
    v15 = -18;
    goto LABEL_18;
  }
  v9 = objc_msgSend((id)v36[5], "rawOrientation");
  v10 = (void *)v36[5];
  if (v9 > 4)
  {
    self->_height = objc_msgSend(v10, "rawPixelWidth");
    width = objc_msgSend((id)v36[5], "rawPixelHeight");
    self->_width = width;
    height = self->_height;
  }
  else
  {
    self->_width = objc_msgSend(v10, "rawPixelWidth");
    height = objc_msgSend((id)v36[5], "rawPixelHeight");
    self->_height = height;
    width = self->_width;
  }
  if (width < height)
    v17 = 1;
  else
    v17 = 3;
  self->_orientation = v17;
  objc_msgSend((id)v36[5], "videoDurationValue");
  v19 = v18;
  objc_msgSend((id)v36[5], "videoDurationTimescale");
  CMTimeMake((CMTime *)buf, (uint64_t)v19, (int)v20);
  *(_OWORD *)((char *)&self->_timeRange.start.epoch + 4) = *(_OWORD *)buf;
  *(_QWORD *)&self->_timeRange.duration.flags = *(_QWORD *)v42;
  objc_msgSend((id)v36[5], "avFPS");
  self->_frameRate = v21;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend((id)v36[5], "rawPixelWidth");
    v23 = objc_msgSend((id)v36[5], "rawPixelHeight");
    orientation = self->_orientation;
    objc_msgSend((id)v36[5], "videoDurationValue");
    v26 = v25;
    objc_msgSend((id)v36[5], "videoDurationTimescale");
    *(_DWORD *)buf = 67110144;
    frameRate = self->_frameRate;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v23;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)v42 = orientation;
    *(_WORD *)&v42[4] = 2048;
    *(double *)&v42[6] = v26 / v28;
    v43 = 2048;
    v44 = frameRate;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Source Dimensions: %dx%d  Orientation: %d  Duration: %0.3fs, Frame Rate: %f", buf, 0x28u);
  }
  v15 = 0;
LABEL_18:

  _Block_object_dispose(&v35, 8);
  return v15;
}

void __50__MADMovieBlastDoorAnalyzer_queryVideoProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)processFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5
{
  uint64_t (**cancelBlock)(id, SEL);
  int v10;
  CMTimeValue value;
  int var1;
  Float64 Seconds;
  CMTimeValue v14;
  int v15;
  Float64 v16;
  __int128 v17;
  VCPFrameAnalysisStats *v18;
  VCPVideoSceneClassifier *sceneClassifier;
  NSObject *v20;
  const char *v21;
  uint8_t *p_buf;
  CMTimeEpoch v24;
  VCPVideoHumanActionAnalyzer *humanActionAnalyzer;
  VCPVideoSceneClassifier *v26;
  VCPFullVideoAnalyzer *videoAnalysis;
  void *v28;
  void *v29;
  VCPFullVideoAnalyzer *v30;
  VCPVideoCNNAnalyzer *videoCNNAnalyzer;
  VCPFullVideoAnalyzer *v32;
  VCPVideoHumanActionAnalyzer *v33;
  VCPVideoCNNAnalyzer *v34;
  MADVideoSafetyClassifier *safetyClassifier;
  __int128 v36;
  int64_t v37;
  __int128 v38;
  int64_t v39;
  __int128 v40;
  int64_t v41;
  __int128 v42;
  int64_t v43;
  __int128 v44;
  int64_t v45;
  __int128 v46;
  int64_t v47;
  __int128 v48;
  int64_t v49;
  __int128 v50;
  int64_t v51;
  __int128 v52;
  int64_t var3;
  CMTime v54;
  CMSampleBufferRef sampleBufferOut;
  __int128 v56;
  int64_t v57;
  __int128 v58;
  int64_t v59;
  uint64_t v60;
  CMTime v61;
  CMTime time;
  uint8_t v63[2];
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleTimingInfo buf;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  cancelBlock = (uint64_t (**)(id, SEL))self->_cancelBlock;
  if (cancelBlock && (cancelBlock[2](cancelBlock, a2) & 1) != 0)
    return -128;
  if ((a4->var2 & 0x1D) == 1 && (a5->var2 & 0x1D) == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      var1 = a4->var1;
      time = (CMTime)*a4;
      value = time.value;
      Seconds = CMTimeGetSeconds(&time);
      v15 = a5->var1;
      v61 = (CMTime)*a5;
      v14 = v61.value;
      v16 = CMTimeGetSeconds(&v61);
      LODWORD(buf.duration.value) = 134219264;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = value;
      LOWORD(buf.duration.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = var1;
      WORD1(buf.duration.epoch) = 2048;
      *(Float64 *)((char *)&buf.duration.epoch + 4) = Seconds;
      WORD2(buf.presentationTimeStamp.value) = 2048;
      *(CMTimeValue *)((char *)&buf.presentationTimeStamp.value + 6) = v14;
      HIWORD(buf.presentationTimeStamp.flags) = 1024;
      LODWORD(buf.presentationTimeStamp.epoch) = v15;
      WORD2(buf.presentationTimeStamp.epoch) = 2048;
      *(Float64 *)((char *)&buf.presentationTimeStamp.epoch + 6) = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "  Processing Frame - PTS: %lld/%d (%0.3fs) Duration: %lld/%d (%0.3fs)", (uint8_t *)&buf, 0x36u);
    }
    if ((self->_timeRange.start.timescale & 1) != 0
      || (v17 = *(_OWORD *)&a4->var0,
          *(_QWORD *)&self->_timeRange.start.flags = a4->var3,
          *(_OWORD *)(&self->_orientation + 1) = v17,
          (v10 = -[MADMovieBlastDoorAnalyzer configureAnalyzers](self, "configureAnalyzers")) == 0))
    {
      v18 = objc_alloc_init(VCPFrameAnalysisStats);
      v60 = 0;
      sceneClassifier = self->_sceneClassifier;
      if (!sceneClassifier
        || (v58 = *(_OWORD *)&a4->var0,
            v59 = a4->var3,
            v56 = *(_OWORD *)&a5->var0,
            v57 = a5->var3,
            (v10 = -[VCPVideoSceneClassifier analyzeFrame:withTimestamp:andDuration:flags:](sceneClassifier, "analyzeFrame:withTimestamp:andDuration:flags:", a3, &v58, &v56, &v60)) == 0))
      {
        if (!self->_safetyClassifier)
          goto LABEL_32;
        v54 = (CMTime)*a4;
        sampleBufferOut = 0;
        formatDescriptionOut = 0;
        if (CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.duration.value) = 0;
            v20 = MEMORY[0x1E0C81028];
            v21 = "[CVPixelBuffer->CMSampleBuffer] Failed to create format description";
            p_buf = (uint8_t *)&buf;
LABEL_27:
            _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_ERROR, v21, p_buf, 2u);
            goto LABEL_28;
          }
          goto LABEL_28;
        }
        *(_OWORD *)&buf.duration.value = *MEMORY[0x1E0CA2E18];
        v24 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        buf.presentationTimeStamp = v54;
        buf.duration.epoch = v24;
        *(_OWORD *)&buf.decodeTimeStamp.value = *(_OWORD *)&buf.duration.value;
        buf.decodeTimeStamp.epoch = v24;
        if (CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, formatDescriptionOut, &buf, &sampleBufferOut))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v63 = 0;
            v20 = MEMORY[0x1E0C81028];
            v21 = "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer";
            p_buf = v63;
            goto LABEL_27;
          }
LABEL_28:
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.duration.value) = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to convert CVPixelBuffer to CMSampleBuffer", (uint8_t *)&buf, 2u);
          }
          goto LABEL_31;
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        safetyClassifier = self->_safetyClassifier;
        v52 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        v50 = *(_OWORD *)&a5->var0;
        v51 = a5->var3;
        v10 = -[MADVideoSafetyClassifier analyzeFrameWithSampleBuffer:timestamp:duration:andFlags:](safetyClassifier, "analyzeFrameWithSampleBuffer:timestamp:duration:andFlags:", sampleBufferOut, &v52, &v50, &v60);
        if (!v10)
        {
LABEL_31:
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
LABEL_32:
          humanActionAnalyzer = self->_humanActionAnalyzer;
          if (!humanActionAnalyzer
            || (v48 = *(_OWORD *)&a4->var0,
                v49 = a4->var3,
                v46 = *(_OWORD *)&a5->var0,
                v47 = a5->var3,
                (v10 = -[VCPVideoHumanActionAnalyzer analyzeFrame:timestamp:duration:frameStats:flags:](humanActionAnalyzer, "analyzeFrame:timestamp:duration:frameStats:flags:", a3, &v48, &v46, v18, &v60)) == 0))
          {
            if (!self->_videoAnalysis)
              goto LABEL_39;
            if ((int)SocType() >= 247)
            {
              v26 = self->_sceneClassifier;
              if (v26)
              {
                videoAnalysis = self->_videoAnalysis;
                -[VCPVideoSceneClassifier frameScenes](v26, "frameScenes");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPFullVideoAnalyzer prepareVideoAnalysisByScenes:](videoAnalysis, "prepareVideoAnalysisByScenes:", v28);

              }
            }
            +[VCPSaliencyRegion salientRegionsFromPixelBuffer:](VCPSaliencyRegion, "salientRegionsFromPixelBuffer:", a3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[VCPSaliencyRegion attachSalientRegions:toPixelBuffer:](VCPSaliencyRegion, "attachSalientRegions:toPixelBuffer:", v29, a3);

            v30 = self->_videoAnalysis;
            v44 = *(_OWORD *)&a4->var0;
            v45 = a4->var3;
            v42 = *(_OWORD *)&a5->var0;
            v43 = a5->var3;
            v10 = -[VCPFullVideoAnalyzer analyzeFrame:timestamp:duration:frameStats:flags:cancel:](v30, "analyzeFrame:timestamp:duration:frameStats:flags:cancel:", a3, &v44, &v42, v18, &v60, self->_cancelBlock);
            if (!v10)
            {
LABEL_39:
              videoCNNAnalyzer = self->_videoCNNAnalyzer;
              if (!videoCNNAnalyzer)
                goto LABEL_42;
              v32 = self->_videoAnalysis;
              v33 = self->_humanActionAnalyzer;
              v40 = *(_OWORD *)&a4->var0;
              v41 = a4->var3;
              v10 = -[VCPVideoCNNAnalyzer loadAnalysisResultsFrom:actionAnalyzer:atTime:](videoCNNAnalyzer, "loadAnalysisResultsFrom:actionAnalyzer:atTime:", v32, v33, &v40);
              if (!v10)
              {
                v34 = self->_videoCNNAnalyzer;
                v38 = *(_OWORD *)&a4->var0;
                v39 = a4->var3;
                v36 = *(_OWORD *)&a5->var0;
                v37 = a5->var3;
                v10 = -[VCPVideoCNNAnalyzer analyzeFrame:withTimestamp:andDuration:flags:](v34, "analyzeFrame:withTimestamp:andDuration:flags:", a3, &v38, &v36, &v60);
                if (!v10)
LABEL_42:
                  v10 = 0;
              }
            }
          }
          goto LABEL_45;
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
      }
LABEL_45:

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.duration.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Frame timing invalid", (uint8_t *)&buf, 2u);
    }
    return -18;
  }
  return v10;
}

- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CA9040];
  v12[0] = &unk_1E6B725D8;
  v6 = *MEMORY[0x1E0CA90E0];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = *MEMORY[0x1E0CA8FF0];
  v12[2] = v8;
  v12[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  LODWORD(a3) = CVPixelBufferPoolCreate(0, 0, v9, a3);
  return (int)a3;
}

- (int)processVideo:(id)a3
{
  id v4;
  unint64_t height;
  unint64_t width;
  unint64_t v7;
  OSStatus v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  uint64_t *v12;
  const void *v13;
  uint64_t v15;
  uint64_t aBlock;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, int);
  void *v19;
  NSObject *v20;
  MADMovieBlastDoorAnalyzer *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint8_t *v24;
  const void *v25;
  VTPixelTransferSessionRef v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  const void **(*v35)(uint64_t);
  void *v36;
  const void *v37;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  const void *v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  __n128 (*v43)(__n128 *, __n128 *);
  uint64_t (*v44)();
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  width = self->_width;
  height = self->_height;
  if (width >= height)
    v7 = self->_height;
  else
    v7 = self->_width;
  if (v7 >= 0x169)
  {
    width = (360 * width / v7 + 1) & 0xFFFFFFFFFFFFFFFELL;
    height = (360 * height / v7 + 1) & 0xFFFFFFFFFFFFFFFELL;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = width;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = height;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Target Dimensions: %dx%d", buf, 0xEu);
  }
  v39 = 0;
  v8 = -[MADMovieBlastDoorAnalyzer createPixelBufferPool:](self, "createPixelBufferPool:", &v39);
  if (!v8)
  {
    pixelTransferSessionOut = 0;
    v8 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (!v8)
    {
      *(_QWORD *)buf = 0;
      v41 = buf;
      v42 = 0x4812000000;
      v43 = __Block_byref_object_copy__164;
      v44 = __Block_byref_object_dispose__165;
      v45 = &unk_1B706A4DA;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3812000000;
      v34 = __Block_byref_object_copy__166;
      v35 = __Block_byref_object_dispose__167;
      v36 = &unk_1B706A4DA;
      v37 = 0;
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v9 = dispatch_semaphore_create(0);
      aBlock = MEMORY[0x1E0C809B0];
      v17 = 3321888768;
      v18 = __42__MADMovieBlastDoorAnalyzer_processVideo___block_invoke;
      v19 = &unk_1E6B13348;
      v22 = &v27;
      v10 = v9;
      v20 = v10;
      v25 = v39;
      if (v39)
        CFRetain(v39);
      v26 = pixelTransferSessionOut;
      if (pixelTransferSessionOut)
        CFRetain(pixelTransferSessionOut);
      v21 = self;
      v23 = &v31;
      v24 = buf;
      v11 = _Block_copy(&aBlock);
      LOBYTE(v15) = 1;
      objc_msgSend(v4, "generateMovieFramesForAttachmentWithFileURL:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:", self->_movieURL, width, height, -1, 0, 0, v15, v11, aBlock, v17, v18, v19);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      v12 = v32;
      v13 = (const void *)v32[6];
      if (v13)
      {
        CFRelease(v13);
        v12[6] = 0;
      }
      v8 = *((_DWORD *)v28 + 6);

      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v26);
      CF<opaqueCMSampleBuffer *>::~CF(&v25);

      _Block_object_dispose(&v27, 8);
      _Block_object_dispose(&v31, 8);
      CF<opaqueCMSampleBuffer *>::~CF(&v37);
      _Block_object_dispose(buf, 8);
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelTransferSessionOut);
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v39);

  return v8;
}

void __42__MADMovieBlastDoorAnalyzer_processVideo___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CVBuffer *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  CMTime *v17;
  Float64 v18;
  uint64_t v19;
  void *v20;
  CMTime *v21;
  void *v22;
  CMTimeRange v23;
  CMTime v24;
  __int128 v25;
  uint64_t v26;
  CMTime v27;
  __int128 v28;
  CMTimeEpoch epoch;
  CMTime v30;
  CVPixelBufferRef pixelBufferOut;
  CMTime rhs;
  CMTime buf;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if ((a4 & 1) != 0)
LABEL_3:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v7)
  {
    v9 = v7;
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CVBuffer *)objc_msgSend(v10, "pixelBuffer");

    if (v11)
    {
      pixelBufferOut = 0;
      if (CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(a1 + 72), &pixelBufferOut)
        || VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 80), v11, pixelBufferOut))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to convert pixel buffer to 420v", (uint8_t *)&buf, 2u);
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -18;
        v12 = 1;
      }
      else
      {
        memset(&v30, 0, sizeof(v30));
        objc_msgSend(v9, "timestamp");
        CMTimeMakeWithSeconds(&v30, v18, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 84));
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
        if (v19)
        {
          v20 = *(void **)(a1 + 40);
          v21 = *(CMTime **)(*(_QWORD *)(a1 + 64) + 8);
          v28 = *(_OWORD *)&v21[2].value;
          epoch = v21[2].epoch;
          buf = v30;
          rhs = v21[2];
          CMTimeSubtract(&v27, &buf, &rhs);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v20, "processFrame:timestamp:duration:", v19, &v28, &v27);
        }
        v22 = pixelBufferOut;
        if (pixelBufferOut)
          v22 = (void *)CFRetain(pixelBufferOut);
        buf.value = (CMTimeValue)v22;
        CF<__CVBuffer *>::operator=((const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), (const void **)&buf);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        v12 = 0;
        *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = v30;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);

      if (((v12 | a4 ^ 1) & 1) == 0)
      {
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
          if (v13)
          {
            v14 = *(_QWORD *)(a1 + 40);
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v25 = *(_OWORD *)(v15 + 48);
            v26 = *(_QWORD *)(v15 + 64);
            v16 = *(_OWORD *)(v14 + 68);
            *(_OWORD *)&v23.start.value = *(_OWORD *)(v14 + 52);
            *(_OWORD *)&v23.start.epoch = v16;
            *(_OWORD *)&v23.duration.timescale = *(_OWORD *)(v14 + 84);
            CMTimeRangeGetEnd(&v30, &v23);
            v17 = *(CMTime **)(*(_QWORD *)(a1 + 64) + 8);
            buf = v30;
            rhs = v17[2];
            CMTimeSubtract(&v24, &buf, &rhs);
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)v14, "processFrame:timestamp:duration:", v13, &v25, &v24);
          }
        }
        goto LABEL_3;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CVPixelBuffer is missing from Blastdoor result", (uint8_t *)&buf, 2u);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -18;

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor (%@)", (uint8_t *)&buf, 0xCu);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -18;
    if (a4)
      goto LABEL_3;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor but decoding not finished yet", (uint8_t *)&buf, 2u);
    }
  }

}

- (int)finalizeAnalyzers:(id)a3 timeRange:(id *)a4
{
  id v6;
  VCPVideoSceneClassifier *sceneClassifier;
  __int128 v8;
  int v9;
  void *v10;
  MADVideoSafetyClassifier *safetyClassifier;
  __int128 v12;
  void *v13;
  VCPVideoHumanActionAnalyzer *humanActionAnalyzer;
  __int128 v15;
  void *v16;
  VCPFullVideoAnalyzer *videoAnalysis;
  __int128 v18;
  void *v19;
  VCPVideoCNNAnalyzer *videoCNNAnalyzer;
  __int128 v21;
  void *v22;
  _OWORD v24[3];
  _OWORD v25[3];
  _OWORD v26[3];
  _OWORD v27[3];
  _OWORD v28[3];

  v6 = a3;
  sceneClassifier = self->_sceneClassifier;
  if (sceneClassifier)
  {
    v8 = *(_OWORD *)&a4->var0.var3;
    v28[0] = *(_OWORD *)&a4->var0.var0;
    v28[1] = v8;
    v28[2] = *(_OWORD *)&a4->var1.var1;
    v9 = -[VCPVideoSceneClassifier finishAnalysisPass:](sceneClassifier, "finishAnalysisPass:", v28);
    if (v9)
      goto LABEL_17;
    -[VCPVideoSceneClassifier results](self->_sceneClassifier, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v10);

  }
  safetyClassifier = self->_safetyClassifier;
  if (safetyClassifier)
  {
    v12 = *(_OWORD *)&a4->var0.var3;
    v27[0] = *(_OWORD *)&a4->var0.var0;
    v27[1] = v12;
    v27[2] = *(_OWORD *)&a4->var1.var1;
    v9 = -[MADVideoSafetyClassifier finishAnalysisPass:](safetyClassifier, "finishAnalysisPass:", v27);
    if (v9)
      goto LABEL_17;
    -[MADVideoSafetyClassifier results](self->_safetyClassifier, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v13);

  }
  humanActionAnalyzer = self->_humanActionAnalyzer;
  if (humanActionAnalyzer)
  {
    v15 = *(_OWORD *)&a4->var0.var3;
    v26[0] = *(_OWORD *)&a4->var0.var0;
    v26[1] = v15;
    v26[2] = *(_OWORD *)&a4->var1.var1;
    v9 = -[VCPVideoHumanActionAnalyzer finishAnalysisPass:](humanActionAnalyzer, "finishAnalysisPass:", v26);
    if (v9)
      goto LABEL_17;
    -[VCPVideoHumanActionAnalyzer results](self->_humanActionAnalyzer, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v16);

  }
  videoAnalysis = self->_videoAnalysis;
  if (videoAnalysis)
  {
    v18 = *(_OWORD *)&a4->var0.var3;
    v25[0] = *(_OWORD *)&a4->var0.var0;
    v25[1] = v18;
    v25[2] = *(_OWORD *)&a4->var1.var1;
    v9 = -[VCPFullVideoAnalyzer finishAnalysisPass:](videoAnalysis, "finishAnalysisPass:", v25);
    if (v9)
      goto LABEL_17;
    -[VCPFullVideoAnalyzer results](self->_videoAnalysis, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v19);

  }
  videoCNNAnalyzer = self->_videoCNNAnalyzer;
  if (!videoCNNAnalyzer)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v21 = *(_OWORD *)&a4->var0.var3;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v21;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  v9 = -[VCPVideoCNNAnalyzer finishAnalysisPass:](videoCNNAnalyzer, "finishAnalysisPass:", v24);
  if (!v9)
  {
    -[VCPVideoCNNAnalyzer results](self->_videoCNNAnalyzer, "results");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v22);

    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (id)analyzeAsset:(id *)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _OWORD v25[3];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v6 = (void *)getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass;
  v30 = getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass;
  if (!getIMMediaAnalysisBlastDoorInterfaceClass(void)::softClass)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = ___ZL41getIMMediaAnalysisBlastDoorInterfaceClassv_block_invoke;
    v26[3] = &unk_1E6B15540;
    v26[4] = &v27;
    ___ZL41getIMMediaAnalysisBlastDoorInterfaceClassv_block_invoke((uint64_t)v26);
    v6 = (void *)v28[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v27, 8);
  v8 = objc_alloc_init(v7);
  if (!-[MADMovieBlastDoorAnalyzer queryVideoProperties:](self, "queryVideoProperties:", v8))
  {
    v13 = -[MADMovieBlastDoorAnalyzer processVideo:](self, "processVideo:", v8);
    v14 = v13;
    if (v13)
    {
      if (!a3)
        goto LABEL_8;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2F90];
      if (v13 == -128)
      {
        v35 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video processing canceled"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v36 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -128, v17);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v18;

      }
      else
      {
        v33 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video processing failed"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v34 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v14, v23);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v24;

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v19 = *(_OWORD *)&self->_timeRange.start.flags;
      v25[0] = *(_OWORD *)(&self->_orientation + 1);
      v25[1] = v19;
      v25[2] = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
      if (!-[MADMovieBlastDoorAnalyzer finalizeAnalyzers:timeRange:](self, "finalizeAnalyzers:timeRange:", v10, v25))
      {
        v10 = v10;
        a3 = (id *)v10;
        goto LABEL_7;
      }
      if (!a3)
      {
LABEL_7:

        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to finalize video processing"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_6:
    a3 = 0;
    goto LABEL_7;
  }
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query movie properties"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
LABEL_8:

  objc_autoreleasePoolPop(v5);
  return a3;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self[1].var0.var3 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)((char *)&self[1].var0.var0 + 4);
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateResults, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
  objc_storeStrong((id *)&self->_videoCNNAnalyzer, 0);
  objc_storeStrong((id *)&self->_humanActionAnalyzer, 0);
  objc_storeStrong((id *)&self->_safetyClassifier, 0);
  objc_storeStrong((id *)&self->_sceneClassifier, 0);
  objc_storeStrong((id *)&self->_videoAnalysis, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
}

@end
