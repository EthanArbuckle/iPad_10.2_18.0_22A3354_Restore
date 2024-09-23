@implementation CAMVideoHDRSuspensionCommand

- (CAMVideoHDRSuspensionCommand)initWithVideoHDRSuspended:(BOOL)a3
{
  CAMVideoHDRSuspensionCommand *v4;
  CAMVideoHDRSuspensionCommand *v5;
  CAMVideoHDRSuspensionCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoHDRSuspensionCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->_videoHDRSuspended = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoHDRSuspensionCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMVideoHDRSuspensionCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoHDRSuspensionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoHDRSuspensionCommand isVideoHDRSuspended](self, "isVideoHDRSuspended");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v5, "isVideoHDREnabled")
      && objc_msgSend(v6, "isVideoHDRSuspensionSupported"))
    {
      v7 = -[CAMVideoHDRSuspensionCommand isVideoHDRSuspended](self, "isVideoHDRSuspended");
      if (v7 || objc_msgSend(v5, "isVideoHDRSuspended"))
      {
        v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = CFSTR("NO");
          if (v7)
            v9 = CFSTR("YES");
          v10 = v9;
          v12 = 138543362;
          v13 = v10;
          _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Setting videoHDRSuspended=%{public}@", (uint8_t *)&v12, 0xCu);

        }
      }
      objc_msgSend(v5, "setVideoHDRSuspended:", v7);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "videoHDRSuspended SPI unavailable!", (uint8_t *)&v12, 2u);
    }

  }
}

- (BOOL)isVideoHDRSuspended
{
  return self->_videoHDRSuspended;
}

@end
