@implementation AVMomentCaptureMovieFileOutputDelegateWrapper

+ (id)wrapperWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:delegate:connections:", a3, a4, a5);
}

- (AVMomentCaptureMovieFileOutputDelegateWrapper)initWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5
{
  AVMomentCaptureMovieFileOutputDelegateWrapper *v7;
  AVMomentCaptureMovieFileOutputDelegateWrapper *v8;
  AVWeakReferencingDelegateStorage *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMomentCaptureMovieFileOutputDelegateWrapper;
  v7 = -[AVCaptureFileOutputDelegateWrapper initWithURL:delegate:settingsID:connections:](&v11, sel_initWithURL_delegate_settingsID_connections_, objc_msgSend(a3, "movieFileURL"), 0, objc_msgSend(a3, "uniqueID"), a5);
  v8 = v7;
  if (v7)
  {
    v9 = -[AVCaptureFileOutputDelegateWrapper delegateStorage](v7, "delegateStorage");
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](v9, "setDelegate:queue:", a4, MEMORY[0x1E0C80D38]);
    v8->_videoCodecType = (NSString *)(id)objc_msgSend(a3, "videoCodecType");
    -[AVCaptureFileOutputDelegateWrapper setMetadata:](v8, "setMetadata:", objc_msgSend(a3, "movieMetadata"));
    if ((objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled") & 1) != 0)
    {
      v8->_spatialOverCaptureMovieFileURL = (NSURL *)(id)objc_msgSend(a3, "spatialOverCaptureMovieFileURL");
      v8->_spatialOverCaptureMovieMetadata = (NSArray *)(id)objc_msgSend(a3, "spatialOverCaptureMovieMetadata");
    }
    if (!v8->_spatialOverCaptureMovieFileURL)
      v8->_didFinishWritingSpatialOverCaptureMovieCallbackFired = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieFileOutputDelegateWrapper;
  -[AVCaptureFileOutputDelegateWrapper dealloc](&v3, sel_dealloc);
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (NSURL)spatialOverCaptureMovieFileURL
{
  return self->_spatialOverCaptureMovieFileURL;
}

- (NSArray)spatialOverCaptureMovieMetadata
{
  return self->_spatialOverCaptureMovieMetadata;
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (void)setResolvedSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)didFinishWritingMovieCallbackFired
{
  return self->_didFinishWritingMovieCallbackFired;
}

- (void)setDidFinishWritingMovieCallbackFired:(BOOL)a3
{
  self->_didFinishWritingMovieCallbackFired = a3;
}

- (BOOL)didFinishWritingSpatialOverCaptureMovieCallbackFired
{
  return self->_didFinishWritingSpatialOverCaptureMovieCallbackFired;
}

- (void)setDidFinishWritingSpatialOverCaptureMovieCallbackFired:(BOOL)a3
{
  self->_didFinishWritingSpatialOverCaptureMovieCallbackFired = a3;
}

@end
