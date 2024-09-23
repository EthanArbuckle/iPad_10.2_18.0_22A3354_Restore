@implementation VCPVideoCaptionAnalyzer

+ (int64_t)mode
{
  if (+[VCPVideoCaptionAnalyzer mode]::once != -1)
    dispatch_once(&+[VCPVideoCaptionAnalyzer mode]::once, &__block_literal_global_20);
  return 0;
}

void __31__VCPVideoCaptionAnalyzer_mode__block_invoke()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v0 = 134217984;
    v1 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VideoCaption] VideoCaptionMode set to %ld", (uint8_t *)&v0, 0xCu);
  }
}

- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameRate:(float)a4 timeRange:(id *)a5
{
  __int128 v9;
  __int128 v10;
  VCPVideoCaptionAnalyzer *v11;
  NSObject *v12;
  const char *v13;
  CMTimeRange v15;
  CMTime v16;
  CMTimeRange range;
  CMTime time;
  uint8_t buf[16];

  if (a4 <= 0.0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "VideoCaptionAnalyzer: frameRate should be larger than 0";
    goto LABEL_10;
  }
  v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&time, &range);
  if (CMTimeGetSeconds(&time) <= 0.0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "VideoCaptionAnalyzer: timeRange should be larger than 0";
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v10 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v15.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v15.start.epoch = v10;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&a5->var1.var1;
  CMTimeRangeGetEnd(&v16, &v15);
  self = -[VCPVideoCaptionAnalyzer initWithModelType:frameNumber:](self, "initWithModelType:frameNumber:", a3, vcvtmd_u64_f64(CMTimeGetSeconds(&v16) * a4) + 1);
  v11 = self;
LABEL_12:

  return v11;
}

- (VCPVideoCaptionAnalyzer)initWithModelType:(int64_t)a3 frameNumber:(unint64_t)a4
{
  char *v6;
  char *v7;
  unsigned int *v8;
  void *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  VCPVideoCaptionAnalyzer *v26;
  id v28;
  void *v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 *v41;
  __int128 v42;
  objc_super v43;
  CMTime time2;
  CMTime time1;

  v43.receiver = self;
  v43.super_class = (Class)VCPVideoCaptionAnalyzer;
  v6 = -[VCPVideoCaptionAnalyzer init](&v43, sel_init);
  v7 = v6;
  v8 = (unsigned int *)v6;
  v9 = v6;
  if (v6)
  {
    v10 = (__int128 *)MEMORY[0x1E0CA2E28];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v6 + 84) = *MEMORY[0x1E0CA2E28];
    *(_QWORD *)(v6 + 100) = v11;
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v6 + 108) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v6 + 124) = v12;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = (void *)*((_QWORD *)v8 + 24);
    *((_QWORD *)v8 + 24) = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)*((_QWORD *)v8 + 22);
    *((_QWORD *)v8 + 22) = v15;

    v17 = (void *)*((_QWORD *)v8 + 21);
    *((_QWORD *)v8 + 21) = &stru_1E6B1C190;

    *((_QWORD *)v8 + 6) = 0;
    v18 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = 0;

    v8[39] = 0;
    v19 = v7 + 132;
    v20 = *v10;
    *(_QWORD *)(v7 + 148) = *((_QWORD *)v10 + 2);
    *(_OWORD *)(v7 + 132) = v20;
    v21 = *v10;
    *((_QWORD *)v7 + 27) = *((_QWORD *)v10 + 2);
    *(_OWORD *)(v7 + 200) = v21;
    *((_BYTE *)v8 + 164) = 0;
    v22 = (void *)*((_QWORD *)v8 + 29);
    *((_QWORD *)v8 + 29) = 0;

    v23 = (void *)*((_QWORD *)v8 + 30);
    *((_QWORD *)v8 + 30) = 0;

    v24 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = 0;

    *((_QWORD *)v8 + 4) = a3;
    v25 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = 0;

    if (objc_msgSend(v8, "configVideoCaptionModels")
      || objc_msgSend(v8, "configInputBasedOnDevice"))
    {
      v9 = 0;
    }
    else
    {
      v28 = -[VCPTransforms initImageTransform:transformedImageWidth:transformedImageHeight:]([VCPTransforms alloc], "initImageTransform:transformedImageWidth:transformedImageHeight:", 128, v8[16], v8[17]);
      v29 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = v28;

      v30 = (int)v8[20];
      if (v30 >= a4)
      {
        if (a4)
        {
          v37 = 0;
          do
          {
            v38 = (void *)*((_QWORD *)v8 + 24);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v39);

            ++v37;
          }
          while (a4 != v37);
        }
      }
      else
      {
        v31 = v8[18];
        if (v31 >= 1)
        {
          v32 = 0;
          v33 = 0;
          v34 = ((int)a4 - (int)v30) / v31;
          do
          {
            v35 = (void *)*((_QWORD *)v8 + 24);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32 + v8[20]);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v36);

            ++v33;
            v32 += v34;
          }
          while (v33 < (int)v8[18]);
        }
      }
      v40 = *(_OWORD *)v19;
      time1.epoch = *((_QWORD *)v19 + 2);
      *(_OWORD *)&time1.value = v40;
      v41 = (__int128 *)MEMORY[0x1E0CA2E68];
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v42 = *v41;
        *((_QWORD *)v19 + 2) = *((_QWORD *)v41 + 2);
        *(_OWORD *)v19 = v42;
      }
      v8[40] = 0;
      v9 = v8;
    }
  }
  v26 = v9;

  return v26;
}

