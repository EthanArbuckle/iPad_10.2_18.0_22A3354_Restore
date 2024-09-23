@implementation CAMQuadraHighResolutionStillImageCommand

- (CAMQuadraHighResolutionStillImageCommand)initWithFeatureEnabled:(BOOL)a3
{
  CAMQuadraHighResolutionStillImageCommand *v4;
  CAMQuadraHighResolutionStillImageCommand *v5;
  CAMQuadraHighResolutionStillImageCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
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
  void *v4;
  int v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "currentVideoDeviceFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsQuadraHighResolutionStillImageOutput");
  v6 = -[CAMQuadraHighResolutionStillImageCommand _isEnabled](self, "_isEnabled");
  if (v5)
  {
    v7 = v6;
    objc_msgSend(v9, "currentStillImageOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighResolutionCaptureEnabled:", v7);

  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMQuadraHighResolutionStillImageCommand)initWithCoder:(id)a3
{
  id v4;
  CAMQuadraHighResolutionStillImageCommand *v5;
  CAMQuadraHighResolutionStillImageCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMFeature0StillImageCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMQuadraHighResolutionStillImageCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMFeature0StillImageCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMQuadraHighResolutionStillImageCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
