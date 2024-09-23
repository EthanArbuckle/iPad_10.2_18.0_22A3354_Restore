@implementation FCPaywallTopOffsetConfiguration

- (FCPaywallTopOffsetConfiguration)init
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
    v8 = "-[FCPaywallTopOffsetConfiguration init]";
    v9 = 2080;
    v10 = "FCPaywallTopOffsetConfiguration.m";
    v11 = 1024;
    v12 = 16;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPaywallTopOffsetConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPaywallTopOffsetConfiguration)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPaywallTopOffsetConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPaywallTopOffsetConfiguration;
  v5 = -[FCPaywallTopOffsetConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_compactPortraitTopOffsetRatio = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("compactPortraitTopOffsetRatio"), 0.0);
    v5->_compactLandscapeTopOffsetRatio = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("compactLandscapeTopOffsetRatio"), 0.0);
    v5->_regularPortraitTopOffsetRatio = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("regularPortraitTopOffsetRatio"), 0.0);
    v5->_regularLandscapeTopOffsetRatio = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("regularLandscapeTopOffsetRatio"), 0.0);
  }

  return v5;
}

- (FCPaywallTopOffsetConfiguration)initWithCompactPortraitTopOffsetRatio:(double)a3 compactLandscapeTopOffsetRatio:(double)a4 regularPortraitTopOffsetRatio:(double)a5 regularLandscapeTopOffsetRatio:(double)a6
{
  FCPaywallTopOffsetConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCPaywallTopOffsetConfiguration;
  result = -[FCPaywallTopOffsetConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_compactPortraitTopOffsetRatio = a3;
    result->_compactLandscapeTopOffsetRatio = a4;
    result->_regularPortraitTopOffsetRatio = a5;
    result->_regularLandscapeTopOffsetRatio = a6;
  }
  return result;
}

- (double)compactPortraitTopOffsetRatio
{
  return self->_compactPortraitTopOffsetRatio;
}

- (double)compactLandscapeTopOffsetRatio
{
  return self->_compactLandscapeTopOffsetRatio;
}

- (double)regularPortraitTopOffsetRatio
{
  return self->_regularPortraitTopOffsetRatio;
}

- (double)regularLandscapeTopOffsetRatio
{
  return self->_regularLandscapeTopOffsetRatio;
}

@end
