@implementation CKComposeRecipientSelectionController

- (void)_layoutFromFieldShouldHide:(BOOL)a3
{
  UIView *v5;
  UIView *fromFieldContainerView;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  UIView *v29;
  UIView *fromFieldSeparator;
  UIView *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  UILabel *fromTextLabel;
  UILabel *v36;
  void *v37;
  void *v38;
  CKComposeSubscriptionSelectorButton *v39;
  CKComposeSubscriptionSelectorButton *subscriptionSelectorButton;
  CKComposeSubscriptionSelectorButton *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  UIStackView *v50;
  UIStackView *fromFieldContentStackView;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[3];

  v81[2] = *MEMORY[0x1E0C80C00];
  if (!self->_fromFieldContainerView)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    fromFieldContainerView = self->_fromFieldContainerView;
    self->_fromFieldContainerView = v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_fromFieldContainerView, "setBackgroundColor:", v7);

    -[CKComposeRecipientSelectionController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_fromFieldContainerView);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toFieldPreferredHeight");
  v11 = v10;

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "origin");
  v14 = v13;
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "origin");
  v17 = v16;
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v17 + v19;
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;

  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v14, v20, v23, v11);

  if (!self->_fromFieldSeparator)
  {
    v25 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKComposeRecipientSelectionController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;
    if (CKPixelWidth_once_17 != -1)
      dispatch_once(&CKPixelWidth_once_17, &__block_literal_global_374_2);
    v29 = (UIView *)objc_msgSend(v25, "initWithFrame:", 0.0, v11, v28, *(double *)&CKPixelWidth_sPixel_17);
    fromFieldSeparator = self->_fromFieldSeparator;
    self->_fromFieldSeparator = v29;

    -[UIView setAutoresizingMask:](self->_fromFieldSeparator, "setAutoresizingMask:", 2);
    v31 = self->_fromFieldSeparator;
    objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", self->_fromFieldSeparator);

  }
  if (_layoutFromFieldShouldHide__onceToken != -1)
    dispatch_once(&_layoutFromFieldShouldHide__onceToken, &__block_literal_global_221);
  if (!self->_fromTextLabel)
  {
    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    fromTextLabel = self->_fromTextLabel;
    self->_fromTextLabel = v34;

    -[UILabel setAttributedText:](self->_fromTextLabel, "setAttributedText:", _layoutFromFieldShouldHide__fromText);
    v36 = self->_fromTextLabel;
    -[CKRecipientSelectionController toField](self, "toField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "baseFont");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v36, "setFont:", v38);

    -[UILabel sizeToFit](self->_fromTextLabel, "sizeToFit");
  }
  if (!self->_subscriptionSelectorButton)
  {
    v39 = objc_alloc_init(CKComposeSubscriptionSelectorButton);
    subscriptionSelectorButton = self->_subscriptionSelectorButton;
    self->_subscriptionSelectorButton = v39;

    -[CKComposeSubscriptionSelectorButton setDelegate:](self->_subscriptionSelectorButton, "setDelegate:", self);
    v41 = self->_subscriptionSelectorButton;
    -[CKRecipientSelectionController toField](self, "toField");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "baseFont");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeSubscriptionSelectorButton updateTitleFont:](v41, "updateTitleFont:", v43);

  }
  -[CKComposeRecipientSelectionController menuForSubscriptionSelector](self, "menuForSubscriptionSelector");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setMenu:", v44);

  if (!self->_fromFieldContentStackView)
  {
    v46 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[CKComposeRecipientSelectionController fromTextLabel](self, "fromTextLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v47;
    -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (UIStackView *)objc_msgSend(v46, "initWithArrangedSubviews:", v49);
    fromFieldContentStackView = self->_fromFieldContentStackView;
    self->_fromFieldContentStackView = v50;

    -[UIStackView setAlignment:](self->_fromFieldContentStackView, "setAlignment:", 3);
    -[UIStackView setAxis:](self->_fromFieldContentStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](self->_fromFieldContentStackView, "setDistribution:", 3);
    -[UIStackView setLayoutMargins:](self->_fromFieldContentStackView, "setLayoutMargins:", 4.0, 0.0, 4.0, 0.0);
    -[CKComposeRecipientSelectionController fromFieldContentStackView](self, "fromFieldContentStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setLayoutMarginsRelativeArrangement:", 1);

    -[CKComposeRecipientSelectionController fromFieldContentStackView](self, "fromFieldContentStackView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKComposeRecipientSelectionController fromFieldContentStackView](self, "fromFieldContentStackView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setUserInteractionEnabled:", 1);

  }
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController fromFieldContentStackView](self, "fromFieldContentStackView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addSubview:", v56);

  -[UIStackView topAnchor](self->_fromFieldContentStackView, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 1;
  objc_msgSend(v60, "setActive:", 1);

  -[UIStackView bottomAnchor](self->_fromFieldContentStackView, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActive:", 1);

  -[UIStackView leadingAnchor](self->_fromFieldContentStackView, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toField](self, "toField");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "textView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setActive:", 1);

  -[UIStackView centerYAnchor](self->_fromFieldContentStackView, "centerYAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController fromTextLabel](self, "fromTextLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "centerYAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  -[UIStackView centerYAnchor](self->_fromFieldContentStackView, "centerYAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "centerYAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setActive:", 1);

  if (!a3)
    v61 = -[CKComposeRecipientSelectionController _shouldHideFromField](self, "_shouldHideFromField");
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setHidden:", v61);

  -[CKRecipientSelectionController delegate](self, "delegate");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "recipientSelectionControllerDidLoadFromField");

}

- (void)dealloc
{
  objc_super v3;

  -[CKComposeRecipientSelectionController setSendBlock:](self, "setSendBlock:", 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_atomizeAndSendTimeoutHandler, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController dealloc](&v3, sel_dealloc);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_atomizeAndInvokeTimeoutHandler, 0);
  -[CKComposeRecipientSelectionController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CKComposeRecipientSelectionController setHasUserSetContextPreference:](self, "setHasUserSetContextPreference:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentAlertForSubscriptionContext
{
  void *v3;
  void *v4;

  if (-[CKComposeRecipientSelectionController isFirstAppear](self, "isFirstAppear"))
  {
    if (-[CKComposeRecipientSelectionController deviceHasMultipleSubscriptions](self, "deviceHasMultipleSubscriptions"))
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "recipients");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeRecipientSelectionController configureSubscriptionContextForRecipients:](self, "configureSubscriptionContextForRecipients:", v4);

    }
    -[CKComposeRecipientSelectionController setFirstAppear:](self, "setFirstAppear:", 0);
  }
}

