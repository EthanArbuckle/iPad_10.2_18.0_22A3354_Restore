@implementation VCPFullVideoAnalyzer

+ (BOOL)useSceneprintInSceneAnalysis
{
  return 0;
}

+ (BOOL)enableMoflow
{
  return 0;
}

- (VCPFullVideoAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  VCPFullVideoAnalyzer *v4;
  VCPFullVideoAnalyzer *v5;
  BOOL v6;
  ma::EncodeAnalysis *v7;
  ma::EncodeAnalysis *v8;
  ma::PreEncodeAnalysis *v9;
  ma::PreEncodeAnalysis *v10;
  char *v11;
  uint64_t v12;
  ma::SceneAnalysis *v13;
  int action_score_low;
  __int128 v15;
  int v16;
  MotionFilter *v17;
  MotionFilter *v18;
  ma::MetaDataAnalysis *v19;
  ma::MetaDataAnalysis *v20;
  VCPFrameScoreFilter *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  VCPMotionFlowSubtleMotionAnalyzer *v28;
  void *v29;
  void *preencodeAnalysis;
  VCPMotionFlowAnalyzer *v31;
  void *v32;
  ma::SceneAnalysis *sceneAnalysis;
  VCPFullVideoAnalyzer *v34;
  void *v36;
  void *value;
  _OWORD v38[3];
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)VCPFullVideoAnalyzer;
  v4 = -[VCPFullVideoAnalyzer init](&v39, sel_init);
  v5 = v4;
  if (!v4)
  {
    v34 = 0;
    goto LABEL_30;
  }
  LOBYTE(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  BYTE1(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  BYTE2(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  LODWORD(v4->_frameBuffer.buffer_[34].motion_result_.action_score_) = 3;
  v6 = +[VCPFullVideoAnalyzer enableMoflow](VCPFullVideoAnalyzer, "enableMoflow");
  BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = v6;
  v7 = (ma::EncodeAnalysis *)operator new(0x3B8uLL, MEMORY[0x1E0DE4E10]);
  v8 = v7;
  if (v7)
    ma::EncodeAnalysis::EncodeAnalysis(v7, (const ma::FrameBuffer *)&v5->_frameBuffer, 0, 0, v6);
  v5->_encodeAnalysis = v8;
  v9 = (ma::PreEncodeAnalysis *)operator new(0xC0uLL, MEMORY[0x1E0DE4E10]);
  v10 = v9;
  if (v9)
    ma::PreEncodeAnalysis::PreEncodeAnalysis(v9);
  v5->_preencodeAnalysis = v10;
  v11 = (char *)operator new(0x38uLL, MEMORY[0x1E0DE4E10]);
  if (v11)
  {
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    *((_QWORD *)v11 + 2) = 0;
    v12 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)(v11 + 24) = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)v11 + 5) = *(_QWORD *)(v12 + 16);
    v11[48] = 1;
    *((_DWORD *)v11 + 13) = 0;
  }
  v5->_obstructionAnalysis = v11;
  v13 = (ma::SceneAnalysis *)operator new(0x518uLL, MEMORY[0x1E0DE4E10]);
  if (v13)
  {
    action_score_low = LODWORD(v5->_frameBuffer.buffer_[34].motion_result_.action_score_);
    v15 = *(_OWORD *)&a3->c;
    v38[0] = *(_OWORD *)&a3->a;
    v38[1] = v15;
    v38[2] = *(_OWORD *)&a3->tx;
    v16 = angleForTransform(v38);
    ma::SceneAnalysis::SceneAnalysis(v13, action_score_low, v16, BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, BYTE2(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, (const ma::FrameBuffer *)&v5->_frameBuffer, +[VCPFullVideoAnalyzer useSceneprintInSceneAnalysis](VCPFullVideoAnalyzer, "useSceneprintInSceneAnalysis"));
  }
  v5->_sceneAnalysis = v13;
  v17 = (MotionFilter *)operator new(0x10uLL, MEMORY[0x1E0DE4E10]);
  v18 = v17;
  if (v17)
    ma::MotionFilter::MotionFilter((uint64_t)v17, &v5->_frameBuffer, BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), 0);
  v5->_motionFilter = v18;
  v19 = (ma::MetaDataAnalysis *)operator new(0x28uLL, MEMORY[0x1E0DE4E10]);
  v20 = v19;
  if (v19)
    ma::MetaDataAnalysis::MetaDataAnalysis(v19, &v5->_frameBuffer);
  v5->_metadataAnalysis = (MetaDataAnalysis *)v20;
  v21 = [VCPFrameScoreFilter alloc];
  LODWORD(v22) = 1120403456;
  LODWORD(v23) = 1050253722;
  v24 = -[VCPFrameScoreFilter initWithFilterTabs:distanceVariance:diffVariance:](v21, "initWithFilterTabs:distanceVariance:diffVariance:", 5, v22, v23);
  v25 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_;
  *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_ = v24;

  v26 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.residual_var_;
  *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.residual_var_ = 0;

  v27 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.action_blocks_;
  *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.action_blocks_ = 0;

  if (LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1])
    || (v28 = objc_alloc_init(VCPMotionFlowSubtleMotionAnalyzer),
        v29 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1],
        *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1] = v28,
        v29,
        (preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1]) != 0))
  {
    if (!BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1])
      || (v31 = objc_alloc_init(VCPMotionFlowAnalyzer),
          v32 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3],
          *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3] = v31,
          v32,
          (preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3]) != 0))
    {
      v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5] = 0.0;
      preencodeAnalysis = v5->_preencodeAnalysis;
      if (preencodeAnalysis)
      {
        preencodeAnalysis = v5->_encodeAnalysis;
        if (preencodeAnalysis)
        {
          preencodeAnalysis = v5->_obstructionAnalysis;
          if (preencodeAnalysis)
          {
            sceneAnalysis = (ma::SceneAnalysis *)v5->_sceneAnalysis;
            if (!sceneAnalysis)
              goto LABEL_27;
            preencodeAnalysis = v5->_motionFilter;
            if (!preencodeAnalysis)
              goto LABEL_28;
            preencodeAnalysis = v5->_metadataAnalysis;
            if (!preencodeAnalysis)
              goto LABEL_28;
            preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_;
            if (!preencodeAnalysis)
              goto LABEL_28;
            if (ma::SceneAnalysis::Initialize(sceneAnalysis, 0, 0, 1.0)
              || MotionAnalysis<ma::ObstructionSegment>::Initialize((uint64_t)v5->_obstructionAnalysis))
            {
LABEL_27:
              preencodeAnalysis = 0;
            }
            else
            {
              BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
              LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
              BYTE2(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = -1.0;
              v36 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5];
              *(_QWORD *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5] = 0;

              value = (void *)v5->_frameBuffer.buffer_[34].motion_result_.duration_.value;
              v5->_frameBuffer.buffer_[34].motion_result_.duration_.value = 0;

              preencodeAnalysis = v5;
            }
          }
        }
      }
    }
  }
