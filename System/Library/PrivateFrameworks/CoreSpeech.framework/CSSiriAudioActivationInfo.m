@implementation CSSiriAudioActivationInfo

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;
  unsigned int v8;

  v8 = bswap32(-[CSSiriAudioActivationInfo _activationMode](self, "_activationMode"));
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)CSSiriAudioActivationInfo;
  -[CSSiriAudioActivationInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {activationMode = %.4s, deviceIdentifier = %@, activated = %d}"), v4, &v8, self->_deviceIdentifier, self->_isActivated);

  return v5;
}

- (CSSiriAudioActivationInfo)initWithSpeechRecordingMode:(int64_t)a3 clientConfiguration:(id)a4 experimentContext:(id)a5
{
  id v8;
  id v9;
  CSSiriAudioActivationInfo *v10;
  NSObject *v11;
  uint64_t v12;
  AFClientConfiguration *currentClientConfiguration;
  uint64_t v14;
  AFExperimentContext *experimentContext;
  int v16;
  uint64_t v17;
  CSAttSiriMagusSupportedPolicy *magusSupportedPolicy;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  CSSiriAudioActivationInfo *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSSiriAudioActivationInfo;
  v10 = -[CSSiriAudioActivationInfo init](&v20, sel_init);
  if (v10)
  {
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[CSSiriAudioActivationInfo initWithSpeechRecordingMode:clientConfiguration:experimentContext:]";
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s %p speechRecordingMode = %zd, clientConfiguration = %@", buf, 0x2Au);
    }
    v10->_speechRecordingMode = a3;
    v12 = objc_msgSend(v8, "copy");
    currentClientConfiguration = v10->_currentClientConfiguration;
    v10->_currentClientConfiguration = (AFClientConfiguration *)v12;

    v14 = objc_msgSend(v9, "copy");
    experimentContext = v10->_experimentContext;
    v10->_experimentContext = (AFExperimentContext *)v14;

    v10->_activationMode = 1752132965;
    v10->_csAudioRecordType = 0;
    v16 = AFIsHorseman();
    v10->_useBorealisBuffer = v16;
    if (v16)
    {
      v10->_activationMode = 1987012963;
      v10->_csAudioRecordType = 6;
    }
    +[CSAttSiriMagusSupportedPolicy sharedInstance](CSAttSiriMagusSupportedPolicy, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    magusSupportedPolicy = v10->_magusSupportedPolicy;
    v10->_magusSupportedPolicy = (CSAttSiriMagusSupportedPolicy *)v17;

  }
  return v10;
}

- (void)setSpeechRequestOptions:(id)a3 currentActivationInfo:(id)a4
{
  id v6;
  int64_t *v7;
  os_log_t *v8;
  NSObject *v9;
  int64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  _BOOL8 v14;
  int64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *deviceIdentifier;
  void *v23;
  AFLanguageDetectionUserContext *v24;
  AFLanguageDetectionUserContext *languageDetectionUserContext;
  NSUUID *v26;
  NSUUID *turnIdentifier;
  NSString *v28;
  NSString *applicationDisplayName;
  NSString *v30;
  NSString *applicationBundleIdentifier;
  float v32;
  float v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSDictionary *v38;
  NSDictionary *activationMetadata;
  unint64_t csAudioRecordType;
  void *v41;
  NSDictionary *v42;
  NSDictionary *v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int64_t *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (int64_t *)a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v47 = "-[CSSiriAudioActivationInfo setSpeechRequestOptions:currentActivationInfo:]";
    v48 = 2048;
    v49 = *(double *)&self;
    v50 = 2112;
    v51 = v6;
    v52 = 2112;
    v53 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s %p speechRequestOptions = %@, currentActivationInfo = %@", buf, 0x2Au);
  }
  v10 = objc_msgSend(v6, "activationEvent");
  objc_msgSend(v6, "activationEventTime");
  v12 = v11;
  self->_suppressStartAlert = objc_msgSend(v6, "suppressStartAlert");
  self->_speechEndpointerOperationMode = objc_msgSend(v6, "endpointerOperationMode");
  self->_speechRecordingAlertPolicy = (AFSpeechRecordingAlertPolicy *)(id)objc_msgSend(v6, "recordingAlertPolicy");
  if (objc_msgSend(v6, "useAutomaticEndpointing") && !self->_speechEndpointerOperationMode)
    self->_speechEndpointerOperationMode = 3;
  v13 = objc_msgSend(v6, "useBorealisBuffer");
  v14 = v13;
  if (v7 && !v10 && self->_useBorealisBuffer == (_DWORD)v13)
  {
    self->_activationMode = v7[1];
    self->_csAudioRecordType = v7[3];
LABEL_12:
    self->_speechRecordingMode = objc_msgSend(v7, "speechRecordingMode");
    goto LABEL_13;
  }
  v15 = 1987012963;
  v16 = v6;
  v17 = v16;
  if (!v14)
  {
    v15 = 1752132965;
    switch(objc_msgSend(v16, "activationEvent"))
    {
      case 2:
        v15 = 2003329648;
        break;
      case 3:
        v15 = 1651794544;
        break;
      case 4:
        v15 = 1969840752;
        break;
      case 5:
        v15 = 1635087471;
        break;
      case 6:
        v15 = 845504882;
        break;
      case 7:
        v15 = 1635213689;
        break;
      case 8:
      case 11:
      case 30:
        v15 = 1987012963;
        break;
      case 9:
      case 32:
        v15 = 1986357346;
        break;
      case 10:
      case 22:
      case 23:
      case 24:
        v15 = 1651797093;
        break;
      case 13:
        v15 = 1918986611;
        break;
      case 14:
      case 27:
        v15 = 1651795060;
        break;
      case 15:
      case 34:
        v15 = 1751414371;
        break;
      case 16:
      case 35:
        v15 = 1668314723;
        break;
      case 17:
      case 21:
        if ((unint64_t)(objc_msgSend(v17, "announcementPlatform") - 3) >= 2)
          v15 = 1751414371;
        break;
      case 31:
      case 36:
        v15 = 1684108899;
        break;
      default:
        break;
    }
  }

  self->_activationMode = v15;
  self->_csAudioRecordType = -[CSSiriAudioActivationInfo _csAudioRecordTypeForSpeechRequestOptions:useBorealisBuffer:currentClientConfiguration:](self, "_csAudioRecordTypeForSpeechRequestOptions:useBorealisBuffer:currentClientConfiguration:", v17, v14, self->_currentClientConfiguration);
  if (v7)
    goto LABEL_12;
