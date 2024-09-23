@implementation CAMPreviewLayerZoomPIPEnabledCommand

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMPreviewLayerZoomPIPEnabledCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->_enabled = a3;
  return result;
}

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMPreviewLayerZoomPIPEnabledCommand initWithEnabled:](self, "initWithEnabled:", 0);
}

- (CAMPreviewLayerZoomPIPEnabledCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewLayerZoomPIPEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMPreviewLayerZoomPIPEnabledCommand isEnabled](self, "isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentVideoPreviewLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isZoomPictureInPictureOverlaySupported"))
    objc_msgSend(v4, "setZoomPictureInPictureOverlayEnabled:", -[CAMPreviewLayerZoomPIPEnabledCommand isEnabled](self, "isEnabled"));

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end
