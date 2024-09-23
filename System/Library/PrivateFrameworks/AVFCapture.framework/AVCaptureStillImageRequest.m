@implementation AVCaptureStillImageRequest

+ (id)request
{
  return objc_alloc_init(AVCaptureStillImageRequest);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageRequest;
  -[AVCaptureStillImageRequest dealloc](&v3, sel_dealloc);
}

- (id)sbufCompletionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setSbufCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)iosurfaceCompletionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setIosurfaceCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)bracketedCaptureCompletionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBracketedCaptureCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (unsigned)shutterSoundID
{
  return self->_shutterSoundID;
}

- (void)setShutterSoundID:(unsigned int)a3
{
  self->_shutterSoundID = a3;
}

- (AVCaptureBracketedStillImageSettings)bracketedSettings
{
  return (AVCaptureBracketedStillImageSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBracketedSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
