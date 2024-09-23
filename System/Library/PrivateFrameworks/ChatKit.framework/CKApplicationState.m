@implementation CKApplicationState

+ (BOOL)isResizing
{
  return 0;
}

+ (BOOL)isApplicationActive
{
  BOOL v2;
  void *v3;

  if (objc_msgSend(a1, "_isUIExtension"))
    return _isActive != 0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "applicationState") == 0;

  return v2;
}

+ (BOOL)isBackground
{
  BOOL v2;
  void *v3;

  if (objc_msgSend(a1, "_isUIExtension"))
    return _isActive == 0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "applicationState") == 2;

  return v2;
}

+ (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_isActive != a3)
  {
    v3 = a3;
    _isActive = a3;
    if (!a3 && !CKIsRunningInMacCatalyst())
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invalidateAllActivePlugins");

      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "forceKillRemoteExtensionsWithDelay:", 0);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = CFSTR("NO");
        if (v3)
          v7 = CFSTR("YES");
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "setActive: %@", (uint8_t *)&v8, 0xCu);
      }

    }
  }
}

+ (BOOL)isWindowForegroundActive:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "activationState") == 0;

  }
  return (char)v4;
}

+ (BOOL)_isUIExtension
{
  return CKIsRunningInMessagesViewService()
      || CKIsRunningInMessagesNotificationExtension()
      || CKIsRunningInMessagesTranscriptExtension() != 0;
}

@end
