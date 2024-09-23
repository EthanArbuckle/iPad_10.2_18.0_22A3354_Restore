@implementation CAMUserPreferences

+ (CAMUserPreferences)preferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CAMUserPreferences_preferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preferences_onceToken != -1)
    dispatch_once(&preferences_onceToken, block);
  return (CAMUserPreferences *)(id)preferences_sharedInstance;
}

void __33__CAMUserPreferences_preferences__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  CAMUserPreferences *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v36 = objc_alloc_init(CAMUserPreferences);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_fallBackToCameraDefaultsForBundleIdentifier:", v2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSuiteNamed:", CFSTR("com.apple.camera"));
  }
  else
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.camera.lockscreen")))
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.camera"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v3;
  }
  objc_msgSend(*(id *)(a1 + 32), "defaultCaptureConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "device");
  v35 = v2;
  if ((unint64_t)(v5 - 1) > 0xA)
    v6 = 0;
  else
    v6 = qword_1DB9A4F38[v5 - 1];
  v32 = objc_alloc(MEMORY[0x1E0C99E08]);
  v31 = *MEMORY[0x1E0D75080];
  v30 = *MEMORY[0x1E0D75078];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v54, "isImageAnalysisSupported"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "mode"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "flashMode"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "torchMode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "HDRMode"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "timerDuration"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "photoModeAspectRatioCrop"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "photoModeEffectFilterType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "squareModeEffectFilterType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "portraitModeEffectFilterType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "photoModeEffectFilterType"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "squareModeEffectFilterType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "portraitModeEffectFilterType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "portraitModeLightingEffectType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "portraitModeApertureValue");
  objc_msgSend(v7, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "portraitModeIntensityValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "mirrorFrontCameraCaptures"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v54, "semanticDevelopmentSupported"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "rawMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v54, "macroControlEnabledByDefault") ^ 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "macroMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "optionalDepthEffectEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v54, "resolvedDefaultCustomLens"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "videoStabilizationMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "zoomPIPEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "initWithObjectsAndKeys:", CFSTR("CAMUserPreferenceHDREV0"), MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferenceModernHDRKeepNormalPhoto"), MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceModernHDRBehavior"), &unk_1EA3B0190, v31, &unk_1EA3B0190, v30, &unk_1EA3B0190, CFSTR("CAMUserPreferenceCinematicConfiguration"), MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferenceShowGridOverlay"), MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferenceShowHorizonLevelPlumb"), MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceShowQRCodeBanners"),
                  v53,
                  CFSTR("CAMUserPreferenceShowImageAnalysis"),
                  MEMORY[0x1E0C9AAA0],
                  CFSTR("CAMUserPreferenceCTMDidAcknowledgeDescription"),
                  &unk_1EA3B0190,
                  CFSTR("CAMUserPreferencePreviewAspectModeForPhotoModes"),
                  &unk_1EA3B0190,
                  CFSTR("CAMUserPreferencePreviewViewAspectMode"),
                  MEMORY[0x1E0C9AAA0],
                  CFSTR("CAMUserPreferenceDidMigrate"),
                  v52,
                  CFSTR("CAMUserPreferenceCaptureMode"),
                  v51,
                  CFSTR("CAMUserPreferenceCaptureDevice"),
                  v50,
                  CFSTR("CAMUserPreferenceDesiredFlashMode"),
                  v49,
                  CFSTR("CAMUserPreferenceTorchMode"),
                  v48,
                  CFSTR("CAMUserPreferenceDesiredHDRMode"),
                  &unk_1EA3B0190,
                  CFSTR("CAMUserPreferenceFlashAndHDRConflictingControl"),
                  v47,
                  CFSTR("CAMUserPreferenceTimerDuration"),
                  v46,
                  CFSTR("CAMUserPreferenceAspectRatioCrop"),
                  v45,
                  CFSTR("CAMUserPreferenceDesiredPhotoModeEffectFilterType"),
                  v44,
                  CFSTR("CAMUserPreferenceSquareModeEffectFilterType"),
                  v43,
                  CFSTR("CAMUserPreferencePortraitModeEffectFilterType"),
                  v42,
                  CFSTR("CAMUserPreferencePhotoModeLastCapturedEffectFilterType"),
                  v38,
                  CFSTR("CAMUserPreferenceSquareModeLastCapturedEffectFilterType"),
                  v41,
                  CFSTR("CAMUserPreferencePortraitModeLastCapturedEffectFilterType"),
                  v40,
                  CFSTR("CAMUserPreferencePortraitModeLightingEffectType"),
                  v39,
                  CFSTR("CAMUserPreferencePortraitModeApertureValue"),
                  v9,
                  CFSTR("CAMUserPreferencePortraitEffectIntensityValue"));

  if (objc_msgSend(v54, "isLivePhotoSupported"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "irisMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, CFSTR("CAMUserPreferenceDesiredIrisMode"));

  }
  if ((objc_msgSend(v54, "isDualSupported") & 1) != 0
    || (objc_msgSend(v54, "isWideDualSupported") & 1) != 0
    || objc_msgSend(v54, "isTripleCameraSupported"))
  {
    v16 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v16, CFSTR("CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"));
  }
  if (objc_msgSend(v54, "isAutoLowLightVideoSupported"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceAutoLowLightVideoEnabled"));
  if (objc_msgSend(v54, "isLowLightSupported"))
    v17 = &unk_1EA3B0208;
  else
    v17 = &unk_1EA3B01A8;
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v17, CFSTR("CAMUserPreferenceDesiredNightMode"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1EA3B01A8, CFSTR("CAMUserPreferenceNightModeConflicts"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferencePreserveNightMode"));
  v18 = objc_msgSend(v54, "defaultPhotoResolutionForMode:devicePosition:encodingBehavior:", 0, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v19, CFSTR("CAMUserPreferenceMaximumHEICPhotoResolution"));

  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1EA3B0190, CFSTR("CAMUserPreferenceProRawFileFormat"));
  v20 = objc_msgSend(v54, "defaultPhotoResolutionForMode:devicePosition:encodingBehavior:", 0, 0, 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, CFSTR("CAMUserPreferenceMaximumRAWPhotoResolution"));

  LODWORD(v25) = 0;
  objc_msgSend(v54, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, objc_msgSend(v54, "preferredDeviceForPosition:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", 0, 6, 0, 0, 0), 0, 1, 0, 1, 0, v25, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v22, CFSTR("CAMUserPreferencePortraitModeRearZoomValue"));

  if (objc_msgSend(v54, "photoModeDepthSuggestionSupported"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceEnableDepthSuggestion"));
  if (objc_msgSend(v54, "isInternalInstall"))
  {
    v23 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("CAMUserPreferenceEnableLockAsShutter"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, CFSTR("CAMUserPreferenceDebugTransientAssets"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, CFSTR("CAMUserPreferenceDebugBurstRespectsEncodingSettings"));
  }
  objc_msgSend(v34, "registerDefaults:", v33);
  -[CAMUserPreferences _setUnderlyingUserDefaults:](v36, "_setUnderlyingUserDefaults:", v34);
  v24 = (void *)preferences_sharedInstance;
  preferences_sharedInstance = (uint64_t)v36;

}

+ (BOOL)_fallBackToCameraDefaultsForBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.camera.CameraMessagesApp"), CFSTR("com.apple.Camera-API"), CFSTR("com.apple.AssetExplorerTester"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)_defaultCaptureConfiguration
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CAMCaptureConfiguration *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  CAMCaptureConfiguration *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFrontFlashSupported") & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v5 = objc_msgSend(v3, "isBackFlashSupported");
    v4 = 2;
    if (!v5)
      v4 = 0;
  }
  v37 = v4;
  if ((objc_msgSend(v3, "isFrontAutomaticHDRSupported") & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v3, "isBackAutomaticHDRSupported"))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "isLivePhotoSupported");
  v8 = objc_msgSend(v3, "isLivePhotoAutoModeSupported");
  v34 = objc_msgSend(v3, "isSuperWideAutoMacroSupported");
  v9 = objc_msgSend(a1, "defaultMode");
  v10 = objc_msgSend(a1, "defaultDevice");
  v11 = objc_msgSend(v3, "isSmartHDRSupported");
  v36 = objc_msgSend(a1, "defaultFilterTypeForMode:", 0);
  v35 = objc_msgSend(a1, "defaultFilterTypeForMode:", 4);
  v33 = objc_msgSend(a1, "defaultFilterTypeForMode:", 6);
  v32 = objc_msgSend(a1, "defaultLightingTypeForMode:", 6);
  v12 = objc_msgSend(v3, "semanticStylesVersion");
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D0D098], "defaultStylesIncludingSystemStyles:systemStylePlaceholder:creativeStyles:", objc_msgSend(v3, "allowSystemSmartStylesInPicker"), 1, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObjectPassingTest:", &__block_literal_global_10);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = 0;
    else
      v16 = v15;
    v31 = v16;
    v13 = v15;
  }
  else if (v12)
  {
    v31 = 0;
    v14 = 0;
  }
  else
  {
    +[CAMSemanticStyle defaultStyles](CAMSemanticStyle, "defaultStyles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
  }
  if ((unint64_t)(v10 - 1) > 0xA)
    v17 = 0;
  else
    v17 = qword_1DB9A4F38[v10 - 1];
  if (v11)
    v18 = 1;
  else
    v18 = v6;
  v30 = v18;
  if (v8)
    v19 = 2;
  else
    v19 = v7;
  v20 = objc_msgSend(v3, "defaultPhotoResolutionForMode:devicePosition:encodingBehavior:", v9, v17, 1);
  v21 = [CAMCaptureConfiguration alloc];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultPortraitEffectIntensity");
  v24 = v23;
  objc_msgSend(a1, "_defaultExposureBiasesByMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v29) = 0;
  LOWORD(v29) = objc_msgSend(v3, "isZoomPIPSupported");
  LOBYTE(v28) = 0;
  v26 = -[CAMCaptureConfiguration initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:](v21, "initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:", v9, v10, 0, 0, 1, v37, 0.0, v24, 0, v30, v19, 0,
          0,
          v36,
          v35,
          v33,
          v32,
          v28,
          v25,
          v34,
          v20,
          0,
          0,
          v14,
          v31,
          v13,
          0,
          v29,
          0);

  return v26;
}

+ (int64_t)defaultFilterTypeForMode:(int64_t)a3
{
  return 16 * ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6);
}

+ (int64_t)defaultLightingTypeForMode:(int64_t)a3
{
  void *v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "isLightingControlSupportedForMode:", a3);

  return a3;
}

- (void)_setUnderlyingUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->__underlyingUserDefaults, a3);
}

- (NSUserDefaults)_underlyingUserDefaults
{
  return self->__underlyingUserDefaults;
}

- (int64_t)_sanitizeEffectFilterType:(int64_t)a3 forMode:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[CAMUserPreferences filterTypesForMode:](self, "filterTypesForMode:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "indexOfObject:", v7),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    a3 = +[CAMUserPreferences defaultFilterTypeForMode:](CAMUserPreferences, "defaultFilterTypeForMode:", a4);
  }

  return a3;
}

- (id)filterTypesForMode:(int64_t)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLiveFilteringSupported"))
    v5 = (unint64_t)a3 > 6;
  else
    v5 = 1;
  if (v5)
    v6 = 0;
  else
    v6 = (void *)qword_1EA32A258[a3];

  return v6;
}

- (int64_t)_sanitizeLightingType:(int64_t)a3 forMode:(int64_t)a4
{
  uint64_t v5;
  int64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;

  v5 = objc_msgSend((id)objc_opt_class(), "defaultLightingTypeForMode:", a4);
  if (!v5)
    return 0;
  v6 = v5;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedEffectSetForDevicePosition:", 0);
  v9 = objc_msgSend(v7, "supportedEffectSetForDevicePosition:", 1);
  v10 = 0;
  if (v8 <= 3)
    v10 = (void *)qword_1EA32A290[v8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if ((v12 & 1) == 0)
  {
    if (v9 > 3)
      v13 = 0;
    else
      v13 = (void *)qword_1EA32A290[v9];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (!v15)
      a3 = v6;
  }

  return a3;
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (void)_setDidResetTorchMode:(BOOL)a3
{
  self->_didResetTorchMode = a3;
}

- (CAMCaptureConfiguration)captureConfiguration
{
  return self->_captureConfiguration;
}

- (CAMConflictingControlConfiguration)conflictingControlConfiguration
{
  return self->_conflictingControlConfiguration;
}

- (int64_t)photoEncodingBehavior
{
  void *v3;
  int64_t v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isHEVCEncodingSupported"))
    v4 = -[CAMUserPreferences _preferHEVCWhenAvailable](self, "_preferHEVCWhenAvailable");
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldShowQRBanners
{
  void *v3;
  BOOL v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "hostProcess") & 0xFFFFFFFFFFFFFFFBLL) == 0;
  if (!-[CAMUserPreferences QRBannersEnabledInSettings](self, "QRBannersEnabledInSettings")
    && !-[CAMUserPreferences forceEnableQRBanners](self, "forceEnableQRBanners"))
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)QRBannersEnabledInSettings
{
  return self->_QRBannersEnabledInSettings;
}

- (int64_t)preferredMinimumFreeBytes
{
  return self->_preferredMinimumFreeBytes;
}

- (BOOL)didAcknowledgePortraitModeDescription
{
  return self->_didAcknowledgePortraitModeDescription;
}

- (BOOL)forceEnableQRBanners
{
  return self->_forceEnableQRBanners;
}

- (BOOL)shouldUseModernHDRBehavior
{
  return self->_shouldUseModernHDRBehavior;
}

- (BOOL)preserveEffectFilter
{
  return self->_preserveEffectFilter;
}

- (BOOL)shouldShowGridView
{
  return self->_shouldShowGridView;
}

- (int64_t)photoModeLastCapturedEffectFilterType
{
  return self->_photoModeLastCapturedEffectFilterType;
}

- (BOOL)isLockAsShutterEnabled
{
  return self->_lockAsShutterEnabled;
}

- (BOOL)shouldDelayRemotePersistence
{
  return self->_shouldDelayRemotePersistence;
}

- (void)setPhotoModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_photoModeLastCapturedEffectFilterType = a3;
}

- (BOOL)shouldCaptureHDREV0
{
  return self->_shouldCaptureHDREV0;
}

- (void)setCaptureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_captureConfiguration, a3);
}

- (void)setConflictingControlConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_conflictingControlConfiguration, a3);
}

