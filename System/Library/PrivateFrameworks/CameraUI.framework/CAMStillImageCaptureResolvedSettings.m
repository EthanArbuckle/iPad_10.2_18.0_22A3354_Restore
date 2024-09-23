@implementation CAMStillImageCaptureResolvedSettings

- (BOOL)isHDREnabled
{
  return self->_HDREnabled;
}

- (BOOL)isPortraitEffectEnabled
{
  return self->_portraitEffectEnabled;
}

- (CAMStillImageCaptureResolvedSettings)initWithHDREnabled:(BOOL)a3 portraitEffectEnabled:(BOOL)a4 lowLightCaptureTime:(double)a5 lowLightPreviewColorEstimate:(CGColor *)a6 lowLightCaptureHasInitialPreviewFeedbackSensitivity:(BOOL)a7 lowLightCaptureHasConstantPreviewFeedbackSensitivity:(BOOL)a8 captureBeforeResolvingSettingsEnabled:(BOOL)a9
{
  CAMStillImageCaptureResolvedSettings *v16;
  CAMStillImageCaptureResolvedSettings *v17;
  CAMStillImageCaptureResolvedSettings *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMStillImageCaptureResolvedSettings;
  v16 = -[CAMStillImageCaptureResolvedSettings init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_HDREnabled = a3;
    v16->_portraitEffectEnabled = a4;
    v16->_lowLightCaptureTime = a5;
    v16->_lowLightPreviewColorEstimate = CGColorRetain(a6);
    v17->_lowLightCaptureHasInitialPreviewFeedbackSensitivity = a7;
    v17->_lowLightCaptureHasConstantPreviewFeedbackSensitivity = a8;
    v17->_captureBeforeResolvingSettingsEnabled = a9;
    v18 = v17;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_lowLightPreviewColorEstimate);
  v3.receiver = self;
  v3.super_class = (Class)CAMStillImageCaptureResolvedSettings;
  -[CAMStillImageCaptureResolvedSettings dealloc](&v3, sel_dealloc);
}

- (double)lowLightCaptureTime
{
  return self->_lowLightCaptureTime;
}

- (CGColor)lowLightPreviewColorEstimate
{
  return self->_lowLightPreviewColorEstimate;
}

- (BOOL)lowLightCaptureHasInitialPreviewFeedbackSensitivity
{
  return self->_lowLightCaptureHasInitialPreviewFeedbackSensitivity;
}

- (BOOL)lowLightCaptureHasConstantPreviewFeedbackSensitivity
{
  return self->_lowLightCaptureHasConstantPreviewFeedbackSensitivity;
}

- (BOOL)isCaptureBeforeResolvingSettingsEnabled
{
  return self->_captureBeforeResolvingSettingsEnabled;
}

@end
