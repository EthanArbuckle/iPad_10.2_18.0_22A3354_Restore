@implementation CKNavbarCanvasViewController

- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4
{
  return -[CKNavbarCanvasViewController initWithConversation:navigationController:hideLocationIfUnavailable:](self, "initWithConversation:navigationController:hideLocationIfUnavailable:", a3, a4, 0);
}

- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4 hideLocationIfUnavailable:(BOOL)a5
{
  id v8;
  id v9;
  CKNavbarCanvasViewController *v10;
  CKNavbarCanvasViewController *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  _BYTE buf[12];
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CKNavbarCanvasViewController;
  v10 = -[CKNavbarCanvasViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    -[CKNavbarCanvasViewController setConversation:](v10, "setConversation:", v8);
    -[CKNavbarCanvasViewController setProxyNavigationController:](v11, "setProxyNavigationController:", v9);
    -[CKNavbarCanvasViewController navBarTitleFromConversation:](v11, "navBarTitleFromConversation:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController setNavbarTitle:](v11, "setNavbarTitle:", v12);

    -[CKNavbarCanvasViewController registerNotifications](v11, "registerNotifications");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = -[CKNavbarCanvasViewController findMyNavBarEnabled](v11, "findMyNavBarEnabled");
        -[CKNavbarCanvasViewController conversation](v11, "conversation");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = CFSTR("NO");
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CKNavbarCanvasViewController initWithConversation:navigationController:hideLocationIfUnavailable:]";
        v24 = 2112;
        if (v14)
          v17 = CFSTR("YES");
        v25 = v17;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%s: Nav bar location refresh enablement: %@ for conversation: %@", buf, 0x20u);

      }
    }
    if (-[CKNavbarCanvasViewController findMyNavBarEnabled](v11, "findMyNavBarEnabled"))
    {
      -[CKNavbarCanvasViewController refreshFMFLocationIfNecessary](v11, "refreshFMFLocationIfNecessary");
      if (a5)
      {
        -[CKNavbarCanvasViewController locationToDisplay](v11, "locationToDisplay");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController setLocationLabelHidden:](v11, "setLocationLabelHidden:", v18 == 0);

      }
      else
      {
        -[CKNavbarCanvasViewController setLocationLabelHidden:](v11, "setLocationLabelHidden:", 0);
      }
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v11);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __100__CKNavbarCanvasViewController_initWithConversation_navigationController_hideLocationIfUnavailable___block_invoke;
    v20[3] = &unk_1E274B548;
    objc_copyWeak(&v21, (id *)buf);
    -[CKNavbarCanvasViewController _refreshIDSStatusWithCompletion:](v11, "_refreshIDSStatusWithCompletion:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __100__CKNavbarCanvasViewController_initWithConversation_navigationController_hideLocationIfUnavailable___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFTControls");

}

- (void)dealloc
{
  CKNavBarConversationIdentityView *conversationIdentityView;
  objc_super v4;

  conversationIdentityView = self->_conversationIdentityView;
  self->_conversationIdentityView = 0;

  -[CKNavigationBarCanvasView clearAllItemViews](self->_canvasView, "clearAllItemViews");
  v4.receiver = self;
  v4.super_class = (Class)CKNavbarCanvasViewController;
  -[CKNavbarCanvasViewController dealloc](&v4, sel_dealloc);
}

- (void)registerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleConversationRecipientsDidChange_, CFSTR("CKConversationParticipantsDidChangeNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D352D8];
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleAllowedByScreenTimeChatChanged_, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleKeyTransparencyStatusChangedNotification_, *MEMORY[0x1E0D353E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleServiceChangedNotification_, *MEMORY[0x1E0D354D0], 0);

  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_fmfSessionRelationshipDidChange_, *MEMORY[0x1E0D35570], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D35560];
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_fmfSessionChatLocationRefreshed_, v13, v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_fmfSessionChatLocationReceived_, *MEMORY[0x1E0D35568], 0);

  }
}

- (void)_refreshIDSStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__im_canonicalIDSAddressesFromEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = dispatch_group_create();
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[CKFaceTimeUtilities isModernScreenSharingAvailable:](CKFaceTimeUtilities, "isModernScreenSharingAvailable:", v9);

    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      dispatch_group_enter(v8);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke;
      v15[3] = &unk_1E274DED0;
      v15[4] = self;
      v16 = v8;
      +[CKFaceTimeUtilities queryModernScreenSharingCapabilities:completion:](CKFaceTimeUtilities, "queryModernScreenSharingCapabilities:completion:", v7, v15);

    }
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E274AED0;
    v14 = v4;
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CKNavbarCanvasViewController _refreshIDSStatusWithCompletion:]";
      v19 = 2048;
      v20 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "%s early returning for addresses.count: %lu", buf, 0x16u);
    }

  }
}

void __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setModernScreenSharingCapabilities:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshFMFLocationIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultIMHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findMyLocationForHandleOrSibling:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      v7 = v8;
    else
      v7 = 0;
    -[CKNavbarCanvasViewController setLocationToDisplay:](self, "setLocationToDisplay:", v7);

  }
}

- (BOOL)findMyNavBarEnabled
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyNavBarEnabled");

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableLocationSharing");

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isGroupConversation") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v4 & ~v6 & v9;
}

- (void)fmfSessionChatLocationRefreshed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[CKNavbarCanvasViewController conversation](self, "conversation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "recipient");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "defaultIMHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 136315394;
          v18 = "-[CKNavbarCanvasViewController fmfSessionChatLocationRefreshed:]";
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%s handle: %@", (uint8_t *)&v17, 0x16u);

        }
      }
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recipient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultIMHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavbarCanvasViewController updateLocationToDisplayWithHandle:](self, "updateLocationToDisplayWithHandle:", v16);

    }
  }

}

- (void)fmfSessionChatLocationReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
    {

    }
    else
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allSiblingFindMyHandles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v6);

      if ((v14 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[CKNavbarCanvasViewController fmfSessionChatLocationReceived:]";
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "%s handle: %@", buf, 0x16u);
      }

    }
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recipient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultIMHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController updateLocationToDisplayWithHandle:](self, "updateLocationToDisplayWithHandle:", v18);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)fmfSessionRelationshipDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CKNavbarCanvasViewController conversation](self, "conversation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "chat");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allSiblingFindMyHandles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v6);

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = 136315394;
              v13 = "-[CKNavbarCanvasViewController fmfSessionRelationshipDidChange:]";
              v14 = 2112;
              v15 = v6;
              _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "%s handle: %@", (uint8_t *)&v12, 0x16u);
            }

          }
          -[CKNavbarCanvasViewController refreshFMFLocationIfNecessary](self, "refreshFMFLocationIfNecessary");
        }
      }
    }
    else
    {

      v6 = 0;
    }

  }
}

