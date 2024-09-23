@implementation CSAudioStartStreamOption

- (id)avvcStartRecordSettingsWithAudioStreamHandleId:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89C00]), "initWithStreamID:atStartHostTime:", a3, -[CSAudioStartStreamOption startRecordingHostTime](self, "startRecordingHostTime"));
  v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v16 = 136315394;
    v17 = "-[CSAudioStartStreamOption(AVVC) avvcStartRecordSettingsWithAudioStreamHandleId:]";
    v18 = 2050;
    v19 = -[CSAudioStartStreamOption startRecordingHostTime](self, "startRecordingHostTime");
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Start Recording Host Time = %{public}llu", (uint8_t *)&v16, 0x16u);

  }
  -[CSAudioStartStreamOption avvcAlertBehavior](self, "avvcAlertBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E68A17F8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E68A17F8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setStartAlert:", objc_msgSend(v10, "unsignedIntegerValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E68A1810);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E68A1810);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setStopAlert:", objc_msgSend(v12, "unsignedIntegerValue"));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E68A1828);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E68A1828);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setStopOnErrorAlert:", objc_msgSend(v14, "unsignedIntegerValue"));

    }
  }
  objc_msgSend(v4, "setSkipAlert:", -[CSAudioStartStreamOption skipAlertBehavior](self, "skipAlertBehavior"));

  return v4;
}

- (void)setAVVCAlertBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E68A17F8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E68A17F8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", objc_msgSend(v6, "unsignedIntegerValue"));

    }
    else
    {
      v7 = -1;
    }
    -[CSAudioStartStreamOption setStartAlertBehavior:](self, "setStartAlertBehavior:", v7);
    objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E68A1810);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E68A1810);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", objc_msgSend(v10, "unsignedIntegerValue"));

    }
    else
    {
      v11 = -1;
    }
    -[CSAudioStartStreamOption setStopAlertBehavior:](self, "setStopAlertBehavior:", v11);
    objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E68A1828);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E68A1828);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CSAudioStartStreamOption _alertBehaviorTypeFromAVVCOverrideType:](self, "_alertBehaviorTypeFromAVVCOverrideType:", objc_msgSend(v13, "unsignedIntegerValue"));

    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = -1;
    -[CSAudioStartStreamOption setStartAlertBehavior:](self, "setStartAlertBehavior:", -1);
    -[CSAudioStartStreamOption setStopAlertBehavior:](self, "setStopAlertBehavior:", -1);
  }
  -[CSAudioStartStreamOption setErrorAlertBehavior:](self, "setErrorAlertBehavior:", v8);

}

- (id)avvcAlertBehavior
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CSAudioStartStreamOption avvcAlertOverrideType:](CSAudioStartStreamOption, "avvcAlertOverrideType:", -[CSAudioStartStreamOption startAlertBehavior](self, "startAlertBehavior"));
  v5 = +[CSAudioStartStreamOption avvcAlertOverrideType:](CSAudioStartStreamOption, "avvcAlertOverrideType:", -[CSAudioStartStreamOption stopAlertBehavior](self, "stopAlertBehavior"));
  v6 = +[CSAudioStartStreamOption avvcAlertOverrideType:](CSAudioStartStreamOption, "avvcAlertOverrideType:", -[CSAudioStartStreamOption errorAlertBehavior](self, "errorAlertBehavior"));
  if (-[CSAudioStartStreamOption startAlertBehavior](self, "startAlertBehavior") != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, &unk_1E68A17F8);

  }
  if (-[CSAudioStartStreamOption stopAlertBehavior](self, "stopAlertBehavior") != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, &unk_1E68A1810);

  }
  if (-[CSAudioStartStreamOption errorAlertBehavior](self, "errorAlertBehavior") != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, &unk_1E68A1828);

  }
  return v3;
}

