@implementation CKAlertSuppressionContextHelper

+ (id)alertSuppressionContextsForVisibleChatControllerWithConversation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(v5, "personCentricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Adding alert suppression contexts %@ for visible chat %@", (uint8_t *)&v10, 0x16u);
    }

  }
  return v4;
}

@end