LABEL_13:
  self->_speechEvent = v10;
  self->_useBorealisBuffer = v14;
  self->_activationSystemUptime = v12;
  self->_activationHostTime = objc_msgSend(v6, "activationEventMachAbsoluteTime");
  self->_buttonDownHostTime = objc_msgSend(v6, "homeButtonDownEventMachAbsoluteTime");
  objc_msgSend(v6, "voiceTriggerEventInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("triggerEndMachTime"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_voiceTriggerEndHostTime = objc_msgSend(v19, "unsignedLongLongValue");

  objc_msgSend(v6, "activationDeviceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (NSString *)objc_msgSend(v20, "copy");
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v21;

  self->_usePrelistening = objc_msgSend(v6, "usePrelisteningMode");
  self->_isOnPhoneCall = objc_msgSend(v6, "isOnPhoneCall");
  self->_hasPlayedStartAlert = objc_msgSend(v6, "hasPlayedStartAlert");
  objc_msgSend(v6, "languageDetectionUserContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (AFLanguageDetectionUserContext *)objc_msgSend(v23, "copy");
  languageDetectionUserContext = self->_languageDetectionUserContext;
  self->_languageDetectionUserContext = v24;

  self->_dictationInputOrigin = objc_msgSend(v6, "dictationInputOrigin");
  objc_msgSend(v6, "turnIdentifier");
  v26 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  turnIdentifier = self->_turnIdentifier;
  self->_turnIdentifier = v26;

  objc_msgSend(v6, "applicationDisplayName");
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  applicationDisplayName = self->_applicationDisplayName;
  self->_applicationDisplayName = v28;

  objc_msgSend(v6, "applicationBundleIdentifier");
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v30;

  self->_presentationMode = objc_msgSend(v6, "presentationMode");
  v32 = 0.0;
  if (objc_msgSend(v6, "isMediaPlaying"))
  {
    objc_msgSend(v6, "mediaPlaybackVolume");
    v32 = v33;
  }
  self->_activeMediaPlaybackVolume = v32;
  v34 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[CSSiriAudioActivationInfo setSpeechRequestOptions:currentActivationInfo:]";
    v48 = 2048;
    v49 = v32;
    _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_INFO, "%s activeMediaPlaybackVolume = %f", buf, 0x16u);
  }
  self->_dictationVoiceTriggerAbsStartSampleId = objc_msgSend(v6, "dictationVoiceTriggerAbsStartSampleId");
  objc_msgSend(v6, "voiceTriggerEventInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0D19588];
  objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0D19588]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v44 = v36;
    v45 = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v38 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    activationMetadata = self->_activationMetadata;
    self->_activationMetadata = v38;

  }
  csAudioRecordType = self->_csAudioRecordType;
  if (csAudioRecordType <= 0x1B && ((1 << csAudioRecordType) & 0x8D00000) != 0)
  {
    objc_msgSend(v6, "continuousConversationInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (NSDictionary *)objc_msgSend(v41, "copy");
    v43 = self->_activationMetadata;
    self->_activationMetadata = v42;

  }
  self->_isSpokenNotification = -[CSSiriAudioActivationInfo _isRequestFromSpokenNotification:](self, "_isRequestFromSpokenNotification:", v10);
  self->_isTriggerlessFollowup = v10 == 17;

}

- (void)setClientConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *currentClientConfiguration;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSSiriAudioActivationInfo setClientConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s clientConfiguration = %@", (uint8_t *)&v8, 0x16u);
  }
  v6 = (AFClientConfiguration *)objc_msgSend(v4, "copy");
  currentClientConfiguration = self->_currentClientConfiguration;
  self->_currentClientConfiguration = v6;

}

- (int64_t)event
{
  return self->_speechEvent;
}

- (id)_appendDictationApplicationInfoSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *applicationDisplayName;
  NSString *applicationBundleIdentifier;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    applicationDisplayName = self->_applicationDisplayName;
    if (applicationDisplayName)
      objc_msgSend(v6, "setObject:forKey:", applicationDisplayName, CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppName"));
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    if (applicationBundleIdentifier)
      objc_msgSend(v7, "setObject:forKey:", applicationBundleIdentifier, CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppBundleID"));
    v10 = objc_msgSend(v7, "copy");

    v5 = (void *)v10;
  }
  return v5;
}

- (id)recordSettingsWithOptions:(unint64_t)a3 appendingSettings:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[6];
  _QWORD v29[7];

  v4 = a3;
  v29[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((AFIsNano() & 1) == 0
    && AFIsInternalInstall()
    && _AFPreferencesForceUncompressedAudioRecording())
  {
    v7 = *MEMORY[0x1E0C89970];
    v28[0] = *MEMORY[0x1E0C898E0];
    v28[1] = v7;
    v29[0] = &unk_1E7C639E0;
    v29[1] = &unk_1E7C63EE0;
    v8 = *MEMORY[0x1E0C89910];
    v28[2] = *MEMORY[0x1E0C898F0];
    v28[3] = v8;
    v29[2] = &unk_1E7C639F8;
    v29[3] = MEMORY[0x1E0C9AAA0];
    v9 = *MEMORY[0x1E0C89948];
    v28[4] = *MEMORY[0x1E0C89930];
    v28[5] = v9;
    v10 = *MEMORY[0x1E0C89958];
    v29[4] = &unk_1E7C63A10;
    v29[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriAudioActivationInfo _appendDictationApplicationInfoSettings:](self, "_appendDictationApplicationInfoSettings:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v13 = 1936745848;
  if (self->_activationMode != 1651797093)
  {
    v13 = 1869641075;
    if ((AFIsNano() & 1) == 0)
    {
      if (AFIsInternalInstall())
      {
        if (_AFPreferencesForceSpeexAudioRecording())
          v13 = 1936745848;
        else
          v13 = 1869641075;
      }
    }
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((v4 & 1) != 0)
  {
    -[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:](self, "_audioSessionActiveDelayCoreSpeechWithType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));

  }
  if ((v4 & 4) != 0)
  {
    v16 = 1;
    goto LABEL_21;
  }
  if ((v4 & 8) != 0)
  {
    v16 = 2;
    goto LABEL_21;
  }
  if ((v4 & 0x10) != 0)
  {
    v16 = 3;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));

  }
  v26[0] = *MEMORY[0x1E0C898E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C89970];
  v27[0] = v18;
  v27[1] = &unk_1E7C63EE0;
  v20 = *MEMORY[0x1E0C898C8];
  v26[1] = v19;
  v26[2] = v20;
  v21 = *MEMORY[0x1E0C89930];
  v27[2] = &unk_1E7C63A28;
  v27[3] = &unk_1E7C63A10;
  v22 = *MEMORY[0x1E0C89948];
  v26[3] = v21;
  v26[4] = v22;
  v27[4] = *MEMORY[0x1E0C89958];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v14, "addEntriesFromDictionary:", v6);
  if (objc_msgSend(v14, "count"))
  {
    v23 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v23, "addEntriesFromDictionary:", v14);
    v24 = objc_msgSend(v23, "copy");

    v11 = (void *)v24;
  }
  -[CSSiriAudioActivationInfo _appendDictationApplicationInfoSettings:](self, "_appendDictationApplicationInfoSettings:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  return v12;
}

- (int64_t)_activationMode
{
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) != 2)
    return self->_activationMode;
  if (AFIsATV())
    return 1651797093;
  return 1684628340;
}

- (int64_t)_csAudioRecordType
{
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) != 2)
    return self->_csAudioRecordType;
  if (AFIsATV())
    return 8;
  return 13;
}

- (id)recordContext
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[CSSiriAudioActivationInfo _csAudioRecordType](self, "_csAudioRecordType");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19008]), "initWithRecordType:deviceId:", v3, self->_deviceIdentifier);
  objc_msgSend(v4, "setIsRequestDuringActiveCall:", self->_isOnPhoneCall);
  MEMORY[0x1C3BC3A68](self->_turnIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTurnIdentifier:", v5);

  if (self->_activationMetadata)
    objc_msgSend(v4, "setActivationMetadata:");
  objc_msgSend(v4, "setIsRequestFromSpokenNotification:", self->_isSpokenNotification);
  objc_msgSend(v4, "setIsRequestFromTriggerless:", self->_isTriggerlessFollowup);
  objc_msgSend(v4, "setSpeechEvent:", self->_speechEvent);
  return v4;
}

