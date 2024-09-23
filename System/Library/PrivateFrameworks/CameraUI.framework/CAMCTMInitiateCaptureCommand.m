@implementation CAMCTMInitiateCaptureCommand

- (CAMCTMInitiateCaptureCommand)initWithSettings:(id)a3
{
  id v5;
  CAMCTMInitiateCaptureCommand *v6;
  CAMCTMInitiateCaptureCommand *v7;
  CAMCTMInitiateCaptureCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMInitiateCaptureCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__settings, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMCTMInitiateCaptureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMCTMInitiateCaptureCommand *v5;
  uint64_t v6;
  CAMStillImageCaptureRequest *settings;
  CAMCTMInitiateCaptureCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMInitiateCaptureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMCTMInitiateCaptureCommandSettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->__settings;
    v5->__settings = (CAMStillImageCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCTMInitiateCaptureCommand _settings](self, "_settings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMCTMInitiateCaptureCommandSettings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCTMInitiateCaptureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMCTMInitiateCaptureCommand _settings](self, "_settings");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentStillImageOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCTMInitiateCaptureCommand _momentSettingsWithContext:](self, "_momentSettingsWithContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCTMInitiateCaptureCommand _settings](self, "_settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "needsLivePhotoCaptureResumedOnPhotoOutput:", v5))
    objc_msgSend(v5, "setLivePhotoCaptureSuspended:", 0);
  objc_msgSend(v8, "persistenceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheMomentCaptureSettings:forIdentifier:", v7, v9);
  if (objc_msgSend(v5, "isMovieRecordingEnabled"))
  {
    objc_msgSend(v5, "beginMomentCaptureWithSettings:delegate:", v7, v6);
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v7, "uniqueID");
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called beginMomentCaptureWithSettings:", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMCTMInitiateCaptureCommand executeWithContext:].cold.1(v7, v10);
  }

}

- (id)_momentSettingsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  id v13;

  v4 = a3;
  -[CAMCTMInitiateCaptureCommand _settings](self, "_settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTorchAvailable"))
    v7 = objc_msgSend(v5, "torchMode");
  else
    v7 = 0;
  objc_msgSend(v5, "capturePhotoSettingsWithContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B250], "settingsWithPhotoSettings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTorchMode:", +[CAMCaptureConversions captureTorchModeForTorchMode:](CAMCaptureConversions, "captureTorchModeForTorchMode:", v7));
  objc_msgSend(v9, "bravoCameraSelectionBehaviorForRecording");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C89F28]) & 1) == 0)
  {
    v11 = objc_msgSend(v5, "disablesCameraSwitchingDuringRecording");
    v12 = (id *)MEMORY[0x1E0C89F18];
    if (!v11)
      v12 = (id *)MEMORY[0x1E0C89F20];
    v13 = *v12;

    objc_msgSend(v9, "setBravoCameraSelectionBehaviorForRecording:", v13);
    v10 = v13;
  }

  return v9;
}

- (CAMStillImageCaptureRequest)_settings
{
  return self->__settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__settings, 0);
}

- (void)executeWithContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "uniqueID");
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "captureID:%lld Attempting to beginMomentCaptureWithSettings but movieRecordingEnabled = NO!", (uint8_t *)&v3, 0xCu);
}

@end
