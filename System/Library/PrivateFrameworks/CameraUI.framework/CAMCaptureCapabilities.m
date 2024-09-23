@implementation CAMCaptureCapabilities

+ (CAMCaptureCapabilities)capabilities
{
  if (capabilities_onceToken != -1)
    dispatch_once(&capabilities_onceToken, &__block_literal_global_36);
  return (CAMCaptureCapabilities *)(id)capabilities_sharedInstance;
}

void __38__CAMCaptureCapabilities_capabilities__block_invoke()
{
  void *v0;
  uint64_t v1;
  CAMCaptureCapabilities *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dt.xctest.tool")) & 1) != 0)
  {
    v1 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.camera.CameraMessagesApp")) & 1) != 0)
  {
    v1 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v1 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Photo-Booth")) & 1) != 0)
  {
    v1 = 3;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.camera.lockscreen")))
  {
    v1 = 4;
  }
  else
  {
    v1 = 5;
  }
  v2 = -[CAMCaptureCapabilities initWithHostProcess:]([CAMCaptureCapabilities alloc], "initWithHostProcess:", v1);
  v3 = (void *)capabilities_sharedInstance;
  capabilities_sharedInstance = (uint64_t)v2;

}

- (BOOL)isBackDualSupported
{
  return self->_backDualSupported;
}

- (BOOL)isBackPearlSupported
{
  return self->_backPearlSupported;
}

- (BOOL)isFrontDualSupported
{
  return self->_frontDualSupported;
}

- (BOOL)isFrontPearlSupported
{
  return self->_frontPearlSupported;
}

- (BOOL)hasSystemTelephonyOfAnyKind
{
  return self->_hasSystemTelephonyOfAnyKind;
}

- (BOOL)isBackCameraSupported
{
  return self->_backCameraSupported;
}

- (BOOL)isFrontFlashSupported
{
  return self->_frontFlashSupported;
}

- (BOOL)isBackFlashSupported
{
  return self->_backFlashSupported;
}

- (BOOL)isFrontAutomaticHDRSupported
{
  return self->_frontAutomaticHDRSupported;
}

- (BOOL)isBackAutomaticHDRSupported
{
  return self->_backAutomaticHDRSupported;
}

- (BOOL)arePortraitEffectsSupported
{
  return self->_portraitEffectsSupported;
}

- (BOOL)isCameraSupportedForDevice:(int64_t)a3
{
  uint64_t v5;
  _BOOL4 v6;

  if ((unint64_t)(a3 - 1) > 0xA)
    v5 = 0;
  else
    v5 = qword_1DB9A75F8[a3 - 1];
  v6 = -[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:", v5);
  if (v6)
  {
    switch(a3)
    {
      case 0:
      case 2:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackCameraSupported](self, "isBackCameraSupported");
        break;
      case 1:
      case 8:
        LOBYTE(v6) = -[CAMCaptureCapabilities isFrontCameraSupported](self, "isFrontCameraSupported");
        break;
      case 3:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackTelephotoSupported](self, "isBackTelephotoSupported");
        break;
      case 4:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackDualSupported](self, "isBackDualSupported");
        break;
      case 5:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackSuperWideSupported](self, "isBackSuperWideSupported");
        break;
      case 6:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
        break;
      case 7:
        LOBYTE(v6) = -[CAMCaptureCapabilities isBackTripleCameraSupported](self, "isBackTripleCameraSupported");
        break;
      case 9:
        LOBYTE(v6) = -[CAMCaptureCapabilities isFrontPearlSupported](self, "isFrontPearlSupported");
        break;
      case 10:
        LOBYTE(v6) = -[CAMCaptureCapabilities isFrontSuperWideSupported](self, "isFrontSuperWideSupported");
        break;
      case 11:
        LOBYTE(v6) = 1;
        break;
      default:
        LOBYTE(v6) = 0;
        break;
    }
  }
  return v6;
}

- (BOOL)isInternalInstall
{
  return self->_internalInstall;
}

- (BOOL)isFrontHDRSupported
{
  return self->_frontHDRSupported;
}

- (BOOL)isBackHDRSupported
{
  return self->_backHDRSupported;
}

- (BOOL)isModernHDRSupported
{
  return self->_modernHDRSupported;
}

- (BOOL)isFrontPortraitModeSupported
{
  return self->_frontPortraitModeSupported;
}

- (BOOL)isBackPortraitModeSupported
{
  return self->_backPortraitModeSupported;
}

- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4
{
  _BOOL4 v7;

  v7 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:", a4);
  if (v7)
  {
    switch(a3)
    {
      case 0:
        LOBYTE(v7) = 1;
        break;
      case 1:
        LOBYTE(v7) = -[CAMCaptureCapabilities isVideoSupported](self, "isVideoSupported");
        break;
      case 2:
        LOBYTE(v7) = -[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:", a4);
        break;
      case 3:
        LOBYTE(v7) = -[CAMCaptureCapabilities isPanoramaSupportedForDevice:](self, "isPanoramaSupportedForDevice:", a4);
        break;
      case 4:
        LOBYTE(v7) = -[CAMCaptureCapabilities isSquareModeSupported](self, "isSquareModeSupported");
        break;
      case 5:
        LOBYTE(v7) = -[CAMCaptureCapabilities isTimelapseSupportedForDevice:](self, "isTimelapseSupportedForDevice:", a4);
        break;
      case 6:
        LOBYTE(v7) = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", a4);
        break;
      case 7:
        LOBYTE(v7) = -[CAMCaptureCapabilities isCinematicModeSupportedForDevice:](self, "isCinematicModeSupportedForDevice:", a4);
        break;
      case 8:
        LOBYTE(v7) = -[CAMCaptureCapabilities _isSpatialVideoModeSupportedForDevice:](self, "_isSpatialVideoModeSupportedForDevice:", a4);
        break;
      case 9:
        LOBYTE(v7) = -[CAMCaptureCapabilities _isSpatialPhotoModeSupportedForDevice:](self, "_isSpatialPhotoModeSupportedForDevice:", a4);
        break;
      default:
        LOBYTE(v7) = 0;
        break;
    }
  }
  return v7;
}

- (BOOL)isFrontTorchSupported
{
  return self->_frontTorchSupported;
}

- (BOOL)isBackTorchSupported
{
  return self->_backTorchSupported;
}

- (BOOL)isLiveFilteringSupported
{
  return self->_liveFilteringSupported;
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5
{
  int64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  int64_t v15;
  int64_t v17;
  _BOOL4 v18;
  int v19;
  int v20;
  int64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _BOOL4 v27;
  BOOL v29;
  char v30;
  char v31;

  LODWORD(v9) = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:", a5);
  if ((_DWORD)v9)
  {
    v10 = a4 == 7 && -[CAMCaptureCapabilities isCinematicModeSupported](self, "isCinematicModeSupported");
    v11 = -[CAMCaptureCapabilities cinematic4KSupported](self, "cinematic4KSupported");
    v12 = -[CAMCaptureCapabilities isHEVCEncodingSupported](self, "isHEVCEncodingSupported");
    v9 = -[CAMCaptureCapabilities backHighFrameRate4kMaxFPS](self, "backHighFrameRate4kMaxFPS");
    v13 = v11 && v10;
    switch(a3)
    {
      case 0:
        if (a4 == 1)
          goto LABEL_11;
        if (a4 == 2)
          goto LABEL_62;
        if (v10)
        {
          LOBYTE(v9) = -[CAMCaptureCapabilities isCinematicModeSupportedForDevice:](self, "isCinematicModeSupportedForDevice:", a5);
        }
        else
        {
          if (a4 != 8)
            goto LABEL_94;
          LOBYTE(v9) = -[CAMCaptureCapabilities _isSpatialVideoModeSupportedForDevice:](self, "_isSpatialVideoModeSupportedForDevice:", a5);
        }
        return v9;
      case 1:
        if (a4 != 1)
          goto LABEL_94;
        LOBYTE(v9) = -[CAMCaptureCapabilities is1080p60VideoSupportedForDevice:](self, "is1080p60VideoSupportedForDevice:", a5);
        return v9;
      case 2:
        if (a4 != 2)
          goto LABEL_94;
LABEL_62:
        LOBYTE(v9) = -[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:", a5);
        return v9;
      case 3:
        if (a4 != 2)
          goto LABEL_94;
        LOBYTE(v9) = -[CAMCaptureCapabilities is720p240SupportedForDevice:](self, "is720p240SupportedForDevice:", a5);
        return v9;
      case 4:
        if (a4 == 1 && v12)
        {
          LOBYTE(v9) = -[CAMCaptureCapabilities is1080p120VideoSupportedForDevice:](self, "is1080p120VideoSupportedForDevice:", a5);
        }
        else
        {
          if (a4 != 2)
            goto LABEL_94;
          LOBYTE(v9) = -[CAMCaptureCapabilities _is1080p120SlomoSupportedForDevice:](self, "_is1080p120SlomoSupportedForDevice:", a5);
        }
        return v9;
      case 5:
        if (a4 == 1)
          v20 = 1;
        else
          v20 = v13;
        if (v20 != 1)
          goto LABEL_94;
        goto LABEL_47;
      case 6:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1)
          v21 = -[CAMCaptureCapabilities back720pMaxFPS](self, "back720pMaxFPS");
        else
          v21 = -[CAMCaptureCapabilities front720pMaxFPS](self, "front720pMaxFPS");
        LOBYTE(v9) = a4 == 1 && v21 > 29;
        return v9;
      case 7:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1)
          v15 = -[CAMCaptureCapabilities back1080pMaxFPS](self, "back1080pMaxFPS");
        else
          v15 = -[CAMCaptureCapabilities front1080pMaxFPS](self, "front1080pMaxFPS");
        v24 = v15;
        v25 = a4 == 8
           && -[CAMCaptureCapabilities _isSpatialVideoModeSupportedForDevice:](self, "_isSpatialVideoModeSupportedForDevice:", a5);
        v30 = a4 == 1 || v10;
        v31 = v30 | v25;
        if (v24 > 29)
          LOBYTE(v9) = v31;
        else
          LOBYTE(v9) = 0;
        return v9;
      case 8:
        LOBYTE(v9) = 0;
        if (a4 == 2 && v12)
          LOBYTE(v9) = -[CAMCaptureCapabilities is1080p240SupportedForDevice:](self, "is1080p240SupportedForDevice:", a5);
        return v9;
      case 9:
        if (a4 != 1 || !v12)
          goto LABEL_94;
        LOBYTE(v9) = -[CAMCaptureCapabilities is4k60VideoSupportedForDevice:](self, "is4k60VideoSupportedForDevice:", a5);
        return v9;
      case 10:
        if (a4 == 1)
          v22 = 1;
        else
          v22 = v13;
        if (v22 != 1)
          goto LABEL_94;
        LOBYTE(v9) = -[CAMCaptureCapabilities is4k24VideoSupportedForDevice:](self, "is4k24VideoSupportedForDevice:", a5);
        return v9;
      case 11:
        if (((unint64_t)a5 > 0xB) | (0xFDu >> a5) & 1)
          v17 = -[CAMCaptureCapabilities back1080pMaxFPS](self, "back1080pMaxFPS");
        else
          v17 = -[CAMCaptureCapabilities front1080pMaxFPS](self, "front1080pMaxFPS");
        v26 = v17;
        v27 = -[CAMCaptureCapabilities isPALVideoSupported](self, "isPALVideoSupported");
        v29 = a4 == 1 && v26 > 24;
        LOBYTE(v9) = v27 && v29;
        return v9;
      case 12:
        v18 = -[CAMCaptureCapabilities isPALVideoSupported](self, "isPALVideoSupported");
        LOBYTE(v9) = 0;
        if (a4 == 1)
          v19 = 1;
        else
          v19 = v13;
        if (v18 && v19)
LABEL_47:
          LOBYTE(v9) = -[CAMCaptureCapabilities is4k30VideoSupportedForDevice:](self, "is4k30VideoSupportedForDevice:", a5);
        return v9;
      case 13:
      case 14:
        if (a4 == 1)
        {
          if (!-[CAMCaptureCapabilities isBack4k120VideoSupported](self, "isBack4k120VideoSupported") || !v12)
          {
LABEL_94:
            LOBYTE(v9) = 0;
            return v9;
          }
LABEL_61:
          LOBYTE(v9) = -[CAMCaptureCapabilities is4K120VideoSupportedForDevice:](self, "is4K120VideoSupportedForDevice:", a5);
          return v9;
        }
        v23 = v9;
        LOBYTE(v9) = 0;
        if (a4 == 2 && v23 >= 120 && v12)
          goto LABEL_61;
        break;
      default:
        if ((unint64_t)(a3 - 10000) >= 6 || a4 != 1)
          goto LABEL_94;
LABEL_11:
        LODWORD(v9) = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:", a5);
        if ((_DWORD)v9)
          LOBYTE(v9) = -[CAMCaptureCapabilities isVideoSupported](self, "isVideoSupported");
        return v9;
    }
  }
  return v9;
}

- (BOOL)isFrontCameraSupported
{
  return self->_frontCameraSupported;
}

- (BOOL)isHEVCEncodingSupported
{
  return self->_HEVCEncodingSupported;
}

- (BOOL)isVideoSupported
{
  return self->_videoSupported;
}

- (BOOL)isSlomoSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBackSlomoSupported](self, "isBackSlomoSupported");
  return ((1 << a3) & 0x502) != 0 && -[CAMCaptureCapabilities isFrontSlomoSupported](self, "isFrontSlomoSupported");
}

- (BOOL)isFrontSlomoSupported
{
  return self->_frontSlomoSupported;
}

- (BOOL)isBackSlomoSupported
{
  return self->_backSlomoSupported;
}

- (BOOL)isDualSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontDualSupported](self, "isFrontDualSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackDualSupported](self, "isBackDualSupported");
}

- (int64_t)hostProcess
{
  return self->_hostProcess;
}

- (BOOL)isSplitScreenSupported
{
  return self->_splitScreenSupported;
}

- (BOOL)isBackTimelapseSupported
{
  return self->_backTimelapseSupported;
}

- (BOOL)isSquareModeSupported
{
  return self->_squareModeSupported;
}

- (BOOL)isBackPanoramaSupported
{
  return self->_backPanoramaSupported;
}

- (BOOL)allowHaptics
{
  return self->_allowHaptics;
}

- (BOOL)isLockButtonAppropriateForShutter
{
  return self->_lockButtonAppropriateForShutter;
}

- (int64_t)sanitizeDesiredDevice:(int64_t)a3 forMode:(int64_t)a4
{
  unint64_t v5;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v22;
  __CFString *v23;
  int v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v5 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (!-[CAMCaptureCapabilities isSupportedMode:withDevice:](self, "isSupportedMode:withDevice:", a4, a3))
  {
    v7 = v5 - 1;
    if (v5 - 1 > 0xA)
    {
      v9 = 0;
      v8 = CFSTR("BackAuto");
    }
    else
    {
      v8 = off_1EA32D2A0[v7];
      v9 = qword_1DB9A75F8[v7];
    }
    if (-[CAMCaptureCapabilities isSupportedMode:withDevice:](self, "isSupportedMode:withDevice:", a4, v9))
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)a4 > 9)
          v11 = 0;
        else
          v11 = off_1EA32D358[a4];
        if (v5 > 0xB)
          v17 = 0;
        else
          v17 = off_1EA32D2F8[v5];
        v24 = 138543874;
        v25 = v11;
        v26 = 2114;
        v27 = v17;
        v28 = 2114;
        v29 = v8;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Configuring to use Auto device for same position instead (%{public}@).", (uint8_t *)&v24, 0x20u);
      }
    }
    else
    {
      v12 = v9 ^ 1;
      v13 = -[CAMCaptureCapabilities isSupportedMode:withDevice:](self, "isSupportedMode:withDevice:", a4, v9 ^ 1);
      v14 = os_log_create("com.apple.camera", "Camera");
      v10 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)a4 > 9)
            v15 = 0;
          else
            v15 = off_1EA32D358[a4];
          if (v5 > 0xB)
            v18 = 0;
          else
            v18 = off_1EA32D2F8[v5];
          v19 = CFSTR("FrontAuto");
          if (!v12)
            v19 = CFSTR("BackAuto");
          v20 = v19;
          v24 = 138543874;
          v25 = v15;
          v26 = 2114;
          v27 = v18;
          v28 = 2114;
          v29 = v20;
          _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Configuring to use Auto device for other position instead (%{public}@).", (uint8_t *)&v24, 0x20u);

        }
        v9 = v12;
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)a4 > 9)
          v16 = 0;
        else
          v16 = off_1EA32D358[a4];
        CAMDebugStringForCaptureDevice_0(v5);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CAMDebugStringForCaptureDevice_0(v9);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v16;
        v26 = 2114;
        v27 = v22;
        v28 = 2114;
        v29 = v23;
        _os_log_error_impl(&dword_1DB760000, v10, OS_LOG_TYPE_ERROR, "Attempted to change to mode %{public}@ with an unsupported device (%{public}@). Auto device for both positions unsupported, returning Auto device for same position anyway (%{public}@).", (uint8_t *)&v24, 0x20u);

      }
    }

    return v9;
  }
  return v5;
}

- (BOOL)isBackHDROnSupported
{
  return self->_backHDROnSupported;
}

- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  double v5;

  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, 0);
  return v5 > 1.0;
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  double result;

  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:", a3, a4, a5, 0, 1);
  return result;
}

- (double)_backPhotoModeMaximumZoomFactor
{
  return self->__backPhotoModeMaximumZoomFactor;
}

- (BOOL)isTelephotoSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontTelephotoSupported](self, "isFrontTelephotoSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackTelephotoSupported](self, "isBackTelephotoSupported");
}

- (BOOL)isBackTelephotoSupported
{
  return self->_backTelephotoSupported;
}

- (BOOL)hasFilteringEntitlement
{
  return self->_hasFilteringEntitlement;
}

- (BOOL)isBackBurstSupported
{
  return self->_backBurstSupported;
}

- (BOOL)isLivePreviewSupportedForLightingType:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL result;

  result = -[CAMCaptureCapabilities isPortraitModeSupportedForDevicePosition:](self, "isPortraitModeSupportedForDevicePosition:", a4);
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if ((unint64_t)(a3 - 4) >= 3)
    {
      return a3 == 0;
    }
    else if (a4 == 1)
    {
      return -[CAMCaptureCapabilities isFrontLiveStageLightSupported](self, "isFrontLiveStageLightSupported");
    }
    else
    {
      return !a4 && -[CAMCaptureCapabilities isBackLiveStageLightSupported](self, "isBackLiveStageLightSupported");
    }
  }
  return result;
}

- (BOOL)isPortraitModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontPortraitModeSupported](self, "isFrontPortraitModeSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackPortraitModeSupported](self, "isBackPortraitModeSupported");
}

- (BOOL)isForceTouchSupported
{
  return self->_forceTouchSupported;
}

- (double)_backDualCameraSwitchOverZoomFactor
{
  return self->__backDualCameraSwitchOverZoomFactor;
}

- (CAMCaptureCapabilities)initWithHostProcess:(int64_t)a3
{
  CAMCaptureCapabilities *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  int AppBooleanValue;
  char v17;
  int v18;
  int v19;
  BOOL v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  char v28;
  double v29;
  int v30;
  NSObject *v31;
  unint64_t forcedBackCamera;
  __CFString *v33;
  double v34;
  CFIndex AppIntegerValue;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unsigned int v51;
  unsigned int v52;
  NSObject *v53;
  __CFString *v54;
  int v55;
  _BOOL4 v56;
  int v57;
  double v58;
  float v59;
  CFIndex v60;
  uint64_t v61;
  BOOL v62;
  char v63;
  BOOL v64;
  char BoolAnswer;
  char v66;
  void *v67;
  BOOL backAutomaticHDRSupported;
  BOOL frontAutomaticHDRSupported;
  uint64_t IntegerAnswerWithDefault;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  uint64_t v83;
  uint64_t v84;
  int64x2_t v85;
  int64x2_t v86;
  int16x8_t v87;
  uint64_t v88;
  int v89;
  _BOOL4 v90;
  int v91;
  unsigned int v92;
  BOOL v93;
  BOOL v94;
  int v95;
  BOOL v96;
  BOOL v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  BOOL v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  char v108;
  void *v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  int v122;
  uint64_t v123;
  int v124;
  int v125;
  int v126;
  char v127;
  char v128;
  int v129;
  double v130;
  char v131;
  float v132;
  float v133;
  double v134;
  float v135;
  double v136;
  double v137;
  float v138;
  double v139;
  float v140;
  double v141;
  double v142;
  double v146;
  double backTripleCameraVideoModeMaximumZoomFactor;
  double v148;
  __int128 v149;
  float v150;
  double v151;
  BOOL v152;
  int v153;
  float v154;
  char v155;
  float v156;
  BOOL v157;
  double v158;
  int v160;
  int v161;
  BOOL v162;
  uint64_t v163;
  char v164;
  BOOL v166;
  void *v167;
  unint64_t v168;
  BOOL v169;
  _BOOL4 v170;
  int v171;
  uint64_t v172;
  CFIndex v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  void **v178;
  void **v179;
  uint64_t v180;
  uint64_t v181;
  NSDictionary *FFCZoomBehaviorForCaptureMode;
  char v183;
  char v184;
  BOOL v185;
  uint64_t v186;
  BOOL v187;
  BOOL v188;
  BOOL v189;
  __objc2_class **v190;
  int v191;
  _BOOL4 v192;
  void *v193;
  void *v194;
  unint64_t v195;
  uint64_t back4kMaxFPS;
  uint64_t v197;
  uint64_t v198;
  char v199;
  int v200;
  BOOL v201;
  BOOL v202;
  char v203;
  int v204;
  unsigned int v205;
  uint64_t v206;
  NSObject *v207;
  const __CFString *portraitInPhotoModeBehavior;
  unsigned __int8 v209;
  uint64_t portraitEffectsSupported;
  char v211;
  char v212;
  BOOL v213;
  char v214;
  BOOL v215;
  char v216;
  char v217;
  char v218;
  BOOL v219;
  BOOL v220;
  uint64_t v221;
  int v222;
  int v223;
  char v224;
  _BOOL4 smartStylesSupported;
  char v226;
  char v227;
  char v228;
  char v229;
  BOOL v230;
  char v231;
  void *v232;
  double v233;
  void *v234;
  double v235;
  void *v236;
  double v237;
  double v238;
  double v239;
  BOOL v241;
  BOOL v243;
  int v244;
  char v245;
  int64_t backWideFocalLengthDisplayValue;
  int v247;
  NSArray *v248;
  uint64_t v249;
  char v250;
  NSObject *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  NSArray *availableCustomLenses;
  void *v259;
  void *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t i;
  void *v265;
  void *v266;
  char v267;
  float v268;
  char v269;
  char v270;
  char v271;
  char v272;
  int v273;
  NSArray *v274;
  NSString *v275;
  NSString *peopleProximityDetectAdditionalEmail;
  CFIndex v277;
  uint64_t v278;
  CFIndex v279;
  uint64_t v280;
  CFIndex v281;
  uint64_t v282;
  CFIndex v283;
  uint64_t v284;
  int v285;
  BOOL v286;
  char v287;
  CFIndex v288;
  double v289;
  CFIndex v290;
  double v291;
  CFIndex v292;
  double v293;
  CFIndex v294;
  double v295;
  int v296;
  BOOL v297;
  char v298;
  uint64_t v299;
  NSDictionary *backCameraSupportedRAWResolutionsByMode;
  uint64_t v301;
  NSDictionary *backCameraDefaultRAWResolutionByMode;
  uint64_t v303;
  NSDictionary *frontCameraSupportedRAWResolutionsByMode;
  uint64_t v305;
  NSDictionary *frontCameraDefaultRAWResolutionByMode;
  unint64_t hostProcess;
  char v308;
  char v309;
  CGFloat v310;
  CGFloat v311;
  CGFloat v312;
  CGFloat v313;
  char v314;
  char v315;
  char v316;
  id v317;
  id v318;
  char v319;
  char v320;
  char v321;
  CAMCaptureCapabilities *v322;
  id v324;
  id v325;
  void *v326;
  void *v327;
  void *v328;
  uint64_t v329;
  NSDictionary *frontCameraSupportedCompressedResolutionsByMode;
  uint64_t v331;
  NSDictionary *frontCameraDefaultCompressedResolutionByMode;
  uint64_t v333;
  uint64_t v334;
  _BOOL4 v335;
  float v336;
  _BOOL4 v337;
  BOOL v338;
  uint64_t v339;
  __int128 v340;
  uint64_t v341;
  BOOL v342;
  double v343;
  double v344;
  CFIndex v345;
  double v346;
  double v347;
  CFIndex v348;
  BOOL v349;
  BOOL v350;
  BOOL v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  BOOL v356;
  void *v357;
  BOOL v358;
  uint64_t v359;
  BOOL v360;
  _BOOL4 v361;
  void *v362;
  uint64_t v363;
  int v364;
  BOOL v365;
  int v366;
  int64_t v367;
  char v368;
  _BOOL4 v369;
  char v370;
  unint64_t v371;
  int v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  Boolean v377;
  Boolean v378;
  Boolean v379;
  Boolean v380;
  Boolean v381;
  Boolean v382;
  Boolean keyExistsAndHasValidFormat;
  Boolean v384;
  objc_super v385;
  _QWORD v386[2];
  _BYTE v387[128];
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  _QWORD v402[3];
  _QWORD v403[3];
  uint8_t buf[4];
  const __CFString *v405;
  __int16 v406;
  uint64_t v407;
  uint64_t v408;

  v408 = *MEMORY[0x1E0C80C00];
  CAMSignpostWithIDAndArgs(89, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v385.receiver = self;
  v385.super_class = (Class)CAMCaptureCapabilities;
  v5 = -[CAMCaptureCapabilities init](&v385, sel_init);

  if (!v5)
    goto LABEL_436;
  v5->_hostProcess = a3;
  v5->_internalInstall = MGGetBoolAnswer();
  v372 = MGGetSInt32Answer();
  v5->__iPad = v372 == 3;
  AVGestaltGetStringAnswerWithDefault();
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (objc_msgSend(v362, "length"))
  {
    objc_msgSend(v362, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        v6 = (double)v13 / 10.0 + (double)v11;
      }

    }
  }
  v5->_shouldPerformSuperWideAutoMacroMigration = v6 < 16.0;
  v384 = 0;
  v5->_documentScanningMinimumConfidenceLevel = 0.95;
  v5->__forcedBackCamera = 0;
  v5->__forcedInitialZoomDisplayFactor = 0.0;
  v5->_backLowLightPreviewOverlayStyle = 0;
  v5->_frontLowLightPreviewOverlayStyle = 0;
  v5->_maximumNumberOfInflightRequests = 2;
  if (!v5->_internalInstall)
  {
    v346 = 0.0;
    v354 = 0;
    v355 = 0;
    v333 = 0;
    v334 = 0;
    v349 = 0;
    v25 = 0;
    v339 = 0;
    v359 = 0;
    v26 = 0;
    v342 = 0;
    v27 = 0;
    v341 = 0;
    v352 = 0;
    v353 = 0;
    v345 = 0;
    v335 = 0;
    v360 = 0;
    v348 = 0;
    v337 = 0;
    v358 = 0;
    v368 = 0;
    v28 = 0;
    v356 = 0;
    v350 = 0;
    v351 = 0;
    v14 = 0;
    v365 = 0;
    v343 = 0.0;
    v344 = 0.0;
    v347 = 0.0;
    v29 = 0.0;
    v363 = -1;
    v30 = 3;
    goto LABEL_66;
  }
  v365 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowHapticsOnModeDialTap"), CFSTR("com.apple.camera"), 0) != 0;
  v14 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentApplyNaturalLightingToOriginal"), CFSTR("com.apple.camera"), 0) != 0;
  v351 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentUseReticleStroke"), CFSTR("com.apple.camera"), 0) != 0;
  v350 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentUseTransientImageWellForCTM"), CFSTR("com.apple.camera"), 0) != 0;
  v356 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowFullscreenModeSelector"), CFSTR("com.apple.camera"), 0) != 0;
  v5->_featureDevelopmentEmulateSuperWide = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentEmulateSuperWide"), CFSTR("com.apple.camera"), 0) != 0;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowWideBravo"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    _ZF = AppBooleanValue == 0;
  else
    _ZF = 0;
  v17 = _ZF;
  v370 = v17;
  v358 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentDebugSemanticDevelopmentFilters"), CFSTR("com.apple.camera"), 0) != 0;
  v382 = 0;
  v18 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowExposureClippingIndicator"), CFSTR("com.apple.camera"), &v382);
  if (v382)
  {
    v5->__forceEnableExposureClippingIndicator = v18 != 0;
    v5->__forceDisableExposureClippingIndicator = v18 == 0;
  }
  v381 = 0;
  v5->_featureDevelopmentForceSingleCamera = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentForceSingleCamera"), CFSTR("com.apple.camera"), &v381) != 0;
  v380 = 0;
  v19 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowSuperBravo"), CFSTR("com.apple.camera"), &v380);
  if (v380)
    v20 = v19 == 0;
  else
    v20 = 0;
  v21 = v20;
  v368 = v21;
  v5->_featureDevelopmentDefaultWideHighStabilization = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentDefault1xVideoStabilizationHigh"), CFSTR("com.apple.camera"), 0) != 0;
  BYTE4(v339) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowFocalLengthPicker"), CFSTR("com.apple.camera"), 0) != 0;
  v360 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowOverlapping48MPCaptures"), CFSTR("com.apple.camera"), 0) != 0;
  v335 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllow24MP"), CFSTR("com.apple.camera"), 0) != 0;
  v22 = (void *)CFPreferencesCopyAppValue(CFSTR("CAMFeatureDevelopmentForceBackCamera"), CFSTR("com.apple.camera"));
  objc_msgSend(v22, "lowercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("wide")) & 1) != 0)
  {
    v24 = 2;
LABEL_36:
    v5->__forcedBackCamera = v24;
    v31 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      forcedBackCamera = v5->__forcedBackCamera;
      if (forcedBackCamera > 0xB)
        v33 = 0;
      else
        v33 = off_1EA32D2F8[forcedBackCamera];
      *(_DWORD *)buf = 138543362;
      v405 = v33;
      _os_log_impl(&dword_1DB760000, v31, OS_LOG_TYPE_DEFAULT, "Forcing back camera to %{public}@ when possible", buf, 0xCu);
    }

    v5->__allowZoomWithForcedBackCamera = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowZoomWithForcedCamera"), CFSTR("com.apple.camera"), 0) != 0;
    goto LABEL_42;
  }
  if ((objc_msgSend(v23, "hasPrefix:", CFSTR("tele")) & 1) != 0)
  {
    v24 = 3;
    goto LABEL_36;
  }
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("superwide")) & 1) != 0)
  {
    v24 = 5;
    goto LABEL_36;
  }
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("bravo")) & 1) != 0)
  {
    v24 = 4;
    goto LABEL_36;
  }
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("widebravo")) & 1) != 0)
  {
    v24 = 6;
    goto LABEL_36;
  }
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("superbravo")) & 1) != 0)
  {
    v24 = 7;
    goto LABEL_36;
  }
  v5->__forcedBackCamera = 0;
