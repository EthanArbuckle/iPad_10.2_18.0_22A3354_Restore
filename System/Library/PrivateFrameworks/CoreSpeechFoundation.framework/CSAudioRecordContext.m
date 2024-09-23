@implementation CSAudioRecordContext

- (CSAudioRecordContext)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioRecordContext *v5;
  const char *string;
  uint64_t v7;
  NSString *deviceId;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSDictionary *activationMetadata;
  const char *v14;
  uint64_t v15;
  NSString *turnIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSAudioRecordContext;
  v5 = -[CSAudioRecordContext init](&v18, sel_init);
  if (v5)
  {
    v5->_type = xpc_dictionary_get_int64(v4, "type");
    v5->_alwaysUseRemoteBuiltInMic = xpc_dictionary_get_BOOL(v4, "alwaysUseRemoteBuiltInMic");
    string = xpc_dictionary_get_string(v4, "deviceId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v7 = objc_claimAutoreleasedReturnValue();
      deviceId = v5->_deviceId;
      v5->_deviceId = (NSString *)v7;

    }
    v5->_isRequestDuringActiveCall = xpc_dictionary_get_BOOL(v4, "isRequestDuringActiveCall");
    xpc_dictionary_get_value(v4, "triggerEventInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      xpc_dictionary_get_dictionary(v4, "triggerEventInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v11, "_cs_initWithXPCObject:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      activationMetadata = v5->_activationMetadata;
      v5->_activationMetadata = (NSDictionary *)v12;

    }
    v14 = xpc_dictionary_get_string(v4, "turnIdentifier");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      turnIdentifier = v5->_turnIdentifier;
      v5->_turnIdentifier = (NSString *)v15;

    }
    v5->_isRequestFromSpokenNotification = xpc_dictionary_get_BOOL(v4, "isSpokenNotification");
    v5->_isRequestFromTriggerless = xpc_dictionary_get_BOOL(v4, "isRequestTriggerless");
    v5->_speechEvent = xpc_dictionary_get_int64(v4, "speechEvent");
  }

  return v5;
}

- (CSAudioRecordContext)initWithAVVCContext:(id)a3
{
  id v4;
  CSAudioRecordContext *v5;
  CSAudioRecordContext *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *deviceId;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSAudioRecordContext;
  v5 = -[CSAudioRecordContext init](&v17, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = *MEMORY[0x1E0C899E8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      v6->_type = -[CSAudioRecordContext recordTypeFromAVVCActivationMode:](v6, "recordTypeFromAVVCActivationMode:", v10);
    }
    v11 = *MEMORY[0x1E0C899E0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      deviceId = v6->_deviceId;
      v6->_deviceId = (NSString *)v14;

    }
  }

  return v6;
}