- (void)viewDidAppearDeferredSetup
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController viewDidAppearDeferredSetup](&v3, sel_viewDidAppearDeferredSetup);
  -[CKComposeRecipientSelectionController presentAlertForSubscriptionContext](self, "presentAlertForSubscriptionContext");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKComposeRecipientSelectionController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[CKComposeRecipientSelectionController deviceHasMultipleSubscriptions](self, "deviceHasMultipleSubscriptions"))
  {
    -[CKComposeRecipientSelectionController _layoutFromFieldShouldHide:](self, "_layoutFromFieldShouldHide:", 0);
    -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
  }
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController loadView](&v4, sel_loadView);
  -[CKComposeRecipientSelectionController setFirstAppear:](self, "setFirstAppear:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__lastAddressedHandleChangedNotification_, *MEMORY[0x1E0D353F0], 0);

}

- (void)configureSubscriptionContextForRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  CKComposeRecipientSelectionController *v30;
  uint64_t v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKComposeRecipientSelectionController deviceHasMultipleSubscriptions](self, "deviceHasMultipleSubscriptions"))
  {
    if (-[CKComposeRecipientSelectionController hasBackfilledConversation](self, "hasBackfilledConversation"))
    {
      -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
      goto LABEL_30;
    }
    if (-[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions"))
    {
      -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
    }
    if (!objc_msgSend(v4, "count"))
    {
      -[CKComposeRecipientSelectionController _defaultSubscriptionContext](self, "_defaultSubscriptionContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v10);

      goto LABEL_30;
    }
    if (!-[CKComposeRecipientSelectionController hasUserSetContextPreference](self, "hasUserSetContextPreference"))
    {
      -[CKComposeRecipientSelectionController simID](self, "simID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ctSubscriptionInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposeRecipientSelectionController simID](self, "simID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "__im_subscriptionContextForForSimID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v9);
LABEL_29:

          goto LABEL_30;
        }
      }
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v12)
      {
        v13 = v12;
        v29 = v4;
        v30 = self;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v34;
        v31 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            v18 = v15;
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v11);
            -[CKComposeRecipientSelectionController _bestSenderIdentityForRecipient:](self, "_bestSenderIdentityForRecipient:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v19;
            v20 = v19 == 0;
            if (v18)
            {
              if (v19)
              {
                objc_msgSend(v19, "accountUUID");
                v21 = v11;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "accountUUID");
                v23 = v13;
                v24 = v18;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v22, "isEqual:", v25);

                v18 = v24;
                v13 = v23;

                v11 = v21;
                self = v30;
                v16 = v31;
                if ((v26 & 1) == 0)
                {

                  v14 = 1;
                  goto LABEL_25;
                }
              }
            }
            v14 |= v20;

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v13)
            continue;
          break;
        }

        if (v15)
        {
          v18 = v15;
LABEL_25:
          v4 = v29;
          objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "ctSubscriptionInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "__im_subscriptionContextForSenderIdentity:", v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v9);
          if ((v14 & 1) == 0)
            goto LABEL_28;
LABEL_26:
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __83__CKComposeRecipientSelectionController_configureSubscriptionContextForRecipients___block_invoke;
          v32[3] = &unk_1E2758F30;
          v32[4] = self;
          -[CKComposeRecipientSelectionController presentContextSelectionAlertWithCompletion:](self, "presentContextSelectionAlertWithCompletion:", v32);
          goto LABEL_28;
        }
        -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", 0);
        v9 = 0;
        v18 = 0;
        v4 = v29;
        if ((v14 & 1) != 0)
          goto LABEL_26;
      }
      else
      {

        -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", 0);
        v9 = 0;
        v18 = 0;
      }
LABEL_28:

      goto LABEL_29;
    }
  }
LABEL_30:

}

void __83__CKComposeRecipientSelectionController_configureSubscriptionContextForRecipients___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = IMOSLoggingEnabled();
  if (v5 && a2)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "selectedSubscriptionContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", (uint8_t *)&v14, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setHasUserSetContextPreference:", 1);
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "No subscription info found (or user cancelled action). Setting to default context", (uint8_t *)&v14, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "selectedSubscriptionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_defaultSubscriptionContext");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v5 = v13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setSelectedSubscriptionContext:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateFromFieldIfNeeded");

}

- (TUSenderIdentity)selectedSenderIdentity
{
  void *v3;
  TUSenderIdentity *selectedSenderIdentity;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TUSenderIdentity *v12;
  TUSenderIdentity *v13;
  TUSenderIdentity *v14;

  -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selectedSenderIdentity = self->_selectedSenderIdentity;
  if (selectedSenderIdentity)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "labelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "telephonyProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "senderIdentityForAccountUUID:", v8);
    v12 = (TUSenderIdentity *)objc_claimAutoreleasedReturnValue();
    v13 = self->_selectedSenderIdentity;
    self->_selectedSenderIdentity = v12;

    selectedSenderIdentity = self->_selectedSenderIdentity;
  }
  v14 = selectedSenderIdentity;

  return v14;
}