- (void)writePreferences
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  char v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences _previewAspectModeForPhotoModes](self, "_previewAspectModeForPhotoModes"), CFSTR("CAMUserPreferencePreviewAspectModeForPhotoModes"));
  objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences _previewAspectModeForVideoModes](self, "_previewAspectModeForVideoModes"), CFSTR("CAMUserPreferencePreviewViewAspectMode"));
  -[CAMUserPreferences captureConfiguration](self, "captureConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences conflictingControlConfiguration](self, "conflictingControlConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredFlashMode"), CFSTR("CAMUserPreferenceDesiredFlashMode"));
  objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredHDRMode"), CFSTR("CAMUserPreferenceDesiredHDRMode"));
  objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "flashAndHDRConflictingControl"), CFSTR("CAMUserPreferenceFlashAndHDRConflictingControl"));
  v6 = objc_msgSend(v4, "device");
  if ((unint64_t)(v6 - 1) > 0xA)
    v7 = 0;
  else
    v7 = qword_1DB9A4F38[v6 - 1];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLivePhotoSupported"))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "irisMode"), CFSTR("CAMUserPreferenceDesiredIrisMode"));
  v9 = objc_msgSend(v8, "hostProcess");
  if (v9 <= 4 && v9 != 3)
  {
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "mode"), CFSTR("CAMUserPreferenceCaptureMode"));
    objc_msgSend(v3, "setInteger:forKey:", v7, CFSTR("CAMUserPreferenceCaptureDevice"));
  }
  objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "torchMode"), CFSTR("CAMUserPreferenceTorchMode"));
  objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "timerDuration"), CFSTR("CAMUserPreferenceTimerDuration"));
  if (objc_msgSend(v8, "isCTMSupported"))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "photoModeAspectRatioCrop"), CFSTR("CAMUserPreferenceAspectRatioCrop"));
  if (objc_msgSend(v8, "isLiveFilteringSupported"))
  {
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "photoModeEffectFilterType"), CFSTR("CAMUserPreferenceDesiredPhotoModeEffectFilterType"));
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "squareModeEffectFilterType"), CFSTR("CAMUserPreferenceSquareModeEffectFilterType"));
    objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences photoModeLastCapturedEffectFilterType](self, "photoModeLastCapturedEffectFilterType"), CFSTR("CAMUserPreferencePhotoModeLastCapturedEffectFilterType"));
    objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences squareModeLastCapturedEffectFilterType](self, "squareModeLastCapturedEffectFilterType"), CFSTR("CAMUserPreferenceSquareModeLastCapturedEffectFilterType"));
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "portraitModeEffectFilterType"), CFSTR("CAMUserPreferencePortraitModeEffectFilterType"));
    objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences portraitModeLastCapturedEffectFilterType](self, "portraitModeLastCapturedEffectFilterType"), CFSTR("CAMUserPreferencePortraitModeLastCapturedEffectFilterType"));
  }
  objc_msgSend(v3, "setInteger:forKey:", -[CAMUserPreferences portraitModeRearDevice](self, "portraitModeRearDevice"), CFSTR("CAMUserPreferencePortraitModeRearDevice"));
  -[CAMUserPreferences portraitModeRearZoomValue](self, "portraitModeRearZoomValue");
  *(float *)&v10 = v10;
  objc_msgSend(v3, "setFloat:forKey:", CFSTR("CAMUserPreferencePortraitModeRearZoomValue"), v10);
  if (objc_msgSend(v8, "arePortraitEffectsSupported"))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "portraitModeLightingEffectType"), CFSTR("CAMUserPreferencePortraitModeLightingEffectType"));
  if (objc_msgSend(v8, "isDepthEffectApertureSupported"))
  {
    objc_msgSend(v4, "portraitModeApertureValue");
    *(float *)&v11 = v11;
    objc_msgSend(v3, "setFloat:forKey:", CFSTR("CAMUserPreferencePortraitModeApertureValue"), v11);
    objc_msgSend(v4, "portraitModeIntensityValue");
    *(float *)&v12 = v12;
    objc_msgSend(v3, "setFloat:forKey:", CFSTR("CAMUserPreferencePortraitEffectIntensityValue"), v12);
  }
  if (objc_msgSend(v8, "isExposureSliderSupported"))
  {
    objc_msgSend(v4, "exposureBiasesByMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMPreferencesUtilities setDictionary:forKey:defaults:](CAMPreferencesUtilities, "setDictionary:forKey:defaults:", v13, CFSTR("CAMUserPreferenceExposureBiasByMode"), v3);

  }
  if (objc_msgSend(v8, "isSuperWideAutoMacroSupported"))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredMacroMode"), CFSTR("CAMUserPreferenceAutoMacroMode"));
  if (-[CAMUserPreferences shouldUseDepthSuggestionInPhotoMode](self, "shouldUseDepthSuggestionInPhotoMode"))
    objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v4, "optionalDepthEffectEnabled"), CFSTR("CAMUserPreferenceOptionalDepthEffectEnabled"));
  if (-[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled"))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredRAWMode"), CFSTR("CAMUserPreferencesDesiredRAWMode"));
  if (-[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled")
    || -[CAMUserPreferences photoFormatControlEnabled](self, "photoFormatControlEnabled"))
  {
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "photoFormatConflicts"), CFSTR("CAMUserPreferencesRAWConflicts"));
  }
  if (-[CAMUserPreferences photoFormatControlEnabled](self, "photoFormatControlEnabled"))
  {
    if ((unint64_t)objc_msgSend(v5, "desiredPhotoResolution") > 2
      || -[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled") && objc_msgSend(v5, "desiredRAWMode") == 1)
    {
      objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredPhotoResolution"), CFSTR("CAMUserPreferencesDesiredPhotoResolution"));
    }
    else
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferencesDesiredPhotoResolution"));
    }
  }
  if (objc_msgSend(v8, "isProResVideoSupported")
    && -[CAMUserPreferences isProResControlEnabled](self, "isProResControlEnabled"))
  {
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "proResVideoMode"), CFSTR("CAMUserPreferenceDesiredProResVideoMode"));
  }
  if (objc_msgSend(v8, "isLowLightSupported"))
  {
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "desiredLowLightControlMode"), CFSTR("CAMUserPreferenceDesiredNightMode"));
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v5, "lowLightConflicts"), CFSTR("CAMUserPreferenceNightModeConflicts"));
  }
  if ((objc_msgSend(v8, "semanticStylesSupport") & 8) != 0)
  {
    v14 = objc_msgSend(v8, "smartStylesSupported");
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "semanticStyles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __38__CAMUserPreferences_writePreferences__block_invoke;
    v55[3] = &unk_1EA32A110;
    v58 = v14;
    v17 = v4;
    v56 = v17;
    v18 = v15;
    v57 = v18;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v55);

    CFPreferencesSetAppValue((CFStringRef)-[CAMUserPreferences _semanticStylesKey](self, "_semanticStylesKey"), v18, CFSTR("com.apple.camera"));
    if (v14)
    {
      v53 = v5;
      v19 = objc_msgSend(v17, "smartStyleSystemStyleIndex");
      objc_msgSend(v17, "semanticStyles");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 >= objc_msgSend(v20, "count"))
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend(v17, "semanticStyles");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v17, "smartStyleSystemStyleIndex"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[CAMUserPreferences lastReadSystemStyle](self, "lastReadSystemStyle");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v52 = (void *)v23;
      v25 = 0;
      if (v22 && v23)
      {
        if ((objc_msgSend(v22, "isEqualToSmartStyle:", v23) & 1) != 0)
        {
          v24 = 0;
          v25 = 0;
        }
        else
        {
          objc_msgSend(v22, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v51 = v22;
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSmartStylesSystemStyleOverride"), v25, CFSTR("com.apple.camera"));
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSmartStylesSystemStyleOverrideReference"), v24, CFSTR("com.apple.camera"));
      v26 = objc_msgSend(v17, "selectedSemanticStyleIndex");
      if (v26 == objc_msgSend(v17, "smartStyleSystemStyleIndex"))
      {
        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSmartStylesSelectedPreset"), 0, CFSTR("com.apple.camera"));
      }
      else
      {
        v27 = objc_msgSend(v17, "selectedSemanticStyleIndex", v51);
        objc_msgSend(v17, "semanticStyles");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMUserPreferences _writeSmartStylePresetStringForIndex:inStyles:key:](self, "_writeSmartStylePresetStringForIndex:inStyles:key:", v27, v28, CFSTR("CAMUserPreferenceSmartStylesSelectedPreset"));

      }
      v5 = v53;
    }
    else
    {
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSelectedSemanticStyleIndex"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "selectedSemanticStyleIndex")), CFSTR("com.apple.camera"));
    }
    CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));

  }
  if (objc_msgSend((id)objc_opt_class(), "isSharedLibrarySupportedAndEnabledForCapabilities:", v8))
  {
    v54 = v5;
    v29 = objc_msgSend(v4, "sharedLibraryMode");
    objc_msgSend(v3, "setInteger:forKey:", v29, CFSTR("CAMUserPreferenceSharedLibraryMode"));
    v30 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      CAMSharedLibraryModeDescription(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_impl(&dword_1DB760000, v30, OS_LOG_TYPE_DEFAULT, "[CAMUserPreferences] write sharedLibraryMode:%{public}@", buf, 0xCu);

    }
    -[CAMUserPreferences sharedLibraryLastLocation](self, "sharedLibraryLastLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0CB36F8];
      -[CAMUserPreferences sharedLibraryLastLocation](self, "sharedLibraryLastLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "archivedDataWithRootObject:requiringSecureCoding:error:", v34, 1, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = 0;
    }

    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("CAMUserPreferenceSharedLibraryLastLocation"));
    objc_msgSend(v3, "setBool:forKey:", -[CAMUserPreferences sharedLibraryLastLocationAcquiredDuringTrip](self, "sharedLibraryLastLocationAcquiredDuringTrip"), CFSTR("CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"));
    -[CAMUserPreferences sharedLibraryLastDiscoveryDate](self, "sharedLibraryLastDiscoveryDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryDate"));

    -[CAMUserPreferences sharedLibraryLastDiscoveryLocation](self, "sharedLibraryLastDiscoveryLocation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)MEMORY[0x1E0CB36F8];
      -[CAMUserPreferences sharedLibraryLastDiscoveryLocation](self, "sharedLibraryLastDiscoveryLocation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = 0;
    }

    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryLocation"));
    -[CAMUserPreferences sharedLibraryLastUserActionDate](self, "sharedLibraryLastUserActionDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("CAMUserPreferenceSharedLibraryLastUserActionDate"));

    -[CAMUserPreferences sharedLibraryLastUserActionLocation](self, "sharedLibraryLastUserActionLocation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = (void *)MEMORY[0x1E0CB36F8];
      -[CAMUserPreferences sharedLibraryLastUserActionLocation](self, "sharedLibraryLastUserActionLocation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "archivedDataWithRootObject:requiringSecureCoding:error:", v44, 1, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v45 = 0;
    }
    v5 = v54;

    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("CAMUserPreferenceSharedLibraryLastUserActionLocation"));
  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastLocation"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryDate"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryLocation"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastUserActionDate"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastUserActionLocation"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CAMUserPreferenceSharedLibraryMode"));
  }
  if (objc_msgSend(v8, "isVideoStabilizationControlSupported", v51))
    objc_msgSend(v3, "setInteger:forKey:", objc_msgSend(v4, "videoStabilizationMode"), CFSTR("CAMUserPreferenceVideoStabilizationMode"));
  if (objc_msgSend(v8, "isHalfPressSupported"))
  {
    -[CAMUserPreferences openHalfPressSpotlightControls](self, "openHalfPressSpotlightControls");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "allObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("CAMUserPreferenceOpenHalfPressSpotlightControls"));

  }
  if (objc_msgSend(v8, "isSpatialVideoCaptureSupported"))
    objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v4, "spatialVideoEnabled"), CFSTR("CAMUserPreferenceSpatialVideoEnabled"));
  if (objc_msgSend(v8, "allowControlDrawer"))
  {
    v48 = (void *)objc_opt_class();
    -[CAMUserPreferences preferredDrawerControlByMode](self, "preferredDrawerControlByMode");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_persistenceDictionaryForPreferredDrawerControlByMode:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("CAMUserPreferencesPreferredDrawerControlByMode"));
  }
  -[CAMUserPreferences _updateLastWrittenSettingsDate](self, "_updateLastWrittenSettingsDate");
  -[CAMUserPreferences _setHasReadLastWrittenValues:](self, "_setHasReadLastWrittenValues:", 0);

}

- (int64_t)squareModeLastCapturedEffectFilterType
{
  return self->_squareModeLastCapturedEffectFilterType;
}

- (int64_t)portraitModeLastCapturedEffectFilterType
{
  return self->_portraitModeLastCapturedEffectFilterType;
}

- (double)_resetTimeoutOverride
{
  return self->__resetTimeoutOverride;
}

- (void)_setResetTimeoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_resetTimeoutDate, a3);
}

- (void)setForceEnableQRBanners:(BOOL)a3
{
  self->_forceEnableQRBanners = a3;
}

+ (int64_t)defaultMode
{
  return 0;
}

+ (int64_t)defaultDevicePosition
{
  void *v2;
  int64_t v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBackCameraSupported") ^ 1;

  return v3;
}

+ (int64_t)defaultDevice
{
  return objc_msgSend(a1, "defaultDevicePosition") != 0;
}

+ (id)defaultCaptureConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CAMUserPreferences_defaultCaptureConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCaptureConfiguration_onceToken != -1)
    dispatch_once(&defaultCaptureConfiguration_onceToken, block);
  return (id)defaultCaptureConfiguration_configuration;
}

void __49__CAMUserPreferences_defaultCaptureConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultCaptureConfiguration");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultCaptureConfiguration_configuration;
  defaultCaptureConfiguration_configuration = v1;

}

BOOL __50__CAMUserPreferences__defaultCaptureConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presetType") == 0;
}

- (int64_t)ppt_readPortraitLightingType
{
  void *v3;
  int64_t v4;

  -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMUserPreferences _sanitizeLightingType:forMode:](self, "_sanitizeLightingType:forMode:", objc_msgSend(v3, "integerForKey:", CFSTR("CAMUserPreferencePortraitModeLightingEffectType")), 6);

  return v4;
}

+ (id)_defaultExposureBiasesByMode
{
  _QWORD v3[8];
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1EA3B0190;
  v3[1] = &unk_1EA3B0328;
  v4[0] = &unk_1EA3B0310;
  v4[1] = &unk_1EA3B0310;
  v3[2] = &unk_1EA3B01C0;
  v3[3] = &unk_1EA3B0340;
  v4[2] = &unk_1EA3B0310;
  v4[3] = &unk_1EA3B0310;
  v3[4] = &unk_1EA3B02B0;
  v3[5] = &unk_1EA3B0358;
  v4[4] = &unk_1EA3B0310;
  v4[5] = &unk_1EA3B0310;
  v3[6] = &unk_1EA3B0370;
  v3[7] = &unk_1EA3B0220;
  v4[6] = &unk_1EA3B0310;
  v4[7] = &unk_1EA3B0310;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_publishAnalyticsIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  CAMAnalyticsPreferencesEvent *v6;
  id v7;

  v7 = (id)CFPreferencesCopyAppValue(CFSTR("CAMUserPreferenceLastCoreAnalyticsPublishDate"), CFSTR("com.apple.camera"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isDate:inSameDayAsDate:", v7, v3),
        v4,
        (v5 & 1) == 0))
  {
    v6 = -[CAMAnalyticsPreferencesEvent initWithPreferences:]([CAMAnalyticsPreferencesEvent alloc], "initWithPreferences:", self);
    -[CAMAnalyticsEvent publish](v6, "publish");
    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceLastCoreAnalyticsPublishDate"), v3, CFSTR("com.apple.camera"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));

  }
}

- (int64_t)defaultDeviceForModeChange:(int64_t)a3 devicePosition:(int64_t)a4 spatialVideoEnabled:(BOOL)a5
{
  if (a4 == 1)
    return 1;
  if (a4)
    return 0;
  if (a3 != 1)
  {
    if (a3 != 6)
    {
      if (a3 == 8)
        return 6;
      else
        return 0;
    }
    if (-[CAMUserPreferences preservePortraitZoom](self, "preservePortraitZoom"))
      return -[CAMUserPreferences portraitModeRearDevice](self, "portraitModeRearDevice");
    return 0;
  }
  if (a5)
    return 6;
  else
    return 0;
}

- (double)defaultZoomFactorForGraphConfiguration:(id)a3 captureOrientation:(int64_t)a4 outputToExternalStorage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  char v21;

  v5 = a5;
  v8 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "defaultZoomFactorForGraphConfiguration:captureOrientation:customLens:outputToExternalStorage:overrodeWithForcedZoomValue:", v8, a4, -[CAMUserPreferences defaultCustomLens](self, "defaultCustomLens"), v5, &v21);
  v11 = v10;
  v12 = objc_msgSend(v8, "mode");
  v13 = objc_msgSend(v8, "device");
  v14 = objc_msgSend(v8, "videoConfiguration");
  v15 = objc_msgSend(v8, "videoStabilizationStrength");
  v16 = objc_msgSend(v8, "enableStereoVideoCapture");

  v17 = objc_msgSend(v9, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v13, v12, v14, v15, v16);
  if (!v21 && v12 == 6)
  {
    v18 = v17;
    if (-[CAMUserPreferences preservePortraitZoom](self, "preservePortraitZoom"))
    {
      if (v18 == -[CAMUserPreferences portraitModeRearDevice](self, "portraitModeRearDevice"))
      {
        -[CAMUserPreferences portraitModeRearZoomValue](self, "portraitModeRearZoomValue");
        v11 = v19;
      }
    }
  }

  return v11;
}

- (id)videoThumbnailOutputConfigurationForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CAMVideoThumbnailOutputConfiguration *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CAMUserPreferences filterTypesForMode:](self, "filterTypesForMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          +[CAMEffectFilterManager filtersForFilterType:lightingType:applyDepthEffect:](CAMEffectFilterManager, "filtersForFilterType:lightingType:applyDepthEffect:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "integerValue", (_QWORD)v17), 0, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v5, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0D0D0B8], "defaultScreenScaleContentSize");
    v15 = -[CAMVideoThumbnailOutputConfiguration initWithThumbnailSize:filters:]([CAMVideoThumbnailOutputConfiguration alloc], "initWithThumbnailSize:filters:", v5, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)resolveDesiredPhotoResolution:(int64_t)a3 livePhotoMode:(int64_t)a4 rawMode:(int64_t)a5 conflicts:(unint64_t)a6 mode:(int64_t)a7 device:(int64_t)a8 resolvedPhotoResolution:(int64_t *)a9 resolvedLivePhotoMode:(int64_t *)a10
{
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v16;

  v11 = a6 & 2;
  v12 = 2;
  if ((a6 & 2) == 0)
    v12 = 3;
  if (a3 == 3)
    v13 = v12;
  else
    v13 = a3;
  -[CAMUserPreferences fallbackPhotoFormatForDesiredFormat:mode:device:](self, "fallbackPhotoFormatForDesiredFormat:mode:device:", -[CAMUserPreferences photoEncodingBehaviorForMode:resolvedRAWMode:isCapturingVideo:](self, "photoEncodingBehaviorForMode:resolvedRAWMode:isCapturingVideo:", a7, a5, 0), v13, a7, a8);
  if (v14 == 3 && v11 == 0)
    v16 = 0;
  else
    v16 = a4;
  if (a9)
    *a9 = v14;
  if (a10)
    *a10 = v16;
}

