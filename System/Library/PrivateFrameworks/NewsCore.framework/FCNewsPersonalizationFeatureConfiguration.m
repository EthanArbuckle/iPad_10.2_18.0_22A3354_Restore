@implementation FCNewsPersonalizationFeatureConfiguration

- (FCNewsPersonalizationFeatureConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationFeatureConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsPersonalizationFeatureConfiguration;
  v5 = -[FCNewsPersonalizationFeatureConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_articleLengthMediumThreshold = FCAppConfigurationPositiveIntegerValue(v4, (uint64_t)CFSTR("articleLengthMediumThreshold"), +[FCNewsPersonalizationFeatureConfiguration defaultArticleLengthMediumThreshold](FCNewsPersonalizationFeatureConfiguration, "defaultArticleLengthMediumThreshold"));
    v5->_articleLengthLongThreshold = FCAppConfigurationPositiveIntegerValue(v4, (uint64_t)CFSTR("articleLengthLongThreshold"), +[FCNewsPersonalizationFeatureConfiguration defaultArticleLengthLongThreshold](FCNewsPersonalizationFeatureConfiguration, "defaultArticleLengthLongThreshold"));
    v5->_publisherTopicPairPublisherEventCountThreshold = FCAppConfigurationPositiveIntegerValue(v4, (uint64_t)CFSTR("publisherTopicPairPublisherEventCountThreshold"), +[FCNewsPersonalizationFeatureConfiguration defaultPublisherTopicPairPublisherEventCountThreshold](FCNewsPersonalizationFeatureConfiguration, "defaultPublisherTopicPairPublisherEventCountThreshold"));
    v5->_publisherTopicPairTopicEventCountThreshold = FCAppConfigurationPositiveIntegerValue(v4, (uint64_t)CFSTR("publisherTopicPairTopicEventCountThreshold"), +[FCNewsPersonalizationFeatureConfiguration defaultPublisherTopicPairTopicEventCountThreshold](FCNewsPersonalizationFeatureConfiguration, "defaultPublisherTopicPairTopicEventCountThreshold"));
  }

  return v5;
}

+ (int64_t)defaultPublisherTopicPairTopicEventCountThreshold
{
  return 5;
}

+ (int64_t)defaultPublisherTopicPairPublisherEventCountThreshold
{
  return 5;
}

+ (int64_t)defaultArticleLengthMediumThreshold
{
  return 300;
}

+ (int64_t)defaultArticleLengthLongThreshold
{
  return 1000;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleLengthMediumThreshold: %lu"),
    -[FCNewsPersonalizationFeatureConfiguration articleLengthMediumThreshold](self, "articleLengthMediumThreshold"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleLengthLongThreshold: %lu"),
    -[FCNewsPersonalizationFeatureConfiguration articleLengthLongThreshold](self, "articleLengthLongThreshold"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; publisherTopicPairPublisherEventCountThreshold: %lu"),
    -[FCNewsPersonalizationFeatureConfiguration publisherTopicPairPublisherEventCountThreshold](self, "publisherTopicPairPublisherEventCountThreshold"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; publisherTopicPairTopicEventCountThreshold: %lu"),
    -[FCNewsPersonalizationFeatureConfiguration publisherTopicPairTopicEventCountThreshold](self, "publisherTopicPairTopicEventCountThreshold"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)articleLengthMediumThreshold
{
  return self->_articleLengthMediumThreshold;
}

- (void)setArticleLengthMediumThreshold:(int64_t)a3
{
  self->_articleLengthMediumThreshold = a3;
}

- (int64_t)articleLengthLongThreshold
{
  return self->_articleLengthLongThreshold;
}

- (void)setArticleLengthLongThreshold:(int64_t)a3
{
  self->_articleLengthLongThreshold = a3;
}

- (int64_t)publisherTopicPairPublisherEventCountThreshold
{
  return self->_publisherTopicPairPublisherEventCountThreshold;
}

- (void)setPublisherTopicPairPublisherEventCountThreshold:(int64_t)a3
{
  self->_publisherTopicPairPublisherEventCountThreshold = a3;
}

- (int64_t)publisherTopicPairTopicEventCountThreshold
{
  return self->_publisherTopicPairTopicEventCountThreshold;
}

- (void)setPublisherTopicPairTopicEventCountThreshold:(int64_t)a3
{
  self->_publisherTopicPairTopicEventCountThreshold = a3;
}

@end
