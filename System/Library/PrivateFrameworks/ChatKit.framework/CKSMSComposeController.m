@implementation CKSMSComposeController

- (CKSMSComposeController)init
{
  CKSMSComposeController *v3;
  CKSMSComposeQueuingRemoteViewControllerProxy *v4;
  UINavigationController *clientNavigationController;
  uint64_t v6;
  CKSMSComposeController *v7;
  CKSMSComposeController *v8;
  uint64_t v9;
  _UIAsyncInvocation *cancellationInvocation;
  _QWORD v12[4];
  CKSMSComposeController *v13;
  SEL v14;
  _QWORD v15[4];
  CKSMSComposeController *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSMSComposeController;
  v3 = -[CKSMSComposeController init](&v17, sel_init);
  if (v3)
  {
    kdebug_trace();
    v3->_firstItemWasInserted = 0;
    v4 = objc_alloc_init(CKSMSComposeQueuingRemoteViewControllerProxy);
    -[CKSMSComposeController setRemoteViewControllerProxy:](v3, "setRemoteViewControllerProxy:", v4);
    v3->_safeToAdd = 1;
    clientNavigationController = v3->_clientNavigationController;
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __30__CKSMSComposeController_init__block_invoke;
    v15[3] = &unk_1E27583C0;
    v7 = v3;
    v16 = v7;
    -[UINavigationController _beginDelayingPresentation:cancellationHandler:](clientNavigationController, "_beginDelayingPresentation:cancellationHandler:", v15, 15.0);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __30__CKSMSComposeController_init__block_invoke_2;
    v12[3] = &unk_1E27583E8;
    v14 = a2;
    v8 = v7;
    v13 = v8;
    +[CKSMSComposeRemoteViewController requestViewControllerWithConnectionHandler:](CKSMSComposeRemoteViewController, "requestViewControllerWithConnectionHandler:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    cancellationInvocation = v8->_cancellationInvocation;
    v8->_cancellationInvocation = (_UIAsyncInvocation *)v9;

  }
  return v3;
}

uint64_t __30__CKSMSComposeController_init__block_invoke(uint64_t a1, int a2)
{
  const __CFString *v4;

  v4 = CFSTR("NO");
  if (a2)
    v4 = CFSTR("YES");
  NSLog(CFSTR("Remote compose controller timed out (%@)!"), v4);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "smsComposeControllerCancelled");
  return 0;
}

void __30__CKSMSComposeController_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  kdebug_trace();
  if (v5)
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ %@"), v6, v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "dismissViewControllerAnimated:completion:", 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "smsComposeControllerCancelled");
  }
  else if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v15);
    objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setServiceViewControllerProxy:", v10);

    objc_msgSend(*(id *)(a1 + 32), "_addRemoteVCIfNeeded");
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 1000);
  *(_QWORD *)(v11 + 1000) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "_endDelayingPresentation");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 1008);
  *(_QWORD *)(v13 + 1008) = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CKSMSComposeController)initWithNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_clientNavigationController, a3);
  return -[CKSMSComposeController init](self, "init");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[CKSMSComposeController setRemoteViewControllerProxy:](self, "setRemoteViewControllerProxy:", 0);
  -[CKSMSComposeController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[CKSMSComposeController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromParentViewController");

  -[CKSMSComposeController remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[CKSMSComposeController setRemoteViewController:](self, "setRemoteViewController:", 0);
  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController dealloc](&v7, sel_dealloc);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  _UIAsyncInvocation *cancellationInvocation;
  id v5;
  _UIAsyncInvocation *v6;

  cancellationInvocation = self->_cancellationInvocation;
  if (cancellationInvocation)
  {
    v5 = (id)-[_UIAsyncInvocation invoke](cancellationInvocation, "invoke", a3);
    v6 = self->_cancellationInvocation;
    self->_cancellationInvocation = 0;

  }
  -[CKSMSComposeController smsComposeControllerCancelled](self, "smsComposeControllerCancelled", a3);
}

+ (BOOL)acceptsMIMEType:(id)a3
{
  return 1;
}

+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  _DWORD v6[14];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  memset(&v6[4], 0, 28);
  v6[2] = a4;
  v6[3] = a3;
  v6[1] = a5;
  return CKClientComposeCanSendMediaObjectTypes((uint64_t)v6);
}