- (id)recordContextForSpeechEvent:(int64_t)a3
{
  int64_t v5;
  void *v6;

  v5 = +[CSRecordTypeSpeechEventConverter getRecordTypeForSpeechEvent:](CSRecordTypeSpeechEventConverter, "getRecordTypeForSpeechEvent:");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19008]), "initWithRecordType:deviceId:", v5, self->_deviceIdentifier);
  objc_msgSend(v6, "setIsRequestDuringActiveCall:", self->_isOnPhoneCall);
  objc_msgSend(v6, "setIsRequestFromSpokenNotification:", self->_isSpokenNotification);
  objc_msgSend(v6, "setIsRequestFromTriggerless:", self->_isTriggerlessFollowup);
  objc_msgSend(v6, "setSpeechEvent:", a3);
  return v6;
}

- (BOOL)_isRequestFromSpokenNotification:(int64_t)a3
{
  if (_os_feature_enabled_impl())
    return a3 == 21 || a3 == 32 || self->_isOnPhoneCall;
  if ((unint64_t)a3 <= 0x20)
    return (0x100220000uLL >> a3) & 1;
  else
    return 0;
}

- (int64_t)_csAudioRecordTypeForSpeechRequestOptions:(id)a3 useBorealisBuffer:(BOOL)a4 currentClientConfiguration:(id)a5
{
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "activationEvent");
  if (a4)
  {
    v8 = 6;
  }
  else
  {
    v9 = v7;
    if (v7 == 21 && (objc_msgSend(v6, "announcementPlatform") == 3 || objc_msgSend(v6, "announcementPlatform") == 4))
    {
      v10 = *MEMORY[0x1E0CFE6C0];
      v8 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[CSSiriAudioActivationInfo _csAudioRecordTypeForSpeechRequestOptions:useBorealisBuffer:currentClientConfiguration:]";
        v8 = 1;
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s announcement platform is hearing aids or built in speaker, using CSAudioRecordTypeHomePress", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      v8 = +[CSRecordTypeSpeechEventConverter getRecordTypeForSpeechEvent:](CSRecordTypeSpeechEventConverter, "getRecordTypeForSpeechEvent:", v9);
    }
  }

  return v8;
}

- (id)startRecordingSettingsWithRecordRoute:(id)a3 recordingInfo:(id)a4 playbackRoute:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  id v13;
  int v14;
  os_log_t v15;
  NSObject *v16;
  _BOOL4 v17;
  int64_t activationMode;
  _BOOL4 v19;
  unint64_t activationHostTime;
  double activationSystemUptime;
  char v22;
  os_log_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  BOOL v38;
  char v39;
  char v40;
  NSObject *v41;
  int64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  AFLanguageDetectionUserContext *languageDetectionUserContext;
  void *v50;
  AFLanguageDetectionUserContext *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSString *applicationDisplayName;
  NSString *applicationBundleIdentifier;
  void *v68;
  int64_t speechEndpointerOperationMode;
  void *v70;
  void *v71;
  id v72;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  _BYTE v89[10];
  _BYTE v90[10];
  int v91;
  __int16 v92;
  int v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v12 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v87 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    v88 = 2112;
    *(_QWORD *)v89 = v8;
    *(_WORD *)&v89[8] = 2112;
    *(_QWORD *)v90 = v10;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@", buf, 0x20u);
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_msgSend((id)objc_opt_class(), "_doesRecordRouteSupportZLL:", v8);
  v15 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = -[CSSiriAudioActivationInfo _canUseZLL](self, "_canUseZLL");
    activationMode = self->_activationMode;
    *(_DWORD *)buf = 136315906;
    v87 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    v88 = 1024;
    *(_DWORD *)v89 = v14;
    *(_WORD *)&v89[4] = 1024;
    *(_DWORD *)&v89[6] = v17;
    *(_WORD *)v90 = 2048;
    *(_QWORD *)&v90[2] = activationMode;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s doesRecordRouteSupportZLL = %u, [self _canUseZLL] = %u _activationMode:%ld", buf, 0x22u);

  }
  if (objc_msgSend(MEMORY[0x1E0CFE8B8], "isDictationVoiceTriggerEnabled"))
    v19 = self->_dictationVoiceTriggerAbsStartSampleId != 0;
  else
    v19 = 0;
  v84 = v10;
  v85 = v9;
  v82 = v8;
  v83 = v13;
  if ((-[CSSiriAudioActivationInfo _canUseZLL](self, "_canUseZLL") & v14) == 1)
  {
    activationHostTime = self->_activationHostTime;
    if (activationHostTime)
    {
      if (!v19)
        goto LABEL_20;
    }
    else
    {
      activationSystemUptime = self->_activationSystemUptime;
      v22 = activationSystemUptime <= 0.0 || v19;
      if ((v22 & 1) == 0)
        goto LABEL_19;
    }
  }
  if (self->_speechEvent != 17)
  {
    v78 = 0;
    goto LABEL_24;
  }
  activationHostTime = self->_activationHostTime;
  if (!activationHostTime)
  {
    activationSystemUptime = self->_activationSystemUptime;
LABEL_19:
    activationHostTime = objc_msgSend(MEMORY[0x1E0C89B10], "hostTimeForSeconds:", activationSystemUptime);
  }
