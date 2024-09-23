@implementation FRCFrameSynthesizer

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3
{
  return -[FRCFrameSynthesizer initWithUsage:qualityMode:](self, "initWithUsage:qualityMode:", a3, 1);
}

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4
{
  return -[FRCFrameSynthesizer initWithUsage:qualityMode:useLegacyNormalization:](self, "initWithUsage:qualityMode:useLegacyNormalization:", a3, a4, 0);
}

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4 useLegacyNormalization:(BOOL)a5
{
  _BOOL4 v5;
  FRCFrameSynthesizer *v8;
  os_log_t v9;
  OS_os_log *logger;
  int64_t v11;
  FRCImageProcessor *v12;
  int64_t usage;
  uint64_t v14;
  FRCImageProcessor *processor;
  NSObject *v16;
  unint64_t width;
  unint64_t height;
  Synthesis *synthesis;
  NSObject *v20;
  _BOOL4 v21;
  FRCFrameSynthesizer *v22;
  NSObject *v23;
  unint64_t v25;
  unint64_t v26;
  Synthesis *v27;
  NSObject *v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  int64_t v32;
  __int16 v33;
  _BYTE v34[30];
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)FRCFrameSynthesizer;
  v8 = -[FRCFrameSynthesizer init](&v30, sel_init);
  if (!v8)
  {
LABEL_11:
    v22 = v8;
    goto LABEL_15;
  }
  v9 = os_log_create("com.apple.FRC", "FRCFrameSynthesizer");
  logger = v8->_logger;
  v8->_logger = (OS_os_log *)v9;

  if ((a3 & 0x1000) != 0)
    v11 = a3 & 0xFFF;
  else
    v11 = a3;
  v8->_usage = v11;
  v8->_inputRotation = (unint64_t)(a3 & 0x1000) >> 11;
  FRCGetInputFrameSizeForUsage(v11, (uint64_t *)&v8->_width, (uint64_t *)&v8->_height);
  v12 = [FRCImageProcessor alloc];
  usage = v8->_usage;
  if (v5)
    v14 = -[FRCImageProcessor initLegacyModeWithUsage:](v12, "initLegacyModeWithUsage:", usage);
  else
    v14 = -[FRCImageProcessor initWithUsage:](v12, "initWithUsage:", usage);
  processor = v8->_processor;
  v8->_processor = (FRCImageProcessor *)v14;

  if (-[FRCFrameSynthesizer configureSynthesisWithMode:](v8, "configureSynthesisWithMode:", a4))
  {
    -[FRCFrameSynthesizer updateFlowSize](v8, "updateFlowSize");
    -[FRCFrameSynthesizer allocateResources](v8, "allocateResources");
    v16 = v8->_logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      width = v8->_width;
      height = v8->_height;
      synthesis = v8->_synthesis;
      v20 = v16;
      LODWORD(synthesis) = -[Synthesis synthesisMode](synthesis, "synthesisMode");
      v21 = -[Synthesis temporalFiltering](v8->_synthesis, "temporalFiltering");
      *(_DWORD *)buf = 134219520;
      v32 = (int64_t)v8;
      v33 = 1024;
      *(_DWORD *)v34 = a3;
      *(_WORD *)&v34[4] = 2048;
      *(_QWORD *)&v34[6] = width;
      *(_WORD *)&v34[14] = 2048;
      *(_QWORD *)&v34[16] = height;
      *(_WORD *)&v34[24] = 1024;
      *(_DWORD *)&v34[26] = a4;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = (_DWORD)synthesis;
      HIWORD(v35) = 1024;
      v36 = v21;
      _os_log_impl(&dword_1D425A000, v20, OS_LOG_TYPE_DEFAULT, "Initialized successfully (%p) [usage:%d (%ldx%ld), mode:%d, synthesis mode:%d, temporal filtering:%d].", buf, 0x38u);

    }
    goto LABEL_11;
  }
  v23 = v8->_logger;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v25 = v8->_width;
    v26 = v8->_height;
    v27 = v8->_synthesis;
    v28 = v23;
    v29 = -[Synthesis synthesisMode](v27, "synthesisMode");
    *(_DWORD *)buf = 134219008;
    v32 = a3;
    v33 = 2048;
    *(_QWORD *)v34 = v25;
    *(_WORD *)&v34[8] = 2048;
    *(_QWORD *)&v34[10] = v26;
    *(_WORD *)&v34[18] = 2048;
    *(_QWORD *)&v34[20] = a4;
    *(_WORD *)&v34[28] = 2048;
    v35 = v29;
    _os_log_error_impl(&dword_1D425A000, v28, OS_LOG_TYPE_ERROR, "Initialization failed [usage:%ld (%ldx%ld), mode:%ld, synthesis mode:%ld].", buf, 0x34u);

  }
  v22 = 0;
