@implementation AXTripleClickHelpers

+ (id)tripleClickOptionDidChangeNotification
{
  return CFSTR("AXTripleClickOptionDidChangeNotification");
}

+ (id)localizationKeyForTripleClickOption:(int)a3
{
  __CFString *v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = 0;
  switch(a3)
  {
    case 1:
      return CFSTR("ask.sheet.option.VoiceOver.on");
    case 2:
      return CFSTR("ask.sheet.option.WhiteOnBlack.on");
    case 4:
      return CFSTR("ask.sheet.option.Zoom.on");
    case 6:
      return CFSTR("ask.sheet.option.AssistiveTouch.on");
    case 7:
      return CFSTR("ask.sheet.option.GuidedAccess.on");
    case 8:
      return CFSTR("ask.sheet.option.HearingAidControl.on");
    case 9:
      return CFSTR("ask.sheet.option.SwitchOver.on");
    case 10:
      +[AXBackBoardServer server](AXBackBoardServer, "server");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "supportsAccessibilityDisplayFilters");

      if (v6)
        return CFSTR("ask.sheet.option.DisplayFiltersColor.on");
      else
        return CFSTR("ask.sheet.option.grayscale.on");
    case 11:
      return CFSTR("ask.sheet.option.touch.accommodations");
    case 12:
      return CFSTR("ask.sheet.option.magnifier.on");
    case 13:
      return CFSTR("Loc Caption Panel");
    case 14:
      return CFSTR("ask.sheet.option.reduce.white.point.on");
    case 15:
      return CFSTR("ask.sheet.option.temporarily.undo.double.invert");
    case 16:
      return CFSTR("AX Development Tools");
    case 17:
      return CFSTR("ask.sheet.option.command.and.control.on");
    case 18:
      return CFSTR("ask.sheet.option.full.keyboard.access.on");
    case 20:
      return CFSTR("ask.sheet.option.reduce.transparency");
    case 21:
      return CFSTR("ask.sheet.option.increase.contrast");
    case 22:
      return CFSTR("ask.sheet.option.detection.mode");
    case 23:
      return CFSTR("ask.sheet.option.watch.control.on");
    case 24:
      return CFSTR("ask.sheet.option.reduce.motion");
    case 25:
      return CFSTR("ask.sheet.option.background.sounds");
    case 26:
      return CFSTR("ask.sheet.option.left.right.balance");
    case 27:
      return CFSTR("ask.sheet.option.HoverText.on");
    case 28:
      return CFSTR("ask.sheet.option.remote.screen");
    case 29:
      return CFSTR("ask.sheet.option.live.transcription");
    case 30:
      return CFSTR("ask.sheet.option.custom.accessibility.mode");
    case 31:
      return CFSTR("ask.sheet.option.nearby.device.control");
    case 33:
      return CFSTR("ask.sheet.option.live.speech");
    case 34:
      return CFSTR("ask.sheet.option.speak.screen");
    case 35:
      return CFSTR("ask.sheet.option.dim.flashing.lights");
    case 36:
      return CFSTR("ask.sheet.option.motion.cues");
    case 38:
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v7 = getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr;
      v12 = getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr;
      if (!getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr)
      {
        v8 = (void *)AccessibilityUIUtilitiesLibrary();
        v7 = dlsym(v8, "AXUILocalizedStringForKeyWithTable");
        v10[3] = (uint64_t)v7;
        getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr = v7;
      }
      _Block_object_dispose(&v9, 8);
      if (!v7)
        +[AXTripleClickHelpers localizationKeyForTripleClickOption:].cold.1();
      ((void (*)(const __CFString *, const __CFString *))v7)(CFSTR("HAPTIC_MUSIC_TITLE"), CFSTR("Accessibility-HapticMusic"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 39:
      return CFSTR("ask.sheet.option.conversation.boost");
    case 40:
      return CFSTR("ask.sheet.option.hovertext.typing");
    case 41:
      return CFSTR("ask.sheet.option.minimum.brightness");
    case 42:
      v3 = CFSTR("ask.sheet.option.EyeTracking.on");
      return v3;
    default:
      return v3;
  }
}

+ (id)symbolNameForTripleClickOption:(int)a3
{
  if ((a3 - 1) > 0x29)
    return 0;
  else
    return off_1E24C4DA8[a3 - 1];
}

+ (id)titleForTripleClickOption:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString **v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  if (AXProcessIsBackboard())
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (__CFString *)v7;

  }
  else
  {
    v8 = 0;
    switch((int)v3)
    {
      case 1:
      case 2:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 17:
      case 18:
      case 20:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 29:
      case 30:
      case 31:
      case 33:
      case 34:
      case 35:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
        objc_msgSend(a1, "localizationKeyForTripleClickOption:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        AXParameterizedLocalizedString(1, v6, v9, v10, v11, v12, v13, v14, v17);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      case 13:
        v8 = CFSTR("Loc Caption Panel");
        return v8;
      case 16:
        v8 = CFSTR("AX Development Tools");
        return v8;
      case 22:
        v16 = AXAssistiveTouchIconTypeDetectionMode;
        goto LABEL_11;
      case 28:
        v16 = AXAssistiveTouchIconTypeWatchRemoteScreen;
LABEL_11:
        soft_AXUIAssistiveTouchStringForName(*v16);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        return v8;
    }
  }
  return v8;
}