LABEL_20:
  v23 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)MEMORY[0x1E0CB3898];
    v25 = v23;
    objc_msgSend(v24, "processInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "systemUptime");
    v28 = v27;
    objc_msgSend(MEMORY[0x1E0C89B10], "secondsForHostTime:", activationHostTime);
    *(_DWORD *)buf = 136315394;
    v87 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    v88 = 2048;
    *(double *)v89 = v28 - v29;
    _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_INFO, "%s Requesting historical buffer of duration %lf seconds", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", activationHostTime);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v30, *MEMORY[0x1E0C89A40]);

  v78 = 1;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CFE878], "sharedObserver");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v31, "state");

  v32 = -[CSSiriAudioActivationInfo overrideStartingAlertBeepSoundID](self, "overrideStartingAlertBeepSoundID");
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "useDeviceSpeakerForTTS");

  v35 = MEMORY[0x1C3BC3858]();
  v36 = -[CSSiriAudioActivationInfo _isVoiceOverTouchEnabledInAccessibility](self, "_isVoiceOverTouchEnabledInAccessibility");
  v37 = -[AFClientConfiguration isDeviceInCarDNDMode](self->_currentClientConfiguration, "isDeviceInCarDNDMode");
  v38 = -[CSSiriAudioActivationInfo _isVibrationDisabledInAccessibility](self, "_isVibrationDisabledInAccessibility");
  v39 = !v38;
  v40 = AFSupportsVibration();
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2 && !v38)
    v39 &= -[CSSiriAudioActivationInfo _isSystemHapticEnabled](self, "_isSystemHapticEnabled");
  v41 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v42 = self->_activationMode;
    *(_DWORD *)buf = 136316162;
    v87 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    v88 = 2048;
    *(_QWORD *)v89 = v42;
    *(_WORD *)&v89[8] = 2048;
    *(_QWORD *)v90 = v34;
    *(_WORD *)&v90[8] = 1024;
    v91 = v78;
    v92 = 1024;
    v93 = v37;
    _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_INFO, "%s activationMode = %ld, usesDeviceSpeakerForTTS = %lu, attemptsToUsePastDataBufferFrames = %d, isDeviceInCarDNDMode = %d", buf, 0x2Cu);
  }
  HIBYTE(v74) = self->_suppressStartAlert;
  BYTE6(v74) = v40;
  BYTE5(v74) = v39;
  BYTE4(v74) = v36;
  BYTE3(v74) = v35;
  *(_WORD *)((char *)&v74 + 1) = *(_WORD *)&self->_isOnPhoneCall;
  LOBYTE(v74) = self->_usePrelistening;
  v43 = v84;
  +[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerState:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:](CSSiriAudioActivationInfo, "_alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerState:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:", v82, v84, self->_speechEvent, self->_speechRecordingMode, v80, v32, self->_presentationMode, v74, self->_activationHostTime);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v83;
  if (objc_msgSend(v44, "count"))
    objc_msgSend(v83, "setObject:forKey:", v44, *MEMORY[0x1E0C899F8]);
  v46 = v85;
  if (-[CSSiriAudioActivationInfo _shouldSkipStartRecordingAlertForRecordingInfo:](self, "_shouldSkipStartRecordingAlertForRecordingInfo:", v85))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKey:", v47, CFSTR("CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"));

  }
  if (+[CSSiriAudioActivationInfo _shouldAllowRecordWhileBeepWithRecordRoute:playbackRoute:supportsEchoCancellation:speechRecordingMode:](CSSiriAudioActivationInfo, "_shouldAllowRecordWhileBeepWithRecordRoute:playbackRoute:supportsEchoCancellation:speechRecordingMode:", v82, v84, v35, self->_speechRecordingMode))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKey:", v48, CFSTR("CSSpeechRecordSettingsKey_allowRecordWhileBeep"));

  }
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (_AFPreferencesDictationLanguageDetectorEnabled())
    {
      languageDetectionUserContext = self->_languageDetectionUserContext;
      if (languageDetectionUserContext)
      {
        v50 = (void *)MEMORY[0x1E0C99E08];
        v51 = languageDetectionUserContext;
        objc_msgSend(v50, "dictionary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFLanguageDetectionUserContext languageDetectorUserContext](v51, "languageDetectorUserContext");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFLanguageDetectionUserContext finalFilteredDictationLanguages](v51, "finalFilteredDictationLanguages");
        v54 = objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"));

        }
        v81 = (void *)v54;
        v56 = (_QWORD *)MEMORY[0x1E0CFEB40];
        objc_msgSend(v53, "objectForKey:", *(_QWORD *)(MEMORY[0x1E0CFEB40] + 8));
        v57 = objc_claimAutoreleasedReturnValue();
        if (v57)
          objc_msgSend(v52, "setObject:forKey:", v57, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorCurrentKeyboard"));
        objc_msgSend(v53, "objectForKey:", *v56);
        v58 = objc_claimAutoreleasedReturnValue();
        if (v58)
          objc_msgSend(v52, "setObject:forKey:", v58, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorWasLanguageToggled"));
        v77 = (void *)v58;
        objc_msgSend(v53, "objectForKey:", v56[4]);
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
          objc_msgSend(v52, "setObject:forKey:", v59, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorMultilingualKeyboardLanguages"));
        v79 = (void *)v57;
        objc_msgSend(v53, "objectForKey:", v56[7]);
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
          objc_msgSend(v52, "setObject:forKey:", v60, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorKeyboardConvoLanguagePriors"));
        v75 = (void *)v60;
        objc_msgSend(v53, "objectForKey:", v56[8]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
          objc_msgSend(v52, "setObject:forKey:", v61, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorKeyboardGlobalLanguagePriors"));
        objc_msgSend(v53, "objectForKey:", v56[2]);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
          objc_msgSend(v52, "setObject:forKey:", v62, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorPreviousMessageLanguage"));
        v76 = (void *)v59;
        objc_msgSend(v53, "objectForKey:", v56[3]);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
          objc_msgSend(v52, "setObject:forKey:", v63, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorGlobalLastKeyboardUsed"));
        objc_msgSend(v53, "objectForKey:", v56[5]);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
          objc_msgSend(v52, "setObject:forKey:", v64, CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorConversationalMessages"));
        v65 = *MEMORY[0x1E0CFE6A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315395;
          v87 = "_CSSiriLanguageDetectorSettings";
          v88 = 2113;
          *(_QWORD *)v89 = v52;
          _os_log_impl(&dword_1C2614000, v65, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
        }

        if (v52)
        {
          v43 = v84;
          v46 = v85;
          v45 = v83;
          if (objc_msgSend(v52, "count"))
            objc_msgSend(v83, "addEntriesFromDictionary:", v52);
        }
        else
        {
          v43 = v84;
          v46 = v85;
          v45 = v83;
        }
      }
      else
      {
        v52 = 0;
      }

    }
    applicationDisplayName = self->_applicationDisplayName;
    if (applicationDisplayName)
      objc_msgSend(v45, "setObject:forKey:", applicationDisplayName, CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppName"));
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    if (applicationBundleIdentifier)
      objc_msgSend(v45, "setObject:forKey:", applicationBundleIdentifier, CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppBundleID"));
    if (objc_msgSend(MEMORY[0x1E0CFE8B8], "isDictationVoiceTriggerEnabled")
      && self->_dictationVoiceTriggerAbsStartSampleId)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setObject:forKey:", v68, CFSTR("CSSpeechRecordSettingsKey_DictationStartSampleId"));

    }
  }
  speechEndpointerOperationMode = self->_speechEndpointerOperationMode;
  if (speechEndpointerOperationMode == 1
    || !speechEndpointerOperationMode
    && (self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2
    && self->_dictationInputOrigin != 1)
  {
    objc_msgSend(v45, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CSSpeechRecordSettingsKey_disableEndpointer"));
  }
  -[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:](self, "_audioSessionActiveDelayCoreSpeechWithType:", 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    objc_msgSend(v45, "setObject:forKey:", v70, CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));
  objc_msgSend(v45, "setObject:forKey:", &unk_1E7C63A40, CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
  if (objc_msgSend(v45, "count"))
    v71 = v45;
  else
    v71 = 0;
  v72 = v71;

  return v72;
}

- (BOOL)_shouldSkipStartRecordingAlertForRecordingInfo:(id)a3
{
  return objc_msgSend(a3, "speechEvent") == 14 && self->_hasPlayedStartAlert;
}

- (void)audioSessionActivated
{
  self->_isActivated = 1;
}

- (BOOL)needsUpdateToPostVoiceMode
{
  int v3;
  int64_t activationMode;

  if (!self->_isActivated)
    return 0;
  v3 = CSIsTV();
  activationMode = self->_activationMode;
  if (v3)
  {
    if (activationMode == 1751414371)
      return 0;
  }
  return activationMode == 1668314723 || activationMode == 1751414371 || activationMode == 1987012963;
}

- (unint64_t)beginUpdateToPostVoice
{
  unint64_t csAudioRecordType;
  int64_t activationMode;

  csAudioRecordType = self->_csAudioRecordType;
  activationMode = self->_activationMode;
  self->_activationMode = 1886352244;
  self->_storedActivationMode = activationMode;
  self->_csAudioRecordType = 14;
  return csAudioRecordType;
}

- (void)endUpdateToPostVoiceWithContext:(unint64_t)a3 success:(BOOL)a4
{
  if (!a4)
  {
    self->_csAudioRecordType = a3;
    self->_activationMode = self->_storedActivationMode;
  }
}

- (BOOL)canPrewarm
{
  if (self->_activationMode == 1752132965)
    return AFIsNano() ^ 1;
  else
    return 0;
}

- (BOOL)canPrepareWithoutInterruption
{
  return 0;
}

- (BOOL)requiresBorealisConsumerCheck
{
  if (self->_useBorealisBuffer)
    return !-[CSSiriAudioActivationInfo _eventIsVoiceTrigger](self, "_eventIsVoiceTrigger");
  else
    return 0;
}

- (BOOL)canGetPCMStream
{
  return self->_activationMode != 1651797093;
}

- (BOOL)_canUseZLL
{
  int64_t activationMode;
  BOOL v5;
  int v6;
  int v7;

  if (-[CSSiriAudioActivationInfo _isVoiceOverTouchEnabledInAccessibility](self, "_isVoiceOverTouchEnabledInAccessibility")|| self->_speechRecordingMode != 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    activationMode = self->_activationMode;
    v5 = activationMode == 1752132965 || activationMode == 1969840752 || activationMode == 1986357346;
    if (v5 || (v7 = AFIsHorseman(), v7 && self->_activationMode == 1635087471))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported");
      if (v6)
        LOBYTE(v6) = self->_activationMode == 1635087471;
    }
  }
  return v6;
}

- (BOOL)_eventIsVoiceTrigger
{
  return AFSpeechEventIsVoiceTrigger();
}

- (BOOL)_eventIsTVRemote
{
  return AFSpeechEventIsTVRemote();
}

- (BOOL)canEnterTwoShot
{
  _BOOL4 v3;
  int64_t activationMode;

  v3 = -[CSSiriAudioActivationInfo _eventIsVoiceTrigger](self, "_eventIsVoiceTrigger");
  if (v3)
  {
    activationMode = self->_activationMode;
    LOBYTE(v3) = activationMode == 1987012963 || activationMode == 1751414371;
  }
  return v3;
}

- (BOOL)shouldExplicitlyPlayAlertOnStart
{
  unint64_t speechEvent;
  BOOL v4;
  unint64_t v5;

  if (-[CSSiriAudioActivationInfo _eventIsVoiceTrigger](self, "_eventIsVoiceTrigger") || !self->_useBorealisBuffer)
    return 0;
  speechEvent = self->_speechEvent;
  v4 = speechEvent > 0x20;
  v5 = (0xFFDDFFFFuLL >> speechEvent) & 1;
  if (v4)
    return 1;
  else
    return v5;
}

- (BOOL)shouldPlayAlertIfNotPrelistening
{
  return +[CSSiriAudioActivationInfo _shouldPlayAlertIfNotPrelisteningForSpeechEvent:isVoiceOverTouchEnabled:](CSSiriAudioActivationInfo, "_shouldPlayAlertIfNotPrelisteningForSpeechEvent:isVoiceOverTouchEnabled:", self->_speechEvent, -[CSSiriAudioActivationInfo _isVoiceOverTouchEnabledInAccessibility](self, "_isVoiceOverTouchEnabledInAccessibility"));
}

- (BOOL)shouldSuppressRecordingStopAlert
{
  return (self->_speechEvent < 0x21uLL) & (0x10822C000uLL >> self->_speechEvent);
}

- (BOOL)shouldSuppressRecordingErrorAlert
{
  return (self->_speechEvent < 0x21uLL) & (0x100220000uLL >> self->_speechEvent);
}

- (int64_t)twoShotPromptTypeForRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  int64_t speechEvent;
  void *v12;
  int v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315650;
    v16 = "-[CSSiriAudioActivationInfo twoShotPromptTypeForRecordRoute:playbackRoute:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@", (uint8_t *)&v15, 0x20u);
  }
  if (!AFIsHorseman())
  {
    speechEvent = self->_speechEvent;
    v10 = 0;
    switch(speechEvent)
    {
      case 8:
        if (!self->_isOnPhoneCall || !objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C897E0]))
          goto LABEL_16;
        goto LABEL_23;
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        goto LABEL_16;
      case 15:
        if ((CSIsTV() & 1) == 0)
          goto LABEL_23;
        goto LABEL_21;
      case 16:
        goto LABEL_23;
      case 17:
        goto LABEL_26;
      default:
        if (speechEvent == 31)
        {
          if (!AFIsMac() || (objc_msgSend(MEMORY[0x1E0D19260], "hasRemoteCoreSpeech") & 1) == 0)
          {
            v10 = 2;
            goto LABEL_26;
          }
        }
        else
        {
LABEL_16:
          if (MEMORY[0x1C3BC3858]()
            && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C897F8])
            && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89810])
            || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89840])
            && (-[AFExperimentContext invocationFeedbackExperiment](self->_experimentContext, "invocationFeedbackExperiment"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "isFeatureGroupOneEnabled"), v12, v13))
          {
LABEL_23:
            if (AFDeviceSupportsSystemAssistantExperience())
              v10 = 1;
            else
              v10 = 2;
            goto LABEL_26;
          }
        }
LABEL_21:
        v10 = 1;
        goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "startAlertEnabled"))
    v10 = 1;
  else
    v10 = 2;

LABEL_26:
  return v10;
}