LABEL_28:
  v34 = preencodeAnalysis;
LABEL_30:

  return v34;
}

- (VCPFullVideoAnalyzer)initWithVideoOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 metaOrientation:(id)a5 privateResults:(id)a6 embeddings:(id)a7 isTimelapse:(BOOL)a8 isIris:(BOOL)a9 irisPhotoOffsetSec:(float)a10 irisPhotoExposureSec:(float)a11 slowMoRate:(float)a12 faceDominated:(BOOL)a13
{
  const __CFArray *v22;
  const __CFDictionary *v23;
  id v24;
  VCPFullVideoAnalyzer *v25;
  VCPFullVideoAnalyzer *v26;
  BOOL v27;
  ma::EncodeAnalysis *v28;
  ma::EncodeAnalysis *v29;
  ma::PreEncodeAnalysis *v30;
  ma::PreEncodeAnalysis *v31;
  char *v32;
  uint64_t v33;
  ma::SceneAnalysis *v34;
  int action_score_low;
  __int128 v36;
  int v37;
  MotionFilter *v38;
  MotionFilter *v39;
  ma::MetaDataAnalysis *v40;
  ma::MetaDataAnalysis *v41;
  VCPMotionFlowSubtleMotionAnalyzer *v42;
  void *v43;
  void *preencodeAnalysis;
  VCPMotionFlowAnalyzer *v45;
  void *v46;
  ma::SceneAnalysis *sceneAnalysis;
  VCPFullVideoAnalyzer *v48;
  int v50;
  ma::IrisAnalysis *v51;
  ma::IrisAnalysis *v52;
  _OWORD v53[3];
  objc_super v54;

  v22 = (const __CFArray *)a5;
  v23 = (const __CFDictionary *)a6;
  v24 = a7;
  v54.receiver = self;
  v54.super_class = (Class)VCPFullVideoAnalyzer;
  v25 = -[VCPFullVideoAnalyzer init](&v54, sel_init);
  v26 = v25;
  if (v25)
  {
    LOBYTE(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a8;
    BYTE1(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a9;
    BYTE2(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a12 < 1.0;
    LODWORD(v25->_frameBuffer.buffer_[34].motion_result_.action_score_) = a3;
    v27 = +[VCPFullVideoAnalyzer enableMoflow](VCPFullVideoAnalyzer, "enableMoflow");
    BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = v27;
    v28 = (ma::EncodeAnalysis *)operator new(0x3B8uLL, MEMORY[0x1E0DE4E10]);
    v29 = v28;
    if (v28)
      ma::EncodeAnalysis::EncodeAnalysis(v28, (const ma::FrameBuffer *)&v26->_frameBuffer, 0, 0, v27);
    v26->_encodeAnalysis = v29;
    v30 = (ma::PreEncodeAnalysis *)operator new(0xC0uLL, MEMORY[0x1E0DE4E10]);
    v31 = v30;
    if (v30)
      ma::PreEncodeAnalysis::PreEncodeAnalysis(v30);
    v26->_preencodeAnalysis = v31;
    v32 = (char *)operator new(0x38uLL, MEMORY[0x1E0DE4E10]);
    if (v32)
    {
      *(_QWORD *)v32 = 0;
      *((_QWORD *)v32 + 1) = 0;
      *((_QWORD *)v32 + 2) = 0;
      v33 = MEMORY[0x1E0CA2E68];
      *(_OWORD *)(v32 + 24) = *MEMORY[0x1E0CA2E68];
      *((_QWORD *)v32 + 5) = *(_QWORD *)(v33 + 16);
      v32[48] = 1;
      *((_DWORD *)v32 + 13) = 0;
    }
    v26->_obstructionAnalysis = v32;
    v34 = (ma::SceneAnalysis *)operator new(0x518uLL, MEMORY[0x1E0DE4E10]);
    if (v34)
    {
      action_score_low = LODWORD(v26->_frameBuffer.buffer_[34].motion_result_.action_score_);
      v36 = *(_OWORD *)&a4->c;
      v53[0] = *(_OWORD *)&a4->a;
      v53[1] = v36;
      v53[2] = *(_OWORD *)&a4->tx;
      v37 = angleForTransform(v53);
      ma::SceneAnalysis::SceneAnalysis(v34, action_score_low, v37, BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, BYTE2(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, (const ma::FrameBuffer *)&v26->_frameBuffer, +[VCPFullVideoAnalyzer useSceneprintInSceneAnalysis](VCPFullVideoAnalyzer, "useSceneprintInSceneAnalysis"));
    }
    v26->_sceneAnalysis = v34;
    v38 = (MotionFilter *)operator new(0x10uLL, MEMORY[0x1E0DE4E10]);
    v39 = v38;
    if (v38)
      ma::MotionFilter::MotionFilter((uint64_t)v38, &v26->_frameBuffer, BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), 1);
    v26->_motionFilter = v39;
    v40 = (ma::MetaDataAnalysis *)operator new(0x28uLL, MEMORY[0x1E0DE4E10]);
    v41 = v40;
    if (v40)
      ma::MetaDataAnalysis::MetaDataAnalysis(v40, &v26->_frameBuffer);
    v26->_metadataAnalysis = (MetaDataAnalysis *)v41;
    objc_storeStrong((id *)&v26->_frameBuffer.buffer_[34].motion_result_.residual_var_, a6);
    LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = a13;
    objc_storeStrong((id *)&v26->_frameBuffer.buffer_[34].motion_result_.action_blocks_, a7);
    if (!LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v42 = objc_alloc_init(VCPMotionFlowSubtleMotionAnalyzer);
      v43 = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
      *(_QWORD *)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1] = v42;

      preencodeAnalysis = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
      if (!preencodeAnalysis)
        goto LABEL_28;
    }
    if (BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v45 = objc_alloc_init(VCPMotionFlowAnalyzer);
      v46 = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
      *(_QWORD *)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3] = v45;

      preencodeAnalysis = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
      if (!preencodeAnalysis)
        goto LABEL_28;
    }
    preencodeAnalysis = v26->_preencodeAnalysis;
    if (!preencodeAnalysis)
      goto LABEL_28;
    preencodeAnalysis = v26->_encodeAnalysis;
    if (!preencodeAnalysis)
      goto LABEL_28;
    preencodeAnalysis = v26->_obstructionAnalysis;
    if (!preencodeAnalysis)
      goto LABEL_28;
    sceneAnalysis = (ma::SceneAnalysis *)v26->_sceneAnalysis;
    if (sceneAnalysis)
    {
      preencodeAnalysis = v26->_motionFilter;
      if (!preencodeAnalysis)
        goto LABEL_28;
      preencodeAnalysis = v26->_metadataAnalysis;
      if (!preencodeAnalysis)
        goto LABEL_28;
      if (!ma::SceneAnalysis::Initialize(sceneAnalysis, v22, v23, a12))
      {
        v50 = MotionAnalysis<ma::ObstructionSegment>::Initialize((uint64_t)v26->_obstructionAnalysis);
        if (!v50)
        {
          if (!BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
            goto LABEL_35;
          v51 = (ma::IrisAnalysis *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
          if (!v51)
          {
            preencodeAnalysis = 0;
            v26->_irisAnalysis = 0;
            goto LABEL_28;
          }
          v52 = v51;
          ma::IrisAnalysis::IrisAnalysis((uint64_t)v51);
          v26->_irisAnalysis = (IrisAnalysis *)v52;
          v50 = ma::IrisAnalysis::Initialize(v52, a10, a11);
          if (!v50)
          {
LABEL_35:
            v50 = 0;
            BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
            LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
            BYTE2(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
          }
        }
        if (v50)
          preencodeAnalysis = 0;
        else
          preencodeAnalysis = v26;
        goto LABEL_28;
      }
      preencodeAnalysis = 0;
    }
    else
    {
      preencodeAnalysis = 0;
    }
LABEL_28:
    v48 = preencodeAnalysis;
    goto LABEL_29;
  }
  v48 = 0;
LABEL_29:

  return v48;
}

- (void)dealloc
{
  ma::EncodeAnalysis *encodeAnalysis;
  ma::PreEncodeAnalysis *preencodeAnalysis;
  void *obstructionAnalysis;
  const __CFArray **v6;
  char *sceneAnalysis;
  const __CFArray **v8;
  MotionFilter *motionFilter;
  MetaDataAnalysis *metadataAnalysis;
  IrisAnalysis *irisAnalysis;
  objc_super v12;

  encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
  if (encodeAnalysis)
  {
    ma::EncodeAnalysis::~EncodeAnalysis(encodeAnalysis);
    MEMORY[0x1BCCA12BC]();
  }
  preencodeAnalysis = (ma::PreEncodeAnalysis *)self->_preencodeAnalysis;
  if (preencodeAnalysis)
  {
    ma::PreEncodeAnalysis::~PreEncodeAnalysis(preencodeAnalysis);
    MEMORY[0x1BCCA12BC]();
  }
  obstructionAnalysis = self->_obstructionAnalysis;
  if (obstructionAnalysis)
  {
    v6 = MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)obstructionAnalysis);
    MEMORY[0x1BCCA12BC](v6, 0x1020C40E918D4D9);
  }
  sceneAnalysis = (char *)self->_sceneAnalysis;
  if (sceneAnalysis)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)(sceneAnalysis + 1272));
    MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)(sceneAnalysis + 1200));
    ma::QualityAnalysis::~QualityAnalysis((ma::QualityAnalysis *)(sceneAnalysis + 984));
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)(sceneAnalysis + 952));
    MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)(sceneAnalysis + 896));
    ma::MovingObjectAnalysis::~MovingObjectAnalysis((ma::MovingObjectAnalysis *)(sceneAnalysis + 832));
    ma::DescriptorAnalysis::~DescriptorAnalysis((ma::DescriptorAnalysis *)(sceneAnalysis + 760));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 672));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 584));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 496));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 408));
    ma::CameraMotionAnalysis::~CameraMotionAnalysis((ma::CameraMotionAnalysis *)(sceneAnalysis + 80));
    v8 = MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)sceneAnalysis);
    MEMORY[0x1BCCA12BC](v8, 0x1060C40189E915CLL);
  }
  motionFilter = self->_motionFilter;
  if (motionFilter)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)motionFilter);
    MEMORY[0x1BCCA12BC]();
  }
  metadataAnalysis = self->_metadataAnalysis;
  if (metadataAnalysis)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)metadataAnalysis);
    MEMORY[0x1BCCA12BC]();
  }
  irisAnalysis = self->_irisAnalysis;
  if (irisAnalysis)
  {
    ma::IrisAnalysis::~IrisAnalysis((ma::IrisAnalysis *)irisAnalysis);
    MEMORY[0x1BCCA12BC]();
  }
  v12.receiver = self;
  v12.super_class = (Class)VCPFullVideoAnalyzer;
  -[VCPFullVideoAnalyzer dealloc](&v12, sel_dealloc);
}

