@implementation CAMUltraHighResolutionZeroShutterLagEnabledCommand

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMUltraHighResolutionZeroShutterLagEnabledCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->_enabled = a3;
  return result;
}

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMUltraHighResolutionZeroShutterLagEnabledCommand initWithEnabled:](self, "initWithEnabled:", 0);
}

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMUltraHighResolutionZeroShutterLagEnabledCommand isEnabled](self, "isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v4, "isUltraHighResolutionZeroShutterLagSupportEnabled"))
        objc_msgSend(v4, "setUltraHighResolutionZeroShutterLagEnabled:", -[CAMUltraHighResolutionZeroShutterLagEnabledCommand isEnabled](self, "isEnabled"));
    }
    else
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CAMUltraHighResolutionZeroShutterLagEnabledCommand executeWithContext:].cold.1(v5);

    }
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "UltraHighResolutionZeroShutterLag SPI not available", v1, 2u);
}

@end