- (void)updateLocationToDisplayWithHandle:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = -[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled");
  if (v16)
  {
    if (v4)
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allSiblingFindMyHandles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "findMyHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController conversation](self, "conversation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recipient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "defaultIMHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "findMyLocationForHandleOrSibling:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v15 = v14;
        else
          v15 = 0;
        -[CKNavbarCanvasViewController setLocationToDisplay:](self, "setLocationToDisplay:", v15);

      }
    }
  }

}

- (void)setLocationLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->_locationLabelHidden != a3)
  {
    v3 = a3;
    self->_locationLabelHidden = a3;
    -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitleHidden:", v3);

    -[CKNavbarCanvasViewController _notifyDelegateForNavBarResize](self, "_notifyDelegateForNavBarResize");
  }
}

- (void)setLocationToDisplay:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled")
    && (objc_msgSend(v5, "isEqual:", self->_locationToDisplay) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locationToDisplay, a3);
    -[CKNavbarCanvasViewController updateLocationLabel](self, "updateLocationLabel");
  }

}

- (void)updateLocationLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  char isKindOfClass;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  int v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
  {
    -[CKNavbarCanvasViewController locationToDisplay](self, "locationToDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributedText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v4);

      if ((v8 & 1) != 0)
      {
        -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributedText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "attributesAtIndex:effectiveRange:", 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController traitCollection](self, "traitCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "preferredContentSizeCategory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "navBarSubtitleAttributedStringAttributesForContentSizeCategory:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *MEMORY[0x1E0DC1138];
        objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DC1138]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v18 = 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "pointSize");
          v18 = v19;
        }
        objc_msgSend(v15, "objectForKey:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v22 = 0.0;
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v20, "pointSize", 0.0);
        if (v18 != v22)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v15);
          -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setAttributedText:", v23);

          -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "sizeToFit");

          -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setNeedsLayout");

        }
      }
      else
      {
        v30 = objc_alloc(MEMORY[0x1E0CEA700]);
        v11 = (void *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController traitCollection](self, "traitCollection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "preferredContentSizeCategory");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "navBarSubtitleAttributedStringAttributesForContentSizeCategory:", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v15);
        objc_msgSend(v11, "setAttributedText:", v34);

        objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextColor:", v35);

        objc_msgSend(v11, "setTextAlignment:", 1);
        -[CKNavbarCanvasViewController setLocationLabel:](self, "setLocationLabel:", v11);
      }

      -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "subtitle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", v4);

      if ((v38 & 1) != 0)
      {
        if ((v8 & 1) != 0)
        {
          -[CKNavbarCanvasViewController updateLocationLabelParentViewAssignment](self, "updateLocationLabelParentViewAssignment");
LABEL_32:

          return;
        }
      }
      else
      {
        -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSubtitle:", v4);

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v47 = 136315138;
          v48 = "-[CKNavbarCanvasViewController updateLocationLabel]";
          _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, "%s updated label with a new short address", (uint8_t *)&v47, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = -[CKNavbarCanvasViewController locationLabelHidden](self, "locationLabelHidden");
          v47 = 67109120;
          LODWORD(v48) = v42;
          _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "Location label is shown: %{BOOL}d", (uint8_t *)&v47, 8u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v47 = 136315138;
          v48 = "-[CKNavbarCanvasViewController updateLocationLabel]";
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "%s current location is nil or does not have a short address to display.", (uint8_t *)&v47, 0xCu);
        }

      }
      -[CKNavbarCanvasViewController locationLabel](self, "locationLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "subtitle");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqualToString:", &stru_1E276D870);

        -[CKNavbarCanvasViewController setLocationLabel:](self, "setLocationLabel:", 0);
        -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setSubtitle:", &stru_1E276D870);

        -[CKNavbarCanvasViewController updateLocationLabelParentViewAssignment](self, "updateLocationLabelParentViewAssignment");
        if ((v45 & 1) != 0)
          goto LABEL_32;
        goto LABEL_31;
      }

      -[CKNavbarCanvasViewController setLocationLabel:](self, "setLocationLabel:", 0);
      -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSubtitle:", &stru_1E276D870);

    }
    -[CKNavbarCanvasViewController updateLocationLabelParentViewAssignment](self, "updateLocationLabelParentViewAssignment");
LABEL_31:
    -[CKNavbarCanvasViewController _notifyDelegateForNavBarResize](self, "_notifyDelegateForNavBarResize");
    goto LABEL_32;
  }
}

