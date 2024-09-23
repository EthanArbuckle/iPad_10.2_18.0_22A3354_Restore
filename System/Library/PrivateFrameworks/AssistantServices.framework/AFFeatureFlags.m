@implementation AFFeatureFlags

+ (BOOL)isAccessibleAnnounceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriMUXEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriDataSharingRepromptEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12797);
  return (id)sharedInstance_sFeatureFlags;
}

+ (BOOL)isLocationSearchContinuityEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("assistant.service.location-search.continuity.enabled"), CFSTR("com.apple.assistant.features"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (void)setLocationSearchContinuityEnabled:(BOOL)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("assistant.service.location-search.continuity.enabled"), v3, CFSTR("com.apple.assistant.features"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.features"));

}

+ (id)featureFlags
{
  CFArrayRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  const __CFArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v2 = CFPreferencesCopyKeyList(CFSTR("com.apple.assistant.features"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v2;
    v3 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(obj);
          v7 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("X-Dev-ConfigOverride-"), v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)CFPreferencesCopyAppValue(v7, CFSTR("com.apple.assistant.features"));
          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
            objc_msgSend(v13, "setObject:forKey:", CFSTR("true"), v8);

        }
        v4 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v4);
    }

  }
  if (+[AFFeatureFlags isOlympusEnabled](AFFeatureFlags, "isOlympusEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("X-Dev-ConfigOverride-"), CFSTR("assistant.service.olympus.enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", CFSTR("true"), v10);

  }
  if (+[AFFeatureFlags isInfoDomainsRFEnabled](AFFeatureFlags, "isInfoDomainsRFEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("X-Dev-ConfigOverride-"), CFSTR("assistant.service.InfoDomainsRF.enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", CFSTR("true"), v11);

  }
  return v13;
}

+ (void)dump
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[AFFeatureFlags featureFlags](AFFeatureFlags, "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "+[AFFeatureFlags dump]";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }

}

void __32__AFFeatureFlags_sharedInstance__block_invoke()
{
  AFFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(AFFeatureFlags);
  v1 = (void *)sharedInstance_sFeatureFlags;
  sharedInstance_sFeatureFlags = (uint64_t)v0;

}

+ (BOOL)isAnnounceEnabled
{
  return objc_msgSend(getANAnnounceFeatureStatusClass(), "isEnabled");
}

+ (BOOL)isSiriXEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODAvailableForLanguage:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (isSiriUODAvailableForLanguage__once != -1)
    dispatch_once(&isSiriUODAvailableForLanguage__once, &__block_literal_global_32);
  if ((objc_msgSend((id)isSiriUODAvailableForLanguage__top13Locales, "containsObject:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend((id)isSiriUODAvailableForLanguage__bottom28Locales, "containsObject:", v3);

  return v4;
}

+ (BOOL)forceAsrOnServerForUOD
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAsrOnServerForUODEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODForceDisabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForWatchOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForMacOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODForceEnabledForDevice
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForWatchOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForMacOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForHomePod
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForRemora
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForATV
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationVoiceTriggerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationAutoPunctuationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationEmojiRecognitionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTrialDictationAssetDeliveryEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationVoiceCommandsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationUserEditClassificationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationEuclidAlternativesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHintsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAudioSessionCoordinationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isThemisABEnabled
{
  return 1;
}

+ (BOOL)isRemoraEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMyriadNonSpeakerRawScoreThresholdEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCaballeroEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLassoEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceTelephonyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceGroupFaceTimeInviteEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTimerAlarmCoordinationEnabled
{
  return 0;
}

+ (BOOL)isListeningOnBothStereoPairUnitsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHomeAutomationBackgroundRequestEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriRequestDispatcherEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceNotificationsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceTVControlEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceMediaControlFromWatchEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceMessagesInCarPlayEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceVoiceFollowUpEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceTVControlFromWatchEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isResponseFrameworkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBlushingPhantomEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBlindedSphinxEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTVPushToTalkEnabled
{
  return 0;
}

+ (BOOL)isDictationOnSRDEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTVPolyglotEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNotificationVoiceActionsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRingtoneOverA2DPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCDAFaceDetectionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDAFrameworkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDAProximityEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDATrialEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMyriadSelfMetricsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNanoSiriUIRefreshEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSDTForASREnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContinuousConversationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFileARadarSupported
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStationaryDeviceLocationManagerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUnifiedAssetNamespaceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRAdoptingUAFEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRSpeechProfileMigrationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRViaSpeechAPIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAudioAppPredictionOnHomePodEnabled
{
  void *v2;
  char v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.assistant"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("AudioAppPredictionHomePod"));
  v4 = _os_feature_enabled_impl() | v3;

  return v4;
}

+ (BOOL)isInfoDomainsRFEnabled
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

+ (BOOL)isTVAirPodsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOlympusEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriPommesEnabledForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (isSiriPommesEnabledForLanguage__once != -1)
  {
    dispatch_once(&isSiriPommesEnabledForLanguage__once, &__block_literal_global_197);
    if (v4)
      goto LABEL_3;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (!v3)
    goto LABEL_7;
LABEL_3:
  objc_msgSend((id)isSiriPommesEnabledForLanguage__supportByLanguage, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6 || !_os_feature_enabled_impl())
    goto LABEL_7;
  objc_msgSend((id)isSiriPommesEnabledForLanguage__supportByLanguage, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

LABEL_8:
  return v8;
}

+ (BOOL)isSiriPommesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMediaEntitySyncDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceArbitrationFeedbackEnabled
{
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal && (_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

+ (BOOL)isIntuitiveConversationAnnounceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStateFeedbackEnabled
{
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (AFIsHorseman_isHorseman)
    return 0;
  else
    return _os_feature_enabled_impl();
}

+ (BOOL)isNLServerFallbackDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDomainServerFallbackDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isServerFallbackDisabledWhenMissingAsset
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLServerFallbackDisabledWithExperiment
{
  return 1;
}

+ (BOOL)isNLServerFallbackDisabledForLocale:(id)a3
{
  return +[AFFeatureFlags isNLServerFallbackDisabled](AFFeatureFlags, "isNLServerFallbackDisabled", a3);
}

+ (BOOL)isDomainServerFallbackDisabledForLocale:(id)a3
{
  return +[AFFeatureFlags isDomainServerFallbackDisabled](AFFeatureFlags, "isDomainServerFallbackDisabled", a3);
}

+ (BOOL)isMultilingualResponseVariantSelectorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMedocFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMedocFeatureEnabledForHybridMode
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPatientSiriFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOptOutLogRedactionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNotifyConnectionIssuesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHSAnswerCallNotificationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isForceBLEDiscoveryForCompanionLinkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersonalRequestDefinedErrorDialogsServerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHighSpeedSiriTTSEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAWDLFallbackForPersonalRequestsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriEntityMatcherMigrationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLRouterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAssistantEngineEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAssistantEngineOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSystemAssistantExperienceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSAEOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOnDeviceHistoryDeletionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingInternalSettingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingInternalBuildRuleEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBobbleEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isIdentityBridgeInstrumentationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isIdentityScoreConsumptionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriCapellaEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnouncePolicyEnhancementsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriLocationServicesPromptingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isShimToolsEnabled
{
  return _os_feature_enabled_impl();
}

void __66__AFFeatureFlags_SWEFeatureFlags__isSiriPommesEnabledForLanguage___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  _QWORD v45[43];
  _QWORD v46[45];

  v46[43] = *MEMORY[0x1E0C80C00];
  v45[0] = CFSTR("en-US");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v44;
  v45[1] = CFSTR("zh-CN");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v43;
  v45[2] = CFSTR("en-GB");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v42;
  v45[3] = CFSTR("en-AU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v41;
  v45[4] = CFSTR("en-CA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v40;
  v45[5] = CFSTR("en-IN");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v39;
  v45[6] = CFSTR("de-DE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v38;
  v45[7] = CFSTR("ja-JP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v37;
  v45[8] = CFSTR("fr-FR");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v36;
  v45[9] = CFSTR("es-MX");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[9] = v35;
  v45[10] = CFSTR("es-ES");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[10] = v34;
  v45[11] = CFSTR("es-US");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[11] = v33;
  v45[12] = CFSTR("zh-HK");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[12] = v32;
  v45[13] = CFSTR("ar-SA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[13] = v31;
  v45[14] = CFSTR("en-SG");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[14] = v30;
  v45[15] = CFSTR("it-IT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[15] = v29;
  v45[16] = CFSTR("ko-KR");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[16] = v28;
  v45[17] = CFSTR("ru-RU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[17] = v27;
  v45[18] = CFSTR("tr-TR");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[18] = v26;
  v45[19] = CFSTR("yue-CN");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[19] = v25;
  v45[20] = CFSTR("zh-TW");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[20] = v24;
  v45[21] = CFSTR("da-DK");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[21] = v23;
  v45[22] = CFSTR("de-AT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[22] = v22;
  v45[23] = CFSTR("de-CH");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[23] = v21;
  v45[24] = CFSTR("en-IE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[24] = v20;
  v45[25] = CFSTR("en-NZ");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[25] = v19;
  v45[26] = CFSTR("en-ZA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[26] = v18;
  v45[27] = CFSTR("es-CL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[27] = v17;
  v45[28] = CFSTR("fi-FI");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[28] = v16;
  v45[29] = CFSTR("fr-BE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[29] = v15;
  v45[30] = CFSTR("fr-CA");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[30] = v14;
  v45[31] = CFSTR("fr-CH");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[31] = v13;
  v45[32] = CFSTR("he-IL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[32] = v12;
  v45[33] = CFSTR("it-CH");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[33] = v11;
  v45[34] = CFSTR("ms-MY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v46[34] = v0;
  v45[35] = CFSTR("nb-NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v46[35] = v1;
  v45[36] = CFSTR("nl-BE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v46[36] = v2;
  v45[37] = CFSTR("nl-NL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46[37] = v3;
  v45[38] = CFSTR("pt-BR");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[38] = v4;
  v45[39] = CFSTR("sv-SE");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[39] = v5;
  v45[40] = CFSTR("th-TH");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[40] = v6;
  v45[41] = CFSTR("id-ID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[41] = v7;
  v45[42] = CFSTR("vi-VN");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[42] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 43);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)isSiriPommesEnabledForLanguage__supportByLanguage;
  isSiriPommesEnabledForLanguage__supportByLanguage = v9;

}

void __65__AFFeatureFlags_SWEFeatureFlags__isSiriUODAvailableForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3AAA838);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSiriUODAvailableForLanguage__top13Locales;
  isSiriUODAvailableForLanguage__top13Locales = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3AAA850);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isSiriUODAvailableForLanguage__bottom28Locales;
  isSiriUODAvailableForLanguage__bottom28Locales = v2;

}

@end
