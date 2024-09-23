@implementation CAMResponsiveShutterEnabledCommand

- (CAMResponsiveShutterEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMResponsiveShutterEnabledCommand *v4;
  CAMResponsiveShutterEnabledCommand *v5;
  CAMResponsiveShutterEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMResponsiveShutterEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMResponsiveShutterEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMResponsiveShutterEnabledCommand initWithEnabled:](self, "initWithEnabled:", 0);
}

- (CAMResponsiveShutterEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMResponsiveShutterEnabledCommand initWithEnabled:](self, "initWithEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMResponsiveShutterEnabledCommandKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMResponsiveShutterEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMResponsiveShutterEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMResponsiveShutterEnabledCommandKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMResponsiveShutterEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMResponsiveShutterEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  _BOOL8 v4;
  id v5;

  objc_msgSend(a3, "currentStillImageOutput");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMResponsiveShutterEnabledCommand _isEnabled](self, "_isEnabled");
  if (objc_msgSend(v5, "isResponsiveCaptureSupported"))
    objc_msgSend(v5, "setResponsiveCaptureEnabled:", 1);
  if (objc_msgSend(v5, "isFastCapturePrioritizationSupported"))
    objc_msgSend(v5, "setFastCapturePrioritizationEnabled:", v4);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