+ (id)domainAccessorForTripleClickOption:(int)a3
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (id *)MEMORY[0x1E0DDDF40];
  if (a3 == 11)
    v3 = (id *)MEMORY[0x1E0DDE2B8];
  v4 = *v3;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:pairedDevice:", v4, v6);
  return v7;
}

+ (BOOL)valueForTripleClickOption:(int)a3
{
  return objc_msgSend(a1, "valueForTripleClickOption:fromSource:", *(_QWORD *)&a3, 0);
}

+ (BOOL)valueForTripleClickOption:(int)a3 fromSource:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      return objc_msgSend(a1, "_localValueForTripleClickOption:", *(_QWORD *)&a3);
    case 1:
      return objc_msgSend(a1, "_npsValueForTripleClickOption:", *(_QWORD *)&a3);
    case 0:
      return objc_msgSend(a1, "_localValueForTripleClickOption:", *(_QWORD *)&a3);
  }
  return 0;
}

+ (BOOL)_localValueForTripleClickOption:(int)a3
{
  char v3;
  int CategoryEnabled;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = 0;
  switch(a3)
  {
    case 1:
      CategoryEnabled = _AXSVoiceOverTouchEnabled();
      return CategoryEnabled != 0;
    case 2:
      CategoryEnabled = _AXSInvertColorsEnabledGlobalCached();
      return CategoryEnabled != 0;
    case 4:
      return objc_msgSend(a1, "valueForZoomTripleClickOption");
    case 6:
      CategoryEnabled = _AXSAssistiveTouchEnabled();
      return CategoryEnabled != 0;
    case 7:
      +[AXBackBoardServer server](AXBackBoardServer, "server");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isGuidedAccessActive");
      goto LABEL_26;
    case 9:
      CategoryEnabled = _AXSAssistiveTouchScannerEnabled();
      return CategoryEnabled != 0;
    case 10:
      +[AXBackBoardServer server](AXBackBoardServer, "server");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "supportsAccessibilityDisplayFilters");

      if (v9)
        CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
      else
        CategoryEnabled = _AXSGrayscaleEnabled();
      return CategoryEnabled != 0;
    case 11:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "touchAccommodationsEnabled");
      goto LABEL_26;
    case 13:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "localizationQACaptionMode");
      goto LABEL_26;
    case 14:
      CategoryEnabled = _AXSReduceWhitePointEnabled();
      return CategoryEnabled != 0;
    case 15:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "classicInvertColors");
      goto LABEL_26;
    case 17:
      CategoryEnabled = _AXSCommandAndControlEnabled();
      return CategoryEnabled != 0;
    case 18:
      CategoryEnabled = _AXSFullKeyboardAccessEnabled();
      return CategoryEnabled != 0;
    case 20:
      CategoryEnabled = _AXSEnhanceBackgroundContrastEnabledGlobal();
      return CategoryEnabled != 0;
    case 21:
      CategoryEnabled = _AXDarkenSystemColorsGlobal();
      return CategoryEnabled != 0;
    case 22:
      if (!_AXSVoiceOverTouchEnabled())
        return 0;
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "liveRecognitionActive");
LABEL_26:
      v13 = v7;

      return v13;
    case 23:
      CategoryEnabled = _AXSWatchControlEnabled();
      return CategoryEnabled != 0;
    case 24:
      CategoryEnabled = _AXSReduceMotionEnabledGlobal();
      return CategoryEnabled != 0;
    case 25:
      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v10 = (void *)getHUComfortSoundsSettingsClass_softClass;
      v29 = getHUComfortSoundsSettingsClass_softClass;
      if (!getHUComfortSoundsSettingsClass_softClass)
      {
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = (uint64_t)__getHUComfortSoundsSettingsClass_block_invoke;
        v24 = &unk_1E24C4AE0;
        v25 = &v26;
        __getHUComfortSoundsSettingsClass_block_invoke((uint64_t)&v21);
        v10 = (void *)v27[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v26, 8);
      objc_msgSend(v11, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v12, "comfortSoundsEnabled");
      goto LABEL_49;
    case 26:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "leftRightBalanceEnabled");
      goto LABEL_26;
    case 27:
      CategoryEnabled = _AXSHoverTextEnabled();
      return CategoryEnabled != 0;
    case 28:
      return _AXSTwiceRemoteScreenEnabled() && _AXSTwiceRemoteScreenPlatform() == 0;
    case 29:
      CategoryEnabled = _AXSLiveTranscriptionEnabled();
      return CategoryEnabled != 0;
    case 33:
      CategoryEnabled = _AXSLiveSpeechEnabled();
      return CategoryEnabled != 0;
    case 35:
      CategoryEnabled = _AXSPhotosensitiveMitigationEnabled();
      return CategoryEnabled != 0;
    case 36:
      CategoryEnabled = _AXSMotionCuesActive();
      return CategoryEnabled != 0;
    case 38:
      CategoryEnabled = _AXSHapticMusicEnabled();
      return CategoryEnabled != 0;
    case 39:
      v21 = 0;
      v22 = (uint64_t)&v21;
      v23 = 0x2020000000;
      v14 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr;
      v24 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr;
      if (!getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr)
      {
        v15 = (void *)PersonalAudioLibrary();
        v14 = dlsym(v15, "paCurrentBluetoothDeviceSupportingTransparencyAccommodations");
        *(_QWORD *)(v22 + 24) = v14;
        getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr = v14;
      }
      _Block_object_dispose(&v21, 8);
      if (!v14)
        +[AXTripleClickHelpers _localValueForTripleClickOption:].cold.1();
      ((void (*)(void))v14)();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "length")
        || !soft_paCurrentRouteSupportsTransparencyAccommodations()
        || !soft_paBluetoothDeviceSupportsSSL(v12))
      {
        v3 = 0;
        goto LABEL_48;
      }
      objc_msgSend(getPASettingsClass(), "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "personalMediaEnabled"))
      {
        v18 = objc_msgSend(v12, "listeningMode");

        if (v18 == 3)
        {
          objc_msgSend(getPASettingsClass(), "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "transparencyCustomizedForAddress:", v16);
          goto LABEL_57;
        }
      }
      else
      {

      }
      objc_msgSend(getPASettingsClass(), "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "sslEnabledForAddress:", v16);
LABEL_57:
      v3 = v20;

LABEL_48:
LABEL_49:

      return v3;
    case 40:
      CategoryEnabled = _AXSHoverTextTypingEnabled();
      return CategoryEnabled != 0;
    case 41:
      CategoryEnabled = _AXSIncreaseBrightnessFloorEnabled();
      return CategoryEnabled != 0;
    case 42:
      CategoryEnabled = _AXSOnDeviceEyeTrackingEnabled();
      return CategoryEnabled != 0;
    default:
      return v3;
  }
}

+ (BOOL)valueForZoomTripleClickOption
{
  return _AXSZoomTouchEnabled() != 0;
}

+ (int64_t)stateForTripleClickOption:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 0x22 && ((1 << a3) & 0x4C0401008) != 0)
    return 0;
  if (objc_msgSend(a1, "valueForTripleClickOption:", v3, v4))
    return 1;
  return 2;
}