- (BOOL)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertFilename:MIMEType:exportedFilename:options:", v13, v12, v11, v10);

  return 1;
}

- (BOOL)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertData:MIMEType:exportedFilename:", v10, v9, v8);

  return 1;
}

- (BOOL)insertAttachmentWithURL:(id)a3 andDescription:(id)a4
{
  id v6;
  id v7;
  CKRemoteItemForSending *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  v8 = -[CKRemoteItemForSending initWithAttachmentURL:description:blockOnPreviewCreation:]([CKRemoteItemForSending alloc], "initWithAttachmentURL:description:blockOnPreviewCreation:", v6, v7, !self->_firstItemWasInserted);
  if (v8)
  {
    -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertRemoteItemForSending:", v8);

    if (!self->_firstItemWasInserted)
      self->_firstItemWasInserted = 1;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v12, 2u);
    }

  }
  return 1;
}

- (BOOL)insertRichLinkWithURL:(id)a3 andData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  CKRemoteItemForSending *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v7, "length");
      v10 = CFSTR("YES");
      if (!v6)
        v10 = CFSTR("NO");
      v15 = 138412546;
      v16 = v10;
      v17 = 2048;
      v18 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "insertRichLinkWithURL: %@, data: %lu", (uint8_t *)&v15, 0x16u);
    }

  }
  v11 = -[CKRemoteItemForSending initWithRichLinkWithURL:data:]([CKRemoteItemForSending alloc], "initWithRichLinkWithURL:data:", v6, v7);
  if (v11)
  {
    -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertRemoteItemForSending:", v11);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", (uint8_t *)&v15, 2u);
    }

  }
  return 1;
}

- (void)insertItemForSendingAndCalculateEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKRemoteItemForSending *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CKRemoteItemForSending initWithAttachmentURL:description:blockOnPreviewCreation:]([CKRemoteItemForSending alloc], "initWithAttachmentURL:description:blockOnPreviewCreation:", v8, v9, 0);
  if (v11)
  {
    -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__CKSMSComposeController_insertItemForSendingAndCalculateEntryViewFrame_withAlternateFilename_completion___block_invoke;
    v15[3] = &unk_1E2758410;
    v16 = v10;
    objc_msgSend(v12, "insertRemoteItemForSendingAndCalculateEntryViewFrame:completion:", v11, v15);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v14, 2u);
    }

  }
}

void __106__CKSMSComposeController_insertItemForSendingAndCalculateEntryViewFrame_withAlternateFilename_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSRect v9;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "CGRectValue");
      NSStringFromRect(v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Expanded entry view frame: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)showInsertedItemInEntryView
{
  id v2;

  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showInsertedItemInEntryView");

}

- (BOOL)canInsertMessageWithExtensionBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.private.messages.associated-message-extension-bundle-identifiers"), v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length")
    && objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."))
    && objc_msgSend(v6, "containsObject:", v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v3;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Overriding pluginKitProxy identifier with %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = IMIsPlugInProxyAMessagesExtensionPoint() != 0;
LABEL_35:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "plugInKitPlugins");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            if (IMIsPlugInProxyAMessagesExtensionPoint())
            {
LABEL_34:
              LOBYTE(v9) = 1;
              goto LABEL_35;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    if (objc_msgSend(v6, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v9)
      {
        v13 = *(_QWORD *)v18;
        while (2)
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && IMIsPlugInProxyAMessagesExtensionPoint())
            {

              goto LABEL_34;
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
            continue;
          break;
        }
      }
      goto LABEL_35;
    }
  }
  LOBYTE(v9) = 0;
LABEL_36:

  return v9;
}

- (BOOL)insertMessage:(id)a3
{
  return -[CKSMSComposeController insertMessage:extensionBundleIdentifier:](self, "insertMessage:extensionBundleIdentifier:", a3, 0);
}

