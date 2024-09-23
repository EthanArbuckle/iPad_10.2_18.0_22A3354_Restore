@implementation CAMFaceDrivenImageProcessingCommand

- (CAMFaceDrivenImageProcessingCommand)initWithFaceDrivenImageProcessingEnabled:(BOOL)a3
{
  CAMFaceDrivenImageProcessingCommand *v4;
  CAMFaceDrivenImageProcessingCommand *v5;
  CAMFaceDrivenImageProcessingCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_faceDrivenImageProcessingEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMFaceDrivenImageProcessingCommand isFaceDrivenImageProcessingEnabled](self, "isFaceDrivenImageProcessingEnabled");
  return v4;
}

- (BOOL)isFaceDrivenImageProcessingEnabled
{
  return self->_faceDrivenImageProcessingEnabled;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFaceDetectionSupported") & 1) != 0)
  {
    v6 = -[CAMFaceDrivenImageProcessingCommand isFaceDrivenImageProcessingEnabled](self, "isFaceDrivenImageProcessingEnabled");
    objc_msgSend(v4, "currentMovieFileOutput");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = 0;
    else
      v9 = v6;
    if (v7 && v6)
      v9 = objc_msgSend(v5, "isFaceDetectionDuringVideoPreviewSupported");
    if ((_DWORD)v9 != objc_msgSend(v5, "isFaceDetectionDrivenImageProcessingEnabled"))
      objc_msgSend(v5, "setFaceDetectionDrivenImageProcessingEnabled:", v9);
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CAMFaceDrivenImageProcessingCommand executeWithContext:].cold.1(v8);
  }

}

- (CAMFaceDrivenImageProcessingCommand)initWithCoder:(id)a3
{
  id v4;
  CAMFaceDrivenImageProcessingCommand *v5;
  CAMFaceDrivenImageProcessingCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_faceDrivenImageProcessingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMFaceDrivenImageProcessingCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMFaceDrivenImageProcessingCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMFaceDrivenImageProcessingCommand isFaceDrivenImageProcessingEnabled](self, "isFaceDrivenImageProcessingEnabled", v5.receiver, v5.super_class), CFSTR("CAMFaceDrivenImageProcessingCommandEnabled"));

}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Attempted to execute a face detection command on a device which doesn't support face detection – ignoring the command", v1, 2u);
}

@end
