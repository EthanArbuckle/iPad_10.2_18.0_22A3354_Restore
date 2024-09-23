@implementation FCPostPurchaseOnboardingConfiguration

- (FCPostPurchaseOnboardingConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPostPurchaseOnboardingConfiguration init]";
    v9 = 2080;
    v10 = "FCPostPurchaseOnboardingConfiguration.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPostPurchaseOnboardingConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPostPurchaseOnboardingConfiguration)initWithConfigDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  FCPostPurchaseOnboardingConfiguration *v11;

  v4 = a3;
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("data"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("type"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = FCPostPurchaseOnboardingStepWithValue(v6);
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("articleID"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("ctaText"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v5, (uint64_t)CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCPostPurchaseOnboardingConfiguration initWithPostPurchaseOnboardingStep:landingPageArticleID:callToActionText:deepLinkURL:](self, "initWithPostPurchaseOnboardingStep:landingPageArticleID:callToActionText:deepLinkURL:", v7, v8, v9, v10);

  return v11;
}

- (FCPostPurchaseOnboardingConfiguration)initWithPostPurchaseOnboardingStep:(unint64_t)a3 landingPageArticleID:(id)a4 callToActionText:(id)a5 deepLinkURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  FCPostPurchaseOnboardingConfiguration *v13;
  FCPostPurchaseOnboardingConfiguration *v14;
  uint64_t v15;
  NSString *landingPageArticleID;
  uint64_t v17;
  NSString *callToActionText;
  uint64_t v19;
  NSURL *deepLinkURL;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCPostPurchaseOnboardingConfiguration;
  v13 = -[FCPostPurchaseOnboardingConfiguration init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_postPurchaseOnboardingStep = a3;
    v15 = objc_msgSend(v10, "copy");
    landingPageArticleID = v14->_landingPageArticleID;
    v14->_landingPageArticleID = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    callToActionText = v14->_callToActionText;
    v14->_callToActionText = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    deepLinkURL = v14->_deepLinkURL;
    v14->_deepLinkURL = (NSURL *)v19;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

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

  if (v6
    && (v7 = -[FCPostPurchaseOnboardingConfiguration postPurchaseOnboardingStep](self, "postPurchaseOnboardingStep"),
        v7 == objc_msgSend(v6, "postPurchaseOnboardingStep")))
  {
    v8 = (void *)MEMORY[0x1E0DE7910];
    -[FCPostPurchaseOnboardingConfiguration landingPageArticleID](self, "landingPageArticleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "landingPageArticleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10))
    {
      v11 = (void *)MEMORY[0x1E0DE7910];
      -[FCPostPurchaseOnboardingConfiguration callToActionText](self, "callToActionText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "callToActionText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "nf_object:isEqualToObject:", v12, v13))
      {
        v14 = (void *)MEMORY[0x1E0DE7910];
        -[FCPostPurchaseOnboardingConfiguration deepLinkURL](self, "deepLinkURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deepLinkURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "nf_object:isEqualToObject:", v15, v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCPostPurchaseOnboardingConfiguration postPurchaseOnboardingStep](self, "postPurchaseOnboardingStep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCPostPurchaseOnboardingConfiguration landingPageArticleID](self, "landingPageArticleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[FCPostPurchaseOnboardingConfiguration callToActionText](self, "callToActionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[FCPostPurchaseOnboardingConfiguration deepLinkURL](self, "deepLinkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v4;

  return v10;
}

- (unint64_t)postPurchaseOnboardingStep
{
  return self->_postPurchaseOnboardingStep;
}

- (void)setPostPurchaseOnboardingStep:(unint64_t)a3
{
  self->_postPurchaseOnboardingStep = a3;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
}

@end
