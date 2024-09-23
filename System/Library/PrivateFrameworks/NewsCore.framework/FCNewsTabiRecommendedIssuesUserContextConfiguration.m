@implementation FCNewsTabiRecommendedIssuesUserContextConfiguration

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiRecommendedIssuesUserContextConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCNewsTabiRecommendedIssuesUserContextConfiguration;
  v5 = -[FCNewsTabiRecommendedIssuesUserContextConfiguration init](&v9, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumTagCount"), &unk_1E470B4C8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumTagCount = objc_msgSend(v6, "integerValue");

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumTopicTagsPerHeadline"), &unk_1E470B4E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumTopicTagsPerHeadline = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)init
{
  return -[FCNewsTabiRecommendedIssuesUserContextConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)initWithMaximumTagCount:(int64_t)a3 maximumTopicTagsPerHeadline:(int64_t)a4
{
  FCNewsTabiRecommendedIssuesUserContextConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCNewsTabiRecommendedIssuesUserContextConfiguration;
  result = -[FCNewsTabiRecommendedIssuesUserContextConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_maximumTagCount = a3;
    result->_maximumTopicTagsPerHeadline = a4;
  }
  return result;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaximumTagCount: %lu;"),
    -[FCNewsTabiRecommendedIssuesUserContextConfiguration maximumTagCount](self, "maximumTagCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaximumTopicTagsPerHeadline: %lu;"),
    -[FCNewsTabiRecommendedIssuesUserContextConfiguration maximumTopicTagsPerHeadline](self, "maximumTopicTagsPerHeadline"));
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (int64_t)maximumTagCount
{
  return self->_maximumTagCount;
}

- (void)setMaximumTagCount:(int64_t)a3
{
  self->_maximumTagCount = a3;
}

- (int64_t)maximumTopicTagsPerHeadline
{
  return self->_maximumTopicTagsPerHeadline;
}

- (void)setMaximumTopicTagsPerHeadline:(int64_t)a3
{
  self->_maximumTopicTagsPerHeadline = a3;
}

@end
