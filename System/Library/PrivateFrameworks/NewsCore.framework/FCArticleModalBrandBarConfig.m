@implementation FCArticleModalBrandBarConfig

- (FCArticleModalBrandBarConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCArticleModalBrandBarConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *messageTitle;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *messageBody;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *ctaTitle;
  uint64_t v18;
  NSString *ctaUrl;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FCArticleModalBrandBarConfig;
  v5 = -[FCArticleModalBrandBarConfig init](&v21, sel_init);
  if (v5)
  {
    v5->_enabled = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("enabled"), 0);
    v5->_maxCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxCount"), 3);
    v5->_quiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("quiescenceInterval"), 172800);
    FCBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Apple News"), &stru_1E464BC40, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("messageTitle"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    messageTitle = v5->_messageTitle;
    v5->_messageTitle = (NSString *)v8;

    FCBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("The best stories from the sources you love, all in one place."), &stru_1E464BC40, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("messageBody"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v12;

    FCBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MORE"), &stru_1E464BC40, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("ctaTitle"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ctaTitle = v5->_ctaTitle;
    v5->_ctaTitle = (NSString *)v16;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("ctaUrl"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    ctaUrl = v5->_ctaUrl;
    v5->_ctaUrl = (NSString *)v18;

    v5->_campaignVersion = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("campaignVersion"), 0);
  }

  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)quiescenceInterval
{
  return self->_quiescenceInterval;
}

- (int)maxCount
{
  return self->_maxCount;
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (NSString)ctaTitle
{
  return self->_ctaTitle;
}

- (NSString)ctaUrl
{
  return self->_ctaUrl;
}

- (int)campaignVersion
{
  return self->_campaignVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctaUrl, 0);
  objc_storeStrong((id *)&self->_ctaTitle, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
}

@end
