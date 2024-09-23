@implementation CAMAnalyticsCaptureEvent

- (CAMAnalyticsCaptureEvent)initWithGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  id v6;
  CAMAnalyticsCaptureEvent *v7;
  CAMAnalyticsCaptureEvent *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMAnalyticsCaptureEvent;
  v7 = -[CAMAnalyticsEvent init](&v10, sel_init);
  if (v7)
  {
    v7->__captureMode = objc_msgSend(v6, "mode");
    v7->__captureDevice = objc_msgSend(v6, "device");
    v7->__captureDevicePosition = objc_msgSend(v6, "devicePosition");
    v7->__captureVideoConfiguration = objc_msgSend(v6, "videoConfiguration");
    v7->__videoStabilizationStrength = objc_msgSend(v6, "videoStabilizationStrength");
    v7->__outputToExternalStorage = a4;
    v7->__colorSpace = objc_msgSend(v6, "colorSpace");
    v7->__spatialVideoEnabled = objc_msgSend(v6, "enableStereoVideoCapture");
    v8 = v7;
  }

  return v7;
}

- (CAMAnalyticsCaptureEvent)initWithEvent:(id)a3
{
  id v4;
  CAMAnalyticsCaptureEvent *v5;
  CAMAnalyticsCaptureEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMAnalyticsCaptureEvent;
  v5 = -[CAMAnalyticsEvent initWithEvent:](&v8, sel_initWithEvent_, v4);
  if (v5)
  {
    v5->__captureMode = objc_msgSend(v4, "_captureMode");
    v5->__captureDevice = objc_msgSend(v4, "_captureDevice");
    v5->__captureDevicePosition = objc_msgSend(v4, "_captureDevicePosition");
    v5->__captureVideoConfiguration = objc_msgSend(v4, "_captureVideoConfiguration");
    v5->__mediaType = objc_msgSend(v4, "_mediaType");
    v5->__isStillDuringVideo = objc_msgSend(v4, "_isStillDuringVideo");
    v5->__outputToExternalStorage = objc_msgSend(v4, "_outputToExternalStorage");
    v5->__colorSpace = objc_msgSend(v4, "_colorSpace");
    v6 = v5;
  }

  return v5;
}

- (id)eventName
{
  return CFSTR("capture");
}

- (void)_populateFromCaptureRequest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  int64_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v4 = objc_msgSend(v42, "type");
  if (v4 == 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = v4;
    if (v4 != 1)
    {
      if (v4)
        goto LABEL_8;
      v6 = objc_msgSend(v42, "ctmCaptureType");
      if (v6 >= 3)
        goto LABEL_8;
      v5 = qword_1DB9A7EE8[v6];
    }
  }
  -[CAMAnalyticsCaptureEvent set_mediaType:](self, "set_mediaType:", v5);
LABEL_8:
  v7 = objc_msgSend(v42, "captureMode", v5);
  if (v7 > 9)
    v8 = 0;
  else
    v8 = off_1EA32F750[v7];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("captureMode"));

  v10 = objc_msgSend(v42, "captureDevice");
  if (v10 > 0xB)
    v11 = 0;
  else
    v11 = off_1EA32F908[v10];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("device"));

  v13 = objc_msgSend(v42, "captureDevicePosition");
  v14 = CFSTR("Front");
  if (v13 != 1)
    v14 = 0;
  if (!v13)
    v14 = CFSTR("Back");
  v15 = v14;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("devicePosition"));

  v17 = objc_msgSend(v42, "captureOrientation");
  v18 = 0;
  if (v17 <= 4)
    v18 = off_1EA32F968[v17];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("orientation"));

  v20 = objc_msgSend(v42, "origin");
  if (v20 > 3)
    v21 = 0;
  else
    v21 = off_1EA32F990[v20];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("origin"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hostProcess");
  if (v24 > 5)
    v25 = 0;
  else
    v25 = off_1EA32F9B0[v24];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("hostProcess"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("bundleID"));

  v30 = objc_msgSend(v42, "pressType");
  if (v30 > 103)
  {
    if (v30 == 104)
    {
      v31 = CFSTR("Lock");
      goto LABEL_36;
    }
    if (v30 == 601)
    {
      v31 = CFSTR("CameraCaseShutter");
      goto LABEL_36;
    }
  }
  else
  {
    if (v30 == 102)
    {
      v31 = CFSTR("Secondary");
      goto LABEL_36;
    }
    if (v30 == 103)
    {
      v31 = CFSTR("Primary");
      goto LABEL_36;
    }
  }
  v31 = CFSTR("Other");
LABEL_36:
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("pressType"));

  v33 = -[CAMAnalyticsCaptureEvent _mediaType](self, "_mediaType");
  v34 = CFSTR("Video");
  if (v33 != 1)
    v34 = 0;
  if (!v33)
    v34 = CFSTR("Photo");
  v35 = v34;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("captureType"));

  v37 = 0;
  v38 = objc_msgSend(v42, "audioConfiguration") - 1;
  if (v38 <= 2)
    v37 = off_1EA32F7A0[v38];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, CFSTR("audioConfiguration"));

  if (objc_msgSend(v42, "captureDevicePosition") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v42, "isCaptureMirrored"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("isCaptureMirrored"));

  }
}

