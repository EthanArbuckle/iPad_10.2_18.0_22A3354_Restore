@implementation SFDialog(SafariServicesExtras)

+ (id)redirectDialogWithNavigationResult:()SafariServicesExtras promptPolicy:completionHandler:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safari_isAppleOneURL");

  if (v9)
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D4EC60];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __100__SFDialog_SafariServicesExtras__redirectDialogWithNavigationResult_promptPolicy_completionHandler___block_invoke;
    v22[3] = &unk_1E4AC0690;
    v23 = v7;
    objc_msgSend(v11, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, v10, v12, v13, 0, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "appLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(MEMORY[0x1E0D4EC60], "_appLinkRedirectDialogWithMessage:completionHandler:", v19, v7);
    else
      objc_msgSend(MEMORY[0x1E0D4EC60], "redirectDialogWithMessage:completionHandler:", v19, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)downloadBlockedDialogWithFileType:()SafariServicesExtras initiatingURL:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch((unint64_t)a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      _WBSLocalizedString();
      a3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  objc_msgSend(a1, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, a3, v10, v11, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setCanceledOnProvisionalNavigation:", 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D8ACF0], "sameOriginNavigationExemption:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdditionalCancellationExemptions:", v14);

  }
  return v12;
}

+ (id)allowDownloadDialogWithDownload:()SafariServicesExtras initiatingURL:allowViewAction:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filename");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x1E0D4EFD0];
  if (a5)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke;
    v28[3] = &unk_1E4AC16D0;
    v20 = &v29;
    v29 = v11;
    objc_msgSend(a1, "_dialogWithTitle:message:acceptAction:secondaryAction:cancelAction:applicationModal:completionHandler:", 0, v18, v13, v14, v19, 0, v28);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __114__SFDialog_SafariServicesExtras__allowDownloadDialogWithDownload_initiatingURL_allowViewAction_completionHandler___block_invoke_2;
    v26[3] = &unk_1E4AC0690;
    v20 = &v27;
    v27 = v11;
    objc_msgSend(a1, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, v18, v13, v19, 0, v26);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

  objc_msgSend(v22, "setCanceledOnProvisionalNavigation:", 0);
  objc_msgSend(v22, "setCanceledOnApplicationBackground:", 1);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D8ACF0], "sameOriginNavigationExemption:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAdditionalCancellationExemptions:", v24);

  }
  return v22;
}

@end
