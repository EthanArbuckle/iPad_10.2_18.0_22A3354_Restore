@implementation SFLinkPreviewHelper

void __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 + 1) >= 4)
  {
    if (a2 == 3)
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *MEMORY[0x1E0DAB538];
      v6[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v3, 0, 0);

    }
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke_2;
    v4[3] = &unk_1E4AC1080;
    v4[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
}

void __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "linkPreviewHelper:commitPreviewViewControllerForAction:withTabOrder:", *(_QWORD *)(a1 + 32), 2, 0);

}

uint64_t __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewViewController");
}

id __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "menuWithSuggestedActions:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_3;
  v5[3] = &unk_1E4AC2EB0;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "disableWithCompletionHandler:", v5);

}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "linkPreviewHelperWillOpenUniversalLinkLocally:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 40);
    if (!v3)
      v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "openURL:forAction:withTabOrder:", v3, 2, 0);

  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Unable to disable App Link, won't navigate to URL from long press on link", buf, 2u);
    }
  }
}

uint64_t __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_62(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "disable");
  return 1;
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2_73(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *MEMORY[0x1E0DAB538];
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", v2, 0, 0);

}

uint64_t __50___SFLinkPreviewHelper_openActionForAlternateURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openURL:forAction:withTabOrder:", *(_QWORD *)(a1 + 40), 2, 0);
}

void __72___SFLinkPreviewHelper_openActionForRedirectToExternalNavigationResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "linkPreviewHelper:redirectToExternalNavigationResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __95___SFLinkPreviewHelper_openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained(WeakRetained + 4);
  objc_msgSend(v2, "linkPreviewHelper:redirectToExternalNavigationResult:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __79___SFLinkPreviewHelper_openInNewTabActionForURL_withTabOrder_preActionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  id *v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 48);
  if (!v3 || ((*(uint64_t (**)(void))(v3 + 16))() & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_previewViewControllerIsLinkPreview");
    v5 = *(id **)(a1 + 32);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained(v5 + 4);
      objc_msgSend(WeakRetained, "linkPreviewHelper:commitPreviewViewControllerForAction:withTabOrder:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 56));

    }
    else
    {
      objc_msgSend(v5, "openURL:forAction:withTabOrder:", *(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 56));
    }
  }

}

uint64_t __78___SFLinkPreviewHelper_openInTabGroupActionForURL_shouldPerformActionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (!v2 || (result = (*(uint64_t (**)(void))(v2 + 16))(), (_DWORD)result))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_previewViewControllerIsLinkPreview"))
      return objc_msgSend(*(id *)(a1 + 40), "linkPreviewHelper:commitPreviewViewControllerForAction:withTabOrder:", *(_QWORD *)(a1 + 32), 3, 1);
    else
      return objc_msgSend(*(id *)(a1 + 32), "openURL:forAction:withTabOrder:", *(_QWORD *)(a1 + 48), 3, 1);
  }
  return result;
}

void __52___SFLinkPreviewHelper_openInNewWindowActionForURL___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v2 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Open new window via long-press on link", v7, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D4EF70], "builderWithModifierFlags:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrefersOpenInNewWindow:", 1);
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(v3, "navigationIntentWithURL:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkPreviewHelper:didProduceNavigationIntent:forAction:", v5, v6, 4);

}

uint64_t __53___SFLinkPreviewHelper_addToReadingListActionForURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "linkPreviewHelper:addURLToReadingList:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45___SFLinkPreviewHelper_downloadActionForURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Started a file download via long-press on link", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "linkPreviewHelperWillBeginDownload:", *(_QWORD *)(a1 + 40));
  +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDownloadFromWebView:URL:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setExplicitlySaved:", 1);
  +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

}

@end
