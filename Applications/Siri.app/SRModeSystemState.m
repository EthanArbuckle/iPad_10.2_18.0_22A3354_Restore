@implementation SRModeSystemState

- (SRModeSystemState)init
{
  SRModeSystemState *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *audioAccessoryQueue;
  uint64_t v8;
  AVOutputContext *sharedSystemAudioContext;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  AFNotifyObserver *v13;
  AFNotifyObserver *ringerStateObserver;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SRModeSystemState;
  v2 = -[SRModeSystemState init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v4 = (unint64_t)objc_msgSend(v3, "useDeviceSpeakerForTTS");
    if (v4 > 3)
      v5 = 1;
    else
      v5 = qword_1000C0C68[v4];
    v2->_voiceFeedbackSetting = v5;

    v6 = dispatch_queue_create("com.apple.siri.AudioAccessoryQueue", 0);
    audioAccessoryQueue = v2->_audioAccessoryQueue;
    v2->_audioAccessoryQueue = (OS_dispatch_queue *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](AVOutputContext, "sharedSystemAudioContext"));
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v8;

    -[SRModeSystemState _fetchConnectedAudioAccessoryState](v2, "_fetchConnectedAudioAccessoryState");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_connectedOutputDevicesDidChange:", AVOutputContextOutputDeviceDidChangeNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_connectedOutputDevicesDidChange:", AVOutputContextOutputDevicesDidChangeNotification, 0);

    v12 = dispatch_queue_create("com.apple.siri.mode.SystemState", 0);
    v13 = (AFNotifyObserver *)objc_msgSend(objc_alloc((Class)AFNotifyObserver), "initWithName:options:queue:delegate:", CFSTR("com.apple.springboard.ringerstate"), 1, v12, 0);
    ringerStateObserver = v2->_ringerStateObserver;
    v2->_ringerStateObserver = v13;

  }
  return v2;
}

- (BOOL)userTypedInSiri
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v3 = objc_msgSend(v2, "requestSource");

  return v3 == (id)32 || v3 == (id)23;
}

- (BOOL)isVoiceTriggerRequest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v4 = objc_msgSend(v3, "requestSource");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "speechRequestOptions"));
  v7 = objc_msgSend(v6, "activationEvent");

  v10 = v4 == (id)18 && v7 == (id)15 || v4 == (id)44;
  return v4 == (id)8 || v10;
}

- (BOOL)isConnectedToCarPlay
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v3 = objc_msgSend(v2, "isConnectedToCarPlay");

  return v3;
}

- (BOOL)isForCarDND
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v3 = objc_msgSend(v2, "isForCarDND");

  return v3;
}

- (BOOL)isEyesFree
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v3 = objc_msgSend(v2, "isForEyesFree");

  return v3;
}

- (BOOL)isConnectedToAudioAccessory
{
  NSObject *audioAccessoryQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  audioAccessoryQueue = self->_audioAccessoryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B048;
  v5[3] = &unk_100122C90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioAccessoryQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScreenOffBeforeRequest
{
  return 0;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState _requestOptions](self, "_requestOptions"));
  v3 = (unint64_t)objc_msgSend(v2, "requestSource");

  return (v3 > 0x33) | (0x7800E1880000EuLL >> v3) & 1;
}

- (BOOL)isDeviceSilentMode
{
  return -[AFNotifyObserver state](self->_ringerStateObserver, "state") == 0;
}

- (BOOL)isRequestEmergencyCall
{
  return 0;
}

- (id)description
{
  double v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[14];

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p"), v3, v4, self));
  v23[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("userTypedInSiri=%i"), -[SRModeSystemState userTypedInSiri](self, "userTypedInSiri")));
  v23[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("userTouchedSnippet=%i"), -[SRModeSystemState userTouchedSnippet](self, "userTouchedSnippet")));
  v23[2] = v20;
  v5 = -[SRModeSystemState voiceFeedbackSetting](self, "voiceFeedbackSetting");
  v6 = CFSTR("SRModeVoiceFeedbackPreferSilentResponses");
  if (v5 == 1)
    v6 = CFSTR("SRModeVoiceFeedbackAutomatic");
  if (v5 == 2)
    v6 = CFSTR("SRModeVoiceFeedbackPreferSpokenResponses");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("voiceFeedbackSetting=%@"), v6));
  v23[3] = v19;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isVoiceTriggerRequest=%i"), -[SRModeSystemState isVoiceTriggerRequest](self, "isVoiceTriggerRequest")));
  v23[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isConnectedToCarPlay=%i"), -[SRModeSystemState isConnectedToCarPlay](self, "isConnectedToCarPlay")));
  v23[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isForCarDND=%i"), -[SRModeSystemState isForCarDND](self, "isForCarDND")));
  v23[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isEyesFree=%i"), -[SRModeSystemState isEyesFree](self, "isEyesFree")));
  v23[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isConnectedToAudioAccessory=%i"), -[SRModeSystemState isConnectedToAudioAccessory](self, "isConnectedToAudioAccessory")));
  v23[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isScreenOffBeforeRequest=%i"), -[SRModeSystemState isScreenOffBeforeRequest](self, "isScreenOffBeforeRequest")));
  v23[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isRequestMadeWithPhysicalDeviceInteraction=%i"), -[SRModeSystemState isRequestMadeWithPhysicalDeviceInteraction](self, "isRequestMadeWithPhysicalDeviceInteraction")));
  v23[10] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isDeviceSilentMode=%i"), -[SRModeSystemState isDeviceSilentMode](self, "isDeviceSilentMode")));
  v23[11] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isRequestEmergencyCall=%i"), -[SRModeSystemState isRequestEmergencyCall](self, "isRequestEmergencyCall")));
  v23[12] = v15;
  v23[13] = CFSTR(">");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 14));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR("; ")));
  return v17;
}

- (id)_requestOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  if (objc_msgSend(v3, "requestSource") != (id)9)
  {

    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalRequestOptions"));

  if (!v5)
  {
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
    return v7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRModeSystemState requestOptions](self, "requestOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequestOptions"));

  return v7;
}

- (void)_fetchConnectedAudioAccessoryState
{
  NSObject *audioAccessoryQueue;
  _QWORD v4[4];
  id v5;
  id location;

  self->_connectedToAudioAccessory = 0;
  objc_initWeak(&location, self);
  audioAccessoryQueue = self->_audioAccessoryQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B59C;
  v4[3] = &unk_100122638;
  objc_copyWeak(&v5, &location);
  dispatch_async(audioAccessoryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRModeSystemState _connectedOutputDevicesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #modes: output devices changed, re-fetching connected audio accessory state", (uint8_t *)&v5, 0xCu);
  }
  -[SRModeSystemState _fetchConnectedAudioAccessoryState](self, "_fetchConnectedAudioAccessoryState");
}

- (SASRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requestOptions, a3);
}

- (void)setUserTypedInSiri:(BOOL)a3
{
  self->_userTypedInSiri = a3;
}

- (BOOL)userTouchedSnippet
{
  return self->_userTouchedSnippet;
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
  self->_userTouchedSnippet = a3;
}

- (unint64_t)voiceFeedbackSetting
{
  return self->_voiceFeedbackSetting;
}

- (void)setVoiceFeedbackSetting:(unint64_t)a3
{
  self->_voiceFeedbackSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_audioAccessoryQueue, 0);
  objc_storeStrong((id *)&self->_sharedSystemAudioContext, 0);
  objc_storeStrong((id *)&self->_connectedOutputDevicesObserver, 0);
  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
}

@end
