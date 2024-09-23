@implementation VCPVideoCNNAnalyzer

+ (BOOL)forcePersonDetection
{
  return 0;
}

+ (BOOL)isMLHighlightEnabled
{
  return 1;
}

+ (BOOL)isMLSettlingEffectPregatingEnabled
{
  return 1;
}

+ (BOOL)isMUBackboneEnabled
{
  return 0;
}

+ (BOOL)isAdaptiveSegmentEnabled
{
  return 0;
}

+ (BOOL)isVideoSegmentCaptionEnabled
{
  return 0;
}

- (VCPVideoCNNAnalyzer)initWithTimeOfInteret:(id)a3 frameRate:(float)a4 isLivePhoto:(BOOL)a5 phFaces:(id)a6 timeRange:(id *)a7 withEmbeddings:(id)a8 requestedAnalyses:(unint64_t)a9 photoOffset:(float)a10
{
  char *v16;
  char *v17;
  unsigned int *v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  void *v41;
  VCPEmbeddingSummarizationAnalyzer *v42;
  void *v43;
  VCPVideoEmbeddings *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  VCPAdaptiveSegmentAnalyzer *v48;
  void *v49;
  _BOOL4 v50;
  VCPVideoCaptionAnalyzer *v51;
  void *v52;
  float v53;
  __int128 v54;
  __int128 v55;
  CMTimeEpoch v56;
  int v57;
  CMTime *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CMTimeEpoch v66;
  float v67;
  float v68;
  float v69;
  __int128 v70;
  VCPVideoCNNActionClassifier *v71;
  VCPVideoPersonDetector *v72;
  void *v73;
  VCPVideoCNNQuality *v74;
  void *v75;
  VCPVideoCNNCameraMotion *v76;
  void *v77;
  VCPVideoCNNAutoplay *v78;
  void *v79;
  VCPVideoCNNHighlight *v80;
  void *v81;
  int v82;
  double v83;
  NSObject *v84;
  os_signpost_id_t v85;
  NSObject *v86;
  NSObject *v87;
  VCPVideoTransformerBackbone *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  VCPVideoCNNAnalyzer *v93;
  VCPVideoCNNQuality *v95;
  void *v96;
  _BOOL4 v97;
  id v99;
  id v100;
  id v101;
  CMTime var1;
  CMTimeRange v103;
  CMTime v104;
  CMTime v105;
  CMTimeRange range;
  CMTime v107;
  CMTime time;
  objc_super v109;
  CMTime rhs;
  CMTime buf;

  v97 = a5;
  v101 = a3;
  v100 = a6;
  v99 = a8;
  v109.receiver = self;
  v109.super_class = (Class)VCPVideoCNNAnalyzer;
  v16 = -[VCPVideoCNNAnalyzer init](&v109, sel_init);
  v17 = v16;
  v18 = (unsigned int *)v16;
  if (!v16)
    goto LABEL_63;
  v19 = (__int128 *)MEMORY[0x1E0CA2E28];
  v20 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  *(_OWORD *)(v16 + 156) = *MEMORY[0x1E0CA2E28];
  *(_QWORD *)(v16 + 172) = v20;
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)(v16 + 180) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(v16 + 196) = v21;
  v22 = (void *)*((_QWORD *)v16 + 31);
  *((_QWORD *)v16 + 31) = &stru_1E6B1C190;

  v18[34] = 224;
  v18[35] = 224;
  if ((unint64_t)(+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision")
                        - 3) >= 3)
  {
    v18[36] = 224;
    v18[37] = 224;
    v18[38] = 2;
    v24 = (void *)*((_QWORD *)v18 + 4);
    *((_QWORD *)v18 + 4) = 0;
  }
  else
  {
    v18[36] = 352;
    v18[37] = 352;
    v18[38] = 1;
    v23 = -[VCPTransforms initImageTransform:transformedImageWidth:transformedImageHeight:]([VCPTransforms alloc], "initImageTransform:transformedImageWidth:transformedImageHeight:", 128, v18[36], v18[37]);
    v24 = (void *)*((_QWORD *)v18 + 4);
    *((_QWORD *)v18 + 4) = v23;
  }

  *((_QWORD *)v18 + 13) = 0;
  *((_QWORD *)v18 + 14) = 0;
  v25 = (void *)*((_QWORD *)v18 + 15);
  *((_QWORD *)v18 + 15) = 0;

  v26 = (void *)*((_QWORD *)v18 + 16);
  *((_QWORD *)v18 + 16) = 0;

  v27 = v17 + 204;
  v28 = *v19;
  *(_QWORD *)(v17 + 220) = *((_QWORD *)v19 + 2);
  *(_OWORD *)(v17 + 204) = v28;
  v29 = *v19;
  *((_QWORD *)v17 + 42) = *((_QWORD *)v19 + 2);
  *((_OWORD *)v17 + 20) = v29;
  *((_BYTE *)v18 + 236) = 0;
  *((_BYTE *)v18 + 237) = 0;
  *((_BYTE *)v18 + 238) = 0;
  v30 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *((_OWORD *)v17 + 18) = *MEMORY[0x1E0C9D648];
  *((_OWORD *)v17 + 19) = v30;
  *((_BYTE *)v18 + 344) = v101 != 0;
  v31 = -[VCPTransforms initImageTransform:transformedImageWidth:transformedImageHeight:]([VCPTransforms alloc], "initImageTransform:transformedImageWidth:transformedImageHeight:", 128, v18[34], v18[35]);
  v32 = (void *)*((_QWORD *)v18 + 3);
  *((_QWORD *)v18 + 3) = v31;

  objc_storeStrong((id *)v17 + 8, a8);
  v33 = (void *)*((_QWORD *)v18 + 9);
  *((_QWORD *)v18 + 9) = 0;

  *((float *)v18 + 88) = a10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)*((_QWORD *)v18 + 5);
  *((_QWORD *)v18 + 5) = v34;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (id *)(v17 + 48);
  v38 = (void *)*((_QWORD *)v17 + 6);
  *((_QWORD *)v17 + 6) = v36;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (id *)(v17 + 56);
  v41 = (void *)*((_QWORD *)v17 + 7);
  *((_QWORD *)v17 + 7) = v39;

  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
  {
    v42 = objc_alloc_init(VCPEmbeddingSummarizationAnalyzer);
    v43 = (void *)*((_QWORD *)v18 + 11);
    *((_QWORD *)v18 + 11) = v42;

  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled")
    && +[VCPVideoCNNAnalyzer isAdaptiveSegmentEnabled](VCPVideoCNNAnalyzer, "isAdaptiveSegmentEnabled"))
  {
    v44 = [VCPVideoEmbeddings alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[VCPVideoEmbeddings initWithEmbeddingType:version:](v44, "initWithEmbeddingType:version:", 1, v45);
    v47 = (void *)*((_QWORD *)v18 + 9);
    *((_QWORD *)v18 + 9) = v46;

    v48 = objc_alloc_init(VCPAdaptiveSegmentAnalyzer);
    v49 = (void *)*((_QWORD *)v18 + 10);
    *((_QWORD *)v18 + 10) = v48;

  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
  {
    v50 = +[VCPVideoCNNAnalyzer isVideoSegmentCaptionEnabled](VCPVideoCNNAnalyzer, "isVideoSegmentCaptionEnabled");
    if ((a9 & 0x200000000000) != 0 && v50 && !v97)
    {
      v51 = objc_alloc_init(VCPVideoCaptionAnalyzer);
      v52 = (void *)*((_QWORD *)v18 + 12);
      *((_QWORD *)v18 + 12) = v51;

    }
  }
  if (v101)
  {
    if (!objc_msgSend(v100, "count")
      && (int)MediaAnalysisLogLevel() >= 7
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Human action - no PHFaces found", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(v101, "floatValue");
    CMTimeMake(&buf, (uint64_t)(float)((float)((float)(v53 + -1.0) + (float)(-3.0 / a4)) * 1000.0), 1000);
    v54 = *(_OWORD *)&buf.value;
    *((_QWORD *)v27 + 2) = buf.epoch;
    *(_OWORD *)v27 = v54;
  }
  v55 = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a7->var0.var0;
  *(_OWORD *)&range.start.epoch = v55;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a7->var1.var1;
  CMTimeRangeGetEnd(&v107, &range);
  buf = v107;
  v56 = *((_QWORD *)v27 + 2);
  *(_OWORD *)&rhs.value = *(_OWORD *)v27;
  rhs.epoch = v56;
  CMTimeSubtract(&time, &buf, &rhs);
  v57 = vcvtmd_s64_f64(CMTimeGetSeconds(&time) * 8.0);
  v58 = (CMTime *)MEMORY[0x1E0CA2E68];
  if (v57 <= 16)
  {
    memset(&v107, 0, sizeof(v107));
    CMTimeMakeWithSeconds(&v107, (float)((float)((float)(16 - v57) + 3.0) * 0.125), 1000);
    v59 = *(_OWORD *)v27;
    buf.epoch = *((_QWORD *)v27 + 2);
    *(_OWORD *)&buf.value = v59;
    rhs = v107;
    if (CMTimeCompare(&buf, &rhs) < 1)
    {
      v105 = *v58;
    }
    else
    {
      v60 = *(_OWORD *)v27;
      buf.epoch = *((_QWORD *)v27 + 2);
      *(_OWORD *)&buf.value = v60;
      rhs = v107;
      CMTimeSubtract(&v105, &buf, &rhs);
    }
    v61 = *(_OWORD *)&v105.value;
    *((_QWORD *)v27 + 2) = v105.epoch;
    *(_OWORD *)v27 = v61;
  }
  v62 = *(_OWORD *)v27;
  buf.epoch = *((_QWORD *)v27 + 2);
  *(_OWORD *)&buf.value = v62;
  rhs = *v58;
  if (CMTimeCompare(&buf, &rhs) < 0)
  {
    v63 = *(_OWORD *)&v58->value;
    *((_QWORD *)v27 + 2) = v58->epoch;
    *(_OWORD *)v27 = v63;
  }
  v18[87] = 1040187392;
  v64 = *(_OWORD *)&a7->var1.var1;
  v65 = *(_OWORD *)&a7->var0.var0;
  *(_OWORD *)&v103.start.epoch = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)&v103.duration.timescale = v64;
  *(_OWORD *)&v103.start.value = v65;
  CMTimeRangeGetEnd(&v107, &v103);
  buf = v107;
  v66 = *((_QWORD *)v27 + 2);
  *(_OWORD *)&rhs.value = *(_OWORD *)v27;
  rhs.epoch = v66;
  CMTimeSubtract(&v104, &buf, &rhs);
  if ((int)vcvtmd_s64_f64(CMTimeGetSeconds(&v104) * 8.0) > 15)
  {
    if ((a9 & 0x40000000) != 0)
    {
      v71 = -[VCPVideoCNNActionClassifier initWithPHFaces:]([VCPVideoCNNActionClassifier alloc], "initWithPHFaces:", v100);
      if (!v71
        || ((objc_msgSend(*((id *)v18 + 5), "addObject:", v71), !*((_BYTE *)v18 + 344))
         || objc_msgSend((id)objc_opt_class(), "forcePersonDetection"))
        && (v72 = objc_alloc_init(VCPVideoPersonDetector),
            v73 = (void *)*((_QWORD *)v18 + 30),
            *((_QWORD *)v18 + 30) = v72,
            v73,
            !*((_QWORD *)v18 + 30)))
      {

        goto LABEL_65;
      }

    }
  }
  else
  {
    var1 = (CMTime)a7->var1;
    v67 = CMTimeGetSeconds(&var1) * a4;
    v68 = floorf(v67 * 0.0625);
    *((float *)v18 + 87) = (float)(v68 + -1.0) / a4;
    v69 = (float)((float)(floorf(v67 + (float)(v68 * -16.0)) * 0.5) + -3.0) / a4;
    if (v69 < 0.0)
      v69 = 0.0;
    CMTimeMakeWithSeconds(&buf, v69, 600);
    v70 = *(_OWORD *)&buf.value;
    *((_QWORD *)v27 + 2) = buf.epoch;
    *(_OWORD *)v27 = v70;
  }
  if ((a9 & 0x200000000) != 0 && !v97)
  {
    v74 = objc_alloc_init(VCPVideoCNNQuality);
    v75 = (void *)*((_QWORD *)v18 + 34);
    *((_QWORD *)v18 + 34) = v74;

    if (!*((_QWORD *)v18 + 34))
      goto LABEL_65;
    objc_msgSend(*((id *)v18 + 5), "addObject:");
    v76 = objc_alloc_init(VCPVideoCNNCameraMotion);
    v77 = (void *)*((_QWORD *)v18 + 33);
    *((_QWORD *)v18 + 33) = v76;

    if (!*((_QWORD *)v18 + 33))
      goto LABEL_65;
    objc_msgSend(*((id *)v18 + 5), "addObject:");
  }
  if ((a9 & 0x40000) != 0)
  {
    if (v97)
    {
      v78 = objc_alloc_init(VCPVideoCNNAutoplay);
      v79 = (void *)*((_QWORD *)v18 + 32);
      *((_QWORD *)v18 + 32) = v78;

      if (!*((_QWORD *)v18 + 32))
        goto LABEL_65;
      v40 = v37;
      goto LABEL_47;
    }
    if (+[VCPVideoCNNAnalyzer isMLHighlightEnabled](VCPVideoCNNAnalyzer, "isMLHighlightEnabled"))
    {
      v80 = objc_alloc_init(VCPVideoCNNHighlight);
      v81 = (void *)*((_QWORD *)v18 + 35);
      *((_QWORD *)v18 + 35) = v80;

      if (!*((_QWORD *)v18 + 35))
        goto LABEL_65;
      objc_msgSend(*v40, "addObject:");
      if (!*((_QWORD *)v18 + 34))
      {
        v95 = objc_alloc_init(VCPVideoCNNQuality);
        v96 = (void *)*((_QWORD *)v18 + 34);
        *((_QWORD *)v18 + 34) = v95;

        if (!*((_QWORD *)v18 + 34))
          goto LABEL_65;
LABEL_47:
        objc_msgSend(*v40, "addObject:");
      }
    }
  }
  v82 = !+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
  if ((a9 & 0x80000000000) == 0)
    LOBYTE(v82) = 1;
  if ((v82 & 1) != 0)
  {
LABEL_62:
    v18[57] = 0;
    LODWORD(v83) = 1.0;
    if (!objc_msgSend(v18, "configForAspectRatio:", v83))
    {
LABEL_63:
      v90 = v18;
      goto LABEL_66;
    }
LABEL_65:
    v90 = 0;
    goto LABEL_66;
  }
  VCPSignPostLog();
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = os_signpost_id_generate(v84);

  VCPSignPostLog();
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v87, OS_SIGNPOST_INTERVAL_BEGIN, v85, "VCPMovieAnalyzer_Video_VCPVideoBackboneInit", ", (uint8_t *)&buf, 2u);
  }

  v88 = -[VCPVideoTransformerBackbone initWithConfig:]([VCPVideoTransformerBackbone alloc], "initWithConfig:", *((_QWORD *)v18 + 31));
  v89 = (void *)*((_QWORD *)v18 + 2);
  *((_QWORD *)v18 + 2) = v88;

  v90 = (void *)*((_QWORD *)v18 + 2);
  if (v90)
  {
    VCPSignPostLog();
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v92, OS_SIGNPOST_INTERVAL_END, v85, "VCPMovieAnalyzer_Video_VCPVideoBackboneInit", ", (uint8_t *)&buf, 2u);
    }

    goto LABEL_62;
  }
