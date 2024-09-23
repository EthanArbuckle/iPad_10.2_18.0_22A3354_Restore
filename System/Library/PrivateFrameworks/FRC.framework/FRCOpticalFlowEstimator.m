@implementation FRCOpticalFlowEstimator

- (unint64_t)flowWidth
{
  return -[OpticalFlow flowWidth](self->_opticalFlow, "flowWidth");
}

- (unint64_t)flowHeight
{
  return -[OpticalFlow flowHeight](self->_opticalFlow, "flowHeight");
}

- (BOOL)skipFirstFramePreProcessing
{
  return self->_streamingMode && !self->_firstPair;
}

- (FRCOpticalFlowEstimator)initWithUsage:(int64_t)a3
{
  FRCOpticalFlowEstimatorConfiguration *v4;
  FRCOpticalFlowEstimator *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  FRCGetInputFrameSizeForUsage(a3, &v8, &v7);
  v4 = objc_alloc_init(FRCOpticalFlowEstimatorConfiguration);
  v5 = -[FRCOpticalFlowEstimator initWithWidth:height:configuration:](self, "initWithWidth:height:configuration:", v8, v7, v4);

  return v5;
}

- (FRCOpticalFlowEstimator)initWithWidth:(int64_t)a3 height:(int64_t)a4 configuration:(id)a5
{
  id v8;
  FRCOpticalFlowEstimator *v9;
  uint64_t v10;
  os_log_t v11;
  OS_os_log *logger;
  uint64_t v13;
  int v14;
  FRCImageProcessor *v15;
  int64_t usage;
  uint64_t v17;
  FRCImageProcessor *processor;
  OpticalFlow *v19;
  OpticalFlow *opticalFlow;
  OpticalFlow *v21;
  int64_t v22;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  OpticalFlow *v26;
  NSObject *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  FRCOpticalFlowEstimator *v33;
  void *v34;
  OpticalFlow *v35;
  NSObject *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  FRCImageProcessor *v42;
  objc_super v44;
  uint8_t buf[4];
  FRCOpticalFlowEstimator *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v44.receiver = self;
  v44.super_class = (Class)FRCOpticalFlowEstimator;
  v9 = -[FRCOpticalFlowEstimator init](&v44, sel_init);
  if (v9)
  {
    v10 = FRCGetUsageFromSize(a3, a4);
    v11 = os_log_create("com.apple.FRC", "FRCOpticalFlowEstimator");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v11;

    if ((v10 & 0x1000) != 0)
      v13 = v10 & 0xFFF;
    else
      v13 = v10;
    v9->_usage = v13;
    v9->_inputRotation = (unint64_t)(v10 & 0x1000) >> 11;
    FRCGetInputFrameSizeForUsage(v13, (uint64_t *)&v9->_width, (uint64_t *)&v9->_height);
    v14 = objc_msgSend(v8, "legacyNormalization");
    v15 = [FRCImageProcessor alloc];
    usage = v9->_usage;
    if (v14)
      v17 = -[FRCImageProcessor initLegacyModeWithUsage:](v15, "initLegacyModeWithUsage:", usage);
    else
      v17 = -[FRCImageProcessor initWithUsage:](v15, "initWithUsage:", usage);
    processor = v9->_processor;
    v9->_processor = (FRCImageProcessor *)v17;

    v19 = objc_alloc_init(OpticalFlow);
    opticalFlow = v9->_opticalFlow;
    v9->_opticalFlow = v19;

    if (objc_msgSend(v8, "outputPixelFormat") == 1278226536
      || objc_msgSend(v8, "outputPixelFormat") == 843264104)
    {
      v9->_outputPixelFormat = objc_msgSend(v8, "outputPixelFormat");
      v21 = v9->_opticalFlow;
      if (v21)
      {
        if (v8)
        {
          if (objc_msgSend(v8, "mode") == 1 || objc_msgSend(v8, "adaptationLayerOnly"))
            -[OpticalFlow setUseAdaptationLayer:](v9->_opticalFlow, "setUseAdaptationLayer:", 1);
          v9->_streamingMode = objc_msgSend(v8, "streamingMode");
          -[OpticalFlow setDisableOutputFlowScaling:](v9->_opticalFlow, "setDisableOutputFlowScaling:", objc_msgSend(v8, "disableOutputFlowScaling"));
          -[OpticalFlow setRevision:](v9->_opticalFlow, "setRevision:", objc_msgSend(v8, "revision"));
          -[OpticalFlow setSkipLastLevel:](v9->_opticalFlow, "setSkipLastLevel:", objc_msgSend(v8, "skipLastLevel"));
          -[OpticalFlow setAdaptationLayerOnly:](v9->_opticalFlow, "setAdaptationLayerOnly:", objc_msgSend(v8, "adaptationLayerOnly"));
          v21 = v9->_opticalFlow;
        }
        v9->_firstPair = 1;
        -[OpticalFlow setConcurrentDualFlowProcessing:](v21, "setConcurrentDualFlowProcessing:", 1);
        v22 = v9->_usage;
        if (!v22)
        {
          -[OpticalFlow setTwoStageFlow:](v9->_opticalFlow, "setTwoStageFlow:", 1);
          v22 = v9->_usage;
        }
        if ((unint64_t)FRCGetNumberOfPixelsForUsage(v22) >> 10 >= 0x7E9)
          -[OpticalFlow setDownsampling:](v9->_opticalFlow, "setDownsampling:", 1);
        if ((unint64_t)FRCGetNumberOfPixelsForUsage(v9->_usage) >= 0x7E9000)
          -[OpticalFlow setTwoStageFlow:](v9->_opticalFlow, "setTwoStageFlow:", 1);
        v23 = -[OpticalFlow switchUsageTo:](v9->_opticalFlow, "switchUsageTo:", v9->_usage);
        v24 = v9->_logger;
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v25)
          {
            v26 = v9->_opticalFlow;
            v27 = v24;
            LODWORD(v26) = -[OpticalFlow downsampling](v26, "downsampling");
            v28 = -[OpticalFlow useAdaptationLayer](v9->_opticalFlow, "useAdaptationLayer");
            v29 = -[OpticalFlow twoStageFlow](v9->_opticalFlow, "twoStageFlow");
            v30 = -[OpticalFlow revision](v9->_opticalFlow, "revision");
            v31 = -[FRCOpticalFlowEstimator flowWidth](v9, "flowWidth");
            v32 = -[FRCOpticalFlowEstimator flowHeight](v9, "flowHeight");
            *(_DWORD *)buf = 134219776;
            v46 = v9;
            v47 = 1024;
            v48 = v10;
            v49 = 1024;
            v50 = (int)v26;
            v51 = 1024;
            v52 = v28;
            v53 = 1024;
            v54 = v29;
            v55 = 1024;
            v56 = v30;
            v57 = 2048;
            v58 = v31;
            v59 = 2048;
            v60 = v32;
            _os_log_impl(&dword_1D425A000, v27, OS_LOG_TYPE_DEFAULT, "Initialized successfully (%p) [usage:%d, 1/4 flow:%d, adaptation layer:%d, twoStage:%d, revision:%d, flow size (%ldx%ld)].", buf, 0x3Eu);

          }
          goto LABEL_25;
        }
        if (v25)
        {
          v35 = v9->_opticalFlow;
          v36 = v24;
          LODWORD(v35) = -[OpticalFlow downsampling](v35, "downsampling");
          v37 = -[OpticalFlow useAdaptationLayer](v9->_opticalFlow, "useAdaptationLayer");
          v38 = -[OpticalFlow twoStageFlow](v9->_opticalFlow, "twoStageFlow");
          v39 = -[OpticalFlow revision](v9->_opticalFlow, "revision");
          v40 = -[FRCOpticalFlowEstimator flowWidth](v9, "flowWidth");
          v41 = -[FRCOpticalFlowEstimator flowHeight](v9, "flowHeight");
          *(_DWORD *)buf = 134219776;
          v46 = v9;
          v47 = 1024;
          v48 = v10;
          v49 = 1024;
          v50 = (int)v35;
          v51 = 1024;
          v52 = v37;
          v53 = 1024;
          v54 = v38;
          v55 = 1024;
          v56 = v39;
          v57 = 2048;
          v58 = v40;
          v59 = 2048;
          v60 = v41;
          _os_log_impl(&dword_1D425A000, v36, OS_LOG_TYPE_DEFAULT, "Failed to switch (%p) [usage:%d, 1/4 flow:%d, adaptation layer:%d, twoStage:%d, revision:%d, flow size (%ldx%ld)].", buf, 0x3Eu);

        }
        v42 = v9->_processor;
        v9->_processor = 0;

        v34 = v9->_opticalFlow;
        v9->_opticalFlow = 0;
LABEL_32:

        v33 = 0;
        goto LABEL_33;
      }
      NSLog(CFSTR("Failed to create OpticalFlow modules"));
    }
    else
    {
      NSLog(CFSTR("Error! outputPixelFormat must be either kCVPixelFormatType_OneComponent16Half or kCVPixelFormatType_TwoComponent16Half"));
    }
    v34 = v9->_processor;
    v9->_processor = 0;
    goto LABEL_32;
  }
