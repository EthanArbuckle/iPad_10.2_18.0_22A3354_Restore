@implementation CSAudioStreamRequest

- (id)initTandemWithRequest:(id)a3
{
  id v4;
  CSAudioStreamRequest *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(CSAudioStreamRequest);
  objc_msgSend(v4, "recordContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioStreamRequest setRecordContext:](v5, "setRecordContext:", v6);

  -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v5, "setRequiresHistoricalBuffer:", objc_msgSend(v4, "requiresHistoricalBuffer"));
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v5, "setUseCustomizedRecordSettings:", objc_msgSend(v4, "useCustomizedRecordSettings"));
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", objc_msgSend(v4, "audioFormat"));
  objc_msgSend(v4, "sampleRate");
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:");
  -[CSAudioStreamRequest setLpcmBitDepth:](v5, "setLpcmBitDepth:", objc_msgSend(v4, "lpcmBitDepth"));
  -[CSAudioStreamRequest setLpcmIsFloat:](v5, "setLpcmIsFloat:", objc_msgSend(v4, "lpcmIsFloat"));
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", objc_msgSend(v4, "numberOfChannels"));
  -[CSAudioStreamRequest setEncoderBitRate:](v5, "setEncoderBitRate:", objc_msgSend(v4, "encoderBitRate"));
  v7 = objc_msgSend(v4, "requestExclaveAudio");

  -[CSAudioStreamRequest setRequestExclaveAudio:](v5, "setRequestExclaveAudio:", v7);
  return v5;
}

- (CSAudioStreamRequest)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioStreamRequest *v5;
  void *v6;
  CSAudioRecordContext *v7;
  CSAudioRecordContext *recordContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSAudioStreamRequest;
  v5 = -[CSAudioStreamRequest init](&v10, sel_init);
  if (v5)
  {
    v5->_requiresHistoricalBuffer = xpc_dictionary_get_BOOL(v4, "requiresHistoricalBuffer");
    v5->_useCustomizedRecordSettings = xpc_dictionary_get_BOOL(v4, "useCustomizedRecordSettings");
    v5->_audioFormat = xpc_dictionary_get_int64(v4, "audioFormat");
    v5->_sampleRate = xpc_dictionary_get_double(v4, "sampleRate");
    v5->_lpcmBitDepth = xpc_dictionary_get_int64(v4, "lpcmBitDepth");
    v5->_lpcmIsFloat = xpc_dictionary_get_BOOL(v4, "lpcmIsFloat");
    v5->_numberOfChannels = xpc_dictionary_get_int64(v4, "NumberOfChannels");
    v5->_encoderBitRate = xpc_dictionary_get_int64(v4, "encoderBitRate");
    v5->_clientIdentity = xpc_dictionary_get_uint64(v4, "audioClientIdentity");
    v5->_requestSkipClientMonitorUpdate = xpc_dictionary_get_BOOL(v4, "requestSkipClientMonitorUpdate");
    v5->_requestRecordModeLock = xpc_dictionary_get_BOOL(v4, "requestRecordModeLock");
    v5->_requestListeningMicIndicatorLock = xpc_dictionary_get_BOOL(v4, "requestListeningMicIndicatorLock");
    v5->_requestExclaveAudio = xpc_dictionary_get_BOOL(v4, "requestExclaveAudio");
    xpc_dictionary_get_value(v4, "recordContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[CSAudioRecordContext initWithXPCObject:]([CSAudioRecordContext alloc], "initWithXPCObject:", v6);
      recordContext = v5->_recordContext;
      v5->_recordContext = v7;

    }
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  CSAudioRecordContext *recordContext;
  void *v5;
  uint64_t i;
  xpc_object_t values[13];
  char *keys[14];

  keys[13] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "requiresHistoricalBuffer";
  keys[1] = "useCustomizedRecordSettings";
  keys[2] = "audioFormat";
  keys[3] = "sampleRate";
  keys[4] = "lpcmBitDepth";
  keys[5] = "lpcmIsFloat";
  keys[6] = "NumberOfChannels";
  keys[7] = "encoderBitRate";
  keys[8] = "audioClientIdentity";
  keys[9] = "requestSkipClientMonitorUpdate";
  keys[10] = "requestRecordModeLock";
  keys[11] = "requestListeningMicIndicatorLock";
  keys[12] = "requestExclaveAudio";
  values[0] = xpc_BOOL_create(self->_requiresHistoricalBuffer);
  values[1] = xpc_BOOL_create(self->_useCustomizedRecordSettings);
  values[2] = xpc_int64_create(self->_audioFormat);
  values[3] = xpc_double_create(self->_sampleRate);
  values[4] = xpc_int64_create(self->_lpcmBitDepth);
  values[5] = xpc_BOOL_create(self->_lpcmIsFloat);
  values[6] = xpc_int64_create(self->_numberOfChannels);
  values[7] = xpc_int64_create(self->_encoderBitRate);
  values[8] = xpc_uint64_create(self->_clientIdentity);
  values[9] = xpc_BOOL_create(self->_requestSkipClientMonitorUpdate);
  values[10] = xpc_BOOL_create(self->_requestRecordModeLock);
  values[11] = xpc_BOOL_create(self->_requestListeningMicIndicatorLock);
  values[12] = xpc_BOOL_create(self->_requestExclaveAudio);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 0xDuLL);
  recordContext = self->_recordContext;
  if (recordContext)
  {
    -[CSAudioRecordContext xpcObject](recordContext, "xpcObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v3, "recordContext", v5);

  }
  for (i = 12; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSAudioStreamRequest *v4;

  v4 = objc_alloc_init(CSAudioStreamRequest);
  -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v4, "setRequiresHistoricalBuffer:", self->_requiresHistoricalBuffer);
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v4, "setUseCustomizedRecordSettings:", self->_useCustomizedRecordSettings);
  -[CSAudioStreamRequest setAudioFormat:](v4, "setAudioFormat:", self->_audioFormat);
  -[CSAudioStreamRequest setSampleRate:](v4, "setSampleRate:", self->_sampleRate);
  -[CSAudioStreamRequest setLpcmBitDepth:](v4, "setLpcmBitDepth:", self->_lpcmBitDepth);
  -[CSAudioStreamRequest setLpcmIsFloat:](v4, "setLpcmIsFloat:", self->_lpcmIsFloat);
  -[CSAudioStreamRequest setNumberOfChannels:](v4, "setNumberOfChannels:", self->_numberOfChannels);
  -[CSAudioStreamRequest setEncoderBitRate:](v4, "setEncoderBitRate:", self->_encoderBitRate);
  -[CSAudioStreamRequest setClientIdentity:](v4, "setClientIdentity:", self->_clientIdentity);
  -[CSAudioStreamRequest setRecordContext:](v4, "setRecordContext:", self->_recordContext);
  -[CSAudioStreamRequest setRequestSkipClientMonitorUpdate:](v4, "setRequestSkipClientMonitorUpdate:", self->_requestSkipClientMonitorUpdate);
  -[CSAudioStreamRequest setRequestRecordModeLock:](v4, "setRequestRecordModeLock:", self->_requestRecordModeLock);
  -[CSAudioStreamRequest setRequestListeningMicIndicatorLock:](v4, "setRequestListeningMicIndicatorLock:", self->_requestListeningMicIndicatorLock);
  -[CSAudioStreamRequest setRequestExclaveAudio:](v4, "setRequestExclaveAudio:", self->_requestExclaveAudio);
  return v4;
}

