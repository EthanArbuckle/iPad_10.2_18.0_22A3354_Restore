@implementation AFSpeechRequestOptions

- (AFSpeechRequestOptions)initWithActivationEvent:(int64_t)a3
{
  AFSpeechRequestOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFSpeechRequestOptions;
  result = -[AFSpeechRequestOptions init](&v5, sel_init);
  if (result)
    result->_activationEvent = a3;
  return result;
}

- (id)initForTestWithTestRequestOptions:(id)a3
{
  id v5;
  AFSpeechRequestOptions *v6;
  AFSpeechRequestOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechRequestOptions;
  v6 = -[AFSpeechRequestOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isTest = 1;
    objc_storeStrong((id *)&v6->_testRequestOptions, a3);
  }

  return v7;
}

- (BOOL)isVoiceTrigger
{
  return (self->_activationEvent < 0x20uLL) & (0x80018900 >> self->_activationEvent);
}

- (BOOL)isRaiseToSpeak
{
  return self->_activationEvent == 13;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t endpointerOperationMode;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  unint64_t activationEvent;
  __CFString *v12;
  __CFString *v13;
  int64_t presentationMode;
  NSUUID *turnIdentifier;
  NSString *activationDeviceIdentifier;
  double activationEventTime;
  unint64_t activationEventMachAbsoluteTime;
  void *v19;
  void *v20;
  objc_super v22;

  if (self->_audioFileURL)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("audioFileURL = %@"), self->_audioFileURL);
LABEL_3:
    v4 = (void *)v3;
    goto LABEL_11;
  }
  if (self->_endpointerOperationMode)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    endpointerOperationMode = self->_endpointerOperationMode;
    if (endpointerOperationMode > 4)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_1E3A2E4D8[endpointerOperationMode];
    v8 = v7;
    v4 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("endpointerOperationMode = %@"), v8);

  }
  else
  {
    if (self->_useAutomaticEndpointing)
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("useAutomaticEndpointing = %d"), self->_useAutomaticEndpointing);
      goto LABEL_3;
    }
    v4 = 0;
  }