- (void)populateFromStillImageCaptureRequest:(id)a3 burst:(BOOL)a4 preferences:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  unint64_t v49;
  __CFString *v50;
  void *v51;
  void *v52;
  int v53;
  unint64_t v54;
  __CFString *v55;
  void *v56;
  unint64_t v57;
  __CFString *v58;
  void *v59;
  id v60;

  v60 = a3;
  v7 = a5;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsCaptureEvent _populateFromCaptureRequest:](self, "_populateFromCaptureRequest:", v60);
  -[CAMAnalyticsCaptureEvent set_isStillDuringVideo:](self, "set_isStillDuringVideo:", objc_msgSend(v60, "stillDuringVideo"));
  v9 = objc_msgSend(v60, "captureMode");
  if (!-[CAMAnalyticsCaptureEvent _mediaType](self, "_mediaType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("isStillDuringVideo"));

    if (!-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
    {
      if (objc_msgSend(v8, "isLivePhotoSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition")))
      {
        v12 = objc_msgSend(v60, "irisMode");
        if (v12 > 2)
          v13 = 0;
        else
          v13 = off_1EA32FAD0[v12];
        -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("resolvedLivePhotoMode"));

      }
      if (objc_msgSend(v8, "isHDRSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition")))
      {
        v15 = objc_msgSend(v60, "hdrMode");
        if (v15 > 2)
          v16 = 0;
        else
          v16 = off_1EA32FAD0[v15];
        -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("resolvedHDRMode"));

      }
      if (objc_msgSend(v8, "isLowLightSupportedForMode:device:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevice")))
      {
        v18 = objc_msgSend(v60, "lowLightMode");
        if (v18 > 2)
          v19 = 0;
        else
          v19 = off_1EA32FA98[v18];
        -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("resolvedLowLightMode"));

      }
      if (objc_msgSend(v8, "isLightingControlSupportedForMode:", objc_msgSend(v60, "captureMode")))
      {
        -[CAMAnalyticsCaptureEvent set_lightingEffectType:](self, "set_lightingEffectType:", objc_msgSend(v60, "lightingEffectType"));
        v21 = objc_msgSend(v60, "lightingEffectType");
        if (v21 > 6)
          v22 = 0;
        else
          v22 = off_1EA32F7B8[v21];
        -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("lightingType"));

      }
      if (objc_msgSend(v8, "semanticStylesSupport"))
      {
        objc_msgSend(v60, "semanticStyle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v60, "semanticStyle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "analyticsDictionaryForCapture");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addEntriesFromDictionary:", v26);

        }
      }
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isLinearDNGSupported");

      v30 = objc_msgSend(v7, "rawControlEnabled");
      if (v29 && v30)
      {
        if (objc_msgSend(v60, "photoEncodingBehavior") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("linearDNG"));

          v33 = (void *)MEMORY[0x1E0CB37E8];
          v34 = objc_msgSend(v60, "maximumPhotoResolution") - 1;
          if (v34 > 2)
            v35 = 0;
          else
            v35 = qword_1DB9A7F00[v34];
          objc_msgSend(v33, "numberWithInteger:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          v39 = CFSTR("linearDNGResolution");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          v39 = CFSTR("linearDNG");
        }
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v39);

      }
      objc_msgSend(v8, "supportedPhotoResolutionsForMode:devicePosition:photoEncoding:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"), objc_msgSend(v60, "photoEncodingBehavior"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41 >= 2)
      {
        v42 = (void *)MEMORY[0x1E0CB37E8];
        v43 = objc_msgSend(v60, "maximumPhotoResolution") - 1;
        if (v43 > 2)
          v44 = 0;
        else
          v44 = qword_1DB9A7F00[v43];
        objc_msgSend(v42, "numberWithInteger:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("desiredMaximumResolution"));

      }
    }
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isFlashSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"));

  if (v48 && !-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
  {
    v49 = objc_msgSend(v60, "flashMode");
    if (v49 > 2)
      v50 = 0;
    else
      v50 = off_1EA32FAD0[v49];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("resolvedFlashMode"));

  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isAspectRatioCropSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"));

  if (v53)
  {
    v54 = objc_msgSend(v60, "aspectRatioCrop");
    if (v54 > 3)
      v55 = 0;
    else
      v55 = off_1EA32F7F0[v54];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("aspectRatio"));

  }
  if (v9 <= 7 && (((0xC0u >> v9) | (0x11u >> v9)) & 1) != 0)
  {
    v57 = objc_msgSend(v60, "effectFilterType");
    if (v57 > 0x10)
      v58 = 0;
    else
      v58 = off_1EA32F810[v57];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("filterType"));

  }
}

