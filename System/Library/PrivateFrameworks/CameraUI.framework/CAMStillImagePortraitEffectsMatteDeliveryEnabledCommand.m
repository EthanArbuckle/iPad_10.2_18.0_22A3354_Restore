@implementation CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *v4;
  CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *v5;
  CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
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

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPortraitEffectsMatteDeliverySupported"))
    objc_msgSend(v4, "setPortraitEffectsMatteDeliveryEnabled:", -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand _isEnabled](self, "_isEnabled"));

}

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand initWithPortraitEffectsMatteDeliveryEnabled:](self, "initWithPortraitEffectsMatteDeliveryEnabled:", 0);
}

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand initWithPortraitEffectsMatteDeliveryEnabled:](self, "initWithPortraitEffectsMatteDeliveryEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMStillImagePortraitEffectsMatteDeliveryEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMStillImagePortraitEffectsMatteDeliveryEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