- (void)setLocationLabel:(id)a3
{
  _BOOL4 v5;
  UILabel *v6;
  UILabel *v7;

  v7 = (UILabel *)a3;
  v5 = -[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled");
  v6 = v7;
  if (v5 && self->_locationLabel != v7)
  {
    -[UILabel sizeToFit](v7, "sizeToFit");
    objc_storeStrong((id *)&self->_locationLabel, a3);
    -[UILabel setHidden:](self->_locationLabel, "setHidden:", -[CKNavbarCanvasViewController locationLabelHidden](self, "locationLabelHidden"));
    v6 = v7;
  }

}

- (void)updateLocationLabelParentViewAssignment
{
  void *v3;
  UILabel *v4;
  UILabel *locationLabel;
  id v6;

  if (-[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView"))
  {
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v4 = 0;
  }
  else
  {
    locationLabel = self->_locationLabel;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v4 = locationLabel;
  }
  objc_msgSend(v3, "setSubtitleView:", v4);

}

- (id)navBarTitleFromConversation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((IMIsRunningInScreenshotTesting_IsolatedTranscriptUI() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "hasDisplayName"))
      objc_msgSend(v4, "displayName");
    else
      objc_msgSend(v4, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, -[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipient");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKNavbarCanvasViewController contactsManager](self, "contactsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startCommunicationForEntity:action:address:usePreferredRouteIfAvailable:", v7, 2, 0, v3);

  }
}

- (id)_windowTraitCollection
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  void *v4;
  _BOOL8 isInEditingMode;
  id v6;

  if (self->_isInEditingMode != a3)
  {
    self->_isInEditingMode = a3;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldAnimateAvatarLayoutChanges:", 1);

    isInEditingMode = self->_isInEditingMode;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsInEditingMode:", isInEditingMode);

  }
}

- (BOOL)_canShowAvatarView
{
  void *v4;
  char v5;

  if ((IMIsRunningInScreenshotTesting_IsolatedTranscriptUI() & 1) != 0)
    return 0;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowAvatarViewInNavBarCanvas");

  return v5;
}

- (CKDetailsContactsManager)contactsManager
{
  CKDetailsContactsManager *contactsManager;
  CKDetailsContactsManager *v4;
  CKDetailsContactsManager *v5;

  contactsManager = self->_contactsManager;
  if (!contactsManager)
  {
    v4 = -[CKDetailsContactsManager initWithConversation:delegate:]([CKDetailsContactsManager alloc], "initWithConversation:delegate:", self->_conversation, self);
    v5 = self->_contactsManager;
    self->_contactsManager = v4;

    contactsManager = self->_contactsManager;
  }
  return contactsManager;
}

- (id)navigationItem
{
  return 0;
}

- (void)loadView
{
  CKNavigationBarCanvasView *v3;
  CKNavigationBarCanvasView *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CKNavbarCanvasViewController _windowTraitCollection](self, "_windowTraitCollection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [CKNavigationBarCanvasView alloc];
  v4 = -[CKNavigationBarCanvasView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKNavbarCanvasViewController setCanvasView:](self, "setCanvasView:", v4);

  if (-[CKNavbarCanvasViewController findMyNavBarEnabled](self, "findMyNavBarEnabled"))
    -[CKNavbarCanvasViewController updateLocationLabel](self, "updateLocationLabel");
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGroupConversation");

  if (v7)
  {
    v8 = +[CKFaceTimeUtilities isGroupFaceTimeSupported](CKFaceTimeUtilities, "isGroupFaceTimeSupported") ^ 1;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMultiwayAudioButtonHidden:", v8);

  }
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeepTitleViewCentered:", 1);

  -[CKNavbarCanvasViewController _initializeForTraitCollection:](self, "_initializeForTraitCollection:", v14);
  -[CKNavbarCanvasViewController navbarTitle](self, "navbarTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController updateTitle:animated:](self, "updateTitle:animated:", v11, 0);

  -[CKNavbarCanvasViewController updateAvatarPickerDelegate](self, "updateAvatarPickerDelegate");
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClipsToBounds:", 1);

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController setView:](self, "setView:", v13);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  CGPoint v20;
  CGPoint v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v4 = a3;
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftItemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonViewFaceTimeAudio");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonViewFaceTimeVideo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNavbarCanvasViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  if (!-[CKNavbarCanvasViewController shouldShowAvatarView](self, "shouldShowAvatarView"))
  {
    objc_msgSend(v6, "frame");
    v20.x = v13;
    v20.y = v15;
    if (!CGRectContainsPoint(v23, v20))
    {
      objc_msgSend(v8, "frame");
      v21.x = v13;
      v21.y = v15;
      if (!CGRectContainsPoint(v24, v21))
      {
        objc_msgSend(v10, "frame");
        v22.x = v13;
        v22.y = v15;
        v18 = !CGRectContainsPoint(v25, v22);
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  if (-[CKNavbarCanvasViewController navBarContext](self, "navBarContext") != 1)
  {
LABEL_6:
    LOBYTE(v18) = 0;
    goto LABEL_7;
  }
  -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "avatarWantsTapAtPoint:fromView:", v17, v13, v15) ^ 1;

LABEL_7:
  return v18;
}

- (void)_updateFTControls
{
  void *v3;
  void *v4;
  id v5;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController modernScreenSharingCapabilities](self, "modernScreenSharingCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKNavbarCanvasViewController updateFTControlsWithConversation:canvasViewController:screenSharingCapabilities:unifiedCallButton:](CKNavbarCanvasViewController, "updateFTControlsWithConversation:canvasViewController:screenSharingCapabilities:unifiedCallButton:", v5, self, v3, v4);

}

+ (void)updateFTControlsWithConversation:(id)a3 canvasViewController:(id)a4 screenSharingCapabilities:(id)a5 unifiedCallButton:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  id v39;

  v39 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v39, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "state") == 3 || objc_msgSend(v13, "state") == 2;
    v17 = objc_msgSend(MEMORY[0x1E0D35818], "conversationIsVideoCall:", v13);
    v18 = objc_msgSend(MEMORY[0x1E0D35818], "conversationIsAVLessSharePlay:", v13);
    v19 = objc_msgSend(v13, "state");
    if (v14)
    {
      v20 = 4;
      v21 = 2;
      if (v17)
        v20 = 6;
      else
        v21 = 4;
      v22 = (v18 & 1) == 0;
      if ((v18 & 1) != 0)
        v23 = 5;
      else
        v23 = v20;
      if (v22)
        v16 = v21;
      else
        v16 = 6;
    }
    else
    {
      if (v19 == 4)
        goto LABEL_40;
      if ((v18 & 1) != 0)
      {
        v16 = 5;
        v23 = 2;
      }
      else
      {
        v24 = v17 == 0;
        if (v17)
          v16 = 1;
        else
          v16 = 3;
        if (v24)
          v23 = 1;
        else
          v23 = 3;
      }
    }
    v25 = objc_msgSend(v13, "state");
    if (((unint64_t)(v25 - 2) < 2 || !v25) && CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v9, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "navbarCanvasViewController:updatedJoinStateWithStyle:", v9, v23);
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(v9, "setIndicatorType:", 0);
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v9, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "navbarCanvasViewController:updatedJoinStateWithStyle:", v9, 0);
      v16 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v16 = 0;
  }
LABEL_32:
  v26 = objc_msgSend(v39, "isGroupConversation");
  objc_msgSend(v39, "chat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "supportsCapabilities:", 1024);

  v29 = +[CKFaceTimeUtilities isFaceTimeAudioAvailable:](CKFaceTimeUtilities, "isFaceTimeAudioAvailable:", v39) & v28;
  v30 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:](CKFaceTimeUtilities, "isFaceTimeVideoAvailable:", v39) & v28;
  objc_msgSend(v39, "recipient");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:capabilities:](CKFaceTimeUtilities, "isModernScreenSharingAvailableForEntity:capabilities:", v31, v10);

  if ((v26 & 1) == 0)
  {
    if ((_DWORD)v29)
    {
      objc_msgSend(v39, "chat");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v33, "isSMS") ^ 1;

    }
    if ((_DWORD)v30)
    {
      objc_msgSend(v39, "chat");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v34, "isSMS") ^ 1;

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isTranscriptSharingEnabled");

  if (v36)
  {
    objc_msgSend(v39, "chat");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isStewieSharingChat");

    v29 = (v38 ^ 1) & v29;
    v30 = (v38 ^ 1) & v30;
  }
  objc_msgSend(v11, "updateWithStyle:availabilityForVideo:audio:telephony:screenSharing:", v16, v30, v29, 0, v32);
LABEL_40:

}

- (void)_userDidTapNavigationBar
{
  unint64_t v3;
  void *v4;
  id v5;

  if (!-[CKNavbarCanvasViewController isInEditingMode](self, "isInEditingMode"))
  {
    if ((v3 = -[CKNavbarCanvasViewController navBarContext](self, "navBarContext"), v3 <= 4)
      && ((1 << v3) & 0x1A) != 0
      && !CKIsRunningInMessagesTranscriptExtension()
      || !-[CKNavbarCanvasViewController shouldShowAvatarView](self, "shouldShowAvatarView"))
    {
      -[CKNavbarCanvasViewController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CKNavbarCanvasViewController canvasView](self, "canvasView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navbarCanvasViewController:didTapView:", self, v4);

    }
  }
}

