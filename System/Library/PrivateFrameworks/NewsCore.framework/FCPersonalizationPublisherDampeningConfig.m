@implementation FCPersonalizationPublisherDampeningConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dampeningFactorMapping, 0);
}

- (FCPersonalizationPublisherDampeningConfig)initWithConfig:(id)a3
{
  id v4;
  FCPersonalizationPublisherDampeningConfig *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationPublisherDampeningConfig;
  v5 = -[FCPersonalizationPublisherDampeningConfig init](&v9, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("mapping"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("strategy"), 0);
    v5 = -[FCPersonalizationPublisherDampeningConfig initWithDampeningFactorMapping:dampeningStrategy:defaultDampeningFactor:](v5, "initWithDampeningFactorMapping:dampeningStrategy:defaultDampeningFactor:", v6, v7, FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("defaultDampeningFactor"), 1.0));

  }
  return v5;
}

- (FCPersonalizationPublisherDampeningConfig)initWithDampeningFactorMapping:(id)a3 dampeningStrategy:(unint64_t)a4 defaultDampeningFactor:(double)a5
{
  id v8;
  FCPersonalizationPublisherDampeningConfig *v9;
  NSDictionary *v10;
  NSDictionary *dampeningFactorMapping;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCPersonalizationPublisherDampeningConfig;
  v9 = -[FCPersonalizationPublisherDampeningConfig init](&v13, sel_init);
  if (v9)
  {
    if (v8)
      v10 = (NSDictionary *)v8;
    else
      v10 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    dampeningFactorMapping = v9->_dampeningFactorMapping;
    v9->_dampeningFactorMapping = v10;

    v9->_dampeningStrategy = a4;
    v9->_defaultDampeningFactor = a5;
  }

  return v9;
}

- (double)defaultDampeningFactor
{
  return self->_defaultDampeningFactor;
}

- (unint64_t)dampeningStrategy
{
  return self->_dampeningStrategy;
}

- (NSDictionary)dampeningFactorMapping
{
  return self->_dampeningFactorMapping;
}

- (FCPersonalizationPublisherDampeningConfig)init
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
    v8 = "-[FCPersonalizationPublisherDampeningConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationPublisherDampeningConfig.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationPublisherDampeningConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationPublisherDampeningConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  FCPersonalizationPublisherDampeningConfig *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("dampeningFactorMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dampeningStrategy"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultDampeningFactor"));
  v8 = v7;

  v9 = -[FCPersonalizationPublisherDampeningConfig initWithDampeningFactorMapping:dampeningStrategy:defaultDampeningFactor:](self, "initWithDampeningFactorMapping:dampeningStrategy:defaultDampeningFactor:", v5, v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FCPersonalizationPublisherDampeningConfig dampeningFactorMapping](self, "dampeningFactorMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("dampeningFactorMapping"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[FCPersonalizationPublisherDampeningConfig dampeningStrategy](self, "dampeningStrategy"), CFSTR("dampeningStrategy"));
  -[FCPersonalizationPublisherDampeningConfig defaultDampeningFactor](self, "defaultDampeningFactor");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("defaultDampeningFactor"));

}

- (void)setDampeningFactorMapping:(id)a3
{
  objc_storeStrong((id *)&self->_dampeningFactorMapping, a3);
}

- (void)setDampeningStrategy:(unint64_t)a3
{
  self->_dampeningStrategy = a3;
}

- (void)setDefaultDampeningFactor:(double)a3
{
  self->_defaultDampeningFactor = a3;
}

@end
