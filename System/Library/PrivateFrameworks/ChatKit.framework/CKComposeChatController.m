@implementation CKComposeChatController

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldSuppressRotationInNewCompose");

  if (v4)
    -[CKChatController endHoldingAutorotationForKey:](self, "endHoldingAutorotationForKey:", CFSTR("CKAutorotationHoldNewCompose"));
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateOutstandingIDStatusRequests");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKChatController dealloc](&v8, sel_dealloc);
}

- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 bizIntent:(id)a5
{
  return -[CKComposeChatController initWithRecipientAddresses:composition:bizIntent:simID:](self, "initWithRecipientAddresses:composition:bizIntent:simID:", a3, a4, a5, 0);
}

- (CKComposeChatController)initWithRecipientAddresses:(id)a3 composition:(id)a4 bizIntent:(id)a5 simID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CKComposeChatController *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSString *prepopulatedSIMID;
  CKComposeNavbarManager *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  CKComposeChatController *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = +[CKConversation newPendingConversation](CKConversation, "newPendingConversation");
  v45.receiver = self;
  v45.super_class = (Class)CKComposeChatController;
  v15 = -[CKChatController initWithConversation:](&v45, sel_initWithConversation_, v14);

  if (v15)
  {
    if (v10 && objc_msgSend(v10, "count"))
    {
      v37 = v15;
      v38 = v13;
      v39 = v12;
      v40 = v11;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (CKIsValidAddress(v23))
            {
              +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "recipientWithAddress:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                if (!v20)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v26 = v25;
                    objc_msgSend(v26, "handle");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v27, "isBusiness");

                    if (v28)
                    {
                      objc_msgSend(v26, "handle");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v20 = 0;
                    }

                  }
                  else
                  {
                    v20 = 0;
                  }
                }
                objc_msgSend(v16, "addObject:", v25);
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }

      v15 = v37;
      -[CKComposeChatController setRecipientsListChanged:](v37, "setRecipientsListChanged:", 0);
      -[CKComposeChatController setBusinessHandle:](v37, "setBusinessHandle:", v20);
      -[CKComposeChatController setPrepopulatedRecipients:](v37, "setPrepopulatedRecipients:", v16);
      v13 = v38;
      v12 = v39;
      if (v38)
      {
        v29 = objc_msgSend(v38, "copy");
        prepopulatedSIMID = v37->_prepopulatedSIMID;
        v37->_prepopulatedSIMID = (NSString *)v29;

      }
      v11 = v40;
    }
    -[CKComposeChatController setPrepopulatedComposition:](v15, "setPrepopulatedComposition:", v11);
    if (!CKIsRunningInMessagesViewService() || !CKIsRunningInMacCatalyst())
    {
      v31 = [CKComposeNavbarManager alloc];
      -[CKComposeChatController businessHandle](v15, "businessHandle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[CKComposeNavbarManager initForBusinessChat:](v31, "initForBusinessChat:", v32 != 0);

      objc_msgSend(v33, "setCanvasViewControllerDelegate:", v15);
      objc_msgSend(v33, "setDelegate:", v15);
      -[CKComposeChatController setNavbarManager:](v15, "setNavbarManager:", v33);
      -[CKComposeChatController _configureTitleView](v15, "_configureTitleView");

    }
    -[CKComposeChatController setBizIntent:](v15, "setBizIntent:", v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "shouldSuppressRotationInNewCompose");

    if (v35)
      -[CKChatController beginHoldingAutorotationForKey:](v15, "beginHoldingAutorotationForKey:", CFSTR("CKAutorotationHoldNewCompose"));
  }

  return v15;
}

- (void)prepareForSuspend
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKComposeChatController;
  -[CKChatController prepareForSuspend](&v4, sel_prepareForSuspend);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateOutstandingIDStatusRequests");

}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKCoreChatController parentControllerDidResume:animating:](&v8, sel_parentControllerDidResume_animating_);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentControllerDidResume:animating:", v5, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKChatController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[CKChatController setFrozenEntryViewHeightDuringDismissAnimation:](self, "setFrozenEntryViewHeightDuringDismissAnimation:", 0);
  -[CKComposeChatController _updateBusinessInfoIfNecessary](self, "_updateBusinessInfoIfNecessary");
  -[CKComposeChatController _updateNavigationUI](self, "_updateNavigationUI");
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useMacToolbar");

    if ((v5 & 1) == 0)
    {
      -[CKComposeChatController catalystComposeNavigationController](self, "catalystComposeNavigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNavigationBarHidden:animated:", 1, 0);

    }
  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidatePhotosViewController");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKComposeChatController;
  -[CKChatController viewWillDisappear:](&v16, sel_viewWillDisappear_, a3);
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useMacToolbar");

    if ((v5 & 1) == 0)
    {
      -[CKComposeChatController catalystComposeNavigationController](self, "catalystComposeNavigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, 0);

    }
  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CKChatController _maxEntryViewHeight](self, "_maxEntryViewHeight");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController setFrozenEntryViewHeightDuringDismissAnimation:](self, "setFrozenEntryViewHeightDuringDismissAnimation:", v8);

  location = 0;
  objc_initWeak(&location, self);
  -[CKComposeChatController transitionCoordinator](self, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__CKComposeChatController_viewWillDisappear___block_invoke;
  v13 = &unk_1E27563C0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "notifyWhenInteractionChangesUsingBlock:", &v10);

  -[CKComposeChatController resignFirstResponder](self, "resignFirstResponder", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __45__CKComposeChatController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  if (objc_msgSend(a2, "isCancelled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setFrozenEntryViewHeightDuringDismissAnimation:", 0);
    objc_msgSend(WeakRetained, "updateEntryViewHeightIncludingAppStrip:animated:", 1, 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKComposeChatController;
  -[CKChatController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CKComposeChatController navbarManager](self, "navbarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customStatusBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKComposeChatController;
  -[CKChatController viewDidLoad](&v22, sel_viewDidLoad);
  -[CKComposeChatController navbarManager](self, "navbarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forEvents:", self, sel_cancelButtonTapped, 64);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAddressBookChange_, *MEMORY[0x1E0D373C0], 0);

  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "useMacToolbar");

    -[CKComposeChatController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "setNavigationBarHidden:", 1);
    }
    else
    {
      -[CKComposeChatController setCatalystComposeNavigationController:](self, "setCatalystComposeNavigationController:", v8);

      -[CKComposeChatController catalystComposeNavigationController](self, "catalystComposeNavigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[CKComposeChatController catalystComposeNavigationController](self, "catalystComposeNavigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationBar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "marzNavigationBarHeight");
      objc_msgSend(v18, "setFrame:", v13, v15, v17, v20);

    }
  }
  if (CKIsRunningInMessagesViewService())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resetCacheSubscriptionInfo");

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKComposeChatController;
  -[CKChatController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CKComposeChatController _updateBlackholeAlertView](self, "_updateBlackholeAlertView");
}

- (void)viewDidLayoutSubviews
{
  BOOL v3;
  void *v4;
  void *v5;
  double Width;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  objc_super v28;
  CGRect v29;

  v3 = -[CKCoreChatController initialLayoutComplete](self, "initialLayoutComplete");
  v28.receiver = self;
  v28.super_class = (Class)CKComposeChatController;
  -[CKChatController viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[CKComposeChatController _updateBusinessInfoIfNecessary](self, "_updateBusinessInfoIfNecessary");
  -[CKComposeChatController layoutBusinessInfoViewIfNecessary](self, "layoutBusinessInfoViewIfNecessary");
  -[CKComposeChatController blackholeAlertView](self, "blackholeAlertView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKComposeChatController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Width = CGRectGetWidth(v29);

    -[CKComposeChatController blackholeAlertView](self, "blackholeAlertView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBlackholeChatItem sizeThatFits:text:](CKBlackholeChatItem, "sizeThatFits:text:", v9, Width, 1.79769313e308);
    v11 = v10;

    v12 = *MEMORY[0x1E0C9D648];
    -[CKScrollViewController navigationBarInsets](self, "navigationBarInsets");
    v14 = v13;
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collapsedHeight");
    v17 = v14 + v16;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topTranscriptSpace");
    v20 = v17 + v19;

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fromFieldContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v22, "isHidden");

    if ((v8 & 1) == 0)
    {
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fromFieldContainerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v20 = v20 + v25;

    }
    -[CKComposeChatController blackholeAlertView](self, "blackholeAlertView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v12, v20, Width, v11);

  }
  if (!v3)
  {
    if (-[CKComposeChatController _shouldSetToFieldAsFirstResponder](self, "_shouldSetToFieldAsFirstResponder"))
      v27 = 2;
    else
      v27 = 1;
    -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", v27);
    -[CKComposeChatController reloadInputViews](self, "reloadInputViews");
    -[CKComposeChatController becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (void)viewLayoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKComposeChatController;
  -[CKComposeChatController viewLayoutMarginsDidChange](&v12, sel_viewLayoutMarginsDidChange);
  -[CKComposeChatController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  if (v6 != *(double *)(MEMORY[0x1E0CEA080] + 8)
    || v3 != *MEMORY[0x1E0CEA080]
    || v5 != *(double *)(MEMORY[0x1E0CEA080] + 24)
    || v4 != *(double *)(MEMORY[0x1E0CEA080] + 16))
  {
    -[CKComposeChatController navbarManager](self, "navbarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

  }
}

- (id)preferredFocusEnvironments
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
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[CKChatController entryView](self, "entryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKChatController entryView](self, "entryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  return v3;
}

- (void)setPrepopulatedComposition:(id)a3
{
  CKComposition *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  BOOL v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (CKComposition *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      if (!v5)
        v7 = CFSTR("NO");
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Call made to pre-populate the composition. hasNonNilComposition={%@}", (uint8_t *)&v10, 0xCu);
    }

  }
  if (v5)
  {
    -[CKChatController entryView](self, "entryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      if (self->_prepopulatedComposition != v5)
        objc_storeStrong((id *)&self->_prepopulatedComposition, a3);
    }
    else
    {
      -[CKChatController setComposition:](self, "setComposition:", v5);
    }
  }

}

- (void)setPrepopulatedRecipients:(id)a3
{
  NSArray *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *prepopulatedRecipients;
  NSObject *v9;
  NSArray *v10;
  int v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Call made to pre-populate recipients (adding): %@", (uint8_t *)&v11, 0xCu);
      }

    }
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    prepopulatedRecipients = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(prepopulatedRecipients, "addRecipients:", v4);
    goto LABEL_13;
  }
  if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Call made to pre-populate recipients (not yet ready): %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (self->_prepopulatedRecipients != v4)
  {
    v10 = v4;
    prepopulatedRecipients = self->_prepopulatedRecipients;
    self->_prepopulatedRecipients = v10;
LABEL_13:

  }
}

- (void)setSuggestedRepliesData:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_suggestedRepliesData, a3);
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChatBot:", MEMORY[0x1E0C9AAB0]);

}