- (int64_t)twoShotFeedbackAlertOverrideForRecordRoute:(id)a3 playbackRoute:(id)a4 deviceSupportsVibrator:(BOOL)a5 deviceSupportsEC:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  int64_t v11;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v6)
    goto LABEL_8;
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89810]))
  {
    if ((AFRecordRouteIsHearst() & 1) != 0)
    {
      v11 = 3;
      goto LABEL_9;
    }
LABEL_8:
    v11 = 2;
    goto LABEL_9;
  }
  if (CSIsWatch())
    v11 = 1;
  else
    v11 = 3;
LABEL_9:

  return v11;
}

- (id)startingAlertBeepURL
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  int64_t speechEvent;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "carPlayConnected");

  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEBUG, "%s For dictation, not overriding recording sound.", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_4;
  }
  if ((v4 & 1) != 0 || objc_msgSend(MEMORY[0x1E0D19260], "isBluetoothVehicleOutput"))
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEBUG, "%s For CarPlay, use a more shortened start recording sound.", (uint8_t *)&v17, 0xCu);
    }
    v8 = (void *)MEMORY[0x1E0C99E98];
    v9 = CFSTR("/System/Library/Audio/UISounds/jbl_begin_short_carplay.caf");
LABEL_10:
    objc_msgSend(v8, "URLWithString:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  speechEvent = self->_speechEvent;
  if (speechEvent == 5 || speechEvent == 3)
  {
    v16 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEBUG, "%s For BT button press and handover cases, use shortened start recording sound.", (uint8_t *)&v17, 0xCu);
    }
    v8 = (void *)MEMORY[0x1E0C99E98];
    v9 = CFSTR("/System/Library/Audio/UISounds/jbl_begin_short.caf");
    goto LABEL_10;
  }
LABEL_4:
  v6 = 0;
