@implementation CAMMaximumPhotoResolutionCommand

- (CAMMaximumPhotoResolutionCommand)initWithMaximumPhotoResolution:(int64_t)a3
{
  CAMMaximumPhotoResolutionCommand *v4;
  CAMMaximumPhotoResolutionCommand *v5;
  CAMMaximumPhotoResolutionCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__maximumPhotoResolution = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMMaximumPhotoResolutionCommand)initWithSubcommands:(id)a3
{
  return -[CAMMaximumPhotoResolutionCommand initWithMaximumPhotoResolution:](self, "initWithMaximumPhotoResolution:", 0);
}

- (CAMMaximumPhotoResolutionCommand)initWithCoder:(id)a3
{
  return -[CAMMaximumPhotoResolutionCommand initWithMaximumPhotoResolution:](self, "initWithMaximumPhotoResolution:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CAMMaximumPhotoResolutionKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMMaximumPhotoResolutionCommand _maximumPhotoResolution](self, "_maximumPhotoResolution", v5.receiver, v5.super_class), CFSTR("CAMMaximumPhotoResolutionKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMMaximumPhotoResolutionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMMaximumPhotoResolutionCommand _maximumPhotoResolution](self, "_maximumPhotoResolution");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  $2825F4736939C4A6D3AD43837233062D v10;
  uint8_t buf[4];
  int var0;
  __int16 v13;
  int var1;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentStillImageOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMMaximumPhotoResolutionCommand _maximumPhotoResolution](self, "_maximumPhotoResolution"))
  {
    objc_msgSend(v4, "currentVideoDeviceFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "supportedMaxPhotoDimensionsPrivate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v10 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:](CAMCaptureConversions, "CMVideoDimensionsForCAMPhotoResolution:", -[CAMMaximumPhotoResolutionCommand _maximumPhotoResolution](self, "_maximumPhotoResolution"));
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v10, "{?=ii}");
      v8 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
      {
        objc_msgSend(v5, "setMaxPhotoDimensions:", v10);
      }
      else
      {
        v9 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          var0 = v10.var0;
          v13 = 1024;
          var1 = v10.var1;
          _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "supportedMaxPhotoDimensions did not contain desired max photo dimensions (%d, %d)! Not setting AVCapturePhotoOutput maxPhotoDimensions", buf, 0xEu);
        }

      }
    }
    else
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "current AVCaptureDeviceFormat has no supportedMaxPhotoDimensions! Not setting AVCapturePhotoOutput maxPhotoDimensions", buf, 2u);
      }
    }

  }
}

- (int64_t)_maximumPhotoResolution
{
  return self->__maximumPhotoResolution;
}

@end
