@implementation CAMUpdateCaptureButtonControlsCommand

- (CAMUpdateCaptureButtonControlsCommand)initWithRecording:(BOOL)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5
{
  CAMUpdateCaptureButtonControlsCommand *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMUpdateCaptureButtonControlsCommand;
  result = -[CAMCaptureCommand init](&v9, sel_init);
  if (result)
  {
    result->__recording = a3;
    result->__captureMode = a4;
    result->__devicePosition = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMUpdateCaptureButtonControlsCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[4] = -[CAMUpdateCaptureButtonControlsCommand _captureMode](self, "_captureMode");
  v4[5] = -[CAMUpdateCaptureButtonControlsCommand _devicePosition](self, "_devicePosition");
  *((_BYTE *)v4 + 24) = -[CAMUpdateCaptureButtonControlsCommand _recording](self, "_recording");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "updateControlEnablementForRecording:mode:devicePosition:", -[CAMUpdateCaptureButtonControlsCommand _recording](self, "_recording"), -[CAMUpdateCaptureButtonControlsCommand _captureMode](self, "_captureMode"), -[CAMUpdateCaptureButtonControlsCommand _devicePosition](self, "_devicePosition"));

}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (int64_t)_devicePosition
{
  return self->__devicePosition;
}

- (BOOL)_recording
{
  return self->__recording;
}

@end