+ (id)_npsKeyForTripleClickOption:(int)a3
{
  id v3;
  id *v4;

  v3 = 0;
  if (a3 > 19)
  {
    if (a3 > 25)
    {
      if (a3 == 26)
      {
        v4 = (id *)MEMORY[0x1E0DDE158];
        goto LABEL_20;
      }
      if (a3 == 33)
      {
        v4 = (id *)MEMORY[0x1E0DDE170];
        goto LABEL_20;
      }
    }
    else
    {
      if (a3 == 20)
      {
        v4 = (id *)MEMORY[0x1E0DDE090];
        goto LABEL_20;
      }
      if (a3 == 24)
      {
        v4 = (id *)MEMORY[0x1E0DDE218];
        goto LABEL_20;
      }
    }
  }
  else if (a3 > 9)
  {
    if (a3 == 10)
      return CFSTR("ColorFiltersEnabled");
    if (a3 == 11)
    {
      v4 = (id *)kAXSTouchAccommodationsEnabledPreference;
      goto LABEL_20;
    }
  }
  else
  {
    if (a3 == 1)
    {
      v4 = (id *)MEMORY[0x1E0DDE310];
      goto LABEL_20;
    }
    if (a3 == 4)
    {
      v4 = (id *)MEMORY[0x1E0DDE348];
LABEL_20:
      v3 = *v4;
    }
  }
  return v3;
}

+ (BOOL)_npsValueForTripleClickOption:(int)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 23)
  {
    if (!WatchControlSettingsLibraryCore_frameworkLibrary)
      WatchControlSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WatchControlSettingsLibraryCore_frameworkLibrary)
      return 0;
    objc_msgSend(getWatchControlSettingsClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "featureEnabled");
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    objc_msgSend(a1, "domainAccessorForTripleClickOption:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_npsKeyForTripleClickOption:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (v8 && v7)
    {
      v9 = (id)objc_msgSend(v3, "synchronize");
      v4 = objc_msgSend(v3, "BOOLForKey:", v7);
    }

  }
  return v4;
}

+ (void)_npsSyncTripleClickOption:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domainAccessorForTripleClickOption:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_npsKeyForTripleClickOption:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronizeUserDefaultsDomain:keys:", v9, v12);

  }
}

+ (void)_toggleVoiceOver
{
  if (!_AXSVoiceOverTouchUsageConfirmed())
    _AXSVoiceOverTouchSetUsageConfirmed();
  if (!_AXSVoiceOverTouchEnabled() && _AXSCanDisableApplicationAccessibility())
    _AXSApplicationAccessibilitySetEnabled();
  _AXSVoiceOverTouchSetEnabled();
  _AXSVoiceOverTouchSetUIEnabled();
}