- (BOOL)insertMessage:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  CKRemoteItemForSending *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  if (-[CKSMSComposeController canInsertMessageWithExtensionBundleIdentifier:](self, "canInsertMessageWithExtensionBundleIdentifier:", v7))
  {
    v8 = -[CKRemoteItemForSending initWithMSMessage:]([CKRemoteItemForSending alloc], "initWithMSMessage:", v6);
    v9 = v8 != 0;
    if (v8)
    {
      -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v7)
        -[NSObject insertRemoteItemForSending:extensionBundleIdentifier:](v10, "insertRemoteItemForSending:extensionBundleIdentifier:", v8, v7);
      else
        -[NSObject insertRemoteItemForSending:](v10, "insertRemoteItemForSending:", v8);
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_11:

        goto LABEL_12;
      }
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v13, 2u);
      }
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:subject:addresses:", v10, v9, v8);

}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:subject:addresses:chatGUID:groupName:", v16, v15, v14, v13, v12);

}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:subject:addresses:shouldHideClearPluginButton:", v12, v11, v10, v6);

}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:subject:addresses:shouldHideClearPluginButton:chatGUID:", v15, v14, v13, v7, v12);

}

- (void)setPendingAddresses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingAddresses:", v4);

}

- (void)configureForDeviceValidation
{
  id v2;

  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureForDeviceValidation");

}

- (void)setCanEditRecipients:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanEditRecipients:", v3);

}

- (void)setShouldDisableEntryField:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldDisableEntryField:", v3);

}

- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldIgnoreEmailsWhenSending:", v3);

}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 isCollaboration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:", v12, v11, v10, 0, v6);

  return 1;
}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:", v15, v14, v13, v12, v7);

  return 1;
}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", v18, v17, v16, v15, v8, v14);

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:", v10, v9, v8);

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:completionHandler:", v13, v12, v11, v10);

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", v18, v17, v16, v15, v8, v14);

  return 1;
}

- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  _BYTE v20[22];
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v8 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = CFSTR("NO");
      *(_DWORD *)v20 = 138413058;
      *(_QWORD *)&v20[4] = v12;
      if (v8)
        v17 = CFSTR("YES");
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "insertCKShareForCollaboration called with share: %@, containerSetupInfo = %@, collaborationShareOptions = %@, isCollaboration = %@", v20, 0x2Au);
    }

  }
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy", *(_OWORD *)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", v12, v13, v14, v8, v15);

  return 1;
}

- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:", v12, v11, v10, v6);

  return 1;
}

- (BOOL)insertGroupActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "insertGroupActivity called", v8, 2u);
    }

  }
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertGroupActivity:", v4);

  return 1;
}

- (void)setNavBarTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavBarTitle:", v4);

}

- (void)disableCameraAttachments
{
  id v2;

  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableCameraAttachments");

}

- (void)forceCancelComposition
{
  id v2;

  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceCancelComposition");

}

- (void)forceMMS
{
  id v2;

  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceMMS");

}

- (void)setGameCenterModeWithPickerBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGameCenterModeWithPickerBlock:", v4);

}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGameCenterPickedHandles:playerNames:", v7, v6);

}

- (void)setUICustomizationData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((_UIApplicationUsesLegacyUI() & 1) == 0)
  {
    -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUICustomizationData:", v5);

  }
}

- (void)setUTIs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUTIs:", v4);

}

- (void)setContentURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentURLs:", v4);

}

- (void)setPhotoIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoIDs:", v4);

}

- (void)setCloudPhotoIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudPhotoIDs:", v4);

}

- (void)setContentText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentText:", v4);

}

- (void)setShareSheetSessionID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareSheetSessionID:", v4);

}

- (void)setServiceId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceId:", v4);

}

- (void)setSuggestions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuggestions:", v4);

}

- (void)smsComposeControllerDataInserted
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "smsComposeControllerDataInserted:", self);

}

- (void)smsComposeControllerAppeared
{
  void *v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_forceResumed");

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "smsComposeControllerAppeared:", self);

}

