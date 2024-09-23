@implementation CKBrowserTransitionCoordinator

- (BOOL)wasCurrentBrowserExpanded
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wasExpandedPresentation");

  return v6;
}

- (BOOL)isHostingRemoteKeyboardView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  char isKindOfClass;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v4, "firstResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)usePresentationWindowDuringTransition
{
  return !CKIsRunningInMacCatalyst()
      && !IMIsRunningIniMessageAppsViewService()
      && !IMIsRunningIniMessageAppExtension()
      && CKIsRunningInInCallService() == 0;
}

- (BOOL)shouldPresentModalFromPresentingViewController
{
  return CKIsRunningInMacCatalyst() != 0;
}

- (id)modalPresentationViewController
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CKBrowserTransitionCoordinator transitionViewController](self, "transitionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBrowserTransitionCoordinator shouldPresentModalFromPresentingViewController](self, "shouldPresentModalFromPresentingViewController"))
  {
    -[CKBrowserTransitionCoordinator presentingViewController](self, "presentingViewController");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v3 = (void *)v4;
    return v3;
  }
  if (-[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition"))
  {
    -[CKBrowserTransitionCoordinator modalAppWindow](self, "modalAppWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = v5;
    goto LABEL_5;
  }
  return v3;
}

- (id)transitionViewController
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition"))
  {
    goto LABEL_4;
  }
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    goto LABEL_4;
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionsPresentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__ck_topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_4:
    -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rootViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

- (BOOL)updateBrowserSessionForPlugin:(id)a3 datasource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  BOOL v23;
  int v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37588]);

  -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserTransitionCoordinator updateSupportedInterfaceOrientationsOfAppWindow:forPlugin:](self, "updateSupportedInterfaceOrientationsOfAppWindow:forPlugin:", v10, v6);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v12;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "updateBrowserSessionForPlugin - %@", (uint8_t *)&v25, 0xCu);

    }
  }
  -[CKBrowserTransitionCoordinator conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipientStrings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "shouldShowForRecipients:", v14);

  if (!v15)
    goto LABEL_18;
  if ((v9 & 1) == 0)
  {
    if (!-[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer"))
    {
      -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewControllerForPluginIdentifier:dataSource:", v22, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = -[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer");
        if (v20 > 3)
          v21 = 0;
        else
          v21 = off_1E2759070[v20];
        v25 = 138412546;
        v26 = v19;
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Request to update browser session for plugin %@ denied as %@ currently has lock on browser", (uint8_t *)&v25, 0x16u);

      }
    }
LABEL_18:
    v23 = 0;
    goto LABEL_19;
  }
  -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "digitalTouchViewControllerWithDataSource:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  -[CKBrowserTransitionCoordinator updateBrowser:](self, "updateBrowser:", v17);
  v23 = 1;
LABEL_19:

  return v23;
}

- (void)updateBrowser:(id)a3
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
  void *v14;
  int v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  id v40;

  v40 = a3;
  -[CKBrowserTransitionCoordinator sendDelegate](self, "sendDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setSendDelegate:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senderIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setSender:", v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recipientStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "setRecipients:", v8);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setConversationID:", v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "engramID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setConversationEngramID:", v14);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v40, "isLoaded") ^ 1;
  else
    v15 = 0;
  -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 == v40)
    v17 = v15;
  else
    v17 = 1;

  -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (v17)
    {
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[CKBrowserTransitionCoordinator delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "browserTransitionCoordinator:browserWillBecomeInactive:", self, v22);

      }
    }
  }
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "browserTransitionCoordinator:preferredSizeForBrowser:", self, v40);
    v27 = v26;
    v29 = v28;

    objc_msgSend(v40, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    if ((v27 != *MEMORY[0x1E0C9D820] || v29 != *(double *)(MEMORY[0x1E0C9D820] + 8)) && (v27 != v36 || v29 != v38))
    {
      objc_msgSend(v40, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFrame:", v32, v34, v27, v29);

    }
  }
  if (v17
    && (objc_opt_respondsToSelector() & 1) != 0
    && !-[CKBrowserTransitionCoordinator underTest](self, "underTest"))
  {
    objc_msgSend(v40, "loadRemoteViewWithCompletion:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v40, "prepareForDisplay");
  -[CKBrowserTransitionCoordinator setCurrentBrowser:](self, "setCurrentBrowser:", v40);

}

- (id)requestOwnershipOfBrowserForConsumer:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer")
    && -[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer") != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 > 3)
          v7 = 0;
        else
          v7 = off_1E2759070[a3];
        v8 = -[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer");
        if (v8 > 3)
          v9 = 0;
        else
          v9 = off_1E2759070[v8];
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%@ tried to take browser ownership but %@ is the current owner", (uint8_t *)&v11, 0x16u);
      }

    }
    v5 = 0;
  }
  else
  {
    -[CKBrowserTransitionCoordinator setCurrentConsumer:](self, "setCurrentConsumer:", a3);
    -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)releaseOwnershipOfBrowserForConsumer:(int64_t)a3
{
  if (-[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer") == a3)
    -[CKBrowserTransitionCoordinator setCurrentConsumer:](self, "setCurrentConsumer:", 0);
}

- (BOOL)_shouldRestrictToPortraitOrientationForPlugin:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v3 = (void *)MEMORY[0x1E0CEA508];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37568]);

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D37588]);
  if (v7 == 1)
    return 0;
  else
    return v9 | v11;
}