- (BOOL)readPreferencesWithOverrides:(id)a3 emulationMode:(int64_t)a4 callActive:(BOOL)a5 shouldResetCaptureConfiguration:(BOOL *)a6
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  char v14;
  int v15;
  int v16;
  char preserveRAW;
  int v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  NSArray *v25;
  NSArray *customLensGroup;
  int v27;
  int v28;
  NSArray *v29;
  int64_t v30;
  int v31;
  int v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int64_t v49;
  int64_t v50;
  int v51;
  int v52;
  int64_t v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  NSSet *v63;
  NSSet *openHalfPressSpotlightControls;
  void *v65;
  NSDictionary *v66;
  NSDictionary *preferredDrawerControlByMode;
  int v68;
  __CFString *v69;
  __CFString *v70;
  void *v71;
  NSObject *v72;
  int v73;
  char v74;
  void *v75;
  unint64_t v76;
  const __CFString *v77;
  NSObject *v78;
  char v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  float v84;
  float v85;
  float v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  double v94;
  NSObject *v95;
  char v96;
  int64_t v97;
  float v98;
  void *v99;
  double v100;
  double v101;
  char v102;
  double portraitModeRearZoomValue;
  char v104;
  char v105;
  void *v106;
  char v107;
  double v108;
  int AppBooleanValue;
  BOOL v110;
  char v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int rawControlEnabled;
  uint64_t v118;
  int v119;
  unint64_t v120;
  unint64_t v121;
  int v122;
  int v123;
  int v124;
  BOOL v125;
  _BOOL4 v126;
  id v127;
  id v128;
  void (**v129)(void *, const __CFString *);
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  char v136;
  CLLocation *sharedLibraryLastLocation;
  CLLocation *sharedLibraryLastDiscoveryLocation;
  NSDate *sharedLibraryLastDiscoveryDate;
  CLLocation *sharedLibraryLastUserActionLocation;
  NSDate *sharedLibraryLastUserActionDate;
  char v142;
  uint64_t v143;
  double v144;
  double v145;
  _BOOL4 v146;
  _BOOL4 v147;
  _BOOL4 preserveSpatialVideoEnabled;
  unint64_t v149;
  uint64_t v150;
  _BOOL4 v151;
  int64_t v152;
  uint64_t v153;
  uint64_t v154;
  double v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  char v160;
  uint64_t v161;
  unint64_t v162;
  double v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  unint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  NSObject *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  unint64_t v185;
  unint64_t v186;
  NSObject *v187;
  __CFString *v188;
  int v189;
  BOOL v190;
  _BOOL4 v191;
  int v192;
  uint64_t v193;
  uint64_t v194;
  _BOOL4 v195;
  int v196;
  uint64_t v197;
  int v198;
  BOOL v199;
  uint64_t v200;
  unsigned int v201;
  int v202;
  uint64_t v203;
  char v204;
  uint64_t *v205;
  void *v206;
  uint64_t v207;
  NSObject *v208;
  uint64_t v209;
  unsigned int v210;
  uint64_t v211;
  int64_t v212;
  int64_t v213;
  int64_t v214;
  void *v215;
  int v216;
  unint64_t v217;
  uint64_t v218;
  NSObject *v219;
  int64_t videoConfiguration;
  const __CFString *v221;
  __CFString *v222;
  int64_t v223;
  id v224;
  void *v225;
  void *v226;
  int64_t v227;
  char v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  int64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  int64_t v237;
  unsigned int v238;
  int v239;
  id v240;
  void *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t i;
  uint64_t v250;
  uint64_t v251;
  __objc2_class *v252;
  id *v253;
  uint64_t *v254;
  void *v255;
  NSObject *v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  NSObject *v261;
  id v262;
  double Current;
  uint64_t v264;
  double v265;
  NSObject *v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t j;
  _BOOL4 v272;
  NSObject *v273;
  NSObject *v274;
  NSObject *v275;
  char v276;
  unint64_t v277;
  unint64_t v278;
  NSObject *v279;
  void *v280;
  uint64_t v281;
  void *v282;
  id v283;
  NSObject *v284;
  NSObject *v285;
  NSObject *v286;
  void *v287;
  NSObject *v288;
  BOOL v289;
  uint64_t v290;
  __CFString *v291;
  NSObject *v292;
  uint64_t v293;
  unint64_t v294;
  void *v295;
  int64_t v296;
  uint64_t v297;
  CAMCaptureConfiguration *v298;
  _BOOL8 v299;
  CAMCaptureConfiguration *v300;
  CAMConflictingControlConfiguration *v301;
  uint64_t v302;
  void *v303;
  BOOL v304;
  uint64_t overriddenFrontCaptureInterval;
  NSObject *v306;
  int64_t overriddenBackCaptureInterval;
  NSObject *v308;
  int64_t v309;
  double v310;
  unint64_t v311;
  BOOL v312;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  void *v319;
  void *v320;
  BOOL v321;
  void *v322;
  BOOL v323;
  BOOL v324;
  void *v325;
  BOOL v326;
  unint64_t v327;
  int64_t v328;
  int64_t v329;
  int64_t v330;
  unsigned int v331;
  int64_t v332;
  uint64_t v333;
  unint64_t v334;
  uint64_t v335;
  int64_t v336;
  uint64_t v337;
  int64_t v338;
  uint64_t v339;
  int64_t v340;
  uint64_t v341;
  void *v342;
  int64_t v343;
  char v344;
  int64_t v345;
  int64_t v346;
  char v347;
  int64_t v348;
  char v349;
  int v350;
  uint64_t v352;
  void *v353;
  void *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  id v358;
  id v359;
  unsigned int v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  NSObject *v365;
  __CFString *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  char v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  int64_t v380;
  uint64_t v381;
  uint64_t v382;
  _BOOL4 obj;
  id obja;
  unint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  unint64_t v390;
  uint64_t v391;
  void *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  _QWORD v397[4];
  NSObject *v398;
  id v399;
  id v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  uint64_t v405;
  uint64_t v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  int64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  _QWORD v416[4];
  id v417;
  CAMUserPreferences *v418;
  unint64_t v419;
  uint64_t v420;
  _QWORD aBlock[4];
  id v422;
  Boolean keyExistsAndHasValidFormat;
  _BYTE buf[12];
  __int16 v425;
  __CFString *v426;
  __int16 v427;
  NSObject *v428;
  _BYTE v429[128];
  _BYTE v430[128];
  uint64_t v431;

  obj = a5;
  v431 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDidMigrate")) & 1) == 0)
    +[CAMUserPreferencesMigrator migrateLegacyPreferences](CAMUserPreferencesMigrator, "migrateLegacyPreferences");
  objc_msgSend((id)objc_opt_class(), "defaultCaptureConfiguration");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v347 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveAllSettings"));
  self->_preserveCaptureMode = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveCaptureMode"));
  v11 = objc_msgSend(v9, "isPreserveCreativeControlsSupported");
  if (v11)
    LOBYTE(v11) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveEffectFilter"));
  self->_preserveEffectFilter = v11;
  v12 = objc_msgSend(v9, "smartStylesSupported");
  if (v12)
    LOBYTE(v12) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveSmartStyle"));
  self->_preserveSmartStyle = v12;
  self->_preserveLivePhoto = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveLivePhoto"));
  self->_preserveExposure = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveExposure"));
  self->_preserveNightMode = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveNightMode"));
  objc_msgSend(v9, "_forcedInitialZoomDisplayFactor");
  if (v13 == 0.0)
    v14 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreservePortraitZoom"));
  else
    v14 = 0;
  self->_preservePortraitZoom = v14;
  self->_preserveRAW = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveRAW"));
  self->_preserveProRes = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveProRes"));
  v15 = objc_msgSend(v9, "isVideoStabilizationControlSupported");
  if (v15)
    LOBYTE(v15) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnhancedVideoStabilization"));
  self->_enhancedVideoStabilization = v15;
  v16 = objc_msgSend(v9, "isVideoStabilizationControlSupported");
  if (v16)
    LOBYTE(v16) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceActionModeLowLightEnabled"));
  self->_actionModeLowLightEnabled = v16;
  self->_preserveVideoStabilization = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveVideoStabilization"));
  if (objc_msgSend(v9, "isLinearDNGSupported"))
    preserveRAW = self->_preserveRAW;
  else
    preserveRAW = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreservePhotoResolution"));
  self->_preservePhotoResolution = preserveRAW;
  objc_msgSend((id)objc_opt_class(), "performApertureMigrationWithCapabilities:", v9);
  self->_preserveAperture = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveAperture"));
  self->_bypassWelcomeScreens = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceBypassWelcomeScreens"));
  self->_videoConfiguration = objc_msgSend(v10, "integerForKey:", *MEMORY[0x1E0D75080]);
  self->_slomoConfiguration = objc_msgSend(v10, "integerForKey:", *MEMORY[0x1E0D75078]);
  self->_videoConfigurationControlEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableVideoConfigurationControl"));
  v18 = objc_msgSend(v9, "isPALVideoSupported");
  if (v18)
    LOBYTE(v18) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnablePALVideoFormats"));
  self->_PALVideoEnabled = v18;
  self->_cinematicConfiguration = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceCinematicConfiguration"));
  if (objc_msgSend(v9, "isPhotoResolutionSupported:forPhotoEncoding:", 2, 1))
    v19 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceMaximumHEICPhotoResolution"));
  else
    v19 = objc_msgSend(v9, "defaultPhotoResolutionForMode:devicePosition:encodingBehavior:", 0, 0, 1);
  v20 = v19;
  if (objc_msgSend(v9, "isPhotoResolutionSupported:forPhotoEncoding:", v19, 1))
    v21 = v20;
  else
    v21 = 0;
  self->__backPreferredHEICPhotoResolution = v21;
  self->__frontPreferredHEICPhotoResolution = objc_msgSend(v9, "defaultPhotoResolutionForMode:devicePosition:encodingBehavior:", 0, 1, 1);
  v22 = 0;
  if (objc_msgSend(v9, "enhancedRAWResolutionSupported"))
  {
    if (objc_msgSend(v9, "isLinearDNGSupported"))
      v22 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceMaximumRAWPhotoResolution"));
    else
      v22 = 0;
  }
  if (objc_msgSend(v9, "isPhotoResolutionSupported:forMode:device:photoEncoding:", v22, 0, 0, 2))
    v23 = v22;
  else
    v23 = 0;
  v343 = v23;
  self->_maximumRAWPhotoResolution = v23;
  if (objc_msgSend(v9, "isCustomLensSupportedForPhotoResolution:", v21))
  {
    objc_msgSend(v10, "arrayForKey:", CFSTR("CAMUserPreferencesSelectedCustomLensGroup"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportedCustomLensGroupForGroup:", v24);
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customLensGroup = self->_customLensGroup;
    self->_customLensGroup = v25;

    self->_defaultCustomLens = objc_msgSend(v9, "supportedCustomLensForLens:inGroup:", objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencesDefaultCustomLens")), self->_customLensGroup);
    if (a4)
    {
LABEL_34:
      v27 = 0;
      LOBYTE(v28) = 0;
      goto LABEL_39;
    }
  }
  else
  {
    v29 = self->_customLensGroup;
    self->_customLensGroup = 0;

    self->_defaultCustomLens = 0;
    if (a4)
      goto LABEL_34;
  }
  v28 = objc_msgSend(v9, "isAutoLowLightVideoSupported");
  if (v28)
  {
    LOBYTE(v28) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceAutoLowLightVideoEnabled"));
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
LABEL_39:
  self->_lowLightVideoEnabled = v28;
  if (objc_msgSend(v9, "isVariableFramerateVideoSupported"))
    objc_msgSend((id)objc_opt_class(), "performLowLightVideoMigrationWithCapabilities:", v9);
  if (v27)
    v30 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceVFRMode"));
  else
    v30 = 0;
  self->_VFRMode = v30;
  if (objc_msgSend(v9, "responsiveShutterSupported"))
    objc_msgSend((id)objc_opt_class(), "performResponsiveShutterMigrationWithCapabilities:", v9);
  v31 = objc_msgSend(v9, "responsiveShutterSupported");
  if (v31)
    LOBYTE(v31) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableResponsiveShutter"));
  self->_responsiveShutterEnabled = v31;
  v32 = objc_msgSend(v9, "isSuperWideAutoMacroSupported");
  if (v32)
    objc_msgSend((id)objc_opt_class(), "performSuperWideAutoMacroMigrationWithCapabilities:", v9);
  objc_msgSend((id)objc_opt_class(), "performHorizonLevelUpgradeWithCapabilities:", v9);
  objc_msgSend((id)objc_opt_class(), "performMostCompatibleConfirmationMigrationWithCapabilities:", v9);
  self->_preserveSuperWideAutoMacro = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveSuperWideAutoMacro"));
  if (v32)
  {
    v33 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableSuperWideAutoMacro"));
    self->_superWideAutoMacroControlAllowed = v33 ^ 1;
    if ((v33 & 1) == 0)
    {
      v34 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceAutoMacroMode"));
      goto LABEL_55;
    }
  }
  else
  {
    self->_superWideAutoMacroControlAllowed = 0;
  }
  v34 = objc_msgSend(v396, "macroMode");
LABEL_55:
  v372 = v34;
  +[CAMUserPreferences performAudioConfigurationMigrationWithCapabilities:](CAMUserPreferences, "performAudioConfigurationMigrationWithCapabilities:", v9);
  self->_preferredAudioConfiguration = +[CAMUserPreferences selectedAudioConfigurationForCapabilities:](CAMUserPreferences, "selectedAudioConfigurationForCapabilities:", v9);
  v35 = objc_msgSend(v9, "isMixAudioWithOthersSupported");
  if (v35)
    LOBYTE(v35) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceMixAudioWithOthers"));
  self->_shouldMixAudioWithOthers = v35;
  v36 = objc_msgSend(v9, "isWindRemovalSupported");
  if (v36)
    LOBYTE(v36) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceAudioWindRemoval"));
  self->_shouldEnableWindRemoval = v36;
  v37 = objc_msgSend(v9, "isWhiteBalanceLockingForVideoRecordingSupported");
  if (v37)
    LOBYTE(v37) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceLockWhiteBalanceDuringVideoRecording"));
  self->_shouldLockWhiteBalanceDuringVideoRecording = v37;
  self->_lockAsShutterEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableLockAsShutter"));
  self->_shouldShowGridView = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceShowGridOverlay"), CFSTR("com.apple.camera"), 0) != 0;
  v38 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceShowHorizonLevelPlumb"));
  self->_shouldShowHorizonLevelView = v38;
  self->_shouldShowLevelView = v38;
  self->_QRBannersEnabledInSettings = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceShowQRCodeBanners"));
  v380 = a4;
  v345 = v21;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceShowImageAnalysis"))
    && objc_msgSend(v9, "isImageAnalysisSupported"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:inDomain:", CFSTR("AppleLiveTextEnabled"), *MEMORY[0x1E0CB2B58]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = objc_msgSend(v40, "BOOLValue");
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(&unk_1EA3B3020, "arrayByAddingObjectsFromArray:", &unk_1EA3B3038);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = &unk_1EA3B3020;
      }
      v43 = v42;

      v44 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v43, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_msgSend(v47, "count") != 0;
    }

  }
  else
  {
    v41 = 0;
  }
  self->_imageAnalysisEnabled = v41;
  v48 = objc_msgSend(v9, "isPreviewAspectRatioToggleSupportedForMode:", 0);
  v49 = 0;
  if (v48)
    v49 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePreviewAspectModeForPhotoModes"));
  self->__previewAspectModeForPhotoModes = v49;
  if (objc_msgSend(v9, "isPreviewAspectRatioToggleSupportedForMode:", 1))
    v50 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePreviewViewAspectMode"));
  else
    v50 = 0;
  self->__previewAspectModeForVideoModes = v50;
  self->__shouldDisableCameraSwitchingDuringVideoRecording = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDisableCameraSwitchingDuringVideoRecording"));
  self->_didAcknowledgeCTMDescription = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceCTMDidAcknowledgeDescription"));
  self->_shouldUseVolumeUpBurst = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceVolumeUpBurst"));
  self->_overCapturePreviewEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableViewOutsideTheFrame"));
  v51 = objc_msgSend(v9, "isMirroredFrontCapturesSupported");
  if (v51)
    LOBYTE(v51) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceMirrorFrontCameraCaptures"));
  self->_shouldMirrorFrontCameraCaptures = v51;
  v52 = objc_msgSend(v9, "contentAwareDistortionCorrectionSupported");
  if (v52)
    LOBYTE(v52) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceContentAwareDistortionCorrection"));
  self->_shouldUseContentAwareDistortionCorrection = v52;
  if (-[CAMUserPreferences allowExplicitProResColorSpace](self, "allowExplicitProResColorSpace"))
  {
    v53 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceExplicitProResColorSpace"));
    objc_msgSend(v9, "supportedProResColorSpaces");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "containsObject:", v55);

    if ((v56 & 1) == 0)
    {
      objc_msgSend(v54, "firstObject");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v57, "integerValue");

    }
  }
  else
  {
    v53 = 1;
  }
  self->_explicitProResColorSpace = v53;
  v58 = objc_msgSend(v9, "isZoomPIPSupported");
  if (v58)
    LOBYTE(v58) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableZoomPIP"));
  v349 = v58;
  self->_zoomPIPEnabled = v58;
  if (objc_msgSend(v9, "isHalfPressSupported"))
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferenceOpenHalfPressSpotlightControls"));
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v59;
    v61 = (void *)MEMORY[0x1E0C9AA60];
    if (v59)
      v61 = (void *)v59;
    v62 = v61;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v62);
    v63 = (NSSet *)objc_claimAutoreleasedReturnValue();
    openHalfPressSpotlightControls = self->_openHalfPressSpotlightControls;
    self->_openHalfPressSpotlightControls = v63;

  }
  v350 = objc_msgSend(v9, "isInternalInstall");
  if (v350)
    self->_shouldDelayRemotePersistence = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDebugTransientAssets"));
  self->__lastViewedSettingsInterfaceDate = (NSDate *)(id)objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferencesLastViewedSettingsInterfaceDate"));
  self->__lastWrittenSettingsDate = (NSDate *)(id)objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferencesLastWrittenSettingsDate"));
  if (objc_msgSend(v9, "allowControlDrawer"))
  {
    objc_msgSend(v10, "dictionaryForKey:", CFSTR("CAMUserPreferencesPreferredDrawerControlByMode"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_preferredDrawerControlByModeForPersistenceDictionary:", v65);
    v66 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    preferredDrawerControlByMode = self->_preferredDrawerControlByMode;
    self->_preferredDrawerControlByMode = v66;

    self->_preservePreferredDrawerControl = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreservePreferredDrawerControl"));
  }
  if ((objc_msgSend(v9, "isFrontHDRSupported") & 1) != 0 || (objc_msgSend(v9, "isBackHDRSupported") & 1) != 0)
  {
    v68 = objc_msgSend(v9, "isModernHDRSupported");
    v69 = CFSTR("CAMUserPreferenceHDREV0");
    if (v68)
      v69 = CFSTR("CAMUserPreferenceModernHDRKeepNormalPhoto");
    v70 = v69;
    if (objc_msgSend(v9, "isSpatialOverCaptureSupported"))
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferenceDidPerformSpatialOverCaptureEV0Disable13_0"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        if (objc_msgSend(v10, "BOOLForKey:", v70))
        {
          objc_msgSend(v10, "setBool:forKey:", 0, v70);
          v72 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB760000, v72, OS_LOG_TYPE_DEFAULT, "Performing one-time upgrade of Keep EV0 from On to Off for HDR Keep Orignal Photo!", buf, 2u);
          }

        }
        objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceDidPerformSpatialOverCaptureEV0Disable13_0"));
      }
    }
    if (objc_msgSend(v9, "isHDRSettingAllowed"))
    {
      v73 = objc_msgSend(v9, "isHDREV0CaptureSupported");
      if (v73)
        LOBYTE(v73) = objc_msgSend(v10, "BOOLForKey:", v70);
      self->_shouldCaptureHDREV0 = v73;
      if (v68)
        v74 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceModernHDRBehavior"));
      else
        v74 = 0;
      self->_shouldUseModernHDRBehavior = v74;
    }
    else
    {
      self->_shouldCaptureHDREV0 = 0;
      self->_shouldUseModernHDRBehavior = v68;
    }

    v333 = 1;
  }
  else
  {
    v333 = 0;
    self->_shouldCaptureHDREV0 = 0;
  }
  if (objc_msgSend(v9, "isSmartHDRSupported"))
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferenceDidPerformUnifiedBracketingHDRUpgrade"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v75)
    {
      v76 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredHDRMode"));
      if (v76 > 2)
        v77 = &stru_1EA3325A0;
      else
        v77 = off_1EA32A2B0[v76];
      objc_msgSend(v10, "setInteger:forKey:", 1, CFSTR("CAMUserPreferenceDesiredHDRMode"));
      v78 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v77;
        _os_log_impl(&dword_1DB760000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceDidPerformUnifiedBracketingHDRUpgrade"));
    }
  }
  v331 = objc_msgSend(v9, "isLivePhotoSupported");
  if ((objc_msgSend(v9, "isFrontPortraitModeSupported") & 1) != 0)
    v79 = 1;
  else
    v79 = objc_msgSend(v9, "isBackPortraitModeSupported");
  self->_didAcknowledgePortraitModeDescription = v79 & objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"));
  v80 = objc_msgSend(v9, "isCinematicModeSupported");
  self->_didAcknowledgeCinematicModeDescription = v80 & objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceCinematicModeDidAcknowledgeDescription"));
  v389 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceCaptureMode"));
  v393 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceCaptureDevice"));
  v81 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredFlashMode"));
  v82 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceTorchMode"));
  v377 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredHDRMode"));
  v387 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredIrisMode"));
  v386 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceFlashAndHDRConflictingControl"));
  v362 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceTimerDuration"));
  v373 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceAspectRatioCrop"));
  v367 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredPhotoModeEffectFilterType"));
  v363 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceSquareModeEffectFilterType"));
  v356 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePortraitModeEffectFilterType"));
  v339 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePhotoModeLastCapturedEffectFilterType"));
  v337 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceSquareModeLastCapturedEffectFilterType"));
  v335 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePortraitModeLastCapturedEffectFilterType"));
  v352 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePortraitModeLightingEffectType"));
  objc_msgSend(v10, "floatForKey:", CFSTR("CAMUserPreferencePortraitModeApertureValue"));
  v84 = v83;
  objc_msgSend(v10, "floatForKey:", CFSTR("CAMUserPreferencePortraitEffectIntensityValue"));
  v86 = v85;
  v355 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredNightMode"));
  v361 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceNightModeConflicts"));
  objc_msgSend(v396, "exposureBiasesByMode");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isExposureSliderSupported"))
  {
    +[CAMPreferencesUtilities numericDictionaryForKey:defaults:](CAMPreferencesUtilities, "numericDictionaryForKey:defaults:", CFSTR("CAMUserPreferenceExposureBiasByMode"), v10);
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = (void *)v88;
    if (v88)
      v90 = (void *)v88;
    else
      v90 = v87;
    v91 = v90;
    v92 = v87;
    v87 = v91;

  }
  if (objc_msgSend(v9, "continuousZoomSupportedForPortraitMode"))
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferenceDidPerformPortraitModeTripleCameraUpgrade"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v93)
    {
      objc_msgSend(v10, "setInteger:forKey:", 0, CFSTR("CAMUserPreferencePortraitModeRearDevice"));
      LODWORD(v314) = 0;
      objc_msgSend(v9, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, 0, 0, 1, 0, 1, 0, v314, 0);
      *(float *)&v94 = v94;
      objc_msgSend(v10, "setFloat:forKey:", CFSTR("CAMUserPreferencePortraitModeRearZoomValue"), v94);
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceDidPerformPortraitModeTripleCameraUpgrade"));
      v95 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v95, OS_LOG_TYPE_DEFAULT, "Performing one-time reset for portrait mode's device to the triple camera with default zoom!", buf, 2u);
      }

    }
  }
  if ((objc_msgSend(v9, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", 0) & 1) != 0)
    v96 = 1;
  else
    v96 = objc_msgSend(v9, "isPhotoModeDepthSuggestionSupportedForDevicePosition:", 1);
  v371 = v87;
  self->_didAcknowledgeDepthInPhotoModeDescription = v96 & objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDidAcknowledgeDepthInPhotoModeDescription"));
  v97 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencePortraitModeRearDevice"));
  self->_portraitModeRearDevice = v97;
  if (!objc_msgSend(v9, "isSupportedMode:withDevice:", 6, v97)
    || objc_msgSend(v9, "continuousZoomSupportedForPortraitMode"))
  {
    self->_portraitModeRearDevice = objc_msgSend(v9, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", 0, 6, 0, 0, 0);
  }
  objc_msgSend(v10, "floatForKey:", CFSTR("CAMUserPreferencePortraitModeRearZoomValue"));
  self->_portraitModeRearZoomValue = v98;
  objc_msgSend(v9, "significantZoomFactorsForMode:device:", 6, self->_portraitModeRearDevice);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:", 6, self->_portraitModeRearDevice, 0, 0, 1);
  v101 = v100;
  v102 = objc_msgSend(v9, "continuousZoomSupportedForPortraitMode");
  portraitModeRearZoomValue = self->_portraitModeRearZoomValue;
  if (portraitModeRearZoomValue <= v101)
    v104 = v102;
  else
    v104 = 0;
  if (portraitModeRearZoomValue >= 2.0)
    v105 = v104;
  else
    v105 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v342 = v99;
  v107 = objc_msgSend(v99, "containsObject:", v106);

  if ((v105 & 1) == 0 && (v107 & 1) == 0)
  {
    LODWORD(v314) = 0;
    objc_msgSend(v9, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:videoStabilizationStrength:videoEncodingBehavior:customLens:outputToExternalStorage:spatialVideoEnabled:isTrueVideo:prefersHDR10BitVideo:overrodeWithForcedZoomValue:", 6, self->_portraitModeRearDevice, 0, 1, 0, 1, 0, v314, 0);
    self->_portraitModeRearZoomValue = v108;
  }
  if (objc_msgSend(v9, "isSpatialVideoCaptureSupported"))
  {
    buf[0] = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceEnableSpatialVideoCaptureControl"), CFSTR("com.apple.camera"), buf);
    if (!buf[0] || AppBooleanValue)
    {
      self->_spatialVideoControlEnabled = 1;
    }
    else
    {
      v110 = +[CAMPreferencesUtilities BOOLInCameraDomainForKey:](CAMPreferencesUtilities, "BOOLInCameraDomainForKey:", CFSTR("CAMFeatureDevelopmentForceSpatialVideoControlEnabled"));
      self->_spatialVideoControlEnabled = v110;
      if (!v110)
      {
        v111 = 0;
LABEL_159:
        self->_spatialVideoEnabled = v111;
        self->_preserveSpatialVideoEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveSpatialVideoEnabled"));
        if (buf[0])
          v112 = 1;
        else
          v112 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDidAcknowledgeSpatialVideoOverlayDescription"));
        -[CAMUserPreferences setDidAcknowledgeSpatialVideoOverlayDescription:](self, "setDidAcknowledgeSpatialVideoOverlayDescription:", v112);
        goto LABEL_163;
      }
    }
    v111 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceSpatialVideoEnabled"));
    goto LABEL_159;
  }
LABEL_163:
  v113 = objc_msgSend(v9, "isSpatialModeSupported");
  if (v113)
    LOBYTE(v113) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDidAcknowledgeSpatialModeOverlayDescription"));
  self->_didAcknowledgeSpatialModeOverlayDescription = v113;
  v114 = objc_msgSend(v9, "semanticDevelopmentSupported");
  if (v114)
    LOBYTE(v114) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableSemanticDevelopment"));
  self->_semanticDevelopmentEnabled = v114;
  v115 = objc_msgSend(v9, "isLinearDNGSupported");
  if (v115)
    LOBYTE(v115) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableLinearDNGControl"));
  self->_rawControlEnabled = v115;
  if (objc_msgSend(v9, "photoModeDepthSuggestionSupported"))
  {
    v116 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableDepthSuggestion"));
    self->_shouldUseDepthSuggestionInPhotoMode = v116;
    if (v116)
      v375 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceOptionalDepthEffectEnabled"));
    else
      v375 = 0;
  }
  else
  {
    v375 = 0;
    self->_shouldUseDepthSuggestionInPhotoMode = 0;
  }
  if (objc_msgSend(v9, "isPhotoResolutionSupported:forPhotoEncoding:", 3, 1))
  {
    if (objc_msgSend(v9, "isLinearDNGSupported"))
      rawControlEnabled = self->_rawControlEnabled;
    else
      rawControlEnabled = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnablePhotoFormatControl"));
  }
  else
  {
    rawControlEnabled = 0;
  }
  self->_photoFormatControlEnabled = rawControlEnabled;
  v381 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencesDesiredRAWMode"));
  if (self->_rawControlEnabled || rawControlEnabled)
    v118 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencesRAWConflicts"));
  else
    v118 = 0;
  v376 = v118;
  if (rawControlEnabled)
    v391 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferencesDesiredPhotoResolution"));
  else
    v391 = 0;
  if (objc_msgSend(v9, "isProResVideoSupported"))
  {
    v119 = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceEnableProResControl"));
    self->_proResControlEnabled = v119;
    if (v119)
      v370 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceDesiredProResVideoMode"));
    else
      v370 = 0;
  }
  else
  {
    v370 = 0;
    self->_proResControlEnabled = 0;
  }
  if (objc_msgSend(v9, "isVideoStabilizationControlSupported"))
  {
    v120 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceVideoStabilizationMode"));
    if (v120 >= 2)
      v121 = 0;
    else
      v121 = v120;
    v385 = v121;
  }
  else
  {
    v385 = 0;
  }
  keyExistsAndHasValidFormat = 0;
  v122 = CFPreferencesGetAppBooleanValue(CFSTR("CameraSharingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  v123 = keyExistsAndHasValidFormat;
  v124 = objc_msgSend((id)objc_opt_class(), "isSharedLibrarySupportedAndEnabledForCapabilities:", v9);
  if (v123)
    v125 = v122 == 0;
  else
    v125 = 0;
  if (v125)
    v126 = 0;
  else
    v126 = v124;
  self->_sharedLibraryEnabled = v126;
  if (!v126)
  {
    sharedLibraryLastLocation = self->_sharedLibraryLastLocation;
    self->_sharedLibraryLastLocation = 0;

    self->_sharedLibraryLastLocationAcquiredDuringTrip = 0;
    sharedLibraryLastDiscoveryLocation = self->_sharedLibraryLastDiscoveryLocation;
    self->_sharedLibraryLastDiscoveryLocation = 0;

    sharedLibraryLastDiscoveryDate = self->_sharedLibraryLastDiscoveryDate;
    self->_sharedLibraryLastDiscoveryDate = 0;

    sharedLibraryLastUserActionLocation = self->_sharedLibraryLastUserActionLocation;
    self->_sharedLibraryLastUserActionLocation = 0;

    sharedLibraryLastUserActionDate = self->_sharedLibraryLastUserActionDate;
    self->_sharedLibraryLastUserActionDate = 0;

    *(_WORD *)&self->_sharedLibraryAutoBehaviorEnabled = 0;
    self->_defaultToSharedLibraryEnabled = 0;
    goto LABEL_213;
  }
  v127 = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke;
  aBlock[3] = &unk_1EA32A078;
  v128 = v10;
  v422 = v128;
  v129 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v129[2](v129, CFSTR("CAMUserPreferenceSharedLibraryLastLocation"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences setSharedLibraryLastLocation:](self, "setSharedLibraryLastLocation:", v130);

  -[CAMUserPreferences setSharedLibraryLastLocationAcquiredDuringTrip:](self, "setSharedLibraryLastLocationAcquiredDuringTrip:", objc_msgSend(v128, "BOOLForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip")));
  v129[2](v129, CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryLocation"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences setSharedLibraryLastDiscoveryLocation:](self, "setSharedLibraryLastDiscoveryLocation:", v131);

  objc_msgSend(v128, "objectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryDate"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences setSharedLibraryLastDiscoveryDate:](self, "setSharedLibraryLastDiscoveryDate:", v132);

  v129[2](v129, CFSTR("CAMUserPreferenceSharedLibraryLastUserActionLocation"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences setSharedLibraryLastUserActionLocation:](self, "setSharedLibraryLastUserActionLocation:", v133);

  objc_msgSend(v128, "objectForKey:", CFSTR("CAMUserPreferenceSharedLibraryLastUserActionDate"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences setSharedLibraryLastUserActionDate:](self, "setSharedLibraryLastUserActionDate:", v134);

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v135, "peopleProximityDetectionSupported"))
  {
    self->_sharedLibraryAutoBehaviorEnabled = 0;
    goto LABEL_211;
  }
  if ((PXPreferencesIsCameraAutoShareEnabled() & 1) == 0)
  {
    v142 = objc_msgSend(v135, "librarySelectionMockAutomationModeEnabled");
    self->_sharedLibraryAutoBehaviorEnabled = v142;
    if ((v142 & 1) != 0)
    {
      v136 = 0;
      goto LABEL_212;
    }
LABEL_211:
    v136 = objc_msgSend(v128, "BOOLForKey:", CFSTR("CAMUserPreferencesDefaultToSharedLibrary"));
    goto LABEL_212;
  }
  v136 = 0;
  self->_sharedLibraryAutoBehaviorEnabled = 1;
LABEL_212:
  self->_defaultToSharedLibraryEnabled = v136;
  self->_shareWhenAtHomeEnabled = CFPreferencesGetAppBooleanValue(CFSTR("CameraShareFromHomeEnabled"), CFSTR("com.apple.mobileslideshow"), 0) != 0;
  self->_sharedLibrarySwitchEnabled = self->_sharedLibraryEnabled;

  v8 = v127;
LABEL_213:
  v143 = v377;
  v144 = v84;
  v145 = v86;
  v341 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceSharedLibraryMode"));
  v324 = -[CAMUserPreferences _shouldReconfigureCurrentConfigurationForSettingsChange](self, "_shouldReconfigureCurrentConfigurationForSettingsChange");
  v146 = -[CAMUserPreferences _shouldResetPreferencesForTimeout](self, "_shouldResetPreferencesForTimeout");
  v323 = v146;
  if (v380)
    v147 = 0;
  else
    v147 = v146;
  v321 = v147;
  v359 = v8;
  if (v147)
  {
    preserveSpatialVideoEnabled = self->_preserveSpatialVideoEnabled;
    if (self->_preserveSpatialVideoEnabled)
      preserveSpatialVideoEnabled = self->_spatialVideoEnabled;
    else
      self->_spatialVideoEnabled = 0;
    v152 = -[CAMUserPreferences defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:](self, "defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:", v389, v393, preserveSpatialVideoEnabled);
    if (self->_preserveCaptureMode)
    {
      v150 = v152;
    }
    else
    {
      v389 = objc_msgSend(v396, "mode");
      v150 = objc_msgSend(v396, "device");
      self->_spatialModeHasVideoSelected = 0;
    }
    if (v81 == 1)
    {
      v81 = objc_msgSend(v396, "flashMode");
      v153 = v386;
      if (v386 == 1)
        v153 = 0;
      v386 = v153;
    }
    v151 = v82 == 1;
    if (v82 == 1)
      v82 = objc_msgSend(v396, "torchMode");
    if (v377 == 1)
    {
      v143 = objc_msgSend(v396, "HDRMode");
      v154 = v386;
      if (v386 == 2)
        v154 = 0;
      v386 = v154;
    }
    if (!self->_preserveLivePhoto)
    {
      v387 = objc_msgSend(v396, "irisMode");
      v376 &= ~2uLL;
    }
    if (!self->_preserveNightMode)
      v355 = objc_msgSend(v9, "isLowLightSupported");
    v362 = objc_msgSend(v396, "timerDuration");
    if (!self->_preserveEffectFilter)
    {
      v373 = objc_msgSend(v396, "photoModeAspectRatioCrop");
      v367 = objc_msgSend(v396, "photoModeEffectFilterType");
      v363 = objc_msgSend(v396, "squareModeEffectFilterType");
      v356 = objc_msgSend(v396, "portraitModeEffectFilterType");
      v352 = objc_msgSend(v396, "portraitModeLightingEffectType");
      objc_msgSend(v396, "portraitModeIntensityValue");
      v145 = v155;
    }
    if (!self->_preserveExposure)
    {
      objc_msgSend(v396, "exposureBiasesByMode");
      v156 = v150;
      v157 = objc_claimAutoreleasedReturnValue();

      v371 = (void *)v157;
      v150 = v156;
      v8 = v359;
    }
    if (!self->_preserveSuperWideAutoMacro)
      v372 = objc_msgSend(v396, "macroMode");
    if (!self->_preserveRAW)
      v381 = objc_msgSend(v396, "rawMode");
    v158 = v391;
    if (!self->_preservePhotoResolution)
      v158 = 0;
    v391 = v158;
    if (self->_rawControlEnabled)
    {
      if (self->_preservePhotoResolution)
        v159 = 0;
      else
        v159 = rawControlEnabled;
      if (!self->_preserveRAW || (v159 & 1) != 0)
LABEL_259:
        v376 = 0;
    }
    else
    {
      v160 = rawControlEnabled ^ 1;
      if (self->_preservePhotoResolution)
        v160 = 1;
      if ((v160 & 1) == 0)
        goto LABEL_259;
    }
    v161 = v370;
    if (!self->_preserveProRes)
      v161 = 0;
    v370 = v161;
    v162 = v385;
    if (!self->_preserveVideoStabilization)
      v162 = 0;
    v385 = v162;
    v149 = v389;
    if (!self->_preserveAperture)
    {
      objc_msgSend(v396, "portraitModeApertureValue");
      v144 = v163;
    }
    v375 = 0;
    v361 = 0;
    if (!v8)
      goto LABEL_293;
    goto LABEL_267;
  }
  v149 = v389;
  v150 = -[CAMUserPreferences defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:](self, "defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:", v389, v393, self->_spatialVideoEnabled);
  v151 = 0;
  if (!v8)
    goto LABEL_293;
LABEL_267:
  if (!objc_msgSend(v8, "hasOverrides"))
  {
LABEL_293:
    v326 = 0;
LABEL_294:
    v186 = v373;
    goto LABEL_295;
  }
  v394 = v150;
  objc_msgSend(v8, "captureMode");
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  if (v164)
  {
    objc_msgSend(v8, "captureMode");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v165, "integerValue");

  }
  objc_msgSend(v8, "captureDevice");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (v166)
  {
    objc_msgSend(v8, "captureDevice");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v394 = objc_msgSend(v167, "integerValue");

  }
  objc_msgSend(v8, "videoConfiguration");
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    objc_msgSend(v8, "videoConfiguration");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    self->_videoConfiguration = objc_msgSend(v169, "integerValue");

  }
  v378 = v143;
  objc_msgSend(v8, "slomoConfiguration");
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  if (v170)
  {
    objc_msgSend(v8, "slomoConfiguration");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    self->_slomoConfiguration = objc_msgSend(v171, "integerValue");

  }
  v172 = v149;
  objc_msgSend(v8, "cinematicConfiguration");
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  if (v173)
  {
    objc_msgSend(v8, "cinematicConfiguration");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cinematicConfiguration = objc_msgSend(v174, "integerValue");

  }
  objc_msgSend(v8, "wantsQRCodes");
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  if (v175)
  {
    objc_msgSend(v8, "wantsQRCodes");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v176, "BOOLValue");

    if (v177)
    {
      self->_forceEnableQRBanners = 1;
      v178 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v178, OS_LOG_TYPE_DEFAULT, "Launched with a URL request or shortcut to force enable QR scanning", buf, 2u);
      }

      v8 = v359;
    }
  }
  objc_msgSend(v8, "flashMode");
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  if (v179)
  {
    objc_msgSend(v8, "flashMode");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v180, "integerValue");

    v386 = 1;
  }
  objc_msgSend(v8, "torchMode");
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  if (v181)
  {
    objc_msgSend(v8, "torchMode");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v182, "integerValue");

  }
  objc_msgSend(v8, "aspectRatioCrop");
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v183)
  {
    v326 = 1;
    v149 = v172;
    v143 = v378;
    v150 = v394;
    goto LABEL_294;
  }
  objc_msgSend(v8, "aspectRatioCrop");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend(v184, "integerValue");

  if (v172)
  {
    v186 = v373;
    if (v185)
    {
      v187 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
      {
        if (v185 > 3)
          v188 = 0;
        else
          v188 = off_1EA32A2C8[v185 - 1];
        if (v172 > 9)
          v222 = 0;
        else
          v222 = off_1EA32A2E0[v172 - 1];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v188;
        v425 = 2114;
        v426 = v222;
        _os_log_impl(&dword_1DB760000, v187, OS_LOG_TYPE_DEFAULT, "Trying to set aspect ratio crop %{public}@ on unsupported mode: %{public}@", buf, 0x16u);
      }

    }
    v326 = 1;
    v149 = v172;
  }
  else
  {
    v326 = 1;
    v186 = v185;
    v149 = 0;
  }
  v143 = v378;
  v150 = v394;