- (void)setServiceId:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_serviceId, a3);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Got valid serviceId. Setting conversation as chatbot", v8, 2u);
      }

    }
    -[CKCoreChatController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChatBot:", MEMORY[0x1E0C9AAB0]);

  }
}

- (NSArray)proposedRecipients
{
  void *v3;
  void *v4;
  NSArray *v5;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expandedRecipients");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_prepopulatedRecipients;
  }
  return v5;
}

- (NSString)unatomizedRecipientText
{
  void *v2;
  void *v3;
  void *v4;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)conversationLeft
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "conversationLeft", v8, 2u);
    }

  }
  -[CKChatController composition](self, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingConversationCreatingIfNecessary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController setConversation:](self, "setConversation:", v6);

  if (!-[CKCoreChatController isSendingMessage](self, "isSendingMessage"))
  {
    -[CKChatController entryView](self, "entryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setComposition:", v4);

  }
}

- (void)_setConversationDeferredSetup
{
  void *v3;
  NSObject *v4;
  CKComposeRecipientSelectionController *v5;
  void *v6;
  CKComposeRecipientSelectionController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[16];
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CKComposeChatController;
  -[CKChatController _setConversationDeferredSetup](&v41, sel__setConversationDeferredSetup);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_25;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Creating composeRecipientSelection controller during _setConversationDeferredSetup", buf, 2u);
    }

  }
  v5 = [CKComposeRecipientSelectionController alloc];
  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKRecipientSelectionController initWithConversation:](v5, "initWithConversation:", v6);

  -[CKRecipientSelectionController setDelegate:](v7, "setDelegate:", self);
  -[CKComposeChatController setComposeRecipientSelectionController:](self, "setComposeRecipientSelectionController:", v7);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend((id)v9, "setFrame:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "useMacToolbar");

  if ((v9 & 1) != 0)
  {
    -[CKChatController macToolbarController](self, "macToolbarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateVirtualViewForProvider:", self);
  }
  else
  {
    if (-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation"))
      goto LABEL_11;
    -[CKComposeChatController addChildViewController:](self, "addChildViewController:", v7);
    -[CKComposeChatController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didMoveToParentViewController:", self);
  }

LABEL_11:
  -[CKCoreChatController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CKCoreChatController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "composeChatControllerCanEditRecipients");

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEditable:", v19);

    if (CKIsRunningInMessagesViewService())
    {
      if ((_DWORD)v19)
      {
        if (CKIsScreenLocked())
          SBSRequestPasscodeUnlockUI();
      }
      else
      {
        -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 1);
      }
    }
  }
  -[CKChatController _updateEntryViewFrameIfNeeded:](self, "_updateEntryViewFrameIfNeeded:", 0);
  -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addRecipients:", v23);

    -[CKComposeChatController prepopulatedSIMID](self, "prepopulatedSIMID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSimID:", v24);

  }
  -[CKComposeChatController prepopulatedComposition](self, "prepopulatedComposition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CKChatController entryView](self, "entryView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "composition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasContent");

    -[CKChatController entryView](self, "entryView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      objc_msgSend(v30, "composition");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "compositionByAppendingComposition:", self->_prepopulatedComposition);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatController entryView](self, "entryView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setComposition:", v33);

      v31 = v32;
    }
    else
    {
      -[CKComposeChatController prepopulatedComposition](self, "prepopulatedComposition");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setComposition:", v33);
    }

  }
  -[CKComposeChatController setPrepopulatedRecipients:](self, "setPrepopulatedRecipients:", 0);
  -[CKComposeChatController setPrepopulatedComposition:](self, "setPrepopulatedComposition:", 0);

LABEL_25:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "useMacToolbar");

  if ((v36 & 1) == 0)
  {
    -[CKComposeChatController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bringSubviewToFront:", v39);

  }
  -[CKComposeChatController _updateBusinessInfoIfNecessary](self, "_updateBusinessInfoIfNecessary");
  -[CKComposeChatController _updateSendLaterCompositionIfNecessary](self, "_updateSendLaterCompositionIfNecessary");
}

void __56__CKComposeChatController__setConversationDeferredSetup__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "composeRecipientSelectionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditable:", 0);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composeChatControllerDidCancelComposition:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_shouldSetToFieldAsFirstResponder
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditable"))
  {
    -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_updateSendingIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__ck_defaultAccountForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedLastAddressedOrDefaultHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = (uint64_t)v8;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "_updateSendingIdentity selectedLastAddressedHandle: %@", (uint8_t *)&v29, 0xCu);
    }

  }
  if (-[CKComposeChatController _deviceHasMultipleActiveSubscriptions](self, "_deviceHasMultipleActiveSubscriptions"))
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedSubscriptionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "labelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v29 = 138412290;
        v30 = (uint64_t)v12;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Sending composition with simID: %@", (uint8_t *)&v29, 0xCu);
      }

    }
    -[CKComposeChatController setLastAddressedSIMID:](self, "setLastAddressedSIMID:", v12);
    if (v8 && (IMStringIsEmail() & 1) != 0
      || (objc_msgSend(v6, "serviceName"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D38F68]),
          v14,
          (v15 & 1) != 0))
    {
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasiMessageableContext");

      if (v17)
      {
        -[CKComposeChatController setLastAddressedHandle:](self, "setLastAddressedHandle:", v8);
        objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposeChatController lastAddressedHandle](self, "lastAddressedHandle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposeChatController lastAddressedSIMID](self, "lastAddressedSIMID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "iMessageAccountForLastAddressedHandle:simID:", v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            -[CKComposeChatController lastAddressedHandle](self, "lastAddressedHandle");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            -[CKComposeChatController lastAddressedSIMID](self, "lastAddressedSIMID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138412802;
            v30 = (uint64_t)v8;
            v31 = 2112;
            v32 = v23;
            v33 = 2112;
            v34 = v24;
            _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Selected last addressed handle is iMessage capable %@ and at least one context is iMessage-capable, so pick the account corresponding to last addressed handle %@ and simID %@", (uint8_t *)&v29, 0x20u);

          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v29 = 138412290;
            v30 = v21;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Account picked %@", (uint8_t *)&v29, 0xCu);
          }

        }
        v6 = (void *)v21;
      }
    }
    else
    {
      -[CKComposeChatController setLastAddressedHandle:](self, "setLastAddressedHandle:", v8);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          -[CKComposeChatController lastAddressedHandle](self, "lastAddressedHandle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = (uint64_t)v27;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Sending SMS composition with last addressed handle %@", (uint8_t *)&v29, 0xCu);

        }
      }
    }

  }
  return v6;
}

- (void)sendComposition:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  CKComposeChatController *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  dispatch_time_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  CKComposeChatController *v60;
  _QWORD block[5];
  id v62;
  _QWORD aBlock[4];
  id v64;
  CKComposeChatController *v65;
  id v66;
  BOOL v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = self;
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "recipientCount");

  if (v5)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchResultsHidden:", 1);

    -[CKComposeChatController _updateSendingIdentity](self, "_updateSendingIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Cannot send composition to conversation with no account.", buf, 2u);
        }

      }
      goto LABEL_50;
    }
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedSubscriptionContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[CKComposeChatController lastAddressedHandle](self, "lastAddressedHandle");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[CKComposeChatController lastAddressedSIMID](self, "lastAddressedSIMID");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController conversation](self, "conversation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v74 = v8;
        v75 = 2112;
        v76 = v11;
        v77 = 2112;
        v78 = v12;
        v79 = 2112;
        v80 = v58;
        v81 = 2112;
        v82 = v13;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Sending composition with account: %@ lastAddressedHandle: %@ lastAddressedSIMID: %@ subscription: %@ conversation: %@", buf, 0x34u);

      }
    }
    v14 = -[CKComposeChatController ignoreEmailsWhenSending](self, "ignoreEmailsWhenSending");
    -[CKCoreChatController conversation](self, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKCoreChatController conversation](self, "conversation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "pendingChat");

    }
    else
    {
      v18 = 0;
    }
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "gameCenterPickerBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v23 != 0 || v14) | v18 & 1
      || (-[CKCoreChatController conversation](self, "conversation"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "chat"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = v25 == 0,
          v25,
          v24,
          v26))
    {
      -[CKComposeChatController composeRecipientSelectionController](v60, "composeRecipientSelectionController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "expandedRecipients");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v29, "count"));
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v31 = v29;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v69 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            if (objc_msgSend(v35, "kind") != 5 || v23 == 0)
            {
              objc_msgSend(v35, "rawAddress");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              IMStripFormattingFromAddress();
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38 && (!v14 || (IMStringIsEmail() & 1) == 0))
              {
                objc_msgSend(v8, "imHandleWithID:alreadyCanonical:", v38, 0);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39)
                  objc_msgSend(v30, "addObject:", v39);

              }
            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        }
        while (v32);
      }
      v40 = v23 != 0;

      v27 = objc_msgSend(v30, "count") != 0;
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeChatController lastAddressedHandle](v60, "lastAddressedHandle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeChatController lastAddressedSIMID](v60, "lastAddressedSIMID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v57) = 1;
      objc_msgSend(v41, "conversationForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:create:", v30, 0, v42, v43, 1, 0, v57);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKChatController setConversation:](v60, "setConversation:", v44);
      -[CKCoreChatController delegate](v60, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "composeChatController:didSelectNewConversation:", v60, v44);

      if (v40)
      {
        -[CKCoreChatController conversation](v60, "conversation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46 == 0;

        v48 = v60;
        if (v47)
          goto LABEL_48;
        goto LABEL_43;
      }
    }
    else
    {
      v27 = 1;
    }
    v48 = v60;