- (void)populateFromVideoCaptureRequest:(id)a3 preferences:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  int v15;
  int v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  unint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v36 = a3;
  v6 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsCaptureEvent _populateFromCaptureRequest:](self, "_populateFromCaptureRequest:", v36);
  if (objc_msgSend(v7, "isFlashOrTorchSupportedForMode:devicePosition:", objc_msgSend(v36, "captureMode"), objc_msgSend(v36, "captureDevicePosition")))
  {
    v8 = objc_msgSend(v36, "torchMode");
    if (v8 > 2)
      v9 = 0;
    else
      v9 = off_1EA32FAD0[v8];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("resolvedTorchMode"));

  }
  v11 = objc_msgSend(v6, "prefersHDR10BitVideoForCapabilities:", v7);
  LOBYTE(v35) = v11;
  v12 = objc_msgSend(v7, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", objc_msgSend(v36, "captureMode"), objc_msgSend(v36, "captureDevice"), objc_msgSend(v36, "videoEncodingBehavior"), objc_msgSend(v36, "captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _outputToExternalStorage](self, "_outputToExternalStorage"), -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"), v35);
  switch(v12)
  {
    case 0:
      v13 = CFSTR("Auto");
      break;
    case 1:
      v13 = CFSTR("1080p60");
      break;
    case 2:
      v13 = CFSTR("720p120");
      break;
    case 3:
      v13 = CFSTR("720p240");
      break;
    case 4:
      v13 = CFSTR("1080p120");
      break;
    case 5:
      v13 = CFSTR("4k30");
      break;
    case 6:
      v13 = CFSTR("720p30");
      break;
    case 7:
      v13 = CFSTR("1080p30");
      break;
    case 8:
      v13 = CFSTR("1080p240");
      break;
    case 9:
      v13 = CFSTR("4k60");
      break;
    case 10:
      v13 = CFSTR("4k24");
      break;
    case 11:
      v13 = CFSTR("1080p25");
      break;
    case 12:
      v13 = CFSTR("4k25");
      break;
    case 13:
      v13 = CFSTR("4k120");
      break;
    case 14:
      v13 = CFSTR("4k100");
      break;
    default:
      switch(v12)
      {
        case 10000:
          v13 = CFSTR("ImagePickerHigh");
          break;
        case 10001:
          v13 = CFSTR("ImagePickerMedium");
          break;
        case 10002:
          v13 = CFSTR("ImagePickerLow");
          break;
        case 10003:
          v13 = CFSTR("ImagePickerVGA");
          break;
        case 10004:
          v13 = CFSTR("ImagePickeriFrame720p");
          break;
        case 10005:
          v13 = CFSTR("ImagePickeriFrame540p");
          break;
        default:
          v13 = 0;
          break;
      }
      break;
  }
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("videoConfiguration"));

  v15 = objc_msgSend(v7, "isProResVideoSupported");
  v16 = objc_msgSend(v6, "isProResControlEnabled");
  if (v15 && v16)
  {
    v17 = objc_msgSend(v36, "videoEncodingBehavior") == 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("proRes"));

  }
  v20 = objc_msgSend(v36, "captureMode");
  if (v20 == 2)
  {
    v22 = objc_msgSend(v6, "slomoConfiguration");
    switch(v22)
    {
      case 0:
LABEL_37:
        v23 = CFSTR("Auto");
        break;
      case 1:
LABEL_41:
        v23 = CFSTR("1080p60");
        break;
      case 2:
LABEL_42:
        v23 = CFSTR("720p120");
        break;
      case 3:
LABEL_43:
        v23 = CFSTR("720p240");
        break;
      case 4:
LABEL_44:
        v23 = CFSTR("1080p120");
        break;
      case 5:
LABEL_45:
        v23 = CFSTR("4k30");
        break;
      case 6:
LABEL_46:
        v23 = CFSTR("720p30");
        break;
      case 7:
LABEL_47:
        v23 = CFSTR("1080p30");
        break;
      case 8:
LABEL_60:
        v23 = CFSTR("1080p240");
        break;
      case 9:
LABEL_48:
        v23 = CFSTR("4k60");
        break;
      case 10:
LABEL_49:
        v23 = CFSTR("4k24");
        break;
      case 11:
LABEL_50:
        v23 = CFSTR("1080p25");
        break;
      case 12:
LABEL_51:
        v23 = CFSTR("4k25");
        break;
      case 13:
LABEL_52:
        v23 = CFSTR("4k120");
        break;
      case 14:
LABEL_53:
        v23 = CFSTR("4k100");
        break;
      default:
        switch(v22)
        {
          case 10000:
LABEL_40:
            v23 = CFSTR("ImagePickerHigh");
            break;
          case 10001:
LABEL_55:
            v23 = CFSTR("ImagePickerMedium");
            break;
          case 10002:
LABEL_56:
            v23 = CFSTR("ImagePickerLow");
            break;
          case 10003:
LABEL_57:
            v23 = CFSTR("ImagePickerVGA");
            break;
          case 10004:
LABEL_58:
            v23 = CFSTR("ImagePickeriFrame720p");
            break;
          case 10005:
LABEL_59:
            v23 = CFSTR("ImagePickeriFrame540p");
            break;
          default:
LABEL_54:
            v23 = 0;
            break;
        }
        break;
    }
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("preferredVideoConfiguration"));

  }
  else if (v20 == 1)
  {
    v21 = objc_msgSend(v6, "videoConfiguration");
    switch(v21)
    {
      case 0:
        goto LABEL_37;
      case 1:
        goto LABEL_41;
      case 2:
        goto LABEL_42;
      case 3:
        goto LABEL_43;
      case 4:
        goto LABEL_44;
      case 5:
        goto LABEL_45;
      case 6:
        goto LABEL_46;
      case 7:
        goto LABEL_47;
      case 8:
        goto LABEL_60;
      case 9:
        goto LABEL_48;
      case 10:
        goto LABEL_49;
      case 11:
        goto LABEL_50;
      case 12:
        goto LABEL_51;
      case 13:
        goto LABEL_52;
      case 14:
        goto LABEL_53;
      default:
        switch(v21)
        {
          case 10000:
            goto LABEL_40;
          case 10001:
            goto LABEL_55;
          case 10002:
            goto LABEL_56;
          case 10003:
            goto LABEL_57;
          case 10004:
            goto LABEL_58;
          case 10005:
            goto LABEL_59;
          default:
            goto LABEL_54;
        }
    }
  }
  if (objc_msgSend(v7, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", objc_msgSend(v36, "captureMode"), objc_msgSend(v36, "captureDevice"), objc_msgSend(v36, "captureVideoConfiguration"), objc_msgSend(v36, "videoEncodingBehavior"), objc_msgSend(v36, "trueVideoEnabled"), v11))
  {
    v25 = -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength");
    if (v25 > 3)
      v26 = 0;
    else
      v26 = off_1EA32F898[v25];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("videoStabilizationStrength"));

  }
  if (objc_msgSend(v7, "isExternalStorageOutputSupportedForMode:videoEncodingBehavior:", objc_msgSend(v36, "captureMode"), objc_msgSend(v36, "videoEncodingBehavior")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMAnalyticsCaptureEvent _outputToExternalStorage](self, "_outputToExternalStorage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("externalStorage"));

  }
  v30 = -[CAMAnalyticsCaptureEvent _colorSpace](self, "_colorSpace");
  if (v30 > 3)
    v31 = 0;
  else
    v31 = off_1EA32F8B8[v30];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("colorSpace"));

  if (objc_msgSend(v7, "isSpatialVideoInVideoModeSupportedForMode:devicePosition:", objc_msgSend(v36, "captureMode"), objc_msgSend(v36, "captureDevicePosition")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("spatialVideoEnabled"));

  }
}

- (void)populateFromPanoramaCaptureRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[CAMAnalyticsCaptureEvent _populateFromCaptureRequest:](self, "_populateFromCaptureRequest:", a3);
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("slowDownPanoramaInstruction"));

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("moveUpPanoramaInstruction"));

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("moveDownPanoramaInstruction"));

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Shutter"), CFSTR("panoramaStopReason"));

}

- (void)populatePanoramaDirection:(int64_t)a3
{
  __CFString *v3;
  id v4;

  if ((unint64_t)a3 > 2)
    v3 = 0;
  else
    v3 = off_1EA32F8D8[a3];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("panoramaCaptureDirection"));

}

- (void)populatePanoramaInstruction:(int64_t)a3
{
  __CFString *v3;
  id v4;

  if ((unint64_t)(a3 - 3) <= 2)
  {
    v3 = off_1EA32F8F0[a3 - 3];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);

  }
}

- (void)populateFromPanoramaCaptureNotification:(int64_t)a3
{
  __CFString *v3;
  __CFString *v5;
  id v6;

  v3 = CFSTR("ReachedMaximumSize");
  if (a3 != -6000)
    v3 = 0;
  if (a3 == -6001)
    v3 = CFSTR("ChangedDirection");
  if (v3)
  {
    v5 = v3;
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("panoramaStopReason"));

  }
}

