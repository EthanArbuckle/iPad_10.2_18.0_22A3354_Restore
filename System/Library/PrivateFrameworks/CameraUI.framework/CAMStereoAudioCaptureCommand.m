@implementation CAMStereoAudioCaptureCommand

- (CAMStereoAudioCaptureCommand)initWithStereoAudioCaptureEnabled:(BOOL)a3
{
  CAMStereoAudioCaptureCommand *v4;
  CAMStereoAudioCaptureCommand *v5;
  CAMStereoAudioCaptureCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStereoAudioCaptureCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_stereoAudioCaptureEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMStereoAudioCaptureCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMStereoAudioCaptureCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStereoAudioCaptureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStereoAudioCaptureCommand isStereoAudioCaptureEnabled](self, "isStereoAudioCaptureEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentAudioDeviceInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMStereoAudioCaptureCommand isStereoAudioCaptureEnabled](self, "isStereoAudioCaptureEnabled");
  if (objc_msgSend(v4, "isBuiltInMicrophoneStereoAudioCaptureSupported"))
  {
    objc_msgSend(v4, "setBuiltInMicrophoneStereoAudioCaptureEnabled:", v5);
  }
  else if (v5)
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Could not enable stereo audio on %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (BOOL)isStereoAudioCaptureEnabled
{
  return self->_stereoAudioCaptureEnabled;
}

@end