LABEL_43:
    -[CKCoreChatController inputController](v48, "inputController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:", 0);

    if (-[CKChatController showSendAlertIfNecessaryForComposition:](v60, "showSendAlertIfNecessaryForComposition:", v59))
    {
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    v50 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CKComposeChatController_sendComposition___block_invoke;
    aBlock[3] = &unk_1E2754888;
    v64 = v59;
    v65 = v60;
    v67 = v27;
    v66 = v8;
    v51 = _Block_copy(aBlock);
    v52 = v51;
    if (v14)
    {
      -[CKCoreChatController conversation](v60, "conversation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "refreshServiceForSending");

      v54 = dispatch_time(0, 100000000);
      block[0] = v50;
      block[1] = 3221225472;
      block[2] = __43__CKComposeChatController_sendComposition___block_invoke_146;
      block[3] = &unk_1E274C2E0;
      block[4] = v60;
      v62 = v52;
      dispatch_after(v54, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(void *))v51 + 2))(v51);
    }

LABEL_48:
    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDraftForPendingConversation:withRecipients:", 0, 0);

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "saveCompositionAndFlushCache:", 0);

    goto LABEL_49;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[CKCoreChatController conversation](self, "conversation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v20;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Cannot send composition to conversation with no recipients: %@", buf, 0xCu);

    }
  }
LABEL_51:

}

void __43__CKComposeChatController_sendComposition___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD aBlock[4];
  id v8;
  uint64_t v9;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CKComposeChatController_sendComposition___block_invoke_2;
  aBlock[3] = &unk_1E274A108;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = v2;
  v9 = v3;
  v4 = _Block_copy(aBlock);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "_determineSpamFilterHandshakeStateForAccount:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_prepareForSendFromCardIfNecessaryAndSend:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Can not send the message because we have no valid handles to send to.", v6, 2u);
    }

  }
}

void __43__CKComposeChatController_sendComposition___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  CKComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  objc_msgSend(*(id *)(a1 + 32), "shelfPluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "compositionIsCollaboration"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shareWasCreated"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v22.receiver = *(id *)(a1 + 40);
      v22.super_class = (Class)CKComposeChatController;
      objc_msgSendSuper2(&v22, sel_sendComposition_, v3);
      objc_msgSend(*(id *)(a1 + 40), "setShareWasCreated:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "enableSendButtonSpinner");
      v14 = *(_QWORD *)(a1 + 32);
      v21.receiver = *(id *)(a1 + 40);
      v21.super_class = (Class)CKComposeChatController;
      objc_msgSendSuper2(&v21, sel_sendCompositionForCollaboration_collaborationType_completion_, v14, objc_msgSend(v2, "payloadCollaborationType"), 0);
    }
  }
  else
  {
    v4 = *(id *)(a1 + 32);
    if (objc_msgSend(v2, "sendAsCopy"))
    {
      objc_msgSend(v2, "sendAsCopyURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v2, "sendAsCopyURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setUrl:", v6);

        v7 = [CKComposition alloc];
        objc_msgSend(*(id *)(a1 + 32), "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "subject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "bizIntent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shelfMediaObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "proofreadingInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:](v7, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", v8, v9, v2, v10, v11, v12);

        v4 = (id)v13;
      }
    }
    v20.receiver = *(id *)(a1 + 40);
    v20.super_class = (Class)CKComposeChatController;
    objc_msgSendSuper2(&v20, sel_sendComposition_, v4);

  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v15, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addBizIntentToConversation:", v16);

  objc_msgSend(*(id *)(a1 + 40), "setSendingComposition:", 1);
  objc_msgSend(*(id *)(a1 + 40), "businessInfoView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "businessInfoView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFromSuperview");

  }
}

void __43__CKComposeChatController_sendComposition___block_invoke_146(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = IMOSLoggingEnabled();
  if (v5 == v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Cache hit after removing emails from conversation, send now", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Waiting for registration check before sending", v11, 2u);
      }

    }
    v9 = dispatch_time(0, 4000000000);
    dispatch_after(v9, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
  }

}

- (void)_determineSpamFilterHandshakeStateForAccount:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "repliedToChat");

    -[CKCoreChatController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "receivedResponseForChat");

    if ((v6 & 1) == 0 && (v9 & 1) == 0)
    {
      objc_msgSend(v18, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F58]);

      if (v11)
      {
        -[CKCoreChatController conversation](self, "conversation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "chat");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "participants");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "__imArrayByApplyingBlock:", &__block_literal_global_146);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D39AF8], "participantsAreiMessagable:completionBlock:", v15, &__block_literal_global_152_0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "trackSpamEvent:", 1);

        -[CKCoreChatController conversation](self, "conversation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "chat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setValue:forChatProperty:", &unk_1E2870948, *MEMORY[0x1E0D359C8]);

      }
    }
  }

}

id __72__CKComposeChatController__determineSpamFilterHandshakeStateForAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __72__CKComposeChatController__determineSpamFilterHandshakeStateForAccount___block_invoke_2(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trackSpamEvent:", 1);

  }
}

- (void)_prepareForSendFromCardIfNecessaryAndSend:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  CKComposeChatController *v48;
  uint8_t buf[16];

  v4 = (void (**)(_QWORD))a3;
  -[CKChatController dismissEffectPickerAnimated:](self, "dismissEffectPickerAnimated:", 1);
  -[CKChatController _currentPresentationController](self, "_currentPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKCoreChatController shouldDismissAfterSend](self, "shouldDismissAfterSend")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_INFO, "Not sending in a sheet, sending normally!", buf, 2u);
      }

    }
    if (v4)
      v4[2](v4);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Preparing to transition from sheet->fullscreen", buf, 2u);
      }

    }
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTransitioningFromComposing:", 1);

    -[CKComposeChatController setSendingViaCardUI:](self, "setSendingViaCardUI:", 1);
    v8 = v5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendAnimationDuration");
    v11 = v10;

    objc_msgSend(v8, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UISheetMinimumTopInset();
    v14 = v13;

    -[CKChatController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginDisablingTranscriptDynamicsForReason:", CFSTR("NewComposeTransition"));
    -[CKChatController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v8, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[CKChatController collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAutoresizingMask:", 0);

    -[CKChatController collectionView](self, "collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v23, v25 - v14, v27, v29);

    -[CKChatController collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setContentOffset:", v18, v20 - v14);

    -[CKChatController collectionView](self, "collectionView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutIfNeeded");

    v34 = (void *)MEMORY[0x1E0CEABB0];
    v35 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke;
    v46[3] = &unk_1E274A108;
    v36 = v8;
    v47 = v36;
    v48 = self;
    v44[0] = v35;
    v44[1] = 3221225472;
    v44[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_2;
    v44[3] = &unk_1E274A1B8;
    v37 = v15;
    v45 = v37;
    objc_msgSend(v34, "animateWithDuration:animations:completion:", v46, v44, v11);
    v43[0] = v35;
    v43[1] = 3221225472;
    v43[2] = __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_3;
    v43[3] = &unk_1E274A208;
    v43[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v43, v11 * 0.5);
    -[CKCoreChatController delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "composeChatControllerShouldShowBackButtonViewDuringSendAnimation:", self);

    -[CKComposeChatController navbarManager](self, "navbarManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "commitTransitionAnimationWithConversation:shouldShowBackButtonView:", v41, v39);

    if (v4)
      v4[2](v4);

  }
}

void __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_setWantsFullScreen:", objc_msgSend(*(id *)(a1 + 32), "_wantsFullScreen") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

uint64_t __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endDisablingTranscriptDynamicsForReason:", CFSTR("NewComposeTransition"));
}

void __69__CKComposeChatController__prepareForSendFromCardIfNecessaryAndSend___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "composeRecipientSelectionController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setAlpha:", 0.0);
}

- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v4 = a3;
  -[CKComposeChatController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "balloonMaxWidth");
    v9 = v8;
    objc_msgSend(v19, "marginInsets");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[CKComposeChatController traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v18, v9, v11, v13, v15, v17);

  }
}

- (void)addBizIntentToConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKComposeChatController bizIntent](self, "bizIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKComposeChatController _processBizIntentIfNeeded](self, "_processBizIntentIfNeeded");
    -[CKComposeChatController bizIntent](self, "bizIntent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBizIntent:", v6);

    -[CKComposeChatController setBizIntent:](self, "setBizIntent:", 0);
  }

}

- (void)_processBizIntentIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[CKComposeChatController bizIntent](self, "bizIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CKComposeChatController _isAllowlistedBusinessRecipient](self, "_isAllowlistedBusinessRecipient");

    if (v4)
    {
      -[CKComposeChatController bizIntent](self, "bizIntent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("biz-intent-id"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v44 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v44);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v44;
        v10 = (void *)objc_msgSend(v8, "mutableCopy");

        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              -[CKComposeChatController bizIntent](self, "bizIntent");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = v12;
              v49 = 2112;
              v50 = v9;
              _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Fail to decode JSON bizIntent biz-intent-id [%@] due to error [%@]", buf, 0x16u);

            }
          }
        }
        else
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("authBag"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dataUsingEncoding:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v43 = 0;
            objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, &v43);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v43;
            v18 = (void *)objc_msgSend(v17, "mutableCopy");

            if (v9)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  -[CKComposeChatController bizIntent](self, "bizIntent");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("authBag"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v48 = v21;
                  v49 = 2112;
                  v50 = v9;
                  _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Fail to decode JSON bizIntent authBag [%@] due to error [%@]", buf, 0x16u);

                }
              }
            }
            else
            {
              -[CKComposeChatController _anisetteData](self, "_anisetteData");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v23)
              {
                objc_msgSend(v23, "oneTimePassword");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("X-Apple-I-MD"));

              }
              v42 = 0;
              objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v18, 0, &v42);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v42;
              if (v26)
              {
                v9 = v26;
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v48 = v18;
                    v49 = 2112;
                    v50 = v9;
                    _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Fail to serialize processed authBag [%@] due to error [%@]", buf, 0x16u);
                  }

                }
              }
              else
              {
                v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v40, 4);
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v39, CFSTR("authBag"));
                v41 = 0;
                objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v41);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v41;
                if (v9)
                {
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v48 = v10;
                      v49 = 2112;
                      v50 = v9;
                      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Fail to serialize processed biz-intent-id [%@] due to error [%@]", buf, 0x16u);
                    }

                  }
                }
                else
                {
                  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v38, 4);
                  v45[0] = CFSTR("biz-group-id");
                  -[CKComposeChatController bizIntent](self, "bizIntent");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("biz-group-id"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v45[1] = CFSTR("biz-intent-id");
                  v46[0] = v30;
                  v46[1] = v37;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  -[CKComposeChatController bizIntent](self, "bizIntent");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("biz-greeting-txt"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    v33 = (void *)objc_msgSend(v36, "mutableCopy");
                    -[CKComposeChatController bizIntent](self, "bizIntent");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("biz-greeting-txt"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("biz-greeting-txt"));

                  }
                  else
                  {
                    v33 = v36;
                  }
                  -[CKComposeChatController setBizIntent:](self, "setBizIntent:", v33);

                }
              }

            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v10;
                _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Fail to decode authBag from biz-intent-id [%@]", buf, 0xCu);
              }

            }
            v9 = 0;
          }

        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[CKComposeChatController bizIntent](self, "bizIntent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Fail to decode biz-intent-id from [%@]", buf, 0xCu);

        }
      }

    }
  }
}