- (void)populateForTimelapseCaptureOrientation:(int64_t)a3 captureMirrored:(BOOL)a4 origin:(int64_t)a5 pressType:(int64_t)a6 startDate:(id)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  int64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v9 = a4;
  v12 = a7;
  -[CAMAnalyticsCaptureEvent set_mediaType:](self, "set_mediaType:", 1);
  -[CAMAnalyticsCaptureEvent set_isStillDuringVideo:](self, "set_isStillDuringVideo:", 0);
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Timelapse"), CFSTR("captureMode"));

  v14 = -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice");
  if (v14 > 0xB)
    v15 = 0;
  else
    v15 = off_1EA32F908[v14];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("device"));

  v17 = -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition");
  v18 = CFSTR("Front");
  if (v17 != 1)
    v18 = 0;
  if (!v17)
    v18 = CFSTR("Back");
  v19 = v18;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("devicePosition"));

  v21 = 0;
  if ((unint64_t)a3 <= 4)
    v21 = off_1EA32F968[a3];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("orientation"));

  if ((unint64_t)a5 > 3)
    v23 = 0;
  else
    v23 = off_1EA32F990[a5];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("origin"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hostProcess");
  if (v26 > 5)
    v27 = 0;
  else
    v27 = off_1EA32F9B0[v26];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("hostProcess"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bundleIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("bundleID"));

  if (a6 > 103)
  {
    if (a6 != 104)
    {
      if (a6 == 601)
      {
        v32 = CFSTR("CameraCaseShutter");
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    v32 = CFSTR("Lock");
  }
  else
  {
    if (a6 != 102)
    {
      if (a6 == 103)
      {
        v32 = CFSTR("Primary");
        goto LABEL_26;
      }
LABEL_23:
      v32 = CFSTR("Other");
      goto LABEL_26;
    }
    v32 = CFSTR("Secondary");
  }
LABEL_26:
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("pressType"));

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("Video"), CFSTR("captureType"));

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "components:fromDate:", 32, v12);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v41, "hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("userLocalTimeHour"));

  if (-[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("isCaptureMirrored"));

  }
}

- (void)populateFromStillImageCaptureResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "captureDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("userLocalTimeHour"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "isSemanticDevelopmentSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  v11 = objc_msgSend(v15, "semanticEnhanceScene");
  if ((_DWORD)v9 && v11 && !-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
  {
    v12 = objc_msgSend(v15, "semanticEnhanceScene") + 1;
    if (v12 > 4)
      v13 = 0;
    else
      v13 = off_1EA32F9E0[v12];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("semanticEnhanceScene"));

  }
}

- (void)populateFromVideoCaptureResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  CMTime time;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(&time, 0, sizeof(time));
  -[CAMAnalyticsCaptureEvent populateDuration:](self, "populateDuration:", CMTimeGetSeconds(&time));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 32, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("userLocalTimeHour"));

  v12 = objc_msgSend(v5, "reason") - 1;
  if (v12 <= 4)
  {
    v13 = off_1EA32FA08[v12];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("videoCaptureError"));

  }
}

- (void)populateAEAFLocked:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("aeafLock"));

}

- (void)populateZoomFromDisplayZoomValue:(double)a3 zoomPoints:(id)a4 zoomInteractionType:(int64_t)a5
{
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;

  v18 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  if ((v9 & 1) != 0 || v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("zoomFactor"));

    -[CAMAnalyticsCaptureEvent _zoomRangeStringForDisplayZoomValue:zoomPoints:mode:device:](self, "_zoomRangeStringForDisplayZoomValue:zoomPoints:mode:device:", v18, -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("zoomFactorRange"));

    if ((unint64_t)a5 > 5)
      v16 = 0;
    else
      v16 = off_1EA32FA30[a5];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("zoomInteractionType"));

  }
}

- (void)populateZoomFromZoomButtonSymbol:(int64_t)a3 zoomInteractionType:(int64_t)a4
{
  void *v7;
  char v8;
  void *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  id v15;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  if ((v8 & 1) != 0 || v10)
  {
    v11 = CFSTR("Narrow");
    if (a3 != 1)
      v11 = 0;
    if (a3)
      v12 = v11;
    else
      v12 = CFSTR("Wide");
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("frontFacingZoom"));

    v14 = 0;
    if ((unint64_t)a4 <= 5)
      v14 = off_1EA32FA30[a4];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("zoomInteractionType"));

  }
}