- (void)handleCloseNavBarAnimationCompleteNotification:(id)a3
{
  __CFString *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = CKNavigationBarCanvasViewHeightAnimationCompletedNotification;
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v4, v5);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double Width;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)CKNavbarCanvasViewController;
  -[CKNavbarCanvasViewController viewDidLayoutSubviews](&v30, sel_viewDidLayoutSubviews);
  -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "contentRectForBounds:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageRectForContentRect:", v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  Width = CGRectGetWidth(v31);
  v32.origin.x = v15;
  v32.origin.y = v17;
  v32.size.width = v19;
  v32.size.height = v21;
  v24 = Width - CGRectGetWidth(v32);

  v25 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25)
    v28 = 0.0;
  else
    v28 = v24;
  if (v25)
    v29 = v24;
  else
    v29 = 0.0;
  objc_msgSend(v26, "setImageEdgeInsets:", 0.0, v28, 0.0, v29);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKNavbarCanvasViewController;
  -[CKNavbarCanvasViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[CKNavbarCanvasViewController _updateUnreadCountForBackbuttonView:](self, "_updateUnreadCountForBackbuttonView:", -[CKNavbarCanvasViewController _unreadCount](self, "_unreadCount"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354E0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354A0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contactPhotosEnabledChangedNotification_, CKConversationListContactPhotosEnabledNotification, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_multiwayStateChanged_, *MEMORY[0x1E0D35410], 0);

  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookChange_, *MEMORY[0x1E0D373C0], 0);
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsBusinessChat:", objc_msgSend(v7, "isBusinessChat"));

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !objc_msgSend(v10, "state"))
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "refreshActiveConversations");

  }
  -[CKNavbarCanvasViewController _updateFTControls](self, "_updateFTControls");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNavbarCanvasViewController;
  -[CKNavbarCanvasViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKNavbarCanvasViewController refreshAudioButtonTargetAction](self, "refreshAudioButtonTargetAction");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNavbarCanvasViewController;
  -[CKNavbarCanvasViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  NSComparisonResult v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKNavbarCanvasViewController;
  v4 = a3;
  -[CKNavbarCanvasViewController traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, v4);
  -[CKNavbarCanvasViewController traitCollection](self, "traitCollection", v18.receiver, v18.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController _initializeForTraitCollection:](self, "_initializeForTraitCollection:", v5);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noAvatarTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  v9 = objc_msgSend(v4, "horizontalSizeClass");
  v10 = objc_msgSend(v5, "horizontalSizeClass");
  v11 = objc_msgSend(v4, "verticalSizeClass");
  v12 = objc_msgSend(v5, "verticalSizeClass");
  objc_msgSend(v4, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = UIContentSizeCategoryCompareToCategory(v13, v14);

  if (v15 || v9 != v10 || v11 != v12)
  {
    -[CKNavbarCanvasViewController updateTitleViewAnimated:](self, "updateTitleViewAnimated:", 0);
    -[CKNavbarCanvasViewController updateLocationLabel](self, "updateLocationLabel");
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutIfNeeded");

  }
}

- (void)_handleAddressBookChange:(id)a3
{
  void *v4;
  void *v5;

  -[CKNavbarCanvasViewController conversation](self, "conversation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController navBarTitleFromConversation:](self, "navBarTitleFromConversation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController updateTitle:animated:](self, "updateTitle:animated:", v5, 1);

  -[CKNavbarCanvasViewController refreshAudioButtonTargetAction](self, "refreshAudioButtonTargetAction");
}

- (void)_notifyDelegateForNavBarResize
{
  void *v3;
  char v4;
  id v5;

  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navbarCanvasViewControllerCanvasHeightDidChange:", self);

  }
}

- (void)updateAvatarPickerDelegate
{
  id v3;

  if (-[CKNavbarCanvasViewController shouldShowAvatarView](self, "shouldShowAvatarView"))
  {
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", self);

  }
}

- (void)configureForEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3)
      -[CKNavbarCanvasViewController _configureForEditMode](self, "_configureForEditMode");
    else
      -[CKNavbarCanvasViewController _configureForDefaultMode](self, "_configureForDefaultMode");
  }
}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v7;
  NSString *navbarTitle;
  BOOL v9;
  NSString *v10;

  v4 = a4;
  v7 = (NSString *)a3;
  navbarTitle = self->_navbarTitle;
  if (navbarTitle != v7)
  {
    v10 = v7;
    if (!v7 || (v9 = -[NSString isEqualToString:](navbarTitle, "isEqualToString:", v7), v7 = v10, !v9))
    {
      objc_storeStrong((id *)&self->_navbarTitle, a3);
      -[CKNavbarCanvasViewController updateTitleViewAnimated:](self, "updateTitleViewAnimated:", v4);
      v7 = v10;
    }
  }

}

- (void)updateTitleViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  -[CKNavbarCanvasViewController _windowTraitCollection](self, "_windowTraitCollection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKNavbarCanvasViewController wantsVerifiedIconForTitle:](self, "wantsVerifiedIconForTitle:", self->_navbarTitle);
  if (-[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView"))
  {
    v7 = 0;
  }
  else if (-[CKNavbarCanvasViewController hideChevron](self, "hideChevron"))
  {
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[CKNavbarCanvasViewController setDefaultLabelText](self, "setDefaultLabelText");
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      v12 = 3;
    else
      v12 = v7;
    objc_msgSend(v10, "setTitleIconImageType:", v12);

    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldHaveRotatedTitleIconImage:animated:", 0, v3);

    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");
  }
  else
  {
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setChevronHidden:", -[CKNavbarCanvasViewController hideChevron](self, "hideChevron"));
  }

}

- (void)updateForRecoveredJunkConversation
{
  -[CKNavbarCanvasViewController updateTitleViewAnimated:](self, "updateTitleViewAnimated:", 1);
  -[CKNavbarCanvasViewController _configureForDefaultMode](self, "_configureForDefaultMode");
}

- (BOOL)wantsVerifiedIconForTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldShowVerifiedCheckmark"))
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hideChevron
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (-[CKNavbarCanvasViewController navBarContext](self, "navBarContext") == 2
    || (IMIsRunningInScreenshotTesting_IsolatedTranscriptUI() & 1) != 0)
  {
    goto LABEL_10;
  }
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isStewieChat") & 1) != 0)
  {
    LOBYTE(v5) = 1;
    goto LABEL_5;
  }
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStewieSharingChat");

  if ((v8 & 1) != 0
    || IMIsOscarEnabled()
    && (+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CKNavbarCanvasViewController conversation](self, "conversation"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "primaryFilterModeForConversation:", v10),
        v10,
        v9,
        v11 == 9))
  {
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowChevronInNavbarCanvasViewController:", self) ^ 1;
LABEL_5:

LABEL_6:
  return v5;
}

- (void)_initializeForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  -[CKNavbarCanvasViewController _leftItemViewForTraitCollection:](self, "_leftItemViewForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftItemView:", v5);

  -[CKNavbarCanvasViewController _rightItemViewForTraitCollection:](self, "_rightItemViewForTraitCollection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightItemView:", v7);

  -[CKNavbarCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleView:", v9);

  v11 = objc_msgSend(v4, "verticalSizeClass");
  if (v11 == 1)
  {
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

  }
}

- (id)recipientContextMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "defaultIMHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isContact");

    if (v8)
    {
      -[CKNavbarCanvasViewController contactsManager](self, "contactsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conversationContextMenuForEntity:allowConversationRemoval:", v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CKNavbarCanvasViewController contextMenuForUnknownRecipient:](self, "contextMenuForUnknownRecipient:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)contextMenuForUnknownRecipient:(id)a3
{
  return 0;
}

- (void)setCanShowBackButtonView:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_canShowBackButtonView != a3)
  {
    self->_canShowBackButtonView = a3;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftItemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      if (v6 != v7)
      {
        -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController canvasView](self, "canvasView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLeftItemView:", v9);

LABEL_8:
      }
    }
    else if (v6 == v7)
    {
      -[CKNavbarCanvasViewController canvasView](self, "canvasView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLeftItemView:", 0);
      goto LABEL_8;
    }
  }
}

