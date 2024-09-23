id initSFLocalizedStringForKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = SharingLibrary_sOnce;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global_827);
  softLinkSFLocalizedStringForKey = (uint64_t)dlsym((void *)SharingLibrary_sLib, "SFLocalizedStringForKey");
  ((void (*)(id))softLinkSFLocalizedStringForKey)(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SFNormalizeEmailAddress(void *a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2
    && ((objc_msgSend(v3, "hasSuffix:", CFSTR("@me.com")) & 1) != 0
     || objc_msgSend(v4, "hasSuffix:", CFSTR("@mac.com"))))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@@icloud.com"), v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v4;
    }

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

Class initTROperationQueue()
{
  Class result;

  if (TouchRemoteLibrary_sOnce != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce, &__block_literal_global_818);
  result = objc_getClass("TROperationQueue");
  classTROperationQueue = (uint64_t)result;
  getTROperationQueueClass = (uint64_t (*)())TROperationQueueFunction;
  return result;
}

id TROperationQueueFunction()
{
  return (id)classTROperationQueue;
}

Class initHMMutableHomeManagerConfiguration()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMMutableHomeManagerConfiguration");
  classHMMutableHomeManagerConfiguration = (uint64_t)result;
  getHMMutableHomeManagerConfigurationClass = (uint64_t (*)())HMMutableHomeManagerConfigurationFunction;
  return result;
}

id HMMutableHomeManagerConfigurationFunction()
{
  return (id)classHMMutableHomeManagerConfiguration;
}

Class initHMHomeManager()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMHomeManager");
  classHMHomeManager = (uint64_t)result;
  getHMHomeManagerClass = (uint64_t (*)())HMHomeManagerFunction;
  return result;
}

id HMHomeManagerFunction()
{
  return (id)classHMHomeManager;
}

Class initHMAccessoryBrowser()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMAccessoryBrowser");
  classHMAccessoryBrowser = (uint64_t)result;
  getHMAccessoryBrowserClass = (uint64_t (*)())HMAccessoryBrowserFunction;
  return result;
}

id HMAccessoryBrowserFunction()
{
  return (id)classHMAccessoryBrowser;
}

Class initHMDeviceSetupOperation()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMDeviceSetupOperation");
  classHMDeviceSetupOperation = (uint64_t)result;
  getHMDeviceSetupOperationClass = (uint64_t (*)())HMDeviceSetupOperationFunction;
  return result;
}

id HMDeviceSetupOperationFunction()
{
  return (id)classHMDeviceSetupOperation;
}

Class initHMMediaSystemBuilder()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMMediaSystemBuilder");
  classHMMediaSystemBuilder = (uint64_t)result;
  getHMMediaSystemBuilderClass = (uint64_t (*)())HMMediaSystemBuilderFunction;
  return result;
}

id HMMediaSystemBuilderFunction()
{
  return (id)classHMMediaSystemBuilder;
}

Class initHMMediaSystemRole()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMMediaSystemRole");
  classHMMediaSystemRole = (uint64_t)result;
  getHMMediaSystemRoleClass = (uint64_t (*)())HMMediaSystemRoleFunction;
  return result;
}

id HMMediaSystemRoleFunction()
{
  return (id)classHMMediaSystemRole;
}

Class initHMMediaSystemComponent()
{
  Class result;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  result = objc_getClass("HMMediaSystemComponent");
  classHMMediaSystemComponent = (uint64_t)result;
  getHMMediaSystemComponentClass = (uint64_t (*)())HMMediaSystemComponentFunction;
  return result;
}

id HMMediaSystemComponentFunction()
{
  return (id)classHMMediaSystemComponent;
}

id initValHMAccessoryCategoryTypeHomePod()
{
  id *v0;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  v0 = (id *)dlsym((void *)HomeKitLibrary_sLib, "HMAccessoryCategoryTypeHomePod");
  if (v0)
    objc_storeStrong((id *)&constantValHMAccessoryCategoryTypeHomePod, *v0);
  getHMAccessoryCategoryTypeHomePod = (uint64_t (*)())HMAccessoryCategoryTypeHomePodFunction;
  return (id)constantValHMAccessoryCategoryTypeHomePod;
}

id HMAccessoryCategoryTypeHomePodFunction()
{
  return (id)constantValHMAccessoryCategoryTypeHomePod;
}

id initValHMAccessoryCategoryTypeAppleTV()
{
  id *v0;

  if (HomeKitLibrary_sOnce != -1)
    dispatch_once(&HomeKitLibrary_sOnce, &__block_literal_global_821);
  v0 = (id *)dlsym((void *)HomeKitLibrary_sLib, "HMAccessoryCategoryTypeAppleTV");
  if (v0)
    objc_storeStrong((id *)&constantValHMAccessoryCategoryTypeAppleTV, *v0);
  getHMAccessoryCategoryTypeAppleTV = (uint64_t (*)())HMAccessoryCategoryTypeAppleTVFunction;
  return (id)constantValHMAccessoryCategoryTypeAppleTV;
}

id HMAccessoryCategoryTypeAppleTVFunction()
{
  return (id)constantValHMAccessoryCategoryTypeAppleTV;
}

Class initASDSystemAppRequest()
{
  Class result;

  if (AppStoreDaemonLibrary_sOnce != -1)
    dispatch_once(&AppStoreDaemonLibrary_sOnce, &__block_literal_global_835);
  result = objc_getClass("ASDSystemAppRequest");
  classASDSystemAppRequest = (uint64_t)result;
  getASDSystemAppRequestClass = (uint64_t (*)())ASDSystemAppRequestFunction;
  return result;
}

id ASDSystemAppRequestFunction()
{
  return (id)classASDSystemAppRequest;
}

Class initSFAirDropDiscoveryController()
{
  Class result;

  if (SharingUILibrary_sOnce != -1)
    dispatch_once(&SharingUILibrary_sOnce, &__block_literal_global_1);
  result = objc_getClass("SFAirDropDiscoveryController");
  classSFAirDropDiscoveryController = (uint64_t)result;
  getSFAirDropDiscoveryControllerClass = (uint64_t (*)())SFAirDropDiscoveryControllerFunction;
  return result;
}

id SFAirDropDiscoveryControllerFunction()
{
  return (id)classSFAirDropDiscoveryController;
}

void HDSMetricsLog(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (gLogCategory_Metrics <= 30 && (gLogCategory_Metrics != -1 || _LogCategory_Initialize()))
    LogPrintF();
  softLinkAnalyticsSendEvent(v4, v3);

}

void initAnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = CoreAnalyticsLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&CoreAnalyticsLibrary_sOnce, &__block_literal_global_3);
  softLinkAnalyticsSendEvent = (uint64_t (*)())dlsym((void *)CoreAnalyticsLibrary_sLib, "AnalyticsSendEvent");
  ((void (*)(id, id))softLinkAnalyticsSendEvent)(v5, v4);

}

