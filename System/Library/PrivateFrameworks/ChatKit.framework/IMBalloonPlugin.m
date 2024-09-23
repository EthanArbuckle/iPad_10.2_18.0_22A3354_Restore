@implementation IMBalloonPlugin

void __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "__ck_generateIconForInterfaceStyle:notify:", *(_QWORD *)(a1 + 48), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2048;
      v13 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Create icon image for app with identifier %@ interface style %ld", buf, 0x16u);
    }

  }
  if (!v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to generate icon for app with identifier %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke_129;
  block[3] = &unk_1E274A208;
  v9 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__IMBalloonPlugin_ImageLoading____ck_placeholderImageForInterfaceStyle___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "placeholderExtensionIcon");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ck_placeholderImageForInterfaceStyle__placeholderImage;
  __ck_placeholderImageForInterfaceStyle__placeholderImage = v0;

}

void __72__IMBalloonPlugin_ImageLoading____ck_iconServicesIconForInterfaceStyle___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id to;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  to = 0;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "__ck_iconServicesDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prepareImagesForImageDescriptors:", v5);

  }
  objc_destroyWeak(&to);
}

void __99__IMBalloonPlugin_ImageLoading____ckImageForInterfaceStyle_generateSynchronously_allowPlaceholder___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "__ck_generateIconForInterfaceStyle:notify:", *(_QWORD *)(a1 + 40), 1);

}

void __76__IMBalloonPlugin_ImageLoading____ck_prefetchBrowserImageForInterfaceStyle___block_invoke_129(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Finished prefetching browser icon for key - %@", (uint8_t *)&v6, 0xCu);
    }

  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prefetchIconKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __50__IMBalloonPlugin_ImageLoading__appStoreBadgeIcon__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppStoreIcon-%f"), 0x4040000000000000);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CEA638];
  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "badgeIconForImageNamed:inBundle:", v0, v2);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)appStoreBadgeIcon_sBehavior;
  appStoreBadgeIcon_sBehavior = v3;

}

void __49__IMBalloonPlugin_ImageLoading__recentsBadgeIcon__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RecentsIcon-%f"), 0x4040000000000000);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CEA638];
  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "badgeIconForImageNamed:inBundle:", v0, v2);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)recentsBadgeIcon_sBehavior;
  recentsBadgeIcon_sBehavior = v3;

}

@end