- (BOOL)_isAllowlistedBusinessRecipient
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "address");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isBusiness");

          if (v12)
          {
            IMSharedHelperBusinessAllowlist();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "containsObject:", v10);

            if ((v14 & 1) != 0)
            {

              LOBYTE(v6) = 1;
              goto LABEL_14;
            }
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)_anisetteData
{
  objc_class *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("AKAnisetteProvisioningController"), CFSTR("AuthKit"));
  if (v2)
  {
    v3 = objc_alloc_init(v2);
    v9 = 0;
    objc_msgSend(v3, "anisetteDataWithError:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v5 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "CKComposeChatController: Failed fetching anisette data with error [%@]", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKComposeChatController: Failed linking Accounts - AKAnisetteProvisioningController", buf, 2u);
      }

    }
    v4 = 0;
  }
  return v4;
}

- (void)stageSuggestedReplies
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[CKComposeChatController suggestedRepliesData](self, "suggestedRepliesData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CKComposeChatController _updateSendingIdentity](self, "_updateSendingIdentity");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expandedRecipients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count") != 1)
      {

        goto LABEL_11;
      }
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rawAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      IMStripFormattingFromAddress();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v17, "imHandleWithID:alreadyCanonical:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKPendingConversation pendingConversationForHandle:](CKPendingConversation, "pendingConversationForHandle:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKChatController setConversation:](self, "setConversation:", v12);
        -[CKCoreChatController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "composeChatController:didSelectNewConversation:", self, v12);

      }
    }
    -[CKCoreChatController conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chat");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v17;
    if (!v17)
    {
LABEL_12:

      return;
    }
    -[CKComposeChatController suggestedRepliesData](self, "suggestedRepliesData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSuggestedRepliesData:", v16);

    objc_msgSend(v17, "reloadChatItemsForSuggestedRepliesChange");
    -[CKComposeChatController setSuggestedRepliesData:](self, "setSuggestedRepliesData:", 0);
LABEL_11:
    v15 = v17;
    goto LABEL_12;
  }
}

- (id)outgoingComposeViewForSendAnimation
{
  void *v2;
  void *v3;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSafeToMarkAsRead
{
  unsigned int v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  v3 = -[CKChatController isSafeToMarkAsRead](&v7, sel_isSafeToMarkAsRead);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 & objc_msgSend(v4, "isSearchResultsHidden");

  return v5;
}

- (double)topInsetPadding
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (!-[CKChatController isAnimatingMessageSend](self, "isAnimatingMessageSend")
    && v3
    && !CKIsRunningInMacCatalyst())
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collapsedHeight");
    v7 = v6;

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fromFieldHeight");
    v4 = v7 + v9;

  }
  return v4;
}