void sub_22F761F78(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_22F7631E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

Class initHMHomeManager_0()
{
  Class result;

  if (HomeKitLibrary_sOnce_0 != -1)
    dispatch_once(&HomeKitLibrary_sOnce_0, &__block_literal_global_987);
  result = objc_getClass("HMHomeManager");
  classHMHomeManager_0 = (uint64_t)result;
  getHMHomeManagerClass_0 = (uint64_t (*)())HMHomeManagerFunction_0;
  return result;
}

id HMHomeManagerFunction_0()
{
  return (id)classHMHomeManager_0;
}

uint64_t initAudioServicesSetProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (AudioToolboxLibrary_sOnce != -1)
    dispatch_once(&AudioToolboxLibrary_sOnce, &__block_literal_global_990);
  softLinkAudioServicesSetProperty[0] = (uint64_t (*)())dlsym((void *)AudioToolboxLibrary_sLib, "AudioServicesSetProperty");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkAudioServicesSetProperty[0])(a1, a2, a3, a4, a5);
}

Class initAPCPlayer()
{
  Class result;

  if (AudioPasscodeLibrary_sOnce != -1)
    dispatch_once(&AudioPasscodeLibrary_sOnce, &__block_literal_global_1001);
  result = objc_getClass("APCPlayer");
  classAPCPlayer = (uint64_t)result;
  getAPCPlayerClass = (uint64_t (*)())APCPlayerFunction;
  return result;
}

id APCPlayerFunction()
{
  return (id)classAPCPlayer;
}

uint64_t init_AXSVoiceOverTouchSetEnabled(uint64_t a1)
{
  if (AccessibilityLibrary_sOnce != -1)
    dispatch_once(&AccessibilityLibrary_sOnce, &__block_literal_global_1004);
  softLink_AXSVoiceOverTouchSetEnabled[0] = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib, "_AXSVoiceOverTouchSetEnabled");
  return ((uint64_t (*)(uint64_t))softLink_AXSVoiceOverTouchSetEnabled[0])(a1);
}

uint64_t init_AXSVoiceOverTouchSetSpeakingRate(float a1)
{
  if (AccessibilityLibrary_sOnce != -1)
    dispatch_once(&AccessibilityLibrary_sOnce, &__block_literal_global_1004);
  softLink_AXSVoiceOverTouchSetSpeakingRate[0] = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib, "_AXSVoiceOverTouchSetSpeakingRate");
  return ((uint64_t (*)(float))softLink_AXSVoiceOverTouchSetSpeakingRate[0])(a1);
}

Class initAXSettings()
{
  Class result;

  if (AccessibilityUtilitiesLibrary_sOnce != -1)
    dispatch_once(&AccessibilityUtilitiesLibrary_sOnce, &__block_literal_global_1008);
  result = objc_getClass("AXSettings");
  classAXSettings = (uint64_t)result;
  getAXSettingsClass = (uint64_t (*)())AXSettingsFunction;
  return result;
}

id AXSettingsFunction()
{
  return (id)classAXSettings;
}

Class initCLLocationManager()
{
  Class result;

  if (CoreLocationLibrary_sOnce != -1)
    dispatch_once(&CoreLocationLibrary_sOnce, &__block_literal_global_1011);
  result = objc_getClass("CLLocationManager");
  classCLLocationManager = (uint64_t)result;
  getCLLocationManagerClass = (uint64_t (*)())CLLocationManagerFunction;
  return result;
}

id CLLocationManagerFunction()
{
  return (id)classCLLocationManager;
}

uint64_t initValTMSourceProxBuddy()
{
  uint64_t *v0;
  uint64_t result;

  if (CoreTimeLibrary_sOnce != -1)
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1022);
  v0 = (uint64_t *)dlsym((void *)CoreTimeLibrary_sLib, "TMSourceProxBuddy");
  if (v0)
  {
    result = *v0;
    constantValTMSourceProxBuddy = result;
  }
  else
  {
    result = constantValTMSourceProxBuddy;
  }
  getTMSourceProxBuddy = type metadata for __ObjC;
  return result;
}

uint64_t type metadata for __ObjC()
{
  return constantValTMSourceProxBuddy;
}

uint64_t initTMSetSourceTime(uint64_t a1, double a2, double a3)
{
  if (CoreTimeLibrary_sOnce != -1)
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1022);
  softLinkTMSetSourceTime[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetSourceTime");
  return ((uint64_t (*)(uint64_t, double, double))softLinkTMSetSourceTime[0])(a1, a2, a3);
}

Class initHMDeviceSetupOperationHandler()
{
  Class result;

  if (HomeKitLibrary_sOnce_0 != -1)
    dispatch_once(&HomeKitLibrary_sOnce_0, &__block_literal_global_987);
  result = objc_getClass("HMDeviceSetupOperationHandler");
  classHMDeviceSetupOperationHandler = (uint64_t)result;
  getHMDeviceSetupOperationHandlerClass = (uint64_t (*)())HMDeviceSetupOperationHandlerFunction;
  return result;
}

id HMDeviceSetupOperationHandlerFunction()
{
  return (id)classHMDeviceSetupOperationHandler;
}

Class initVTPreferences()
{
  Class result;

  if (VoiceTriggerLibrary_sOnce != -1)
    dispatch_once(&VoiceTriggerLibrary_sOnce, &__block_literal_global_1027);
  result = objc_getClass("VTPreferences");
  classVTPreferences = (uint64_t)result;
  getVTPreferencesClass = (uint64_t (*)())VTPreferencesFunction;
  return result;
}

id VTPreferencesFunction()
{
  return (id)classVTPreferences;
}

uint64_t initTMSetAutomaticTimeZoneEnabled(uint64_t a1)
{
  if (CoreTimeLibrary_sOnce != -1)
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1022);
  softLinkTMSetAutomaticTimeZoneEnabled[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetAutomaticTimeZoneEnabled");
  return ((uint64_t (*)(uint64_t))softLinkTMSetAutomaticTimeZoneEnabled[0])(a1);
}

uint64_t initTMSetAutomaticTimeEnabled(uint64_t a1)
{
  if (CoreTimeLibrary_sOnce != -1)
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1022);
  softLinkTMSetAutomaticTimeEnabled[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetAutomaticTimeEnabled");
  return ((uint64_t (*)(uint64_t))softLinkTMSetAutomaticTimeEnabled[0])(a1);
}

void initTMSetupTime(void *a1, void *a2, double a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = CoreTimeLibrary_sOnce;
  v6 = a2;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&CoreTimeLibrary_sOnce, &__block_literal_global_1022);
  softLinkTMSetupTime[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib, "TMSetupTime");
  ((void (*)(id, id, double))softLinkTMSetupTime[0])(v7, v6, a3);

}

Class initFLFollowUpController()
{
  Class result;

  if (CoreFollowUpLibrary_sOnce != -1)
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_1033);
  result = objc_getClass("FLFollowUpController");
  classFLFollowUpController = (uint64_t)result;
  getFLFollowUpControllerClass = (uint64_t (*)())FLFollowUpControllerFunction;
  return result;
}

id FLFollowUpControllerFunction()
{
  return (id)classFLFollowUpController;
}

Class initSUICDefaultVoicePreviewer()
{
  Class result;

  if (SiriUICoreLibrary_sOnce != -1)
    dispatch_once(&SiriUICoreLibrary_sOnce, &__block_literal_global_1036);
  result = objc_getClass("SUICDefaultVoicePreviewer");
  classSUICDefaultVoicePreviewer = (uint64_t)result;
  getSUICDefaultVoicePreviewerClass = (uint64_t (*)())SUICDefaultVoicePreviewerFunction;
  return result;
}

