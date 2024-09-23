@implementation CAMPausePairedVideoRecordingCommand

- (CAMPausePairedVideoRecordingCommand)initWithRecordingPaused:(BOOL)a3
{
  CAMPausePairedVideoRecordingCommand *v4;
  CAMPausePairedVideoRecordingCommand *v5;
  CAMPausePairedVideoRecordingCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__recordingPaused = a3;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMPausePairedVideoRecordingCommand _isRecordingPaused](self, "_isRecordingPaused");
  return v4;
}

- (BOOL)_isRecordingPaused
{
  return self->__recordingPaused;
}

- (void)executeWithContext:(id)a3
{
  int v4;
  int v5;
  id v6;

  objc_msgSend(a3, "currentStillImageOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isLivePhotoCaptureSupported");
  v5 = objc_msgSend(v6, "isLivePhotoCaptureEnabled");
  if (v4 && v5)
    objc_msgSend(v6, "setLivePhotoCaptureSuspended:", -[CAMPausePairedVideoRecordingCommand _isRecordingPaused](self, "_isRecordingPaused"));

}

- (CAMPausePairedVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPausePairedVideoRecordingCommand *v5;
  CAMPausePairedVideoRecordingCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__recordingPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMPausePairedVideoRecordingCommandPaused"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPausePairedVideoRecordingCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMPausePairedVideoRecordingCommand _isRecordingPaused](self, "_isRecordingPaused", v5.receiver, v5.super_class), CFSTR("CAMPausePairedVideoRecordingCommandPaused"));

}

@end