LABEL_25:
  v33 = v9;
LABEL_33:

  return v33;
}

- (void)dealloc
{
  NSObject *logger;
  int64_t usage;
  objc_super v5;
  uint8_t buf[4];
  FRCOpticalFlowEstimator *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    usage = self->_usage;
    *(_DWORD *)buf = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = usage;
    _os_log_impl(&dword_1D425A000, logger, OS_LOG_TYPE_DEFAULT, "Released (%p) [usage:%ld]", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)FRCOpticalFlowEstimator;
  -[FRCOpticalFlowEstimator dealloc](&v5, sel_dealloc);
}

- (void)allocateResources
{
  -[OpticalFlow allocateResources](self->_opticalFlow, "allocateResources");
  self->_resourcePreAllocated = 1;
}

- (void)releaseResources
{
  -[OpticalFlow releaseResources](self->_opticalFlow, "releaseResources");
  self->_resourcePreAllocated = 0;
}

- (int64_t)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 flow:(__CVBuffer *)a5
{
  NSObject *logger;
  NSObject *v10;
  FRCImageProcessor *processor;
  __CVBuffer *v12;
  OpticalFlow *opticalFlow;
  __CVBuffer *v14;
  int v16;
  size_t Width;
  __int16 v18;
  size_t Height;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = logger;
    v16 = 134218240;
    Width = CVPixelBufferGetWidth(a5);
    v18 = 2048;
    Height = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1D425A000, v10, OS_LOG_TYPE_DEFAULT, "opticalFlowFrom:to:outputFlow [Flow Size %ld x %ld]\n", (uint8_t *)&v16, 0x16u);

  }
  if (!self->_resourcePreAllocated)
    -[OpticalFlow allocateResources](self->_opticalFlow, "allocateResources");
  -[FRCImageProcessor setInputRotation:](self->_processor, "setInputRotation:", self->_inputRotation);
  processor = self->_processor;
  if (-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v12 = 0;
  else
    v12 = a3;
  -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](processor, "preProcessFirstInput:secondInput:waitForCompletion:", v12, a4, 0);
  opticalFlow = self->_opticalFlow;
  v14 = 0;
  if (!-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v14 = -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst");
  -[OpticalFlow opticalFlowFirstFrame:secondFrame:flow:](opticalFlow, "opticalFlowFirstFrame:secondFrame:flow:", v14, -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), a5);
  if (!self->_resourcePreAllocated)
    -[OpticalFlow releaseResources](self->_opticalFlow, "releaseResources");
  self->_firstPair = 0;
  return -22000;
}