LABEL_15:

  return v22;
}

- (BOOL)configureSynthesisWithMode:(int64_t)a3
{
  Synthesis *v5;
  Synthesis *synthesis;
  int64_t v8;
  Synthesis *v9;
  uint64_t v10;

  v5 = objc_alloc_init(Synthesis);
  synthesis = self->_synthesis;
  self->_synthesis = v5;

  if ((unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) > 0x7E8FFF && a3 == 0)
    v8 = 1;
  else
    v8 = a3;
  switch(v8)
  {
    case 0:
      v9 = self->_synthesis;
      v10 = 0;
      goto LABEL_12;
    case 1:
      -[Synthesis setSynthesisMode:](self->_synthesis, "setSynthesisMode:", (unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) > 0xE0FFF);
      -[Synthesis setTemporalFiltering:](self->_synthesis, "setTemporalFiltering:", 1);
      break;
    case 2:
      v9 = self->_synthesis;
      v10 = 2;
      goto LABEL_12;
    case 3:
      v9 = self->_synthesis;
      v10 = 3;
LABEL_12:
      -[Synthesis setSynthesisMode:](v9, "setSynthesisMode:", v10);
      break;
    case 4:
      -[Synthesis setSynthesisMode:](self->_synthesis, "setSynthesisMode:", 3);
      -[Synthesis setTwoLayerFlowSplatting:](self->_synthesis, "setTwoLayerFlowSplatting:", 1);
      -[Synthesis setUseFlowConsistencyMap:](self->_synthesis, "setUseFlowConsistencyMap:", 1);
      break;
    default:
      break;
  }
  -[Synthesis setFramePipeline:](self->_synthesis, "setFramePipeline:", 1);
  return -[Synthesis switchUsageTo:](self->_synthesis, "switchUsageTo:", self->_usage);
}

- (void)allocateResources
{
  if (!self->_resourcePreAllocated)
  {
    -[Synthesis allocateResources](self->_synthesis, "allocateResources");
    self->_resourcePreAllocated = 1;
  }
}

- (void)releaseResources
{
  -[Synthesis releaseResources](self->_synthesis, "releaseResources");
  -[FRCFrameSynthesizer releaseScaledFlow](self, "releaseScaledFlow");
  self->_resourcePreAllocated = 0;
}

- (void)dealloc
{
  Synthesis *synthesis;
  NSObject *logger;
  int64_t usage;
  objc_super v6;
  uint8_t buf[4];
  FRCFrameSynthesizer *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_featureCreated)
    -[Synthesis releaseFeatures](self->_synthesis, "releaseFeatures");
  -[FRCFrameSynthesizer releaseResources](self, "releaseResources");
  synthesis = self->_synthesis;
  self->_synthesis = 0;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    usage = self->_usage;
    *(_DWORD *)buf = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = usage;
    _os_log_impl(&dword_1D425A000, logger, OS_LOG_TYPE_DEFAULT, "Released (%p) [usage:%ld]", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)FRCFrameSynthesizer;
  -[FRCFrameSynthesizer dealloc](&v6, sel_dealloc);
}