LABEL_42:
  -[CAMCaptureCapabilities _doubleForKey:applicationID:](v5, "_doubleForKey:applicationID:", CFSTR("CAMFeatureDevelopmentInitialZoomFactor"), CFSTR("com.apple.camera"));
  v5->__forcedInitialZoomDisplayFactor = v34;
  v379 = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentMaxInflightRequests"), CFSTR("com.apple.camera"), &v379);
  if (v379)
    v5->_maximumNumberOfInflightRequests = AppIntegerValue;
  v36 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentLowLightPreviewStyle"), CFSTR("com.apple.camera"), 0);
  v37 = v36;
  if (v36 >= 4)
  {
    v39 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[CAMCaptureCapabilities initWithHostProcess:].cold.2(v37, v39, v40, v41, v42, v43, v44, v45);

    v38 = 0;
  }
  else
  {
    v38 = qword_1DB9A7478[v36];
  }
  v5->_backLowLightPreviewOverlayStyle = v38;
  v5->_frontLowLightPreviewOverlayStyle = v38;
  v5->_forceAllowAllInterfaceOrientations = CFPreferencesGetAppBooleanValue(CFSTR("CAMForceAllowAllInterfaceOrientations"), CFSTR("com.apple.camera"), 0) != 0;
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("CAMFeatureDevelopmentTimelapseFirstShotDelay"), CFSTR("com.apple.camera"), 0);
  v29 = v46;
  v5->_imageAnalysisShowsInactiveTextRegions = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentShowInactiveTextRegions"), CFSTR("com.apple.camera"), 0) != 0;
  CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentForceEnableSuperBravoDevice"), CFSTR("com.apple.camera"), 0);
  CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentForceEnablePortraitBravoDevices"), CFSTR("com.apple.camera"), 0);
  v337 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowAllProResConfigurations"), CFSTR("com.apple.camera"), 0) != 0;
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("CAMFeatureDevelopmentProResMinimumAvailableDiskSpaceOverride"), CFSTR("com.apple.camera"), 0);
  v347 = v47;
  v348 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentProResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace"), CFSTR("com.apple.camera"), 0);
  v345 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentZoomPinchScalingMethod"), CFSTR("com.apple.camera"), &v384);
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("CAMFeatureDevelopmentZoomPinchExponentialFactorDistance"), CFSTR("com.apple.camera"), 0);
  v344 = v48;
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("CAMFeatureDevelopmentZoomPinchExponentialFactor"), CFSTR("com.apple.camera"), 0);
  v343 = v49;
  +[CAMPreferencesUtilities doubleForKey:applicationID:keyIsValidAndExists:](CAMPreferencesUtilities, "doubleForKey:applicationID:keyIsValidAndExists:", CFSTR("CAMFeatureDevelopmentZoomPinchHybridLerpDistance"), CFSTR("com.apple.camera"), 0);
  v346 = v50;
  v378 = 0;
  v51 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentCacheDeleteUrgency"), CFSTR("com.apple.camera"), &v378);
  v30 = 3;
  if (v378)
  {
    v52 = v51;
    if (v51 <= 4)
    {
      v53 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        if (v52 > 4)
          v54 = 0;
        else
          v54 = off_1EA32D278[v52];
        *(_DWORD *)buf = 138543618;
        v405 = CFSTR("High");
        v406 = 2114;
        v407 = (uint64_t)v54;
        _os_log_impl(&dword_1DB760000, v53, OS_LOG_TYPE_DEFAULT, "Overriding CacheDeleteUrgency from %{public}@ to %{public}@", buf, 0x16u);
      }

      v30 = v52;
    }
  }
  v5->_shouldEnableUserNotifications = CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugSuppressNotifications"), CFSTR("com.apple.camera"), 0) == 0;
  v27 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAspectRatioCropThreeTwoSupported"), CFSTR("com.apple.camera"), 0) != 0;
  buf[0] = 0;
  v55 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowSmartStyles"), CFSTR("com.apple.camera"), buf);
  v56 = buf[0] != 0;
  if (v55)
    v56 = 0;
  HIDWORD(v333) = v55 != 0;
  LODWORD(v334) = v56;
  BYTE4(v334) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowExtraStylesControls"), CFSTR("com.apple.camera"), 0) != 0;
  LOBYTE(v354) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowPortraitSemanticStyles"), CFSTR("com.apple.camera"), 0) != 0;
  BYTE4(v353) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowPortraitAspectRatio"), CFSTR("com.apple.camera"), 0) != 0;
  BYTE4(v341) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowContinuousZoomForPortraitMode"));
  HIDWORD(v354) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowDeepFusionForPortraitMode"));
  LODWORD(v355) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowDeepFusionForFrontPortraitMode"));
  BYTE4(v359) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowHalfPressSimulation"), CFSTR("com.apple.camera"), 0) != 0;
  v5->__allowSpatialOverCaptureInPortraitMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowSpatialOverCaptureInPortraitMode"));
  LOBYTE(v353) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowPhotoModeDepth"));
  v5->_featureDevelopmentForceDepthDataCaptureInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentForceDepthDataCaptureInPhotoMode"));
  BYTE4(v352) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowFrontPhotoModeDepth"));
  LOBYTE(v352) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowPreviewQualityStillImageFilteringForPhotoMode"));
  v5->_featureDevelopmentIgnoreDepthSuggestionInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentIgnoreDepthSuggestionInPhotoMode"));
  v5->_featureDevelopmentForceDepthEffectInPhotoMode = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentForceDepthEffectInPhotoMode"));
  LODWORD(v341) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowContinuousZoomForCinematicMode"));
  LOBYTE(v359) = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowZoomPIPForSlomo"), CFSTR("com.apple.camera"), 0) != 0;
  v342 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowPortraitModeOverlappingCaptures"));
  v5->_featureDevelopmentHidePreviewOverlayBars = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentHidePreviewOverlayBars"));
  v5->_featureDevelopmentAllowAllHEICOptionsInPhotoPicker = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowAllHEICOptionsInPhotoPicker"));
  v5->__disablePortraitFrontFacingZoomedCaptureDeviceFormat = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentDisableZoomedFFCPortrait"), CFSTR("com.apple.camera"), 0) != 0;
  v26 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowActionModeAggregateDevice4k60"));
  LODWORD(v339) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowPauseCinematic"));
  v25 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowMixAudioWithOthers"));
  v349 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowPhotoModeNightModePortrait"));
  v57 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentDocumentScanningEnabled"), CFSTR("com.apple.camera"), 0);
  BYTE4(v355) = v57 != 0;
  -[CAMCaptureCapabilities _doubleForKey:applicationID:](v5, "_doubleForKey:applicationID:", CFSTR("CAMFeatureDevelopmentDocumentScanningMininumConfidenceLevel"), CFSTR("com.apple.camera"));
  if (v57 && v58 > 0.0)
  {
    v59 = v58;
    v5->_documentScanningMinimumConfidenceLevel = v59;
  }
  v5->__proResCinematicVideoSupported = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentCinematicProRes"), CFSTR("com.apple.camera"), 0) != 0;
  LODWORD(v333) = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentUnifiedPhotoAndPortraitHidePortraitMode"));
  v377 = 0;
  v60 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPortraitInPhotoModeBehavior"), CFSTR("com.apple.camera"), &v377);
  if (v377)
    v61 = v60;
  else
    v61 = -1;
  v363 = v61;
  v5->_featureDevelopmentShowLockIndicator = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentShowLockIndicator"));

  v28 = v370;
LABEL_66:
  v62 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentDisableAudio"));
  v63 = 0;
  v5->_disableAudio = v62;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
    v63 = v372 != 3 || v25;
  v5->_mixAudioWithOthersSupported = v63;
  v5->__aspectRatioCropThreeTwoSupported = v27;
  v371 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  v64 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0;
  v5->_cacheDeleteSupported = v64;
  v5->_cacheDeleteUrgency = v30;
  BoolAnswer = 1;
  v5->_PALVideoSupported = 1;
  v5->_mirroredFrontVideosSupported = AVGestaltGetBoolAnswer();
  v5->_mirroredFrontCapturesSupported = 1;
  v5->_variableFramerateVideoSupported = AVGestaltGetBoolAnswer();
  v5->_naturalLightingAppliedToOriginal = v14;
  v66 = MGGetBoolAnswer();
  v5->_allowHaptics = v66;
  v5->_allowHapticsOnConfigurationTaps = v66 & v365;
  v5->_backCameraSupported = AVGestaltGetBoolAnswer();
  v5->_frontCameraSupported = AVGestaltGetBoolAnswer();
  v5->_squareModeSupported = 1;
  v5->_backFlashSupported = AVGestaltGetBoolAnswer();
  v5->_frontFlashSupported = AVGestaltGetBoolAnswer();
  v5->_backTorchSupported = v5->_backFlashSupported;
  v5->_frontTorchSupported = 0;
  v5->_backHDRSupported = AVGestaltGetBoolAnswer();
  v5->_backAutomaticHDRSupported = AVGestaltGetBoolAnswer();
  v5->_backHDROnSupported = AVGestaltGetBoolAnswer();
  v5->_frontHDRSupported = AVGestaltGetBoolAnswer();
  v5->_frontAutomaticHDRSupported = AVGestaltGetBoolAnswer();
  v5->_frontHDROnSupported = AVGestaltGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_previewSupportedDuringHDR = objc_msgSend(v67, "_graphicsQuality") == 100;

  v5->_backSmartHDRSupported = AVGestaltGetIntegerAnswerWithDefault() > 2;
  v5->_frontSmartHDRSupported = AVGestaltGetBoolAnswer();
  if (!-[CAMCaptureCapabilities isSmartHDRSupported](v5, "isSmartHDRSupported"))
    BoolAnswer = AVGestaltGetBoolAnswer();
  v5->_modernHDRSupported = BoolAnswer;
  backAutomaticHDRSupported = v5->_backAutomaticHDRSupported;
  if (backAutomaticHDRSupported)
    backAutomaticHDRSupported = !-[CAMCaptureCapabilities isSmartHDRSupported](v5, "isSmartHDRSupported");
  v5->_backAutomaticHDRSupported = backAutomaticHDRSupported;
  frontAutomaticHDRSupported = v5->_frontAutomaticHDRSupported;
  if (frontAutomaticHDRSupported)
    frontAutomaticHDRSupported = !-[CAMCaptureCapabilities isSmartHDRSupported](v5, "isSmartHDRSupported");
  v5->_frontAutomaticHDRSupported = frontAutomaticHDRSupported;
  v5->_HDRSettingAllowed = v6 < 15.0;
  IntegerAnswerWithDefault = AVGestaltGetIntegerAnswerWithDefault();
  v71 = 1;
  if (IntegerAnswerWithDefault > 59)
    v71 = 2;
  v5->_defaultVFRMode = v71;
  v5->_backBurstSupported = AVGestaltGetBoolAnswer();
  v5->_frontBurstSupported = AVGestaltGetBoolAnswer();
  v5->_maximumBurstLength = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backCaptureInterval = (double)AVGestaltGetIntegerAnswerWithDefault() / 1000.0;
  v5->__frontCaptureInterval = (double)AVGestaltGetIntegerAnswerWithDefault() / 1000.0;
  v72 = AVGestaltGetBoolAnswer();
  v73 = 0;
  v5->_videoSupported = v72;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x13) != 0)
    v73 = AVGestaltGetBoolAnswer();
  v5->_stillDuringVideoSupported = v73;
  v5->_back720pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_front720pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_back1080pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->_front1080pMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v74 = AVGestaltGetIntegerAnswerWithDefault();
  v75 = AVGestaltGetIntegerAnswerWithDefault();
  v5->_back4kMaxFPS = v74;
  v5->_front4kMaxFPS = v75;
  v5->_back4k30VideoSupported = v74 > 29;
  v5->_front4k30VideoSupported = v75 > 29;
  v5->_back4k60VideoSupported = v74 > 59;
  v5->_front4k60VideoSupported = v75 > 59;
  v5->_back4k24VideoSupported = v74 > 59;
  v5->_front4k24VideoSupported = v75 > 59;
  v76 = _os_feature_enabled_impl();
  v77 = v76;
  if (v74 > 119)
    v78 = v76;
  else
    v78 = 0;
  v5->_back4k120VideoSupported = v78;
  v5->_backSlomoSupported = AVGestaltGetBoolAnswer();
  v5->_frontSlomoSupported = AVGestaltGetBoolAnswer();
  v79 = AVGestaltGetIntegerAnswerWithDefault();
  v80 = AVGestaltGetIntegerAnswerWithDefault();
  v81 = AVGestaltGetIntegerAnswerWithDefault();
  v361 = v77;
  if (v77)
    v82 = v81;
  else
    v82 = 0;
  v5->_backHighFrameRate4kMaxFPS = v82;
  v83 = AVGestaltGetIntegerAnswerWithDefault();
  v84 = AVGestaltGetIntegerAnswerWithDefault();
  v5->_backHighFrameRate720pMaxFPS = v79;
  v5->_frontHighFrameRate720pMaxFPS = v83;
  v85.i64[0] = v80;
  v85.i64[1] = v84;
  v86.i64[0] = v79;
  v86.i64[1] = v83;
  v5->_backHighFrameRate1080pMaxFPS = v80;
  v5->_frontHighFrameRate1080pMaxFPS = v84;
  v87 = (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_s64(v86, vdupq_n_s64(0xEFuLL)), (int32x4_t)vcgtq_s64(v85, vdupq_n_s64(0x77uLL)));
  *(int8x8_t *)v87.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v87), (int8x8_t)0x1000100010001);
  *(_DWORD *)&v5->_back720p240Supported = vmovn_s16(v87).u32[0];
  v5->_back1080p240Supported = v80 > 239;
  v5->_front1080p240Supported = v84 > 239;
  v5->__tripleCamera1080p60Supported = AVGestaltGetIntegerAnswerWithDefault() > 59;
  v5->__backDualCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backWideDualCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__backTripleCameraVideoCapture4kMaxFPS = AVGestaltGetIntegerAnswerWithDefault();
  v5->__actionModeAggregateDevice4k60Supported = v26;
  v88 = v5->_hostProcess - 3;
  v89 = AVGestaltGetBoolAnswer();
  if ((v88 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v90 = v89;
  else
    v90 = 0;
  v5->_backLivePhotoSupported = v90;
  v5->_frontLivePhotoSupported = v90;
  v91 = AVGestaltGetBoolAnswer();
  v92 = v91;
  if ((unint64_t)a3 > 5)
  {
    v94 = 0;
    v95 = 0;
    v96 = v351;
    v97 = v350;
    v93 = v356;
  }
  else
  {
    v93 = v356;
    if (((1 << a3) & 0x15) != 0)
    {
      v94 = 0;
      v95 = v91;
    }
    else
    {
      v95 = 0;
      v94 = v91;
    }
    v96 = v351;
    v97 = v350;
  }
  v5->_ctmSupported = v95;
  v338 = v94;
  v5->_ctmSupportSuppressed = v94;
  v5->_deviceSupportsCTM = v91;
  v5->_useReticleStroke = v96;
  v5->_useCTMTransientImageWell = v95 & v97;
  v5->_useCTMModeSelector = v95 & v93;
  v5->_allowControlDrawer = v95;
  v5->_responsiveShutterSupported = AVGestaltGetBoolAnswer();
  v5->_interactiveVideoFormatControlSupported = 1;
  if (v6 >= 17.0)
    v98 = 1;
  else
    v98 = v95;
  v5->_interactiveVideoFormatControlAlwaysEnabled = v98;
  if (v95)
    v99 = AVGestaltGetBoolAnswer();
  else
    v99 = 0;
  v5->_exposureSliderSupported = v99;
  if (v90)
    v100 = AVGestaltGetBoolAnswer();
  else
    v100 = 0;
  v5->_livePhotoAutoModeSupported = v100;
  v101 = 0;
  v5->_autoLowLightVideoSupported = AVGestaltGetBoolAnswer();
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      v5->_backLowLightSupported = AVGestaltGetBoolAnswer();
      v5->_frontLowLightSupported = AVGestaltGetBoolAnswer();
      v102 = v6 >= 17.0 && (AVGestaltGetBoolAnswer() & 1) != 0 || v349;
      v5->__backPhotoModeNightModeDepthSupported = v102;
      if (-[CAMCaptureCapabilities isBackLowLightSupported](v5, "isBackLowLightSupported"))
        v103 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentAllowSuperWideTeleNightMode"), CFSTR("com.apple.camera"), 0) != 0;
      else
        v103 = 0;
      v101 = 0;
      v5->__backSuperWideTeleNightModeSupported = v103;
      if ((unint64_t)a3 <= 4 && a3 != 3)
        goto LABEL_115;
      break;
    case 1:
LABEL_115:
      v5->_stereoAudioRecordingSupported = AVGestaltGetBoolAnswer();
      v101 = AVGestaltGetBoolAnswer();
      break;
    default:
      break;
  }
  v5->_HEVCEncodingSupported = v101;
  v5->_backPanoramaSupported = AVGestaltGetBoolAnswer();
  v5->_backTimelapseSupported = v64;
  v5->_frontTimelapseSupported = v64;
  if ((AVGestaltGetBoolAnswer() & 1) != 0)
  {
    v104 = 0x4002666666666666;
  }
  else
  {
    +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "initialCaptureTimeInterval");
    v104 = v106;

  }
  if (v29 != 0.0)
  {
    v107 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v405 = *(const __CFString **)&v29;
      _os_log_impl(&dword_1DB760000, v107, OS_LOG_TYPE_DEFAULT, "Overriding time-lapse first shot delay as %f seconds", buf, 0xCu);
    }

    v104 = *(_QWORD *)&v29;
  }
  *(_QWORD *)&v5->_timelapseFirstShotDelay = v104;
  *(_WORD *)&v5->_backTorchPatternSupported = v5->_backFlashSupported;
  if ((MGGetBoolAnswer() & 1) != 0)
    v108 = 1;
  else
    v108 = MGGetBoolAnswer();
  v5->_splitScreenSupported = v108;
  v5->_lockButtonAppropriateForShutter = 0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "_referenceBounds");
  v357 = v109;
  objc_msgSend(v109, "scale");
  CAMMGGetCGRectAnswer((uint64_t)CFSTR("VolumeUpButtonNormalizedCGRect"), 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__volumeUpButtonFrame.origin.x = v110;
  v5->__volumeUpButtonFrame.origin.y = v111;
  v5->__volumeUpButtonFrame.size.width = v112;
  v5->__volumeUpButtonFrame.size.height = v113;
  CAMMGGetCGRectAnswer((uint64_t)CFSTR("VolumeDownButtonNormalizedCGRect"), 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__volumeDownButtonFrame.origin.x = v114;
  v5->__volumeDownButtonFrame.origin.y = v115;
  v5->__volumeDownButtonFrame.size.width = v116;
  v5->__volumeDownButtonFrame.size.height = v117;
  CAMMGGetCGRectAnswer((uint64_t)CFSTR("UserIntentPhysicalButtonNormalizedCGRect"), 1.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__lockButtonFrame.origin.x = v118;
  v5->__lockButtonFrame.origin.y = v119;
  v5->__lockButtonFrame.size.width = v120;
  v5->__lockButtonFrame.size.height = v121;
  v122 = MGGetBoolAnswer();
  v123 = 4000000000;
  if (v122)
    v123 = 0;
  v5->_maximumRecordedFileSize = v123;
  v5->_forceTouchSupported = MGGetBoolAnswer();
  v124 = AVGestaltGetBoolAnswer();
  v366 = AVGestaltGetBoolAnswer();
  v125 = v124 & v366;
  v126 = (AVGestaltGetBoolAnswer() & 1) != 0
      || -[CAMCaptureCapabilities featureDevelopmentEmulateSuperWide](v5, "featureDevelopmentEmulateSuperWide");
  v127 = v124 & v126 & (v28 ^ 1);
  v128 = v125 & v126 & (v368 ^ 1);
  v129 = AVGestaltGetBoolAnswer();
  v5->_backQuadraWideSupported = v129;
  v5->_frontQuadraWideSupported = 0;
  v5->__quadraPortraitSupported = v129;
  v369 = v129;
  if (v129)
    v130 = 2.0;
  else
    v130 = 1.0;
  v5->_quadraWideDisplayZoomFactor = v130;
  v5->_quadraWideRelativeZoomFactor = 2.0;
  v5->_backTelephotoSupported = v366;
  v5->_backDualSupported = v125;
  v5->_backSuperWideSupported = v126;
  v5->_backWideDualSupported = v127;
  v5->_backTripleCameraSupported = v128;
  v131 = AVGestaltGetBoolAnswer();
  v5->_superWideAutoMacroSupported = v131;
  v5->_macroControlEnabledByDefault = v131;
  v5->_frontTelephotoSupported = 0;
  v5->_frontDualSupported = 0;
  v5->_frontSuperWideSupported = AVGestaltGetBoolAnswer();
  v5->_frontWideDualSupported = 0;
  v5->_frontTripleCameraSupported = 0;
  AVGestaltGetFloatAnswerWithDefault();
  v133 = v132;
  v134 = v132;
  AVGestaltGetFloatAnswerWithDefault();
  v336 = v135;
  v136 = v135;
  v137 = (double)AVGestaltGetIntegerAnswerWithDefault();
  v5->_superWideDisplayZoomFactor = 0.5;
  v5->_wideDisplayZoomFactor = 1.0;
  v5->_telephotoDisplayZoomFactor = round(v134 + v134) * 0.5;
  v5->__backDualCameraSwitchOverZoomFactor = v134;
  v5->__frontDualCameraSwitchOverZoomFactor = 1.0;
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backWideDualCameraSwitchOverZoomFactor = v138;
  if (v5->_frontSuperWideSupported)
    v139 = 2.0;
  else
    v139 = 1.0;
  v5->__frontWideDualCameraSwitchOverZoomFactor = v139;
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backPhotoModeMaximumZoomFactor = v140;
  v5->__frontPhotoModeMaximumZoomFactor = v136;
  v5->__backVideoModeMaximumZoomFactor = (double)AVGestaltGetIntegerAnswerWithDefault();
  v5->__frontVideoModeMaximumZoomFactor = v137;
  v141 = (double)AVGestaltGetIntegerAnswerWithDefault() / 100.0;
  v142 = (double)AVGestaltGetIntegerAnswerWithDefault() / 100.0;
  __asm { FMOV            V0.2D, #1.0 }
  v340 = _Q0;
  if ((v125 & v126) == 1)
  {
    v5->__backTripleCameraPhotoModeMaximumZoomFactor = v141;
    v5->__backTripleCameraVideoModeMaximumZoomFactor = v142;
    -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](v5, "_backWideDualCameraSwitchOverZoomFactor");
    v5->__backDualPhotoModeMaximumZoomFactor = v141 / v146;
    backTripleCameraVideoModeMaximumZoomFactor = v5->__backTripleCameraVideoModeMaximumZoomFactor;
    -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](v5, "_backWideDualCameraSwitchOverZoomFactor");
    v142 = backTripleCameraVideoModeMaximumZoomFactor / v148;
    v149 = v340;
    v5->__backDualVideoModeMaximumZoomFactor = v142;
  }
  else
  {
    *(_OWORD *)&v5->__backTripleCameraPhotoModeMaximumZoomFactor = _Q0;
    v5->__backDualPhotoModeMaximumZoomFactor = v141;
    v5->__backDualVideoModeMaximumZoomFactor = v142;
    if (-[CAMCaptureCapabilities isQuadraWideBinningReconfigurationSupportedForMode:devicePosition:videoConfiguration:](v5, "isQuadraWideBinningReconfigurationSupportedForMode:devicePosition:videoConfiguration:", 1, 0, 0)&& !-[CAMCaptureCapabilities isQuadraWideBinningReconfigurationSupportedForMode:devicePosition:videoConfiguration:](v5, "isQuadraWideBinningReconfigurationSupportedForMode:devicePosition:videoConfiguration:", 2, 0, 0))
    {
      v142 = v142 / v5->_quadraWideRelativeZoomFactor;
    }
    v149 = v340;
  }
  v5->__backDualSlomoModeMaximumZoomFactor = v142;
  v5->__frontDualPhotoModeMaximumZoomFactor = 1.0;
  v5->__frontDualVideoModeMaximumZoomFactor = 1.0;
  *(_OWORD *)&v5->__frontTripleCameraPhotoModeMaximumZoomFactor = v149;
  AVGestaltGetFloatAnswerWithDefault();
  v151 = v150;
  if ((_DWORD)v341)
    v151 = 6.0;
  v5->__backWideDualCinematicModeMaximumZoomFactor = v151;
  v152 = v133 <= 3.0;
  v5->_continuousZoomSupportedForCinematicMode = v151 > 1.0;
  if (v151 > 1.0)
    v152 = 0;
  v5->__backDualCameraSupportedForCinematic = v152;
  v153 = AVGestaltGetBoolAnswer();
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backPortraitModeMaximumZoomFactor = v154;
  v155 = BYTE4(v341);
  if (v154 > 1.0)
    v155 = 1;
  v5->_continuousZoomSupportedForPortraitMode = v155;
  AVGestaltGetFloatAnswerWithDefault();
  v5->__backPortraitModeMaximumZoomFactor = v156;
  v157 = -[CAMCaptureCapabilities isTripleCameraSupported](v5, "isTripleCameraSupported");
  if (v157)
  {
    v158 = v346;
  }
  else
  {
    v158 = v346;
    if (((v126 ^ 1) & 1) == 0)
      v157 = v6 >= 13.0 && v372 != 3;
  }
  v5->_zoomPlatterSupported = v157;
  v5->_backSuperWideFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  v5->_backWideFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  v5->_backTelephotoFocalLengthDisplayValue = AVGestaltGetIntegerAnswer();
  if (v5->_backQuadraWideSupported)
    v5->_backQuadraWideFocalLengthDisplayValue = 2 * v5->_backWideFocalLengthDisplayValue;
  v160 = MGGetSInt32Answer();
  v161 = MGGetSInt32Answer();
  v162 = v372 == 3;
  v5->_mainScreenSizePixels.width = (double)v160;
  v5->_mainScreenSizePixels.height = (double)v161;
  if (v372 == 3)
    v163 = 1;
  else
    v163 = v92;
  if ((double)v161 / (double)v160 <= 1.5)
    v162 = 0;
  v5->__previewAspectRatioToggleSupportedForPhotoModes = v162;
  v5->_backPearlSupported = 0;
  v5->_frontPearlSupported = AVGestaltGetBoolAnswer();
  v5->_backTimeOfFlightSupported = AVGestaltGetBoolAnswer();
  v5->_frontTimeOfFlightSupported = 0;
  v164 = AVGestaltGetBoolAnswer();
  if ((a3 & 1) != 0 || (unint64_t)a3 >= 5)
    v166 = 0;
  else
    v166 = v164;
  v5->_backSpatialOverCaptureSupported = v166;
  v5->_frontSpatialOverCaptureSupported = 0;
  if ((v163 & 1) != 0)
  {
    CAMPreferredLocale();
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sfCameraFontSupported = CEKIsSFCameraSupportedForLocale();

  }
  else
  {
    v5->_sfCameraFontSupported = 0;
  }
  v168 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  v169 = v6 >= 14.1;
  v170 = v372 != 3;
  v5->_overContentFlipButtonSupported = v163;
  if (v372 == 3)
    v169 = 0;
  v5->_imagePickerUsesModernLayout = v169;
  v5->_zoomDialStyle = v163;
  v171 = AVGestaltGetBoolAnswer();
  v172 = 2;
  if (!v171)
    v172 = 0;
  v173 = v345;
  if (!v384)
    v173 = v172;
  v5->_zoomPinchScalingMethod = v173;
  v174 = 120.0;
  if (v344 > 0.0)
    v174 = v344;
  v175 = 2.4;
  if (v343 > 0.0)
    v175 = v343;
  v5->_zoomPinchExponentialFactorDistance = v174;
  v5->_zoomPinchExponentialFactor = v175;
  v176 = 180.0;
  if (v158 > 0.0)
    v176 = v158;
  v5->_zoomPinchHybridLerpDistance = v176;
  if (v5->_frontSuperWideSupported)
  {
    v402[0] = &unk_1EA3B0C28;
    v402[1] = &unk_1EA3B0C58;
    v403[0] = &unk_1EA3B0C40;
    v403[1] = &unk_1EA3B0C40;
    v402[2] = &unk_1EA3B0C70;
    v403[2] = &unk_1EA3B0C88;
    v177 = (void *)MEMORY[0x1E0C99D80];
    v178 = (void **)v403;
    v179 = (void **)v402;
    v180 = 3;
  }
  else
  {
    if (v336 <= 1.0)
      goto LABEL_191;
    v400 = &unk_1EA3B0C28;
    v401 = &unk_1EA3B0CA0;
    v177 = (void *)MEMORY[0x1E0C99D80];
    v178 = &v401;
    v179 = &v400;
    v180 = 1;
  }
  objc_msgSend(v177, "dictionaryWithObjects:forKeys:count:", v178, v179, v180);
  v181 = objc_claimAutoreleasedReturnValue();
  FFCZoomBehaviorForCaptureMode = v5->__FFCZoomBehaviorForCaptureMode;
  v5->__FFCZoomBehaviorForCaptureMode = (NSDictionary *)v181;

LABEL_191:
  v5->__processZoomWithoutUpscaleBack = 0;
  v5->__processZoomWithoutUpscaleFront = !v5->_frontSuperWideSupported;
  v183 = AVGestaltGetBoolAnswer();
  v184 = AVGestaltGetBoolAnswer();
  v185 = (a3 & 1) == 0 && (unint64_t)a3 < 5;
  v5->_backSingleCameraPortraitModeSupported = v183;
  v5->_frontSingleCameraPortraitModeSupported = v184;
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2E) != 0)
      v5->_HDREV0CaptureSupported = 0;
    else
      v5->_HDREV0CaptureSupported = AVGestaltGetBoolAnswer();
  }
  v186 = AVGestaltGetIntegerAnswerWithDefault();
  if (v186 > 0)
    v187 = v101;
  else
    v187 = 0;
  v5->_HDR10BitVideoSupported = v187;
  if (v186 > 59)
    v188 = v101;
  else
    v188 = 0;
  v5->_HDR10BitVideoSupports60FPS = v188;
  v189 = v361;
  if (v361)
  {
    if (v186 > 119)
      v189 = v101;
    else
      v189 = 0;
  }
  v190 = off_1EA326000;
  v5->__HDR10BitVideoSupports120FPS = v189;
  v191 = AVGestaltGetBoolAnswer();
  if (v371)
    v192 = 0;
  else
    v192 = v191;
  v5->_proResVideoSupported = v192;
  v5->_proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal = v347;
  v5->_proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace = v348;
  if (v192)
  {
    v193 = (void *)MGCopyAnswer();
    objc_msgSend(v193, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CC0]);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend(v194, "unsignedLongLongValue");

    back4kMaxFPS = 60;
    v197 = 30;
    if (v195 >= 0x1DCD650001)
      v198 = 60;
    else
      v198 = 30;
    if (v195 < 0x1DCD650001)
      v197 = 0;
    if (v337)
      v198 = 60;
    v5->__proResVideoMaxFPS1080p = v198;
    if (v337)
      v197 = 60;
    v5->__proResVideoMaxFPS4k = v197;
    v5->__proResVideoExternalMaxFPS1080p = 60;
    if (v361)
      back4kMaxFPS = v5->_back4kMaxFPS;
    v5->__proResVideoExternalMaxFPS4k = back4kMaxFPS;

    v190 = off_1EA326000;
    v168 = a3 & 0xFFFFFFFFFFFFFFFBLL;
  }
  if (v185)
  {
    v5->_backPortraitModeSupported = AVGestaltGetBoolAnswer();
    v199 = AVGestaltGetBoolAnswer();
  }
  else
  {
    v199 = 0;
    v5->_backPortraitModeSupported = 0;
  }
  v5->_frontPortraitModeSupported = v199;
  v5->_portraitModeOverlappingCapturesSupported = v342;
  if ((a3 | 4) == 4)
    v200 = AVGestaltGetBoolAnswer();
  else
    v200 = 0;
  if (v5->_backCameraSupported)
    v201 = v200;
  else
    v201 = 0;
  v5->_backCinematicModeSupported = v201;
  if (v5->_frontCameraSupported)
    v202 = v200;
  else
    v202 = 0;
  v5->_frontCinematicModeSupported = v202;
  v5->_cinematicModeSupported = v201 || v202;
  if (v200)
    LOBYTE(v200) = AVGestaltGetBoolAnswer();
  v5->_cinematic4KSupported = v200;
  v203 = AVGestaltGetBoolAnswer();
  v5->_backLiveStageLightSupported = v203;
  v5->_frontLiveStageLightSupported = v203;
  v5->_hasFilteringEntitlement = v185;
  v5->_hasSystemTelephonyOfAnyKind = MGGetBoolAnswer();
  v5->_lowEndHardware = MGGetBoolAnswer();
  v5->_pipelinedStillImageProcessingSupported = AVGestaltGetBoolAnswer();
  v204 = AVGestaltGetBoolAnswer();
  v5->_portraitEffectsSupported = v204;
  if (!v204)
  {
    v5->__photoModeLightingControlSupported = 0;
    goto LABEL_244;
  }
  v205 = (((unint64_t)a3 > 5) | (0x11u >> a3)) & v170 & (v6 >= 17.0);
  v5->__photoModeLightingControlSupported = v205;
  if (v205 != 1)
  {
LABEL_244:
    v5->_portraitInPhotoModeBehavior = 0;
    goto LABEL_245;
  }
  v206 = 17;
  if ((_DWORD)v333)
    v206 = 25;
  v5->_portraitInPhotoModeBehavior = v206;