+ (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = objc_msgSend(a1, "_isAccessibilityAppIntentsProcess");
  +[AXSpringBoardServer server](AXSpringBoardServer, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__AXTripleClickHelpers__promptToDisableBrightnessFilters_data___block_invoke;
  v10[3] = &unk_1E24C4B28;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "showAlert:withHandler:withData:", 7, v10, v7);

  while (*((_BYTE *)v14 + 24))
  {
    CFRunLoopGetCurrent();
    CFRunLoopRunSpecific();
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __63__AXTripleClickHelpers__promptToDisableBrightnessFilters_data___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = result;
  if (a2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    result = _AXSScreenFilterSetShowInitialAlert();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = 0;
  return result;
}

+ (id)_displayFilterUIClient
{
  if (_displayFilterUIClient_onceToken != -1)
    dispatch_once(&_displayFilterUIClient_onceToken, &__block_literal_global_1);
  return (id)_displayFilterUIClient_DisplayFilterUIClient;
}

void __46__AXTripleClickHelpers__displayFilterUIClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)getAXUIClientClass()), "initWithIdentifier:serviceBundleName:", CFSTR("HomeClickController"), CFSTR("DisplayFilterUIServer"));
  v1 = (void *)_displayFilterUIClient_DisplayFilterUIClient;
  _displayFilterUIClient_DisplayFilterUIClient = v0;

}

+ (void)_toggleSmartInvertColorsOffMainThread
{
  int v3;
  void (**v4)(void);
  _QWORD v5[5];
  BOOL v6;

  v3 = _AXSInvertColorsEnabledGlobalCached();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  v6 = v3 != 0;
  v4 = (void (**)(void))_Block_copy(v5);
  v4[2]();

}

void __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  char v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "classicInvertColors");

  if (v3)
  {
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicInvertColors:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CF39C8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39C8], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_18C62B000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_displayFilterUIClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF3940], "mainAccessQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_338;
  v14[3] = &__block_descriptor_33_e34_v24__0__NSDictionary_8__NSError_16l;
  v15 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v12, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x1E0C9AA70], 1, v13, v14);

}

uint64_t __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_338(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("animationDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");

  objc_msgSend(MEMORY[0x1E0CF39C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39C8], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_18C62B000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_343(uint64_t a1)
{
  double Current;
  id v3;

  _AXSInvertColorsSetEnabled();
  if (!*(_BYTE *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastSmartInvertColorsEnablement:", Current);

  }
}

+ (void)_toggleClassicInvertColors
{
  uint64_t v2;
  void *v3;
  id v4;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "classicInvertColors") ^ 1;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClassicInvertColors:", v2);

}

+ (void)toggleColorFilter
{
  MADisplayFilterPrefGetCategoryEnabled();
  MADisplayFilterPrefSetCategoryEnabled();
}

+ (void)toggleZoomOffMainThread
{
  uint64_t v2;
  void *v3;
  id v4;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "zoomEnabled") ^ 1;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setZoomEnabled:", v2);

}

+ (void)toggleLiveSpeech
{
  if (_os_feature_enabled_impl())
  {
    _AXSLiveSpeechEnabled();
    _AXSLiveSpeechSetEnabled();
  }
}

+ (void)toggleHoverText
{
  uint64_t v2;
  void *v3;
  id v4;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "hoverTextEnabled") ^ 1;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHoverTextEnabled:", v2);

}

+ (void)toggleHoverTextTyping
{
  _AXSHoverTextTypingEnabled();
  _AXSHoverTextTypingSetEnabled();
}

+ (void)_disableSwitchControlWithHandler:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if ((_disableSwitchControlWithHandler___isDisableSwitchAlertVisible & 1) == 0)
  {
    _disableSwitchControlWithHandler___isDisableSwitchAlertVisible = 1;
    +[AXSpringBoardServer server](AXSpringBoardServer, "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__AXTripleClickHelpers__disableSwitchControlWithHandler___block_invoke;
    v5[3] = &unk_1E24C4BD0;
    v6 = v3;
    objc_msgSend(v4, "showAlert:withHandler:", 9, v5);

  }
}

uint64_t __57__AXTripleClickHelpers__disableSwitchControlWithHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = result;
    _AXSAssistiveTouchScannerSetEnabled();
    result = *(_QWORD *)(v2 + 32);
    if (result)
      result = (*(uint64_t (**)(void))(result + 16))();
  }
  _disableSwitchControlWithHandler___isDisableSwitchAlertVisible = 0;
  return result;
}

+ (void)_toggleAssistiveTouch
{
  int v3;
  int v4;
  int v5;

  v3 = _AXSAssistiveTouchScannerEnabled();
  v4 = _AXSAssistiveTouchEnabled();
  v5 = v4;
  if (!v3 || v4)
  {
    _AXSAssistiveTouchSetEnabled();
    if (!v5)
      _AXSAssistiveTouchSetUIEnabled();
  }
  else
  {
    objc_msgSend(a1, "_disableSwitchControlWithHandler:", &__block_literal_global_349);
  }
}

uint64_t __45__AXTripleClickHelpers__toggleAssistiveTouch__block_invoke()
{
  _AXSAssistiveTouchSetEnabled();
  return _AXSAssistiveTouchSetUIEnabled();
}

