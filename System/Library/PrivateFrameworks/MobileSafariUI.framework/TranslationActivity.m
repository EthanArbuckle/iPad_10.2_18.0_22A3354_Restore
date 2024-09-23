@implementation TranslationActivity

+ (id)allTranslationActivities
{
  ExitTranslationActivity *v2;
  TranslationToAutoLocaleActivity *v3;
  TranslationToChosenLocaleActivity *v4;
  TranslationFeedbackActivity *v5;
  TranslationRadarActivity *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(ExitTranslationActivity);
  v9[0] = v2;
  v3 = objc_alloc_init(TranslationToAutoLocaleActivity);
  v9[1] = v3;
  v4 = objc_alloc_init(TranslationToChosenLocaleActivity);
  v9[2] = v4;
  v5 = objc_alloc_init(TranslationFeedbackActivity);
  v9[3] = v5;
  v6 = objc_alloc_init(TranslationRadarActivity);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityTitleWithTabDocument:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "translationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TranslationActivity activityTitleWithTranslationContext:](self, "activityTitleWithTranslationContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityTitleWithTranslationContext:(id)a3
{
  return &stru_1E9CFDBB0;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "translationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[TranslationActivity canPerformWithTranslationContext:](self, "canPerformWithTranslationContext:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  return 1;
}

- (void)prepareWithTabDocument:(id)a3
{
  id v4;

  objc_msgSend(a3, "translationContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TranslationActivity prepareWithTranslationContext:](self, "prepareWithTranslationContext:", v4);

}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;

  objc_msgSend(a3, "translationContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TranslationActivity performActivityWithTranslationContext:](self, "performActivityWithTranslationContext:", v4);

}

- (id)_systemImageName
{
  return CFSTR("translate");
}

- (id)activityType
{
  return CFSTR("SafariActivityTypeTranslation");
}

- (WBSTranslationContext)translationContext
{
  void *v2;
  void *v3;

  -[TabDocumentActivity tabDocument](self, "tabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "translationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSTranslationContext *)v3;
}

@end