- (void)keyboardWillHide:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[CKComposeChatController ignoreKeyboardNotifications](self, "ignoreKeyboardNotifications"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    -[CKChatController keyboardWillHide:](&v5, sel_keyboardWillHide_, v4);
  }

}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!-[CKComposeChatController ignoreKeyboardNotifications](self, "ignoreKeyboardNotifications"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKComposeChatController;
    -[CKChatController keyboardWillShow:](&v6, sel_keyboardWillShow_, v4);
    -[CKChatController entryView](self, "entryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v6 = a4;
  -[CKCoreChatController inputController](self, "inputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreventResignFirstResponder:", 1);

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKChatController dismissViewControllerAnimated:completion:](&v8, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (UIEdgeInsets)macToolbarInsets
{
  double *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v3 = (double *)MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useMacToolbar");

  if (v8)
  {
    -[CKChatController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
    v10 = v9;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "macAppKitToolbarHeight");
    if (v10 > v12)
    {
      -[CKChatController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
      v15 = v16;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "macAppKitToolbarHeight");
      v15 = v14;

    }
  }
  else
  {
    v15 = *v3;
  }
  v17 = v15;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)_updateTitleAnimated:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a3;
  if (!-[CKComposeChatController sendingViaCardUI](self, "sendingViaCardUI")
    && !CKIsRunningInMacCatalyst())
  {
    if (self->_overrideTitle
      && (-[CKComposeChatController navbarManager](self, "navbarManager"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[CKComposeChatController navbarManager](self, "navbarManager");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateTitle:animated:", self->_overrideTitle, 0);
    }
    else
    {
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expandedRecipients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKChatController entryView](self, "entryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "composition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "mediaObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v7, "count"))
        goto LABEL_9;
      -[CKCoreChatController conversation](self, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendingService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_headerTitleForPendingMediaObjects:subject:onService:", v10, v12, v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_9:
        CKFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[CKComposeChatController navbarManager](self, "navbarManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[CKComposeChatController navbarManager](self, "navbarManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "updateTitle:animated:", v20, v3);
      }
      else
      {
        -[CKComposeChatController navigationItem](self, "navigationItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v19;
        if (v3)
          objc_msgSend(v19, "_setTitle:animated:matchBarButtonItemAnimationDuration:", v20, 1, 1);
        else
          objc_msgSend(v19, "setTitle:", v20);
      }

    }
  }
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldForceOpaqueMask:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 0;
}

- (BOOL)shouldUseMacRecipientsView
{
  return 0;
}

- (void)_configureTitleView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[CKComposeChatController navbarManager](self, "navbarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = v5;
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setHideTrailingBarButtons:", 1);
    objc_msgSend(v7, "setHideStandardTitle:", 1);
    objc_msgSend(v7, "setHideLeadingBarButtons:", 1);
    objc_msgSend(v7, "setHideBackButton:", 1);
    objc_msgSend(v7, "setHeight:", v6);
    objc_msgSend(v7, "addSubview:", v4);
    -[CKComposeChatController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleView:", v7);

    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    objc_msgSend(v4, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    objc_msgSend(v4, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    objc_msgSend(v4, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v16);

  }
}

- (BOOL)shouldUseNavigationBarCanvasView
{
  return 0;
}

- (void)navbarManagerIsAnimatingNavbarTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[CKComposeChatController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKComposeChatController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleView");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  -[CKComposeChatController navbarManager](self, "navbarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v16, "setHeight:", v9);
  -[CKComposeChatController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[CKComposeChatController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

- (BOOL)shouldShowComposeCancelItem
{
  return CKIsRunningInMacCatalyst() == 0;
}

- (void)_updateNavigationButtons
{
  void *v3;
  id v4;

  if (-[CKComposeChatController shouldShowComposeCancelItem](self, "shouldShowComposeCancelItem"))
  {
    -[CKComposeChatController composeCancelItem](self, "composeCancelItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", -[CKCoreChatController isSendingMessage](self, "isSendingMessage") ^ 1);
    -[CKComposeChatController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
}

- (UIBarButtonItem)composeCancelItem
{
  UIBarButtonItem *composeCancelItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  composeCancelItem = self->_composeCancelItem;
  if (!composeCancelItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA380]);
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 1, self, sel_cancelButtonTapped);
    v8 = self->_composeCancelItem;
    self->_composeCancelItem = v7;

    composeCancelItem = self->_composeCancelItem;
  }
  return composeCancelItem;
}

- (void)cancelCompose
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[CKComposeChatController setNewComposeCancelled:](self, "setNewComposeCancelled:", 1);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchResultsHidden:", 1);

  -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 0);
  -[CKChatController splitViewController](self, "splitViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[CKChatController splitViewController](self, "splitViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isCollapsed"),
        v7,
        v6,
        v8))
  {
    -[CKChatController dismissKeyboard](self, "dismissKeyboard");
    -[CKComposeChatController reloadInputViews](self, "reloadInputViews");
  }
  -[CKCoreChatController inputController](self, "inputController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestPhotoBrowserToUnstageAllImages");

  -[CKCoreChatController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "composeChatControllerDidCancelComposition:", self);

}

- (BOOL)shouldShowEntryView
{
  int v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  char v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKComposeChatController;
  if (-[CKChatController shouldShowEntryView](&v10, sel_shouldShowEntryView))
  {
    if (!-[CKComposeChatController newComposeCancelled](self, "newComposeCancelled"))
    {
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSearchResultsHidden");

      if ((v7 & 1) != 0)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      v3 = IMOSLoggingEnabled();
      if (!v3)
        return v3;
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      *(_WORD *)v9 = 0;
      v5 = "Not showing entry view because recipient search results are visible";
      goto LABEL_9;
    }
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        v5 = "Not showing entry view because new compose is cancelled";
LABEL_9:
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, v5, v9, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        v5 = "Not showing entry view because super.shouldShowEntryView is false";
        goto LABEL_9;
      }
LABEL_10:

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)entryViewRequiresCollectionView
{
  return 0;
}

- (id)inputAccessoryViewController
{
  void *v3;
  objc_super v5;

  if (CKInputAccessoryViewControllerEnabled()
    && -[CKComposeChatController shouldShowEntryView](self, "shouldShowEntryView"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    -[CKChatController inputAccessoryViewController](&v5, sel_inputAccessoryViewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)inputAccessoryView
{
  void *v3;
  objc_super v5;

  if (CKInputAccessoryViewControllerEnabled()
    || !-[CKComposeChatController shouldShowEntryView](self, "shouldShowEntryView"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKComposeChatController;
    -[CKChatController inputAccessoryView](&v5, sel_inputAccessoryView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)_entryViewTopInsetPadding
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collapsedHeight");
  v5 = v4;

  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromFieldContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fromFieldContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;

      return v5 + v12 + 2.0;
    }
  }
  return v5;
}

- (void)reloadEntryViewIfNeeded
{
  NSObject *v3;
  CKMentionsController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKMentionsController *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CKComposeChatController reloadEntryViewIfNeeded]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", buf, 0xCu);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)CKComposeChatController;
  -[CKChatController reloadEntryViewIfNeeded](&v11, sel_reloadEntryViewIfNeeded);
  v4 = [CKMentionsController alloc];
  -[CKChatController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKMentionsController initWithEntryTextView:conversation:](v4, "initWithEntryTextView:conversation:", v7, v8);
  -[CKChatController setMentionsController:](self, "setMentionsController:", v9);

  -[CKComposeChatController _reloadMentionsData](self, "_reloadMentionsData");
  -[CKChatController entryView](self, "entryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "setComposingRecipient:", -[CKComposeChatController isComposingRecipient](self, "isComposingRecipient"));
    objc_msgSend(v10, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));
    objc_msgSend(v10, "setUnreachableEmergencyRecipient:", -[CKComposeChatController hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient"));
  }

}

- (BOOL)reloadEntryViewForStagedPluginMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  BOOL v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKChatController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfPluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
    goto LABEL_12;
  IMBalloonExtensionIDWithSuffix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {

    goto LABEL_12;
  }
  v8 = -[CKComposeChatController recipientsListChanged](self, "recipientsListChanged");

  if (!v8)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[CKComposeChatController recipientsListChanged](self, "recipientsListChanged");
      v11 = "NO";
      if (v10)
        v11 = "YES";
      v14 = 136315138;
      v15 = v11;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Triggering an entry view reload since Check-in Message is staged in new compose, recipientsListChanged, %s", (uint8_t *)&v14, 0xCu);
    }

  }
  -[CKComposeChatController setRecipientsListChanged:](self, "setRecipientsListChanged:", 0);
  v12 = 1;
LABEL_13:

  return v12;
}

- (BOOL)_shouldValidatePayloadBeforeSendingPayload:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "requiresValidation");
  else
    v4 = 0;

  return v4;
}

- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  void *v6;
  char isKindOfClass;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKComposeChatController;
  -[CKChatController messageEntryViewDidChange:isTextChange:isShelfChange:](&v9, sel_messageEntryViewDidChange_isTextChange_isShelfChange_, a3, a4, a5);
  -[CKComposeChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
  -[CKChatController _currentPresentationController](self, "_currentPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKChatController composition](self, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController setModalInPresentation:](self, "setModalInPresentation:", objc_msgSend(v8, "hasContent"));

  }
}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  -[CKChatController effectPickerWindow](self, "effectPickerWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v7 = "Effect picker window is not nil. Return.";
LABEL_9:
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if (-[CKCoreChatController isSendingMessage](self, "isSendingMessage"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v7 = "isSendingMessage. Return.";
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  else
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowedByScreenTime");

    if ((v9 & 1) != 0)
    {
      +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__passKitUIDismissed_, CFSTR("CKPluginExtensionStateObserverPassKitUIDismissed"), 0);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke;
      v13[3] = &unk_1E274C848;
      v13[4] = self;
      objc_msgSend(v4, "compositionWithAcceptedAutocorrection:", v13);
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
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Handle is not allowed by the screentime policy. Return.", buf, 2u);
        }

      }
      -[CKChatController showScreenTimeShieldIfNeeded](self, "showScreenTimeShieldIfNeeded");
    }
  }

}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD aBlock[5];
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "shelfPluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_shouldValidatePayloadBeforeSendingPayload:", v4);
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "shouldValidatePayload", buf, 2u);
      }

    }
    v8 = v4;
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllerForPluginIdentifier:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D362F8], &stru_1E276D870);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D36318], &stru_1E276D870);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_triggerRecipientFinalization");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "senderIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSender:", v17);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recipientStrings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setRecipients:", v19);
    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_210;
    v30[3] = &unk_1E2756410;
    v20 = *(_QWORD *)(a1 + 32);
    v31 = v3;
    v32 = v20;
    v33 = v8;
    v21 = v3;
    v22 = v8;
    objc_msgSend(v11, "validatePayloadForSending:associatedText:completionHandler:", v22, v15, v30);

  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Should not validate payload", buf, 2u);
      }

    }
    v24 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(*(id *)(a1 + 32), "setTimingCollectionSendGelato:", v24);

    objc_msgSend(*(id *)(a1 + 32), "timingCollectionSendGelato");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startTimingForKey:", CFSTR("sendGelato"));

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_221;
    aBlock[3] = &unk_1E274A108;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v29 = v3;
    v11 = v3;
    v26 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "composeRecipientSelectionController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "atomizeAndInvokeBlock:", v26);

  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_210(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "In validatePayloadForSending.", buf, 2u);
    }

  }
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_211;
    block[3] = &unk_1E274A0B8;
    v20 = v7;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v21 = v10;
    v22 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 48), "pluginBundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          v24 = v14;
          v25 = 2112;
          v26 = v15;
          v27 = 2112;
          v28 = v8;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Payload validation from plugin %@ for payload (%@) failed. reason %@", buf, 0x20u);

        }
      }
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_215;
      v17[3] = &unk_1E274A108;
      v17[4] = *(_QWORD *)(a1 + 40);
      v18 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v17);

    }
    if (CKIsRunningInMessagesViewService())
    {
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2_216;
      v16[3] = &unk_1E274A208;
      v16[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], v16);
    }
  }

}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_211(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  __int16 v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2;
  aBlock[3] = &unk_1E274A0B8;
  v13 = a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v14 = v2;
  v15 = v3;
  v4 = _Block_copy(aBlock);
  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "passKitUIPresented");

  v7 = IMOSLoggingEnabled();
  if ((v6 & 1) != 0)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Calling setDeferredSendAnimationBlock.", (uint8_t *)&v11, 2u);
      }

    }
    objc_msgSend(a1[6], "setDeferredSendAnimationBlock:", v4);
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "passKitUIPresented is not presented.", (uint8_t *)&v11, 2u);
      }

    }
    objc_msgSend(a1[6], "composeRecipientSelectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "atomizeAndInvokeBlock:", v4);

  }
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_3;
  v5[3] = &unk_1E274D9E8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v2, v5);

}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "compositionByAppendingComposition:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Calling sendComposition with composition after validating payload", v9, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "sendCompositionIfAllowed:", v7);

}

uint64_t __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_215(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showPayloadValidationAlertWithDescription:", *(_QWORD *)(a1 + 40));
}

void __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_2_216(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

uint64_t __57__CKComposeChatController_messageEntryViewSendButtonHit___block_invoke_221(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCompositionIfAllowed:", *(_QWORD *)(a1 + 40));
}

- (void)_passKitUIDismissed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD block[5];

  -[CKComposeChatController deferredSendAnimationBlock](self, "deferredSendAnimationBlock", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "passKitUIPresented");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CKPluginExtensionStateObserverPassKitUIDismissed"), 0);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__CKComposeChatController__passKitUIDismissed___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __47__CKComposeChatController__passKitUIDismissed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deferredSendAnimationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "atomizeAndInvokeBlock:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setDeferredSendAnimationBlock:", 0);
}

- (void)messageEntryViewSendButtonHitWhileDisabled:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKComposeChatController;
  -[CKChatController messageEntryViewSendButtonHitWhileDisabled:](&v8, sel_messageEntryViewSendButtonHitWhileDisabled_, a3);
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toFieldIsFirstResponder");

  if (v5)
  {
    -[CKChatController entryView](self, "entryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "makeActive");

  }
}

- (id)textViewOnscreenWithEntryView
{
  void *v2;
  void *v3;
  void *v4;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v12;
  char v13;
  objc_super *v14;
  CKComposeChatController *v15;
  objc_super v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKChatController funCameraViewController](self, "funCameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKChatController funCameraViewController](self, "funCameraViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDismissing") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  if (-[CKChatController targetFirstResponder](self, "targetFirstResponder") == 2)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "becomeFirstResponder");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        if (v8)
          v10 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "ToField tried to become first responder with success %@", buf, 0xCu);
      }

    }
    if ((v8 & 1) != 0)
      return 1;
    v16.receiver = self;
    v14 = &v16;
  }
  else
  {
    -[CKComposeChatController presentedViewController](self, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v5;
    else
      v13 = 0;

    if ((v13 & 1) != 0)
      return 0;
    v15 = self;
    v14 = (objc_super *)&v15;
  }
  v14->super_class = (Class)CKComposeChatController;
  return -[objc_super becomeFirstResponder](v14, sel_becomeFirstResponder, v15);
}

- (void)restoreInputAfterSearchPresentation
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEntryViewInputAccessory") & 1) != 0)
  {

  }
  else
  {
    v4 = -[CKChatController targetFirstResponder](self, "targetFirstResponder");

    if (!v4)
    {
      -[CKComposeChatController proposedRecipients](self, "proposedRecipients");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
        v7 = 1;
      else
        v7 = 2;
      -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", v7);
    }
  }
  -[CKComposeChatController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)sendAnimationManagerWillStartAnimation:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKComposeChatController;
  -[CKChatController sendAnimationManagerWillStartAnimation:context:](&v13, sel_sendAnimationManagerWillStartAnimation_context_, a3, v6);
  if (!-[CKComposeChatController sendingViaCardUI](self, "sendingViaCardUI")
    && !CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v6, "impactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[CKCoreChatController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "composeChatControllerShouldShowBackButtonViewDuringSendAnimation:", self);

      -[CKComposeChatController navbarManager](self, "navbarManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "commitTransitionAnimationWithConversation:shouldShowBackButtonView:", v11, v9);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __74__CKComposeChatController_sendAnimationManagerWillStartAnimation_context___block_invoke;
      v12[3] = &unk_1E274A208;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v12, 0.2);
    }
  }

}

