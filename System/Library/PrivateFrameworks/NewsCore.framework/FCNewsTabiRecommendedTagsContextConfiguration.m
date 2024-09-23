@implementation FCNewsTabiRecommendedTagsContextConfiguration

- (FCNewsTabiRecommendedTagsContextConfiguration)init
{
  return -[FCNewsTabiRecommendedTagsContextConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiRecommendedTagsContextConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiRecommendedTagsContextConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCNewsTabiRecommendedTagsContextConfiguration;
  v5 = -[FCNewsTabiRecommendedTagsContextConfiguration init](&v8, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumTagCount"), &unk_1E470A370);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumTagCount = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaximumTagCount: %ld;"),
    -[FCNewsTabiRecommendedTagsContextConfiguration maximumTagCount](self, "maximumTagCount"));
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

@end
