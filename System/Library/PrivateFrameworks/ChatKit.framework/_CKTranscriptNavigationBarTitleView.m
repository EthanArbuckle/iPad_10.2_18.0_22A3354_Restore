@implementation _CKTranscriptNavigationBarTitleView

- (void)removeFromSuperview
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  _CKTranscriptNavigationBarTitleView *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[_CKTranscriptNavigationBarTitleView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "_CKTranscriptNavigationBarTitleView instance\n {%@} is being removed from its superview\n {%@}.", buf, 0x16u);

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_CKTranscriptNavigationBarTitleView;
  -[_CKTranscriptNavigationBarTitleView removeFromSuperview](&v5, sel_removeFromSuperview);
}

- (void)didMoveToSuperview
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  _CKTranscriptNavigationBarTitleView *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_CKTranscriptNavigationBarTitleView;
  -[_CKTranscriptNavigationBarTitleView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[_CKTranscriptNavigationBarTitleView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "_CKTranscriptNavigationBarTitleView instance\n {%@} did move to superview\n {%@}.", buf, 0x16u);

    }
  }
}

@end