+ (void)toggleReduceWhitePoint
{
  _AXSReduceWhitePointEnabled();
  _AXSSetReduceWhitePointEnabled();
}

+ (BOOL)isReduceWhitePointEnabled
{
  return _AXSReduceWhitePointEnabled() != 0;
}

+ (void)toggleGuidedAccessFromControlCenter
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  +[AXBackBoardServer server](AXBackBoardServer, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guidedAccessEffectiveAppBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AXTripleClickHelpers_toggleGuidedAccessFromControlCenter__block_invoke;
  block[3] = &unk_1E24C4C38;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __59__AXTripleClickHelpers_toggleGuidedAccessFromControlCenter__block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openApplicationWithBundleID:", *(_QWORD *)(a1 + 32));

  v3 = dispatch_time(0, 2000000000);
  dispatch_after(v3, MEMORY[0x1E0C80D38], &__block_literal_global_351);
}

void __59__AXTripleClickHelpers_toggleGuidedAccessFromControlCenter__block_invoke_2()
{
  id v0;

  +[AXBackBoardServer server](AXBackBoardServer, "server");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "toggleGuidedAccess");

}

+ (void)toggleFullKeyboardAccess
{
  int v3;
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = _AXSFullKeyboardAccessEnabled();
  v4 = v3 != 0;
  if (v3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v11 = objc_msgSend(a1, "_isAccessibilityAppIntentsProcess");
    +[AXSpringBoardServer server](AXSpringBoardServer, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__AXTripleClickHelpers_toggleFullKeyboardAccess__block_invoke;
    v6[3] = &unk_1E24C4C60;
    v7 = v4;
    v6[4] = &v8;
    objc_msgSend(v5, "showAlert:withHandler:", 18, v6);

    while (*((_BYTE *)v9 + 24))
    {
      CFRunLoopGetCurrent();
      CFRunLoopRunSpecific();
    }
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    _AXSFullKeyboardAccessSetEnabled();
  }
}

uint64_t __48__AXTripleClickHelpers_toggleFullKeyboardAccess__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  if (!a2)
    result = _AXSFullKeyboardAccessSetEnabled();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = 0;
  return result;
}

+ (void)attemptToToggleTwiceRemoteScreen
{
  OUTLINED_FUNCTION_1(&dword_18C62B000, a1, a3, "Can't start remote screen on this device", a5, a6, a7, a8, 0);
}

+ (void)attemptToEnterClarityBoard
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ClarityUIClientIdentifier-%@"), v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc((Class)getAXUIClientClass()), "initWithIdentifier:serviceBundleName:", v9, CFSTR("ClarityUIServer"));
  v7 = AXTripleClickAttemptToEnterClarityBoardMessageIdentifier;
  objc_msgSend(MEMORY[0x1E0CF3940], "mainAccessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", 0, v7, v8, &__block_literal_global_357);

}

void __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    CLFLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke_cold_1((uint64_t)v3, v4);

  }
}

+ (void)attemptToPresentNearbyDeviceControlPicker
{
  id v2;

  +[AXSpringBoardServer server](AXSpringBoardServer, "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentNearbyDeviceControlPicker");

}

+ (void)toggleHearingControlCenter
{
  id v2;

  +[AXSpringBoardServer server](AXSpringBoardServer, "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHearingAidControlVisible:", 1);

}

+ (void)toggleOnDeviceEyeTracking
{
  _BOOL8 v2;
  id v3;

  v2 = _AXSOnDeviceEyeTrackingEnabled() == 0;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:", v2);

}

+ (void)attemptToToggleConversationBoost
{
  id v2;

  +[AXSpringBoardServer server](AXSpringBoardServer, "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleConversationBoost");

}

+ (void)toggleTripleClickOption:(int)a3
{
  objc_msgSend(a1, "toggleTripleClickOption:fromSource:", *(_QWORD *)&a3, 0);
}

+ (void)toggleTripleClickOption:(int)a3 fromSource:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      objc_msgSend(a1, "_handleToggleTripleClickTriggeredFromAppIntent:", *(_QWORD *)&a3);
      break;
    case 1:
      objc_msgSend(a1, "_npsToggleTripleClickOption:", *(_QWORD *)&a3);
      break;
    case 0:
      objc_msgSend(a1, "_localToggleTripleClickOption:", *(_QWORD *)&a3);
      break;
  }
}

+ (void)_handleToggleTripleClickTriggeredFromAppIntent:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (a3 == 36)
    objc_msgSend(a1, "setMotionCuesShowBanner:", 0);
  objc_msgSend(a1, "_localToggleTripleClickOption:", v3);
}

