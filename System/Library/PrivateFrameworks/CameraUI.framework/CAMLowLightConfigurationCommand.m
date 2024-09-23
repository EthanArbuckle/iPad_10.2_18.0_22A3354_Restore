@implementation CAMLowLightConfigurationCommand

- (CAMLowLightConfigurationCommand)initWithLowLightEnabled:(BOOL)a3
{
  CAMLowLightConfigurationCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightConfigurationCommand;
  result = -[CAMCaptureCommand init](&v5, sel_init);
  if (result)
    result->__enabled = a3;
  return result;
}

- (CAMLowLightConfigurationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMLowLightConfigurationCommand *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CAMLowLightConfigurationCommand;
  v5 = -[CAMCaptureCommand init](&v7, sel_init);
  if (v5)
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMLowLightConfigurationEnabled"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightConfigurationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightConfigurationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMLowLightConfigurationEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightConfigurationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMLowLightConfigurationCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "currentStillImageOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CAMLowLightConfigurationCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v5, "supportedDigitalFlashModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", &unk_1EA3B0178))
  {
    v9 = objc_msgSend(v6, "isDigitalFlashSupported");

    if (v9)
    {
      objc_msgSend(v5, "setDigitalFlashCaptureEnabled:", v7);
      objc_msgSend(v5, "photoSettingsForSceneMonitoring");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "digitalFlashMode") != v7)
      {
        objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettingsFromPhotoSettings:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDigitalFlashMode:", v7);
        objc_msgSend(v5, "setPhotoSettingsForSceneMonitoring:", v11);

      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (v7)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Not enabling digital flash because the feature is not supported.", v13, 2u);
    }

  }
LABEL_11:

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
