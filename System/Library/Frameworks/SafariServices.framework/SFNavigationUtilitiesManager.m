@implementation SFNavigationUtilitiesManager

void __62___SFNavigationUtilitiesManager__sharedUserAgentQuirksManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D8AD88]);
  v1 = (void *)_sharedUserAgentQuirksManager_quirksManager;
  _sharedUserAgentQuirksManager_quirksManager = (uint64_t)v0;

}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int (**v12)(void);
  void *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (a2 == 1)
    a2 = objc_msgSend(*(id *)(a1 + 32), "_shouldOverrideUserAgentSettingForFacebookAuthURL:", *(_QWORD *)(a1 + 40)) ^ 1;
  if (a2)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(*(id *)(a1 + 48), "setPreferredContentMode:", v7);
  v8 = MEMORY[0x1E0C809B0];
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    +[_SFNavigationUtilitiesManager _sharedUserAgentQuirksManager](_SFNavigationUtilitiesManager, "_sharedUserAgentQuirksManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _SFMacSafariUserAgentString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2;
    v16[3] = &unk_1E4AC57F0;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v10, "getQuirksForURLString:withDefaultUserAgent:completionHandler:", v9, v11, v16);

  }
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3;
  v15[3] = &__block_descriptor_48_e5_B8__0l;
  v15[4] = a3;
  v15[5] = a2;
  v12 = (unsigned int (**)(void))MEMORY[0x1A8598C40](v15);
  if (v12[2]())
  {
    objc_msgSend(*(id *)(a1 + 48), "setPreferredContentMode:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "_setAllowSiteSpecificQuirksToOverrideCompatibilityMode:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "_applyAutoplayQuirksToWebsitePolicies:desktopSiteSetting:", *(_QWORD *)(a1 + 48), a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = *(void **)(a1 + 48);
    _SFApplicationNameForDesktopUserAgent();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setApplicationNameForUserAgentWithModernCompatibility:", v14);

  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_setCustomUserAgentAsSiteSpecificQuirks:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40) != 1)
    return 0;
  else
    return _SFDeviceSupportsDesktopSitesByDefault();
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 40), "_setVisibilityAdjustmentSelectorsIncludingShadowHosts:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  NSObject *v7;
  CFAbsoluteTime v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  CFAbsoluteTime v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v6 = CFSTR("On");
    else
      v6 = CFSTR("Off");
    v7 = v4;
    v8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    v10 = 141558787;
    v11 = 1752392040;
    v12 = 2117;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2048;
    v17 = v8;
    _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_INFO, "Fetched content blocker enabled state for %{sensitive, mask.hash}@: %@ - time: %f", (uint8_t *)&v10, 0x2Au);

  }
  v9 = *(id *)(a1 + 40);
  objc_sync_enter(v9);
  objc_msgSend(*(id *)(a1 + 48), "_setContentBlockersEnabled:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = a2;
  objc_sync_exit(v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_18(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 40), "_setCaptivePortalModeEnabled:", a2);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_19(uint64_t a1)
{
  uint64_t v1;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_sync_exit(obj);

  }
}

uint64_t __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2_20(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_21_cold_1(v2);
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
}

void __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_21_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Failed to set up all website preferences before timeout", v1, 2u);
}

@end