id SUICDefaultVoicePreviewerFunction()
{
  return (id)classSUICDefaultVoicePreviewer;
}

Class initAFVoiceInfo()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  result = objc_getClass("AFVoiceInfo");
  classAFVoiceInfo = (uint64_t)result;
  getAFVoiceInfoClass = (uint64_t (*)())AFVoiceInfoFunction;
  return result;
}

id AFVoiceInfoFunction()
{
  return (id)classAFVoiceInfo;
}

void initAFPreferencesSetHorsemanSupplementalLanguageDictionary(void *a1)
{
  uint64_t v1;
  id v2;

  v1 = AssistantServicesLibrary_sOnce;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary[0] = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib, "AFPreferencesSetHorsemanSupplementalLanguageDictionary");
  ((void (*)(id))softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary[0])(v2);

}

Class initAFConnection()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  result = objc_getClass("AFConnection");
  classAFConnection = (uint64_t)result;
  getAFConnectionClass = (uint64_t (*)())AFConnectionFunction;
  return result;
}

id AFConnectionFunction()
{
  return (id)classAFConnection;
}

Class initAFLocalization()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  result = objc_getClass("AFLocalization");
  classAFLocalization = (uint64_t)result;
  getAFLocalizationClass = (uint64_t (*)())AFLocalizationFunction;
  return result;
}

id AFLocalizationFunction()
{
  return (id)classAFLocalization;
}

uint64_t initAFPreferencesSupportedLanguages()
{
  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  softLinkAFPreferencesSupportedLanguages = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib, "AFPreferencesSupportedLanguages");
  return softLinkAFPreferencesSupportedLanguages();
}

Class initAFPreferences()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  result = objc_getClass("AFPreferences");
  classAFPreferences = (uint64_t)result;
  getAFPreferencesClass = (uint64_t (*)())AFPreferencesFunction;
  return result;
}

id AFPreferencesFunction()
{
  return (id)classAFPreferences;
}

Class initAFSettingsConnection()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_1039);
  result = objc_getClass("AFSettingsConnection");
  classAFSettingsConnection = (uint64_t)result;
  getAFSettingsConnectionClass = (uint64_t (*)())AFSettingsConnectionFunction;
  return result;
}

id AFSettingsConnectionFunction()
{
  return (id)classAFSettingsConnection;
}

Class initICCloudClient()
{
  Class result;

  if (iTunesCloudLibrary_sOnce != -1)
    dispatch_once(&iTunesCloudLibrary_sOnce, &__block_literal_global_1048);
  result = objc_getClass("ICCloudClient");
  classICCloudClient = (uint64_t)result;
  getICCloudClientClass = (uint64_t (*)())ICCloudClientFunction;
  return result;
}

id ICCloudClientFunction()
{
  return (id)classICCloudClient;
}

