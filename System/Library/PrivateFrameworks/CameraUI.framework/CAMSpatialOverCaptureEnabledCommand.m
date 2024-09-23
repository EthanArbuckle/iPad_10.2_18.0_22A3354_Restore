@implementation CAMSpatialOverCaptureEnabledCommand

- (CAMSpatialOverCaptureEnabledCommand)initWithSpatialOverCaptureEnabled:(BOOL)a3
{
  CAMSpatialOverCaptureEnabledCommand *v4;
  CAMSpatialOverCaptureEnabledCommand *v5;
  CAMSpatialOverCaptureEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMSpatialOverCaptureEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMSpatialOverCaptureEnabledCommand initWithSpatialOverCaptureEnabled:](self, "initWithSpatialOverCaptureEnabled:", 0);
}

- (CAMSpatialOverCaptureEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMSpatialOverCaptureEnabledCommand initWithSpatialOverCaptureEnabled:](self, "initWithSpatialOverCaptureEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMSpatialOverCaptureEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMSpatialOverCaptureEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMSpatialOverCaptureEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMSpatialOverCaptureEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isSpatialOverCaptureSupported"))
    objc_msgSend(v7, "setSpatialOverCaptureEnabled:", -[CAMSpatialOverCaptureEnabledCommand _isEnabled](self, "_isEnabled"));
  objc_msgSend(v6, "setSpatialOverCaptureEnabled:", 0);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