- (int64_t)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6
{
  NSObject *logger;
  NSObject *v12;
  FRCImageProcessor *processor;
  __CVBuffer *v14;
  OpticalFlow *opticalFlow;
  __CVBuffer *v16;
  int v18;
  size_t Width;
  __int16 v20;
  size_t Height;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = logger;
    v18 = 134218240;
    Width = CVPixelBufferGetWidth(a5);
    v20 = 2048;
    Height = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1D425A000, v12, OS_LOG_TYPE_DEFAULT, "opticalFlowsFrom:to:forwardFlow:backwardFlow [Flow Size %ld x %ld]\n", (uint8_t *)&v18, 0x16u);

  }
  if (!self->_resourcePreAllocated)
    -[OpticalFlow allocateResources](self->_opticalFlow, "allocateResources");
  -[FRCImageProcessor setInputRotation:](self->_processor, "setInputRotation:", self->_inputRotation);
  processor = self->_processor;
  if (-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v14 = 0;
  else
    v14 = a3;
  -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](processor, "preProcessFirstInput:secondInput:waitForCompletion:", v14, a4, 0);
  opticalFlow = self->_opticalFlow;
  v16 = 0;
  if (!-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v16 = -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst");
  -[OpticalFlow opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:](opticalFlow, "opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:", v16, -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), a5, a6);
  if (!self->_resourcePreAllocated)
    -[OpticalFlow releaseResources](self->_opticalFlow, "releaseResources");
  self->_firstPair = 0;
  return -22000;
}