void __74__CKComposeChatController_sendAnimationManagerWillStartAnimation_context___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  CGRect v3;

  objc_msgSend(*(id *)(a1 + 32), "composeRecipientSelectionController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "frame");
  objc_msgSend(v2, "setFrame:", v3.origin.x, -CGRectGetHeight(v3), v3.size.width, v3.size.height);

}

- (void)recipientSelectionController:(id)a3 didSelectConversation:(id)a4 isiMessagable:(BOOL)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int IsEmergencyPhoneNumber;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  CKComposeChatController *v66;
  id v67;
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v55 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "recipientSelectionController didSelectConversation: %@", buf, 0xCu);
    }

  }
  -[CKComposeChatController setRecipientsListChanged:](self, "setRecipientsListChanged:", 1);
  if (!-[CKComposeChatController newComposeCancelled](self, "newComposeCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTimingForKey:", CFSTR("didSelectConversation"));

    objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startTimingForKey:", CFSTR("composeDelegateWork"));

    -[CKCoreChatController delegate](self, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __92__CKComposeChatController_recipientSelectionController_didSelectConversation_isiMessagable___block_invoke;
      v64[3] = &unk_1E274A0B8;
      v65 = v58;
      v66 = self;
      v67 = v7;
      objc_msgSend(v57, "updateTranscript:animated:completion:", v64, 0, 0);

    }
    else
    {
      objc_msgSend(v58, "composeChatController:didSelectNewConversation:", self, v7);
    }
    -[CKComposeChatController navbarManager](self, "navbarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateContentsForConversation:", v7);

    objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopTimingForKey:", CFSTR("composeDelegateWork"));

    -[CKChatController setConversation:forceReload:](self, "setConversation:forceReload:", v7, 1);
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeFullTranscriptIfNecessary");

    objc_msgSend(v59, "expandedRecipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[CKComposeChatController hasUnreachableEmergencyRecipient](self, "hasUnreachableEmergencyRecipient");
    if (v56)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v61;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v61 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v19, "rawAddress");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            IsEmergencyPhoneNumber = IMStringIsEmergencyPhoneNumber();

            if (IsEmergencyPhoneNumber)
            {
              CKFrameworkBundle();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANNOT_SEND_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "rawAddress");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              IMNormalizedPhoneNumberForPhoneNumber();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "isEqualToIgnoringCase:", v24);

              CKFrameworkBundle();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v25)
                v28 = CFSTR("ERR_911_EMERGENCY_UNAVAILABLE_WITHOUT_SMS");
              else
                v28 = CFSTR("ERR_EMERGENCY_UNAVAILABLE_WITHOUT_SMS");
              objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E276D870, CFSTR("ChatKit"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v53, v29, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              CKFrameworkBundle();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v32, 1, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "addAction:", v33);
              objc_msgSend(v30, "presentFromViewController:animated:completion:", self, 1, 0);

              goto LABEL_23;
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_23:

    }
    -[CKCoreChatController conversation](self, "conversation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "chat");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "chatStyle") == 45;

    if (v36 && objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "objectAtIndex:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rawAddress");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "activeIMessageAccount");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKCoreChatController conversation](self, "conversation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[CKComposeChatController shouldForceToSMSForConversation:forRecipient:](self, "shouldForceToSMSForConversation:forRecipient:", v40, v54);
      if (v41 && !v55)
      {
        objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D35910], "smsService");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "accountsForService:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "firstObject");
        v45 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v45;
      }
      if (v41 || v55)
      {
        objc_msgSend(v39, "imHandleWithID:", v52);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController conversation](self, "conversation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "chat");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setRecipient:", v46);

      }
      else
      {
        v47 = v40;
      }

    }
    -[CKChatController entryView](self, "entryView", v52);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));

    -[CKChatController entryView](self, "entryView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setUnreachableEmergencyRecipient:", v56);

    objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stopTimingForKey:", CFSTR("didSelectConversation"));

    -[CKComposeChatController _invalidateBlackholeAlertView](self, "_invalidateBlackholeAlertView");
  }
  -[CKComposeChatController stageSuggestedReplies](self, "stageSuggestedReplies");

}

uint64_t __92__CKComposeChatController_recipientSelectionController_didSelectConversation_isiMessagable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "composeChatController:didSelectNewConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)recipientSelectionControllerShouldResignFirstResponder:(id)a3
{
  void *v3;
  id v4;

  -[CKChatController entryView](self, "entryView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeActive");

}

- (BOOL)shouldForceToSMSForConversation:(id)a3 forRecipient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKComposeChatController handleForRecipientNormalizedAddress:](self, "handleForRecipientNormalizedAddress:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  objc_msgSend(v6, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastFinishedMessageItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || !v11 || (objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
    {

LABEL_7:
      LOBYTE(v9) = 0;
      goto LABEL_8;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Should force conversation to SMS because lastHandleID:%@ != newHandleID:%@", (uint8_t *)&v15, 0x16u);
      }

    }
    LOBYTE(v9) = 1;
  }
LABEL_8:

  return (char)v9;
}

- (id)handleForRecipientNormalizedAddress:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D35738];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__ck_bestAccountForAddresses:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  IMStripFormattingFromAddress();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)chatForIMHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D35798];
  v4 = a3;
  objc_msgSend(v3, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingChatForIMHandle:allowRetargeting:fixChatHandle:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recipientSelectionControllerDidBecomeFirstResponder:(id)a3
{
  id v4;

  -[CKChatController entryView](self, "entryView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatController updateAppStripVisibility:animated:](self, "updateAppStripVisibility:animated:", objc_msgSend(v4, "shouldShowAppStrip"), 1);

}

- (void)recipientSelectionControllerDidChangeSize:(id)a3
{
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("RecipientSelectionChangedSize"));
}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[CKComposeChatController prepopulatedRecipients](self, "prepopulatedRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return v7;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[CKChatController visibleInputViewHeight](self, "visibleInputViewHeight", a3);
  v5 = v4;
  -[CKChatController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKChatController entryView](self, "entryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constant");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }

  return v5 + v11;
}

- (void)recipientSelectionControllerReturnPressed:(id)a3
{
  void *v3;
  id v4;

  -[CKChatController entryView](self, "entryView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeActive");

}

- (void)recipientSelectionControllerTabPressed:(id)a3
{
  -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 1);
  -[CKComposeChatController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)recipientSelectionControllerSearchListDidShowOrHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKCoreChatController collectionViewController](self, "collectionViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollsToTop:", objc_msgSend(v6, "isSearchResultsHidden"));

  -[CKComposeChatController firstResponder](self, "firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadInputViews");

  if (__CurrentTestName)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PPTSearchListDidShowOrHideNotification"), self, 0);

  }
}

- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4
{
  id v5;

  -[CKChatController entryView](self, "entryView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setComposingRecipient:", -[CKComposeChatController isComposingRecipient](self, "isComposingRecipient"));

}

- (void)recipientSelectionControllerDidPushABViewController:(id)a3
{
  -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 2);
}

- (UIView)recipientSelectionHeaderDecorationView
{
  return 0;
}

- (int64_t)recipientSelectionUserInterfaceStyleOverride
{
  return 0;
}

- (UIEdgeInsets)recipientSelectionAdditionalSearchListInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)recipientSelectionController:(id)a3 didFinishAvailaiblityLookupForRecipient:(id)a4
{
  id v5;

  -[CKChatController entryView](self, "entryView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFailedRecipients:", -[CKComposeChatController hasFailedRecipients](self, "hasFailedRecipients"));

}

- (BOOL)isComposingRecipient
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v6[16];

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Has nil CKRecipientSelectionController. isComposingRecipient=false. Will return early.", v6, 2u);
      }

    }
    if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
      objc_msgSend(0, "allowedByScreenTime");
    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled")
    && !objc_msgSend(v2, "allowedByScreenTime"))
  {
LABEL_11:
    LOBYTE(v3) = 0;
    goto LABEL_12;
  }
  v3 = objc_msgSend(v2, "finishedComposingRecipients") ^ 1;
LABEL_12:

  return v3;
}

- (BOOL)hasUnreachableEmergencyRecipient
{
  void *v2;
  void *v3;
  char v4;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasUnreachableEmergencyRecipient");
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasFailedRecipients
{
  void *v2;
  void *v3;
  char v4;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasFailediMessageRecipients");
  else
    v4 = 0;

  return v4;
}

- (void)showConversation:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CKCoreChatController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showConversation:animate:", v6, v4);

}

- (void)_saveDraftState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[CKComposeChatController newComposeCancelled](self, "newComposeCancelled")
    || -[CKChatController isAnimatingMessageSend](self, "isAnimatingMessageSend"))
  {
    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearDraftForPendingConversation");
  }
  else
  {
    -[CKCoreChatController inputController](self, "inputController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestPhotoBrowserToPrepareForDraft");

    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proposedRecipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composeRecipientAddresses");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatController entryView](self, "entryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDraftForPendingConversation:withRecipients:", v8, v9);

  }
}

- (BOOL)_shouldRestoreDraftState
{
  void *v3;
  int v4;
  void *v5;

  -[CKChatController composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasContent") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[CKComposeChatController prepopulatedComposition](self, "prepopulatedComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasContent") ^ 1;

  }
  return v4;
}

- (void)prepareToDismissForSecondInstance
{
  void *v3;
  objc_super v4;

  -[CKChatController effectPickerViewController](self, "effectPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKChatController requestDismissKeyboardSnapshotForEffectPickerIfNeeded](self, "requestDismissKeyboardSnapshotForEffectPickerIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)CKComposeChatController;
  -[CKChatController prepareToDismissForSecondInstance](&v4, sel_prepareToDismissForSecondInstance);
}

- (BOOL)_chatShowsAccountRegistrationFailureBanner
{
  return 0;
}

- (BOOL)_showOrHideNicknameBannerIfNeeded
{
  return 0;
}

- (BOOL)_wantsCatchUpAffordance
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v6 = a4;
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");

  if (v9)
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "canPerformAction:withSender:", a3, v6);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CKComposeChatController;
    v12 = -[CKChatController canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
  }

  return v12;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  objc_super v8;

  if (-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController businessHandle](self, "businessHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "statusBarStyleForBusinessHandle:", v5);

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKComposeChatController;
    return -[CKChatController preferredStatusBarStyle](&v8, sel_preferredStatusBarStyle);
  }
}

