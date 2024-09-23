@implementation CAMCaptureCommandContext

- (CAMCaptureCommandContext)initWithCaptureEngine:(id)a3
{
  id v4;
  CAMCaptureCommandContext *v5;
  CAMCaptureCommandContext *v6;
  CAMCaptureCommandContext *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMCaptureCommandContext;
  v5 = -[CAMCaptureCommandContext init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__captureEngine, v4);
    v7 = v6;
  }

  return v6;
}

- (void)setCurrentCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentCaptureSession, a3);
}

- (void)clear
{
  -[CAMCaptureCommandContext setCurrentCaptureSession:](self, "setCurrentCaptureSession:", 0);
  -[CAMCaptureCommandContext setCurrentVideoDevice:](self, "setCurrentVideoDevice:", 0);
  -[CAMCaptureCommandContext setCurrentVideoDeviceFormat:](self, "setCurrentVideoDeviceFormat:", 0);
  -[CAMCaptureCommandContext setCurrentDepthDataFormat:](self, "setCurrentDepthDataFormat:", 0);
  -[CAMCaptureCommandContext setCurrentVideoDevicePreset:](self, "setCurrentVideoDevicePreset:", 0);
  -[CAMCaptureCommandContext setCurrentVideoDeviceInput:](self, "setCurrentVideoDeviceInput:", 0);
  -[CAMCaptureCommandContext setCurrentAudioDevice:](self, "setCurrentAudioDevice:", 0);
  -[CAMCaptureCommandContext setCurrentAudioDeviceInput:](self, "setCurrentAudioDeviceInput:", 0);
  -[CAMCaptureCommandContext setCurrentStillImageOutput:](self, "setCurrentStillImageOutput:", 0);
  -[CAMCaptureCommandContext setCurrentMovieFileOutput:](self, "setCurrentMovieFileOutput:", 0);
  -[CAMCaptureCommandContext setCurrentPanoramaOutput:](self, "setCurrentPanoramaOutput:", 0);
  -[CAMCaptureCommandContext setCurrentMetadataOutput:](self, "setCurrentMetadataOutput:", 0);
  -[CAMCaptureCommandContext setCurrentEffectsPreviewOutput:](self, "setCurrentEffectsPreviewOutput:", 0);
  -[CAMCaptureCommandContext setCurrentVideoThumbnailOutput:](self, "setCurrentVideoThumbnailOutput:", 0);
  -[CAMCaptureCommandContext setSystemZoomSlider:](self, "setSystemZoomSlider:", 0);
  -[CAMCaptureCommandContext setSystemLensSelector:](self, "setSystemLensSelector:", 0);
  -[CAMCaptureCommandContext setSystemExposureBiasSlider:](self, "setSystemExposureBiasSlider:", 0);
  -[CAMCaptureCommandContext setApertureSlider:](self, "setApertureSlider:", 0);
  -[CAMCaptureCommandContext setEmulatedZoomSlider:](self, "setEmulatedZoomSlider:", 0);
  -[CAMCaptureCommandContext setCurrentVideoPreviewLayer:](self, "setCurrentVideoPreviewLayer:", 0);
}

- (void)setCurrentVideoDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoDevice, a3);
}

- (void)setCurrentVideoDeviceFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoDeviceFormat, a3);
}

- (void)setCurrentDepthDataFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentDepthDataFormat, a3);
}

- (void)setCurrentVideoDevicePreset:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoDevicePreset, a3);
}

- (void)setCurrentVideoDeviceInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoDeviceInput, a3);
}

- (void)setCurrentAudioDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentAudioDevice, a3);
}

- (void)setCurrentAudioDeviceInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentAudioDeviceInput, a3);
}

- (void)setCurrentMovieFileOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentMovieFileOutput, a3);
}

- (void)setCurrentPanoramaOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentPanoramaOutput, a3);
}

- (void)setCurrentMetadataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentMetadataOutput, a3);
}

- (void)setCurrentEffectsPreviewOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentEffectsPreviewOutput, a3);
}

- (void)setCurrentVideoThumbnailOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoThumbnailOutput, a3);
}

- (void)setCurrentVideoPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoPreviewLayer, a3);
}