- (int)configVideoCaptionModels
{
  int64_t modelType;
  VCPVideoTransformerBackbone *v4;
  VCPVideoTransformerBackbone *videoTransformerBackbone;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  void *epoch;
  void *v14;
  void *v15;
  VCPVideoCaptionEncoder *v16;
  VCPVideoCaptionEncoder **p_backbone;
  VCPVideoCaptionEncoder *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  CSUVideoCaptioner *v23;
  CSUVideoCaptioner *captioner;
  uint8_t v26[8];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  modelType = self->_modelType;
  if (modelType == 1)
  {
    +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retrieveAssetOnce:petWatchDog:cancelBlock:", 3, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] retrieve VCPMobileAsset_VideoCaptionDecoder_AX OTA model fail", v26, 2u);
      }
      LODWORD(p_backbone) = -18;
      return (int)p_backbone;
    }
    v10 = *MEMORY[0x1E0D09A98];
    v29[0] = *MEMORY[0x1E0D09AA0];
    v29[1] = v10;
    v30[0] = v9;
    v30[1] = CFSTR("CPU");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sharedCVNLPCaptionDecoderWithOptions:identifier:", v11, CFSTR("CVNLPVideoCaptionDecoder_AX"));
    v12 = objc_claimAutoreleasedReturnValue();
    epoch = (void *)self->_timeEnd.epoch;
    self->_timeEnd.epoch = v12;

    if (!self->_timeEnd.epoch)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] init CVNLPVideoCaptioningModel fail", v26, 2u);
      }
      LODWORD(p_backbone) = -18;
      v19 = 1;
LABEL_43:

      if (!v19)
        goto LABEL_44;
      return (int)p_backbone;
    }
    +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "retrieveAssetOnce:petWatchDog:cancelBlock:", 2, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = -[VCPVideoCaptionEncoder initWithModelPath:]([VCPVideoCaptionEncoder alloc], "initWithModelPath:", v15);
      p_backbone = &self->_backbone;
      v18 = *p_backbone;
      *p_backbone = v16;

      if (*p_backbone)
      {
        v19 = 0;
LABEL_42:

        goto LABEL_43;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] init VCPVideoCaptionEncoder fail", v26, 2u);
      }
      LODWORD(p_backbone) = -108;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] retrieve VCPMobileAsset_VideoCaptionEncoder_AX OTA model fail", v26, 2u);
      }
      LODWORD(p_backbone) = -18;
    }
    v19 = 1;
    goto LABEL_42;
  }
  if (modelType != 2)
  {
LABEL_44:
    LODWORD(p_backbone) = 0;
    return (int)p_backbone;
  }
  v4 = -[VCPVideoTransformerBackbone initWithConfig:]([VCPVideoTransformerBackbone alloc], "initWithConfig:", *(_QWORD *)&self->_enoughFrames);
  videoTransformerBackbone = self->_videoTransformerBackbone;
  self->_videoTransformerBackbone = v4;

  if (self->_videoTransformerBackbone)
  {
    if (_os_feature_enabled_impl())
    {
      v28 = 0;
      v6 = (id *)&v28;
      objc_msgSend(MEMORY[0x1E0D18930], "CSUVideoCaptionerConfigurationForRevision:error:", 5, &v28);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
      v6 = (id *)&v27;
      objc_msgSend(MEMORY[0x1E0D18930], "CSUVideoCaptionerConfigurationForRevision:error:", 4, &v27);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v7;
    v21 = *v6;
    if (objc_msgSend((id)objc_opt_class(), "greedySearchEnabled"))
    {
      objc_msgSend(v20, "beamSearch");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBeamWidth:", &unk_1E6B72A58);
    }
    else
    {
      objc_msgSend(v20, "beamSearch");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBeamWidth:", &unk_1E6B72A70);
    }

    if (v20 && !v21)
    {
      objc_msgSend((id)objc_opt_class(), "sharedCaptionerWithConfig:identifier:", v20, CFSTR("CSUVideoCaptioner_MiCa"));
      v23 = (CSUVideoCaptioner *)objc_claimAutoreleasedReturnValue();
      captioner = self->_captioner;
      self->_captioner = v23;

    }
    if (self->_captioner)
    {

      goto LABEL_44;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] init CSUVideoCaptioner fail", v26, 2u);
    }

  }
  LODWORD(p_backbone) = -108;
  return (int)p_backbone;
}