- (void)setIndicatorType:(int64_t)a3
{
  id v5;

  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    if (!-[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView"))
    {
      -[CKNavbarCanvasViewController canvasView](self, "canvasView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStatusIndicatorType:", a3);

    }
  }
}

- (void)updateContentsForConversation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[CKNavbarCanvasViewController setConversation:](self, "setConversation:", v6);
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConversation:", v6);

  }
}

- (void)setNavBarContext:(int64_t)a3
{
  self->_navBarContext = a3;
  -[CKNavbarCanvasViewController updateTitleViewAnimated:](self, "updateTitleViewAnimated:", 0);
}

- (id)_leftItemViewForTraitCollection:(id)a3
{
  void *v4;

  if (-[CKNavbarCanvasViewController canShowBackButtonView](self, "canShowBackButtonView", a3))
  {
    -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[CKNavbarCanvasViewController shouldShowDoneButton](self, "shouldShowDoneButton"))
  {
    -[CKNavbarCanvasViewController doneButton](self, "doneButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_rightItemViewForTraitCollection:(id)a3
{
  void *v4;

  if (-[CKNavbarCanvasViewController editing](self, "editing", a3))
  {
    -[CKNavbarCanvasViewController editCancelButtonView](self, "editCancelButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (CKIsRunningInMessagesTranscriptExtension())
  {
    -[CKNavbarCanvasViewController doneButton](self, "doneButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[CKNavbarCanvasViewController _shouldShowPersistentMenu](self, "_shouldShowPersistentMenu"))
  {
    -[CKNavbarCanvasViewController persistentMenuButton](self, "persistentMenuButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CKNavbarCanvasViewController _shouldShowFacetimeButton](self, "_shouldShowFacetimeButton"))
      -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
    else
      -[CKNavbarCanvasViewController detailsButton](self, "detailsButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_shouldShowFacetimeButton
{
  CKNavbarCanvasViewController *v2;
  void *v3;

  v2 = self;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldShowFacetimeButtonInNavbarCanvasViewController:", v2);

  return (char)v2;
}

- (BOOL)_shouldShowPersistentMenu
{
  void *v2;
  void *v3;
  char v4;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChatBot");

  return v4;
}

- (id)_titleItemViewForTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView")
    && objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CKNavBarConversationIdentityView)conversationIdentityView
{
  CKNavBarConversationIdentityView *conversationIdentityView;
  CKNavBarConversationIdentityView *v4;
  void *v5;
  CKNavBarConversationIdentityView *v6;
  CKNavBarConversationIdentityView *v7;

  conversationIdentityView = self->_conversationIdentityView;
  if (!conversationIdentityView)
  {
    v4 = [CKNavBarConversationIdentityView alloc];
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKNavBarConversationIdentityView initWithConversation:](v4, "initWithConversation:", v5);
    v7 = self->_conversationIdentityView;
    self->_conversationIdentityView = v6;

    -[CKNavbarCanvasViewController _addUserDidTapNavigationBarRecognizer:](self, "_addUserDidTapNavigationBarRecognizer:", self->_conversationIdentityView);
    conversationIdentityView = self->_conversationIdentityView;
  }
  return conversationIdentityView;
}

- (CKLabel)defaultLabel
{
  CKLabel *defaultLabel;
  CKLabel *v4;
  CKLabel *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  _QWORD v20[5];
  char v21;
  BOOL v22;

  defaultLabel = self->_defaultLabel;
  if (!defaultLabel)
  {
    v4 = objc_alloc_init(CKLabel);
    v5 = self->_defaultLabel;
    self->_defaultLabel = v4;

    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBusinessConversation");

    -[CKLabel setTextAlignment:](self->_defaultLabel, "setTextAlignment:", -[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView") | v7);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noAvatarTitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLabel setFont:](self->_defaultLabel, "setFont:", v9);

    -[CKNavbarCanvasViewController setDefaultLabelText](self, "setDefaultLabelText");
    if (v7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "chat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "secondaryBrandColorForBusinessChat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel setTextColor:](self->_defaultLabel, "setTextColor:", v14);

    }
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasVerifiedBusiness");

    v17 = -[CKNavbarCanvasViewController hideChevron](self, "hideChevron");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__CKNavbarCanvasViewController_defaultLabel__block_invoke;
    v20[3] = &unk_1E274DEF8;
    v21 = v16;
    v20[4] = self;
    v22 = !v17;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v20);
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShouldHaveRotatedTitleIconImage:animated:", 0, 0);

    -[CKNavbarCanvasViewController _addUserDidTapNavigationBarRecognizer:](self, "_addUserDidTapNavigationBarRecognizer:", self->_defaultLabel);
    defaultLabel = self->_defaultLabel;
  }
  return defaultLabel;
}

void __44__CKNavbarCanvasViewController_defaultLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v2;
    v3 = 3;
LABEL_8:
    objc_msgSend(v2, "setTitleIconImageType:", v3);
    goto LABEL_9;
  }
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(v4, "defaultLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v2;
    v3 = 2;
    goto LABEL_8;
  }
  objc_msgSend(v4, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStewieConversation");

  objc_msgSend(*(id *)(a1 + 32), "defaultLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v2 = v10;
    v3 = 0;
    goto LABEL_8;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversationListEmergencyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

LABEL_9:
}

- (void)setDefaultLabelText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E276D870);
  if (self->_navbarTitle)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_navbarTitle);
    objc_msgSend(v13, "appendAttributedString:", v3);

  }
  if (!-[CKNavbarCanvasViewController shouldShowAvatarView](self, "shouldShowAvatarView")
    && -[CKNavbarCanvasViewController wantsVerifiedIconForTitle:](self, "wantsVerifiedIconForTitle:", self->_navbarTitle))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "businessVerifiedImageSmall");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v6);

    objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v7);

  }
  -[CKNavbarCanvasViewController _KTTitleIconAttributedString](self, "_KTTitleIconAttributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v13, "appendAttributedString:", v8);
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsAccessibilityElement:", 1);

    objc_msgSend(v13, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", v10);

  }
  -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v13);

}

- (void)updateDefaultLabelIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  -[CKNavbarCanvasViewController _windowTraitCollection](self, "_windowTraitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView")
    || objc_msgSend(v5, "verticalSizeClass") == 1)
  {
    -[CKNavbarCanvasViewController setDefaultLabel:](self, "setDefaultLabel:", 0);
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:", v4);

    -[CKNavbarCanvasViewController updateTitleViewAnimated:](self, "updateTitleViewAnimated:", 0);
  }

}