LABEL_11:
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22.receiver = self;
  v22.super_class = (Class)AFSpeechRequestOptions;
  -[AFSpeechRequestOptions description](&v22, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  activationEvent = self->_activationEvent;
  if (activationEvent > 0x24)
    v12 = CFSTR("Unknown");
  else
    v12 = off_1E3A2DF78[activationEvent];
  v13 = v12;
  turnIdentifier = self->_turnIdentifier;
  presentationMode = self->_presentationMode;
  activationDeviceIdentifier = self->_activationDeviceIdentifier;
  activationEventTime = self->_activationEventTime;
  activationEventMachAbsoluteTime = self->_activationEventMachAbsoluteTime;
  if (objc_msgSend(v4, "length"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" %@"), v4);
    v20 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@, {event = %ld (%@), presentationMode = %ld, turnId = %@, deviceIdentifier = %@, time = %f, hostTime = %llu%@}"), v10, activationEvent, v13, presentationMode, turnIdentifier, activationDeviceIdentifier, *(_QWORD *)&activationEventTime, activationEventMachAbsoluteTime, v19);

  }
  else
  {
    v20 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@, {event = %ld (%@), presentationMode = %ld, turnId = %@, deviceIdentifier = %@, time = %f, hostTime = %llu%@}"), v10, activationEvent, v13, presentationMode, turnIdentifier, activationDeviceIdentifier, *(_QWORD *)&activationEventTime, activationEventMachAbsoluteTime, &stru_1E3A37708);
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activationEvent;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  activationEvent = self->_activationEvent;
  v12 = a3;
  objc_msgSend(v12, "encodeInteger:forKey:", activationEvent, CFSTR("_activationEvent"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_activationDeviceIdentifier, CFSTR("_activationDeviceIdentifier"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isEyesFree, CFSTR("_isEyesFree"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isSystemApertureEnabled, CFSTR("_isSystemApertureEnabled"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isLiveActivitiesSupported, CFSTR("_isLiveActivitiesSupported"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isInAmbient, CFSTR("_isInAmbient"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_serverCommandId, CFSTR("_serverCommandId"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_useAutomaticEndpointing, CFSTR("_useAutomaticEndpointing"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_endpointerOperationMode, CFSTR("_endpointerOperationMode"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_recordingAlertPolicy, CFSTR("_recordingAlertPolicy"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_disableInputAudioPowerUpdate, CFSTR("_disableInputAudioPowerUpdate"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_disableOutputAudioPowerUpdate, CFSTR("_disableOutputAudioPowerUpdate"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_useStreamingDictation, CFSTR("_useStreamingDictation"));
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("_homeButtonDownEventTime"), self->_homeButtonDownEventTime);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_homeButtonDownEventMachAbsoluteTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("_homeButtonDownEventMachAbsoluteTime"));

  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("_activationEventTime"), self->_activationEventTime);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activationEventMachAbsoluteTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("_activationEventMachAbsoluteTime"));

  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("_expectedActivationEventTime"), self->_expectedActivationEventTime);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_stopRecordingHostTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("_stopRecordingHostTime"));

  objc_msgSend(v12, "encodeBool:forKey:", self->_isInitialBringUp, CFSTR("_isInitialBringUp"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_homeButtonUpFromBeep, CFSTR("_homeButtonUpFromBeep"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_acousticIdEnabled, CFSTR("_acousticIdEnabled"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_audioFileType, CFSTR("_audioFileType"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_audioFileHandle, CFSTR("_audioFileHandle"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_voiceTriggerEventInfo, CFSTR("_voiceTriggerEventInfo"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_raiseToSpeakEventInfo, CFSTR("_raiseToSpeakEventInfo"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_myriadContext, CFSTR("_myriadContext"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_scdaContext, CFSTR("_scdaContext"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_releaseAudioSessionOnRecordingCompletion, CFSTR("_releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_recordDeviceIdentifier, CFSTR("_recordDeviceIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_speechRecordingEventListeningEndpoint, CFSTR("_speechRecordingEventListeningEndpoint"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_usePrelisteningMode, CFSTR("_usePrelisteningMode"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_pendCallbacksUntilAfterContinuation, CFSTR("_pendCallbacksUntilAfterContinuation"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_useBorealisBuffer, CFSTR("_useBorealisBuffer"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_notifyState, CFSTR("_notifyState"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_audioFileURL, CFSTR("_audioFileURL"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_suppressStartAlert, CFSTR("_suppressStartAlert"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_suppressStopAlert, CFSTR("_suppressStopAlert"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_hasPlayedStartAlert, CFSTR("_hasPlayedStartAlert"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bargeInOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("_bargeInOptions"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_speechSynthesisRecord, CFSTR("_speechSynthesisRecord"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_reloadSmartSiriVolume, CFSTR("_reloadSmartSiriVolume"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_skipPersonalizedASR, CFSTR("_skipPersonalizedASR"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_clientAnalyticsContext, CFSTR("_clientAnalyticsContext"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_startContext, CFSTR("_startContext"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_stopContext, CFSTR("_stopContext"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isOnPhoneCall, CFSTR("_isOnPhoneCall"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isMediaPlaying, CFSTR("_isMediaPlaying"));
  *(float *)&v9 = self->_mediaPlaybackVolume;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("_mediaPlaybackVolume"), v9);
  objc_msgSend(v12, "encodeObject:forKey:", self->_turnIdentifier, CFSTR("_turnIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_languageDetectionUserContext, CFSTR("_languageDetectionUserContext"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_dictationInputOrigin, CFSTR("_dictationInputOrigin"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_applicationDisplayName, CFSTR("_applicationDisplayName"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("_applicationBundleIdentifier"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_presentationMode, CFSTR("_presentationMode"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_preheatLanguage, CFSTR("_preheatLanguage"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_preheatTestModelPath, CFSTR("_preheatTestModelPath"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_dictationVoiceTriggerAbsStartSampleId);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("_dictationVoiceTriggerAbsStartSampleId"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_continuousConversationInfo, CFSTR("_continuousConversationInfo"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_intuitiveConversationRequestId, CFSTR("_intuitiveConversationRequestId"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_announcementPlatform, CFSTR("_announcementPlatform"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_smartSiriVolumeTTSType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("_smartSiriVolumeTTSType"));

  objc_msgSend(v12, "encodeBool:forKey:", self->_isTest, CFSTR("_isTest"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_testRequestOptions, CFSTR("_testRequestOptions"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isHeadphonesAuthenticated, CFSTR("_isHeadphonesAuthenticated"));

}

- (AFSpeechRequestOptions)initWithCoder:(id)a3
{
  id v4;
  AFSpeechRequestOptions *v5;
  uint64_t v6;
  NSString *activationDeviceIdentifier;
  uint64_t v8;
  NSString *serverCommandId;
  uint64_t v10;
  AFSpeechRecordingAlertPolicy *recordingAlertPolicy;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  NSNumber *homeButtonUpFromBeep;
  uint64_t v20;
  NSFileHandle *audioFileHandle;
  uint64_t v22;
  NSDictionary *voiceTriggerEventInfo;
  NSDictionary *v24;
  uint64_t v25;
  NSDictionary *raiseToSpeakEventInfo;
  NSDictionary *v27;
  uint64_t v28;
  AFMyriadContext *myriadContext;
  uint64_t v30;
  SCDAContext *scdaContext;
  uint64_t v32;
  NSString *recordDeviceIdentifier;
  uint64_t v34;
  NSXPCListenerEndpoint *speechRecordingEventListeningEndpoint;
  uint64_t v36;
  NSNumber *notifyState;
  uint64_t v38;
  NSURL *audioFileURL;
  void *v40;
  uint64_t v41;
  AFSpeechSynthesisRecord *speechSynthesisRecord;
  uint64_t v43;
  NSDictionary *clientAnalyticsContext;
  NSDictionary *v45;
  uint64_t v46;
  NSDictionary *startContext;
  NSDictionary *v48;
  uint64_t v49;
  NSDictionary *stopContext;
  NSDictionary *v51;
  float v52;
  uint64_t v53;
  NSUUID *turnIdentifier;
  uint64_t v55;
  AFLanguageDetectionUserContext *languageDetectionUserContext;
  uint64_t v57;
  NSString *applicationDisplayName;
  uint64_t v59;
  NSString *applicationBundleIdentifier;
  uint64_t v61;
  NSString *preheatLanguage;
  uint64_t v63;
  NSURL *preheatTestModelPath;
  void *v65;
  uint64_t v66;
  NSDictionary *continuousConversationInfo;
  NSDictionary *v68;
  uint64_t v69;
  NSUUID *intuitiveConversationRequestId;
  void *v71;
  uint64_t v72;
  AFSpeechTestRequestOptions *testRequestOptions;
  objc_super v75;

  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)AFSpeechRequestOptions;
  v5 = -[AFSpeechRequestOptions init](&v75, sel_init);
  if (v5)
  {
    v5->_activationEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_activationEvent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activationDeviceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    activationDeviceIdentifier = v5->_activationDeviceIdentifier;
    v5->_activationDeviceIdentifier = (NSString *)v6;

    v5->_isEyesFree = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isEyesFree"));
    v5->_isSystemApertureEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSystemApertureEnabled"));
    v5->_isLiveActivitiesSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isLiveActivitiesSupported"));
    v5->_isInAmbient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isInAmbient"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverCommandId"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverCommandId = v5->_serverCommandId;
    v5->_serverCommandId = (NSString *)v8;

    v5->_useAutomaticEndpointing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useAutomaticEndpointing"));
    v5->_endpointerOperationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_endpointerOperationMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordingAlertPolicy"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordingAlertPolicy = v5->_recordingAlertPolicy;
    v5->_recordingAlertPolicy = (AFSpeechRecordingAlertPolicy *)v10;

    v5->_disableInputAudioPowerUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableInputAudioPowerUpdate"));
    v5->_disableOutputAudioPowerUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableOutputAudioPowerUpdate"));
    v5->_useStreamingDictation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useStreamingDictation"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_homeButtonDownEventTime"));
    v5->_homeButtonDownEventTime = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeButtonDownEventMachAbsoluteTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_homeButtonDownEventMachAbsoluteTime = objc_msgSend(v13, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_activationEventTime"));
    v5->_activationEventTime = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activationEventMachAbsoluteTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activationEventMachAbsoluteTime = objc_msgSend(v15, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_expectedActivationEventTime"));
    v5->_expectedActivationEventTime = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stopRecordingHostTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stopRecordingHostTime = objc_msgSend(v17, "unsignedLongLongValue");

    v5->_isInitialBringUp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isInitialBringUp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeButtonUpFromBeep"));
    v18 = objc_claimAutoreleasedReturnValue();
    homeButtonUpFromBeep = v5->_homeButtonUpFromBeep;
    v5->_homeButtonUpFromBeep = (NSNumber *)v18;

    v5->_acousticIdEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_acousticIdEnabled"));
    v5->_audioFileType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_audioFileType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioFileHandle"));
    v20 = objc_claimAutoreleasedReturnValue();
    audioFileHandle = v5->_audioFileHandle;
    v5->_audioFileHandle = (NSFileHandle *)v20;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_voiceTriggerEventInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEventInfo = v5->_voiceTriggerEventInfo;
    v5->_voiceTriggerEventInfo = (NSDictionary *)v22;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v5->_voiceTriggerEventInfo;
      v5->_voiceTriggerEventInfo = 0;

    }
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_raiseToSpeakEventInfo"));
    v25 = objc_claimAutoreleasedReturnValue();
    raiseToSpeakEventInfo = v5->_raiseToSpeakEventInfo;
    v5->_raiseToSpeakEventInfo = (NSDictionary *)v25;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v5->_raiseToSpeakEventInfo;
      v5->_raiseToSpeakEventInfo = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_myriadContext"));
    v28 = objc_claimAutoreleasedReturnValue();
    myriadContext = v5->_myriadContext;
    v5->_myriadContext = (AFMyriadContext *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scdaContext"));
    v30 = objc_claimAutoreleasedReturnValue();
    scdaContext = v5->_scdaContext;
    v5->_scdaContext = (SCDAContext *)v30;

    v5->_releaseAudioSessionOnRecordingCompletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_releaseAudioSessionOnRecordingCompletion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordDeviceIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    recordDeviceIdentifier = v5->_recordDeviceIdentifier;
    v5->_recordDeviceIdentifier = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechRecordingEventListeningEndpoint"));
    v34 = objc_claimAutoreleasedReturnValue();
    speechRecordingEventListeningEndpoint = v5->_speechRecordingEventListeningEndpoint;
    v5->_speechRecordingEventListeningEndpoint = (NSXPCListenerEndpoint *)v34;

    v5->_usePrelisteningMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usePrelisteningMode"));
    v5->_pendCallbacksUntilAfterContinuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_pendCallbacksUntilAfterContinuation"));
    v5->_useBorealisBuffer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useBorealisBuffer"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notifyState"));
    v36 = objc_claimAutoreleasedReturnValue();
    notifyState = v5->_notifyState;
    v5->_notifyState = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioFileURL"));
    v38 = objc_claimAutoreleasedReturnValue();
    audioFileURL = v5->_audioFileURL;
    v5->_audioFileURL = (NSURL *)v38;

    v5->_suppressStartAlert = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_suppressStartAlert"));
    v5->_suppressStopAlert = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_suppressStopAlert"));
    v5->_hasPlayedStartAlert = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasPlayedStartAlert"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bargeInOptions"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bargeInOptions = objc_msgSend(v40, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechSynthesisRecord"));
    v41 = objc_claimAutoreleasedReturnValue();
    speechSynthesisRecord = v5->_speechSynthesisRecord;
    v5->_speechSynthesisRecord = (AFSpeechSynthesisRecord *)v41;

    v5->_reloadSmartSiriVolume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_reloadSmartSiriVolume"));
    v5->_skipPersonalizedASR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_skipPersonalizedASR"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_clientAnalyticsContext"));
    v43 = objc_claimAutoreleasedReturnValue();
    clientAnalyticsContext = v5->_clientAnalyticsContext;
    v5->_clientAnalyticsContext = (NSDictionary *)v43;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = v5->_clientAnalyticsContext;
      v5->_clientAnalyticsContext = 0;

    }
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_startContext"));
    v46 = objc_claimAutoreleasedReturnValue();
    startContext = v5->_startContext;
    v5->_startContext = (NSDictionary *)v46;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = v5->_startContext;
      v5->_startContext = 0;

    }
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_stopContext"));
    v49 = objc_claimAutoreleasedReturnValue();
    stopContext = v5->_stopContext;
    v5->_stopContext = (NSDictionary *)v49;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = v5->_stopContext;
      v5->_stopContext = 0;

    }
    v5->_isOnPhoneCall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isOnPhoneCall"));
    v5->_isMediaPlaying = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isMediaPlaying"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_mediaPlaybackVolume"));
    v5->_mediaPlaybackVolume = v52;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_turnIdentifier"));
    v53 = objc_claimAutoreleasedReturnValue();
    turnIdentifier = v5->_turnIdentifier;
    v5->_turnIdentifier = (NSUUID *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_languageDetectionUserContext"));
    v55 = objc_claimAutoreleasedReturnValue();
    languageDetectionUserContext = v5->_languageDetectionUserContext;
    v5->_languageDetectionUserContext = (AFLanguageDetectionUserContext *)v55;

    v5->_dictationInputOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dictationInputOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationDisplayName"));
    v57 = objc_claimAutoreleasedReturnValue();
    applicationDisplayName = v5->_applicationDisplayName;
    v5->_applicationDisplayName = (NSString *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationBundleIdentifier"));
    v59 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v59;

    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_presentationMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preheatLanguage"));
    v61 = objc_claimAutoreleasedReturnValue();
    preheatLanguage = v5->_preheatLanguage;
    v5->_preheatLanguage = (NSString *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preheatTestModelPath"));
    v63 = objc_claimAutoreleasedReturnValue();
    preheatTestModelPath = v5->_preheatTestModelPath;
    v5->_preheatTestModelPath = (NSURL *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dictationVoiceTriggerAbsStartSampleId"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dictationVoiceTriggerAbsStartSampleId = objc_msgSend(v65, "unsignedLongLongValue");

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_continuousConversationInfo"));
    v66 = objc_claimAutoreleasedReturnValue();
    continuousConversationInfo = v5->_continuousConversationInfo;
    v5->_continuousConversationInfo = (NSDictionary *)v66;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v68 = v5->_continuousConversationInfo;
      v5->_continuousConversationInfo = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intuitiveConversationRequestId"));
    v69 = objc_claimAutoreleasedReturnValue();
    intuitiveConversationRequestId = v5->_intuitiveConversationRequestId;
    v5->_intuitiveConversationRequestId = (NSUUID *)v69;

    v5->_announcementPlatform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_announcementPlatform"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smartSiriVolumeTTSType"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_smartSiriVolumeTTSType = objc_msgSend(v71, "unsignedIntegerValue");

    v5->_isTest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isTest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_testRequestOptions"));
    v72 = objc_claimAutoreleasedReturnValue();
    testRequestOptions = v5->_testRequestOptions;
    v5->_testRequestOptions = (AFSpeechTestRequestOptions *)v72;

    v5->_isHeadphonesAuthenticated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isHeadphonesAuthenticated"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AFSpeechRequestOptions *v4;
  double v5;

  v4 = -[AFSpeechRequestOptions initWithActivationEvent:]([AFSpeechRequestOptions alloc], "initWithActivationEvent:", self->_activationEvent);
  -[AFSpeechRequestOptions setActivationDeviceIdentifier:](v4, "setActivationDeviceIdentifier:", self->_activationDeviceIdentifier);
  -[AFSpeechRequestOptions setIsEyesFree:](v4, "setIsEyesFree:", self->_isEyesFree);
  -[AFSpeechRequestOptions setIsSystemApertureEnabled:](v4, "setIsSystemApertureEnabled:", self->_isSystemApertureEnabled);
  -[AFSpeechRequestOptions setIsLiveActivitiesSupported:](v4, "setIsLiveActivitiesSupported:", self->_isLiveActivitiesSupported);
  -[AFSpeechRequestOptions setIsInAmbient:](v4, "setIsInAmbient:", self->_isInAmbient);
  -[AFSpeechRequestOptions setServerCommandId:](v4, "setServerCommandId:", self->_serverCommandId);
  -[AFSpeechRequestOptions setUseAutomaticEndpointing:](v4, "setUseAutomaticEndpointing:", self->_useAutomaticEndpointing);
  -[AFSpeechRequestOptions setEndpointerOperationMode:](v4, "setEndpointerOperationMode:", self->_endpointerOperationMode);
  -[AFSpeechRequestOptions setRecordingAlertPolicy:](v4, "setRecordingAlertPolicy:", self->_recordingAlertPolicy);
  -[AFSpeechRequestOptions setDisableInputAudioPowerUpdate:](v4, "setDisableInputAudioPowerUpdate:", self->_disableInputAudioPowerUpdate);
  -[AFSpeechRequestOptions setDisableOutputAudioPowerUpdate:](v4, "setDisableOutputAudioPowerUpdate:", self->_disableOutputAudioPowerUpdate);
  -[AFSpeechRequestOptions setUseStreamingDictation:](v4, "setUseStreamingDictation:", self->_useStreamingDictation);
  -[AFSpeechRequestOptions setHomeButtonDownEventTime:](v4, "setHomeButtonDownEventTime:", self->_homeButtonDownEventTime);
  -[AFSpeechRequestOptions setHomeButtonDownEventMachAbsoluteTime:](v4, "setHomeButtonDownEventMachAbsoluteTime:", self->_homeButtonDownEventMachAbsoluteTime);
  -[AFSpeechRequestOptions setActivationEventTime:](v4, "setActivationEventTime:", self->_activationEventTime);
  -[AFSpeechRequestOptions setActivationEventMachAbsoluteTime:](v4, "setActivationEventMachAbsoluteTime:", self->_activationEventMachAbsoluteTime);
  -[AFSpeechRequestOptions setExpectedActivationEventTime:](v4, "setExpectedActivationEventTime:", self->_expectedActivationEventTime);
  -[AFSpeechRequestOptions setStopRecordingHostTime:](v4, "setStopRecordingHostTime:", self->_stopRecordingHostTime);
  -[AFSpeechRequestOptions setIsInitialBringUp:](v4, "setIsInitialBringUp:", self->_isInitialBringUp);
  -[AFSpeechRequestOptions setHomeButtonUpFromBeep:](v4, "setHomeButtonUpFromBeep:", self->_homeButtonUpFromBeep);
  -[AFSpeechRequestOptions setAcousticIdEnabled:](v4, "setAcousticIdEnabled:", self->_acousticIdEnabled);
  -[AFSpeechRequestOptions setAudioFileType:](v4, "setAudioFileType:", self->_audioFileType);
  -[AFSpeechRequestOptions setAudioFileHandle:](v4, "setAudioFileHandle:", self->_audioFileHandle);
  -[AFSpeechRequestOptions setVoiceTriggerEventInfo:](v4, "setVoiceTriggerEventInfo:", self->_voiceTriggerEventInfo);
  -[AFSpeechRequestOptions setRaiseToSpeakEventInfo:](v4, "setRaiseToSpeakEventInfo:", self->_raiseToSpeakEventInfo);
  -[AFSpeechRequestOptions setMyriadContext:](v4, "setMyriadContext:", self->_myriadContext);
  -[AFSpeechRequestOptions setScdaContext:](v4, "setScdaContext:", self->_scdaContext);
  -[AFSpeechRequestOptions setReleaseAudioSessionOnRecordingCompletion:](v4, "setReleaseAudioSessionOnRecordingCompletion:", self->_releaseAudioSessionOnRecordingCompletion);
  -[AFSpeechRequestOptions setRecordDeviceIdentifier:](v4, "setRecordDeviceIdentifier:", self->_recordDeviceIdentifier);
  -[AFSpeechRequestOptions setSpeechRecordingEventListeningEndpoint:](v4, "setSpeechRecordingEventListeningEndpoint:", self->_speechRecordingEventListeningEndpoint);
  -[AFSpeechRequestOptions setPendCallbacksUntilAfterContinuation:](v4, "setPendCallbacksUntilAfterContinuation:", self->_pendCallbacksUntilAfterContinuation);
  -[AFSpeechRequestOptions setUseBorealisBuffer:](v4, "setUseBorealisBuffer:", self->_useBorealisBuffer);
  -[AFSpeechRequestOptions setNotifyState:](v4, "setNotifyState:", self->_notifyState);
  -[AFSpeechRequestOptions setAudioFileURL:](v4, "setAudioFileURL:", self->_audioFileURL);
  -[AFSpeechRequestOptions setSuppressStartAlert:](v4, "setSuppressStartAlert:", self->_suppressStartAlert);
  -[AFSpeechRequestOptions setSuppressStopAlert:](v4, "setSuppressStopAlert:", self->_suppressStopAlert);
  -[AFSpeechRequestOptions setHasPlayedStartAlert:](v4, "setHasPlayedStartAlert:", self->_hasPlayedStartAlert);
  -[AFSpeechRequestOptions setBargeInOptions:](v4, "setBargeInOptions:", self->_bargeInOptions);
  -[AFSpeechRequestOptions setSpeechSynthesisRecord:](v4, "setSpeechSynthesisRecord:", self->_speechSynthesisRecord);
  -[AFSpeechRequestOptions setReloadSmartSiriVolume:](v4, "setReloadSmartSiriVolume:", self->_reloadSmartSiriVolume);
  -[AFSpeechRequestOptions setSkipPersonalizedASR:](v4, "setSkipPersonalizedASR:", self->_skipPersonalizedASR);
  -[AFSpeechRequestOptions setClientAnalyticsContext:](v4, "setClientAnalyticsContext:", self->_clientAnalyticsContext);
  -[AFSpeechRequestOptions setStartContext:](v4, "setStartContext:", self->_startContext);
  -[AFSpeechRequestOptions setStopContext:](v4, "setStopContext:", self->_stopContext);
  -[AFSpeechRequestOptions setIsOnPhoneCall:](v4, "setIsOnPhoneCall:", self->_isOnPhoneCall);
  -[AFSpeechRequestOptions setIsMediaPlaying:](v4, "setIsMediaPlaying:", self->_isMediaPlaying);
  *(float *)&v5 = self->_mediaPlaybackVolume;
  -[AFSpeechRequestOptions setMediaPlaybackVolume:](v4, "setMediaPlaybackVolume:", v5);
  -[AFSpeechRequestOptions setTurnIdentifier:](v4, "setTurnIdentifier:", self->_turnIdentifier);
  -[AFSpeechRequestOptions setLanguageDetectionUserContext:](v4, "setLanguageDetectionUserContext:", self->_languageDetectionUserContext);
  -[AFSpeechRequestOptions setDictationInputOrigin:](v4, "setDictationInputOrigin:", self->_dictationInputOrigin);
  -[AFSpeechRequestOptions setApplicationDisplayName:](v4, "setApplicationDisplayName:", self->_applicationDisplayName);
  -[AFSpeechRequestOptions setApplicationBundleIdentifier:](v4, "setApplicationBundleIdentifier:", self->_applicationBundleIdentifier);
  -[AFSpeechRequestOptions setPresentationMode:](v4, "setPresentationMode:", self->_presentationMode);
  -[AFSpeechRequestOptions setPreheatLanguage:](v4, "setPreheatLanguage:", self->_preheatLanguage);
  -[AFSpeechRequestOptions setPreheatTestModelPath:](v4, "setPreheatTestModelPath:", self->_preheatTestModelPath);
  -[AFSpeechRequestOptions setDictationVoiceTriggerAbsStartSampleId:](v4, "setDictationVoiceTriggerAbsStartSampleId:", self->_dictationVoiceTriggerAbsStartSampleId);
  -[AFSpeechRequestOptions setContinuousConversationInfo:](v4, "setContinuousConversationInfo:", self->_continuousConversationInfo);
  -[AFSpeechRequestOptions setIntuitiveConversationRequestId:](v4, "setIntuitiveConversationRequestId:", self->_intuitiveConversationRequestId);
  -[AFSpeechRequestOptions setAnnouncementPlatform:](v4, "setAnnouncementPlatform:", self->_announcementPlatform);
  -[AFSpeechRequestOptions setSmartSiriVolumeTTSType:](v4, "setSmartSiriVolumeTTSType:", self->_smartSiriVolumeTTSType);
  -[AFSpeechRequestOptions setIsTest:](v4, "setIsTest:", self->_isTest);
  -[AFSpeechRequestOptions setTestRequestOptions:](v4, "setTestRequestOptions:", self->_testRequestOptions);
  -[AFSpeechRequestOptions setIsHeadphonesAuthenticated:](v4, "setIsHeadphonesAuthenticated:", self->_isHeadphonesAuthenticated);
  return v4;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (NSString)activationDeviceIdentifier
{
  return self->_activationDeviceIdentifier;
}

- (void)setActivationDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
}

- (void)setIsSystemApertureEnabled:(BOOL)a3
{
  self->_isSystemApertureEnabled = a3;
}

- (void)setIsLiveActivitiesSupported:(BOOL)a3
{
  self->_isLiveActivitiesSupported = a3;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (NSString)serverCommandId
{
  return self->_serverCommandId;
}

- (void)setServerCommandId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)useAutomaticEndpointing
{
  return self->_useAutomaticEndpointing;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->_useAutomaticEndpointing = a3;
}

- (int64_t)endpointerOperationMode
{
  return self->_endpointerOperationMode;
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  self->_endpointerOperationMode = a3;
}

- (AFSpeechRecordingAlertPolicy)recordingAlertPolicy
{
  return self->_recordingAlertPolicy;
}

- (void)setRecordingAlertPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)disableInputAudioPowerUpdate
{
  return self->_disableInputAudioPowerUpdate;
}

- (void)setDisableInputAudioPowerUpdate:(BOOL)a3
{
  self->_disableInputAudioPowerUpdate = a3;
}

- (BOOL)disableOutputAudioPowerUpdate
{
  return self->_disableOutputAudioPowerUpdate;
}

- (void)setDisableOutputAudioPowerUpdate:(BOOL)a3
{
  self->_disableOutputAudioPowerUpdate = a3;
}

- (BOOL)useStreamingDictation
{
  return self->_useStreamingDictation;
}

- (void)setUseStreamingDictation:(BOOL)a3
{
  self->_useStreamingDictation = a3;
}

- (double)homeButtonDownEventTime
{
  return self->_homeButtonDownEventTime;
}

- (void)setHomeButtonDownEventTime:(double)a3
{
  self->_homeButtonDownEventTime = a3;
}

- (unint64_t)homeButtonDownEventMachAbsoluteTime
{
  return self->_homeButtonDownEventMachAbsoluteTime;
}

- (void)setHomeButtonDownEventMachAbsoluteTime:(unint64_t)a3
{
  self->_homeButtonDownEventMachAbsoluteTime = a3;
}

- (double)activationEventTime
{
  return self->_activationEventTime;
}

- (void)setActivationEventTime:(double)a3
{
  self->_activationEventTime = a3;
}

- (unint64_t)activationEventMachAbsoluteTime
{
  return self->_activationEventMachAbsoluteTime;
}

- (void)setActivationEventMachAbsoluteTime:(unint64_t)a3
{
  self->_activationEventMachAbsoluteTime = a3;
}

- (double)expectedActivationEventTime
{
  return self->_expectedActivationEventTime;
}

- (void)setExpectedActivationEventTime:(double)a3
{
  self->_expectedActivationEventTime = a3;
}

- (unint64_t)stopRecordingHostTime
{
  return self->_stopRecordingHostTime;
}

- (void)setStopRecordingHostTime:(unint64_t)a3
{
  self->_stopRecordingHostTime = a3;
}

- (BOOL)isInitialBringUp
{
  return self->_isInitialBringUp;
}

- (void)setIsInitialBringUp:(BOOL)a3
{
  self->_isInitialBringUp = a3;
}

- (NSNumber)homeButtonUpFromBeep
{
  return self->_homeButtonUpFromBeep;
}

- (void)setHomeButtonUpFromBeep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)acousticIdEnabled
{
  return self->_acousticIdEnabled;
}

- (void)setAcousticIdEnabled:(BOOL)a3
{
  self->_acousticIdEnabled = a3;
}

- (int64_t)audioFileType
{
  return self->_audioFileType;
}

- (void)setAudioFileType:(int64_t)a3
{
  self->_audioFileType = a3;
}

- (NSFileHandle)audioFileHandle
{
  return self->_audioFileHandle;
}

- (void)setAudioFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileHandle, a3);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)raiseToSpeakEventInfo
{
  return self->_raiseToSpeakEventInfo;
}

- (void)setRaiseToSpeakEventInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (AFMyriadContext)myriadContext
{
  return self->_myriadContext;
}

- (void)setMyriadContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (SCDAContext)scdaContext
{
  return self->_scdaContext;
}

- (void)setScdaContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (NSString)recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)setRecordDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSXPCListenerEndpoint)speechRecordingEventListeningEndpoint
{
  return self->_speechRecordingEventListeningEndpoint;
}

- (void)setSpeechRecordingEventListeningEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_speechRecordingEventListeningEndpoint, a3);
}

- (BOOL)usePrelisteningMode
{
  return self->_usePrelisteningMode;
}

- (void)setUsePrelisteningMode:(BOOL)a3
{
  self->_usePrelisteningMode = a3;
}

- (BOOL)pendCallbacksUntilAfterContinuation
{
  return self->_pendCallbacksUntilAfterContinuation;
}

- (void)setPendCallbacksUntilAfterContinuation:(BOOL)a3
{
  self->_pendCallbacksUntilAfterContinuation = a3;
}

- (BOOL)useBorealisBuffer
{
  return self->_useBorealisBuffer;
}

- (void)setUseBorealisBuffer:(BOOL)a3
{
  self->_useBorealisBuffer = a3;
}

- (BOOL)reloadSmartSiriVolume
{
  return self->_reloadSmartSiriVolume;
}

- (void)setReloadSmartSiriVolume:(BOOL)a3
{
  self->_reloadSmartSiriVolume = a3;
}

- (BOOL)skipPersonalizedASR
{
  return self->_skipPersonalizedASR;
}

- (void)setSkipPersonalizedASR:(BOOL)a3
{
  self->_skipPersonalizedASR = a3;
}

- (NSNumber)notifyState
{
  return self->_notifyState;
}

- (void)setNotifyState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)suppressStartAlert
{
  return self->_suppressStartAlert;
}

- (void)setSuppressStartAlert:(BOOL)a3
{
  self->_suppressStartAlert = a3;
}

- (BOOL)suppressStopAlert
{
  return self->_suppressStopAlert;
}

- (void)setSuppressStopAlert:(BOOL)a3
{
  self->_suppressStopAlert = a3;
}

- (BOOL)hasPlayedStartAlert
{
  return self->_hasPlayedStartAlert;
}

- (void)setHasPlayedStartAlert:(BOOL)a3
{
  self->_hasPlayedStartAlert = a3;
}

- (unint64_t)bargeInOptions
{
  return self->_bargeInOptions;
}

- (void)setBargeInOptions:(unint64_t)a3
{
  self->_bargeInOptions = a3;
}

- (AFSpeechSynthesisRecord)speechSynthesisRecord
{
  return self->_speechSynthesisRecord;
}

- (void)setSpeechSynthesisRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDictionary)clientAnalyticsContext
{
  return self->_clientAnalyticsContext;
}

- (void)setClientAnalyticsContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSDictionary)startContext
{
  return self->_startContext;
}

- (void)setStartContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDictionary)stopContext
{
  return self->_stopContext;
}

- (void)setStopContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)isOnPhoneCall
{
  return self->_isOnPhoneCall;
}

- (void)setIsOnPhoneCall:(BOOL)a3
{
  self->_isOnPhoneCall = a3;
}

- (BOOL)skipGeneratingSpeechPacket
{
  return self->_skipGeneratingSpeechPacket;
}

- (void)setSkipGeneratingSpeechPacket:(BOOL)a3
{
  self->_skipGeneratingSpeechPacket = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (float)mediaPlaybackVolume
{
  return self->_mediaPlaybackVolume;
}

- (void)setMediaPlaybackVolume:(float)a3
{
  self->_mediaPlaybackVolume = a3;
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (void)setLanguageDetectionUserContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (void)setDictationInputOrigin:(int64_t)a3
{
  self->_dictationInputOrigin = a3;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (NSString)preheatLanguage
{
  return self->_preheatLanguage;
}

- (void)setPreheatLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSURL)preheatTestModelPath
{
  return self->_preheatTestModelPath;
}

- (void)setPreheatTestModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unint64_t)dictationVoiceTriggerAbsStartSampleId
{
  return self->_dictationVoiceTriggerAbsStartSampleId;
}

- (void)setDictationVoiceTriggerAbsStartSampleId:(unint64_t)a3
{
  self->_dictationVoiceTriggerAbsStartSampleId = a3;
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)isHybridUODEnabled
{
  return self->_hybridUODEnabled;
}

- (void)setHybridUODEnabled:(BOOL)a3
{
  self->_hybridUODEnabled = a3;
}

- (NSDictionary)continuousConversationInfo
{
  return self->_continuousConversationInfo;
}

- (void)setContinuousConversationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSUUID)intuitiveConversationRequestId
{
  return self->_intuitiveConversationRequestId;
}

- (void)setIntuitiveConversationRequestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int64_t)announcementPlatform
{
  return self->_announcementPlatform;
}

- (void)setAnnouncementPlatform:(int64_t)a3
{
  self->_announcementPlatform = a3;
}

- (unint64_t)smartSiriVolumeTTSType
{
  return self->_smartSiriVolumeTTSType;
}

- (void)setSmartSiriVolumeTTSType:(unint64_t)a3
{
  self->_smartSiriVolumeTTSType = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (AFSpeechTestRequestOptions)testRequestOptions
{
  return self->_testRequestOptions;
}

- (void)setTestRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (BOOL)isHeadphonesAuthenticated
{
  return self->_isHeadphonesAuthenticated;
}

- (void)setIsHeadphonesAuthenticated:(BOOL)a3
{
  self->_isHeadphonesAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRequestOptions, 0);
  objc_storeStrong((id *)&self->_intuitiveConversationRequestId, 0);
  objc_storeStrong((id *)&self->_continuousConversationInfo, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_preheatTestModelPath, 0);
  objc_storeStrong((id *)&self->_preheatLanguage, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_stopContext, 0);
  objc_storeStrong((id *)&self->_startContext, 0);
  objc_storeStrong((id *)&self->_clientAnalyticsContext, 0);
  objc_storeStrong((id *)&self->_speechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_notifyState, 0);
  objc_storeStrong((id *)&self->_speechRecordingEventListeningEndpoint, 0);
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scdaContext, 0);
  objc_storeStrong((id *)&self->_myriadContext, 0);
  objc_storeStrong((id *)&self->_raiseToSpeakEventInfo, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_homeButtonUpFromBeep, 0);
  objc_storeStrong((id *)&self->_recordingAlertPolicy, 0);
  objc_storeStrong((id *)&self->_serverCommandId, 0);
  objc_storeStrong((id *)&self->_activationDeviceIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