- (int)configInputBasedOnDevice
{
  void *v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  int64_t modelType;
  VCPVideoTransformerBackbone *videoTransformerBackbone;
  VCPEspressoV2Data *v10;
  VCPEspressoV2Data *inputDataMUB;
  float *inputData;
  int v13;
  size_t v14;
  float *v15;
  float *v16;
  int64_t v18;
  int v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)&self->_enoughFrames;
  *(_QWORD *)&self->_enoughFrames = &stru_1E6B1C190;

  if (DeviceGeqD5x() && self->_modelType == 2)
  {
    self->_inputNumFrames = 16;
    self->_inputWidth = 352;
    self->_inputHeight = 352;
    v4 = 80;
    v5 = &OBJC_IVAR___VCPVideoCaptionAnalyzer__mubbSampleScale;
    v6 = 1;
    v7 = 1;
  }
  else
  {
    if (DeviceGeqD5x())
    {
      self->_inputNumFrames = 16;
      v6 = 224;
      self->_inputWidth = 224;
      v4 = 68;
      v7 = 1;
    }
    else
    {
      self->_inputNumFrames = 10;
      v6 = 196;
      self->_inputWidth = 196;
      v4 = 68;
      v7 = 15;
    }
    v5 = &OBJC_IVAR___VCPVideoCaptionAnalyzer__skipNumFramesBothEnds;
  }
  *(_DWORD *)((char *)&self->super.super.isa + v4) = v6;
  *(_DWORD *)((char *)&self->super.super.isa + *v5) = v7;
  modelType = self->_modelType;
  if (modelType == 1)
  {
    inputData = self->_inputData;
    if (inputData)
      MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    v13 = self->_inputHeight * self->_inputNumFrames * self->_inputWidth;
    if (v13 < 0)
      v14 = -1;
    else
      v14 = 12 * v13;
    v15 = (float *)operator new[](v14, MEMORY[0x1E0DE4E10]);
    if (!v15)
    {
      self->_inputData = 0;
      return -108;
    }
    v16 = v15;
    bzero(v15, v14);
    self->_inputData = v16;
    return 0;
  }
  if (modelType == 2)
  {
    videoTransformerBackbone = self->_videoTransformerBackbone;
    if (videoTransformerBackbone)
    {
      if (-[VCPVideoTransformerBackbone inputTensorSize](videoTransformerBackbone, "inputTensorSize") == 3 * self->_inputNumFrames * self->_inputHeight * self->_inputWidth / self->_mubbSampleScale)
      {
        v10 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", -[VCPVideoTransformerBackbone inputTensorType](self->_videoTransformerBackbone, "inputTensorType"), -[VCPVideoTransformerBackbone inputTensorSize](self->_videoTransformerBackbone, "inputTensorSize"));
        inputDataMUB = self->_inputDataMUB;
        self->_inputDataMUB = v10;

      }
    }
    if (!self->_inputDataMUB)
      return -108;
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = self->_modelType;
    v19 = 134217984;
    v20 = v18;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Unsupported MADVideoCaptionModelType: %lu", (uint8_t *)&v19, 0xCu);
  }
  return -18;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoCaptionAnalyzer;
  -[VCPVideoCaptionAnalyzer dealloc](&v4, sel_dealloc);
}

