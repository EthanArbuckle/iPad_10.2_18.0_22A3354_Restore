@implementation FCSportsPrivacyConfiguration

- (FCSportsPrivacyConfiguration)initWithConfigDictionary:(id)a3
{
  id v4;
  FCSportsPrivacyConfiguration *v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCSportsPrivacyConfiguration;
  v5 = -[FCSportsPrivacyConfiguration init](&v11, sel_init);
  if (v5)
  {
    v5->_isHeadlineExposureTrackingDisabled = +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("disableHeadlineExposureTrackingEnabledLevel"), 0));
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("syncEventSamplingRate"), &unk_1E470D5A0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v5->_syncEventSamplingRate = v7;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("headlineExposureNoiseRate"), &unk_1E470D5B0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_headlineExposureNoiseRate = v9;

  }
  return v5;
}

- (double)headlineExposureNoiseRate
{
  return self->_headlineExposureNoiseRate;
}

- (FCSportsPrivacyConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCSportsPrivacyConfiguration init]";
    v9 = 2080;
    v10 = "FCSportsPrivacyConfiguration.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCSportsPrivacyConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isHeadlineExposureTrackingDisabled
{
  return self->_isHeadlineExposureTrackingDisabled;
}

- (double)syncEventSamplingRate
{
  return self->_syncEventSamplingRate;
}

@end