- (CAMCaptureEngine)_captureEngine
{
  return (CAMCaptureEngine *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (AVCaptureSession)currentCaptureSession
{
  return self->_currentCaptureSession;
}

- (AVCaptureDeviceInput)currentVideoDeviceInput
{
  return self->_currentVideoDeviceInput;
}

- (AVCaptureDeviceInput)currentAudioDeviceInput
{
  return self->_currentAudioDeviceInput;
}

- (AVCapturePhotoOutput)currentStillImageOutput
{
  return self->_currentStillImageOutput;
}

- (AVCaptureMovieFileOutput)currentMovieFileOutput
{
  return self->_currentMovieFileOutput;
}

- (CAMPanoramaOutput)currentPanoramaOutput
{
  return self->_currentPanoramaOutput;
}

- (AVCaptureMetadataOutput)currentMetadataOutput
{
  return self->_currentMetadataOutput;
}

- (AVCaptureVideoDataOutput)currentEffectsPreviewOutput
{
  return self->_currentEffectsPreviewOutput;
}

- (AVCaptureVideoThumbnailOutput)currentVideoThumbnailOutput
{
  return self->_currentVideoThumbnailOutput;
}

- (id)primaryOutputForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 9)
  {
    v7 = 0;
  }
  else
  {
    if (((1 << a3) & 0x271) != 0)
    {
      objc_msgSend(v4, "stillImageOutput");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << a3) & 0x186) != 0)
        objc_msgSend(v4, "movieFileOutput");
      else
        objc_msgSend(v4, "panoramaVideoDataOutput");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
  }

  return v7;
}

- (void)setCurrentStillImageOutput:(id)a3
{
  objc_storeStrong((id *)&self->_currentStillImageOutput, a3);
}

- (AVCaptureDeviceFormat)currentVideoDeviceFormat
{
  return self->_currentVideoDeviceFormat;
}

- (AVCaptureDevice)currentVideoDevice
{
  return self->_currentVideoDevice;
}

- (NSString)currentVideoDevicePreset
{
  return self->_currentVideoDevicePreset;
}

- (AVCaptureVideoPreviewLayer)currentVideoPreviewLayer
{
  return self->_currentVideoPreviewLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLensSelector, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
  objc_storeStrong((id *)&self->_currentVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->_lensSelector, 0);
  objc_storeStrong((id *)&self->_emulatedZoomSlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_systemExposureBiasSlider, 0);
  objc_storeStrong((id *)&self->_systemZoomSlider, 0);
  objc_storeStrong((id *)&self->_currentVideoThumbnailOutput, 0);
  objc_storeStrong((id *)&self->_currentEffectsPreviewOutput, 0);
  objc_storeStrong((id *)&self->_currentMetadataOutput, 0);
  objc_storeStrong((id *)&self->_currentPanoramaOutput, 0);
  objc_storeStrong((id *)&self->_currentMovieFileOutput, 0);
  objc_storeStrong((id *)&self->_currentStillImageOutput, 0);
  objc_storeStrong((id *)&self->_currentAudioDeviceInput, 0);
  objc_storeStrong((id *)&self->_currentAudioDevice, 0);
  objc_storeStrong((id *)&self->_currentVideoDeviceInput, 0);
  objc_storeStrong((id *)&self->_currentVideoDevicePreset, 0);
  objc_storeStrong((id *)&self->_currentDepthDataFormat, 0);
  objc_storeStrong((id *)&self->_currentVideoDeviceFormat, 0);
  objc_storeStrong((id *)&self->_currentVideoDevice, 0);
  objc_storeStrong((id *)&self->_currentCaptureSession, 0);
}

- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerStillImageCaptureRequest:withSettings:", v7, v6);

}