LABEL_66:
  v93 = v90;

  return v93;
}

- (void)dealloc
{
  float *inputData;
  float *inputDataSettling;
  objc_super v5;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  inputDataSettling = self->_inputDataSettling;
  if (inputDataSettling)
    MEMORY[0x1BCCA128C](inputDataSettling, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoCNNAnalyzer;
  -[VCPVideoCNNAnalyzer dealloc](&v5, sel_dealloc);
}

- (int)configForAspectRatio:(float)a3
{
  VCPVideoPersonDetector *personDetector;
  float *inputData;
  float *inputDataSettling;
  int v7;
  int v8;
  uint64_t v9;
  size_t v10;
  float *v11;
  int v12;
  int v13;
  uint64_t v14;
  size_t v15;
  float *v16;
  VCPVideoTransformerBackbone *videoTransformerBackbone;
  VCPEspressoV2Data *v18;
  VCPEspressoV2Data *inputDataForTransformer;
  VCPEspressoV2Data *v20;
  VCPEspressoV2Data *inputDataBackup;

  personDetector = self->_personDetector;
  self->_personDetector = (VCPVideoPersonDetector *)&stru_1E6B1C190;

  self->_inputWidth = 224;
  self->_inputHeight = 224;
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
    self->_inputData = 0;
  }
  inputDataSettling = self->_inputDataSettling;
  if (inputDataSettling)
  {
    MEMORY[0x1BCCA128C](inputDataSettling, 0x1000C8052888210);
    self->_inputDataSettling = 0;
  }
  v7 = self->_inputHeight * self->_inputWidth;
  v8 = 16 * v7;
  v9 = 192 * v7;
  if (v8 < 0)
    v10 = -1;
  else
    v10 = v9;
  v11 = (float *)operator new[](v10, MEMORY[0x1E0DE4E10]);
  self->_inputData = v11;
  if (!v11)
    return -108;
  if (+[VCPVideoCNNAnalyzer isMLSettlingEffectPregatingEnabled](VCPVideoCNNAnalyzer, "isMLSettlingEffectPregatingEnabled"))
  {
    v12 = self->_inputHeight * self->_inputWidth;
    v13 = 16 * v12;
    v14 = 192 * v12;
    v15 = v13 < 0 ? -1 : v14;
    v16 = (float *)operator new[](v15, MEMORY[0x1E0DE4E10]);
    self->_inputDataSettling = v16;
    if (!v16)
      return -108;
  }
  videoTransformerBackbone = self->_videoTransformerBackbone;
  if (!videoTransformerBackbone)
    return 0;
  if (-[VCPVideoTransformerBackbone inputTensorSize](videoTransformerBackbone, "inputTensorSize") != 48 * self->_inputHeightMUBB * self->_inputWidthMUBB / self->_mubbSampleScale)
    return 0;
  v18 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", -[VCPVideoTransformerBackbone inputTensorType](self->_videoTransformerBackbone, "inputTensorType"), -[VCPVideoTransformerBackbone inputTensorSize](self->_videoTransformerBackbone, "inputTensorSize"));
  inputDataForTransformer = self->_inputDataForTransformer;
  self->_inputDataForTransformer = v18;

  if (!self->_inputDataForTransformer)
    return -108;
  v20 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", -[VCPVideoTransformerBackbone inputTensorType](self->_videoTransformerBackbone, "inputTensorType"), -[VCPVideoTransformerBackbone inputTensorSize](self->_videoTransformerBackbone, "inputTensorSize"));
  inputDataBackup = self->_inputDataBackup;
  self->_inputDataBackup = v20;

  if (self->_inputDataBackup)
    return 0;
  else
    return -108;
}

