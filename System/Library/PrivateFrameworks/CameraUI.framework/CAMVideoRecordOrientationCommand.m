@implementation CAMVideoRecordOrientationCommand

- (CAMVideoRecordOrientationCommand)initWithEnabled:(BOOL)a3
{
  CAMVideoRecordOrientationCommand *v4;
  CAMVideoRecordOrientationCommand *v5;
  CAMVideoRecordOrientationCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordOrientationCommand;
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
  void *v4;
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "currentMovieFileOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMVideoRecordOrientationCommand _isEnabled](self, "_isEnabled");
  if (v5)
  {
    objc_msgSend(v4, "setRecordsVideoOrientationAndMirroringChanges:asMetadataTrackForConnection:", v6, v5);
  }
  else if (v6)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Unable to opt-in to video orientation and mirroring timed metadata, the connection is invalid.", v8, 2u);
    }

  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMVideoRecordOrientationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoRecordOrientationCommand *v5;
  CAMVideoRecordOrientationCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordOrientationCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoRecordOrientationCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordOrientationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordOrientationCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoRecordOrientationCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordOrientationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoRecordOrientationCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
