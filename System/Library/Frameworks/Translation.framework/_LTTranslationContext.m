@implementation _LTTranslationContext

- (_LTTranslationContext)init
{
  char *v2;
  _LTTranslationContext *v3;
  NSUUID *v4;
  NSUUID *logIdentifier;
  _LTTranslationContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTTranslationContext;
  v2 = -[_LTTranslationContext init](&v8, sel_init);
  v3 = (_LTTranslationContext *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 88) = xmmword_23547B9C0;
    *((_QWORD *)v2 + 13) = -1;
    v2[9] = 0;
    *((_WORD *)v2 + 6) = 256;
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    logIdentifier = v3->_logIdentifier;
    v3->_logIdentifier = v4;

    v6 = v3;
  }

  return v3;
}

- (_LTTranslationContext)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationContext *v5;
  uint64_t v6;
  NSString *uniqueID;
  uint64_t v8;
  NSString *sessionID;
  uint64_t v10;
  _LTLocalePair *localePair;
  uint64_t v12;
  NSURL *outputFileURL;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *asrModelURLs;
  uint64_t v19;
  NSURL *mtModelURL;
  uint64_t v21;
  NSURL *sourceURL;
  double v23;
  uint64_t v24;
  NSString *appIdentifier;
  uint64_t v26;
  NSString *untrustedClientIdentifier;
  uint64_t v28;
  NSUUID *logIdentifier;
  _LTTranslationContext *v30;
  objc_super v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_LTTranslationContext;
  v5 = -[_LTTranslationContext init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v8;

    v5->_taskHint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskHint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v10 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v10;

    v5->_autodetectLanguage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autodetectLanguage"));
    v5->_forceSourceLocale = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceSourceLocale"));
    v5->_autoEndpoint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoEndpoint"));
    v5->_censorSpeech = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("censorSpeech"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputFileURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    outputFileURL = v5->_outputFileURL;
    v5->_outputFileURL = (NSURL *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("asrModelURLs"));
    v17 = objc_claimAutoreleasedReturnValue();
    asrModelURLs = v5->_asrModelURLs;
    v5->_asrModelURLs = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mtModelURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    mtModelURL = v5->_mtModelURL;
    v5->_mtModelURL = (NSURL *)v19;

    v5->_route = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("route"));
    v5->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("audioSessionID"));
    v5->_lidThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lidThreshold"));
    v5->_asrConfidenceThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("asrConfidenceThreshold"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ttsPlaybackRate"));
    v5->_ttsPlaybackRate = v23;
    v5->_muteTTSBasedOnRingerSwitchIfPossible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("muteTTSBasedOnRingerSwitchIfPossible"));
    v5->_enableVAD = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableVAD"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v24;

    v5->_sourceOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedClientIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    untrustedClientIdentifier = v5->_untrustedClientIdentifier;
    v5->_untrustedClientIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v5->_logIdentifier;
    v5->_logIdentifier = (NSUUID *)v28;

    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    v5->_supportsGenderDisambiguation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsGenderDisambiguation"));
    v5->_overrideOngoingSessionIfNeeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideOngoingSessionIfNeeded"));
    v5->_cancelOnCleanup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelOnCleanup"));
    v30 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_taskHint, CFSTR("taskHint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autodetectLanguage, CFSTR("autodetectLanguage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceSourceLocale, CFSTR("forceSourceLocale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoEndpoint, CFSTR("autoEndpoint"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_censorSpeech, CFSTR("censorSpeech"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outputFileURL, CFSTR("outputFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_asrModelURLs, CFSTR("asrModelURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mtModelURL, CFSTR("mtModelURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_route, CFSTR("route"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("audioSessionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lidThreshold, CFSTR("lidThreshold"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_asrConfidenceThreshold, CFSTR("asrConfidenceThreshold"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("sourceURL"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ttsPlaybackRate"), self->_ttsPlaybackRate);
  objc_msgSend(v5, "encodeBool:forKey:", self->_muteTTSBasedOnRingerSwitchIfPossible, CFSTR("muteTTSBasedOnRingerSwitchIfPossible"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableVAD, CFSTR("enableVAD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appIdentifier, CFSTR("appIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceOrigin, CFSTR("sourceOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedClientIdentifier, CFSTR("untrustedClientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logIdentifier, CFSTR("logIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsGenderDisambiguation, CFSTR("supportsGenderDisambiguation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_overrideOngoingSessionIfNeeded, CFSTR("overrideOngoingSessionIfNeeded"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cancelOnCleanup, CFSTR("cancelOnCleanup"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sanitizedCopyForUntrustedTextTranslation
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
  void *v12;

  v3 = objc_alloc_init(_LTTranslationContext);
  -[_LTTranslationContext uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[_LTTranslationContext setUniqueID:](v3, "setUniqueID:", v5);

  -[_LTTranslationContext sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_LTTranslationContext setSessionID:](v3, "setSessionID:", v7);

  -[_LTTranslationContext setTaskHint:](v3, "setTaskHint:", -[_LTTranslationContext taskHint](self, "taskHint"));
  -[_LTTranslationContext localePair](self, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[_LTTranslationContext setLocalePair:](v3, "setLocalePair:", v9);

  -[_LTTranslationContext setAutodetectLanguage:](v3, "setAutodetectLanguage:", -[_LTTranslationContext autodetectLanguage](self, "autodetectLanguage"));
  -[_LTTranslationContext setForceSourceLocale:](v3, "setForceSourceLocale:", -[_LTTranslationContext forceSourceLocale](self, "forceSourceLocale"));
  -[_LTTranslationContext setCensorSpeech:](v3, "setCensorSpeech:", -[_LTTranslationContext censorSpeech](self, "censorSpeech"));
  -[_LTTranslationContext setAutoEndpoint:](v3, "setAutoEndpoint:", -[_LTTranslationContext autoEndpoint](self, "autoEndpoint"));
  -[_LTTranslationContext setLidThreshold:](v3, "setLidThreshold:", -[_LTTranslationContext lidThreshold](self, "lidThreshold"));
  -[_LTTranslationContext setRoute:](v3, "setRoute:", -[_LTTranslationContext route](self, "route"));
  -[_LTTranslationContext appIdentifier](self, "appIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[_LTTranslationContext setAppIdentifier:](v3, "setAppIdentifier:", v11);

  -[_LTTranslationContext setSourceOrigin:](v3, "setSourceOrigin:", -[_LTTranslationContext sourceOrigin](self, "sourceOrigin"));
  -[_LTTranslationContext logIdentifier](self, "logIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext setLogIdentifier:](v3, "setLogIdentifier:", v12);

  -[_LTTranslationContext setIsFinal:](v3, "setIsFinal:", -[_LTTranslationContext isFinal](self, "isFinal"));
  -[_LTTranslationContext setSupportsGenderDisambiguation:](v3, "setSupportsGenderDisambiguation:", -[_LTTranslationContext supportsGenderDisambiguation](self, "supportsGenderDisambiguation"));
  -[_LTTranslationContext setCancelOnCleanup:](v3, "setCancelOnCleanup:", -[_LTTranslationContext cancelOnCleanup](self, "cancelOnCleanup"));
  return v3;
}

- (NSString)clientIdentifier
{
  id *p_trustedClientIdentifier;
  NSString *trustedClientIdentifier;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_trustedClientIdentifier = (id *)&self->_trustedClientIdentifier;
  trustedClientIdentifier = self->_trustedClientIdentifier;
  v5 = _LTOSLogXPC();
  v6 = v5;
  if (trustedClientIdentifier)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *p_trustedClientIdentifier;
      v9 = 138477827;
      v10 = v7;
      _os_log_impl(&dword_235438000, v6, OS_LOG_TYPE_INFO, "Using trusted client identifier: %{private}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_LTTranslationContext clientIdentifier].cold.1((uint64_t)self, v6);
    p_trustedClientIdentifier = (id *)&self->_untrustedClientIdentifier;
  }
  return (NSString *)*p_trustedClientIdentifier;
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

- (void)setLocalePair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)asrModelURLs
{
  return self->_asrModelURLs;
}

- (void)setAsrModelURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)mtModelURL
{
  return self->_mtModelURL;
}

- (void)setMtModelURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)autoEndpoint
{
  return self->_autoEndpoint;
}

- (void)setAutoEndpoint:(BOOL)a3
{
  self->_autoEndpoint = a3;
}

- (BOOL)overrideOngoingSessionIfNeeded
{
  return self->_overrideOngoingSessionIfNeeded;
}

- (void)setOverrideOngoingSessionIfNeeded:(BOOL)a3
{
  self->_overrideOngoingSessionIfNeeded = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (int64_t)lidThreshold
{
  return self->_lidThreshold;
}

- (void)setLidThreshold:(int64_t)a3
{
  self->_lidThreshold = a3;
}

- (int64_t)route
{
  return self->_route;
}

- (void)setRoute:(int64_t)a3
{
  self->_route = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (int64_t)asrConfidenceThreshold
{
  return self->_asrConfidenceThreshold;
}

- (void)setAsrConfidenceThreshold:(int64_t)a3
{
  self->_asrConfidenceThreshold = a3;
}

- (double)ttsPlaybackRate
{
  return self->_ttsPlaybackRate;
}

- (void)setTtsPlaybackRate:(double)a3
{
  self->_ttsPlaybackRate = a3;
}

- (BOOL)muteTTSBasedOnRingerSwitchIfPossible
{
  return self->_muteTTSBasedOnRingerSwitchIfPossible;
}

- (void)setMuteTTSBasedOnRingerSwitchIfPossible:(BOOL)a3
{
  self->_muteTTSBasedOnRingerSwitchIfPossible = a3;
}

- (BOOL)enableVAD
{
  return self->_enableVAD;
}

- (void)setEnableVAD:(BOOL)a3
{
  self->_enableVAD = a3;
}

- (BOOL)cancelOnCleanup
{
  return self->_cancelOnCleanup;
}

- (void)setCancelOnCleanup:(BOOL)a3
{
  self->_cancelOnCleanup = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (BOOL)supportsGenderDisambiguation
{
  return self->_supportsGenderDisambiguation;
}

- (void)setSupportsGenderDisambiguation:(BOOL)a3
{
  self->_supportsGenderDisambiguation = a3;
}

- (NSString)untrustedClientIdentifier
{
  return self->_untrustedClientIdentifier;
}

- (void)setUntrustedClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)trustedClientIdentifier
{
  return self->_trustedClientIdentifier;
}

- (void)setTrustedClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setDataSharingOptInStatus:(int64_t)a3
{
  self->_dataSharingOptInStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_mtModelURL, 0);
  objc_storeStrong((id *)&self->_asrModelURLs, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)clientIdentifier
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 144);
  v3 = 138477827;
  v4 = v2;
  _os_log_fault_impl(&dword_235438000, a2, OS_LOG_TYPE_FAULT, "Failed to get trusted client identifier, falling back to untrusted value: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end
