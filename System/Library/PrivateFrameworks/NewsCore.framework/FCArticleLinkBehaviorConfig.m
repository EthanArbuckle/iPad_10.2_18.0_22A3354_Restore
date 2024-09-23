@implementation FCArticleLinkBehaviorConfig

- (FCArticleLinkBehaviorConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCArticleLinkBehaviorConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *animationTitleLine1;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *animationTitleLine2;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *animationBody;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCArticleLinkBehaviorConfig;
  v5 = -[FCArticleLinkBehaviorConfig init](&v19, sel_init);
  if (v5)
  {
    v5->_openArticlesAsModals = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("openArticlesAsModals"), 0);
    v5->_lohAnimationEnabled = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("lohAnimationEnabled"), 0);
    v5->_lohAnimationCompletesInArticle = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("lohAnimationCompletesInArticle"), 0);
    FCBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Welcome to"), &stru_1E464BC40, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("animationTitleLine1"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    animationTitleLine1 = v5->_animationTitleLine1;
    v5->_animationTitleLine1 = (NSString *)v8;

    FCBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Apple News"), &stru_1E464BC40, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("animationTitleLine2"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    animationTitleLine2 = v5->_animationTitleLine2;
    v5->_animationTitleLine2 = (NSString *)v12;

    FCBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("All your news, all in one app."), &stru_1E464BC40, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("animationBody"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    animationBody = v5->_animationBody;
    v5->_animationBody = (NSString *)v16;

    v5->_animationMaxCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("animationMaxCount"), 3);
    v5->_animationQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("animationQuiescenceInterval"), 172800);
    v5->_animationCampaignVersion = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("animationCampaignVersion"), 0);
  }

  return v5;
}

- (BOOL)openArticlesAsModals
{
  return self->_openArticlesAsModals;
}

- (BOOL)lohAnimationEnabled
{
  return self->_lohAnimationEnabled;
}

- (BOOL)lohAnimationCompletesInArticle
{
  return self->_lohAnimationCompletesInArticle;
}

- (NSString)animationTitleLine1
{
  return self->_animationTitleLine1;
}

- (NSString)animationTitleLine2
{
  return self->_animationTitleLine2;
}

- (NSString)animationBody
{
  return self->_animationBody;
}

- (int64_t)animationQuiescenceInterval
{
  return self->_animationQuiescenceInterval;
}

- (int)animationMaxCount
{
  return self->_animationMaxCount;
}

- (int)animationCampaignVersion
{
  return self->_animationCampaignVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationBody, 0);
  objc_storeStrong((id *)&self->_animationTitleLine2, 0);
  objc_storeStrong((id *)&self->_animationTitleLine1, 0);
}

@end
