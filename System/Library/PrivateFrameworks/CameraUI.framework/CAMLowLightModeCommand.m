@implementation CAMLowLightModeCommand

- (CAMLowLightModeCommand)initWithLowLightMode:(int64_t)a3
{
  CAMLowLightModeCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightModeCommand;
  result = -[CAMCaptureCommand init](&v5, sel_init);
  if (result)
    result->__lowLightMode = a3;
  return result;
}

- (CAMLowLightModeCommand)initWithCoder:(id)a3
{
  id v4;
  CAMLowLightModeCommand *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CAMLowLightModeCommand;
  v5 = -[CAMCaptureCommand init](&v7, sel_init);
  if (v5)
    v5->__lowLightMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMLowLightModeKey"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightModeCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightModeCommand _lowLightMode](self, "_lowLightMode", v5.receiver, v5.super_class) != 0, CFSTR("CAMLowLightModeKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightModeCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMLowLightModeCommand _lowLightMode](self, "_lowLightMode");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CAMLowLightModeCommand _lowLightMode](self, "_lowLightMode");
  if ((objc_msgSend(v6, "isDigitalFlashSupported") & 1) != 0)
  {
    v9 = +[CAMCaptureConversions captureDigitalFlashModeForLowLightMode:](CAMCaptureConversions, "captureDigitalFlashModeForLowLightMode:", v8);
    objc_msgSend(v7, "supportedDigitalFlashModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v5, "setDigitalFlashMode:", v9);
    }
    else
    {
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v8 > 2)
          v15 = 0;
        else
          v15 = off_1EA328E28[v8];
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "Not setting night mode to %{public}@ because the output doesn't support it.", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Not changing night mode because the feature isn't supported.", (uint8_t *)&v16, 2u);
    }

  }
}

- (int64_t)_lowLightMode
{
  return self->__lowLightMode;
}

@end