- (void)updateSupportedInterfaceOrientationsOfAppWindow:(id)a3 forPlugin:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v8;
    objc_msgSend(v7, "setRestrictedToPortraitOrientation:", -[CKBrowserTransitionCoordinator _shouldRestrictToPortraitOrientationForPlugin:](self, "_shouldRestrictToPortraitOrientationForPlugin:", v6));

  }
}

- (void)transitionCurrentBrowserToExpandedPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat x;
  double v16;
  CGFloat MaxY;
  double v18;
  CGFloat width;
  double v20;
  CGFloat height;
  NSObject *v22;
  unint64_t v23;
  __CFString *v24;
  void *v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL8 v52;
  CKPresentationControllerWindow *v53;
  CKPresentationControllerWindow *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  CKFullscreenBrowserNavigationController *v59;
  CKExpandedAppViewController *v60;
  void *v61;
  void *v62;
  CKExpandedAppViewController *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CKFullscreenBrowserNavigationController *v68;
  id v69;
  CKExpandedAppViewController *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  CKBrowserTransitionCoordinator *v82;
  CKExpandedAppViewController *v83;
  CKFullscreenBrowserNavigationController *v84;
  id v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  BOOL v90;
  _QWORD aBlock[4];
  id v92;
  CKBrowserTransitionCoordinator *v93;
  id v94;
  CKExpandedAppViewController *v95;
  uint8_t buf[4];
  __CFString *v97;
  uint64_t v98;
  CGRect v99;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[CKBrowserTransitionCoordinator isExpanded](self, "isExpanded"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Fullscreen transition did not occur, already fullscreen", buf, 2u);
      }

    }
  }
  else
  {
    v78 = v5;
    -[CKBrowserTransitionCoordinator requestOwnershipOfBrowserForConsumer:](self, "requestOwnershipOfBrowserForConsumer:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "beginSuppressingAppearanceMethods");
      objc_msgSend(v7, "view");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        objc_msgSend(v12, "convertRect:toView:", 0);
        x = v14;
        MaxY = v16;
        width = v18;
        height = v20;

      }
      else
      {
        objc_msgSend(v76, "frame");
        x = v99.origin.x;
        width = v99.size.width;
        height = v99.size.height;
        MaxY = CGRectGetMaxY(v99);
        v75 = 0;
      }
      v77 = -[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition");
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      v27 = height;
      v28 = width;
      v29 = MaxY;
      v30 = x;
      if ((v26 & 1) != 0)
      {
        -[CKBrowserTransitionCoordinator delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:", self);
        v30 = v32;
        v29 = v33;
        v28 = v34;
        v27 = v35;

      }
      -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", v30, v29, v28, v27);
      if (v77)
      {
        -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setHidden:", 1);

          -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "rootViewController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "dismissViewControllerAnimated:completion:", 0, 0);

          -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setRootViewController:", 0);

          -[CKBrowserTransitionCoordinator setAppWindow:](self, "setAppWindow:", 0);
        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "viewWillTransitionToExpandedPresentation");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke;
      aBlock[3] = &unk_1E274CC10;
      v41 = v7;
      v92 = v41;
      v93 = self;
      v94 = v78;
      v73 = _Block_copy(aBlock);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v41, "balloonPlugin");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "identifier");
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v97 = v44;
          _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_INFO, "Fullscreen transition initiated for %@", buf, 0xCu);

        }
      }
      objc_msgSend(v41, "view", v73);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "window");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v77)
      {
        -[CKBrowserTransitionCoordinator presentingViewController](self, "presentingViewController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "view");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "window");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "windowScene");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "balloonPlugin");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[CKBrowserTransitionCoordinator _shouldRestrictToPortraitOrientationForPlugin:](self, "_shouldRestrictToPortraitOrientationForPlugin:", v51);

        v53 = [CKPresentationControllerWindow alloc];
        if (v50)
        {
          objc_msgSend(v49, "bounds");
          v54 = -[CKPresentationControllerWindow initWithWindowScene:frame:allowsRotation:restrictedToPortraitOrientation:](v53, "initWithWindowScene:frame:allowsRotation:restrictedToPortraitOrientation:", v50, 0, v52);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "keyWindow");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "bounds");
          v54 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:restrictedToPortraitOrientation:](v53, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, v52);

          v46 = v56;
        }

        -[CKPresentationControllerWindow addSubview:](v54, "addSubview:", v75);
        -[CKPresentationControllerWindow bounds](v54, "bounds");
        objc_msgSend(v75, "setFrame:");
        -[CKPresentationControllerWindow setHidden:](v54, "setHidden:", 0);

        v55 = 0;
        v46 = v54;
      }
      else
      {
        v55 = 5;
      }
      -[CKBrowserTransitionCoordinator setAppWindow:](self, "setAppWindow:", v46);
      objc_msgSend(v41, "willMoveToParentViewController:", 0);
      objc_msgSend(v41, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "removeFromSuperview");

      objc_msgSend(v41, "removeFromParentViewController");
      v59 = -[CKFullscreenBrowserNavigationController initWithNavigationBarClass:toolbarClass:]([CKFullscreenBrowserNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
      v60 = [CKExpandedAppViewController alloc];
      -[CKBrowserTransitionCoordinator conversation](self, "conversation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "balloonPlugin");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[CKExpandedAppViewController initWithConversation:plugin:](v60, "initWithConversation:plugin:", v61, v62);

      -[CKExpandedAppViewController setContentViewController:](v63, "setContentViewController:", v41);
      objc_msgSend(v41, "view");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setAlpha:", 1.0);

      -[CKExpandedAppViewController setDelegate:](v63, "setDelegate:", self);
      v95 = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullscreenBrowserNavigationController setViewControllers:](v59, "setViewControllers:", v65);

      -[CKFullscreenBrowserNavigationController setModalPresentationStyle:](v59, "setModalPresentationStyle:", v55);
      -[CKBrowserTransitionCoordinator setExpandedAppViewController:](self, "setExpandedAppViewController:", v63);
      -[CKFullscreenBrowserNavigationController view](v59, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setHidden:", 1);

      -[CKBrowserTransitionCoordinator transitionViewController](self, "transitionViewController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_70;
      v79[3] = &unk_1E2759000;
      v90 = v77;
      v80 = v46;
      v81 = v75;
      v82 = self;
      v83 = v63;
      v86 = x;
      v87 = MaxY;
      v88 = width;
      v89 = height;
      v84 = v59;
      v85 = v74;
      v68 = v59;
      v69 = v74;
      v70 = v63;
      v71 = v75;
      v72 = v46;
      objc_msgSend(v67, "presentViewController:animated:completion:", v68, 0, v79);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = -[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer");
        if (v23 > 3)
          v24 = 0;
        else
          v24 = off_1E2759070[v23];
        *(_DWORD *)buf = 138412290;
        v97 = v24;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Fullscreen transition failed, %@ is current browser owner", buf, 0xCu);
      }

    }
    v5 = v78;
  }

}

uint64_t __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t result;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "viewDidTransitionToExpandedPresentation");
  objc_msgSend(*(id *)(a1 + 40), "setExpanded:withReason:", 1, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "endSuppressingAppearanceMethods");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateContentOverlayInsetsForSelfAndChildren");
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:withReason:", *(_QWORD *)(a1 + 40), 0);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2;
  v10[3] = &unk_1E274A208;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v10);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "balloonPlugin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Fullscreen transition complete for %@", buf, 0xCu);

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "expandedAppViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadInputViews");

}