- (int)seedAnalyzersWithPixelBuffer:(__CVBuffer *)a3 startTime:(id *)a4 frameStats:(id)a5
{
  id v8;
  int Width;
  int Height;
  int v11;
  int v13;
  ma::SceneAnalysis *sceneAnalysis;
  VCPVideoActivityDescriptor *v15;
  int v16;
  uint64_t v17;
  int v18;
  VCPVideoActivityDescriptor *v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v8 = a5;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (self->_frameBuffer.frame_count_ || !LODWORD(self->_frameBuffer.buffer_[34].motion_result_.action_score_))
  {
    v11 = -50;
  }
  else
  {
    v13 = Height;
    ma::PreEncodeAnalysis::Initialize((uint64_t)self->_preencodeAnalysis, Width, Height);
    sceneAnalysis = (ma::SceneAnalysis *)self->_sceneAnalysis;
    v21 = *a4;
    ma::SceneAnalysis::SetStartTime(sceneAnalysis, (CMTime *)&v21);
    v15 = [VCPVideoActivityDescriptor alloc];
    v16 = Width + 15;
    if (Width < -15)
      v16 = Width + 30;
    v17 = (v16 >> 4);
    v18 = v13 + 15;
    if (v13 < -15)
      v18 = v13 + 30;
    v19 = -[VCPVideoActivityDescriptor initWithFrameWidthInMb:heightInMb:](v15, "initWithFrameWidthInMb:heightInMb:", v17, (v18 >> 4));
    objc_msgSend(v8, "setVideoActivityDescriptor:", v19);

    if (ma::Histogram::InitializeAsIdealExposureHistogram((ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_, v13 * Width))
    {
      v11 = -18;
    }
    else
    {
      objc_msgSend(v8, "videoActivityDescriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v11 = 0;
      else
        v11 = -108;
    }
  }

  return v11;
}

- (void)prepareVideoAnalysisByScenes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  float v12;
  _BOOL4 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(&unk_1E6B76158, "containsObject:", v10, (_QWORD)v14))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "floatValue");
            v13 = v12 > 0.1;

            if (v13)
            {
              BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
              goto LABEL_13;
            }
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)prepareLivePhotoAnalysisByScenes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  float v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  float v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  float v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5] = 0.0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(&unk_1E6B76170, "containsObject:", v10, (_QWORD)v23))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "floatValue");
            v13 = v12 > 0.1;

            if (v13)
            {
              LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]) = 1;
              goto LABEL_13;
            }
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

    objc_msgSend(v6, "objectForKey:", CFSTR("flag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16 > 0.1;

      if (v17)
      {
        v18 = 2;
LABEL_19:
        LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]) = v18;
        goto LABEL_20;
      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("candle"), (_QWORD)v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21 > 0.1;

      if (v22)
      {
        v18 = 3;
        goto LABEL_19;
      }
    }
  }