- (BOOL)isAlertBehaviorOverridedBeep
{
  return -[CSAudioStartStreamOption startAlertBehavior](self, "startAlertBehavior") == 2
      || -[CSAudioStartStreamOption stopAlertBehavior](self, "stopAlertBehavior") == 2
      || -[CSAudioStartStreamOption errorAlertBehavior](self, "errorAlertBehavior") == 2;
}

- (int64_t)_alertBehaviorTypeFromAVVCOverrideType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
    return -1;
  else
    return a3;
}

- (void)adjustStartRecordingHostTime:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0C89B08], "hostTimeForSeconds:", 10.0);
  if (v5 >= a3)
  {
    v6 = a3;
  }
  else
  {
    v6 = v5;
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[CSAudioStartStreamOption(AVVC) adjustStartRecordingHostTime:]";
      v15 = 2050;
      v16 = a3;
      v17 = 2050;
      v18 = v6;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s received hostTimeAdjustment of %{public}llu, instead using max of %{public}llu.", (uint8_t *)&v13, 0x20u);
    }
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitAudioIssueReport:", CFSTR("audioStartStreamOptionStartHostTimeAdjustmentExceededMax"));

  }
  v9 = -[CSAudioStartStreamOption startRecordingHostTime](self, "startRecordingHostTime");
  if (!v9)
    v9 = mach_absolute_time();
  -[CSAudioStartStreamOption setStartRecordingHostTime:](self, "setStartRecordingHostTime:", v9 + v6);
  v10 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = -[CSAudioStartStreamOption startRecordingHostTime](self, "startRecordingHostTime");
    v13 = 136315650;
    v14 = "-[CSAudioStartStreamOption(AVVC) adjustStartRecordingHostTime:]";
    v15 = 2050;
    v16 = v9;
    v17 = 2050;
    v18 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Start Recording Host Time: adjustment %{public}llu -> %{public}llu", (uint8_t *)&v13, 0x20u);

  }
}

+ (int64_t)avvcAlertOverrideType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

- (id)initTandemWithOption:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  +[CSAudioStartStreamOption noAlertOption](CSAudioStartStreamOption, "noAlertOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestHistoricalAudioDataSampleCount:", objc_msgSend(v4, "requestHistoricalAudioDataSampleCount"));
  objc_msgSend(v5, "setRequestHistoricalAudioDataWithHostTime:", objc_msgSend(v4, "requestHistoricalAudioDataWithHostTime"));
  objc_msgSend(v5, "setStartRecordingHostTime:", objc_msgSend(v4, "startRecordingHostTime"));
  objc_msgSend(v5, "setStartRecordingSampleCount:", objc_msgSend(v4, "startRecordingSampleCount"));
  objc_msgSend(v5, "setUseOpportunisticZLL:", objc_msgSend(v4, "useOpportunisticZLL"));
  objc_msgSend(v5, "setRequireSingleChannelLookup:", objc_msgSend(v4, "requireSingleChannelLookup"));
  objc_msgSend(v5, "setSelectedChannel:", objc_msgSend(v4, "selectedChannel"));
  v6 = objc_msgSend(v4, "disableBoostForDoAP");

  objc_msgSend(v5, "setDisableBoostForDoAP:", v6);
  return v5;
}