+ (id)sharedCaptionerWithConfig:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__VCPVideoCaptionAnalyzer_sharedCaptionerWithConfig_identifier___block_invoke;
    v11[3] = &unk_1E6B16D80;
    v12 = v7;
    v13 = v5;
    objc_msgSend(v8, "sharedInstanceWithIdentifier:andCreationBlock:", v12, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Initiating captioner with nil config or identifier", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

id __64__VCPVideoCaptionAnalyzer_sharedCaptionerWithConfig_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v12 = v2;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VideoCaption] Initiating captioner:%@ with config:%@", buf, 0x16u);
  }
  v4 = objc_alloc(MEMORY[0x1E0D18928]);
  v5 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithConfiguration:error:", v5, &v10);
  v7 = v10;
  if ((v7 || !v6) && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] CSUVideoCaptioner init fail: %@", buf, 0xCu);

  }
  return v6;
}

+ (id)sharedCVNLPCaptionDecoderWithOptions:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__VCPVideoCaptionAnalyzer_sharedCVNLPCaptionDecoderWithOptions_identifier___block_invoke;
    v11[3] = &unk_1E6B16DA8;
    v12 = v5;
    objc_msgSend(v8, "sharedInstanceWithIdentifier:andCreationBlock:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Initiating CVNLPVideoCaptioningModel with nil options or identifier", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

id __75__VCPVideoCaptionAnalyzer_sharedCVNLPCaptionDecoderWithOptions_identifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VideoCaption] Initiating CVNLPVideoCaptioningModel", buf, 2u);
  }
  v2 = objc_alloc(MEMORY[0x1E0D09B10]);
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithOptions:error:", v3, &v8);
  v5 = v8;
  if ((v5 || !v4) && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] CVNLPVideoCaptioningModel init fail: %@", buf, 0xCu);

  }
  return v4;
}

- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4
{
  int frameIndex;
  int inputNumFrames;
  int Width;
  int Height;
  int v10;
  CVReturn v11;
  int v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v24;
  int v25;
  float *inputData;
  int inputWidth;
  int inputHeight;
  int v29;
  int v30;
  float *v31;
  float *v32;
  float *v33;
  uint64_t v34;
  uint64_t i;
  unsigned int v36;
  unsigned int v37;
  CVReturn v38;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (a4 != 3)
    return -50;
  frameIndex = self->_frameIndex;
  inputNumFrames = self->_inputNumFrames;
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v13)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    return -50;
  }
  v10 = Height;
  v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v38 = v11;
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (v10 >= 1)
    {
      v25 = 0;
      inputData = self->_inputData;
      inputWidth = self->_inputWidth;
      inputHeight = self->_inputHeight;
      v29 = 3 * frameIndex % inputNumFrames * inputHeight * inputWidth;
      v30 = inputWidth * inputHeight;
      v31 = &inputData[2 * v30 + v29];
      v32 = &inputData[v29 + v30];
      v33 = &inputData[v29];
      v34 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v24) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&v36 = (float)((float)((float)LODWORD(v24) / 255.0) + -0.5)
                           + (float)((float)((float)LODWORD(v24) / 255.0) + -0.5);
            v33[i] = *(float *)&v36;
            LOBYTE(v36) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&v37 = (float)((float)((float)v36 / 255.0) + -0.5) + (float)((float)((float)v36 / 255.0) + -0.5);
            v32[i] = *(float *)&v37;
            LOBYTE(v37) = BaseAddress[(int)(i * 4)];
            v24 = (float)((float)((float)v37 / 255.0) + -0.5) + (float)((float)((float)v37 / 255.0) + -0.5);
            v31[i] = v24;
          }
        }
        BaseAddress += BytesPerRow;
        ++v25;
        v31 = (float *)((char *)v31 + v34);
        v32 = (float *)((char *)v32 + v34);
        v33 = (float *)((char *)v33 + v34);
      }
      while (v25 != v10);
    }
    v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v38);
    if (pixelBuffer
      && !v38
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.2();
    }
  }
  return v12;
}

