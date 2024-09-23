@implementation JFXEffectContinousLiveCapturePreviewOptions

- (id)initLiveCaptureOptions
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousLiveCapturePreviewOptions;
  v2 = -[JFXEffectContinousPreviewOptions initContinousPreviewOptions](&v5, sel_initContinousPreviewOptions);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "setBackgroundType:", 1);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXEffectContinousLiveCapturePreviewOptions;
  result = -[JFXEffectContinousPreviewOptions copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 88) = self->_rotateCameraFrameToInterfaceOrientation;
  return result;
}

- (BOOL)rotateCameraFrameToInterfaceOrientation
{
  return self->_rotateCameraFrameToInterfaceOrientation;
}

- (void)setRotateCameraFrameToInterfaceOrientation:(BOOL)a3
{
  self->_rotateCameraFrameToInterfaceOrientation = a3;
}

@end
