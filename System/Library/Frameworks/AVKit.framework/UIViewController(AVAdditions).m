@implementation UIViewController(AVAdditions)

- (void)avkit_setNeedsUpdatePreferencesIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  _BYTE v20[24];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "avkit_isEffectivelyFullScreen"))
  {
    objc_msgSend(a1, "viewIfLoaded");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "statusBarManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "prefersStatusBarHidden");
    v7 = objc_msgSend(a1, "preferredStatusBarStyle");
    if (v6 != objc_msgSend(v5, "isStatusBarHidden") || objc_msgSend(v5, "statusBarStyle") != v7)
    {
      objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
      _AVLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(_QWORD *)&v20[14] = "prefersStatusBarHidden";
        *(_WORD *)&v20[12] = 2080;
        if (v6)
          v9 = "YES";
        *(_WORD *)&v20[22] = 2080;
        v21 = v9;
        _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }

    }
    v10 = objc_msgSend(a1, "preferredWhitePointAdaptivityStyle", *(_OWORD *)v20, *(_QWORD *)&v20[16]);
    objc_msgSend(v4, "_effectiveUIClientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "whitePointAdaptivityStyle");

    if (v12 != v10)
    {
      objc_msgSend(a1, "setNeedsWhitePointAdaptivityStyleUpdate");
      _AVLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(_QWORD *)&v20[14] = "UIWhitePointAdaptivityStyleVideo == preferredWhitePointAdaptivityStyle";
        *(_WORD *)&v20[12] = 2080;
        if (v10 == 3)
          v14 = "YES";
        *(_WORD *)&v20[22] = 2080;
        v21 = v14;
        _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }

    }
    v15 = objc_msgSend(a1, "prefersHomeIndicatorAutoHidden", *(_QWORD *)v20, *(_OWORD *)&v20[8]);
    objc_msgSend(v4, "_effectiveUIClientSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "homeIndicatorAutoHidden");

    if (v15 != v17)
    {
      objc_msgSend(a1, "setNeedsUpdateOfHomeIndicatorAutoHidden");
      _AVLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = "NO";
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = "-[UIViewController(AVAdditions) avkit_setNeedsUpdatePreferencesIfNeeded]";
        *(_QWORD *)&v20[14] = "prefersHomeIndicatorAutoHidden";
        *(_WORD *)&v20[12] = 2080;
        if (v15)
          v19 = "YES";
        *(_WORD *)&v20[22] = 2080;
        v21 = v19;
        _os_log_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_DEFAULT, "%s %s %s", v20, 0x20u);
      }

    }
  }
}

- (uint64_t)avkit_isEffectivelyFullScreen
{
  return 0;
}

- (const)avkit_infoPanelKindIdentifier
{
  __CFString *v0;

  v0 = CFSTR("Custom");
  return CFSTR("Custom");
}

@end