- (int)copyMUBBImage:(__CVBuffer *)a3 withChannels:(int)a4
{
  unsigned int v4;
  CVReturn v7;
  int v8;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v20;
  int v21;
  int mubbSampleScale;
  int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  int Width;
  int Height;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (a4 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v7 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v37 = v7;
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v21 = self->_frameIndex % self->_inputNumFrames;
      mubbSampleScale = self->_mubbSampleScale;
      if (v21 % mubbSampleScale)
      {
        v8 = 0;
      }
      else
      {
        if (Height >= 1)
        {
          v33 = 0;
          v23 = 3 * Height * Width * (v21 / mubbSampleScale);
          v36 = v23;
          v34 = v23 + 2 * Height * Width;
          v35 = v23 + Height * Width;
          v30 = BytesPerRow;
          do
          {
            if (Width >= 1)
            {
              v24 = 0;
              v25 = 1;
              do
              {
                LOBYTE(v20) = BaseAddress[v25 + 1];
                v26 = BaseAddress[v25];
                LOBYTE(v4) = BaseAddress[v25 - 1];
                v27 = 11 * (v33 >> 5) + (v24 >> 5) + 121 * (v24 & 0x1F | (32 * (v33 & 0x1F)));
                *(float *)&v20 = (float)((float)((float)LODWORD(v20) / 255.0) + -0.48145) / 0.26863;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataMUB, "setValueFP:atIndex:", v27 + v36, v20, v30);
                *(float *)&v28 = (float)((float)((float)v26 / 255.0) + -0.45783) / 0.2613;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataMUB, "setValueFP:atIndex:", v27 + v35, v28);
                *(float *)&v29 = (float)((float)((float)v4 / 255.0) + -0.40821) / 0.27578;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataMUB, "setValueFP:atIndex:", v27 + v34, v29);
                ++v24;
                v25 += 4;
              }
              while (Width != v24);
            }
            BaseAddress += v30;
            ++v33;
          }
          while (v33 != Height);
        }
        v8 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v37);
      }
    }
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v8 = -50;
    v37 = -50;
  }
  if (pixelBuffer
    && !v37
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.2();
  }
  return v8;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int Width;
  int Height;
  double v11;
  double v12;
  double v13;
  double v14;
  NSMutableArray *videoSegmentCaptionResult;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  float v21;
  float v22;
  __CVBuffer *v23;
  __CVBuffer *v24;
  int64_t modelType;
  int v26;
  int v27;
  int64_t var3;
  int64_t v29;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  videoSegmentCaptionResult = self->_videoSegmentCaptionResult;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  ++HIDWORD(self->_timeStart.epoch);
  objc_msgSend(v16, "numberWithInt:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(videoSegmentCaptionResult) = -[NSMutableArray containsObject:](videoSegmentCaptionResult, "containsObject:", v17);

  if ((videoSegmentCaptionResult & 1) != 0 && !LOBYTE(self->_validFrames))
  {
    if ((self->_timeLastDetection.timescale & 1) == 0)
    {
      v20 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&self->_timeLastDetection.flags = a4->var3;
      *(_OWORD *)((char *)&self->_timeLastProcess.epoch + 4) = v20;
    }
    if (self->_modelType != 2 && DeviceGeqD5x())
    {
      v13 = 0.875;
      v11 = 0.0625;
      v12 = 0.0625;
      v14 = 0.875;
    }
    v21 = (float)Width;
    v22 = (float)Height;
    if ((float)((float)Height * 1.2) >= (float)Width)
    {
      if ((float)(v21 * 1.2) < v22)
      {
        v12 = (float)((float)(Height - Width) / (float)(v22 + v22));
        v14 = (float)(v21 / v22);
        v13 = 1.0;
        v11 = 0.0;
      }
    }
    else
    {
      v11 = (float)((float)(Width - Height) / (float)(v21 + v21));
      v13 = (float)(v22 / v21);
      v14 = 1.0;
      v12 = 0.0;
    }
    v23 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v11, v12, v13, v14);
    if (!v23)
      return -18;
    v24 = v23;
    modelType = self->_modelType;
    if (modelType == 2)
    {
      v26 = -[VCPVideoCaptionAnalyzer copyMUBBImage:withChannels:](self, "copyMUBBImage:withChannels:", v23, 3);
    }
    else
    {
      if (modelType != 1)
        goto LABEL_21;
      v26 = -[VCPVideoCaptionAnalyzer copyImage:withChannels:](self, "copyImage:withChannels:", v23, 3);
    }
    v18 = v26;
    if (v26)
    {
LABEL_24:
      CFRelease(v24);
      return v18;
    }
LABEL_21:
    v27 = self->_frameIndex + 1;
    self->_frameIndex = v27;
    if (v27 >= self->_inputNumFrames)
    {
      LOBYTE(self->_validFrames) = 1;
      var3 = a4->var3;
      *(_OWORD *)&self->_activeFrameIndices = *(_OWORD *)&a4->var0;
      *(_QWORD *)&self->_timeEnd.timescale = var3;
    }
    v18 = 0;
    v29 = a4->var3;
    *(_OWORD *)(&self->_skipNumFramesBothEnds + 1) = *(_OWORD *)&a4->var0;
    *(_QWORD *)&self->_timeLastProcess.flags = v29;
    goto LABEL_24;
  }
  return 0;
}

