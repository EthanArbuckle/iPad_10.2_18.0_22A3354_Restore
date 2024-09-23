@implementation VCPCaptureAnalysisSession

+ (id)analyzerForAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 properties:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  void *v20;
  _OWORD v22[2];
  __int128 v23;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("focalLengthInPixels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v13 = fmaxf(v12, 1.0);
    }
    else
    {
      v13 = 1000.0;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dispatchQueue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("turboMode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v14 = objc_msgSend(v16, "BOOLValue");
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
    v15 = 0;
    v13 = 1000.0;
  }
  v18 = objc_alloc((Class)a1);
  v19 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v19;
  v23 = *(_OWORD *)&a4->tx;
  v20 = (void *)objc_msgSend(v18, "initWithAnalysisTypes:withPreferredTransform:withFocalLengthInPixels:withAnalysisQueue:withTurbo:", a3, v22, v15, v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(v13))));

  return v20;
}

- (VCPCaptureAnalysisSession)initWithAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 withFocalLengthInPixels:(float)a5 withAnalysisQueue:(id)a6 withTurbo:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  VCPCaptureAnalysisSession *v14;
  VCPCaptureAnalysisSession *v15;
  OS_dispatch_queue **p_analysisQueue;
  void *v17;
  VCPCaptureAnalysisSession *v18;
  uint64_t v20;
  NSMutableDictionary *aggregatedResults;
  VCPVideoFullFaceDetector *v22;
  __int128 v23;
  uint64_t v24;
  VCPVideoFullFaceDetector *faceDetector;
  VCPImageBlurAnalyzer *v26;
  VCPImageBlurAnalyzer *blurAnalyzer;
  VCPAudioAnalyzer *v28;
  VCPAudioAnalyzer *audioAnalyzer;
  unint64_t analysisTypes;
  VCPVideoFaceMeshAnalyzer *v31;
  double v32;
  uint64_t v33;
  VCPVideoFaceMeshAnalyzer *meshAnalyzer;
  VCPVideoFacePoseAnalyzer *v35;
  double v36;
  uint64_t v37;
  VCPVideoFacePoseAnalyzer *poseAnalyzer;
  unint64_t v39;
  VCPFullVideoAnalyzer *v40;
  __int128 v41;
  uint64_t v42;
  VCPFullVideoAnalyzer *videoAnalysis;
  VCPHomeKitMotionAnalyzer *v44;
  VCPHomeKitMotionAnalyzer *homeKitMotionAnalyzer;
  VCPLightMotionAnalyzer *v46;
  VCPLightMotionAnalyzer *lightMotionAnalyzer;
  VCPSceneChangeAnalyzer *v48;
  VCPSceneChangeAnalyzer *sceneChangeAnalyzer;
  VCPTrimAnalyzer *v50;
  VCPTrimAnalyzer *trimAnalyzer;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  Rotator *v56;
  Rotator *v57;
  _OWORD v58[3];
  _OWORD v59[3];
  _OWORD v60[3];
  objc_super v61;

  v7 = a7;
  v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)VCPCaptureAnalysisSession;
  v14 = -[VCPCaptureAnalysisSession init](&v61, sel_init);
  v15 = v14;
  if (!v14
    || (v14->_analysisTypes = a3,
        v14->_focalLengthInPixels = a5,
        p_analysisQueue = &v14->_analysisQueue,
        objc_storeStrong((id *)&v14->_analysisQueue, a6),
        v15->_preWarmed = 0,
        a3 != 4)
    && v15->_analysisQueue)
  {
    v17 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = objc_claimAutoreleasedReturnValue();
  aggregatedResults = v15->_aggregatedResults;
  v15->_aggregatedResults = (NSMutableDictionary *)v20;

  if ((a3 & 0x20) == 0)
    goto LABEL_36;
  v22 = [VCPVideoFullFaceDetector alloc];
  v23 = *(_OWORD *)&a4->c;
  v60[0] = *(_OWORD *)&a4->a;
  v60[1] = v23;
  v60[2] = *(_OWORD *)&a4->tx;
  v24 = -[VCPVideoFullFaceDetector initWithTransform:](v22, "initWithTransform:", v60);
  faceDetector = v15->_faceDetector;
  v15->_faceDetector = (VCPVideoFullFaceDetector *)v24;

  v17 = v15->_faceDetector;
  if (v17)
  {
LABEL_36:
    if ((a3 & 0x200) == 0
      || (v26 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:]([VCPImageBlurAnalyzer alloc], "initWithFaceResults:sdof:", 0, 0), blurAnalyzer = v15->_blurAnalyzer, v15->_blurAnalyzer = v26, blurAnalyzer, (v17 = v15->_blurAnalyzer) != 0))
    {
      if ((a3 & 0x40) == 0
        || (v28 = -[VCPAudioAnalyzer initWithAnalysisTypes:forStreaming:]([VCPAudioAnalyzer alloc], "initWithAnalysisTypes:forStreaming:", 16, 1), audioAnalyzer = v15->_audioAnalyzer, v15->_audioAnalyzer = v28, audioAnalyzer, (v17 = v15->_audioAnalyzer) != 0))
      {
        analysisTypes = v15->_analysisTypes;
        if ((analysisTypes & 0x802) != 0)
        {
          v31 = [VCPVideoFaceMeshAnalyzer alloc];
          *(float *)&v32 = v15->_focalLengthInPixels;
          v33 = -[VCPVideoFaceMeshAnalyzer initWithFocalLengthInPixels:offline:isFastMode:](v31, "initWithFocalLengthInPixels:offline:isFastMode:", 0, 1, v32);
          meshAnalyzer = v15->_meshAnalyzer;
          v15->_meshAnalyzer = (VCPVideoFaceMeshAnalyzer *)v33;

          v17 = v15->_meshAnalyzer;
          if (!v17)
            goto LABEL_5;
        }
        else if ((analysisTypes & 1) != 0)
        {
          v35 = [VCPVideoFacePoseAnalyzer alloc];
          *(float *)&v36 = v15->_focalLengthInPixels;
          v37 = -[VCPVideoFacePoseAnalyzer initWithFocalLengthInPixels:](v35, "initWithFocalLengthInPixels:", v36);
          poseAnalyzer = v15->_poseAnalyzer;
          v15->_poseAnalyzer = (VCPVideoFacePoseAnalyzer *)v37;

          v17 = v15->_poseAnalyzer;
          if (!v17)
            goto LABEL_5;
        }
        v39 = v15->_analysisTypes;
        if ((v39 & 0x2198) != 0)
        {
          v40 = [VCPFullVideoAnalyzer alloc];
          v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v59[0] = *MEMORY[0x1E0C9BAA8];
          v59[1] = v41;
          v59[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v42 = -[VCPFullVideoAnalyzer initWithTransform:](v40, "initWithTransform:", v59);
          videoAnalysis = v15->_videoAnalysis;
          v15->_videoAnalysis = (VCPFullVideoAnalyzer *)v42;

          v17 = v15->_videoAnalysis;
          if (!v17)
            goto LABEL_5;
        }
        else if ((v39 & 4) != 0)
        {
          v46 = -[VCPLightMotionAnalyzer initWithQueue:turbo:]([VCPLightMotionAnalyzer alloc], "initWithQueue:turbo:", *p_analysisQueue, v7);
          lightMotionAnalyzer = v15->_lightMotionAnalyzer;
          v15->_lightMotionAnalyzer = v46;

          v17 = v15->_lightMotionAnalyzer;
          if (!v17)
            goto LABEL_5;
        }
        else if ((v39 & 0x4000) != 0)
        {
          v44 = objc_alloc_init(VCPHomeKitMotionAnalyzer);
          homeKitMotionAnalyzer = v15->_homeKitMotionAnalyzer;
          v15->_homeKitMotionAnalyzer = v44;

          v17 = v15->_homeKitMotionAnalyzer;
          if (!v17)
            goto LABEL_5;
        }
        if ((a3 & 0x400) != 0)
        {
          v48 = objc_alloc_init(VCPSceneChangeAnalyzer);
          sceneChangeAnalyzer = v15->_sceneChangeAnalyzer;
          v15->_sceneChangeAnalyzer = v48;

        }
        if ((a3 & 0x1000) != 0)
        {
          v50 = objc_alloc_init(VCPTrimAnalyzer);
          trimAnalyzer = v15->_trimAnalyzer;
          v15->_trimAnalyzer = v50;

        }
        v52 = *(_OWORD *)&a4->a;
        v53 = *(_OWORD *)&a4->tx;
        *(_OWORD *)&v15->_preferredTransform.c = *(_OWORD *)&a4->c;
        *(_OWORD *)&v15->_preferredTransform.tx = v53;
        *(_OWORD *)&v15->_preferredTransform.a = v52;
        v15->_rotationAngleForFacePose = 0;
        v15->_rotator = 0;
        v15->_rotatorForFacePose = 0;
        v54 = *(_OWORD *)&a4->c;
        v58[0] = *(_OWORD *)&a4->a;
        v58[1] = v54;
        v58[2] = *(_OWORD *)&a4->tx;
        v55 = angleForTransform(v58);
        v15->_preferredAngle = v55;
        v17 = v15;
        if (v55)
        {
          v56 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
          v57 = v56;
          if (v56)
          {
            ma::Rotator::Rotator((uint64_t)v56, v55);
            v17 = v15;
          }
          else
          {
            v17 = 0;
          }
          v15->_rotator = v57;
        }
      }
    }
  }
LABEL_5:
  v18 = v17;

  return v18;
}