- (CSAudioStartStreamOption)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioStartStreamOption *v5;
  const char *string;
  uint64_t v7;
  NSString *requestMHUUID;
  const char *v9;
  uint64_t v10;
  NSString *siriSessionUUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAudioStartStreamOption;
  v5 = -[CSAudioStartStreamOption init](&v13, sel_init);
  if (v5)
  {
    v5->_requestHistoricalAudioDataWithHostTime = xpc_dictionary_get_BOOL(v4, "requestHistoricalAudioDataWithHostTime");
    v5->_requestHistoricalAudioDataSampleCount = xpc_dictionary_get_BOOL(v4, "requestHistoricalAudioDataSampleCount");
    v5->_startRecordingHostTime = xpc_dictionary_get_uint64(v4, "startRecordingHostTime");
    v5->_startRecordingSampleCount = xpc_dictionary_get_uint64(v4, "startRecordingSampleCount");
    v5->_useOpportunisticZLL = xpc_dictionary_get_BOOL(v4, "useOpportunisticZLL");
    v5->_startAlertBehavior = xpc_dictionary_get_int64(v4, "startAlertBehavior");
    v5->_stopAlertBehavior = xpc_dictionary_get_int64(v4, "stopAlertBehavior");
    v5->_errorAlertBehavior = xpc_dictionary_get_int64(v4, "errorAlertBehavior");
    v5->_skipAlertBehavior = xpc_dictionary_get_BOOL(v4, "skipAlertBehavior");
    v5->_requireSingleChannelLookup = xpc_dictionary_get_BOOL(v4, "requireSingleChannelLookup");
    v5->_selectedChannel = xpc_dictionary_get_uint64(v4, "selectedChannel");
    v5->_estimatedStartHostTime = xpc_dictionary_get_uint64(v4, "estimatedStartHostTime");
    v5->_disableEndpointer = xpc_dictionary_get_BOOL(v4, "disableEndpointer");
    v5->_disableLocalSpeechRecognizer = xpc_dictionary_get_BOOL(v4, "disableLocalSpeechRecognizer");
    v5->_disablePrewarmLocalAsrAtStartRecording = xpc_dictionary_get_BOOL(v4, "disablePrewarmLocalSpeechRecognizer");
    v5->_disableBoostForDoAP = xpc_dictionary_get_BOOL(v4, "disableBoostForDoAP");
    v5->_requestTelephonyDownlinkAudioTap = xpc_dictionary_get_BOOL(v4, "requestTelephonyDownlinkTap");
    v5->_allowRecordWhileBeep = xpc_dictionary_get_BOOL(v4, "allowRecordWhileBeep");
    v5->_disableRCSelection = xpc_dictionary_get_BOOL(v4, "disableRCSelection");
    string = xpc_dictionary_get_string(v4, "requestMHUUID");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v7 = objc_claimAutoreleasedReturnValue();
      requestMHUUID = v5->_requestMHUUID;
      v5->_requestMHUUID = (NSString *)v7;

    }
    v9 = xpc_dictionary_get_string(v4, "siriSessionUUID");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      siriSessionUUID = v5->_siriSessionUUID;
      v5->_siriSessionUUID = (NSString *)v10;

    }
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  NSString *requestMHUUID;
  NSString *siriSessionUUID;
  uint64_t i;
  xpc_object_t values[19];
  char *keys[20];

  keys[19] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "requestHistoricalAudioDataWithHostTime";
  keys[1] = "requestHistoricalAudioDataSampleCount";
  keys[2] = "startRecordingHostTime";
  keys[3] = "startRecordingSampleCount";
  keys[4] = "useOpportunisticZLL";
  keys[5] = "startAlertBehavior";
  keys[6] = "stopAlertBehavior";
  keys[7] = "errorAlertBehavior";
  keys[8] = "skipAlertBehavior";
  keys[9] = "requireSingleChannelLookup";
  keys[10] = "selectedChannel";
  keys[11] = "estimatedStartHostTime";
  keys[12] = "disableEndpointer";
  keys[13] = "disableLocalSpeechRecognizer";
  keys[14] = "disablePrewarmLocalSpeechRecognizer";
  keys[15] = "disableBoostForDoAP";
  keys[16] = "requestTelephonyDownlinkTap";
  keys[17] = "allowRecordWhileBeep";
  keys[18] = "disableRCSelection";
  values[0] = xpc_BOOL_create(self->_requestHistoricalAudioDataWithHostTime);
  values[1] = xpc_BOOL_create(self->_requestHistoricalAudioDataSampleCount);
  values[2] = xpc_uint64_create(self->_startRecordingHostTime);
  values[3] = xpc_uint64_create(self->_startRecordingSampleCount);
  values[4] = xpc_BOOL_create(self->_useOpportunisticZLL);
  values[5] = xpc_int64_create(self->_startAlertBehavior);
  values[6] = xpc_int64_create(self->_stopAlertBehavior);
  values[7] = xpc_int64_create(self->_errorAlertBehavior);
  values[8] = xpc_BOOL_create(self->_skipAlertBehavior);
  values[9] = xpc_BOOL_create(self->_requireSingleChannelLookup);
  values[10] = xpc_uint64_create(self->_selectedChannel);
  values[11] = xpc_uint64_create(self->_estimatedStartHostTime);
  values[12] = xpc_BOOL_create(self->_disableEndpointer);
  values[13] = xpc_BOOL_create(self->_disableLocalSpeechRecognizer);
  values[14] = xpc_BOOL_create(self->_disablePrewarmLocalAsrAtStartRecording);
  values[15] = xpc_BOOL_create(self->_disableBoostForDoAP);
  values[16] = xpc_BOOL_create(self->_requestTelephonyDownlinkAudioTap);
  values[17] = xpc_BOOL_create(self->_allowRecordWhileBeep);
  values[18] = xpc_BOOL_create(self->_disableRCSelection);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 0x13uLL);
  requestMHUUID = self->_requestMHUUID;
  if (requestMHUUID)
    xpc_dictionary_set_string(v3, "requestMHUUID", -[NSString UTF8String](requestMHUUID, "UTF8String"));
  siriSessionUUID = self->_siriSessionUUID;
  if (siriSessionUUID)
    xpc_dictionary_set_string(v3, "siriSessionUUID", -[NSString UTF8String](siriSessionUUID, "UTF8String"));
  for (i = 18; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSAudioStartStreamOption *v4;

  v4 = objc_alloc_init(CSAudioStartStreamOption);
  -[CSAudioStartStreamOption setRequestHistoricalAudioDataWithHostTime:](v4, "setRequestHistoricalAudioDataWithHostTime:", self->_requestHistoricalAudioDataWithHostTime);
  -[CSAudioStartStreamOption setRequestHistoricalAudioDataSampleCount:](v4, "setRequestHistoricalAudioDataSampleCount:", self->_requestHistoricalAudioDataSampleCount);
  -[CSAudioStartStreamOption setStartRecordingHostTime:](v4, "setStartRecordingHostTime:", self->_startRecordingHostTime);
  -[CSAudioStartStreamOption setStartRecordingSampleCount:](v4, "setStartRecordingSampleCount:", self->_startRecordingSampleCount);
  -[CSAudioStartStreamOption setUseOpportunisticZLL:](v4, "setUseOpportunisticZLL:", self->_useOpportunisticZLL);
  -[CSAudioStartStreamOption setStartAlertBehavior:](v4, "setStartAlertBehavior:", self->_startAlertBehavior);
  -[CSAudioStartStreamOption setStopAlertBehavior:](v4, "setStopAlertBehavior:", self->_stopAlertBehavior);
  -[CSAudioStartStreamOption setErrorAlertBehavior:](v4, "setErrorAlertBehavior:", self->_errorAlertBehavior);
  -[CSAudioStartStreamOption setSkipAlertBehavior:](v4, "setSkipAlertBehavior:", self->_skipAlertBehavior);
  -[CSAudioStartStreamOption setRequireSingleChannelLookup:](v4, "setRequireSingleChannelLookup:", self->_requireSingleChannelLookup);
  -[CSAudioStartStreamOption setSelectedChannel:](v4, "setSelectedChannel:", self->_selectedChannel);
  -[CSAudioStartStreamOption setDisableEndpointer:](v4, "setDisableEndpointer:", self->_disableEndpointer);
  -[CSAudioStartStreamOption setDisableLocalSpeechRecognizer:](v4, "setDisableLocalSpeechRecognizer:", self->_disableLocalSpeechRecognizer);
  -[CSAudioStartStreamOption setDisablePrewarmLocalAsrAtStartRecording:](v4, "setDisablePrewarmLocalAsrAtStartRecording:", self->_disablePrewarmLocalAsrAtStartRecording);
  -[CSAudioStartStreamOption setRequestMHUUID:](v4, "setRequestMHUUID:", self->_requestMHUUID);
  -[CSAudioStartStreamOption setSiriSessionUUID:](v4, "setSiriSessionUUID:", self->_siriSessionUUID);
  -[CSAudioStartStreamOption setDisableBoostForDoAP:](v4, "setDisableBoostForDoAP:", self->_disableBoostForDoAP);
  -[CSAudioStartStreamOption setRequestTelephonyDownlinkAudioTap:](v4, "setRequestTelephonyDownlinkAudioTap:", self->_requestTelephonyDownlinkAudioTap);
  -[CSAudioStartStreamOption setAllowRecordWhileBeep:](v4, "setAllowRecordWhileBeep:", self->_allowRecordWhileBeep);
  -[CSAudioStartStreamOption setDisableRCSelection:](v4, "setDisableRCSelection:", self->_disableRCSelection);
  return v4;
}

