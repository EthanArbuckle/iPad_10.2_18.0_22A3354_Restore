@implementation FCWidgetConfig

- (FCWidgetConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCWidgetConfig *v5;
  uint64_t v6;
  NSDictionary *configDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCWidgetConfig;
  v5 = -[FCWidgetConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_pbWidgetConfig, 0);
}

- (FCWidgetConfig)initWithWidgetConfig:(id)a3
{
  id v4;
  FCWidgetConfig *v5;
  uint64_t v6;
  NTPBWidgetConfig *pbWidgetConfig;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCWidgetConfig;
  v5 = -[FCWidgetConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    pbWidgetConfig = v5->_pbWidgetConfig;
    v5->_pbWidgetConfig = (NTPBWidgetConfig *)v6;

  }
  return v5;
}

- (int64_t)forYouBackgroundMinimumUpdateInterval
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "forYouBackgroundMinimumUpdateInterval");
  }
  else
  {
    -[FCWidgetConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("forYouBackgroundMinimumUpdateInterval"), 1200);
  }
  v6 = v5;

  return v6;
}

- (int64_t)minimumArticleExposureDurationToBePreseen
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "minimumArticleExposureDurationToBePreseen");
  }
  else
  {
    -[FCWidgetConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minimumArticleExposureDurationToBePreseen"), 1000);
  }
  v6 = v5;

  return v6;
}

- (unsigned)minimumNumberOfTimesPreseenToBeSeen
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "minimumNumberOfTimesPreseenToBeSeen");
  }
  else
  {
    -[FCWidgetConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("minimumNumberOfTimesPreseenToBeSeen"), 2);
  }

  return v5;
}

- (int64_t)widgetSystemReloadInterval
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("widgetSystemReloadInterval"), 300);

  return v3;
}

- (int64_t)widgetSystemReloadJitterMax
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("widgetSystemReloadJitterMax"), 600);

  return v3;
}

- (int64_t)widgetSystemHoneymoonDuration
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("widgetSystemHoneymoonDuration"), 172800);

  return v3;
}

- (int64_t)widgetSystemReloadIntervalHoneymoon
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("widgetSystemReloadIntervalHoneymoon"), 300);

  return v3;
}

- (int64_t)widgetSystemReloadJitterMaxHoneymoon
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("widgetSystemReloadJitterMaxHoneymoon"), 600);

  return v3;
}

- (int64_t)smallWidgetSystemReloadInterval
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smallWidgetSystemReloadInterval"), 7200);

  return v3;
}

- (int64_t)smallWidgetSystemReloadJitterMax
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smallWidgetSystemReloadJitterMax"), 600);

  return v3;
}

- (int64_t)smallWidgetSystemHoneymoonDuration
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smallWidgetSystemHoneymoonDuration"), 172800);

  return v3;
}

- (int64_t)smallWidgetSystemReloadIntervalHoneymoon
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smallWidgetSystemReloadIntervalHoneymoon"), 7200);

  return v3;
}

- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon
{
  void *v2;
  int64_t v3;

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smallWidgetSystemReloadJitterMaxHoneymoon"), 600);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCWidgetConfig *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(FCWidgetConfig);
  -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCWidgetConfig setPbWidgetConfig:](v4, "setPbWidgetConfig:", v5);

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCWidgetConfig setConfigDictionary:](v4, "setConfigDictionary:", v6);

  return v4;
}

- (FCWidgetConfig)initWithCoder:(id)a3
{
  id v4;
  FCWidgetConfig *v5;
  uint64_t v6;
  NTPBWidgetConfig *pbWidgetConfig;
  uint64_t v8;
  NSDictionary *configDictionary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCWidgetConfig;
  v5 = -[FCWidgetConfig init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pbWidgetConfig"));
    v6 = objc_claimAutoreleasedReturnValue();
    pbWidgetConfig = v5->_pbWidgetConfig;
    v5->_pbWidgetConfig = (NTPBWidgetConfig *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configDictionary"));
    v8 = objc_claimAutoreleasedReturnValue();
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCWidgetConfig pbWidgetConfig](self, "pbWidgetConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pbWidgetConfig"));

  -[FCWidgetConfig configDictionary](self, "configDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configDictionary"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTPBWidgetConfig)pbWidgetConfig
{
  return self->_pbWidgetConfig;
}

- (void)setPbWidgetConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
