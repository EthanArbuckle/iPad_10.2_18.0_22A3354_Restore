@implementation IMBalloonPluginManager(ChatKitAdditions)

- (id)balloonControllerForIMChatItem:()ChatKitAdditions contextIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "balloonPluginForBundleID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "balloonControllerForChatItem:contextIdentifier:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __93__IMBalloonPluginManager_ChatKitAdditions__balloonControllerForIMChatItem_contextIdentifier___block_invoke;
          v18[3] = &unk_1E27504B8;
          v19 = v6;
          objc_msgSend(v10, "setUpdateSnapshot:", v18);

        }
        v11 = v10;
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v16;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Unable to get balloon controller for chat item type: %@", buf, 0xCu);

        }
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "type");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Unable to get plugin for chat item type: %@", buf, 0xCu);

        }
      }
      v10 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get Balloon Plugin Controller", buf, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

@end
