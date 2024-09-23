@implementation SFPageFormatMenuController

void __90___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldPassthroughSuperview") & 1) != 0)
  {
    objc_msgSend(v3, "superview");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPassthroughViews:", v6);

}

double __90___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "detentHeight");
    v7 = v6;
    objc_msgSend(v3, "maximumDetentValue");
    v9 = fmin(v7, v8);
  }
  else
  {
    objc_msgSend(v3, "maximumDetentValue");
    v9 = v10;
  }

  return v9;
}

void __76___SFPageFormatMenuController_presentMenuFromViewController_withSourceInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  if (objc_msgSend(v4, "shouldPassthroughSuperview"))
  {
    objc_msgSend(v5, "superview");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(v3, "insertObject:atIndex:", v5, 0);

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "popoverPresentationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPassthroughViews:", v7);

}

id __46___SFPageFormatMenuController__extensionItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "alertItemForTab:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51___SFPageFormatMenuController__siriReaderAlertItem__block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id *WeakRetained;
  void *v8;
  uint64_t v9;
  id *v10;

  v3 = (void *)MEMORY[0x1E0D4ED50];
  v4 = a2;
  objc_msgSend(v3, "sharedPlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNowPlayingContentIdentifier:", v4);

  v6 = objc_msgSend(a1[4], "siriReaderPlaybackStateForActiveTab");
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "_titleForPlaybackState:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10[4], "setTitle:", v8);

    if (objc_msgSend(a1[4], "canReadActiveLanguage")
      && objc_msgSend(a1[5], "isReaderAvailable"))
    {
      v9 = objc_msgSend(a1[6], "isBlockedByScreenTime") ^ 1;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v10[4], "setEnabled:", v9);
    objc_msgSend(v10[4], "notifyObserversItemDidUpdate");
    WeakRetained = v10;
  }

}

void __65___SFPageFormatMenuController__endListeningToSiriReaderAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  void *v5;
  id *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  v4 = objc_loadWeakRetained(WeakRetained + 16);
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSiriReaderMediaSessionImmediately:", 1);

  objc_msgSend(WeakRetained, "updateShouldShowListeningControls:", 0);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __53___SFPageFormatMenuController__moreControlsAlertItem__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateShouldShowListeningControls:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadAlert");
}

uint64_t __58___SFPageFormatMenuController__listeningControlsAlertItem__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateShouldShowListeningControls:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "reloadAlert");
}

void __47___SFPageFormatMenuController__readerAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "browserContentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleShowingReaderForUserAction");

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

void __72___SFPageFormatMenuController__siriReaderAlertItemWithState_identifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "siriReadThisMenuInvocation");
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __51___SFPageFormatMenuController__mediaStateAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "browserContentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleMediaStateMuted");

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

void __50___SFPageFormatMenuController__downloadsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "browserContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentDownloadsViewController");

}

uint64_t __76___SFPageFormatMenuController__desktopMobileToggleAlertItemWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "requestStandardSite");
  else
    return objc_msgSend(v3, "requestDesktopSite");
}

uint64_t __59___SFPageFormatMenuController__pauseAllAnimationsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_pauseAllAnimationsWithCompletionHandler:", 0);
  return result;
}

uint64_t __58___SFPageFormatMenuController__playAllAnimationsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_playAllAnimationsWithCompletionHandler:", 0);
  return result;
}