- (int)copyImage:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5
{
  _BOOL4 v5;
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
  float v25;
  float v26;
  int v27;
  int *v28;
  uint64_t v29;
  int v30;
  int *v31;
  int v32;
  int v33;
  BOOL v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CVReturn v45;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (a4 != 3)
    return -50;
  v5 = a5;
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
  v45 = v11;
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
    if (v10 > 0)
    {
      v27 = 0;
      v28 = &OBJC_IVAR___VCPVideoCNNAnalyzer__inputData;
      if (v5)
        v28 = &OBJC_IVAR___VCPVideoCNNAnalyzer__inputDataSettling;
      v29 = *v28;
      v30 = self->_inputHeight * self->_inputWidth;
      v31 = &OBJC_IVAR___VCPVideoCNNAnalyzer__validFrames;
      if (v5)
        v31 = &OBJC_IVAR___VCPVideoCNNAnalyzer__validFramesSettling;
      v32 = *(_DWORD *)((char *)&self->super.super.isa + *v31);
      v33 = v32 & 0xF;
      v35 = -v32;
      v34 = v35 < 0;
      v36 = v35 & 0xF;
      if (v34)
        v37 = v33;
      else
        v37 = -v36;
      v38 = v30 * v37;
      v39 = *(uint64_t *)((char *)&self->super.super.isa + v29);
      v40 = v39 + 4 * (v38 + 32 * v30);
      v41 = v39 + 4 * (v38 + 16 * v30);
      v42 = v39 + 4 * v38;
      v43 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          v44 = 0;
          do
          {
            LOBYTE(v24) = BaseAddress[(int)v44 + 2];
            LOBYTE(v25) = BaseAddress[(int)v44 + 1];
            v25 = (float)LODWORD(v25) / 255.0;
            LOBYTE(v26) = BaseAddress[(int)v44];
            v26 = (float)LODWORD(v26);
            *(float *)(v42 + v44) = (float)((float)((float)LODWORD(v24) / 255.0) + -0.45) / 0.225;
            *(float *)(v41 + v44) = (float)(v25 + -0.45) / 0.225;
            v24 = (float)((float)(v26 / 255.0) + -0.45) / 0.225;
            *(float *)(v40 + v44) = v24;
            v44 += 4;
          }
          while (4 * Width != v44);
        }
        BaseAddress += BytesPerRow;
        ++v27;
        v40 += v43;
        v41 += v43;
        v42 += v43;
      }
      while (v27 != v10);
    }
    v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v45);
    if (pixelBuffer
      && !v45
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
  int v8;
  CVReturn v9;
  int v10;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v22;
  int v23;
  int mubbSampleScale;
  int v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  double v30;
  double v31;
  uint64_t v32;
  int Width;
  int Height;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3
    || +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4
    || +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
  {
    v39 = 32;
    v8 = 11;
  }
  else
  {
    v39 = 16;
    v8 = 14;
  }
  if (a4 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v40 = v9;
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v10 = 0;
      v23 = HIDWORD(self->_timeStart.epoch) & 0xF;
      if (SHIDWORD(self->_timeStart.epoch) <= 0)
        v23 = -(-BYTE4(self->_timeStart.epoch) & 0xF);
      mubbSampleScale = self->_mubbSampleScale;
      if (!(v23 % mubbSampleScale))
      {
        if (Height >= 1)
        {
          v35 = 0;
          v25 = 3 * Height * Width * (v23 / mubbSampleScale);
          v37 = v25 + Height * Width;
          v38 = v25;
          v36 = v25 + 2 * Height * Width;
          v32 = BytesPerRow;
          do
          {
            if (Width >= 1)
            {
              v26 = 0;
              v27 = 1;
              do
              {
                LOBYTE(v22) = BaseAddress[v27 + 1];
                v28 = BaseAddress[v27];
                LOBYTE(v4) = BaseAddress[v27 - 1];
                v29 = v26 / v39 + (v35 / v39 + (((v39 - 1) & v26) + (v35 & (v39 - 1)) * v39) * v8) * v8;
                *(float *)&v22 = (float)((float)((float)LODWORD(v22) / 255.0) + -0.48145) / 0.26863;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataForTransformer, "setValueFP:atIndex:", v29 + v38, v22, v32);
                *(float *)&v30 = (float)((float)((float)v28 / 255.0) + -0.45783) / 0.2613;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataForTransformer, "setValueFP:atIndex:", v37 + v29, v30);
                *(float *)&v31 = (float)((float)((float)v4 / 255.0) + -0.40821) / 0.27578;
                -[VCPEspressoV2Data setValueFP:atIndex:](self->_inputDataForTransformer, "setValueFP:atIndex:", v36 + v29, v31);
                ++v26;
                v27 += 4;
              }
              while (Width != v26);
            }
            BaseAddress += v32;
            ++v35;
          }
          while (v35 != Height);
        }
        v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v40);
      }
    }
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v10 = -50;
    v40 = -50;
  }
  if (pixelBuffer
    && !v40
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.2();
  }
  return v10;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int Width;
  int Height;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double Seconds;
  _BOOL4 v19;
  _BOOL4 v20;
  __int128 v21;
  float v22;
  float v23;
  int v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  __CVBuffer *v29;
  __CVBuffer *v30;
  VCPTransforms *transformImageMUBB;
  __CVBuffer *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  __CVBuffer *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  int epoch_high;
  __int128 v44;
  __int128 v45;
  int validFrames;
  void *v48;
  __int128 v49;
  VCPEspressoV2Data *v50;
  VCPEspressoV2Data *v51;
  _BOOL4 v52;
  __int128 *v53;
  VCPEspressoV2Data *inputDataForTransformer;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v55;
  void *v56;
  CMTime v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  int64_t v61;
  __int128 v62;
  int64_t var3;
  CMTime v64;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  lhs = *(CMTime *)a4;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->_mubbSampleScale + 1);
  rhs.epoch = *(_QWORD *)&self->_timeLastProcess.flags;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= *((float *)&self->_timeEnd.epoch + 1))
  {
    lhs = (CMTime)*a4;
    rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
    v17 = CMTimeCompare(&lhs, &rhs) >= 0;
  }
  else
  {
    v17 = 0;
  }
  v64 = (CMTime)*a4;
  Seconds = CMTimeGetSeconds(&v64);
  v55 = a5;
  if (v17)
  {
    if (LOBYTE(self->_validFramesSettling))
      v19 = LOBYTE(self->_timeEnd.epoch) == 0;
    else
      v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  v20 = Seconds > (float)(*(float *)&self->_postInference + -0.5)
     && !BYTE1(self->_validFramesSettling)
     && LOBYTE(self->_timeEnd.epoch)
     && self->_inputDataSettling != 0;
  if (!v19 && !v20)
    return 0;
  if ((self->_timeLastDetection.timescale & 1) == 0)
  {
    v21 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&self->_timeLastDetection.flags = a4->var3;
    *(_OWORD *)((char *)&self->_timeLastProcess.epoch + 4) = v21;
  }
  v22 = (float)Width;
  v23 = (float)Height;
  v53 = (__int128 *)((char *)&self->_timeLastProcess.epoch + 4);
  if ((float)((float)Height * 1.2) >= (float)Width)
  {
    if ((float)(v22 * 1.2) < v23)
    {
      v14 = (float)((float)(Height - Width) / (float)(v23 + v23));
      v16 = (float)(v22 / v23);
      v15 = 1.0;
      v13 = 0.0;
    }
  }
  else
  {
    v13 = (float)((float)(Width - Height) / (float)(v22 + v22));
    v15 = (float)(v23 / v22);
    v16 = 1.0;
    v14 = 0.0;
  }
  VCPSignPostLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_signpost_id_generate(v25);

  VCPSignPostLog();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", ", (uint8_t *)&lhs, 2u);
  }

  v29 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v13, v14, v15, v16);
  if (!v29)
    return -18;
  v30 = v29;
  transformImageMUBB = self->_transformImageMUBB;
  if (transformImageMUBB)
  {
    v32 = -[VCPTransforms cropAndScale:regionCrop:](transformImageMUBB, "cropAndScale:regionCrop:", a3, v13, v14, v15, v16);
    if (!v32)
    {
      v24 = -18;
      v32 = v30;
LABEL_58:
      CFRelease(v32);
      return v24;
    }
  }
  else
  {
    v32 = 0;
  }
  v52 = v20;
  VCPSignPostLog();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v26, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", ", (uint8_t *)&lhs, 2u);
  }

  if (v19)
  {
    v24 = -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](self, "copyImage:withChannels:settling:", v30, 3, 0);
    if (v24)
      goto LABEL_57;
    VCPSignPostLog();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_signpost_id_generate(v35);

    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", ", (uint8_t *)&lhs, 2u);
    }

    v39 = self->_transformImageMUBB ? v32 : v30;
    v24 = -[VCPVideoCNNAnalyzer copyMUBBImage:withChannels:](self, "copyMUBBImage:withChannels:", v39, 3);
    if (v24)
      goto LABEL_57;
    VCPSignPostLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v41, OS_SIGNPOST_INTERVAL_END, v36, "VCPMovieAnalyzer_Video_VCPVideoBackbonePreProcess", ", (uint8_t *)&lhs, 2u);
    }

    v42 = *(void **)&self->_enoughFrames;
    if (v42)
    {
      if (HIDWORD(self->_timeStart.epoch) == 8)
      {
        v62 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        v60 = *(_OWORD *)&v55->var0;
        v61 = v55->var3;
        v24 = objc_msgSend(v42, "analyzeFrame:withTimestamp:andDuration:flags:", v30, &v62, &v60, a6);
        if (v24)
          goto LABEL_57;
      }
    }
    epoch_high = HIDWORD(self->_timeStart.epoch);
    HIDWORD(self->_timeStart.epoch) = epoch_high + 1;
    if (epoch_high >= 15)
    {
      LOBYTE(self->_validFramesSettling) = 1;
      BYTE2(self->_validFramesSettling) = 1;
      v44 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&self->_timeEnd.timescale = a4->var3;
      *(_OWORD *)&self->_regionCrop.size.height = v44;
      *(double *)&self->_highlight = v13;
      self->_regionCrop.origin.x = v14;
      self->_regionCrop.origin.y = v15;
      self->_regionCrop.size.width = v16;
      if (!LOBYTE(self->_timeEnd.epoch))
      {
        v48 = *(void **)&self->_enoughFrames;
        if (v48)
        {
          objc_msgSend(v48, "persons");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = 0;
        }
        v58 = *v53;
        v59 = *(_QWORD *)&self->_timeLastDetection.flags;
        lhs = (CMTime)*a4;
        *(_OWORD *)&rhs.value = *v53;
        rhs.epoch = *(_QWORD *)&self->_timeLastDetection.flags;
        CMTimeSubtract(&v57, &lhs, &rhs);
        v24 = -[VCPVideoCNNAnalyzer runTasks:duration:persons:regionCrop:](self, "runTasks:duration:persons:regionCrop:", &v58, &v57, v56, v13, v14, v15, v16);
        if (v24)
        {

          goto LABEL_57;
        }
        HIDWORD(self->_timeStart.epoch) = 0;
        v49 = *(_OWORD *)&a4->var0;
        *(_QWORD *)&self->_timeLastDetection.flags = a4->var3;
        *v53 = v49;
        v50 = self->_inputDataBackup;
        objc_storeStrong((id *)&self->_inputDataBackup, self->_inputDataForTransformer);
        inputDataForTransformer = self->_inputDataForTransformer;
        self->_inputDataForTransformer = v50;
        v51 = v50;

        LOBYTE(self->_validFramesSettling) = 0;
        BYTE2(self->_validFramesSettling) = 0;

      }
    }
    v45 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&self->_timeLastProcess.flags = a4->var3;
    *(_OWORD *)(&self->_mubbSampleScale + 1) = v45;
  }
  if (!v52)
    goto LABEL_56;
  v24 = -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](self, "copyImage:withChannels:settling:", v30, 3, 1);
  if (v24)
    goto LABEL_57;
  validFrames = self->_validFrames;
  self->_validFrames = validFrames + 1;
  if (validFrames >= 15)
  {
    v24 = 0;
    BYTE1(self->_validFramesSettling) = 1;
  }
  else
  {
LABEL_56:
    v24 = 0;
  }
