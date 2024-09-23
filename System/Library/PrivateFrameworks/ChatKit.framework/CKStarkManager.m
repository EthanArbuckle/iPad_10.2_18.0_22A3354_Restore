@implementation CKStarkManager

+ (BOOL)isCarPlayConnected
{
  return CKStarkManagerConnectedToCarPlay;
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CKStarkConversationController *v9;
  CKStarkConversationController *conversationController;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Stark window did connect", v11, 2u);
    }

  }
  CKStarkManagerConnectedToCarPlay = 1;
  v9 = -[CKStarkConversationController initWithInterfaceController:]([CKStarkConversationController alloc], "initWithInterfaceController:", v7);
  conversationController = self->_conversationController;
  self->_conversationController = v9;

}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CKStarkConversationController *conversationController;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Stark window did disconnect", v10, 2u);
    }

  }
  conversationController = self->_conversationController;
  self->_conversationController = 0;

  CKStarkManagerConnectedToCarPlay = 0;
}

+ (id)_directActionSource
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D97828]), "initWithDelegate:", 0);
}

+ (void)_activateSiriWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_directActionSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateWithContext:completion:", v4, &__block_literal_global_56);

}

void __43__CKStarkManager__activateSiriWithContext___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("Unsuccessfully");
      if (a2)
        v4 = CFSTR("Successfully");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Siri Activated %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

+ (void)activateForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKMakeHandlesFromRecipients(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D97820], "messageComposeNewThreadDirectActionWithAppBundleId:fullName:phoneOrEmailAddress:", CFSTR("com.apple.MobileSMS"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Activated to read message with recipients [%@]", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(a1, "_activateSiriWithContext:", v10);

}

+ (void)activateForConversation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E276D870;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  if (objc_msgSend(v4, "hasUnreadMessages"))
    objc_msgSend(MEMORY[0x1E0D97820], "messageReadDirectActionWithAppBundleId:conversationGUID:", CFSTR("com.apple.MobileSMS"), v9);
  else
    objc_msgSend(MEMORY[0x1E0D97820], "messageReplyDirectActionWithAppBundleId:conversationGUID:", CFSTR("com.apple.MobileSMS"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Activated to read message with message id [%@] from conversation [%@]", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(a1, "_activateSiriWithContext:", v10);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a5, "URLContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[CKStarkManager scene:openURLContexts:](self, "scene:openURLContexts:", v8, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "anyObject", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKStarkManager openURL:sourceApplication:](self, "openURL:sourceApplication:", v5, v7);
}

- (void)openURL:(id)a3 sourceApplication:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Opening url: %@ from source application: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  objc_msgSend(v6, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("sms")) & 1) == 0)
  {
    objc_msgSend(v6, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("sms-private")) & 1) == 0)
    {
      objc_msgSend(v6, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("imessage"));

      if ((v15 & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[CKStarkManager openSMSURL:](self, "openSMSURL:", v6);
LABEL_10:

}

- (void)openSMSURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "chatForURL:outMessageText:outRecipientIDs:outService:outMessageGUID:", v3, 0, &v21, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  if (v5 && (objc_msgSend(v5, "allowedToShowConversation") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v3;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, " received URL: (%@) to a chat which contained non-allowlisted handles during downtime, so aborting open url request.", buf, 0xCu);
      }

    }
  }
  else
  {
    if (objc_msgSend(v3, "ckAllowRetargeting"))
    {
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v7, "existingChatWithAddresses:allowAlternativeService:bestHandles:", v6, 1, &v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v20;

      if (v8)
      {
        v10 = v8;

        v5 = v10;
      }
      v11 = objc_msgSend(v9, "count");
      if (v11 == objc_msgSend(v6, "count"))
      {
        objc_msgSend(v9, "__imArrayByApplyingBlock:", &__block_literal_global_45);
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v12;
      }

    }
    if (v5)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "conversationForExistingChat:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v16 = +[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected");
    if (v14)
      v17 = v16;
    else
      v17 = 0;
    if (v17)
    {
      +[CKStarkManager activateForConversation:](CKStarkManager, "activateForConversation:", v14);
    }
    else if (+[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected")
           && objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKStarkManager activateForRecipient:](CKStarkManager, "activateForRecipient:", v18);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v3;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Ignoring open url, no conversation or recipients for url %@", buf, 0xCu);
      }

    }
  }

}

uint64_t __29__CKStarkManager_openSMSURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

- (CKStarkConversationController)conversationController
{
  return self->_conversationController;
}

- (void)setConversationController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationController, 0);
}

@end
