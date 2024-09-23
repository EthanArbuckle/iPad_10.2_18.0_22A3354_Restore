@implementation CAMUserPreferenceOverrides

- (CAMUserPreferenceOverrides)initWithLaunchOptions:(id)a3
{
  id v4;
  void *v5;
  CAMUserPreferenceOverrides *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[CAMUserPreferenceOverrides initWithShortcutItem:](self, "initWithShortcutItem:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC47D0]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6 && v7)
  {
    v6 = -[CAMUserPreferenceOverrides initWithConfigurationURL:](self, "initWithConfigurationURL:", v7);
    self = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatioCrop, 0);
  objc_storeStrong((id *)&self->_torchMode, 0);
  objc_storeStrong((id *)&self->_flashMode, 0);
  objc_storeStrong((id *)&self->_wantsQRCodes, 0);
  objc_storeStrong((id *)&self->_cinematicConfiguration, 0);
  objc_storeStrong((id *)&self->_slomoConfiguration, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_captureMode, 0);
}

- (CAMUserPreferenceOverrides)initWithOverrides:(id)a3
{
  id v4;
  CAMUserPreferenceOverrides *v5;
  uint64_t v6;
  NSNumber *captureMode;
  uint64_t v8;
  NSNumber *captureDevice;
  uint64_t v10;
  NSNumber *videoConfiguration;
  uint64_t v12;
  NSNumber *slomoConfiguration;
  uint64_t v14;
  NSNumber *cinematicConfiguration;
  uint64_t v16;
  NSNumber *wantsQRCodes;
  uint64_t v18;
  NSNumber *flashMode;
  uint64_t v20;
  NSNumber *torchMode;
  uint64_t v22;
  NSNumber *aspectRatioCrop;
  CAMUserPreferenceOverrides *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = -[CAMUserPreferenceOverrides init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "captureMode");
    v6 = objc_claimAutoreleasedReturnValue();
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v6;

    objc_msgSend(v4, "captureDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v8;

    objc_msgSend(v4, "videoConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (NSNumber *)v10;

    objc_msgSend(v4, "slomoConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    slomoConfiguration = v5->_slomoConfiguration;
    v5->_slomoConfiguration = (NSNumber *)v12;

    objc_msgSend(v4, "cinematicConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    cinematicConfiguration = v5->_cinematicConfiguration;
    v5->_cinematicConfiguration = (NSNumber *)v14;

    objc_msgSend(v4, "wantsQRCodes");
    v16 = objc_claimAutoreleasedReturnValue();
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v16;

    objc_msgSend(v4, "flashMode");
    v18 = objc_claimAutoreleasedReturnValue();
    flashMode = v5->_flashMode;
    v5->_flashMode = (NSNumber *)v18;

    objc_msgSend(v4, "torchMode");
    v20 = objc_claimAutoreleasedReturnValue();
    torchMode = v5->_torchMode;
    v5->_torchMode = (NSNumber *)v20;

    objc_msgSend(v4, "aspectRatioCrop");
    v22 = objc_claimAutoreleasedReturnValue();
    aspectRatioCrop = v5->_aspectRatioCrop;
    v5->_aspectRatioCrop = (NSNumber *)v22;

    v24 = v5;
  }

  return v5;
}

- (BOOL)hasOverrides
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CAMUserPreferenceOverrides captureMode](self, "captureMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CAMUserPreferenceOverrides captureDevice](self, "captureDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[CAMUserPreferenceOverrides videoConfiguration](self, "videoConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[CAMUserPreferenceOverrides slomoConfiguration](self, "slomoConfiguration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[CAMUserPreferenceOverrides cinematicConfiguration](self, "cinematicConfiguration");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v4 = 1;
          }
          else
          {
            -[CAMUserPreferenceOverrides wantsQRCodes](self, "wantsQRCodes");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v4 = 1;
            }
            else
            {
              -[CAMUserPreferenceOverrides aspectRatioCrop](self, "aspectRatioCrop");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v4 = 1;
              }
              else
              {
                -[CAMUserPreferenceOverrides flashMode](self, "flashMode");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (v11)
                {
                  v4 = 1;
                }
                else
                {
                  -[CAMUserPreferenceOverrides torchMode](self, "torchMode");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = v12 != 0;

                }
              }

            }
          }

        }
      }

    }
  }

  return v4;
}

