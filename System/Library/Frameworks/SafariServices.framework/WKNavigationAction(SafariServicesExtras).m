@implementation WKNavigationAction(SafariServicesExtras)

- (uint64_t)_sf_shouldAskAboutInsecureFormSubmission
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (objc_msgSend(a1, "navigationType") != 1)
    return 0;
  if (objc_msgSend(a1, "_isRedirect"))
  {
    objc_msgSend(a1, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "HTTPMethod");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GET"));

    if ((v4 & 1) != 0)
      return 0;
  }
  objc_msgSend(a1, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safari_hasScheme:", CFSTR("http"));

  if (!v7)
    return 0;
  objc_msgSend(a1, "sourceFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safari_hasScheme:", CFSTR("https"));

  return v11;
}

- (uint64_t)_sf_shouldPerformDownload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_shouldPerformDownload"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "targetFrame");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3
      && (objc_msgSend(v3, "isMainFrame") & 1) == 0
      && (objc_msgSend(a1, "sourceFrame"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v3 == v6))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 138739971;
        v14 = v5;
        v11 = "Following download-attributed same-frame subframe link to %{sensitive}@";
        goto LABEL_14;
      }
    }
    else
    {
      v7 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D4F440]);
      v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v9)
        {
          v13 = 138739971;
          v14 = v5;
          v10 = 1;
          _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Using download attribute for main frame navigation to %{sensitive}@", (uint8_t *)&v13, 0xCu);
        }
        else
        {
          v10 = 1;
        }
        goto LABEL_16;
      }
      if (v9)
      {
        v13 = 138739971;
        v14 = v5;
        v11 = "Allowing provisional navigation with download attribute to %{sensitive}@";
LABEL_14:
        _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
      }
    }
    v10 = 0;
LABEL_16:

    return v10;
  }
  return 0;
}

- (uint64_t)_sf_allowsExternalRedirectWithoutPrompting
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)allowsExternalRedirectWithoutPromptingKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_sf_setAllowsExternalRedirectWithoutPrompting:()SafariServicesExtras
{
  const void *v2;
  id v3;

  v2 = (const void *)allowsExternalRedirectWithoutPromptingKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

@end