void __51___SFPageFormatMenuController__fullScreenAlertItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_anchorInWindowCoordinatesForAlert:", v4);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(WeakRetained, "setKeepBarsMinimized:", 1);

}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  _SFTranslationTargetLocaleAlertController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _SFTranslationTargetLocaleAlertController *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _SFTranslationTargetLocaleAlertController *v15;
  id v16;
  _QWORD v17[5];

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = -[_SFTranslationTargetLocaleAlertController initWithTranslationContext:]([_SFTranslationTargetLocaleAlertController alloc], "initWithTranslationContext:", *(_QWORD *)(a1 + 32));
  v7 = objc_msgSend(v4, "provenance");
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_2;
  v17[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v17[4] = v7;
  -[_SFTranslationTargetLocaleAlertController setAnalyticsHandler:](v6, "setAnalyticsHandler:", v17);
  objc_msgSend(v4, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_3;
  v13[3] = &unk_1E4ABFC38;
  v14 = WeakRetained;
  v15 = v6;
  v16 = v9;
  v10 = v9;
  v11 = v6;
  v12 = WeakRetained;
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v13);

}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a2)
    v3 = 12;
  else
    v3 = 13;
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_didPerformFormatMenuAction:provenance:", v3, *(_QWORD *)(a1 + 32));

}

uint64_t __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "configurePopoverWithSourceInfo:");
  return objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  _SFTranslationTargetLocaleAlertController *v3;
  void *v4;
  void *v5;
  _SFTranslationTargetLocaleAlertController *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _SFTranslationTargetLocaleAlertController *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = -[_SFTranslationTargetLocaleAlertController initWithTranslationContext:]([_SFTranslationTargetLocaleAlertController alloc], "initWithTranslationContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_5;
    v8[3] = &unk_1E4ABFB20;
    v9 = v5;
    v10 = v3;
    v6 = v3;
    v7 = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
}

uint64_t __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "requestTranslatingWebpageToLocale:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

void __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_3;
  v3[3] = &unk_1E4AC08D8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserversItemDidUpdate");
}

uint64_t __56___SFPageFormatMenuController__exitTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadPageInOriginalLanguage");
}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_2;
  v4[3] = &unk_1E4AC50D8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "generateDiagnosticDataForPurpose:completionHandler:", 1, v4);

}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a2, "saveDiagnosticDataAsTemporaryFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_3;
  v5[3] = &unk_1E4ABFB20;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D8A9D0]);
  objc_msgSend(MEMORY[0x1E0D8A9D8], "safariIOS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithComponent:title:descriptionTemplate:", v3, CFSTR("Webpage Translation Issue: "), CFSTR("Translation debug info that includes the URL and all text from the webpage has been attached to this radar. Please describe the issue you're seeing in detail and the steps taken leading up to this issue."));

  objc_msgSend(v4, "setAttachmentPaths:", *(_QWORD *)(a1 + 32));
  v8[0] = CFSTR("1225093");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeywords:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "continueInTapToRadarURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v7, 0, 0);

}

void __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _SFReportTranslationIssueCollectionViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v5 = -[_SFReportTranslationIssueCollectionViewController initWithBrowserContentController:]([_SFReportTranslationIssueCollectionViewController alloc], "initWithBrowserContentController:", WeakRetained);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setModalPresentationStyle:", 1);
  objc_msgSend(v3, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke_2;
    v9[3] = &unk_1E4ABFB20;
    v10 = WeakRetained;
    v11 = v6;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else
  {
    objc_msgSend(WeakRetained, "presentModalViewController:completion:", v6, 0);
  }

}

uint64_t __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentModalViewController:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_stringForKey:", *MEMORY[0x1E0D8B6C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(WeakRetained, "activeDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "translationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "availableTargetLocaleIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "hasStartedTranslating") & 1) == 0
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count")
        && objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(WeakRetained, "activeDocument");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "translationContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_2;
          v14[3] = &unk_1E4AC05E0;
          v14[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v13, "validateTargetLocale:completionHandler:", v11, v14);

        }
      }

    }
  }

}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_3;
  v2[3] = &unk_1E4AC08D8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", v1);

}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_2;
  v6[3] = &unk_1E4AC5128;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(WeakRetained, "collectDiagnosticsForAutoFillWithCompletionHandler:", v6);

}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  _SFAutoFillInternalFeedbackCollectionViewController *v6;
  uint64_t v7;
  id v8;
  _SFAutoFillInternalFeedbackCollectionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 128);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = [_SFAutoFillInternalFeedbackCollectionViewController alloc];
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_3;
  v16[3] = &unk_1E4AC5100;
  v8 = WeakRetained;
  v17 = v8;
  v9 = -[_SFAutoFillInternalFeedbackCollectionViewController initWithDiagnosticsData:reportHandler:](v6, "initWithDiagnosticsData:reportHandler:", v4, v16);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  objc_msgSend(v10, "setModalPresentationStyle:", 1);
  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_4;
    v13[3] = &unk_1E4ABFB20;
    v14 = v8;
    v15 = v10;
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v13);

  }
  else
  {
    objc_msgSend(v8, "presentModalViewController:completion:", v10, 0);
  }

}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activeDocument");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v3, 0, 0);

}