LABEL_11:
  if (AFDeviceSupportsSAE() && (self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = -[CSSiriAudioActivationInfo saeToneIDWithCarPlayConnected:](self, "saeToneIDWithCarPlayConnected:", v4);
  else
    v10 = -[CSSiriAudioActivationInfo overrideStartingAlertBeepSoundID](self, "overrideStartingAlertBeepSoundID");
  v11 = v10;
  if (AFSoundIDGetIsValidAndSpecified())
  {
    objc_msgSend(MEMORY[0x1E0CFE840], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLForSoundID:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }
  return v6;
}

- (int64_t)saeToneIDWithCarPlayConnected:(BOOL)a3
{
  if (a3)
    return 13;
  else
    return AFSoundIDGetFromName();
}

- (int64_t)overrideStartingAlertBeepSoundID
{
  void *v2;
  int64_t v3;

  -[AFSpeechRecordingAlertPolicy startingAlertBehavior](self->_speechRecordingAlertPolicy, "startingAlertBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "beepSoundID");

  return v3;
}

- (id)audioSessionActivationTargetDate
{
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:](self, "_audioSessionActiveDelayUserPerceptionWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "-[CSSiriAudioActivationInfo audioSessionActivationTargetDate]";
    v13 = 2112;
    v14 = v3;
    _os_log_debug_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEBUG, "%s audioSessionActiveDelay = %@ (User Perception)", (uint8_t *)&v11, 0x16u);
    if (v3)
      goto LABEL_3;
  }
  else if (v3)
  {
LABEL_3:
    objc_msgSend(v3, "doubleValue");
    -[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:](self, "dateByAddingTimeIntervalSinceActivation:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:
  v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    objc_msgSend(v6, "timeIntervalSinceNow");
    v11 = 136315650;
    v12 = "-[CSSiriAudioActivationInfo audioSessionActivationTargetDate]";
    v13 = 2112;
    v14 = v6;
    v15 = 2048;
    v16 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s targetDate = %@ (%f)", (uint8_t *)&v11, 0x20u);

  }
  return v6;
}

- (id)dateByAddingTimeIntervalSinceActivation:(double)a3
{
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  uint64_t v15;
  double activationSystemUptime;
  NSObject *v18;
  void *v19;
  void *v20;
  double v21;
  unint64_t v22;
  unint64_t voiceTriggerEndHostTime;
  unint64_t buttonDownHostTime;
  int v25;
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v25 = 136315394;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    v27 = 2048;
    v28 = a3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s timeInterval = %f", (uint8_t *)&v25, 0x16u);
  }
  if (AFSpeechEventIsVoiceTrigger())
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      voiceTriggerEndHostTime = self->_voiceTriggerEndHostTime;
      v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      v27 = 2048;
      v28 = *(double *)&voiceTriggerEndHostTime;
      _os_log_debug_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEBUG, "%s voiceTriggerEndHostTime = %llu", (uint8_t *)&v25, 0x16u);
    }
    v8 = 128;
  }
  else
  {
    v9 = *v5;
    if (self->_speechEvent != 1)
      goto LABEL_13;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      buttonDownHostTime = self->_buttonDownHostTime;
      v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      v27 = 2048;
      v28 = *(double *)&buttonDownHostTime;
      _os_log_debug_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEBUG, "%s buttonDownHostTime = %llu", (uint8_t *)&v25, 0x16u);
    }
    v8 = 120;
  }
  if (*(Class *)((char *)&self->super.isa + v8))
  {
LABEL_16:
    v10 = (void *)MEMORY[0x1E0C99D68];
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    objc_msgSend(v10, "dateWithTimeIntervalSinceNow:", a3 - v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v9 = *v5;
LABEL_13:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v22 = self->_buttonDownHostTime;
    v25 = 136315394;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    v27 = 2048;
    v28 = *(double *)&v22;
    _os_log_debug_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEBUG, "%s activationHostTime = %llu", (uint8_t *)&v25, 0x16u);
  }
  if (self->_activationHostTime)
    goto LABEL_16;
  activationSystemUptime = self->_activationSystemUptime;
  if (activationSystemUptime <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      v27 = 2048;
      v28 = activationSystemUptime;
      _os_log_debug_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEBUG, "%s activationSystemUptime = %f", (uint8_t *)&v25, 0x16u);
    }
    v19 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "systemUptime");
    objc_msgSend(v19, "dateWithTimeIntervalSinceNow:", a3 - (v21 - self->_activationSystemUptime));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_17:
  v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    objc_msgSend(v12, "timeIntervalSinceNow");
    v25 = 136315650;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    v27 = 2112;
    v28 = *(double *)&v12;
    v29 = 2048;
    v30 = v15;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s date = %@ (%f)", (uint8_t *)&v25, 0x20u);

  }
  return v12;
}

- (BOOL)_isVoiceOverTouchEnabledInAccessibility
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[AFClientConfiguration accessibilityState](self->_currentClientConfiguration, "accessibilityState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVoiceOverTouchEnabled");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CFE7C0], "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isVoiceOverTouchEnabled");

  }
  return v3 == 2;
}

- (BOOL)_isSystemHapticEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
  objc_msgSend(v2, "objectForKey:", CFSTR("effects-haptic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)_isVibrationDisabledInAccessibility
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[AFClientConfiguration accessibilityState](self->_currentClientConfiguration, "accessibilityState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVibrationDisabled");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CFE7C0], "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isVibrationDisabled");

  }
  return v3 == 2;
}

- (id)_audioSessionActiveDelayCoreSpeechWithType:(unint64_t)a3
{
  NSObject *v3;
  id v4;
  const char *v5;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_speechEvent == 17)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    v4 = &unk_1E7C63EF0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
      v13 = 2112;
      v14 = &unk_1E7C63EF0;
      v5 = "%s audioSessionActiveDelay = %@ (Triggerless Listening)";
LABEL_7:
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (AFSupportsAudioSessionCoordination())
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    v4 = &unk_1E7C63EF0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
      v13 = 2112;
      v14 = &unk_1E7C63EF0;
      v5 = "%s audioSessionActiveDelay = %@ (Audio Session Coordination)";
      goto LABEL_7;
    }
  }
  else
  {
    -[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:](self, "_audioSessionActiveDelayUserPerceptionWithType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (User Perception)", (uint8_t *)&v11, 0x16u);
    }
    v4 = v8;
  }

  return v4;
}

- (id)_audioSessionActiveDelayUserPerceptionWithType:(unint64_t)a3
{
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__CSSiriAudioActivationInfo__audioSessionActiveDelayUserPerceptionWithType___block_invoke;
  v12[3] = &unk_1E7C26060;
  v12[4] = self;
  v4 = MEMORY[0x1C3BC4734](v12, a2, a3);
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_speechEvent == 15)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, &unk_1E7C63F00);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
      v15 = 2112;
      v16 = v6;
      v8 = "%s audioSessionActiveDelay = %@ (Hearst Voice)";
LABEL_8:
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, v8, buf, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(MEMORY[0x1E0C89C18], "supportsDuckingOnSpeakerOutput") && self->_speechEvent == 8)
  {
    ((void (**)(_QWORD, void *))v5)[2](v5, &unk_1E7C63F00);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
      v15 = 2112;
      v16 = v6;
      v8 = "%s audioSessionActiveDelay = %@ (Built In Voice)";
      goto LABEL_8;
    }