- (CSAudioRecordContext)initWithRecordType:(int64_t)a3 deviceId:(id)a4
{
  id v6;
  CSAudioRecordContext *v7;
  CSAudioRecordContext *v8;
  uint64_t v9;
  NSString *deviceId;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAudioRecordContext;
  v7 = -[CSAudioRecordContext init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    deviceId = v8->_deviceId;
    v8->_deviceId = (NSString *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSAudioRecordContext *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(CSAudioRecordContext);
  -[CSAudioRecordContext setType:](v5, "setType:", self->_type);
  -[CSAudioRecordContext setAlwaysUseRemoteBuiltInMic:](v5, "setAlwaysUseRemoteBuiltInMic:", self->_alwaysUseRemoteBuiltInMic);
  v6 = (void *)-[NSString copyWithZone:](self->_deviceId, "copyWithZone:", a3);
  -[CSAudioRecordContext setDeviceId:](v5, "setDeviceId:", v6);

  -[CSAudioRecordContext setIsRequestDuringActiveCall:](v5, "setIsRequestDuringActiveCall:", self->_isRequestDuringActiveCall);
  v7 = (void *)-[NSDictionary copyWithZone:](self->_activationMetadata, "copyWithZone:", a3);
  -[CSAudioRecordContext setActivationMetadata:](v5, "setActivationMetadata:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_turnIdentifier, "copyWithZone:", a3);
  -[CSAudioRecordContext setTurnIdentifier:](v5, "setTurnIdentifier:", v8);

  -[CSAudioRecordContext setIsRequestFromSpokenNotification:](v5, "setIsRequestFromSpokenNotification:", self->_isRequestFromSpokenNotification);
  -[CSAudioRecordContext setIsRequestFromTriggerless:](v5, "setIsRequestFromTriggerless:", self->_isRequestFromTriggerless);
  -[CSAudioRecordContext setSpeechEvent:](v5, "setSpeechEvent:", self->_speechEvent);
  return v5;
}

- (id)avvcContext
{
  return -[CSAudioRecordContext _createAVVCContextWithType:deviceId:](self, "_createAVVCContextWithType:deviceId:", self->_type, self->_deviceId);
}

- (id)_createAVVCContextWithType:(int64_t)a3 deviceId:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[CSAudioRecordContext avvcActivationMode:](self, "avvcActivationMode:", a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0C899E8]);

  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0C899E0]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t type;
  NSString *deviceId;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  type = self->_type;
  if (type == objc_msgSend(v4, "type"))
  {
    deviceId = self->_deviceId;
    objc_msgSend(v4, "deviceId");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (deviceId)
      v9 = -[NSString isEqualToString:](deviceId, "isEqualToString:", v7);
    else
      v9 = v7 == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isVoiceTriggered
{
  BOOL v3;
  BOOL v4;

  v3 = -[CSAudioRecordContext isBuiltInVoiceTriggered](self, "isBuiltInVoiceTriggered")
    || -[CSAudioRecordContext isHearstVoiceTriggered](self, "isHearstVoiceTriggered")
    || -[CSAudioRecordContext isJarvisVoiceTriggered](self, "isJarvisVoiceTriggered");
  v4 = -[CSAudioRecordContext isRemoraVoiceTriggered](self, "isRemoraVoiceTriggered");
  return -[CSAudioRecordContext isDarwinVoiceTriggered](self, "isDarwinVoiceTriggered") || v4 || v3;
}

- (BOOL)isBuiltInVoiceTriggered
{
  return self->_type == 6;
}

- (BOOL)isVoiceTriggeredFromRemoteXPCDevice
{
  BOOL v3;

  v3 = -[CSAudioRecordContext isGibraltarVoiceTriggered](self, "isGibraltarVoiceTriggered");
  return -[CSAudioRecordContext isDarwinVoiceTriggered](self, "isDarwinVoiceTriggered") || v3;
}

- (BOOL)isGibraltarVoiceTriggered
{
  return +[CSUtils hasRemoteCoreSpeech](CSUtils, "hasRemoteCoreSpeech")
      && +[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic")
      && -[CSAudioRecordContext isBuiltInVoiceTriggered](self, "isBuiltInVoiceTriggered");
}

- (BOOL)isTriggeredFromHearst
{
  return -[CSAudioRecordContext isHearstVoiceTriggered](self, "isHearstVoiceTriggered")
      || -[CSAudioRecordContext isHearstDoubleTapTriggered](self, "isHearstDoubleTapTriggered")
      || -[CSAudioRecordContext isTriggerlessAnnounce](self, "isTriggerlessAnnounce");
}

- (BOOL)isHearstVoiceTriggered
{
  return self->_type == 11;
}

- (BOOL)isHearstDoubleTapTriggered
{
  return self->_type == 10;
}

- (BOOL)isRTSTriggered
{
  return self->_type == 9;
}

- (BOOL)isJarvisVoiceTriggered
{
  return self->_type == 12;
}

- (BOOL)isJarvisContinuousConversation
{
  return self->_type == 23;
}

- (BOOL)isTypeJarvis
{
  int64_t type;

  type = self->_type;
  return type == 12 || type == 23;
}

- (BOOL)isRemoraVoiceTriggered
{
  return self->_type == 17;
}

- (BOOL)isRemoraTriggered
{
  return (unint64_t)(self->_type - 17) < 2;
}

- (BOOL)isRemoraButtonPress
{
  return self->_type == 18;
}

- (BOOL)isDarwinVoiceTriggered
{
  return self->_type == 21;
}

- (BOOL)isHomePressed
{
  return self->_type == 1;
}

- (BOOL)isTVRemote
{
  return self->_type == 8;
}

- (BOOL)isServerInvoked
{
  return self->_type == 5;
}

- (BOOL)isStarkTriggered
{
  return self->_type == 7;
}

- (BOOL)isDictation
{
  return self->_type == 13;
}

- (BOOL)isContinuousConversation
{
  return (self->_type < 0x1CuLL) & (0xAD00000u >> self->_type);
}

- (BOOL)isContinuousConversationTriggerlessAnnounce
{
  return self->_type == 25;
}

- (BOOL)isTriggerlessAnnounce
{
  return self->_type == 26;
}

- (BOOL)isiOSButtonPress
{
  return (self->_type < 0xBuLL) & (0x49Eu >> self->_type);
}

- (BOOL)isUIButtonPress
{
  return self->_type == 4;
}

- (BOOL)isAudioRecordTypeSupportedByRemora
{
  return (self->_type < 0x13uLL) & (0x64020u >> self->_type);
}

- (BOOL)isAudioRecordTypeSupportedByContinuousConversation
{
  BOOL result;
  unint64_t type;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  uint64_t v9;

  result = 0;
  v9 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type <= 0x1B)
  {
    if (((1 << type) & 0xA700C72) != 0)
      return 1;
    if (((1 << type) & 0x801080) != 0)
    {
      if (+[CSUtils isCarplayWithFlexibleFollowupEnabled](CSUtils, "isCarplayWithFlexibleFollowupEnabled"))
      {
        return 1;
      }
      v5 = CSLogContextFacilityCoreSpeech;
      v6 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v6)
      {
        v7 = 136315138;
        v8 = "-[CSAudioRecordContext isAudioRecordTypeSupportedByContinuousConversation]";
        _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s CarPlay support is disabled!", (uint8_t *)&v7, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

- (int64_t)recordTypeFromAVVCActivationMode:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 1;
  if (a3 > 1886352243)
  {
    if (a3 <= 1936750195)
    {
      v4 = 1919771247;
      v15 = 17;
      if (a3 != 1919776372)
        v15 = 1;
      if (a3 == 1919771248)
        v7 = 18;
      else
        v7 = v15;
      v8 = 1886352244;
      v9 = 14;
      v10 = a3 == 1918986611;
      v11 = 9;
    }
    else
    {
      v4 = 1986357345;
      v12 = 2;
      if (a3 != 2003329648)
        v12 = 1;
      if (a3 == 1987012963)
        v13 = 6;
      else
        v13 = v12;
      if (a3 == 1986357346)
        v7 = 7;
      else
        v7 = v13;
      v8 = 1936750196;
      v9 = 16;
      v10 = a3 == 1969840752;
      v11 = 4;
    }
  }
  else if (a3 <= 1668314722)
  {
    v4 = 1651795059;
    v14 = 8;
    if (a3 != 1651797093)
      v14 = 1;
    if (a3 == 1651795060)
      v7 = 10;
    else
      v7 = v14;
    v8 = 1635087471;
    v9 = 5;
    v10 = a3 == 1651794544;
    v11 = 3;
  }
  else
  {
    v4 = 1684628339;
    v5 = 15;
    if (a3 != 1752396914)
      v5 = 1;
    if (a3 == 1751414371)
      v6 = 11;
    else
      v6 = v5;
    if (a3 == 1684628340)
      v7 = 13;
    else
      v7 = v6;
    v8 = 1668314723;
    v9 = 12;
    v10 = a3 == 1684108899;
    v11 = 21;
  }
  if (v10)
    v3 = v11;
  if (a3 == v8)
    v3 = v9;
  if (a3 <= v4)
    return v3;
  else
    return v7;
}

- (int64_t)avvcActivationMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0x19)
    return 1752132965;
  else
    return *(_QWORD *)&aPbhw[8 * a3 - 16];
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  NSString *deviceId;
  NSDictionary *activationMetadata;
  void *v6;
  NSString *turnIdentifier;
  uint64_t i;
  xpc_object_t values[6];
  char *keys[7];

  keys[6] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  keys[1] = "alwaysUseRemoteBuiltInMic";
  keys[2] = "isRequestDuringActiveCall";
  keys[3] = "isSpokenNotification";
  keys[4] = "isRequestTriggerless";
  keys[5] = "speechEvent";
  values[0] = xpc_int64_create(self->_type);
  values[1] = xpc_BOOL_create(self->_alwaysUseRemoteBuiltInMic);
  values[2] = xpc_BOOL_create(self->_isRequestDuringActiveCall);
  values[3] = xpc_BOOL_create(self->_isRequestFromSpokenNotification);
  values[4] = xpc_BOOL_create(self->_isRequestFromTriggerless);
  values[5] = xpc_int64_create(self->_speechEvent);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  deviceId = self->_deviceId;
  if (deviceId)
    xpc_dictionary_set_string(v3, "deviceId", -[NSString UTF8String](deviceId, "UTF8String"));
  activationMetadata = self->_activationMetadata;
  if (activationMetadata)
  {
    -[NSDictionary _cs_xpcObject](activationMetadata, "_cs_xpcObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v3, "triggerEventInfo", v6);

  }
  turnIdentifier = self->_turnIdentifier;
  if (turnIdentifier)
    xpc_dictionary_set_string(v3, "turnIdentifier", -[NSString UTF8String](turnIdentifier, "UTF8String"));
  for (i = 5; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAudioRecordContext recordTypeString:](CSAudioRecordContext, "recordTypeString:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("recordType[%@] deviceId[%@] turnIdentifier[%@] alwaysUseBuiltInMic[%d] isRequestDuringActiveCall[%d] triggerEventInfo[%@] spokenNotification [%d] isTriggerless [%d] speechEvent [%ld]"), v4, self->_deviceId, self->_turnIdentifier, self->_alwaysUseRemoteBuiltInMic, self->_isRequestDuringActiveCall, self->_activationMetadata, self->_isRequestFromSpokenNotification, self->_isRequestFromTriggerless, self->_speechEvent);

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (BOOL)alwaysUseRemoteBuiltInMic
{
  return self->_alwaysUseRemoteBuiltInMic;
}

- (void)setAlwaysUseRemoteBuiltInMic:(BOOL)a3
{
  self->_alwaysUseRemoteBuiltInMic = a3;
}

- (BOOL)isRequestDuringActiveCall
{
  return self->_isRequestDuringActiveCall;
}

- (void)setIsRequestDuringActiveCall:(BOOL)a3
{
  self->_isRequestDuringActiveCall = a3;
}

- (NSDictionary)activationMetadata
{
  return self->_activationMetadata;
}

- (void)setActivationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_activationMetadata, a3);
}

- (NSString)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_turnIdentifier, a3);
}

- (BOOL)isRequestFromSpokenNotification
{
  return self->_isRequestFromSpokenNotification;
}

- (void)setIsRequestFromSpokenNotification:(BOOL)a3
{
  self->_isRequestFromSpokenNotification = a3;
}

- (BOOL)isRequestFromTriggerless
{
  return self->_isRequestFromTriggerless;
}

- (void)setIsRequestFromTriggerless:(BOOL)a3
{
  self->_isRequestFromTriggerless = a3;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_speechEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_activationMetadata, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

+ (id)contextForHearstVoiceTriggerWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 11, v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)contextForRemoraVoiceTriggerWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 17, v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)contextForRemoraButtonTriggerWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 18, v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)contextForOpportuneSpeakerListener
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 16, 0);
}

