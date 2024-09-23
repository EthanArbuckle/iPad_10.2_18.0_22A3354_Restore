@implementation AVCapturePhotoInitiationSettings

+ (id)photoInitiationSettingsWithUserInitiatedRequestTimestamp:(unint64_t)a3
{
  return -[AVCapturePhotoInitiationSettings _initWithTimestamp:]([AVCapturePhotoInitiationSettings alloc], "_initWithTimestamp:", a3);
}

- (id)_initWithTimestamp:(unint64_t)a3
{
  AVCapturePhotoInitiationSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoInitiationSettings;
  v4 = -[AVCapturePhotoInitiationSettings init](&v6, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(AVCapturePhotoInitiationSettingsInternal);
    v4->_internal->uniqueID = +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID");
    v4->_internal->timestamp = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoInitiationSettings;
  -[AVCapturePhotoInitiationSettings dealloc](&v3, sel_dealloc);
}

- (unint64_t)timestamp
{
  return self->_internal->timestamp;
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (int64_t)flashMode
{
  return self->_internal->flashMode;
}

- (void)setFlashMode:(int64_t)a3
{
  self->_internal->flashMode = a3;
}

- (BOOL)isAutoStillImageStabilizationEnabled
{
  return self->_internal->autoStillImageStabilizationEnabled;
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)a3
{
  self->_internal->autoStillImageStabilizationEnabled = a3;
}

- (int64_t)HDRMode
{
  return self->_internal->HDRMode;
}

- (void)setHDRMode:(int64_t)a3
{
  self->_internal->HDRMode = a3;
}

- (BOOL)burstQualityCaptureEnabled
{
  return self->_internal->burstQualityCaptureEnabled;
}

- (void)setBurstQualityCaptureEnabled:(BOOL)a3
{
  self->_internal->burstQualityCaptureEnabled = a3;
}

@end