LABEL_9:
    v9 = v6;
    goto LABEL_13;
  }
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
    v15 = 2112;
    v16 = 0;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Others)", buf, 0x16u);
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)_audioSessionActiveDelayOverride
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19200], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideAudioSessionActiveDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayOverride]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)_audioSessionActiveDelayServerConfiguration
{
  os_log_t *v3;
  NSObject *v4;
  double activeMediaPlaybackVolume;
  void *v6;
  void *v7;
  NSObject *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    activeMediaPlaybackVolume = self->_activeMediaPlaybackVolume;
    v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    v21 = 2048;
    v22 = activeMediaPlaybackVolume;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s activeMediaPlaybackVolume = %f", (uint8_t *)&v19, 0x16u);
  }
  if (self->_activeMediaPlaybackVolume <= 0.0)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0D19200], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    v21 = 2112;
    v22 = *(double *)&v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s mediaPlaybackVolumeThreshold = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!v7
    || (objc_msgSend(v7, "floatValue"), v9 <= 0.0)
    || (objc_msgSend(v7, "floatValue"), v10 >= 1.0)
    || (v11 = self->_activeMediaPlaybackVolume, objc_msgSend(v7, "floatValue"), v11 < v12))
  {

LABEL_11:
    objc_msgSend(MEMORY[0x1E0D19200], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serverAudioSessionActivationDelay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
      v21 = 2112;
      v22 = *(double *)&v14;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Default)", (uint8_t *)&v19, 0x16u);
    }
    return v14;
  }
  objc_msgSend(MEMORY[0x1E0D19200], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    v21 = 2112;
    v22 = *(double *)&v14;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Above Media Playback Volume Threshold)", (uint8_t *)&v19, 0x16u);
  }

  if (!v14)
    goto LABEL_11;
  return v14;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (BOOL)useBorealisBuffer
{
  return self->_useBorealisBuffer;
}

- (BOOL)usePrelistening
{
  return self->_usePrelistening;
}

- (int64_t)audioAlertStyle
{
  return self->_audioAlertStyle;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (double)activationSystemUptime
{
  return self->_activationSystemUptime;
}

- (unint64_t)activationHostTime
{
  return self->_activationHostTime;
}

- (unint64_t)buttonDownHostTime
{
  return self->_buttonDownHostTime;
}

- (unint64_t)voiceTriggerEndHostTime
{
  return self->_voiceTriggerEndHostTime;
}

- (int64_t)speechRecordingMode
{
  return self->_speechRecordingMode;
}

- (void)setSpeechRecordingMode:(int64_t)a3
{
  self->_speechRecordingMode = a3;
}

- (BOOL)isOnPhoneCall
{
  return self->_isOnPhoneCall;
}

- (NSDictionary)activationMetadata
{
  return self->_activationMetadata;
}

- (BOOL)hasPlayedStartAlert
{
  return self->_hasPlayedStartAlert;
}

- (int64_t)speechEndpointerOperationMode
{
  return self->_speechEndpointerOperationMode;
}

- (AFSpeechRecordingAlertPolicy)speechRecordingAlertPolicy
{
  return self->_speechRecordingAlertPolicy;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)isSpokenNotification
{
  return self->_isSpokenNotification;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (unint64_t)dictationVoiceTriggerAbsStartSampleId
{
  return self->_dictationVoiceTriggerAbsStartSampleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_activationMetadata, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_magusSupportedPolicy, 0);
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_currentClientConfiguration, 0);
}

id __76__CSSiriAudioActivationInfo__audioSessionActiveDelayUserPerceptionWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_audioSessionActiveDelayOverride");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_audioSessionActiveDelayServerConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = v3;
  }

  return v4;
}

+ (BOOL)_doesRecordRouteSupportZLL:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C897F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89A30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89A00]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HACBuiltIn"));
  }

  return v4;
}

+ (id)_alertBehaviorForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 speechRecordingMode:(int64_t)a6 ringerState:(int64_t)a7 startingAlertBeepOverideID:(int64_t)a8 presentationMode:(int64_t)a9 usePrelistening:(BOOL)a10 isOnPhoneCall:(BOOL)a11 hasPlayedStartAlert:(BOOL)a12 supportsEchoCancellation:(BOOL)a13 isVoiceOverTouchEnabled:(BOOL)a14 isVibrationEnabled:(BOOL)a15 isVibrationSupported:(BOOL)a16 suppressStartAlert:(BOOL)a17 activationHostTime:(unint64_t)a18
{
  id v21;
  id v22;
  os_log_t *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  int64_t v39;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  _BOOL4 v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  _BOOL4 v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  _BOOL4 v74;
  __int16 v75;
  unint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v23 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v24 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v25 = v21;
    v26 = v24;
    AFDeviceRingerSwitchStateGetName();
    v39 = a7;
    v27 = v22;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    AFSoundIDGetName();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136319234;
    v44 = "+[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerS"
          "tate:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEch"
          "oCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:]";
    v45 = 2112;
    v46 = v25;
    v47 = 2112;
    v48 = v27;
    v49 = 2048;
    v50 = a5;
    v51 = 2048;
    v52 = a6;
    v53 = 2112;
    v54 = v28;
    v55 = 2112;
    v56 = v29;
    v57 = 2048;
    v58 = a9;
    v59 = 1024;
    v60 = a10;
    v61 = 1024;
    v62 = a11;
    v63 = 1024;
    v64 = a12;
    v65 = 1024;
    v66 = a13;
    v67 = 1024;
    v68 = a14;
    v69 = 1024;
    v70 = a15;
    v71 = 1024;
    v72 = a16;
    v73 = 1024;
    v74 = a17;
    v75 = 2048;
    v76 = a18;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@, speechEvent = %lu, speechRecordingMode = %lu, AFDeviceRingerSwitchState = %@, AFSoundID = %@, AFPresentationMode = %lu, usePrelistening = %d, isOnPhoneCall = %d, hasPlayedStartAlert = %d, supportsEchoCancellation = %d, isVoiceOverTouchEnabled = %d, isVibrationEnabled = %d, isVibrationSupported = %d, suppressStartAlert = %d, activationHostTime = %llu", buf, 0x8Cu);

    v22 = v27;
    a7 = v39;

    v21 = v25;
    v23 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BYTE4(v38) = a16;
    BYTE3(v38) = a15;
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a13, a12);
    objc_msgSend(a1, "_alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingAlertBeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:activationHostTime:", v21, v22, a5, a7, a8, a9, v38, a18);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      v31 = 0;
      goto LABEL_10;
    }
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a16, a15);
    objc_msgSend(a1, "_dictationAlertBehaviorDictionaryForRecordRoute:playbackRoute:ringerState:usePrelistening:suppressStartAlert:supportsEchoCancellation:isVibrationEnabled:isVibrationSupported:isVoiceOverTouchEnabled:", v21, v22, a7, a10, a17, a13, v38);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v30;
  v32 = *v23;
  if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
  {
    v33 = v32;
    objc_msgSend(v31, "objectForKey:", &unk_1E7C63A58);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", &unk_1E7C63A70);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", &unk_1E7C63A88);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v44 = "+[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerS"
          "tate:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEch"
          "oCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:]";
    v45 = 2112;
    v46 = v34;
    v47 = 2112;
    v48 = v35;
    v49 = 2112;
    v50 = (int64_t)v36;
    _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_INFO, "%s alertBehaviorStart = %@, alertBehaviorEnd = %@ alertBehaviorError = %@", buf, 0x2Au);

  }