- (void)_updateNavigationUI
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
  v13.super_class = (Class)CKComposeChatController;
  -[CKChatController _updateNavigationUI](&v13, sel__updateNavigationUI);
  -[CKComposeChatController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController businessHandle](self, "businessHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryBrandColorForBusinessHandle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v10);

  -[CKComposeChatController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollEdgeAppearance:", v6);

  -[CKComposeChatController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStandardAppearance:", v6);

  -[CKComposeChatController _updateBizNavbarIfNecessary](self, "_updateBizNavbarIfNecessary");
}

- (void)_reloadMentionsData
{
  void *v2;
  void *v3;
  id v4;

  -[CKChatController entryView](self, "entryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadMentionsData");

}

- (void)_triggerRecipientFinalization
{
  void *v2;
  void *v3;
  id v4;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)_updateBlackholeAlertView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  unint64_t blackholeAlertStatus;
  void *v10;
  void *v11;
  void *v12;
  CKTranscriptMultilineLabelCell *v13;
  CKTranscriptMultilineLabelCell *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  dispatch_queue_t v45;
  OS_dispatch_queue *blackholeAlertStatusQueue;
  id v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  id v54;
  id v55;
  id v56;
  id location;

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsSenderBlackholeWarning");
    if (self)
    {
      v8 = 1;
      if (v7)
        v8 = 2;
      self->_blackholeAlertStatus = v8;
    }

    if (!self)
      goto LABEL_12;
  }
  else
  {
    if (self)
    {
      blackholeAlertStatus = self->_blackholeAlertStatus;
      if (blackholeAlertStatus)
        goto LABEL_10;
      self->_blackholeAlertStatus = 1;
    }
    -[CKCoreChatController conversation](self, "conversation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "senderIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKCoreChatController conversation](self, "conversation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "recipient");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "IDSCanonicalAddress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0;
    objc_initWeak(&location, self);
    if (!self || !self->_blackholeAlertStatusQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = dispatch_queue_create("CKComposeChatController Blackhole Status", v44);
      -[CKComposeChatController setBlackholeAlertStatusQueue:]((uint64_t)self, v45);

    }
    if (self)
      blackholeAlertStatusQueue = self->_blackholeAlertStatusQueue;
    else
      blackholeAlertStatusQueue = 0;
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = __52__CKComposeChatController__updateBlackholeAlertView__block_invoke;
    v53 = &unk_1E274B240;
    v54 = v40;
    v55 = v43;
    v47 = v43;
    v48 = v40;
    v49 = blackholeAlertStatusQueue;
    objc_copyWeak(&v56, &location);
    dispatch_async(v49, &v50);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
    if (!self)
      goto LABEL_12;
  }
  blackholeAlertStatus = self->_blackholeAlertStatus;
LABEL_10:
  if (blackholeAlertStatus != 2
    || (-[CKCoreChatController collectionViewController](self, "collectionViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
LABEL_12:
    -[CKComposeChatController blackholeAlertView](self, "blackholeAlertView", v50, v51, v52, v53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[CKComposeChatController setBlackholeAlertView:](self, "setBlackholeAlertView:", 0);
    return;
  }
  -[CKComposeChatController blackholeAlertView](self, "blackholeAlertView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = [CKTranscriptMultilineLabelCell alloc];
    v14 = -[CKTranscriptLabelCell initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v15 = objc_alloc(MEMORY[0x1E0CB3778]);
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HAWKING_WARNING_NON_CELLULAR"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v17, 0);

    objc_msgSend(v18, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
    v19 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hawkingWarningIcon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setImage:", v21);
    objc_msgSend(v19, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transcriptBoldFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pointSize");
    v25 = v24;

    objc_msgSend(v21, "size");
    v27 = v26;
    objc_msgSend(v21, "size");
    v29 = v25 * (v27 / v28);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "transcriptBoldFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "capHeight");
    v33 = (v32 - v25) * 0.5;

    objc_msgSend(v19, "setBounds:", 0.0, v33, v29, v25);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertAttributedString:atIndex:", v34, 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "transcriptEmphasizedFontAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addAttributes:range:", v36, 0, objc_msgSend(v18, "length"));
    -[CKTranscriptLabelCell setAttributedText:](v14, "setAttributedText:", v18);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stampTranscriptInsets");
    -[CKEditableCollectionViewCell setContentInsets:](v14, "setContentInsets:");

    -[CKTranscriptStampCell setOrientation:](v14, "setOrientation:", 1);
    -[CKComposeChatController setBlackholeAlertView:](self, "setBlackholeAlertView:", v14);
    -[CKComposeChatController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "insertSubview:atIndex:", v14, 0);

  }
}

- (void)setBlackholeAlertStatusQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 2568), a2);
}

void __52__CKComposeChatController__updateBlackholeAlertView__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(MEMORY[0x1E0D39AF8], "shouldShowSMSWarningForSender:forRecipient:withConversationHistory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CKComposeChatController__updateBlackholeAlertView__block_invoke_2;
  v3[3] = &unk_1E2756438;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __52__CKComposeChatController__updateBlackholeAlertView__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = 1;
    if (*(_BYTE *)(a1 + 40))
      v3 = 2;
    WeakRetained[320] = v3;
  }
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_updateBlackholeAlertView");

}

- (void)_invalidateBlackholeAlertView
{
  if (self)
    self->_blackholeAlertStatus = 0;
  -[CKComposeChatController _updateBlackholeAlertView](self, "_updateBlackholeAlertView");
}

- (void)_updateSendLaterCompositionIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCapabilities:", 0x80000);

  if ((v5 & 1) == 0)
  {
    -[CKChatController composition](self, "composition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendLaterPluginInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Current conversation does not allow send later. Removing sendLaterPluginInfo", v10, 2u);
        }

      }
      -[CKChatController entryView](self, "entryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSendLaterPluginInfo:animated:", 0, 0);

    }
  }
}

- (BOOL)_isBusinessConversation
{
  void *v3;
  char v4;
  void *v5;

  -[CKComposeChatController businessHandle](self, "businessHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CKCoreChatController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isBusinessConversation");

  }
  return v4;
}

- (BOOL)_isNewBusinessConversation
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation")
    || -[CKComposeChatController isSendingComposition](self, "isSendingComposition"))
  {
    return 0;
  }
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "messageCount") == 0;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)_updateBusinessInfoIfNecessary
{
  -[CKComposeChatController setBusinessInfoViewInfoIfNecessary](self, "setBusinessInfoViewInfoIfNecessary");
  -[CKComposeChatController _updateBizNavbarIfNecessary](self, "_updateBizNavbarIfNecessary");
}

- (void)_updateBizNavbarIfNecessary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = -[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation");
  -[CKComposeChatController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController businessHandle](self, "businessHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "enableBranding:forBusinessHandle:", 1, v6);

    -[CKComposeChatController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "enableBranding:forBusinessHandle:", 0, v6);

    -[CKComposeChatController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setAccessibilityIgnoresInvertColors:", v10);

  -[CKComposeChatController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)setBusinessInfoViewInfoIfNecessary
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  CKBusinessInfoView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;

  if (!-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation"))
    return;
  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChatBot");

  if ((v4 & 1) != 0)
    return;
  v5 = -[CKComposeChatController _isNewBusinessConversation](self, "_isNewBusinessConversation");
  -[CKComposeChatController businessInfoView](self, "businessInfoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "removeFromSuperview");

    -[CKComposeChatController setBusinessInfoView:](self, "setBusinessInfoView:", 0);
    return;
  }

  if (!v7)
  {
    v8 = -[CKBusinessInfoView initWithLayoutType:]([CKBusinessInfoView alloc], "initWithLayoutType:", 0);
    -[CKComposeChatController setBusinessInfoView:](self, "setBusinessInfoView:", v8);

    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
  -[CKChatController entryView](self, "entryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKComposeChatController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatController entryView](self, "entryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:belowSubview:", v12, v13);

LABEL_9:
    goto LABEL_12;
  }
  -[CKComposeChatController businessInfoView](self, "businessInfoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[CKComposeChatController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);
    goto LABEL_9;
  }
LABEL_12:
  -[CKCoreChatController conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
    return;
  -[CKCoreChatController conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recipients");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "defaultIMHandle");
  v76 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v76, "brand");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isInternalInstall") & 1) == 0)
  {

    goto LABEL_19;
  }
  -[CKComposeChatController bizIntent](self, "bizIntent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("biz-greeting-txt"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_19:
    objc_msgSend(v76, "brand");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "name");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
LABEL_29:

      goto LABEL_30;
    }
    v35 = (void *)v34;
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "greetingText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("BUSINESS_GREETING_DEFAULT_BRAND"), &stru_1E276D870, CFSTR("ChatKit"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "brand");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "userInterfaceLayoutDirection");

    if (v45 == 1)
      v46 = CFSTR("\u200F");
    else
      v46 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v46, "stringByAppendingString:", v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v37, "isEqualToString:", v47);
    if ((v48 & 1) != 0)
      goto LABEL_30;
    v49 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("BUSINESS_GREETING_DEFAULT_BRAND"), &stru_1E276D870, CFSTR("ChatKit"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "brand");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "name");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringWithFormat:", v51, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "userInterfaceLayoutDirection");

    if (v56 == 1)
      v57 = CFSTR("\u200F");
    else
      v57 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v57, "stringByAppendingString:", v54);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setGreetingText:", v31);
LABEL_28:

    goto LABEL_29;
  }
  -[CKComposeChatController businessInfoView](self, "businessInfoView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "greetingText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeChatController bizIntent](self, "bizIntent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("biz-greeting-txt"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v27, "isEqualToString:", v29);

  if ((v30 & 1) == 0)
  {
    -[CKComposeChatController bizIntent](self, "bizIntent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("biz-greeting-txt"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setGreetingText:", v32);

    goto LABEL_28;
  }
LABEL_30:
  -[CKComposeChatController businessInfoView](self, "businessInfoView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "descriptionText");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "brand");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedResponseTime");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v59, "isEqualToString:", v61);

  if ((v62 & 1) == 0)
  {
    objc_msgSend(v76, "brand");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "localizedResponseTime");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setDescriptionText:", v64);

  }
  -[CKComposeChatController layoutBusinessInfoViewIfNecessary](self, "layoutBusinessInfoViewIfNecessary");
