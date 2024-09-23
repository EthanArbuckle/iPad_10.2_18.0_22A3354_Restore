@implementation CAMCaptureConversions

+ (id)previewLayerVideoGravityForPreviewViewAspectMode:(int64_t)a3
{
  id *v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = (id *)MEMORY[0x1E0C8A6D8];
  }
  else
  {
    v3 = (id *)MEMORY[0x1E0C8A6E0];
  }
  return *v3;
}

+ (int64_t)captureHDRModeForHDRMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)captureFlashModeForFlashMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)captureTorchModeForTorchMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)exposureModeForCaptureExposureMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 2;
  else
    return a3;
}

+ (int64_t)focusModeForCaptureFocusMode:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = 3;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)captureWhiteBalanceModeForWhiteBalanceMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)captureExposureModeForExposureMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 2;
  else
    return a3;
}

+ (int64_t)flashModeForCaptureFlashMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)torchModeForCaptureTorchMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)hdrModeForCaptureHDRMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)captureFocusModeForFocusMode:(int64_t)a3 isPerformingContrastBasedFocus:(BOOL)a4
{
  int64_t v4;

  v4 = 2;
  if (!a3)
    v4 = 0;
  if (a3 == 1)
    v4 = a4;
  if (a3 == 2)
    return 1;
  else
    return v4;
}

+ (int64_t)whiteBalanceModeForCaptureWhiteBalanceMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)viewContentModeForPreviewViewAspectMode:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2;
}

+ (int64_t)shallowDepthOfFieldStatusForCaptureStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xF)
    return 0;
  else
    return a3;
}

+ (int64_t)stagePreviewStatusForCaptureStatus:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)AVDevicePositionForCAMDevicePosition:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

+ (int64_t)CAMDevicePositionForAVDevicePosition:(int64_t)a3
{
  return a3 == 2;
}

+ (id)AVCaptureDeviceTypeForCAMCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 8)
    return 0;
  else
    return **((id **)&unk_1EA32EDE8 + a3 - 2);
}

+ (int64_t)AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

+ (int64_t)CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (int64_t)torchModeForFlashMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)flashModeForTorchMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)captureDigitalFlashModeForLowLightMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)lowLightStatusForCaptureStatus:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 4)
    return 0;
  else
    return a3;
}

+ (int64_t)overCapturePreviewStatusForAVPreviewStatus:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
    return 4;
  else
    return a3;
}

+ (unint64_t)CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:(unint64_t)a3
{
  return a3 & 7;
}

+ ($2825F4736939C4A6D3AD43837233062D)CMVideoDimensionsForCAMPhotoResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return ($2825F4736939C4A6D3AD43837233062D)0;
  else
    return ($2825F4736939C4A6D3AD43837233062D)(qword_1DB9A7B90[a3 - 1] | qword_1DB9A7B78[a3 - 1]);
}

+ (int64_t)AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (int64_t)AVCaptureColorSpaceForColorSpace:(int64_t)a3 hasValidConversion:(BOOL *)a4
{
  BOOL v4;
  int64_t v5;
  int64_t result;

  v4 = a3 != 1;
  if (a3 == 2)
  {
    v4 = 1;
    v5 = 2;
  }
  else
  {
    v5 = a3 == 1;
  }
  if (a3 == 3)
  {
    v4 = 1;
    result = 3;
  }
  else
  {
    result = v5;
  }
  if (a4)
    *a4 = v4;
  return result;
}

+ (int64_t)CAMStereoCaptureStatusForAVStereoCaptureStatus:(unint64_t)a3
{
  return a3 & 7;
}

+ (int64_t)CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)buttonPhaseForCaptureButtonPhase:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = 3;
  if (a3)
    return v3;
  else
    return 0;
}

+ (int64_t)AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:(unint64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

+ (id)AVSmartStyleCastTypeForCEKCastType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return 0;
  else
    return **((id **)&unk_1EA32EE30 + a3);
}

+ (int64_t)CEKSmartStylePresetTypeForAVSmartStyleCastType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (CEKSmartStylePresetTypeForAVSmartStyleCastType__onceToken != -1)
    dispatch_once(&CEKSmartStylePresetTypeForAVSmartStyleCastType__onceToken, &__block_literal_global_49);
  objc_msgSend((id)CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 1;

  return v6;
}

void __72__CAMCaptureConversions_CEKSmartStylePresetTypeForAVSmartStyleCastType___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  CEKSmartStyleAllPresetTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "integerValue", (_QWORD)v10);
        if (v7)
        {
          +[CAMCaptureConversions AVSmartStyleCastTypeForCEKCastType:](CAMCaptureConversions, "AVSmartStyleCastTypeForCEKCastType:", objc_msgSend(MEMORY[0x1E0D0D098], "castTypeForPresetType:", v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, v8);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

  v9 = (void *)CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType;
  CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType = (uint64_t)v0;

}

+ (id)PISemanticStyleCastForCEKCastType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return 0;
  else
    return **((id **)&unk_1EA32EEA8 + a3);
}

+ (id)AVCaptureSmartStyleForCEKSmartStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "AVSmartStyleCastTypeForCEKCastType:", objc_msgSend(v4, "castType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C8B118];
    objc_msgSend(v4, "castIntensity");
    v8 = v7;
    objc_msgSend(v4, "toneBias");
    v10 = v9;
    objc_msgSend(v4, "colorBias");
    v12 = v11;

    *(float *)&v13 = v12;
    *(float *)&v14 = v8;
    *(float *)&v15 = v10;
    objc_msgSend(v6, "styleWithCast:intensity:toneBias:colorBias:", v5, v14, v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)CEKSmartStyleForAVCaptureSmartStyle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(v4, "cast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "CEKSmartStylePresetTypeForAVSmartStyleCastType:", v5);

  v7 = objc_alloc(MEMORY[0x1E0D0D098]);
  objc_msgSend(v4, "intensity");
  v9 = v8;
  objc_msgSend(v4, "toneBias");
  v11 = v10;
  objc_msgSend(v4, "colorBias");
  v13 = v12;

  return (id)objc_msgSend(v7, "initWithPresetType:castIntensity:toneBias:colorBias:", v6, v9, v11, v13);
}

@end
