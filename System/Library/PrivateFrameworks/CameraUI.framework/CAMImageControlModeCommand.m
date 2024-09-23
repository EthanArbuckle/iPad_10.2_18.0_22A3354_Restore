@implementation CAMImageControlModeCommand

- (void)executeWithContext:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMImageControlModeCommand _captureMode](self, "_captureMode");
  if (v5 <= 9)
  {
    if (((1 << v5) & 0x3D7) != 0)
    {
      objc_msgSend(v4, "setAutomaticallyAdjustsImageControlMode:", 1);
      goto LABEL_4;
    }
    if (v5 == 3)
    {
      if (objc_msgSend(v4, "isImageControlModeSupported:", 4))
      {
        objc_msgSend(v4, "setAutomaticallyAdjustsImageControlMode:", 0);
        v6 = v4;
        v7 = 4;
LABEL_18:
        objc_msgSend(v6, "setImageControlMode:", v7);
        goto LABEL_4;
      }
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v10 = "Unable to set the proper image control mode for panorama, results will be unexpected!";
        v11 = (uint8_t *)&v13;
LABEL_23:
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      if (objc_msgSend(v4, "isImageControlModeSupported:", 5)
        && objc_msgSend(v4, "isImageControlModeSupported:", 6))
      {
        if (-[CAMImageControlModeCommand _capturing](self, "_capturing"))
          v8 = 6;
        else
          v8 = 5;
      }
      else
      {
        v8 = 2;
      }
      if (objc_msgSend(v4, "isImageControlModeSupported:", v8))
      {
        if (objc_msgSend(v4, "isTorchModeSupported:", 0))
          objc_msgSend(v4, "setTorchMode:", 0);
        objc_msgSend(v4, "setAutomaticallyAdjustsImageControlMode:", 0);
        v6 = v4;
        v7 = v8;
        goto LABEL_18;
      }
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v10 = "Unable to set the proper image control mode for timelapse, results will be unexpected!";
        v11 = (uint8_t *)&v12;
        goto LABEL_23;
      }
    }

  }
LABEL_4:

}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (CAMImageControlModeCommand)initWithCaptureMode:(int64_t)a3 capturing:(BOOL)a4
{
  CAMImageControlModeCommand *v6;
  CAMImageControlModeCommand *v7;
  CAMImageControlModeCommand *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMImageControlModeCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->__captureMode = a3;
    v6->__capturing = a4;
    v8 = v6;
  }

  return v7;
}

- (CAMImageControlModeCommand)initWithCoder:(id)a3
{
  id v4;
  CAMImageControlModeCommand *v5;
  CAMImageControlModeCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMImageControlModeCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__captureMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMImageControlModeCommandCaptureMode"));
    v5->__capturing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMImageControlModeCommandCapturing"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMImageControlModeCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMImageControlModeCommand _captureMode](self, "_captureMode", v5.receiver, v5.super_class), CFSTR("CAMImageControlModeCommandCaptureMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMImageControlModeCommand _capturing](self, "_capturing"), CFSTR("CAMImageControlModeCommandCapturing"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMImageControlModeCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[4] = -[CAMImageControlModeCommand _captureMode](self, "_captureMode");
  *((_BYTE *)v4 + 24) = -[CAMImageControlModeCommand _capturing](self, "_capturing");
  return v4;
}

- (BOOL)_capturing
{
  return self->__capturing;
}

@end
