@implementation CAMRampToVideoZoomFactorCommand

- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 rate:(float)a4 graphConfiguration:(id)a5
{
  id v9;
  CAMRampToVideoZoomFactorCommand *v10;
  CAMRampToVideoZoomFactorCommand *v11;
  CAMRampToVideoZoomFactorCommand *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v10 = -[CAMCaptureCommand initWithSubcommands:](&v14, sel_initWithSubcommands_, 0);
  v11 = v10;
  if (v10)
  {
    v10->__videoZoomFactor = a3;
    v10->__rate = a4;
    v10->__duration = 0.0;
    v10->__videoZoomRampTuning = 0;
    objc_storeStrong((id *)&v10->__graphConfiguration, a5);
    v12 = v11;
  }

  return v11;
}

- (CAMRampToVideoZoomFactorCommand)initWithVideoZoomFactor:(double)a3 duration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6
{
  id v11;
  CAMRampToVideoZoomFactorCommand *v12;
  CAMRampToVideoZoomFactorCommand *v13;
  CAMRampToVideoZoomFactorCommand *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v12 = -[CAMCaptureCommand initWithSubcommands:](&v16, sel_initWithSubcommands_, 0);
  v13 = v12;
  if (v12)
  {
    v12->__videoZoomFactor = a3;
    v12->__rate = 0.0;
    v12->__duration = a4;
    v12->__videoZoomRampTuning = a5;
    objc_storeStrong((id *)&v12->__graphConfiguration, a6);
    v14 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMRampToVideoZoomFactorCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[CAMRampToVideoZoomFactorCommand _videoZoomFactor](self, "_videoZoomFactor");
  v4[4] = v5;
  -[CAMRampToVideoZoomFactorCommand _rate](self, "_rate");
  *((_DWORD *)v4 + 6) = v6;
  -[CAMRampToVideoZoomFactorCommand _duration](self, "_duration");
  v4[5] = v7;
  v4[6] = -[CAMRampToVideoZoomFactorCommand _videoZoomRampTuning](self, "_videoZoomRampTuning");
  -[CAMRampToVideoZoomFactorCommand _graphConfiguration](self, "_graphConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[7];
  v4[7] = v8;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  double v30;
  double v31;
  float v32;
  int64_t v33;
  double v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  double v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMRampToVideoZoomFactorCommand _videoZoomFactor](self, "_videoZoomFactor");
  v6 = v5;
  -[CAMRampToVideoZoomFactorCommand _rate](self, "_rate");
  v8 = v7;
  -[CAMRampToVideoZoomFactorCommand _duration](self, "_duration");
  v10 = v9;
  objc_msgSend(v4, "currentVideoDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isDepthDataDeliveryEnabled");
  -[CAMRampToVideoZoomFactorCommand _graphConfiguration](self, "_graphConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "mode");

  objc_msgSend(v12, "videoMaxZoomFactor");
  if (v6 <= v17)
  {
    v18 = v6;
  }
  else
  {
    v18 = v17;
    v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v42 = v6;
      v43 = 2048;
      v44 = *(_QWORD *)&v18;
      _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
    }

  }
  if (v18 < 1.0)
  {
    v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v42 = v18;
      v43 = 2048;
      v44 = 0x3FF0000000000000;
      _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Clamping videoZoom factor: %.4f->%.4f", buf, 0x16u);
    }

    v18 = 1.0;
  }
  if (!v14)
    goto LABEL_25;
  v35 = v16;
  objc_msgSend(v12, "supportedVideoZoomRangesForDepthDataDelivery");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v26, "minZoomFactor");
        if (v18 >= v27)
        {
          objc_msgSend(v26, "maxZoomFactor");
          if (v18 <= v28)
          {

            goto LABEL_25;
          }
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v23)
        continue;
      break;
    }
  }

  if (v35)
  {
    v29 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v42 = v18;
      _os_log_impl(&dword_1DB760000, v29, OS_LOG_TYPE_DEFAULT, "Ignoring zoom request, depth delivery is enabled but zoomFactor of %f is not supported", buf, 0xCu);
    }

  }
  else
  {
LABEL_25:
    if (-[CAMRampToVideoZoomFactorCommand _videoZoomRampTuning](self, "_videoZoomRampTuning"))
    {
      v33 = +[CAMCaptureConversions AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:](CAMCaptureConversions, "AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:", -[CAMRampToVideoZoomFactorCommand _videoZoomRampTuning](self, "_videoZoomRampTuning"));
      v32 = v18;
      *(float *)&v34 = v32;
      objc_msgSend(v11, "rampToVideoZoomFactor:withTuning:", v33, v34);
    }
    else if (v10 <= 0.0)
    {
      if (v8 <= 0.0)
      {
        objc_msgSend(v11, "setVideoZoomFactor:", v18);
      }
      else
      {
        *(float *)&v31 = v8;
        objc_msgSend(v11, "rampToVideoZoomFactor:withRate:", v18, v31);
      }
    }
    else
    {
      *(float *)&v30 = v18;
      objc_msgSend(v11, "rampExponentiallyToVideoZoomFactor:withDuration:", v30, v10);
    }
  }

}

- (double)_videoZoomFactor
{
  return self->__videoZoomFactor;
}

- (float)_rate
{
  return self->__rate;
}

- (double)_duration
{
  return self->__duration;
}

- (int64_t)_videoZoomRampTuning
{
  return self->__videoZoomRampTuning;
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
