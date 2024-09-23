@implementation FCNewsPersonalizationTrainingLegacyBridgeConfiguration

- (FCNewsPersonalizationTrainingLegacyBridgeConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationTrainingLegacyBridgeConfiguration *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FCNewsPersonalizationTrainingLegacyBridgeConfiguration;
  v5 = -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration init](&v26, sel_init);
  if (v5)
  {
    if (NFInternalBuild()
      && (NewsCoreUserDefaults(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("news.news_personalization.should_override_legacy_bridging_configuration")), v6, v7))
    {
      NewsCoreUserDefaults();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_priorStatelessAggregatesWithLegacyAggregates = objc_msgSend(v8, "BOOLForKey:", CFSTR("news.news_personalization.prior_stateless_aggregates_with_legacy_aggregates"));

      NewsCoreUserDefaults();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_avoidDoubleCountingWhenPrioringWithLegacyAggregates = objc_msgSend(v9, "BOOLForKey:", CFSTR("news.news_personalization.avoid_double_counting_when_prioring_with_legacy_aggregates"));

      NewsCoreUserDefaults();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_allowAllLegacyAggregatesToActAsPriors = objc_msgSend(v10, "BOOLForKey:", CFSTR("news.news_personalization.allow_all_legacy_aggregates_to_act_as_priors"));

      NewsCoreUserDefaults();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("news.news_personalization.legacy_multiplier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        NewsCoreUserDefaults();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleForKey:", CFSTR("news.news_personalization.legacy_multiplier"));
        v5->_legacyMultiplier = v14;

      }
      else
      {
        v5->_legacyMultiplier = 1.0;
      }

      NewsCoreUserDefaults();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("news.news_personalization.legacy_decay_rate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        NewsCoreUserDefaults();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleForKey:", CFSTR("news.news_personalization.legacy_decay_rate"));
        v5->_legacyDecayRate = v20;

      }
      else
      {
        v5->_legacyDecayRate = 0.98;
      }

      NewsCoreUserDefaults();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_createStatelessAggregatesWhichOnlyExistInLegacy = objc_msgSend(v21, "BOOLForKey:", CFSTR("news.news_personalization.create_stateless_aggregates_which_only_exist_in_legacy"));

      NewsCoreUserDefaults();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_legacyMaxLinearImpressionCount = objc_msgSend(v22, "integerForKey:", CFSTR("news.news_personalization.legacy_max_linear_impression_count"));

      NewsCoreUserDefaults();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_statelessMaxLinearImpressionCount = objc_msgSend(v23, "integerForKey:", CFSTR("news.news_personalization.stateless_max_linear_impression_count"));

      NewsCoreUserDefaults();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_disablePrioringBaseline = objc_msgSend(v24, "BOOLForKey:", CFSTR("news.news_personalization.disable_prioring_baseline"));

    }
    else
    {
      v5->_priorStatelessAggregatesWithLegacyAggregates = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("priorStatelessAggregatesWithLegacyAggregates2"), 0);
      v5->_avoidDoubleCountingWhenPrioringWithLegacyAggregates = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("avoidDoubleCountingWhenPrioringWithLegacyAggregates"), 1);
      v5->_allowAllLegacyAggregatesToActAsPriors = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("allowAllLegacyAggregatesToActAsPriors"), 0);
      v15 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("legacyMultiplier"), 1.0);
      if (v15 < 0.0)
        v15 = 1.0;
      v5->_legacyMultiplier = v15;
      v16 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("legacyDecayRate"), 0.98);
      if (v16 < 0.0)
        v16 = 0.98;
      v5->_legacyDecayRate = v16;
      v5->_createStatelessAggregatesWhichOnlyExistInLegacy = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("createStatelessAggregatesWhichOnlyExistInLegacy2"), 0);
      v5->_legacyMaxLinearImpressionCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("legacyMaxLinearImpressionCount"), 555);
      v5->_statelessMaxLinearImpressionCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("statelessMaxLinearImpressionCount"), 2500);
      v5->_disablePrioringBaseline = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("disablePrioringBaseline"), 0);
    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; priorStatelessAggregatesWithLegacyAggregates: %d"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration priorStatelessAggregatesWithLegacyAggregates](self, "priorStatelessAggregatesWithLegacyAggregates"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; avoidDoubleCountingWhenPrioringWithLegacyAggregates: %d"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration avoidDoubleCountingWhenPrioringWithLegacyAggregates](self, "avoidDoubleCountingWhenPrioringWithLegacyAggregates"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; allowAllLegacyAggregatesToActAsPriors: %d"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration allowAllLegacyAggregatesToActAsPriors](self, "allowAllLegacyAggregatesToActAsPriors"));
  -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration legacyMultiplier](self, "legacyMultiplier");
  objc_msgSend(v3, "appendFormat:", CFSTR("; legacyMultiplier: %f"), v4);
  -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration legacyDecayRate](self, "legacyDecayRate");
  objc_msgSend(v3, "appendFormat:", CFSTR("; legacyDecayRate: %f"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("; createStatelessAggregatesWhichOnlyExistInLegacy: %d"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration createStatelessAggregatesWhichOnlyExistInLegacy](self, "createStatelessAggregatesWhichOnlyExistInLegacy"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; legacyMaxLinearImpressionCount: %lld"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration legacyMaxLinearImpressionCount](self, "legacyMaxLinearImpressionCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; statelessMaxLinearImpressionCount: %lld"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration statelessMaxLinearImpressionCount](self, "statelessMaxLinearImpressionCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; disablePrioringBaseline: %d"),
    -[FCNewsPersonalizationTrainingLegacyBridgeConfiguration disablePrioringBaseline](self, "disablePrioringBaseline"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)priorStatelessAggregatesWithLegacyAggregates
{
  return self->_priorStatelessAggregatesWithLegacyAggregates;
}

- (void)setPriorStatelessAggregatesWithLegacyAggregates:(BOOL)a3
{
  self->_priorStatelessAggregatesWithLegacyAggregates = a3;
}

- (BOOL)avoidDoubleCountingWhenPrioringWithLegacyAggregates
{
  return self->_avoidDoubleCountingWhenPrioringWithLegacyAggregates;
}

- (void)setAvoidDoubleCountingWhenPrioringWithLegacyAggregates:(BOOL)a3
{
  self->_avoidDoubleCountingWhenPrioringWithLegacyAggregates = a3;
}

- (BOOL)allowAllLegacyAggregatesToActAsPriors
{
  return self->_allowAllLegacyAggregatesToActAsPriors;
}

- (void)setAllowAllLegacyAggregatesToActAsPriors:(BOOL)a3
{
  self->_allowAllLegacyAggregatesToActAsPriors = a3;
}

- (double)legacyMultiplier
{
  return self->_legacyMultiplier;
}

- (void)setLegacyMultiplier:(double)a3
{
  self->_legacyMultiplier = a3;
}

- (double)legacyDecayRate
{
  return self->_legacyDecayRate;
}

- (void)setLegacyDecayRate:(double)a3
{
  self->_legacyDecayRate = a3;
}

- (BOOL)createStatelessAggregatesWhichOnlyExistInLegacy
{
  return self->_createStatelessAggregatesWhichOnlyExistInLegacy;
}

- (void)setCreateStatelessAggregatesWhichOnlyExistInLegacy:(BOOL)a3
{
  self->_createStatelessAggregatesWhichOnlyExistInLegacy = a3;
}

- (int64_t)legacyMaxLinearImpressionCount
{
  return self->_legacyMaxLinearImpressionCount;
}

- (void)setLegacyMaxLinearImpressionCount:(int64_t)a3
{
  self->_legacyMaxLinearImpressionCount = a3;
}

- (int64_t)statelessMaxLinearImpressionCount
{
  return self->_statelessMaxLinearImpressionCount;
}

- (void)setStatelessMaxLinearImpressionCount:(int64_t)a3
{
  self->_statelessMaxLinearImpressionCount = a3;
}

- (BOOL)disablePrioringBaseline
{
  return self->_disablePrioringBaseline;
}

- (void)setDisablePrioringBaseline:(BOOL)a3
{
  self->_disablePrioringBaseline = a3;
}

@end