void __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_70(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  if (*(_BYTE *)(a1 + 112))
    objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:withReason:", *(_QWORD *)(a1 + 48), 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appGrabberForBrowserTransitionCoordinator:", *(_QWORD *)(a1 + 48));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v13;
  }
  else
  {
    v8 = 0;
  }
  v14 = v8;
  objc_msgSend(*(id *)(a1 + 56), "animateBrowserViewFromSourceRect:interactive:grabberView:completion:", 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 64), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  if (*(_BYTE *)(a1 + 112))
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2_75;
    v15[3] = &unk_1E274A108;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 48);
    v16 = v11;
    v17 = v12;
    objc_msgSend(v10, "performWithoutAnimation:", v15);

  }
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");

}

uint64_t __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2_75(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setWindowLevel:", *MEMORY[0x1E0CEBE28]);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreviousKeyWindow:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "makeKeyWindow");
}

- (void)transitionCurrentBrowserToCollapsedPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(void);
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[5];
  id v18;
  BOOL v19;
  _QWORD aBlock[4];
  id v21;
  CKBrowserTransitionCoordinator *v22;
  void (**v23)(_QWORD);
  BOOL v24;

  v5 = (void (**)(_QWORD))a4;
  if (-[CKBrowserTransitionCoordinator isExpanded](self, "isExpanded"))
  {
    -[CKBrowserTransitionCoordinator releaseOwnershipOfBrowserForConsumer:](self, "releaseOwnershipOfBrowserForConsumer:", 2);
    -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonPlugin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37588]);

    if (v9)
      objc_msgSend(v6, "setBalloonPluginDataSource:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "beginSuppressingAppearanceMethods");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "viewWillTransitionToCompactPresentation");
    v10 = -[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition");
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E274D200;
    v21 = v6;
    v22 = self;
    v23 = v5;
    v24 = v10;
    v12 = v6;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_4;
    v17[3] = &unk_1E2755B00;
    v17[4] = self;
    v18 = _Block_copy(aBlock);
    v19 = v10;
    v13 = v18;
    v14 = (void (**)(void))_Block_copy(v17);
    v14[2]();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Collapse transition did not occur, already collapsed", v16, 2u);
      }

    }
    if (v5)
      v5[2](v5);
  }

}