- (int)inference:(id *)a3 duration:(id *)a4
{
  int64_t modelType;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  void *epoch;
  NSObject *v36;
  NSObject *v37;
  NSString *resConfig;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  double v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  CSUVideoCaptioner *captioner;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  float v62;
  float v63;
  double v64;
  NSString *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint32_t v71;
  id v73;
  id v74;
  id v75;
  id v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  const __CFString *v83;
  void *v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  double v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  modelType = self->_modelType;
  if (modelType == 1)
  {
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPVideoCaptionAnalyzer_backBoneInference", ", buf, 2u);
    }

    v10 = -[VCPVideoCaptionEncoder inference:](self->_backbone, "inference:", self->_inputData);
    if (!v10)
    {
      VCPSignPostLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v20 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v20, "VCPVideoCaptionAnalyzer_backBoneInference", ", buf, 2u);
      }

      v27 = -[VCPVideoCaptionEncoder embeddingHeight](self->_backbone, "embeddingHeight");
      v28 = -[VCPVideoCaptionEncoder embeddingWidth](self->_backbone, "embeddingWidth");
      v29 = -[VCPVideoCaptionEncoder embeddingChannels](self->_backbone, "embeddingChannels");
      v30 = -[VCPVideoCaptionEncoder embeddingSequenceLength](self->_backbone, "embeddingSequenceLength");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", -[VCPVideoCaptionEncoder videoEmbedding](self->_backbone, "videoEmbedding"), 4 * v28 * v27 * v29 * v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      VCPSignPostLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_signpost_id_generate(v31);

      VCPSignPostLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VCPVideoCaptionAnalyzer_languageDecoderInference", ", buf, 2u);
      }

      epoch = (void *)self->_timeEnd.epoch;
      v73 = 0;
      objc_msgSend(epoch, "generateCaption:error:", v13, &v73);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v73;
      VCPSignPostLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v32, "VCPVideoCaptionAnalyzer_languageDecoderInference", ", buf, 2u);
      }

      if (v24)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v24;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Error to generate video caption with CVNLPVideoCaptioningModel (%@)", buf, 0xCu);
        }
      }
      else
      {
        if (v23)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v23;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VideoCaption] Computed AX video caption: (%@)", buf, 0xCu);
          }
          resConfig = self->_resConfig;
          v78 = v23;
          v79 = CFSTR("attributes");
          v77 = CFSTR("videoCaptionText");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString addObject:](resConfig, "addObject:", v40);

          goto LABEL_68;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] No AX caption text generated", buf, 2u);
        }
        v23 = 0;
        v24 = 0;
      }