+ (id)contextForOpportuneSpeakerListenerWithCall
{
  CSAudioRecordContext *v2;

  v2 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 19, 0);
  -[CSAudioRecordContext setIsRequestDuringActiveCall:](v2, "setIsRequestDuringActiveCall:", 1);
  return v2;
}

+ (id)contextForBuiltInVoiceTrigger
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 6, 0);
}

+ (id)contextForJarvisWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  v3 = a3;
  v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 12, v3);

  return v4;
}

+ (id)contextForBTLEWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  v3 = a3;
  v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 8, v3);

  return v4;
}

+ (id)contextForVoiceTriggerTraining
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 15, 0);
}

+ (id)contextForServerInvoke
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 5, 0);
}

+ (id)contextForHomeButton
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 1, 0);
}

+ (id)contextForRaiseToSpeak
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 9, 0);
}

+ (id)contextForContinuousConversation
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 20, 0);
}

+ (id)contextForContinuousConversationWithRecordRoute:(id)a3 deviceId:(id)a4
{
  id v5;
  id v6;
  CSAudioRecordContext *v7;
  uint64_t v8;
  _BOOL4 v9;
  id v10;
  CSAudioRecordContext *v11;

  v5 = a3;
  v6 = a4;
  if (+[CSUtils isDoAPAudioRouteWithRecordRoute:](CSUtils, "isDoAPAudioRouteWithRecordRoute:", v5))
  {
    v7 = [CSAudioRecordContext alloc];
    v8 = 22;
  }
  else if (+[CSUtils isJarvisAudioRouteWithRecordRoute:](CSUtils, "isJarvisAudioRouteWithRecordRoute:", v5))
  {
    v7 = [CSAudioRecordContext alloc];
    v8 = 23;
  }
  else
  {
    v9 = +[CSUtils isDisplayPortRouteWithRecordRoute:](CSUtils, "isDisplayPortRouteWithRecordRoute:", v5);
    v7 = [CSAudioRecordContext alloc];
    if (!v9)
    {
      v8 = 20;
      v10 = 0;
      goto LABEL_8;
    }
    v8 = 27;
  }
  v10 = v6;
LABEL_8:
  v11 = -[CSAudioRecordContext initWithRecordType:deviceId:](v7, "initWithRecordType:deviceId:", v8, v10);

  return v11;
}