void __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  char v29;
  _QWORD v30[4];
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "setExpanded:withReason:", 0, 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "viewDidTransitionToCompactPresentation");
  objc_msgSend(*(id *)(a1 + 40), "expandedAppViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "appWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(*(id *)(a1 + 40), "appWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateContentOverlayInsetsForSelfAndChildren");
  objc_msgSend(*(id *)(a1 + 40), "appWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bringSubviewToFront:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "endSuppressingAppearanceMethods");
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "browserTransitionCoordinatorDidCollapseOrDismiss:withReason:", *(_QWORD *)(a1 + 40), 1);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reinsertAppGrabberViewForBrowserTransitionCoordinator:", *(_QWORD *)(a1 + 40));

  }
  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
    (*(void (**)(void))(v24 + 16))();
  v25 = (void *)MEMORY[0x1E0CEABB0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_2;
  v30[3] = &unk_1E274A208;
  v31 = v6;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_3;
  v28[3] = &unk_1E2756068;
  v29 = *(_BYTE *)(a1 + 56);
  v28[4] = *(_QWORD *)(a1 + 40);
  v26 = v6;
  objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 0, v30, v28, 0.3, 0.1);
  objc_msgSend(*(id *)(a1 + 40), "setCachedCompactFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(a1 + 40), "setExpandedAppViewController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reloadInputViews");

}

uint64_t __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appWindow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "setExpandedAppViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "transitionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootViewController:", 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setAppWindow:", 0);
}

void __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "previousKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeKeyWindow");

  objc_msgSend(*(id *)(a1 + 32), "setPreviousKeyWindow:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "browserTransitionCoordinatorWillCollapseOrDismiss:withReason:", *(_QWORD *)(a1 + 32), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appGrabberForBrowserTransitionCoordinator:", *(_QWORD *)(a1 + 32));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "expandedAppViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedCompactFrame");
  objc_msgSend(v9, "animateBrowserViewToTargetRect:grabberView:completion:", v13, *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "appWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationControllerWindowLevel");
    objc_msgSend(v10, "setWindowLevel:");

  }
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadInputViews");

}

- (void)dismissCurrentExpandedBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[16];
  _QWORD aBlock[4];
  id v23;
  CKBrowserTransitionCoordinator *v24;
  void (**v25)(_QWORD);
  BOOL v26;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[CKBrowserTransitionCoordinator isExpanded](self, "isExpanded"))
  {
    -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserTransitionCoordinator releaseOwnershipOfBrowserForConsumer:](self, "releaseOwnershipOfBrowserForConsumer:", 2);
    v8 = -[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKBrowserTransitionCoordinator_dismissCurrentExpandedBrowserAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E274D200;
    v9 = v7;
    v23 = v9;
    v24 = self;
    v26 = v8;
    v25 = v6;
    v10 = _Block_copy(aBlock);
    if (v8)
    {
      -[CKBrowserTransitionCoordinator appWindow](self, "appWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationControllerWindowLevel");
      objc_msgSend(v11, "setWindowLevel:");

    }
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "browserTransitionCoordinatorWillCollapseOrDismiss:withReason:", self, 3);

    }
    -[CKBrowserTransitionCoordinator expandedAppViewController](self, "expandedAppViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hideDimmingView");

    -[CKBrowserTransitionCoordinator previousKeyWindow](self, "previousKeyWindow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "makeKeyWindow");

    -[CKBrowserTransitionCoordinator setPreviousKeyWindow:](self, "setPreviousKeyWindow:", 0);
    -[CKBrowserTransitionCoordinator transitionViewController](self, "transitionViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissViewControllerAnimated:completion:", v4, v10);

    -[CKBrowserTransitionCoordinator setExpandedAppViewController:](self, "setExpandedAppViewController:", 0);
    -[CKBrowserTransitionCoordinator presentingViewController](self, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadInputViews");

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Collapse transition did not occur, already collapsed", v21, 2u);
      }

    }
    if (v6)
      v6[2](v6);
  }

}

uint64_t __83__CKBrowserTransitionCoordinator_dismissCurrentExpandedBrowserAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "setExpanded:withReason:", 0, 3);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "appWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 40), "appWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "appWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRootViewController:", 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "setAppWindow:", 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "browserTransitionCoordinatorDidCollapseOrDismiss:withReason:", *(_QWORD *)(a1 + 40), 3);

  }
  objc_msgSend(*(id *)(a1 + 40), "setCachedCompactFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reinsertAppGrabberViewForBrowserTransitionCoordinator:", *(_QWORD *)(a1 + 40));

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(void))(v13 + 16))();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "deferredForceTearDownRemoteView");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "forceTearDownRemoteView");
  return result;
}

- (CGSize)_clampedModalContentSizeForSize:(CGSize)result
{
  if (result.width == 0.0)
    result.width = 624.0;
  if (result.height == 0.0)
    result.height = 746.0;
  return result;
}

