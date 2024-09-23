@implementation FCAudioUpsellConfig

- (FCAudioUpsellConfig)init
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
    v8 = "-[FCAudioUpsellConfig init]";
    v9 = 2080;
    v10 = "FCAudioUpsellConfig.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAudioUpsellConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCAudioUpsellConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCAudioUpsellConfig *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *URL;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCAudioUpsellConfig;
  v5 = -[FCAudioUpsellConfig init](&v12, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("identifier"), &stru_1E464BC40);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    v5->_duration = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("duration"), 0.0);
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("playPosition"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_playPosition = FCAudioUpsellPlayPositionForValue(v10);

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)playPosition
{
  return self->_playPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