- (CTXPCServiceSubscriptionContext)selectedSubscriptionContext
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  CTXPCServiceSubscriptionContext *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  CTXPCServiceSubscriptionContext *selectedSubscriptionContext;
  _BOOL4 v31;
  const __CFString *v32;
  CTXPCServiceSubscriptionContext *v33;
  void *v35;
  void *v36;
  void *v37;
  CTXPCServiceSubscriptionContext *v38;
  uint8_t buf[4];
  CTXPCServiceSubscriptionContext *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  CTXPCServiceSubscriptionContext *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) == 0 && !IMIsRunningInUnitTesting())
    return (CTXPCServiceSubscriptionContext *)0;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumbersOfActiveSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAddressedHandleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stripFZIDPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController conversation](self, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastAddressedHandleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((IMStringIsEmail() & 1) == 0
    && objc_msgSend(v5, "containsObject:", v10)
    && -[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions")&& -[CKComposeRecipientSelectionController hasBackfilledConversation](self, "hasBackfilledConversation"))
  {
    -[CKComposeRecipientSelectionController recipients](self, "recipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ctSubscriptionInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController conversation](self, "conversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "chat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastAddressedSIMID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController conversation](self, "conversation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "chat");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastAddressedHandleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "__im_subscriptionContextForForSimID:phoneNumber:", v18, v21);
      v38 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();

      if (self->_selectedSubscriptionContext != v38)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            -[CKRecipientSelectionController conversation](self, "conversation");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "chat");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lastAddressedHandleID");
            v24 = (CTXPCServiceSubscriptionContext *)(id)objc_claimAutoreleasedReturnValue();
            v25 = CFSTR("YES");
            if (-[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions"))
            {
              v26 = CFSTR("YES");
            }
            else
            {
              v26 = CFSTR("NO");
            }
            if (!-[CKComposeRecipientSelectionController hasBackfilledConversation](self, "hasBackfilledConversation"))
              v25 = CFSTR("NO");
            -[CKComposeRecipientSelectionController recipients](self, "recipients");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v40 = v24;
            v41 = 2112;
            v42 = v26;
            v43 = 2112;
            v44 = v25;
            v45 = 2048;
            v46 = objc_msgSend(v27, "count");
            v47 = 2112;
            v48 = v38;
            _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Updating subscriptionContext for lastAddressedHandleID = %@, hasMultipleActiveSubscriptions = %@, hasBackfilledConversation = %@, recipientCount = %lu to: %@", buf, 0x34u);

          }
        }
        -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v38);
      }

    }
  }
  else
  {

  }
  if (!self->_selectedSubscriptionContext)
  {
    -[CKComposeRecipientSelectionController _defaultSubscriptionContext](self, "_defaultSubscriptionContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v28);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        selectedSubscriptionContext = self->_selectedSubscriptionContext;
        v31 = -[CKComposeRecipientSelectionController hasiMessageableContext](self, "hasiMessageableContext");
        v32 = CFSTR("NO");
        if (v31)
          v32 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v40 = selectedSubscriptionContext;
        v41 = 2112;
        v42 = v32;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "selectedSubscriptionContext was nil, default context is %@ hasiMessageableContext: %@", buf, 0x16u);
      }

    }
  }
  v33 = self->_selectedSubscriptionContext;

  return v33;
}

- (void)setSelectedSubscriptionContext:(id)a3
{
  CTXPCServiceSubscriptionContext *v5;
  id *p_selectedSubscriptionContext;
  NSObject *v7;
  id v8;
  TUSenderIdentity *selectedSenderIdentity;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  CTXPCServiceSubscriptionContext *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (CTXPCServiceSubscriptionContext *)a3;
  p_selectedSubscriptionContext = (id *)&self->_selectedSubscriptionContext;
  if (self->_selectedSubscriptionContext != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *p_selectedSubscriptionContext;
        v36 = 138412546;
        v37 = v5;
        v38 = 2112;
        v39 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Updating selected subscription context to %@ from %@", (uint8_t *)&v36, 0x16u);
      }

    }
    objc_storeStrong((id *)&self->_selectedSubscriptionContext, a3);
    selectedSenderIdentity = self->_selectedSenderIdentity;
    self->_selectedSenderIdentity = 0;

    objc_msgSend(*p_selectedSubscriptionContext, "labelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_selectedSubscriptionContext, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_20;
    -[CKRecipientSelectionController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedLastAddressedHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x193FF417C](v13, v11))
    {
      -[CKRecipientSelectionController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectedLastAddressedSIMID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x193FF417C](v15, v10);

      -[CKRecipientSelectionController conversation](self, "conversation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelectedLastAddressedHandle:", v11);

      -[CKRecipientSelectionController conversation](self, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSelectedLastAddressedSIMID:", v10);

      if ((v16 & 1) != 0)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {

      -[CKRecipientSelectionController conversation](self, "conversation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSelectedLastAddressedHandle:", v11);

      -[CKRecipientSelectionController conversation](self, "conversation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSelectedLastAddressedSIMID:", v10);

    }
    if (-[CKComposeRecipientSelectionController hasBackfilledConversation](self, "hasBackfilledConversation")
      && -[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions"))
    {
      objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "iMessageAccountForLastAddressedHandle:simID:", v11, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "serviceName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D38F68]);

        if (v24)
        {
          -[CKRecipientSelectionController conversation](self, "conversation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "chat");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "forceCancelTypingIndicator");

        }
      }
      -[CKRecipientSelectionController conversation](self, "conversation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "chat");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setLastAddressedHandleID:", v11);

      -[CKRecipientSelectionController conversation](self, "conversation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "chat");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setLastAddressedSIMID:", v10);

      -[CKRecipientSelectionController conversation](self, "conversation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "refreshServiceForSending");

      -[CKRecipientSelectionController conversation](self, "conversation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "chat");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTXPCServiceSubscriptionContext label](v5, "label");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "updateLineSwitchedTo:", v34);

    }
    -[CKRecipientSelectionController _canonicalRecipientAddresses](self, "_canonicalRecipientAddresses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v35, 0);
    if (!-[CKComposeRecipientSelectionController fromFieldIdentityChanged](self, "fromFieldIdentityChanged"))
    {
      -[CKComposeRecipientSelectionController setFromFieldIdentityChanged:](self, "setFromFieldIdentityChanged:", 1);
      -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (id)_defaultSubscriptionContext
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[CKComposeRecipientSelectionController hasiMessageableContext](self, "hasiMessageableContext")
    || (-[CKComposeRecipientSelectionController _defaultSubscriptionContextForiMessage](self, "_defaultSubscriptionContextForiMessage"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "preferredOrDefaultSubscriptionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_preferrediMessageAccountName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredAccountForService();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_defaultSubscriptionContextForiMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CKComposeRecipientSelectionController _preferrediMessageAccountName](self, "_preferrediMessageAccountName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__im_subscriptionContextForPhoneNumber:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Default subscription context for iMessage is %@ accountDisplayName: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return v5;
}

- (BOOL)hasiMessageableContext
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
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
        objc_msgSend(v9, "phoneNumber", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "labelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabledForSenderLastAddressedHandle:simID:", v10, v11))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v21 = v10;
              v22 = 2112;
              v23 = v11;
              _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "At least one subscription is iMessage-capable with phoneNumber: %@ simID: %@", buf, 0x16u);
            }

          }
          v13 = 1;
          goto LABEL_19;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "No subscription is iMessage-capable", buf, 2u);
    }

  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (NSString)selectedLastAddressedOrDefaultHandle
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  __CFString *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[CKComposeRecipientSelectionController hasiMessageableContext](self, "hasiMessageableContext");
  -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    -[CKComposeRecipientSelectionController _preferrediMessageAccountName](self, "_preferrediMessageAccountName");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((IMStringIsEmail() & 1) != 0 || !v4)
    {
      v8 = v14;
    }
    else
    {
      objc_msgSend(v4, "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = 138412546;
          v17 = v8;
          v18 = 2112;
          v19 = v14;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Using selected subscription phone number %@ instead of %@", (uint8_t *)&v16, 0x16u);
        }

      }
    }
  }
  else
  {
LABEL_3:
    v8 = 0;
  }
  if (!v8 && v4)
  {
    objc_msgSend(v4, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("NO");
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      if (v3)
        v12 = CFSTR("YES");
      v19 = v12;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "selectedLastAddressedHandle: %@ hasiMessageableContext: %@ selectedSubscriptionContext: %@", (uint8_t *)&v16, 0x20u);

    }
  }

  return (NSString *)v8;
}

