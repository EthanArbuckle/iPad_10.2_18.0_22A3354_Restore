@implementation TranslationRadarActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("ant");
}

- (int64_t)actionType
{
  return 16;
}

- (BOOL)canPerformWithTranslationContext:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (showInternalTranslationActions())
    v4 = objc_msgSend(v3, "hasStartedTranslating");
  else
    v4 = 0;

  return v4;
}

- (void)performActivityWithTranslationContext:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke;
  v4[3] = &unk_1E9CF3180;
  v4[4] = self;
  objc_msgSend(a3, "generateDiagnosticDataForPurpose:completionHandler:", 1, v4);
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

void __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(a2, "saveDiagnosticDataAsTemporaryFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke_2;
  v6[3] = &unk_1E9CF1830;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__TranslationRadarActivity_performActivityWithTranslationContext___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D8A9D0]);
  objc_msgSend(MEMORY[0x1E0D8A9D8], "safariIOS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithComponent:title:descriptionTemplate:", v3, CFSTR("Webpage Translation Issue: "), CFSTR("Translation debug info that includes the URL and all text from the webpage has been attached to this radar. Please describe the issue you're seeing in detail and the steps taken leading up to this issue."));

  objc_msgSend(v4, "setAttachmentPaths:", *(_QWORD *)(a1 + 32));
  v11[0] = CFSTR("1225093");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeywords:", v5);

  objc_msgSend(*(id *)(a1 + 40), "tabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continueInTapToRadarURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:options:completionHandler:", v10, 0, 0);

}

@end
