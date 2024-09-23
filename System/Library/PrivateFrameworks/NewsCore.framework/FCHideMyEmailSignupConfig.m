@implementation FCHideMyEmailSignupConfig

- (FCHideMyEmailSignupConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCHideMyEmailSignupConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *headline;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *subheadline;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *ctaButtonText;
  void *v18;
  FCConfigHyperlinkText *v19;
  void *policyText;
  uint64_t v21;
  FCConfigHyperlinkText *v22;
  void *v23;
  uint64_t v24;
  FCContentColorPair *primaryColor;
  void *v26;
  uint64_t v27;
  FCContentColorPair *secondaryColor;
  void *v29;
  uint64_t v30;
  FCContentColorPair *tertiaryColor;
  void *v32;
  uint64_t v33;
  FCContentColorPair *backgroundColor;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)FCHideMyEmailSignupConfig;
  v5 = -[FCHideMyEmailSignupConfig init](&v36, sel_init);
  if (v5)
  {
    v5->_isEnabled = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("isEnabled"), 0);
    +[FCHideMyEmailSignupConfig defaultConfig](FCHideMyEmailSignupConfig, "defaultConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("headline"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    headline = v5->_headline;
    v5->_headline = (NSString *)v8;

    v5->_headlineLineSpacing = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("headlineLineSpacing"), 1.0);
    +[FCHideMyEmailSignupConfig defaultConfig](FCHideMyEmailSignupConfig, "defaultConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subheadline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("subheadline"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    subheadline = v5->_subheadline;
    v5->_subheadline = (NSString *)v12;

    +[FCHideMyEmailSignupConfig defaultConfig](FCHideMyEmailSignupConfig, "defaultConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ctaButtonText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("ctaButtonText"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ctaButtonText = v5->_ctaButtonText;
    v5->_ctaButtonText = (NSString *)v16;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("policyText"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[FCConfigHyperlinkText initWithConfigDictionary:]([FCConfigHyperlinkText alloc], "initWithConfigDictionary:", v18);
      policyText = v5->_policyText;
      v5->_policyText = v19;
    }
    else
    {
      +[FCHideMyEmailSignupConfig defaultConfig](FCHideMyEmailSignupConfig, "defaultConfig");
      policyText = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(policyText, "policyText");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v5->_policyText;
      v5->_policyText = (FCConfigHyperlinkText *)v21;

    }
    v5->_useChannelFont = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("useChannelFont"), 1);
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("primaryColor"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCContentColorPair colorPairWithDictionary:](FCContentColorPair, "colorPairWithDictionary:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    primaryColor = v5->_primaryColor;
    v5->_primaryColor = (FCContentColorPair *)v24;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("secondaryColor"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCContentColorPair colorPairWithDictionary:](FCContentColorPair, "colorPairWithDictionary:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    secondaryColor = v5->_secondaryColor;
    v5->_secondaryColor = (FCContentColorPair *)v27;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("tertiaryColor"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCContentColorPair colorPairWithDictionary:](FCContentColorPair, "colorPairWithDictionary:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    tertiaryColor = v5->_tertiaryColor;
    v5->_tertiaryColor = (FCContentColorPair *)v30;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("backgroundColor"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCContentColorPair colorPairWithDictionary:](FCContentColorPair, "colorPairWithDictionary:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (FCContentColorPair *)v33;

  }
  return v5;
}

+ (id)defaultConfig
{
  if (qword_1ED0F8280 != -1)
    dispatch_once(&qword_1ED0F8280, &__block_literal_global_70);
  return (id)_MergedGlobals_165;
}

- (NSString)subheadline
{
  return self->_subheadline;
}

- (NSString)headline
{
  return self->_headline;
}

- (NSString)ctaButtonText
{
  return self->_ctaButtonText;
}

void __42__FCHideMyEmailSignupConfig_defaultConfig__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FCHideMyEmailSignupConfig initDefault]([FCHideMyEmailSignupConfig alloc], "initDefault");
  v1 = (void *)_MergedGlobals_165;
  _MergedGlobals_165 = (uint64_t)v0;

}

- (id)initDefault
{
  FCHideMyEmailSignupConfig *v2;
  FCHideMyEmailSignupConfig *v3;
  NSString *headline;
  NSString *subheadline;
  NSString *ctaButtonText;
  FCConfigHyperlinkText *v7;
  uint64_t v8;
  FCConfigHyperlinkText *policyText;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FCHideMyEmailSignupConfig;
  v2 = -[FCHideMyEmailSignupConfig init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isEnabled = 1;
    headline = v2->_headline;
    v2->_headline = (NSString *)CFSTR("Your subscription includes access on the publisher’s website.");

    subheadline = v3->_subheadline;
    v3->_headlineLineSpacing = 1.0;
    v3->_subheadline = (NSString *)CFSTR("The publisher will contact you with additional details. You can share your email address or keep it private.");

    ctaButtonText = v3->_ctaButtonText;
    v3->_ctaButtonText = (NSString *)CFSTR("Continue");

    v7 = [FCConfigHyperlinkText alloc];
    v8 = -[FCConfigHyperlinkText initWithText:links:](v7, "initWithText:links:", CFSTR("The publisher may use the information you choose to share in accordance with their privacy policy."), MEMORY[0x1E0C9AA60]);
    policyText = v3->_policyText;
    v3->_policyText = (FCConfigHyperlinkText *)v8;

    v3->_useChannelFont = 1;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_policyText, 0);
  objc_storeStrong((id *)&self->_ctaButtonText, 0);
  objc_storeStrong((id *)&self->_subheadline, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)headlineLineSpacing
{
  return self->_headlineLineSpacing;
}

- (FCConfigHyperlinkText)policyText
{
  return self->_policyText;
}

- (BOOL)useChannelFont
{
  return self->_useChannelFont;
}

- (FCContentColorPair)primaryColor
{
  return self->_primaryColor;
}

- (FCContentColorPair)secondaryColor
{
  return self->_secondaryColor;
}

- (FCContentColorPair)tertiaryColor
{
  return self->_tertiaryColor;
}

- (FCContentColorPair)backgroundColor
{
  return self->_backgroundColor;
}

@end