LABEL_82:
      v10 = -18;
      goto LABEL_83;
    }
  }
  else
  {
    if (modelType != 2)
    {
      v23 = 0;
      v24 = 0;
      v13 = 0;
LABEL_20:
      v10 = 0;
      goto LABEL_83;
    }
    VCPSignPostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    VCPSignPostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPVideoCaptionAnalyzer_backBoneInference_MiCa", ", buf, 2u);
    }

    v10 = -[VCPVideoTransformerBackbone inference:](self->_videoTransformerBackbone, "inference:", self->_inputDataMUB);
    if (!v10)
    {
      VCPSignPostLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v7 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_END, v7, "VCPVideoCaptionAnalyzer_backBoneInference_MiCa", ", buf, 2u);
      }

      -[VCPVideoTransformerBackbone spatialEmbedding](self->_videoTransformerBackbone, "spatialEmbedding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Video embedding for caption generation is nil", buf, 2u);
        }
        v23 = 0;
        v24 = 0;
        v13 = 0;
        goto LABEL_82;
      }
      if (objc_msgSend((id)objc_opt_class(), "writeSpatialEmbeddingToFile"))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "fileExistsAtPath:", v16);

        if ((v17 & 1) != 0)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend(v15, "path");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          v42 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v41, 1, 0, &v76);
          v18 = v76;

          if ((v42 & 1) == 0)
          {
            objc_msgSend(v18, "localizedDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("[VideoCaption] Failed to create directory %@ with error: %@"), v15, v43);

          }
        }
        objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("videoSpatialEmbedding.dat"), 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = v18;
        v45 = objc_msgSend(v13, "writeToURL:options:error:", v44, 1, &v75);
        v46 = v75;

        if (v45)
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v44;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VideoCaption] Video spatial embedding successfully saved to %@", buf, 0xCu);
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v46, "localizedDescription");
          v47 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v86 = v44;
          v87 = 2112;
          v88 = v47;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Failed to save video spatial embedding to %@ with error: %@", buf, 0x16u);

        }
      }
      VCPSignPostLog();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = os_signpost_id_generate(v48);

      VCPSignPostLog();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "VCPVideoCaptionAnalyzer_languageDecoderInference_MiCa", ", buf, 2u);
      }

      captioner = self->_captioner;
      v74 = 0;
      -[CSUVideoCaptioner computeCaptionForVideoEmbedding:error:](captioner, "computeCaptionForVideoEmbedding:error:", v13, &v74);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v74;
      VCPSignPostLog();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v55, OS_SIGNPOST_INTERVAL_END, v49, "VCPVideoCaptionAnalyzer_languageDecoderInference_MiCa", ", buf, 2u);
      }

      if (v24 || !v53)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_76;
        *(_DWORD *)buf = 138412290;
        v86 = v24;
        v69 = MEMORY[0x1E0C81028];
        v70 = "[VideoCaption] Error to compute caption with CSUVideoCaptioner: (%@)";
        v71 = 12;
      }
      else
      {
        objc_msgSend(v53, "results");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count") == 0;

        if (!v57)
        {
          objc_msgSend(v53, "results");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "caption");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "results");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "score");
          v63 = v62;

          if (v23)
          {
            if (v63 != 0.0)
            {
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v86 = v23;
                v87 = 2048;
                v88 = v63;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VideoCaption] Computed CSU video caption: (%@), with score: %f", buf, 0x16u);
              }
              v65 = self->_resConfig;
              v83 = CFSTR("attributes");
              v81[0] = CFSTR("videoCaptionText");
              v81[1] = CFSTR("videoCaptionConfidence");
              v82[0] = v23;
              *(float *)&v64 = v63;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v82[1] = v66;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v67;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSString addObject:](v65, "addObject:", v68);

LABEL_68:
              v24 = 0;
              goto LABEL_20;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] No caption confident score generated", buf, 2u);
            }
            goto LABEL_77;
          }
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_76:
          v23 = 0;
LABEL_77:

          goto LABEL_82;
        }
        *(_WORD *)buf = 0;
        v69 = MEMORY[0x1E0C81028];
        v70 = "[VideoCaption] No caption text generated";
        v71 = 2;
      }
      _os_log_impl(&dword_1B6C4A000, v69, OS_LOG_TYPE_ERROR, v70, buf, v71);
      goto LABEL_76;
    }
  }
  v23 = 0;
  v24 = 0;
  v13 = 0;
LABEL_83:

  return v10;
}