LABEL_57:
  CFRelease(v30);
  if (v32)
    goto LABEL_58;
  return v24;
}

- (int)loadAnalysisResultsFrom:(id)a3 actionAnalyzer:(id)a4 atTime:(id *)a5
{
  id v8;
  id v9;
  int v10;
  void *v12;
  void *v13;
  void *v14;
  CMTimeRange v15;
  CMTimeRange v16;
  CMTime end;
  CMTime start;
  CMTimeRange lhs;
  CMTime time;
  CMTime rhs;

  v8 = a3;
  v9 = a4;
  if (self->_quality
    && SHIDWORD(self->_timeStart.epoch) >= 15
    && (*(_OWORD *)&lhs.start.value = *(_OWORD *)&a5->var0,
        lhs.start.epoch = a5->var3,
        rhs = *(CMTime *)(&self->_mubbSampleScale + 1),
        CMTimeSubtract(&time, &lhs.start, &rhs),
        CMTimeGetSeconds(&time) >= 0.125)
    && (self->_timeLastDetection.timescale & 1) != 0)
  {
    memset(&lhs, 0, sizeof(lhs));
    start = *(CMTime *)((char *)&self->_timeLastProcess.epoch + 4);
    end = (CMTime)*a5;
    CMTimeRangeFromTimeToTime(&lhs, &start, &end);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = lhs;
    objc_msgSend(v8, "clipResults:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v13);

    v15 = lhs;
    objc_msgSend(v9, "clipResults:", &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v14);

    v10 = -[VCPVideoCNNQuality loadAnalysisResults:](self->_quality, "loadAnalysisResults:", v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)loadFullAnalysisResults:(id)a3 actionAnalysisResults:(id)a4 predictedTimeRange:(id *)a5 timestamp:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  int v14;
  void *v15;
  id v16;
  __int128 v18;
  void *v19;
  void *v20;
  id v21;
  CMTimeRange v22;
  CMTimeRange range1;
  CMTimeRange range2;
  CMTimeRange v25;
  CMTime end;
  CMTime start;
  CMTime time;
  CMTimeRange lhs;
  CMTime rhs;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (self->_quality)
  {
    if (SHIDWORD(self->_timeStart.epoch) >= 15)
    {
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&a6->var0;
      lhs.start.epoch = a6->var3;
      rhs = *(CMTime *)(&self->_mubbSampleScale + 1);
      CMTimeSubtract(&time, &lhs.start, &rhs);
      if (CMTimeGetSeconds(&time) >= 0.125 && (self->_timeLastDetection.timescale & 1) != 0)
      {
        memset(&lhs, 0, sizeof(lhs));
        start = *(CMTime *)((char *)&self->_timeLastProcess.epoch + 4);
        end = (CMTime)*a6;
        CMTimeRangeFromTimeToTime(&lhs, &start, &end);
        v25 = lhs;
        v18 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&range2.start.value = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&range2.start.epoch = v18;
        *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a5->var1.var1;
        if (CMTimeRangeEqual(&v25, &range2))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addEntriesFromDictionary:", v10);
          objc_msgSend(v19, "addEntriesFromDictionary:", v11);
          v14 = -[VCPVideoCNNQuality loadAnalysisResults:](self->_quality, "loadAnalysisResults:", v19);

          goto LABEL_11;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_opt_class();
          LODWORD(rhs.value) = 138412290;
          *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v20;
          v21 = v20;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Error: predictedTimeRange mismatches timeRange", (uint8_t *)&rhs, 0xCu);

        }
        goto LABEL_10;
      }
    }
  }
  v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v13 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v22.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v22.start.epoch = v13;
  *(_OWORD *)&v22.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  if (!CMTimeRangeEqual(&range1, &v22))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      LODWORD(lhs.start.value) = 138412290;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v15;
      v16 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Error: predictedTimeRange should be invalid...", (uint8_t *)&lhs, 0xCu);

    }
LABEL_10:
    v14 = -18;
    goto LABEL_11;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4
{
  id v6;
  id v7;
  NSString *resConfig;
  int v9;

  v6 = a3;
  v7 = a4;
  resConfig = self->_resConfig;
  if (resConfig)
    v9 = -[NSString loadAnalysisResults:audioResults:](resConfig, "loadAnalysisResults:audioResults:", v6, v7);
  else
    v9 = 0;

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)isAnalysisResultNeeded:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v5;
  unsigned int *p_var2;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  if (self[11].var3
    && (v5 = self, (int)self[9].var2 >= 15)
    && (lhs = *(CMTime *)a4,
        *(_OWORD *)&rhs.value = *(_OWORD *)&self[6].var2,
        rhs.epoch = *(int64_t *)((char *)&self[7].var0 + 4),
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) >= 0.125))
  {
    p_var2 = &v5[7].var2;
  }
  else
  {
    p_var2 = (unsigned int *)MEMORY[0x1E0CA2E18];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var2;
  retstr->var3 = *((_QWORD *)p_var2 + 2);
  return self;
}