- (__CVBuffer)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  NSObject *logger;
  OpticalFlow *opticalFlow;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  __CVBuffer *PixelBuffer;
  int v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    opticalFlow = self->_opticalFlow;
    v9 = logger;
    v10 = -[OpticalFlow flowWidth](opticalFlow, "flowWidth");
    v11 = -[OpticalFlow flowHeight](self->_opticalFlow, "flowHeight");
    v14 = 134218240;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_1D425A000, v9, OS_LOG_TYPE_DEFAULT, "opticalFlowFrom:to: [Flow Size %ld x %ld]\n", (uint8_t *)&v14, 0x16u);

  }
  PixelBuffer = createPixelBuffer(-[FRCOpticalFlowEstimator flowWidth](self, "flowWidth"), -[FRCOpticalFlowEstimator flowHeight](self, "flowHeight") << (self->_outputPixelFormat == 1278226536), self->_outputPixelFormat, 0);
  if (-[FRCOpticalFlowEstimator opticalFlowFrom:to:flow:](self, "opticalFlowFrom:to:flow:", a3, a4, PixelBuffer) != -22000)
  {
    CVPixelBufferRelease(PixelBuffer);
    return 0;
  }
  return PixelBuffer;
}

- (id)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  NSObject *logger;
  OpticalFlow *opticalFlow;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v14;
  FRCFrame *v15;
  uint64_t v16;
  FRCFrame *v17;
  FRCFrame *v18;
  FRCFrame *v19;
  void *v20;
  __int128 v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    opticalFlow = self->_opticalFlow;
    v9 = logger;
    v10 = -[OpticalFlow flowWidth](opticalFlow, "flowWidth");
    v11 = -[OpticalFlow flowHeight](self->_opticalFlow, "flowHeight");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D425A000, v9, OS_LOG_TYPE_DEFAULT, "opticalFlowsFrom:to: [Flow Size %ld x %ld]\n", buf, 0x16u);

  }
  v12 = -[FRCOpticalFlowEstimator flowHeight](self, "flowHeight") << (self->_outputPixelFormat == 1278226536);
  PixelBuffer = createPixelBuffer(-[FRCOpticalFlowEstimator flowWidth](self, "flowWidth"), v12, self->_outputPixelFormat, 0);
  v14 = createPixelBuffer(-[FRCOpticalFlowEstimator flowWidth](self, "flowWidth"), v12, self->_outputPixelFormat, 0);
  if (-[FRCOpticalFlowEstimator opticalFlowsFrom:to:forwardFlow:backwardFlow:](self, "opticalFlowsFrom:to:forwardFlow:backwardFlow:", a3, a4, PixelBuffer, v14) == -22000)
  {
    v15 = [FRCFrame alloc];
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
    v22 = *(_OWORD *)buf;
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v16 = *(_QWORD *)&buf[16];
    v17 = -[FRCFrame initWithBuffer:presentationTimeStamp:](v15, "initWithBuffer:presentationTimeStamp:", PixelBuffer, buf);
    v18 = [FRCFrame alloc];
    *(_OWORD *)buf = v22;
    *(_QWORD *)&buf[16] = v16;
    v19 = -[FRCFrame initWithBuffer:presentationTimeStamp:](v18, "initWithBuffer:presentationTimeStamp:", v14, buf);
    CVPixelBufferRelease(PixelBuffer);
    CVPixelBufferRelease(v14);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v17, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    return v20;
  }
  else
  {
    CVPixelBufferRelease(PixelBuffer);
    CVPixelBufferRelease(v14);
    return 0;
  }
}