- (void)_configureForEditMode
{
  void *v3;
  void *v4;
  id v5;

  if (!CKIsRunningInMacCatalyst())
  {
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftItemView:", 0);

  }
  -[CKNavbarCanvasViewController editCancelButtonView](self, "editCancelButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightItemView:", v5);

}

- (void)_configureForDefaultMode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[CKNavbarCanvasViewController shouldShowDoneButton](self, "shouldShowDoneButton"))
  {
    -[CKNavbarCanvasViewController doneButton](self, "doneButton");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v3;
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftItemView:", v4);

    goto LABEL_6;
  }
  if (-[CKNavbarCanvasViewController canShowBackButtonView](self, "canShowBackButtonView"))
  {
    -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  -[CKNavbarCanvasViewController traitCollection](self, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController _rightItemViewForTraitCollection:](self, "_rightItemViewForTraitCollection:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightItemView:", v6);

}

- (UIButton)editCancelButtonView
{
  UIButton *editCancelButtonView;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  editCancelButtonView = self->_editCancelButtonView;
  if (!editCancelButtonView)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_editCancelButtonView;
    self->_editCancelButtonView = v4;

    v6 = self->_editCancelButtonView;
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    -[UIButton titleLabel](self->_editCancelButtonView, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[UIButton addTarget:action:forEvents:](self->_editCancelButtonView, "addTarget:action:forEvents:", self, sel__buttonPressed_, 64);
    editCancelButtonView = self->_editCancelButtonView;
  }
  return editCancelButtonView;
}

- (CKCanvasBackButtonView)backButtonView
{
  CKCanvasBackButtonView *backButtonView;
  CKCanvasBackButtonView *v4;
  CKCanvasBackButtonView *v5;
  CKCanvasBackButtonView *v6;

  backButtonView = self->_backButtonView;
  if (!backButtonView)
  {
    v4 = [CKCanvasBackButtonView alloc];
    v5 = -[CKCanvasBackButtonView initWithFrame:showPaddingTitleView:](v4, "initWithFrame:showPaddingTitleView:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_backButtonView;
    self->_backButtonView = v5;

    -[CKCanvasBackButtonView addTarget:action:forEvents:](self->_backButtonView, "addTarget:action:forEvents:", self, sel__buttonPressed_, 64);
    backButtonView = self->_backButtonView;
  }
  return backButtonView;
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (CKNavBarUnifiedCallButton)unifiedCallButton
{
  void *v3;
  void *v4;
  char v5;
  CKNavBarUnifiedCallButton *v6;
  CKNavBarUnifiedCallButton *unifiedCallButton;

  if (!self->_unifiedCallButton && !CKIsRunningInMacCatalyst())
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBusinessChat");

    if ((v5 & 1) == 0)
    {
      +[CKNavBarUnifiedCallButton buttonWithType:](CKNavBarUnifiedCallButton, "buttonWithType:", 1);
      v6 = (CKNavBarUnifiedCallButton *)objc_claimAutoreleasedReturnValue();
      unifiedCallButton = self->_unifiedCallButton;
      self->_unifiedCallButton = v6;

      -[CKNavBarUnifiedCallButton setDelegate:](self->_unifiedCallButton, "setDelegate:", self);
    }
  }
  return self->_unifiedCallButton;
}

- (id)persistentMenuButton
{
  void *v2;
  void *v3;

  -[CKNavbarCanvasViewController persistentMenuManager](self, "persistentMenuManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_TtC7ChatKit29CKNavBarPersistentMenuManager)persistentMenuManager
{
  void *v3;
  void *v4;
  int v5;
  _TtC7ChatKit29CKNavBarPersistentMenuManager *v6;
  _TtC7ChatKit29CKNavBarPersistentMenuManager *persistentMenuManager;
  _TtC7ChatKit29CKNavBarPersistentMenuManager *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_persistentMenuManager && !CKIsRunningInMacCatalyst())
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isChatBot");

    if (v5)
    {
      v6 = -[CKNavBarPersistentMenuManager initWithDelegate:]([_TtC7ChatKit29CKNavBarPersistentMenuManager alloc], "initWithDelegate:", self);
      persistentMenuManager = self->_persistentMenuManager;
      self->_persistentMenuManager = v6;

      v8 = self->_persistentMenuManager;
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentMenu");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavBarPersistentMenuManager setupWithPersistentMenu:](v8, "setupWithPersistentMenu:", v11);

    }
  }
  return self->_persistentMenuManager;
}

- (UIBarButtonItem)detailsBarButton
{
  void *v3;
  int v4;
  UIBarButtonItem *detailsBarButton;
  id v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  UIBarButtonItem *v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useMacToolbar");

  if (v4)
  {
    detailsBarButton = self->_detailsBarButton;
    if (!detailsBarButton)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEA380]);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "macToolbarDetailsImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIBarButtonItem *)objc_msgSend(v6, "initWithImage:style:target:action:", v8, 0, self, sel__buttonPressed_);
      v10 = self->_detailsBarButton;
      self->_detailsBarButton = v9;

      detailsBarButton = self->_detailsBarButton;
    }
    v11 = detailsBarButton;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)setDetailsBarButton:(id)a3
{
  void *v5;
  UIBarButtonItem **p_detailsBarButton;
  UIBarButtonItem *detailsBarButton;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;

  v9 = (UIBarButtonItem *)a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "useMacToolbar"))
  {

LABEL_7:
    v8 = v9;
    goto LABEL_8;
  }
  p_detailsBarButton = &self->_detailsBarButton;
  detailsBarButton = self->_detailsBarButton;

  v8 = v9;
  if (detailsBarButton != v9)
  {
    if (*p_detailsBarButton)
    {
      -[UIBarButtonItem setTarget:](*p_detailsBarButton, "setTarget:", 0);
      -[UIBarButtonItem setAction:](*p_detailsBarButton, "setAction:", 0);
    }
    objc_storeStrong((id *)&self->_detailsBarButton, a3);
    -[UIBarButtonItem setTarget:](*p_detailsBarButton, "setTarget:", self);
    -[UIBarButtonItem setAction:](*p_detailsBarButton, "setAction:", sel__buttonPressed_);
    goto LABEL_7;
  }
