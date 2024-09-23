@implementation CAMPortraitApertureCommand

- (CAMPortraitApertureCommand)initWithAperture:(double)a3
{
  CAMPortraitApertureCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->_aperture = a3;
  return result;
}

- (CAMPortraitApertureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPortraitApertureCommand *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitApertureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CAMPortraitApertureCommandAperture"));
    v5->_aperture = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("CAMPortraitApertureCommandAperture"), self->_aperture, v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPortraitApertureCommand;
  result = -[CAMCaptureCommand copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_aperture;
  return result;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  float v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)();
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDeviceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __49__CAMPortraitApertureCommand_executeWithContext___block_invoke;
  v24 = &unk_1EA328A40;
  v7 = v5;
  v25 = v7;
  v8 = v6;
  v26 = v8;
  if (executeWithContext__onceToken != -1)
    dispatch_once(&executeWithContext__onceToken, &v21);
  if (executeWithContext__spiAvailable)
  {
    -[CAMPortraitApertureCommand aperture](self, "aperture", v21, v22, v23, v24, v25, v26);
    v10 = v9;
    objc_msgSend(v8, "minSimulatedAperture");
    v12 = v11;
    objc_msgSend(v8, "maxSimulatedAperture");
    if (v12 == 0.0 || v13 == 0.0)
    {
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring aperture change request because device format has minSimulatedAperture/maxSimulatedAperture==0", buf, 2u);
      }
    }
    else
    {
      v14 = v13;
      v15 = v12;
      if (v10 > v12)
        v15 = v10;
      if (v15 <= v14)
        v16 = v15;
      else
        v16 = v14;
      if (v16 == v10)
      {
        v16 = v10;
      }
      else
      {
        v17 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v28 = v10;
          v29 = 2048;
          v30 = v16;
          _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Clamping aperture: %.2f->%.2f", buf, 0x16u);
        }

      }
      v19 = v16;
      *(float *)&v14 = v19;
      objc_msgSend(v7, "setSimulatedAperture:", v14);
      objc_msgSend(v4, "apertureSlider");
      v18 = objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = v16;
      -[NSObject setValue:](v18, "setValue:", v20);
    }

  }
}

void __49__CAMPortraitApertureCommand_executeWithContext___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    executeWithContext__spiAvailable = objc_opt_respondsToSelector() & 1;
    if (executeWithContext__spiAvailable)
      return;
  }
  else
  {
    executeWithContext__spiAvailable = 0;
  }
  v0 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB760000, v0, OS_LOG_TYPE_DEFAULT, "AVFoundation SPI for simulatedAperture not available.", v1, 2u);
  }

}

- (double)aperture
{
  return self->_aperture;
}

@end