- (int)prewarmWithProperties:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  VCPLightMotionAnalyzer *lightMotionAnalyzer;
  uint8_t v15[16];

  v4 = a3;
  v5 = v4;
  if (self->_preWarmed)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameWidth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "intValue");
    else
      v9 = 0;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameHeight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (v12 = objc_msgSend(v10, "intValue"), (_DWORD)v12) && (_DWORD)v9)
    {
      lightMotionAnalyzer = self->_lightMotionAnalyzer;
      if (!lightMotionAnalyzer
        || (v6 = -[VCPLightMotionAnalyzer prewarmWithWidth:height:](lightMotionAnalyzer, "prewarmWithWidth:height:", v9, v12)) == 0)
      {
        v6 = 0;
        self->_preWarmed = 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPCaptureAnalysis - missing resolution properties for prewarming", v15, 2u);
      }
      v6 = 0;
    }

  }
  return v6;
}

- (VCPCaptureAnalysisSession)init
{

  return 0;
}

- (BOOL)updatePreferredTransform:(const CGAffineTransform *)a3 properties:(id)a4
{
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  double v10;
  VCPVideoFacePoseAnalyzer *poseAnalyzer;
  VCPVideoFaceMeshAnalyzer *meshAnalyzer;
  _OWORD v14[3];

  v6 = a4;
  if (a3)
  {
    v7 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v7;
    v14[2] = *(_OWORD *)&a3->tx;
    self->_preferredAngle = angleForTransform(v14);
  }
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("focalLengthInPixels"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      *(float *)&v10 = fmaxf(*(float *)&v10, 1.0);
      if (vabds_f32(*(float *)&v10, self->_focalLengthInPixels) > 1.0)
      {
        self->_focalLengthInPixels = *(float *)&v10;
        poseAnalyzer = self->_poseAnalyzer;
        if (!poseAnalyzer
          || -[VCPVideoFacePoseAnalyzer updateFocalLengthInPixels:](poseAnalyzer, "updateFocalLengthInPixels:"))
        {
          meshAnalyzer = self->_meshAnalyzer;
          if (meshAnalyzer)
          {
            *(float *)&v10 = self->_focalLengthInPixels;
            -[VCPVideoFaceMeshAnalyzer updateFocalLengthInPixels:](meshAnalyzer, "updateFocalLengthInPixels:", v10);
          }
        }
      }
    }

  }
  return 1;
}