LABEL_33:
  objc_msgSend(v76, "brand");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "name");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {

  }
  else
  {
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "greetingText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("BUSINESS_GREETING_DEFAULT_NO_BRAND"), &stru_1E276D870, CFSTR("ChatKit"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v69, "isEqualToString:", v71);

    if ((v72 & 1) == 0)
    {
      CKFrameworkBundle();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("BUSINESS_GREETING_DEFAULT_NO_BRAND"), &stru_1E276D870, CFSTR("ChatKit"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeChatController businessInfoView](self, "businessInfoView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setGreetingText:", v74);

      -[CKComposeChatController layoutBusinessInfoViewIfNecessary](self, "layoutBusinessInfoViewIfNecessary");
    }
  }

}

- (void)layoutBusinessInfoViewIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
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
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double MaxY;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  char v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double Width;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  id v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  -[CKComposeChatController businessInfoView](self, "businessInfoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKComposeChatController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = *MEMORY[0x1E0C9D648];
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v54 = v13;
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "toField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      -[CKComposeChatController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "toField");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertRect:fromView:", v28, v19, v21, v23, v25);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v56.origin.x = v30;
      v56.origin.y = v32;
      v56.size.width = v34;
      v56.size.height = v36;
      MaxY = CGRectGetMaxY(v56);
      -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fromFieldContainerView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "frame");
      if (v40 <= 0.0)
      {
        v13 = v54;
      }
      else
      {
        v41 = v40;
        -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "fromFieldContainerView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isHidden");

        v13 = v54;
        if ((v44 & 1) == 0)
        {
          objc_msgSend(v39, "frame");
          MaxY = v41 + v45;
        }
      }
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "useMacToolbar");

      if ((v47 & 1) != 0)
      {
        -[CKChatController businessMacToolbarController](self, "businessMacToolbarController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "view");
      }
      else
      {
        -[CKComposeChatController navigationController](self, "navigationController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "navigationBar");
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "frame");
      MaxY = CGRectGetMaxY(v57);

    }
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v10;
    v58.size.height = v12;
    Width = CGRectGetWidth(v58);
    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v10;
    v59.size.height = v12;
    objc_msgSend(v50, "sizeThatFits:", CGRectGetWidth(v59), 1.79769313e308);
    v52 = v51;

    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", v13, MaxY, Width, v52);

    -[CKComposeChatController businessInfoView](self, "businessInfoView");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setNeedsLayout");

  }
}

- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifer:", *MEMORY[0x1E0D651E0], a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", self);
  objc_msgSend(v5, "present");

}

- (void)handleCancelAction:(id)a3
{
  -[CKComposeChatController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)handleAddressBookChange:(id)a3
{
  id v3;

  -[CKComposeChatController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)shouldPresentBlockingDowntimeViewController
{
  return 1;
}

- (UIView)virtualToolbarItem
{
  void *v3;
  UIView *v4;
  UIView *v5;

  if (-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation"))
    -[CKChatController businessMacToolbarController](self, "businessMacToolbarController");
  else
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (v4 && self->_virtualToolbarItem != v4)
    objc_storeStrong((id *)&self->_virtualToolbarItem, v4);
  v5 = self->_virtualToolbarItem;

  return v5;
}

- (void)configureWithToolbarController:(id)a3
{
  CKBusinessMacToolbarViewController *v4;
  void *v5;
  CKBusinessMacToolbarViewController *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  -[CKChatController configureWithToolbarController:](&v7, sel_configureWithToolbarController_, a3);
  if (-[CKComposeChatController _isBusinessConversation](self, "_isBusinessConversation"))
  {
    v4 = [CKBusinessMacToolbarViewController alloc];
    -[CKComposeChatController businessHandle](self, "businessHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKBusinessMacToolbarViewController initWithConversation:showingInStandAloneWindow:](v4, "initWithConversation:showingInStandAloneWindow:", v5, -[CKCoreChatController showingInStandAloneWindow](self, "showingInStandAloneWindow"));
    -[CKChatController setBusinessMacToolbarController:](self, "setBusinessMacToolbarController:", v6);

  }
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKComposeChatController;
  -[CKChatController providerWillBeRemovedFromToolbarController:](&v7, sel_providerWillBeRemovedFromToolbarController_, a3);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "useMacToolbar"))
  {
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (BOOL)prefersBottomDividerHidden
{
  double v2;
  double v3;
  void *v4;
  double v5;
  BOOL v6;

  -[CKChatController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
  v3 = v2;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "macAppKitToolbarHeight");
  v6 = v3 > v5;

  return v6;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  return 0;
}

- (BOOL)reparentToolbarItem:(id)a3
{
  return 0;
}

- (UIEdgeInsets)virtualToolbarContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)virtualView
{
  void *v3;

  if (-[CKCoreChatController isShowingLockoutView](self, "isShowingLockoutView"))
  {
    v3 = 0;
  }
  else
  {
    -[CKComposeChatController virtualToolbarItem](self, "virtualToolbarItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)canShowBusinessOnboarding
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  char v9;

  -[CKComposeChatController businessHandle](self, "businessHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CKComposeChatController businessHandle](self, "businessHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMapKitBusiness");

    if ((v6 & 1) != 0)
      return 1;
  }
  -[CKCoreChatController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMapKitBusinessConversation");

  return v9;
}

- (void)didFinishShowingBusinessOnboarding
{
  -[CKChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 1);
  -[CKComposeChatController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRecipient:", v5);

}

- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CKComposeChatController suggestionsController:didDeselectRecipient:].cold.1((uint64_t)v4, v5);

}

- (id)selectedRecipientsForSuggestionsController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (CKComposeRecipientSelectionController)composeRecipientSelectionController
{
  return self->_composeRecipientSelectionController;
}

- (void)setComposeRecipientSelectionController:(id)a3
{
  objc_storeStrong((id *)&self->_composeRecipientSelectionController, a3);
}

- (NSString)suggestedRepliesData
{
  return self->_suggestedRepliesData;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTitle, a3);
}

- (BOOL)ignoreEmailsWhenSending
{
  return self->_ignoreEmailsWhenSending;
}

- (void)setIgnoreEmailsWhenSending:(BOOL)a3
{
  self->_ignoreEmailsWhenSending = a3;
}

- (BOOL)recipientsListChanged
{
  return self->_recipientsListChanged;
}

- (void)setRecipientsListChanged:(BOOL)a3
{
  self->_recipientsListChanged = a3;
}

- (BOOL)ignoreKeyboardNotifications
{
  return self->_ignoreKeyboardNotifications;
}

- (void)setIgnoreKeyboardNotifications:(BOOL)a3
{
  self->_ignoreKeyboardNotifications = a3;
}

- (NSArray)prepopulatedRecipients
{
  return self->_prepopulatedRecipients;
}

- (CKComposition)prepopulatedComposition
{
  return self->_prepopulatedComposition;
}

- (UINavigationController)catalystComposeNavigationController
{
  return self->_catalystComposeNavigationController;
}

- (void)setCatalystComposeNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_catalystComposeNavigationController, a3);
}

- (BOOL)newComposeCancelled
{
  return self->_newComposeCancelled;
}

- (void)setNewComposeCancelled:(BOOL)a3
{
  self->_newComposeCancelled = a3;
}

- (BOOL)isSendingComposition
{
  return self->_sendingComposition;
}

- (void)setSendingComposition:(BOOL)a3
{
  self->_sendingComposition = a3;
}

- (void)setComposeCancelItem:(id)a3
{
  objc_storeStrong((id *)&self->_composeCancelItem, a3);
}

- (CKComposeNavbarManager)navbarManager
{
  return self->_navbarManager;
}

- (void)setNavbarManager:(id)a3
{
  objc_storeStrong((id *)&self->_navbarManager, a3);
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_lastAddressedHandle, a3);
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (void)setLastAddressedSIMID:(id)a3
{
  objc_storeStrong((id *)&self->_lastAddressedSIMID, a3);
}

- (NSString)prepopulatedSIMID
{
  return self->_prepopulatedSIMID;
}

- (void)setPrepopulatedSIMID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2520);
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
  objc_storeStrong((id *)&self->_bizIntent, a3);
}

- (CKBusinessInfoView)businessInfoView
{
  return self->_businessInfoView;
}

- (void)setBusinessInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_businessInfoView, a3);
}

- (IMHandle)businessHandle
{
  return self->_businessHandle;
}

- (void)setBusinessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_businessHandle, a3);
}

- (CKTranscriptMultilineLabelCell)blackholeAlertView
{
  return self->_blackholeAlertView;
}

- (void)setBlackholeAlertView:(id)a3
{
  objc_storeStrong((id *)&self->_blackholeAlertView, a3);
}

- (BOOL)sendingViaCardUI
{
  return self->_sendingViaCardUI;
}

- (void)setSendingViaCardUI:(BOOL)a3
{
  self->_sendingViaCardUI = a3;
}

- (id)deferredSendAnimationBlock
{
  return self->_deferredSendAnimationBlock;
}

- (void)setDeferredSendAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2576);
}

- (void)setVirtualToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_virtualToolbarItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualToolbarItem, 0);
  objc_storeStrong(&self->_deferredSendAnimationBlock, 0);
  objc_storeStrong((id *)&self->_blackholeAlertStatusQueue, 0);
  objc_storeStrong((id *)&self->_blackholeAlertView, 0);
  objc_storeStrong((id *)&self->_businessHandle, 0);
  objc_storeStrong((id *)&self->_businessInfoView, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_prepopulatedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_navbarManager, 0);
  objc_storeStrong((id *)&self->_composeCancelItem, 0);
  objc_storeStrong((id *)&self->_catalystComposeNavigationController, 0);
  objc_storeStrong((id *)&self->_prepopulatedComposition, 0);
  objc_storeStrong((id *)&self->_prepopulatedRecipients, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_suggestedRepliesData, 0);
  objc_storeStrong((id *)&self->_composeRecipientSelectionController, 0);
}

- (void)suggestionsController:(uint64_t)a1 didDeselectRecipient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "suggestionsController asked to deselect a recipient: %@", (uint8_t *)&v2, 0xCu);
}

@end