- (NSString)localizedDescription
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (self->_requestHistoricalAudioDataWithHostTime)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[requestHistoricalAudioDataWithHostTime = %@]"), v5);
  if (self->_requestHistoricalAudioDataSampleCount)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestHistoricalAudioDataSampleCount = %@]"), v6);
  if (self->_useOpportunisticZLL)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[useOpportunisticZLL = %@]"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("[startRecordingHostTime = %llu]"), self->_startRecordingHostTime);
  objc_msgSend(v4, "appendFormat:", CFSTR("[startRecordingSampleCount = %llu]"), self->_startRecordingSampleCount);
  objc_msgSend(v4, "appendFormat:", CFSTR("[alertBehavior = %ld %ld %ld]"), self->_startAlertBehavior, self->_stopAlertBehavior, self->_errorAlertBehavior);
  if (self->_skipAlertBehavior)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[skipAlertBehavior = %@]"), v8);
  if (self->_requireSingleChannelLookup)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[requireSingleChannelLookup = %@]"), v9);
  objc_msgSend(v4, "appendFormat:", CFSTR("[selectedChannel = %u]"), self->_selectedChannel);
  objc_msgSend(v4, "appendFormat:", CFSTR("[estimatedStartHostTime = %llu"), self->_estimatedStartHostTime);
  objc_msgSend(v4, "appendFormat:", CFSTR("[disableEndpointer = %d]"), self->_disableEndpointer);
  objc_msgSend(v4, "appendFormat:", CFSTR("[disableLocalSpeechRecognizer = %d]"), self->_disableLocalSpeechRecognizer);
  objc_msgSend(v4, "appendFormat:", CFSTR("[disablePrewarmLocalSpeechRecognizer = %d]"), self->_disablePrewarmLocalAsrAtStartRecording);
  objc_msgSend(v4, "appendFormat:", CFSTR("[disableBoostForDoAP = %d]"), self->_disableBoostForDoAP);
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestTelephonyDownlinkTap = %d]"), self->_requestTelephonyDownlinkAudioTap);
  objc_msgSend(v4, "appendFormat:", CFSTR("[allowRecordWhileBeep = %d]"), self->_allowRecordWhileBeep);
  if (self->_disableRCSelection)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[disableRCSelection = %@]"), v10);
  return (NSString *)v4;
}

