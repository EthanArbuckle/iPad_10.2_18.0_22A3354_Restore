@implementation CAMCTMVideoCaptureEnabledCommand

- (CAMCTMVideoCaptureEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMCTMVideoCaptureEnabledCommand *v4;
  CAMCTMVideoCaptureEnabledCommand *v5;
  CAMCTMVideoCaptureEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMCTMVideoCaptureEnabledCommand)initWithCoder:(id)a3
{
  id v4;
  CAMCTMVideoCaptureEnabledCommand *v5;
  CAMCTMVideoCaptureEnabledCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMCTMVideoCaptureEnabledCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMCTMVideoCaptureEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMCTMVideoCaptureEnabledCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMCTMVideoCaptureEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMCTMVideoCaptureEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  _BOOL8 v5;
  NSObject *v6;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMCTMVideoCaptureEnabledCommand _isEnabled](self, "_isEnabled");
  if (objc_msgSend(v4, "isMovieRecordingSupported"))
  {
    objc_msgSend(v4, "setMovieRecordingEnabled:", v5);
  }
  else if (v5)
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMCTMVideoCaptureEnabledCommand executeWithContext:].cold.1(v6);

  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Attempting to set AVCapturePhotoOutput movieRecordingEnabled = YES, but isMovieRecordingSupported = NO", v1, 2u);
}

@end