LABEL_295:
  if ((objc_msgSend(v9, "isCameraSupportedForDevice:", v150) & 1) == 0)
    v150 = objc_msgSend(v396, "device");
  v189 = objc_msgSend(v9, "isSupportedMode:withDevice:", v149, v150);
  v190 = 0;
  if (v149 <= 8 && ((1 << v149) & 0x186) != 0)
    v190 = obj;
  if (v190 || v189 != 1)
    v149 = objc_msgSend(v396, "mode");
  if (objc_msgSend(v9, "isFrontFlashSupported"))
  {
    v191 = (unint64_t)(v81 - 1) < 2;
LABEL_306:
    v193 = v81;
    goto LABEL_308;
  }
  v192 = objc_msgSend(v9, "isBackFlashSupported");
  v191 = (unint64_t)(v81 - 1) < 2;
  if (v192)
    goto LABEL_306;
  v193 = 0;
LABEL_308:
  if (v191)
    v194 = v193;
  else
    v194 = v81;
  v369 = v194;
  if (objc_msgSend(v9, "isFrontTorchSupported"))
  {
    v195 = (unint64_t)(v82 - 1) < 2;
  }
  else
  {
    v196 = objc_msgSend(v9, "isBackTorchSupported");
    v195 = (unint64_t)(v82 - 1) < 2;
    if (!v196)
    {
      v197 = 0;
      v198 = 1;
      goto LABEL_316;
    }
  }
  v197 = v82;
  v198 = v151;
