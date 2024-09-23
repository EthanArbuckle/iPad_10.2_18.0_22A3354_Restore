@implementation UIWindowScene

void __72__UIWindowScene_SafariServicesExtras___sf_openTelURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v5, "setShowUIPrompt:", 0);
    if (objc_msgSend(v5, "isValid"))
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(v5, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "openURL:options:completionHandler:", v4, 0, *(_QWORD *)(a1 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __85__UIWindowScene_SafariServicesExtras___sf_openFaceTimeMultiWayURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowUIPrompt:", 0);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:options:completionHandler:", v4, 0, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __55__UIWindowScene_SafariServicesExtras___sf_destroyScene__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXUserInterface();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_DEFAULT, "Scene destruction request, %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
