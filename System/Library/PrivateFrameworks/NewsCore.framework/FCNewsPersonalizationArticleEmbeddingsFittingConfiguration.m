@implementation FCNewsPersonalizationArticleEmbeddingsFittingConfiguration

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *v5;
  void *v6;
  FCNewsPersonalizationArticleEmbeddingsFittingRequirements *v7;
  FCNewsPersonalizationArticleEmbeddingsFittingRequirements *articleReadRequirements;
  void *v9;
  FCNewsPersonalizationArticleEmbeddingsFittingRequirements *v10;
  FCNewsPersonalizationArticleEmbeddingsFittingRequirements *articleSeenRequirements;
  uint64_t v12;
  NSNumber *maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
  id v14;
  void *v15;
  FCNewsPersonalizationLogisticRegressionClassifierConfiguration *v16;
  FCNewsPersonalizationLogisticRegressionClassifierConfiguration *logisticRegressionClassifierConfiguration;
  _QWORD v19[5];
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCNewsPersonalizationArticleEmbeddingsFittingConfiguration;
  v5 = -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration init](&v20, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleReadRequirements"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements initWithDictionary:]([FCNewsPersonalizationArticleEmbeddingsFittingRequirements alloc], "initWithDictionary:", v6);
    articleReadRequirements = v5->_articleReadRequirements;
    v5->_articleReadRequirements = v7;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleSeenRequirements"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements initWithDictionary:]([FCNewsPersonalizationArticleEmbeddingsFittingRequirements alloc], "initWithDictionary:", v9);
    articleSeenRequirements = v5->_articleSeenRequirements;
    v5->_articleSeenRequirements = v10;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings"), &unk_1E470AB38);
    v12 = objc_claimAutoreleasedReturnValue();
    maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings = v5->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
    v5->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings = (NSNumber *)v12;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke;
    v19[3] = &unk_1E4642F58;
    v14 = v4;
    v19[4] = v14;
    v5->_embeddingType = __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke((uint64_t)v19);
    FCAppConfigurationDictionaryValueWithDefaultValue(v14, (uint64_t)CFSTR("logisticRegressionClassifierConfiguration"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration initWithDictionary:]([FCNewsPersonalizationLogisticRegressionClassifierConfiguration alloc], "initWithDictionary:", v15);
    logisticRegressionClassifierConfiguration = v5->_logisticRegressionClassifierConfiguration;
    v5->_logisticRegressionClassifierConfiguration = v16;

    v5->_earliestAllowedEmbeddingEventTimestamp = FCAppConfigurationDoubleValue(v14, (uint64_t)CFSTR("earliestAllowedEmbeddingEventTimestamp"), 0.0);
    v5->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession = FCAppConfigurationBoolValue(v14, (uint64_t)CFSTR("haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession"), 1);

  }
  return v5;
}

uint64_t __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  FCAppConfigurationStringValue(*(void **)(a1 + 32), (uint64_t)CFSTR("embeddingType"), CFSTR("title"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("body"));

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logisticRegressionClassifierConfiguration, 0);
  objc_storeStrong((id *)&self->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings, 0);
  objc_storeStrong((id *)&self->_articleSeenRequirements, 0);
  objc_storeStrong((id *)&self->_articleReadRequirements, 0);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)init
{
  return -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration articleReadRequirements](self, "articleReadRequirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleReadRequirements: %@"), v4);

  -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration articleSeenRequirements](self, "articleSeenRequirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleSeenRequirements: %@"), v5);

  -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings](self, "maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings: %@"), v6);

  v7 = -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration embeddingType](self, "embeddingType");
  v8 = CFSTR("title");
  if (v7 == 1)
    v8 = CFSTR("body");
  objc_msgSend(v3, "appendFormat:", CFSTR("; embeddingType: %@"), v8);
  -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration logisticRegressionClassifierConfiguration](self, "logisticRegressionClassifierConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; logisticRegressionClassifierConfiguration: %@"), v9);

  -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration earliestAllowedEmbeddingEventTimestamp](self, "earliestAllowedEmbeddingEventTimestamp");
  objc_msgSend(v3, "appendFormat:", CFSTR("; earliestAllowedEmbeddingEventTimestamp: %f"), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("; haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession: %d"),
    -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession](self, "haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleReadRequirements
{
  return self->_articleReadRequirements;
}

- (void)setArticleReadRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_articleReadRequirements, a3);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleSeenRequirements
{
  return self->_articleSeenRequirements;
}

- (void)setArticleSeenRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_articleSeenRequirements, a3);
}

- (NSNumber)maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings
{
  return self->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
}

- (int64_t)embeddingType
{
  return self->_embeddingType;
}

- (void)setEmbeddingType:(int64_t)a3
{
  self->_embeddingType = a3;
}

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)logisticRegressionClassifierConfiguration
{
  return self->_logisticRegressionClassifierConfiguration;
}

- (void)setLogisticRegressionClassifierConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_logisticRegressionClassifierConfiguration, a3);
}

- (double)earliestAllowedEmbeddingEventTimestamp
{
  return self->_earliestAllowedEmbeddingEventTimestamp;
}

- (void)setEarliestAllowedEmbeddingEventTimestamp:(double)a3
{
  self->_earliestAllowedEmbeddingEventTimestamp = a3;
}

- (BOOL)haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession
{
  return self->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession;
}

- (void)setHaltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession:(BOOL)a3
{
  self->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession = a3;
}

@end
