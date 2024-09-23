@implementation SRModeProvider

- (SRModeProvider)init
{
  SRModeProvider *v2;
  SRModeSystemState *v3;
  SRModeSystemState *systemState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRModeProvider;
  v2 = -[SRModeProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SRModeSystemState);
    systemState = v2->_systemState;
    v2->_systemState = v3;

  }
  return v2;
}

- (unint64_t)currentMode
{
  NSObject *v3;
  SRModeSystemState *systemState;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  SRModeSystemState *v11;
  int v13;
  const char *v14;
  __int16 v15;
  SRModeSystemState *v16;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    systemState = self->_systemState;
    v13 = 136315394;
    v14 = "-[SRModeProvider currentMode]";
    v15 = 2112;
    v16 = systemState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #modes %@", (uint8_t *)&v13, 0x16u);
  }
  v5 = -[SRModeProvider internalModeOverride](self, "internalModeOverride");
  if (v5 == -1)
  {
    if (-[SRModeSystemState isVoiceTriggerRequest](self->_systemState, "isVoiceTriggerRequest")
      || !-[SRModeSystemState userTypedInSiri](self->_systemState, "userTypedInSiri")
      && !-[SRModeSystemState userTouchedSnippet](self->_systemState, "userTouchedSnippet")
      && (-[SRModeSystemState isConnectedToCarPlay](self->_systemState, "isConnectedToCarPlay")
       || -[SRModeSystemState isForCarDND](self->_systemState, "isForCarDND")
       || -[SRModeSystemState isEyesFree](self->_systemState, "isEyesFree")
       || -[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory")
       || -[SRModeSystemState isScreenOffBeforeRequest](self->_systemState, "isScreenOffBeforeRequest")))
    {
      return 0;
    }
    else
    {
      return -[SRModeProvider _modeForSiriSettings](self, "_modeForSiriSettings");
    }
  }
  else
  {
    v6 = v5;
    v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("Voice");
      if (v6 == 1)
        v8 = CFSTR("Mixed");
      if (v6 == 2)
        v9 = CFSTR("Silent");
      else
        v9 = v8;
      v10 = v7;
      v11 = (SRModeSystemState *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SRMode"), "stringByAppendingString:", v9));
      v13 = 136315394;
      v14 = "-[SRModeProvider currentMode]";
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Override value being used: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  return v6;
}

- (unint64_t)_modeForSiriSettings
{
  unint64_t v4;

  if (-[SRModeSystemState isRequestEmergencyCall](self->_systemState, "isRequestEmergencyCall"))
    return 0;
  v4 = -[SRModeSystemState voiceFeedbackSetting](self->_systemState, "voiceFeedbackSetting");
  if (v4 != 1)
  {
    if (v4
      || -[SRModeSystemState isScreenOffBeforeRequest](self->_systemState, "isScreenOffBeforeRequest")
      && -[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory"))
    {
      return 1;
    }
    return 2;
  }
  if (-[SRModeSystemState isDeviceSilentMode](self->_systemState, "isDeviceSilentMode"))
    return 2;
  if (-[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction](self->_systemState, "isRequestMadeWithPhysicalDeviceInteraction"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)displayOnlyModeForInterstitialsAndErrors
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  const char *v8;
  NSObject *v9;
  unsigned __int8 v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  const char *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFAccessibilityObserver sharedObserver](AFAccessibilityObserver, "sharedObserver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "state"));
  v5 = objc_msgSend(v4, "isVoiceOverTouchEnabled");

  if (v5 == (id)2)
  {
    v6 = AFSiriLogContextConnection;
    v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for voiceover";
LABEL_9:
      v9 = v6;
      goto LABEL_10;
    }
  }
  else if (-[SRModeSystemState isConnectedToCarPlay](self->_systemState, "isConnectedToCarPlay")
         || -[SRModeSystemState isForCarDND](self->_systemState, "isForCarDND")
         || -[SRModeSystemState isEyesFree](self->_systemState, "isEyesFree"))
  {
    v6 = AFSiriLogContextConnection;
    v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for automotive config";
      goto LABEL_9;
    }
  }
  else
  {
    if (!-[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction](self->_systemState, "isRequestMadeWithPhysicalDeviceInteraction"))
    {
      v6 = AFSiriLogContextConnection;
      v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for no screen engagement";
      goto LABEL_9;
    }
    if ((id)-[SRModeSystemState voiceFeedbackSetting](self->_systemState, "voiceFeedbackSetting") == (id)2)
    {
      v6 = AFSiriLogContextConnection;
      v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for PreferSpokenResponses";
      goto LABEL_9;
    }
    if (-[SRModeSystemState isConnectedToAudioAccessory](self->_systemState, "isConnectedToAudioAccessory"))
    {
      v6 = AFSiriLogContextConnection;
      v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for audio accessory connected";
      goto LABEL_9;
    }
    v11 = -[SRModeSystemState isDeviceSilentMode](self->_systemState, "isDeviceSilentMode");
    v12 = AFSiriLogContextConnection;
    v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) == 0)
    {
      if (!v13)
        goto LABEL_11;
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for device not in silent mode";
      v9 = v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_11:
      v7 = 0;
      goto LABEL_12;
    }
    if (v13)
    {
      v14 = 136315138;
      v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #errorHandling #modes Suppressing interstitial and error TTS for DisplayOnly mode", (uint8_t *)&v14, 0xCu);
    }
    v7 = 1;
  }
LABEL_12:

  return v7;
}

- (BOOL)userTouchedSnippet
{
  return -[SRModeSystemState userTouchedSnippet](self->_systemState, "userTouchedSnippet");
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
  -[SRModeSystemState setUserTouchedSnippet:](self->_systemState, "setUserTouchedSnippet:", a3);
}

- (SASRequestOptions)requestOptions
{
  return -[SRModeSystemState requestOptions](self->_systemState, "requestOptions");
}

- (void)setRequestOptions:(id)a3
{
  -[SRModeSystemState setRequestOptions:](self->_systemState, "setRequestOptions:", a3);
}

- (void)_setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (unint64_t)internalModeOverride
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v7;

  if (!AFIsInternalInstall(self, a2))
    return -1;
  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("ModeOverride")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("silent")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("displayonly")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("mixed")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("displayforward")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("voice")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("voiceonly")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("voiceforward")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (v4)
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009E2D0((uint64_t)v4, v7);
    }
    v5 = -1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
}

@end
