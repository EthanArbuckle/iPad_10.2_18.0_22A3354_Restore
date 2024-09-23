@implementation CAMHDRSuggestionMonitoringCommand

- (CAMHDRSuggestionMonitoringCommand)initWithHDRSuggestionMonitoringEnabled:(BOOL)a3
{
  CAMHDRSuggestionMonitoringCommand *v4;
  CAMHDRSuggestionMonitoringCommand *v5;
  CAMHDRSuggestionMonitoringCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMHDRSuggestionMonitoringCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[CAMHDRSuggestionMonitoringCommand _isEnabled](self, "_isEnabled"))
      v5 = 2;
    else
      v5 = 0;
    objc_msgSend(v4, "photoSettingsForSceneMonitoring");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject HDRMode](v6, "HDRMode") != v5)
    {
      objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettingsFromPhotoSettings:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHDRMode:", v5);
      objc_msgSend(v4, "setPhotoSettingsForSceneMonitoring:", v7);

    }
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Trying to update HDR mode in a capture mode that doesn't support HDR. Ignoring.", v8, 2u);
    }
  }

}

- (CAMHDRSuggestionMonitoringCommand)initWithCoder:(id)a3
{
  id v4;
  CAMHDRSuggestionMonitoringCommand *v5;
  CAMHDRSuggestionMonitoringCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMHDRSuggestionMonitoringEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMHDRSuggestionMonitoringCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMHDRSuggestionMonitoringCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMHDRSuggestionMonitoringEnabled"));

}

@end
