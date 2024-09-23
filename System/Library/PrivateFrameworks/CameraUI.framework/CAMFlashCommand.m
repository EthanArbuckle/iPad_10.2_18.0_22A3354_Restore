@implementation CAMFlashCommand

- (CAMFlashCommand)initWithFlashMode:(int64_t)a3
{
  CAMFlashCommand *v4;
  CAMFlashCommand *v5;
  CAMFlashCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFlashCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__flashMode = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFlashCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMFlashCommand _flashMode](self, "_flashMode");
  return v4;
}

- (int64_t)_flashMode
{
  return self->__flashMode;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = +[CAMCaptureConversions captureFlashModeForFlashMode:](CAMCaptureConversions, "captureFlashModeForFlashMode:", -[CAMFlashCommand _flashMode](self, "_flashMode"));
    if (objc_msgSend(v5, "hasFlash") && objc_msgSend(v5, "isFlashModeSupported:", v7))
    {
      objc_msgSend(v5, "setFlashMode:", v7);
    }
    else if (objc_msgSend(v5, "hasFlash"))
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CAMFlashCommand executeWithContext:].cold.1((uint64_t)v5, v7, v8);

    }
    objc_msgSend(v6, "photoSettingsForSceneMonitoring");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B0F8], "photoSettingsFromPhotoSettings:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFlashMode:", v7);
    objc_msgSend(v6, "setPhotoSettingsForSceneMonitoring:", v10);

  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Trying to update flash mode in a capture mode that doesn't support flash. Ignoring.", v11, 2u);
    }
  }

}

- (CAMFlashCommand)initWithCoder:(id)a3
{
  id v4;
  CAMFlashCommand *v5;
  CAMFlashCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFlashCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__flashMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMFlashCommandFlashMode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMFlashCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMFlashCommand _flashMode](self, "_flashMode", v5.receiver, v5.super_class), CFSTR("CAMFlashCommandFlashMode"));

}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Ignoring request to set unsupported flash mode %ld on device %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end