void __68__CKComposeRecipientSelectionController__layoutFromFieldShouldHide___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "navbarToLabelFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_layoutFromFieldShouldHide__attributes;
  _layoutFromFieldShouldHide__attributes = v3;

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FROM"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "initWithString:attributes:", v7, _layoutFromFieldShouldHide__attributes);
  v9 = (void *)_layoutFromFieldShouldHide__fromText;
  _layoutFromFieldShouldHide__fromText = v8;

}

- (double)fromFieldHeight
{
  void *v3;
  double v4;
  double v5;

  if (-[CKComposeRecipientSelectionController _shouldHideFromField](self, "_shouldHideFromField"))
    return 0.0;
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  if (v5 <= 0.0)
    return 0.0;
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CKComposeRecipientSelectionController traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v5)
  {
    -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissMenu");

    -[CKComposeRecipientSelectionController menuForSubscriptionSelector](self, "menuForSubscriptionSelector");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenu:", v10);

  }
}

- (id)menuForSubscriptionSelector
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  void *v23;
  id obj;
  _QWORD v25[6];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v23;
  if (objc_msgSend(v23, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v23;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          CKFrameworkBundle();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "label");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E276D870, CFSTR("ChatKit"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          location = 0;
          objc_initWeak(&location, self);
          v14 = (void *)MEMORY[0x1E0CEA2A8];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __68__CKComposeRecipientSelectionController_menuForSubscriptionSelector__block_invoke;
          v25[3] = &unk_1E274B1F0;
          v25[4] = v10;
          v25[5] = self;
          objc_copyWeak(&v26, &location);
          objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setState:", objc_msgSend(v16, "isEqual:", v10));

          CKLocalizedShortNameForContext(v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA638], "__ck_actionImageForSubscriptionShortName:isFilled:", v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setImage:", v18);

          objc_msgSend(v6, "addObject:", v15);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v7);
    }

    v19 = (void *)MEMORY[0x1E0CEA740];
    v20 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v19, "menuWithChildren:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __68__CKComposeRecipientSelectionController_menuForSubscriptionSelector__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "selectedSubscriptionContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", (uint8_t *)&v9, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedSubscriptionContext:", *(_QWORD *)(a1 + 32));

  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "setHasUserSetContextPreference:", 1);

}

- (void)CKComposeSubscriptionSelectorButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ctSubscriptionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "No subscription info found, hiding container view", v10, 2u);
      }

    }
    -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", 0);
  }

}

- (void)_lastAddressedHandleChangedNotification:(id)a3
{
  if (-[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions", a3))
  {
    -[CKComposeRecipientSelectionController setFromFieldIdentityChanged:](self, "setFromFieldIdentityChanged:", 1);
    -[CKComposeRecipientSelectionController _updateContentsOfFromField](self, "_updateContentsOfFromField");
  }
}

- (void)_updateFromFieldIfNeeded
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKComposeRecipientSelectionController _shouldHideFromField](self, "_shouldHideFromField");
  -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isHidden") ^ 1 | v4)
  {
    -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4 & ~objc_msgSend(v6, "isHidden");

  }
  else
  {
    v7 = 1;
  }

  -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "theme");
  v10 = -[CKComposeRecipientSelectionController _fromFieldThemeForCurrentService](self, "_fromFieldThemeForCurrentService");

  if (((-[CKComposeRecipientSelectionController fromFieldIdentityChanged](self, "fromFieldIdentityChanged") | v7) & 1) != 0
    || v9 != v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = CFSTR("NO");
        if (v4)
          v12 = CFSTR("YES");
        v16 = 138412546;
        v17 = v12;
        v18 = 2112;
        v19 = v3;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Updating From field - hideFromField %@ selectedSubscriptionContext %@", (uint8_t *)&v16, 0x16u);
      }

    }
    if (v4)
    {
      -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contextMenuInteraction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dismissMenu");

    }
    else
    {
      -[CKComposeRecipientSelectionController _updateContentsOfFromField](self, "_updateContentsOfFromField");
    }
    -[CKComposeRecipientSelectionController fromFieldContainerView](self, "fromFieldContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v4);

    -[CKComposeRecipientSelectionController setFromFieldIdentityChanged:](self, "setFromFieldIdentityChanged:", 0);
  }

}

