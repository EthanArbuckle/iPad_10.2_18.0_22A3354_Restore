@implementation CAMStillImageDepthDataDeliveryEnabledCommand

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithDepthDataDeliveryEnabled:(BOOL)a3
{
  CAMStillImageDepthDataDeliveryEnabledCommand *v4;
  CAMStillImageDepthDataDeliveryEnabledCommand *v5;
  CAMStillImageDepthDataDeliveryEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
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
  v5 = -[CAMStillImageDepthDataDeliveryEnabledCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isDepthDataDeliverySupported"))
    objc_msgSend(v6, "setDepthDataDeliveryEnabled:", v5);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMStillImageDepthDataDeliveryEnabledCommand initWithDepthDataDeliveryEnabled:](self, "initWithDepthDataDeliveryEnabled:", 0);
}

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMStillImageDepthDataDeliveryEnabledCommand initWithDepthDataDeliveryEnabled:](self, "initWithDepthDataDeliveryEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMStillImageDepthDataDeliveryEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImageDepthDataDeliveryEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMStillImageDepthDataDeliveryEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStillImageDepthDataDeliveryEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