+ (void)_localToggleTripleClickOption:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  __int128 buf;
  Class (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v3 = *(_QWORD *)&a3;
  v52 = *MEMORY[0x1E0C80C00];
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "titleForTripleClickOption:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "Toggling option: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(a1, "registerObserverForTripleClickOption:", v3);
  v7 = MEMORY[0x1E0C809B0];
  switch((int)v3)
  {
    case 1:
      objc_msgSend(a1, "_toggleVoiceOver");
      break;
    case 2:
      objc_msgSend(a1, "performSelectorInBackground:withObject:", sel__toggleSmartInvertColorsOffMainThread, 0);
      break;
    case 4:
      objc_msgSend(a1, "toggleZoomOffMainThread");
      break;
    case 6:
      objc_msgSend(a1, "_toggleAssistiveTouch");
      break;
    case 7:
      if (_AXSGuidedAccessEnabled())
        objc_msgSend(a1, "toggleGuidedAccessFromControlCenter");
      break;
    case 8:
      objc_msgSend(a1, "toggleHearingControlCenter");
      break;
    case 9:
      objc_msgSend(a1, "_toggleSwitchOver");
      break;
    case 10:
      +[AXBackBoardServer server](AXBackBoardServer, "server");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "supportsAccessibilityDisplayFilters");

      if (v9)
      {
        objc_msgSend(a1, "toggleColorFilter");
      }
      else
      {
        _AXSGrayscaleEnabled();
        _AXSGrayscaleSetEnabled();
      }
      break;
    case 11:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "touchAccommodationsEnabled");
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTouchAccommodationsEnabled:", v11 ^ 1u);

      break;
    case 12:
      objc_msgSend(getAXPISystemActionHelperClass(), "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startMagnifier");

      break;
    case 13:
      objc_msgSend(a1, "_toggleLocalizationCaptionPanel");
      break;
    case 14:
      objc_msgSend(a1, "toggleReduceWhitePoint");
      break;
    case 15:
      objc_msgSend(a1, "_toggleClassicInvertColors");
      break;
    case 17:
      _AXSCommandAndControlEnabled();
      _AXSCommandAndControlSetEnabled();
      break;
    case 18:
      objc_msgSend(a1, "toggleFullKeyboardAccess");
      break;
    case 20:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "enhanceBackgroundContrastEnabled");
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEnhanceBackgroundContrastEnabled:", v15 ^ 1u);

      break;
    case 21:
      _AXDarkenSystemColorsGlobal();
      _AXSSetDarkenSystemColors();
      break;
    case 22:
      if (_AXSVoiceOverTouchEnabled())
      {
        +[AXSettings sharedInstance](AXSettings, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "liveRecognitionActive");

        +[AXVoiceOverServer server](AXVoiceOverServer, "server");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
          objc_msgSend(v19, "triggerCommand:", 51);
        else
          objc_msgSend(v19, "triggerCommand:", 50);

      }
      else
      {
        objc_msgSend(getAXPISystemActionHelperClass(), "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "activateDetectionMode");

      }
      break;
    case 24:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "reduceMotionEnabled");
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setReduceMotionEnabled:", v22 ^ 1u);

      break;
    case 25:
      +[AXSystemAppServer server](AXSystemAppServer, "server");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "toggleBackgroundSounds");

      break;
    case 26:
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "leftRightBalanceEnabled");
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLeftRightBalanceEnabled:", v26 ^ 1u);

      break;
    case 27:
      objc_msgSend(a1, "toggleHoverText");
      break;
    case 28:
      objc_msgSend(a1, "attemptToToggleTwiceRemoteScreen");
      break;
    case 29:
      +[AXSpringBoardServer server](AXSpringBoardServer, "server");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "toggleLiveTranscription");

      break;
    case 30:
      objc_msgSend(a1, "attemptToEnterClarityBoard");
      break;
    case 31:
      objc_msgSend(a1, "attemptToPresentNearbyDeviceControlPicker");
      break;
    case 33:
      objc_msgSend(a1, "toggleLiveSpeech");
      break;
    case 34:
      _AXSSetSpeakThisEnabled();
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v29 = (void *)getSpeakThisServicesClass_softClass;
      v45 = getSpeakThisServicesClass_softClass;
      if (!getSpeakThisServicesClass_softClass)
      {
        *(_QWORD *)&buf = v7;
        *((_QWORD *)&buf + 1) = 3221225472;
        v49 = __getSpeakThisServicesClass_block_invoke;
        v50 = &unk_1E24C4AE0;
        v51 = &v42;
        __getSpeakThisServicesClass_block_invoke((uint64_t)&buf);
        v29 = (void *)v43[3];
      }
      v30 = objc_retainAutorelease(v29);
      _Block_object_dispose(&v42, 8);
      objc_msgSend(v30, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "speakThisWithOptions:errorHandler:", 12, 0);

      break;
    case 35:
      _AXSPhotosensitiveMitigationEnabled();
      _AXSPhotosensitiveMitigationSetEnabled();
      break;
    case 36:
      v32 = _AXSMotionCuesActive();
      AXLogMotionCues();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v32 == 0;
        _os_log_impl(&dword_18C62B000, v33, OS_LOG_TYPE_DEFAULT, "Triple click: active=%{BOOL}d", (uint8_t *)&buf, 8u);
      }

      v46[0] = CFSTR("enable");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v32 == 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = CFSTR("reason");
      v47[0] = v34;
      v47[1] = &unk_1E24F7478;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      _AXSSetMotionCuesModeAndShowBanner();
      objc_msgSend(a1, "setMotionCuesShowBanner:", 1);

      break;
    case 38:
      AXLogHapticMusic();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _AXSHapticMusicEnabled() == 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v37;
        _os_log_impl(&dword_18C62B000, v36, OS_LOG_TYPE_DEFAULT, "Turning on haptic music from TC (new value: %@)", (uint8_t *)&buf, 0xCu);

      }
      _AXSHapticMusicEnabled();
      _AXSSetHapticMusicEnabled();
      if (_AXSHapticMusicEnabled())
      {
        +[AXSettings sharedInstance](AXSettings, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "hapticMusicActive");

        if ((v39 & 1) == 0)
        {
          +[AXSettings sharedInstance](AXSettings, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setHapticMusicActive:", 1);

        }
      }
      break;
    case 39:
      objc_msgSend(a1, "attemptToToggleConversationBoost");
      break;
    case 40:
      objc_msgSend(a1, "toggleHoverTextTyping");
      break;
    case 42:
      objc_msgSend(a1, "toggleOnDeviceEyeTracking");
      break;
    default:
      break;
  }
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __54__AXTripleClickHelpers__localToggleTripleClickOption___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const void *v3;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "tripleClickOptionDidChangeNotification");
  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, v2, v3, 0, 1u);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v2, 0, 0, 1u);
}