- (AVCapturePhotoCaptureDelegate)currentStillImageDelegate
{
  return (AVCapturePhotoCaptureDelegate *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (AVMomentCaptureMovieRecordingDelegate)currentMomentCaptureMovieRecordingDelegate
{
  return (AVMomentCaptureMovieRecordingDelegate *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cacheMomentCaptureSettings:forIdentifier:", v7, v6);

}

- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedMomentCaptureSettingsForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCachedMomentCaptureSettingsForIdentifier:", v4);

}

- (void)registerVideoCaptureRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "movieFileOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("CAMCaptureEngineCurrentRequestKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfo:", v6);
  objc_msgSend(v7, "registerVideoCaptureRequest:", v4);

}

- (AVCaptureFileOutputRecordingDelegate)currentRecordingDelegate
{
  return (AVCaptureFileOutputRecordingDelegate *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (void)registerVideoEndZoomFactor:(double)a3
{
  id v4;

  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerVideoEndZoomFactor:", a3);

}

- (CAMPanoramaConfiguration)currentPanoramaConfiguration
{
  return +[CAMPanoramaConfiguration sharedInstance](CAMPanoramaConfiguration, "sharedInstance");
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startPanoramaCaptureWithRequest:", v4);

}

- (void)stopPanoramaCaptureInterrupted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopPanoramaCaptureInterrupted:", v3);

}

- (id)_captureEngineDeviceForMode:(int64_t)a3 desiredDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7 resolvedDevice:(int64_t *)a8
{
  _BOOL8 v9;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v9 = a7;
  v33 = *MEMORY[0x1E0C80C00];
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6, v9);
  switch(v16)
  {
    case 0uLL:
    case 2uLL:
      objc_msgSend(v14, "backCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
    case 8uLL:
      objc_msgSend(v14, "frontCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3uLL:
      objc_msgSend(v14, "backTelephotoCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4uLL:
      objc_msgSend(v14, "backDualCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5uLL:
      objc_msgSend(v14, "backSuperWideCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6uLL:
      objc_msgSend(v14, "backWideDualCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7uLL:
      objc_msgSend(v14, "backTripleCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9uLL:
      objc_msgSend(v14, "frontPearlCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 0xAuLL:
      objc_msgSend(v14, "frontSuperWideCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 0xBuLL:
      objc_msgSend(v14, "systemPreferredCameraDevice");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v18 = (void *)v17;
      if (v17)
      {
        v19 = v16;
        if (!a8)
          goto LABEL_15;
        goto LABEL_14;
      }
      if (v16 - 8 < 4 || v16 == 1)
      {
        objc_msgSend(v14, "frontCameraDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("FrontAuto");
        v19 = 1;
      }
      else
      {
LABEL_22:
        objc_msgSend(v14, "backCameraDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("BackWide");
        v19 = 2;
      }
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (v16 > 0xB)
          v24 = 0;
        else
          v24 = off_1EA32B3B0[v16];
        if ((unint64_t)a3 > 9)
          v25 = 0;
        else
          v25 = off_1EA32B410[a3];
        v26 = v22;
        v27 = 138543874;
        v28 = v24;
        v29 = 2114;
        v30 = v25;
        v31 = 2114;
        v32 = v26;
        _os_log_error_impl(&dword_1DB760000, v23, OS_LOG_TYPE_ERROR, "Failed to find device %{public}@ for mode %{public}@. Falling back to %{public}@", (uint8_t *)&v27, 0x20u);

      }
      if (a8)
LABEL_14:
        *a8 = v19;
LABEL_15:

      return v18;
    default:
      goto LABEL_22;
  }
}

- (id)audioDeviceInput
{
  void *v2;
  void *v3;

  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioCaptureDeviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outputsForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoThumbnailOutputConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(objc_msgSend(v4, "mode"))
  {
    case 0:
    case 4:
    case 6:
    case 9:
      objc_msgSend(v5, "stillImageOutput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      if (objc_msgSend(v6, "isLiveFilteringSupported"))
      {
        if (v7)
          objc_msgSend(v5, "videoThumbnailOutput");
        else
          objc_msgSend(v5, "effectsPreviewVideoDataOutput");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      break;
    case 1:
    case 2:
      objc_msgSend(v5, "movieFileOutput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isStillDuringVideoSupportedForVideoEncodingBehavior:", objc_msgSend(v4, "videoEncodingBehavior"));

      if (v13)
        goto LABEL_7;
      break;
    case 3:
      objc_msgSend(v5, "panoramaVideoDataOutput");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
LABEL_7:
      objc_msgSend(v5, "stillImageOutput");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
    case 8:
      objc_msgSend(v5, "movieFileOutput");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v14 = (void *)v10;
      objc_msgSend(v8, "addObject:", v10);

      break;
    default:
      break;
  }
  -[CAMCaptureCommandContext _metadataOutputForMode:](self, "_metadataOutputForMode:", objc_msgSend(v4, "mode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "addObject:", v15);

  return v8;
}

- (id)controlsForGraphConfiguration:(id)a3 recording:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CAMCaptureCommandContext *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v73;
  void *v74;
  id v75;
  unsigned int v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  CAMCaptureCommandContext *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v4 = a4;
  v102 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CAMCaptureCommandContext currentCaptureSession](self, "currentCaptureSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "areControlsSupported"))
  {
    v8 = objc_msgSend(v6, "mode");
    v9 = objc_msgSend(v6, "device");
    v84 = objc_msgSend(v6, "devicePosition");
    -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "videoConfiguration");
    v12 = objc_msgSend(v6, "videoStabilizationStrength");
    -[CAMCaptureCommandContext _captureEngineDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:](self, "_captureEngineDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v8, v9, v11, v12, objc_msgSend(v6, "enableStereoVideoCapture"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v45 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[CAMCaptureCommandContext controlsForGraphConfiguration:recording:].cold.1(v45);
      v44 = (void *)MEMORY[0x1E0C9AA60];
      v46 = 0;
      goto LABEL_46;
    }
    v81 = self;
    v82 = v7;
    objc_msgSend(v10, "ensureControlsForGraphConfiguration:", v6);
    v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "systemZoomSlider");
    v87 = objc_claimAutoreleasedReturnValue();
    v80 = v13;
    objc_msgSend(v13, "systemLensSelector");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    v97 = 0;
    v14 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", v8, v9, v11, v12, &v97, &v96);
    v15 = v97;
    v16 = v96;
    v83 = v8;
    v77 = v16;
    v78 = v15;
    if (v14)
    {
      v17 = v16;
      v76 = v4;
      v74 = v10;
      v75 = v6;
      objc_msgSend(v6, "customLensGroup");
      v73 = objc_claimAutoreleasedReturnValue();
      +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v93 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v25, "displayZoomFactor");
            objc_msgSend(v26, "numberWithDouble:");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v25, "zoomFactor");
            objc_msgSend(v28, "numberWithDouble:");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v29);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
        }
        while (v22);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject setDisplayValuesByZoomFactorValue:](v87, "setDisplayValuesByZoomFactorValue:", v19);
      v30 = v86;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v20 = v20;
        v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v89 != v34)
                objc_enumerationMutation(v20);
              v36 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              if (!objc_msgSend(v36, "customLens"))
              {
                objc_msgSend(v20, "lastObject");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v36 != v37)
                {
                  v38 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v36, "displayZoomFactor");
                  objc_msgSend(v38, "numberWithDouble:");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v36, "zoomFactor");
                  objc_msgSend(v40, "numberWithDouble:");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v39, v41);

                }
              }
            }
            v33 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
          }
          while (v33);
        }

        v30 = v86;
        objc_msgSend(v86, "setDisplayValuesByZoomFactorValue:", v31);

      }
      v10 = v74;
      v6 = v75;
      v42 = v81;
      v43 = (void *)v73;
    }
    else
    {
      v47 = v85;
      v48 = objc_msgSend(v85, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", v8, v9, v11, v12);
      v42 = v81;
      v30 = v86;
      if (!v48)
        goto LABEL_33;
      v76 = v4;
      objc_msgSend(v85, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", v83, v9, v11, v12);
      v50 = v49;
      v98[0] = &unk_1EA3B0748;
      v99[0] = &unk_1EA3B0748;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v98[1] = v43;
      v30 = v86;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v99[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setDisplayValuesByZoomFactorValue:](v87, "setDisplayValuesByZoomFactorValue:", v19);
    }

    v47 = v85;
    v4 = v76;
LABEL_33:
    v46 = v80;
    objc_msgSend(v80, "systemExposureSlider");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v79;
    objc_msgSend(v79, "addObject:", v51);

    objc_msgSend(v10, "apertureSlider");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v10, "apertureSlider");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addObject:", v53);

    }
    v54 = v87;
    objc_msgSend(v79, "addObject:", v87);
    if (v30)
      objc_msgSend(v79, "addObject:", v30);
    v55 = v83;
    if (!objc_msgSend(v47, "smartStylesSupported"))
      goto LABEL_45;
    v56 = objc_msgSend(v47, "semanticStyleSupportForMode:devicePosition:", v83, v84);
    if ((v56 & 8) != 0)
    {
      if (objc_msgSend(v47, "smartStylesShowExtraControls"))
      {
        objc_msgSend(v10, "colorBiasSlider");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v58);

        objc_msgSend(v10, "intensitySlider");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v59);

      }
    }
    else if ((v56 & 1) != 0)
    {
      objc_msgSend(v10, "systemStylePicker");
      v57 = objc_claimAutoreleasedReturnValue();
LABEL_44:
      v60 = (void *)v57;
      objc_msgSend(v79, "addObject:", v57);

      objc_msgSend(v10, "toneBiasSlider");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addObject:", v61);

      v55 = v83;
      v54 = v87;
LABEL_45:
      -[NSObject setEnabled:](v54, "setEnabled:", -[CAMCaptureCommandContext _shouldEnableSystemZoomSliderForMode:devicePosition:](v42, "_shouldEnableSystemZoomSliderForMode:devicePosition:", v55, v84));
      objc_msgSend(v86, "setEnabled:", -[CAMCaptureCommandContext _shouldEnableLensSelectorForMode:devicePosition:recording:](v42, "_shouldEnableLensSelectorForMode:devicePosition:recording:", v55, v84, v4));
      v62 = -[CAMCaptureCommandContext _shouldEnableSystemExposureForRecording:mode:](v42, "_shouldEnableSystemExposureForRecording:mode:", v4, v55);
      objc_msgSend(v80, "systemExposureSlider");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setEnabled:", v62);

      v64 = -[CAMCaptureCommandContext _shouldEnableApertureSliderForMode:devicePosition:recording:](v42, "_shouldEnableApertureSliderForMode:devicePosition:recording:", v55, v84, v4);
      objc_msgSend(v10, "apertureSlider");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setEnabled:", v64);

      v66 = -[CAMCaptureCommandContext _shouldEnableSystemStylePickerForMode:recording:](v42, "_shouldEnableSystemStylePickerForMode:recording:", v55, v4);
      objc_msgSend(v10, "systemStylePicker");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setEnabled:", v66);

      v68 = -[CAMCaptureCommandContext _shouldEnableCreativeStylePickerForMode:recording:](v42, "_shouldEnableCreativeStylePickerForMode:recording:", v55, v4);
      objc_msgSend(v10, "creativeStylePicker");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setEnabled:", v68);

      v70 = -[CAMCaptureCommandContext _shouldEnableToneBiasForMode:recording:](v42, "_shouldEnableToneBiasForMode:recording:", v55, v4);
      objc_msgSend(v10, "toneBiasSlider");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v87;
      objc_msgSend(v71, "setEnabled:", v70);

      v7 = v82;
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend(v10, "creativeStylePicker");
    v57 = objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v44 = (void *)MEMORY[0x1E0C9AA60];
LABEL_47:

  return v44;
}

