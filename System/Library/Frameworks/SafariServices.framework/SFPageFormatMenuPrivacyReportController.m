@implementation SFPageFormatMenuPrivacyReportController

uint64_t __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;

  v2 = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_presentPrivacyReport");
  else
    return objc_msgSend(v3, "_presentPromptToTurnOnTrackingProtection");
}

void __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_3;
  v2[3] = &unk_1E4ABFB20;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preventedKnownTrackingThirdParties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "blockedKnownTrackingThirdParties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!(v3 | v5))
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v10);
    goto LABEL_7;
  }
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v8);

  }
  if (v3)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v11);

LABEL_7:
  }
  objc_msgSend(*(id *)(a1 + 32), "queryParameterFilteringDataQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfFilteredQueryParameters");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v17);

  }
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubtitle:", v18);

  objc_msgSend(*(id *)(a1 + 40), "notifyObserversItemDidUpdate");
}

uint64_t __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __65___SFPageFormatMenuPrivacyReportController__presentPrivacyReport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

@end
