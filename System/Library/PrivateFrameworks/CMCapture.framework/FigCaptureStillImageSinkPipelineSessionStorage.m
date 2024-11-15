@implementation FigCaptureStillImageSinkPipelineSessionStorage

- (FigCaptureCameraSourcePipeline)cameraSourcePipeline
{
  return self->_cameraSourcePipeline;
}

- (FigCaptureStillImageSinkPipelineSessionStorage)initWithStillImageSinkPipeline:(id)a3 cameraSourcePipeline:(id)a4 previewSinkNode:(id)a5 pixelConverter:(id)a6 colorInfo:(id)a7 stillImagesAreOptimizedForOfflineVideoStabilization:(BOOL)a8 videoStabilizationOverscanCropMultiplier:(float)a9 preparedBracket:(id)a10 stillImageConnectionConfiguration:(id)a11
{
  FigCaptureStillImageSinkPipelineSessionStorage *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FigCaptureStillImageSinkPipelineSessionStorage;
  v18 = -[FigCaptureStillImageSinkPipelineSessionStorage init](&v20, sel_init);
  if (v18)
  {
    v18->_stillImageSinkPipeline = (FigCaptureStillImageSinkPipeline *)a3;
    v18->_cameraSourcePipeline = (FigCaptureCameraSourcePipeline *)a4;
    v18->_previewSinkNode = (BWImageQueueSinkNode *)a5;
    v18->_pixelConverter = (FigCapturePixelConverter *)a6;
    v18->_colorInfo = (NSDictionary *)a7;
    v18->_stillImagesAreOptimizedForOfflineVideoStabilization = a8;
    v18->_videoStabilizationOverscanCropMultiplier = a9;
    v18->_preparedBracket = (FigCaptureSessionPreparedBracket *)a10;
    v18->_stillImageConnectionConfiguration = (FigVideoCaptureConnectionConfiguration *)a11;
  }
  return v18;
}

- (FigCaptureStillImageSinkPipeline)stillImageSinkPipeline
{
  return self->_stillImageSinkPipeline;
}

- (void)dealloc
{
  opaqueCMFormatDescription *stillImageFormatDescription;
  opaqueCMFormatDescription *previewFormatDescription;
  opaqueCMFormatDescription *rawFormatDescription;
  objc_super v6;

  stillImageFormatDescription = self->_stillImageFormatDescription;
  if (stillImageFormatDescription)
    CFRelease(stillImageFormatDescription);
  previewFormatDescription = self->_previewFormatDescription;
  if (previewFormatDescription)
    CFRelease(previewFormatDescription);
  rawFormatDescription = self->_rawFormatDescription;
  if (rawFormatDescription)
    CFRelease(rawFormatDescription);

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkPipelineSessionStorage;
  -[FigCaptureStillImageSinkPipelineSessionStorage dealloc](&v6, sel_dealloc);
}

- (const)stillImageFormatDescriptionPtr
{
  return &self->_stillImageFormatDescription;
}

- (const)previewFormatDescriptionPtr
{
  return &self->_previewFormatDescription;
}

- (const)rawFormatDescriptionPtr
{
  return &self->_rawFormatDescription;
}

- (FigCaptureSessionPreparedBracket)preparedBracket
{
  return self->_preparedBracket;
}

- (BWImageQueueSinkNode)previewSinkNode
{
  return self->_previewSinkNode;
}

- (FigCapturePixelConverter)pixelConverter
{
  return self->_pixelConverter;
}

- (NSDictionary)colorInfo
{
  return self->_colorInfo;
}

- (BOOL)stillImagesAreOptimizedForOfflineVideoStabilization
{
  return self->_stillImagesAreOptimizedForOfflineVideoStabilization;
}

- (float)videoStabilizationOverscanCropMultiplier
{
  return self->_videoStabilizationOverscanCropMultiplier;
}

- (void)setVideoStabilizationOverscanCropMultiplier:(float)a3
{
  self->_videoStabilizationOverscanCropMultiplier = a3;
}

- (NSArray)rawDNGColorCalibrations
{
  return self->_rawDNGColorCalibrations;
}

- (void)setRawDNGColorCalibrations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)currentUserInitiatedRequestHostTime
{
  return self->_currentUserInitiatedRequestHostTime;
}

- (void)setCurrentUserInitiatedRequestHostTime:(unint64_t)a3
{
  self->_currentUserInitiatedRequestHostTime = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUserInitiatedRequestPTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setCurrentUserInitiatedRequestPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_currentUserInitiatedRequestPTS.epoch = a3->var3;
  *(_OWORD *)&self->_currentUserInitiatedRequestPTS.value = v3;
}

- (int64_t)mostRecentBurstSettingsID
{
  return self->_mostRecentBurstSettingsID;
}

- (void)setMostRecentBurstSettingsID:(int64_t)a3
{
  self->_mostRecentBurstSettingsID = a3;
}

- (BOOL)videoStabilizationOverscanCropEnabled
{
  return self->_videoStabilizationOverscanCropEnabled;
}

- (void)setVideoStabilizationOverscanCropEnabled:(BOOL)a3
{
  self->_videoStabilizationOverscanCropEnabled = a3;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

@end
