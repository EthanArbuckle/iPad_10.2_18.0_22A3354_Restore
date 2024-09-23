@implementation CAMStillImageFilteredRenderingEnabledCommand

- (CAMStillImageFilteredRenderingEnabledCommand)initWithFilteredRenderingEnabled:(BOOL)a3
{
  CAMStillImageFilteredRenderingEnabledCommand *v4;
  CAMStillImageFilteredRenderingEnabledCommand *v5;
  CAMStillImageFilteredRenderingEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
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
  id v6;

  v4 = a3;
  v5 = -[CAMStillImageFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFilterRenderingEnabled:", v5);
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMStillImageFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMStillImageFilteredRenderingEnabledCommand initWithFilteredRenderingEnabled:](self, "initWithFilteredRenderingEnabled:", 0);
}

- (CAMStillImageFilteredRenderingEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMStillImageFilteredRenderingEnabledCommand initWithFilteredRenderingEnabled:](self, "initWithFilteredRenderingEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMStillImageFilteredRenderingEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImageFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMStillImageFilteredRenderingEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStillImageFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
