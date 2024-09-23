@implementation FCTopStoriesStyleConfiguration

- (FCTopStoriesStyleConfiguration)initWithConfigDictionary:(id)a3
{
  id v5;
  FCTopStoriesStyleConfiguration *v6;
  FCTopStoriesStyleConfiguration *v7;
  uint64_t v8;
  NSString *stringType;
  uint64_t v10;
  NSString *label;
  void *v12;
  uint64_t v13;
  FCColor *foreground_color;
  void *v15;
  uint64_t v16;
  FCColor *dark_style_foreground_color;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCTopStoriesStyleConfiguration;
  v6 = -[FCTopStoriesStyleConfiguration init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("type"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    stringType = v7->_stringType;
    v7->_stringType = (NSString *)v8;

    v7->_storyType = FCArticleStoryTypeForStoryTypeString(v7->_stringType);
    FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("label"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    label = v7->_label;
    v7->_label = (NSString *)v10;

    FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("foregroundColor"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    foreground_color = v7->_foreground_color;
    v7->_foreground_color = (FCColor *)v13;

    FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("alternateForegroundColor"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    dark_style_foreground_color = v7->_dark_style_foreground_color;
    v7->_dark_style_foreground_color = (FCColor *)v16;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringType, 0);
  objc_storeStrong((id *)&self->_dark_style_foreground_color, 0);
  objc_storeStrong((id *)&self->_foreground_color, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_configDict, v6[1]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_configDict, "hash");
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (NSString)label
{
  return self->_label;
}

- (FCColor)foreground_color
{
  return self->_foreground_color;
}

- (FCColor)dark_style_foreground_color
{
  return self->_dark_style_foreground_color;
}

- (NSString)stringType
{
  return self->_stringType;
}

@end