LABEL_316:
  v199 = !v195;
  if (v195)
    v200 = v197;
  else
    v200 = v82;
  v374 = v200;
  if (v199)
    v201 = v151;
  else
    v201 = v198;
  v360 = v201;
  if ((objc_msgSend(v9, "isFrontAutomaticHDRSupported") & 1) != 0)
    v202 = 1;
  else
    v202 = objc_msgSend(v9, "isBackAutomaticHDRSupported");
  v203 = v387;
  if (v143 == 2)
  {
    if (v202)
      v143 = 2;
    else
      v143 = 0;
  }
  else if (v143 == 1)
  {
    v143 = v333;
  }
  if (v387 == 2)
  {
    if ((objc_msgSend(v9, "isLivePhotoAutoModeSupported") & 1) != 0)
      v203 = 2;
    else
      v203 = objc_msgSend(v396, "irisMode");
  }
  else if (v387 == 1)
  {
    v203 = v331;
  }
  v204 = objc_msgSend(v9, "isSpatialOverCaptureSupported");
  v205 = (uint64_t *)MEMORY[0x1E0D75070];
  v395 = v150;
  if ((v204 & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CAMUserPreferenceDidPerformSpatialOverCaptureHighEfficiencyUpgrade"));
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    v207 = *v205;
    if (!v206)
    {
      if (objc_msgSend(v10, "integerForKey:", v207) == 1)
      {
        v208 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB760000, v208, OS_LOG_TYPE_DEFAULT, "Performing one-time upgrade of Most Compatible to High Efficiency!", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0D75128], "setNewFormatsConfiguration:fromSource:", 0, 3);
      }
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CAMUserPreferenceDidPerformSpatialOverCaptureHighEfficiencyUpgrade"));
    }
  }
  else
  {
    v207 = *MEMORY[0x1E0D75070];
  }
  v209 = objc_msgSend(v10, "integerForKey:", v207);
  self->__preferHEVCWhenAvailable = v209 != 1;
  if (v209 == 1)
    v210 = 0;
  else
    v210 = objc_msgSend(v9, "isHEVCEncodingSupported");
  v211 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceSecondaryPhotoFormat"));
  v212 = v210;
  switch(v211)
  {
    case 0:
      goto LABEL_352;
    case 1:
      v213 = 2;
      break;
    case 2:
      goto LABEL_354;
    case 3:
      v212 = 2;
LABEL_352:
      v213 = 1;
      break;
    case 4:
      v212 = 2;
LABEL_354:
      v213 = 3;
      break;
    default:
      v213 = 0;
      v212 = 0;
      break;
  }
  self->_photoFormatControlSecondaryFormat.encoding = v212;
  self->_photoFormatControlSecondaryFormat.resolution = v213;
  if (objc_msgSend(v9, "isProRawJpegXLSupported"))
    v214 = objc_msgSend(v10, "integerForKey:", CFSTR("CAMUserPreferenceProRawFileFormat"));
  else
    v214 = 0;
  self->_rawFileFormatBehavior = v214;
  self->_HDR10BitVideoEnabled = objc_msgSend((id)objc_opt_class(), "shouldEnableHDR10BitVideoForHEVCEnabled:capabilities:", self->__preferHEVCWhenAvailable, v9);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = objc_msgSend(v215, "isCTMSupported");

  if (v216)
    v217 = v186;
  else
    v217 = 0;
  v334 = v217;
  v332 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v367, 0);
  v330 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v363, 4);
  v329 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v356, 6);
  v340 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v339, 0);
  v338 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v337, 4);
  v336 = -[CAMUserPreferences _sanitizeEffectFilterType:forMode:](self, "_sanitizeEffectFilterType:forMode:", v335, 6);
  v328 = -[CAMUserPreferences _sanitizeLightingType:forMode:](self, "_sanitizeLightingType:forMode:", v352, 6);
  if ((objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_videoConfiguration, 1, 1) & 1) == 0
    && (objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_videoConfiguration, 1, 0) & 1) == 0)
  {
    self->_videoConfiguration = 0;
  }
  v218 = v395;
  if (!self->_PALVideoEnabled
    && +[CAMCaptureCapabilities isPALVideoConfiguration:](CAMCaptureCapabilities, "isPALVideoConfiguration:", self->_videoConfiguration))
  {
    v219 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
    {
      videoConfiguration = self->_videoConfiguration;
      switch(videoConfiguration)
      {
        case 0:
          v221 = CFSTR("Auto");
          break;
        case 1:
          v221 = CFSTR("1080p60");
          break;
        case 2:
          v221 = CFSTR("720p120");
          break;
        case 3:
          v221 = CFSTR("720p240");
          break;
        case 4:
          v221 = CFSTR("1080p120");
          break;
        case 5:
          v221 = CFSTR("4k30");
          break;
        case 6:
          v221 = CFSTR("720p30");
          break;
        case 7:
          v221 = CFSTR("1080p30");
          break;
        case 8:
          v221 = CFSTR("1080p240");
          break;
        case 9:
          v221 = CFSTR("4k60");
          break;
        case 10:
          v221 = CFSTR("4k24");
          break;
        case 11:
          v221 = CFSTR("1080p25");
          break;
        case 12:
          v221 = CFSTR("4k25");
          break;
        case 13:
          v221 = CFSTR("4k120");
          break;
        case 14:
          v221 = CFSTR("4k100");
          break;
        default:
          switch(videoConfiguration)
          {
            case 10000:
              v221 = CFSTR("ImagePickerHigh");
              break;
            case 10001:
              v221 = CFSTR("ImagePickerMedium");
              break;
            case 10002:
              v221 = CFSTR("ImagePickerLow");
              break;
            case 10003:
              v221 = CFSTR("ImagePickerVGA");
              break;
            case 10004:
              v221 = CFSTR("ImagePickeriFrame720p");
              break;
            case 10005:
              v221 = CFSTR("ImagePickeriFrame540p");
              break;
            default:
              v221 = 0;
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v221;
      _os_log_impl(&dword_1DB760000, v219, OS_LOG_TYPE_DEFAULT, "Resetting PAL video configuration %{public}@ to Auto since PAL not enabled", buf, 0xCu);
    }

    self->_videoConfiguration = 0;
  }
  if ((objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_slomoConfiguration, 2, 1) & 1) == 0
    && (objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_slomoConfiguration, 2, 0) & 1) == 0)
  {
    self->_slomoConfiguration = 0;
  }
  if ((objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_cinematicConfiguration, 7, 1) & 1) == 0
    && (objc_msgSend(v9, "isSupportedVideoConfiguration:forMode:device:", self->_cinematicConfiguration, 7, 0) & 1) == 0)
  {
    self->_cinematicConfiguration = 0;
  }
  v388 = v203;
  switch(v149)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
      v223 = -[CAMUserPreferences videoConfiguration](self, "videoConfiguration");
      v416[0] = MEMORY[0x1E0C809B0];
      v416[1] = 3221225472;
      v416[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_355;
      v416[3] = &unk_1EA32A0A0;
      v224 = v9;
      v419 = v149;
      v420 = v395;
      v417 = v224;
      v418 = self;
      v225 = _Block_copy(v416);
      v226 = v224;
      v218 = v395;
      v368 = objc_msgSend(v226, "validatedVideoConfigurationForVideoConfiguration:withBlock:", v223, v225);

      v203 = v388;
      break;
    case 2uLL:
      v227 = -[CAMUserPreferences slomoConfiguration](self, "slomoConfiguration");
      goto LABEL_414;
    case 7uLL:
      v227 = -[CAMUserPreferences cinematicConfiguration](self, "cinematicConfiguration");
LABEL_414:
      v368 = v227;
      break;
    case 8uLL:
      v368 = 7;
      break;
    default:
      v368 = 0;
      break;
  }
  v327 = -[CAMUserPreferences audioConfigurationForMode:device:emulationMode:duringCall:](self, "audioConfigurationForMode:device:emulationMode:duringCall:", v149, v218, v380, obj);
  if (v374 == 1)
    v228 = v347;
  else
    v228 = 1;
  if ((v228 & 1) == 0)
  {
    v374 = objc_msgSend(v396, "torchMode");
    v360 = 1;
  }
  if (-[CAMUserPreferences shouldUseModernHDRBehavior](self, "shouldUseModernHDRBehavior"))
  {
    if (objc_msgSend(v9, "isSmartHDRSupported"))
      v143 = 1;
    else
      v143 = 2;
  }
  v415 = v369;
  v414 = v143;
  v413 = v203;
  v412 = 0;
  if (-[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled"))
  {
    v229 = v381;
    v230 = v376;
    +[CAMConflictingControlConfiguration resolveDesiredRAWMode:photoFormatConflicts:desiredLivePhotoMode:desiredFlashMode:toRAWMode:toLivePhotoMode:toFlashMode:](CAMConflictingControlConfiguration, "resolveDesiredRAWMode:photoFormatConflicts:desiredLivePhotoMode:desiredFlashMode:toRAWMode:toLivePhotoMode:toFlashMode:", v381, v376, v203, v369, &v412, &v413, &v415);
  }
  else
  {
    v229 = 0;
    v412 = 0;
    v230 = v376;
  }
  v382 = v229;
  if (v229 == 1)
    v231 = 2;
  else
    v231 = 1;
  if (v229 == 1)
    v232 = v343;
  else
    v232 = v345;
  if (objc_msgSend(v9, "isPhotoResolutionSupported:forMode:device:photoEncoding:", v391, 0, 0, v231))
    v233 = v391;
  else
    v233 = 0;
  if (v233)
    v232 = v233;
  +[CAMConflictingControlConfiguration resolveDesiredFlashMode:desiredHDRMode:primaryConflictingControl:device:toFlashMode:HDRMode:](CAMConflictingControlConfiguration, "resolveDesiredFlashMode:desiredHDRMode:primaryConflictingControl:device:toFlashMode:HDRMode:", v415, v143, v386, v395, &v415, &v414);
  v411 = v232;
  v348 = v232;
  -[CAMUserPreferences resolveDesiredPhotoResolution:livePhotoMode:rawMode:conflicts:mode:device:resolvedPhotoResolution:resolvedLivePhotoMode:](self, "resolveDesiredPhotoResolution:livePhotoMode:rawMode:conflicts:mode:device:resolvedPhotoResolution:resolvedLivePhotoMode:", v232, v413, v412, v230, v149, v395, &v411, &v413);
  v234 = -[CAMUserPreferences resolvedPhotoFormatForResolvedResolution:rawMode:](self, "resolvedPhotoFormatForResolvedResolution:rawMode:", v411, v412);
  v236 = v235;
  v237 = -[CAMUserPreferences videoStabilizationStrengthForVideoStabilizationMode:captureMode:spatialVideoEnabled:](self, "videoStabilizationStrengthForVideoStabilizationMode:captureMode:spatialVideoEnabled:", v385, v149, -[CAMUserPreferences spatialVideoEnabled](self, "spatialVideoEnabled"));
  v390 = v149;
  BYTE1(v315) = -[CAMUserPreferences spatialVideoEnabled](self, "spatialVideoEnabled");
  LOBYTE(v315) = v375;
  v346 = +[CAMConflictingControlConfiguration resolveDesiredMacroMode:forMode:device:videoConfiguration:videoStabilizationStrength:photoFormat:optionalDepthEffectEnabled:spatialVideoEnabled:](CAMConflictingControlConfiguration, "resolveDesiredMacroMode:forMode:device:videoConfiguration:videoStabilizationStrength:photoFormat:optionalDepthEffectEnabled:spatialVideoEnabled:", v372, v149, v395, v368, v237, v234, v236, v315);
  if (-[CAMUserPreferences shouldMirrorFrontCameraCaptures](self, "shouldMirrorFrontCameraCaptures"))
    v344 = objc_msgSend(v9, "mirroredFrontCapturesSupportedForMode:", v149);
  else
    v344 = 0;
  v238 = objc_msgSend(v9, "semanticStylesSupport");
  self->_didAcknowledgeSemanticStylesDescription = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceSemanticStylesDidAcknowledgeDescription")) & (v238 >> 3);
  if ((v238 & 8) != 0)
  {
    v239 = objc_msgSend(v9, "smartStylesSupported");
    if (v239)
      LOBYTE(v239) = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceSmartStylesDidAcknowledgeDescription"));
  }
  else
  {
    LOBYTE(v239) = 0;
  }
  self->_didAcknowledgeSmartStylesDescription = v239;
  v364 = objc_msgSend(v396, "selectedSemanticStyleIndex");
  objc_msgSend(v396, "semanticStyles");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v357 = objc_msgSend(v396, "smartStyleSystemStyleIndex");
  if ((v238 & 8) == 0)
  {
    v257 = v371;
    v258 = v395;
    v259 = v143;
    v260 = v353;
    goto LABEL_530;
  }
  v240 = v10;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v242 = objc_msgSend(v241, "hostProcess");

  v379 = v143;
  if (v242)
  {
    v243 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.camera"));

    v240 = (id)v243;
  }
  -[CAMUserPreferences _semanticStylesKey](self, "_semanticStylesKey");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v325 = v240;
  objc_msgSend(v240, "arrayForKey:", v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v245, "count"));
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v407 = 0u;
  v408 = 0u;
  v409 = 0u;
  v410 = 0u;
  obja = v245;
  v246 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v407, v430, 16);
  if (!v246)
    goto LABEL_472;
  v247 = v246;
  v248 = *(_QWORD *)v408;
  while (2)
  {
    for (i = 0; i != v247; ++i)
    {
      if (*(_QWORD *)v408 != v248)
        objc_enumerationMutation(obja);
      v250 = *(_QWORD *)(*((_QWORD *)&v407 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v256 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
          -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.4(v256);
        goto LABEL_471;
      }
      v251 = objc_msgSend(v9, "semanticStylesVersion");
      if (v251 == 1)
      {
        v252 = (__objc2_class *)MEMORY[0x1E0D0D098];
        v405 = 0;
        v253 = (id *)&v405;
        v254 = &v405;
        goto LABEL_459;
      }
      if (v251)
      {
        v255 = 0;
        v256 = 0;
LABEL_468:
        v261 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
          -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.3();

LABEL_471:
        goto LABEL_472;
      }
      v252 = CAMSemanticStyle;
      v406 = 0;
      v253 = (id *)&v406;
      v254 = &v406;
LABEL_459:
      -[__objc2_class styleWithDictionary:error:](v252, "styleWithDictionary:error:", v250, v254);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      v256 = *v253;
      if (v256 || !v255)
        goto LABEL_468;
      objc_msgSend(v392, "addObject:", v255);

    }
    v247 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v407, v430, 16);
    if (v247)
      continue;
    break;
  }
LABEL_472:

  if (objc_msgSend(v9, "smartStylesSupported"))
  {
    v262 = (id)objc_msgSend(v353, "mutableCopy");

    Current = CFAbsoluteTimeGetCurrent();
    +[CAMSmartStyleUtilities readAVCaptureSystemStyleBypassXPC:](CAMSmartStyleUtilities, "readAVCaptureSystemStyleBypassXPC:", 1);
    v264 = objc_claimAutoreleasedReturnValue();
    v265 = CFAbsoluteTimeGetCurrent() - Current;
    if (v265 > 0.002)
    {
      v266 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v265;
        _os_log_impl(&dword_1DB760000, v266, OS_LOG_TYPE_DEFAULT, "Reading AVSmartStyleSettingsGetSystemStyleFast took %.3f seconds", buf, 0xCu);
      }

    }
    v354 = (void *)v264;
    +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:](CAMCaptureConversions, "CEKSmartStyleForAVCaptureSmartStyle:", v264);
    v365 = objc_claimAutoreleasedReturnValue();
    -[CAMUserPreferences _setLastReadSystemStyle:](self, "_setLastReadSystemStyle:");
    v403 = 0u;
    v404 = 0u;
    v401 = 0u;
    v402 = 0u;
    v267 = v392;
    v268 = objc_msgSend(v267, "countByEnumeratingWithState:objects:count:", &v401, v429, 16);
    if (v268)
    {
      v269 = v268;
      v270 = *(_QWORD *)v402;
      do
      {
        for (j = 0; j != v269; ++j)
        {
          if (*(_QWORD *)v402 != v270)
            objc_enumerationMutation(v267);
          -[CAMUserPreferences _updateEntryForPresetType:inSmartStyles:withStyle:](self, "_updateEntryForPresetType:inSmartStyles:withStyle:", objc_msgSend(*(id *)(*((_QWORD *)&v401 + 1) + 8 * j), "presetType"), v262, *(_QWORD *)(*((_QWORD *)&v401 + 1) + 8 * j));
        }
        v269 = objc_msgSend(v267, "countByEnumeratingWithState:objects:count:", &v401, v429, 16);
      }
      while (v269);
    }

    if (v321)
    {
      v272 = -[CAMUserPreferences preserveSmartStyle](self, "preserveSmartStyle");
      v273 = v365;
      v274 = v365;
      if (!v272)
      {
        v275 = v274;
        v276 = 1;
        goto LABEL_521;
      }
    }
    else
    {
      v273 = v365;
      v279 = v365;
    }
    objc_msgSend(v325, "dictionaryForKey:", CFSTR("CAMUserPreferenceSmartStylesSystemStyleOverride"));
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v325, "dictionaryForKey:", CFSTR("CAMUserPreferenceSmartStylesSystemStyleOverrideReference"));
    v281 = objc_claimAutoreleasedReturnValue();
    v282 = (void *)v281;
    v275 = v273;
    if (v280)
    {
      v275 = v273;
      if (v281)
      {
        v400 = 0;
        objc_msgSend(MEMORY[0x1E0D0D098], "styleWithDictionary:error:", v280, &v400);
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        v283 = v400;
        v399 = 0;
        objc_msgSend(MEMORY[0x1E0D0D098], "styleWithDictionary:error:", v282, &v399);
        v366 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v358 = v399;
        if (v283)
        {
          v284 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
            -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.2();

        }
        if (v358)
        {
          v285 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR))
            -[CAMUserPreferences readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:].cold.1();

        }
        v319 = v282;
        v320 = v283;
        v318 = v280;
        if (v322 && v366 && -[__CFString isEqualToSmartStyle:](v366, "isEqualToSmartStyle:", v273))
        {
          v286 = os_log_create("com.apple.camera", "SmartStyle");
          if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v322;
            v425 = 2114;
            v426 = (__CFString *)v273;
            _os_log_impl(&dword_1DB760000, v286, OS_LOG_TYPE_DEFAULT, "Using customized System Style %{public}@ instead of system style %{public}@", buf, 0x16u);
          }

          v287 = v322;
          v275 = v322;
          v288 = v273;
LABEL_518:
          v291 = v366;
        }
        else
        {
          v288 = os_log_create("com.apple.camera", "SmartStyle");
          if (!os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
          {
            v287 = v322;
            v275 = v273;
            goto LABEL_518;
          }
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v322;
          v425 = 2114;
          v291 = v366;
          v426 = v366;
          v427 = 2114;
          v428 = v273;
          _os_log_impl(&dword_1DB760000, v288, OS_LOG_TYPE_DEFAULT, "Discarding customized System Style %{public}@ since the reference style was %{public}@ but is now %{public}@", buf, 0x20u);
          v287 = v322;
          v275 = v273;
        }

        v280 = v318;
        v282 = v319;
      }
    }

    v276 = 0;
LABEL_521:
    v397[0] = MEMORY[0x1E0C809B0];
    v397[1] = 3221225472;
    v397[2] = __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_360;
    v397[3] = &unk_1EA32A0C8;
    v292 = v275;
    v398 = v292;
    v293 = objc_msgSend(v262, "indexOfObjectPassingTest:", v397);
    v259 = v379;
    if (v293 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v262, "removeObjectAtIndex:", v293);
    v294 = -[CAMUserPreferences _updateEntryForPresetType:inSmartStyles:withStyle:](self, "_updateEntryForPresetType:inSmartStyles:withStyle:", 0, v262, v292);
    objc_msgSend(v325, "stringForKey:", CFSTR("CAMUserPreferenceSmartStylesSelectedPreset"));
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = -[CAMUserPreferences _findIndexOfSmartStylePresetString:inStyles:](self, "_findIndexOfSmartStylePresetString:inStyles:", v295, v262);
    v297 = v294;
    if ((v276 & 1) == 0)
    {
      v297 = v296;
      if (v296 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v294 == 0x7FFFFFFFFFFFFFFFLL)
          v297 = 0;
        else
          v297 = v294;
      }
    }
    v364 = v297;
    v357 = v294;

    v257 = v371;
    v149 = v390;
    v258 = v395;
  }
  else
  {
    v277 = objc_msgSend(v240, "integerForKey:", CFSTR("CAMUserPreferenceSelectedSemanticStyleIndex"));
    v278 = objc_msgSend(v353, "count");
    v259 = v379;
    v258 = v395;
    if (objc_msgSend(v392, "count") == v278)
    {
      if (v277 >= v278)
      {
        v262 = v353;
      }
      else
      {
        v262 = v392;

        v364 = v277;
      }
    }
    else
    {
      v289 = v277 < v278 && obja == 0;
      v290 = v364;
      if (v289)
        v290 = v277;
      v364 = v290;
      v262 = v353;
    }
    v257 = v371;
    v149 = v390;
  }

  v260 = v262;