- (int)runTasks:(id *)a3 duration:(id *)a4 persons:(id)a5 regionCrop:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  VCPVideoCNNBackbone *v14;
  VCPVideoCNNBackbone *backbone;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  VCPVideoEmbeddings *videoEmbeddings;
  void *v24;
  VCPVideoCaptionAnalyzer *videoCaptionAnalyzer;
  void *v26;
  VCPVideoEmbeddings *videoEmbeddingsX3D;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  VCPVideoCNNBackbone *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  VCPVideoCNNBackbone *v39;
  __int128 v41;
  int64_t v42;
  __int128 v43;
  int64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int64_t v50;
  __int128 v51;
  int64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int64_t v58;
  __int128 v59;
  int64_t v60;
  __int128 v61;
  int64_t v62;
  __int128 v63;
  int64_t v64;
  __int128 v65;
  int64_t v66;
  __int128 v67;
  int64_t var3;
  uint8_t buf[16];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  if (!self->_backbone)
  {
    v14 = -[VCPVideoCNNBackbone initWithConfig:]([VCPVideoCNNBackbone alloc], "initWithConfig:", self->_personDetector);
    backbone = self->_backbone;
    self->_backbone = v14;

    if (!self->_backbone)
    {
      v20 = -108;
      goto LABEL_42;
    }
  }
  if (BYTE2(self->_validFramesSettling) && self->_videoTransformerBackbone)
  {
    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    VCPSignPostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMovieAnalyzer_Video_VCPVideoBackboneInference", ", buf, 2u);
    }

    v20 = -[VCPVideoTransformerBackbone inference:](self->_videoTransformerBackbone, "inference:", self->_inputDataForTransformer);
    if (v20)
      goto LABEL_42;
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v17, "VCPMovieAnalyzer_Video_VCPVideoBackboneInference", ", buf, 2u);
    }

    videoEmbeddings = self->_videoEmbeddings;
    if (videoEmbeddings)
    {
      -[VCPVideoTransformerBackbone embedding](self->_videoTransformerBackbone, "embedding");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v65 = *(_OWORD *)&a4->var0;
      v66 = a4->var3;
      -[VCPVideoEmbeddings addEmbeddings:startTime:duration:](videoEmbeddings, "addEmbeddings:startTime:duration:", v24, &v67, &v65);

    }
    videoCaptionAnalyzer = self->_videoCaptionAnalyzer;
    if (videoCaptionAnalyzer)
    {
      -[VCPVideoTransformerBackbone spatialEmbedding](self->_videoTransformerBackbone, "spatialEmbedding");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = *(_OWORD *)&a3->var0;
      v64 = a3->var3;
      v61 = *(_OWORD *)&a4->var0;
      v62 = a4->var3;
      -[VCPVideoCaptionAnalyzer generateCaptionWithEmbedding:startTime:duration:](videoCaptionAnalyzer, "generateCaptionWithEmbedding:startTime:duration:", v26, &v63, &v61);

    }
  }
  if (LOBYTE(self->_validFramesSettling))
  {
    v20 = -[VCPVideoCNNBackbone inference:settling:](self->_backbone, "inference:settling:", self->_inputData, 0);
    if (v20)
      goto LABEL_42;
    videoEmbeddingsX3D = self->_videoEmbeddingsX3D;
    if (videoEmbeddingsX3D)
    {
      -[VCPVideoCNNBackbone tensorBeforeTemporalPooling](self->_backbone, "tensorBeforeTemporalPooling");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *(_OWORD *)&a3->var0;
      v60 = a3->var3;
      v57 = *(_OWORD *)&a4->var0;
      v58 = a4->var3;
      -[VCPVideoEmbeddings addEmbeddings:startTime:duration:](videoEmbeddingsX3D, "addEmbeddings:startTime:duration:", v28, &v59, &v57);

    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v29 = self->_tasks;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v54;
LABEL_22:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v32);
        v34 = self->_backbone;
        v51 = *(_OWORD *)&a3->var0;
        v52 = a3->var3;
        v49 = *(_OWORD *)&a4->var0;
        v50 = a4->var3;
        v20 = objc_msgSend(v33, "run:withPersons:andRegionCrop:atTime:andDuration:", v34, v13, &v51, &v49, x, y, width, height);
        if (v20)
          goto LABEL_40;
        if (v30 == ++v32)
        {
          v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
          if (v30)
            goto LABEL_22;
          break;
        }
      }
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v29 = self->_privateTasks;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v46;
LABEL_30:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v29);
        v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v37);
        v39 = self->_backbone;
        v43 = *(_OWORD *)&a3->var0;
        v44 = a3->var3;
        v41 = *(_OWORD *)&a4->var0;
        v42 = a4->var3;
        v20 = objc_msgSend(v38, "run:withPersons:andRegionCrop:atTime:andDuration:", v39, v13, &v43, &v41, x, y, width, height);
        if (v20)
          break;
        if (v35 == ++v37)
        {
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v70, 16);
          if (v35)
            goto LABEL_30;
          goto LABEL_36;
        }
      }