- (void)populateExposureSliderBias:(float)a3 exposureTapAndBias:(float)a4 totalExposureBias:(float)a5
{
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTapAndBiasSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v10)
  {
    *(float *)&v11 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("exposureTapAndBias"));

    LODWORD(v14) = -4.0;
    LODWORD(v15) = 4.0;
    LODWORD(v16) = 0;
    *(float *)&v17 = a4;
    -[CAMAnalyticsCaptureEvent _defaultRangeStringForValue:lowerBound:upperBound:defaultValue:](self, "_defaultRangeStringForValue:lowerBound:upperBound:defaultValue:", v17, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("exposureTapAndBiasRange"));

  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isExposureSliderSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v21)
  {
    *(float *)&v22 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("exposureSliderBias"));

    *(float *)&v25 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("exposureTotalBias"));

    LODWORD(v28) = -2.0;
    LODWORD(v29) = 2.0;
    LODWORD(v30) = 0;
    *(float *)&v31 = a3;
    -[CAMAnalyticsCaptureEvent _defaultRangeStringForValue:lowerBound:upperBound:defaultValue:](self, "_defaultRangeStringForValue:lowerBound:upperBound:defaultValue:", v31, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("exposureSliderBiasRange"));

    LODWORD(v34) = -4.0;
    LODWORD(v35) = 4.0;
    LODWORD(v36) = 0;
    *(float *)&v37 = a5;
    -[CAMAnalyticsCaptureEvent _defaultRangeStringForValue:lowerBound:upperBound:defaultValue:](self, "_defaultRangeStringForValue:lowerBound:upperBound:defaultValue:", v37, v34, v35, v36);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("exposureTotalBiasRange"));

  }
}

- (void)populateDesiredFlashMode:(int64_t)a3 desiredLivePhotoMode:(int64_t)a4 desiredHDRMode:(int64_t)a5 timerDuration:(int64_t)a6
{
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id v26;

  if (-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
    return;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isFlashSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isLivePhotoSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isHDRSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isTimerSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v12)
  {
    if ((unint64_t)a3 > 2)
      v20 = 0;
    else
      v20 = off_1EA32FAD0[a3];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("desiredFlashMode"));

    if (!v14)
    {
LABEL_4:
      if (!v16)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if (!v14)
  {
    goto LABEL_4;
  }
  if ((unint64_t)a4 > 2)
    v22 = 0;
  else
    v22 = off_1EA32FAD0[a4];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("desiredLivePhotoMode"));

  if (!v16)
  {
LABEL_5:
    if (!v18)
      return;
    goto LABEL_6;
  }
LABEL_18:
  if ((unint64_t)a5 > 2)
    v24 = 0;
  else
    v24 = off_1EA32FAD0[a5];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("desiredHDRMode"));

  if (v18)
  {
LABEL_6:
    if ((unint64_t)a6 > 3)
      v19 = 0;
    else
      v19 = off_1EA32FA60[a6];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v19, CFSTR("timerDuration"));

  }
}

- (void)populateDesiredMacroMode:(int64_t)a3 isMacroCapture:(BOOL)a4 isMacroSuggested:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;

  v5 = a5;
  v6 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"), -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"));

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSuperWideAutoMacroControlAllowed");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("isMacroCapture"));

    if (v5)
    {
      v14 = CFSTR("ButtonOff");
      if (v6)
        v14 = CFSTR("ButtonOn");
      if (v11)
        v15 = v14;
      else
        v15 = CFSTR("AutoOn");
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("macroBehavior"));

    }
  }
}

- (void)populateDesiredNightModeControlMode:(unint64_t)a3 resolvedNightModeControlMode:(unint64_t)a4 resolvedNightModeMode:(int64_t)a5 nightModeStatus:(int64_t)a6
{
  void *v11;
  int v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  id v20;

  if (!-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isLowLightSupportedForMode:device:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));

    if (v12)
    {
      if (a3 > 2)
        v13 = 0;
      else
        v13 = off_1EA32FA80[a3];
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("desiredNightModeControlMode"));

      if (a4 > 2)
        v15 = 0;
      else
        v15 = off_1EA32FA80[a4];
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("resolvedNightModeControlMode"));

      if ((unint64_t)a5 > 2)
        v17 = 0;
      else
        v17 = off_1EA32FA98[a5];
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("resolvedNightModeMode"));

      if ((unint64_t)(a6 + 1) > 3)
        v19 = 0;
      else
        v19 = off_1EA32FAB0[a6 + 1];
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("nightModeStatus"));

    }
  }
}

- (void)populateDesiredTorchMode:(int64_t)a3
{
  void *v5;
  int v6;
  __CFString *v7;
  id v8;

  if (!-[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTorchSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

    if (v6)
    {
      if ((unint64_t)a3 > 2)
        v7 = 0;
      else
        v7 = off_1EA32FAD0[a3];
      -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("desiredTorchMode"));

    }
  }
}