void *__iTunesCloudLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 2);
  iTunesCloudLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_22F76EA7C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22F7702D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_22F772968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22F78E664(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

const char *SFDeviceSetupProgressEventToString(int a1)
{
  const char *result;

  if (a1 > 299)
  {
    if (a1 <= 799)
    {
      if (a1 <= 519)
      {
        if (a1 <= 410)
        {
          if (a1 <= 399)
          {
            if (a1 == 300)
              return "BackupProgress";
            if (a1 == 310)
              return "SyncProgress";
          }
          else
          {
            switch(a1)
            {
              case 400:
                return "StopSetup";
              case 401:
                return "PINPair";
              case 410:
                return "MigrateStart";
            }
          }
        }
        else if (a1 > 430)
        {
          switch(a1)
          {
            case 431:
              return "eSimExternal2FAStop";
            case 500:
              return "SiriWelcome";
            case 510:
              return "SiriDialogA";
          }
        }
        else
        {
          switch(a1)
          {
            case 411:
              return "MigrateStop";
            case 420:
              return "FileTransferReady";
            case 430:
              return "eSimExternal2FAStart";
          }
        }
      }
      else if (a1 > 559)
      {
        if (a1 > 599)
        {
          switch(a1)
          {
            case 600:
              return "SiriSkipDemo";
            case 700:
              return "StopSetupLEDs";
            case 710:
              return "AudioPasscodeEnded";
          }
        }
        else
        {
          switch(a1)
          {
            case 560:
              return "SiriDialogCMusic";
            case 570:
              return "SiriDialogCNews";
            case 580:
              return "SiriDialogCWeather";
          }
        }
      }
      else if (a1 > 549)
      {
        switch(a1)
        {
          case 550:
            return "SiriDialogBWeather";
          case 555:
            return "SiriDialogBClock";
          case 558:
            return "SiriDialogBMusic";
        }
      }
      else
      {
        switch(a1)
        {
          case 520:
            return "SiriDialogBStart";
          case 530:
            return "SiriDialogBHome";
          case 540:
            return "SiriDialogBNews";
        }
      }
      return "?";
    }
    if (a1 > 999)
    {
      if (a1 <= 1099)
      {
        if (a1 == 1000)
          return "SecureIntentStart";
        if (a1 == 1001)
          return "SecureIntentFinish";
      }
      else
      {
        switch(a1)
        {
          case 1100:
            return "OneTimeCodeDetected";
          case 2000:
            return "DependentStart";
          case 2001:
            return "DependentEnd";
        }
      }
      return "?";
    }
    switch(a1)
    {
      case 900:
        result = "SU-No-SetupScanAttempt";
        break;
      case 901:
        result = "SU-No-SetupStatusUpdate";
        break;
      case 902:
        result = "SU-No-SetupWipeWifi";
        break;
      case 903:
        result = "SU-No-SetupCancelled";
        break;
      case 904:
        result = "SU-No-SetupObliterate";
        break;
      case 905:
        result = "SU-No-SetupCannotCancel";
        break;
      case 906:
        result = "SysDrop AirDrop Event";
        break;
      case 907:
        result = "SysDrop Sysdiagnose Event";
        break;
      case 908:
        result = "SysDrop Cancel Event";
        break;
      case 909:
        result = "File Transfer Progress Event";
        break;
      case 910:
        result = "File Transfer Completed Event";
        break;
      case 911:
        result = "iOSWiFiSetup";
        break;
      case 912:
        result = "HKPrimaryResidentSSIDFetchStart";
        break;
      default:
        switch(a1)
        {
          case 800:
            result = "AuthAccountsStart";
            break;
          case 803:
            result = "AuthAccountsiCloudProgress";
            break;
          case 804:
            result = "AuthAccountsStoreProgress";
            break;
          case 805:
            result = "AuthAccountsGameCenterProgress";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  else if (a1 > 129)
  {
    if (a1 > 249)
    {
      switch(a1)
      {
        case 260:
          result = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          return "?";
        case 264:
          result = "TVLSFinish";
          break;
        case 270:
          result = "TVLSEstimateStart";
          break;
        case 272:
          result = "TVLSEstimateFinal";
          break;
        case 274:
          result = "TVLSEstimateFailed";
          break;
        case 276:
          result = "TVLSTryAgain";
          break;
        case 277:
          result = "TVLSToneBegan";
          break;
        case 278:
          result = "TVLCalStart";
          break;
        case 279:
          result = "TVLCalStep";
          break;
        case 280:
          result = "TVLCalFailed";
          break;
        case 281:
          result = "TVLCalTryAgain";
          break;
        case 282:
          result = "TVLCalFinal";
          break;
        default:
          if (a1 != 250)
            return "?";
          result = "ReportSuccess";
          break;
      }
    }
    else
    {
      if (a1 <= 219)
      {
        if (a1 <= 149)
        {
          if (a1 == 130)
            return "WiFiPoweredOff";
          if (a1 == 140)
            return "RecognizeVoice";
        }
        else
        {
          switch(a1)
          {
            case 150:
              return "SiriForEveryone";
            case 200:
              return "WiFiStart";
            case 210:
              return "ActivationStart";
          }
        }
        return "?";
      }
      switch(a1)
      {
        case 230:
          return "HomeKitStart";
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          return "?";
        case 234:
          return "HomeKitSetupStart";
        case 236:
          return "CDPSetupStart";
        case 240:
          return "BuddyStarting";
        case 241:
          return "BuddyProgress";
        case 242:
          return "BuddyFinished";
        default:
          if (a1 == 220)
          {
            result = "iCloudStart";
          }
          else
          {
            if (a1 != 224)
              return "?";
            result = "AppleIDSetupStart";
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 79)
    {
      if (a1 > 49)
      {
        if (a1 > 64)
        {
          if (a1 == 65)
            return "SecurityAPCLoopStart";
          if (a1 == 70)
            return "SecurityFinish";
        }
        else
        {
          if (a1 == 50)
            return "PreAuthFinish";
          if (a1 == 60)
            return "SecurityStart";
        }
      }
      else
      {
        if (a1 > 29)
        {
          switch(a1)
          {
            case 30:
              result = "Error";
              break;
            case 31:
              result = "SessionStarted";
              break;
            case 32:
              result = "SessionEnded";
              break;
            case 33:
              result = "SessionSecured";
              break;
            case 35:
              result = "ConnectStart";
              break;
            case 40:
              result = "PreAuthStart";
              break;
            default:
              return "?";
          }
          return result;
        }
        switch(a1)
        {
          case 0:
            return "Invalid";
          case 10:
            return "Start";
          case 20:
            return "Final";
        }
      }
      return "?";
    }
    if (a1 > 119)
    {
      switch(a1)
      {
        case 'x':
          return "CheckingiCloud";
        case 'z':
          return "CheckingAppleMusic";
        case '|':
          return "CheckingAccount";
      }
      return "?";
    }
    switch(a1)
    {
      case 'P':
        result = "BasicConfigStart";
        break;
      case 'Z':
        result = "BasicConfigFinish";
        break;
      case '\\':
        result = "StepStart";
        break;
      case '^':
        result = "StepFinish";
        break;
      case '_':
        result = "PreFinish";
        break;
        result = "SetupFinished";
        break;
      case 'a':
        result = "SetupResumed";
        break;
      case 'b':
        result = "SetupSuspend";
        break;
      case 'c':
        result = "SetupPeerSWUpdate";
        break;
      case 'd':
        result = "Finished";
        break;
      default:
        return "?";
    }
  }
  return result;
}

Class initAFSettingsConnection_0()
{
  Class result;

  if (AssistantServicesLibrary_sOnce_0 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_2560);
  result = objc_getClass("AFSettingsConnection");
  classAFSettingsConnection_0 = (uint64_t)result;
  getAFSettingsConnectionClass_0[0] = (uint64_t (*)())AFSettingsConnectionFunction_0;
  return result;
}

id AFSettingsConnectionFunction_0()
{
  return (id)classAFSettingsConnection_0;
}

Class initSSAccountStore()
{
  Class result;

  if (StoreServicesLibrary_sOnce != -1)
    dispatch_once(&StoreServicesLibrary_sOnce, &__block_literal_global_2563);
  result = objc_getClass("SSAccountStore");
  classSSAccountStore = (uint64_t)result;
  getSSAccountStoreClass[0] = (uint64_t (*)())SSAccountStoreFunction;
  return result;
}

id SSAccountStoreFunction()
{
  return (id)classSSAccountStore;
}

id initValAVAudioSessionInterruptionNotification()
{
  id *v0;

  if (AVFoundationLibrary_sOnce != -1)
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_2566);
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionInterruptionNotification");
  if (v0)
    objc_storeStrong((id *)&constantValAVAudioSessionInterruptionNotification, *v0);
  getAVAudioSessionInterruptionNotification[0] = (uint64_t (*)())AVAudioSessionInterruptionNotificationFunction;
  return (id)constantValAVAudioSessionInterruptionNotification;
}

id AVAudioSessionInterruptionNotificationFunction()
{
  return (id)constantValAVAudioSessionInterruptionNotification;
}

Class initSKCloudServiceController()
{
  Class result;

  if (StoreKitLibrary_sOnce != -1)
    dispatch_once(&StoreKitLibrary_sOnce, &__block_literal_global_2569);
  result = objc_getClass("SKCloudServiceController");
  classSKCloudServiceController = (uint64_t)result;
  getSKCloudServiceControllerClass[0] = (uint64_t (*)())SKCloudServiceControllerFunction;
  return result;
}

id SKCloudServiceControllerFunction()
{
  return (id)classSKCloudServiceController;
}

Class initHFUtilities()
{
  Class result;

  if (HomeLibrary_sOnce != -1)
    dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_2572);
  result = objc_getClass("HFUtilities");
  classHFUtilities = (uint64_t)result;
  getHFUtilitiesClass[0] = (uint64_t (*)())HFUtilitiesFunction;
  return result;
}

id HFUtilitiesFunction()
{
  return (id)classHFUtilities;
}

Class initAFPreferences_0()
{
  Class result;

  if (AssistantServicesLibrary_sOnce_0 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_2560);
  result = objc_getClass("AFPreferences");
  classAFPreferences_0 = (uint64_t)result;
  getAFPreferencesClass_0[0] = (uint64_t (*)())AFPreferencesFunction_0;
  return result;
}

id AFPreferencesFunction_0()
{
  return (id)classAFPreferences_0;
}

Class initAFVoiceInfo_0()
{
  Class result;

  if (AssistantServicesLibrary_sOnce_0 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_2560);
  result = objc_getClass("AFVoiceInfo");
  classAFVoiceInfo_0 = (uint64_t)result;
  getAFVoiceInfoClass_0[0] = (uint64_t (*)())AFVoiceInfoFunction_0;
  return result;
}

id AFVoiceInfoFunction_0()
{
  return (id)classAFVoiceInfo_0;
}

Class initCLLocationManager_0()
{
  Class result;

  if (CoreLocationLibrary_sOnce_0 != -1)
    dispatch_once(&CoreLocationLibrary_sOnce_0, &__block_literal_global_2587);
  result = objc_getClass("CLLocationManager");
  classCLLocationManager_0 = (uint64_t)result;
  getCLLocationManagerClass_0[0] = (uint64_t (*)())CLLocationManagerFunction_0;
  return result;
}

id CLLocationManagerFunction_0()
{
  return (id)classCLLocationManager_0;
}

Class initFMFSession()
{
  Class result;

  if (FMFLibrary_sOnce != -1)
    dispatch_once(&FMFLibrary_sOnce, &__block_literal_global_2590);
  result = objc_getClass("FMFSession");
  classFMFSession = (uint64_t)result;
  getFMFSessionClass[0] = (uint64_t (*)())FMFSessionFunction;
  return result;
}

id FMFSessionFunction()
{
  return (id)classFMFSession;
}

Class initAARemoteServer()
{
  Class result;

  if (AppleAccountLibrary_sOnce != -1)
    dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_2593);
  result = objc_getClass("AARemoteServer");
  classAARemoteServer = (uint64_t)result;
  getAARemoteServerClass[0] = (uint64_t (*)())AARemoteServerFunction;
  return result;
}

id AARemoteServerFunction()
{
  return (id)classAARemoteServer;
}

Class initAKAccountManager()
{
  Class result;

  if (AuthKitLibrary_sOnce != -1)
    dispatch_once(&AuthKitLibrary_sOnce, &__block_literal_global_2605);
  result = objc_getClass("AKAccountManager");
  classAKAccountManager = (uint64_t)result;
  getAKAccountManagerClass[0] = (uint64_t (*)())AKAccountManagerFunction;
  return result;
}

id AKAccountManagerFunction()
{
  return (id)classAKAccountManager;
}

id initValkAccountDataclassHome()
{
  id *v0;

  if (AccountsLibrary_sOnce != -1)
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_2608);
  v0 = (id *)dlsym((void *)AccountsLibrary_sLib, "kAccountDataclassHome");
  if (v0)
    objc_storeStrong((id *)&constantValkAccountDataclassHome, *v0);
  getkAccountDataclassHome[0] = (uint64_t (*)())kAccountDataclassHomeFunction;
  return (id)constantValkAccountDataclassHome;
}

id kAccountDataclassHomeFunction()
{
  return (id)constantValkAccountDataclassHome;
}

Class initCDPAccount()
{
  Class result;

  if (CoreCDPLibrary_sOnce != -1)
    dispatch_once(&CoreCDPLibrary_sOnce, &__block_literal_global_2611);
  result = objc_getClass("CDPAccount");
  classCDPAccount = (uint64_t)result;
  getCDPAccountClass[0] = (uint64_t (*)())CDPAccountFunction;
  return result;
}

id CDPAccountFunction()
{
  return (id)classCDPAccount;
}

Class initVTPreferences_0()
{
  Class result;

  if (VoiceTriggerLibrary_sOnce_0 != -1)
    dispatch_once(&VoiceTriggerLibrary_sOnce_0, &__block_literal_global_2614);
  result = objc_getClass("VTPreferences");
  classVTPreferences_0 = (uint64_t)result;
  getVTPreferencesClass_0[0] = (uint64_t (*)())VTPreferencesFunction_0;
  return result;
}

id VTPreferencesFunction_0()
{
  return (id)classVTPreferences_0;
}

uint64_t initAFPreferencesHorsemanSupplementalLanguageDictionary()
{
  if (AssistantServicesLibrary_sOnce_0 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_2560);
  softLinkAFPreferencesHorsemanSupplementalLanguageDictionary[0] = (uint64_t (*)())dlsym((void *)AssistantServicesLibrary_sLib_0, "AFPreferencesHorsemanSupplementalLanguageDictionary");
  return softLinkAFPreferencesHorsemanSupplementalLanguageDictionary[0]();
}

Class initCDPWalrusStateController()
{
  Class result;

  if (CoreCDPLibrary_sOnce != -1)
    dispatch_once(&CoreCDPLibrary_sOnce, &__block_literal_global_2611);
  result = objc_getClass("CDPWalrusStateController");
  classCDPWalrusStateController = (uint64_t)result;
  getCDPWalrusStateControllerClass[0] = (uint64_t (*)())CDPWalrusStateControllerFunction;
  return result;
}

id CDPWalrusStateControllerFunction()
{
  return (id)classCDPWalrusStateController;
}

Class initSSRVoiceProfileManager()
{
  Class result;

  if (SpeakerRecognitionLibrary_sOnce != -1)
    dispatch_once(&SpeakerRecognitionLibrary_sOnce, &__block_literal_global_2630);
  result = objc_getClass("SSRVoiceProfileManager");
  classSSRVoiceProfileManager = (uint64_t)result;
  getSSRVoiceProfileManagerClass[0] = (uint64_t (*)())SSRVoiceProfileManagerFunction;
  return result;
}

id SSRVoiceProfileManagerFunction()
{
  return (id)classSSRVoiceProfileManager;
}

Class initAFEnablementFlowConfigurationProvider()
{
  Class result;

  if (AssistantServicesLibrary_sOnce_0 != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce_0, &__block_literal_global_2560);
  result = objc_getClass("AFEnablementFlowConfigurationProvider");
  classAFEnablementFlowConfigurationProvider = (uint64_t)result;
  getAFEnablementFlowConfigurationProviderClass[0] = (uint64_t (*)())AFEnablementFlowConfigurationProviderFunction;
  return result;
}

id AFEnablementFlowConfigurationProviderFunction()
{
  return (id)classAFEnablementFlowConfigurationProvider;
}

Class initAKAppleIDAuthenticationInAppContext()
{
  Class result;

  if (AuthKitUILibrary_sOnce != -1)
    dispatch_once(&AuthKitUILibrary_sOnce, &__block_literal_global_2641);
  result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  classAKAppleIDAuthenticationInAppContext = (uint64_t)result;
  getAKAppleIDAuthenticationInAppContextClass[0] = (uint64_t (*)())AKAppleIDAuthenticationInAppContextFunction;
  return result;
}

id AKAppleIDAuthenticationInAppContextFunction()
{
  return (id)classAKAppleIDAuthenticationInAppContext;
}

Class initAPCListener()
{
  Class result;

  if (AudioPasscodeLibrary_sOnce_0 != -1)
    dispatch_once(&AudioPasscodeLibrary_sOnce_0, &__block_literal_global_2644);
  result = objc_getClass("APCListener");
  classAPCListener = (uint64_t)result;
  getAPCListenerClass[0] = (uint64_t (*)())APCListenerFunction;
  return result;
}

id APCListenerFunction()
{
  return (id)classAPCListener;
}

id initValAVAudioSessionCategoryAmbient()
{
  id *v0;

  if (AVFoundationLibrary_sOnce != -1)
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_2566);
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionCategoryAmbient");
  if (v0)
    objc_storeStrong((id *)&constantValAVAudioSessionCategoryAmbient, *v0);
  getAVAudioSessionCategoryAmbient[0] = (uint64_t (*)())AVAudioSessionCategoryAmbientFunction;
  return (id)constantValAVAudioSessionCategoryAmbient;
}

id AVAudioSessionCategoryAmbientFunction()
{
  return (id)constantValAVAudioSessionCategoryAmbient;
}

id initValAVAudioSessionModeDefault()
{
  id *v0;

  if (AVFoundationLibrary_sOnce != -1)
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_2566);
  v0 = (id *)dlsym((void *)AVFoundationLibrary_sLib, "AVAudioSessionModeDefault");
  if (v0)
    objc_storeStrong((id *)&constantValAVAudioSessionModeDefault, *v0);
  getAVAudioSessionModeDefault[0] = (uint64_t (*)())AVAudioSessionModeDefaultFunction;
  return (id)constantValAVAudioSessionModeDefault;
}

