@implementation CAMVideoStabilizationCommand

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "currentMovieFileOutput");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "isVideoStabilizationModeSupported:", 3);
  v9 = -[CAMVideoStabilizationCommand _strength](self, "_strength");
  if (v9 > 3)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v10 = qword_1DB9A5810[v9];
    v11 = qword_1DB9A5830[v9];
  }
  if (objc_msgSend(v5, "isVideoStabilizationSupported"))
  {
    if (objc_msgSend(v6, "isVideoStabilizationModeSupported:", v11))
      v12 = v11;
    else
      v12 = -1;
    objc_msgSend(v5, "setPreferredVideoStabilizationMode:", v12);
  }
  if ((v8 & objc_msgSend(v6, "isVideoStabilizationStrengthSupported:", v10)) == 1)
    objc_msgSend(v7, "setVideoStabilizationStrength:", v10);

}

- (CAMVideoStabilizationCommand)initWithAutomaticVideoStabilizationEnabled:(BOOL)a3 strength:(int64_t)a4
{
  CAMVideoStabilizationCommand *v6;
  CAMVideoStabilizationCommand *v7;
  CAMVideoStabilizationCommand *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMVideoStabilizationCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->__enabled = a3;
    v6->__strength = a4;
    v8 = v6;
  }

  return v7;
}

- (CAMVideoStabilizationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoStabilizationCommand *v5;
  CAMVideoStabilizationCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoStabilizationCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoStabilizationCommandEnabled"));
    v5->__strength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMVideoStabilizationCommandStrength"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoStabilizationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoStabilizationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoStabilizationCommandEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMVideoStabilizationCommand _strength](self, "_strength"), CFSTR("CAMVideoStabilizationCommandStrength"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoStabilizationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoStabilizationCommand _isEnabled](self, "_isEnabled");
  *((_QWORD *)v4 + 4) = -[CAMVideoStabilizationCommand _strength](self, "_strength");
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (int64_t)_strength
{
  return self->__strength;
}

@end
