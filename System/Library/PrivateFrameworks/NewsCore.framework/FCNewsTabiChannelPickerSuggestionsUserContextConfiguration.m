@implementation FCNewsTabiChannelPickerSuggestionsUserContextConfiguration

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCNewsTabiChannelPickerSuggestionsUserContextConfiguration;
  v5 = -[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration init](&v9, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumTagCount"), &unk_1E470AB68);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumTagCount = objc_msgSend(v6, "integerValue");

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumTopicTagsPerHeadline"), &unk_1E470AB80);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumTopicTagsPerHeadline = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)init
{
  return -[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaximumTagCount: %ld;"),
    -[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration maximumTagCount](self, "maximumTagCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaximumTopicTagsPerHeadline: %ld;"),
    -[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration maximumTopicTagsPerHeadline](self, "maximumTopicTagsPerHeadline"));
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