LABEL_40:

      goto LABEL_42;
    }
LABEL_36:

  }
  if (BYTE1(self->_validFramesSettling))
    v20 = -[VCPVideoCNNBackbone inference:settling:](self->_backbone, "inference:settling:", self->_inputDataSettling, 1);
  else
    v20 = 0;
LABEL_42:

  return v20;
}

- (void)copyFrames
{
  int mubbSampleScale;
  uint64_t v4;
  int epoch_high;
  unint64_t v6;
  unsigned int v7;
  int v8;
  VCPEspressoV2Data *inputDataForTransformer;
  uint64_t v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  mubbSampleScale = self->_mubbSampleScale;
  v4 = 228;
  epoch_high = HIDWORD(self->_timeStart.epoch);
  v6 = 0x1EF14B000uLL;
  if (epoch_high / mubbSampleScale >= 1)
  {
    v7 = epoch_high / mubbSampleScale + 1;
    v8 = 16 / mubbSampleScale - 1;
    do
    {
      inputDataForTransformer = self->_inputDataForTransformer;
      v10 = -[VCPEspressoV2Data getData:](inputDataForTransformer, "getData:", -[VCPEspressoV2Data tensorType](inputDataForTransformer, "tensorType"));
      v11 = 3 * self->_inputHeight * self->_inputWidth;
      -[VCPEspressoV2Data copyDataFrom:srcStart:dstStart:length:](inputDataForTransformer, "copyDataFrom:srcStart:dstStart:length:", v10, (int)(v11 * (v7 - 2)), v11 * v8, v11);
      --v7;
      --v8;
    }
    while (v7 > 1);
    mubbSampleScale = self->_mubbSampleScale;
    v4 = 228;
    epoch_high = HIDWORD(self->_timeStart.epoch);
    v6 = 0x1EF14B000;
  }
  if (16 / mubbSampleScale > epoch_high)
  {
    v12 = 0x1EF14B000uLL;
    v13 = 0;
    v14 = 0;
    v24 = 128;
    v25 = *(int *)(v6 + 3208);
    v15 = 3 * (epoch_high / mubbSampleScale);
    do
    {
      v16 = *(Class *)((char *)&self->super.super.isa + v25);
      v17 = v12;
      v18 = *(Class *)((char *)&self->super.super.isa + v24);
      v19 = v4;
      v20 = objc_msgSend(v16, "tensorType", v24, v25);
      v21 = v18;
      v12 = v17;
      v22 = objc_msgSend(v21, "getData:", v20);
      v23 = *(_DWORD *)((char *)&self->super.super.isa + *(int *)(v17 + 3180)) * self->_inputWidth;
      objc_msgSend(v16, "copyDataFrom:srcStart:dstStart:length:", v22, v23 * (v15 + v13), v23 * v13, 3 * v23);
      v4 = v19;
      ++v14;
      v13 += 3;
    }
    while (v14 < 16 / self->_mubbSampleScale - *(_DWORD *)((char *)&self->super.super.isa + v19));
  }
  BYTE2(self->_validFramesSettling) = 1;
}