- (void)presentPluginFullScreenModal:(id)a3 preferredContentSize:(CGSize)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[CKBrowserTransitionCoordinator presentPluginFullScreenModal:datasource:preferredContentSize:animated:completion:](self, "presentPluginFullScreenModal:datasource:preferredContentSize:animated:completion:", a3, 0, a5, a6, a4.width, a4.height);
}

- (void)presentPluginFullScreenModal:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5 animated:(BOOL)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  CKFullscreenBrowserNavigationController *v27;
  CKFullScreenCardAppViewController *v28;
  void *v29;
  CKFullScreenCardAppViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  _BOOL8 v40;
  CKPresentationControllerWindow *v41;
  void *v42;
  void *v43;
  CKPresentationControllerWindow *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  CKFullscreenBrowserNavigationController *v52;
  id v53;
  void (**v54)(_QWORD);
  void *v55;
  char v56;
  void *v57;
  void *v58;
  BOOL v59;
  int v60;
  id v61;
  id v62;
  _QWORD aBlock[4];
  id v64;
  CKFullscreenBrowserNavigationController *v65;
  id v66;
  __int128 v67;
  BOOL v68;
  char v69;
  CKFullScreenCardAppViewController *v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  height = a5.height;
  width = a5.width;
  v73 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v62 = a4;
  v61 = a7;
  v14 = -[CKBrowserTransitionCoordinator usePresentationWindowDuringTransition](self, "usePresentationWindowDuringTransition");
  if (-[CKBrowserTransitionCoordinator isPresentingFullScreenModal](self, "isPresentingFullScreenModal"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Already presenting extension in full screen modal.", buf, 2u);
      }

    }
    goto LABEL_54;
  }
  if (v13)
  {
    v59 = a6;
    v16 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "browserClass")), "initWithBalloonPlugin:dataSource:", v13, v62);
    objc_msgSend(v16, "setIsPrimaryViewController:", 0);
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v13, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v17, "isEqualToString:", v18);

    }
    else
    {
      v60 = 0;
    }
    if (+[CKUtilities isIpad](CKUtilities, "isIpad"))
    {
      objc_msgSend(v13, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

    }
    else
    {
      v23 = 0;
    }
    if (+[CKUtilities isIpad](CKUtilities, "isIpad"))
    {
      objc_msgSend(v13, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

    }
    else
    {
      v26 = 0;
    }
    if (v60)
      objc_msgSend(v16, "setPreferredContentSize:", 580.0, 548.0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "loadRemoteViewWithCompletion:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "setCurrentBrowserConsumer:", 3);
    -[CKBrowserTransitionCoordinator setCurrentModalBrowser:](self, "setCurrentModalBrowser:", v16);
    v27 = -[CKFullscreenBrowserNavigationController initWithNavigationBarClass:toolbarClass:]([CKFullscreenBrowserNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
    -[CKFullscreenBrowserNavigationController setModalInPresentation:](v27, "setModalInPresentation:", v23 ^ 1u);
    v28 = [CKFullScreenCardAppViewController alloc];
    -[CKBrowserTransitionCoordinator conversation](self, "conversation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CKFullScreenCardAppViewController initWithConversation:plugin:](v28, "initWithConversation:plugin:", v29, v13);

    -[CKFullScreenCardAppViewController setContentViewController:](v30, "setContentViewController:", v16);
    -[CKFullScreenCardAppViewController setDelegate:](v30, "setDelegate:", self);
    -[CKBrowserTransitionCoordinator sendDelegate](self, "sendDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenCardAppViewController setSendDelegate:](v30, "setSendDelegate:", v31);

    v70 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullscreenBrowserNavigationController setViewControllers:](v27, "setViewControllers:", v32);

    if (-[CKFullScreenCardAppViewController conformsToProtocol:](v30, "conformsToProtocol:", &unk_1EE163158))
    {
      -[CKFullscreenBrowserNavigationController presentationController](v27, "presentationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:", v30);

      v34 = 640.0;
      v35 = 548.0;
      if (v60)
        v34 = 580.0;
      else
        v35 = 640.0;
      if (((v60 | v26) & 1) == 0)
        -[CKBrowserTransitionCoordinator _clampedModalContentSizeForSize:](self, "_clampedModalContentSizeForSize:", width, height);
      -[CKFullscreenBrowserNavigationController setPreferredContentSize:](v27, "setPreferredContentSize:", v34, v35);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKFullScreenCardAppViewController parentTransitioningDelegate](v30, "parentTransitioningDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullscreenBrowserNavigationController setTransitioningDelegate:](v27, "setTransitioningDelegate:", v36);

    }
    -[CKBrowserTransitionCoordinator modalAppWindow](self, "modalAppWindow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      v38 = 0;
    else
      v38 = v14;

    if (v38)
    {
      objc_msgSend(v16, "balloonPlugin");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[CKBrowserTransitionCoordinator _shouldRestrictToPortraitOrientationForPlugin:](self, "_shouldRestrictToPortraitOrientationForPlugin:", v39);

      v41 = [CKPresentationControllerWindow alloc];
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "keyWindow");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bounds");
      v44 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:restrictedToPortraitOrientation:](v41, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, v40);

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPresentationControllerWindow setScreen:](v44, "setScreen:", v45);

      -[CKBrowserTransitionCoordinator setModalAppWindow:](self, "setModalAppWindow:", v44);
    }
    else
    {
      if (!v14)
      {
        -[CKBrowserTransitionCoordinator setPresentedModalBrowserNavigationController:](self, "setPresentedModalBrowserNavigationController:", v27);
        goto LABEL_47;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "CKBrowserTransitionCoordinator: FullScreenModal presentation: appWindow unexpected not nil. We didn't cleanup correctly.", buf, 2u);
        }

      }
    }
    -[CKBrowserTransitionCoordinator setPresentedModalBrowserNavigationController:](self, "setPresentedModalBrowserNavigationController:", v27);
    -[CKBrowserTransitionCoordinator modalAppWindow](self, "modalAppWindow");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setWindowLevel:", *MEMORY[0x1E0CEBE28]);

    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserTransitionCoordinator setPreModalKeyWindow:](self, "setPreModalKeyWindow:", v48);

    -[CKBrowserTransitionCoordinator modalAppWindow](self, "modalAppWindow");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "makeKeyAndVisible");

