@implementation CSMobileAssetVersions

+ (id)getVoiceTriggerAssetTypeStringWithSupportMphAssets:(BOOL)a3 deviceIsIPad:(BOOL)a4 deviceIsWatch:(BOOL)a5 deviceIsHorseman:(BOOL)a6 deviceIsOSX:(BOOL)a7 deviceIsASMac:(BOOL)a8 deviceIsTV:(BOOL)a9 deviceIsIOS:(BOOL)a10
{
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v13;
  const __CFString *v14;

  if (a4)
  {
    v10 = CFSTR("com.apple.MobileAsset.VoiceTriggerHSAssetsIPad");
    v11 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsIPad");
    goto LABEL_5;
  }
  if (a5)
  {
    v10 = CFSTR("com.apple.MobileAsset.VoiceTriggerHSAssetsWatch");
    v11 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsWatch");
LABEL_5:
    if (a3)
      return (id)v11;
    else
      return (id)v10;
  }
  v13 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsASMac");
  if (a6)
    v13 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsMarsh");
  if (!a10 || a3)
    v14 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssets");
  else
    v14 = CFSTR("com.apple.MobileAsset.VoiceTriggerHSAssets");
  if (a9)
    v14 = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsTV");
  if (a7)
    v14 = v13;
  if (a6)
    return (id)v13;
  else
    return (id)v14;
}

+ (unint64_t)getVoiceTriggerCurrentCompatibilityVersionWithSupportMphAssets:(BOOL)a3 deviceIsIPad:(BOOL)a4 deviceIsWatch:(BOOL)a5 deviceIsHorseman:(BOOL)a6 deviceIsOSX:(BOOL)a7 deviceIsASMac:(BOOL)a8 deviceIsTV:(BOOL)a9 deviceIsIOS:(BOOL)a10
{
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  if (a4)
    return 19;
  v11 = 19;
  v12 = 16;
  if (!a9)
    v12 = 19;
  if (a7)
    v12 = 15;
  if (!a6)
    v11 = v12;
  v13 = 13;
  if (a3)
    v13 = 14;
  if (a5)
    return v13;
  else
    return v11;
}

+ (id)getVoiceTriggerAssetTypeString
{
  _BOOL8 v2;
  int v3;
  uint64_t v5;

  v2 = +[CSUtils supportMphAssets](CSUtils, "supportMphAssets");
  if (CSIsIPad_onceToken != -1)
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
  v3 = CSIsIPad_isIPad;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  LOWORD(v5) = 256;
  return +[CSMobileAssetVersions getVoiceTriggerAssetTypeStringWithSupportMphAssets:deviceIsIPad:deviceIsWatch:deviceIsHorseman:deviceIsOSX:deviceIsASMac:deviceIsTV:deviceIsIOS:](CSMobileAssetVersions, "getVoiceTriggerAssetTypeStringWithSupportMphAssets:deviceIsIPad:deviceIsWatch:deviceIsHorseman:deviceIsOSX:deviceIsASMac:deviceIsTV:deviceIsIOS:", v2, v3 != 0, 0, CSIsHorseman_isHorseman, 0, 0, v5);
}

+ (unint64_t)getVoiceTriggerCurrentCompatibilityVersion
{
  _BOOL8 v2;
  int v3;
  uint64_t v5;

  v2 = +[CSUtils supportMphAssets](CSUtils, "supportMphAssets");
  if (CSIsIPad_onceToken != -1)
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
  v3 = CSIsIPad_isIPad;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  LOWORD(v5) = 256;
  return +[CSMobileAssetVersions getVoiceTriggerCurrentCompatibilityVersionWithSupportMphAssets:deviceIsIPad:deviceIsWatch:deviceIsHorseman:deviceIsOSX:deviceIsASMac:deviceIsTV:deviceIsIOS:](CSMobileAssetVersions, "getVoiceTriggerCurrentCompatibilityVersionWithSupportMphAssets:deviceIsIPad:deviceIsWatch:deviceIsHorseman:deviceIsOSX:deviceIsASMac:deviceIsTV:deviceIsIOS:", v2, v3 != 0, 0, CSIsHorseman_isHorseman, 0, 0, v5);
}

@end