LABEL_245:
  if ((v363 & 0x8000000000000000) == 0)
  {
    v207 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
    {
      portraitInPhotoModeBehavior = (const __CFString *)v5->_portraitInPhotoModeBehavior;
      *(_DWORD *)buf = 134218240;
      v405 = portraitInPhotoModeBehavior;
      v406 = 2048;
      v407 = v363;
      _os_log_impl(&dword_1DB760000, v207, OS_LOG_TYPE_DEFAULT, "Overriding Portrait in Photo mode behavior from %lu to %lu", buf, 0x16u);
    }

    v5->_portraitInPhotoModeBehavior = v363;
  }
  v5->__frontStageLightPortaitEffectsSupported = AVGestaltGetBoolAnswer();
  v5->__backStageLightPortaitEffectsSupported = AVGestaltGetBoolAnswer();
  v209 = AVGestaltGetBoolAnswer();
  v5->_portraitEffectIntensitySupported = v209 & v170;
  portraitEffectsSupported = v5->_portraitEffectsSupported;
  if ((v5->_portraitEffectsSupported & v209) != 0)
    portraitEffectsSupported = 2;
  v5->_supportedPortraitLightingVersion = portraitEffectsSupported;
  if (v168)
    v211 = 0;
  else
    v211 = AVGestaltGetBoolAnswer();
  v5->_deferredPortraitRenderingSupported = v211;
  v212 = AVGestaltGetBoolAnswer();
  if (v168)
    v213 = 0;
  else
    v213 = v212;
  v5->_deferredProcessingSupported = v213;
  v5->_allowPortraitDescriptionOverlay = v6 < 15.0;
  v5->__rearPortraitSemanticStylesSupported = v153 | v354;
  v5->__frontPortraitSemanticStylesSupported = v153 | v354;
  v5->__rearPortraitAspectRatioSupported = v153 | BYTE4(v353);
  v5->__frontPortraitAspectRatioSupported = v153 | BYTE4(v353);
  v214 = v153 | v352;
  if (v168)
    v214 = 0;
  v215 = (a3 & 1) != 0 || (unint64_t)a3 >= 5;
  v5->_previewQualityStillImageFilteringForPhotoModeSupported = v214;
  v216 = v153 | v353;
  if (v215)
    v216 = 0;
  v5->__rearPhotoModeDepthSuggestionSupported = v216;
  v217 = v153 | BYTE4(v352);
  if (v215)
    v217 = 0;
  v5->__frontPhotoModeDepthSuggestionSupported = v217;
  v5->_captureOnTouchDown = AVGestaltGetBoolAnswer() | v95;
  v218 = AVGestaltGetBoolAnswer();
  v5->_neuralEngineSupported = v218;
  if (!v5->_backPortraitModeSupported && !v5->_frontPortraitModeSupported)
    v218 = 0;
  v5->_depthEffectApertureSupported = v218;
  v219 = (v153 | HIDWORD(v354)) == 1 && v5->_deferredProcessingSupported;
  v5->__rearPortraitDeferredProcessingSupported = v219;
  v220 = (v153 | v355) == 1 && v5->_deferredProcessingSupported;
  v5->__frontPortraitDeferredProcessingSupported = v220;
  v5->_semanticDevelopmentSupported = AVGestaltGetBoolAnswer();
  v5->_enableSemanticDevelopmentFilterDebugging = v358;
  v5->_contentAwareDistortionCorrectionSupported = AVGestaltGetBoolAnswer();
  if ((a3 | 4) == 4)
    v5->_linearDNGSupported = AVGestaltGetBoolAnswer();
  if (v95 && AVGestaltGetBoolAnswer())
  {
    v5->_semanticStylesSupport = 15;
    v221 = AVGestaltGetIntegerAnswerWithDefault();
    v222 = HIDWORD(v333);
    if (v221 > 0)
      v222 = 1;
    v223 = v222 & (v334 ^ 1);
    v5->_smartStylesSupported = v223;
    if (v223 == 1)
    {
      v224 = _os_feature_enabled_impl();
      smartStylesSupported = v5->_smartStylesSupported;
    }
    else
    {
      smartStylesSupported = 0;
      v224 = 0;
    }
    v5->__smartStylesAdditionalSystemStyleSupport = v224;
    v5->_semanticStylesVersion = smartStylesSupported;
    v226 = BYTE4(v334);
    if (!smartStylesSupported)
      v226 = 0;
    v5->_smartStylesShowExtraControls = v226;
    v5->_allowSystemSmartStylesInPicker = smartStylesSupported;
  }
  else
  {
    v5->_semanticStylesSupport = !v338 && AVGestaltGetBoolAnswer();
  }
  if ((unint64_t)a3 >= 3)
  {
    if (a3 == 3)
    {
      v227 = 1;
      goto LABEL_299;
    }
    if (a3 != 4)
    {
LABEL_296:
      v227 = 0;
      goto LABEL_299;
    }
  }
  if (v5->_semanticStylesVersion)
    goto LABEL_296;
  v227 = AVGestaltGetBoolAnswer();
LABEL_299:
  v5->_liveFilteringSupported = v227;
  v5->_videoStabilizationControlSupported = AVGestaltGetBoolAnswer();
  v5->__preferWideDualPortrait = v5->__quadraPortraitSupported;
  v228 = AVGestaltGetBoolAnswer();
  v229 = BYTE4(v355);
  if (v372 == 3)
    v229 = 1;
  v5->__wideDualPortraitLowLightSupported = v228;
  v5->_minimumMachineReadableCodeNormalizedHeight = 0.05;
  if (v168)
    v230 = 1;
  else
    v230 = !v5->_neuralEngineSupported;
  v231 = !v230;
  v5->_imageAnalysisSupported = v231;
  if (v230)
    v229 = 0;
  v5->_documentScanningSupported = v229;
  v232 = (void *)MGCopyAnswer();
  v233 = 0.0;
  if ((unint64_t)objc_msgSend(v232, "count") >= 2)
  {
    objc_msgSend(v232, "objectAtIndexedSubscript:", 1);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "doubleValue");
    v233 = v235;

  }
  objc_msgSend(v232, "objectAtIndexedSubscript:", 0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v236, "doubleValue");
  v238 = v237;

  v239 = v238 * ((double)(int)MGGetSInt32Answer() / -25.4);
  v5->_frontCameraInset = (double)(int)MGGetSInt32Answer() * 0.5 + v239;
  v241 = v233 > v238 && v232 != 0;
  v5->_frontCameraOnRightEdge = v241;
  v243 = (a3 & 1) == 0 && (unint64_t)a3 < 5;
  v5->_flashMitigationSupported = v243;
  v364 = v95;
  if (!v168)
  {
    v5->_librarySelectionMockAutomationModeEnabled = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentPeopleProximityMockAutomationMode"), CFSTR("com.apple.camera"), 0) != 0;
    v5->_librarySelectionMockLocationShiftingEnabled = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentLibrarySelectionMockLocationShiftingEnabled"), CFSTR("com.apple.camera"), 0) != 0;
    if (v6 <= 18.0)
    {
      *(_WORD *)&v5->_librarySelectionSupported = 257;
    }
    else
    {
      v250 = -[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowSharedLibraryNewHardware"));
      v5->_librarySelectionSupported = v250;
      v5->_peopleProximityDetectionSupported = v250;
      if ((v250 & 1) == 0)
        goto LABEL_390;
    }
    v275 = (NSString *)CFPreferencesCopyAppValue(CFSTR("CAMFeatureDevelopmentPeopleProximityDetectAdditionalEmail"), CFSTR("com.apple.camera"));
    peopleProximityDetectAdditionalEmail = v5->_peopleProximityDetectAdditionalEmail;
    v5->_peopleProximityDetectAdditionalEmail = v275;

    buf[0] = 0;
    v5->_peopleProximityUsesDeviceDiscovery = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentPeopleProximityUseDeviceDiscovery"), CFSTR("com.apple.camera"), buf) != 0;
    if (!buf[0] || v5->_librarySelectionMockAutomationModeEnabled)
      v5->_peopleProximityUsesDeviceDiscovery = 1;
    v277 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityInitialScanDuration"), CFSTR("com.apple.camera"), 0);
    v278 = 5;
    if (v277)
      v278 = v277;
    v5->_peopleProximityInitialScanDuration = (double)v278;
    v279 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximitySubsequentScanDuration"), CFSTR("com.apple.camera"), 0);
    v280 = 20;
    if (v279)
      v280 = v279;
    v5->_peopleProximitySubsequentScanDuration = (double)v280;
    v281 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityInitialScanRate"), CFSTR("com.apple.camera"), 0);
    v282 = 30;
    if (v281)
      v282 = v281;
    v5->_peopleProximityInitialScanRate = v282;
    v283 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximitySubsequentScanRate"), CFSTR("com.apple.camera"), 0);
    v284 = 10;
    if (v283)
      v284 = v283;
    v5->_peopleProximitySubsequentScanRate = v284;
    v5->_peopleProximityScanWaitInterval = (double)CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityScanWaitInterval"), CFSTR("com.apple.camera"), 0);
    keyExistsAndHasValidFormat = 0;
    v285 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentPeopleProximityScanIndefinitelyValue"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v286 = v285 == 0;
    else
      v286 = 1;
    v287 = !v286;
    v5->_peopleProximityScanIndefinitely = v287;
    v288 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityAutoOnResetTimeout"), CFSTR("com.apple.camera"), 0);
    v289 = (double)v288;
    if (!v288)
      v289 = 300.0;
    v5->_librarySelectionAutoOnResetTimeout = v289;
    v290 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityUserChoiceResetTimeout"), CFSTR("com.apple.camera"), 0);
    v291 = (double)v290;
    if (!v290)
      v291 = 300.0;
    v5->_librarySelectionUserChoiceResetTimeout = v291;
    v292 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximitySameLocationResetTimeout"), CFSTR("com.apple.camera"), 0);
    v293 = (double)v292;
    if (!v292)
      v293 = 3600.0;
    v5->_librarySelectionSameLocationResetTimeout = v293;
    v294 = CFPreferencesGetAppIntegerValue(CFSTR("CAMFeatureDevelopmentPeopleProximityTripResetTimeout"), CFSTR("com.apple.camera"), 0);
    v295 = (double)v294;
    if (!v294)
      v295 = 86400.0;
    v5->_librarySelectionTripResetTimeout = v295;
    v382 = 0;
    v296 = CFPreferencesGetAppBooleanValue(CFSTR("CAMFeatureDevelopmentPeopleProximityIgnoreNearbyRequirements"), CFSTR("com.apple.camera"), &v382);
    if (v382)
      v297 = v296 == 0;
    else
      v297 = 0;
    v298 = !v297;
    v5->_peopleProximityIgnoreNearbyRequirements = v298;
LABEL_390:
    v5->_peopleProximityPersistenceSupported = 0;
    v5->_frontEnhancedHEICResolutionSupported = 0;
    if (v5->_linearDNGSupported && v369)
    {
      v398 = &unk_1EA3B0C28;
      v399 = &unk_1EA3B3590;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v399, &v398, 1);
      v299 = objc_claimAutoreleasedReturnValue();
      backCameraSupportedRAWResolutionsByMode = v5->__backCameraSupportedRAWResolutionsByMode;
      v5->__backCameraSupportedRAWResolutionsByMode = (NSDictionary *)v299;

      v396 = &unk_1EA3B0C28;
      v397 = &unk_1EA3B0CB8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v397, &v396, 1);
      v301 = objc_claimAutoreleasedReturnValue();
      backCameraDefaultRAWResolutionByMode = v5->__backCameraDefaultRAWResolutionByMode;
      v5->__backCameraDefaultRAWResolutionByMode = (NSDictionary *)v301;

      v394 = &unk_1EA3B0C28;
      v395 = &unk_1EA3B35A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v395, &v394, 1);
      v303 = objc_claimAutoreleasedReturnValue();
      frontCameraSupportedRAWResolutionsByMode = v5->__frontCameraSupportedRAWResolutionsByMode;
      v5->__frontCameraSupportedRAWResolutionsByMode = (NSDictionary *)v303;

      v392 = &unk_1EA3B0C28;
      v393 = &unk_1EA3B0C70;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v393, &v392, 1);
      v305 = objc_claimAutoreleasedReturnValue();
      frontCameraDefaultRAWResolutionByMode = v5->__frontCameraDefaultRAWResolutionByMode;
      v5->__frontCameraDefaultRAWResolutionByMode = (NSDictionary *)v305;

      v244 = v6 >= 17.0 || v335;
      if (!v369)
      {
        LOBYTE(v244) = 0;
        LOBYTE(v369) = 0;
        goto LABEL_325;
      }
      LOBYTE(v369) = 1;
    }
    else
    {
      v244 = v6 >= 17.0 || v335;
      if (!v369)
      {
        LOBYTE(v244) = 0;
        goto LABEL_325;
      }
    }
    v324 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v325 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v326 = &unk_1EA3B0C70;
    if (v244)
    {
      objc_msgSend(v324, "setObject:forKeyedSubscript:", &unk_1EA3B35C0, &unk_1EA3B0CE8);
      v326 = &unk_1EA3B0CD0;
      objc_msgSend(v325, "setObject:forKeyedSubscript:", &unk_1EA3B0CD0, &unk_1EA3B0CE8);
      v327 = &unk_1EA3B35D8;
      v328 = &unk_1EA3B3608;
    }
    else
    {
      v327 = &unk_1EA3B35F0;
      v328 = &unk_1EA3B3620;
    }
    objc_msgSend(v324, "setObject:forKeyedSubscript:", v327, &unk_1EA3B0C28);
    objc_msgSend(v325, "setObject:forKeyedSubscript:", v326, &unk_1EA3B0C28);
    objc_msgSend(v324, "setObject:forKeyedSubscript:", v328, &unk_1EA3B0D00);
    objc_msgSend(v325, "setObject:forKeyedSubscript:", v326, &unk_1EA3B0D00);
    objc_storeStrong((id *)&v5->__backCameraSupportedCompressedResolutionsByMode, v324);
    objc_storeStrong((id *)&v5->__backCameraDefaultCompressedResolutionByMode, v325);
    v390 = &unk_1EA3B0C28;
    v391 = &unk_1EA3B3638;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v391, &v390, 1);
    v329 = objc_claimAutoreleasedReturnValue();
    frontCameraSupportedCompressedResolutionsByMode = v5->__frontCameraSupportedCompressedResolutionsByMode;
    v5->__frontCameraSupportedCompressedResolutionsByMode = (NSDictionary *)v329;

    v388 = &unk_1EA3B0C28;
    v389 = &unk_1EA3B0C70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v389, &v388, 1);
    v331 = objc_claimAutoreleasedReturnValue();
    frontCameraDefaultCompressedResolutionByMode = v5->__frontCameraDefaultCompressedResolutionByMode;
    v5->__frontCameraDefaultCompressedResolutionByMode = (NSDictionary *)v331;

    v190 = off_1EA326000;
    v245 = BYTE4(v339);
    v168 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    goto LABEL_326;
  }
  LOBYTE(v244) = 0;
  LOBYTE(v369) = 0;
  v5->_frontEnhancedHEICResolutionSupported = 0;
LABEL_325:
  v245 = BYTE4(v339);
LABEL_326:
  v5->_focalLengthPickerSupported = v244 & v366 | v245;
  backWideFocalLengthDisplayValue = v5->_backWideFocalLengthDisplayValue;
  if (backWideFocalLengthDisplayValue == 24)
  {
    v249 = 0;
    v248 = (NSArray *)&unk_1EA3B3668;
    v247 = v364;
  }
  else
  {
    v247 = v364;
    if (backWideFocalLengthDisplayValue == 26)
    {
      v248 = (NSArray *)&unk_1EA3B3680;
      v249 = 3;
    }
    else
    {
      v251 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
        -[CAMCaptureCapabilities initWithHostProcess:].cold.1((uint64_t)&v5->_backWideFocalLengthDisplayValue, v251, v252, v253, v254, v255, v256, v257);

      v249 = 0;
      v5->_focalLengthPickerSupported = 0;
      v248 = (NSArray *)&unk_1EA3B3650;
    }
  }
  v5->_baseFocalLengthForWideCamera = v249;
  availableCustomLenses = v5->_availableCustomLenses;
  v5->_availableCustomLenses = v248;

  if (v5->_focalLengthPickerSupported)
  {
    v367 = a3;
    v259 = v232;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v248, "count") + 1);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v260, "addObject:", &unk_1EA3B3698);
    v375 = 0u;
    v376 = 0u;
    v373 = 0u;
    v374 = 0u;
    v261 = -[NSArray countByEnumeratingWithState:objects:count:](v248, "countByEnumeratingWithState:objects:count:", &v373, v387, 16);
    if (v261)
    {
      v262 = v261;
      v263 = *(_QWORD *)v374;
      do
      {
        for (i = 0; i != v262; ++i)
        {
          if (*(_QWORD *)v374 != v263)
            objc_enumerationMutation(v248);
          v265 = *(void **)(*((_QWORD *)&v373 + 1) + 8 * i);
          if (objc_msgSend(v265, "integerValue"))
          {
            v386[0] = &unk_1EA3B0C28;
            v386[1] = v265;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v386, 2);
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v260, "addObject:", v266);

          }
        }
        v262 = -[NSArray countByEnumeratingWithState:objects:count:](v248, "countByEnumeratingWithState:objects:count:", &v373, v387, 16);
      }
      while (v262);
    }
    objc_msgSend(v260, "addObject:", v248);
    objc_storeStrong((id *)&v5->_supportedCustomLensGroups, v260);

    v190 = off_1EA326000;
    v168 = v371;
    v247 = v364;
    v232 = v259;
    a3 = v367;
  }
  AVGestaltGetFloatAnswerWithDefault();
  v267 = 0;
  v5->__maximumZoomFactorWithout24MPUpscale = v5->__backWideDualCameraSwitchOverZoomFactor * v268;
  v5->__overlapping48MPCapturesSupported = v360;
  v5->_useFullResolutionThumbnailForRAWCaptures = v369;
  if ((unint64_t)a3 > 4)
  {
    v269 = BYTE4(v359);
  }
  else
  {
    v269 = BYTE4(v359);
    if (((1 << a3) & 0x15) != 0)
      v267 = AVGestaltGetBoolAnswer();
  }
  v5->_zoomPIPSupported = v267;
  v5->__zoomPIPSupportedForSlomo = v267 & v359;
  v270 = AVGestaltGetBoolAnswer();
  v271 = _os_feature_enabled_impl();
  if (v168)
    v272 = 0;
  else
    v272 = v271;
  v5->_externalStorageSupported = v272 & v270;
  v5->_pipelinedStillImageProcessingSupported = 1;
  v273 = AVGestaltGetBoolAnswer();
  v5->_proResLogColorSpaceSupported = v273;
  if (v273)
  {
    if (v5->_back4k120VideoSupported)
      v274 = (NSArray *)&unk_1EA3B36B0;
    else
      v274 = (NSArray *)&unk_1EA3B36C8;
  }
  else
  {
    v274 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v5->_supportedProResColorSpaces = v274;
  v5->_shouldPersistPreferences = 0;
  hostProcess = v5->_hostProcess;
  if (hostProcess <= 4 && ((1 << hostProcess) & 0x13) != 0)
    v5->_shouldPersistPreferences = 1;
  v5->_actionButtonSupported = MGGetBoolAnswer();
  if ((a3 | 4) != 4)
    v269 = 0;
  v308 = CAMIsCameraButtonAvailable();
  v309 = v269 & (v308 ^ 1);
  v5->_allowHalfPressSimulation = v309;
  v5->_halfPressSupported = v269 | v308;
  v5->_halfPressOverlayInProcess = v309;
  CAMMGGetCGRectAnswer((uint64_t)CFSTR("CameraButtonNormalizedCGRect"), 0.0);
  CEKExpandNormalizedRect();
  UIRectRoundToScale();
  v5->__cameraButtonFrame.origin.x = v310;
  v5->__cameraButtonFrame.origin.y = v311;
  v5->__cameraButtonFrame.size.width = v312;
  v5->__cameraButtonFrame.size.height = v313;
  v5->_cameraButtonSupported = v5->_halfPressSupported;
  v5->_whiteBalanceLockingForVideoRecordingSupported = ((unint64_t)a3 < 5) & (0x13u >> a3);
  v5->_minimumDiskSpaceReserved = AVGestaltGetIntegerAnswerWithDefault();
  if (AVGestaltGetBoolAnswer())
  {
    if (v6 >= 18.0
      || (-[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowSpatialMode")) & 1) != 0)
    {
      v314 = 1;
    }
    else
    {
      v314 = _os_feature_enabled_impl();
    }
  }
  else
  {
    v314 = 0;
  }
  if (v168)
    v315 = 0;
  else
    v315 = v314;
  v5->_spatialModeSupported = v315;
  v5->_spatialModeTrueVideoSupported = v315;
  if (!v168
    && ((AVGestaltGetBoolAnswer() & 1) != 0
     || -[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowSpatialVideoCapture"))))
  {
    v316 = v314 ^ 1;
  }
  else
  {
    v316 = 0;
  }
  v5->_spatialVideoInVideoModeSupported = v316;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
  {
    v317 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v318 = v317;
    if (v247)
    {
      objc_msgSend(v317, "addObject:", &unk_1EA3B0C70);
      objc_msgSend(v318, "addObject:", &unk_1EA3B0D18);
    }
  }
  else
  {
    v318 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  if ((_DWORD)v339)
    objc_msgSend(v318, "addObject:", &unk_1EA3B0D30);
  objc_storeStrong((id *)&v5->__supportedModesForPauseResumeVideo, v318);
  v5->_proRawJpegXLSupported = AVGestaltGetBoolAnswer();
  v5->_backQuadraSuperWideSupported = AVGestaltGetBoolAnswer();
  if ((a3 | 4) == 4)
    v5->_shouldPreventConnectionHandover = 1;
  if ((AVGestaltGetBoolAnswer() & 1) != 0)
    v319 = 1;
  else
    v319 = -[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowCinematicAudio"));
  v5->_cinematicAudioSupported = v319;
  v5->_windRemovalSupported = AVGestaltGetBoolAnswer();
  if (v6 < 18.0 || v372 == 3)
    v320 = -[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentAllowTrueVideo"));
  else
    v320 = 1;
  v5->_trueVideoSupported = v320;
  if ((MGGetBoolAnswer() & 1) != 0)
    v321 = 1;
  else
    v321 = -[__objc2_class BOOLInCameraDomainForKey:](v190[147], "BOOLInCameraDomainForKey:", CFSTR("CAMSimulateForcedShutterSound"));
  v5->_regionalShutterSoundEnabled = v321;
  CAMSignpostWithIDAndArgs(90, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v322 = v5;

LABEL_436:
  return v5;
}

- (double)_doubleForKey:(id)a3 applicationID:(id)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = 0.0;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v5 = v6;
  }

  return v5;
}

- (BOOL)isCameraSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontCameraSupported](self, "isFrontCameraSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackCameraSupported](self, "isBackCameraSupported");
}

- (CGRect)frameForPhysicalButton:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  switch(a3)
  {
    case 1:
      -[CAMCaptureCapabilities _volumeUpButtonFrame](self, "_volumeUpButtonFrame", v3, v4, v5, v6);
      break;
    case 2:
      -[CAMCaptureCapabilities _volumeDownButtonFrame](self, "_volumeDownButtonFrame", v3, v4, v5, v6);
      break;
    case 3:
      -[CAMCaptureCapabilities _lockButtonFrame](self, "_lockButtonFrame", v3, v4, v5, v6);
      break;
    case 6:
      -[CAMCaptureCapabilities _cameraButtonFrame](self, "_cameraButtonFrame", v3, v4, v5, v6);
      break;
    default:
      break;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)mirroredFrontCapturesSupportedForMode:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isMirroredFrontCapturesSupported](self, "isMirroredFrontCapturesSupported");
  if (v5)
  {
    LOBYTE(v5) = 0;
    if ((unint64_t)a3 <= 7)
    {
      if (((1 << a3) & 0x51) != 0)
      {
        LOBYTE(v5) = 1;
      }
      else if (((1 << a3) & 0x86) != 0)
      {
        LOBYTE(v5) = -[CAMCaptureCapabilities isMirroredFrontVideosSupported](self, "isMirroredFrontVideosSupported");
      }
    }
  }
  return v5;
}

- (BOOL)isResponsiveShutterSupportedForMode:(int64_t)a3
{
  BOOL result;

  result = -[CAMCaptureCapabilities responsiveShutterSupported](self, "responsiveShutterSupported");
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    return 0;
  return result;
}

- (BOOL)isFlashSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackFlashSupported](self, "isBackFlashSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontFlashSupported](self, "isFrontFlashSupported");
}

- (BOOL)isTorchSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackTorchSupported](self, "isBackTorchSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontTorchSupported](self, "isFrontTorchSupported");
}

- (BOOL)isHDRSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackHDRSupported](self, "isBackHDRSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontHDRSupported](self, "isFrontHDRSupported");
}

- (BOOL)isHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  _BOOL4 v5;
  unsigned int v6;

  v5 = -[CAMCaptureCapabilities isHDRSupportedForDevicePosition:](self, "isHDRSupportedForDevicePosition:", a4);
  v6 = (0x251u >> a3) & 1;
  if ((unint64_t)a3 > 9)
    LOBYTE(v6) = 0;
  if (v5)
    return v6;
  else
    return 0;
}

- (BOOL)isSmartHDRSupported
{
  return -[CAMCaptureCapabilities isBackSmartHDRSupported](self, "isBackSmartHDRSupported")
      || -[CAMCaptureCapabilities isFrontSmartHDRSupported](self, "isFrontSmartHDRSupported");
}

- (BOOL)isSmartHDRSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if (!-[CAMCaptureCapabilities isHDRSupportedForMode:devicePosition:](self, "isHDRSupportedForMode:devicePosition:", a3))return 0;
  if (a4 != 1)
  {
    if (!a4)
      return -[CAMCaptureCapabilities isBackSmartHDRSupported](self, "isBackSmartHDRSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontSmartHDRSupported](self, "isFrontSmartHDRSupported");
}

- (BOOL)isHDR10BitSlomoSupportedForDevice:(int64_t)a3
{
  BOOL result;

  result = -[CAMCaptureCapabilities isHDR10BitVideoSupported](self, "isHDR10BitVideoSupported");
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 0;
  return result;
}

- (BOOL)shouldSuspendVideoHDRForHDRMode:(int64_t)a3 captureMode:(int64_t)a4
{
  _BOOL4 v6;
  BOOL v7;

  v6 = -[CAMCaptureCapabilities isSmartHDRSupported](self, "isSmartHDRSupported");
  v7 = ((1 << a4) & 0x251) != 0 && a3 == 0;
  if ((unint64_t)a4 > 9)
    v7 = 0;
  return v6 && v7;
}

- (BOOL)isTimerSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x251u >> a3);
}

