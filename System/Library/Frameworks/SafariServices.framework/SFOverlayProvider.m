@implementation SFOverlayProvider

void __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke_2;
  block[3] = &unk_1E4AC73A8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 48))
    v2 = 1;
  else
    v2 = objc_msgSend((id)objc_opt_class(), "alwaysShowOverlayForDebug");
  objc_msgSend(*(id *)(a1 + 32), "setAvailable:", v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __78__SFOverlayProvider_SafariServicesExtras___updateAppClipOverlayPreferenceHook__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXAppStoreBanner();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138477827;
    v5 = v3;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "User disallows showing app clip info overlay for domain %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

@end
