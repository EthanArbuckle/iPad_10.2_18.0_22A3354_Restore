@implementation BWMemoryAnalyticsPayload

- (void)setGraphHasVideoDataOutput:(BOOL)a3
{
  self->_graphHasVideoDataOutput = a3;
}

- (void)setGraphContainsMovieFilePipeline:(BOOL)a3
{
  self->_graphContainsMovieFilePipeline = a3;
}

- (void)setGraphContainsDepthDataPipeline:(BOOL)a3
{
  self->_graphContainsDepthDataPipeline = a3;
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (int)maxVideoStabilizationMethod
{
  return self->_maxVideoStabilizationMethod;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setMaxVideoStabilizationMethod:(int)a3
{
  self->_maxVideoStabilizationMethod = a3;
}

- (BWMemoryAnalyticsPayload)init
{
  BWMemoryAnalyticsPayload *v2;
  BWMemoryAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWMemoryAnalyticsPayload;
  v2 = -[BWMemoryAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWMemoryAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{

  self->_creationTime = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  self->_clientApplicationID = 0;
  self->_colorSpace = -1;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMemoryAnalyticsPayload;
  -[BWMemoryAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)addCaptureType:(int)a3
{
  uint64_t v3;

  ++self->_captureCount;
  if (a3 > 10)
  {
    if (a3 == 11)
    {
      v3 = 42;
      goto LABEL_11;
    }
    if (a3 == 12)
    {
      v3 = 41;
      goto LABEL_11;
    }
LABEL_8:
    v3 = 43;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    v3 = 44;
    goto LABEL_11;
  }
  if (a3 != 10)
    goto LABEL_8;
  v3 = 40;
LABEL_11:
  *((_BYTE *)&self->super.isa + v3) = 1;
}

- (void)addDeviceType:(int)a3
{
  uint64_t v3;

  if ((a3 - 4) > 9)
    v3 = 29;
  else
    v3 = qword_1A32B18A0[a3 - 4];
  *((_BYTE *)&self->super.isa + v3) = 1;
}

- (void)addHighResolutionFlavor:(int)a3
{
  if (a3 <= 2)
    *(&self->_captureResolutionDefault + a3) = 1;
}

- (void)addPortType:(id)a3
{
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;

  v5 = *MEMORY[0x1E0D05A30];
  v6 = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]);
  v7 = (_QWORD *)MEMORY[0x1E0D05A18];
  if ((v6 & 1) != 0)
  {
    v8 = 34;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]) & 1) != 0)
  {
    v8 = 33;
  }
  else
  {
    v9 = objc_msgSend(a3, "isEqualToString:", *v7);
    v8 = 35;
    if (v9)
      v8 = 36;
  }
  *((_BYTE *)&self->super.isa + v8) = 1;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A40]) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A50]) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A48]))
  {
    self->_captureDevicePositionFront = 1;
  }
  if ((objc_msgSend(a3, "isEqualToString:", *v7) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", v5) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A28]) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A20]))
  {
    self->_captureDevicePositionBack = 1;
  }
}

- (void)updateButtonMash:(BOOL)a3
{
  int buttonMashRate0Counter;
  int v4;
  unsigned int maxButtonMashCount;

  buttonMashRate0Counter = self->_buttonMashRate0Counter;
  if (a3)
  {
    v4 = buttonMashRate0Counter + 1;
  }
  else
  {
    if (buttonMashRate0Counter < 1)
      return;
    v4 = 0;
    if (self->_maxButtonMashCount <= buttonMashRate0Counter + 1)
      maxButtonMashCount = buttonMashRate0Counter + 1;
    else
      maxButtonMashCount = self->_maxButtonMashCount;
    self->_maxButtonMashCount = maxButtonMashCount;
  }
  self->_buttonMashRate0Counter = v4;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.MemoryAnalytics");
}

- (id)eventDictionary
{
  void *v3;
  void *v4;
  double v5;

  -[BWMemoryAnalyticsPayload updateButtonMash:](self, "updateButtonMash:", 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceNow](self->_creationTime, "timeIntervalSinceNow");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "numberWithDouble:", -v5), CFSTR("duration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_burst), CFSTR("burst"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDevicePositionFront), CFSTR("captureDevicePositionFront"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDevicePositionBack), CFSTR("captureDevicePositionBack"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypeBravo), CFSTR("captureDeviceTypeBravo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypeSuperBravo), CFSTR("captureDeviceTypeSuperBravo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypeWideBravo), CFSTR("captureDeviceTypeWideBravo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypePearl), CFSTR("captureDeviceTypePearl"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypeLiDAR), CFSTR("captureDeviceTypeLiDAR"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureDeviceTypeOther), CFSTR("captureDeviceTypeOther"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_capturePortTypeBackTelephoto), CFSTR("capturePortTypeBackTelephoto"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_capturePortTypeBackSuperWide), CFSTR("capturePortTypeBackSuperWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_capturePortTypeBack), CFSTR("capturePortTypeBack"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_capturePortTypeOther), CFSTR("capturePortTypeOther"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureResolutionDefault), CFSTR("captureResolutionDefault"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureResolutionEnhanced), CFSTR("captureResolutionEnhanced"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureResolutionUltraHigh), CFSTR("captureResolutionUltraHigh"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureTypeDeepFusion), CFSTR("captureTypeDeepFusion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureTypeDigitalFlash), CFSTR("captureTypeDigitalFlash"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureTypeOther), CFSTR("captureTypeOther"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureTypeWYSIWYG), CFSTR("captureTypeWYSIWYG"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captureTypeUB), CFSTR("captureTypeUB"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_graphContainsDepthDataPipeline), CFSTR("graphContainsDepthDataPipeline"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_graphContainsMovieFilePipeline), CFSTR("graphContainsMovieFilePipeline"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_graphHasVideoDataOutput), CFSTR("graphHasVideoDataOutput"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_greenGhostMitigation), CFSTR("greenGhostMitigation"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_scaledStillCaptureTaken), CFSTR("scaledStillCaptureTaken"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_intelligentDistortionCorrection), CFSTR("intelligentDistortionCorrection"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_livePhoto), CFSTR("livePhoto"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxButtonMashCount), CFSTR("maxButtonMashCount"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proRaw), CFSTR("proRaw"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proRawPlusProcessedPhotoEncoding), CFSTR("proRawPlusProcessedPhotoEncoding"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_quickTakeVideo), CFSTR("quickTakeVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_faceDetectedInScene), CFSTR("faceDetectedInScene"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_photographicStyleUsed), CFSTR("photographicStyleUsed"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enhancedResolutionPortraitSuggested), CFSTR("_enhancedResolutionPortraitSuggested"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enhancedResolutionPortraitApplied), CFSTR("_enhancedResolutionPortraitApplied"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_portraitRequested), CFSTR("portraitRequested"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_portraitDepthGenerationAttempted), CFSTR("portraitDepthGenerationAttempted"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_portraitEffectApplied), CFSTR("portraitEffectApplied"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cinematicVideo), CFSTR("cinematicVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hdrVideo), CFSTR("hdrVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proResVideo), CFSTR("proResVideo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_colorSpace), CFSTR("colorSpace"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoMinDimension), CFSTR("videoMinDimension"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoMaxFrameRate), CFSTR("videoMaxFrameRate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoRecordingCount), CFSTR("videoRecordingCount"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxVideoStabilizationMethod), CFSTR("maxVideoStabilizationMethod"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_videoStabilizationStrength), CFSTR("videoStabilizationStrength"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dockKitDeviceConnected), CFSTR("dockKitDeviceConnected"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_captureCount), CFSTR("captureCount"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_peakFootprintDifference * 0.000000953674316), CFSTR("peakFootprintDifferenceMiB"));
  return v3;
}

- (BOOL)burst
{
  return self->_burst;
}

- (void)setBurst:(BOOL)a3
{
  self->_burst = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (BOOL)graphContainsDepthDataPipeline
{
  return self->_graphContainsDepthDataPipeline;
}

- (BOOL)graphContainsMovieFilePipeline
{
  return self->_graphContainsMovieFilePipeline;
}

- (BOOL)graphHasVideoDataOutput
{
  return self->_graphHasVideoDataOutput;
}

- (BOOL)greenGhostMitigation
{
  return self->_greenGhostMitigation;
}

- (void)setGreenGhostMitigation:(BOOL)a3
{
  self->_greenGhostMitigation = a3;
}

- (BOOL)scaledStillCaptureTaken
{
  return self->_scaledStillCaptureTaken;
}

- (void)setScaledStillCaptureTaken:(BOOL)a3
{
  self->_scaledStillCaptureTaken = a3;
}

- (BOOL)intelligentDistortionCorrection
{
  return self->_intelligentDistortionCorrection;
}

- (void)setIntelligentDistortionCorrection:(BOOL)a3
{
  self->_intelligentDistortionCorrection = a3;
}

- (BOOL)livePhoto
{
  return self->_livePhoto;
}

- (void)setLivePhoto:(BOOL)a3
{
  self->_livePhoto = a3;
}

- (BOOL)proRaw
{
  return self->_proRaw;
}

- (void)setProRaw:(BOOL)a3
{
  self->_proRaw = a3;
}

- (BOOL)proRawPlusProcessedPhotoEncoding
{
  return self->_proRawPlusProcessedPhotoEncoding;
}

- (void)setProRawPlusProcessedPhotoEncoding:(BOOL)a3
{
  self->_proRawPlusProcessedPhotoEncoding = a3;
}

- (BOOL)quickTakeVideo
{
  return self->_quickTakeVideo;
}

- (void)setQuickTakeVideo:(BOOL)a3
{
  self->_quickTakeVideo = a3;
}

- (BOOL)portraitRequested
{
  return self->_portraitRequested;
}

- (void)setPortraitRequested:(BOOL)a3
{
  self->_portraitRequested = a3;
}

- (BOOL)portraitDepthGenerationAttempted
{
  return self->_portraitDepthGenerationAttempted;
}

- (void)setPortraitDepthGenerationAttempted:(BOOL)a3
{
  self->_portraitDepthGenerationAttempted = a3;
}

- (BOOL)portraitEffectApplied
{
  return self->_portraitEffectApplied;
}

- (void)setPortraitEffectApplied:(BOOL)a3
{
  self->_portraitEffectApplied = a3;
}

- (unint64_t)peakFootprintDifference
{
  return self->_peakFootprintDifference;
}

- (void)setPeakFootprintDifference:(unint64_t)a3
{
  self->_peakFootprintDifference = a3;
}

- (BOOL)cinematicVideo
{
  return self->_cinematicVideo;
}

- (void)setCinematicVideo:(BOOL)a3
{
  self->_cinematicVideo = a3;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (BOOL)proResVideo
{
  return self->_proResVideo;
}

- (void)setProResVideo:(BOOL)a3
{
  self->_proResVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (unsigned)videoMinDimension
{
  return self->_videoMinDimension;
}

- (void)setVideoMinDimension:(unsigned int)a3
{
  self->_videoMinDimension = a3;
}

- (unsigned)videoMaxFrameRate
{
  return self->_videoMaxFrameRate;
}

- (void)setVideoMaxFrameRate:(unsigned int)a3
{
  self->_videoMaxFrameRate = a3;
}

- (unsigned)videoRecordingCount
{
  return self->_videoRecordingCount;
}

- (void)setVideoRecordingCount:(unsigned int)a3
{
  self->_videoRecordingCount = a3;
}

- (BOOL)dockKitDeviceConnected
{
  return self->_dockKitDeviceConnected;
}

- (void)setDockKitDeviceConnected:(BOOL)a3
{
  self->_dockKitDeviceConnected = a3;
}

- (BOOL)faceDetectedInScene
{
  return self->_faceDetectedInScene;
}

- (void)setFaceDetectedInScene:(BOOL)a3
{
  self->_faceDetectedInScene = a3;
}

- (BOOL)photographicStyleUsed
{
  return self->_photographicStyleUsed;
}

- (void)setPhotographicStyleUsed:(BOOL)a3
{
  self->_photographicStyleUsed = a3;
}

- (BOOL)enhancedResolutionPortraitSuggested
{
  return self->_enhancedResolutionPortraitSuggested;
}

- (void)setEnhancedResolutionPortraitSuggested:(BOOL)a3
{
  self->_enhancedResolutionPortraitSuggested = a3;
}

- (BOOL)enhancedResolutionPortraitApplied
{
  return self->_enhancedResolutionPortraitApplied;
}

- (void)setEnhancedResolutionPortraitApplied:(BOOL)a3
{
  self->_enhancedResolutionPortraitApplied = a3;
}

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

@end