id AVAudioSessionModeDefaultFunction()
{
  return (id)constantValAVAudioSessionModeDefault;
}

uint64_t init_AXSVoiceOverTouchEnabled()
{
  if (AccessibilityLibrary_sOnce_0 != -1)
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_2649);
  softLink_AXSVoiceOverTouchEnabled[0] = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSVoiceOverTouchEnabled");
  return softLink_AXSVoiceOverTouchEnabled[0]();
}

uint64_t init_AXSVoiceOverTouchSpeakingRate()
{
  if (AccessibilityLibrary_sOnce_0 != -1)
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_2649);
  softLink_AXSVoiceOverTouchSpeakingRate[0] = (uint64_t (*)())dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSVoiceOverTouchSpeakingRate");
  return softLink_AXSVoiceOverTouchSpeakingRate[0]();
}

Class initAXSettings_0()
{
  Class result;

  if (AccessibilityUtilitiesLibrary_sOnce_0 != -1)
    dispatch_once(&AccessibilityUtilitiesLibrary_sOnce_0, &__block_literal_global_2653);
  result = objc_getClass("AXSettings");
  classAXSettings_0 = (uint64_t)result;
  getAXSettingsClass_0[0] = (uint64_t (*)())AXSettingsFunction_0;
  return result;
}

