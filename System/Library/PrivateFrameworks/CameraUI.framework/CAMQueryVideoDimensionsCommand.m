@implementation CAMQueryVideoDimensionsCommand

- (CAMQueryVideoDimensionsCommand)initWithCompletionBlock:(id)a3
{
  id v4;
  CAMQueryVideoDimensionsCommand *v5;
  CAMQueryVideoDimensionsCommand *v6;
  CAMQueryVideoDimensionsCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMQueryVideoDimensionsCommand;
  v5 = -[CAMCaptureCommand initWithSubcommands:](&v9, sel_initWithSubcommands_, 0);
  v6 = v5;
  if (v5)
  {
    -[CAMQueryVideoDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", v4);
    v7 = v6;
  }

  return v6;
}

- (CAMQueryVideoDimensionsCommand)initWithCoder:(id)a3
{
  id v4;
  CAMQueryVideoDimensionsCommand *v5;
  CAMQueryVideoDimensionsCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQueryVideoDimensionsCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMQueryVideoDimensionsCommandUnserializedCompletionBlock")))-[CAMQueryVideoDimensionsCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_1);
    v6 = v5;
  }

  return v5;
}

void __48__CAMQueryVideoDimensionsCommand_initWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB760000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMQueryVideoDimensionsCommandLensPosition could not be serialized so some behavior may be different.", v1, 2u);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMQueryVideoDimensionsCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->__completionBlock)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("CAMQueryVideoDimensionsCommandUnserializedCompletionBlock"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMQueryVideoDimensionsCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CAMQueryVideoDimensionsCommand _completionBlock](self, "_completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCompletionBlock:", v5);

  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  void *v5;
  const opaqueCMFormatDescription *v6;
  uint64_t Dimensions;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void (**completionBlock)(id, uint64_t, uint64_t);
  uint8_t v12[16];

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const opaqueCMFormatDescription *)objc_msgSend(v5, "formatDescription");
  if (v6)
  {
    Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v6);
    v8 = (int)Dimensions;
    v9 = Dimensions >> 32;
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CAMQueryVideoDimensionsCommand executeWithContext:].cold.1(v8, v9, v10);
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get video dimensions", v12, 2u);
    }
    v9 = 0;
    v8 = 0;
  }

  completionBlock = (void (**)(id, uint64_t, uint64_t))self->__completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, v8, v9);

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
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Queried video dimensions of %ld, %ld", (uint8_t *)&v3, 0x16u);
}

@end
