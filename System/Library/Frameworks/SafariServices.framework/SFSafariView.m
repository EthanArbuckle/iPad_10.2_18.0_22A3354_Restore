@implementation SFSafariView

- (void)setTintColor:(id)a3
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFSafariView;
  -[SFSafariView setTintColor:](&v13, sel_setTintColor_, a3);
  if ((warnAboutTintColorIfNeeded_didWarningCheck & 1) == 0)
  {
    warnAboutTintColorIfNeeded_didWarningCheck = 1;
    if (__UIApplicationLinkedOnOrAfter())
    {
      v3 = dyld_program_minos_at_least();
      v4 = WBS_LOG_CHANNEL_PREFIXOther();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v3)
      {
        if (v5)
          -[SFSafariView setTintColor:].cold.1(v4, v6, v7, v8, v9, v10, v11, v12);
      }
      else if (v5)
      {
        -[SFSafariView setTintColor:].cold.2(v4, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)didMoveToWindow
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSafariView;
  -[SFSafariView didMoveToWindow](&v3, sel_didMoveToWindow);
  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)setTintColor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "When deploying for iOS 10 and later, 'SFSafariViewController.view.tintColor' has no effect. Use 'SFSafariViewController.preferredControlTintColor'.", a5, a6, a7, a8, 0);
}

- (void)setTintColor:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "When running on iOS 10 and later, 'SFSafariViewController.view.tintColor' has no effect. Use 'SFSafariViewController.preferredControlTintColor' if available, and 'tintColor' otherwise.", a5, a6, a7, a8, 0);
}

@end
