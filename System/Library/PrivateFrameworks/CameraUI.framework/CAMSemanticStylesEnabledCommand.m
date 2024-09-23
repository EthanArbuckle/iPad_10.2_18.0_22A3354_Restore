@implementation CAMSemanticStylesEnabledCommand

- (CAMSemanticStylesEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMSemanticStylesEnabledCommand *v4;
  CAMSemanticStylesEnabledCommand *v5;
  CAMSemanticStylesEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSemanticStylesEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMSemanticStylesEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMSemanticStylesEnabledCommand initWithEnabled:](self, "initWithEnabled:", 0);
}

- (CAMSemanticStylesEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMSemanticStylesEnabledCommand initWithEnabled:](self, "initWithEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMSemanticStylesEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSemanticStylesEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMSemanticStylesEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMSemanticStylesEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSemanticStylesEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMSemanticStylesEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSemanticStyleRenderingSupported"))
    objc_msgSend(v4, "setSemanticStyleRenderingEnabled:", -[CAMSemanticStylesEnabledCommand _isEnabled](self, "_isEnabled"));

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