LABEL_47:
    -[CKBrowserTransitionCoordinator modalPresentationViewController](self, "modalPresentationViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke;
    aBlock[3] = &unk_1E2759050;
    v51 = v50;
    v64 = v51;
    v52 = v27;
    v65 = v52;
    v68 = v59;
    v69 = v60;
    v67 = xmmword_18E7CBE30;
    v53 = v16;
    v66 = v53;
    v54 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_opt_respondsToSelector();

    if ((v56 & 1) != 0)
    {
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "browserTransitionCoordinator:willPresentBrowserModally:", self, v53);

    }
    if (v14
      || (objc_msgSend(v51, "presentedViewController"),
          v58 = (void *)objc_claimAutoreleasedReturnValue(),
          v58,
          !v58))
    {
      v54[2](v54);
    }
    else
    {
      objc_msgSend(v51, "dismissViewControllerAnimated:completion:", 1, v54);
    }

    goto LABEL_54;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = (id)objc_opt_class();
      v20 = v72;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "%@: No plugin provided!", buf, 0xCu);

    }
  }
LABEL_54:

}

void __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;
  char v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke_2;
  v5[3] = &unk_1E2759028;
  v9 = *(_BYTE *)(a1 + 73);
  v6 = v2;
  v8 = *(_OWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "presentViewController:animated:completion:", v6, v4, v5);

}

void __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(double *)(a1 + 48);
    v3 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeRestrictions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumSize:", v2, v3);

    v8 = *(double *)(a1 + 48);
    v9 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeRestrictions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMinimumSize:", v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 1.0);

}

- (BOOL)isPresentingFullScreenModal
{
  void *v2;
  BOOL v3;

  -[CKBrowserTransitionCoordinator presentedModalBrowserNavigationController](self, "presentedModalBrowserNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissCurrentFullScreenModalAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD aBlock[4];
  id v18;
  CKBrowserTransitionCoordinator *v19;
  void (**v20)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[CKBrowserTransitionCoordinator isPresentingFullScreenModal](self, "isPresentingFullScreenModal"))
  {
    -[CKBrowserTransitionCoordinator currentModalBrowser](self, "currentModalBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKBrowserTransitionCoordinator_dismissCurrentFullScreenModalAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E274CC10;
    v8 = v7;
    v18 = v8;
    v19 = self;
    v20 = v6;
    v9 = _Block_copy(aBlock);
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "browserTransitionCoordinatorWillCollapseOrDismiss:withReason:", self, 5);

    }
    -[CKBrowserTransitionCoordinator preModalKeyWindow](self, "preModalKeyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeKeyWindow");

    -[CKBrowserTransitionCoordinator setPreModalKeyWindow:](self, "setPreModalKeyWindow:", 0);
    -[CKBrowserTransitionCoordinator presentedModalBrowserNavigationController](self, "presentedModalBrowserNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v4, v9);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Modal dismissal did not occur, not presenting modal", v16, 2u);
      }

    }
    if (v6)
      v6[2](v6);
  }

}