+ (id)aggregateAnalysisForTypes:(unint64_t)a3 withFramesMeta:(id)a4 properties:(id)a5
{
  char v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v5 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((v5 & 1) != 0)
  {
    +[VCPLightMotionAnalyzer autoLiveMotionScore:](VCPLightMotionAnalyzer, "autoLiveMotionScore:", v6);
    v10 = CFSTR("aggSubjectMotionScore");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  Rotator *rotator;
  Rotator *rotatorForFacePose;
  objc_super v5;

  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1BCCA12BC]();
  }
  rotatorForFacePose = self->_rotatorForFacePose;
  if (rotatorForFacePose)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotatorForFacePose);
    MEMORY[0x1BCCA12BC]();
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPCaptureAnalysisSession;
  -[VCPCaptureAnalysisSession dealloc](&v5, sel_dealloc);
}

- (CGAffineTransform)flipTransform:(SEL)a3
{
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform t1;

  if (a4->tx != 0.0)
    a4->tx = 1.0;
  if (a4->ty != 0.0)
    a4->ty = 1.0;
  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v6.b = 0.0;
  v6.c = 0.0;
  v6.a = 1.0;
  *(_OWORD *)&v6.d = xmmword_1B6FBCA30;
  v6.ty = 1.0;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (CGAffineTransform)transformForAngle:(SEL)a3 pixelBuffer:(int)a4
{
  uint64_t v6;
  __int128 v7;
  int Width;

  v6 = MEMORY[0x1E0C9BAA8];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  if (a5)
  {
    Width = CVPixelBufferGetWidth(a5);
    self = (CGAffineTransform *)CVPixelBufferGetHeight(a5);
    switch(a4)
    {
      case 270:
        *(_OWORD *)&retstr->a = xmmword_1B6FBCBF0;
        retstr->d = 0.0;
        retstr->tx = 0.0;
        retstr->c = 1.0;
        retstr->ty = (double)Width;
        break;
      case 180:
        retstr->a = -1.0;
        retstr->b = 0.0;
        retstr->c = 0.0;
        retstr->d = -1.0;
        retstr->tx = (double)Width;
        retstr->ty = (double)(int)self;
        break;
      case 90:
        *(_OWORD *)&retstr->a = xmmword_1B6FBD470;
        *(_OWORD *)&retstr->c = xmmword_1B6FBCA30;
        retstr->tx = (double)(int)self;
        retstr->ty = 0.0;
        break;
    }
  }
  return self;
}

- (double)rotateTransform:(uint64_t)a3 byAngle:(int)a4
{
  unint64_t v4;

  switch(a4)
  {
    case 270:
      *(float *)&v4 = -a1.f32[1];
      HIDWORD(v4) = a1.i32[0];
      a1.i64[0] = v4;
      break;
    case 180:
      a1.i64[0] = vnegq_f32(a1).u64[0];
      break;
    case 90:
      a1.i64[0] = __PAIR64__(-a1.f32[0], a1.u32[1]);
      break;
  }
  return *(double *)a1.i64;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  int v20;
  int v21;
  int rotationAngleForFacePose;
  BOOL v23;
  int v24;
  Rotator *rotatorForFacePose;
  Rotator *v26;
  Rotator *v27;
  void *v28;
  int v29;
  uint64_t v30;
  Rotator *rotator;
  Rotator *v32;
  Rotator *v33;
  __CVBuffer *v34;
  VCPFullVideoAnalyzer *videoAnalysis;
  unint64_t analysisTypes;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  VCPLightMotionAnalyzer *lightMotionAnalyzer;
  void *v56;
  void *v57;
  void *v58;
  VCPVideoFullFaceDetector *faceDetector;
  void *v60;
  VCPImageBlurAnalyzer *blurAnalyzer;
  id v62;
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  uint64_t v68;
  VCPVideoFacePoseAnalyzer *poseAnalyzer;
  double v70;
  double v71;
  double v72;
  double v73;
  VCPFaceAnchor *v74;
  VCPFaceAnchor *v75;
  void *v76;
  VCPVideoFaceMeshAnalyzer *meshAnalyzer;
  VCPFaceGeometry *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  VCPFaceAnchor *v83;
  void *v84;
  VCPFaceAnchor *v85;
  void *v86;
  VCPSceneChangeAnalyzer *sceneChangeAnalyzer;
  void *v88;
  VCPHomeKitMotionAnalyzer *homeKitMotionAnalyzer;
  void *v90;
  void *v91;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  double v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  void *v106;
  double v107;
  unsigned int v108;
  VCPFaceGeometry *v109;
  void *v112;
  __int128 v113;
  int64_t v114;
  __int128 v115;
  int64_t v116;
  __int128 v117;
  int64_t v118;
  __int128 v119;
  int64_t v120;
  __int128 v121;
  int64_t v122;
  __int128 v123;
  int64_t v124;
  _BYTE v125[48];
  CGAffineTransform v126;
  id v127;
  __int128 v128;
  int64_t v129;
  __int128 v130;
  int64_t v131;
  __int128 v132;
  int64_t v133;
  __int128 v134;
  int64_t var3;
  __int128 v136;
  int64_t v137;
  __int128 v138;
  int64_t v139;
  uint64_t v140;
  __CVBuffer *v141;
  __CVBuffer *v142;
  VCPFaceAnchor *v143;
  _QWORD v144[3];
  NSRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  v144[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("quality"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("subjectMotionScore"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("interestingnessScore"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("obstructionScore"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("trackingScore"));
  v141 = 0;
  v142 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v140 = 0;
  if (!a3)
  {
    v17 = 0;
    v16 = 0;
    v28 = 0;
    v29 = -50;
    goto LABEL_86;
  }
  if (!v10)
  {
    v108 = 0;
    v17 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceBounds"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceRollAngles"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v145 = NSRectFromString(v18);
    x = v145.origin.x;
    y = v145.origin.y;
    width = v145.size.width;
    height = v145.size.height;

  }
  v146.origin.x = x;
  v146.origin.y = y;
  v146.size.width = width;
  v146.size.height = height;
  if (CGRectIsEmpty(v146) || !objc_msgSend(v17, "count"))
  {
    v108 = 0;
  }
  else
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");
    v21 = ((v20 + 45) % 90 - v20 + 315) % 360;

    rotationAngleForFacePose = self->_rotationAngleForFacePose;
    v23 = __OFSUB__(v21, rotationAngleForFacePose);
    v24 = v21 - rotationAngleForFacePose;
    if (v24 < 0 != v23)
      v24 += 360;
    v108 = v24;
    self->_rotationAngleForFacePose = v21;
    if (v21)
    {
      rotatorForFacePose = self->_rotatorForFacePose;
      if (rotatorForFacePose)
      {
        if (v21 == rotatorForFacePose->var3)
          goto LABEL_17;
        ma::Rotator::~Rotator((ma::Rotator *)rotatorForFacePose);
        MEMORY[0x1BCCA12BC]();
      }
      v26 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
      if (!v26)
      {
        v28 = 0;
        self->_rotatorForFacePose = 0;
        v29 = -108;
        goto LABEL_86;
      }
      v27 = v26;
      ma::Rotator::Rotator((uint64_t)v26, self->_rotationAngleForFacePose);
      self->_rotatorForFacePose = v27;
    }
  }
LABEL_17:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("objects"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v28 = (void *)v30;
    objc_msgSend(v112, "setObject:forKeyedSubscript:");
    goto LABEL_21;
  }
LABEL_20:
  v28 = 0;
LABEL_21:
  rotator = self->_rotator;
  if (rotator)
  {
    v29 = ma::Rotator::Rotate((ma::Rotator *)rotator, a3, (CFTypeRef *)&v142);
    if (v29)
      goto LABEL_86;
  }
  else
  {
    v142 = (__CVBuffer *)CFRetain(a3);
  }
  if (!self->_rotationAngleForFacePose)
  {
    v34 = (__CVBuffer *)CFRetain(a3);
    goto LABEL_31;
  }
  v32 = self->_rotatorForFacePose;
  if (!v32)
    goto LABEL_85;
  v33 = self->_rotator;
  if (v33 && v32->var3 == v33->var3)
  {
    v34 = (__CVBuffer *)CFRetain(v142);
LABEL_31:
    v141 = v34;
    goto LABEL_32;
  }
  v29 = ma::Rotator::Rotate((ma::Rotator *)v32, a3, (CFTypeRef *)&v141);
  if (v29)
    goto LABEL_86;
LABEL_32:
  videoAnalysis = self->_videoAnalysis;
  if (!videoAnalysis)
  {
    lightMotionAnalyzer = self->_lightMotionAnalyzer;
    if (!lightMotionAnalyzer)
      goto LABEL_52;
    v134 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v132 = *(_OWORD *)&a5->var0;
    v133 = a5->var3;
    v29 = -[VCPLightMotionAnalyzer analyzeFrame:withTimestamp:andDuration:flags:](lightMotionAnalyzer, "analyzeFrame:withTimestamp:andDuration:flags:", v142, &v134, &v132, &v140);
    if (v29)
      goto LABEL_86;
    v56 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPLightMotionAnalyzer actionScore](self->_lightMotionAnalyzer, "actionScore");
    objc_msgSend(v56, "numberWithFloat:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v57, CFSTR("subjectMotionScore"));

    v58 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPLightMotionAnalyzer motionDivScore](self->_lightMotionAnalyzer, "motionDivScore");
    objc_msgSend(v58, "numberWithFloat:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v54, CFSTR("motionDivScore"));
    goto LABEL_51;
  }
  v138 = *(_OWORD *)&a4->var0;
  v139 = a4->var3;
  v136 = *(_OWORD *)&a5->var0;
  v137 = a5->var3;
  v29 = -[VCPFullVideoAnalyzer analyzeFrame:timestamp:duration:properties:frameStats:flags:cancel:](videoAnalysis, "analyzeFrame:timestamp:duration:properties:frameStats:flags:cancel:", v142, &v138, &v136, v112, 0, &v140, &__block_literal_global_61);
  if (v29)
    goto LABEL_86;
  analysisTypes = self->_analysisTypes;
  if ((analysisTypes & 8) != 0)
  {
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPFullVideoAnalyzer qualityScore](self->_videoAnalysis, "qualityScore");
    objc_msgSend(v37, "numberWithFloat:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, CFSTR("quality"));

    analysisTypes = self->_analysisTypes;
  }
  if ((analysisTypes & 0x2004) != 0)
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPFullVideoAnalyzer actionScore](self->_videoAnalysis, "actionScore");
    objc_msgSend(v39, "numberWithFloat:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, CFSTR("subjectMotionScore"));

    -[VCPFullVideoAnalyzer objectsMotion](self->_videoAnalysis, "objectsMotion");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[VCPFullVideoAnalyzer globalMotion](self->_videoAnalysis, "globalMotion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (!v43)
      {
        -[VCPFullVideoAnalyzer objectsMotion](self->_videoAnalysis, "objectsMotion");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "copy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v45, CFSTR("objectsMotion"));

        -[VCPFullVideoAnalyzer globalMotion](self->_videoAnalysis, "globalMotion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "copy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v47, CFSTR("globalMotion"));

      }
    }
  }
  v48 = self->_analysisTypes;
  if ((v48 & 0x10) != 0)
  {
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPFullVideoAnalyzer interestingnessScore](self->_videoAnalysis, "interestingnessScore");
    objc_msgSend(v49, "numberWithFloat:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v50, CFSTR("interestingnessScore"));

    v48 = self->_analysisTypes;
  }
  if ((v48 & 0x80) != 0)
  {
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPFullVideoAnalyzer obstructionScore](self->_videoAnalysis, "obstructionScore");
    objc_msgSend(v51, "numberWithFloat:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v52, CFSTR("obstructionScore"));

    v48 = self->_analysisTypes;
  }
  if ((v48 & 0x100) != 0)
  {
    v53 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPFullVideoAnalyzer trackingScore](self->_videoAnalysis, "trackingScore");
    objc_msgSend(v53, "numberWithFloat:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v54, CFSTR("trackingScore"));
LABEL_51:

  }
LABEL_52:
  faceDetector = self->_faceDetector;
  if (faceDetector)
  {
    v130 = *(_OWORD *)&a4->var0;
    v131 = a4->var3;
    v128 = *(_OWORD *)&a5->var0;
    v129 = a5->var3;
    v29 = -[VCPVideoAnalyzer analyzeFrame:withTimestamp:andDuration:flags:](faceDetector, "analyzeFrame:withTimestamp:andDuration:flags:", v142, &v130, &v128, &v140);
    if (v29)
      goto LABEL_86;
    -[VCPVideoFullFaceDetector frameFaceResults](self->_faceDetector, "frameFaceResults");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v60);

  }
  blurAnalyzer = self->_blurAnalyzer;
  if (blurAnalyzer)
  {
    v127 = 0;
    v29 = -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:results:cancel:](blurAnalyzer, "analyzePixelBuffer:flags:results:cancel:", v142, &v140, &v127, &__block_literal_global_381);
    v62 = v127;
    v63 = v62;
    if (v29)
    {

      goto LABEL_86;
    }
    objc_msgSend(v62, "objectForKeyedSubscript:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v63;
    v65 = objc_msgSend(v64, "count") == 0;

    if (!v65)
    {
      objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("BlurResults"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("attributes"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("sharpness"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v67, CFSTR("sharpnessScore"));
    }

  }
  if (self->_poseAnalyzer || self->_meshAnalyzer)
  {
    -[VCPCaptureAnalysisSession transformForAngle:pixelBuffer:](self, "transformForAngle:pixelBuffer:", self->_rotationAngleForFacePose, a3);
    -[VCPCaptureAnalysisSession flipTransform:](self, "flipTransform:", v125);
    v147.origin.x = x;
    v147.origin.y = y;
    v147.size.width = width;
    v147.size.height = height;
    v148 = CGRectApplyAffineTransform(v147, &v126);
    x = v148.origin.x;
    y = v148.origin.y;
    width = v148.size.width;
    height = v148.size.height;
    v68 = ((self->_preferredAngle - self->_rotationAngleForFacePose + 360) % 360);
    if (self->_poseAnalyzer && !CGRectIsEmpty(v148))
    {
      poseAnalyzer = self->_poseAnalyzer;
      v123 = *(_OWORD *)&a4->var0;
      v124 = a4->var3;
      v29 = -[VCPVideoFacePoseAnalyzer analyzeFrameForPose:withFaceRect:withTimestamp:](poseAnalyzer, "analyzeFrameForPose:withFaceRect:withTimestamp:", v141, &v123, x, y, width, height);
      if (v29)
        goto LABEL_86;
      -[VCPVideoFacePoseAnalyzer pose](self->_poseAnalyzer, "pose");
      -[VCPCaptureAnalysisSession rotateTransform:byAngle:](self, "rotateTransform:byAngle:", v68);
      v74 = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:]([VCPFaceAnchor alloc], "initWithTransform:blendShapes:geometry:", 0, 0, v70, v71, v72, v73);
      v75 = v74;
      if (!v74)
        goto LABEL_85;
      v144[0] = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v76, CFSTR("faceAnchor"));

    }
  }
  else
  {
    v68 = 0;
  }
  meshAnalyzer = self->_meshAnalyzer;
  if (!meshAnalyzer)
    goto LABEL_76;
  v121 = *(_OWORD *)&a4->var0;
  v122 = a4->var3;
  v29 = -[VCPVideoFaceMeshAnalyzer analyzeFrame:withFaceRect:withRotation:withTimestamp:](meshAnalyzer, "analyzeFrame:withFaceRect:withRotation:withTimestamp:", v141, v108, &v121, x, y, width, height);
  if (v29)
    goto LABEL_86;
  if (!-[VCPVideoFaceMeshAnalyzer isTracked](self->_meshAnalyzer, "isTracked"))
    goto LABEL_76;
  v78 = -[VCPFaceGeometry initWithVertices:vertexCount:]([VCPFaceGeometry alloc], "initWithVertices:vertexCount:", -[VCPVideoFaceMeshAnalyzer vertices](self->_meshAnalyzer, "vertices"), -[VCPVideoFaceMeshAnalyzer vertexCount](self->_meshAnalyzer, "vertexCount"));
  if (!v78)
  {
LABEL_85:
    v29 = -18;
    goto LABEL_86;
  }
  v109 = v78;
  -[VCPVideoFaceMeshAnalyzer pose](self->_meshAnalyzer, "pose");
  -[VCPCaptureAnalysisSession rotateTransform:byAngle:](self, "rotateTransform:byAngle:", v68);
  v105 = v80;
  v107 = v79;
  v101 = v82;
  v103 = v81;
  v83 = [VCPFaceAnchor alloc];
  -[VCPVideoFaceMeshAnalyzer blendShapes](self->_meshAnalyzer, "blendShapes");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:](v83, "initWithTransform:blendShapes:geometry:", v84, v109, v107, v105, v103, v101);

  if (!v85)
  {

    goto LABEL_85;
  }
  v143 = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v86, CFSTR("faceAnchor"));

LABEL_76:
  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (sceneChangeAnalyzer)
  {
    v119 = *(_OWORD *)&a4->var0;
    v120 = a4->var3;
    v117 = *(_OWORD *)&a5->var0;
    v118 = a5->var3;
    v29 = -[VCPSceneChangeAnalyzer analyzeFrame:withTimestamp:andDuration:flags:](sceneChangeAnalyzer, "analyzeFrame:withTimestamp:andDuration:flags:", v142, &v119, &v117, &v140);
    if (v29)
      goto LABEL_86;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCPSceneChangeAnalyzer isSegmentPoint](self->_sceneChangeAnalyzer, "isSegmentPoint"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v88, CFSTR("sceneChangeScore"));

  }
  homeKitMotionAnalyzer = self->_homeKitMotionAnalyzer;
  if (homeKitMotionAnalyzer)
  {
    v115 = *(_OWORD *)&a4->var0;
    v116 = a4->var3;
    v113 = *(_OWORD *)&a5->var0;
    v114 = a5->var3;
    v29 = -[VCPHomeKitMotionAnalyzer analyzeFrame:withTimestamp:andDuration:flags:](homeKitMotionAnalyzer, "analyzeFrame:withTimestamp:andDuration:flags:", v142, &v115, &v113, &v140);
    if (v29)
      goto LABEL_86;
    v90 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPHomeKitMotionAnalyzer actionScore](self->_homeKitMotionAnalyzer, "actionScore");
    objc_msgSend(v90, "numberWithFloat:");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v91, CFSTR("subjectMotionScore"));

    -[VCPHomeKitMotionAnalyzer regionsOfInterest](self->_homeKitMotionAnalyzer, "regionsOfInterest");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "count") == 0;

    if (!v93)
    {
      v94 = (void *)MEMORY[0x1E0C99D20];
      -[VCPHomeKitMotionAnalyzer regionsOfInterest](self->_homeKitMotionAnalyzer, "regionsOfInterest");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "arrayWithArray:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v96, CFSTR("regionsOfInterest"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v140);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v97, CFSTR("flags"));

  v29 = 0;
LABEL_86:
  if (v142)
    CFRelease(v142);
  if (v141)
    CFRelease(v141);
  if (a7 && v29)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCPCaptureAnalysis"), v29, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v29)
    v98 = 0;
  else
    v98 = v11;
  v99 = v98;

  return v99;
}

