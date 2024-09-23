@implementation FCNewsPersonalizationConfiguration

- (FCNewsPersonalizationTrainingConfiguration)trainingConfiguration
{
  return self->_trainingConfiguration;
}

- (FCStatelessPersonalizationConfiguration)statelessPersonalizationConfiguration
{
  return self->_statelessPersonalizationConfiguration;
}

- (FCNewsPersonalizationFeatureConfiguration)featureConfiguration
{
  return self->_featureConfiguration;
}

- (FCNewsPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationConfiguration *v5;
  void *v6;
  FCUserEventHistoryTrackingConfiguration *v7;
  FCUserEventHistoryTrackingConfiguration *trackingConfiguration;
  void *v9;
  FCNewsPersonalizationFeatureConfiguration *v10;
  FCNewsPersonalizationFeatureConfiguration *featureConfiguration;
  void *v12;
  FCStatelessPersonalizationConfiguration *v13;
  FCStatelessPersonalizationConfiguration *statelessPersonalizationConfiguration;
  void *v15;
  FCNewsPersonalizationTrainingConfiguration *v16;
  FCNewsPersonalizationTrainingConfiguration *trainingConfiguration;
  void *v18;
  FCNewsArticleEmbeddingsConfiguration *v19;
  FCNewsArticleEmbeddingsConfiguration *articleEmbeddingsConfiguration;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FCNewsPersonalizationConfiguration;
  v5 = -[FCNewsPersonalizationConfiguration init](&v22, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("userEventHistoryTrackingConfiguration"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCUserEventHistoryTrackingConfiguration initWithDictionary:]([FCUserEventHistoryTrackingConfiguration alloc], "initWithDictionary:", v6);
    trackingConfiguration = v5->_trackingConfiguration;
    v5->_trackingConfiguration = v7;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("featureConfiguration"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCNewsPersonalizationFeatureConfiguration initWithDictionary:]([FCNewsPersonalizationFeatureConfiguration alloc], "initWithDictionary:", v9);
    featureConfiguration = v5->_featureConfiguration;
    v5->_featureConfiguration = v10;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("statelessPersonalizationConfiguration"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCStatelessPersonalizationConfiguration initWithDictionary:]([FCStatelessPersonalizationConfiguration alloc], "initWithDictionary:", v12);
    statelessPersonalizationConfiguration = v5->_statelessPersonalizationConfiguration;
    v5->_statelessPersonalizationConfiguration = v13;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trainingConfiguration"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsPersonalizationTrainingConfiguration initWithDictionary:]([FCNewsPersonalizationTrainingConfiguration alloc], "initWithDictionary:", v15);
    trainingConfiguration = v5->_trainingConfiguration;
    v5->_trainingConfiguration = v16;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleEmbeddingsConfiguration"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[FCNewsArticleEmbeddingsConfiguration initWithDictionary:]([FCNewsArticleEmbeddingsConfiguration alloc], "initWithDictionary:", v18);
    articleEmbeddingsConfiguration = v5->_articleEmbeddingsConfiguration;
    v5->_articleEmbeddingsConfiguration = v19;

  }
  return v5;
}

- (FCNewsArticleEmbeddingsConfiguration)articleEmbeddingsConfiguration
{
  return self->_articleEmbeddingsConfiguration;
}

- (FCNewsPersonalizationConfiguration)init
{
  return -[FCNewsPersonalizationConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCUserEventHistoryTrackingConfiguration)trackingConfiguration
{
  return self->_trackingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleEmbeddingsConfiguration, 0);
  objc_storeStrong((id *)&self->_trainingConfiguration, 0);
  objc_storeStrong((id *)&self->_featureConfiguration, 0);
  objc_storeStrong((id *)&self->_trackingConfiguration, 0);
  objc_storeStrong((id *)&self->_statelessPersonalizationConfiguration, 0);
}

+ (id)defaultConfiguration
{
  return -[FCNewsPersonalizationConfiguration initWithDictionary:]([FCNewsPersonalizationConfiguration alloc], "initWithDictionary:", &unk_1E470D240);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationConfiguration statelessPersonalizationConfiguration](self, "statelessPersonalizationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; statelessPersonalizationConfiguration: %@"), v4);

  -[FCNewsPersonalizationConfiguration trackingConfiguration](self, "trackingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trackingConfiguration: %@"), v5);

  -[FCNewsPersonalizationConfiguration featureConfiguration](self, "featureConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; featureConfiguration: %@"), v6);

  -[FCNewsPersonalizationConfiguration trainingConfiguration](self, "trainingConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trainingConfiguration: %@"), v7);

  -[FCNewsPersonalizationConfiguration articleEmbeddingsConfiguration](self, "articleEmbeddingsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleEmbeddingsConfiguration: %@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setStatelessPersonalizationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_statelessPersonalizationConfiguration, a3);
}

- (void)setTrackingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_trackingConfiguration, a3);
}

- (void)setFeatureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_featureConfiguration, a3);
}

- (void)setTrainingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_trainingConfiguration, a3);
}

- (void)setArticleEmbeddingsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_articleEmbeddingsConfiguration, a3);
}

@end