uint64_t __83__CKBrowserTransitionCoordinator_dismissCurrentFullScreenModalAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "modalAppWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 40), "modalAppWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "browserTransitionCoordinatorDidCollapseOrDismiss:withReason:", *(_QWORD *)(a1 + 40), 5);

  }
  objc_msgSend(*(id *)(a1 + 40), "modalAppWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRootViewController:", 0);

  objc_msgSend(*(id *)(a1 + 40), "setModalAppWindow:", 0);
  objc_msgSend(*(id *)(a1 + 40), "currentModalBrowser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unloadRemoteView");

  objc_msgSend(*(id *)(a1 + 40), "setPresentedModalBrowserNavigationController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentModalBrowser:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)expandedAppViewControllerWantsToCollapse:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer") == 2)
  {
    -[CKBrowserTransitionCoordinator releaseOwnershipOfBrowserForConsumer:](self, "releaseOwnershipOfBrowserForConsumer:", 2);
    if (-[CKBrowserTransitionCoordinator lastTransitionReason](self, "lastTransitionReason"))
      -[CKBrowserTransitionCoordinator dismissCurrentExpandedBrowserAnimated:completion:](self, "dismissCurrentExpandedBrowserAnimated:completion:", 1, 0);
    else
      -[CKBrowserTransitionCoordinator transitionCurrentBrowserToCollapsedPresentationAnimated:completion:](self, "transitionCurrentBrowserToCollapsedPresentationAnimated:completion:", 1, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Fullscreen requested dismiss/collapse, but it does not currently own the browser", v6, 2u);
    }

  }
}

- (void)expandedAppViewController:(id)a3 wantsToSwitchToPlugin:(id)a4 datasource:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;

  v22 = a4;
  v7 = a5;
  -[CKBrowserTransitionCoordinator releaseOwnershipOfBrowserForConsumer:](self, "releaseOwnershipOfBrowserForConsumer:", 2);
  -[CKBrowserTransitionCoordinator cachedCompactFrame](self, "cachedCompactFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CKBrowserTransitionCoordinator updateBrowserSessionForPlugin:datasource:](self, "updateBrowserSessionForPlugin:datasource:", v22, v7);

  -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", v9, v11, v13, v15);
  -[CKBrowserTransitionCoordinator expandedAppViewController](self, "expandedAppViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CKBrowserTransitionCoordinator wasCurrentBrowserExpanded](self, "wasCurrentBrowserExpanded");
  -[CKBrowserTransitionCoordinator requestOwnershipOfBrowserForConsumer:](self, "requestOwnershipOfBrowserForConsumer:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "viewWillTransitionToExpandedPresentation");
  objc_msgSend(v16, "setContentViewController:", v18);
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "browserTransitionCoordinator:didSwitchToPlugin:", self, v22);

  }
  if (!v17 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "viewDidTransitionToExpandedPresentation");

}

- (void)expandedAppViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "browserTransitionCoordinator:hasUpdatedLastTouchDate:", self, v8);

  }
}

- (void)expandedAppViewControllerSwitcherDidSelectAppStore:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppStore___block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  -[CKBrowserTransitionCoordinator dismissCurrentExpandedBrowserAnimated:completion:](self, "dismissCurrentExpandedBrowserAnimated:completion:", 1, v3);
}

void __85__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppStore___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserTransitionCoordinatorWantsPresentationOfAppStore:", *(_QWORD *)(a1 + 32));

  }
}

- (void)expandedAppViewControllerSwitcherDidSelectAppManager:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppManager___block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  -[CKBrowserTransitionCoordinator dismissCurrentExpandedBrowserAnimated:completion:](self, "dismissCurrentExpandedBrowserAnimated:completion:", 1, v3);
}

void __87__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppManager___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browserTransitionCoordinatorWantsPresentationOfAppManager:", *(_QWORD *)(a1 + 32));

  }
}

- (void)expandedAppViewControllerDidTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  void *v7;
  char v8;
  id v9;

  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "browserTransitionCoordinator:didTransitionFromOrientation:toOrientation:", self, a3, a4);

  }
}

- (double)expandedAppViewControllerCollapsedContentHeight:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "browserTransitionCoordinatorCollapsedContentHeight:", self);
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "-expandedAppViewControllerCollapsedContentHeight probably shouldn't return 0.0", v10, 2u);
      }

    }
  }

  return v7;
}

- (BOOL)expandedAppViewControllerShouldDismissOnDragSuccess:(id)a3
{
  void *v4;
  char v5;

  -[CKBrowserTransitionCoordinator delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "browserTransitionCoordinatorShouldDismissOnDragSuccess:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldAlwaysShowAppTitle
{
  void *v2;
  char v3;

  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldAlwaysShowAppTitle");
  else
    v3 = 0;

  return v3;
}

- (id)appTitleOverride
{
  void *v2;
  void *v3;

  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "appTitleOverride");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)appIconOverride
{
  void *v2;
  void *v3;

  -[CKBrowserTransitionCoordinator delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "appIconOverride");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCurrentConsumer:(int64_t)a3
{
  NSObject *v5;
  unint64_t currentConsumer;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_currentConsumer != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        currentConsumer = self->_currentConsumer;
        if (currentConsumer > 3)
          v7 = 0;
        else
          v7 = off_1E2759070[currentConsumer];
        if ((unint64_t)a3 > 3)
          v8 = 0;
        else
          v8 = off_1E2759070[a3];
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Browser consumer ownership changing from %@ to %@", (uint8_t *)&v10, 0x16u);
      }

    }
    self->_currentConsumer = a3;
    -[CKBrowserTransitionCoordinator currentBrowser](self, "currentBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setCurrentBrowserConsumer:", self->_currentConsumer);

  }
}

