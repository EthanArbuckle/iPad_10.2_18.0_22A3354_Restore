@implementation CAMBlinkAndSmileDetectionCommand

- (CAMBlinkAndSmileDetectionCommand)initWithBlinkDetection:(BOOL)a3 smileDetection:(BOOL)a4
{
  CAMBlinkAndSmileDetectionCommand *v6;
  CAMBlinkAndSmileDetectionCommand *v7;
  CAMBlinkAndSmileDetectionCommand *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMBlinkAndSmileDetectionCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->__blinkDetectionEnabled = a3;
    v6->__smileDetectionEnabled = a4;
    v8 = v6;
  }

  return v7;
}

- (CAMBlinkAndSmileDetectionCommand)initWithCoder:(id)a3
{
  id v4;
  CAMBlinkAndSmileDetectionCommand *v5;
  CAMBlinkAndSmileDetectionCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMBlinkAndSmileDetectionCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__blinkDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMBlinkAndSmileDetectionCommandBlinkEnabled"));
    v5->__smileDetectionEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMBlinkAndSmileDetectionCommandSmileEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMBlinkAndSmileDetectionCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMBlinkAndSmileDetectionCommand _isBlinkDetectionEnabled](self, "_isBlinkDetectionEnabled", v5.receiver, v5.super_class), CFSTR("CAMBlinkAndSmileDetectionCommandBlinkEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMBlinkAndSmileDetectionCommand _isSmileDetectionEnabled](self, "_isSmileDetectionEnabled"), CFSTR("CAMBlinkAndSmileDetectionCommandSmileEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMBlinkAndSmileDetectionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMBlinkAndSmileDetectionCommand _isBlinkDetectionEnabled](self, "_isBlinkDetectionEnabled");
  v4[25] = -[CAMBlinkAndSmileDetectionCommand _isSmileDetectionEnabled](self, "_isSmileDetectionEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  _BOOL8 v4;
  id v5;

  objc_msgSend(a3, "currentVideoDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEyeDetectionSupported")
    && objc_msgSend(v5, "isEyeClosedDetectionSupported"))
  {
    v4 = -[CAMBlinkAndSmileDetectionCommand _isBlinkDetectionEnabled](self, "_isBlinkDetectionEnabled");
    objc_msgSend(v5, "setEyeDetectionEnabled:", v4);
    objc_msgSend(v5, "setEyeClosedDetectionEnabled:", v4);
  }
  if (objc_msgSend(v5, "isSmileDetectionSupported"))
    objc_msgSend(v5, "setSmileDetectionEnabled:", -[CAMBlinkAndSmileDetectionCommand _isSmileDetectionEnabled](self, "_isSmileDetectionEnabled"));

}

- (BOOL)_isBlinkDetectionEnabled
{
  return self->__blinkDetectionEnabled;
}

- (BOOL)_isSmileDetectionEnabled
{
  return self->__smileDetectionEnabled;
}

@end
