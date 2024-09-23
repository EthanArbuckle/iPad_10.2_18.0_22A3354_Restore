@implementation CAMAutoFPSVideoCommand

- (CAMAutoFPSVideoCommand)initWithAutoFPSVideoEnabled:(BOOL)a3
{
  CAMAutoFPSVideoCommand *v4;
  CAMAutoFPSVideoCommand *v5;
  CAMAutoFPSVideoCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMAutoFPSVideoCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_autoFPSVideoEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMAutoFPSVideoCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMAutoFPSVideoCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMAutoFPSVideoCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMAutoFPSVideoCommand isAutoFPSVideoEnabled](self, "isAutoFPSVideoEnabled");
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

  if (objc_msgSend(v5, "isVariableFrameRateVideoCaptureSupported"))
  {
    objc_msgSend(v6, "setVariableFrameRateVideoCaptureEnabled:", -[CAMAutoFPSVideoCommand isAutoFPSVideoEnabled](self, "isAutoFPSVideoEnabled"));
  }
  else if (objc_msgSend(v5, "isLowLightVideoCaptureSupported"))
  {
    objc_msgSend(v6, "setLowLightVideoCaptureEnabled:", -[CAMAutoFPSVideoCommand isAutoFPSVideoEnabled](self, "isAutoFPSVideoEnabled"));
  }

}

- (BOOL)isAutoFPSVideoEnabled
{
  return self->_autoFPSVideoEnabled;
}

@end
