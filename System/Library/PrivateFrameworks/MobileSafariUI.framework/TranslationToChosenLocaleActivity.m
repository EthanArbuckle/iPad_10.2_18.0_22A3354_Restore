@implementation TranslationToChosenLocaleActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (int64_t)actionType
{
  return 11;
}

- (void)prepareWithTranslationContext:(id)a3
{
  void *v4;
  void *v5;
  UIViewController *v6;
  void *v7;
  uint64_t v8;
  UIViewController *activityViewController;
  _QWORD v10[5];

  if (!self->_activityViewController)
  {
    v4 = (void *)MEMORY[0x1E0CD57D8];
    objc_msgSend(a3, "allowedTargetLocaleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationAlertControllerWithDelegate:localeIdentifiers:", self, v5);
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    -[_SFActivity delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v7, "provenanceForSafariActivity:", self);
    else
      v8 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__TranslationToChosenLocaleActivity_prepareWithTranslationContext___block_invoke;
    v10[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
    v10[4] = v8;
    -[UIViewController setAnalyticsHandler:](v6, "setAnalyticsHandler:", v10);
    activityViewController = self->_activityViewController;
    self->_activityViewController = v6;

  }
}

void __67__TranslationToChosenLocaleActivity_prepareWithTranslationContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a2)
    v3 = 12;
  else
    v3 = 13;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_didPerformFormatMenuAction:provenance:", v3, *(_QWORD *)(a1 + 32));

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
    v4 = (unint64_t)objc_msgSend(v5, "count") > 1;

  }
  return v4;
}

- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4
{
  id v6;
  void *v7;

  if (a4)
  {
    v6 = a4;
    -[TranslationActivity translationContext](self, "translationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestTranslatingWebpageToLocale:completionHandler:", v6, 0);

  }
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", a4 != 0);
}

- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[TranslationActivity translationContext](self, "translationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "validateTargetLocale:completionHandler:", v8, v7);

}

- (BOOL)translationAlertControllerShouldDismissAfterSelection:(id)a3
{
  return 0;
}

- (id)activityViewController
{
  return self->_activityViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityViewController, 0);
}

@end
