@implementation BWVISProcessorController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)prepareToProcess
{
  VISProcessor *visProcessor;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  VISConfiguration *v8;
  VISProcessor *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  double v21;
  uint64_t v22;
  int v23;
  int v24;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_buffersEnqueued)
    goto LABEL_27;
  if (!self->_configuration)
    goto LABEL_29;
  visProcessor = self->_visProcessor;
  if (visProcessor)
  {

    self->_visProcessor = 0;
    self->_visConfiguration = 0;
  }
  v4 = -[FigCaptureCameraParameters videoStabilizationProcessorVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "videoStabilizationProcessorVersion");
  if (!(_DWORD)v4)
  {
LABEL_29:
    v24 = -12780;
    goto LABEL_31;
  }
  v5 = v4;
  v6 = BWLoadProcessorBundle((uint64_t)CFSTR("VideoStabilization"), v4);
  if (!v6)
    goto LABEL_28;
  v7 = v6;
  v8 = (VISConfiguration *)objc_alloc_init((Class)objc_msgSend(v6, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VISConfigurationV%d"), v5)));
  self->_visConfiguration = v8;
  if (!v8
    || (v9 = (VISProcessor *)objc_alloc_init((Class)objc_msgSend(v7, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VISProcessorV%d"), v5))), (self->_visProcessor = v9) == 0))
  {
LABEL_27:
    v24 = -12782;
LABEL_31:

    self->_visProcessor = 0;
    self->_visConfiguration = 0;
    return v24;
  }
  -[VISProcessor setDelegate:](v9, "setDelegate:", self);
  -[VISConfiguration setIspProcessingSession:](self->_visConfiguration, "setIspProcessingSession:", -[BWFigCaptureISPProcessingSession figCaptureISPProcessingSession](-[BWVISProcessorControllerConfiguration ispProcessingSession](self->_configuration, "ispProcessingSession"), "figCaptureISPProcessingSession"));
  -[VISConfiguration setExtendedOutputRowsToFill:](self->_visConfiguration, "setExtendedOutputRowsToFill:", -[BWVISProcessorControllerConfiguration extendedOutputRowsToFill](self->_configuration, "extendedOutputRowsToFill"));
  -[VISConfiguration setInputPixelBufferAttributes:](self->_visConfiguration, "setInputPixelBufferAttributes:", -[BWVISProcessorControllerConfiguration inputPixelBufferAttributes](self->_configuration, "inputPixelBufferAttributes"));
  -[VISConfiguration setOutputPixelBufferAttributes:](self->_visConfiguration, "setOutputPixelBufferAttributes:", -[BWVISProcessorControllerConfiguration outputPixelBufferAttributes](self->_configuration, "outputPixelBufferAttributes"));
  -[VISConfiguration setTransformPlatform:](self->_visConfiguration, "setTransformPlatform:", *((unsigned int *)&xmmword_1A3161E00+ -[BWVISProcessorControllerConfiguration transformPlatform](self->_configuration, "transformPlatform")));
  -[VISConfiguration setBlurBorderPixels:](self->_visConfiguration, "setBlurBorderPixels:", -[BWVISProcessorControllerConfiguration blurBorderPixels](self->_configuration, "blurBorderPixels"));
  -[VISConfiguration setSmoothingMethod:](self->_visConfiguration, "setSmoothingMethod:", dword_1A3161E10[-[BWVISProcessorControllerConfiguration smoothingMethod](self->_configuration, "smoothingMethod")]);
  -[VISConfiguration setMotionBlurShimmerMitigationMethod:](self->_visConfiguration, "setMotionBlurShimmerMitigationMethod:", dword_1A3161E28[-[BWVISProcessorControllerConfiguration motionBlurShimmerMitigationMethod](self->_configuration, "motionBlurShimmerMitigationMethod")]);
  -[VISConfiguration setSphereCorrectionEnabled:](self->_visConfiguration, "setSphereCorrectionEnabled:", -[BWVISProcessorControllerConfiguration sphereCorrectionEnabled](self->_configuration, "sphereCorrectionEnabled"));
  -[VISConfiguration setUseISPMotionData:](self->_visConfiguration, "setUseISPMotionData:", -[BWVISProcessorControllerConfiguration useISPMotionData](self->_configuration, "useISPMotionData"));
  -[VISConfiguration setCinematicLookAheadFrameCount:](self->_visConfiguration, "setCinematicLookAheadFrameCount:", -[BWVISProcessorControllerConfiguration cinematicLookAheadFrameCount](self->_configuration, "cinematicLookAheadFrameCount"));
  -[BWVISProcessorControllerConfiguration cinematicLookAheadTime](self->_configuration, "cinematicLookAheadTime");
  -[VISConfiguration setCinematicLookAheadTime:](self->_visConfiguration, "setCinematicLookAheadTime:");
  -[BWVISProcessorControllerConfiguration livePhotoCleanOutputRect](self->_configuration, "livePhotoCleanOutputRect");
  -[VISConfiguration setLivePhotoCleanOutputRect:](self->_visConfiguration, "setLivePhotoCleanOutputRect:");
  -[VISConfiguration setAttachStabilizedOutputCameraTrajectory:](self->_visConfiguration, "setAttachStabilizedOutputCameraTrajectory:", -[BWVISProcessorControllerConfiguration attachStabilizedOutputCameraTrajectory](self->_configuration, "attachStabilizedOutputCameraTrajectory"));
  -[VISConfiguration setAttachStabilizedTrajectoryHomography:](self->_visConfiguration, "setAttachStabilizedTrajectoryHomography:", -[BWVISProcessorControllerConfiguration attachStabilizedTrajectoryHomography](self->_configuration, "attachStabilizedTrajectoryHomography"));
  -[VISConfiguration setAttachEstimatedMotionVector:](self->_visConfiguration, "setAttachEstimatedMotionVector:", -[BWVISProcessorControllerConfiguration attachEstimatedMotionVector](self->_configuration, "attachEstimatedMotionVector"));
  -[VISConfiguration setOnlyGenerateTransformsParameters:](self->_visConfiguration, "setOnlyGenerateTransformsParameters:", -[BWVISProcessorControllerConfiguration onlyGenerateTransformsParameters](self->_configuration, "onlyGenerateTransformsParameters"));
  -[VISConfiguration setEmitSampleBufferSemaphore:](self->_visConfiguration, "setEmitSampleBufferSemaphore:", -[BWVISProcessorControllerConfiguration emitSampleBufferSemaphore](self->_configuration, "emitSampleBufferSemaphore"));
  -[VISConfiguration setSensorIDDict:](self->_visConfiguration, "setSensorIDDict:", -[BWVISProcessorControllerConfiguration sensorIDDict](self->_configuration, "sensorIDDict"));
  -[VISConfiguration setCameraInfoByPortType:](self->_visConfiguration, "setCameraInfoByPortType:", -[BWVISProcessorControllerConfiguration cameraInfoByPortType](self->_configuration, "cameraInfoByPortType"));
  -[VISConfiguration setSphereVideoEnabled:](self->_visConfiguration, "setSphereVideoEnabled:", -[BWVISProcessorControllerConfiguration sphereVideoEnabled](self->_configuration, "sphereVideoEnabled"));
  -[VISConfiguration setFrameRateConversionEnabled:](self->_visConfiguration, "setFrameRateConversionEnabled:", -[BWVISProcessorControllerConfiguration frameRateConversionEnabled](self->_configuration, "frameRateConversionEnabled"));
  -[VISConfiguration setSmartStyleRenderingEnabled:](self->_visConfiguration, "setSmartStyleRenderingEnabled:", -[BWVISProcessorControllerConfiguration smartStyleRenderingEnabled](self->_configuration, "smartStyleRenderingEnabled"));
  -[VISConfiguration setSmartStyleReversibilityEnabled:](self->_visConfiguration, "setSmartStyleReversibilityEnabled:", -[BWVISProcessorControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled"));
  -[VISConfiguration setSmartStyleMemoryPoolId:](self->_visConfiguration, "setSmartStyleMemoryPoolId:", -[BWVISProcessorControllerConfiguration smartStyleMemoryPoolId](self->_configuration, "smartStyleMemoryPoolId"));
  -[VISConfiguration setVideoStabilizationDisabled:](self->_visConfiguration, "setVideoStabilizationDisabled:", -[BWVISProcessorControllerConfiguration videoStabilizationDisabled](self->_configuration, "videoStabilizationDisabled"));
  -[VISConfiguration setP3ToBT2020ConversionEnabled:](self->_visConfiguration, "setP3ToBT2020ConversionEnabled:", -[BWVISProcessorControllerConfiguration p3ToBT2020ConversionEnabled](self->_configuration, "p3ToBT2020ConversionEnabled"));
  -[VISConfiguration setGpuPriority:](self->_visConfiguration, "setGpuPriority:", -[BWVISProcessorControllerConfiguration gpuPriority](self->_configuration, "gpuPriority"));
  -[VISConfiguration setMetalSubmissionAndCompletionQueuePriority:](self->_visConfiguration, "setMetalSubmissionAndCompletionQueuePriority:", -[BWVISProcessorControllerConfiguration metalSubmissionAndCompletionQueuePriority](self->_configuration, "metalSubmissionAndCompletionQueuePriority"));
  -[VISConfiguration setOutputPixelBufferPool:](self->_visConfiguration, "setOutputPixelBufferPool:", -[BWPixelBufferPool cvPixelBufferPool](-[BWVISProcessorControllerConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool"), "cvPixelBufferPool"));
  -[VISConfiguration setOutputAuxAttributes:](self->_visConfiguration, "setOutputAuxAttributes:", -[BWPixelBufferPool cvPixelBufferPoolAuxAttributes](-[BWVISProcessorControllerConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool"), "cvPixelBufferPoolAuxAttributes"));
  -[VISConfiguration setOutputDepthPixelBufferPool:](self->_visConfiguration, "setOutputDepthPixelBufferPool:", -[BWPixelBufferPool cvPixelBufferPool](-[BWVISProcessorControllerConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool"), "cvPixelBufferPool"));
  -[VISConfiguration setOutputDepthAuxAttributes:](self->_visConfiguration, "setOutputDepthAuxAttributes:", -[BWPixelBufferPool cvPixelBufferPoolAuxAttributes](-[BWVISProcessorControllerConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool"), "cvPixelBufferPoolAuxAttributes"));
  -[VISConfiguration setDistortionCorrectionEnabledPortTypes:](self->_visConfiguration, "setDistortionCorrectionEnabledPortTypes:", -[BWVISProcessorControllerConfiguration distortionCorrectionEnabledPortTypes](self->_configuration, "distortionCorrectionEnabledPortTypes"));
  -[VISConfiguration setDistortionCompensationEnabledPortTypes:](self->_visConfiguration, "setDistortionCompensationEnabledPortTypes:", -[BWVISProcessorControllerConfiguration distortionCompensationEnabledPortTypes](self->_configuration, "distortionCompensationEnabledPortTypes"));
  -[BWVISProcessorControllerConfiguration minDistanceForBravoParallaxShift](self->_configuration, "minDistanceForBravoParallaxShift");
  -[VISConfiguration setMinDistanceForBravoParallaxShift:](self->_visConfiguration, "setMinDistanceForBravoParallaxShift:");
  -[VISConfiguration setVideoSTFParameters:](self->_visConfiguration, "setVideoSTFParameters:", -[BWVISProcessorControllerConfiguration videoSTFParameters](self->_configuration, "videoSTFParameters"));
  -[VISConfiguration setVideoGreenGhostMitigationParameters:](self->_visConfiguration, "setVideoGreenGhostMitigationParameters:", -[BWVISProcessorControllerConfiguration videoGreenGhostMitigationParameters](self->_configuration, "videoGreenGhostMitigationParameters"));
  -[VISConfiguration setCameraExtrinsicMatrix:](self->_visConfiguration, "setCameraExtrinsicMatrix:", -[BWVISProcessorControllerConfiguration cameraExtrinsicMatrix](self->_configuration, "cameraExtrinsicMatrix"));
  -[VISConfiguration setEnableRollingShutterCorrectionOnly:](self->_visConfiguration, "setEnableRollingShutterCorrectionOnly:", -[BWVISProcessorControllerConfiguration enableRollingShutterCorrectionOnly](self->_configuration, "enableRollingShutterCorrectionOnly"));
  -[VISConfiguration setDisableTransformLimitsForPredeterminedTrajectory:](self->_visConfiguration, "setDisableTransformLimitsForPredeterminedTrajectory:", -[BWVISProcessorControllerConfiguration disableTransformLimitsForPredeterminedTrajectory](self->_configuration, "disableTransformLimitsForPredeterminedTrajectory"));
  -[VISConfiguration setUseCameraGeometry:](self->_visConfiguration, "setUseCameraGeometry:", -[BWVISProcessorControllerConfiguration useCameraGeometry](self->_configuration, "useCameraGeometry"));
  if (!-[NSDictionary count](-[BWVISProcessorControllerConfiguration outputAttachmentsPixelBufferPools](self->_configuration, "outputAttachmentsPixelBufferPools"), "count"))goto LABEL_20;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v10 || (v11 = v10, (v12 = objc_alloc_init(MEMORY[0x1E0C99E08])) == 0))
  {
LABEL_28:
    v24 = -12786;
    goto LABEL_31;
  }
  v13 = v12;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = -[BWVISProcessorControllerConfiguration outputAttachmentsPixelBufferPools](self->_configuration, "outputAttachmentsPixelBufferPools");
  v15 = -[NSDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v20 = -[NSDictionary objectForKeyedSubscript:](-[BWVISProcessorControllerConfiguration outputAttachmentsPixelBufferPools](self->_configuration, "outputAttachmentsPixelBufferPools"), "objectForKeyedSubscript:", v19);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v20, "cvPixelBufferPool"), v19);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v20, "cvPixelBufferPoolAuxAttributes"), v19);
      }
      v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }
  -[VISConfiguration setOutputAttachmentsPixelBufferPools:](self->_visConfiguration, "setOutputAttachmentsPixelBufferPools:", v11);
  -[VISConfiguration setOutputAttachmentsAuxAttributes:](self->_visConfiguration, "setOutputAttachmentsAuxAttributes:", v13);

LABEL_20:
  if (-[BWVISProcessorControllerConfiguration videoStabilizationStrength](self->_configuration, "videoStabilizationStrength") >= 3)
  {
    -[VISConfiguration setMotionBlurShimmerMitigationMethod:](self->_visConfiguration, "setMotionBlurShimmerMitigationMethod:", 3);
    LODWORD(v21) = 1113325568;
    -[VISConfiguration setHorizonCorrectionThreshold:](self->_visConfiguration, "setHorizonCorrectionThreshold:", v21);
    if (-[BWVISProcessorControllerConfiguration videoStabilizationStrength](self->_configuration, "videoStabilizationStrength") == 4)v22 = 2;
    else
      v22 = 1;
    -[VISConfiguration setHorizonCorrectionMode:](self->_visConfiguration, "setHorizonCorrectionMode:", v22);
  }
  -[VISConfiguration setZoomSmoothingEnabled:](self->_visConfiguration, "setZoomSmoothingEnabled:", -[BWVISProcessorControllerConfiguration zoomSmoothingEnabled](self->_configuration, "zoomSmoothingEnabled"));
  -[VISConfiguration setApplyFrameCropOffset:](self->_visConfiguration, "setApplyFrameCropOffset:", -[BWVISProcessorControllerConfiguration applyFrameCropOffset](self->_configuration, "applyFrameCropOffset"));
  -[VISProcessor setConfiguration:](self->_visProcessor, "setConfiguration:", self->_visConfiguration);
  v23 = -[VISProcessor prepareToProcess:](self->_visProcessor, "prepareToProcess:", 0);
  v24 = 0;
  if (v23)
  {
    v26 = v23;
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = v26;
    goto LABEL_31;
  }
  return v24;
}

- (void)dealloc
{
  objc_super v3;

  -[VISProcessor finishProcessing](self->_visProcessor, "finishProcessing");
  -[VISProcessor purgeResources](self->_visProcessor, "purgeResources");

  v3.receiver = self;
  v3.super_class = (Class)BWVISProcessorController;
  -[BWVISProcessorController dealloc](&v3, sel_dealloc);
}

- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3
{
  id Weak;
  int v6;

  if (!self->_visProcessor)
    return -12780;
  Weak = objc_loadWeak((id *)&self->_delegate);
  v6 = -12780;
  if (a3 && Weak)
  {
    if (!self->_buffersEnqueued)
    {
      -[VISProcessor setLongPressModeEnabled:](self->_visProcessor, "setLongPressModeEnabled:", self->_longPressModeEnabled);
      -[VISProcessor setFlipHorizontalOrientationEnabled:](self->_visProcessor, "setFlipHorizontalOrientationEnabled:", self->_flipHorizontalOrientationEnabled);
      -[VISProcessor setSmartStyleReversibilityProcessingEnabled:](self->_visProcessor, "setSmartStyleReversibilityProcessingEnabled:", self->_smartStyleReversibilityProcessingEnabled);
    }
    v6 = -[VISProcessor enqueueBufferForProcessing:](self->_visProcessor, "enqueueBufferForProcessing:", a3);
    if (v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_buffersEnqueued = 1;
    }
  }
  return v6;
}

- (int)finishPendingProcessing
{
  int v3;

  if (!objc_loadWeak((id *)&self->_delegate))
    return -12780;
  v3 = -[VISProcessor finishProcessing](self->_visProcessor, "finishProcessing");
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_buffersEnqueued = 0;
  }
  return v3;
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "didCompleteProcessingOfBuffer:withStatus:", a3, *(_QWORD *)&a4);
}

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (BOOL)smartStyleReversibilityProcessingEnabled
{
  return self->_smartStyleReversibilityProcessingEnabled;
}

- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityProcessingEnabled = a3;
}

- (BWVISProcessorControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BWVISProcessorDelegate)delegate
{
  return (BWVISProcessorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
