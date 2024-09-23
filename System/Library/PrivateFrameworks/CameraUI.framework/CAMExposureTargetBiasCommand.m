@implementation CAMExposureTargetBiasCommand

- (CAMExposureTargetBiasCommand)initWithExposureTargetBias:(float)a3
{
  CAMExposureTargetBiasCommand *v4;
  CAMExposureTargetBiasCommand *v5;
  CAMExposureTargetBiasCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMExposureTargetBiasCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__exposureTargetBias = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMExposureTargetBiasCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CAMExposureTargetBiasCommand _exposureTargetBias](self, "_exposureTargetBias");
  v4[6] = v5;
  return v4;
}

- (float)_exposureTargetBias
{
  return self->__exposureTargetBias;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExposureTargetBiasCommand _exposureTargetBias](self, "_exposureTargetBias");
  v6 = v5;
  objc_msgSend(v4, "minExposureTargetBias");
  v8 = v7;
  objc_msgSend(v4, "maxExposureTargetBias");
  v10 = v9;
  if (v6 < v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = v6;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Clamping exposure target bias of %.3f to minimum %.3f", (uint8_t *)&v15, 0x16u);
    }

    v6 = v8;
  }
  if (v6 > v10)
  {
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = v6;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Clamping exposure target bias of %.3f to maximum %.3f", (uint8_t *)&v15, 0x16u);
    }

    v6 = v10;
  }
  v13 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CAMExposureTargetBiasCommand executeWithContext:].cold.1(v13, v6);

  *(float *)&v14 = v6;
  objc_msgSend(v4, "setExposureTargetBias:completionHandler:", 0, v14);

}

- (CAMExposureTargetBiasCommand)initWithCoder:(id)a3
{
  id v4;
  CAMExposureTargetBiasCommand *v5;
  float v6;
  CAMExposureTargetBiasCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureTargetBiasCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CAMExposureTargetBiasCommandExposureTargetBias"));
    v5->__exposureTargetBias = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMExposureTargetBiasCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[CAMExposureTargetBiasCommand _exposureTargetBias](self, "_exposureTargetBias", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("CAMExposureTargetBiasCommandExposureTargetBias"));

}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Applying exposure target bias of %.3f", (uint8_t *)&v2, 0xCu);
}

@end