uint64_t __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentModalViewController:completion:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __49___SFPageFormatMenuController__pageZoomAlertItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFocusedItem:");
}

uint64_t __55___SFPageFormatMenuController__readerTextSizeAlertItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFocusedItem:");
}

void __52___SFPageFormatMenuController__readerThemeAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setReaderTheme:forAppearance:", objc_msgSend(a2, "selectedTheme"), objc_msgSend(*(id *)(a1 + 32), "currentAppearance"));
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_didPerformFormatMenuAction:provenance:", 8, *(_QWORD *)(a1 + 40));

}

void __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  char v29;

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0DC3450]);
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    v10 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithString:", v12);

    v14 = *MEMORY[0x1E0DC32A0];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v13, "length"));

    objc_msgSend(v8, "_setAttributedTitle:", v13);
    v16 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMessage:", v18);

    objc_msgSend(v8, "setPreferredStyle:", 1);
    v19 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke_2;
    v27[3] = &unk_1E4AC51B8;
    v28 = *(id *)(a1 + 32);
    v29 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v21);

    v22 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v24);

    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "viewControllerToPresentFrom");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    v26 = a2;
    objc_msgSend(v26, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "reloadEnablingDowngradedPrivateRelay:", *(unsigned __int8 *)(a1 + 48));
  }
}

uint64_t __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadEnablingDowngradedPrivateRelay:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __62___SFPageFormatMenuController__contentBlockersToggleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadDisablingContentBlockers:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __82___SFPageFormatMenuController__advancedPrivateBrowsingPrivacyProtectionsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:", *(unsigned __int8 *)(a1 + 40));
}

void __56___SFPageFormatMenuController__websiteSettingsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(WeakRetained, "activeDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "perSiteSettingsUIPresentSettings");

}

void __49___SFPageFormatMenuController__scribbleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "sfScribbleController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startScribbling");

}

void __51___SFPageFormatMenuController__clearEditsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "sfScribbleController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearEdits");

}

void __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id WeakRetained;
  _SFReportScribbleIssueCollectionViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldLaunchFeedbackAppForScribble")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E0D8B5A0], 0),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "sfScribbleController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openFeedbackAppForScribbleReportForWebView:", v12);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    v7 = -[_SFReportScribbleIssueCollectionViewController initWithBrowserContentController:]([_SFReportScribbleIssueCollectionViewController alloc], "initWithBrowserContentController:", WeakRetained);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    objc_msgSend(v8, "setModalPresentationStyle:", 1);
    objc_msgSend(v3, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke_2;
      v13[3] = &unk_1E4ABFB20;
      v14 = WeakRetained;
      v15 = v8;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v13);

    }
    else
    {
      objc_msgSend(WeakRetained, "presentModalViewController:completion:", v8, 0);
    }

  }
}

uint64_t __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentModalViewController:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 128);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)MEMORY[0x1E0D4ECC8];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createManageExtensionsNavigationControllerFromPageFormatMenu:activeDocument:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setModalPresentationStyle:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke_2;
  v12[3] = &unk_1E4ABFB20;
  v13 = WeakRetained;
  v14 = v9;
  v10 = v9;
  v11 = WeakRetained;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v12);

}

