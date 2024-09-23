@implementation SFOverlayProvider(SafariServicesExtras)

- (void)requestOverlayWithPreferencesVendor:()SafariServicesExtras completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_setPreferencesVendor:", v7);
  objc_msgSend(v7, "appInfoOverlayPreferenceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_resolvedPreferenceDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__SFOverlayProvider_SafariServicesExtras__requestOverlayWithPreferencesVendor_completion___block_invoke;
  v11[3] = &unk_1E4AC73D0;
  v11[4] = a1;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getAppInfoOverlayPreferenceForDomain:completionHandler:", v9, v11);

}

- (void)_updateAppClipOverlayPreferenceHook
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a1, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_preferencesVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInfoOverlayPreferenceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resolvedPreferenceDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SFOverlayProvider_SafariServicesExtras___updateAppClipOverlayPreferenceHook__block_invoke;
  v8[3] = &unk_1E4AC05E0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "setAppInfoOverlayPreferenceForDomain:settings:completionHandler:", v6, 0, v8);

}

- (id)_resolvedPreferenceDomain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", CFSTR("appclip.apple.com")))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("appclip.apple.com"), v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

@end