- (BOOL)isLivePhotoSupported
{
  return -[CAMCaptureCapabilities isBackLivePhotoSupported](self, "isBackLivePhotoSupported")
      || -[CAMCaptureCapabilities isFrontLivePhotoSupported](self, "isFrontLivePhotoSupported");
}

- (BOOL)isLivePhotoSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackLivePhotoSupported](self, "isBackLivePhotoSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontLivePhotoSupported](self, "isFrontLivePhotoSupported");
}

- (BOOL)isLivePhotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (a3 == 9 || !a3)
      && -[CAMCaptureCapabilities isLivePhotoSupportedForDevicePosition:](self, "isLivePhotoSupportedForDevicePosition:", a4);
}

- (BOOL)isAutomaticHDRSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackAutomaticHDRSupported](self, "isBackAutomaticHDRSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontAutomaticHDRSupported](self, "isFrontAutomaticHDRSupported");
}

- (BOOL)isHDROnSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackHDROnSupported](self, "isBackHDROnSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontHDROnSupported](self, "isFrontHDROnSupported");
}

- (BOOL)isLightingControlSupportedForMode:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities arePortraitEffectsSupported](self, "arePortraitEffectsSupported");
  if (v5)
  {
    if (a3 == 6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = -[CAMCaptureCapabilities _photoModeLightingControlSupported](self, "_photoModeLightingControlSupported");
    }
  }
  return v5;
}

- (int64_t)supportedEffectSetForDevicePosition:(int64_t)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  int64_t v6;
  _BOOL4 v7;
  int64_t v8;

  if (a3 == 1)
  {
    v4 = -[CAMCaptureCapabilities _frontStageLightPortaitEffectsSupported](self, "_frontStageLightPortaitEffectsSupported");
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = -[CAMCaptureCapabilities _backStageLightPortaitEffectsSupported](self, "_backStageLightPortaitEffectsSupported");
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  v6 = -[CAMCaptureCapabilities supportedPortraitLightingVersion](self, "supportedPortraitLightingVersion");
  v7 = -[CAMCaptureCapabilities arePortraitEffectsSupported](self, "arePortraitEffectsSupported");
  v8 = 2;
  if (v6 == 2)
    v8 = 3;
  if (!v5)
    v8 = 1;
  if (v7)
    return v8;
  else
    return 0;
}

- (BOOL)isBurstSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  _BOOL4 v7;
  unint64_t v8;

  v7 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:", a4);
  if (v7)
  {
    v8 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    if ((unint64_t)(a4 - 8) < 4 || a4 == 1)
      LOBYTE(v7) = -[CAMCaptureCapabilities isFrontBurstSupported](self, "isFrontBurstSupported");
    else
      LOBYTE(v7) = -[CAMCaptureCapabilities isBackBurstSupported](self, "isBackBurstSupported");
    if (v8)
      LOBYTE(v7) = 0;
  }
  return v7;
}

- (double)captureIntervalForDevice:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureCapabilities _backCaptureInterval](self, "_backCaptureInterval");
  v7 = v6;
  -[CAMCaptureCapabilities _frontCaptureInterval](self, "_frontCaptureInterval");
  v9 = v8;
  v10 = objc_msgSend(v5, "overriddenBackCaptureInterval");
  v11 = objc_msgSend(v5, "overriddenFrontCaptureInterval");
  if ((unint64_t)a3 > 0xB || ((0xFDu >> a3) & 1) != 0)
  {
    if ((double)v10 / 1000.0 > 0.0)
      v7 = (double)v10 / 1000.0;
  }
  else if ((double)v11 / 1000.0 <= 0.0)
  {
    v7 = v9;
  }
  else
  {
    v7 = (double)v11 / 1000.0;
  }

  return v7;
}

- (BOOL)is4k24VideoSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    if ((unint64_t)(a3 - 8) < 4 || a3 == 1)
      LOBYTE(v5) = -[CAMCaptureCapabilities isFront4k24VideoSupported](self, "isFront4k24VideoSupported");
    else
      LOBYTE(v5) = -[CAMCaptureCapabilities isBack4k24VideoSupported](self, "isBack4k24VideoSupported");
  }
  return v5;
}

- (BOOL)is4k30VideoSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    if ((unint64_t)(a3 - 8) < 4 || a3 == 1)
      LOBYTE(v5) = -[CAMCaptureCapabilities isFront4k30VideoSupported](self, "isFront4k30VideoSupported");
    else
      LOBYTE(v5) = -[CAMCaptureCapabilities isBack4k30VideoSupported](self, "isBack4k30VideoSupported");
  }
  return v5;
}

- (BOOL)is1080p60VideoSupportedForDevice:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v8;
  uint64_t v10;

  if ((unint64_t)a3 > 0xA)
  {
    LOBYTE(v8) = 0;
    return v8;
  }
  v10 = v3;
  if (((1 << a3) & 0x7D) == 0)
  {
    if (((1 << a3) & 0x702) != 0)
    {
      v8 = -[CAMCaptureCapabilities front1080pMaxFPS](self, "front1080pMaxFPS");
      goto LABEL_6;
    }
    LODWORD(v8) = -[CAMCaptureCapabilities _isTripleCamera1080p60Supported](self, "_isTripleCamera1080p60Supported");
    if (!(_DWORD)v8)
      return v8;
  }
  v8 = -[CAMCaptureCapabilities back1080pMaxFPS](self, "back1080pMaxFPS", v4, v10, v5, v6);
LABEL_6:
  LOBYTE(v8) = v8 > 59;
  return v8;
}

- (BOOL)is1080p120VideoSupportedForDevice:(int64_t)a3
{
  int v5;

  v5 = _os_feature_enabled_impl();
  if ((a3 | 2) == 2)
  {
    if (v5)
      LOBYTE(v5) = -[CAMCaptureCapabilities back1080pMaxFPS](self, "back1080pMaxFPS") > 119;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)is4k60VideoSupportedForDevice:(int64_t)a3
{
  int64_t v5;

  LODWORD(v5) = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if ((_DWORD)v5)
  {
    LOBYTE(v5) = 0;
    switch(a3)
    {
      case 0:
      case 2:
      case 3:
      case 5:
        LOBYTE(v5) = -[CAMCaptureCapabilities isBack4k60VideoSupported](self, "isBack4k60VideoSupported");
        break;
      case 1:
      case 8:
      case 10:
        LOBYTE(v5) = -[CAMCaptureCapabilities isFront4k60VideoSupported](self, "isFront4k60VideoSupported");
        break;
      case 4:
        LODWORD(v5) = -[CAMCaptureCapabilities isBack4k60VideoSupported](self, "isBack4k60VideoSupported");
        if ((_DWORD)v5)
        {
          v5 = -[CAMCaptureCapabilities _backDualCameraVideoCapture4kMaxFPS](self, "_backDualCameraVideoCapture4kMaxFPS");
          goto LABEL_11;
        }
        break;
      case 6:
        LODWORD(v5) = -[CAMCaptureCapabilities isBack4k60VideoSupported](self, "isBack4k60VideoSupported");
        if ((_DWORD)v5)
        {
          v5 = -[CAMCaptureCapabilities _backWideDualCameraVideoCapture4kMaxFPS](self, "_backWideDualCameraVideoCapture4kMaxFPS");
          goto LABEL_11;
        }
        break;
      case 7:
        LODWORD(v5) = -[CAMCaptureCapabilities isBack4k60VideoSupported](self, "isBack4k60VideoSupported");
        if ((_DWORD)v5)
        {
          v5 = -[CAMCaptureCapabilities _backTripleCameraVideoCapture4kMaxFPS](self, "_backTripleCameraVideoCapture4kMaxFPS");
LABEL_11:
          LOBYTE(v5) = v5 > 59;
        }
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (BOOL)is4K120VideoSupportedForDevice:(int64_t)a3
{
  return -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
      && (a3 | 2) == 2
      && -[CAMCaptureCapabilities isBack4k120VideoSupported](self, "isBack4k120VideoSupported");
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6
{
  unsigned int v6;

  if (a5 == 2)
    return -[CAMCaptureCapabilities isProResVideoSupportedForMode:videoConfiguration:outputToExternalStorage:](self, "isProResVideoSupportedForMode:videoConfiguration:outputToExternalStorage:", a4, a3, a6);
  if (a5 == 1)
    return -[CAMCaptureCapabilities isHEVCEncodingSupported](self, "isHEVCEncodingSupported", a3, a4, 1, a6);
  v6 = ((unint64_t)a3 > 0xE) | (0x1CFFu >> a3);
  if (a5)
    LOBYTE(v6) = 0;
  return v6 & 1;
}

- (BOOL)isSupportedVideoConfiguration:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  if ((unint64_t)a3 > 0xE)
  {
    if ((unint64_t)(a3 - 10000) >= 6)
      return 0;
    goto LABEL_8;
  }
  if (((1 << a3) & 0x1F6E) != 0)
  {
LABEL_8:
    if (!a6)
      return -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:");
    return 0;
  }
  if (((1 << a3) & 0x6010) != 0 && (a6 || a7))
    return 0;
  return -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:");
}

- (BOOL)is720p240SupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBack720p240Supported](self, "isBack720p240Supported");
  return ((1 << a3) & 0x502) != 0
      && -[CAMCaptureCapabilities isFront720p240Supported](self, "isFront720p240Supported");
}

- (BOOL)_is1080p120SlomoSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBack1080p120Supported](self, "isBack1080p120Supported");
  return ((1 << a3) & 0x502) != 0
      && -[CAMCaptureCapabilities isFront1080p120Supported](self, "isFront1080p120Supported");
}

- (BOOL)is1080p240SupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isSlomoSupportedForDevice:](self, "isSlomoSupportedForDevice:")
    || (unint64_t)a3 > 0xA)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBack1080p240Supported](self, "isBack1080p240Supported");
  return ((1 << a3) & 0x502) != 0
      && -[CAMCaptureCapabilities isFront1080p240Supported](self, "isFront1080p240Supported");
}

- (BOOL)isPanoramaSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 8)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBackPanoramaSupported](self, "isBackPanoramaSupported");
  return ((1 << a3) & 0x102) != 0
      && -[CAMCaptureCapabilities isFrontPanoramaSupported](self, "isFrontPanoramaSupported");
}

- (BOOL)isTimelapseSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:")
    || (unint64_t)a3 > 8)
  {
    return 0;
  }
  if (((1 << a3) & 0x2D) != 0)
    return -[CAMCaptureCapabilities isBackTimelapseSupported](self, "isBackTimelapseSupported");
  return ((1 << a3) & 0x102) != 0
      && -[CAMCaptureCapabilities isFrontTimelapseSupported](self, "isFrontTimelapseSupported");
}

- (BOOL)isPortraitModeSupported
{
  return -[CAMCaptureCapabilities isBackPortraitModeSupported](self, "isBackPortraitModeSupported")
      || -[CAMCaptureCapabilities isFrontPortraitModeSupported](self, "isFrontPortraitModeSupported");
}

- (BOOL)isPortraitModeSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    v6 = (unint64_t)(a3 - 1) > 0xA ? 0 : qword_1DB9A75F8[a3 - 1];
    v5 = -[CAMCaptureCapabilities isPortraitModeSupportedForDevicePosition:](self, "isPortraitModeSupportedForDevicePosition:", v6);
    if (v5)
    {
      switch(a3)
      {
        case 0:
        case 1:
          LOBYTE(v5) = 1;
          break;
        case 2:
        case 3:
        case 5:
          LOBYTE(v5) = -[CAMCaptureCapabilities isBackSingleCameraPortraitModeSupported](self, "isBackSingleCameraPortraitModeSupported");
          break;
        case 4:
          v5 = -[CAMCaptureCapabilities isBackDualSupported](self, "isBackDualSupported");
          if (v5)
            goto LABEL_12;
          break;
        case 6:
          v5 = -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
          if (v5)
LABEL_12:
            LOBYTE(v5) = !-[CAMCaptureCapabilities _disablePortraitBravoDevices](self, "_disablePortraitBravoDevices");
          break;
        case 7:
          LOBYTE(v5) = -[CAMCaptureCapabilities isBackTripleCameraSupported](self, "isBackTripleCameraSupported");
          break;
        case 8:
        case 10:
          LOBYTE(v5) = -[CAMCaptureCapabilities isFrontSingleCameraPortraitModeSupported](self, "isFrontSingleCameraPortraitModeSupported");
          break;
        case 9:
          LOBYTE(v5) = -[CAMCaptureCapabilities isFrontPearlSupported](self, "isFrontPearlSupported");
          break;
        default:
          LOBYTE(v5) = 0;
          break;
      }
    }
  }
  return v5;
}

- (BOOL)isPortraitZoomSupportedForDevicePosition:(int64_t)a3
{
  _BOOL4 v5;
  BOOL v6;

  if (a3)
    return 0;
  v5 = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", 4);
  v6 = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", 6);
  return v5 && v6
      || -[CAMCaptureCapabilities continuousZoomSupportedForPortraitMode](self, "continuousZoomSupportedForPortraitMode");
}

- (BOOL)portraitZoomSupported
{
  return -[CAMCaptureCapabilities isPortraitZoomSupportedForDevicePosition:](self, "isPortraitZoomSupportedForDevicePosition:", 1)|| -[CAMCaptureCapabilities isPortraitZoomSupportedForDevicePosition:](self, "isPortraitZoomSupportedForDevicePosition:", 0);
}

- (BOOL)usePortraitFrontFacingZoomedCaptureDeviceFormat
{
  double v4;

  if (-[CAMCaptureCapabilities _disablePortraitFrontFacingZoomedCaptureDeviceFormat](self, "_disablePortraitFrontFacingZoomedCaptureDeviceFormat"))
  {
    return 0;
  }
  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", 0, 1, 0, 0);
  return v4 > 1.0;
}

- (BOOL)isAspectRatioCropSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  _BOOL4 v7;

  v7 = -[CAMCaptureCapabilities isAspectRatioCropSupported](self, "isAspectRatioCropSupported");
  if (v7)
  {
    if (a3 == 6)
    {
      if (a4)
        LOBYTE(v7) = -[CAMCaptureCapabilities _frontPortraitAspectRatioSupported](self, "_frontPortraitAspectRatioSupported");
      else
        LOBYTE(v7) = -[CAMCaptureCapabilities _rearPortraitAspectRatioSupported](self, "_rearPortraitAspectRatioSupported");
    }
    else
    {
      LOBYTE(v7) = a3 == 0;
    }
  }
  return v7;
}

- (NSArray)supportedAspectRatioCropValues
{
  if (!-[CAMCaptureCapabilities isAspectRatioCropSupported](self, "isAspectRatioCropSupported"))
    return (NSArray *)&unk_1EA3B36E0;
  if (-[CAMCaptureCapabilities _isAspectRatioCropThreeTwoSupported](self, "_isAspectRatioCropThreeTwoSupported"))
    return (NSArray *)&unk_1EA3B36F8;
  return (NSArray *)&unk_1EA3B3710;
}

- (BOOL)isCTMVideoCaptureSupportedForMode:(int64_t)a3
{
  return !a3 && -[CAMCaptureCapabilities isCTMSupported](self, "isCTMSupported");
}

- (BOOL)isTrueVideoSupportedForMode:(int64_t)a3
{
  return !a3 || a3 == 9;
}

- (BOOL)isSpatialOverCaptureSupported
{
  return -[CAMCaptureCapabilities isBackSpatialOverCaptureSupported](self, "isBackSpatialOverCaptureSupported")
      || -[CAMCaptureCapabilities isFrontSpatialOverCaptureSupported](self, "isFrontSpatialOverCaptureSupported");
}

- (unint64_t)spatialOverCaptureSupportForMode:(int64_t)a3 device:(int64_t)a4
{
  if (!-[CAMCaptureCapabilities _isSpatialOverCaptureSupportedForDevice:](self, "_isSpatialOverCaptureSupportedForDevice:", a4))return 0;
  if (a3)
  {
    if (a3 == 6)
      return -[CAMCaptureCapabilities _allowSpatialOverCaptureInPortraitMode](self, "_allowSpatialOverCaptureInPortraitMode");
    return 0;
  }
  return 3;
}

- (BOOL)_isSpatialOverCaptureSupportedForDevice:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCTMSupported](self, "isCTMSupported") || (unint64_t)a3 > 0xA)
    return 0;
  if (((1 << a3) & 0xD1) == 0)
  {
    if (((1 << a3) & 0x702) != 0)
      return -[CAMCaptureCapabilities isFrontSpatialOverCaptureSupported](self, "isFrontSpatialOverCaptureSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isBackSpatialOverCaptureSupported](self, "isBackSpatialOverCaptureSupported");
}

- (BOOL)isLowLightSupported
{
  return -[CAMCaptureCapabilities isBackLowLightSupported](self, "isBackLowLightSupported")
      || -[CAMCaptureCapabilities isFrontLowLightSupported](self, "isFrontLowLightSupported");
}

- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  BOOL result;

  if (a3 == 6)
  {
    switch(a4)
    {
      case 0:
      case 4:
      case 7:
        if (!-[CAMCaptureCapabilities isBackLowLightSupported](self, "isBackLowLightSupported"))
          return 0;
        result = -[CAMCaptureCapabilities continuousZoomSupportedForPortraitMode](self, "continuousZoomSupportedForPortraitMode");
        break;
      case 6:
        result = -[CAMCaptureCapabilities _wideDualPortraitLowLightSupported](self, "_wideDualPortraitLowLightSupported");
        break;
      default:
        return 0;
    }
  }
  else if (a3 || (unint64_t)a4 > 0xA)
  {
    return 0;
  }
  else if (((1 << a4) & 0xD5) != 0)
  {
    return -[CAMCaptureCapabilities isBackLowLightSupported](self, "isBackLowLightSupported");
  }
  else if (((1 << a4) & 0x702) != 0)
  {
    return -[CAMCaptureCapabilities isFrontLowLightSupported](self, "isFrontLowLightSupported");
  }
  else
  {
    return -[CAMCaptureCapabilities _backSuperWideTeleNightModeSupported](self, "_backSuperWideTeleNightModeSupported");
  }
  return result;
}

- (BOOL)isLowLightSupportedForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5
{
  int64_t v8;
  BOOL v9;
  uint64_t v10;
  double v11;

  v8 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, 0, 0, 0);
  v9 = -[CAMCaptureCapabilities isLowLightSupportedForMode:device:](self, "isLowLightSupportedForMode:device:", a3, v8);
  v10 = 0;
  if ((unint64_t)(v8 - 1) <= 0xA)
    v10 = qword_1DB9A75F8[v8 - 1];
  if (-[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v10))
  {
    if (v8 == 6)
    {
      -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](self, "_backWideDualCameraSwitchOverZoomFactor");
    }
    else if (v8 == 4)
    {
      -[CAMCaptureCapabilities _backDualCameraSwitchOverZoomFactor](self, "_backDualCameraSwitchOverZoomFactor");
    }
    else
    {
      v11 = 1.79769313e308;
    }
    if (v11 < a5)
      return 0;
  }
  return v9;
}

- (BOOL)isNightModeWithDepthSupportedForMode:(int64_t)a3 device:(int64_t)a4
{
  _BOOL4 v7;

  v7 = -[CAMCaptureCapabilities isLowLightSupportedForMode:device:](self, "isLowLightSupportedForMode:device:");
  if (v7)
  {
    if (a3)
      LOBYTE(v7) = a3 == 6;
    else
      LOBYTE(v7) = ((unint64_t)(a4 - 1) >= 0xB || ((0x781u >> (a4 - 1)) & 1) == 0)
                && -[CAMCaptureCapabilities _backPhotoModeNightModeDepthSupported](self, "_backPhotoModeNightModeDepthSupported");
  }
  return v7;
}

- (unint64_t)lowLightPreviewOverlayStyleForDevicePosition:(int64_t)a3 sensitiveToChangingDisplayFeedback:(BOOL)a4 sensitiveToInitialFeedback:(BOOL)a5 duration:(double)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  unint64_t result;
  BOOL v11;
  unint64_t v12;

  v7 = a5;
  v8 = a4;
  if (a3 == 1)
  {
    result = -[CAMCaptureCapabilities frontLowLightPreviewOverlayStyle](self, "frontLowLightPreviewOverlayStyle");
  }
  else if (a3)
  {
    result = 0;
  }
  else
  {
    result = -[CAMCaptureCapabilities backLowLightPreviewOverlayStyle](self, "backLowLightPreviewOverlayStyle");
  }
  v11 = a6 < 2.0 && a3 == 1;
  v12 = 3;
  if (!v11)
    v12 = 1;
  if (v7)
    v12 = 2;
  if (v8)
    v12 = 4;
  if (!result)
    return v12;
  return result;
}

- (BOOL)isSingleCameraPortraitModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontSingleCameraPortraitModeSupported](self, "isFrontSingleCameraPortraitModeSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackSingleCameraPortraitModeSupported](self, "isBackSingleCameraPortraitModeSupported");
}

- (BOOL)isTorchPatternSupportedForDevicePosition:(int64_t)a3
{
  if (!-[CAMCaptureCapabilities isCameraSupportedForDevicePosition:](self, "isCameraSupportedForDevicePosition:"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[CAMCaptureCapabilities isBackTorchPatternSupported](self, "isBackTorchPatternSupported");
    return 0;
  }
  return -[CAMCaptureCapabilities isFrontTorchPatternSupported](self, "isFrontTorchPatternSupported");
}

- (BOOL)isFlashSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (unint64_t)a3 <= 6
      && ((1 << a3) & 0x51) != 0
      && -[CAMCaptureCapabilities isFlashSupportedForDevicePosition:](self, "isFlashSupportedForDevicePosition:", a4);
}

- (BOOL)isTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return (unint64_t)a3 <= 7
      && ((1 << a3) & 0x86) != 0
      && -[CAMCaptureCapabilities isTorchSupportedForDevicePosition:](self, "isTorchSupportedForDevicePosition:", a4);
}

- (BOOL)isFlashOrTorchSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  return -[CAMCaptureCapabilities isFlashSupportedForMode:devicePosition:](self, "isFlashSupportedForMode:devicePosition:")|| -[CAMCaptureCapabilities isTorchSupportedForMode:devicePosition:](self, "isTorchSupportedForMode:devicePosition:", a3, a4);
}

- (BOOL)isAutoLowLightVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5
{
  _BOOL4 v9;
  char v10;

  v9 = -[CAMCaptureCapabilities isAutoLowLightVideoSupported](self, "isAutoLowLightVideoSupported");
  if (v9)
  {
    v9 = -[CAMCaptureCapabilities _isVariableFramerateVideoSupportedForVideoEncodingBehavior:](self, "_isVariableFramerateVideoSupportedForVideoEncodingBehavior:", a5);
    if (v9)
    {
      if ((unint64_t)(a4 - 10000) < 6 || (v10 = 0, (unint64_t)a4 <= 7) && ((1 << a4) & 0xE1) != 0)
        v10 = 1;
      if (a3 == 1)
        LOBYTE(v9) = v10;
      else
        LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_isVariableFramerateVideoSupportedForVideoEncodingBehavior:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (BOOL)isVariableFramerateVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  _BOOL8 v10;
  int v15;
  _BOOL4 v16;
  int64_t v17;
  int64_t v18;
  _BOOL4 v19;
  uint64_t v21;
  uint64_t v22;

  v10 = a6;
  v15 = -[CAMCaptureCapabilities isVariableFramerateVideoSupported](self, "isVariableFramerateVideoSupported");
  if (v15)
  {
    v16 = -[CAMCaptureCapabilities _isVariableFramerateVideoSupportedForVideoEncodingBehavior:](self, "_isVariableFramerateVideoSupportedForVideoEncodingBehavior:", a5);
    LOBYTE(v15) = 0;
    if (v16 && !a7)
    {
      if (a4)
      {
        LOBYTE(v15) = -[CAMCaptureCapabilities _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:](self, "_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:", a4);
      }
      else
      {
        LOBYTE(v21) = a8;
        v17 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](self, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, 1, a5, 0, v10, 0, v21);
        LOBYTE(v22) = a8;
        v18 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](self, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, 0, a5, 0, v10, 0, v22);
        v19 = -[CAMCaptureCapabilities _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:](self, "_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:", v17);
        v15 = v19 | -[CAMCaptureCapabilities _isVariableFramerateVideoSupportedForResolvedVideoConfiguration:](self, "_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:", v18);
      }
      if (a3 != 1)
        LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)_isVariableFramerateVideoSupportedForResolvedVideoConfiguration:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x2E2u >> a3);
}

- (int64_t)resolvedVideoConfigurationForMode:(int64_t)a3 device:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 videoConfiguration:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8 prefersHDR10BitVideo:(BOOL)a9
{
  uint64_t v9;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  BOOL v25;
  _BOOL4 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v26 = a7;
  v9 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  if (a6)
    return v9;
  if (a3 == 1)
  {
    v16 = &unk_1EA3B3758;
    v17 = &unk_1EA3B3740;
    v18 = !a8;
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 8)
        v15 = &unk_1EA3B3728;
      else
        v15 = 0;
      goto LABEL_13;
    }
    v19 = -[CAMCaptureCapabilities isBack4k120VideoSupported](self, "isBack4k120VideoSupported");
    v16 = &unk_1EA3B3788;
    v17 = &unk_1EA3B3770;
    v18 = !v19 || !a9;
  }
  if (v18)
    v15 = v16;
  else
    v15 = v17;
LABEL_13:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v20)
    return 0;
  v21 = v20;
  v22 = *(_QWORD *)v28;
LABEL_15:
  v23 = 0;
  while (1)
  {
    if (*(_QWORD *)v28 != v22)
      objc_enumerationMutation(v15);
    v9 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v23), "integerValue");
    v24 = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", v9, a3, a4);
    v25 = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:videoEncodingBehavior:outputToExternalStorage:](self, "isSupportedVideoConfiguration:forMode:videoEncodingBehavior:outputToExternalStorage:", v9, a3, a5, v26);
    if (v24 && v25)
      return v9;
    if (v21 == ++v23)
    {
      v21 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = 0;
      if (v21)
        goto LABEL_15;
      return v9;
    }
  }
}

- (int64_t)validatedVideoConfigurationForVideoConfiguration:(int64_t)a3 withBlock:(id)a4
{
  uint64_t (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(id, _QWORD))a4;
  if ((v5[2](v5, a3) & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) > 0xD)
      v6 = 0;
    else
      v6 = (void *)qword_1EA32D3A8[a3 - 1];
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "intValue");
          if ((v5[2](v5, (int)objc_msgSend(v11, "intValue")) & 1) != 0)
          {
            a3 = v12;
            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CAMCaptureCapabilities validatedVideoConfigurationForVideoConfiguration:withBlock:].cold.1(v13);

  }
LABEL_17:

  return a3;
}

- (BOOL)isAutoFPSVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  BOOL v15;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v15 = -[CAMCaptureCapabilities isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:](self, "isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:");
  return v15 | -[CAMCaptureCapabilities isVariableFramerateVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](self, "isVariableFramerateVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, a4, a5, v10, v9, v8);
}

- (BOOL)isHDR10BitVideoSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 <= 8
      && ((1 << a3) & 0x186) != 0
      && -[CAMCaptureCapabilities isHDR10BitVideoSupported](self, "isHDR10BitVideoSupported");
}

