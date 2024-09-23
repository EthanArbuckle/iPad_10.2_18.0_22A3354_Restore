@implementation CAMStillImagePreviewQualityFilteredRenderingEnabledCommand

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithPreviewQualityFilteredRenderingEnabled:(BOOL)a3
{
  CAMStillImagePreviewQualityFilteredRenderingEnabledCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->__enabled = a3;
  return result;
}

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand initWithPreviewQualityFilteredRenderingEnabled:](self, "initWithPreviewQualityFilteredRenderingEnabled:", 0);
}

- (CAMStillImagePreviewQualityFilteredRenderingEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand initWithPreviewQualityFilteredRenderingEnabled:](self, "initWithPreviewQualityFilteredRenderingEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMStillImagePreviewQualityFilteredRenderingEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMStillImagePreviewQualityFilteredRenderingEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStillImagePreviewQualityFilteredRenderingEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPreviewQualityAdjustedPhotoFilterRenderingSupported"))
    objc_msgSend(v4, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled"));

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
