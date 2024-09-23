@implementation CAMCaptureEngineDevice

- (CAMCaptureEngineDevice)initWithEngine:(id)a3 captureDevice:(id)a4
{
  id v6;
  id v7;
  CAMCaptureEngineDevice *v8;
  id v9;
  AVCaptureDevice **p_captureDevice;
  id v11;
  int v12;
  AVCaptureSystemZoomSlider *v13;
  AVCaptureSystemZoomSlider *systemZoomSlider;
  id v15;
  AVCaptureDevice *v16;
  AVCaptureSystemExposureBiasSlider *v17;
  AVCaptureSystemExposureBiasSlider *systemExposureSlider;
  AVCaptureSystemLensSelector *v19;
  AVCaptureSystemLensSelector *systemLensSelector;
  CAMMemoizationCache *v21;
  CAMMemoizationCache *videoDeviceFormatForVideoConfiguration;
  CAMMemoizationCache *v23;
  CAMMemoizationCache *videoSessionPresetForVideoConfiguration;
  _QWORD v26[4];
  id v27;
  id from;
  objc_super v29;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v7 = objc_loadWeakRetained(&location);

  v8 = 0;
  if (v6 && v7)
  {
    v29.receiver = self;
    v29.super_class = (Class)CAMCaptureEngineDevice;
    self = -[CAMCaptureEngineDevice init](&v29, sel_init);
    if (self)
    {
      v9 = objc_loadWeakRetained(&location);
      objc_storeWeak((id *)&self->__captureEngine, v9);

      p_captureDevice = &self->_captureDevice;
      objc_storeStrong((id *)&self->_captureDevice, a4);
      v11 = objc_loadWeakRetained(&location);
      v12 = objc_msgSend(v11, "controlsSupported");

      if (v12)
      {
        objc_initWeak(&from, self);
        v13 = (AVCaptureSystemZoomSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B160]), "initWithDevice:", *p_captureDevice);
        systemZoomSlider = self->_systemZoomSlider;
        self->_systemZoomSlider = v13;

        v15 = objc_alloc(MEMORY[0x1E0C8B140]);
        v16 = *p_captureDevice;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke;
        v26[3] = &unk_1EA328FA8;
        objc_copyWeak(&v27, &from);
        v17 = (AVCaptureSystemExposureBiasSlider *)objc_msgSend(v15, "initWithDevice:action:", v16, v26);
        systemExposureSlider = self->_systemExposureSlider;
        self->_systemExposureSlider = v17;

        v19 = (AVCaptureSystemLensSelector *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B148]), "initWithDevice:", v6);
        systemLensSelector = self->_systemLensSelector;
        self->_systemLensSelector = v19;

        objc_destroyWeak(&v27);
        objc_destroyWeak(&from);
      }
      v21 = -[CAMMemoizationCache initWithMemoizesNil:]([CAMMemoizationCache alloc], "initWithMemoizesNil:", 1);
      videoDeviceFormatForVideoConfiguration = self->__videoDeviceFormatForVideoConfiguration;
      self->__videoDeviceFormatForVideoConfiguration = v21;

      v23 = -[CAMMemoizationCache initWithMemoizesNil:]([CAMMemoizationCache alloc], "initWithMemoizesNil:", 1);
      videoSessionPresetForVideoConfiguration = self->__videoSessionPresetForVideoConfiguration;
      self->__videoSessionPresetForVideoConfiguration = v23;

      self = self;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  objc_destroyWeak(&location);
  return v8;
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (AVCaptureDeviceInput)captureDeviceInput
{
  AVCaptureDeviceInput *captureDeviceInput;
  void *v4;
  id WeakRetained;
  void *v6;
  AVCaptureDeviceInput *v7;
  AVCaptureDeviceInput *v8;
  AVCaptureDeviceInput *v9;
  id v10;
  AVCaptureDeviceInput *v11;
  NSObject *v12;
  id v14;

  captureDeviceInput = self->_captureDeviceInput;
  if (!captureDeviceInput)
  {
    -[CAMCaptureEngineDevice captureDevice](self, "captureDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->__captureEngine);
    objc_msgSend(v4, "deviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "prewarmedVideoDeviceInput:position:device:", v6, objc_msgSend(v4, "position"), v4);
    v7 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
    v8 = self->_captureDeviceInput;
    self->_captureDeviceInput = v7;

    if (!self->_captureDeviceInput)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0C8B0B0], "deviceInputWithDevice:error:", v4, &v14);
      v9 = (AVCaptureDeviceInput *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = self->_captureDeviceInput;
      self->_captureDeviceInput = v9;

      if (v10)
      {
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CAMCaptureEngineDevice captureDeviceInput].cold.1((uint64_t)v4, (uint64_t)v10, v12);

      }
    }

    captureDeviceInput = self->_captureDeviceInput;
  }
  return captureDeviceInput;
}