uint64_t __91__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_error___block_invoke()
{
  return 0;
}

uint64_t __91__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_error___block_invoke_2()
{
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 completion:(id)a7
{
  id v11;
  void *v12;
  VCPLightMotionAnalyzer *lightMotionAnalyzer;
  int v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  int64_t v19;
  __int128 v20;
  int64_t var3;

  v11 = a7;
  v12 = v11;
  if (self->_analysisQueue && (lightMotionAnalyzer = self->_lightMotionAnalyzer) != 0)
  {
    v20 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v18 = *(_OWORD *)&a5->var0;
    v19 = a5->var3;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_completion___block_invoke;
    v16[3] = &unk_1E6B19FB0;
    v17 = v11;
    -[VCPLightMotionAnalyzer analyzeFrame:withTimestamp:andDuration:completion:](lightMotionAnalyzer, "analyzeFrame:withTimestamp:andDuration:completion:", a3, &v20, &v18, v16);

    v14 = 0;
  }
  else
  {
    v14 = -18;
  }

  return v14;
}

void __96__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, float a4, float a5)
{
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("subjectMotionScore"));

  *(float *)&v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("motionDivScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("flags"));

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)analyzeAudioBuffer:(opaqueCMSampleBuffer *)a3
{
  int result;
  VCPAudioAnalyzer *audioAnalyzer;
  void *v7;
  uint64_t v8;
  void *v9;

  result = -18;
  if (a3 && self->_audioAnalyzer)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_aggregatedResults, "removeObjectForKey:", CFSTR("VoiceResults"));
    audioAnalyzer = self->_audioAnalyzer;
    if (audioAnalyzer)
    {
      result = -[VCPAudioAnalyzer analyzeSampleBuffer:](audioAnalyzer, "analyzeSampleBuffer:", a3);
      if (result)
        return result;
      audioAnalyzer = self->_audioAnalyzer;
    }
    -[VCPAudioAnalyzer voiceDetections](audioAnalyzer, "voiceDetections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[VCPAudioAnalyzer voiceDetections](self->_audioAnalyzer, "voiceDetections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregatedResults, "setObject:forKeyedSubscript:", v9, CFSTR("VoiceResults"));

    }
    return 0;
  }
  return result;
}