id AXSettingsFunction_0()
{
  return (id)classAXSettings_0;
}

uint64_t initTMIsAutomaticTimeEnabled()
{
  if (CoreTimeLibrary_sOnce_0 != -1)
    dispatch_once(&CoreTimeLibrary_sOnce_0, &__block_literal_global_2656);
  softLinkTMIsAutomaticTimeEnabled[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib_0, "TMIsAutomaticTimeEnabled");
  return softLinkTMIsAutomaticTimeEnabled[0]();
}

uint64_t initTMIsAutomaticTimeZoneEnabled()
{
  if (CoreTimeLibrary_sOnce_0 != -1)
    dispatch_once(&CoreTimeLibrary_sOnce_0, &__block_literal_global_2656);
  softLinkTMIsAutomaticTimeZoneEnabled[0] = (uint64_t (*)())dlsym((void *)CoreTimeLibrary_sLib_0, "TMIsAutomaticTimeZoneEnabled");
  return softLinkTMIsAutomaticTimeZoneEnabled[0]();
}

Class initTROperationQueue_0()
{
  Class result;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  result = objc_getClass("TROperationQueue");
  classTROperationQueue_0 = (uint64_t)result;
  getTROperationQueueClass_0[0] = (uint64_t (*)())TROperationQueueFunction_0;
  return result;
}

id TROperationQueueFunction_0()
{
  return (id)classTROperationQueue_0;
}

Class initTRSetupConfigurationOperation()
{
  Class result;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  result = objc_getClass("TRSetupConfigurationOperation");
  classTRSetupConfigurationOperation = (uint64_t)result;
  getTRSetupConfigurationOperationClass[0] = (uint64_t (*)())TRSetupConfigurationOperationFunction;
  return result;
}

id TRSetupConfigurationOperationFunction()
{
  return (id)classTRSetupConfigurationOperation;
}

id initValTRSetupConfigurationOperationNeedsNetworkKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationNeedsNetworkKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationNeedsNetworkKey, *v0);
  getTRSetupConfigurationOperationNeedsNetworkKey[0] = (uint64_t (*)())TRSetupConfigurationOperationNeedsNetworkKeyFunction;
  return (id)constantValTRSetupConfigurationOperationNeedsNetworkKey;
}

id TRSetupConfigurationOperationNeedsNetworkKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationNeedsNetworkKey;
}

id initValTRSetupConfigurationOperationUnauthenticatedServicesKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationUnauthenticatedServicesKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationUnauthenticatedServicesKey, *v0);
  getTRSetupConfigurationOperationUnauthenticatedServicesKey[0] = (uint64_t (*)())TRSetupConfigurationOperationUnauthenticatedServicesKeyFunction;
  return (id)constantValTRSetupConfigurationOperationUnauthenticatedServicesKey;
}

id TRSetupConfigurationOperationUnauthenticatedServicesKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationUnauthenticatedServicesKey;
}

id initValTRSetupConfigurationOperationUseAIDAKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRSetupConfigurationOperationUseAIDAKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRSetupConfigurationOperationUseAIDAKey, *v0);
  getTRSetupConfigurationOperationUseAIDAKey[0] = (uint64_t (*)())TRSetupConfigurationOperationUseAIDAKeyFunction;
  return (id)constantValTRSetupConfigurationOperationUseAIDAKey;
}

id TRSetupConfigurationOperationUseAIDAKeyFunction()
{
  return (id)constantValTRSetupConfigurationOperationUseAIDAKey;
}

Class initTRActivationOperation()
{
  Class result;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  result = objc_getClass("TRActivationOperation");
  classTRActivationOperation = (uint64_t)result;
  getTRActivationOperationClass[0] = (uint64_t (*)())TRActivationOperationFunction;
  return result;
}

id TRActivationOperationFunction()
{
  return (id)classTRActivationOperation;
}

id initValTRActivationOperationIsActivatedKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRActivationOperationIsActivatedKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRActivationOperationIsActivatedKey, *v0);
  getTRActivationOperationIsActivatedKey[0] = (uint64_t (*)())TRActivationOperationIsActivatedKeyFunction;
  return (id)constantValTRActivationOperationIsActivatedKey;
}

id TRActivationOperationIsActivatedKeyFunction()
{
  return (id)constantValTRActivationOperationIsActivatedKey;
}

id initValTRActivationOperationErrorKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRActivationOperationErrorKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRActivationOperationErrorKey, *v0);
  getTRActivationOperationErrorKey[0] = (uint64_t (*)())TRActivationOperationErrorKeyFunction;
  return (id)constantValTRActivationOperationErrorKey;
}

id TRActivationOperationErrorKeyFunction()
{
  return (id)constantValTRActivationOperationErrorKey;
}

Class initTRAuthenticationOperation()
{
  Class result;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  result = objc_getClass("TRAuthenticationOperation");
  classTRAuthenticationOperation = (uint64_t)result;
  getTRAuthenticationOperationClass[0] = (uint64_t (*)())TRAuthenticationOperationFunction;
  return result;
}

id TRAuthenticationOperationFunction()
{
  return (id)classTRAuthenticationOperation;
}

id initValTRAuthenticationOperationUnauthenticatedServicesKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRAuthenticationOperationUnauthenticatedServicesKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRAuthenticationOperationUnauthenticatedServicesKey, *v0);
  getTRAuthenticationOperationUnauthenticatedServicesKey[0] = (uint64_t (*)())TRAuthenticationOperationUnauthenticatedServicesKeyFunction;
  return (id)constantValTRAuthenticationOperationUnauthenticatedServicesKey;
}

