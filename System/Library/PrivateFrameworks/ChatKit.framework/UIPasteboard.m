@implementation UIPasteboard

void __77__UIPasteboard_CKComposition____ck_compositionWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, ">! Calling completionHandler from compositionFromNonCollaborationItemProviders...", v8, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
