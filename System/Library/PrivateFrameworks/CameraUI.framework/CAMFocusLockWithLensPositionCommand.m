@implementation CAMFocusLockWithLensPositionCommand

+ (float)currentLensPositionSentinel
{
  return *MEMORY[0x1E0C89FD8];
}

- (CAMFocusLockWithLensPositionCommand)initWithLensPosition:(float)a3 completionBlock:(id)a4
{
  id v6;
  CAMFocusLockWithLensPositionCommand *v7;
  double v8;
  CAMFocusLockWithLensPositionCommand *v9;
  CAMFocusLockWithLensPositionCommand *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  v7 = -[CAMCaptureCommand initWithSubcommands:](&v12, sel_initWithSubcommands_, 0);
  v9 = v7;
  if (v7)
  {
    *(float *)&v8 = a3;
    -[CAMFocusLockWithLensPositionCommand _setLensPosition:](v7, "_setLensPosition:", v8);
    -[CAMFocusLockWithLensPositionCommand _setCompletionBlock:](v9, "_setCompletionBlock:", v6);
    v10 = v9;
  }

  return v9;
}

- (CAMFocusLockWithLensPositionCommand)initWithCoder:(id)a3
{
  id v4;
  CAMFocusLockWithLensPositionCommand *v5;
  CAMFocusLockWithLensPositionCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CAMFocusLockWithLensPositionCommandLensPosition"));
    -[CAMFocusLockWithLensPositionCommand _setLensPosition:](v5, "_setLensPosition:");
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMFocusLockWithLensPositionCommandUnserializedCompletionBlock")))-[CAMFocusLockWithLensPositionCommand _setCompletionBlock:](v5, "_setCompletionBlock:", &__block_literal_global_25);
    v6 = v5;
  }

  return v5;
}

void __53__CAMFocusLockWithLensPositionCommand_initWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB760000, v0, OS_LOG_TYPE_DEFAULT, "Original completion block for CAMFocusLockWithLensPositionCommandLensPosition could not be serialized so some behavior may be different.", v1, 2u);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->__lensPosition;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("CAMFocusLockWithLensPositionCommandLensPosition"), v5);
  if (self->__completionBlock)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("CAMFocusLockWithLensPositionCommandUnserializedCompletionBlock"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFocusLockWithLensPositionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CAMFocusLockWithLensPositionCommand _lensPosition](self, "_lensPosition");
  objc_msgSend(v4, "_setLensPosition:");
  -[CAMFocusLockWithLensPositionCommand _completionBlock](self, "_completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCompletionBlock:", v5);

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  int v8;
  double v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFocusModeSupported:", 0) & 1) != 0)
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CAMFocusLockWithLensPositionCommand executeWithContext:].cold.1(self, v6);

    objc_initWeak(&location, v5);
    -[CAMFocusLockWithLensPositionCommand _lensPosition](self, "_lensPosition");
    v8 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__CAMFocusLockWithLensPositionCommand_executeWithContext___block_invoke;
    v10[3] = &unk_1EA32C418;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    LODWORD(v9) = v8;
    objc_msgSend(v5, "setFocusModeLockedWithLensPosition:completionHandler:", v10, v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else if (self->__completionBlock)
  {
    objc_msgSend(v5, "lensPosition");
    (*((void (**)(void))self->__completionBlock + 2))();
  }

}

uint64_t __58__CAMFocusLockWithLensPositionCommand_executeWithContext___block_invoke(uint64_t result)
{
  uint64_t v1;
  id WeakRetained;
  float v3;
  float v4;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    objc_msgSend(WeakRetained, "lensPosition");
    v4 = v3;

    return (*(uint64_t (**)(float))(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 32) + 16))(v4);
  }
  return result;
}

- (float)_lensPosition
{
  return self->__lensPosition;
}

- (void)_setLensPosition:(float)a3
{
  self->__lensPosition = a3;
}

- (id)_completionBlock
{
  return self->__completionBlock;
}

- (void)_setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionBlock, 0);
}

- (void)executeWithContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  float v3;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_lensPosition");
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_1DB760000, a2, OS_LOG_TYPE_DEBUG, "Locking lens position at %.4f", (uint8_t *)&v4, 0xCu);
}

@end
