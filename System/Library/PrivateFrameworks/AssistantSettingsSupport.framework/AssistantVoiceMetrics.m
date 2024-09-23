@implementation AssistantVoiceMetrics

- (void)setVoiceDownloadForLanguageCode:(id)a3 name:(id)a4
{
  NSString *v5;
  NSString *voiceDownloadKey;

  +[AssistantVoiceMetrics keyForLanguage:name:](AssistantVoiceMetrics, "keyForLanguage:name:", a3, a4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  voiceDownloadKey = self->_voiceDownloadKey;
  self->_voiceDownloadKey = v5;

}

- (void)setVoicePreviewedForLanguageCode:(id)a3 name:(id)a4
{
  NSString *v5;
  NSString *lastVoicePreviewedKey;

  ++self->_voicesPreviewed;
  +[AssistantVoiceMetrics keyForLanguage:name:](AssistantVoiceMetrics, "keyForLanguage:name:", a3, a4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastVoicePreviewedKey = self->_lastVoicePreviewedKey;
  self->_lastVoicePreviewedKey = v5;

  -[NSMutableSet addObject:](self->_mutableUniqueVoicesPreviewed, "addObject:", self->_lastVoicePreviewedKey);
}

- (void)beginDownloadObservation
{
  self->_downloadObservationBeginTimestamp = mach_absolute_time();
}

- (void)endDownloadObservation
{
  self->_downloadObservationEndTimestamp = mach_absolute_time();
}

- (unint64_t)uniqueVoicesPreviewed
{
  return -[NSMutableSet count](self->_mutableUniqueVoicesPreviewed, "count");
}

- (AssistantVoiceMetrics)init
{
  AssistantVoiceMetrics *v2;
  uint64_t v3;
  NSMutableSet *mutableUniqueVoicesPreviewed;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssistantVoiceMetrics;
  v2 = -[AssistantVoiceMetrics init](&v6, sel_init);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = objc_claimAutoreleasedReturnValue();
  mutableUniqueVoicesPreviewed = v2->_mutableUniqueVoicesPreviewed;
  v2->_mutableUniqueVoicesPreviewed = (NSMutableSet *)v3;

  return v2;
}

- (id)description
{
  void *v2;
  void *v3;

  -[AssistantVoiceMetrics dictionaryMetrics](self, "dictionaryMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *voiceDownloadKey;
  void *v5;
  id v6;

  voiceDownloadKey = self->_voiceDownloadKey;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", voiceDownloadKey, CFSTR("_voiceDownloadKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastVoicePreviewedKey, CFSTR("_lastVoicePreviewedKey"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_voicesPreviewed, CFSTR("_voicesPreviewed"));
  -[NSMutableSet allObjects](self->_mutableUniqueVoicesPreviewed, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_uniqueVoicesPreviewed"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_isCellularAllowed, CFSTR("_isCellularAllowed"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_downloadObservationBeginTimestamp, CFSTR("_downloadObservationBeginTimestamp"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_downloadObservationEndTimestamp, CFSTR("_downloadObservationEndTimestamp"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("_downloadObservationProgress"), self->_downloadObservationProgress);
  objc_msgSend(v6, "encodeBool:forKey:", self->_downloadError, CFSTR("_downloadError"));

}

- (AssistantVoiceMetrics)initWithCoder:(id)a3
{
  id v4;
  AssistantVoiceMetrics *v5;
  uint64_t v6;
  NSString *voiceDownloadKey;
  uint64_t v8;
  NSString *lastVoicePreviewedKey;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableSet *mutableUniqueVoicesPreviewed;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AssistantVoiceMetrics;
  v5 = -[AssistantVoiceMetrics init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceDownloadKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    voiceDownloadKey = v5->_voiceDownloadKey;
    v5->_voiceDownloadKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastVoicePreviewedKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastVoicePreviewedKey = v5->_lastVoicePreviewedKey;
    v5->_lastVoicePreviewedKey = (NSString *)v8;

    v5->_voicesPreviewed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_voicesPreviewed"));
    v10 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueVoicesPreviewed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    mutableUniqueVoicesPreviewed = v5->_mutableUniqueVoicesPreviewed;
    v5->_mutableUniqueVoicesPreviewed = (NSMutableSet *)v12;

    v5->_isCellularAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCellularAllowed"));
    v5->_downloadObservationBeginTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_downloadObservationBeginTimestamp"));
    v5->_downloadObservationEndTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_downloadObservationEndTimestamp"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_downloadObservationProgress"));
    *(float *)&v14 = v14;
    v5->_downloadObservationProgress = *(float *)&v14;
    v5->_downloadError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_downloadError"));
  }

  return v5;
}

- (double)_clockFactor
{
  if (_clockFactor_onceToken != -1)
    dispatch_once(&_clockFactor_onceToken, &__block_literal_global);
  return *(double *)&_clockFactor_clockToSeconds;
}

double __37__AssistantVoiceMetrics__clockFactor__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  _clockFactor_clockToSeconds = *(_QWORD *)&result;
  return result;
}

+ (id)keyForLanguage:(id)a3 name:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

- (double)downloadObservationDuration
{
  int64_t downloadObservationBeginTimestamp;
  uint64_t downloadObservationEndTimestamp;
  double v5;
  double v6;

  downloadObservationBeginTimestamp = self->_downloadObservationBeginTimestamp;
  if (!downloadObservationBeginTimestamp)
    return 0.0;
  downloadObservationEndTimestamp = self->_downloadObservationEndTimestamp;
  if (!downloadObservationEndTimestamp)
  {
    downloadObservationEndTimestamp = mach_absolute_time();
    downloadObservationBeginTimestamp = self->_downloadObservationBeginTimestamp;
  }
  v5 = (double)(downloadObservationEndTimestamp - downloadObservationBeginTimestamp);
  -[AssistantVoiceMetrics _clockFactor](self, "_clockFactor");
  return v6 * v5;
}

- (id)dictionaryMetrics
{
  const __CFString *lastVoicePreviewedKey;
  const __CFString *voiceDownloadKey;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x24BDAC8D0];
  lastVoicePreviewedKey = &stru_24D33E0B0;
  v16[0] = CFSTR("voice");
  v16[1] = CFSTR("last_preview");
  voiceDownloadKey = (const __CFString *)self->_voiceDownloadKey;
  if (!voiceDownloadKey)
    voiceDownloadKey = &stru_24D33E0B0;
  if (self->_lastVoicePreviewedKey)
    lastVoicePreviewedKey = (const __CFString *)self->_lastVoicePreviewedKey;
  v17[0] = voiceDownloadKey;
  v17[1] = lastVoicePreviewedKey;
  v16[2] = CFSTR("voices_previewed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_voicesPreviewed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("voices_previewed_unique");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AssistantVoiceMetrics uniqueVoicesPreviewed](self, "uniqueVoicesPreviewed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  v16[4] = CFSTR("allowing_cellular");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCellularAllowed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  v16[5] = CFSTR("download_duration");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[AssistantVoiceMetrics downloadObservationDuration](self, "downloadObservationDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v9;
  v16[6] = CFSTR("download_progress");
  *(float *)&v10 = self->_downloadObservationProgress;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v11;
  v16[7] = CFSTR("download_error");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadError);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  v16[8] = CFSTR("previewed_successfully");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_previewedSuccessfully);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)sendAnalyticsEvent
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[AssistantVoiceMetrics sendAnalyticsEvent]";
  v3 = 2112;
  v4 = CFSTR("com.apple.siri.assistant-settings-support.voiceSelection");
  _os_log_error_impl(&dword_2153F2000, log, OS_LOG_TYPE_ERROR, "%s CoreAnalytics eventName:%@ not sent. Event name must not be in current config", (uint8_t *)&v1, 0x16u);
}

