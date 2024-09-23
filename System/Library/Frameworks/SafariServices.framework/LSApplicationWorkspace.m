@implementation LSApplicationWorkspace

void __104__LSApplicationWorkspace_SafariServicesExtras___sf_openURL_inApplication_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _SFOpenURLOperationDelegate *v6;

  if (*(_QWORD *)(a1 + 64))
    v6 = -[_SFOpenURLOperationDelegate initWithCompletionHandler:]([_SFOpenURLOperationDelegate alloc], "initWithCompletionHandler:", *(_QWORD *)(a1 + 64));
  else
    v6 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v3, v4, 0, 0, 0, 0, *(_QWORD *)(a1 + 56), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "start");
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CAACA8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5;
    v9[3] = &unk_1E4AC2A68;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v13 = *(_BYTE *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v7, "fetchProviderDomainForItem:completionHandler:", v10, v9);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2_cold_1(a1, v8, v6);
    tryOpeningInDefaultApp(*(void **)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 48), 0, 0, *(void **)(a1 + 40));
  }

}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5_cold_1(v7, v6);
  }
  v8 = objc_opt_respondsToSelector();
  v9 = *(void **)(a1 + 32);
  if ((v8 & 1) != 0)
    objc_msgSend(v9, "fp_appContainerBundleIdentifier");
  else
    objc_msgSend(v9, "appContainerBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "topLevelBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v5, "providerID");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    tryOpeningInDefaultApp(*(void **)(a1 + 40), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 56), v14, v10, *(void **)(a1 + 48));
  }
  else
  {
    tryOpeningInDefaultApp(*(void **)(a1 + 40), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 56), 0, 0, *(void **)(a1 + 48));
  }

}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v6, v7, "Did not find FPItem for %{sensitive}@: %{public}@", v8, v9, v10, v11, 3u);

  OUTLINED_FUNCTION_0_1();
}

void __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_5_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Error fetching provider domain: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
