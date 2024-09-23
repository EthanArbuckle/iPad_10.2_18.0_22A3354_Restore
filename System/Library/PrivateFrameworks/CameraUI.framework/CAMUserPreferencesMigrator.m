@implementation CAMUserPreferencesMigrator

+ (void)migrateLegacyPreferences
{
  void *v3;
  void *v4;
  int AppBooleanValue;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  Boolean v22;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("CameraConfiguration"), CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("HDRKeepOriginalPhoto"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    objc_msgSend(v4, "setBool:forKey:", AppBooleanValue != 0, CFSTR("CAMUserPreferenceHDREV0"));
  v22 = 0;
  v6 = CFPreferencesGetAppBooleanValue(CFSTR("CAMUse60FPSVideo"), CFSTR("com.apple.mobileslideshow"), &v22);
  if (v22)
    objc_msgSend(v4, "setInteger:forKey:", v6 != 0, *MEMORY[0x1E0D75080]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EnableGridLines"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v7, "BOOLValue"), CFSTR("CAMUserPreferenceShowGridOverlay"));
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5890]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_flashModeForLegacyFlashMode:", objc_msgSend(v9, "integerValue")), CFSTR("CAMUserPreferenceDesiredFlashMode"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VideoFlashMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_flashModeForLegacyFlashMode:", objc_msgSend(v11, "integerValue")), CFSTR("CAMUserPreferenceTorchMode"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HDRMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_HDRModeForLegacyHDRMode:", objc_msgSend(v13, "integerValue")), CFSTR("CAMUserPreferenceDesiredHDRMode"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UserChangedHDRAfterFlash"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "BOOLValue"))
      v17 = 2;
    else
      v17 = 1;
    objc_msgSend(v4, "setInteger:forKey:", v17, CFSTR("CAMUserPreferenceFlashAndHDRConflictingControl"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5880]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_captureModeForLegacyCameraMode:", objc_msgSend(v18, "integerValue")), CFSTR("CAMUserPreferenceCaptureMode"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PreviewZoomMode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(a1, "_previewViewAspectModeForLegacyAspectMode:", objc_msgSend(v20, "integerValue")), CFSTR("CAMUserPreferencePreviewViewAspectMode"));
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("CAMUserPreferenceDidMigrate"));
  objc_msgSend(v4, "synchronize");

}

+ (int64_t)_flashModeForLegacyFlashMode:(int64_t)a3
{
  if (a3)
    return a3 == 1;
  else
    return 2;
}

+ (int64_t)_captureModeForLegacyCameraMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_1DB9A78D0[a3 - 1];
}

+ (int64_t)_HDRModeForLegacyHDRMode:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (int64_t)_previewViewAspectModeForLegacyAspectMode:(int64_t)a3
{
  return a3 == 1;
}

@end
