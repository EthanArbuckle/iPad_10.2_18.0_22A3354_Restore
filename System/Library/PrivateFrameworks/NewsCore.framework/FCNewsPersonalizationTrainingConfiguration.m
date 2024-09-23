@implementation FCNewsPersonalizationTrainingConfiguration

- (FCNewsPersonalizationTrainingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationTrainingConfiguration *v5;
  void *v6;
  FCNewsPersonalizationEventConditionalsConfigurations *v7;
  FCNewsPersonalizationEventConditionalsConfigurations *eventConditionalsConfigurations;
  void *v9;
  FCNewsPersonalizationAggregateModificationConfigurations *v10;
  FCNewsPersonalizationAggregateModificationConfigurations *aggregateModificationConfigurations;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  FCNewsPersonalizationFeaturePriorsConfiguration *v16;
  FCNewsPersonalizationTrainingBiases *v17;
  void *v18;
  uint64_t v19;
  FCNewsPersonalizationTrainingBiases *biases;
  FCNewsPersonalizationTrainingFeatureFlags *v21;
  void *v22;
  uint64_t v23;
  FCNewsPersonalizationTrainingFeatureFlags *featureFlags;
  void *v25;
  FCNewsPersonalizationTrainingLegacyBridgeConfiguration *v26;
  FCNewsPersonalizationTrainingLegacyBridgeConfiguration *legacyBridgeConfiguration;
  void *v28;
  int v29;
  void *v30;
  int v31;
  FCNewsPersonalizationTrainingConfiguration *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FCNewsPersonalizationTrainingConfiguration;
  v5 = -[FCNewsPersonalizationTrainingConfiguration init](&v34, sel_init);
  if (!v5)
    goto LABEL_14;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("eventConditionals"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsPersonalizationEventConditionalsConfigurations initWithDictionary:]([FCNewsPersonalizationEventConditionalsConfigurations alloc], "initWithDictionary:", v6);
  eventConditionalsConfigurations = v5->_eventConditionalsConfigurations;
  v5->_eventConditionalsConfigurations = v7;

  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("aggregateModificationConfigurations"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCNewsPersonalizationAggregateModificationConfigurations initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfigurations alloc], "initWithDictionary:", v9);
  aggregateModificationConfigurations = v5->_aggregateModificationConfigurations;
  v5->_aggregateModificationConfigurations = v10;

  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("decayRate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v5->_decayRate = v14;
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("featurePriors"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsPersonalizationFeaturePriorsConfiguration initWithDictionary:]([FCNewsPersonalizationFeaturePriorsConfiguration alloc], "initWithDictionary:", v15);
    if (v16)
    {
      objc_storeStrong((id *)&v5->_priorsConfiguration, v16);
      v17 = [FCNewsPersonalizationTrainingBiases alloc];
      FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("biases"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FCNewsPersonalizationTrainingBiases initWithBiases:](v17, "initWithBiases:", v18);
      biases = v5->_biases;
      v5->_biases = (FCNewsPersonalizationTrainingBiases *)v19;

      v21 = [FCNewsPersonalizationTrainingFeatureFlags alloc];
      FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("featureFlags"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[FCNewsPersonalizationTrainingFeatureFlags initWithDictionary:](v21, "initWithDictionary:", v22);
      featureFlags = v5->_featureFlags;
      v5->_featureFlags = (FCNewsPersonalizationTrainingFeatureFlags *)v23;

      FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("legacyBridgeConfiguration"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration initWithDictionary:]([FCNewsPersonalizationTrainingLegacyBridgeConfiguration alloc], "initWithDictionary:", v25);
      legacyBridgeConfiguration = v5->_legacyBridgeConfiguration;
      v5->_legacyBridgeConfiguration = v26;

      if (!NFInternalBuild())
        goto LABEL_8;
      NewsCoreUserDefaults();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("news.news_personalization.enable_training_configuration_override"));

      if (v29)
      {
        NewsCoreUserDefaults();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_disableTrainingLegacyAggregates = objc_msgSend(v30, "BOOLForKey:", CFSTR("news.news_personalization.disable_training_legacy_aggregates"));

      }
      else
      {
LABEL_8:
        v5->_disableTrainingLegacyAggregates = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("disableTrainingLegacyAggregates"), 0);
      }

      v31 = 0;
    }
    else
    {
      v31 = 1;
    }

  }
  else
  {
    v31 = 1;
  }

  if (v31)
    v32 = 0;
  else
LABEL_14:
    v32 = v5;

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyBridgeConfiguration, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_priorsConfiguration, 0);
  objc_storeStrong((id *)&self->_aggregateModificationConfigurations, 0);
  objc_storeStrong((id *)&self->_eventConditionalsConfigurations, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationTrainingConfiguration eventConditionalsConfigurations](self, "eventConditionalsConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; eventConditionalsConfigurations: %@"), v4);

  -[FCNewsPersonalizationTrainingConfiguration aggregateModificationConfigurations](self, "aggregateModificationConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; aggregateModificationConfigurations: %@"), v5);

  -[FCNewsPersonalizationTrainingConfiguration decayRate](self, "decayRate");
  objc_msgSend(v3, "appendFormat:", CFSTR("; decayRate: %f"), v6);
  -[FCNewsPersonalizationTrainingConfiguration priorsConfiguration](self, "priorsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; priorsConfiguration: %@"), v7);

  -[FCNewsPersonalizationTrainingConfiguration biases](self, "biases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; biases: %@"), v8);

  -[FCNewsPersonalizationTrainingConfiguration featureFlags](self, "featureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; featureFlags: %@"), v9);

  -[FCNewsPersonalizationTrainingConfiguration legacyBridgeConfiguration](self, "legacyBridgeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; legacyBridgeConfiguration: %@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("; disableTrainingLegacyAggregates: %d"),
    -[FCNewsPersonalizationTrainingConfiguration disableTrainingLegacyAggregates](self, "disableTrainingLegacyAggregates"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationEventConditionalsConfigurations)eventConditionalsConfigurations
{
  return self->_eventConditionalsConfigurations;
}

- (void)setEventConditionalsConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_eventConditionalsConfigurations, a3);
}

- (FCNewsPersonalizationAggregateModificationConfigurations)aggregateModificationConfigurations
{
  return self->_aggregateModificationConfigurations;
}

- (void)setAggregateModificationConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateModificationConfigurations, a3);
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (FCNewsPersonalizationFeaturePriorsConfiguration)priorsConfiguration
{
  return self->_priorsConfiguration;
}

- (void)setPriorsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_priorsConfiguration, a3);
}

- (FCNewsPersonalizationTrainingBiases)biases
{
  return self->_biases;
}

- (void)setBiases:(id)a3
{
  objc_storeStrong((id *)&self->_biases, a3);
}

- (FCNewsPersonalizationTrainingFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (FCNewsPersonalizationTrainingLegacyBridgeConfiguration)legacyBridgeConfiguration
{
  return self->_legacyBridgeConfiguration;
}

- (void)setLegacyBridgeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_legacyBridgeConfiguration, a3);
}

- (BOOL)disableTrainingLegacyAggregates
{
  return self->_disableTrainingLegacyAggregates;
}

- (void)setDisableTrainingLegacyAggregates:(BOOL)a3
{
  self->_disableTrainingLegacyAggregates = a3;
}

@end