- (BOOL)isHDR10BitVideoSupportedForVideoConfiguration:(int64_t)a3 videoEncodingBehavior:(int64_t)a4
{
  _BOOL4 v7;
  unint64_t v8;

  v7 = -[CAMCaptureCapabilities isHDR10BitVideoSupported](self, "isHDR10BitVideoSupported");
  if (!v7)
    return v7;
  v8 = a4 - 1;
  if ((unint64_t)a3 <= 0xE)
  {
    if (((1 << a3) & 0x1CE1) != 0)
    {
LABEL_9:
      LOBYTE(v7) = 1;
      goto LABEL_10;
    }
    if (((1 << a3) & 0x6010) != 0)
    {
      LOBYTE(v7) = -[CAMCaptureCapabilities _HDR10BitVideoSupports120FPS](self, "_HDR10BitVideoSupports120FPS");
      goto LABEL_10;
    }
    if (((1 << a3) & 0x202) != 0)
    {
      LOBYTE(v7) = -[CAMCaptureCapabilities isHDR10BitVideoSupports60FPS](self, "isHDR10BitVideoSupports60FPS");
      goto LABEL_10;
    }
  }
  if ((unint64_t)(a3 - 10000) < 6)
    goto LABEL_9;
  LOBYTE(v7) = 0;
LABEL_10:
  if (v8 >= 2)
    LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)isProResVideoSupportedForMode:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isProResVideoSupported](self, "isProResVideoSupported");
  if (v5)
  {
    if (a3 == 7)
      LOBYTE(v5) = -[CAMCaptureCapabilities _isProResCinematicVideoSupported](self, "_isProResCinematicVideoSupported");
    else
      LOBYTE(v5) = a3 == 1;
  }
  return v5;
}

- (BOOL)isProResVideoSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 outputToExternalStorage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v8;
  int64_t v9;

  v5 = a5;
  v8 = -[CAMCaptureCapabilities isProResVideoSupportedForMode:](self, "isProResVideoSupportedForMode:", a3);
  if (v8)
  {
    if ((unint64_t)a4 > 0xE)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      if (((1 << a4) & 0x7620) != 0)
      {
        if (v5)
          v9 = -[CAMCaptureCapabilities _proResVideoExternalMaxFPS4k](self, "_proResVideoExternalMaxFPS4k");
        else
          v9 = -[CAMCaptureCapabilities _proResVideoMaxFPS4k](self, "_proResVideoMaxFPS4k");
        goto LABEL_11;
      }
      if (((1 << a4) & 0x992) != 0)
      {
        if (v5)
          v9 = -[CAMCaptureCapabilities _proResVideoExternalMaxFPS1080p](self, "_proResVideoExternalMaxFPS1080p");
        else
          v9 = -[CAMCaptureCapabilities _proResVideoMaxFPS1080p](self, "_proResVideoMaxFPS1080p");
LABEL_11:
        LOBYTE(v8) = v9 >= -[CAMCaptureCapabilities _knownFramerateForVideoConfiguration:](self, "_knownFramerateForVideoConfiguration:", a4);
        return v8;
      }
      LOBYTE(v8) = a4 == 0;
    }
  }
  return v8;
}

- (int64_t)_knownFramerateForVideoConfiguration:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
    return 0;
  else
    return qword_1DB9A7498[a3 - 1];
}

- (BOOL)isStereoAudioRecordingSupportedForMode:(int64_t)a3
{
  _BOOL4 v4;
  unsigned int v5;

  v4 = -[CAMCaptureCapabilities isStereoAudioRecordingSupported](self, "isStereoAudioRecordingSupported");
  v5 = (0x186u >> a3) & 1;
  if ((unint64_t)a3 > 8)
    LOBYTE(v5) = 0;
  if (v4)
    return v5;
  else
    return 0;
}

- (BOOL)isCinematicAudioSupportedForMode:(int64_t)a3
{
  _BOOL4 v4;
  unsigned int v5;

  v4 = -[CAMCaptureCapabilities isCinematicAudioSupported](self, "isCinematicAudioSupported");
  v5 = (0x186u >> a3) & 1;
  if ((unint64_t)a3 > 8)
    LOBYTE(v5) = 0;
  if (v4)
    return v5;
  else
    return 0;
}

- (BOOL)isVideoStabilizationControlSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoEncodingBehavior:(int64_t)a6 trueVideoEnabled:(BOOL)a7 prefersHDR10BitVideo:(BOOL)a8
{
  uint64_t v9;

  BYTE2(v9) = a8;
  BYTE1(v9) = a7;
  LOBYTE(v9) = 0;
  return -[CAMCaptureCapabilities isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:](self, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", 3, a3, a4, a5, a6, 0, v9);
}

- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 devicePosition:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  _BOOL4 v13;
  BOOL v14;
  BOOL v15;
  char v16;

  v13 = -[CAMCaptureCapabilities isVideoStabilizationControlSupported](self, "isVideoStabilizationControlSupported");
  if (v13)
  {
    v14 = 0;
    switch(a4)
    {
      case 1:
        v15 = !a6;
        if (a3)
          v15 = 0;
        v16 = a3 == 1 || v15;
        if ((unint64_t)(a3 - 2) >= 2)
          v14 = v16;
        else
          v14 = !a6 && !a7;
        break;
      case 2:
        v14 = (unint64_t)a3 <= 1 && -[CAMCaptureCapabilities back4kMaxFPS](self, "back4kMaxFPS") > 119;
        break;
      case 7:
        v14 = (unint64_t)a3 < 2;
        break;
      case 8:
        v14 = a3 == 1;
        break;
      default:
        break;
    }
    if (a5)
      LOBYTE(v13) = 0;
    else
      LOBYTE(v13) = v14;
  }
  return v13;
}

- (BOOL)isVideoStabilizationStrength:(int64_t)a3 supportedForMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoEncodingBehavior:(int64_t)a7 outputToExternalStorage:(BOOL)a8 spatialVideoEnabled:(BOOL)a9 trueVideoEnabled:(BOOL)a10 prefersHDR10BitVideo:(BOOL)a11
{
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  char v19;
  uint64_t v21;

  LOBYTE(v21) = a11;
  v15 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](self, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a4, a5, a7, a6, a8, a9, v21);
  if ((unint64_t)(a5 - 1) > 0xA)
    v16 = 0;
  else
    v16 = qword_1DB9A75F8[a5 - 1];
  v17 = -[CAMCaptureCapabilities isVideoStabilizationStrength:supportedForMode:devicePosition:spatialVideoEnabled:trueVideoEnabled:](self, "isVideoStabilizationStrength:supportedForMode:devicePosition:spatialVideoEnabled:trueVideoEnabled:", a3, a4, v16, a9, a10);
  v18 = ((1 << v15) & 0x6014) != 0 && (unint64_t)a3 < 2;
  v19 = ((1 << v15) & 0x1EE3) != 0 || v18;
  if (v15 > 0xE)
    v19 = 0;
  return v17 & v19;
}

- (BOOL)_needsForcedSingleCameraEmulationForVideoStabilizationStrength:(int64_t)a3 videoConfiguration:(int64_t)a4 mode:(int64_t)a5
{
  _BOOL4 v6;

  LOBYTE(v6) = 0;
  if (a4 > 12)
  {
    if ((unint64_t)(a4 - 13) >= 2)
      return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v6;
    goto LABEL_7;
  }
  switch(a4)
  {
    case 1:
LABEL_7:
      LOBYTE(v6) = 1;
      break;
    case 4:
      LOBYTE(v6) = a5 == 1;
      break;
    case 9:
      v6 = !-[CAMCaptureCapabilities _isActionModeAggregateDevice4k60Supported](self, "_isActionModeAggregateDevice4k60Supported", a3, 9, a5);
      break;
  }
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2 && v6;
}

- (int64_t)bytesPerMinuteForGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  char v23;
  BOOL v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  int64_t v38;
  uint64_t v40;
  uint8_t buf[4];
  const __CFString *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "mode");
  v8 = objc_msgSend(v6, "device");
  v9 = objc_msgSend(v6, "videoEncodingBehavior");
  v10 = objc_msgSend(v6, "videoConfiguration");
  v11 = objc_msgSend(v6, "enableStereoVideoCapture");
  LOBYTE(v40) = objc_msgSend(v6, "prefersHDR10BitVideo");
  v12 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](self, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", v7, v8, v9, v10, v4, v11, v40);
  v13 = objc_msgSend(v6, "videoEncodingBehavior");
  if (v13 == 2)
  {
    v15 = 0;
    v14 = 1;
  }
  else if (v13 == 1)
  {
    v14 = 0;
    v15 = 1;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = objc_msgSend(v6, "colorSpace");
  switch(v12)
  {
    case 1:
      v17 = 3300;
      v18 = 175;
      if (v15)
        v18 = 90;
      v19 = v16 == 2;
      v20 = 100;
      goto LABEL_41;
    case 2:
      v23 = 0;
      v22 = 230;
      break;
    case 3:
      v23 = 0;
      v24 = v15 == 0;
      v25 = 300;
      goto LABEL_18;
    case 4:
      v23 = 0;
      v24 = v15 == 0;
      v25 = 350;
LABEL_18:
      if (v24)
        v22 = v25;
      else
        v22 = 170;
      break;
    case 5:
      v26 = !v4;
      v27 = 5700;
      v28 = 6600;
      goto LABEL_47;
    case 6:
      v23 = 0;
      v29 = 60;
      if (v15)
        v29 = 40;
      if (v16 == 2)
        v22 = 45;
      else
        v22 = v29;
      break;
    case 7:
      v17 = 1650;
      goto LABEL_38;
    case 8:
      v23 = 0;
      v22 = 480;
      break;
    case 9:
      v27 = 11400;
      if (v4)
        v27 = 13200;
      v30 = v16 == 2;
      v31 = 400;
      v32 = 440;
      goto LABEL_52;
    case 10:
      v27 = 5280;
      if (v4)
        v27 = 5300;
      v31 = 270;
      if (v15)
        v31 = 135;
      v30 = v16 == 2;
      v32 = 150;
      goto LABEL_52;
    case 11:
      v17 = 1380;
LABEL_38:
      v18 = 130;
      if (v15)
        v18 = 60;
      v19 = v16 == 2;
      v20 = 65;
LABEL_41:
      if (v19)
        v18 = v20;
      if ((v14 & 1) != 0)
        v22 = v17;
      else
        v22 = v18;
      goto LABEL_96;
    case 12:
      v26 = !v4;
      v27 = 5470;
      v28 = 5530;
LABEL_47:
      if (!v26)
        v27 = v28;
      v31 = 350;
      if (v15)
        v31 = 170;
      v30 = v16 == 2;
      v32 = 190;
LABEL_52:
      if (v30)
        v31 = v32;
      if (v14)
        v22 = v27;
      else
        v22 = v31;
      goto LABEL_66;
    case 13:
      v33 = 670;
      if (v16 == 2)
        v33 = 730;
      v34 = v14 == 0;
      v35 = 26500;
      goto LABEL_63;
    case 14:
      v33 = 570;
      if (v16 == 2)
        v33 = 630;
      v34 = v14 == 0;
      v35 = 22100;
LABEL_63:
      if (v34)
        v22 = v33;
      else
        v22 = v35;
LABEL_66:
      v23 = v14;
      break;
    default:
      if ((unint64_t)(v12 - 10000) < 6)
      {
        v21 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "CAMStorageController: _preferredMinimumBytesForVideoConfiguration called with CAMCaptureVideoConfigurationImagePicker; preferred space amounts do not exist for these configurations.",
            buf,
            2u);
        }

      }
      v22 = 0;
      v23 = 0;
      break;
  }
  if ((v23 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
  {
    v36 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      switch(v12)
      {
        case 0:
          v37 = CFSTR("Auto");
          break;
        case 1:
          v37 = CFSTR("1080p60");
          break;
        case 2:
          v37 = CFSTR("720p120");
          break;
        case 3:
          v37 = CFSTR("720p240");
          break;
        case 4:
          v37 = CFSTR("1080p120");
          break;
        case 5:
          v37 = CFSTR("4k30");
          break;
        case 6:
          v37 = CFSTR("720p30");
          break;
        case 7:
          v37 = CFSTR("1080p30");
          break;
        case 8:
          v37 = CFSTR("1080p240");
          break;
        case 9:
          v37 = CFSTR("4k60");
          break;
        case 10:
          v37 = CFSTR("4k24");
          break;
        case 11:
          v37 = CFSTR("1080p25");
          break;
        case 12:
          v37 = CFSTR("4k25");
          break;
        case 13:
          v37 = CFSTR("4k120");
          break;
        case 14:
          v37 = CFSTR("4k100");
          break;
        default:
          switch(v12)
          {
            case 10000:
              v37 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v37 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v37 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v37 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v37 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v37 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v37 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543362;
      v42 = v37;
      _os_log_impl(&dword_1DB760000, v36, OS_LOG_TYPE_DEFAULT, "CAMCaptureCapabilities: _preferredMinimumBytesForVideoConfiguration did not account for ProRes video for %{public}@", buf, 0xCu);
    }

  }
LABEL_96:
  if (objc_msgSend(v6, "mode") == 7)
    v38 = (v22 << 20) + 3145728;
  else
    v38 = v22 << 20;

  return v38;
}

- (BOOL)isCinematicModeSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontCinematicModeSupported](self, "isFrontCinematicModeSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackCinematicModeSupported](self, "isBackCinematicModeSupported");
}

- (BOOL)isCinematicModeSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    v6 = (unint64_t)(a3 - 1) > 0xA ? 0 : qword_1DB9A75F8[a3 - 1];
    v5 = -[CAMCaptureCapabilities isCinematicModeSupportedForDevicePosition:](self, "isCinematicModeSupportedForDevicePosition:", v6);
    if (v5)
    {
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0:
        case 1:
          LOBYTE(v5) = 1;
          break;
        case 4:
          v5 = -[CAMCaptureCapabilities _backDualCameraSupportedForCinematic](self, "_backDualCameraSupportedForCinematic");
          if (v5)
            LOBYTE(v5) = -[CAMCaptureCapabilities isBackDualSupported](self, "isBackDualSupported");
          break;
        case 6:
          LOBYTE(v5) = -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
          break;
        case 7:
          LOBYTE(v5) = -[CAMCaptureCapabilities isBackTripleCameraSupported](self, "isBackTripleCameraSupported");
          break;
        case 9:
          LOBYTE(v5) = -[CAMCaptureCapabilities isFrontPearlSupported](self, "isFrontPearlSupported");
          break;
        default:
          return v5;
      }
    }
  }
  return v5;
}

- (BOOL)isSpatialVideoInVideoModeSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL v6;
  BOOL v7;

  v6 = -[CAMCaptureCapabilities isSpatialVideoCaptureSupported](self, "isSpatialVideoCaptureSupported");
  v7 = a3 == 1 && v6;
  return !a4 && v7;
}

- (BOOL)_isSpatialVideoModeSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    if ((unint64_t)(a3 - 1) > 0xA)
      v6 = 0;
    else
      v6 = qword_1DB9A75F8[a3 - 1];
    v5 = -[CAMCaptureCapabilities _isSpatialVideoSupportedForDevicePosition:](self, "_isSpatialVideoSupportedForDevicePosition:", v6);
    if (v5
      && (-[CAMCaptureCapabilities isSpatialVideoCaptureSupported](self, "isSpatialVideoCaptureSupported")
       || (v5 = -[CAMCaptureCapabilities isSpatialModeSupported](self, "isSpatialModeSupported"))))
    {
      if (a3)
        LOBYTE(v5) = a3 == 6 && -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_isSpatialVideoSupportedForDevicePosition:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)_isSpatialPhotoModeSupportedForDevice:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isCameraSupportedForDevice:](self, "isCameraSupportedForDevice:");
  if (v5)
  {
    v5 = -[CAMCaptureCapabilities isSpatialModeSupported](self, "isSpatialModeSupported");
    if (v5)
    {
      if (a3)
        LOBYTE(v5) = a3 == 6 && -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_isSpatialPhotoSupportedForDevicePosition:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)isWideSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontCameraSupported](self, "isFrontCameraSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackCameraSupported](self, "isBackCameraSupported");
}

- (BOOL)isWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  _BOOL4 v9;
  uint64_t v10;

  v9 = -[CAMCaptureCapabilities isWideSupportedForDevicePosition:](self, "isWideSupportedForDevicePosition:", a4);
  if (v9)
  {
    if (a4)
      v10 = 8 * (a4 == 1);
    else
      v10 = 2;
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
      case 5:
        LOBYTE(v9) = 1;
        break;
      case 1:
      case 2:
        LOBYTE(v9) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, v10);
        break;
      case 6:
        LOBYTE(v9) = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", v10);
        break;
      case 7:
        LOBYTE(v9) = -[CAMCaptureCapabilities isCinematicModeSupportedForDevice:](self, "isCinematicModeSupportedForDevice:", v10);
        break;
      case 8:
        LOBYTE(v9) = -[CAMCaptureCapabilities _isSpatialVideoModeSupportedForDevice:](self, "_isSpatialVideoModeSupportedForDevice:", v10);
        break;
      case 9:
        LOBYTE(v9) = -[CAMCaptureCapabilities _isSpatialPhotoModeSupportedForDevice:](self, "_isSpatialPhotoModeSupportedForDevice:", v10);
        break;
      default:
        LOBYTE(v9) = 0;
        break;
    }
  }
  return v9;
}

- (BOOL)isTelephotoSupported
{
  return -[CAMCaptureCapabilities isBackTelephotoSupported](self, "isBackTelephotoSupported")
      || -[CAMCaptureCapabilities isFrontTelephotoSupported](self, "isFrontTelephotoSupported");
}

- (BOOL)isTelephotoSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  _BOOL4 v9;
  uint64_t v10;

  v9 = -[CAMCaptureCapabilities isTelephotoSupportedForDevicePosition:](self, "isTelephotoSupportedForDevicePosition:", a4);
  if (v9)
  {
    if (a4 == 1)
    {
LABEL_8:
      LOBYTE(v9) = 0;
    }
    else
    {
      if (a4)
        v10 = 0;
      else
        v10 = 3;
      switch(a3)
      {
        case 0:
        case 3:
        case 4:
        case 5:
          LOBYTE(v9) = 1;
          break;
        case 1:
        case 2:
        case 8:
          LOBYTE(v9) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, v10);
          break;
        case 6:
          LOBYTE(v9) = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", v10);
          break;
        case 7:
          LOBYTE(v9) = -[CAMCaptureCapabilities isCinematicModeSupportedForDevice:](self, "isCinematicModeSupportedForDevice:", v10);
          break;
        case 9:
          LOBYTE(v9) = -[CAMCaptureCapabilities _isSpatialPhotoModeSupportedForDevice:](self, "_isSpatialPhotoModeSupportedForDevice:", v10);
          break;
        default:
          goto LABEL_8;
      }
    }
  }
  return v9;
}

- (BOOL)shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  return -[CAMCaptureCapabilities _shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "_shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, 0);
}

- (BOOL)_shouldAllowCameraToggleForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  int64_t v11;
  int64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  BOOL v16;

  if (!-[CAMCaptureCapabilities _forcedBackCamera](self, "_forcedBackCamera")
    || (v11 = -[CAMCaptureCapabilities preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6, 0), v12 = -[CAMCaptureCapabilities _forcedBackCamera](self, "_forcedBackCamera"), LOBYTE(v13) = 0, v11 != v12))
  {
    if (-[CAMCaptureCapabilities isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, a6))
    {
LABEL_4:
      LOBYTE(v13) = 0;
      return v13;
    }
    v14 = -[CAMCaptureCapabilities isDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, a6);
    v15 = -[CAMCaptureCapabilities isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, a6);
    if (v14 && v15)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    if (!v15)
    {
      if (!v14)
      {
        v16 = -[CAMCaptureCapabilities isTelephotoSupportedForMode:devicePosition:videoConfiguration:](self, "isTelephotoSupportedForMode:devicePosition:videoConfiguration:", a3, a4, a5);
        LOBYTE(v13) = v16 | -[CAMCaptureCapabilities isSuperWideSupportedForMode:devicePosition:videoConfiguration:](self, "isSuperWideSupportedForMode:devicePosition:videoConfiguration:", a3, a4, a5);
        return v13;
      }
      goto LABEL_4;
    }
    v13 = -[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, a4, a5);
    if (v13)
      LOBYTE(v13) = !+[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", a3, 6, a5, a6, 0, 0);
  }
  return v13;
}

- (BOOL)isDualSupported
{
  return -[CAMCaptureCapabilities isBackDualSupported](self, "isBackDualSupported")
      || -[CAMCaptureCapabilities isFrontDualSupported](self, "isFrontDualSupported");
}

- (BOOL)isDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  _BOOL4 v11;

  v11 = -[CAMCaptureCapabilities isDualSupportedForDevicePosition:](self, "isDualSupportedForDevicePosition:", a4);
  if (v11)
  {
    if (-[CAMCaptureCapabilities _needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:](self, "_needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:", a6, a5, a3)|| -[CAMCaptureCapabilities featureDevelopmentForceSingleCamera](self, "featureDevelopmentForceSingleCamera"))
    {
LABEL_4:
      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 0;
      switch(a3)
      {
        case 0:
        case 4:
          goto LABEL_13;
        case 1:
        case 2:
        case 8:
          if (a4)
            goto LABEL_4;
          LOBYTE(v11) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, 4);
          return v11;
        case 6:
          LOBYTE(v11) = !-[CAMCaptureCapabilities _disablePortraitBravoDevices](self, "_disablePortraitBravoDevices");
          return v11;
        case 7:
          if (a4 == 1)
          {
LABEL_13:
            LOBYTE(v11) = 1;
          }
          else
          {
            if (a4)
              goto LABEL_4;
            LOBYTE(v11) = -[CAMCaptureCapabilities _backDualCameraSupportedForCinematic](self, "_backDualCameraSupportedForCinematic");
          }
          break;
        case 9:
          LOBYTE(v11) = -[CAMCaptureCapabilities _isSpatialPhotoModeSupportedForDevice:](self, "_isSpatialPhotoModeSupportedForDevice:", 4);
          return v11;
        default:
          return v11;
      }
    }
  }
  return v11;
}

- (double)wideToTelephotoZoomFactorForDevicePosition:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[CAMCaptureCapabilities _frontDualCameraSwitchOverZoomFactor](self, "_frontDualCameraSwitchOverZoomFactor");
  }
  else if (a3)
  {
    return 1.0;
  }
  else
  {
    -[CAMCaptureCapabilities _backDualCameraSwitchOverZoomFactor](self, "_backDualCameraSwitchOverZoomFactor");
  }
  return result;
}

- (BOOL)isSuperWideSupported
{
  return -[CAMCaptureCapabilities isBackSuperWideSupported](self, "isBackSuperWideSupported")
      || -[CAMCaptureCapabilities isFrontSuperWideSupported](self, "isFrontSuperWideSupported");
}

- (BOOL)isSuperWideSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontSuperWideSupported](self, "isFrontSuperWideSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackSuperWideSupported](self, "isBackSuperWideSupported");
}

- (BOOL)isSuperWideSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;

  v9 = -[CAMCaptureCapabilities isSuperWideSupportedForDevicePosition:](self, "isSuperWideSupportedForDevicePosition:", a4);
  if (v9)
  {
    v10 = 10;
    if (a4 != 1)
      v10 = 0;
    if (a4)
      v11 = v10;
    else
      v11 = 5;
    switch(a3)
    {
      case 0:
      case 4:
        LOBYTE(v9) = 1;
        break;
      case 1:
      case 2:
      case 8:
        LOBYTE(v9) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, v11);
        break;
      case 3:
        LOBYTE(v9) = !-[CAMCaptureCapabilities _isiPad](self, "_isiPad");
        break;
      case 5:
        LOBYTE(v9) = -[CAMCaptureCapabilities isTimelapseSupportedForDevice:](self, "isTimelapseSupportedForDevice:", v11);
        break;
      case 6:
      case 7:
        LOBYTE(v9) = -[CAMCaptureCapabilities isPortraitModeSupportedForDevice:](self, "isPortraitModeSupportedForDevice:", v11);
        break;
      case 9:
        LOBYTE(v9) = -[CAMCaptureCapabilities _isSpatialPhotoModeSupportedForDevice:](self, "_isSpatialPhotoModeSupportedForDevice:", v11);
        break;
      default:
        LOBYTE(v9) = 0;
        break;
    }
  }
  return v9;
}

- (BOOL)isSuperWideAutoMacroSupportedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  int64_t v10;
  _BOOL4 v11;
  BOOL v12;

  v10 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6);
  v11 = -[CAMCaptureCapabilities isSuperWideAutoMacroSupported](self, "isSuperWideAutoMacroSupported");
  v12 = !a7;
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) != 6)
    v12 = 0;
  if (!v11)
    v12 = 0;
  return (unint64_t)a3 <= 1 && v12;
}

- (BOOL)isWideDualSupported
{
  return -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported")
      || -[CAMCaptureCapabilities isFrontWideDualSupported](self, "isFrontWideDualSupported");
}

- (BOOL)isWideDualSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontWideDualSupported](self, "isFrontWideDualSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackWideDualSupported](self, "isBackWideDualSupported");
}

- (BOOL)isWideDualSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  _BOOL4 v11;

  v11 = -[CAMCaptureCapabilities isWideDualSupportedForDevicePosition:](self, "isWideDualSupportedForDevicePosition:", a4);
  if (v11)
  {
    if (-[CAMCaptureCapabilities _needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:](self, "_needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:", a6, a5, a3)|| -[CAMCaptureCapabilities featureDevelopmentForceSingleCamera](self, "featureDevelopmentForceSingleCamera"))
    {
      goto LABEL_4;
    }
    LOBYTE(v11) = 0;
    if ((unint64_t)a3 > 9)
      return v11;
    if (((1 << a3) & 0x291) != 0)
    {
      LOBYTE(v11) = 1;
    }
    else if (((1 << a3) & 0x106) != 0)
    {
      if (a4)
      {
LABEL_4:
        LOBYTE(v11) = 0;
        return v11;
      }
      LOBYTE(v11) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, 6);
    }
    else if (a3 == 6)
    {
      LOBYTE(v11) = !-[CAMCaptureCapabilities _disablePortraitBravoDevices](self, "_disablePortraitBravoDevices");
    }
  }
  return v11;
}

- (double)superWideToWideZoomFactorForDevicePosition:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[CAMCaptureCapabilities _frontWideDualCameraSwitchOverZoomFactor](self, "_frontWideDualCameraSwitchOverZoomFactor");
  }
  else if (a3)
  {
    return 1.0;
  }
  else
  {
    -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](self, "_backWideDualCameraSwitchOverZoomFactor");
  }
  return result;
}

- (BOOL)isDualDeviceDisparitySupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6)
    return 0;
  if (-[CAMCaptureCapabilities isDualSupported](self, "isDualSupported"))
    return 1;
  return -[CAMCaptureCapabilities isWideDualSupported](self, "isWideDualSupported");
}

- (BOOL)isTripleCameraSupported
{
  return -[CAMCaptureCapabilities isBackTripleCameraSupported](self, "isBackTripleCameraSupported")
      || -[CAMCaptureCapabilities isFrontTripleCameraSupported](self, "isFrontTripleCameraSupported");
}

- (BOOL)isTripleCameraSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontTripleCameraSupported](self, "isFrontTripleCameraSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackTripleCameraSupported](self, "isBackTripleCameraSupported");
}

- (BOOL)isTripleCameraSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  _BOOL4 v11;

  v11 = -[CAMCaptureCapabilities isTripleCameraSupportedForDevicePosition:](self, "isTripleCameraSupportedForDevicePosition:", a4);
  if (!v11)
    return v11;
  if (-[CAMCaptureCapabilities _needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:](self, "_needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:", a6, a5, a3)|| -[CAMCaptureCapabilities featureDevelopmentForceSingleCamera](self, "featureDevelopmentForceSingleCamera")|| -[CAMCaptureCapabilities _disableSuperBravoDevice](self, "_disableSuperBravoDevice"))
  {
LABEL_10:
    LOBYTE(v11) = 0;
    return v11;
  }
  LOBYTE(v11) = 0;
  if ((unint64_t)a3 > 8)
    return v11;
  if (((1 << a3) & 0x106) != 0)
  {
    if (!a4)
    {
      LOBYTE(v11) = -[CAMCaptureCapabilities isSupportedVideoConfiguration:forMode:device:](self, "isSupportedVideoConfiguration:forMode:device:", a5, a3, 7);
      return v11;
    }
    goto LABEL_10;
  }
  if (((1 << a3) & 0x11) != 0)
  {
    LOBYTE(v11) = 1;
  }
  else if (a3 == 6)
  {
    LOBYTE(v11) = -[CAMCaptureCapabilities continuousZoomSupportedForPortraitMode](self, "continuousZoomSupportedForPortraitMode");
  }
  return v11;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)tripleCameraSwitchOverZoomFactorsForDevicePosition:(int64_t)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v5 = -[CAMCaptureCapabilities isTripleCameraSupportedForDevicePosition:](self, "isTripleCameraSupportedForDevicePosition:");
  v6 = 1.0;
  if (v5)
  {
    if (a3 == 1)
    {
      -[CAMCaptureCapabilities _frontWideDualCameraSwitchOverZoomFactor](self, "_frontWideDualCameraSwitchOverZoomFactor");
      v7 = v10;
      -[CAMCaptureCapabilities _frontDualCameraSwitchOverZoomFactor](self, "_frontDualCameraSwitchOverZoomFactor");
      goto LABEL_7;
    }
    v7 = 1.0;
    if (!a3)
    {
      -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](self, "_backWideDualCameraSwitchOverZoomFactor");
      v7 = v8;
      -[CAMCaptureCapabilities _backDualCameraSwitchOverZoomFactor](self, "_backDualCameraSwitchOverZoomFactor");
LABEL_7:
      v6 = v7 * v9;
    }
  }
  else
  {
    v7 = 1.0;
  }
  v11 = v7;
  result.var1 = v6;
  result.var0 = v11;
  return result;
}