+ (BOOL)switchControlRendersDeviceUnusable
{
  return SwitchControlRendersDeviceUnusable;
}

+ (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3
{
  SwitchControlRendersDeviceUnusable = a3;
}

+ (BOOL)switchControlHasScreenSwitch
{
  return SwitchControlHasScreenSwitch;
}

+ (void)setSwitchControlHasScreenSwitch:(BOOL)a3
{
  SwitchControlHasScreenSwitch = a3;
}

+ (BOOL)motionCuesShowBanner
{
  return MotionCuesShowBanner;
}

+ (void)setMotionCuesShowBanner:(BOOL)a3
{
  MotionCuesShowBanner = a3;
}

+ (void)_toggleSwitchOverOffMainThread
{
  if (!_AXSAssistiveTouchScannerEnabled()
    || SwitchControlRendersDeviceUnusable | SwitchControlHasScreenSwitch)
  {
    _AXSAssistiveTouchScannerSetEnabled();
  }
  else
  {
    objc_msgSend(a1, "_disableSwitchControlWithHandler:", 0);
  }
}

+ (void)_toggleLocalizationCaptionPanel
{
  uint64_t v2;
  void *v3;
  id v4;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "localizationQACaptionMode") ^ 1;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalizationQACaptionMode:", v2);

}

+ (void)_toggleSwitchOver
{
  objc_msgSend(a1, "performSelectorInBackground:withObject:", sel__toggleSwitchOverOffMainThread, 0);
}

+ (void)registerObserverForTripleClickOption:(int)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFString *v19;
  NSObject *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const __CFString *v28;
  _BYTE v29[128];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Should register observer(s) for triple click option", buf, 2u);
  }

  if (!RegisteredTripleClickObservers)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)RegisteredTripleClickObservers;
    RegisteredTripleClickObservers = (uint64_t)v5;

  }
  v7 = 0;
  switch(a3)
  {
    case 1:
    case 5:
      v50[0] = *MEMORY[0x1E0DDE308];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v50;
      goto LABEL_27;
    case 2:
      v49 = *MEMORY[0x1E0DDE150];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v49;
      goto LABEL_27;
    case 4:
      v44 = *MEMORY[0x1E0DDE338];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v44;
      goto LABEL_27;
    case 6:
      v43 = *MEMORY[0x1E0DDDFF0];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v43;
      goto LABEL_27;
    case 9:
      v42 = *MEMORY[0x1E0DDDFF0];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v42;
      goto LABEL_27;
    case 10:
      v10 = *MEMORY[0x1E0DDE0D8];
      v47[0] = *MEMORY[0x1E0DDE1F8];
      v47[1] = v10;
      v11 = *MEMORY[0x1E0DDE2A8];
      v47[2] = *MEMORY[0x1E0DDE048];
      v47[3] = v11;
      v47[4] = *MEMORY[0x1E0DDE0D0];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v47;
      v12 = 5;
      goto LABEL_28;
    case 14:
      v48 = *MEMORY[0x1E0DDE228];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v48;
      goto LABEL_27;
    case 15:
      v41 = *MEMORY[0x1E0DDE060];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v41;
      goto LABEL_27;
    case 17:
      v37 = *MEMORY[0x1E0DDE070];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v37;
      goto LABEL_27;
    case 18:
      v36 = *MEMORY[0x1E0DDE0B8];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v36;
      goto LABEL_27;
    case 20:
      v39 = *MEMORY[0x1E0DDE088];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v39;
      goto LABEL_27;
    case 21:
      v40 = *MEMORY[0x1E0DDE078];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v40;
      goto LABEL_27;
    case 24:
      v38 = *MEMORY[0x1E0DDE210];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v38;
      goto LABEL_27;
    case 27:
      v46 = *MEMORY[0x1E0DDE138];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v46;
      goto LABEL_27;
    case 29:
      v35 = *MEMORY[0x1E0DDE178];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v35;
      goto LABEL_27;
    case 33:
      v45 = *MEMORY[0x1E0DDE168];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v45;
      goto LABEL_27;
    case 34:
      v30 = *MEMORY[0x1E0DDE278];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v30;
      goto LABEL_27;
    case 35:
      v31 = *MEMORY[0x1E0DDE1B0];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v31;
      goto LABEL_27;
    case 36:
      v34 = *MEMORY[0x1E0DDE198];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v34;
      goto LABEL_27;
    case 38:
      v33 = *MEMORY[0x1E0DDE100];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v33;
      goto LABEL_27;
    case 40:
      v32 = *MEMORY[0x1E0DDE140];
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v32;
LABEL_27:
      v12 = 1;
LABEL_28:
      objc_msgSend(v8, "arrayWithObjects:count:", v9, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v24;
    *(_QWORD *)&v15 = 138412290;
    v22 = v15;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v13);
        v19 = *(const __CFString **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend((id)RegisteredTripleClickObservers, "containsObject:", v19, v22, (_QWORD)v23) & 1) == 0)
        {
          AXLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v28 = v19;
            _os_log_impl(&dword_18C62B000, v20, OS_LOG_TYPE_DEFAULT, "Registering triple click notification observer for %@", buf, 0xCu);
          }

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleTripleClickPrefNotificationChanged, v19, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
          objc_msgSend((id)RegisteredTripleClickObservers, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v16);
  }

}