void __55__CAMCaptureEngineDevice_initWithEngine_captureDevice___block_invoke(uint64_t a1, float a2)
{
  id *v3;
  void *v4;
  id v5;
  double v6;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "systemDeviceActionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v3);
  *(float *)&v6 = a2;
  objc_msgSend(v4, "captureEngineDevice:didChangeSystemExposureTargetBias:", v5, v6);

}

- (id)_highestQualityDeviceFormatForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];

  -[CAMCaptureEngineDevice _videoDeviceFormatForVideoConfiguration](self, "_videoDeviceFormatForVideoConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngineDevice _keyForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_keyForVideoConfiguration:videoEncodingBehavior:colorSpace:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__CAMCaptureEngineDevice__highestQualityDeviceFormatForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  v13[3] = &unk_1EA328FD0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  objc_msgSend(v9, "objectForKey:memoizationBlock:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __108__CAMCaptureEngineDevice__highestQualityDeviceFormatForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "captureDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "cameraVideoFormat:orPreset:forVideoConfiguration:videoEncodingBehavior:colorSpace:", &v5, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = v5;

  return v3;
}

- (id)_highestQualitySessionPresetForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];

  -[CAMCaptureEngineDevice _videoSessionPresetForVideoConfiguration](self, "_videoSessionPresetForVideoConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureEngineDevice _keyForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_keyForVideoConfiguration:videoEncodingBehavior:colorSpace:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__CAMCaptureEngineDevice__highestQualitySessionPresetForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  v13[3] = &unk_1EA328FF8;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  objc_msgSend(v9, "objectForKey:memoizationBlock:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __109__CAMCaptureEngineDevice__highestQualitySessionPresetForVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "captureDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "cameraVideoFormat:orPreset:forVideoConfiguration:videoEncodingBehavior:colorSpace:", 0, &v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = v5;

  return v3;
}

- (id)_keyForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4 colorSpace:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("videoConfiguration=%lu, encoding=%lu, colorSpace=%lu"), a3, a4, a5);
}

- (id)_panoramaDeviceFormatForConfiguration:(id)a3
{
  AVCaptureDeviceFormat *cachedPanoramaDeviceFormat;
  id v5;
  void *v6;
  AVCaptureDeviceFormat *v7;
  AVCaptureDeviceFormat *v8;

  cachedPanoramaDeviceFormat = self->__cachedPanoramaDeviceFormat;
  if (!cachedPanoramaDeviceFormat)
  {
    v5 = a3;
    -[CAMCaptureEngineDevice captureDevice](self, "captureDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraPanoramaFormatForConfiguration:", v5);
    v7 = (AVCaptureDeviceFormat *)objc_claimAutoreleasedReturnValue();

    v8 = self->__cachedPanoramaDeviceFormat;
    self->__cachedPanoramaDeviceFormat = v7;

    cachedPanoramaDeviceFormat = self->__cachedPanoramaDeviceFormat;
  }
  return cachedPanoramaDeviceFormat;
}