LABEL_20:

}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 cancel:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a4;
  v9 = *a5;
  return -[VCPFullVideoAnalyzer analyzeFrame:timestamp:duration:properties:frameStats:flags:cancel:](self, "analyzeFrame:timestamp:duration:properties:frameStats:flags:cancel:", a3, &v10, &v9, 0, a6, a7, a8);
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 properties:(id)a6 frameStats:(id)a7 flags:(unint64_t *)a8 cancel:(id)a9
{
  void *v13;
  VCPVideoActivityDescriptor *v14;
  int v15;
  uint64_t v16;
  int v17;
  VCPVideoActivityDescriptor *v18;
  int Descriptor;
  char *Next;
  id v21;
  uint64_t v22;
  uint64_t v23;
  const std::nothrow_t *v24;
  uint64_t i;
  void *v26;
  ma::Object *v27;
  ma::Object *v28;
  double v29;
  NSString *v30;
  CGFloat x;
  CGFloat y;
  CGFloat v33;
  CGFloat v34;
  ma::Object *v35;
  int v36;
  void *v37;
  unsigned int v38;
  ma::EncodeAnalysis *encodeAnalysis;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  float v44;
  float v45;
  __int128 v46;
  unsigned int v47;
  double v49;
  void *v50;
  int v51;
  Frame *v52;
  Frame *v53;
  double v54;
  const __CFArray **obstructionAnalysis;
  const ma::EncodeStats *EncodeStats;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  float v63;
  float v64;
  CFIndex j;
  const __CFArray *v66;
  unsigned int **ValueAtIndex;
  unsigned int *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  int64_t v79;
  void *value;
  void *v81;
  VCPFullVideoAnalyzer *v82;
  ma::FrameBuffer *p_frameBuffer;
  char *v84;
  size_t Height;
  size_t Width;
  void *v89;
  id v90;
  id v91;
  id v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  __int128 v99;
  int64_t v100;
  __int128 v101;
  int64_t v102;
  CMTime v103;
  __int128 v104;
  int64_t v105;
  __int128 v106;
  int64_t var3;
  CMTime v108;
  CMTime v109;
  uint8_t buf[8];
  ma::Object *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  int64_t v117;
  _QWORD v118[2];
  _QWORD v119[2];
  _BYTE v120[128];
  uint64_t v121;
  NSRect v122;

  v121 = *MEMORY[0x1E0C80C00];
  v91 = a6;
  v92 = a7;
  v90 = a9;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (self->_frameBuffer.frame_count_)
  {
    objc_msgSend(v92, "videoActivityDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = [VCPVideoActivityDescriptor alloc];
      v15 = Width + 15;
      if ((int)Width < -15)
        v15 = Width + 30;
      v16 = (v15 >> 4);
      v17 = Height + 15;
      if ((int)Height < -15)
        v17 = Height + 30;
      v18 = -[VCPVideoActivityDescriptor initWithFrameWidthInMb:heightInMb:](v14, "initWithFrameWidthInMb:heightInMb:", v16, (v17 >> 4));
      objc_msgSend(v92, "setVideoActivityDescriptor:", v18);

    }
LABEL_9:
    p_frameBuffer = (ma::FrameBuffer *)&self->_frameBuffer;
    Next = ma::FrameBuffer::GetNext((ma::FrameBuffer *)&self->_frameBuffer);
    objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("objects"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      v84 = Next;
      v82 = self;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v21 = v89;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v113;
        v24 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v113 != v23)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            v111 = 0;
            v27 = (ma::Object *)operator new(0x60uLL, v24);
            if (!v27)
            {
              v111 = 0;
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate memory", buf, 2u);
              }
              Descriptor = -108;
              goto LABEL_36;
            }
            v28 = v27;
            *(_QWORD *)&v29 = ma::Object::Object(v27).n128_u64[0];
            v111 = v28;
            objc_msgSend(v21, "objectForKeyedSubscript:", v26, v29);
            v30 = (NSString *)objc_claimAutoreleasedReturnValue();
            v122 = NSRectFromString(v30);
            x = v122.origin.x;
            y = v122.origin.y;
            v33 = v122.size.width;
            v34 = v122.size.height;

            v35 = v111;
            *((CGFloat *)v111 + 1) = x;
            *((CGFloat *)v35 + 2) = y;
            *((CGFloat *)v35 + 3) = v33;
            *((CGFloat *)v35 + 4) = v34;
            *(_DWORD *)v35 = objc_msgSend(v26, "intValue");
            Descriptor = Vector<ma::Object *>::PushBack((CFMutableArrayRef *)v84 + 41, &v111);
            if (Descriptor)
            {
              if (v111)
                MEMORY[0x1BCCA12BC](v111, 0x1000C40E841BE39);
              goto LABEL_36;
            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v22)
            continue;
          break;
        }
      }

      self = v82;
      Next = v84;
    }
    v109 = (CMTime)*a4;
    v108 = (CMTime)*a5;
    ma::Frame::Initialize((ma::Frame *)Next, &v109, &v108, a3, 1);
    Descriptor = v36;
    if (v36)
      goto LABEL_37;
    if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v37 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
      v106 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v104 = *(_OWORD *)&a5->var0;
      v105 = a5->var3;
      objc_msgSend(v37, "analyzePixelBuffer:withFrame:withTimestamp:andDuration:cancel:", a3, Next, &v106, &v104, v90);
    }
    v38 = *(_DWORD *)a8;
    encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
    v103 = (CMTime)*a4;
    Descriptor = ma::EncodeAnalysis::ProcessFrame(encodeAnalysis, &v103, a3, (ma::Frame *)Next, BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), (v38 >> 5) & 1 | BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_));
    if (Descriptor)
      goto LABEL_37;
    if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v40 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
      v101 = *(_OWORD *)&a4->var0;
      v102 = a4->var3;
      v99 = *(_OWORD *)&a5->var0;
      v100 = a5->var3;
      objc_msgSend(v40, "analyzePixelBuffer:withFrame:withTimestamp:andDuration:hasSubtleScene:cancel:", a3, Next, &v101, &v99, LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]), v90);
    }
    if (ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis))
    {
      objc_msgSend(v92, "detectedFaces");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count") == 0;

      if (!v42)
      {
        objc_msgSend(v92, "detectedFaces");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPFullVideoAnalyzer estimateExpressionScore:encodeStats:frameWidth:frameHeight:](self, "estimateExpressionScore:encodeStats:frameWidth:frameHeight:", v43, ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis), Width, Height);
        v45 = v44;

        v46 = *(_OWORD *)(Next + 4);
        v98 = *(_QWORD *)(Next + 20);
        v97 = v46;
        if (-[VCPFullVideoAnalyzer isStableMetaMotion:](self, "isStableMetaMotion:", &v97) < 0)
        {
          v47 = 0;
          Next[196] = 0;
        }
        else
        {
          v47 = Next[196];
        }
        objc_msgSend(v92, "frameExpressionScore");
        if (v45 >= *(float *)&v49)
          *(float *)&v49 = v45;
        *(float *)&v49 = *(float *)&v49 * (float)v47;
        objc_msgSend(v92, "setFrameExpressionScore:", v49);
      }
    }
    if (!BYTE2(self->_frameBuffer.buffer_[34].motion_result_.track_score_))
    {
      +[VCPSaliencyRegion salientRegionsFromPixelBuffer:](VCPSaliencyRegion, "salientRegionsFromPixelBuffer:", a3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPFullVideoAnalyzer reviseFrameTrackScore:saliencyRegions:](self, "reviseFrameTrackScore:saliencyRegions:", Next, v50);

    }
    if (BYTE2(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
    {
      Descriptor = ma::SlowMotionAnalysis::ProcessFrame((ma::SlowMotionAnalysis *)((char *)self->_sceneAnalysis + 1200), (const ma::Frame *)Next);
      if (Descriptor)
        goto LABEL_37;
    }
    if (!*(_DWORD *)Next)
      *((_BYTE *)self->_sceneAnalysis + 64) = *(_BYTE *)(*((_QWORD *)self->_encodeAnalysis + 12) + 173);
    if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
    {
      Descriptor = ma::DescriptorAnalysis::GenerateDescriptor((ma::DescriptorAnalysis *)((char *)self->_sceneAnalysis + 760), a3, (ma::Frame *)Next);
      if (Descriptor)
        goto LABEL_37;
    }
    if (BYTE2(self->_frameBuffer.buffer_[34].motion_result_.track_score_))
    {
      -[VCPFullVideoAnalyzer processAndEstimateQualityScore:](self, "processAndEstimateQualityScore:", Next);
      v51 = *(_DWORD *)p_frameBuffer - 1;
      if (*(int *)p_frameBuffer > 1)
      {
        v52 = (Frame *)ma::FrameBuffer::Get(p_frameBuffer, *(_DWORD *)p_frameBuffer - 2);
        v53 = (Frame *)ma::FrameBuffer::Get(p_frameBuffer, v51);
        Descriptor = ma::SceneAnalysis::ProcessFrame((ma::SceneAnalysis *)self->_sceneAnalysis, v52, v53);
        if (Descriptor)
          goto LABEL_37;
      }
      if (ma::CameraMotionAnalysis::isCurrentSegmentStable((ma::CameraMotionSegment **)self->_sceneAnalysis + 10)
        || ma::Translation::AbsSum((ma::Translation *)(Next + 52)) < 25.0)
      {
        *((_DWORD *)Next + 46) = 0;
      }
    }
    else if (*(int *)p_frameBuffer >= 6)
    {
      Descriptor = -[VCPFullVideoAnalyzer process:](self, "process:", (*(_DWORD *)p_frameBuffer - 5));
      if (Descriptor)
        goto LABEL_37;
    }
    if (!ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis) || *(int *)p_frameBuffer < 2)
    {
LABEL_66:
      if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)
        && *(_QWORD *)(*((_QWORD *)self->_encodeAnalysis + 12) + 32)
        && *(_DWORD *)Next)
      {
        objc_msgSend(v92, "videoActivityDescriptor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "ExtractActivityDescriptorFromStats:", ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis));

      }
      LODWORD(v54) = *((_DWORD *)Next + 19);
      objc_msgSend(v92, "setCameraMotionScore:", v54);
      v58 = 176;
      if (!*(_QWORD *)(*((_QWORD *)self->_encodeAnalysis + 12) + 32))
        v58 = 180;
      LODWORD(v57) = *(_DWORD *)&Next[v58];
      objc_msgSend(v92, "setSubjectActionScore:", v57);
      LODWORD(v59) = *((_DWORD *)Next + 48);
      objc_msgSend(v92, "setSubtleMotionScore:", v59);
      LODWORD(v60) = *((_DWORD *)Next + 86);
      objc_msgSend(v92, "setInterestingnessScore:", v60);
      LODWORD(v61) = *((_DWORD *)Next + 88);
      objc_msgSend(v92, "setColorfulnessScore:", v61);
      objc_msgSend(v92, "setFrameProcessedByVideoAnalyzer:", Next[208]);
      objc_msgSend(v92, "setSubMbMotionAvailable:", *(_QWORD *)(*((_QWORD *)self->_encodeAnalysis + 12) + 32) != 0);
      -[VCPFullVideoAnalyzer computeExposureScoreOfFrame:](self, "computeExposureScoreOfFrame:", Next);
      objc_msgSend(v92, "setExposureScore:");
      v95 = *(_OWORD *)(Next + 228);
      v96 = *(_QWORD *)(Next + 244);
      objc_msgSend(v92, "setMotionParam:", &v95);
      v93 = *(_OWORD *)(Next + 252);
      v94 = *(_QWORD *)(Next + 268);
      objc_msgSend(v92, "setMotionParamDiff:", &v93);
      self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = ma::QualityAnalysis::currentSegmentScore((ma::QualitySegment **)self->_sceneAnalysis+ 123);
      self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = ma::FineSubjectMotionAnalysis::currentSegmentScore((ma::FineSubjectMotionAnalysis *)((char *)self->_sceneAnalysis + 496), *(_DWORD *)Next);
      LODWORD(v62) = *((_DWORD *)Next + 46);
      objc_msgSend(*(id *)&self->_frameBuffer.buffer_[34].motion_result_.valid_mb_, "processFrameScore:validScore:", Next[208], v62);
      self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4] = v63;
      objc_msgSend(v92, "interestingnessScore");
      self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = v64;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      for (j = 0; ; ++j)
      {
        v66 = (const __CFArray *)*((_QWORD *)Next + 41);
        if (v66)
          LODWORD(v66) = CFArrayGetCount(v66);
        if (j >= (int)v66)
          break;
        ValueAtIndex = (unsigned int **)CFArrayGetValueAtIndex(*((CFArrayRef *)Next + 41), j);
        v68 = *ValueAtIndex;
        LODWORD(v69) = (*ValueAtIndex)[21];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v70;
        LODWORD(v71) = v68[22];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v68);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v73, v74);

      }
      objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5], v21);
      *(float *)&v75 = *((float *)Next + 55) * 0.25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v76;
      *(float *)&v77 = *((float *)Next + 56) * 0.25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v78;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
      v79 = objc_claimAutoreleasedReturnValue();
      value = (void *)self->_frameBuffer.buffer_[34].motion_result_.duration_.value;
      self->_frameBuffer.buffer_[34].motion_result_.duration_.value = v79;

      Descriptor = 0;