- (id)recipients
{
  void *v2;
  void *v3;

  -[CKRecipientSelectionController toField](self, "toField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasBackfilledConversation
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CKRecipientSelectionController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_shouldHideFromField
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CKComposeRecipientSelectionController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation") - 3;

  if (v6 >= 2)
  {
    -[CKComposeRecipientSelectionController selectedSenderIdentity](self, "selectedSenderIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController recipients](self, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = -[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions");
    v12 = -[CKComposeRecipientSelectionController hasBackfilledConversation](self, "hasBackfilledConversation");
    v13 = !v11;
    if (!v8)
      v13 = 1;
    if (v10)
      v7 = v13;
    else
      v7 = 1;
    if (v7)
    {
      v14 = v12;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = CFSTR("NO");
          v19 = 138413058;
          if (v11)
            v17 = CFSTR("YES");
          else
            v17 = CFSTR("NO");
          v20 = v17;
          v21 = 2112;
          v22 = v8;
          if (v14)
            v16 = CFSTR("YES");
          v23 = 2112;
          v24 = v16;
          v25 = 2048;
          v26 = v10;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Should hide fromField, hasMultipleActiveSubscriptions = %@, senderIdentity = %@, hasBackfilledConversation = %@, recipientCount = %lu", (uint8_t *)&v19, 0x2Au);
        }

      }
    }

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_updateContentsOfFromField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKComposeRecipientSelectionController subscriptionSelectorButton](self, "subscriptionSelectorButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController selectedSenderIdentity](self, "selectedSenderIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v3)
  {
    objc_msgSend(v3, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedShortName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateContentsWithTitle:badgeText:theme:", v4, v5, -[CKComposeRecipientSelectionController _fromFieldThemeForCurrentService](self, "_fromFieldThemeForCurrentService"));

    -[CKComposeRecipientSelectionController menuForSubscriptionSelector](self, "menuForSubscriptionSelector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v6);

  }
}

- (BOOL)_isOniMessageService:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "labelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredSIMIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 |= objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (unint64_t)_fromFieldThemeForCurrentService
{
  void *v2;
  void *v3;
  void *v4;

  -[CKRecipientSelectionController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    return 1;
  else
    return 2;
}

- (NSArray)expandedRecipients
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKRecipientSelectionController toField](self, "toField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKRecipientSelectionController toField](self, "toField", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isGroup"))
        {
          objc_msgSend(v13, "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v14);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return (NSArray *)v6;
}

- (NSArray)proposedRecipients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKComposeRecipientSelectionController recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0C99D20];
      +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recipientWithAddress:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithObject:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return (NSArray *)v3;
}

- (void)_atomizeToConversationNameIfNecessary:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = -[CKComposeRecipientSelectionController shouldAtomizeToConversationName](self, "shouldAtomizeToConversationName");
  if (a3 && v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v12, "isGroup"))
          {
            -[CKRecipientSelectionController toField](self, "toField");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeRecipient:", v12);

            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            objc_msgSend(v12, "children");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v23 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
                  -[CKRecipientSelectionController toField](self, "toField");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addRecipient:", v19);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v16);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

  }
}

- (void)addRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  objc_super v31;

  v4 = a3;
  if (-[CKComposeRecipientSelectionController deviceHasMultipleSubscriptions](self, "deviceHasMultipleSubscriptions"))
  {
    if (-[CKComposeRecipientSelectionController _hasExistingConversationWithAddedRecipient:](self, "_hasExistingConversationWithAddedRecipient:", v4))
    {
      v31.receiver = self;
      v31.super_class = (Class)CKComposeRecipientSelectionController;
      -[CKRecipientSelectionController addRecipient:](&v31, sel_addRecipient_, v4);
    }
    else
    {
      -[CKComposeRecipientSelectionController _bestSenderIdentityForRecipient:](self, "_bestSenderIdentityForRecipient:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController toField](self, "toField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      -[CKRecipientSelectionController conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__66;
      v29[4] = __Block_byref_object_dispose__66;
      v30 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      objc_msgSend(v4, "IDSCanonicalAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "addObject:", v10);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __54__CKComposeRecipientSelectionController_addRecipient___block_invoke;
      v25[3] = &unk_1E2758F58;
      v28 = v7 == 0;
      v27 = v29;
      v25[4] = self;
      v11 = v4;
      v26 = v11;
      -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v9, v25);
      if (v7)
      {
        -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 && v8)
        {
          objc_msgSend(v8, "lastAddressedSIMID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastAddressedHandle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKComposeRecipientSelectionController _subscriptionContextForSimID:phoneNumber:](self, "_subscriptionContextForSimID:phoneNumber:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v15);

        }
        -[CKComposeRecipientSelectionController _atomizeToConversationNameIfNecessary:](self, "_atomizeToConversationNameIfNecessary:", v7);
        -[CKComposeRecipientSelectionController presentedViewController](self, "presentedViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[CKComposeRecipientSelectionController setFirstAppear:](self, "setFirstAppear:", 1);
          v23.receiver = self;
          v23.super_class = (Class)CKComposeRecipientSelectionController;
          -[CKRecipientSelectionController addRecipient:](&v23, sel_addRecipient_, v11);
          -[CKComposeRecipientSelectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_presentAlertForSubscriptionContext, 0, 0.5);
        }
        else
        {
          -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (!v19
            || v17
            && objc_msgSend(MEMORY[0x1E0D39A18], "isTUSenderIdentity:equalToSubscriptionContext:", v19, v17))
          {
            v22.receiver = self;
            v22.super_class = (Class)CKComposeRecipientSelectionController;
            -[CKRecipientSelectionController addRecipient:](&v22, sel_addRecipient_, v11);
          }
          else
          {
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __54__CKComposeRecipientSelectionController_addRecipient___block_invoke_2;
            v20[3] = &unk_1E2758F80;
            v20[4] = self;
            v21 = v11;
            -[CKComposeRecipientSelectionController presentContextSelectionAlertWithCompletion:](self, "presentContextSelectionAlertWithCompletion:", v20);

          }
        }
      }
      else
      {
        v24.receiver = self;
        v24.super_class = (Class)CKComposeRecipientSelectionController;
        -[CKRecipientSelectionController addRecipient:](&v24, sel_addRecipient_, v11);
      }

      _Block_object_dispose(v29, 8);
    }
  }
  else
  {
    -[CKComposeRecipientSelectionController _legacyAddRecipient:](self, "_legacyAddRecipient:", v4);
  }

}

void __54__CKComposeRecipientSelectionController_addRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_updateSubscriptionContextForRecipient:preferredService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateFromFieldIfNeeded");

}

void __54__CKComposeRecipientSelectionController_addRecipient___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "selectedSubscriptionContext");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v13 = v5;
          v14 = 2112;
          v15 = v8;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", buf, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setSelectedSubscriptionContext:", v5);
      objc_msgSend(*(id *)(a1 + 32), "setHasUserSetContextPreference:", 1);
    }
    else
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "No subscription info found", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setSelectedSubscriptionContext:", 0);
    }
    v10 = *(_QWORD *)(a1 + 40);
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)CKComposeRecipientSelectionController;
    objc_msgSendSuper2(&v11, sel_addRecipient_, v10);
  }

}

