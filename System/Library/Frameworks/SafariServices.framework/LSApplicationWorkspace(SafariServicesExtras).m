@implementation LSApplicationWorkspace(SafariServicesExtras)

- (uint64_t)_sf_openURL:()SafariServicesExtras withOptions:completionHandler:
{
  return objc_msgSend(a1, "_sf_openURL:inApplication:withOptions:completionHandler:", a3, 0, a4, a5);
}

- (void)_sf_openURL:()SafariServicesExtras inApplication:withOptions:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__LSApplicationWorkspace_SafariServicesExtras___sf_openURL_inApplication_withOptions_completionHandler___block_invoke;
  block[3] = &unk_1E4AC2A00;
  v22 = v12;
  v23 = v13;
  block[4] = a1;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

- (uint64_t)_sf_shouldOverrideiCloudSharingURL:()SafariServicesExtras withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:
{
  if (a6)
    return objc_msgSend(a4, "safari_hasScheme:", CFSTR("icloud-sharing")) ^ 1;
  else
    return 1;
}

- (void)_sf_tryOpeningURLInDefaultApp:()SafariServicesExtras isContentManaged:completionHandler:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v7 = a3;
  if (a5)
    v8 = a5;
  else
    v8 = &__block_literal_global_22;
  v9 = (void *)MEMORY[0x1A8598C40](v8);
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4AC2A90;
  v16 = a4;
  v14 = v7;
  v15 = v9;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v10, "fetchItemForURL:completionHandler:", v12, v13);

}

@end