- (void)populatePortraitStatus:(int64_t)a3 lightingEffectIntensity:(double)a4 apertureValue:(double)a5 zoomFactor:(double)a6 isDepthSuggestionAllowed:(BOOL)a7 request:(id)a8
{
  int64_t v14;
  int64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  id v63;

  v63 = a8;
  v14 = -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode");
  v15 = v14;
  if ((unint64_t)(v14 - 6) >= 2)
  {
    if (v14 || !a7)
      goto LABEL_26;
    if ((unint64_t)a3 > 0xF)
      v17 = 0;
    else
      v17 = off_1EA32FAE8[a3];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("portraitStatus"));

  }
  else
  {
    if ((unint64_t)a3 > 0xF)
      v16 = 0;
    else
      v16 = off_1EA32FAE8[a3];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("portraitStatus"));

    if (!a7)
      goto LABEL_20;
  }
  if (!objc_msgSend(v63, "type"))
  {
    v20 = v63;
    objc_msgSend(v20, "adjustmentFilters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[CAMEffectFilterManager isDepthEffectInFilters:](CAMEffectFilterManager, "isDepthEffectInFilters:", v21);

    if (v22)
    {
      v23 = CFSTR("PortraitEnabled");
    }
    else if (objc_msgSend(v20, "wantsDepthData"))
    {
      v23 = CFSTR("DepthOnly");
    }
    else
    {
      v23 = CFSTR("None");
    }
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("portraitInPhotoMode"));

  }
LABEL_20:
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isPortraitEffectIntensitySupportedForMode:", v15))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isPortraitEffectIntensitySupportedForLightingType:", -[CAMAnalyticsCaptureEvent _lightingEffectType](self, "_lightingEffectType"));

    if (!v27)
      goto LABEL_24;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "minimumPortraitEffectIntensity");
    v30 = v29;

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "maximumPortraitEffectIntensity");
    v33 = v32;

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "defaultPortraitEffectIntensity");
    v36 = v35;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("lightingEffectIntensity"));

    *(float *)&v39 = a4;
    *(float *)&v40 = v30;
    *(float *)&v41 = v33;
    *(float *)&v42 = v36;
    -[CAMAnalyticsCaptureEvent _defaultRangeStringForValue:lowerBound:upperBound:defaultValue:](self, "_defaultRangeStringForValue:lowerBound:upperBound:defaultValue:", v39, v40, v41, v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v25, CFSTR("lightingEffectIntensityRange"));

  }
LABEL_24:
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isDepthEffectApertureSupportedForMode:devicePosition:", v15, -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  if (v45)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "minimumDepthEffectApertureForMode:device:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));
    v48 = v47;

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "maximumDepthEffectApertureForMode:device:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));
    v51 = v50;

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "defaultDepthEffectApertureForMode:device:zoomFactor:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), a6);
    v54 = v53;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, CFSTR("apertureValue"));

    *(float *)&v57 = a5;
    *(float *)&v58 = v48;
    *(float *)&v59 = v51;
    *(float *)&v60 = v54;
    -[CAMAnalyticsCaptureEvent _defaultRangeStringForValue:lowerBound:upperBound:defaultValue:](self, "_defaultRangeStringForValue:lowerBound:upperBound:defaultValue:", v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("apertureRange"));

  }
LABEL_26:

}

- (void)populateDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", vcvtpd_s64_f64(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  objc_msgSend((id)objc_opt_class(), "durationRangeStringForDuration:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("durationRange"));

}

- (void)populateBurstLength:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("burstLength"));

}

- (void)populateObjectResultsWithNumberOfFaces:(unint64_t)a3 numberOfCats:(unint64_t)a4 numberOfDogs:(unint64_t)a5
{
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend((id)objc_opt_class(), "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, (double)a3, 1.0, 10.0);
  v9 = (unint64_t)v8;
  objc_msgSend((id)objc_opt_class(), "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, (double)a4, 1.0, 10.0);
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, (double)a5, 1.0, 10.0);
  v13 = v12;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = (unint64_t)v11;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("numberOfFaces"));

  if (v9)
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = (unint64_t)v13;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("numberOfCats"));

  if (v15)
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v13);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("numberOfDogs"));

  if (v18)
}

- (void)populateSharedLibraryMode:(int64_t)a3
{
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharedLibraryEnabled");

  if (v6)
  {
    if ((unint64_t)a3 > 5)
      v7 = 0;
    else
      v7 = off_1EA32FB68[a3];
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("sharedLibraryMode"));

    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "sharedLibraryAutoBehaviorEnabled"))
      v9 = CFSTR("Auto");
    else
      v9 = CFSTR("Manual");
    -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("sharedLibrarySetting"));

  }
}