- (void)_updateSubscriptionContextForRecipient:(id)a3 preferredService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D397A8];
  objc_msgSend(v17, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isCNContactAKnownContact:", v8);

  if (!(_DWORD)v7)
  {
    if (-[CKComposeRecipientSelectionController hasiMessageableContext](self, "hasiMessageableContext"))
    {
      objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v6)
      {
        -[CKComposeRecipientSelectionController _defaultSubscriptionContextForiMessage](self, "_defaultSubscriptionContextForiMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v9);
        goto LABEL_9;
      }
    }
    -[CKComposeRecipientSelectionController _bestSenderIdentityForRecipient:](self, "_bestSenderIdentityForRecipient:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ctSubscriptionInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__im_subscriptionContextForSenderIdentity:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v15);

LABEL_7:
    goto LABEL_8;
  }
  -[CKComposeRecipientSelectionController _contactPreferredSenderIdentityForRecipient:](self, "_contactPreferredSenderIdentityForRecipient:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ctSubscriptionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__im_subscriptionContextForSenderIdentity:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (!-[CKComposeRecipientSelectionController hasiMessageableContext](self, "hasiMessageableContext"))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 != v6)
      goto LABEL_8;
    -[CKComposeRecipientSelectionController _defaultSubscriptionContextForiMessage](self, "_defaultSubscriptionContextForiMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v14);
    goto LABEL_7;
  }
  -[CKComposeRecipientSelectionController setSelectedSubscriptionContext:](self, "setSelectedSubscriptionContext:", v12);
  -[CKComposeRecipientSelectionController setContactPreferredContextSelected:](self, "setContactPreferredContextSelected:", 1);
LABEL_8:

LABEL_9:
}

- (id)_subscriptionContextForSimID:(id)a3 phoneNumber:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0D39738];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ctSubscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_legacyAddRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  id obj;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKComposeRecipientSelectionController shouldAtomizeToConversationName](self, "shouldAtomizeToConversationName"))
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v23 = v4;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[CKRecipientSelectionController toField](self, "toField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recipients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v9;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v14, "isGroup"))
            {
              -[CKRecipientSelectionController toField](self, "toField");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "removeRecipient:", v14);

              v28 = 0u;
              v29 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v14, "children");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v27;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v27 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                    -[CKRecipientSelectionController toField](self, "toField");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addRecipient:", v21);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
                }
                while (v18);
              }

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v11);
      }

      v4 = v23;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController addRecipient:](&v25, sel_addRecipient_, v4);

}

- (void)atomizeAndInvokeBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishEnteringRecipient");

  -[CKRecipientSelectionController toField](self, "toField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isGroup");

  }
  else
  {
    v12 = 0;
  }

  v13 = -[CKComposeRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage") | v12;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v33 = v13 ^ 1;
      v34 = 1024;
      v35 = v6;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Calling atomizeAndInvokeBlock with deferSend = %d, addedRecipient = %d", buf, 0xEu);
    }

  }
  v15 = IMOSLoggingEnabled();
  if ((v13 & v6) != 0)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Added recipient and send not deferred", buf, 2u);
      }

    }
    -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (!-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v23))
          {
            objc_msgSend(v23, "IDSCanonicalAddress");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v18, "addObject:", v24);

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __63__CKComposeRecipientSelectionController_atomizeAndInvokeBlock___block_invoke;
    v26[3] = &unk_1E2758FA8;
    v26[4] = self;
    -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v18, v26);
    -[CKComposeRecipientSelectionController setSendBlock:](self, "setSendBlock:", v4);
    -[CKComposeRecipientSelectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_atomizeAndSendTimeoutHandler, 0, 0.5);

  }
  else
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Perform block.", buf, 2u);
      }

    }
    v4[2](v4);
  }

}

uint64_t __63__CKComposeRecipientSelectionController_atomizeAndInvokeBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  if (a4)
  {
    v4 = result;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(result + 32), sel_atomizeAndSendTimeoutHandler, 0);
    return objc_msgSend(*(id *)(v4 + 32), "atomizeAndSendTimeoutHandler");
  }
  return result;
}

- (void)atomizeAndSendTimeoutHandler
{
  void *v3;
  void (**v4)(void);

  -[CKComposeRecipientSelectionController sendBlock](self, "sendBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKComposeRecipientSelectionController sendBlock](self, "sendBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[CKComposeRecipientSelectionController setSendBlock:](self, "setSendBlock:", 0);
  }
}

- (id)_bestSenderIdentityForRecipient:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D397A8];
  v4 = a3;
  objc_msgSend(v3, "keysForCNContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactWithKeysToFetch:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39A18], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bestSenderIdentityForHandleID:contact:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_contactPreferredSenderIdentityForRecipient:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D397A8];
  v4 = a3;
  objc_msgSend(v3, "keysForCNContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactWithKeysToFetch:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39A18], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contactPreferredSenderIdentityForHandleID:contact:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)presentContextSelectionAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CEA2E8];
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("COMPOSE_TO_MULTIPLE_RECIPIENTS_DIFFERENT_SENDER_IDENTITIES_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v16 = -[CKComposeRecipientSelectionController _isOniMessageService:](self, "_isOniMessageService:", v15);
          v17 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v16)
            v20 = CFSTR("COMPOSE_TO_MULTIPLE_RECIPIENTS_SELECT_SENDER_IDENTITY_%@");
          else
            v20 = CFSTR("COMPOSE_TO_MULTIPLE_RECIPIENTS_SELECT_SENDER_IDENTITY_TEXT_MESSAGE_%@");
          objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E276D870, CFSTR("ChatKit"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "label");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "userInterfaceLayoutDirection");

          if (v25 == 1)
            v26 = CFSTR("\u200F");
          else
            v26 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke;
          aBlock[3] = &unk_1E2755990;
          v28 = v3;
          aBlock[4] = v15;
          v41 = v28;
          v29 = _Block_copy(aBlock);
          objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v27, 0, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAction:", v30);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v12);
    }

    v31 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke_2;
    v38[3] = &unk_1E274B330;
    v39 = v3;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 1, v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAction:", v34);
    -[CKComposeRecipientSelectionController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    v6 = v35;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v3 + 2))(v3, 1, 0);
  }

}

uint64_t __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