LABEL_36:

      goto LABEL_37;
    }
    obstructionAnalysis = (const __CFArray **)self->_obstructionAnalysis;
    EncodeStats = (const ma::EncodeStats *)ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis);
    Descriptor = ma::ObstructionAnalysis::ProcessFrame(obstructionAnalysis, (const ma::Frame *)Next, EncodeStats);
    if (!Descriptor)
    {
      self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = *((float *)self->_obstructionAnalysis
                                                                                     + 13);
      goto LABEL_66;
    }
LABEL_37:

    goto LABEL_38;
  }
  v116 = *(_OWORD *)&a4->var0;
  v117 = a4->var3;
  Descriptor = -[VCPFullVideoAnalyzer seedAnalyzersWithPixelBuffer:startTime:frameStats:](self, "seedAnalyzersWithPixelBuffer:startTime:frameStats:", a3, &v116, v92);
  if (!Descriptor)
    goto LABEL_9;
LABEL_38:

  return Descriptor;
}

- (int)isStableMetaMotion:(id *)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFDictionary *v10;
  int v11;
  void *v12;
  float v13;
  float v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  CMTimeRange range;
  CMTimeRange v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  objc_msgSend(*(id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(const __CFDictionary **)(*((_QWORD *)&v19 + 1) + 8 * i);
        memset(&v18, 0, sizeof(v18));
        CMTimeRangeMakeFromDictionary(&v18, v10);
        range = v18;
        v16 = *a3;
        if (CMTimeRangeContainsTime(&range, (CMTime *)&v16))
        {
          -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("quality"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatValue");
          v14 = v13;

          if (v14 < 10.0)
            v11 = 1;
          else
            v11 = -1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (float)estimateExpressionScore:(id)a3 encodeStats:(EncodeStats *)a4 frameWidth:(int)a5 frameHeight:(int)a6
{
  id v7;
  int var25;
  int var26;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  float v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int v34;
  float v35;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGAffineTransform v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  var25 = a4->var25;
  var26 = a4->var26;
  v11 = var25 + 15;
  v10 = var25 < -15;
  v12 = var25 + 30;
  if (!v10)
    v12 = v11;
  v37 = v12;
  v13 = var26 + 15;
  v38 = 0u;
  v39 = 0u;
  if (var26 >= -15)
    v14 = var26 + 15;
  else
    v14 = var26 + 30;
  v40 = 0uLL;
  v41 = 0uLL;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "bounds");
        v42.b = 0.0;
        v42.c = 0.0;
        v42.a = 1.0;
        *(_OWORD *)&v42.d = xmmword_1B6FBCA30;
        v42.ty = 1.0;
        v46 = CGRectApplyAffineTransform(v45, &v42);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
    }
    while (v16);
  }

  v19 = v13 / 64;
  if (v13 / 64 >= 3 * (v14 >> 4) / 4)
  {
    v35 = NAN;
  }
  else
  {
    v20 = v37 >> 4;
    if (v11 >= 0)
      v21 = v11;
    else
      v21 = v11 + 63;
    v22 = v21 >> 6;
    v23 = 3 * v20 + 3;
    if (3 * v20 >= 0)
      v23 = 3 * v20;
    v24 = v23 >> 2;
    v25 = (uint64_t)v21 >> 6;
    v26 = v19;
    v27 = 2 * (v25 + v19 * (uint64_t)v20);
    v28 = 2 * v20;
    v29 = ((uint64_t)v23 >> 2) - v22;
    v30 = 0.0;
    v31 = 0.0;
    do
    {
      if (v22 < v24)
      {
        v32 = (unsigned __int16 *)((char *)a4->var19 + v27);
        v33 = v29;
        do
        {
          v34 = *v32++;
          v31 = v31 + (float)((float)v34 / 1000.0);
          v30 = v30 + 1.0;
          --v33;
        }
        while (v33);
      }
      ++v26;
      v27 += v28;
    }
    while (v26 != 3 * (v14 >> 4) / 4);
    v35 = (float)(v31 / v30) + -1000.0;
  }

  return v35 / 2500.0;
}

- (int)finishAnalysisPass:(id *)a3
{
  FrameBuffer *p_frameBuffer;
  int frame_count;
  int result;
  int v7;
  uint64_t v8;
  const ma::Frame *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  p_frameBuffer = &self->_frameBuffer;
  frame_count = self->_frameBuffer.frame_count_;
  if (!frame_count || LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.track_score_))
    return -18;
  if (frame_count <= 5)
    v7 = 5;
  else
    v7 = self->_frameBuffer.frame_count_;
  v8 = (v7 - 4);
  if ((int)v8 >= frame_count)
  {
LABEL_11:
    v9 = (const ma::Frame *)ma::FrameBuffer::Get((ma::FrameBuffer *)p_frameBuffer, frame_count - 1);
    result = ma::PreEncodeAnalysis::Finalize((ma::PreEncodeAnalysis *)self->_preencodeAnalysis, v9);
    if (!result)
    {
      result = ma::ObstructionAnalysis::Finalize((CFArrayRef *)self->_obstructionAnalysis, v9);
      if (!result)
      {
        result = ma::SceneAnalysis::Finalize((const __CFArray **)self->_sceneAnalysis, v9, frame_count, (CFArrayRef *)self->_obstructionAnalysis);
        if (!result)
        {
          LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
          *(_QWORD *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_ = v10;

          if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
          {
            result = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("MetaMotionProcessedResults"), *(_QWORD *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_, 1);
            if (!result)
              return result;
            v12 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
            *(_QWORD *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_ = 0;

          }
          return 0;
        }
      }
    }
  }
  else
  {
    while (1)
    {
      result = -[VCPFullVideoAnalyzer process:](self, "process:", v8);
      if (result)
        break;
      v8 = (v8 + 1);
      if (frame_count == (_DWORD)v8)
        goto LABEL_11;
    }
  }
  return result;
}

- (int)process:(int)a3
{
  FrameBuffer *p_frameBuffer;
  Frame *v6;
  uint64_t v7;
  int result;

  if (a3 < 1)
    return -50;
  p_frameBuffer = &self->_frameBuffer;
  if (self->_frameBuffer.frame_count_ <= a3)
    return -50;
  v6 = (Frame *)ma::FrameBuffer::Get((ma::FrameBuffer *)&self->_frameBuffer, a3 - 1);
  v7 = ma::FrameBuffer::Get((ma::FrameBuffer *)p_frameBuffer, a3);
  if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
    ma::MotionFilter::ProcessMotion((ma::FrameBuffer **)self->_motionFilter, a3, (ma::Translation *)(v7 + 52), 2);
  ma::MetaDataAnalysis::EstimateMetadataFromMotion((ma::MetaDataAnalysis *)self->_metadataAnalysis, a3, (const ma::Translation *)(v7 + 52), BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_));
  if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)
    || (result = ma::IrisAnalysis::UpdateStats((ma::IrisAnalysis *)self->_irisAnalysis, v6, (const Frame *)v7)) == 0)
  {
    ma::PreEncodeAnalysis::ProcessFrame((ma::PreEncodeAnalysis *)self->_preencodeAnalysis, (const ma::Frame *)v7);
    return ma::SceneAnalysis::ProcessFrame((ma::SceneAnalysis *)self->_sceneAnalysis, v6, (Frame *)v7);
  }
  return result;
}

