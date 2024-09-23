@implementation CAMPreviewLayerEnabledCommand

- (CAMPreviewLayerEnabledCommand)initWithPreviewLayerEnabled:(BOOL)a3
{
  CAMPreviewLayerEnabledCommand *v4;
  CAMPreviewLayerEnabledCommand *v5;
  CAMPreviewLayerEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewLayerEnabledCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[CAMPreviewLayerEnabledCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v4, "currentVideoPreviewLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && v5 != objc_msgSend(v6, "isEnabled"))
    objc_msgSend(v7, "setEnabled:", v5);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMPreviewLayerEnabledCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPreviewLayerEnabledCommand *v5;
  CAMPreviewLayerEnabledCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewLayerEnabledCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMPreviewLayerEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewLayerEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMPreviewLayerEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMPreviewLayerEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewLayerEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMPreviewLayerEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