- (int)generateCaptionWithEmbedding:(id)a3 startTime:(id *)a4 duration:(id *)a5
{
  id v8;
  NSMutableArray *v9;
  NSMutableArray *videoCaptionResult;
  CSUVideoCaptioner *captioner;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  int v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSMutableArray *v26;
  CFDictionaryRef v27;
  CFDictionaryRef v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    if (!self->_videoCaptionResult)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      videoCaptionResult = self->_videoCaptionResult;
      self->_videoCaptionResult = v9;

    }
    captioner = self->_captioner;
    if (!captioner)
    {
      self->_modelType = 2;
      v16 = -[VCPVideoCaptionAnalyzer configVideoCaptionModels](self, "configVideoCaptionModels");
      if (v16)
        goto LABEL_22;
      captioner = self->_captioner;
    }
    v34 = 0;
    -[CSUVideoCaptioner computeCaptionForVideoEmbedding:error:](captioner, "computeCaptionForVideoEmbedding:error:", v8, &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v34;
    v14 = v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 0;
    if (v15)
    {
      objc_msgSend(v12, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count") == 0;

      if (!v18)
      {
        objc_msgSend(v12, "results");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "caption");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "results");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "score");
        v25 = v24;

        v26 = self->_videoCaptionResult;
        v37[0] = CFSTR("start");
        buf = *a4;
        v27 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v38[0] = v27;
        v37[1] = CFSTR("duration");
        buf = *a5;
        v28 = CMTimeCopyAsDictionary((CMTime *)&buf, 0);
        v38[1] = v28;
        v37[2] = CFSTR("attributes");
        v35[0] = CFSTR("videoCaptionText");
        v35[1] = CFSTR("videoCaptionConfidence");
        v36[0] = v21;
        LODWORD(v29) = v25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v26, "addObject:", v32);

      }
      v16 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.var0) = 138412290;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Error to compute caption with CSUVideoCaptioner: (%@)", (uint8_t *)&buf, 0xCu);
      }
      v16 = -18;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.var0) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoCaption] Video embedding for caption generation is nil", (uint8_t *)&buf, 2u);
    }
    v16 = -18;
  }
LABEL_22:

  return v16;
}

- (int)finishAnalysisPass:(id *)a3
{
  int frameIndex;
  CMTime v6;
  __int128 v7;
  uint64_t v8;
  CMTime rhs;
  CMTime buf;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!LOBYTE(self->_validFrames)
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    frameIndex = self->_frameIndex;
    LODWORD(buf.value) = 67109120;
    HIDWORD(buf.value) = frameIndex;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VideoCaption] Valid number of input frame: %d, zero padding remnant frames", (uint8_t *)&buf, 8u);
  }
  v7 = *(_OWORD *)((char *)&self->_timeLastDetection.epoch + 4);
  v8 = *(_QWORD *)&self->_timeStart.flags;
  buf = *(CMTime *)&self->_activeFrameIndices;
  rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
  CMTimeSubtract(&v6, &buf, &rhs);
  return -[VCPVideoCaptionAnalyzer inference:duration:](self, "inference:duration:", &v7, &v6);
}

- (id)results
{
  void *v3;
  NSString *resConfig;
  int64_t modelType;
  void *v6;
  const __CFString *v8;
  NSString *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  resConfig = self->_resConfig;
  if (resConfig)
  {
    modelType = self->_modelType;
    if (modelType == 1)
    {
      v8 = CFSTR("VideoCaptionResults");
      v9 = resConfig;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addEntriesFromDictionary:", v6);
      goto LABEL_6;
    }
    if (modelType == 2)
    {
      v10 = CFSTR("MiCaVideoCaptionResults");
      v11[0] = resConfig;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addEntriesFromDictionary:", v6);
LABEL_6:

    }
  }
  return v3;
}

- (id)segmentCaptionResults
{
  void *videoCaptionResult;
  NSMutableArray *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  videoCaptionResult = self->_videoCaptionResult;
  if (videoCaptionResult)
  {
    videoCaptionResult = (void *)objc_msgSend(videoCaptionResult, "count");
    if (videoCaptionResult)
    {
      v4 = self->_videoCaptionResult;
      v6 = CFSTR("VideoSegmentCaptionResults");
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      videoCaptionResult = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return videoCaptionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCaptionEncoder, 0);
  objc_storeStrong((id *)&self->_videoCaptionDecoder, 0);
  objc_storeStrong((id *)&self->_timeEnd.epoch, 0);
  objc_storeStrong((id *)&self->_videoSegmentCaptionResult, 0);
  objc_storeStrong((id *)&self->_videoCaptionResult, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_enoughFrames, 0);
  objc_storeStrong((id *)&self->_inputDataMUB, 0);
  objc_storeStrong((id *)&self->_captioner, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
  objc_storeStrong((id *)&self->_videoTransformerBackbone, 0);
  objc_storeStrong((id *)&self->_backbone, 0);
}

@end