- (void)processAndEstimateQualityScore:(void *)a3
{
  int frame_count;
  int v6;

  if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
  {
    frame_count = self->_frameBuffer.frame_count_;
    if (frame_count >= 1)
      ma::MotionFilter::ProcessMotion((ma::FrameBuffer **)self->_motionFilter, frame_count - 1, (ma::Translation *)((char *)a3 + 52), 2);
  }
  ma::MetaDataAnalysis::EstimateMetadataFromMotion((ma::MetaDataAnalysis *)self->_metadataAnalysis, self->_frameBuffer.frame_count_ - 1, (const ma::Translation *)((char *)a3 + 52), 1);
  -[VCPFullVideoAnalyzer estimateQualityScore:](self, "estimateQualityScore:", a3);
  *((_DWORD *)a3 + 19) = v6;
}

- (id)processSceneResults
{
  void *v3;
  void *v4;
  unint64_t i;
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("SceneResults"), v3, 0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SceneResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v4, "count"); ++i)
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(v4, "objectAtIndexedSubscript:", i);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v13, v6);

    v7 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_;
    v12 = v13;
    objc_msgSend(v7, "getEmbeddingsForRange:useFP16:", &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("embeddings"));
    }

  }
  return v4;
}

- (float)estimateQualityScore:(void *)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  if (ma::Histogram::NoInfo((ma::Histogram *)((char *)a3 + 360)) || *((_BYTE *)a3 + 108))
    return 0.0;
  v5 = ma::Translation::AbsSum((ma::Translation *)((char *)a3 + 52));
  v6 = expf(v5 * -0.07);
  v7 = ma::Translation::AbsSum((ma::Translation *)((char *)a3 + 112));
  v8 = expf(v7 * -10.0);
  v9 = 0.0;
  v10 = fmaxf(v8, 0.0);
  if (v6 > 0.0)
    v9 = v6 * 0.7;
  return v9 + (float)(v10 * 0.3);
}