LABEL_530:
  v298 = [CAMCaptureConfiguration alloc];
  v299 = -[CAMUserPreferences shouldMixAudioWithOthers](self, "shouldMixAudioWithOthers");
  BYTE2(v317) = v375;
  BYTE1(v317) = self->_spatialVideoEnabled;
  LOBYTE(v317) = v349;
  LOBYTE(v316) = v344;
  v300 = -[CAMCaptureConfiguration initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:](v298, "initWithCaptureMode:captureDevice:videoConfiguration:audioConfiguration:mixAudioWithOthers:flashMode:torchMode:HDRMode:irisMode:timerDuration:photoModeAspectRatioCrop:photoModeEffectFilterType:squareModeEffectFilterType:portraitModeEffectFilterType:portraitModeLightingEffectType:portraitModeApertureValue:portraitModeIntensityValue:mirrorFrontCameraCaptures:exposureBiasesByMode:macroMode:photoResolution:rawMode:proResVideoMode:semanticStyles:selectedSemanticStyleIndex:smartStyleSystemStyleIndex:videoStabilizationMode:zoomPIPEnabled:spatialVideoEnabled:optionalDepthEffectEnabled:sharedLibraryMode:", v149, v258, v368, v327, v299, v415, v144, v145, v374, v414, v413, v362,
           v334,
           v332,
           v330,
           v329,
           v328,
           v316,
           v257,
           v346,
           v411,
           v412,
           v370,
           v260,
           v364,
           v357,
           v385,
           v317,
           v341);
  v301 = -[CAMConflictingControlConfiguration initWithDesiredFlashMode:desiredHDRMode:flashAndHDRConflictingControl:desiredLivePhotoMode:desiredRAWMode:desiredPhotoResolution:photoFormatConflicts:desiredLowLightControlMode:lowLightConflicts:desiredMacroMode:]([CAMConflictingControlConfiguration alloc], "initWithDesiredFlashMode:desiredHDRMode:flashAndHDRConflictingControl:desiredLivePhotoMode:desiredRAWMode:desiredPhotoResolution:photoFormatConflicts:desiredLowLightControlMode:lowLightConflicts:desiredMacroMode:", v369, v259, v386, v388, v382, v348, v376, v355, v361, v372);
  objc_storeStrong((id *)&self->_captureConfiguration, v300);
  objc_storeStrong((id *)&self->_conflictingControlConfiguration, v301);
  self->_photoModeLastCapturedEffectFilterType = v340;
  self->_squareModeLastCapturedEffectFilterType = v338;
  self->_portraitModeLastCapturedEffectFilterType = v336;
  if (v149 == 8)
  {
    v304 = 1;
    v302 = v360;
    v303 = v359;
LABEL_534:
    self->_spatialModeHasVideoSelected = v304;
  }
  else
  {
    v302 = v360;
    v303 = v359;
    if (v149 == 9)
    {
      v304 = 0;
      goto LABEL_534;
    }
  }
  -[CAMUserPreferences _setDidResetTorchMode:](self, "_setDidResetTorchMode:", v302);
  if (v350)
  {
    self->_overriddenBackCaptureInterval = objc_msgSend(v10, "integerForKey:", CFSTR("CAMInternalPreferenceOverriddenBackBurstCaptureInterval"));
    overriddenFrontCaptureInterval = objc_msgSend(v10, "integerForKey:", CFSTR("CAMInternalPreferenceOverriddenFrontBurstCaptureInterval"));
    self->_overriddenFrontCaptureInterval = overriddenFrontCaptureInterval;
    if (self->_overriddenBackCaptureInterval >= 1)
    {
      v306 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v306, OS_LOG_TYPE_DEFAULT))
      {
        overriddenBackCaptureInterval = self->_overriddenBackCaptureInterval;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = overriddenBackCaptureInterval;
        _os_log_impl(&dword_1DB760000, v306, OS_LOG_TYPE_DEFAULT, "Using overridden back capture interval: %ld", buf, 0xCu);
      }

      overriddenFrontCaptureInterval = self->_overriddenFrontCaptureInterval;
      v257 = v371;
    }
    if (overriddenFrontCaptureInterval >= 1)
    {
      v308 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
      {
        v309 = self->_overriddenFrontCaptureInterval;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v309;
        _os_log_impl(&dword_1DB760000, v308, OS_LOG_TYPE_DEFAULT, "Using overridden front capture interval: %ld", buf, 0xCu);
      }

      v257 = v371;
    }
    self->_burstFollowsEncoderSettings = objc_msgSend(v10, "BOOLForKey:", CFSTR("CAMUserPreferenceDebugBurstRespectsEncodingSettings"));
    objc_msgSend(v10, "doubleForKey:", CFSTR("CAMDebugResetTimeoutSeconds"));
    self->__resetTimeoutOverride = v310;
    self->_preferredMinimumFreeBytes = objc_msgSend(v10, "integerForKey:", CFSTR("CAMInternalPreferenceOverridenPreferredStorageThreshold"));
  }
  v311 = objc_msgSend(v9, "hostProcess");
  if (v311 <= 4 && ((1 << v311) & 0x15) != 0)
    -[CAMUserPreferences _publishAnalyticsIfNeeded](self, "_publishAnalyticsIfNeeded");
  -[CAMUserPreferences _setHasReadLastWrittenValues:](self, "_setHasReadLastWrittenValues:", 1);
  if (a6)
  {
    v312 = v324 || v323;
    if (v380)
      v312 = 0;
    *a6 = v312;
  }

  return v326;
}

id __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = fabs(v5);

    v7 = 0;
    if (v6 > 86400.0)
      goto LABEL_6;
  }
  else
  {
    v3 = 0;
  }
  v3 = v3;
  v7 = v3;
LABEL_6:

  return v7;
}

uint64_t __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_355(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSupportedVideoConfiguration:forMode:device:spatialVideoEnabled:trueVideoEnabled:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 34), 0);
}

BOOL __108__CAMUserPreferences_readPreferencesWithOverrides_emulationMode_callActive_shouldResetCaptureConfiguration___block_invoke_360(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "presetType");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "presetType");
}

- (unint64_t)_updateEntryForPresetType:(int64_t)a3 inSmartStyles:(id)a4 withStyle:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  _QWORD v11[5];

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__CAMUserPreferences__updateEntryForPresetType_inSmartStyles_withStyle___block_invoke;
  v11[3] = &__block_descriptor_40_e30_B32__0__CEKSmartStyle_8Q16_B24l;
  v11[4] = a3;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v11);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v8, v9);

  return v9;
}

BOOL __72__CAMUserPreferences__updateEntryForPresetType_inSmartStyles_withStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presetType") == *(_QWORD *)(a1 + 32);
}

- (id)_semanticStylesKey
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "semanticStylesVersion");

  v4 = CFSTR("CAMUserPreferenceSmartStylesCustomizedStyles");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return (id)v4;
  else
    return CFSTR("CAMUserPreferenceSemanticStyles");
}

void __38__CAMUserPreferences_writePreferences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v10 = v5;
  if (!*(_BYTE *)(a1 + 48)
    || (v6 = objc_msgSend(*(id *)(a1 + 32), "smartStyleSystemStyleIndex"), v5 = v10, v6 != a3)
    && (v7 = objc_msgSend(v10, "isCustomized"), v5 = v10, v7))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v5 = v10;
  }

}

- (void)_writeSmartStylePresetStringForIndex:(int64_t)a3 inStyles:(id)a4 key:(id)a5
{
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (__CFString *)a5;
  if (objc_msgSend(v10, "count") <= (unint64_t)a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0D098], "persistenceStringForPresetType:", objc_msgSend(v8, "presetType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  CFPreferencesSetAppValue(v7, v9, CFSTR("com.apple.camera"));

}

- (int64_t)_findIndexOfSmartStylePresetString:(id)a3 inStyles:(id)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;
  _QWORD v9[5];
  char v10;

  v5 = a4;
  v10 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0D0D098], "presetTypeFromPersistenceString:success:", a3, &v10);
  if (v10)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__CAMUserPreferences__findIndexOfSmartStylePresetString_inStyles___block_invoke;
    v9[3] = &__block_descriptor_40_e34_B32__0___CEKCaptureStyle__8Q16_B24l;
    v9[4] = v6;
    v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

BOOL __66__CAMUserPreferences__findIndexOfSmartStylePresetString_inStyles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "presetType");
}

- (void)_updateLastWrittenSettingsDate
{
  void *v3;
  id v4;

  -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("CAMUserPreferencesLastWrittenSettingsDate"));
  -[CAMUserPreferences _setLastWrittenSettingsDate:](self, "_setLastWrittenSettingsDate:", v3);

}

+ (void)updateLastViewedSettingsDate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferencesLastViewedSettingsInterfaceDate"), v2, CFSTR("com.apple.camera"));

}

- (BOOL)_shouldReconfigureCurrentConfigurationForSettingsChange
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CAMUserPreferences _lastViewedSettingsInterfaceDate](self, "_lastViewedSettingsInterfaceDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences _lastWrittenSettingsDate](self, "_lastWrittenSettingsDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !-[CAMUserPreferences _hasReadLastWrittenValues](self, "_hasReadLastWrittenValues")
    && objc_msgSend(v4, "compare:", v3) == -1;

  return v5;
}

- (NSDate)resetTimeoutDate
{
  void *v3;
  void *v4;

  -[CAMUserPreferences _lastWrittenSettingsDate](self, "_lastWrittenSettingsDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences _resetTimeoutSeconds](self, "_resetTimeoutSeconds");
  if (v3)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)_shouldResetPreferencesForTimeout
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;

  -[CAMUserPreferences resetTimeoutDate](self, "resetTimeoutDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("CAMUserPreferencePreserveAllSettings"));

  if ((v5 & 1) != 0 || -[CAMUserPreferences _hasReadLastWrittenValues](self, "_hasReadLastWrittenValues"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "compare:", v7) == -1;

  }
  return v6;
}

- (double)_resetTimeoutSeconds
{
  double v2;
  double v3;
  double result;
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CAMUserPreferences _resetTimeoutOverride](self, "_resetTimeoutOverride");
  v3 = v2;
  result = 30.0;
  if (v3 > 0.0)
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "DEBUG: overriding reset timeout as %f seconds", (uint8_t *)&v6, 0xCu);
    }

    return v3;
  }
  return result;
}

- (int64_t)videoEncodingBehaviorForConfiguration:(int64_t)a3 mode:(int64_t)a4 desiredProResVideoMode:(int64_t)a5 outputToExternalStorage:(BOOL)a6 spatialVideoEnabled:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  void *v13;
  void *v14;
  char v15;
  int64_t v16;
  unsigned int v17;

  v7 = a7;
  v8 = a6;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a5 == 1)
    v15 = objc_msgSend(v13, "isProResVideoSupportedForMode:videoConfiguration:outputToExternalStorage:", a4, a3, v8);
  else
    v15 = 0;
  if (v7)
    v16 = 1;
  else
    v16 = 2;
  if (!v7 && (v15 & 1) == 0)
  {
    if (objc_msgSend(v14, "isHEVCEncodingSupported"))
    {
      if ((unint64_t)(a4 - 7) < 3)
        v17 = 1;
      else
        v17 = ((unint64_t)a3 < 0xF) & (0x6300u >> a3);
      if (-[CAMUserPreferences HDR10BitVideoEnabled](self, "HDR10BitVideoEnabled")
        && objc_msgSend(v14, "isHDR10BitVideoSupportedForMode:", a4))
      {
        if (((v17 | objc_msgSend(v14, "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", a3, 1)) & 1) != 0)goto LABEL_19;
      }
      else if ((v17 & 1) != 0)
      {
LABEL_19:
        v16 = 1;
        goto LABEL_21;
      }
      if (-[CAMUserPreferences _preferHEVCWhenAvailable](self, "_preferHEVCWhenAvailable"))
        goto LABEL_19;
    }
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (int64_t)photoEncodingBehaviorForMode:(int64_t)a3 resolvedRAWMode:(int64_t)a4 isCapturingVideo:(BOOL)a5
{
  int64_t result;

  if (a5)
  {
    result = 0;
  }
  else if (a4 == 1)
  {
    result = 2;
  }
  else
  {
    result = -[CAMUserPreferences photoEncodingBehavior](self, "photoEncodingBehavior");
  }
  if (a3 == 9)
    return 1;
  return result;
}

+ (BOOL)shouldEnableHDR10BitVideoForHEVCEnabled:(BOOL)a3 capabilities:(id)a4
{
  int v5;
  int AppBooleanValue;
  int v7;
  BOOL v8;
  Boolean keyExistsAndHasValidFormat;

  v5 = objc_msgSend(a4, "isHDR10BitVideoSupported");
  if (v5)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceHDR10BitVideoEnabled"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
    v7 = AppBooleanValue;
    if (a3)
    {
      if (keyExistsAndHasValidFormat)
        v8 = AppBooleanValue == 0;
      else
        v8 = 0;
    }
    else if (CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencesDidConfirmHDR10BitVideoMostCompatiblePreference"), CFSTR("com.apple.camera"), 0))
    {
      v8 = v7 == 0;
    }
    else
    {
      v8 = 1;
    }
    LOBYTE(v5) = !v8;
  }
  return v5;
}

- (BOOL)prefersHDR10BitVideoForCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "shouldEnableHDR10BitVideoForHEVCEnabled:capabilities:", -[CAMUserPreferences _preferHEVCWhenAvailable](self, "_preferHEVCWhenAvailable"), v4);

  return (char)self;
}

- (BOOL)shouldDisableCameraSwitchingDuringVideoRecordingForMode:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 0;
  if (((1 << a3) & 0x86) != 0)
    return -[CAMUserPreferences _shouldDisableCameraSwitchingDuringVideoRecording](self, "_shouldDisableCameraSwitchingDuringVideoRecording");
  return ((1 << a3) & 0x300) != 0;
}

- (void)setDidAcknowledgePortraitModeDescription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v6, "isFrontPortraitModeSupported") & 1) != 0
     || objc_msgSend(v6, "isBackPortraitModeSupported"))
    && self->_didAcknowledgePortraitModeDescription != v3)
  {
    self->_didAcknowledgePortraitModeDescription = v3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("CAMUserPreferencePortraitModeDidAcknowledgeDescription_12"));

  }
}

- (void)setDidAcknowledgeCinematicModeDescription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCinematicModeSupported");

  if (v6)
  {
    if (self->_didAcknowledgeCinematicModeDescription != v3)
    {
      self->_didAcknowledgeCinematicModeDescription = v3;
      -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceCinematicModeDidAcknowledgeDescription"));

    }
  }
}

- (void)setDidAcknowledgeSemanticStylesDescription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticStylesSupport");

  if ((v6 & 8) != 0 && self->_didAcknowledgeSemanticStylesDescription != v3)
  {
    self->_didAcknowledgeSemanticStylesDescription = v3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceSemanticStylesDidAcknowledgeDescription"));

  }
}

- (void)setDidAcknowledgeSmartStylesDescription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "semanticStylesSupport") & 8) != 0
    && objc_msgSend(v6, "smartStylesSupported")
    && self->_didAcknowledgeSmartStylesDescription != v3)
  {
    self->_didAcknowledgeSmartStylesDescription = v3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceSmartStylesDidAcknowledgeDescription"));

  }
}

- (BOOL)mirrorCameraCapturesForDevicePosition:(int64_t)a3 mode:(int64_t)a4
{
  void *v5;
  char v6;

  if (a3 != 1 || !-[CAMUserPreferences shouldMirrorFrontCameraCaptures](self, "shouldMirrorFrontCameraCaptures"))
    return 0;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mirroredFrontCapturesSupportedForMode:", a4);

  return v6;
}

- (int64_t)maximumPhotoResolutionForMode:(int64_t)a3 device:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  char v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  char v16;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a4 - 1) > 0xA)
    v8 = 0;
  else
    v8 = qword_1DB9A4F38[a4 - 1];
  v9 = -[CAMUserPreferences preferredHEICPhotoResolutionForDevicePosition:](self, "preferredHEICPhotoResolutionForDevicePosition:", v8);
  v10 = -[CAMUserPreferences maximumRAWPhotoResolution](self, "maximumRAWPhotoResolution");
  if (-[CAMUserPreferences shouldUsePhotoFormatControlForMode:](self, "shouldUsePhotoFormatControlForMode:", a3))
  {
    v9 = objc_msgSend(v7, "maximumPhotoResolutionForMode:device:encoding:", a3, a4, 1);
    v10 = objc_msgSend(v7, "maximumPhotoResolutionForMode:device:encoding:", a3, a4, 2);
  }
  v11 = objc_msgSend(v7, "isPhotoResolutionSupported:forMode:device:photoEncoding:", v10, a3, a4, 2);
  v12 = objc_msgSend(v7, "isPhotoResolutionSupported:forMode:device:photoEncoding:", v9, a3, a4, 1);
  if ((unint64_t)(v10 - 1) > 2)
    v13 = 0;
  else
    v13 = qword_1DB9A4F20[v10 - 1];
  if ((unint64_t)(v9 - 1) > 2)
    v14 = 0;
  else
    v14 = qword_1DB9A4F20[v9 - 1];
  v15 = v13 > v14;
  v16 = v11 ^ 1;
  if (!v15)
    v16 = 1;
  if ((v16 & 1) != 0 || !-[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled"))
  {
    if (v12)
      v10 = v9;
    else
      v10 = 0;
  }

  return v10;
}

- (int64_t)preferredHEICPhotoResolutionForDevicePosition:(int64_t)a3
{
  if (a3 == 1)
    return -[CAMUserPreferences _frontPreferredHEICPhotoResolution](self, "_frontPreferredHEICPhotoResolution");
  if (a3)
    return 0;
  return -[CAMUserPreferences _backPreferredHEICPhotoResolution](self, "_backPreferredHEICPhotoResolution");
}

- (BOOL)usingMostCompatibleEncoding
{
  return objc_msgSend(MEMORY[0x1E0D75128], "newFormatsConfiguration") == 1;
}

- (BOOL)didConfirmVideoMostCompatible
{
  return CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencesDidConfirmVideoMostCompatible"), CFSTR("com.apple.camera"), 0) != 0;
}

- (BOOL)didConfirmSlomo1080p240MostCompatible
{
  return CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencesDidConfirmSlomo1080p240MostCompatible"), CFSTR("com.apple.camera"), 0) != 0;
}

- (int64_t)videoStabilizationStrengthForVideoStabilizationMode:(int64_t)a3 captureMode:(int64_t)a4 spatialVideoEnabled:(BOOL)a5
{
  _BOOL4 v5;
  int64_t v7;
  _BOOL4 v8;

  v5 = a5;
  if (a3 == 1)
  {
    v8 = -[CAMUserPreferences actionModeLowLightEnabled](self, "actionModeLowLightEnabled");
    v7 = 2;
    if (!v8)
      v7 = 3;
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[CAMUserPreferences enhancedVideoStabilization](self, "enhancedVideoStabilization");
  }
  if (a4 == 8 || v5)
    return 1;
  else
    return v7;
}

- (BOOL)isAutoFPSVideoEnabledForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 encodingBehavior:(int64_t)a6 outputToExternalStorage:(BOOL)a7 spatialVideoEnabled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  BOOL v22;
  void *v23;
  int v24;
  uint64_t v26;
  int v27;

  v8 = a8;
  v9 = a7;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v15, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, a5, a6, v9, v8, -[CAMUserPreferences prefersHDR10BitVideoForCapabilities:](self, "prefersHDR10BitVideoForCapabilities:", v16));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = -[CAMUserPreferences prefersHDR10BitVideoForCapabilities:](self, "prefersHDR10BitVideoForCapabilities:", v18);
  v19 = objc_msgSend(v17, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", a3, a4, a6, a5, v9, v8, v26);

  if ((unint64_t)(v19 - 5) >= 3)
  {
    v22 = (v19 == 9 || v19 == 1)
       && (+[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities"),
           v23 = (void *)objc_claimAutoreleasedReturnValue(),
           v24 = objc_msgSend(v23, "isVariableFramerateVideoSupported"),
           v23,
           v24)
       && -[CAMUserPreferences VFRMode](self, "VFRMode") == 2;
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isVariableFramerateVideoSupported");

    if (v21)
      v22 = (unint64_t)(-[CAMUserPreferences VFRMode](self, "VFRMode") - 1) < 2;
    else
      v22 = -[CAMUserPreferences isLowLightVideoEnabled](self, "isLowLightVideoEnabled");
  }
  return v27 && v22 && !v8;
}

+ (void)performLowLightVideoMigrationWithCapabilities:(id)a3
{
  id v3;
  unint64_t v4;
  int AppBooleanValue;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  CFIndex AppIntegerValue;
  const __CFString *v11;
  NSObject *v12;
  Boolean v13;
  Boolean v14;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "shouldPersistPreferences"))
    goto LABEL_27;
  v4 = objc_msgSend(v3, "defaultVFRMode");
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceDidPerformVFRUpgrade"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    v14 = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceAutoLowLightVideoEnabled"), CFSTR("com.apple.camera"), &v14);
    if (v14)
    {
      if (!AppBooleanValue)
      {
        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceVFRMode"), &unk_1EA3B0190, CFSTR("com.apple.camera"));
        v8 = CFSTR("Performing one-time upgrade of auto low light from Off to VFRModeOff for variable frame rate video");
LABEL_15:
        v9 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v8;
          _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceDidPerformVFRUpgrade"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));

        goto LABEL_18;
      }
      if (v4 > 2)
        v6 = 0;
      else
        v6 = off_1EA32A328[v4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Performing one-time upgrade of auto low light from On to %@ for variable frame rate video"), v6);
    }
    else
    {
      if (v4 > 2)
        v7 = 0;
      else
        v7 = off_1EA32A328[v4];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted one-time upgrade of auto low light. Key doesn't exist. Using %@ for variable frame rate video"), v7);
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceVFRMode"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4), CFSTR("com.apple.camera"));
    goto LABEL_15;
  }
LABEL_18:
  v14 = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceDidPerformVFRUpgrade2"), CFSTR("com.apple.camera"), &v14);
  if (!v14 && v4 == 2)
  {
    v13 = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceVFRMode"), CFSTR("com.apple.camera"), &v13);
    if (!v13 || AppIntegerValue)
    {
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceVFRMode"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2), CFSTR("com.apple.camera"));
      v11 = CFSTR("Performing one-time upgrade to VFRMode30And60");
    }
    else
    {
      v11 = CFSTR("Not upgrading to VFRMode30And60 because user value was set to VFRModeOff");
    }
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = (__CFString *)v11;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceDidPerformVFRUpgrade2"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
  }
LABEL_27:

}

