@implementation CAMPortraitLightingEffectStrengthCommand

- (CAMPortraitLightingEffectStrengthCommand)initWithEffectStrength:(double)a3
{
  CAMPortraitLightingEffectStrengthCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->_effectStrength = a3;
  return result;
}

- (CAMPortraitLightingEffectStrengthCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPortraitLightingEffectStrengthCommand *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CAMPortraitCommandLightingEffectStrength"));
    v5->_effectStrength = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("CAMPortraitCommandLightingEffectStrength"), self->_effectStrength, v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitLightingEffectStrengthCommand;
  result = -[CAMCaptureCommand copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_effectStrength;
  return result;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDeviceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPortraitLightingEffectStrengthCommand effectStrength](self, "effectStrength");
  v8 = v7;
  objc_msgSend(v6, "minPortraitLightingEffectStrength");
  v10 = v9;
  objc_msgSend(v6, "maxPortraitLightingEffectStrength");
  v12 = v11;
  v13 = v10;
  if (v8 > v10)
    v13 = v8;
  if (v13 <= v12)
    v14 = v13;
  else
    v14 = v12;
  if (v14 != v8)
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218240;
      v17 = v8;
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "Clamping portrait effect strength: %.2f->%.2f", (uint8_t *)&v16, 0x16u);
    }

  }
  *(float *)&v12 = v14;
  objc_msgSend(v5, "setPortraitLightingEffectStrength:", v12);

}

- (double)effectStrength
{
  return self->_effectStrength;
}

@end