- (id)results
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("CameraMotionResults"), v3, 0);
  if (v4)
    goto LABEL_4;
  v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("SubjectMotionResults"), v3, 0);
  if (v4)
    goto LABEL_4;
  v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("QualityResults"), v3, 0);
  if (v4)
    goto LABEL_4;
  if (*(_QWORD *)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_)
  {
    -[VCPFullVideoAnalyzer processSceneResults](self, "processSceneResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("SceneResults"));

  }
  else
  {
    v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("SceneResults"), v3, 0);
    if (v4)
      goto LABEL_4;
  }
  if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
  {
    v4 = -[VCPFullVideoAnalyzer addResult:to:forKey:optional:](self, "addResult:to:forKey:optional:", ma::IrisAnalysis::GetBoundBoxResults((ma::IrisAnalysis *)self->_irisAnalysis), v3, CFSTR("IrisObjectsResults"), 1);
  }
  else
  {
    v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("FeatureVectorResults"), v3, 0);
    if (v4)
      goto LABEL_4;
    v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("SceneprintResults"), v3, 0);
  }
  if (!v4)
  {
    v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("FineSubjectMotionResults"), v3, 1);
    if (!v4)
    {
      v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("SubtleMotionResults"), v3, 1);
      if (!v4)
      {
        v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("MovingObjectsResults"), v3, 1);
        if (!v4)
        {
          v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("OrientationResults"), v3, 1);
          if (!v4)
          {
            v4 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:optional:](self, "addSceneAnalysisResult:to:optional:", CFSTR("InterestingnessResults"), v3, 1);
            if (!v4)
            {
              v4 = -[VCPFullVideoAnalyzer addResult:to:forKey:optional:](self, "addResult:to:forKey:optional:", *((_QWORD *)self->_obstructionAnalysis + 2), v3, CFSTR("ObstructionResults"), 1);
              if (!v4)
                v4 = -[VCPFullVideoAnalyzer addResult:to:forKey:optional:](self, "addResult:to:forKey:optional:", ma::PreEncodeAnalysis::GetResults((ma::PreEncodeAnalysis *)self->_preencodeAnalysis), v3, CFSTR("PreEncodeResults"), 1);
            }
          }
        }
      }
    }
  }
LABEL_4:
  if (v4)
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

- (id)privateResults
{
  return *(id *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
}

- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 optional:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  int v10;
  CFTypeRef cf;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  cf = 0;
  v10 = ma::SceneAnalysis::CopyProperty((ma::SceneAnalysis *)self->_sceneAnalysis, v8, 0, (CFArrayRef *)&cf);
  if (!v10)
    v10 = -[VCPFullVideoAnalyzer addResult:to:forKey:optional:](self, "addResult:to:forKey:optional:", cf, v9, v8, v5);
  if (cf)
    CFRelease(cf);

  return v10;
}

- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 clipRange:(id *)a5
{
  id v8;
  id v9;
  CFArrayRef *sceneAnalysis;
  __int128 v11;
  int v12;
  CMTimeRange v14;
  CFArrayRef v15;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  sceneAnalysis = (CFArrayRef *)self->_sceneAnalysis;
  v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v14.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v14.start.epoch = v11;
  *(_OWORD *)&v14.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v12 = ma::SceneAnalysis::CopyProperty(sceneAnalysis, &v14, v8, 0, &v15);
  if (!v12)
    v12 = -[VCPFullVideoAnalyzer addResult:to:forKey:optional:](self, "addResult:to:forKey:optional:", v15, v9, v8, 0);
  if (v15)
    CFRelease(v15);

  return v12;
}

- (int)addResult:(__CFArray *)a3 to:(id)a4 forKey:(id)a5 optional:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  int v11;
  int v12;
  CFArrayRef Copy;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (a3)
    v11 = 1;
  else
    v11 = v6;
  if (v11)
    v12 = 0;
  else
    v12 = -50;
  if (a3)
  {
    Copy = CFArrayCreateCopy(0, a3);
    objc_msgSend(v9, "setObject:forKey:", Copy, v10);

    v12 = 0;
  }

  return v12;
}

- (float)getSceneSwichFrequency
{
  float *sceneAnalysis;

  sceneAnalysis = (float *)self->_sceneAnalysis;
  if (sceneAnalysis)
    return sceneAnalysis[14];
  else
    return 0.0;
}

- (void)setNextCaptureFrame:(__CVBuffer *)a3
{
  *((_QWORD *)self->_sceneAnalysis + 158) = a3;
}

- (void)reviseFrameTrackScore:(void *)a3 saliencyRegions:(id)a4
{
  id v5;
  CFIndex v6;
  char v7;
  const __CFArray *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = (const __CFArray *)*((_QWORD *)a3 + 39);
    if (v8)
      LODWORD(v8) = CFArrayGetCount(v8);
    if (v6 >= (int)v8)
      break;
    v9 = *(_QWORD *)CFArrayGetValueAtIndex(*((CFArrayRef *)a3 + 39), v6);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bound");
          if (CGRectIntersectsRect(v20, *(CGRect *)(v9 + 8)))
          {
            v7 = 1;
            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

    ++v6;
  }
  if ((v7 & 1) == 0)
    *((_DWORD *)a3 + 46) = 0;

}

- (float)computeExposureScoreOfFrame:(void *)a3
{
  return ma::Histogram::EarthMoverDistance((ma::Histogram *)((char *)a3 + 360), (const ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_, 0);
}

- (id)clipResults:(id *)a3
{
  void *v5;
  __int128 v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  id v13;
  _OWORD v15[3];
  _OWORD v16[3];
  _OWORD v17[3];
  _OWORD v18[3];
  _OWORD v19[3];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v19[0] = *(_OWORD *)&a3->var0.var0;
  v19[1] = v6;
  v19[2] = *(_OWORD *)&a3->var1.var1;
  v7 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:clipRange:](self, "addSceneAnalysisResult:to:clipRange:", CFSTR("QualityResults"), v5, v19);
  if (!v7)
  {
    v8 = *(_OWORD *)&a3->var0.var3;
    v18[0] = *(_OWORD *)&a3->var0.var0;
    v18[1] = v8;
    v18[2] = *(_OWORD *)&a3->var1.var1;
    v7 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:clipRange:](self, "addSceneAnalysisResult:to:clipRange:", CFSTR("FineSubjectMotionResults"), v5, v18);
    if (!v7)
    {
      v9 = *(_OWORD *)&a3->var0.var3;
      v17[0] = *(_OWORD *)&a3->var0.var0;
      v17[1] = v9;
      v17[2] = *(_OWORD *)&a3->var1.var1;
      v7 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:clipRange:](self, "addSceneAnalysisResult:to:clipRange:", CFSTR("SubtleMotionResults"), v5, v17);
      if (!v7)
      {
        v10 = *(_OWORD *)&a3->var0.var3;
        v16[0] = *(_OWORD *)&a3->var0.var0;
        v16[1] = v10;
        v16[2] = *(_OWORD *)&a3->var1.var1;
        v7 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:clipRange:](self, "addSceneAnalysisResult:to:clipRange:", CFSTR("CameraMotionResults"), v5, v16);
        if (!v7)
        {
          v11 = *(_OWORD *)&a3->var0.var3;
          v15[0] = *(_OWORD *)&a3->var0.var0;
          v15[1] = v11;
          v15[2] = *(_OWORD *)&a3->var1.var1;
          v7 = -[VCPFullVideoAnalyzer addSceneAnalysisResult:to:clipRange:](self, "addSceneAnalysisResult:to:clipRange:", CFSTR("InterestingnessResults"), v5, v15);
        }
      }
    }
  }
  if (v7)
    v12 = 0;
  else
    v12 = v5;
  v13 = v12;

  return v13;
}

- (float)qualityScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0];
}

- (void)setQualityScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = a3;
}

- (float)actionScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1];
}

- (void)setActionScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = a3;
}

- (float)interestingnessScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2];
}

- (void)setInterestingnessScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = a3;
}

- (float)obstructionScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3];
}

- (void)setObstructionScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = a3;
}

- (float)trackingScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4];
}

- (void)setTrackingScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4] = a3;
}

- (NSDictionary)objectsMotion
{
  return *(NSDictionary **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5];
}

- (NSArray)globalMotion
{
  return (NSArray *)self->_frameBuffer.buffer_[34].motion_result_.duration_.value;
}

- (void).cxx_destruct
{
  float *v3;
  uint64_t v4;

  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.duration_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.valid_mb_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_, 0);
  ma::Histogram::~Histogram((ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_);
  v3 = &self->_frameBuffer.buffer_[33].motion_result_.motion_param_diff_.__elems_[3];
  v4 = -14280;
  do
  {
    ma::Histogram::~Histogram((ma::Histogram *)(v3 + 58));
    ma::MotionResult::~MotionResult((ma::MotionResult *)v3);
    v3 -= 102;
    v4 += 408;
  }
  while (v4);
}

- (id).cxx_construct
{
  ma::FrameBuffer::FrameBuffer((ma::FrameBuffer *)&self->_frameBuffer);
  ma::Histogram::Histogram((ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_);
  return self;
}

@end
