@implementation CAMIrisVideoRecordingCommand

- (CAMIrisVideoRecordingCommand)initWithVideoRecordingEnabled:(BOOL)a3
{
  CAMIrisVideoRecordingCommand *v4;
  CAMIrisVideoRecordingCommand *v5;
  CAMIrisVideoRecordingCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMIrisVideoRecordingCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  _BOOL8 v4;
  id v5;

  objc_msgSend(a3, "currentStillImageOutput");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMIrisVideoRecordingCommand _isEnabled](self, "_isEnabled");
  if (objc_msgSend(v5, "isLivePhotoCaptureSupported"))
    objc_msgSend(v5, "setLivePhotoCaptureEnabled:", v4);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMIrisVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4;
  CAMIrisVideoRecordingCommand *v5;
  CAMIrisVideoRecordingCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMIrisVideoRecordingCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMIrisVideoRecordingCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMIrisVideoRecordingCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMIrisVideoRecordingCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMIrisVideoRecordingCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMIrisVideoRecordingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMIrisVideoRecordingCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