- (int64_t)flowAdaptationFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 inputForwardFlow:(__CVBuffer *)a5 inputBackwardFlow:(__CVBuffer *)a6 outputForwardFlow:(__CVBuffer *)a7 outputBackwardFlow:(__CVBuffer *)a8
{
  NSObject *logger;
  FRCImageProcessor *processor;
  __CVBuffer *v17;
  OpticalFlow *opticalFlow;
  __CVBuffer *v19;
  NSObject *log;
  uint8_t buf[4];
  size_t Width;
  __int16 v24;
  size_t Height;
  __int16 v26;
  size_t v27;
  __int16 v28;
  size_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    log = logger;
    *(_DWORD *)buf = 134218752;
    Width = CVPixelBufferGetWidth(a5);
    v24 = 2048;
    Height = CVPixelBufferGetHeight(a6);
    v26 = 2048;
    v27 = CVPixelBufferGetWidth(a7);
    v28 = 2048;
    v29 = CVPixelBufferGetHeight(a8);
    _os_log_impl(&dword_1D425A000, log, OS_LOG_TYPE_DEFAULT, "flowAdaptationFrom:to:inputForwardFlow:inputBackwardFlow:outputForwardFlow:outputBackwardFlow [inputFlow Size %ld x %ld] [outputFlow Size %ld x %ld]\n", buf, 0x2Au);

  }
  if (!self->_resourcePreAllocated)
    -[OpticalFlow allocateResources](self->_opticalFlow, "allocateResources");
  -[FRCImageProcessor setInputRotation:](self->_processor, "setInputRotation:", self->_inputRotation);
  processor = self->_processor;
  if (-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v17 = 0;
  else
    v17 = a3;
  -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](processor, "preProcessFirstInput:secondInput:waitForCompletion:", v17, a4, 0);
  opticalFlow = self->_opticalFlow;
  v19 = 0;
  if (!-[FRCOpticalFlowEstimator skipFirstFramePreProcessing](self, "skipFirstFramePreProcessing"))
    v19 = -[FRCImageProcessor normalizedFirst](self->_processor, "normalizedFirst");
  -[OpticalFlow flowAdaptationFirstFrame:secondFrame:inputFlowForward:inputFlowBackward:outputFlowForward:outputFlowBackward:](opticalFlow, "flowAdaptationFirstFrame:secondFrame:inputFlowForward:inputFlowBackward:outputFlowForward:outputFlowBackward:", v19, -[FRCImageProcessor normalizedSecond](self->_processor, "normalizedSecond"), a5, a6, a7, a8);
  if (!self->_resourcePreAllocated)
    -[OpticalFlow releaseResources](self->_opticalFlow, "releaseResources");
  self->_firstPair = 0;
  return -22000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
}

@end