- (void)synthesizeFrameFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  __CVBuffer *scaledBackwardFlow;
  __CVBuffer *scaledForwardFlow;
  double v15;
  __CVBuffer *v16;
  double v17;

  scaledBackwardFlow = a6;
  scaledForwardFlow = a5;
  if (-[FRCFrameSynthesizer checkForwardFlow:backwardFlow:](self, "checkForwardFlow:backwardFlow:", a5, a6))
  {
    if (!self->_resourcePreAllocated)
      -[Synthesis allocateResources](self->_synthesis, "allocateResources");
    -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_processor, "preProcessFirstInput:secondInput:waitForCompletion:", a3, a4, 0);
    if (self->_inputFlowScaling)
    {
      -[Synthesis upscaleForwardFlow:backwardFlow:upscaledForwardFlow:upscaledBackwardFlow:](self->_synthesis, "upscaleForwardFlow:backwardFlow:upscaledForwardFlow:upscaledBackwardFlow:", scaledForwardFlow, scaledBackwardFlow, self->_scaledForwardFlow, self->_scaledBackwardFlow);
      scaledForwardFlow = self->_scaledForwardFlow;
      scaledBackwardFlow = self->_scaledBackwardFlow;
    }
    -[Synthesis createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:](self->_synthesis, "createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:", -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst"), -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), scaledForwardFlow, scaledBackwardFlow);
    *(float *)&v15 = a7;
    v16 = -[Synthesis synthesizeFrameForTimeScale:frameIndex:](self->_synthesis, "synthesizeFrameForTimeScale:frameIndex:", 0, v15);
    *(float *)&v17 = a7;
    -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:](self->_processor, "postProcessNormalizedFrame:output:timeScale:waitForCompletion:", v16, a8, 1, v17);
    CVPixelBufferRelease(v16);
    -[Synthesis releaseFeatures](self->_synthesis, "releaseFeatures");
    if (!self->_resourcePreAllocated)
      -[Synthesis releaseResources](self->_synthesis, "releaseResources");
  }
}

- (void)setFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6
{
  NSObject *logger;
  NSObject *v12;
  int v13;
  size_t Width;
  __int16 v15;
  size_t Height;
  __int16 v17;
  size_t v18;
  __int16 v19;
  size_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = logger;
    v13 = 134218752;
    Width = CVPixelBufferGetWidth(a3);
    v15 = 2048;
    Height = CVPixelBufferGetHeight(a3);
    v17 = 2048;
    v18 = CVPixelBufferGetWidth(a5);
    v19 = 2048;
    v20 = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1D425A000, v12, OS_LOG_TYPE_DEFAULT, "New frame pair set: [frame size: %ldx %ld, flow Size : %ld x %ld]", (uint8_t *)&v13, 0x2Au);

  }
  if (self->_featureCreated)
    -[Synthesis releaseFeatures](self->_synthesis, "releaseFeatures");
  if (!self->_resourcePreAllocated)
    -[Synthesis allocateResources](self->_synthesis, "allocateResources");
  -[FRCImageProcessor setInputRotation:](self->_processor, "setInputRotation:", self->_inputRotation);
  -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_processor, "preProcessFirstInput:secondInput:waitForCompletion:", a3, a4, 0);
  -[Synthesis createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:](self->_synthesis, "createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:", -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst"), -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), a5, a6);
  self->_featureCreated = 1;
}

- (void)synthesizeFrameForTimeScale:(float)a3 destination:(__CVBuffer *)a4
{
  NSObject *logger;
  double v8;
  __CVBuffer *v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1D425A000, logger, OS_LOG_TYPE_DEFAULT, "Synthesize frame [Time Scale: %.2f]", (uint8_t *)&v11, 0xCu);
  }
  if (self->_featureCreated)
  {
    *(float *)&v8 = a3;
    v9 = -[Synthesis synthesizeFrameForTimeScale:frameIndex:](self->_synthesis, "synthesizeFrameForTimeScale:frameIndex:", 0, v8);
    *(float *)&v10 = a3;
    -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:](self->_processor, "postProcessNormalizedFrame:output:timeScale:waitForCompletion:", v9, a4, 1, v10);
    CVPixelBufferRelease(v9);
  }
  else
  {
    NSLog(CFSTR("Error! Need to set buffers with setFirstFrame:secondFrame:forwardFlow:backwardFlow:"));
  }
}

- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 numberOfFrames:(unint64_t)a7 withError:(id *)a8
{
  void *v14;
  void *v15;

  uniformTimeScales(a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameSynthesizer synthesizeFramesFromFirstFrame:secondFrame:forwardFlow:backwardFlow:timeScales:withError:](self, "synthesizeFramesFromFirstFrame:secondFrame:forwardFlow:backwardFlow:timeScales:withError:", a3, a4, a5, a6, v14, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)scaledForwardFlow backwardFlow:(__CVBuffer *)scaledBackwardFlow timeScales:(id)a7 withError:(id *)a8
{
  id v14;
  uint64_t PixelFormatType;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  double v24;
  id v25;
  __CVBuffer *v26;
  uint64_t v27;
  CVPixelBufferRef PixelBuffer;
  double v29;
  __CVBuffer *v30;
  FRCFrame *v31;
  FRCFrame *v32;
  __CVBuffer *v33;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;

  v14 = a7;
  if (-[FRCFrameSynthesizer checkForwardFlow:backwardFlow:](self, "checkForwardFlow:backwardFlow:", scaledForwardFlow, scaledBackwardFlow))
  {
    if (!self->_resourcePreAllocated)
      -[Synthesis allocateResources](self->_synthesis, "allocateResources");
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (self->_inputFlowScaling)
    {
      -[Synthesis upscaleForwardFlow:backwardFlow:upscaledForwardFlow:upscaledBackwardFlow:](self->_synthesis, "upscaleForwardFlow:backwardFlow:upscaledForwardFlow:upscaledBackwardFlow:", scaledForwardFlow, scaledBackwardFlow, self->_scaledForwardFlow, self->_scaledBackwardFlow);
      scaledForwardFlow = self->_scaledForwardFlow;
      scaledBackwardFlow = self->_scaledBackwardFlow;
    }
    -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_processor, "preProcessFirstInput:secondInput:waitForCompletion:", a3, a4, 0);
    -[Synthesis createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:](self->_synthesis, "createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:", -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst"), -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), scaledForwardFlow, scaledBackwardFlow);
    v16 = objc_msgSend(v14, "count");
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v16)
    {
      v18 = v16;
      v19 = 0;
      v36 = v16 - 1;
      v35 = *MEMORY[0x1E0CA2E68];
      v20 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v19, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v23 = v22;

        LODWORD(v24) = v23;
        v25 = v14;
        v26 = -[Synthesis synthesizeFrameForTimeScale:frameIndex:](self->_synthesis, "synthesizeFrameForTimeScale:frameIndex:", v19, v24);
        v27 = PixelFormatType;
        PixelBuffer = createPixelBuffer(self->_width, self->_height, PixelFormatType, 0);
        LODWORD(v29) = v23;
        -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:](self->_processor, "postProcessNormalizedFrame:output:timeScale:waitForCompletion:", v26, PixelBuffer, v36 == v19, v29);
        v30 = v26;
        v14 = v25;
        CVPixelBufferRelease(v30);
        v31 = [FRCFrame alloc];
        v37 = v35;
        v38 = v20;
        v32 = -[FRCFrame initWithBuffer:presentationTimeStamp:](v31, "initWithBuffer:presentationTimeStamp:", PixelBuffer, &v37);
        v33 = PixelBuffer;
        PixelFormatType = v27;
        CVPixelBufferRelease(v33);
        objc_msgSend(v17, "addObject:", v32);

        ++v19;
      }
      while (v18 != v19);
    }
    -[Synthesis releaseFeatures](self->_synthesis, "releaseFeatures");
    if (!self->_resourcePreAllocated)
      -[Synthesis releaseResources](self->_synthesis, "releaseResources");
  }
  else if (a8)
  {
    -[FRCFrameSynthesizer errorWithErrorCode:](self, "errorWithErrorCode:", -22008);
    v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)checkForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4
{
  OSType PixelFormatType;
  OSType v8;
  size_t Width;
  size_t Height;
  BOOL result;
  unint64_t v12;
  unint64_t v13;
  size_t v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType == 1278226536 && v8 == 1278226536)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (Width == self->_flowWidth >> 1 && Height == self->_flowHeight)
    {
      result = 1;
      self->_inputFlowScaling = 1;
      if (self->_scaledFlowBufferAllocated)
        return result;
      -[FRCFrameSynthesizer allocateScaledFlow](self, "allocateScaledFlow");
      return 1;
    }
    v13 = self->_width;
    v12 = self->_height;
    if (Width == v13 >> 1 && Height == v12)
    {
      v14 = CVPixelBufferGetWidth(a4);
      v15 = CVPixelBufferGetHeight(a4);
      v17 = self->_width;
      v16 = self->_height;
      if (v14 == v17 >> 1 && v15 == v16)
        return 1;
      NSLog(CFSTR("[FRC] Invalid backward optical flow buffer size. Expected %ld x %ld\n"), v17 >> 1, v16);
    }
    else
    {
      NSLog(CFSTR("[FRC] Invalid forward optical flow buffer size. Expected %ld x %ld\n"), v13 >> 1, v12);
    }
  }
  else
  {
    NSLog(CFSTR("[FRC] Invalid pixel format for optical flow. Must be kCVPixelFormatType_OneComponent16Half"));
  }
  return 0;
}