- (NSNumber)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(id)a3
{
  objc_storeStrong((id *)&self->_captureMode, a3);
}

- (NSNumber)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_captureDevice, a3);
}

- (NSNumber)videoConfiguration
{
  return self->_videoConfiguration;
}

- (void)setVideoConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_videoConfiguration, a3);
}

- (NSNumber)slomoConfiguration
{
  return self->_slomoConfiguration;
}

- (void)setSlomoConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_slomoConfiguration, a3);
}

- (NSNumber)cinematicConfiguration
{
  return self->_cinematicConfiguration;
}

- (void)setCinematicConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cinematicConfiguration, a3);
}

- (NSNumber)wantsQRCodes
{
  return self->_wantsQRCodes;
}

- (void)setWantsQRCodes:(id)a3
{
  objc_storeStrong((id *)&self->_wantsQRCodes, a3);
}

- (NSNumber)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(id)a3
{
  objc_storeStrong((id *)&self->_flashMode, a3);
}

- (NSNumber)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(id)a3
{
  objc_storeStrong((id *)&self->_torchMode, a3);
}

- (NSNumber)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (void)setAspectRatioCrop:(id)a3
{
  objc_storeStrong((id *)&self->_aspectRatioCrop, a3);
}

- (CAMUserPreferenceOverrides)initWithShortcutItem:(id)a3
{
  id v4;
  CAMUserPreferenceOverrides *v5;
  void *v6;
  uint64_t v7;
  NSNumber *captureMode;
  uint64_t v9;
  NSNumber *captureDevice;
  uint64_t v11;
  NSNumber *videoConfiguration;
  uint64_t v13;
  NSNumber *slomoConfiguration;
  uint64_t v15;
  NSNumber *cinematicConfiguration;
  uint64_t v17;
  NSNumber *wantsQRCodes;
  CAMUserPreferenceOverrides *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = -[CAMUserPreferenceOverrides init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMCaptureMode"));
    v7 = objc_claimAutoreleasedReturnValue();
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v7;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMCaptureDevice"));
    v9 = objc_claimAutoreleasedReturnValue();
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMCaptureVideoConfiguration"));
    v11 = objc_claimAutoreleasedReturnValue();
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (NSNumber *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMCaptureSloMoConfiguration"));
    v13 = objc_claimAutoreleasedReturnValue();
    slomoConfiguration = v5->_slomoConfiguration;
    v5->_slomoConfiguration = (NSNumber *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMCaptureCinematicConfiguration"));
    v15 = objc_claimAutoreleasedReturnValue();
    cinematicConfiguration = v5->_cinematicConfiguration;
    v5->_cinematicConfiguration = (NSNumber *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wantsQRCodes"));
    v17 = objc_claimAutoreleasedReturnValue();
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v17;

    if (-[CAMUserPreferenceOverrides hasOverrides](v5, "hasOverrides"))
      v19 = v5;
    else
      v19 = 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CAMUserPreferenceOverrides)initWithConfigurationURL:(id)a3
{
  id v4;
  CAMUserPreferenceOverrides *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSNumber *captureMode;
  uint64_t v10;
  NSNumber *captureDevice;
  uint64_t v12;
  NSNumber *wantsQRCodes;
  CAMUserPreferenceOverrides *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMUserPreferenceOverrides;
  v5 = -[CAMUserPreferenceOverrides init](&v16, sel_init);
  if (v5
    && objc_msgSend(v4, "isConfigurationURL")
    && (objc_msgSend(v4, "configurationRequest"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "requestedCaptureMode"));
    v8 = objc_claimAutoreleasedReturnValue();
    captureMode = v5->_captureMode;
    v5->_captureMode = (NSNumber *)v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "requestedCaptureDevice"));
    v10 = objc_claimAutoreleasedReturnValue();
    captureDevice = v5->_captureDevice;
    v5->_captureDevice = (NSNumber *)v10;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "wantsQRCodeForSession"));
    v12 = objc_claimAutoreleasedReturnValue();
    wantsQRCodes = v5->_wantsQRCodes;
    v5->_wantsQRCodes = (NSNumber *)v12;

    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
