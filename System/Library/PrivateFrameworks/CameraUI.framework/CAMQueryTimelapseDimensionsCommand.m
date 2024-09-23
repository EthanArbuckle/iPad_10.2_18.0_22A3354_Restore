@implementation CAMQueryTimelapseDimensionsCommand

- (CAMQueryTimelapseDimensionsCommand)initWithCompletionBlock:(id)a3
{
  id v4;
  CAMQueryTimelapseDimensionsCommand *v5;
  CAMQueryTimelapseDimensionsCommand *v6;
  CAMQueryTimelapseDimensionsCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  v5 = -[CAMCaptureCommand initWithSubcommands:](&v9, sel_initWithSubcommands_, 0);
  v6 = v5;
  if (v5)
  {
    -[CAMQueryTimelapseDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", v4);
    v7 = v6;
  }

  return v6;
}

- (CAMQueryTimelapseDimensionsCommand)initWithCoder:(id)a3
{
  id v4;
  CAMQueryTimelapseDimensionsCommand *v5;
  CAMQueryTimelapseDimensionsCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMQueryTimelapseDimensionsCommandUnserializedCompletionBlock")))-[CAMQueryTimelapseDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_46);
    v6 = v5;
  }

  return v5;
}

void __52__CAMQueryTimelapseDimensionsCommand_initWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB760000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMQueryTimelapseDimensionsCommand could not be serialized so some behaviour may be different.", v1, 2u);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->__completionBlock)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("CAMQueryTimelapseDimensionsCommandUnserializedCompletionBlock"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMQueryTimelapseDimensionsCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CAMQueryTimelapseDimensionsCommand _completionBlock](self, "_completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCompletionBlock:", v5);

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const opaqueCMFormatDescription *v8;
  uint64_t Dimensions;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void (**completionBlock)(id, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "formatDescription");
  if (v8)
  {
    Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v8);
    v10 = (int)Dimensions;
    v11 = Dimensions >> 32;
    if (objc_msgSend(v7, "isImageOptimizationForOfflineVideoStabilizationSupported"))
    {
      v12 = objc_msgSend(v7, "optimizedImageDimensionsForOfflineStabilization");
      v13 = (int)v12;
      v14 = v12 >> 32;
      v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = 134218752;
        v20 = v10;
        v21 = 2048;
        v22 = v11;
        v23 = 2048;
        v24 = v13;
        v25 = 2048;
        v26 = v14;
        _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld; overscan %ld, %ld",
          (uint8_t *)&v19,
          0x2Au);
      }

      if ((int)v13 * (uint64_t)(int)v11 == (int)v14 * (uint64_t)(int)v10)
      {
        v16 = 1;
        goto LABEL_17;
      }
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Aspect ratio mismatch between original and overscan output dimensions", (uint8_t *)&v19, 2u);
      }
      v16 = 1;
    }
    else
    {
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[CAMQueryTimelapseDimensionsCommand executeWithContext:].cold.1(v10, v11, v17);
      v16 = 0;
      v14 = v11;
      v13 = v10;
    }
  }
  else
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get video dimensions", (uint8_t *)&v19, 2u);
    }
    v16 = 0;
    v14 = 0;
    v13 = 0;
    v11 = 0;
    v10 = 0;
  }

LABEL_17:
  completionBlock = (void (**)(id, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))self->__completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, v10, v11, v13, v14, v16);

}

- (id)_completionBlock
{
  return self->__completionBlock;
}

- (void)_setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionBlock, 0);
}

- (void)executeWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld; no overscan",
    (uint8_t *)&v3,
    0x16u);
}

@end