- (id)description
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
  if (self->_requiresHistoricalBuffer)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[requiresHistoricalBuffer = %@]"), v5);
  if (self->_useCustomizedRecordSettings)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[useCustomizedRecordSettings = %@]"), v6);
  if (self->_lpcmIsFloat)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[lpcmIsFloat = %@]"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("[clientIdentity = %llu]"), self->_clientIdentity);
  objc_msgSend(v4, "appendFormat:", CFSTR("[sampleRate = %lf]"), *(_QWORD *)&self->_sampleRate);
  objc_msgSend(v4, "appendFormat:", CFSTR("[numberOfChannels = %lu]"), self->_numberOfChannels);
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestSkipClientMonitorUpdate = %d]"), self->_requestSkipClientMonitorUpdate);
  if (self->_requestRecordModeLock)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestRecordModeLock = %@]"), v8);
  if (self->_requestListeningMicIndicatorLock)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestListeningMicIndicatorLock = %@]"), v9);
  if (self->_requestExclaveAudio)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("[requestExclaveAudio = %@]"), v10);
  return v4;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_recordContext, a3);
}

- (BOOL)requiresHistoricalBuffer
{
  return self->_requiresHistoricalBuffer;
}

- (void)setRequiresHistoricalBuffer:(BOOL)a3
{
  self->_requiresHistoricalBuffer = a3;
}

- (BOOL)useCustomizedRecordSettings
{
  return self->_useCustomizedRecordSettings;
}

- (void)setUseCustomizedRecordSettings:(BOOL)a3
{
  self->_useCustomizedRecordSettings = a3;
}

- (int64_t)audioFormat
{
  return self->_audioFormat;
}