- (BOOL)requestHistoricalAudioDataWithHostTime
{
  return self->_requestHistoricalAudioDataWithHostTime;
}

- (void)setRequestHistoricalAudioDataWithHostTime:(BOOL)a3
{
  self->_requestHistoricalAudioDataWithHostTime = a3;
}

- (BOOL)requestHistoricalAudioDataSampleCount
{
  return self->_requestHistoricalAudioDataSampleCount;
}

- (void)setRequestHistoricalAudioDataSampleCount:(BOOL)a3
{
  self->_requestHistoricalAudioDataSampleCount = a3;
}

- (unint64_t)startRecordingHostTime
{
  return self->_startRecordingHostTime;
}

- (void)setStartRecordingHostTime:(unint64_t)a3
{
  self->_startRecordingHostTime = a3;
}

- (unint64_t)startRecordingSampleCount
{
  return self->_startRecordingSampleCount;
}

- (void)setStartRecordingSampleCount:(unint64_t)a3
{
  self->_startRecordingSampleCount = a3;
}

- (BOOL)useOpportunisticZLL
{
  return self->_useOpportunisticZLL;
}

- (void)setUseOpportunisticZLL:(BOOL)a3
{
  self->_useOpportunisticZLL = a3;
}

- (int64_t)startAlertBehavior
{
  return self->_startAlertBehavior;
}