- (id)_timelapseSessionPreset
{
  void *v2;
  void *v3;
  id v4;

  -[CAMCaptureEngineDevice captureDevice](self, "captureDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0C8A160];
  if ((objc_msgSend(v2, "supportsAVCaptureSessionPreset:", *MEMORY[0x1E0C8A160]) & 1) == 0)
  {
    v3 = (void *)*MEMORY[0x1E0C8A158];
    if (!objc_msgSend(v2, "supportsAVCaptureSessionPreset:", *MEMORY[0x1E0C8A158]))
      v3 = (void *)*MEMORY[0x1E0C8A170];
  }
  v4 = v3;

  return v4;
}

- (id)_portraitModeSessionPreset
{
  void *v2;
  id v3;

  -[CAMCaptureEngineDevice _portraitModeDeviceFormat](self, "_portraitModeDeviceFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = 0;
  else
    v3 = (id)*MEMORY[0x1E0C8A1A0];
  return v3;
}

- (id)_portraitModeDeviceFormat
{
  void *v3;
  int v4;
  AVCaptureDeviceFormat *cachedPortraitDeviceFormat;
  BOOL v6;
  void *v7;
  AVCaptureDeviceFormat *v8;
  AVCaptureDeviceFormat *v9;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usePortraitFrontFacingZoomedCaptureDeviceFormat");

  cachedPortraitDeviceFormat = self->__cachedPortraitDeviceFormat;
  if (cachedPortraitDeviceFormat)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    -[CAMCaptureEngineDevice captureDevice](self, "captureDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "position") == 2)
    {
      objc_msgSend(v7, "cam_formatForPortraitFrontFacingZoomed");
      v8 = (AVCaptureDeviceFormat *)objc_claimAutoreleasedReturnValue();
      v9 = self->__cachedPortraitDeviceFormat;
      self->__cachedPortraitDeviceFormat = v8;

    }
    cachedPortraitDeviceFormat = self->__cachedPortraitDeviceFormat;
  }
  return cachedPortraitDeviceFormat;
}

- (id)videoDeviceFormatForGraphConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "mode");
  v6 = 0;
  if (v5 <= 8)
  {
    if (((1 << v5) & 0x186) != 0)
    {
      -[CAMCaptureEngineDevice _highestQualityDeviceFormatForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_highestQualityDeviceFormatForVideoConfiguration:videoEncodingBehavior:colorSpace:", objc_msgSend(v4, "videoConfiguration"), objc_msgSend(v4, "videoEncodingBehavior"), objc_msgSend(v4, "colorSpace"));
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v7;
      goto LABEL_8;
    }
    if (v5 == 3)
    {
      +[CAMPanoramaConfiguration sharedInstance](CAMPanoramaConfiguration, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCaptureEngineDevice _panoramaDeviceFormatForConfiguration:](self, "_panoramaDeviceFormatForConfiguration:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    if (v5 == 6)
    {
      -[CAMCaptureEngineDevice _portraitModeDeviceFormat](self, "_portraitModeDeviceFormat");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_8:

  return v6;
}

- (id)videoDevicePresetForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "mode"))
  {
    case 0:
    case 4:
    case 9:
      v6 = (id)*MEMORY[0x1E0C8A1A0];
      goto LABEL_6;
    case 1:
    case 2:
    case 7:
    case 8:
      -[CAMCaptureEngineDevice _highestQualitySessionPresetForVideoConfiguration:videoEncodingBehavior:colorSpace:](self, "_highestQualitySessionPresetForVideoConfiguration:videoEncodingBehavior:colorSpace:", objc_msgSend(v4, "videoConfiguration"), objc_msgSend(v4, "videoEncodingBehavior"), objc_msgSend(v4, "colorSpace"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
      -[CAMCaptureEngineDevice _timelapseSessionPreset](self, "_timelapseSessionPreset");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 6:
      -[CAMCaptureEngineDevice _portraitModeSessionPreset](self, "_portraitModeSessionPreset");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = v6;
      break;
    default:
      break;
  }

  return v5;
}

- (AVCaptureSystemZoomSlider)systemZoomSlider
{
  return self->_systemZoomSlider;
}

- (AVCaptureSystemLensSelector)systemLensSelector
{
  return self->_systemLensSelector;
}

- (AVCaptureSystemExposureBiasSlider)systemExposureSlider
{
  return self->_systemExposureSlider;
}

- (CAMCaptureEngineDeviceSystemAction)systemDeviceActionDelegate
{
  return (CAMCaptureEngineDeviceSystemAction *)objc_loadWeakRetained((id *)&self->_systemDeviceActionDelegate);
}

- (void)setSystemDeviceActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemDeviceActionDelegate, a3);
}

- (CAMCaptureEngine)_captureEngine
{
  return (CAMCaptureEngine *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (CAMMemoizationCache)_videoDeviceFormatForVideoConfiguration
{
  return self->__videoDeviceFormatForVideoConfiguration;
}

- (CAMMemoizationCache)_videoSessionPresetForVideoConfiguration
{
  return self->__videoSessionPresetForVideoConfiguration;
}

- (AVCaptureDeviceFormat)_cachedPanoramaDeviceFormat
{
  return self->__cachedPanoramaDeviceFormat;
}

- (AVCaptureDeviceFormat)_cachedPortraitDeviceFormat
{
  return self->__cachedPortraitDeviceFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedPortraitDeviceFormat, 0);
  objc_storeStrong((id *)&self->__cachedPanoramaDeviceFormat, 0);
  objc_storeStrong((id *)&self->__videoSessionPresetForVideoConfiguration, 0);
  objc_storeStrong((id *)&self->__videoDeviceFormatForVideoConfiguration, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
  objc_destroyWeak((id *)&self->_systemDeviceActionDelegate);
  objc_storeStrong((id *)&self->_systemExposureSlider, 0);
  objc_storeStrong((id *)&self->_systemLensSelector, 0);
  objc_storeStrong((id *)&self->_systemZoomSlider, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_captureDeviceInput, 0);
}

- (void)captureDeviceInput
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Creating an AVCaptureDeviceInput for the captureDevice (%{public}@) failed: (%{public}@)", (uint8_t *)&v3, 0x16u);
}

@end