- (void)updateControlEnablementForRecording:(BOOL)a3 mode:(int64_t)a4 devicePosition:(int64_t)a5
{
  _BOOL8 v7;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;

  v7 = a3;
  -[CAMCaptureCommandContext currentCaptureSession](self, "currentCaptureSession");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "areControlsSupported"))
  {
    -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CAMCaptureCommandContext _shouldEnableApertureSliderForMode:devicePosition:recording:](self, "_shouldEnableApertureSliderForMode:devicePosition:recording:", a4, a5, v7);
    objc_msgSend(v9, "apertureSlider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", v10);

    v12 = -[CAMCaptureCommandContext _shouldEnableSystemExposureForRecording:mode:](self, "_shouldEnableSystemExposureForRecording:mode:", v7, a4);
    -[CAMCaptureCommandContext systemExposureBiasSlider](self, "systemExposureBiasSlider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", v12);

    v14 = -[CAMCaptureCommandContext _shouldEnableLensSelectorForMode:devicePosition:recording:](self, "_shouldEnableLensSelectorForMode:devicePosition:recording:", a4, a5, v7);
    -[CAMCaptureCommandContext systemLensSelector](self, "systemLensSelector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", v14);

    v16 = -[CAMCaptureCommandContext _shouldEnableSystemStylePickerForMode:recording:](self, "_shouldEnableSystemStylePickerForMode:recording:", a4, v7);
    objc_msgSend(v9, "systemStylePicker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", v16);

    v18 = -[CAMCaptureCommandContext _shouldEnableCreativeStylePickerForMode:recording:](self, "_shouldEnableCreativeStylePickerForMode:recording:", a4, v7);
    objc_msgSend(v9, "creativeStylePicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", v18);

    v20 = -[CAMCaptureCommandContext _shouldEnableToneBiasForMode:recording:](self, "_shouldEnableToneBiasForMode:recording:", a4, v7);
    objc_msgSend(v9, "toneBiasSlider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEnabled:", v20);

  }
}