LABEL_10:

  return v31;
}

+ (id)_dictationAlertBehaviorDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 ringerState:(int64_t)a5 usePrelistening:(BOOL)a6 suppressStartAlert:(BOOL)a7 supportsEchoCancellation:(BOOL)a8 isVibrationEnabled:(BOOL)a9 isVibrationSupported:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11
{
  _BOOL4 v12;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a6;
  v14 = a4;
  if (AFIsATV())
  {
    if (a11)
      v15 = 2;
    else
      v15 = 0;
  }
  else
  {
    if (v12)
      goto LABEL_6;
    if (a7)
    {
      v15 = -1;
      goto LABEL_14;
    }
    if (!AFPlaybackRouteIsHandsFree() && a5 == 2)
    {
LABEL_6:
      v15 = a9 & a10;
    }
    else if (AFIsVision())
    {
      v15 = 4;
    }
    else
    {
      v15 = 2;
    }
  }
LABEL_14:
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, &unk_1E7C63A58);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v18, &unk_1E7C63A70);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v19, &unk_1E7C63A88);

  return v16;
}

+ (id)_alertDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 ringerState:(int64_t)a6 startingAlertBeepOverideID:(int64_t)a7 presentationMode:(int64_t)a8 hasPlayedStartAlert:(BOOL)a9 supportsEchoCancellation:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11 isVibrationEnabled:(BOOL)a12 isVibrationSupported:(BOOL)a13 activationHostTime:(unint64_t)a14
{
  id v17;
  id v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  BOOL v35;
  _BOOL4 v36;
  BOOL v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C89A30])
    && (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) == 0)
  {
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C897D0]) ^ 1;
  }
  else
  {
    v19 = 0;
  }
  if (AFIsATV())
  {
    v20 = a11;
    if ((a11 & ~a9) != 0)
      v21 = 2;
    else
      v21 = 0;
    goto LABEL_9;
  }
  v27 = AFIsHorseman();
  v21 = v27 << 63 >> 63;
  if ((v27 & 1) != 0 || a9)
    goto LABEL_65;
  if ((AFSpeechEventIsVoiceTrigger() & 1) != 0 || a5 == 17 || a5 == 13)
  {
    v28 = objc_msgSend(a1, "_requestIsUsingHFPWithRecordRoute:playbackRoute:", v17, v18);
    v29 = objc_msgSend(a1, "_doesRecordRouteSupportZLL:", v17);
    v21 = 0;
    if ((v28 & 1) == 0)
    {
      v20 = a11;
      if ((v29 & v19 & 1) == 0)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    goto LABEL_27;
  }
  if ((AFSoundIDGetIsValidAndSpecified() & 1) == 0)
  {
    v21 = a12 & a13;
    if (a5 != 5)
    {
      if ((v21 & AFRecordRouteIsHearst() & 1) != 0)
      {
        v21 = 3;
      }
      else if (AFPlaybackRouteIsHandsFree())
      {
        v34 = objc_msgSend(a1, "_requestIsUsingHFPWithRecordRoute:playbackRoute:", v17, v18);
        if (a5 != 1 || !v34)
        {
          v35 = a5 == 1 && a12 && a13;
          v36 = !a13;
          if (a5 != 1)
            v36 = 1;
          v37 = !v36 && !a12;
          v38 = 2;
          if (v37)
            v38 = 0;
          if (v35)
            v21 = 1;
          else
            v21 = v38;
        }
      }
      else if (a6 != 2 && a10)
      {
        v20 = a11;
        if (a12 && a13)
        {
          if (AFDeviceSupportsSystemAssistantExperience())
            v21 = 3;
          else
            v21 = 1;
        }
        else
        {
          v21 = 2;
        }
        goto LABEL_9;
      }
      goto LABEL_27;
    }
    v30 = *MEMORY[0x1E0C89820];
    v31 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C89820]);
    v32 = objc_msgSend(v18, "isEqualToString:", v30);
    v33 = objc_msgSend(MEMORY[0x1E0D19260], "supportEarconRemoval");
    if (a8 == 3)
    {
      if (((a6 == 2) & v21) != 0)
        v21 = 1;
      else
        v21 = 2;
    }
    else if (a8 == 1)
    {
      if ((v31 & v32 ^ 1 | v33) == 1)
        v21 = (v21 ^ 1 | v19 | v31) ^ 1;
      else
        v21 = 2;
    }
    else
    {
      v21 = -1;
    }
    v39 = objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported");
    if (a14 && v39)
    {
      v40 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "+[CSSiriAudioActivationInfo _alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingA"
              "lertBeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:is"
              "VibrationEnabled:isVibrationSupported:activationHostTime:]";
        v45 = 2048;
        v46 = a14;
        _os_log_impl(&dword_1C2614000, v40, OS_LOG_TYPE_INFO, "%s Override startRecording to mute, since user already started speaking before serverInvoke activated (activationHostTime = %llu)", buf, 0x16u);
      }
      v21 = 0;
      goto LABEL_27;
    }
LABEL_65:
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = a11;
    if (v21 == -1)
      goto LABEL_13;
    goto LABEL_10;
  }
  v21 = 2;
LABEL_27:
  v20 = a11;
LABEL_9:
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_10:
  v23 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "+[CSSiriAudioActivationInfo _alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingAlert"
          "BeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibratio"
          "nEnabled:isVibrationSupported:activationHostTime:]";
    v45 = 2048;
    v46 = v21;
    _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "%s Setting alertBehavior recordStarting as %ld", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v24, &unk_1E7C63A58);

LABEL_13:
  if (v20)
    v25 = &unk_1E7C63A70;
  else
    v25 = &unk_1E7C63AA0;
  objc_msgSend(v22, "setObject:forKey:", v25);
  objc_msgSend(v22, "setObject:forKey:", v25, &unk_1E7C63A88);

  return v22;
}

+ (BOOL)_requestIsUsingHFPWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5;
  uint64_t v6;
  char v7;

  v5 = a4;
  v6 = *MEMORY[0x1E0C897E0];
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

+ (BOOL)_shouldAllowRecordWhileBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4 supportsEchoCancellation:(BOOL)a5 speechRecordingMode:(int64_t)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v14 = 136316162;
    v15 = "+[CSSiriAudioActivationInfo _shouldAllowRecordWhileBeepWithRecordRoute:playbackRoute:supportsEchoCancellation:"
          "speechRecordingMode:]";
    v16 = 1024;
    v17 = v7;
    v18 = 2048;
    v19 = a6;
    v20 = 2048;
    v21 = v9;
    v22 = 2048;
    v23 = v10;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s supportsEchoCancellation:%u speechRecordingMode:%ld recordRoute:%ld playbackRoute:%ld", (uint8_t *)&v14, 0x30u);
  }
  if (a6 == 1 && v7)
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C897F8])
      && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C89810]) & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  else if (a6 != 1)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89A30]) & 1) == 0)
    goto LABEL_11;
LABEL_10:
  v12 = 1;
LABEL_12:

  return v12;
}

+ (BOOL)_shouldPlayAlertIfNotPrelisteningForSpeechEvent:(int64_t)a3 isVoiceOverTouchEnabled:(BOOL)a4
{
  return a4 & ~AFSpeechEventIsVoiceTrigger();
}

@end