id TRAuthenticationOperationUnauthenticatedServicesKeyFunction()
{
  return (id)constantValTRAuthenticationOperationUnauthenticatedServicesKey;
}

id initValTRAuthenticationOperationErrorKey()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TRAuthenticationOperationErrorKey");
  if (v0)
    objc_storeStrong((id *)&constantValTRAuthenticationOperationErrorKey, *v0);
  getTRAuthenticationOperationErrorKey[0] = (uint64_t (*)())TRAuthenticationOperationErrorKeyFunction;
  return (id)constantValTRAuthenticationOperationErrorKey;
}

id TRAuthenticationOperationErrorKeyFunction()
{
  return (id)constantValTRAuthenticationOperationErrorKey;
}

id initValTROperationErrorDomain()
{
  id *v0;

  if (TouchRemoteLibrary_sOnce_0 != -1)
    dispatch_once(&TouchRemoteLibrary_sOnce_0, &__block_literal_global_2660);
  v0 = (id *)dlsym((void *)TouchRemoteLibrary_sLib_0, "TROperationErrorDomain");
  if (v0)
    objc_storeStrong((id *)&constantValTROperationErrorDomain, *v0);
  getTROperationErrorDomain[0] = (uint64_t (*)())TROperationErrorDomainFunction;
  return (id)constantValTROperationErrorDomain;
}

id TROperationErrorDomainFunction()
{
  return (id)constantValTROperationErrorDomain;
}

uint64_t initIDSCopyLocalDeviceUniqueID()
{
  if (IDSLibrary_sOnce != -1)
    dispatch_once(&IDSLibrary_sOnce, &__block_literal_global_2674);
  softLinkIDSCopyLocalDeviceUniqueID = (uint64_t (*)())dlsym((void *)IDSLibrary_sLib, "IDSCopyLocalDeviceUniqueID");
  return softLinkIDSCopyLocalDeviceUniqueID();
}

Class initAMSDevice()
{
  Class result;

  if (AppleMediaServicesLibrary_sOnce != -1)
    dispatch_once(&AppleMediaServicesLibrary_sOnce, &__block_literal_global_2677);
  result = objc_getClass("AMSDevice");
  classAMSDevice = (uint64_t)result;
  getAMSDeviceClass[0] = (uint64_t (*)())AMSDeviceFunction;
  return result;
}

id AMSDeviceFunction()
{
  return (id)classAMSDevice;
}

Class initHMHomeManager_1()
{
  Class result;

  if (HomeKitLibrary_sOnce_1 != -1)
    dispatch_once(&HomeKitLibrary_sOnce_1, &__block_literal_global_2776);
  result = objc_getClass("HMHomeManager");
  classHMHomeManager_1 = (uint64_t)result;
  getHMHomeManagerClass_1[0] = (uint64_t (*)())HMHomeManagerFunction_1;
  return result;
}

id HMHomeManagerFunction_1()
{
  return (id)classHMHomeManager_1;
}

Class initAVAudioSession()
{
  Class result;

  if (AVFoundationLibrary_sOnce != -1)
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_2566);
  result = objc_getClass("AVAudioSession");
  classAVAudioSession = (uint64_t)result;
  getAVAudioSessionClass[0] = (uint64_t (*)())AVAudioSessionFunction;
  return result;
}

id AVAudioSessionFunction()
{
  return (id)classAVAudioSession;
}

Class initAVAudioPlayer()
{
  Class result;

  if (AVFoundationLibrary_sOnce != -1)
    dispatch_once(&AVFoundationLibrary_sOnce, &__block_literal_global_2566);
  result = objc_getClass("AVAudioPlayer");
  classAVAudioPlayer = (uint64_t)result;
  getAVAudioPlayerClass[0] = (uint64_t (*)())AVAudioPlayerFunction;
  return result;
}

id AVAudioPlayerFunction()
{
  return (id)classAVAudioPlayer;
}