uint64_t __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reset
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "resetting", buf, 2u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController reset](&v5, sel_reset);
  v4 = +[CKConversation newPendingConversation](CKConversation, "newPendingConversation");
  -[CKRecipientSelectionController setConversation:](self, "setConversation:", v4);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_atomizeAndInvokeTimeoutHandler, 0);
  -[CKComposeRecipientSelectionController setSendBlock:](self, "setSendBlock:", 0);
}

- (void)recipientSelectionControllerDidChange
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "recipientSelectionControllerDidChange", buf, 2u);
    }

  }
  -[CKComposeRecipientSelectionController _updateBackfillForNewRecipients](self, "_updateBackfillForNewRecipients");
  -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)CKComposeRecipientSelectionController;
  -[CKRecipientSelectionController recipientSelectionControllerDidChange](&v4, sel_recipientSelectionControllerDidChange);
}

- (BOOL)shouldAtomizeToConversationName
{
  return 1;
}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");
}

- (BOOL)shouldSuppressSearchResultsTable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CKRecipientSelectionController toField](self, "toField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)alwaysShowSearchResultsTable
{
  return 0;
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return 0;
}

- (void)conversationPreferredServiceDidChange
{
  if (-[CKComposeRecipientSelectionController hasMultipleActiveSharedSubscriptions](self, "hasMultipleActiveSharedSubscriptions"))
  {
    -[CKComposeRecipientSelectionController setFromFieldIdentityChanged:](self, "setFromFieldIdentityChanged:", 1);
    -[CKComposeRecipientSelectionController _updateFromFieldIfNeeded](self, "_updateFromFieldIfNeeded");
  }
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (BOOL)_hasExistingConversationWithAddedRecipient:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimingForKey:", CFSTR("_hasExistingConversationWithAddedRecipient"));

  if (CKIsRunningInMessagesViewService())
    v6 = !CKIsScreenLocked();
  else
    v6 = 1;
  v7 = 0;
  if (v4 && v6)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") == 1
      && (objc_msgSend(v10, "firstObject"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isGroup"),
          v11,
          (v12 & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObject:", v4);
      v14 = objc_claimAutoreleasedReturnValue();

      -[CKComposeRecipientSelectionController _handlesForRecipients:](self, "_handlesForRecipients:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", v15, 1, 0, 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKComposeRecipientSelectionController conversationList](self, "conversationList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "conversationForExistingChat:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v19 != 0;
      v10 = (void *)v14;
    }

  }
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stopTimingForKey:", CFSTR("_hasExistingConversationWithAddedRecipient"));

  return v7;
}

- (BOOL)shouldInvalidateIDSRequests
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  -[CKRecipientSelectionController toField](self, "toField", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "address");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)conversationGUIDForRecipient:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "conversationGUID");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isGroup"))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[CKComposeRecipientSelectionController autocompleteResultIdentifier:](self, "autocompleteResultIdentifier:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)autocompleteResultIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CKIsRunningInMessagesViewService() && CKIsScreenLocked())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not looking up conversations for backfill while device is passcode locked", (uint8_t *)&v21, 2u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v4 && !v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Conversation look up will fail with no recipients and no conversation guid. Early returning.", (uint8_t *)&v21, 2u);
      }
      goto LABEL_12;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_24;
  }
  if (!v4
    || (-[CKComposeRecipientSelectionController conversationList](self, "conversationList"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "conversationForExistingChatWithGUID:", v4),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionController _handlesForRecipients:](self, "_handlesForRecipients:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKHasBlackholeEnabledOrHasBlackholeChats())
    {
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "unblackholeAndLoadChatWithIMHandles:", v13);

    }
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:findMatchingNamedGroups:", v13, 1, 0, 0, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKComposeRecipientSelectionController conversationList](self, "conversationList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "conversationForExistingChat:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = 138412802;
        v22 = v4;
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Unable to find conversation for existing chat with GUID: %@. Using recipient lookup fallback and found conversation: %@ (handles: %@)", (uint8_t *)&v21, 0x20u);
      }

    }
  }
  -[CKComposeRecipientSelectionController _recoverConversationIfJunk:](self, "_recoverConversationIfJunk:", v11);
  v9 = (void *)objc_msgSend(v11, "copyForPendingConversation");

LABEL_24:
  return v9;
}

