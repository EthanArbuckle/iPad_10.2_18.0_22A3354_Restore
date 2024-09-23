@implementation AXCapabilityManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_12);
  return (id)sharedManager_SharedManager_0;
}

void __36__AXCapabilityManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_SharedManager_0;
  sharedManager_SharedManager_0 = v0;

}

- (BOOL)isAccessibilityCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXCapabilityManager capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)capabilities
{
  if (capabilities_onceToken != -1)
    dispatch_once(&capabilities_onceToken, &__block_literal_global_176);
  return (id)capabilities_Available;
}

void __35__AXCapabilityManager_capabilities__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[99];
  _QWORD v3[100];

  v3[99] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AXHapticMusic");
  v2[1] = CFSTR("VoiceOverRecognition");
  v3[0] = &__block_literal_global_180;
  v3[1] = &__block_literal_global_183;
  v2[2] = CFSTR("LiveTranscription");
  v2[3] = CFSTR("LiveTranscriptionInFaceTime");
  v3[2] = &__block_literal_global_187;
  v3[3] = &__block_literal_global_190;
  v2[4] = CFSTR("AXMotionCues");
  v2[5] = CFSTR("TapTouchToWake");
  v3[4] = &__block_literal_global_193;
  v3[5] = &__block_literal_global_196;
  v2[6] = CFSTR("TapToWake");
  v2[7] = CFSTR("AXSideButton");
  v3[6] = &__block_literal_global_201;
  v3[7] = &__block_literal_global_206;
  v2[8] = CFSTR("AXTopButton");
  v2[9] = CFSTR("AXHomeButton");
  v3[8] = &__block_literal_global_209;
  v3[9] = &__block_literal_global_212;
  v2[10] = CFSTR("AXTopTouchIDButton");
  v2[11] = CFSTR("HoverText");
  v3[10] = &__block_literal_global_215;
  v3[11] = &__block_literal_global_218;
  v2[12] = CFSTR("HoverTextTyping");
  v2[13] = CFSTR("AXReduceTransparency");
  v3[12] = &__block_literal_global_221;
  v3[13] = &__block_literal_global_224;
  v2[14] = CFSTR("AXSiri");
  v2[15] = CFSTR("AXWatchRemoteScreen");
  v3[14] = &__block_literal_global_227;
  v3[15] = &__block_literal_global_232_0;
  v2[16] = CFSTR("AXStartupSound");
  v2[17] = CFSTR("AXHeadphoneNotifications");
  v3[16] = &__block_literal_global_235;
  v3[17] = &__block_literal_global_238;
  v2[18] = CFSTR("AXTTYRTTCapability");
  v2[19] = CFSTR("AXRTT_TTYTextingTypeCapability");
  v3[18] = &__block_literal_global_241;
  v3[19] = &__block_literal_global_244;
  v2[20] = CFSTR("AXRTTTextingTypeCapability");
  v2[21] = CFSTR("AXTTYTextingTypeCapability");
  v3[20] = &__block_literal_global_247_0;
  v3[21] = &__block_literal_global_250;
  v2[22] = CFSTR("NearbyControlCapability");
  v2[23] = CFSTR("AXCameraFlashCapability");
  v3[22] = &__block_literal_global_253;
  v3[23] = &__block_literal_global_256;
  v2[24] = CFSTR("AXProximitySensor");
  v2[25] = CFSTR("GuidedAccessEnabled");
  v3[24] = &__block_literal_global_261;
  v3[25] = &__block_literal_global_266;
  v2[26] = CFSTR("KeyRepeatEnabled");
  v2[27] = CFSTR("LimitFrameRate");
  v3[26] = &__block_literal_global_269;
  v3[27] = &__block_literal_global_272;
  v2[28] = CFSTR("Vibration");
  v2[29] = CFSTR("Reachability");
  v3[28] = &__block_literal_global_277;
  v3[29] = &__block_literal_global_280;
  v2[30] = CFSTR("SpeakScreenEnabled");
  v2[31] = CFSTR("SpeakSelectionEnabled");
  v3[30] = &__block_literal_global_283;
  v3[31] = &__block_literal_global_286;
  v2[32] = CFSTR("HighlightContentEnabled");
  v2[33] = CFSTR("ExtendedVoiceIsolation");
  v3[32] = &__block_literal_global_289;
  v3[33] = &__block_literal_global_292;
  v2[34] = CFSTR("PSECapability");
  v2[35] = CFSTR("AXForceTouch");
  v3[34] = &__block_literal_global_297;
  v3[35] = &__block_literal_global_300;
  v2[36] = CFSTR("AXNoForceTouch");
  v2[37] = CFSTR("AXAdaptiveVoiceShortcuts");
  v3[36] = &__block_literal_global_303;
  v3[37] = &__block_literal_global_306;
  v2[38] = CFSTR("AXOnDeviceEyeTracking");
  v2[39] = CFSTR("AXLiveSpeech");
  v3[38] = &__block_literal_global_309;
  v3[39] = &__block_literal_global_312;
  v2[40] = CFSTR("BackTap");
  v2[41] = CFSTR("AXLiveSpeechCategories");
  v3[40] = &__block_literal_global_315;
  v3[41] = &__block_literal_global_318;
  v2[42] = CFSTR("AXLiveSpeechCategory");
  v2[43] = CFSTR("AXOnboardingVoiceOver");
  v3[42] = &__block_literal_global_321;
  v3[43] = &__block_literal_global_324;
  v2[44] = CFSTR("ConfirmWith");
  v2[45] = CFSTR("AXHaptics");
  v3[44] = &__block_literal_global_327;
  v3[45] = &__block_literal_global_330;
  v2[46] = CFSTR("AXNoHaptics");
  v2[47] = CFSTR("AXVoiceBanking");
  v3[46] = &__block_literal_global_333;
  v3[47] = &__block_literal_global_336;
  v2[48] = CFSTR("AXIndependentDwellControl");
  v2[49] = CFSTR("AXPointerControlIncreaseContrast");
  v3[48] = &__block_literal_global_339;
  v3[49] = &__block_literal_global_342;
  v2[50] = CFSTR("AXPointerControlAutoHide");
  v2[51] = CFSTR("AXPointerControlColor");
  v3[50] = &__block_literal_global_345;
  v3[51] = &__block_literal_global_348;
  v2[52] = CFSTR("AXPointerControlSize");
  v2[53] = CFSTR("AXUpwardsHUDControlPosition");
  v3[52] = &__block_literal_global_351_0;
  v3[53] = &__block_literal_global_354;
  v2[54] = CFSTR("AXUpwardsHUDToggle");
  v2[55] = CFSTR("AXAutoBrightness");
  v3[54] = &__block_literal_global_357_0;
  v3[55] = &__block_literal_global_360;
  v2[56] = CFSTR("AXAssistiveTouchBasedDwellControl");
  v2[57] = CFSTR("AXTouchAccommodations");
  v3[56] = &__block_literal_global_363;
  v3[57] = &__block_literal_global_366;
  v2[58] = CFSTR("AXHomeButtonIsDigitalCrown");
  v2[59] = CFSTR("AXHomeButtonIsNotDigitalCrown");
  v3[58] = &__block_literal_global_369;
  v3[59] = &__block_literal_global_372;
  v2[60] = CFSTR("AXAutoEnableSubtitles");
  v2[61] = CFSTR("AXLockScreenNotifications");
  v3[60] = &__block_literal_global_375;
  v3[61] = &__block_literal_global_378;
  v2[62] = CFSTR("AXRingerSwitch");
  v2[63] = CFSTR("AXHandwriting");
  v3[62] = &__block_literal_global_381;
  v3[63] = &__block_literal_global_384;
  v2[64] = CFSTR("AXBrailleScreenInput");
  v3[64] = &__block_literal_global_387;
  v2[65] = CFSTR("AXDirectTouchApps");
  v3[65] = &__block_literal_global_390;
  v2[66] = CFSTR("AXZoomController");
  v3[66] = &__block_literal_global_393;
  v2[67] = CFSTR("AXZoomFilter");
  v3[67] = &__block_literal_global_396;
  v2[68] = CFSTR("AXZoomShowWhileMirroring");
  v3[68] = &__block_literal_global_399;
  v2[69] = CFSTR("AXCallAudioRouting");
  v3[69] = &__block_literal_global_402;
  v2[70] = CFSTR("AXTrackpadZoom");
  v3[70] = &__block_literal_global_405;
  v2[71] = CFSTR("AXHearingControlCenter");
  v3[71] = &__block_literal_global_408;
  v2[72] = CFSTR("AXAppleTVRemote");
  v3[72] = &__block_literal_global_411;
  v2[73] = CFSTR("AXVirtualTrackpad");
  v3[73] = &__block_literal_global_414;
  v2[74] = CFSTR("AXVoiceOverDelayUntilSpeak");
  v3[74] = &__block_literal_global_417;
  v2[75] = CFSTR("AXAirPodPaired");
  v3[75] = &__block_literal_global_420;
  v2[76] = CFSTR("AXRealWorldDetection");
  v3[76] = &__block_literal_global_424;
  v2[77] = CFSTR("AXSiriAtypicalSpeech");
  v3[77] = &__block_literal_global_427;
  v2[78] = CFSTR("AXClarityUI");
  v3[78] = &__block_literal_global_436;
  v2[79] = CFSTR("AXResizeZoomWindow");
  v3[79] = &__block_literal_global_439;
  v2[80] = CFSTR("AXZoomWithScrollWheel");
  v3[80] = &__block_literal_global_443;
  v2[81] = CFSTR("AXZoomVisionOS");
  v3[81] = &__block_literal_global_447;
  v2[82] = CFSTR("AXPlatformUsesInteractionTerm");
  v3[82] = &__block_literal_global_450;
  v2[83] = CFSTR("AXPlatformUsesTouchTerm");
  v3[83] = &__block_literal_global_453;
  v2[84] = CFSTR("AXSoundEffects");
  v3[84] = &__block_literal_global_456;
  v2[85] = CFSTR("AXSpatializeSpeech");
  v3[85] = &__block_literal_global_459;
  v2[86] = CFSTR("AXPlatformUsesHandTrackingForVoiceOver");
  v3[86] = &__block_literal_global_462;
  v2[87] = CFSTR("AXIgnoreEyeMovement");
  v3[87] = &__block_literal_global_465;
  v2[88] = CFSTR("AXAlignDisplaysAutomatically");
  v3[88] = &__block_literal_global_468;
  v2[89] = CFSTR("AXIncreaseFocusState");
  v3[89] = &__block_literal_global_471;
  v2[90] = CFSTR("AXVideoPassthrough");
  v3[90] = &__block_literal_global_474;
  v2[91] = CFSTR("AXSystemSoundActions");
  v3[91] = &__block_literal_global_477;
  v2[92] = CFSTR("AXASTSoundActions");
  v3[92] = &__block_literal_global_480;
  v2[93] = CFSTR("AXPlatformUsesHandTrackingForDwell");
  v3[93] = &__block_literal_global_483;
  v2[94] = CFSTR("AXPointerControl");
  v3[94] = &__block_literal_global_486;
  v2[95] = CFSTR("AXPlatformUsesHeadMovement");
  v3[95] = &__block_literal_global_489;
  v2[96] = CFSTR("AXFaceID");
  v3[96] = &__block_literal_global_492;
  v2[97] = CFSTR("AXASTExtendedPredictions");
  v3[97] = &__block_literal_global_495;
  v2[98] = CFSTR("AXSiriBargeIn");
  v3[98] = &__block_literal_global_498;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 99);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)capabilities_Available;
  capabilities_Available = v0;

}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v0, "physicalMemory") > 0x773593FF && (AXRuntimeCheck_HasANE() & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "physicalMemory") <= 0x773593FF)
      v1 = 0;
    else
      v1 = AXRuntimeCheck_HasANE();

  }
  return v1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_5()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v0 = (void *)getAVCCaptionsClientClass_softClass;
  v19 = getAVCCaptionsClientClass_softClass;
  if (!getAVCCaptionsClientClass_softClass)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __getAVCCaptionsClientClass_block_invoke;
    v14 = &unk_1E24C4AE0;
    v15 = &v16;
    __getAVCCaptionsClientClass_block_invoke((uint64_t)&v11);
    v0 = (void *)v17[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v16, 8);
  if (!objc_msgSend(v1, "isCaptioningSupported"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E24F8D20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v4 = (void *)getUITextInputModeClass_softClass;
  v19 = getUITextInputModeClass_softClass;
  if (!getUITextInputModeClass_softClass)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __getUITextInputModeClass_block_invoke;
    v14 = &unk_1E24C4AE0;
    v15 = &v16;
    __getUITextInputModeClass_block_invoke((uint64_t)&v11);
    v4 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v5, "activeInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_508);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "intersectsSet:", v2);
  return v9;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_7()
{
  return MGGetBoolAnswer();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_8()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    return MGGetBoolAnswer() ^ 1;
  return result;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_16()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "assistantIsEnabled");

  v2 = (void *)MEMORY[0x1E0CFE858];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "assistantIsSupportedForLanguageCode:error:", v4, 0);

  return v1 & v2;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_20()
{
  return objc_msgSend(getRTTTelephonyUtilitiesClass(), "currentSupportedTextingType") != 4;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_21()
{
  return objc_msgSend(getRTTTelephonyUtilitiesClass(), "currentSupportedTextingType") == 3;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_22()
{
  return objc_msgSend(getRTTTelephonyUtilitiesClass(), "currentSupportedTextingType") == 1;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_23()
{
  return objc_msgSend(getRTTTelephonyUtilitiesClass(), "currentSupportedTextingType") == 2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_25()
{
  return MGGetBoolAnswer();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_26()
{
  return MGGetBoolAnswer();
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_27()
{
  return _AXSGuidedAccessEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_28()
{
  return _AXSKeyRepeatEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_29()
{
  return MGGetBoolAnswer();
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_32()
{
  return _AXSSpeakThisEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_33()
{
  return _AXSQuickSpeakEnabled() != 0;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_34()
{
  return _AXSQuickSpeakHighlightTextEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_35()
{
  return _os_feature_enabled_impl();
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_38()
{
  return AXForceTouchAvailableAndEnabled() ^ 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_48()
{
  return AXDeviceSupportsHaptics() ^ 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_50()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_51()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_52()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_53()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_54()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_55()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_56()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_57()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_58()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_59()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_60()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_61()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_62()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_63()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_64()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_65()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_66()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_67()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_68()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_69()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_70()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_71()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_72()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_73()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_74()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_76()
{
  return 1;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_77()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  +[AXAirPodSettingsManager sharedInstance](AXAirPodSettingsManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pairedAirPods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_79()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  if (!AXHasCapability(CFSTR("AXSiri")) || !_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("en-US")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "isEqualToString:", CFSTR("en-CA"));

  }
  return v2;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_80()
{
  return _AXSClarityUIEnabled() != 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_81()
{
  void *v0;
  void *v1;
  uint64_t v2;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "zoomPreferredCurrentLensMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38A0]) ^ 1;

  return v2;
}

BOOL __35__AXCapabilityManager_capabilities__block_invoke_82()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  +[AXPointerDeviceManager sharedInstance](AXPointerDeviceManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connectedDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_83()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_84()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_85()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_86()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_87()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_88()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_89()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_90()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_91()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_92()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_93()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_94()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_95()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_96()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_97()
{
  return 0;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_99()
{
  return 1;
}

uint64_t __35__AXCapabilityManager_capabilities__block_invoke_100()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (!AXHasCapability(CFSTR("AXSiri")))
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getCSPreferencesClass_softClass;
  v9 = getCSPreferencesClass_softClass;
  if (!getCSPreferencesClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCSPreferencesClass_block_invoke;
    v5[3] = &unk_1E24C4AE0;
    v5[4] = &v6;
    __getCSPreferencesClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFlexibleFollowupsSupported");

  return v3;
}

- (BOOL)isCapabilityAvailable:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD);
  char v7;

  v4 = a3;
  -[AXCapabilityManager capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6[2](v6);
  else
    v7 = 0;

  return v7;
}

@end
