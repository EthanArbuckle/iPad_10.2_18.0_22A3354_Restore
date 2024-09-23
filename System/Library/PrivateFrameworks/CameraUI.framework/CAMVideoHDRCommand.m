@implementation CAMVideoHDRCommand

- (CAMVideoHDRCommand)initWithVideoHDREnabled:(BOOL)a3
{
  CAMVideoHDRCommand *v4;
  CAMVideoHDRCommand *v5;
  CAMVideoHDRCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoHDRCommand;
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
  void *v5;
  void *v6;
  _BOOL8 v7;
  char v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevicePreset");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CAMVideoHDRCommand _isEnabled](self, "_isEnabled");
  v8 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A188]);
  if (!v9 || (v8 & 1) != 0)
  {
    if (v5 && objc_msgSend(v5, "isVideoHDRSupported"))
    {
      objc_msgSend(v6, "setAutomaticallyAdjustsVideoHDREnabled:", 0);
      objc_msgSend(v6, "setVideoHDREnabled:", v7);
    }
  }
  else
  {
    objc_msgSend(v6, "setAutomaticallyAdjustsVideoHDREnabled:", v7);
  }

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMVideoHDRCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoHDRCommand *v5;
  CAMVideoHDRCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoHDRCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoHDRCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoHDRCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoHDRCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoHDRCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoHDRCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoHDRCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