uint64_t __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentModalViewController:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __43___SFPageFormatMenuController__entityItems__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    if (objc_msgSend(v7, "_sf_canOpenInBrowser"))
    {
      v6 = objc_loadWeakRetained(v4 + 16);
      objc_msgSend(v6, "handleSearchResult:", v7);

    }
  }

}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "addToFavorites");
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "togglePinningCurrentTab");
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "addToBookmarks:", 0);
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "addToReadingList:", 0);
}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_6;
  v3[3] = &unk_1E4ABFE00;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addToQuickNote");
}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_9(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_10;
  v3[3] = &unk_1E4ABFE00;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPrintControllerForCurrentTab");
}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v5, "browserContentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isShowingReader"))
    {
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "didToggleReaderSBA");

      objc_msgSend(v3, "toggleShowingReaderForUserAction");
    }

    WeakRetained = v5;
  }

}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    v3 = objc_loadWeakRetained(v4 + 16);
    objc_msgSend(v3, "siriReadThisMenuInvocation");

    WeakRetained = v4;
  }

}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNowPlayingContentIdentifier:", v5);

    objc_msgSend(WeakRetained, "_enableListenToPageButtonForCard:", WeakRetained[11]);
  }

}

void __42___SFPageFormatMenuController__readerCard__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v9, "browserContentController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isShowingReader") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didToggleReaderSBA");

      if (*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "didClickSummaryCardSBA");

        objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "webpageIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "donateBrowsingAssistantUserInteractionDetectedWithWebPageID:componentType:componentIdentifier:summaryText:tableOfContentsArrayLength:", v8, 2, &unk_1E4B25D50, *(_QWORD *)(a1 + 32), 0);

      }
      objc_msgSend(v4, "toggleShowingReaderForUserAction");
    }

    WeakRetained = v9;
  }

}

void __42___SFPageFormatMenuController__readerCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "siriReadThisMenuInvocation");
    WeakRetained = v4;
  }

}

void __42___SFPageFormatMenuController__readerCard__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNowPlayingContentIdentifier:", v5);

    objc_msgSend(WeakRetained, "_enableListenToPageButtonForCard:", WeakRetained[10]);
  }

}

void __42___SFPageFormatMenuController__readerCard__block_invoke_4(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  char v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedReaderArticleTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCachedReaderArticleTitle:", v7);
      if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        v6 = WeakRetained[10];
        objc_msgSend(v6, "setTitle:", v7);
        objc_msgSend(v6, "notifyObserverCardDidUpdate");

      }
    }
  }

}

void __43___SFPageFormatMenuController__consentCard__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D8A7F8], "setUserConsentState:", 2);
    objc_msgSend(WeakRetained, "_clearCachedCardItems");
    objc_msgSend(WeakRetained, "reloadBrowsingAssistantIfNeeded");
  }

}

void __43___SFPageFormatMenuController__consentCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D8A7F8], "setUserConsentState:", 1);
    objc_msgSend(WeakRetained, "_clearCachedCardItems");
    objc_msgSend(WeakRetained, "reloadBrowsingAssistantIfNeeded");
  }

}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setHintText:", v7);
    if (objc_msgSend(v6, "isFocusedInPageMenu"))
    {
      if (a3)
      {
        objc_msgSend(v6, "blink");
        objc_msgSend(v6, "pulse");
      }
    }
  }

}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didClickZoomOutSBA");

    objc_msgSend(a1[4], "decrementValue:", WeakRetained);
    v3 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v3, "_didTapButtonInStepper:", WeakRetained);

  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didClickZoomInSBA");

    objc_msgSend(a1[4], "incrementValue:", WeakRetained);
    v3 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v3, "_didTapButtonInStepper:", WeakRetained);

  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didClickFindInPageSBA");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_5;
  v5[3] = &unk_1E4ABFE00;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

uint64_t __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showFindOnPage");
}

uint64_t __54___SFPageFormatMenuController__didTapButtonInStepper___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "takeOwnershipOfStepperContainer:", *(_QWORD *)(a1 + 48));
  return result;
}

@end