- (int)finishAnalysisPass:(id *)a3
{
  __int128 v5;
  int v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  VCPAdaptiveSegmentAnalyzer *adaptiveSegmentAnalyzer;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v17;
  __int128 v18;
  uint64_t v19;
  CMTime v20;
  CMTime v21;
  CMTimeRange range;
  CMTime rhs;
  CMTime lhs;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((HIDWORD(self->_timeStart.epoch) - 1) <= 0xE && !LOBYTE(self->_timeEnd.epoch))
    -[VCPVideoCNNAnalyzer copyFrames](self, "copyFrames");
  if (LOBYTE(self->_validFramesSettling) || BYTE1(self->_validFramesSettling) || BYTE2(self->_validFramesSettling))
  {
    if (!LOBYTE(self->_timeEnd.epoch))
    {
      v5 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.epoch = v5;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&lhs, &range);
      *(CMTime *)&self->_regionCrop.size.height = lhs;
      CMTimeMake(&v20, 60, 30);
      lhs = *(CMTime *)&self->_regionCrop.size.height;
      rhs = v20;
      CMTimeSubtract(&v21, &lhs, &rhs);
      *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4) = v21;
    }
    v18 = *(_OWORD *)((char *)&self->_timeLastDetection.epoch + 4);
    v19 = *(_QWORD *)&self->_timeStart.flags;
    lhs = *(CMTime *)&self->_regionCrop.size.height;
    rhs = *(CMTime *)((char *)&self->_timeLastDetection.epoch + 4);
    CMTimeSubtract(&v17, &lhs, &rhs);
    v6 = -[VCPVideoCNNAnalyzer runTasks:duration:persons:regionCrop:](self, "runTasks:duration:persons:regionCrop:", &v18, &v17, 0, *(double *)&self->_highlight, self->_regionCrop.origin.x, self->_regionCrop.origin.y, self->_regionCrop.size.width);
    if (v6)
      return v6;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_postTasks;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v6 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "run:", self->_backbone, (_QWORD)v13);
          if (v6)
          {

            return v6;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  if (!self->_videoEmbeddings)
    return 0;
  v6 = -[VCPEmbeddingSummarizationAnalyzer findSummarizedEmbeddings:](self->_embeddingSummarizationAnalyzer, "findSummarizedEmbeddings:");
  if (!v6)
  {
    if (self->_videoEmbeddings)
    {
      if (self->_videoEmbeddingsX3D)
      {
        adaptiveSegmentAnalyzer = self->_adaptiveSegmentAnalyzer;
        if (adaptiveSegmentAnalyzer)
          -[VCPAdaptiveSegmentAnalyzer calculateAdaptiveSegments:videoEmbeddingsX3D:](adaptiveSegmentAnalyzer, "calculateAdaptiveSegments:videoEmbeddingsX3D:");
      }
    }
    return 0;
  }
  return v6;
}

