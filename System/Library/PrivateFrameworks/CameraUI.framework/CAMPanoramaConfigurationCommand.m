@implementation CAMPanoramaConfigurationCommand

- (CAMPanoramaConfigurationCommand)initWithConfiguration:(id)a3
{
  id v5;
  CAMPanoramaConfigurationCommand *v6;
  CAMPanoramaConfigurationCommand *v7;
  CAMPanoramaConfigurationCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPanoramaConfigurationCommand;
  v6 = -[CAMCaptureCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMPanoramaConfigurationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPanoramaConfigurationCommand *v5;
  uint64_t v6;
  CAMPanoramaConfiguration *configuration;
  CAMPanoramaConfigurationCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMPanoramaConfigurationCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMPanoramaConfigurationCommandConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->__configuration;
    v5->__configuration = (CAMPanoramaConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaConfigurationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CAMPanoramaConfigurationCommand _configuration](self, "_configuration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMPanoramaConfigurationCommandConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaConfigurationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMPanoramaConfigurationCommand _configuration](self, "_configuration");
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
  NSObject *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPanoramaConfigurationCommand _configuration](self, "_configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  if (v7)
  {
    objc_msgSend(v7, "minimumFramerate");
    v12 = 0;
    v13 = 0;
    v14 = 0;
    objc_msgSend(v8, "maximumFramerate");
    if (objc_msgSend(v6, "cam_supportsPanoramaConfiguration:", v8))
    {
      objc_msgSend(v8, "minimumFramerate");
      objc_msgSend(v5, "setActiveVideoMinFrameDuration:", v11);
      objc_msgSend(v8, "maximumFramerate");
LABEL_6:
      objc_msgSend(v5, "setActiveVideoMaxFrameDuration:", v10);
      goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    if ((objc_msgSend(v6, "cam_supportsPanoramaConfiguration:", 0) & 1) != 0)
    {
      memset(v11, 0, sizeof(v11));
      objc_msgSend(v5, "setActiveVideoMinFrameDuration:", v11);
      memset(v10, 0, sizeof(v10));
      goto LABEL_6;
    }
  }
  v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v19 = v15;
    v20 = 1024;
    v21 = v16;
    v22 = 2048;
    v23 = v12;
    v24 = 1024;
    v25 = v13;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set invalid panorama framerates (%lld/%d and %lld/%d) for the current format %{public}@", buf, 0x2Cu);
  }

LABEL_10:
}

- (CAMPanoramaConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
}

@end