- (BOOL)_updateBackfillForNewRecipients
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimingForKey:", CFSTR("_updateBackfillForNewRecipients"));

  -[CKRecipientSelectionController toField](self, "toField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearText");

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSearch");

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnteredRecipients:", v7);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuppressGroupSuggestions:", objc_msgSend(v9, "count") != 0);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[CKRecipientSelectionController toField](self, "toField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v65;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v65 != v13)
        objc_enumerationMutation(v11);
      -[CKComposeRecipientSelectionController conversationGUIDForRecipient:](self, "conversationGUIDForRecipient:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v14));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15 = 0;
  }
  v57 = v15;

  -[CKComposeRecipientSelectionController _pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:](self, "_pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:", v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v59, "chat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "guid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v70 = v18;
        v71 = 2112;
        v72 = v57;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Found backfill conversation %@ for conversationGUID: %@", buf, 0x16u);

      }
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[CKComposeRecipientSelectionController recipients](self, "recipients", v57);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v61 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          -[CKRecipientSelectionController toField](self, "toField");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "atomViewForRecipient:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 && objc_msgSend(v25, "presentationOptions") == 4)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v70 = v23;
                _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "invalidating previously set pending presentation option for recipient: %@)", buf, 0xCu);
              }

            }
            -[CKRecipientSelectionController toField](self, "toField");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "invalidateAtomPresentationOptionsForRecipient:", v23);

          }
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v20);
    }
    v28 = v59;
  }
  else
  {
    v28 = +[CKConversation newPendingConversation](CKConversation, "newPendingConversation");
    IMLogHandleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CKComposeRecipientSelectionController _updateBackfillForNewRecipients].cold.1(v57, v19);
  }

  if (-[CKComposeRecipientSelectionController deviceHasMultipleSubscriptions](self, "deviceHasMultipleSubscriptions"))
  {
    -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "phoneNumber");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress();
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKComposeRecipientSelectionController selectedSubscriptionContext](self, "selectedSubscriptionContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "labelID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setSelectedLastAddressedHandle:", v31);
    objc_msgSend(v28, "setSelectedLastAddressedSIMID:", v33);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v70 = v31;
        v71 = 2112;
        v72 = (uint64_t)v33;
        _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Update backfill for new recipients selectedLastAddressedHandle: %@ selectedLastAddressedSIMD: %@", buf, 0x16u);
      }

    }
  }
  -[CKRecipientSelectionController conversation](self, "conversation", v57);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sendingService");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPreviousSendingService:", v36);

  objc_msgSend(v28, "setForceMMS:", -[CKRecipientSelectionController forceMMS](self, "forceMMS"));
  -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPendingComposeRecipients:", v37);

  -[CKComposeRecipientSelectionController expandedRecipients](self, "expandedRecipients");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count") == 1)
  {
    objc_msgSend(v38, "objectAtIndex:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[CKComposeRecipientSelectionController recipientIsiMessagable:](self, "recipientIsiMessagable:", v39);

  }
  else
  {
    v40 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v28, "chat");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "guid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "recipients");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 138412546;
      v70 = v43;
      v71 = 2048;
      v72 = v45;
      _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "Selecting conversation guid={%@} recipientCount={%lu} after backfill attempt.", buf, 0x16u);

    }
  }
  -[CKRecipientSelectionController delegate](self, "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "recipientSelectionController:didSelectConversation:isiMessagable:", self, v28, v40);

  if (-[CKComposeRecipientSelectionController shouldInvalidateIDSRequests](self, "shouldInvalidateIDSRequests"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "Invalidate IDS results since we have resolved all the requests for recipients in to field.", buf, 2u);
      }

    }
    -[CKRecipientSelectionController invalidateOutstandingIDStatusRequests](self, "invalidateOutstandingIDStatusRequests");
  }
  -[CKRecipientSelectionController setConversation:](self, "setConversation:", v28);
  if (!-[CKComposeRecipientSelectionController contactPreferredContextSelected](self, "contactPreferredContextSelected"))goto LABEL_53;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sendingService");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "smsService");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v49 == v50;

  if (!v51)
  {
LABEL_53:
    -[CKRecipientSelectionController conversation](self, "conversation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handles");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "__imArrayByApplyingBlock:", &__block_literal_global_167_2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v54, 0);
  }
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stopTimingForKey:", CFSTR("_updateBackfillForNewRecipients"));

  objc_msgSend(MEMORY[0x1E0D36AE8], "logTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));
  objc_msgSend(MEMORY[0x1E0D36AE8], "invalidateGlobalTimingCollectionForKey:", CFSTR("CKBackfillTimingKey"));

  return v59 != 0;
}

id __72__CKComposeRecipientSelectionController__updateBackfillForNewRecipients__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_recoverConversationIfJunk:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFiltered") != 2)
    goto LABEL_4;
  v5 = IMIsOscarEnabled();

  if (v5)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recoverJunkMessagesInConversations:", v6);

LABEL_4:
  }

}

- (BOOL)recipientIsiMessagable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "normalizedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSCanonicalAddressForAddress:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "idsStatusForAddress:", v6);

  return v8 == 1;
}

- (id)_handlesForRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (CKIsRunningUITests())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "rawAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "_appearsToBePhoneNumber"))
          {
            IMInternationalForPhoneNumberWithOptions();
            v13 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v13;
          }
          IMStripFormattingFromAddress();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "__ck_bestAccountForAddresses:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKRecipientSelectionController conversation](self, "conversation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendingService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "__ck_defaultAccountForService:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v16;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (!-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v24, (_QWORD)v30))
        {
          objc_msgSend(v24, "rawAddress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          IMStripFormattingFromAddress();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v18, "imHandleWithID:alreadyCanonical:", v26, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
              objc_msgSend(v5, "addObject:", v27);

          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  v28 = (void *)objc_msgSend(v5, "copy");
  return v28;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;

  -[CKRecipientSelectionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientSelectionControllerReturnPressed:", self);

  return 0;
}

- (UIView)fromFieldContainerView
{
  return self->_fromFieldContainerView;
}

- (void)setFromFieldContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_fromFieldContainerView, a3);
}

- (NSString)simID
{
  return self->_simID;
}

- (void)setSimID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void)setSendBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (UIView)fromFieldSeparator
{
  return self->_fromFieldSeparator;
}

- (void)setFromFieldSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_fromFieldSeparator, a3);
}

- (UILabel)fromTextLabel
{
  return self->_fromTextLabel;
}

- (void)setFromTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fromTextLabel, a3);
}

- (CKComposeSubscriptionSelectorButton)subscriptionSelectorButton
{
  return self->_subscriptionSelectorButton;
}

- (void)setSubscriptionSelectorButton:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionSelectorButton, a3);
}

- (UIStackView)fromFieldContentStackView
{
  return self->_fromFieldContentStackView;
}

- (void)setFromFieldContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_fromFieldContentStackView, a3);
}

- (BOOL)fromFieldIdentityChanged
{
  return self->_fromFieldIdentityChanged;
}

- (void)setFromFieldIdentityChanged:(BOOL)a3
{
  self->_fromFieldIdentityChanged = a3;
}

- (BOOL)hasUserSetContextPreference
{
  return self->_hasUserSetContextPreference;
}

- (void)setHasUserSetContextPreference:(BOOL)a3
{
  self->_hasUserSetContextPreference = a3;
}

- (BOOL)isFirstAppear
{
  return self->_firstAppear;
}

- (void)setFirstAppear:(BOOL)a3
{
  self->_firstAppear = a3;
}

- (BOOL)contactPreferredContextSelected
{
  return self->_contactPreferredContextSelected;
}

- (void)setContactPreferredContextSelected:(BOOL)a3
{
  self->_contactPreferredContextSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromFieldContentStackView, 0);
  objc_storeStrong((id *)&self->_subscriptionSelectorButton, 0);
  objc_storeStrong((id *)&self->_fromTextLabel, 0);
  objc_storeStrong((id *)&self->_fromFieldSeparator, 0);
  objc_storeStrong(&self->_sendBlock, 0);
  objc_storeStrong((id *)&self->_simID, 0);
  objc_storeStrong((id *)&self->_fromFieldContainerView, 0);
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_selectedSubscriptionContext, 0);
}

- (void)_updateBackfillForNewRecipients
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Failed to find a conversation to backfill for conversationGUID: %@. Making empty new compose conversation", (uint8_t *)&v2, 0xCu);
}

@end