+ (void)performResponsiveShutterMigrationWithCapabilities:(id)a3
{
  int AppBooleanValue;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;
  Boolean v9;
  Boolean keyExistsAndHasValidFormat;

  if (objc_msgSend(a3, "shouldPersistPreferences"))
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceEnableResponsiveShutterMigrationFromCoreMedia"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      v9 = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("responsiveShutter.adaptiveQuality.enabled"), CFSTR("com.apple.coremedia"), &v9);
      if (v9)
      {
        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceEnableResponsiveShutter"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AppBooleanValue != 0), CFSTR("com.apple.camera"));
        v4 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 0;
          v5 = "Performing one-time migration of responsiveShutter.adaptiveQuality.enabled | com.apple.coremedia to CAMUs"
               "erPreferenceEnableResponsiveShutter";
          v6 = (uint8_t *)&v8;
LABEL_8:
          _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
        }
      }
      else
      {
        v4 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 0;
          v5 = "When attempting one-time migration of responsiveShutter.adaptiveQuality.enabled | com.apple.coremedia, no"
               " value found. Not updating CAMUserPreferenceEnableResponsiveShutter";
          v6 = (uint8_t *)&v7;
          goto LABEL_8;
        }
      }

      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceEnableResponsiveShutterMigrationFromCoreMedia"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
    }
  }
}

+ (void)performSuperWideAutoMacroMigrationWithCapabilities:(id)a3
{
  id v3;
  int AppBooleanValue;
  const __CFString *v5;
  NSObject *v6;
  Boolean v7;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "shouldPersistPreferences"))
  {
    if (objc_msgSend(v3, "shouldPerformSuperWideAutoMacroMigration"))
    {
      keyExistsAndHasValidFormat = 0;
      CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceDidPerformSuperWideAutoMacroUpgrade"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
        v7 = 0;
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceEnableSuperWideAutoMacro"), CFSTR("com.apple.camera"), &v7);
        v5 = CFSTR("Attemped one-time upgrade of Auto Macro, which isn't disabled. Leaving default behavior.");
        if (v7 && !AppBooleanValue)
        {
          CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceAutoMacroMode"), &unk_1EA3B0190, CFSTR("com.apple.camera"));
          CFPreferencesSetAppValue(CFSTR("CAMUserPreferencePreserveSuperWideAutoMacro"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
          v5 = CFSTR("Performing one-time upgrade of Auto Macro Off to CAMMacroModeOff with preserve Off.");
        }
        v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = v5;
          _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceDidPerformSuperWideAutoMacroUpgrade"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
      }
    }
  }

}

+ (void)performAudioConfigurationMigrationWithCapabilities:(id)a3
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceAudioConfiguration"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceForceMonoAudioRecording"), CFSTR("com.apple.camera"), 0))
    {
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceAudioConfiguration"), &unk_1EA3B0208, CFSTR("com.apple.camera"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
    }
  }
}

+ (void)performHorizonLevelUpgradeWithCapabilities:(id)a3
{
  Boolean keyExistsAndHasValidFormat;

  if (objc_msgSend(a3, "shouldPersistPreferences"))
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceDidPerformHorizonLevelUpgrade"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      if (CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceShowGridOverlay"), CFSTR("com.apple.camera"), 0))
        CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceShowHorizonLevelPlumb"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
      CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceDidPerformHorizonLevelUpgrade"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
    }
  }
}

+ (void)performMostCompatibleConfirmationMigrationWithCapabilities:(id)a3
{
  int v3;
  uint64_t v4;
  int AppBooleanValue;
  int v6;
  BOOL v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "shouldPersistPreferences"))
  {
    v3 = objc_msgSend(v8, "isHEVCEncodingSupported");
    v4 = objc_msgSend(MEMORY[0x1E0D75128], "newFormatsConfiguration");
    if (v3)
    {
      if (v4 == 1)
      {
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencesDidConfirmVideoMostCompatible"), CFSTR("com.apple.camera"), 0);
        v6 = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencesDidConfirmVideoMostCompatible"), CFSTR("com.apple.camera"), 0);
        if (AppBooleanValue)
          v7 = v6 == 0;
        else
          v7 = 0;
        if (v7)
        {
          CFPreferencesSetAppValue(CFSTR("CAMUserPreferencesDidConfirmVideoMostCompatible"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
          CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
        }
      }
    }
  }

}

+ (void)performApertureMigrationWithCapabilities:(id)a3
{
  id v3;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  if (objc_msgSend(v3, "isDepthEffectApertureSupported"))
  {
    if (objc_msgSend(v3, "shouldPersistPreferences"))
    {
      keyExistsAndHasValidFormat = 0;
      CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencePreserveApertureDidMigrate"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
      if (!keyExistsAndHasValidFormat)
      {
        if (CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferencePreserveEffectFilter"), CFSTR("com.apple.camera"), 0))
        {
          CFPreferencesSetAppValue(CFSTR("CAMUserPreferencePreserveAperture"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
        }
        CFPreferencesSetAppValue(CFSTR("CAMUserPreferencePreserveApertureDidMigrate"), MEMORY[0x1E0C9AAB0], CFSTR("com.apple.camera"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
      }
    }
  }

}

- (BOOL)shouldUsePhotoFormatControlForMode:(int64_t)a3
{
  void *v4;
  int v5;
  int v6;

  if (-[CAMUserPreferences photoFormatControlEnabled](self, "photoFormatControlEnabled"))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPhotoResolutionSupported:forMode:device:photoEncoding:", 3, a3, 0, 1);
    v6 = v5 | objc_msgSend(v4, "isPhotoResolutionSupported:forMode:device:photoEncoding:", 3, a3, 1, 1);

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isPhotoFormat:(id)a3 enabledForMode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1;
  unint64_t var0;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  char v14;

  var1 = a3.var1;
  var0 = a3.var0;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (var0 < 2)
  {
    if ((unint64_t)(a5 - 1) > 0xA)
      v12 = 0;
    else
      v12 = qword_1DB9A4F38[a5 - 1];
    v13 = -[CAMUserPreferences preferredHEICPhotoResolutionForDevicePosition:](self, "preferredHEICPhotoResolutionForDevicePosition:", v12);
    if (var0 == -[CAMUserPreferences photoEncodingBehavior](self, "photoEncodingBehavior")
      && (var1 == 3
       || var1 == v13
       || objc_msgSend(v11, "featureDevelopmentAllowAllHEICOptionsInPhotoPicker")))
    {
      goto LABEL_13;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (var0 != 2
    || !objc_msgSend(v10, "isLinearDNGSupportedForMode:", a4)
    || !-[CAMUserPreferences rawControlEnabled](self, "rawControlEnabled"))
  {
    goto LABEL_14;
  }
LABEL_13:
  v14 = objc_msgSend(v11, "isPhotoFormatSupported:forMode:device:", var0, var1, a4, a5);
LABEL_15:

  return v14;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)fallbackPhotoFormatForDesiredFormat:(id)a3 mode:(int64_t)a4 device:(int64_t)a5
{
  int64_t var1;
  int64_t var0;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  BOOL v15;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  _OWORD v20[8];
  uint64_t v21;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v21 = *MEMORY[0x1E0C80C00];
  if (-[CAMUserPreferences isPhotoFormat:enabledForMode:device:](self, "isPhotoFormat:enabledForMode:device:"))
  {
    v10 = var1;
    v11 = var0;
  }
  else
  {
    v20[0] = xmmword_1DB9A4FA0;
    v20[1] = xmmword_1DB9A4FB0;
    v20[2] = xmmword_1DB9A4FC0;
    v20[3] = xmmword_1DB9A4FD0;
    v20[4] = vdupq_n_s64(1uLL);
    v20[5] = xmmword_1DB9A4FE0;
    v20[6] = xmmword_1DB9A4FF0;
    v20[7] = xmmword_1DB9A5000;
    v19 = -[CAMUserPreferences photoEncodingBehavior](self, "photoEncodingBehavior");
    if ((unint64_t)(a5 - 1) > 0xA)
      v12 = 0;
    else
      v12 = qword_1DB9A4F38[a5 - 1];
    v13 = -[CAMUserPreferences preferredHEICPhotoResolutionForDevicePosition:](self, "preferredHEICPhotoResolutionForDevicePosition:", v12);
    v14 = 0;
    v15 = 0;
    do
    {
      v11 = *(_QWORD *)&v20[v14];
      v10 = *((_QWORD *)&v20[v14] + 1);
      if (v15)
      {
        if (-[CAMUserPreferences isPhotoFormat:enabledForMode:device:](self, "isPhotoFormat:enabledForMode:device:", *(_QWORD *)&v20[v14], *((_QWORD *)&v20[v14] + 1), a4, a5))
        {
          goto LABEL_18;
        }
        v15 = 1;
      }
      else
      {
        v15 = var0 == v11 && var1 == v10;
      }
      ++v14;
    }
    while (v14 != 8);
    v10 = v13;
    v11 = v19;
  }
LABEL_18:
  v17 = v11;
  v18 = v10;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)resolvedPhotoFormatForResolvedResolution:(int64_t)a3 rawMode:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  if ((unint64_t)a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  v6 = -[CAMUserPreferences photoEncodingBehavior](self, "photoEncodingBehavior");
  if (a4 == 1)
    v6 = 2;
  v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)setDidAcknowledgeCTMDescription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_didAcknowledgeCTMDescription != a3)
  {
    v3 = a3;
    self->_didAcknowledgeCTMDescription = a3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceCTMDidAcknowledgeDescription"));

  }
}

- (int64_t)previewViewAspectModeForMode:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 0;
  if (((1 << a3) & 0x1A6) != 0)
    return -[CAMUserPreferences _previewAspectModeForVideoModes](self, "_previewAspectModeForVideoModes");
  if (((1 << a3) & 0x241) != 0)
    return -[CAMUserPreferences _previewAspectModeForPhotoModes](self, "_previewAspectModeForPhotoModes");
  else
    return 0;
}

- (void)setPreviewViewAspectMode:(int64_t)a3 forMode:(int64_t)a4
{
  if ((unint64_t)a4 <= 9)
  {
    if (((1 << a4) & 0x1A6) != 0)
    {
      -[CAMUserPreferences _setPreviewAspectModeForVideoModes:](self, "_setPreviewAspectModeForVideoModes:", a3);
    }
    else if (((1 << a4) & 0x241) != 0)
    {
      -[CAMUserPreferences _setPreviewAspectModeForPhotoModes:](self, "_setPreviewAspectModeForPhotoModes:", a3);
    }
  }
}

+ (BOOL)isSharedLibrarySupportedAndEnabledForCapabilities:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "librarySelectionSupported");
  if (v3)
    LOBYTE(v3) = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E0CD1C88], CFSTR("com.apple.mobileslideshow"), 0) != 0;
  return v3;
}

+ (BOOL)hasSharedLibraryAlgorithmsPreferences
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceSharedLibraryMode"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat != 0;
}

+ (void)removeSharedLibraryAlgorithmsPreferences
{
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryMode"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastLocation"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastLocationAcquiredDuringTrip"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryDate"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastDiscoveryLocation"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastUserActionDate"), 0, CFSTR("com.apple.camera"));
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSharedLibraryLastUserActionLocation"), 0, CFSTR("com.apple.camera"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
}

- (void)_resetSharedLibraryAlgorithmsPreferences
{
  id v3;

  -[CAMUserPreferences setSharedLibraryLastLocation:](self, "setSharedLibraryLastLocation:", 0);
  -[CAMUserPreferences setSharedLibraryLastLocationAcquiredDuringTrip:](self, "setSharedLibraryLastLocationAcquiredDuringTrip:", 0);
  -[CAMUserPreferences setSharedLibraryLastDiscoveryDate:](self, "setSharedLibraryLastDiscoveryDate:", 0);
  -[CAMUserPreferences setSharedLibraryLastDiscoveryLocation:](self, "setSharedLibraryLastDiscoveryLocation:", 0);
  -[CAMUserPreferences setSharedLibraryLastUserActionDate:](self, "setSharedLibraryLastUserActionDate:", 0);
  -[CAMUserPreferences setSharedLibraryLastUserActionLocation:](self, "setSharedLibraryLastUserActionLocation:", 0);
  -[CAMUserPreferences captureConfiguration](self, "captureConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedLibraryMode:", 0);

}

- (BOOL)allowExplicitProResColorSpace
{
  void *v2;
  char v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProResLogColorSpaceSupported");

  return v3;
}

- (int64_t)colorSpaceForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 videoEncodingBehavior:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 device:(int64_t)a7
{
  _BOOL8 v8;
  void *v13;
  int64_t v14;
  _BOOL4 v15;
  int v16;
  int v17;
  int64_t v18;
  _BOOL4 v19;
  int v20;
  int v21;
  uint64_t v23;

  v8 = a6;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1;
  switch(a3)
  {
    case 1:
    case 7:
      v15 = -[CAMUserPreferences HDR10BitVideoEnabled](self, "HDR10BitVideoEnabled");
      v16 = objc_msgSend(v13, "isHDR10BitVideoSupportedForMode:", a3);
      v17 = objc_msgSend(v13, "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", a4, a5);
      if (a5 == 2 && -[CAMUserPreferences allowExplicitProResColorSpace](self, "allowExplicitProResColorSpace"))
      {
        v18 = -[CAMUserPreferences explicitProResColorSpace](self, "explicitProResColorSpace");
      }
      else if ((v15 & v16 & v17) != 0)
      {
        v18 = 2;
      }
      else
      {
        v18 = v15 | v16 ^ 1u;
      }
      if (v8)
        v14 = 0;
      else
        v14 = v18;
      break;
    case 2:
      if (!a4)
      {
        LOBYTE(v23) = -[CAMUserPreferences prefersHDR10BitVideoForCapabilities:](self, "prefersHDR10BitVideoForCapabilities:", v13);
        a4 = objc_msgSend(v13, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", 2, a7, a5, 0, 0, v8, v23);
      }
      v19 = -[CAMUserPreferences HDR10BitVideoEnabled](self, "HDR10BitVideoEnabled");
      v20 = objc_msgSend(v13, "isHDR10BitVideoSupportedForMode:", 2);
      v21 = objc_msgSend(v13, "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", a4, a5);
      if ((v19 & v20 & v21 & objc_msgSend(v13, "isHDR10BitSlomoSupportedForDevice:", a7)) != 0)
        v14 = 2;
      else
        v14 = 1;
      break;
    case 5:
    case 8:
      v14 = 0;
      break;
    default:
      break;
  }

  return v14;
}

- (void)setDidAcknowledgeDepthInPhotoModeDescription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_didAcknowledgeDepthInPhotoModeDescription != a3)
  {
    v3 = a3;
    self->_didAcknowledgeDepthInPhotoModeDescription = a3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceDidAcknowledgeDepthInPhotoModeDescription"));

  }
}

- (unint64_t)audioConfigurationForMode:(int64_t)a3 device:(int64_t)a4 emulationMode:(int64_t)a5 duringCall:(BOOL)a6
{
  int v8;
  _BOOL4 v9;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v8 = 0;
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x186) != 0)
    {
      v8 = 1;
    }
    else if (((1 << a3) & 0x211) != 0)
    {
      v9 = a6;
      if ((unint64_t)(a4 - 1) > 0xA)
        v11 = 0;
      else
        v11 = qword_1DB9A4F38[a4 - 1];
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isLivePhotoSupportedForDevicePosition:", v11);

      if (v13)
      {
        if (a5)
          v8 = 0;
        else
          v8 = !v9;
      }
      else
      {
        v8 = 0;
      }
    }
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "disableAudio");

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isStereoAudioRecordingSupportedForMode:", a3);
  v18 = objc_msgSend(v16, "isCinematicAudioSupportedForMode:", a3);
  v19 = -[CAMUserPreferences preferredAudioConfiguration](self, "preferredAudioConfiguration");
  v20 = 0;
  if (v8 && !v15)
  {
    if (v19 == 3)
    {
      v21 = 1;
      if (v17)
        v21 = 2;
      if (v18)
        v20 = 3;
      else
        v20 = v21;
    }
    else if (v19 == 2)
    {
      if (v17)
        v20 = 2;
      else
        v20 = 1;
    }
    else
    {
      v20 = v19 == 1;
    }
  }

  return v20;
}

- (BOOL)windRemovalEnabledForAudioConfiguration:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2
      && -[CAMUserPreferences shouldEnableWindRemoval](self, "shouldEnableWindRemoval");
}

