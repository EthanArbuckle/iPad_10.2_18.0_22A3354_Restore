@implementation CAMVideoFramerateCommand

- (CAMVideoFramerateCommand)initWithVideoConfiguration:(int64_t)a3
{
  CAMVideoFramerateCommand *v4;
  CAMVideoFramerateCommand *v5;
  CAMVideoFramerateCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoFramerateCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__videoConfiguration = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoFramerateCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoFramerateCommand *v5;
  CAMVideoFramerateCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoFramerateCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__videoConfiguration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMVideoFramerateCommandVideoConfiguration"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoFramerateCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMVideoFramerateCommand _videoConfiguration](self, "_videoConfiguration", v5.receiver, v5.super_class), CFSTR("CAMVideoFramerateCommandVideoConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoFramerateCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMVideoFramerateCommand _videoConfiguration](self, "_videoConfiguration");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  __int128 v12;
  uint8_t buf[24];
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CAMVideoFramerateCommand _videoConfiguration](self, "_videoConfiguration");
  if (v7)
    objc_msgSend(v7, "cam_frameDurationForVideoConfiguration:", v8);
  memset(buf, 0, sizeof(buf));
  if (objc_msgSend(v7, "cam_supportsFrameDuration:", buf))
  {
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v5, "setActiveVideoMinFrameDuration:", buf);
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v5, "setActiveVideoMaxFrameDuration:", buf);
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v6, "setVideoMinFrameDurationOverride:", buf);
  }
  else
  {
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
    v12 = *(_OWORD *)buf;
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v9 = *(_QWORD *)&buf[16];
    objc_msgSend(v6, "setVideoMinFrameDurationOverride:", buf);
    *(_OWORD *)buf = v12;
    *(_QWORD *)&buf[16] = v9;
    objc_msgSend(v5, "setActiveVideoMinFrameDuration:", buf);
    *(_OWORD *)buf = v12;
    *(_QWORD *)&buf[16] = v9;
    objc_msgSend(v5, "setActiveVideoMaxFrameDuration:", buf);
    if (v5)
    {
      objc_msgSend(v5, "activeVideoMinFrameDuration");
      objc_msgSend(v5, "activeVideoMaxFrameDuration");
    }
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      switch(v8)
      {
        case 0:
          v11 = CFSTR("Auto");
          break;
        case 1:
          v11 = CFSTR("1080p60");
          break;
        case 2:
          v11 = CFSTR("720p120");
          break;
        case 3:
          v11 = CFSTR("720p240");
          break;
        case 4:
          v11 = CFSTR("1080p120");
          break;
        case 5:
          v11 = CFSTR("4k30");
          break;
        case 6:
          v11 = CFSTR("720p30");
          break;
        case 7:
          v11 = CFSTR("1080p30");
          break;
        case 8:
          v11 = CFSTR("1080p240");
          break;
        case 9:
          v11 = CFSTR("4k60");
          break;
        case 10:
          v11 = CFSTR("4k24");
          break;
        case 11:
          v11 = CFSTR("1080p25");
          break;
        case 12:
          v11 = CFSTR("4k25");
          break;
        case 13:
          v11 = CFSTR("4k120");
          break;
        case 14:
          v11 = CFSTR("4k100");
          break;
        default:
          switch(v8)
          {
            case 10000:
              v11 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v11 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v11 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v11 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v11 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v11 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v11 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = 0 / 0;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0 / 0;
      *(_WORD *)&buf[22] = 2114;
      v14 = v11;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Resetting video min/max framerate to %ld/%ld for configuration %{public}@ and current format %{public}@", buf, 0x2Au);
    }

  }
}

- (int64_t)_videoConfiguration
{
  return self->__videoConfiguration;
}

@end