+ (int64_t)audioTypeForContinuousConversation:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = 27;
  v4 = 20;
  if (a3 == 12)
    v4 = 23;
  if (a3 != 21)
    v3 = v4;
  if ((unint64_t)(a3 - 10) >= 2)
    return v3;
  else
    return 22;
}

+ (id)contextForDarwinVoiceTriggerWithDeviceId:(id)a3
{
  id v3;
  CSAudioRecordContext *v4;

  v3 = a3;
  v4 = -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 21, v3);

  return v4;
}

+ (id)contextForDictation
{
  return -[CSAudioRecordContext initWithRecordType:deviceId:]([CSAudioRecordContext alloc], "initWithRecordType:deviceId:", 13, 0);
}

+ (id)defaultContext
{
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[CSAudioRecordContext contextForServerInvoke](CSAudioRecordContext, "contextForServerInvoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[CSAudioRecordContext defaultContext]";
    v7 = 2114;
    v8 = v2;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s default to recordContext : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

+ (id)recordTypeString:(int64_t)a3
{
  if ((unint64_t)a3 > 0x1B)
    return CFSTR("CSAudioRecordTypeUnknown");
  else
    return off_1E687EAA0[a3];
}

- (id)avvcContextSettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CSAudioRecordContext avvcContext](self, "avvcContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BC0]), "initWithMode:deviceUID:", v5, v6);
  if (+[CSUtils supportHandsFree](CSUtils, "supportHandsFree"))
  {
    if (-[CSAudioRecordContext isRequestDuringActiveCall](self, "isRequestDuringActiveCall"))
    {
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[CSAudioRecordContext(AVVC) avvcContextSettings]";
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Setting mixable to yes as we are in an active call", (uint8_t *)&v13, 0xCu);
      }
      v9 = +[CSUtils supportRingtoneA2DP](CSUtils, "supportRingtoneA2DP");
      if (v5 == 1668314723 || v9)
        v11 = v5;
      else
        v11 = 1987012963;
      objc_msgSend(v7, "setActivationMode:", v11);
    }
    objc_msgSend(v7, "setAnnounceCallsEnabled:", -[CSAudioRecordContext isRequestDuringActiveCall](self, "isRequestDuringActiveCall"));
  }

  return v7;
}

@end