- (BOOL)isQuadraWideSupported
{
  return -[CAMCaptureCapabilities isBackQuadraWideSupported](self, "isBackQuadraWideSupported")
      || -[CAMCaptureCapabilities isFrontQuadraWideSupported](self, "isFrontQuadraWideSupported");
}

- (BOOL)isQuadraWideBinningReconfigurationSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  BOOL v8;
  BOOL v9;
  _BOOL4 v10;

  if (a4 == 1)
  {
    v8 = -[CAMCaptureCapabilities isFrontQuadraWideSupported](self, "isFrontQuadraWideSupported");
    goto LABEL_5;
  }
  if (!a4)
  {
    v8 = -[CAMCaptureCapabilities isBackQuadraWideSupported](self, "isBackQuadraWideSupported");
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  LOBYTE(v10) = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 5:
      LOBYTE(v10) = -[CAMCaptureCapabilities isQuadraWideSupported](self, "isQuadraWideSupported");
      break;
    case 2:
      LOBYTE(v10) = 0;
      if ((unint64_t)a5 <= 0xE && ((1 << a5) & 0x6010) != 0)
      {
        v10 = -[CAMCaptureCapabilities isBackQuadraWideSupported](self, "isBackQuadraWideSupported");
        if (v10)
          LOBYTE(v10) = -[CAMCaptureCapabilities isBack4k120VideoSupported](self, "isBack4k120VideoSupported");
      }
      break;
    case 6:
      LOBYTE(v10) = -[CAMCaptureCapabilities _isQuadraPortraitSupported](self, "_isQuadraPortraitSupported");
      break;
    case 7:
      LOBYTE(v10) = -[CAMCaptureCapabilities continuousZoomSupportedForCinematicMode](self, "continuousZoomSupportedForCinematicMode");
      break;
    default:
      return v10 && v9;
  }
  return v10 && v9;
}

- (int64_t)defaultPhotoResolutionForMode:(int64_t)a3 devicePosition:(int64_t)a4 encodingBehavior:(int64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  if ((unint64_t)a5 < 2)
  {
    if (a4)
      -[CAMCaptureCapabilities _frontCameraDefaultCompressedResolutionByMode](self, "_frontCameraDefaultCompressedResolutionByMode");
    else
      -[CAMCaptureCapabilities _backCameraDefaultCompressedResolutionByMode](self, "_backCameraDefaultCompressedResolutionByMode");
LABEL_4:
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    goto LABEL_11;
  }
  if (a5 == 2)
  {
    if (a4)
      -[CAMCaptureCapabilities _frontCameraDefaultRAWResolutionByMode](self, "_frontCameraDefaultRAWResolutionByMode");
    else
      -[CAMCaptureCapabilities _backCameraDefaultRAWResolutionByMode](self, "_backCameraDefaultRAWResolutionByMode");
    goto LABEL_4;
  }
  v7 = 0;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "integerValue");
  else
    v10 = 0;

  return v10;
}

- (BOOL)isPearlSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontPearlSupported](self, "isFrontPearlSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities isBackPearlSupported](self, "isBackPearlSupported");
}

- (BOOL)isPearlSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  _BOOL4 v6;

  v6 = -[CAMCaptureCapabilities isPearlSupportedForDevicePosition:](self, "isPearlSupportedForDevicePosition:", a4);
  if (v6)
  {
    if ((unint64_t)(a3 - 6) >= 2)
    {
      if (a3)
        LOBYTE(v6) = 0;
      else
        LOBYTE(v6) = -[CAMCaptureCapabilities _frontPhotoModeDepthSuggestionSupported](self, "_frontPhotoModeDepthSuggestionSupported");
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (int64_t)fallbackPrimaryConstituentDeviceSelectionForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 macroMode:(int64_t)a7 spatialVideoEnabled:(BOOL)a8
{
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int64_t v17;
  _BOOL4 v18;

  if ((unint64_t)(a4 - 1) > 0xA)
    v14 = 0;
  else
    v14 = qword_1DB9A75F8[a4 - 1];
  v15 = -[CAMCaptureCapabilities isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a3);
  v16 = -[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v14);
  if (a8)
  {
    v17 = 0;
  }
  else if (v15)
  {
    v17 = 1;
    if (!a7)
      v17 = 2;
  }
  else if (v16)
  {
    v18 = -[CAMCaptureCapabilities isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v14, a5, a6);
    v17 = 2;
    if (!v18)
      v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8)
    return 0;
  else
    return v17;
}

- (BOOL)isTimeOfFlightSupported
{
  return -[CAMCaptureCapabilities isFrontTimeOfFlightSupported](self, "isFrontTimeOfFlightSupported")
      || -[CAMCaptureCapabilities isBackTimeOfFlightSupported](self, "isBackTimeOfFlightSupported");
}

- (BOOL)isTimeOfFlightSupportedForDevicePosition:(int64_t)a3
{
  if (!a3)
    return -[CAMCaptureCapabilities isBackTimeOfFlightSupported](self, "isBackTimeOfFlightSupported");
  if (a3 == 1)
    return -[CAMCaptureCapabilities isFrontTimeOfFlightSupported](self, "isFrontTimeOfFlightSupported");
  return 0;
}

- (BOOL)isDepthEffectApertureSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  if ((unint64_t)(a3 - 6) < 2)
    return -[CAMCaptureCapabilities isDepthEffectApertureSupported](self, "isDepthEffectApertureSupported");
  if (a3)
    return 0;
  if (a4)
    return -[CAMCaptureCapabilities _frontPhotoModeDepthSuggestionSupported](self, "_frontPhotoModeDepthSuggestionSupported");
  return -[CAMCaptureCapabilities _rearPhotoModeDepthSuggestionSupported](self, "_rearPhotoModeDepthSuggestionSupported");
}

- (BOOL)photoModeDepthSuggestionSupported
{
  return -[CAMCaptureCapabilities isPhotoModeDepthSuggestionSupportedForDevicePosition:](self, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", 0)|| -[CAMCaptureCapabilities isPhotoModeDepthSuggestionSupportedForDevicePosition:](self, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", 1);
}

- (BOOL)isPhotoModeDepthSuggestionSupportedForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities _frontPhotoModeDepthSuggestionSupported](self, "_frontPhotoModeDepthSuggestionSupported");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities _rearPhotoModeDepthSuggestionSupported](self, "_rearPhotoModeDepthSuggestionSupported");
}

- (BOOL)isDepthSuggestionSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5
{
  int64_t var1;
  int64_t var0;
  BOOL v9;
  BOOL v10;
  BOOL v11;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = -[CAMCaptureCapabilities isPhotoModeDepthSuggestionSupportedForDevicePosition:](self, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", a4);
  v10 = -[CAMCaptureCapabilities isDepthEffectApertureSupportedForPhotoFormat:](self, "isDepthEffectApertureSupportedForPhotoFormat:", var0, var1);
  if (a3)
    v11 = 0;
  else
    v11 = v9;
  return v11 && v10;
}

- (BOOL)isDepthEffectApertureSupportedForPhotoFormat:(id)a3
{
  return a3.var0 < 2uLL && a3.var1 < 3uLL;
}

- (double)minimumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4
{
  _BOOL4 v5;
  double result;

  v5 = -[CAMCaptureCapabilities isDepthEffectApertureSupported](self, "isDepthEffectApertureSupported", a3, a4);
  result = 1.4;
  if (a3 == 7)
    result = 2.0;
  if (!v5)
    return 0.0;
  return result;
}

- (double)maximumDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4
{
  _BOOL4 v4;
  double result;

  v4 = -[CAMCaptureCapabilities isDepthEffectApertureSupported](self, "isDepthEffectApertureSupported", a3, a4);
  result = 0.0;
  if (v4)
    return 16.0;
  return result;
}

- (double)defaultDepthEffectApertureForMode:(int64_t)a3 device:(int64_t)a4 zoomFactor:(double)a5
{
  int64_t v9;
  double v10;
  uint64_t v11;
  _BOOL4 v12;
  double result;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  unsigned __int8 v24;

  v9 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 0xA)
  {
    v11 = 0;
    v10 = 2.8;
  }
  else
  {
    v10 = dbl_1DB9A7508[v9];
    v11 = qword_1DB9A75F8[v9];
  }
  v12 = -[CAMCaptureCapabilities isDepthEffectApertureSupportedForMode:devicePosition:](self, "isDepthEffectApertureSupportedForMode:devicePosition:", a3, v11);
  result = 0.0;
  if (v12)
  {
    v14 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, 0, 0, 0, 0.0);
    v15 = 0.0;
    if (v14 <= 0xB)
    {
      v16 = v14;
      if (((1 << v14) & 0xB10) != 0)
      {
        v15 = 4.5;
      }
      else if (((1 << v14) & 0xC0) != 0)
      {
        +[CAMZoomControlUtilities zoomScaleFromDevice:toDevice:](CAMZoomControlUtilities, "zoomScaleFromDevice:toDevice:", 2, v14);
        v18 = v17;
        -[CAMCaptureCapabilities quadraWideRelativeZoomFactor](self, "quadraWideRelativeZoomFactor");
        v20 = v18 * v19;
        if (-[CAMCaptureCapabilities continuousZoomSupportedForPortraitMode](self, "continuousZoomSupportedForPortraitMode")|| -[CAMCaptureCapabilities isPhotoModeDepthSuggestionSupportedForDevicePosition:](self, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", v11))
        {
          CEKProgressClamped();
          CEKInterpolateClamped();
          objc_msgSend(MEMORY[0x1E0D0D020], "closestValidValueForAperture:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v15 = v22;
        }
        else
        {
          -[CAMCaptureCapabilities significantZoomFactorsForMode:device:](self, "significantZoomFactorsForMode:device:", a3, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "containsObject:", v23);

          if ((v24 & (v20 == a5)) != 0)
            v15 = 4.5;
          else
            v15 = 2.8;
        }

      }
      else if (v14 == 2)
      {
        v15 = 2.8;
      }
    }
    if (((a3 == 7) & -[CAMCaptureCapabilities continuousZoomSupportedForCinematicMode](self, "continuousZoomSupportedForCinematicMode")) != 0)return v10;
    else
      return v15;
  }
  return result;
}

- (double)minimumPortraitEffectIntensity
{
  return 0.0;
}

- (double)maximumPortraitEffectIntensity
{
  _BOOL4 v2;
  double result;

  v2 = -[CAMCaptureCapabilities isPortraitEffectIntensitySupported](self, "isPortraitEffectIntensitySupported");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (double)defaultPortraitEffectIntensity
{
  _BOOL4 v2;
  double result;

  v2 = -[CAMCaptureCapabilities isPortraitEffectIntensitySupported](self, "isPortraitEffectIntensitySupported");
  result = 0.0;
  if (v2)
    return 0.5;
  return result;
}

- (BOOL)isPortraitEffectIntensitySupportedForLightingType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) <= 4
      && -[CAMCaptureCapabilities isPortraitEffectIntensitySupported](self, "isPortraitEffectIntensitySupported");
}

- (BOOL)isPortraitEffectIntensitySupportedForMode:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities isPortraitEffectIntensitySupported](self, "isPortraitEffectIntensitySupported");
  if (v5)
    LOBYTE(v5) = -[CAMCaptureCapabilities isLightingControlSupportedForMode:](self, "isLightingControlSupportedForMode:", a3);
  return v5;
}

- (BOOL)isTapAndBiasSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x377u >> a3);
}

- (BOOL)isExposureSliderSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 <= 9
      && ((1 << a3) & 0x3E7) != 0
      && -[CAMCaptureCapabilities isExposureSliderSupported](self, "isExposureSliderSupported");
}

- (BOOL)isTapToExposeSupportedForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x37Fu >> a3);
}

- (BOOL)isExposureClippingIndicatorSupportedForMode:(int64_t)a3 videoConfiguration:(int64_t)a4
{
  _BOOL4 v7;
  BOOL v8;

  v7 = -[CAMCaptureCapabilities isExposureSliderSupportedForMode:](self, "isExposureSliderSupportedForMode:");
  if (v7)
  {
    if (-[CAMCaptureCapabilities _forceDisableExposureClippingIndicator](self, "_forceDisableExposureClippingIndicator"))
    {
      LOBYTE(v7) = 0;
    }
    else if (-[CAMCaptureCapabilities _forceEnableExposureClippingIndicator](self, "_forceEnableExposureClippingIndicator"))
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v8 = (unint64_t)a4 <= 0xC && ((1 << a4) & 0x1CE1) != 0 || (unint64_t)(a4 - 10000) < 6;
      LOBYTE(v7) = ((unint64_t)a3 < 0xA) & (0x3F3u >> a3) & v8;
    }
  }
  return v7;
}

- (BOOL)isImageAnalysisSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  BOOL result;

  result = -[CAMCaptureCapabilities isImageAnalysisSupported](self, "isImageAnalysisSupported");
  if (a3 & 0xFFFFFFFFFFFFFFFBLL | a4)
    return 0;
  return result;
}

- (BOOL)isSemanticDevelopmentSupportedForMode:(int64_t)a3
{
  void *v4;
  char v5;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "semanticDevelopmentSupported");

  return *(_DWORD *)&v5 & ((unint64_t)a3 < 7) & (0x51u >> a3);
}

- (BOOL)isZoomPlatterSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4 videoConfiguration:(int64_t)a5
{
  _BOOL4 v9;
  BOOL result;

  v9 = -[CAMCaptureCapabilities isZoomPlatterSupported](self, "isZoomPlatterSupported");
  result = 0;
  if (!a4 && v9)
  {
    if ((unint64_t)a3 > 9)
      return 0;
    else
      return a3 != 6
          || -[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", 6, 0, a5);
  }
  return result;
}

- (BOOL)isZoomAllowedForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  double v6;

  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", a3, a4, a5, a6);
  return v6 > 1.0;
}

- (unint64_t)frontZoomBehaviorForCaptureMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[CAMCaptureCapabilities _FFCZoomBehaviorForCaptureMode](self, "_FFCZoomBehaviorForCaptureMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldAdjustZoomOnOrientationChangeForDevicePosition:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return !-[CAMCaptureCapabilities _isiPad](self, "_isiPad", v3, v4);
  else
    return 0;
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  double result;

  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:", a3, a4, a5, a6, 1);
  return result;
}

- (double)maximumZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 shouldResolveDevice:(BOOL)a7
{
  unint64_t v7;
  int v10;
  uint64_t v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unsigned int v16;
  double v17;
  char v18;
  double v19;
  double v20;
  double v21;

  v7 = a4;
  if ((unint64_t)(a4 - 8) >= 3 && a4 != 11 && a4 != 1)
  {
    v11 = 0;
    v10 = 1;
    if (!a7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  v11 = 1;
  if (a7)
LABEL_5:
    v7 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6, 0);
LABEL_6:
  if (!-[CAMCaptureCapabilities _forcedBackCamera](self, "_forcedBackCamera")
    || v7 != -[CAMCaptureCapabilities _forcedBackCamera](self, "_forcedBackCamera")
    || (v12 = 1.0, -[CAMCaptureCapabilities _allowZoomWithForcedBackCamera](self, "_allowZoomWithForcedBackCamera")))
  {
    v13 = v7 == 7;
    if (v7 <= 7)
    {
      v14 = v7 == 4;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    v15 = v7 <= 7 && v7 == 6;
    if (v7 <= 7)
      v16 = (0xF7u >> v7) & 1;
    else
      LOBYTE(v16) = 1;
    v12 = 1.0;
    switch(a3)
    {
      case 0:
      case 4:
        if (v13)
        {
          if (v10)
            -[CAMCaptureCapabilities _backTripleCameraPhotoModeMaximumZoomFactor](self, "_backTripleCameraPhotoModeMaximumZoomFactor");
          else
            -[CAMCaptureCapabilities _frontTripleCameraPhotoModeMaximumZoomFactor](self, "_frontTripleCameraPhotoModeMaximumZoomFactor");
        }
        else if (v14 || v15)
        {
          if (v10)
            -[CAMCaptureCapabilities _backDualPhotoModeMaximumZoomFactor](self, "_backDualPhotoModeMaximumZoomFactor");
          else
            -[CAMCaptureCapabilities _frontDualPhotoModeMaximumZoomFactor](self, "_frontDualPhotoModeMaximumZoomFactor");
        }
        else if (v10)
        {
          -[CAMCaptureCapabilities _backPhotoModeMaximumZoomFactor](self, "_backPhotoModeMaximumZoomFactor");
        }
        else
        {
          -[CAMCaptureCapabilities _frontPhotoModeMaximumZoomFactor](self, "_frontPhotoModeMaximumZoomFactor");
        }
        goto LABEL_53;
      case 1:
        if (v13)
        {
          if (!v10)
            goto LABEL_34;
          goto LABEL_26;
        }
        if (v14 || v15)
        {
          if (!v10)
            goto LABEL_50;
          -[CAMCaptureCapabilities _backDualVideoModeMaximumZoomFactor](self, "_backDualVideoModeMaximumZoomFactor");
        }
        else
        {
          if (v10)
            goto LABEL_52;
          -[CAMCaptureCapabilities _frontVideoModeMaximumZoomFactor](self, "_frontVideoModeMaximumZoomFactor");
        }
        goto LABEL_53;
      case 2:
        if (v13)
        {
          if (v10)
LABEL_26:
            -[CAMCaptureCapabilities _backTripleCameraVideoModeMaximumZoomFactor](self, "_backTripleCameraVideoModeMaximumZoomFactor");
          else
LABEL_34:
            -[CAMCaptureCapabilities _frontTripleCameraVideoModeMaximumZoomFactor](self, "_frontTripleCameraVideoModeMaximumZoomFactor");
        }
        else if (v14 || v15)
        {
          if (v10)
            -[CAMCaptureCapabilities _backDualSlomoModeMaximumZoomFactor](self, "_backDualSlomoModeMaximumZoomFactor");
          else
LABEL_50:
            -[CAMCaptureCapabilities _frontDualVideoModeMaximumZoomFactor](self, "_frontDualVideoModeMaximumZoomFactor");
        }
        else
        {
          if (!v10)
            return v12;
LABEL_52:
          -[CAMCaptureCapabilities _backVideoModeMaximumZoomFactor](self, "_backVideoModeMaximumZoomFactor");
        }
LABEL_53:
        v12 = v17;
        if (v17 == 1.0)
          v18 = 1;
        else
          v18 = v16;
        if ((v18 & 1) == 0)
        {
          -[CAMCaptureCapabilities dualCameraSwitchOverZoomFactorForDevicePosition:](self, "dualCameraSwitchOverZoomFactorForDevicePosition:", v11);
          v20 = v19;
          -[CAMCaptureCapabilities telephotoDisplayZoomFactor](self, "telephotoDisplayZoomFactor");
          v12 = v12 * v21 / v20;
        }
        break;
      case 6:
        if (!v10)
          return v12;
        -[CAMCaptureCapabilities _backPortraitModeMaximumZoomFactor](self, "_backPortraitModeMaximumZoomFactor");
        goto LABEL_53;
      case 7:
        if ((v10 & v15 & -[CAMCaptureCapabilities continuousZoomSupportedForCinematicMode](self, "continuousZoomSupportedForCinematicMode")) != 1)return v12;
        -[CAMCaptureCapabilities _backWideDualCinematicModeMaximumZoomFactor](self, "_backWideDualCinematicModeMaximumZoomFactor");
        goto LABEL_53;
      default:
        return v12;
    }
  }
  return v12;
}

- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 customLens:(int64_t)a5 outputToExternalStorage:(BOOL)a6 overrodeWithForcedZoomValue:(BOOL *)a7
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  double result;
  uint64_t v18;

  v8 = a3;
  v9 = objc_msgSend(v8, "mode");
  v10 = objc_msgSend(v8, "device");
  v11 = objc_msgSend(v8, "videoConfiguration");
  v12 = objc_msgSend(v8, "videoStabilizationStrength");
  v13 = objc_msgSend(v8, "videoEncodingBehavior");
  v14 = objc_msgSend(v8, "enableStereoVideoCapture");
  v15 = objc_msgSend(v8, "trueVideoEnabled");
  v16 = objc_msgSend(v8, "prefersHDR10BitVideo");

  BYTE3(v18) = v16;
  BYTE2(v18) = v15;
  BYTE1(v18) = v14;
  LOBYTE(v18) = a6;
  -[CAMCaptureCapabilities defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:](self, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", v9, v10, v11, a4, v12, v13, a5, v18, a7);
  return result;
}

- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6
{
  double result;
  uint64_t v7;

  LODWORD(v7) = 0;
  -[CAMCaptureCapabilities defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:](self, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", a3, a4, a5, a6, 0, 1, 0, v7, 0);
  return result;
}

- (double)defaultZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 captureOrientation:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 videoEncodingBehavior:(int64_t)a8 customLens:(int64_t)a9 outputToExternalStorage:(BOOL)a10 spatialVideoEnabled:(BOOL)a11 isTrueVideo:(BOOL)a12 prefersHDR10BitVideo:(BOOL)a13 overrodeWithForcedZoomValue:(BOOL *)a14
{
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  unint64_t v36;
  int64_t v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  id v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  NSObject *v50;
  double v51;
  double v52;
  uint64_t v54;
  char v55;
  id v56;
  id v57;
  uint8_t buf[4];
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v21 = -[CAMCaptureCapabilities resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a7, a11);
  v22 = v21;
  if ((unint64_t)(v21 - 8) < 3)
    goto LABEL_4;
  if (v21 == 11)
  {
    -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", a3, 11, a5, a7);
    v25 = v33;
    v27 = 0;
    v26 = 1.0;
    goto LABEL_26;
  }
  if (v21 == 1)
  {
LABEL_4:
    v55 = 0;
    v23 = 1;
  }
  else
  {
    v23 = 0;
    v55 = 1;
  }
  -[CAMCaptureCapabilities maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:](self, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v21, a5, a7);
  v25 = v24;
  if ((unint64_t)(v22 - 6) >= 2)
  {
    if (v22 != 4)
    {
      v26 = 1.0;
      v27 = v22 == 10;
      goto LABEL_24;
    }
    if (-[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v23))
    {
      -[CAMCaptureCapabilities wideToTelephotoZoomFactorForDevicePosition:](self, "wideToTelephotoZoomFactorForDevicePosition:", v23);
      v26 = v34;
      goto LABEL_21;
    }
LABEL_23:
    v27 = 0;
    v26 = 1.0;
    goto LABEL_24;
  }
  -[CAMCaptureCapabilities wideDualCameraSwitchOverZoomFactorForDevicePosition:](self, "wideDualCameraSwitchOverZoomFactorForDevicePosition:", v23);
  v26 = v28;
  v29 = -[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, v23, a5);
  if (a3 == 6 && v29)
  {
    -[CAMCaptureCapabilities _backWideDualCameraSwitchOverZoomFactor](self, "_backWideDualCameraSwitchOverZoomFactor");
    v31 = v30;
    -[CAMCaptureCapabilities quadraWideRelativeZoomFactor](self, "quadraWideRelativeZoomFactor");
    v26 = v31 * v32;
  }
  BYTE2(v54) = a13;
  LOWORD(v54) = __PAIR16__(a12, a11);
  if (!-[CAMCaptureCapabilities isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:](self, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", a7, a3, a4, a5, a8, a10, v54))
  {
    v27 = 0;
    goto LABEL_24;
  }
  if (a7 == 3)
    goto LABEL_23;
  if (a7 != 2)
  {
LABEL_21:
    v27 = 0;
    goto LABEL_24;
  }
  v27 = 0;
  if (!-[CAMCaptureCapabilities featureDevelopmentDefaultWideHighStabilization](self, "featureDevelopmentDefaultWideHighStabilization"))v26 = 1.0;
LABEL_24:
  if ((v55 & 1) != 0)
  {
    v35 = 1;
    goto LABEL_37;
  }
LABEL_26:
  v36 = -[CAMCaptureCapabilities frontZoomBehaviorForCaptureMode:](self, "frontZoomBehaviorForCaptureMode:", a3);
  if (v36 - 1 >= 2)
  {
    if (v36 != 3)
    {
LABEL_35:
      v35 = 0;
      goto LABEL_37;
    }
LABEL_36:
    v35 = 0;
    v26 = 1.0;
    goto LABEL_37;
  }
  if (!-[CAMCaptureCapabilities shouldAdjustZoomOnOrientationChangeForDevicePosition:](self, "shouldAdjustZoomOnOrientationChangeForDevicePosition:", 1))
  {
    if (v27)
    {
      -[CAMCaptureCapabilities superWideToWideZoomFactorForDevicePosition:](self, "superWideToWideZoomFactorForDevicePosition:", 1);
      v26 = v38;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  v37 = a6;
  v35 = 0;
  if ((unint64_t)(v37 - 1) >= 2)
    v26 = 1.0;
  else
    v26 = v25;
LABEL_37:
  -[CAMCaptureCapabilities _forcedInitialZoomDisplayFactor](self, "_forcedInitialZoomDisplayFactor");
  if (v39 > 0.0)
  {
    v40 = v39;
    v56 = 0;
    v57 = 0;
    v41 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", a3, v22, a5, a7, &v57, &v56);
    v42 = v57;
    v43 = v56;
    if (!v41)
    {
      if (!v35)
      {
LABEL_54:

        goto LABEL_55;
      }
      +[CAMZoomControlUtilities zoomScaleFromDevice:toDevice:](CAMZoomControlUtilities, "zoomScaleFromDevice:toDevice:", 2, v22);
      v47 = v40 * v46;
      -[CAMCaptureCapabilities significantZoomFactorsForMode:device:](self, "significantZoomFactorsForMode:device:", a3, v22);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v48, "containsObject:", v49);

      if (v35)
        v26 = v47;
LABEL_53:

      goto LABEL_54;
    }
    +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", v43, v42, v40);
    v45 = v44;
    if (v44 == v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unchanged from %g"), *(_QWORD *)&v26);
    }
    else
    {
      if (v44 >= 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instead of %g"), *(_QWORD *)&v26);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 1;
        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IGNORING, using default %g"), *(_QWORD *)&v26);
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
LABEL_49:
    v50 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v59 = v40;
      v60 = 2048;
      v61 = v45;
      v62 = 2114;
      v63 = v48;
      v64 = 2114;
      v65 = v43;
      v66 = 2114;
      v67 = v42;
      _os_log_impl(&dword_1DB760000, v50, OS_LOG_TYPE_DEFAULT, "Zoom override: displayFactor=%g -> zoomFactor=%g (%{public}@). displayZoomFactors = %{public}@, zoomFactors = %{public}@", buf, 0x34u);
    }

    if (v35)
      v26 = v45;
    goto LABEL_53;
  }
  LOBYTE(v35) = 0;
LABEL_55:
  if (-[CAMCaptureCapabilities isCustomLensSupportedForMode:device:isTrueVideo:](self, "isCustomLensSupportedForMode:device:isTrueVideo:", a3, v22, a12)&& (v35 & 1) == 0)
  {
    if ((unint64_t)a9 > 5)
      v51 = NAN;
    else
      v51 = dbl_1DB9A7590[a9] / dbl_1DB9A7560[a9];
    -[CAMCaptureCapabilities zoomFactorForCustomLensZoomFactor:](self, "zoomFactorForCustomLensZoomFactor:", v26 * v51);
    v26 = v52;
  }
  if (a14)
    *a14 = v35;
  return v26;
}

- (BOOL)zoomControlSupported
{
  return -[CAMCaptureCapabilities isDualSupported](self, "isDualSupported")
      || -[CAMCaptureCapabilities isWideDualSupported](self, "isWideDualSupported")
      || -[CAMCaptureCapabilities isTripleCameraSupported](self, "isTripleCameraSupported")
      || -[CAMCaptureCapabilities isFrontSuperWideSupported](self, "isFrontSuperWideSupported")
      || -[CAMCaptureCapabilities isBackQuadraWideSupported](self, "isBackQuadraWideSupported");
}

- (id)significantZoomFactorsForMode:(int64_t)a3 device:(int64_t)a4
{
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a4 - 8) < 3)
    goto LABEL_4;
  if (a4 == 11)
  {
    -[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, 1);
    goto LABEL_16;
  }
  if (a4 == 1)
LABEL_4:
    v7 = 1;
  else
    v7 = 0;
  v8 = -[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v7);
  if ((unint64_t)(a4 - 6) < 2 || a4 == 2)
    goto LABEL_10;
  if (a4 != 4)
  {
LABEL_16:
    v19 = &unk_1EA3B3878;
    return v19;
  }
  if (v8)
  {
    -[CAMCaptureCapabilities wideToTelephotoZoomFactorForDevicePosition:](self, "wideToTelephotoZoomFactorForDevicePosition:", v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v23;
LABEL_13:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_10:
  +[CAMZoomControlUtilities zoomScaleFromDevice:toDevice:](CAMZoomControlUtilities, "zoomScaleFromDevice:toDevice:", 2, a4);
  v13 = v12;
  v14 = -[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, v7, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v15;
  if (!v14)
  {
    v21 = v15;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v21;
    goto LABEL_13;
  }
  v22[0] = v15;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMCaptureCapabilities quadraWideRelativeZoomFactor](self, "quadraWideRelativeZoomFactor");
  objc_msgSend(v16, "numberWithDouble:", v13 * v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v19;
}

- (BOOL)processZoomWithoutUpscaleForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMCaptureCapabilities _processZoomWithoutUpscaleFront](self, "_processZoomWithoutUpscaleFront");
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities _processZoomWithoutUpscaleBack](self, "_processZoomWithoutUpscaleBack");
}

- (int64_t)resolvedDefaultCustomLens
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!-[CAMCaptureCapabilities focalLengthPickerSupported](self, "focalLengthPickerSupported"))
    return 0;
  -[CAMCaptureCapabilities availableCustomLenses](self, "availableCustomLenses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)effectiveFocalLengthForCustomLens:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  if (((1 << a3) & 0x34) != 0)
    return 2;
  if (((1 << a3) & 0xA) != 0)
    return 1;
  return -[CAMCaptureCapabilities baseFocalLengthForWideCamera](self, "baseFocalLengthForWideCamera");
}

- (int64_t)baseFocalLengthForCustomLens:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 2)
    return 3;
  if (a3 == 5)
    return 1;
  if (a3)
    return 0;
  return -[CAMCaptureCapabilities baseFocalLengthForWideCamera](self, "baseFocalLengthForWideCamera");
}

- (NSArray)defaultCustomLensGroup
{
  void *v2;
  void *v3;

  -[CAMCaptureCapabilities supportedCustomLensGroups](self, "supportedCustomLensGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)supportedCustomLensForLens:(int64_t)a3 inGroup:(id)a4
{
  void *v6;
  int64_t v7;

  -[CAMCaptureCapabilities supportedCustomLensGroupForGroup:](self, "supportedCustomLensGroupForGroup:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMCaptureCapabilities _nearestCustomLensToLens:inGroup:](self, "_nearestCustomLensToLens:inGroup:", a3, v6);

  return v7;
}

- (id)supportedCustomLensGroupForGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
    -[CAMCaptureCapabilities availableCustomLenses](self, "availableCustomLenses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCaptureCapabilities supportedCustomLensGroups](self, "supportedCustomLensGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v5) & 1) == 0)
    {
      v17 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMCaptureCapabilities _nearestCustomLensToLens:inGroup:](self, "_nearestCustomLensToLens:inGroup:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "integerValue"), v6));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

      v7 = v17;
      if (objc_msgSend(v17, "containsObject:", v8))
      {
        v15 = v8;
      }
      else
      {
        -[CAMCaptureCapabilities defaultCustomLensGroup](self, "defaultCustomLensGroup");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v15;

    }
  }
  else
  {
    -[CAMCaptureCapabilities defaultCustomLensGroup](self, "defaultCustomLensGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)_nearestCustomLensToLens:(int64_t)a3 inGroup:(id)a4
{
  id v6;
  unint64_t v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[CAMCaptureCapabilities effectiveFocalLengthForCustomLens:](self, "effectiveFocalLengthForCustomLens:", a3);
  v8 = 0.0;
  if (v7 <= 3)
    v8 = dbl_1DB9A75C0[v7];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v22;
    v14 = 1.79769313e308;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v9);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "integerValue", (_QWORD)v21);
      v17 = -[CAMCaptureCapabilities effectiveFocalLengthForCustomLens:](self, "effectiveFocalLengthForCustomLens:", v16);
      v18 = 0.0;
      if (v17 <= 3)
        v18 = dbl_1DB9A75C0[v17];
      v19 = vabdd_f64(v18, v8);
      if (v19 < v14)
      {
        v12 = v16;
        v14 = v19;
        if (v18 - v8 == 0.0)
          break;
      }
      if (v11 == ++v15)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v16 = v12;
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isCustomLensSupportedForMode:(int64_t)a3 device:(int64_t)a4 isTrueVideo:(BOOL)a5
{
  _BOOL4 v8;
  BOOL v9;
  char v10;
  unsigned int v11;

  v8 = -[CAMCaptureCapabilities focalLengthPickerSupported](self, "focalLengthPickerSupported");
  v9 = a3 == 1 && a5;
  if (a3)
    v10 = v9;
  else
    v10 = 1;
  v11 = *(_DWORD *)&v10 & ((unint64_t)a4 < 8) & (0xD5u >> a4);
  if (v8)
    return v11;
  else
    return 0;
}

- (BOOL)isCustomLensSupportedForPhotoResolution:(int64_t)a3
{
  BOOL result;

  result = -[CAMCaptureCapabilities focalLengthPickerSupported](self, "focalLengthPickerSupported");
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return 0;
  return result;
}

- (double)zoomFactorForCustomLensZoomFactor:(double)a3
{
  double result;

  -[CAMCaptureCapabilities _maximumZoomFactorWithout24MPUpscale](self, "_maximumZoomFactorWithout24MPUpscale");
  if (vabdd_f64(a3, result) / result >= 0.05)
    return a3;
  return result;
}

- (int64_t)preferredDeviceForPosition:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  int64_t v7;
  int64_t v10;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  _BOOL4 v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v7 = a5;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 == 1)
    {
      if (-[CAMCaptureCapabilities isPearlSupportedForMode:devicePosition:](self, "isPearlSupportedForMode:devicePosition:", a4, 1, a5, a6, a7))
      {
        return 9;
      }
      else if (-[CAMCaptureCapabilities frontZoomBehaviorForCaptureMode:](self, "frontZoomBehaviorForCaptureMode:", a4)
              - 1 > 1)
      {
        return 8;
      }
      else if (-[CAMCaptureCapabilities isSuperWideSupportedForMode:devicePosition:videoConfiguration:](self, "isSuperWideSupportedForMode:devicePosition:videoConfiguration:", a4, 1, v7))
      {
        return 10;
      }
      else
      {
        return 8;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a4)
    {
      case 0:
      case 2:
      case 3:
      case 4:
      case 5:
        v12 = &unk_1EA3B38D8;
        break;
      case 1:
        v13 = &unk_1EA3B38C0;
        v14 = &unk_1EA3B38A8;
        v15 = !a7;
        goto LABEL_17;
      case 6:
        v16 = -[CAMCaptureCapabilities _preferWideDualPortrait](self, "_preferWideDualPortrait");
        v13 = &unk_1EA3B3908;
        v14 = &unk_1EA3B38F0;
        v15 = !v16;
LABEL_17:
        if (v15)
          v12 = v13;
        else
          v12 = v14;
        break;
      case 7:
        v12 = &unk_1EA3B3920;
        break;
      case 8:
      case 9:
        v12 = &unk_1EA3B3890;
        break;
      default:
        v12 = 0;
        break;
    }
    v17 = -[CAMCaptureCapabilities _forcedBackDeviceForMode:videoConfiguration:](self, "_forcedBackDeviceForMode:videoConfiguration:", a4, v7, a5, a6, a7);
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v12);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((a6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v12, "arrayByAddingObject:", &unk_1EA3B0D60);
      v20 = objc_claimAutoreleasedReturnValue();

      if (-[CAMCaptureCapabilities _needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:](self, "_needsForcedSingleCameraEmulationForVideoStabilizationStrength:videoConfiguration:mode:", a6, v7, a4))
      {
        v7 = 9;
      }
      v12 = (void *)v20;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
LABEL_29:
      v25 = 0;
      while (2)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "integerValue", (_QWORD)v27);
        switch(v10)
        {
          case 2:
            if (!-[CAMCaptureCapabilities isWideSupportedForMode:devicePosition:videoConfiguration:](self, "isWideSupportedForMode:devicePosition:videoConfiguration:", a4, 0, v7))goto LABEL_44;
            break;
          case 3:
            if (!-[CAMCaptureCapabilities isTelephotoSupportedForMode:devicePosition:videoConfiguration:](self, "isTelephotoSupportedForMode:devicePosition:videoConfiguration:", a4, 0, v7))goto LABEL_44;
            break;
          case 4:
            if (!-[CAMCaptureCapabilities isDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a4, 0, v7, a6))goto LABEL_44;
            break;
          case 5:
            if (!-[CAMCaptureCapabilities isSuperWideSupportedForMode:devicePosition:videoConfiguration:](self, "isSuperWideSupportedForMode:devicePosition:videoConfiguration:", a4, 0, v7))goto LABEL_44;
            break;
          case 6:
            if (!-[CAMCaptureCapabilities isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a4, 0, v7, a6))goto LABEL_44;
            break;
          case 7:
            if (!-[CAMCaptureCapabilities isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:](self, "isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a4, 0, v7, a6))goto LABEL_44;
            break;
          default:
LABEL_44:
            if (v23 != ++v25)
              continue;
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (!v23)
              goto LABEL_46;
            goto LABEL_29;
        }
        break;
      }
    }
    else
    {
LABEL_46:
      v10 = 2;
    }

  }
  return v10;
}

- (int64_t)_forcedBackDeviceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4
{
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v7 = -[CAMCaptureCapabilities _forcedBackCamera](self, "_forcedBackCamera");
  -[CAMCaptureCapabilities _forcedInitialZoomDisplayFactor](self, "_forcedInitialZoomDisplayFactor");
  if (!v7)
  {
    v9 = v8;
    if (v8 != 0.0)
    {
      if (a3 == 6)
      {
        if (-[CAMCaptureCapabilities continuousZoomSupportedForPortraitMode](self, "continuousZoomSupportedForPortraitMode"))
        {
          return 0;
        }
      }
      else if (a3 == 7
             && -[CAMCaptureCapabilities continuousZoomSupportedForCinematicMode](self, "continuousZoomSupportedForCinematicMode"))
      {
        return 0;
      }
      if (-[CAMCaptureCapabilities isDualDeviceDisparitySupportedForMode:devicePosition:](self, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, 0))
      {
        -[CAMCaptureCapabilities telephotoDisplayZoomFactor](self, "telephotoDisplayZoomFactor");
        if (v9 == v10)
          return 4;
        -[CAMCaptureCapabilities wideDisplayZoomFactor](self, "wideDisplayZoomFactor");
        if (v9 == v12)
          return 6;
        v7 = 0;
        if (!-[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, 0, a4))return v7;
        -[CAMCaptureCapabilities quadraWideDisplayZoomFactor](self, "quadraWideDisplayZoomFactor");
        if (v9 == v14)
          return 6;
      }
      else if ((unint64_t)(a3 - 2) < 2
             || a3 == 5
             || a3 == 1
             && (a4 == 4
              || a4 == 13
              || a4 == 9
              && -[CAMCaptureCapabilities _backDualCameraVideoCapture4kMaxFPS](self, "_backDualCameraVideoCapture4kMaxFPS") <= 59&& -[CAMCaptureCapabilities _backWideDualCameraVideoCapture4kMaxFPS](self, "_backWideDualCameraVideoCapture4kMaxFPS") <= 59&& -[CAMCaptureCapabilities _backTripleCameraVideoCapture4kMaxFPS](self, "_backTripleCameraVideoCapture4kMaxFPS") <= 59))
      {
        -[CAMCaptureCapabilities wideDisplayZoomFactor](self, "wideDisplayZoomFactor");
        if (v9 == v11)
          return 2;
        -[CAMCaptureCapabilities telephotoDisplayZoomFactor](self, "telephotoDisplayZoomFactor");
        if (v9 == v13)
          return 3;
        -[CAMCaptureCapabilities superWideDisplayZoomFactor](self, "superWideDisplayZoomFactor");
        if (v9 == v15)
          return 5;
        v7 = 0;
        if (!-[CAMCaptureCapabilities isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:](self, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, 0, a4))return v7;
        -[CAMCaptureCapabilities quadraWideDisplayZoomFactor](self, "quadraWideDisplayZoomFactor");
        if (v9 == v16)
          return 2;
      }
      return 0;
    }
  }
  return v7;
}

- (int64_t)resolvedDeviceForDesiredDevice:(int64_t)a3 mode:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 spatialVideoEnabled:(BOOL)a7
{
  _BOOL8 v7;
  int64_t result;
  uint64_t v13;

  v7 = a7;
  result = -[CAMCaptureCapabilities sanitizeDesiredDevice:forMode:](self, "sanitizeDesiredDevice:forMode:", a3);
  if ((unint64_t)(result - 8) < 3)
    goto LABEL_4;
  if (result == 11)
    return result;
  if (result == 1)
LABEL_4:
    v13 = 1;
  else
    v13 = 0;
  if ((unint64_t)(result - 2) >= 9)
  {
    if ((unint64_t)result > 1)
      return 0;
    else
      return -[CAMCaptureCapabilities preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:](self, "preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v13, a4, a5, a6, v7);
  }
  return result;
}

- (BOOL)isContentAwareDistortionCorrectionSupportedForMode:(int64_t)a3
{
  return (a3 == 9 || !a3)
      && -[CAMCaptureCapabilities contentAwareDistortionCorrectionSupported](self, "contentAwareDistortionCorrectionSupported");
}

- (BOOL)isLinearDNGSupportedForMode:(int64_t)a3
{
  return !a3 && -[CAMCaptureCapabilities isLinearDNGSupported](self, "isLinearDNGSupported");
}

- (BOOL)smartStylesSupportedForLightingType:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (unint64_t)semanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  unint64_t v7;

  if (-[CAMCaptureCapabilities smartStylesSupported](self, "smartStylesSupported"))
    v7 = -[CAMCaptureCapabilities _desiredSmartStyleSupportForMode:devicePosition:](self, "_desiredSmartStyleSupportForMode:devicePosition:", a3, a4);
  else
    v7 = -[CAMCaptureCapabilities _desiredSemanticStyleSupportForMode:devicePosition:](self, "_desiredSemanticStyleSupportForMode:devicePosition:", a3, a4);
  return -[CAMCaptureCapabilities semanticStylesSupport](self, "semanticStylesSupport") & v7;
}

- (unint64_t)_desiredSemanticStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  _BOOL4 v8;

  result = 0;
  switch(a3)
  {
    case 0:
    case 4:
      result = -1;
      break;
    case 1:
      result = 1;
      break;
    case 6:
      if (a4)
        v8 = -[CAMCaptureCapabilities _frontPortraitSemanticStylesSupported](self, "_frontPortraitSemanticStylesSupported", v4, v5);
      else
        v8 = -[CAMCaptureCapabilities _rearPortraitSemanticStylesSupported](self, "_rearPortraitSemanticStylesSupported", v4, v5);
      if (v8)
        result = 7;
      else
        result = 1;
      break;
    case 9:
      result = 5;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_desiredSmartStyleSupportForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  result = 0;
  switch(a3)
  {
    case 0:
    case 6:
      result = -1;
      break;
    case 1:
    case 7:
      result = -[CAMCaptureCapabilities _smartStylesAdditionalSystemStyleSupport](self, "_smartStylesAdditionalSystemStyleSupport", v4, v5);
      break;
    default:
      return result;
  }
  return result;
}

- (id)captureStyleForCaptureWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6
{
  char v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v18;

  v8 = a3;
  v10 = a4;
  v11 = v10;
  if ((v8 & 2) != 0)
  {
    if (objc_msgSend(v10, "count") > a5)
    {
      v13 = v11;
      v14 = a5;
      goto LABEL_15;
    }
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:].cold.2(v11, (const char *)a5);

  }
  else
  {
    if (-[CAMCaptureCapabilities smartStylesSupported](self, "smartStylesSupported"))
    {
      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D0D098], "identityStyle");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v16 = (void *)v12;
        goto LABEL_17;
      }
      if (objc_msgSend(v11, "count") <= a6)
      {
        v18 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:].cold.1(v11, (const char *)a6);

        objc_msgSend(MEMORY[0x1E0D0D098], "systemStyle");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v13 = v11;
      v14 = a6;