id HDSLocalizedStringForKey(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24FCD5B38, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void HDSDispatchTimerSet(void *a1, double a2, double a3, double a4)
{
  unint64_t v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *source;

  v6 = (unint64_t)(a2 * 1000000000.0);
  source = a1;
  v7 = dispatch_time(0x8000000000000000, v6);
  if (a4 <= -10.0)
  {
    v8 = v6 / 0xA;
  }
  else if (a4 <= -4.0)
  {
    v8 = v6 >> 2;
  }
  else
  {
    v8 = (unint64_t)(a4 * 1000000000.0);
  }
  if (a3 < 0.0)
    v9 = -1;
  else
    v9 = (unint64_t)(a3 * 1000000000.0);
  dispatch_source_set_timer(source, v7, v9, v8);

}

BOOL HDSDeviceLocked()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

uint64_t HDSIsDevicePhone()
{
  if (HDSIsDevicePhone_onceToken != -1)
    dispatch_once(&HDSIsDevicePhone_onceToken, &__block_literal_global_7);
  return HDSIsDevicePhone_isPhone;
}

uint64_t HDSIsGreenTeaDevice()
{
  if (HDSIsGreenTeaDevice_onceToken != -1)
    dispatch_once(&HDSIsGreenTeaDevice_onceToken, &__block_literal_global_6);
  return HDSIsGreenTeaDevice_result;
}

id SVSLocalizedNameForDeviceClassCode(char a1)
{
  __CFString *v1;

  if ((a1 - 2) > 3u)
    v1 = CFSTR("iPhone");
  else
    v1 = off_24FCD5878[(char)(a1 - 2)];
  return SVSLocalizedStringEx(CFSTR("Localizable"), v1);
}

id SVSLocalizedString(void *a1)
{
  return SVSLocalizedStringEx(CFSTR("Localizable"), a1);
}

id SVSLocalizedStringEx(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SVSLocalizedStringEx2(v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id SVSLocalizedStringEx2(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (HDSIsGreenTeaDevice_onceToken != -1)
    dispatch_once(&HDSIsGreenTeaDevice_onceToken, &__block_literal_global_6);
  if (HDSIsGreenTeaDevice_result)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("_GT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v8, CFSTR("_GT"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "isEqual:", CFSTR("_GT")))
      goto LABEL_7;

  }
  v9 = 0;
LABEL_7:
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24FCD5B38, v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v9)
    v11 = v9;
  else
    v11 = v7;
  v12 = v11;

  return v12;
}

id SVSLocalizedStringV(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  id v15;

  v5 = a1;
  v6 = a2;
  SVSLocalizedStringEx(CFSTR("Localizable"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithValidatedFormat:validFormatSpecifiers:arguments:error:", v7, v6, a3, &v15);

  v9 = v15;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull SVSLocalizedStringV(NSString * _Nonnull __strong, NSString *__strong _Nonnull, va_list)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("Utilities.m"), 109, CFSTR("nil localized string for %@ key - %@"), v5, v9);

    v10 = v5;
  }
  v11 = v10;

  return v11;
}

id SVSLocalizedStringF(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SVSLocalizedStringV(a1, a2, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id SVSAddSuffixForCurrentDeviceClassAndProductName()
{
  void *v0;
  void *v1;

  CUAddSuffixForCurrentDeviceClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("_HOMEPOD"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id FrontBoardOpenURLOptions()
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE38310];
  v2[0] = *MEMORY[0x24BE38320];
  v2[1] = v0;
  v3[0] = MEMORY[0x24BDBD1C8];
  v3[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t SFTestFlagsFromString(void *a1)
{
  uint64_t v1;

  strlen((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
  v1 = 1;
  while (TextSep())
  {
    if (strnicmpx())
    {
      if (strnicmpx())
      {
        if (strnicmpx())
        {
          if (strnicmpx())
          {
            if (strnicmpx())
            {
              if (strnicmpx())
              {
                if (strnicmpx())
                {
                  if (strnicmpx())
                  {
                    if (strnicmpx())
                    {
                      if (strnicmpx())
                      {
                        if (strnicmpx())
                        {
                          if (strnicmpx())
                          {
                            if (strnicmpx())
                            {
                              if (strnicmpx())
                              {
                                if (strnicmpx())
                                {
                                  if (strnicmpx())
                                  {
                                    if (strnicmpx())
                                    {
                                      if (strnicmpx())
                                      {
                                        if (strnicmpx())
                                        {
                                          if (strnicmpx())
                                          {
                                            if (strnicmpx())
                                            {
                                              if (strnicmpx())
                                              {
                                                if (strnicmpx())
                                                {
                                                  if (strnicmpx())
                                                  {
                                                    if (strnicmp_prefix())
                                                    {
                                                      if (strnicmp_prefix())
                                                      {
                                                        if (strnicmp_prefix())
                                                        {
                                                          if (strnicmp_prefix())
                                                          {
                                                            if (strnicmp_prefix())
                                                            {
                                                              if (strnicmp_prefix())
                                                              {
                                                                if (strnicmp_prefix())
                                                                {
                                                                  if (strnicmpx())
                                                                  {
                                                                    if (strnicmpx())
                                                                    {
                                                                      if (strnicmpx())
                                                                      {
                                                                        if (strnicmpx())
                                                                        {
                                                                          if (strnicmpx())
                                                                          {
                                                                            if (!strnicmpx())
                                                                              v1 |= 0x10000000000uLL;
                                                                          }
                                                                          else
                                                                          {
                                                                            v1 |= 0x1000000000uLL;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v1 |= 0x800000000uLL;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v1 |= 0x400000000uLL;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v1 |= 0x200000000uLL;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v1 |= 0x100000000uLL;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v1 |= 0x80000000uLL;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v1 |= 0x20000000uLL;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v1 |= 0x10000000uLL;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v1 |= 0x8000000uLL;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v1 |= 0x4000000uLL;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v1 |= 0x40000000uLL;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v1 |= 0x2000000uLL;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v1 |= 0x1000000uLL;
                                                  }
                                                }
                                                else
                                                {
                                                  v1 |= 0x800000uLL;
                                                }
                                              }
                                              else
                                              {
                                                v1 |= 0x400000uLL;
                                              }
                                            }
                                            else
                                            {
                                              v1 |= 0x200000uLL;
                                            }
                                          }
                                          else
                                          {
                                            v1 |= 0x100000uLL;
                                          }
                                        }
                                        else
                                        {
                                          v1 |= 0x80000uLL;
                                        }
                                      }
                                      else
                                      {
                                        v1 |= 0x40000uLL;
                                      }
                                    }
                                    else
                                    {
                                      v1 |= 0x20000uLL;
                                    }
                                  }
                                  else
                                  {
                                    v1 |= 0x10000uLL;
                                  }
                                }
                                else
                                {
                                  v1 |= 0x8000uLL;
                                }
                              }
                              else
                              {
                                v1 |= 0x4000uLL;
                              }
                            }
                            else
                            {
                              v1 |= 0x2000uLL;
                            }
                          }
                          else
                          {
                            v1 |= 0x1000uLL;
                          }
                        }
                        else
                        {
                          v1 |= 0x800uLL;
                        }
                      }
                      else
                      {
                        v1 |= 0x400uLL;
                      }
                    }
                    else
                    {
                      v1 |= 0x200uLL;
                    }
                  }
                  else
                  {
                    v1 |= 0x100uLL;
                  }
                }
                else
                {
                  v1 |= 0x80uLL;
                }
              }
              else
              {
                v1 |= 0x40uLL;
              }
            }
            else
            {
              v1 |= 0x20uLL;
            }
          }
          else
          {
            v1 |= 0x10uLL;
          }
        }
        else
        {
          v1 |= 8uLL;
        }
      }
      else
      {
        v1 |= 4uLL;
      }
    }
    else
    {
      v1 |= 2uLL;
    }
  }
  return v1;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x24BE28F90]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

uint64_t CFGetInt64()
{
  return MEMORY[0x24BE28FE0]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x24BE29088]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x24BE29098]();
}

uint64_t CFPrefs_SetDouble()
{
  return MEMORY[0x24BE290A8]();
}

uint64_t CFPrefs_SetInt64()
{
  return MEMORY[0x24BE290B0]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x24BE290B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x24BDBC400]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CUAddSuffixForCurrentDeviceClass()
{
  return MEMORY[0x24BE29108]();
}

uint64_t CUMainQueue()
{
  return MEMORY[0x24BE29160]();
}

uint64_t CUSetSystemName()
{
  return MEMORY[0x24BE29208]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x24BE29350]();
}

uint64_t FPrintF()
{
  return MEMORY[0x24BE29370]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x24BE29388]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t MAEActivateDeviceWithError()
{
  return MEMORY[0x24BE66A20]();
}

uint64_t MAECreateActivationRequestWithError()
{
  return MEMORY[0x24BE66A30]();
}

uint64_t MAECreateSessionRequestWithError()
{
  return MEMORY[0x24BE66A38]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x24BE29698]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x24BE296A8]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x24BE296B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringWithMACAddress()
{
  return MEMORY[0x24BE296E8]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t RandomString()
{
  return MEMORY[0x24BE29918]();
}

uint64_t SFDeviceIsVirtualMachine()
{
  return MEMORY[0x24BE90288]();
}

uint64_t SFDeviceModelCodeGet()
{
  return MEMORY[0x24BE90290]();
}

uint64_t SFDeviceSupportsTVAudio()
{
  return MEMORY[0x24BE902A0]();
}

uint64_t SUControllerStringForManagerState()
{
  return MEMORY[0x24BEAE7B8]();
}

uint64_t TextSep()
{
  return MEMORY[0x24BE29A88]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x24BE29AF0]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x24BE29B18]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x24BE679E8]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x24BE67A00]();
}

uint64_t _CSCopyLocalHostnameForComputerName()
{
  return MEMORY[0x24BDC15F8]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t isInternalBuild()
{
  return MEMORY[0x24BDD7B88]();
}

uint64_t lockdown_connect()
{
  return MEMORY[0x24BEDC4E0]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x24BEDC510]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x24BEDC538]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strnicmp_prefix()
{
  return MEMORY[0x24BE29C10]();
}

uint64_t strnicmpx()
{
  return MEMORY[0x24BE29C20]();
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t tzlink()
{
  return MEMORY[0x24BEDE518]();
}

