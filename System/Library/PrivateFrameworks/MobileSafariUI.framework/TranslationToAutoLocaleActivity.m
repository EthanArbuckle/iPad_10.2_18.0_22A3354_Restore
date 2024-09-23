@implementation TranslationToAutoLocaleActivity

- (id)activityTitleWithTranslationContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "availableTargetLocaleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_displayNameForLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)actionType
{
  return 12;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "availableTargetLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "requestTranslatingWebpageToLocale:completionHandler:", v6, 0);
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);

}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasStartedTranslating") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "availableTargetLocaleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 1;

  }
  return v4;
}

@end