- (void)setAudioFormat:(int64_t)a3
{
  self->_audioFormat = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (unsigned)lpcmBitDepth
{
  return self->_lpcmBitDepth;
}

- (void)setLpcmBitDepth:(unsigned int)a3
{
  self->_lpcmBitDepth = a3;
}

- (BOOL)lpcmIsFloat
{
  return self->_lpcmIsFloat;
}

- (void)setLpcmIsFloat:(BOOL)a3
{
  self->_lpcmIsFloat = a3;
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setNumberOfChannels:(unsigned int)a3
{
  self->_numberOfChannels = a3;
}

- (unsigned)encoderBitRate
{
  return self->_encoderBitRate;
}

- (void)setEncoderBitRate:(unsigned int)a3
{
  self->_encoderBitRate = a3;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(unint64_t)a3
{
  self->_clientIdentity = a3;
}

- (BOOL)requestSkipClientMonitorUpdate
{
  return self->_requestSkipClientMonitorUpdate;
}

- (void)setRequestSkipClientMonitorUpdate:(BOOL)a3
{
  self->_requestSkipClientMonitorUpdate = a3;
}

- (BOOL)requestRecordModeLock
{
  return self->_requestRecordModeLock;
}

- (void)setRequestRecordModeLock:(BOOL)a3
{
  self->_requestRecordModeLock = a3;
}

- (BOOL)requestListeningMicIndicatorLock
{
  return self->_requestListeningMicIndicatorLock;
}

- (void)setRequestListeningMicIndicatorLock:(BOOL)a3
{
  self->_requestListeningMicIndicatorLock = a3;
}

- (BOOL)requestExclaveAudio
{
  return self->_requestExclaveAudio;
}

- (void)setRequestExclaveAudio:(BOOL)a3
{
  self->_requestExclaveAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordContext, 0);
}

+ (id)defaultRequestWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  CSAudioStreamRequest *v5;
  int v6;
  float v7;
  void *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "+[CSAudioStreamRequest defaultRequestWithContext:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  v6 = CSIsHorseman_isHorseman;
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", 0);
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:", v7);
  -[CSAudioStreamRequest setLpcmBitDepth:](v5, "setLpcmBitDepth:", +[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth"));
  -[CSAudioStreamRequest setLpcmIsFloat:](v5, "setLpcmIsFloat:", +[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"));
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
  if (!v6)
  {
    v8 = (void *)objc_msgSend(v3, "copy");
    -[CSAudioStreamRequest setRecordContext:](v5, "setRecordContext:", v8);

  }
  return v5;
}

+ (id)requestForLpcmRecordSettingsWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  CSAudioStreamRequest *v5;
  float v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "+[CSAudioStreamRequest requestForLpcmRecordSettingsWithContext:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v5, "setUseCustomizedRecordSettings:", 1);
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", 0);
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:", v6);
  -[CSAudioStreamRequest setLpcmBitDepth:](v5, "setLpcmBitDepth:", +[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth"));
  -[CSAudioStreamRequest setLpcmIsFloat:](v5, "setLpcmIsFloat:", +[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"));
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
  v7 = (void *)objc_msgSend(v3, "copy");
  -[CSAudioStreamRequest setRecordContext:](v5, "setRecordContext:", v7);

  return v5;
}

+ (id)requestForOpusRecordSettingsWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  CSAudioStreamRequest *v5;
  float v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "+[CSAudioStreamRequest requestForOpusRecordSettingsWithContext:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v5, "setUseCustomizedRecordSettings:", 1);
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", 1);
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:", v6);
  -[CSAudioStreamRequest setLpcmBitDepth:](v5, "setLpcmBitDepth:", +[CSConfig inputRecordingSampleBitDepth](CSConfig, "inputRecordingSampleBitDepth"));
  -[CSAudioStreamRequest setLpcmIsFloat:](v5, "setLpcmIsFloat:", 0);
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", 1);
  v7 = (void *)objc_msgSend(v3, "copy");
  -[CSAudioStreamRequest setRecordContext:](v5, "setRecordContext:", v7);

  return v5;
}

+ (id)requestForSpeexRecordSettingsWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  CSAudioStreamRequest *v5;
  float v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "+[CSAudioStreamRequest requestForSpeexRecordSettingsWithContext:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v5, "setUseCustomizedRecordSettings:", 1);
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", 2);
  -[CSAudioStreamRequest setEncoderBitRate:](v5, "setEncoderBitRate:", +[CSConfig audioConverterBitrate](CSConfig, "audioConverterBitrate"));
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:", v6);
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", 1);
  v7 = (void *)objc_msgSend(v3, "copy");
  -[CSAudioStreamRequest setRecordContext:](v5, "setRecordContext:", v7);

  return v5;
}

@end