LABEL_15:
      objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if ((v8 & 1) != 0)
    {
      +[CAMSemanticStyle standardStyle](CAMSemanticStyle, "standardStyle");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (id)captureStyleForPreviewWithSupport:(unint64_t)a3 styles:(id)a4 selectedStyleIndex:(unint64_t)a5 smartStyleSystemStyleIndex:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;

  v10 = a4;
  if (!-[CAMCaptureCapabilities smartStylesSupported](self, "smartStylesSupported"))
  {
    if ((a3 & 4) != 0)
    {
      if (objc_msgSend(v10, "count") > a5)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:].cold.2(v10, (const char *)a5);

    }
    v12 = 0;
    goto LABEL_11;
  }
  -[CAMCaptureCapabilities captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:](self, "captureStyleForCaptureWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:", a3, v10, a5, a6);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v11;
LABEL_11:

  return v12;
}

- (BOOL)isStillDuringVideoSupportedForVideoEncodingBehavior:(int64_t)a3
{
  return (unint64_t)a3 <= 1
      && -[CAMCaptureCapabilities isStillDuringVideoSupported](self, "isStillDuringVideoSupported");
}

- (BOOL)isStillDuringVideoSupportedForMode:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)isPALVideoConfiguration:(int64_t)a3
{
  return ((unint64_t)a3 < 0xF) & (0x5800u >> a3);
}

- (BOOL)enhancedHEICResolutionSupported
{
  return -[CAMCaptureCapabilities frontEnhancedHEICResolutionSupported](self, "frontEnhancedHEICResolutionSupported")
      || -[CAMCaptureCapabilities backEnhancedHEICResolutionSupported](self, "backEnhancedHEICResolutionSupported");
}

- (BOOL)enhancedRAWResolutionSupported
{
  void *v2;
  BOOL v3;

  -[CAMCaptureCapabilities _backCameraSupportedRAWResolutionsByMode](self, "_backCameraSupportedRAWResolutionsByMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)backEnhancedHEICResolutionSupported
{
  void *v2;
  BOOL v3;

  -[CAMCaptureCapabilities _backCameraSupportedCompressedResolutionsByMode](self, "_backCameraSupportedCompressedResolutionsByMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forPhotoEncoding:(int64_t)a4
{
  return -[CAMCaptureCapabilities isPhotoResolutionSupported:forMode:device:photoEncoding:](self, "isPhotoResolutionSupported:forMode:device:photoEncoding:", a3, 0, 0, a4)|| -[CAMCaptureCapabilities isPhotoResolutionSupported:forMode:device:photoEncoding:](self, "isPhotoResolutionSupported:forMode:device:photoEncoding:", a3, 0, 1, a4);
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 photoEncoding:(int64_t)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
  char v11;

  if (!a3)
    return 1;
  if ((unint64_t)(a5 - 1) > 0xA)
    v7 = 0;
  else
    v7 = qword_1DB9A75F8[a5 - 1];
  -[CAMCaptureCapabilities supportedPhotoResolutionsForMode:devicePosition:photoEncoding:](self, "supportedPhotoResolutionsForMode:devicePosition:photoEncoding:", a4, v7, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  return v11;
}

- (BOOL)isPhotoResolutionSupported:(int64_t)a3 forLightingType:(int64_t)a4
{
  unint64_t v4;
  unint64_t v5;

  if ((unint64_t)(a3 - 1) > 2)
    v4 = 0;
  else
    v4 = qword_1DB9A75E0[a3 - 1];
  v5 = 12;
  if (a4 == 1)
    v5 = 24;
  return !a4 || v5 >= v4;
}

- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4 encoding:(int64_t)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  if ((unint64_t)(a4 - 1) > 0xA)
    v5 = 0;
  else
    v5 = qword_1DB9A75F8[a4 - 1];
  -[CAMCaptureCapabilities supportedPhotoResolutionsForMode:devicePosition:photoEncoding:](self, "supportedPhotoResolutionsForMode:devicePosition:photoEncoding:", a3, v5, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)supportedPhotoResolutionsForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoEncoding:(int64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)a5 >= 2)
  {
    if (a5 != 2)
    {
      v7 = 0;
      goto LABEL_11;
    }
    if (a4)
      -[CAMCaptureCapabilities _frontCameraSupportedRAWResolutionsByMode](self, "_frontCameraSupportedRAWResolutionsByMode");
    else
      -[CAMCaptureCapabilities _backCameraSupportedRAWResolutionsByMode](self, "_backCameraSupportedRAWResolutionsByMode");
  }
  else if (a4)
  {
    -[CAMCaptureCapabilities _frontCameraSupportedCompressedResolutionsByMode](self, "_frontCameraSupportedCompressedResolutionsByMode");
  }
  else
  {
    -[CAMCaptureCapabilities _backCameraSupportedCompressedResolutionsByMode](self, "_backCameraSupportedCompressedResolutionsByMode");
  }
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)supportsOverlappingCapturesForResolution:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return 1;
  if (a3 == 3)
    return -[CAMCaptureCapabilities _overlapping48MPCapturesSupported](self, "_overlapping48MPCapturesSupported");
  return 0;
}

- (BOOL)isPhotoFormatSupported:(id)a3 forMode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1;
  int64_t var0;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!a3.var0)
    return -[CAMCaptureCapabilities isPhotoResolutionSupported:forMode:device:photoEncoding:](self, "isPhotoResolutionSupported:forMode:device:photoEncoding:", var1, a4, a5, var0);
  if (a3.var0 == 1)
  {
    if (-[CAMCaptureCapabilities isHEVCEncodingSupported](self, "isHEVCEncodingSupported"))
      return -[CAMCaptureCapabilities isPhotoResolutionSupported:forMode:device:photoEncoding:](self, "isPhotoResolutionSupported:forMode:device:photoEncoding:", var1, a4, a5, var0);
  }
  else if (a3.var0 == 2 && -[CAMCaptureCapabilities isLinearDNGSupported](self, "isLinearDNGSupported"))
  {
    return -[CAMCaptureCapabilities isPhotoResolutionSupported:forMode:device:photoEncoding:](self, "isPhotoResolutionSupported:forMode:device:photoEncoding:", var1, a4, a5, var0);
  }
  return 0;
}

- (BOOL)isPreviewAspectRatioToggleSupportedForMode:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CAMCaptureCapabilities _isiPad](self, "_isiPad");
  if (v5)
  {
    LOBYTE(v5) = 0;
    if ((unint64_t)a3 <= 7)
    {
      if (((1 << a3) & 0xA6) != 0)
      {
        LOBYTE(v5) = 1;
      }
      else if (((1 << a3) & 0x41) != 0)
      {
        LOBYTE(v5) = -[CAMCaptureCapabilities _isPreviewAspectRatioToggleSupportedForPhotoModes](self, "_isPreviewAspectRatioToggleSupportedForPhotoModes");
      }
    }
  }
  return v5;
}

- (BOOL)isZoomPIPSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  _BOOL4 v7;

  v7 = -[CAMCaptureCapabilities isZoomPIPSupported](self, "isZoomPIPSupported");
  if (v7)
  {
    if ((unint64_t)a3 >= 2)
      LOBYTE(v7) = a3 == 2 && -[CAMCaptureCapabilities _zoomPIPSupportedForSlomo](self, "_zoomPIPSupportedForSlomo");
    else
      LOBYTE(v7) = 1;
    if (a4)
      LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isDeferredProcessingSupportedForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  switch(a3)
  {
    case 9:
      return -[CAMCaptureCapabilities isDeferredProcessingSupported](self, "isDeferredProcessingSupported");
    case 6:
      if (a4)
        return -[CAMCaptureCapabilities _frontPortraitDeferredProcessingSupported](self, "_frontPortraitDeferredProcessingSupported");
      else
        return -[CAMCaptureCapabilities _rearPortraitDeferredProcessingSupported](self, "_rearPortraitDeferredProcessingSupported");
    case 0:
      return -[CAMCaptureCapabilities isDeferredProcessingSupported](self, "isDeferredProcessingSupported");
    default:
      return 0;
  }
}