- (id)privateResults
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_privateTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count") == 0;

        if (!v10)
        {
          objc_msgSend(v8, "results");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v11);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_tasks;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v16, "results", (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count") == 0;

        if (!v18)
        {
          objc_msgSend(v16, "results");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v19);

        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)results
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  VCPVideoEmbeddings *videoEmbeddings;
  void *v21;
  void *v22;
  VCPAdaptiveSegmentAnalyzer *adaptiveSegmentAnalyzer;
  void *v24;
  BOOL v25;
  void *v26;
  VCPVideoCaptionAnalyzer *videoCaptionAnalyzer;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = self->_tasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count") == 0;

        if (!v10)
        {
          objc_msgSend(v8, "results");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v11);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v5);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_postTasks;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v16, "results", (_QWORD)v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count") == 0;

        if (!v18)
        {
          objc_msgSend(v16, "results");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v19);

        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v13);
  }

  videoEmbeddings = self->_videoEmbeddings;
  if (videoEmbeddings)
  {
    -[VCPVideoEmbeddings videoEmbeddingsFp16](videoEmbeddings, "videoEmbeddingsFp16");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("VideoEmbeddingResults"));

    -[VCPEmbeddingSummarizationAnalyzer summarizedEmbeddings](self->_embeddingSummarizationAnalyzer, "summarizedEmbeddings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("SummarizedEmbeddingResults"));

  }
  adaptiveSegmentAnalyzer = self->_adaptiveSegmentAnalyzer;
  if (adaptiveSegmentAnalyzer)
  {
    -[VCPAdaptiveSegmentAnalyzer adaptiveEmbeddings](adaptiveSegmentAnalyzer, "adaptiveEmbeddings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (!v25)
    {
      -[VCPAdaptiveSegmentAnalyzer adaptiveEmbeddings](self->_adaptiveSegmentAnalyzer, "adaptiveEmbeddings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("AdaptiveSegmentResults"));

    }
  }
  videoCaptionAnalyzer = self->_videoCaptionAnalyzer;
  if (videoCaptionAnalyzer)
  {
    -[VCPVideoCaptionAnalyzer segmentCaptionResults](videoCaptionAnalyzer, "segmentCaptionResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v28);

  }
  return v3;
}

- (BOOL)highlightEnabled
{
  return self->_quality != 0;
}

- (BOOL)postInference
{
  return self->_timeEnd.epoch;
}

- (float)minProcessingInterval
{
  return *((float *)&self->_timeEnd.epoch + 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStart
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[8].var2;
  retstr->var3 = *(int64_t *)((char *)&self[9].var0 + 4);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_cameraMotion, 0);
  objc_storeStrong((id *)&self->_autoplay, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_personDetector, 0);
  objc_storeStrong((id *)&self->_enoughFrames, 0);
  objc_storeStrong((id *)&self->_inputDataBackup, 0);
  objc_storeStrong((id *)&self->_inputDataForTransformer, 0);
  objc_storeStrong((id *)&self->_videoCaptionAnalyzer, 0);
  objc_storeStrong((id *)&self->_embeddingSummarizationAnalyzer, 0);
  objc_storeStrong((id *)&self->_adaptiveSegmentAnalyzer, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingsX3D, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
  objc_storeStrong((id *)&self->_privateTasks, 0);
  objc_storeStrong((id *)&self->_postTasks, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_transformImageMUBB, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
  objc_storeStrong((id *)&self->_videoTransformerBackbone, 0);
  objc_storeStrong((id *)&self->_backbone, 0);
}

- (void)copyImage:(uint64_t)a3 withChannels:(uint64_t)a4 settling:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Cannot lock NULL CVPixelBuffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)copyImage:withChannels:settling:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_3();
}

- (void)copyImage:withChannels:settling:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to lock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_3();
}

@end