- (void)setCurrentBrowser:(id)a3
{
  CKBrowserViewControllerProtocol *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (CKBrowserViewControllerProtocol *)a3;
  if (self->_currentBrowser != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[CKBrowserViewControllerProtocol balloonPlugin](self->_currentBrowser, "balloonPlugin");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[CKBrowserViewControllerProtocol balloonPlugin](v5, "balloonPlugin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Current browser session transitioning from %@ to %@", (uint8_t *)&v11, 0x16u);

      }
    }
    objc_storeStrong((id *)&self->_currentBrowser, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CKBrowserViewControllerProtocol setCurrentBrowserConsumer:](self->_currentBrowser, "setCurrentBrowserConsumer:", -[CKBrowserTransitionCoordinator currentConsumer](self, "currentConsumer"));
  }

}

- (void)setExpanded:(BOOL)a3 withReason:(int64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  _BYTE v13[22];
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_expanded != a3)
  {
    v5 = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if (self->_expanded)
          v8 = CFSTR("YES");
        else
          v8 = CFSTR("NO");
        *(_DWORD *)v13 = 138412802;
        *(_QWORD *)&v13[4] = v8;
        if (v5)
          v9 = CFSTR("YES");
        else
          v9 = CFSTR("NO");
        *(_WORD *)&v13[12] = 2112;
        *(_QWORD *)&v13[14] = v9;
        v14 = 2048;
        v15 = a4;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Browser expanded transitioning from %@ to %@ with reason %lld ", v13, 0x20u);
      }

    }
    -[CKBrowserTransitionCoordinator setLastTransitionReason:](self, "setLastTransitionReason:", a4, *(_OWORD *)v13);
    self->_expanded = v5;
    -[CKBrowserTransitionCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CKBrowserTransitionCoordinator delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "browserTransitionCoordinator:expandedStateDidChange:withReason:", self, -[CKBrowserTransitionCoordinator isExpanded](self, "isExpanded"), a4);

    }
  }
}

- (CKBrowserTransitionCoordinatorDelegate)delegate
{
  return (CKBrowserTransitionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentConsumer
{
  return self->_currentConsumer;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (CKExpandedAppViewController)expandedAppViewController
{
  return self->_expandedAppViewController;
}

- (void)setExpandedAppViewController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAppViewController, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  return (CKBrowserViewControllerSendDelegate *)objc_loadWeakRetained((id *)&self->_sendDelegate);
}

- (void)setSendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sendDelegate, a3);
}

- (BOOL)underTest
{
  return self->_underTest;
}

- (void)setUnderTest:(BOOL)a3
{
  self->_underTest = a3;
}

- (CKBrowserViewControllerProtocol)currentBrowser
{
  return self->_currentBrowser;
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

- (void)setAppWindow:(id)a3
{
  objc_storeStrong((id *)&self->_appWindow, a3);
}

- (UIWindow)previousKeyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_previousKeyWindow);
}

- (void)setPreviousKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_previousKeyWindow, a3);
}

- (UIWindow)preModalKeyWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_preModalKeyWindow);
}

- (void)setPreModalKeyWindow:(id)a3
{
  objc_storeWeak((id *)&self->_preModalKeyWindow, a3);
}

- (CGRect)cachedCompactFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedCompactFrame.origin.x;
  y = self->_cachedCompactFrame.origin.y;
  width = self->_cachedCompactFrame.size.width;
  height = self->_cachedCompactFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedCompactFrame:(CGRect)a3
{
  self->_cachedCompactFrame = a3;
}

- (int64_t)lastTransitionReason
{
  return self->_lastTransitionReason;
}

- (void)setLastTransitionReason:(int64_t)a3
{
  self->_lastTransitionReason = a3;
}

- (UIWindow)modalAppWindow
{
  return self->_modalAppWindow;
}

- (void)setModalAppWindow:(id)a3
{
  objc_storeStrong((id *)&self->_modalAppWindow, a3);
}

- (UINavigationController)presentedModalBrowserNavigationController
{
  return self->_presentedModalBrowserNavigationController;
}

- (void)setPresentedModalBrowserNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedModalBrowserNavigationController, a3);
}

- (CKBrowserViewControllerProtocol)currentModalBrowser
{
  return self->_currentModalBrowser;
}

- (void)setCurrentModalBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_currentModalBrowser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModalBrowser, 0);
  objc_storeStrong((id *)&self->_presentedModalBrowserNavigationController, 0);
  objc_storeStrong((id *)&self->_modalAppWindow, 0);
  objc_destroyWeak((id *)&self->_preModalKeyWindow);
  objc_destroyWeak((id *)&self->_previousKeyWindow);
  objc_storeStrong((id *)&self->_appWindow, 0);
  objc_storeStrong((id *)&self->_currentBrowser, 0);
  objc_destroyWeak((id *)&self->_sendDelegate);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_expandedAppViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