+ (void)_npsToggleTripleClickOption:(int)a3
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 != 23)
  {
    v6 = *(_QWORD *)&a3;
    objc_msgSend(a1, "domainAccessorForTripleClickOption:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_npsKeyForTripleClickOption:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v8)
    {
      v10 = objc_msgSend(v5, "BOOLForKey:", v8);
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DDE158]))
      {
        _AXSLeftRightAudioBalance();
        objc_msgSend(v5, "setFloat:forKey:", v8);
      }
      else
      {
        objc_msgSend(v5, "setBool:forKey:", v10 ^ 1u, v8);
      }
      v11 = (id)objc_msgSend(v5, "synchronize");
      v12 = (void *)objc_opt_new();
      objc_msgSend(v5, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v17 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "synchronizeUserDefaultsDomain:keys:", v13, v16);

    }
    goto LABEL_13;
  }
  if (!WatchControlSettingsLibraryCore_frameworkLibrary)
  {
    v18 = xmmword_1E24C4D48;
    v19 = 0;
    WatchControlSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (WatchControlSettingsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getWatchControlSettingsClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "featureEnabled");

    objc_msgSend(getWatchControlSettingsClass(), "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFeatureEnabled:", v4 ^ 1u);
LABEL_13:

  }
}

+ (id)allTripleClickOptions
{
  return (id)objc_msgSend(a1, "allTripleClickOptionsForPlatform:", 0);
}

+ (id)allTripleClickOptionsForPlatform:(int64_t)a3
{
  if (a3 == 2)
    objc_msgSend(a1, "_allAvailableFeaturesWatchOS");
  else
    objc_msgSend(a1, "_allAvailableFeaturesIOS");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_allAvailableFeaturesIOS
{
  return &unk_1E24F8CD8;
}

+ (id)_allAvailableFeaturesWatchOS
{
  return &unk_1E24F8CF0;
}

+ (id)_availableFeatures
{
  return (id)_AXSTripleClickCopyOptions();
}

+ (BOOL)_shouldShowFeatureInShortcutsControlCenterModule:(int)a3 includeGuidedAccess:(BOOL)a4
{
  if (a3 == 7)
  {
    if (a4)
      return 1;
  }
  else if (a3 != 8)
  {
    return 1;
  }
  return 0;
}

+ (id)tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  objc_msgSend(a1, "_availableFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__AXTripleClickHelpers_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess___block_invoke;
  v8[3] = &__block_descriptor_41_e21_B24__0__NSNumber_8Q16l;
  v8[4] = a1;
  v9 = a3;
  objc_msgSend(v5, "axFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __107__AXTripleClickHelpers_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;

  v3 = objc_msgSend(a2, "intValue");
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldShowFeatureInShortcutsControlCenterModule:includeGuidedAccess:", v3, *(unsigned __int8 *)(a1 + 40));
  +[AXTripleClickHelpers titleForTripleClickOption:](AXTripleClickHelpers, "titleForTripleClickOption:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    return v4;
  else
    return 0;
}

+ (BOOL)_isAccessibilityAppIntentsProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer.AccessibilityAppIntents"));

  return v4;
}

+ (void)localizationKeyForTripleClickOption:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *soft_AXUILocalizedStringForKeyWithTable(NSString *__strong, NSString *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXTripleClickHelpers.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

+ (void)_localValueForTripleClickOption:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BluetoothDevice *soft_paCurrentBluetoothDeviceSupportingTransparencyAccommodations(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXTripleClickHelpers.m"), 84, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "Error attempting to enter ClarityBoard: %@", (uint8_t *)&v2, 0xCu);
}

@end