+ (unint64_t)selectedAudioConfigurationForCapabilities:(id)a3
{
  id v3;
  CFIndex AppIntegerValue;
  unint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceAudioConfiguration"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  v5 = AppIntegerValue;
  if (AppIntegerValue != 1)
  {
    if (AppIntegerValue == 3)
    {
      LOBYTE(AppIntegerValue) = objc_msgSend(v3, "isCinematicAudioSupported");
    }
    else
    {
      if (AppIntegerValue != 2)
      {
LABEL_8:
        if ((objc_msgSend(v3, "isCinematicAudioSupported") & 1) != 0)
        {
          v5 = 3;
        }
        else if (objc_msgSend(v3, "isStereoAudioRecordingSupported"))
        {
          v5 = 2;
        }
        else
        {
          v5 = 1;
        }
        goto LABEL_13;
      }
      LOBYTE(AppIntegerValue) = objc_msgSend(v3, "isStereoAudioRecordingSupported");
    }
  }
  if (!keyExistsAndHasValidFormat || (AppIntegerValue & 1) == 0)
    goto LABEL_8;
LABEL_13:

  return v5;
}

- (void)setDidAcknowledgeSpatialVideoOverlayDescription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_didAcknowledgeSpatialVideoOverlayDescription != a3)
  {
    v3 = a3;
    self->_didAcknowledgeSpatialVideoOverlayDescription = a3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceDidAcknowledgeSpatialVideoOverlayDescription"));

  }
}

- (void)setSpatialVideoControlEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_spatialVideoControlEnabled != a3)
  {
    v3 = a3;
    self->_spatialVideoControlEnabled = a3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceEnableSpatialVideoCaptureControl"));

  }
}

- (void)setDidAcknowledgeSpatialModeOverlayDescription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_didAcknowledgeSpatialModeOverlayDescription != a3)
  {
    v3 = a3;
    self->_didAcknowledgeSpatialModeOverlayDescription = a3;
    -[CAMUserPreferences _underlyingUserDefaults](self, "_underlyingUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CAMUserPreferenceDidAcknowledgeSpatialModeOverlayDescription"));

  }
}

+ (id)_convertDictionary:(id)a3 expectedKeyClass:(Class)a4 expectedValueClass:(Class)a5 keyConverter:(id)a6 valueConverter:(id)a7
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  Class v26;
  Class v27;

  v11 = a6;
  v12 = a7;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a3;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithCapacity:", objc_msgSend(v14, "count"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke;
  v22[3] = &unk_1EA32A158;
  v26 = a4;
  v27 = a5;
  v24 = v11;
  v25 = v12;
  v16 = v15;
  v23 = v16;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);

  v19 = v23;
  v20 = v16;

  return v20;
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);
      goto LABEL_19;
    }
    if (v7)
    {
      if (v8)
        goto LABEL_19;
      goto LABEL_9;
    }
  }
  else
  {
    if (v7)
    {
LABEL_9:
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_1();

      v9 = 0;
      goto LABEL_19;
    }
    v9 = 0;
  }
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_2();

LABEL_19:
}

+ (id)_createMappingFromStringsToIntegers:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3[2](v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

      v3[2](v3, ++v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (objc_msgSend(v5, "length"));
  }

  return v4;
}

+ (id)_persistenceDictionaryForPreferredDrawerControlByMode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(a1, "_convertDictionary:expectedKeyClass:expectedValueClass:keyConverter:valueConverter:", v4, v5, objc_opt_class(), &__block_literal_global_388, &__block_literal_global_389);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__CFString *__76__CAMUserPreferences__persistenceDictionaryForPreferredDrawerControlByMode___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 9)
    return 0;
  else
    return off_1EA32A340[v2];
}

__CFString *__76__CAMUserPreferences__persistenceDictionaryForPreferredDrawerControlByMode___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 0xF)
    return 0;
  else
    return off_1EA32A390[v2];
}

+ (id)_preferredDrawerControlByModeForPersistenceDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v9[4] = a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke;
  v10[3] = &__block_descriptor_40_e28___NSNumber_16__0__NSString_8l;
  v10[4] = a1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke_2;
  v9[3] = &__block_descriptor_40_e28___NSNumber_16__0__NSString_8l;
  objc_msgSend(a1, "_convertDictionary:expectedKeyClass:expectedValueClass:keyConverter:valueConverter:", v4, v5, v6, v10, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_captureModeNumberForPersistenceString:", a2);
}

uint64_t __76__CAMUserPreferences__preferredDrawerControlByModeForPersistenceDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawerControlTypeNumberForPersistenceString:", a2);
}

+ (id)_captureModeNumberForPersistenceString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = _captureModeNumberForPersistenceString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_captureModeNumberForPersistenceString__onceToken, block);
  objc_msgSend((id)_captureModeNumberForPersistenceString__stringToIntegerMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createMappingFromStringsToIntegers:", &__block_literal_global_393);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_captureModeNumberForPersistenceString__stringToIntegerMap;
  _captureModeNumberForPersistenceString__stringToIntegerMap = v1;

}

__CFString *__61__CAMUserPreferences__captureModeNumberForPersistenceString___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 > 9)
    return 0;
  else
    return off_1EA32A340[a2];
}

+ (id)_drawerControlTypeNumberForPersistenceString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = _drawerControlTypeNumberForPersistenceString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_drawerControlTypeNumberForPersistenceString__onceToken, block);
  objc_msgSend((id)_drawerControlTypeNumberForPersistenceString__stringToIntegerMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createMappingFromStringsToIntegers:", &__block_literal_global_394);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_drawerControlTypeNumberForPersistenceString__stringToIntegerMap;
  _drawerControlTypeNumberForPersistenceString__stringToIntegerMap = v1;

}

__CFString *__67__CAMUserPreferences__drawerControlTypeNumberForPersistenceString___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2 > 0xF)
    return 0;
  else
    return off_1EA32A390[a2];
}

- (BOOL)didResetTorchMode
{
  return self->_didResetTorchMode;
}

- (void)setShouldShowGridView:(BOOL)a3
{
  self->_shouldShowGridView = a3;
}

- (BOOL)shouldShowHorizonLevelView
{
  return self->_shouldShowHorizonLevelView;
}

- (BOOL)shouldShowLevelView
{
  return self->_shouldShowLevelView;
}

- (BOOL)isImageAnalysisEnabled
{
  return self->_imageAnalysisEnabled;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (BOOL)bypassWelcomeScreens
{
  return self->_bypassWelcomeScreens;
}

- (BOOL)shouldMirrorFrontCameraCaptures
{
  return self->_shouldMirrorFrontCameraCaptures;
}

- (void)setShouldMirrorFrontCameraCaptures:(BOOL)a3
{
  self->_shouldMirrorFrontCameraCaptures = a3;
}

- (BOOL)shouldUseVolumeUpBurst
{
  return self->_shouldUseVolumeUpBurst;
}

- (BOOL)shouldUseContentAwareDistortionCorrection
{
  return self->_shouldUseContentAwareDistortionCorrection;
}

- (BOOL)isSuperWideAutoMacroControlAllowed
{
  return self->_superWideAutoMacroControlAllowed;
}

- (int64_t)portraitModeRearDevice
{
  return self->_portraitModeRearDevice;
}

- (void)setPortraitModeRearDevice:(int64_t)a3
{
  self->_portraitModeRearDevice = a3;
}

- (double)portraitModeRearZoomValue
{
  return self->_portraitModeRearZoomValue;
}

- (void)setPortraitModeRearZoomValue:(double)a3
{
  self->_portraitModeRearZoomValue = a3;
}

- (BOOL)shouldUseDepthSuggestionInPhotoMode
{
  return self->_shouldUseDepthSuggestionInPhotoMode;
}

- (void)setShouldUseDepthSuggestionInPhotoMode:(BOOL)a3
{
  self->_shouldUseDepthSuggestionInPhotoMode = a3;
}

- (int64_t)slomoConfiguration
{
  return self->_slomoConfiguration;
}

- (int64_t)cinematicConfiguration
{
  return self->_cinematicConfiguration;
}

- (BOOL)didAcknowledgeCinematicModeDescription
{
  return self->_didAcknowledgeCinematicModeDescription;
}

- (BOOL)isVideoConfigurationControlEnabled
{
  return self->_videoConfigurationControlEnabled;
}

- (BOOL)isPALVideoEnabled
{
  return self->_PALVideoEnabled;
}

- (int64_t)VFRMode
{
  return self->_VFRMode;
}

- (BOOL)isLowLightVideoEnabled
{
  return self->_lowLightVideoEnabled;
}

- (unint64_t)preferredAudioConfiguration
{
  return self->_preferredAudioConfiguration;
}

- (BOOL)shouldMixAudioWithOthers
{
  return self->_shouldMixAudioWithOthers;
}

- (BOOL)shouldEnableWindRemoval
{
  return self->_shouldEnableWindRemoval;
}

- (BOOL)HDR10BitVideoEnabled
{
  return self->_HDR10BitVideoEnabled;
}

- (BOOL)shouldLockWhiteBalanceDuringVideoRecording
{
  return self->_shouldLockWhiteBalanceDuringVideoRecording;
}

- (BOOL)spatialVideoControlEnabled
{
  return self->_spatialVideoControlEnabled;
}

- (BOOL)spatialVideoEnabled
{
  return self->_spatialVideoEnabled;
}

- (BOOL)didAcknowledgeSpatialVideoOverlayDescription
{
  return self->_didAcknowledgeSpatialVideoOverlayDescription;
}

- (BOOL)spatialModeHasVideoSelected
{
  return self->_spatialModeHasVideoSelected;
}

- (BOOL)didAcknowledgeSpatialModeOverlayDescription
{
  return self->_didAcknowledgeSpatialModeOverlayDescription;
}

- (BOOL)didAcknowledgeCTMDescription
{
  return self->_didAcknowledgeCTMDescription;
}

- (BOOL)isOverCapturePreviewEnabled
{
  return self->_overCapturePreviewEnabled;
}

- (void)setSquareModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_squareModeLastCapturedEffectFilterType = a3;
}

- (void)setPortraitModeLastCapturedEffectFilterType:(int64_t)a3
{
  self->_portraitModeLastCapturedEffectFilterType = a3;
}

- (BOOL)semanticDevelopmentEnabled
{
  return self->_semanticDevelopmentEnabled;
}

- (BOOL)didAcknowledgeSemanticStylesDescription
{
  return self->_didAcknowledgeSemanticStylesDescription;
}

- (BOOL)didAcknowledgeSmartStylesDescription
{
  return self->_didAcknowledgeSmartStylesDescription;
}

- (CEKSmartStyle)lastReadSystemStyle
{
  return self->_lastReadSystemStyle;
}

- (void)_setLastReadSystemStyle:(id)a3
{
  objc_storeStrong((id *)&self->_lastReadSystemStyle, a3);
}

- (BOOL)photoFormatControlEnabled
{
  return self->_photoFormatControlEnabled;
}

- (BOOL)rawControlEnabled
{
  return self->_rawControlEnabled;
}

- (BOOL)preserveRAW
{
  return self->_preserveRAW;
}

- (BOOL)isProResControlEnabled
{
  return self->_proResControlEnabled;
}

- (BOOL)preserveProRes
{
  return self->_preserveProRes;
}

- (int64_t)explicitProResColorSpace
{
  return self->_explicitProResColorSpace;
}

- (BOOL)preserveSmartStyle
{
  return self->_preserveSmartStyle;
}

- (BOOL)preserveCaptureMode
{
  return self->_preserveCaptureMode;
}

- (BOOL)preserveLivePhoto
{
  return self->_preserveLivePhoto;
}

- (BOOL)preserveExposure
{
  return self->_preserveExposure;
}

- (BOOL)preserveNightMode
{
  return self->_preserveNightMode;
}

- (BOOL)preservePortraitZoom
{
  return self->_preservePortraitZoom;
}

- (BOOL)preserveSuperWideAutoMacro
{
  return self->_preserveSuperWideAutoMacro;
}

- (BOOL)enhancedVideoStabilization
{
  return self->_enhancedVideoStabilization;
}

- (BOOL)actionModeLowLightEnabled
{
  return self->_actionModeLowLightEnabled;
}

- (BOOL)preserveVideoStabilization
{
  return self->_preserveVideoStabilization;
}

- (BOOL)preservePhotoResolution
{
  return self->_preservePhotoResolution;
}

- (BOOL)preserveAperture
{
  return self->_preserveAperture;
}

- (BOOL)preserveSpatialVideoEnabled
{
  return self->_preserveSpatialVideoEnabled;
}

- (BOOL)burstFollowsEncoderSettings
{
  return self->_burstFollowsEncoderSettings;
}

- (int64_t)overriddenBackCaptureInterval
{
  return self->_overriddenBackCaptureInterval;
}

- (int64_t)overriddenFrontCaptureInterval
{
  return self->_overriddenFrontCaptureInterval;
}

- (BOOL)sharedLibraryEnabled
{
  return self->_sharedLibraryEnabled;
}

- (void)setSharedLibraryEnabled:(BOOL)a3
{
  self->_sharedLibraryEnabled = a3;
}

- (BOOL)sharedLibraryAutoBehaviorEnabled
{
  return self->_sharedLibraryAutoBehaviorEnabled;
}

- (void)setSharedLibraryAutoBehaviorEnabled:(BOOL)a3
{
  self->_sharedLibraryAutoBehaviorEnabled = a3;
}

- (BOOL)sharedLibrarySwitchEnabled
{
  return self->_sharedLibrarySwitchEnabled;
}

- (void)setSharedLibrarySwitchEnabled:(BOOL)a3
{
  self->_sharedLibrarySwitchEnabled = a3;
}

- (BOOL)defaultToSharedLibraryEnabled
{
  return self->_defaultToSharedLibraryEnabled;
}

- (void)setDefaultToSharedLibraryEnabled:(BOOL)a3
{
  self->_defaultToSharedLibraryEnabled = a3;
}

- (BOOL)shareWhenAtHomeEnabled
{
  return self->_shareWhenAtHomeEnabled;
}

- (void)setShareWhenAtHomeEnabled:(BOOL)a3
{
  self->_shareWhenAtHomeEnabled = a3;
}

- (CLLocation)sharedLibraryLastLocation
{
  return self->_sharedLibraryLastLocation;
}

- (void)setSharedLibraryLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryLastLocation, a3);
}

- (BOOL)sharedLibraryLastLocationAcquiredDuringTrip
{
  return self->_sharedLibraryLastLocationAcquiredDuringTrip;
}

- (void)setSharedLibraryLastLocationAcquiredDuringTrip:(BOOL)a3
{
  self->_sharedLibraryLastLocationAcquiredDuringTrip = a3;
}

- (NSDate)sharedLibraryLastDiscoveryDate
{
  return self->_sharedLibraryLastDiscoveryDate;
}

- (void)setSharedLibraryLastDiscoveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryDate, a3);
}

- (CLLocation)sharedLibraryLastDiscoveryLocation
{
  return self->_sharedLibraryLastDiscoveryLocation;
}

- (void)setSharedLibraryLastDiscoveryLocation:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryLocation, a3);
}

- (NSDate)sharedLibraryLastUserActionDate
{
  return self->_sharedLibraryLastUserActionDate;
}

- (void)setSharedLibraryLastUserActionDate:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionDate, a3);
}

- (CLLocation)sharedLibraryLastUserActionLocation
{
  return self->_sharedLibraryLastUserActionLocation;
}

- (void)setSharedLibraryLastUserActionLocation:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionLocation, a3);
}

- (int64_t)maximumRAWPhotoResolution
{
  return self->_maximumRAWPhotoResolution;
}

- (NSArray)customLensGroup
{
  return self->_customLensGroup;
}

- (int64_t)defaultCustomLens
{
  return self->_defaultCustomLens;
}

- (BOOL)isZoomPIPEnabled
{
  return self->_zoomPIPEnabled;
}

- (NSSet)openHalfPressSpotlightControls
{
  return self->_openHalfPressSpotlightControls;
}

- (void)setOpenHalfPressSpotlightControls:(id)a3
{
  objc_storeStrong((id *)&self->_openHalfPressSpotlightControls, a3);
}

- (BOOL)didAcknowledgeDepthInPhotoModeDescription
{
  return self->_didAcknowledgeDepthInPhotoModeDescription;
}

- (NSDictionary)preferredDrawerControlByMode
{
  return self->_preferredDrawerControlByMode;
}

- (void)setPreferredDrawerControlByMode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDrawerControlByMode, a3);
}

- (BOOL)preservePreferredDrawerControl
{
  return self->_preservePreferredDrawerControl;
}

- (BOOL)_hasReadLastWrittenValues
{
  return self->__hasReadLastWrittenValues;
}

- (void)_setHasReadLastWrittenValues:(BOOL)a3
{
  self->__hasReadLastWrittenValues = a3;
}

- (BOOL)_preferHEVCWhenAvailable
{
  return self->__preferHEVCWhenAvailable;
}

- (int64_t)_backPreferredHEICPhotoResolution
{
  return self->__backPreferredHEICPhotoResolution;
}

- (int64_t)_frontPreferredHEICPhotoResolution
{
  return self->__frontPreferredHEICPhotoResolution;
}

- (BOOL)_shouldDisableCameraSwitchingDuringVideoRecording
{
  return self->__shouldDisableCameraSwitchingDuringVideoRecording;
}

- (int64_t)_previewAspectModeForPhotoModes
{
  return self->__previewAspectModeForPhotoModes;
}

- (void)_setPreviewAspectModeForPhotoModes:(int64_t)a3
{
  self->__previewAspectModeForPhotoModes = a3;
}

- (int64_t)_previewAspectModeForVideoModes
{
  return self->__previewAspectModeForVideoModes;
}

- (void)_setPreviewAspectModeForVideoModes:(int64_t)a3
{
  self->__previewAspectModeForVideoModes = a3;
}

- (NSDate)_lastViewedSettingsInterfaceDate
{
  return self->__lastViewedSettingsInterfaceDate;
}

- (NSDate)_lastWrittenSettingsDate
{
  return self->__lastWrittenSettingsDate;
}

- (void)_setLastWrittenSettingsDate:(id)a3
{
  self->__lastWrittenSettingsDate = (NSDate *)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormatControlSecondaryFormat
{
  int64_t resolution;
  int64_t encoding;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  resolution = self->_photoFormatControlSecondaryFormat.resolution;
  encoding = self->_photoFormatControlSecondaryFormat.encoding;
  result.var1 = resolution;
  result.var0 = encoding;
  return result;
}

- (int64_t)rawFileFormatBehavior
{
  return self->_rawFileFormatBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__underlyingUserDefaults, 0);
  objc_storeStrong((id *)&self->_preferredDrawerControlByMode, 0);
  objc_storeStrong((id *)&self->_openHalfPressSpotlightControls, 0);
  objc_storeStrong((id *)&self->_customLensGroup, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionLocation, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastUserActionDate, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryLocation, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_sharedLibraryLastLocation, 0);
  objc_storeStrong((id *)&self->_resetTimeoutDate, 0);
  objc_storeStrong((id *)&self->_lastReadSystemStyle, 0);
  objc_storeStrong((id *)&self->_conflictingControlConfiguration, 0);
  objc_storeStrong((id *)&self->_captureConfiguration, 0);
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to read system style override reference: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to read system style override: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to read photographic style: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)readPreferencesWithOverrides:(os_log_t)log emulationMode:callActive:shouldResetCaptureConfiguration:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Failed to read photographic style from non-dictionary data", v1, 2u);
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to convert value %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __105__CAMUserPreferences__convertDictionary_expectedKeyClass_expectedValueClass_keyConverter_valueConverter___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to convert key %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