- (void)populateDeviceOrientation:(int64_t)a3 isDeviceOrientationLocked:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected:%ld"), a3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1EA32FB98[a3];
  }
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("deviceOrientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("deviceOrientationLocked"));

}

- (id)_defaultRangeStringForValue:(float)a3 lowerBound:(float)a4 upperBound:(float)a5 defaultValue:(float)a6
{
  double v6;
  double v7;

  v6 = a3;
  if (a4 + 0.01 >= v6)
    return CFSTR("Min");
  v7 = a6;
  if (v7 + -0.01 > v6)
    return CFSTR("Low");
  if (v7 + 0.01 >= v6)
    return CFSTR("Default");
  if (a5 + -0.01 <= v6)
    return CFSTR("Max");
  return CFSTR("High");
}

- (id)_zoomRangeStringForDisplayZoomValue:(double)a3 zoomPoints:(id)a4 mode:(int64_t)a5 device:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  double v23;
  double v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  __CFString *v32;
  unint64_t v33;
  uint64_t v34;
  char v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  BOOL v40;
  const __CFString *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((unint64_t)(a6 - 1) > 0xA)
    v13 = 0;
  else
    v13 = qword_1DB9A7F18[a6 - 1];
  v14 = objc_msgSend(v11, "isSuperWideSupportedForDevicePosition:", v13);
  v15 = objc_msgSend(v12, "isTelephotoSupportedForDevicePosition:", v13);
  objc_msgSend(v12, "superWideDisplayZoomFactor");
  v17 = v16;
  objc_msgSend(v12, "wideDisplayZoomFactor");
  v19 = v18;
  objc_msgSend(v12, "telephotoDisplayZoomFactor");
  v21 = v20;
  v22 = objc_msgSend(v12, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a5, v13, -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"));
  objc_msgSend(v12, "quadraWideDisplayZoomFactor");
  v24 = v23;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v30, "isCustomLens"))
        {
          objc_msgSend(v30, "displayZoomFactor");
          if (vabdd_f64(a3, v31) < 0.001)
          {
            v33 = objc_msgSend(v12, "effectiveFocalLengthForCustomLens:", objc_msgSend(v30, "customLens"));
            v34 = 0;
            if (v33 < 4)
              v34 = qword_1DB9A7F70[v33];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.fmm"), v34);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v27)
        continue;
      break;
    }
  }

  if (v19 == a3)
  {
    v32 = CFSTR("Wide");
  }
  else
  {
    if (v24 == a3)
      v36 = v22;
    else
      v36 = 0;
    if ((v36 & 1) != 0)
    {
      v32 = CFSTR("QuadraWide");
    }
    else
    {
      if (v19 <= a3)
      {
        v37 = CFSTR(">Wide");
        v38 = CFSTR("Wide-Telephoto");
        v41 = CFSTR(">Telephoto");
        if (v21 == a3)
          v41 = CFSTR("Telephoto");
        if (v21 <= a3)
          v38 = v41;
        v40 = v15 == 0;
      }
      else
      {
        v37 = CFSTR("<Wide");
        v38 = CFSTR("<UltraWide");
        v39 = CFSTR("UltraWide-Wide");
        if (v17 == a3)
          v39 = CFSTR("UltraWide");
        if (v17 <= a3)
          v38 = v39;
        v40 = v14 == 0;
      }
      if (v40)
        v32 = (__CFString *)v37;
      else
        v32 = (__CFString *)v38;
    }
  }
LABEL_18:

  return v32;
}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (int64_t)_captureDevice
{
  return self->__captureDevice;
}

- (int64_t)_captureDevicePosition
{
  return self->__captureDevicePosition;
}

- (int64_t)_captureVideoConfiguration
{
  return self->__captureVideoConfiguration;
}

- (int64_t)_lightingEffectType
{
  return self->__lightingEffectType;
}

- (void)set_lightingEffectType:(int64_t)a3
{
  self->__lightingEffectType = a3;
}

- (int64_t)_mediaType
{
  return self->__mediaType;
}

- (void)set_mediaType:(int64_t)a3
{
  self->__mediaType = a3;
}

- (BOOL)_isStillDuringVideo
{
  return self->__isStillDuringVideo;
}

- (void)set_isStillDuringVideo:(BOOL)a3
{
  self->__isStillDuringVideo = a3;
}

- (int64_t)_videoStabilizationStrength
{
  return self->__videoStabilizationStrength;
}

- (BOOL)_outputToExternalStorage
{
  return self->__outputToExternalStorage;
}

- (void)set_outputToExternalStorage:(BOOL)a3
{
  self->__outputToExternalStorage = a3;
}

- (int64_t)_colorSpace
{
  return self->__colorSpace;
}

- (BOOL)_spatialVideoEnabled
{
  return self->__spatialVideoEnabled;
}

@end