- (id)errorWithErrorCode:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;

  if (a3 == -22008)
    v4 = CFSTR("Incorrect optical flow buffers.");
  else
    v4 = CFSTR("Unknown error.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FRC"), a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateFlowSize
{
  int64_t usage;
  uint64_t QuarterSizeUsage;
  uint64_t v5;
  int64x2_t *p_flowWidth;
  uint64_t *p_flowHeight;

  usage = self->_usage;
  if ((unint64_t)FRCGetNumberOfPixelsForUsage(usage) >> 10 <= 0x7E8)
  {
    p_flowWidth = (int64x2_t *)&self->_flowWidth;
    p_flowHeight = (uint64_t *)&self->_flowHeight;
    FRCGetInputFrameSizeForUsage(usage, p_flowWidth->i64, p_flowHeight);
    goto LABEL_6;
  }
  QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
  if (+[OpticalFlow use4xDownScale:](OpticalFlow, "use4xDownScale:", self->_usage))
  {
    v5 = getQuarterSizeUsage(QuarterSizeUsage);
    p_flowWidth = (int64x2_t *)&self->_flowWidth;
    p_flowHeight = (uint64_t *)&self->_flowHeight;
    FRCGetInputFrameSizeForUsage(v5, p_flowWidth->i64, p_flowHeight);
    if (v5 != usage)
    {
      *p_flowWidth = vaddq_s64(*p_flowWidth, *p_flowWidth);
      return;
    }
    goto LABEL_6;
  }
  p_flowWidth = (int64x2_t *)&self->_flowWidth;
  p_flowHeight = (uint64_t *)&self->_flowHeight;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, p_flowWidth->i64, p_flowHeight);
  if (QuarterSizeUsage == usage)
  {
LABEL_6:
    p_flowWidth->i64[0] = (unint64_t)p_flowWidth->i64[0] >> 1;
    *p_flowHeight = (unint64_t)*p_flowHeight >> 1;
  }
}

- (void)allocateScaledFlow
{
  if (!self->_scaledForwardFlow)
    self->_scaledForwardFlow = createPixelBuffer(self->_flowWidth, 2 * self->_flowHeight, 0x4C303068u, 0);
  if (!self->_scaledBackwardFlow)
    self->_scaledBackwardFlow = createPixelBuffer(self->_flowWidth, 2 * self->_flowHeight, 0x4C303068u, 0);
  self->_scaledFlowBufferAllocated = 1;
}

- (void)releaseScaledFlow
{
  __CVBuffer *scaledForwardFlow;
  __CVBuffer *scaledBackwardFlow;

  scaledForwardFlow = self->_scaledForwardFlow;
  if (scaledForwardFlow)
  {
    CVPixelBufferRelease(scaledForwardFlow);
    self->_scaledForwardFlow = 0;
  }
  scaledBackwardFlow = self->_scaledBackwardFlow;
  if (scaledBackwardFlow)
  {
    CVPixelBufferRelease(scaledBackwardFlow);
    self->_scaledBackwardFlow = 0;
  }
  self->_scaledFlowBufferAllocated = 0;
}

- (unint64_t)flowWidth
{
  return self->_flowWidth;
}

- (unint64_t)flowHeight
{
  return self->_flowHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
}

@end
