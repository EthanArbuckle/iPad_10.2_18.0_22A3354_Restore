@implementation CAMNonDestructiveCropEnabledCommand

- (CAMNonDestructiveCropEnabledCommand)initWithNonDestructiveCropEnabled:(BOOL)a3
{
  CAMNonDestructiveCropEnabledCommand *v4;
  CAMNonDestructiveCropEnabledCommand *v5;
  CAMNonDestructiveCropEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMNonDestructiveCropEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMNonDestructiveCropEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMNonDestructiveCropEnabledCommand initWithNonDestructiveCropEnabled:](self, "initWithNonDestructiveCropEnabled:", 0);
}

- (CAMNonDestructiveCropEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMNonDestructiveCropEnabledCommand initWithNonDestructiveCropEnabled:](self, "initWithNonDestructiveCropEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMNonDestructiveCropEnabledKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMNonDestructiveCropEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMNonDestructiveCropEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMNonDestructiveCropEnabledKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMNonDestructiveCropEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMNonDestructiveCropEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isNonDestructiveCropSupported"))
    objc_msgSend(v6, "setNonDestructiveCropEnabled:", -[CAMNonDestructiveCropEnabledCommand _isEnabled](self, "_isEnabled"));

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
