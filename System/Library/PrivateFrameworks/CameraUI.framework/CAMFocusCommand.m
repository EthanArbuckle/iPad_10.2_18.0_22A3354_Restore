@implementation CAMFocusCommand

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4 smooth:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  CAMFocusCommand *v9;
  CAMFocusCommand *v10;
  CAMFocusCommand *v11;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CAMFocusCommand;
  v9 = -[CAMCaptureCommand initWithSubcommands:](&v13, sel_initWithSubcommands_, 0);
  v10 = v9;
  if (v9)
  {
    v9->__focusMode = a3;
    v9->__focusPointOfInterest.x = x;
    v9->__focusPointOfInterest.y = y;
    v9->__shouldUseSmoothFocus = a5;
    v11 = v9;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFocusCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = -[CAMFocusCommand _focusMode](self, "_focusMode");
  -[CAMFocusCommand _focusPointOfInterest](self, "_focusPointOfInterest");
  v4[5] = v5;
  v4[6] = v6;
  *((_BYTE *)v4 + 24) = -[CAMFocusCommand _shouldUseSmoothFocus](self, "_shouldUseSmoothFocus");
  return v4;
}

- (int64_t)_focusMode
{
  return self->__focusMode;
}

- (CGPoint)_focusPointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->__focusPointOfInterest.x;
  y = self->__focusPointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_shouldUseSmoothFocus
{
  return self->__shouldUseSmoothFocus;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  NSObject *v12;
  BOOL v13;
  char v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  CGPoint v26;
  CGPoint v27;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CAMCaptureConversions captureFocusModeForFocusMode:isPerformingContrastBasedFocus:](CAMCaptureConversions, "captureFocusModeForFocusMode:isPerformingContrastBasedFocus:", -[CAMFocusCommand _focusMode](self, "_focusMode"), objc_msgSend(v5, "isAdjustingFocus"));
  -[CAMFocusCommand _focusPointOfInterest](self, "_focusPointOfInterest");
  v8 = v7;
  v10 = v9;
  v11 = -[CAMFocusCommand _shouldUseSmoothFocus](self, "_shouldUseSmoothFocus");
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v26.x = v8;
    v26.y = v10;
    NSStringFromCGPoint(v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 134218242;
    v22 = v6;
    v23 = 2114;
    v24 = v19;
    _os_log_debug_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEBUG, "Applying focus mode %ld with point of interest %{public}@", (uint8_t *)&v21, 0x16u);

  }
  v13 = v8 > 1.0;
  if (v8 < 0.0)
    v13 = 1;
  if (v10 > 1.0)
    v13 = 1;
  v14 = v10 < 0.0 || v13;
  if (!objc_msgSend(v5, "isFocusPointOfInterestSupported") || (v14 & 1) != 0)
  {
    if ((v14 & 1) == 0)
    {
      v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v27.x = v8;
        v27.y = v10;
        NSStringFromCGPoint(v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = (uint64_t)v20;
        v23 = 2114;
        v24 = v5;
        _os_log_debug_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEBUG, "Failed to set focus point of interest (%{public}@), as it is not supported by %{public}@", (uint8_t *)&v21, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(v5, "setFocusPointOfInterest:", v8, v10);
  }
  objc_msgSend(v4, "currentMovieFileOutput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v5, "isSmoothAutoFocusSupported"))
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CAMFocusCommand executeWithContext:].cold.2((uint64_t)v5, v11, v17);

    objc_msgSend(v5, "setSmoothAutoFocusEnabled:", v11);
  }
  if (objc_msgSend(v5, "isFocusModeSupported:", v6))
  {
    objc_msgSend(v5, "setFocusMode:", v6);
  }
  else
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CAMFocusCommand executeWithContext:].cold.1((uint64_t)v5, v6, v18);

  }
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3
{
  char *v4;
  CAMFocusCommand *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFocusCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = (CAMFocusCommand *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 4) = a3;
    *(int64x2_t *)(v4 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v4[24] = 0;
    v6 = v4;
  }

  return v5;
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4
{
  return -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:](self, "initWithFocusMode:atPointOfInterest:smooth:", a3, 0, a4.x, a4.y);
}

- (CAMFocusCommand)initWithFocusMode:(int64_t)a3 smooth:(BOOL)a4
{
  char *v6;
  CAMFocusCommand *v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMFocusCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = (CAMFocusCommand *)v6;
  if (v6)
  {
    *((_QWORD *)v6 + 4) = a3;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v6[24] = a4;
    v8 = v6;
  }

  return v7;
}

- (CAMFocusCommand)initWithCoder:(id)a3
{
  id v4;
  CAMFocusCommand *v5;
  const __CFDictionary *v6;
  CAMFocusCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMFocusCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__focusMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMFocusCommandFocusMode"));
    v5->__shouldUseSmoothFocus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMFocusCommandSmoothFocus"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMFocusCommandFocusPointOfInterest"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGPointMakeWithDictionaryRepresentation(v6, &v5->__focusPointOfInterest);
    v7 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDictionaryRef DictionaryRepresentation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFocusCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMFocusCommand _focusMode](self, "_focusMode", v6.receiver, v6.super_class), CFSTR("CAMFocusCommandFocusMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMFocusCommand _shouldUseSmoothFocus](self, "_shouldUseSmoothFocus"), CFSTR("CAMFocusCommandSmoothFocus"));
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->__focusPointOfInterest);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("CAMFocusCommandFocusPointOfInterest"));

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
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Failed to set focus mode %ld, as it is not supported by %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "%{public}@ supports smooth focus, setting smooth focus to %d", (uint8_t *)&v3, 0x12u);
}

@end
