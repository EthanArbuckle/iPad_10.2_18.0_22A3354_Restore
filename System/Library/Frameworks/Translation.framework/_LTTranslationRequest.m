@implementation _LTTranslationRequest

- (NSString)loggingType
{
  return (NSString *)CFSTR("undefined");
}

- (_LTTranslationRequest)initWithLocalePair:(id)a3
{
  return -[_LTTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", a3, 0);
}

- (_LTTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  id v7;
  id v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_LTTranslationRequest;
  v9 = -[_LTTranslationRequest init](&v17, sel_init);
  if (v9)
  {
    if (v8)
    {
      v10 = v8;
      v11 = (void *)*((_QWORD *)v9 + 3);
      *((_QWORD *)v9 + 3) = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v9 + 3);
      *((_QWORD *)v9 + 3) = v12;

    }
    objc_storeStrong((id *)v9 + 6, a3);
    *(_WORD *)(v9 + 11) = 0;
    v9[8] = 0;
    *((_QWORD *)v9 + 9) = -1;
    *((_QWORD *)v9 + 5) = 1;
    *((_QWORD *)v9 + 11) = 0;
    v9[13] = 1;
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v9 + 4) = objc_msgSend(v14, "opaqueSessionID");

    v9[15] = 0;
    v15 = v9;
  }

  return (_LTTranslationRequest *)v9;
}

- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _LTTranslationRequest *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138478083;
    v12 = v6;
    v13 = 2113;
    v14 = v7;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "Translation request with sourceLocale:%{private}@ targetLocale:%{private}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = -[_LTTranslationRequest initWithSourceLocale:targetLocale:suggestedUniqueID:](self, "initWithSourceLocale:targetLocale:suggestedUniqueID:", v6, v7, 0);

  return v9;
}

- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTLocalePair *v11;
  _LTTranslationRequest *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v10, v9);

  v12 = -[_LTTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", v11, v8);
  return v12;
}

- (NSString)qssSessionID
{
  void *v3;
  void *v4;
  void *v5;

  -[_LTTranslationRequest batchSessionUUID](self, "batchSessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_LTTranslationRequest batchSessionUUID](self, "batchSessionUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_LTTranslationRequest uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (BOOL)_canUseTextService
{
  return 0;
}

- (id)requestContext
{
  _LTTranslationContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(_LTTranslationContext);
  -[_LTTranslationRequest uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setUniqueID:](v3, "setUniqueID:", v4);

  -[_LTTranslationRequest sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setSessionID:](v3, "setSessionID:", v5);

  -[_LTTranslationContext setTaskHint:](v3, "setTaskHint:", -[_LTTranslationRequest taskHint](self, "taskHint"));
  -[_LTTranslationRequest localePair](self, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setLocalePair:](v3, "setLocalePair:", v6);

  -[_LTTranslationContext setAutodetectLanguage:](v3, "setAutodetectLanguage:", -[_LTTranslationRequest autodetectLanguage](self, "autodetectLanguage"));
  -[_LTTranslationContext setForceSourceLocale:](v3, "setForceSourceLocale:", -[_LTTranslationRequest forceSourceLocale](self, "forceSourceLocale"));
  -[_LTTranslationContext setCensorSpeech:](v3, "setCensorSpeech:", -[_LTTranslationRequest censorSpeech](self, "censorSpeech"));
  -[_LTTranslationRequest _offlineMTModelURL](self, "_offlineMTModelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setMtModelURL:](v3, "setMtModelURL:", v7);

  -[_LTTranslationRequest outputFileURL](self, "outputFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setOutputFileURL:](v3, "setOutputFileURL:", v8);

  -[_LTTranslationContext setAudioSessionID:](v3, "setAudioSessionID:", -[_LTTranslationRequest audioSessionID](self, "audioSessionID"));
  -[_LTTranslationRequest appIdentifier](self, "appIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setAppIdentifier:](v3, "setAppIdentifier:", v9);

  -[_LTTranslationContext setSourceOrigin:](v3, "setSourceOrigin:", -[_LTTranslationRequest sourceOrigin](self, "sourceOrigin"));
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForInfoDictionaryKey:", CFSTR("CFBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = _LTOSLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_235438000, v12, OS_LOG_TYPE_INFO, "Got untrusted client identifier from Info.plist: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = _LTOSLogXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_LTTranslationRequest requestContext].cold.1();
  }
  v15 = v11;

  -[_LTTranslationContext setUntrustedClientIdentifier:](v3, "setUntrustedClientIdentifier:", v15);
  -[_LTTranslationContext setLogIdentifier:](v3, "setLogIdentifier:", self->_logIdentifier);
  -[_LTTranslationContext setIsFinal:](v3, "setIsFinal:", -[_LTTranslationRequest isFinal](self, "isFinal"));
  -[_LTTranslationContext setSupportsGenderDisambiguation:](v3, "setSupportsGenderDisambiguation:", -[_LTTranslationRequest _supportsGenderDisambiguation](self, "_supportsGenderDisambiguation"));
  -[_LTTranslationContext setOverrideOngoingSessionIfNeeded:](v3, "setOverrideOngoingSessionIfNeeded:", -[_LTTranslationRequest overrideOngoingSessionIfNeeded](self, "overrideOngoingSessionIfNeeded"));
  -[_LTTranslationContext setRoute:](v3, "setRoute:", 2);
  if (-[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"))
    -[_LTTranslationContext setRoute:](v3, "setRoute:", 1);
  return v3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputFileURL, a3);
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
}

- (BOOL)forcedOfflineTranslation
{
  return self->_forcedOfflineTranslation;
}

- (void)setForcedOfflineTranslation:(BOOL)a3
{
  self->_forcedOfflineTranslation = a3;
}

- (BOOL)_forcedOnlineTranslation
{
  return self->__forcedOnlineTranslation;
}

- (void)set_forcedOnlineTranslation:(BOOL)a3
{
  self->__forcedOnlineTranslation = a3;
}

- (NSURL)_offlineMTModelURL
{
  return self->__offlineMTModelURL;
}

- (void)set_offlineMTModelURL:(id)a3
{
  objc_storeStrong((id *)&self->__offlineMTModelURL, a3);
}

- (int64_t)_mtConfidenceThreshold
{
  return self->__mtConfidenceThreshold;
}

- (void)set_mtConfidenceThreshold:(int64_t)a3
{
  self->__mtConfidenceThreshold = a3;
}

- (BOOL)autodetectLanguage
{
  return self->_autodetectLanguage;
}

- (void)setAutodetectLanguage:(BOOL)a3
{
  self->_autodetectLanguage = a3;
}

- (BOOL)forceSourceLocale
{
  return self->_forceSourceLocale;
}

- (void)setForceSourceLocale:(BOOL)a3
{
  self->_forceSourceLocale = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (BOOL)_supportsGenderDisambiguation
{
  return self->__supportsGenderDisambiguation;
}

- (void)set_supportsGenderDisambiguation:(BOOL)a3
{
  self->__supportsGenderDisambiguation = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (BOOL)overrideOngoingSessionIfNeeded
{
  return self->_overrideOngoingSessionIfNeeded;
}

- (void)setOverrideOngoingSessionIfNeeded:(BOOL)a3
{
  self->_overrideOngoingSessionIfNeeded = a3;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSUUID)batchSessionUUID
{
  return self->_batchSessionUUID;
}

- (void)setBatchSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchSessionUUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->__offlineMTModelURL, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)requestContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Unable to read untrusted client identifier from Info.plist; falling back to process name: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
