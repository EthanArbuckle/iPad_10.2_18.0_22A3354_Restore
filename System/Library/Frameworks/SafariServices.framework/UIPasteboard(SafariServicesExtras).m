@implementation UIPasteboard(SafariServicesExtras)

- (void)safari_bestStringForPastingIntoURLFieldCompletionHandler:()SafariServicesExtras
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC51C8], *MEMORY[0x1E0DC51C0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__UIPasteboard_SafariServicesExtras__safari_bestStringForPastingIntoURLFieldCompletionHandler___block_invoke;
  v7[3] = &unk_1E4AC1D48;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "detectValuesForPatterns:completionHandler:", v5, v7);

}

- (uint64_t)safari_bestInputTypeForPastingIntoURLField
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *MEMORY[0x1E0DC4948];
  v3 = *MEMORY[0x1E0DC4950];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC4948], *MEMORY[0x1E0DC4950], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detectedPasteboardTypesForTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "containsObject:", v2))
  {
    v6 = 3;
  }
  else
  {
    v6 = 4;
  }

  return v6;
}

- (id)safari_pasteAndNavigateButtonTitle
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField");
  if ((unint64_t)(v1 - 1) >= 2 && v1 && v1 != 3)
  {
    v2 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)safari_pasteAndNavigateCommand
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.clipboard"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField");
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = (void *)MEMORY[0x1E0DC3678];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sel_pasteAndGo_;
  }
  else
  {
    if (v3 && v3 != 3)
    {
      v7 = 0;
      goto LABEL_8;
    }
    v4 = (void *)MEMORY[0x1E0DC3678];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sel_pasteAndSearch_;
  }
  objc_msgSend(v4, "commandWithTitle:image:action:propertyList:", v5, v2, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (BOOL)safari_canPasteAndNavigate
{
  return objc_msgSend(a1, "safari_bestInputTypeForPastingIntoURLField") != 4;
}

- (void)safari_setSensitiveString:()SafariServicesExtras
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = *MEMORY[0x1E0DC51D8];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  v9 = *MEMORY[0x1E0DC51D0];
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setItems:options:", v7, v8);

  if (v5)
  {

  }
}

@end