uint64_t __43__AssistantVoiceMetrics_sendAnalyticsEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictionaryMetrics");
}

- (BOOL)previewedSuccessfully
{
  return self->_previewedSuccessfully;
}

- (void)setPreviewedSuccessfully:(BOOL)a3
{
  self->_previewedSuccessfully = a3;
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (float)downloadObservationProgress
{
  return self->_downloadObservationProgress;
}

- (void)setDownloadObservationProgress:(float)a3
{
  self->_downloadObservationProgress = a3;
}

- (BOOL)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(BOOL)a3
{
  self->_downloadError = a3;
}

- (NSString)voiceDownloadKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)lastVoicePreviewedKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)voicesPreviewed
{
  return self->_voicesPreviewed;
}

- (int64_t)downloadObservationBeginTimestamp
{
  return self->_downloadObservationBeginTimestamp;
}

- (int64_t)downloadObservationEndTimestamp
{
  return self->_downloadObservationEndTimestamp;
}

- (BOOL)sentOnce
{
  return self->_sentOnce;
}

- (void)setSentOnce:(BOOL)a3
{
  self->_sentOnce = a3;
}

- (NSMutableSet)mutableUniqueVoicesPreviewed
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMutableUniqueVoicesPreviewed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableUniqueVoicesPreviewed, 0);
  objc_storeStrong((id *)&self->_lastVoicePreviewedKey, 0);
  objc_storeStrong((id *)&self->_voiceDownloadKey, 0);
}

@end
