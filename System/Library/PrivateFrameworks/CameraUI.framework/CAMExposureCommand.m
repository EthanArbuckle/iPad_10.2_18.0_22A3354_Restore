@implementation CAMExposureCommand

- (CAMExposureCommand)initWithExposureMode:(int64_t)a3 atPointOfInterest:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CAMExposureCommand *v7;
  CAMExposureCommand *v8;
  CAMExposureCommand *v9;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)CAMExposureCommand;
  v7 = -[CAMCaptureCommand initWithSubcommands:](&v11, sel_initWithSubcommands_, 0);
  v8 = v7;
  if (v7)
  {
    v7->__exposureMode = a3;
    v7->__exposurePointOfInterest.x = x;
    v7->__exposurePointOfInterest.y = y;
    v9 = v7;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMExposureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[3] = -[CAMExposureCommand _exposureMode](self, "_exposureMode");
  -[CAMExposureCommand _exposurePointOfInterest](self, "_exposurePointOfInterest");
  v4[4] = v5;
  v4[5] = v6;
  return v4;
}

- (int64_t)_exposureMode
{
  return self->__exposureMode;
}

- (CGPoint)_exposurePointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->__exposurePointOfInterest.x;
  y = self->__exposurePointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  double x;
  double y;
  CFDictionaryRef DictionaryRepresentation;
  NSObject *v9;
  BOOL v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  CGPoint v19;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CAMCaptureConversions captureExposureModeForExposureMode:](CAMCaptureConversions, "captureExposureModeForExposureMode:", -[CAMExposureCommand _exposureMode](self, "_exposureMode"));
  -[CAMExposureCommand _exposurePointOfInterest](self, "_exposurePointOfInterest");
  x = v19.x;
  y = v19.y;
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v19);
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CAMExposureCommand executeWithContext:].cold.1((uint64_t)DictionaryRepresentation, v5, v9);

  v10 = x > 1.0;
  if (x < 0.0)
    v10 = 1;
  if (y > 1.0)
    v10 = 1;
  v11 = y < 0.0 || v10;
  if (!objc_msgSend(v4, "isExposurePointOfInterestSupported") || (v11 & 1) != 0)
  {
    if ((v11 & 1) == 0)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = (uint64_t)DictionaryRepresentation;
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Failed to set exposure point of interest (%{public}@), as it is not supported by %{public}@", (uint8_t *)&v14, 0x16u);
      }

    }
  }
  else
  {
    -[CAMExposureCommand _exposurePointOfInterest](self, "_exposurePointOfInterest");
    objc_msgSend(v4, "setExposurePointOfInterest:");
  }
  CFRelease(DictionaryRepresentation);
  if (objc_msgSend(v4, "isExposureModeSupported:", v5))
  {
    objc_msgSend(v4, "setExposureMode:", v5);
  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = v5;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Failed to set exposure mode %ld, as it is not supported by %{public}@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (CAMExposureCommand)initWithExposureMode:(int64_t)a3
{
  CAMExposureCommand *v4;
  CAMExposureCommand *v5;
  CAMExposureCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMExposureCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__exposureMode = a3;
    v4->__exposurePointOfInterest = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v6 = v4;
  }

  return v5;
}

- (CAMExposureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMExposureCommand *v5;
  const __CFDictionary *v6;
  CAMExposureCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__exposureMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMExposureCommandExposureMode"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMExposureCommandExposurePointOfInterest"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGPointMakeWithDictionaryRepresentation(v6, &v5->__exposurePointOfInterest);
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
  v6.super_class = (Class)CAMExposureCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMExposureCommand _exposureMode](self, "_exposureMode", v6.receiver, v6.super_class), CFSTR("CAMExposureCommandExposureMode"));
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->__exposurePointOfInterest);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("CAMExposureCommandExposurePointOfInterest"));

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
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Applying exposure mode %ld with point of interest %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