- (BOOL)finalizeAnalysis
{
  VCPSceneChangeAnalyzer *sceneChangeAnalyzer;
  __int128 v4;
  VCPVideoFullFaceDetector *faceDetector;
  __int128 v6;
  _OWORD v8[3];
  _OWORD v9[3];

  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (!sceneChangeAnalyzer
    || (v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16),
        v9[0] = *MEMORY[0x1E0CA2E40],
        v9[1] = v4,
        v9[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32),
        LODWORD(faceDetector) = -[VCPVideoAnalyzer finishAnalysisPass:](sceneChangeAnalyzer, "finishAnalysisPass:", v9),
        !(_DWORD)faceDetector))
  {
    faceDetector = self->_faceDetector;
    if (faceDetector)
    {
      v6 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      v8[0] = *MEMORY[0x1E0CA2E50];
      v8[1] = v6;
      v8[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
      LODWORD(faceDetector) = -[VCPVideoFullFaceDetector finishAnalysisPass:](faceDetector, "finishAnalysisPass:", v8);
    }
  }
  return (_DWORD)faceDetector == 0;
}

- (NSDictionary)aggregatedResults
{
  VCPSceneChangeAnalyzer *sceneChangeAnalyzer;
  NSMutableDictionary *aggregatedResults;
  void *v5;
  VCPVideoFullFaceDetector *faceDetector;
  NSMutableDictionary *v7;
  void *v8;

  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (sceneChangeAnalyzer)
  {
    aggregatedResults = self->_aggregatedResults;
    -[VCPSceneChangeAnalyzer results](sceneChangeAnalyzer, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](aggregatedResults, "addEntriesFromDictionary:", v5);

  }
  faceDetector = self->_faceDetector;
  if (faceDetector)
  {
    v7 = self->_aggregatedResults;
    -[VCPVideoFaceDetector results](faceDetector, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v8);

  }
  return (NSDictionary *)self->_aggregatedResults;
}

- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4
{
  id v6;
  VCPTrimAnalyzer *trimAnalyzer;
  __int128 v8;
  int v9;
  _OWORD v11[3];

  v6 = a4;
  trimAnalyzer = self->_trimAnalyzer;
  if (trimAnalyzer)
  {
    v8 = *(_OWORD *)&a3->var0.var3;
    v11[0] = *(_OWORD *)&a3->var0.var0;
    v11[1] = v8;
    v11[2] = *(_OWORD *)&a3->var1.var1;
    v9 = -[VCPTrimAnalyzer analyzeFrameWithTimeRange:analysisData:](trimAnalyzer, "analyzeFrameWithTimeRange:analysisData:", v11, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5
{
  VCPTrimAnalyzer *trimAnalyzer;
  _BOOL8 v7;
  VCPTrimAnalyzer *v10;
  __int128 v12;
  int64_t v13;
  __int128 v14;
  int64_t var3;

  trimAnalyzer = self->_trimAnalyzer;
  if (trimAnalyzer)
  {
    v7 = a5;
    LODWORD(trimAnalyzer) = -[VCPTrimAnalyzer isReady](trimAnalyzer, "isReady");
    if ((_DWORD)trimAnalyzer)
    {
      v10 = self->_trimAnalyzer;
      v14 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v12 = *(_OWORD *)&a4->var0;
      v13 = a4->var3;
      LOBYTE(trimAnalyzer) = -[VCPTrimAnalyzer shouldCutAt:stillPTS:withCut:](v10, "shouldCutAt:stillPTS:withCut:", &v14, &v12, v7);
    }
  }
  return (char)trimAnalyzer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_aggregatedResults, 0);
  objc_storeStrong((id *)&self->_homeKitMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_trimAnalyzer, 0);
  objc_storeStrong((id *)&self->_lightMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_sceneChangeAnalyzer, 0);
  objc_storeStrong((id *)&self->_faceDetector, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
  objc_storeStrong((id *)&self->_videoAnalysis, 0);
  objc_storeStrong((id *)&self->_meshAnalyzer, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

@end