- (void)updateControlEnablementForFilters:(id)a3 captureMode:(int64_t)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v16 = a3;
  -[CAMCaptureCommandContext currentCaptureSession](self, "currentCaptureSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "areControlsSupported"))
  {
    -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CAMEffectFilterManager isLightingEffectInFilters:](CAMEffectFilterManager, "isLightingEffectInFilters:", v16);
    if (v8)
    {
      objc_msgSend(v7, "systemStylePicker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", 0);

      v10 = 0;
    }
    else
    {
      v11 = -[CAMCaptureCommandContext _shouldEnableSystemStylePickerForMode:recording:](self, "_shouldEnableSystemStylePickerForMode:recording:", a4, 0);
      objc_msgSend(v7, "systemStylePicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", v11);

      v10 = -[CAMCaptureCommandContext _shouldEnableCreativeStylePickerForMode:recording:](self, "_shouldEnableCreativeStylePickerForMode:recording:", a4, 0);
    }
    objc_msgSend(v7, "creativeStylePicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", v10);

    v14 = !v8
       && -[CAMCaptureCommandContext _shouldEnableToneBiasForMode:recording:](self, "_shouldEnableToneBiasForMode:recording:", a4, 0);
    objc_msgSend(v7, "toneBiasSlider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", v14);

  }
}