LABEL_8:

}

- (UIButton)doneButton
{
  UIButton *doneButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;

  doneButton = self->_doneButton;
  if (!doneButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 102);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_doneButton;
    self->_doneButton = v4;

    v6 = self->_doneButton;
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
    doneButton = self->_doneButton;
  }
  return doneButton;
}

- (void)_addUserDidTapNavigationBarRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!CKIsRunningInMacCatalyst())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__userDidTapNavigationBar);
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);
    objc_msgSend(v5, "addGestureRecognizer:", v4);

  }
}

- (void)conversationIdentityViewTapped:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navbarCanvasViewController:didTapView:", self, v6);

  }
}

- (void)buttonRequestsStartFaceTimeVideo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (IMDeviceIsGreenTea()
      && (-[CKNavbarCanvasViewController conversation](self, "conversation"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "chat"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isGroupChat"),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "initiateTUDialRequestWithVideoEnabled:", 1);
    }
    else
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "initiateTUConversationWithVideoEnabled:", 1);
    }

  }
}

- (void)buttonRequestsStartFaceTimeAudio:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initiateTUConversationWithVideoEnabled:", 0);

  }
}

- (void)buttonRequestsStartTelephonyCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10)
    goto LABEL_4;
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recipient");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[CKNavbarCanvasViewController contactsManager](self, "contactsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startCommunicationForEntity:action:address:", v4, 3, v9);

LABEL_4:
  }

}

- (void)button:(id)a3 requestsJoinActiveCallWithVideoEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int IsGreenTea;
  void *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "joinExistingTUConversation");
    }
    else
    {
      IsGreenTea = IMDeviceIsGreenTea();
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      if (IsGreenTea)
        objc_msgSend(v13, "initiateTUDialRequestWithVideoEnabled:", v4);
      else
        objc_msgSend(v13, "initiateTUConversationWithVideoEnabled:", v4);
    }

  }
}

- (void)button:(id)a3 requestsStartFaceTimeWithScreenShareType:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initiateTUConversationWithScreenShareType:", a4);

  }
}

- (void)buttonRequestsOpenJoinedCall:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversation");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "state"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeShowInCallUIURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      TUOpenURL();
    }
    else
    {
      -[CKNavbarCanvasViewController conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "joinExistingTUConversation");

    }
  }
}

- (void)buttonWidthDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[CKNavbarCanvasViewController unifiedCallButton](self, "unifiedCallButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)dismissModal
{
  -[CKNavbarCanvasViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showContactCardForEntity:(id)a3 address:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D397A8];
  objc_msgSend(v6, "defaultIMHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isCNContactAKnownContact:", v12);

  if (v13)
  {
    -[CKNavbarCanvasViewController suggestionsEnabledContactStore](self, "suggestionsEnabledContactStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unifiedContactWithIdentifier:keysToFetch:error:", v16, v9, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v6, "cnContactWithKeys:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_6;
  }
  objc_msgSend(v6, "defaultIMHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v19 = objc_msgSend(v7, "_appearsToBePhoneNumber");
  v20 = (id *)MEMORY[0x1E0C967C0];
  if (!v19)
    v20 = (id *)MEMORY[0x1E0C966A8];
  v21 = *v20;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShouldShowLinkedContacts:", 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "identifierForKey:withDestination:", v21, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "highlightPropertyWithKey:identifier:", v21, v24);

  -[CKNavbarCanvasViewController suggestionsEnabledContactStore](self, "suggestionsEnabledContactStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContactStore:", v25);

  objc_msgSend(v22, "contentViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAllowsContactBlocking:", 1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "setEdgesForExtendedLayout:", 0);
  -[CKNavbarCanvasViewController proxyNavigationController](self, "proxyNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pushViewController:animated:", v22, 1);

}

- (CNContactStore)suggestionsEnabledContactStore
{
  CNContactStore *suggestionsEnabledContactStore;
  void *v4;
  uint64_t v5;
  CNContactStore *v6;
  CNContactStore *v7;

  suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  if (!suggestionsEnabledContactStore)
  {
    v4 = (void *)MEMORY[0x1E0C97298];
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
      v5 = 3;
    else
      v5 = 1;
    objc_msgSend(v4, "storeWithOptions:", v5);
    v6 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionsEnabledContactStore;
    self->_suggestionsEnabledContactStore = v6;

    suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  }
  return suggestionsEnabledContactStore;
}

- (int64_t)_unreadCount
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CKNavbarCanvasViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v6, "unreadCountForCurrentFilterModeForNavbarCanvasViewController:", self);

    }
    else
    {
      v3 = 0;
    }
  }
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int64_t)v3 - objc_msgSend(v7, "unreadCount");

  return v8;
}

- (void)_updateUnreadCountForBackbuttonView:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKNavbarCanvasViewController setUnreadCountTitleColor](self, "setUnreadCountTitleColor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "__ck_localizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackButtonTitle:", v6);

  -[CKNavbarCanvasViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_chatUnreadCountDidChange:(id)a3
{
  -[CKNavbarCanvasViewController _updateUnreadCountForBackbuttonView:](self, "_updateUnreadCountForBackbuttonView:", -[CKNavbarCanvasViewController _unreadCount](self, "_unreadCount", a3));
}

- (void)setUnreadCountTitleColor
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBusinessConversation");

  -[CKNavbarCanvasViewController backButtonView](self, "backButtonView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryBrandColorForBusinessChat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleLabelColor:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleLabelColor:", v5);
  }

}

- (void)_contactPhotosEnabledChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CKNavbarCanvasViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", v5);

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController conversationIdentityView](self, "conversationIdentityView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
      -[CKNavbarCanvasViewController setDefaultLabel:](self, "setDefaultLabel:", 0);
  }
  else
  {
    -[CKNavbarCanvasViewController setConversationIdentityView:](self, "setConversationIdentityView:", 0);
  }
  -[CKNavbarCanvasViewController navbarTitle](self, "navbarTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController updateTitle:animated:](self, "updateTitle:animated:", v13, 0);

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

}

- (void)refreshAudioButtonTargetAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonViewFaceTimeAudio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContextMenuIsPrimary:", 0);

    goto LABEL_5;
  }
  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNavbarCanvasViewController contactsManager](self, "contactsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldAlwaysShowCallMenuForEntity:", v7);

  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonViewFaceTimeAudio");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContextMenuIsPrimary:", v9);

  if (!(_DWORD)v9)
  {
LABEL_5:
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buttonViewFaceTimeAudio");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__facetimeAudioButtonTapped_, 64);
    goto LABEL_6;
  }
  -[CKNavbarCanvasViewController canvasView](self, "canvasView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buttonViewFaceTimeAudio");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 64);
