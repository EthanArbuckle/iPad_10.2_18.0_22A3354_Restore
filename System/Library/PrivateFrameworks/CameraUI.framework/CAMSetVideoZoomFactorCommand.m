@implementation CAMSetVideoZoomFactorCommand

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMSetVideoZoomFactorCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[CAMSetVideoZoomFactorCommand _videoZoomFactor](self, "_videoZoomFactor");
  v4[3] = v5;
  -[CAMSetVideoZoomFactorCommand _graphConfiguration](self, "_graphConfiguration");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v4[4];
  v4[4] = v6;

  return v4;
}

- (double)_videoZoomFactor
{
  return self->__videoZoomFactor;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSetVideoZoomFactorCommand _videoZoomFactor](self, "_videoZoomFactor");
  v9 = v8;
  -[CAMSetVideoZoomFactorCommand _graphConfiguration](self, "_graphConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mode");

  if (objc_msgSend(v7, "isDepthDataDeliveryEnabled") && v11)
  {
    objc_msgSend(v6, "supportedVideoZoomRangesForDepthDataDelivery");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v17, "minZoomFactor", (_QWORD)v25);
          if (v9 >= v18)
          {
            objc_msgSend(v17, "maxZoomFactor");
            if (v9 <= v19)
            {

              goto LABEL_16;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v14)
          continue;
        break;
      }
    }

    v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v9;
      _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring zoom ramp request, depth delivery is enabled but zoomFactor of %f is not supported", buf, 0xCu);
    }

  }
  else
  {
LABEL_16:
    objc_msgSend(v6, "videoMaxZoomFactor");
    if (v9 <= v21)
    {
      v22 = v9;
    }
    else
    {
      v22 = v21;
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v30 = v9;
        v31 = 2048;
        v32 = *(_QWORD *)&v22;
        _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
      }

    }
    if (v22 < 1.0)
    {
      v24 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v30 = v22;
        v31 = 2048;
        v32 = 0x3FF0000000000000;
        _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
      }

      v22 = 1.0;
    }
    objc_msgSend(v5, "setVideoZoomFactor:", v22);
  }

}

- (CAMSetVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 graphConfiguration:(id)a4
{
  id v7;
  CAMSetVideoZoomFactorCommand *v8;
  CAMSetVideoZoomFactorCommand *v9;
  CAMSetVideoZoomFactorCommand *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMSetVideoZoomFactorCommand;
  v8 = -[CAMCaptureCommand initWithSubcommands:](&v12, sel_initWithSubcommands_, 0);
  v9 = v8;
  if (v8)
  {
    v8->__videoZoomFactor = a3;
    objc_storeStrong((id *)&v8->__graphConfiguration, a4);
    v10 = v9;
  }

  return v9;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__graphConfiguration, 0);
}

@end