- (id)_metadataOutputForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v7;
  int v8;

  -[CAMCaptureCommandContext _captureEngine](self, "_captureEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x3D7) != 0
      || a3 == 5
      && (+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isExposureClippingIndicatorSupportedForMode:videoConfiguration:", 5, 0),
          v7,
          v5 = 0,
          v8))
    {
      objc_msgSend(v4, "metadataOutput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (BOOL)_shouldEnableSystemZoomSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (a4 != 1) & (((unint64_t)a3 > 9) | (0xD3u >> a3));
}

- (BOOL)_shouldEnableSystemExposureForRecording:(BOOL)a3 mode:(int64_t)a4
{
  return a4 != 3 && !a3;
}

- (BOOL)_shouldEnableApertureSliderForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5
{
  void *v8;
  char v9;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDepthEffectApertureSupportedForMode:devicePosition:", a3, a4) & ~a5;

  return v9;
}

- (BOOL)_shouldEnableSystemStylePickerForMode:(int64_t)a3 recording:(BOOL)a4
{
  return (((unint64_t)a3 > 9) | (0x41u >> a3)) & !a4;
}

- (BOOL)_shouldEnableToneBiasForMode:(int64_t)a3 recording:(BOOL)a4
{
  return (((unint64_t)a3 > 9) | (0x41u >> a3)) & !a4;
}

- (BOOL)_shouldEnableLensSelectorForMode:(int64_t)a3 devicePosition:(int64_t)a4 recording:(BOOL)a5
{
  return (a4 != 1) & (((unint64_t)a3 > 9) | (0xD3u >> a3));
}

- (AVCaptureDeviceFormat)currentDepthDataFormat
{
  return self->_currentDepthDataFormat;
}

- (AVCaptureDevice)currentAudioDevice
{
  return self->_currentAudioDevice;
}

- (AVCaptureSystemZoomSlider)systemZoomSlider
{
  return self->_systemZoomSlider;
}

- (void)setSystemZoomSlider:(id)a3
{
  objc_storeStrong((id *)&self->_systemZoomSlider, a3);
}

- (AVCaptureSystemExposureBiasSlider)systemExposureBiasSlider
{
  return self->_systemExposureBiasSlider;
}

- (void)setSystemExposureBiasSlider:(id)a3
{
  objc_storeStrong((id *)&self->_systemExposureBiasSlider, a3);
}

- (AVCaptureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (void)setApertureSlider:(id)a3
{
  objc_storeStrong((id *)&self->_apertureSlider, a3);
}

- (AVCaptureSlider)emulatedZoomSlider
{
  return self->_emulatedZoomSlider;
}

- (void)setEmulatedZoomSlider:(id)a3
{
  objc_storeStrong((id *)&self->_emulatedZoomSlider, a3);
}

- (AVCaptureSystemLensSelector)lensSelector
{
  return self->_lensSelector;
}

- (AVCaptureSystemLensSelector)systemLensSelector
{
  return self->_systemLensSelector;
}

- (void)setSystemLensSelector:(id)a3
{
  objc_storeStrong((id *)&self->_systemLensSelector, a3);
}

- (void)controlsForGraphConfiguration:(os_log_t)log recording:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Unable to configure controls for nil CAMCaptureEngineDevice", v1, 2u);
}

@end
