@implementation CAMContentAwareDistortionCorrectionCommand

- (CAMContentAwareDistortionCorrectionCommand)initWithContentAwareDistortionCorrectionEnabled:(BOOL)a3
{
  CAMContentAwareDistortionCorrectionCommand *v4;
  CAMContentAwareDistortionCorrectionCommand *v5;
  CAMContentAwareDistortionCorrectionCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMContentAwareDistortionCorrectionCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMContentAwareDistortionCorrectionCommand)initWithSubcommands:(id)a3
{
  return -[CAMContentAwareDistortionCorrectionCommand initWithContentAwareDistortionCorrectionEnabled:](self, "initWithContentAwareDistortionCorrectionEnabled:", 0);
}

- (CAMContentAwareDistortionCorrectionCommand)initWithCoder:(id)a3
{
  return -[CAMContentAwareDistortionCorrectionCommand initWithContentAwareDistortionCorrectionEnabled:](self, "initWithContentAwareDistortionCorrectionEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMContentAwareDistortionCorrectionKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMContentAwareDistortionCorrectionCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMContentAwareDistortionCorrectionCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMContentAwareDistortionCorrectionKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMContentAwareDistortionCorrectionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMContentAwareDistortionCorrectionCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "isContentAwareDistortionCorrectionSupported"))
  {
    objc_msgSend(v4, "setContentAwareDistortionCorrectionEnabled:", -[CAMContentAwareDistortionCorrectionCommand _isEnabled](self, "_isEnabled"));
  }

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