LABEL_6:

}

- (void)_facetimeAudioButtonTapped:(id)a3
{
  id v4;

  -[CKNavbarCanvasViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navbarCanvasViewControllerFaceTimeAudioButtonTapped:", self);

}

- (void)_facetimeVideoButtonTapped:(id)a3
{
  id v4;

  -[CKNavbarCanvasViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navbarCanvasViewControllerFaceTimeVideoButtonTapped:", self);

}

- (void)_infoButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navbarCanvasViewController:infoButtonTapped:", self, v4);

}

- (void)_buttonPressed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navbarCanvasViewController:didTapView:", self, v4);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CKNavbarCanvasViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavbarCanvasViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();
      v12 = CFSTR("NO");
      if ((v11 & 1) != 0)
        v12 = CFSTR("YES");
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Delegate (%@), respondsToSelector (%@)", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (BOOL)shouldConfigureForJunkModal
{
  CKNavbarCanvasViewController *v2;
  void *v3;

  v2 = self;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldConfigureForJunkModalInNavbarCanvasViewController:", v2);

  return (char)v2;
}

- (BOOL)splitViewControllerIsCollapsed
{
  void *v2;
  void *v3;
  char v4;

  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  return v4;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  void *v2;
  char v3;

  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseMinimumSafeAreas");

  return v3;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDirectionalEdgeInsets result;

  -[CKNavbarCanvasViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemMinimumLayoutMarginsForViewController:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (void)_handleAllowedByScreenTimeChatChanged:(id)a3
{
  void *v4;
  id v5;

  -[CKNavbarCanvasViewController conversation](self, "conversation", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController navBarTitleFromConversation:](self, "navBarTitleFromConversation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController updateTitle:animated:](self, "updateTitle:animated:", v4, 1);

}

- (void)persistentMenuManager:(id)a3 selectedChipAction:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navbarCanvasViewController:selectedChipAction:", self, v8);

  }
}

- (void)_handleServiceChangedNotification:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCarrierPigeonEnabled");

  if (v5)
  {
    -[CKNavbarCanvasViewController traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController _rightItemViewForTraitCollection:](self, "_rightItemViewForTraitCollection:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController canvasView](self, "canvasView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightItemView:", v6);

  }
}

- (void)persistentMenuManager:(id)a3 selectedSuggestedReply:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKNavbarCanvasViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKNavbarCanvasViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navbarCanvasViewController:selectedSuggestedReply:", self, v8);

  }
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[CKNavbarCanvasViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavbarCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8 == v5)
  {
    -[CKNavbarCanvasViewController setDefaultLabel:](self, "setDefaultLabel:", 0);
    -[CKNavbarCanvasViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavbarCanvasViewController _initializeForTraitCollection:](self, "_initializeForTraitCollection:", v7);

    v6 = v8;
  }

}

- (id)_KTTitleIconAttributedString
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v31;

  -[CKNavbarCanvasViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38E20]);

  if (v5)
  {
    -[CKNavbarCanvasViewController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v8 = objc_msgSend(v7, "keyTransparencyStatusForAffectedHandles:", &v31);

    v9 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v9, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    v10 = 0;
    if (v8 <= 0xE)
    {
      if (((1 << v8) & 0x748F) != 0)
      {
LABEL_10:

        return v10;
      }
      if (((1 << v8) & 0xA60) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("WarningHeader");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavbarCanvasViewController defaultLabel](self, "defaultLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("VerifiedHeader");
      }
      objc_msgSend(v11, "setAccessibilityIdentifier:", v13);

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "noAvatarTitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pointSize");
    v19 = v18;

    objc_msgSend(v15, "size");
    v21 = v20;
    objc_msgSend(v15, "size");
    v23 = v19 * (v21 / v22);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "noAvatarTitleFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "capHeight");
    v27 = (v26 - v19) * 0.5;

    objc_msgSend(v9, "setBounds:", 0.0, v27, v23, v19);
    objc_msgSend(v9, "setImage:", v15);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" "));
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appendAttributedString:", v29);

    v10 = (void *)objc_msgSend(v28, "copy");
    goto LABEL_10;
  }
  v10 = 0;
  return v10;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (CKNavbarCanvasViewControllerDelegate)delegate
{
  return (CKNavbarCanvasViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setBackButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonView, a3);
}

- (void)setDetailsButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailsButton, a3);
}

- (void)setUnifiedCallButton:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedCallButton, a3);
}

- (UIButton)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
  objc_storeStrong((id *)&self->_callButton, a3);
}

- (void)setEditCancelButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_editCancelButtonView, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void)setConversationIdentityView:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIdentityView, a3);
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (BOOL)locationLabelHidden
{
  return self->_locationLabelHidden;
}

- (BOOL)canShowBackButtonView
{
  return self->_canShowBackButtonView;
}

- (BOOL)shouldShowDoneButton
{
  return self->_shouldShowDoneButton;
}

- (void)setShouldShowDoneButton:(BOOL)a3
{
  self->_shouldShowDoneButton = a3;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (int64_t)navBarContext
{
  return self->_navBarContext;
}

- (NSString)navbarTitle
{
  return self->_navbarTitle;
}

- (void)setNavbarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_navbarTitle, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void)setDefaultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLabel, a3);
}

- (void)setPersistentMenuManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistentMenuManager, a3);
}

- (BOOL)hasConfiguredCallButtonAudioRouteActions
{
  return self->_hasConfiguredCallButtonAudioRouteActions;
}

- (void)setHasConfiguredCallButtonAudioRouteActions:(BOOL)a3
{
  self->_hasConfiguredCallButtonAudioRouteActions = a3;
}

- (UINavigationController)proxyNavigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_proxyNavigationController);
}

- (void)setProxyNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_proxyNavigationController, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (int64_t)indicatorType
{
  return self->_indicatorType;
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, a3);
}

- (BOOL)shouldDisplayParticipantLocationWhenAvailable
{
  return self->_shouldDisplayParticipantLocationWhenAvailable;
}

- (void)setShouldDisplayParticipantLocationWhenAvailable:(BOOL)a3
{
  self->_shouldDisplayParticipantLocationWhenAvailable = a3;
}

- (IMFindMyLocation)locationToDisplay
{
  return self->_locationToDisplay;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (NSDictionary)modernScreenSharingCapabilities
{
  return self->_modernScreenSharingCapabilities;
}

- (void)setModernScreenSharingCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_locationToDisplay, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_destroyWeak((id *)&self->_proxyNavigationController);
  objc_storeStrong((id *)&self->_persistentMenuManager, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_navbarTitle, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_conversationIdentityView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_editCancelButtonView, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_unifiedCallButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_backButtonView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_detailsBarButton, 0);
}

@end
