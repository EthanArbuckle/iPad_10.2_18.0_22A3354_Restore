@implementation UIViewController(StatusBarState)

- (void)_gkSaveStatusBarStyleAnimated:()StatusBarState setToStyle:
{
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "statusBarStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "_GKSavedStatusBarStyleKey", v7, (void *)0x301);

  objc_msgSend(v8, "setStatusBarStyle:animated:", a4, a3);
}

- (uint64_t)_gkSaveStatusBarStyle:()StatusBarState
{
  return objc_msgSend(a1, "_gkSaveStatusBarStyleAnimated:setToStyle:", a3, 0);
}

- (void)_gkRestoreStatusBarStyle:()StatusBarState
{
  void *v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  id v9;

  objc_getAssociatedObject(a1, "_GKSavedStatusBarStyleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarStyle:animated:", (int)objc_msgSend(v5, "intValue"), a3);
    objc_setAssociatedObject(a1, "_GKSavedStatusBarStyleKey", 0, (void *)0x301);

  }
  else
  {
    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[UIViewController(StatusBarState) _gkRestoreStatusBarStyle:].cold.1(v8);
  }

}

- (void)_gkRestoreStatusBarStyle:()StatusBarState .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AB361000, log, OS_LOG_TYPE_DEBUG, "yowza! restored status bar too many times!", v1, 2u);
}

@end
