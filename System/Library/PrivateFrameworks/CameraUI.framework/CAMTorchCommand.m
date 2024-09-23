@implementation CAMTorchCommand

- (CAMTorchCommand)initWithTorchMode:(int64_t)a3
{
  CAMTorchCommand *v4;
  CAMTorchCommand *v5;
  CAMTorchCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMTorchCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__torchMode = a3;
    v4->__level = 3.4028e38;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTorchCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  v4[4] = -[CAMTorchCommand _torchMode](self, "_torchMode");
  -[CAMTorchCommand _level](self, "_level");
  *((_DWORD *)v4 + 6) = v5;
  return v4;
}

- (int64_t)_torchMode
{
  return self->__torchMode;
}

- (float)_level
{
  return self->__level;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  double v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CAMCaptureConversions captureTorchModeForTorchMode:](CAMCaptureConversions, "captureTorchModeForTorchMode:", -[CAMTorchCommand _torchMode](self, "_torchMode"));
  -[CAMTorchCommand _level](self, "_level");
  v7 = v6;
  if (objc_msgSend(v4, "hasTorch") && objc_msgSend(v4, "isTorchModeSupported:", v5))
  {
    if (v7 >= 3.4028e38)
    {
      objc_msgSend(v4, "setTorchMode:", v5);
    }
    else
    {
      v12 = 0;
      *(float *)&v8 = v7;
      objc_msgSend(v4, "setTorchModeOnWithLevel:error:", &v12, v8);
      v9 = v12;
      if (v9)
      {
        v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CAMTorchCommand executeWithContext:].cold.1((uint64_t)v9, v10);

      }
    }
  }
  else if (objc_msgSend(v4, "hasTorch"))
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMTorchCommand executeWithContext:].cold.2((uint64_t)v4, v5, v11);

  }
}

- (CAMTorchCommand)initWithTorchLevel:(float)a3
{
  CAMTorchCommand *v4;
  CAMTorchCommand *v5;
  CAMTorchCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMTorchCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__torchMode = 1;
    v4->__level = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMTorchCommand)initWithCoder:(id)a3
{
  id v4;
  CAMTorchCommand *v5;
  float v6;
  CAMTorchCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMTorchCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__torchMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMTorchCommandTorchMode"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CAMTorchCommandTorchLevel"));
    v5->__level = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMTorchCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMTorchCommand _torchMode](self, "_torchMode", v5.receiver, v5.super_class), CFSTR("CAMTorchCommandTorchMode"));
  -[CAMTorchCommand _level](self, "_level");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("CAMTorchCommandTorchLevel"));

}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Attempt to set explicit torch level failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Ignoring request to set unsupported torch mode %ld on device %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end