- (void)smsComposeControllerCancelled
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "smsComposeControllerCancelled:", self);

}

- (void)smsComposeControllerEntryViewContentInserted
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "smsComposeControllerDataInserted:", self);

}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id *p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained(p_delegate);
    objc_msgSend(v13, "smsComposeControllerShouldSendMessageWithText:toRecipients:completion:", v14, v8, v9);

  }
  else
  {
    v9[2](v9, 1);
  }

}

- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  v9 = objc_loadWeakRetained(&self->_delegate);
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "smsComposeControllerSendStarted:withText:messageGUID:", self, v13, v6);
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    v12 = objc_loadWeakRetained(&self->_delegate);
    v10 = v12;
    if ((v11 & 1) != 0)
      objc_msgSend(v12, "smsComposeControllerSendStarted:withText:", self, v13);
    else
      objc_msgSend(v12, "smsComposeControllerSendStarted:", self);
  }

}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeController remoteViewControllerProxy](self, "remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextEntryContentsVisible:", v3);

}

- (void)_addRemoteVCIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (self->_safeToAdd)
  {
    -[CKSMSComposeController remoteViewController](self, "remoteViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }
  -[CKSMSComposeController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v6)
  {
    -[CKSMSComposeController remoteViewController](self, "remoteViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSMSComposeController addChildViewController:](self, "addChildViewController:", v7);

    -[CKSMSComposeController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CKSMSComposeController remoteViewController](self, "remoteViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    -[CKSMSComposeController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSMSComposeController remoteViewController](self, "remoteViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v21);

    -[CKSMSComposeController remoteViewController](self, "remoteViewController");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didMoveToParentViewController:", self);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController viewDidLoad](&v7, sel_viewDidLoad);
  -[CKSMSComposeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  self->_safeToAdd = 0;
  -[CKSMSComposeController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, 0);

  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  self->_safeToAdd = 1;
  -[CKSMSComposeController _addRemoteVCIfNeeded](self, "_addRemoteVCIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "statusBarStyle"))
  {
    self->_didChangeStatusBarStyle = 1;
    self->_savedStatusBarStyle = objc_msgSend(v5, "statusBarStyle");
    objc_msgSend(v5, "setStatusBarStyle:", 0);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  int64_t savedStatusBarStyle;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (self->_didChangeStatusBarStyle)
  {
    savedStatusBarStyle = self->_savedStatusBarStyle;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatusBarStyle:", savedStatusBarStyle);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeController;
  -[CKSMSComposeController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;

  -[CKSMSComposeController remoteViewController](self, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "shouldAutorotateToInterfaceOrientation:", a3);

  return a3;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (CKSMSComposeRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (CKSMSComposeQueuingRemoteViewControllerProxy)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, a3);
}

- (_UIAsyncInvocation)cancellationInvocation
{
  return self->_cancellationInvocation;
}

- (void)setCancellationInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationInvocation, a3);
}

- (UINavigationController)clientNavigationController
{
  return self->_clientNavigationController;
}

- (void)setClientNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_clientNavigationController, a3);
}

- (BOOL)safeToAdd
{
  return self->_safeToAdd;
}

- (void)setSafeToAdd:(BOOL)a3
{
  self->_safeToAdd = a3;
}

- (BOOL)didChangeStatusBarStyle
{
  return self->_didChangeStatusBarStyle;
}

- (void)setDidChangeStatusBarStyle:(BOOL)a3
{
  self->_didChangeStatusBarStyle = a3;
}

- (int64_t)savedStatusBarStyle
{
  return self->_savedStatusBarStyle;
}

- (void)setSavedStatusBarStyle:(int64_t)a3
{
  self->_savedStatusBarStyle = a3;
}

- (BOOL)firstItemWasInserted
{
  return self->_firstItemWasInserted;
}

- (void)setFirstItemWasInserted:(BOOL)a3
{
  self->_firstItemWasInserted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientNavigationController, 0);
  objc_storeStrong((id *)&self->_cancellationInvocation, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
