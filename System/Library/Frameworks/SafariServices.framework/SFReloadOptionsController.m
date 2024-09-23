@implementation SFReloadOptionsController

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didUpdateRequestDesktopSitePerSitePreference:", *(_QWORD *)(a1 + 32));

}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didUpdateRequestDesktopSiteDefaultValue:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));

}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_4;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

uint64_t __98___SFReloadOptionsController_customUserAgentSettingForMainFrameURL_withTimeout_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  if (a3)
    v3 = 0;
  else
    v3 = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_overrideSettingIfNeeded:source:domain:completion:", a2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke_cold_1(v7);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("desktopLinkURLString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canonicalURLString"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "length");
  v12 = *(void **)(a1 + 32);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestDesktopSiteWithURL:", v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestDesktopSiteWithURL:", *(_QWORD *)(a1 + 40));
  }

}

void __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1A3B2D000, v1, OS_LOG_TYPE_ERROR, "Error occurred when trying to find a desktop website URL on webpage: %{public}@", v3, 0xCu);

  OUTLINED_FUNCTION_6();
}

@end
