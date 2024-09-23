@implementation CAMPostConfigurationSetupCommand

- (CAMPostConfigurationSetupCommand)initWithGraphConfiguration:(id)a3
{
  id v5;
  CAMPostConfigurationSetupCommand *v6;
  CAMPostConfigurationSetupCommand *v7;
  CAMPostConfigurationSetupCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPostConfigurationSetupCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphConfiguration, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPostConfigurationSetupCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (CAMPostConfigurationSetupCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMPostConfigurationSetupCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (void)executeWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[CAMPostConfigurationSetupCommand _configureControlCenterVideoEffectsForContext:](self, "_configureControlCenterVideoEffectsForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureSmoothZoomingForContext:](self, "_configureSmoothZoomingForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureVideoGreenGhostMitigationForContext:](self, "_configureVideoGreenGhostMitigationForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureLivePhotoPreservationSuspension:](self, "_configureLivePhotoPreservationSuspension:", v4);
  -[CAMPostConfigurationSetupCommand _configureAudioSessionMixesWithOthersForContext:](self, "_configureAudioSessionMixesWithOthersForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureStereoVideoCaptureEnabled:](self, "_configureStereoVideoCaptureEnabled:", v4);
  -[CAMPostConfigurationSetupCommand _configureAudioConfigurationForContext:](self, "_configureAudioConfigurationForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureAudioWindNoiseRemovalEnabledForContext:](self, "_configureAudioWindNoiseRemovalEnabledForContext:", v4);
  -[CAMPostConfigurationSetupCommand _configureSpatialPhotoCaptureEnabled:](self, "_configureSpatialPhotoCaptureEnabled:", v4);
  -[CAMPostConfigurationSetupCommand _configureTrueVideoEnabled:](self, "_configureTrueVideoEnabled:", v4);
  -[CAMPostConfigurationSetupCommand _configure48MPZSL:](self, "_configure48MPZSL:", v4);

}

- (void)_configureControlCenterVideoEffectsForContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "currentVideoDeviceInput");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundBlurAllowed:", 0);
  objc_msgSend(v3, "setCenterStageAllowed:", 0);

}

- (void)_configureSmoothZoomingForContext:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "currentMovieFileOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideoZoomSmoothingSupported"))
    objc_msgSend(v3, "setVideoZoomSmoothingEnabled:", objc_msgSend(v3, "isVideoZoomSmoothingSupported"));

}

- (void)_configureVideoGreenGhostMitigationForContext:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "currentMovieFileOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideoGreenGhostMitigationSupported"))
    objc_msgSend(v3, "setVideoGreenGhostMitigationEnabled:", 1);

}

- (void)_configureLivePhotoPreservationSuspension:(id)a3
{
  id v3;

  objc_msgSend(a3, "currentStillImageOutput");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLivePhotoCaptureSupported") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setPreservesLivePhotoCaptureSuspendedOnSessionStop:", 1);

}

- (void)_configureAudioSessionMixesWithOthersForContext:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "currentCaptureSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConfiguresApplicationAudioSessionToMixWithOthers:", objc_msgSend(v4, "mixAudioWithOthers"));

  }
}

- (void)_configureStereoVideoCaptureEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "currentMovieFileOutput");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v5)
  {
    -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enableStereoVideoCapture");

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSpatialModeSupported");

    if (v9)
    {
      -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mode");

      if (v11 == 8)
        v7 = 1;
      else
        v7 = v7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v12, "isStereoVideoCaptureSupported")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "setStereoVideoCaptureEnabled:", v7);
    }
  }

}

- (void)_configureAudioConfigurationForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentAudioDeviceInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "audioConfiguration");

    v7 = +[CAMCaptureConversions AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:](CAMCaptureConversions, "AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:", v6);
    v8 = objc_msgSend(v4, "isAudioCaptureModeSupported:", v7);
    if (v8 && v6)
    {
      objc_msgSend(v4, "setAudioCaptureMode:", v7);
    }
    else if ((v8 & 1) == 0)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Requested audio capture mode not supported: %{public}@", (uint8_t *)&v11, 0xCu);

      }
    }
  }

}

- (void)_configureAudioWindNoiseRemovalEnabledForContext:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  char v7;
  int v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "currentAudioDeviceInput");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v10 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v10;
    if ((v6 & 1) != 0)
    {
      v7 = objc_opt_respondsToSelector();
      v5 = v10;
      if ((v7 & 1) != 0)
      {
        v8 = objc_msgSend(v10, "isWindNoiseRemovalSupported");
        v5 = v10;
        if (v8)
        {
          -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration", v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setWindNoiseRemovalEnabled:", objc_msgSend(v9, "windNoiseRemovalEnabled"));

          v5 = v10;
        }
      }
    }
  }

}

- (void)_configureSpatialPhotoCaptureEnabled:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "currentStillImageOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mode");

    if (objc_msgSend(v6, "isSpatialPhotoCaptureSupported"))
      objc_msgSend(v6, "setSpatialPhotoCaptureEnabled:", v5 == 9);
  }

}

- (void)_configureTrueVideoEnabled:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "currentMovieFileOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "isTrueVideoCaptureSupported");
    v5 = v8;
    if (v6)
    {
      -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTrueVideoCaptureEnabled:", objc_msgSend(v7, "trueVideoEnabled"));

      v5 = v8;
    }
  }

}

- (void)_configure48MPZSL:(id)a3
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CAMUltraHighResolutionZeroShutterLagEnabledCommand executeWithContext:].cold.1(v5);
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isUltraHighResolutionZeroShutterLagSupported"))
    {
      -[CAMPostConfigurationSetupCommand graphConfiguration](self, "graphConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[NSObject maximumPhotoResolution](v5, "maximumPhotoResolution") == 3);
LABEL_8:

    }
  }

}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
}

@end
