@implementation LPSettings

+ (void)updateFromDefaults
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  showDebugIndicators = objc_msgSend(v2, "BOOLForKey:", CFSTR("LPShowDebugIndicators"));
  disableLegacyStoreLookups = objc_msgSend(v2, "BOOLForKey:", CFSTR("LPDisableLegacyStoreLookups"));
  disableAutoPlay = UIAccessibilityIsReduceMotionEnabled();
  disableAnimations = disableAutoPlay;
  if ((updateFromDefaults_hasEverUpdated & 1) != 0)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC45B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__LPSettings_updateFromDefaults__block_invoke_2;
  v7[3] = &unk_1E44A8518;
  v8 = &__block_literal_global_7;
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v7);

  if (updateFromDefaults_hasEverUpdated == 1)
LABEL_3:
    +[LPTheme invalidateThemeCache](LPTheme, "invalidateThemeCache");
  updateFromDefaults_hasEverUpdated = 1;

}

BOOL __32__LPSettings_updateFromDefaults__block_invoke()
{
  _BOOL8 result;

  result = UIAccessibilityIsReduceMotionEnabled();
  disableAutoPlay = result;
  disableAnimations = result;
  return result;
}

uint64_t __32__LPSettings_updateFromDefaults__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)showDebugIndicators
{
  return showDebugIndicators;
}

+ (BOOL)disableLegacyStoreLookups
{
  return disableLegacyStoreLookups;
}

+ (BOOL)disableAutoPlay
{
  return disableAutoPlay;
}

+ (BOOL)disableAnimations
{
  return disableAnimations;
}

+ (BOOL)subsampleImagesToScreenSize
{
  void *v2;
  void *v3;
  char v4;

  +[LPTestingOverrides forceSubsampleImagesToScreenSize](LPTestingOverrides, "forceSubsampleImagesToScreenSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  +[LPTestingOverrides forceSubsampleImagesToScreenSize](LPTestingOverrides, "forceSubsampleImagesToScreenSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)useLightweightMaterials
{
  if (useLightweightMaterials_onceToken != -1)
    dispatch_once(&useLightweightMaterials_onceToken, &__block_literal_global_9_0);
  return useLightweightMaterials_lightweightMaterialsEnabled;
}

void __37__LPSettings_useLightweightMaterials__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v0);

  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  useLightweightMaterials_lightweightMaterialsEnabled = objc_msgSend(v1, "backgroundColor") == 0;

}

@end