- (void)setStartAlertBehavior:(int64_t)a3
{
  self->_startAlertBehavior = a3;
}

- (int64_t)stopAlertBehavior
{
  return self->_stopAlertBehavior;
}

- (void)setStopAlertBehavior:(int64_t)a3
{
  self->_stopAlertBehavior = a3;
}

- (int64_t)errorAlertBehavior
{
  return self->_errorAlertBehavior;
}

- (void)setErrorAlertBehavior:(int64_t)a3
{
  self->_errorAlertBehavior = a3;
}

- (BOOL)skipAlertBehavior
{
  return self->_skipAlertBehavior;
}

- (void)setSkipAlertBehavior:(BOOL)a3
{
  self->_skipAlertBehavior = a3;
}

- (BOOL)requireSingleChannelLookup
{
  return self->_requireSingleChannelLookup;
}

- (void)setRequireSingleChannelLookup:(BOOL)a3
{
  self->_requireSingleChannelLookup = a3;
}

- (unsigned)selectedChannel
{
  return self->_selectedChannel;
}

- (void)setSelectedChannel:(unsigned int)a3
{
  self->_selectedChannel = a3;
}

- (unint64_t)estimatedStartHostTime
{
  return self->_estimatedStartHostTime;
}

- (void)setEstimatedStartHostTime:(unint64_t)a3
{
  self->_estimatedStartHostTime = a3;
}

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

- (void)setDisableEndpointer:(BOOL)a3
{
  self->_disableEndpointer = a3;
}

- (BOOL)disableLocalSpeechRecognizer
{
  return self->_disableLocalSpeechRecognizer;
}

- (void)setDisableLocalSpeechRecognizer:(BOOL)a3
{
  self->_disableLocalSpeechRecognizer = a3;
}

- (BOOL)disablePrewarmLocalAsrAtStartRecording
{
  return self->_disablePrewarmLocalAsrAtStartRecording;
}

- (void)setDisablePrewarmLocalAsrAtStartRecording:(BOOL)a3
{
  self->_disablePrewarmLocalAsrAtStartRecording = a3;
}

- (BOOL)disableBoostForDoAP
{
  return self->_disableBoostForDoAP;
}

- (void)setDisableBoostForDoAP:(BOOL)a3
{
  self->_disableBoostForDoAP = a3;
}

- (BOOL)requestTelephonyDownlinkAudioTap
{
  return self->_requestTelephonyDownlinkAudioTap;
}

- (void)setRequestTelephonyDownlinkAudioTap:(BOOL)a3
{
  self->_requestTelephonyDownlinkAudioTap = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestMHUUID, a3);
}

- (NSString)siriSessionUUID
{
  return self->_siriSessionUUID;
}

- (void)setSiriSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_siriSessionUUID, a3);
}

- (BOOL)allowRecordWhileBeep
{
  return self->_allowRecordWhileBeep;
}

- (void)setAllowRecordWhileBeep:(BOOL)a3
{
  self->_allowRecordWhileBeep = a3;
}

- (BOOL)disableRCSelection
{
  return self->_disableRCSelection;
}

- (void)setDisableRCSelection:(BOOL)a3
{
  self->_disableRCSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSessionUUID, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

+ (id)noAlertOption
{
  CSAudioStartStreamOption *v2;

  v2 = objc_alloc_init(CSAudioStartStreamOption);
  -[CSAudioStartStreamOption setSkipAlertBehavior:](v2, "setSkipAlertBehavior:", 1);
  return v2;
}

@end
