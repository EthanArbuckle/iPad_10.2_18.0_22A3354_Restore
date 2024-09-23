@implementation CAMSessionSmartStyleCommand

- (CAMSessionSmartStyleCommand)initWithSmartStyle:(id)a3
{
  id v4;
  CAMSessionSmartStyleCommand *v5;
  void *v6;
  char v7;
  CAMSessionSmartStyleCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSessionSmartStyleCommand;
  v5 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  if (v5)
  {
    if (v4 && objc_msgSend(v4, "presetType"))
    {
      +[CAMCaptureConversions AVCaptureSmartStyleForCEKSmartStyle:](CAMCaptureConversions, "AVCaptureSmartStyleForCEKSmartStyle:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 1;
    }
    objc_storeStrong((id *)&v5->__smartStyle, v6);
    if ((v7 & 1) == 0)

    v8 = v5;
  }

  return v5;
}

- (CAMSessionSmartStyleCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSessionSmartStyleCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSessionSmartStyleCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMSessionSmartStyleCommand _smartStyle](self, "_smartStyle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "currentCaptureSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSessionSmartStyleCommand _smartStyle](self, "_smartStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSmartStyleRenderingSupported"))
  {
    objc_msgSend(v5, "setSmartStyle:", v7);
  }
  else if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMSessionSmartStyleCommand executeWithContext:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

  }
}

- (AVCaptureSmartStyle)_smartStyle
{
  return self->__smartStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__smartStyle, 0);
}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Trying to set a smart style on a format that does not support it: %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
