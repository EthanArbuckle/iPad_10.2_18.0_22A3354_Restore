@implementation IMFocusStateManager

void __80__IMFocusStateManager_ChatKit__updateFocusStateForCurrentFocusFilterActionAsync__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Finished updating focus filter action", v1, 2u);
    }

  }
}

@end