- (int64_t)maxSupportedPhotoQualityPrioritizationForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  int64_t result;
  _BOOL4 v6;

  result = 1;
  switch(a3)
  {
    case 0:
    case 1:
    case 9:
      v6 = -[CAMCaptureCapabilities isDeferredProcessingSupported](self, "isDeferredProcessingSupported");
      goto LABEL_5;
    case 5:
      result = 0;
      break;
    case 6:
      v6 = -[CAMCaptureCapabilities isDeferredProcessingSupportedForMode:devicePosition:](self, "isDeferredProcessingSupportedForMode:devicePosition:", 6, a4);
LABEL_5:
      if (v6)
        result = 2;
      else
        result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isExternalStorageOutputSupportedForMode:(int64_t)a3 videoEncodingBehavior:(int64_t)a4
{
  if (a3 != 7)
    return a3 == 1 && a4 == 2;
  return a4 == 2 && -[CAMCaptureCapabilities _isProResCinematicVideoSupported](self, "_isProResCinematicVideoSupported");
}

- (BOOL)isPauseVideoSupportedForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CAMCaptureCapabilities _supportedModesForPauseResumeVideo](self, "_supportedModesForPauseResumeVideo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)isPreserveCreativeControlsSupported
{
  if (-[CAMCaptureCapabilities _isiPad](self, "_isiPad"))
    return 0;
  if (-[CAMCaptureCapabilities isLiveFilteringSupported](self, "isLiveFilteringSupported"))
    return 1;
  return -[CAMCaptureCapabilities arePortraitEffectsSupported](self, "arePortraitEffectsSupported");
}

- (BOOL)interactiveVideoFormatControlSupported
{
  return self->_interactiveVideoFormatControlSupported;
}

- (BOOL)interactiveVideoFormatControlAlwaysEnabled
{
  return self->_interactiveVideoFormatControlAlwaysEnabled;
}

- (BOOL)captureOnTouchDown
{
  return self->_captureOnTouchDown;
}

- (int64_t)maximumNumberOfInflightRequests
{
  return self->_maximumNumberOfInflightRequests;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (BOOL)isMirroredFrontCapturesSupported
{
  return self->_mirroredFrontCapturesSupported;
}

- (BOOL)isMirroredFrontVideosSupported
{
  return self->_mirroredFrontVideosSupported;
}

- (BOOL)isFlashMitigationSupported
{
  return self->_flashMitigationSupported;
}

- (BOOL)isFrontHDROnSupported
{
  return self->_frontHDROnSupported;
}

- (BOOL)isPreviewDuringHDRSupported
{
  return self->_previewSupportedDuringHDR;
}

- (BOOL)isHDRSettingAllowed
{
  return self->_HDRSettingAllowed;
}

- (BOOL)isBackSmartHDRSupported
{
  return self->_backSmartHDRSupported;
}

- (BOOL)isFrontSmartHDRSupported
{
  return self->_frontSmartHDRSupported;
}

- (BOOL)isHDREV0CaptureSupported
{
  return self->_HDREV0CaptureSupported;
}

- (BOOL)isHDR10BitVideoSupported
{
  return self->_HDR10BitVideoSupported;
}

- (BOOL)isHDR10BitVideoSupports60FPS
{
  return self->_HDR10BitVideoSupports60FPS;
}

- (BOOL)isProResVideoSupported
{
  return self->_proResVideoSupported;
}

- (double)proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal
{
  return self->_proResMinimumDiskSpaceOverrideAsFractionOfSystemTotal;
}

- (int64_t)proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace
{
  return self->_proResMinimumDiskSpaceOverrideMegabytesRelativeToFreeSpace;
}

- (BOOL)isBackLivePhotoSupported
{
  return self->_backLivePhotoSupported;
}

- (BOOL)isFrontLivePhotoSupported
{
  return self->_frontLivePhotoSupported;
}

- (BOOL)isLivePhotoAutoModeSupported
{
  return self->_livePhotoAutoModeSupported;
}

- (int64_t)supportedPortraitLightingVersion
{
  return self->_supportedPortraitLightingVersion;
}

- (BOOL)isNaturalLightingAppliedToOriginal
{
  return self->_naturalLightingAppliedToOriginal;
}

- (BOOL)isBackLiveStageLightSupported
{
  return self->_backLiveStageLightSupported;
}

- (BOOL)isFrontLiveStageLightSupported
{
  return self->_frontLiveStageLightSupported;
}

- (BOOL)isFrontBurstSupported
{
  return self->_frontBurstSupported;
}

- (int64_t)maximumBurstLength
{
  return self->_maximumBurstLength;
}

- (BOOL)isStillDuringVideoSupported
{
  return self->_stillDuringVideoSupported;
}

- (BOOL)isPALVideoSupported
{
  return self->_PALVideoSupported;
}

- (int64_t)maximumRecordedFileSize
{
  return self->_maximumRecordedFileSize;
}

- (int64_t)back720pMaxFPS
{
  return self->_back720pMaxFPS;
}

- (int64_t)front720pMaxFPS
{
  return self->_front720pMaxFPS;
}

- (int64_t)back1080pMaxFPS
{
  return self->_back1080pMaxFPS;
}

- (int64_t)front1080pMaxFPS
{
  return self->_front1080pMaxFPS;
}

- (int64_t)back4kMaxFPS
{
  return self->_back4kMaxFPS;
}

- (int64_t)front4kMaxFPS
{
  return self->_front4kMaxFPS;
}

- (BOOL)isBack4k24VideoSupported
{
  return self->_back4k24VideoSupported;
}

- (BOOL)isFront4k24VideoSupported
{
  return self->_front4k24VideoSupported;
}

- (BOOL)isBack4k30VideoSupported
{
  return self->_back4k30VideoSupported;
}

- (BOOL)isFront4k30VideoSupported
{
  return self->_front4k30VideoSupported;
}

- (BOOL)isBack4k60VideoSupported
{
  return self->_back4k60VideoSupported;
}

- (BOOL)isBack4k120VideoSupported
{
  return self->_back4k120VideoSupported;
}

- (BOOL)isFront4k60VideoSupported
{
  return self->_front4k60VideoSupported;
}

- (BOOL)isAutoLowLightVideoSupported
{
  return self->_autoLowLightVideoSupported;
}

- (BOOL)isVariableFramerateVideoSupported
{
  return self->_variableFramerateVideoSupported;
}

- (int64_t)defaultVFRMode
{
  return self->_defaultVFRMode;
}

- (BOOL)isStereoAudioRecordingSupported
{
  return self->_stereoAudioRecordingSupported;
}

- (BOOL)isVideoStabilizationControlSupported
{
  return self->_videoStabilizationControlSupported;
}

- (BOOL)isProResLogColorSpaceSupported
{
  return self->_proResLogColorSpaceSupported;
}

- (NSArray)supportedProResColorSpaces
{
  return self->_supportedProResColorSpaces;
}

- (BOOL)isWhiteBalanceLockingForVideoRecordingSupported
{
  return self->_whiteBalanceLockingForVideoRecordingSupported;
}

- (BOOL)isSpatialVideoCaptureSupported
{
  return self->_spatialVideoInVideoModeSupported;
}

- (BOOL)isSpatialModeSupported
{
  return self->_spatialModeSupported;
}

- (BOOL)isSpatialModeTrueVideoSupported
{
  return self->_spatialModeTrueVideoSupported;
}

- (BOOL)isTrueVideoSupported
{
  return self->_trueVideoSupported;
}

- (int64_t)backHighFrameRate720pMaxFPS
{
  return self->_backHighFrameRate720pMaxFPS;
}

- (int64_t)frontHighFrameRate720pMaxFPS
{
  return self->_frontHighFrameRate720pMaxFPS;
}

- (int64_t)backHighFrameRate1080pMaxFPS
{
  return self->_backHighFrameRate1080pMaxFPS;
}

- (int64_t)frontHighFrameRate1080pMaxFPS
{
  return self->_frontHighFrameRate1080pMaxFPS;
}

- (int64_t)backHighFrameRate4kMaxFPS
{
  return self->_backHighFrameRate4kMaxFPS;
}

- (BOOL)isBack720p240Supported
{
  return self->_back720p240Supported;
}

- (BOOL)isFront720p240Supported
{
  return self->_front720p240Supported;
}

- (BOOL)isBack1080p120Supported
{
  return self->_back1080p120Supported;
}

- (BOOL)isFront1080p120Supported
{
  return self->_front1080p120Supported;
}

- (BOOL)isBack1080p240Supported
{
  return self->_back1080p240Supported;
}

- (BOOL)isFront1080p240Supported
{
  return self->_front1080p240Supported;
}

- (BOOL)isFrontPanoramaSupported
{
  return self->_frontPanoramaSupported;
}

- (BOOL)isFrontTimelapseSupported
{
  return self->_frontTimelapseSupported;
}

- (double)timelapseFirstShotDelay
{
  return self->_timelapseFirstShotDelay;
}

- (BOOL)portraitModeOverlappingCapturesSupported
{
  return self->_portraitModeOverlappingCapturesSupported;
}

- (BOOL)continuousZoomSupportedForPortraitMode
{
  return self->_continuousZoomSupportedForPortraitMode;
}

- (unint64_t)portraitInPhotoModeBehavior
{
  return self->_portraitInPhotoModeBehavior;
}

- (BOOL)continuousZoomSupportedForCinematicMode
{
  return self->_continuousZoomSupportedForCinematicMode;
}

- (BOOL)isDeferredPortraitRenderingSupported
{
  return self->_deferredPortraitRenderingSupported;
}

- (BOOL)allowPortraitDescriptionOverlay
{
  return self->_allowPortraitDescriptionOverlay;
}

- (BOOL)isCTMSupported
{
  return self->_ctmSupported;
}

- (BOOL)useReticleStroke
{
  return self->_useReticleStroke;
}

- (BOOL)useCTMTransientImageWell
{
  return self->_useCTMTransientImageWell;
}

- (BOOL)useCTMModeSelector
{
  return self->_useCTMModeSelector;
}

- (BOOL)allowControlDrawer
{
  return self->_allowControlDrawer;
}

- (BOOL)isCinematicModeSupported
{
  return self->_cinematicModeSupported;
}

- (BOOL)isBackCinematicModeSupported
{
  return self->_backCinematicModeSupported;
}

- (BOOL)isFrontCinematicModeSupported
{
  return self->_frontCinematicModeSupported;
}

- (BOOL)cinematic4KSupported
{
  return self->_cinematic4KSupported;
}

- (BOOL)sfCameraFontSupported
{
  return self->_sfCameraFontSupported;
}

- (BOOL)overContentFlipButtonSupported
{
  return self->_overContentFlipButtonSupported;
}

- (BOOL)imagePickerUsesModernLayout
{
  return self->_imagePickerUsesModernLayout;
}

- (double)frontCameraInset
{
  return self->_frontCameraInset;
}

- (BOOL)isFrontCameraOnRightEdge
{
  return self->_frontCameraOnRightEdge;
}

- (BOOL)isBackSpatialOverCaptureSupported
{
  return self->_backSpatialOverCaptureSupported;
}

- (BOOL)isFrontSpatialOverCaptureSupported
{
  return self->_frontSpatialOverCaptureSupported;
}

- (BOOL)isBackLowLightSupported
{
  return self->_backLowLightSupported;
}

- (BOOL)isFrontLowLightSupported
{
  return self->_frontLowLightSupported;
}

- (unint64_t)backLowLightPreviewOverlayStyle
{
  return self->_backLowLightPreviewOverlayStyle;
}

- (unint64_t)frontLowLightPreviewOverlayStyle
{
  return self->_frontLowLightPreviewOverlayStyle;
}

- (BOOL)isBackSingleCameraPortraitModeSupported
{
  return self->_backSingleCameraPortraitModeSupported;
}

- (BOOL)isFrontSingleCameraPortraitModeSupported
{
  return self->_frontSingleCameraPortraitModeSupported;
}

- (BOOL)isBackTorchPatternSupported
{
  return self->_backTorchPatternSupported;
}

- (BOOL)isFrontTorchPatternSupported
{
  return self->_frontTorchPatternSupported;
}

- (unint64_t)zoomPinchScalingMethod
{
  return self->_zoomPinchScalingMethod;
}

- (double)zoomPinchExponentialFactorDistance
{
  return self->_zoomPinchExponentialFactorDistance;
}

- (double)zoomPinchExponentialFactor
{
  return self->_zoomPinchExponentialFactor;
}

- (double)zoomPinchHybridLerpDistance
{
  return self->_zoomPinchHybridLerpDistance;
}

- (int64_t)zoomDialStyle
{
  return self->_zoomDialStyle;
}

- (BOOL)isZoomPlatterSupported
{
  return self->_zoomPlatterSupported;
}

- (BOOL)isZoomPIPSupported
{
  return self->_zoomPIPSupported;
}

- (int64_t)backSuperWideFocalLengthDisplayValue
{
  return self->_backSuperWideFocalLengthDisplayValue;
}

- (int64_t)backWideFocalLengthDisplayValue
{
  return self->_backWideFocalLengthDisplayValue;
}

- (int64_t)backQuadraWideFocalLengthDisplayValue
{
  return self->_backQuadraWideFocalLengthDisplayValue;
}

- (int64_t)backTelephotoFocalLengthDisplayValue
{
  return self->_backTelephotoFocalLengthDisplayValue;
}

- (BOOL)isPipelinedStillImageProcessingSupported
{
  return self->_pipelinedStillImageProcessingSupported;
}

- (BOOL)isDeferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (BOOL)contentAwareDistortionCorrectionSupported
{
  return self->_contentAwareDistortionCorrectionSupported;
}

- (BOOL)isLinearDNGSupported
{
  return self->_linearDNGSupported;
}

- (BOOL)isProRawJpegXLSupported
{
  return self->_proRawJpegXLSupported;
}

- (BOOL)semanticDevelopmentSupported
{
  return self->_semanticDevelopmentSupported;
}

- (BOOL)enableSemanticDevelopmentFilterDebugging
{
  return self->_enableSemanticDevelopmentFilterDebugging;
}

- (int64_t)semanticStylesVersion
{
  return self->_semanticStylesVersion;
}

- (BOOL)smartStylesSupported
{
  return self->_smartStylesSupported;
}

- (BOOL)allowSystemSmartStylesInPicker
{
  return self->_allowSystemSmartStylesInPicker;
}

- (BOOL)smartStylesShowExtraControls
{
  return self->_smartStylesShowExtraControls;
}

- (unint64_t)semanticStylesSupport
{
  return self->_semanticStylesSupport;
}

- (double)wideDisplayZoomFactor
{
  return self->_wideDisplayZoomFactor;
}

- (BOOL)isFrontTelephotoSupported
{
  return self->_frontTelephotoSupported;
}

- (double)telephotoDisplayZoomFactor
{
  return self->_telephotoDisplayZoomFactor;
}

- (BOOL)isBackSuperWideSupported
{
  return self->_backSuperWideSupported;
}

- (BOOL)isFrontSuperWideSupported
{
  return self->_frontSuperWideSupported;
}

- (double)superWideDisplayZoomFactor
{
  return self->_superWideDisplayZoomFactor;
}

- (BOOL)isSuperWideAutoMacroSupported
{
  return self->_superWideAutoMacroSupported;
}

- (BOOL)macroControlEnabledByDefault
{
  return self->_macroControlEnabledByDefault;
}

- (BOOL)isBackWideDualSupported
{
  return self->_backWideDualSupported;
}

- (BOOL)isFrontWideDualSupported
{
  return self->_frontWideDualSupported;
}

- (BOOL)isBackTripleCameraSupported
{
  return self->_backTripleCameraSupported;
}

- (BOOL)isFrontTripleCameraSupported
{
  return self->_frontTripleCameraSupported;
}

- (BOOL)isFrontQuadraWideSupported
{
  return self->_frontQuadraWideSupported;
}

- (BOOL)isBackQuadraWideSupported
{
  return self->_backQuadraWideSupported;
}

- (BOOL)isBackQuadraSuperWideSupported
{
  return self->_backQuadraSuperWideSupported;
}

- (double)quadraWideRelativeZoomFactor
{
  return self->_quadraWideRelativeZoomFactor;
}

- (double)quadraWideDisplayZoomFactor
{
  return self->_quadraWideDisplayZoomFactor;
}

- (BOOL)isBackTimeOfFlightSupported
{
  return self->_backTimeOfFlightSupported;
}

- (BOOL)isFrontTimeOfFlightSupported
{
  return self->_frontTimeOfFlightSupported;
}

- (BOOL)isDepthEffectApertureSupported
{
  return self->_depthEffectApertureSupported;
}

- (BOOL)previewQualityStillImageFilteringForPhotoModeSupported
{
  return self->_previewQualityStillImageFilteringForPhotoModeSupported;
}

- (BOOL)isPortraitEffectIntensitySupported
{
  return self->_portraitEffectIntensitySupported;
}

- (BOOL)isExposureSliderSupported
{
  return self->_exposureSliderSupported;
}

- (BOOL)isNeuralEngineSupported
{
  return self->_neuralEngineSupported;
}

- (BOOL)isImageAnalysisSupported
{
  return self->_imageAnalysisSupported;
}

- (BOOL)isImageAnalysisButtonAlwaysVisible
{
  return self->_imageAnalysisButtonAlwaysVisible;
}

- (BOOL)imageAnalysisShowsInactiveTextRegions
{
  return self->_imageAnalysisShowsInactiveTextRegions;
}

- (BOOL)isDocumentScanningSupported
{
  return self->_documentScanningSupported;
}

- (float)documentScanningMinimumConfidenceLevel
{
  return self->_documentScanningMinimumConfidenceLevel;
}

- (BOOL)focalLengthPickerSupported
{
  return self->_focalLengthPickerSupported;
}

- (NSArray)availableCustomLenses
{
  return self->_availableCustomLenses;
}

- (NSArray)supportedCustomLensGroups
{
  return self->_supportedCustomLensGroups;
}

- (int64_t)baseFocalLengthForWideCamera
{
  return self->_baseFocalLengthForWideCamera;
}

- (BOOL)externalStorageSupported
{
  return self->_externalStorageSupported;
}

- (BOOL)shouldPersistPreferences
{
  return self->_shouldPersistPreferences;
}

- (BOOL)shouldEnableUserNotifications
{
  return self->_shouldEnableUserNotifications;
}

- (CGSize)mainScreenSizePixels
{
  double width;
  double height;
  CGSize result;

  width = self->_mainScreenSizePixels.width;
  height = self->_mainScreenSizePixels.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldPreventConnectionHandover
{
  return self->_shouldPreventConnectionHandover;
}

- (BOOL)isLowEndHardware
{
  return self->_lowEndHardware;
}

- (BOOL)allowHapticsOnConfigurationTaps
{
  return self->_allowHapticsOnConfigurationTaps;
}

- (double)minimumMachineReadableCodeNormalizedHeight
{
  return self->_minimumMachineReadableCodeNormalizedHeight;
}

- (BOOL)librarySelectionSupported
{
  return self->_librarySelectionSupported;
}

- (double)librarySelectionAutoOnResetTimeout
{
  return self->_librarySelectionAutoOnResetTimeout;
}

- (double)librarySelectionUserChoiceResetTimeout
{
  return self->_librarySelectionUserChoiceResetTimeout;
}

- (double)librarySelectionTripResetTimeout
{
  return self->_librarySelectionTripResetTimeout;
}

- (double)librarySelectionSameLocationResetTimeout
{
  return self->_librarySelectionSameLocationResetTimeout;
}

- (BOOL)peopleProximityDetectionSupported
{
  return self->_peopleProximityDetectionSupported;
}

- (BOOL)peopleProximityPersistenceSupported
{
  return self->_peopleProximityPersistenceSupported;
}

- (NSString)peopleProximityDetectAdditionalEmail
{
  return self->_peopleProximityDetectAdditionalEmail;
}

- (BOOL)peopleProximityUsesDeviceDiscovery
{
  return self->_peopleProximityUsesDeviceDiscovery;
}

- (BOOL)peopleProximityIgnoreNearbyRequirements
{
  return self->_peopleProximityIgnoreNearbyRequirements;
}

- (double)peopleProximityInitialScanDuration
{
  return self->_peopleProximityInitialScanDuration;
}

- (double)peopleProximitySubsequentScanDuration
{
  return self->_peopleProximitySubsequentScanDuration;
}

- (unint64_t)peopleProximityInitialScanRate
{
  return self->_peopleProximityInitialScanRate;
}

- (unint64_t)peopleProximitySubsequentScanRate
{
  return self->_peopleProximitySubsequentScanRate;
}

- (double)peopleProximityScanWaitInterval
{
  return self->_peopleProximityScanWaitInterval;
}

- (BOOL)peopleProximityScanIndefinitely
{
  return self->_peopleProximityScanIndefinitely;
}

- (BOOL)librarySelectionMockAutomationModeEnabled
{
  return self->_librarySelectionMockAutomationModeEnabled;
}

- (BOOL)librarySelectionMockLocationShiftingEnabled
{
  return self->_librarySelectionMockLocationShiftingEnabled;
}

- (BOOL)frontEnhancedHEICResolutionSupported
{
  return self->_frontEnhancedHEICResolutionSupported;
}

- (int64_t)frontCameraMaximumEnhancedResolution
{
  return self->_frontCameraMaximumEnhancedResolution;
}

- (BOOL)useFullResolutionThumbnailForRAWCaptures
{
  return self->_useFullResolutionThumbnailForRAWCaptures;
}

- (int64_t)minimumDiskSpaceReserved
{
  return self->_minimumDiskSpaceReserved;
}

- (BOOL)isMixAudioWithOthersSupported
{
  return self->_mixAudioWithOthersSupported;
}

- (BOOL)isCinematicAudioSupported
{
  return self->_cinematicAudioSupported;
}

- (BOOL)isWindRemovalSupported
{
  return self->_windRemovalSupported;
}

- (BOOL)isRegionalShutterSoundEnabled
{
  return self->_regionalShutterSoundEnabled;
}

- (BOOL)_isiPad
{
  return self->__iPad;
}

- (double)_frontPhotoModeMaximumZoomFactor
{
  return self->__frontPhotoModeMaximumZoomFactor;
}

- (double)_backVideoModeMaximumZoomFactor
{
  return self->__backVideoModeMaximumZoomFactor;
}

- (double)_frontVideoModeMaximumZoomFactor
{
  return self->__frontVideoModeMaximumZoomFactor;
}

- (double)_backDualPhotoModeMaximumZoomFactor
{
  return self->__backDualPhotoModeMaximumZoomFactor;
}

- (double)_backDualVideoModeMaximumZoomFactor
{
  return self->__backDualVideoModeMaximumZoomFactor;
}

- (double)_backDualSlomoModeMaximumZoomFactor
{
  return self->__backDualSlomoModeMaximumZoomFactor;
}

- (double)_frontDualPhotoModeMaximumZoomFactor
{
  return self->__frontDualPhotoModeMaximumZoomFactor;
}

- (double)_frontDualVideoModeMaximumZoomFactor
{
  return self->__frontDualVideoModeMaximumZoomFactor;
}

- (double)_backPortraitModeMaximumZoomFactor
{
  return self->__backPortraitModeMaximumZoomFactor;
}

- (double)_backTripleCameraPhotoModeMaximumZoomFactor
{
  return self->__backTripleCameraPhotoModeMaximumZoomFactor;
}

- (double)_backTripleCameraVideoModeMaximumZoomFactor
{
  return self->__backTripleCameraVideoModeMaximumZoomFactor;
}

- (double)_frontTripleCameraPhotoModeMaximumZoomFactor
{
  return self->__frontTripleCameraPhotoModeMaximumZoomFactor;
}

- (double)_frontTripleCameraVideoModeMaximumZoomFactor
{
  return self->__frontTripleCameraVideoModeMaximumZoomFactor;
}

- (double)_backWideDualCinematicModeMaximumZoomFactor
{
  return self->__backWideDualCinematicModeMaximumZoomFactor;
}

- (double)_frontDualCameraSwitchOverZoomFactor
{
  return self->__frontDualCameraSwitchOverZoomFactor;
}

- (double)_backWideDualCameraSwitchOverZoomFactor
{
  return self->__backWideDualCameraSwitchOverZoomFactor;
}

- (double)_frontWideDualCameraSwitchOverZoomFactor
{
  return self->__frontWideDualCameraSwitchOverZoomFactor;
}

- (double)_backCaptureInterval
{
  return self->__backCaptureInterval;
}

- (double)_frontCaptureInterval
{
  return self->__frontCaptureInterval;
}

- (BOOL)_backStageLightPortaitEffectsSupported
{
  return self->__backStageLightPortaitEffectsSupported;
}

- (BOOL)_frontStageLightPortaitEffectsSupported
{
  return self->__frontStageLightPortaitEffectsSupported;
}

- (BOOL)_wideDualPortraitLowLightSupported
{
  return self->__wideDualPortraitLowLightSupported;
}

- (BOOL)_preferWideDualPortrait
{
  return self->__preferWideDualPortrait;
}

- (BOOL)_disablePortraitBravoDevices
{
  return self->__disablePortraitBravoDevices;
}

- (BOOL)_disableSuperBravoDevice
{
  return self->__disableSuperBravoDevice;
}

- (BOOL)_disablePortraitFrontFacingZoomedCaptureDeviceFormat
{
  return self->__disablePortraitFrontFacingZoomedCaptureDeviceFormat;
}

- (BOOL)_backDualCameraSupportedForCinematic
{
  return self->__backDualCameraSupportedForCinematic;
}

- (int64_t)_forcedBackCamera
{
  return self->__forcedBackCamera;
}

- (BOOL)_allowZoomWithForcedBackCamera
{
  return self->__allowZoomWithForcedBackCamera;
}

- (BOOL)_processZoomWithoutUpscaleBack
{
  return self->__processZoomWithoutUpscaleBack;
}

- (BOOL)_processZoomWithoutUpscaleFront
{
  return self->__processZoomWithoutUpscaleFront;
}

- (NSDictionary)_FFCZoomBehaviorForCaptureMode
{
  return self->__FFCZoomBehaviorForCaptureMode;
}

- (BOOL)_isTripleCamera1080p60Supported
{
  return self->__tripleCamera1080p60Supported;
}

- (BOOL)_forceEnableExposureClippingIndicator
{
  return self->__forceEnableExposureClippingIndicator;
}

- (BOOL)_forceDisableExposureClippingIndicator
{
  return self->__forceDisableExposureClippingIndicator;
}

- (int64_t)_proResVideoMaxFPS1080p
{
  return self->__proResVideoMaxFPS1080p;
}

- (int64_t)_proResVideoMaxFPS4k
{
  return self->__proResVideoMaxFPS4k;
}

- (int64_t)_proResVideoExternalMaxFPS1080p
{
  return self->__proResVideoExternalMaxFPS1080p;
}

- (int64_t)_proResVideoExternalMaxFPS4k
{
  return self->__proResVideoExternalMaxFPS4k;
}

- (int64_t)_backDualCameraVideoCapture4kMaxFPS
{
  return self->__backDualCameraVideoCapture4kMaxFPS;
}

- (int64_t)_backWideDualCameraVideoCapture4kMaxFPS
{
  return self->__backWideDualCameraVideoCapture4kMaxFPS;
}

- (int64_t)_backTripleCameraVideoCapture4kMaxFPS
{
  return self->__backTripleCameraVideoCapture4kMaxFPS;
}

- (BOOL)_isActionModeAggregateDevice4k60Supported
{
  return self->__actionModeAggregateDevice4k60Supported;
}

- (BOOL)_isPreviewAspectRatioToggleSupportedForPhotoModes
{
  return self->__previewAspectRatioToggleSupportedForPhotoModes;
}

- (BOOL)_is1080pHFRVideoStabilizationSupported
{
  return self->__1080pHFRVideoStabilizationSupported;
}

- (BOOL)featureDevelopmentDefaultWideHighStabilization
{
  return self->_featureDevelopmentDefaultWideHighStabilization;
}

- (BOOL)_isQuadraPortraitSupported
{
  return self->__quadraPortraitSupported;
}

- (NSDictionary)_backCameraSupportedCompressedResolutionsByMode
{
  return self->__backCameraSupportedCompressedResolutionsByMode;
}

- (NSDictionary)_backCameraSupportedRAWResolutionsByMode
{
  return self->__backCameraSupportedRAWResolutionsByMode;
}

- (NSDictionary)_frontCameraSupportedCompressedResolutionsByMode
{
  return self->__frontCameraSupportedCompressedResolutionsByMode;
}

- (NSDictionary)_frontCameraSupportedRAWResolutionsByMode
{
  return self->__frontCameraSupportedRAWResolutionsByMode;
}

- (NSDictionary)_backCameraDefaultCompressedResolutionByMode
{
  return self->__backCameraDefaultCompressedResolutionByMode;
}

- (NSDictionary)_backCameraDefaultRAWResolutionByMode
{
  return self->__backCameraDefaultRAWResolutionByMode;
}

- (NSDictionary)_frontCameraDefaultCompressedResolutionByMode
{
  return self->__frontCameraDefaultCompressedResolutionByMode;
}

- (NSDictionary)_frontCameraDefaultRAWResolutionByMode
{
  return self->__frontCameraDefaultRAWResolutionByMode;
}

- (BOOL)_overlapping48MPCapturesSupported
{
  return self->__overlapping48MPCapturesSupported;
}

- (BOOL)_isAspectRatioCropThreeTwoSupported
{
  return self->__aspectRatioCropThreeTwoSupported;
}

- (CGRect)_lockButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__lockButtonFrame.origin.x;
  y = self->__lockButtonFrame.origin.y;
  width = self->__lockButtonFrame.size.width;
  height = self->__lockButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_volumeUpButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__volumeUpButtonFrame.origin.x;
  y = self->__volumeUpButtonFrame.origin.y;
  width = self->__volumeUpButtonFrame.size.width;
  height = self->__volumeUpButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_volumeDownButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__volumeDownButtonFrame.origin.x;
  y = self->__volumeDownButtonFrame.origin.y;
  width = self->__volumeDownButtonFrame.size.width;
  height = self->__volumeDownButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_cameraButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__cameraButtonFrame.origin.x;
  y = self->__cameraButtonFrame.origin.y;
  width = self->__cameraButtonFrame.size.width;
  height = self->__cameraButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_allowSpatialOverCaptureInPortraitMode
{
  return self->__allowSpatialOverCaptureInPortraitMode;
}

- (BOOL)_rearPortraitSemanticStylesSupported
{
  return self->__rearPortraitSemanticStylesSupported;
}

- (BOOL)_frontPortraitSemanticStylesSupported
{
  return self->__frontPortraitSemanticStylesSupported;
}

- (BOOL)_rearPortraitAspectRatioSupported
{
  return self->__rearPortraitAspectRatioSupported;
}

- (BOOL)_frontPortraitAspectRatioSupported
{
  return self->__frontPortraitAspectRatioSupported;
}

- (BOOL)_rearPortraitDeferredProcessingSupported
{
  return self->__rearPortraitDeferredProcessingSupported;
}

- (BOOL)_frontPortraitDeferredProcessingSupported
{
  return self->__frontPortraitDeferredProcessingSupported;
}

- (BOOL)_rearPhotoModeDepthSuggestionSupported
{
  return self->__rearPhotoModeDepthSuggestionSupported;
}

- (BOOL)_frontPhotoModeDepthSuggestionSupported
{
  return self->__frontPhotoModeDepthSuggestionSupported;
}

- (double)_maximumZoomFactorWithout24MPUpscale
{
  return self->__maximumZoomFactorWithout24MPUpscale;
}

- (BOOL)_zoomPIPSupportedForSlomo
{
  return self->__zoomPIPSupportedForSlomo;
}

- (BOOL)_backPhotoModeNightModeDepthSupported
{
  return self->__backPhotoModeNightModeDepthSupported;
}

- (BOOL)_backSuperWideTeleNightModeSupported
{
  return self->__backSuperWideTeleNightModeSupported;
}

- (NSSet)_supportedModesForPauseResumeVideo
{
  return self->__supportedModesForPauseResumeVideo;
}

- (BOOL)_isProResCinematicVideoSupported
{
  return self->__proResCinematicVideoSupported;
}

- (BOOL)_HDR10BitVideoSupports120FPS
{
  return self->__HDR10BitVideoSupports120FPS;
}

- (BOOL)_photoModeLightingControlSupported
{
  return self->__photoModeLightingControlSupported;
}

- (BOOL)_smartStylesAdditionalSystemStyleSupport
{
  return self->__smartStylesAdditionalSystemStyleSupport;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (BOOL)isHalfPressSupported
{
  return self->_halfPressSupported;
}

- (BOOL)allowHalfPressSimulation
{
  return self->_allowHalfPressSimulation;
}

- (BOOL)isHalfPressOverlayInProcess
{
  return self->_halfPressOverlayInProcess;
}

- (BOOL)isSwipeToOverlaySupported
{
  return self->_swipeToOverlaySupported;
}

- (BOOL)isActionButtonSupported
{
  return self->_actionButtonSupported;
}

- (BOOL)shouldPerformSuperWideAutoMacroMigration
{
  return self->_shouldPerformSuperWideAutoMacroMigration;
}

- (BOOL)isCTMSupportSupressed
{
  return self->_ctmSupportSuppressed;
}

- (BOOL)deviceSupportsCTM
{
  return self->_deviceSupportsCTM;
}

- (double)_forcedInitialZoomDisplayFactor
{
  return self->__forcedInitialZoomDisplayFactor;
}

- (BOOL)isCacheDeleteSupported
{
  return self->_cacheDeleteSupported;
}

- (BOOL)isCameraButtonSupported
{
  return self->_cameraButtonSupported;
}

- (BOOL)featureDevelopmentEmulateSuperWide
{
  return self->_featureDevelopmentEmulateSuperWide;
}

- (BOOL)featureDevelopmentForceSingleCamera
{
  return self->_featureDevelopmentForceSingleCamera;
}

- (BOOL)featureDevelopmentForceDepthDataCaptureInPhotoMode
{
  return self->_featureDevelopmentForceDepthDataCaptureInPhotoMode;
}

- (BOOL)featureDevelopmentIgnoreDepthSuggestionInPhotoMode
{
  return self->_featureDevelopmentIgnoreDepthSuggestionInPhotoMode;
}

- (BOOL)featureDevelopmentForceDepthEffectInPhotoMode
{
  return self->_featureDevelopmentForceDepthEffectInPhotoMode;
}

- (BOOL)featureDevelopmentHidePreviewOverlayBars
{
  return self->_featureDevelopmentHidePreviewOverlayBars;
}

- (BOOL)featureDevelopmentAllowAllHEICOptionsInPhotoPicker
{
  return self->_featureDevelopmentAllowAllHEICOptionsInPhotoPicker;
}

- (BOOL)featureDevelopmentShowLockIndicator
{
  return self->_featureDevelopmentShowLockIndicator;
}

- (BOOL)forceAllowAllInterfaceOrientations
{
  return self->_forceAllowAllInterfaceOrientations;
}

- (BOOL)disableAudio
{
  return self->_disableAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__supportedModesForPauseResumeVideo, 0);
  objc_storeStrong((id *)&self->__frontCameraDefaultRAWResolutionByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraDefaultCompressedResolutionByMode, 0);
  objc_storeStrong((id *)&self->__backCameraDefaultRAWResolutionByMode, 0);
  objc_storeStrong((id *)&self->__backCameraDefaultCompressedResolutionByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraSupportedRAWResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__frontCameraSupportedCompressedResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__backCameraSupportedRAWResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__backCameraSupportedCompressedResolutionsByMode, 0);
  objc_storeStrong((id *)&self->__FFCZoomBehaviorForCaptureMode, 0);
  objc_storeStrong((id *)&self->_peopleProximityDetectAdditionalEmail, 0);
  objc_storeStrong((id *)&self->_supportedCustomLensGroups, 0);
  objc_storeStrong((id *)&self->_availableCustomLenses, 0);
}

- (void)initWithHostProcess:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Unsupported focal length for picker: %ld", a5, a6, a7, a8, 0);
}

- (void)initWithHostProcess:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Unhandled value for CAMFeatureDevelopmentLowLightPreviewStyle: %ld", a5, a6, a7, a8, 0);
}

- (void)validatedVideoConfigurationForVideoConfiguration:(os_log_t)log withBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Failed to find a valid fallback video configuration.", v1, 2u);
}

- (void)captureStyleForCaptureWithSupport:(void *)a1 styles:(const char *)a2 selectedStyleIndex:smartStyleSystemStyleIndex:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v2, v3, "System style index %ld is out of range 0-%ld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)captureStyleForCaptureWithSupport:(void *)a1 styles:(const char *)a2 selectedStyleIndex:smartStyleSystemStyleIndex:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v2, v3, "Selected semantic style index %ld is out of range 0-%ld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

@end
