@implementation CAMHighResolutionStillImageCommand

- (CAMHighResolutionStillImageCommand)initWithHighResolutionStillImageCaptureEnabled:(BOOL)a3
{
  CAMHighResolutionStillImageCommand *v4;
  CAMHighResolutionStillImageCommand *v5;
  CAMHighResolutionStillImageCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMHighResolutionStillImageCommand;
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

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighResolutionCaptureEnabled:", -[CAMHighResolutionStillImageCommand _isEnabled](self, "_isEnabled"));

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMHighResolutionStillImageCommand)initWithCoder:(id)a3
{
  id v4;
  CAMHighResolutionStillImageCommand *v5;
  CAMHighResolutionStillImageCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMHighResolutionStillImageCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMHighResolutionStillImageCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMHighResolutionStillImageCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMHighResolutionStillImageCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMHighResolutionStillImageCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMHighResolutionStillImageCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMHighResolutionStillImageCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
