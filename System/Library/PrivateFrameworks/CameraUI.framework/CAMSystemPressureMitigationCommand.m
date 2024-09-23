@implementation CAMSystemPressureMitigationCommand

- (void)executeWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  CMTimeEpoch v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFAllocator *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime time;
  CMTime v34;
  CMTime v35;
  CMTime time2;
  CMTime v37;
  CMTime v38;
  CMTime time1;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentCaptureSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isBackPortraitModeSupported") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "isFrontPortraitModeSupported");
  objc_msgSend(v4, "sessionPreset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8A1A0]);

  objc_msgSend(v5, "activeFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cam_supportsPortraitFrontFacingZoomed");

  if (v7 && v9 | v11)
  {
    *(_OWORD *)&v38.value = *MEMORY[0x1E0CA2E18];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v38.epoch = v12;
    v29 = *(_OWORD *)&v38.value;
    *(_OWORD *)&v37.value = *(_OWORD *)&v38.value;
    v37.epoch = v12;
    objc_msgSend(v3, "currentStillImageOutput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isDepthDataDeliveryEnabled");
    objc_msgSend(v3, "currentVideoPreviewLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "videoPreviewFilters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[CAMEffectFilterManager isDepthEffectInFilters:](CAMEffectFilterManager, "isDepthEffectInFilters:", v16);

    if (v14 && v17)
    {
      objc_msgSend(v5, "systemPressureState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recommendedFrameRateRangeForPortrait");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "maxFrameDuration");
        v38 = time1;
        objc_msgSend(v20, "minFrameDuration");
      }
      else
      {
        memset(&v38, 0, sizeof(v38));
        memset(&time1, 0, sizeof(time1));
      }
      v37 = time1;

    }
    if (v5)
      objc_msgSend(v5, "activeVideoMinFrameDuration");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = v37;
    if (CMTimeCompare(&time1, &time2))
      goto LABEL_20;
    if (v5)
      objc_msgSend(v5, "activeVideoMaxFrameDuration");
    else
      memset(&v35, 0, sizeof(v35));
    time1 = v38;
    if (CMTimeCompare(&time1, &v35))
    {
LABEL_20:
      v28 = v15;
      v21 = v13;
      v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      time1 = v37;
      v23 = (__CFString *)CMTimeCopyDescription(v22, &time1);
      time1 = v38;
      v24 = (__CFString *)CMTimeCopyDescription(v22, &time1);
      time1 = v37;
      *(_OWORD *)&v34.value = v29;
      v34.epoch = v12;
      if (CMTimeCompare(&time1, &v34)
        || (time1 = v38, *(_OWORD *)&v34.value = v29, v34.epoch = v12, CMTimeCompare(&time1, &v34)))
      {
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 138543618;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v23;
          LOWORD(time1.flags) = 2114;
          *(_QWORD *)((char *)&time1.flags + 2) = v24;
          _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "SystemPressureState: setting min/maxFrameDuration %{public}@/%{public}@", (uint8_t *)&time1, 0x16u);
        }
      }
      else
      {
        if (v5)
        {
          objc_msgSend(v5, "activeVideoMinFrameDuration");
          v25 = CMTimeCopyDescription(v22, &time);
          objc_msgSend(v5, "activeVideoMaxFrameDuration");
        }
        else
        {
          memset(&time, 0, sizeof(time));
          v25 = CMTimeCopyDescription(v22, &time);
          memset(&v32, 0, sizeof(v32));
        }
        v26 = (__CFString *)CMTimeCopyDescription(v22, &v32);
        v27 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 138543618;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v25;
          LOWORD(time1.flags) = 2114;
          *(_QWORD *)((char *)&time1.flags + 2) = v26;
          _os_log_impl(&dword_1DB760000, v27, OS_LOG_TYPE_DEFAULT, "SystemPressureState: setting min/maxFrameDuration to default values for current preset (previously %{public}@/%{public}@)", (uint8_t *)&time1, 0x16u);
        }

      }
      v13 = v21;

      v15 = v28;
    }
    v31 = v37;
    objc_msgSend(v5, "setActiveVideoMinFrameDuration:", &v31);
    v30 = v38;
    objc_msgSend(v5, "setActiveVideoMaxFrameDuration:", &v30);

  }
}

@end
