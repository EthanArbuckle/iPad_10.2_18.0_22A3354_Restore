@implementation CKMacRecipientsController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("allowedByScreenTime"));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[CKMacRecipientsController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  self->_numberOfRowsInToField = 1;
  v7.receiver = self;
  v7.super_class = (Class)CKMacRecipientsController;
  -[CKMacRecipientsController dealloc](&v7, sel_dealloc);
}

- (CKMacRecipientsController)initWithConversation:(id)a3
{
  id v4;
  CKMacRecipientsController *v5;
  CKMacRecipientsController *v6;
  CKDetailsContactsManager *v7;
  CKDetailsContactsManager *contactsManager;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMacRecipientsController;
  v5 = -[CKMacRecipientsController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_conversation, v4);
    if (v4)
    {
      v7 = -[CKDetailsContactsManager initWithConversation:delegate:]([CKDetailsContactsManager alloc], "initWithConversation:delegate:", v4, v6);
      contactsManager = v6->_contactsManager;
      v6->_contactsManager = v7;

    }
    v6->_allowedByScreenTime = 1;
    v6->_numberOfRowsInToField = 1;
  }

  return v6;
}

- (BOOL)isEditable
{
  return 0;
}

- (double)preferredMacToolbarHeight
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double result;

  -[CKMacRecipientsController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsOfTextInField");
  v5 = -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField");

  if (v4 != v5)
  {
    -[CKMacRecipientsController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacRecipientsController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", objc_msgSend(v6, "numberOfRowsOfTextInField"));

  }
  if (-[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") < 2
    || -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") > 3)
  {
    if (-[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") <= 3)
      v7 = 1;
    else
      v7 = 3;
  }
  else
  {
    v7 = -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField");
  }
  -[CKMacRecipientsController _toolbarHeightForNumberOfRows:](self, "_toolbarHeightForNumberOfRows:", v7);
  return result;
}

- (BOOL)_shouldEnableScrolling
{
  return (-[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") < 2
       || -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") >= 4)
      && -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField") > 3;
}

- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "macAppKitToolbarHeight");
  v6 = v5;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0D13618], "defaultHeight");
    v6 = v6 + (double)(a3 - 1) * (v7 + 6.0);
  }

  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  id v22;
  CNComposeRecipientTextView *v23;
  CNComposeRecipientTextView *toField;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[CKMacRecipientsController setView:](self, "setView:", v5);

  -[CKMacRecipientsController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[CKMacRecipientsController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[CKMacRecipientsController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  v10 = objc_alloc(MEMORY[0x1E0CEA970]);
  -[CKMacRecipientsController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (void *)objc_msgSend(v10, "initWithFrame:");
  -[CKMacRecipientsController setToFieldScrollView:](self, "setToFieldScrollView:", v12);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 18);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysBounceVertical:", 1);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowsHorizontalScrollIndicator:", 0);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInsetAdjustmentBehavior:", 2);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setScrollEnabled:", 0);

  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowsVerticalScrollIndicator:", 0);

  -[CKMacRecipientsController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  v22 = objc_alloc(MEMORY[0x1E0D136B8]);
  v23 = (CNComposeRecipientTextView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  toField = self->_toField;
  self->_toField = v23;

  -[CKMacRecipientsController toField](self, "toField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAutoresizingMask:", 18);

  if (loadView_onceToken_0 != -1)
    dispatch_once(&loadView_onceToken_0, &__block_literal_global_107);
  -[CKMacRecipientsController toField](self, "toField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "labelView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAttributedText:", loadView_toText_0);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v28, "isTranscriptSharingEnabled");

  if ((_DWORD)v27)
  {
    -[CKMacRecipientsController conversation](self, "conversation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "chat");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isStewieSharingChat");

    if (v31)
    {
      -[CKMacRecipientsController toField](self, "toField");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "labelView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 1);

    }
  }
  -[CKMacRecipientsController toField](self, "toField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", 1);

  -[CKMacRecipientsController toField](self, "toField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSeparatorHidden:", 1);

  -[CKMacRecipientsController toField](self, "toField");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v38);

  -[CKMacRecipientsController toField](self, "toField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDelegate:", self);

  -[CKMacRecipientsController toField](self, "toField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setExpandRecipientsInNamedGroups:", 0);

  -[CKMacRecipientsController toField](self, "toField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setShowsAddButtonWhenExpanded:", 0);

  -[CKMacRecipientsController toField](self, "toField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUsingActiveAppearance:", 1);

  -[CKMacRecipientsController toField](self, "toField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "textView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setEditable:", 0);

  -[CKMacRecipientsController toField](self, "toField");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "textView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSelectable:", 0);

  -[CKMacRecipientsController _updateToFieldFrame](self, "_updateToFieldFrame");
  -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacRecipientsController toField](self, "toField");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", v48);

  v49 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CKMacRecipientsController detailsToolbarItemFrame](self, "detailsToolbarItemFrame");
  v50 = (void *)objc_msgSend(v49, "initWithFrame:");
  -[CKMacRecipientsController setDetailsPopoverPresentationSourceView:](self, "setDetailsPopoverPresentationSourceView:", v50);

  -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBackgroundColor:", 0);

  -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setOpaque:", 0);

  -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setUserInteractionEnabled:", 0);

  -[CKMacRecipientsController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addSubview:", v55);

  -[CKMacRecipientsController refreshRecipients](self, "refreshRecipients");
  -[CKMacRecipientsController view](self, "view");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setUserInteractionEnabled:", 1);

}

void __37__CKMacRecipientsController_loadView__block_invoke()
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
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "navbarToLabelFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v1;
  v15[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)loadView_attributes_0;
  loadView_attributes_0 = v3;

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "initWithString:attributes:", v7, loadView_attributes_0);
  v9 = (void *)loadView_toText_0;
  loadView_toText_0 = v8;

  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("No Recipients"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "initWithString:attributes:", v12, loadView_attributes_0);
  v14 = (void *)loadView_placeHolderText_0;
  loadView_placeHolderText_0 = v13;

}

- (void)viewDidLoad
{
  void *v3;
  CKManualUpdater *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMacRecipientsController;
  -[CKMacRecipientsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleConversationPreferredServiceDidChangeNotification_, CFSTR("CKConversationPreferredServiceChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookChangedNotification_, *MEMORY[0x1E0D373C0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookPartialChangedNotification_, *MEMORY[0x1E0D373D0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyTransparencyStatusChangedNotification_, *MEMORY[0x1E0D353E8], 0);
  v4 = -[CKManualUpdater initWithTarget:action:]([CKManualUpdater alloc], "initWithTarget:action:", self, sel__reloadCurrentRecipientData);
  -[CKMacRecipientsController setAddressBookNotificationUpdater:](self, "setAddressBookNotificationUpdater:", v4);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  id v28;
  CGRect v29;
  CGRect v30;

  -[CKMacRecipientsController _updateToFieldFrame](self, "_updateToFieldFrame");
  -[CKMacRecipientsController detailsToolbarItemFrame](self, "detailsToolbarItemFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v30.origin.x = v12;
  v30.origin.y = v13;
  v30.size.width = v14;
  v30.size.height = v15;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v16 = CGRectEqualToRect(v29, v30);

  if (!v16)
  {
    -[CKMacRecipientsController detailsPopoverPresentationSourceView](self, "detailsPopoverPresentationSourceView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  }
  if (CKIsRunningInMacCatalyst())
  {
    -[CKMacRecipientsController toField](self, "toField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    -[CKMacRecipientsController toField](self, "toField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22 + 8.0;
    -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentSize:", v20, v23);

    v25 = -[CKMacRecipientsController _shouldEnableScrolling](self, "_shouldEnableScrolling");
    -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setScrollEnabled:", v25);

    v27 = -[CKMacRecipientsController _shouldEnableScrolling](self, "_shouldEnableScrolling");
    -[CKMacRecipientsController toFieldScrollView](self, "toFieldScrollView");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShowsVerticalScrollIndicator:", v27);

  }
}

- (void)setConversation:(id)a3
{
  id WeakRetained;
  void *v5;
  CKDetailsContactsManager *v6;
  CKDetailsContactsManager *contactsManager;
  void *v8;
  int v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_conversation);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[CKMacRecipientsController reset](self, "reset");
    objc_storeWeak((id *)&self->_conversation, obj);
    if (obj)
    {
      v6 = -[CKDetailsContactsManager initWithConversation:delegate:]([CKDetailsContactsManager alloc], "initWithConversation:delegate:", obj, self);
      contactsManager = self->_contactsManager;
      self->_contactsManager = v6;

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isKeyTransparencyEnabled");

      if (v9)
      {
        objc_msgSend(obj, "chat");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchKTStatus");

      }
    }
    -[CKMacRecipientsController refreshRecipients](self, "refreshRecipients");
    v5 = obj;
  }

}

- (void)refreshRecipients
{
  CKMacRecipientsController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CKMacRecipientsController *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  -[CKMacRecipientsController reset](self, "reset");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacRecipientsController conversation](v2, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = v2;
    -[CKMacRecipientsController conversation](v2, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "defaultIMHandle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "normalizedID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (CKIsValidAddress(v13))
            {
              +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "recipientWithAddress:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[CKMacRecipientsController conversation](v26, "conversation");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setUseAbbreviatedDisplayName:", objc_msgSend(v16, "isGroupConversation"));

                }
                objc_msgSend(v3, "addObject:", v15);
              }

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    v2 = v26;
  }
  if (objc_msgSend(v3, "count"))
  {
    -[CKMacRecipientsController conversation](v2, "conversation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isGroupConversation"))
    {
      -[CKMacRecipientsController conversation](v2, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasDisplayName");

      if (!v19)
      {
LABEL_23:
        -[CKMacRecipientsController addRecipients:](v2, "addRecipients:", v3);
        goto LABEL_24;
      }
      v20 = objc_alloc(MEMORY[0x1E0D136A0]);
      -[CKMacRecipientsController conversation](v2, "conversation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "displayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v20, "initWithChildren:displayString:", v3, v22);

      v23 = (void *)MEMORY[0x1E0C99DE8];
      v31 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayWithArray:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v25;
    }

    goto LABEL_23;
  }
LABEL_24:

}

- (CGRect)detailsToolbarItemFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "macNSToolbarItemSize");
  v5 = v4;
  v7 = v6;

  -[CKMacRecipientsController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "macAppKitToolbarHeight");
  v13 = v12;

  -[CKMacRecipientsController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "_shouldReverseLayoutDirection");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "macNSToolbarItemInterItemSpacing");
  v17 = v16;

  v18 = v10 - v17 - v5;
  if ((_DWORD)v11)
    v18 = v17;
  v19 = v13 * 0.5 - v7 * 0.5;
  v20 = v5;
  v21 = v7;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)faceTimeStartOrLaunchCallToolbarItemFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "macNSToolbarItemSize");
  v5 = v4;
  v7 = v6;

  -[CKMacRecipientsController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "macAppKitToolbarHeight");
  v13 = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "macNSToolbarItemInterItemSpacing");
  v16 = v15;

  v17 = v5 + v5 + v16 * 2.0;
  -[CKMacRecipientsController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v18, "_shouldReverseLayoutDirection");

  v19 = v10 - v17;
  if ((_DWORD)v14)
    v19 = v17;
  v20 = v13 * 0.5 - v7 * 0.5;
  v21 = v5;
  v22 = v7;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)faceTimeJoinCallToolbarItemFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "macNSToolbarItemSize");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "macJoinFaceTimeNSToolbarItemSize");
  v8 = v7;
  v10 = v9;

  -[CKMacRecipientsController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "macAppKitToolbarHeight");
  v16 = v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "macNSToolbarItemInterItemSpacing");
  v19 = v18;

  v20 = v8 + v5 + v19 * 2.0;
  -[CKMacRecipientsController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v21, "_shouldReverseLayoutDirection");

  v22 = v13 - v20;
  if ((_DWORD)v17)
    v22 = v20;
  v23 = v16 * 0.5 - v10 * 0.5;
  v24 = v8;
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)innermostToolbarItemFrame
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
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
  double v18;
  double v19;
  CGRect result;

  -[CKMacRecipientsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "innermostToolbarItemIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = CFSTR("CKMacToolbarChatDetailsItemIdentifier");
  v7 = v6;

  if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CKMacToolbarChatDetailsItemIdentifier")))
  {
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CKMacToolbarFacetimeStartCallItemIdentifier")) & 1) != 0
      || -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CKMacToolbarFacetimeJoinedCallItemIdentifier")))
    {
      -[CKMacRecipientsController faceTimeStartOrLaunchCallToolbarItemFrame](self, "faceTimeStartOrLaunchCallToolbarItemFrame");
      goto LABEL_9;
    }
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CKMacToolbarFacetimeJoinCallItemIdentifier")))
    {
      -[CKMacRecipientsController faceTimeJoinCallToolbarItemFrame](self, "faceTimeJoinCallToolbarItemFrame");
      goto LABEL_9;
    }
  }
  -[CKMacRecipientsController detailsToolbarItemFrame](self, "detailsToolbarItemFrame");
LABEL_9:
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_updateToFieldFrame
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  CNComposeRecipientTextView *toField;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat rect;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[CKMacRecipientsController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  -[CKMacRecipientsController innermostToolbarItemFrame](self, "innermostToolbarItemFrame");
  v6 = v5;
  v44 = v7;
  v45 = v8;
  rect = v9;
  -[CKMacRecipientsController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v43 = v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toFieldScrollViewInsets");
  v14 = v13;
  v16 = v15;

  -[CKMacRecipientsController _toolbarHeightForNumberOfRows:](self, "_toolbarHeightForNumberOfRows:", -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField"));
  v18 = v17;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "toFieldXOffset");
  v21 = v20;

  -[CNComposeRecipientTextView labelView](self->_toField, "labelView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeToFit");

  toField = self->_toField;
  -[CNComposeRecipientTextView labelView](toField, "labelView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  -[CNComposeRecipientTextView convertRect:toView:](toField, "convertRect:toView:", self->_toField);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "toFieldPreferredHeight");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "toFieldYOffset");
  -[CKMacRecipientsController traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayScale");
  UIRoundToScale();
  v29 = v28;

  if (v4)
  {
    v47.origin.x = v6;
    v47.origin.y = v44;
    v47.size.height = v45;
    v47.size.width = rect;
    MaxX = CGRectGetMaxX(v47);
    v6 = v43 - MaxX;
  }
  else
  {
    MaxX = v14 + v21;
    v16 = v14;
  }
  v31 = v6 - v21 - v16;
  -[CKMacRecipientsController view](self, "view", *(_QWORD *)&v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "displayScale");
  v35 = round(MaxX * v34) / v34;
  v36 = round(v29 * v34) / v34;
  v37 = round(v31 * v34) / v34;
  v38 = round(v18 * v34) / v34;

  -[CNComposeRecipientTextView frame](self->_toField, "frame");
  v49.origin.x = v39;
  v49.origin.y = v40;
  v49.size.width = v41;
  v49.size.height = v42;
  v48.origin.x = v35;
  v48.origin.y = v36;
  v48.size.width = v37;
  v48.size.height = v38;
  if (!CGRectEqualToRect(v48, v49))
    -[CNComposeRecipientTextView setFrame:](self->_toField, "setFrame:", v35, v36, v37, v38);
  -[CKMacRecipientsController _notifyDelegatesToFieldHeightHasChanged](self, "_notifyDelegatesToFieldHeightHasChanged");
}

- (void)_reloadCurrentRecipientData
{
  CKMacRecipientsController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CKMacRecipientsController *v25;
  id obj;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  -[CKMacRecipientsController recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v5 = *(_QWORD *)v34;
    v24 = *(_QWORD *)v34;
    v25 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        -[CKMacRecipientsController toField](v2, "toField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeRecipient:", v7);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v7, "children"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v27 = v7;
          objc_msgSend(v7, "children");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v30;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v30 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
                +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "normalizedAddress");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "recipientWithAddress:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                  objc_msgSend(v10, "addObject:", v19);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v13);
          }

          v20 = objc_alloc(MEMORY[0x1E0D136A0]);
          objc_msgSend(v27, "displayString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithChildren:displayString:", v10, v21);
          v5 = v24;
          v2 = v25;
        }
        else
        {
          +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "normalizedAddress");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "recipientWithAddress:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[CKMacRecipientsController toField](v2, "toField");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addRecipient:", v22);

        ++v6;
      }
      while (v6 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  -[CKMacRecipientsController _notifyDelegatesToFieldHeightHasChanged](v2, "_notifyDelegatesToFieldHeightHasChanged");
}

- (id)recipients
{
  void *v2;
  void *v3;

  -[CKMacRecipientsController toField](self, "toField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addRecipients:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          -[CKMacRecipientsController toField](self, "toField", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addRecipient:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[CKMacRecipientsController updateScreenTimePolicy](self, "updateScreenTimePolicy");
  }
  -[CKMacRecipientsController _notifyDelegatesToFieldHeightHasChanged](self, "_notifyDelegatesToFieldHeightHasChanged", (_QWORD)v13);

}

- (void)reset
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CKMacRecipientsController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CKMacRecipientsController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecipients:", v7);

    -[CKMacRecipientsController toField](self, "toField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAddresses:", v9);

    -[CKMacRecipientsController toField](self, "toField");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearText");

  }
}

- (void)_notifyDelegatesToFieldHeightHasChanged
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[CKMacRecipientsController numberOfRowsInToField](self, "numberOfRowsInToField");
  -[CKMacRecipientsController toField](self, "toField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsOfTextInField");

  if (v3 != v5)
  {
    -[CKMacRecipientsController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacRecipientsController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", objc_msgSend(v6, "numberOfRowsOfTextInField"));

    -[CKMacRecipientsController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "macRecipientsControllerDidUpdateToFieldSizing:", self);

  }
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  void *v4;
  id v5;

  -[CKMacRecipientsController addressBookNotificationUpdater](self, "addressBookNotificationUpdater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

  -[CKMacRecipientsController addressBookNotificationUpdater](self, "addressBookNotificationUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIfNeeded");

}

- (void)_handleAddressBookPartialChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CKMacRecipientsController recipients](self, "recipients", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "normalizedAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v6, "isEqualToString:", v12);

          if (v13)
          {
            -[CKMacRecipientsController _handleAddressBookChangedNotification:](self, "_handleAddressBookChangedNotification:", v4);
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKMacRecipientsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isEqual:", v6);
  if ((_DWORD)v4)
  {
    -[CKMacRecipientsController toField](self, "toField");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateAtomPresentationOptions");

  }
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    {
      -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allowedByContactsHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "normalizedAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && !objc_msgSend(v10, "BOOLValue"))
        {

          v21 = 0x2000;
          goto LABEL_18;
        }

      }
    }
    -[CKMacRecipientsController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CKMacRecipientsController conversation](self, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendingService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {
        v21 = 0;
        goto LABEL_18;
      }
      -[CKMacRecipientsController conversation](self, "conversation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendingService");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[CKMacRecipientsController conversation](self, "conversation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendingService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D35910], "facetimeService");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 != v20)
        {
          v21 = 2;
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    v21 = 1;
    goto LABEL_18;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  v21 = 4;
LABEL_18:

  return v21;
}

- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[CKMacRecipientsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CKContactKeyVerificationRecipientsHelper shouldShowVerifiedIconForRecipient:inChat:](CKContactKeyVerificationRecipientsHelper, "shouldShowVerifiedIconForRecipient:inChat:", v4, v6);

  return v7;
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D353D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMacRecipientsController recipients](self, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacRecipientsController conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContactKeyVerificationRecipientsHelper recipientsToUpdateForUpdatedCKVHandles:recipients:inConversation:](CKContactKeyVerificationRecipientsHelper, "recipientsToUpdateForUpdatedCKVHandles:recipients:inConversation:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
          -[CKMacRecipientsController toField](self, "toField", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "invalidateAtomPresentationOptionsForRecipient:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKMacRecipientsController toField](self, "toField");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    goto LABEL_2;
  objc_msgSend(v7, "recipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v39 = v7;
    objc_msgSend(v7, "recipient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v19), "normalizedAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v21);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v17);
    }

    -[CKMacRecipientsController conversation](self, "conversation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recipients");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToArray:", v13);

    if (v24)
    {
      -[CKMacRecipientsController conversation](self, "conversation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMacRecipientsController contactsManager](self, "contactsManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKContextMenuGenerator menuForNamedGroupConversation:andContactsManager:](CKContextMenuGenerator, "menuForNamedGroupConversation:andContactsManager:", v25, v26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    v7 = v39;
  }
  else
  {
    -[CKMacRecipientsController contactsManager](self, "contactsManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "conformsToProtocol:", &unk_1EE2A9A30);

    if (!v28)
      goto LABEL_2;
    objc_msgSend(v7, "recipient");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_2;
    v30 = (void *)v29;
    objc_msgSend(v7, "recipient");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "normalizedAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
LABEL_2:
      v9 = 0;
      goto LABEL_3;
    }
    objc_msgSend(v7, "recipient");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "normalizedAddress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMacRecipientsController contactsManager](self, "contactsManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "contextMenuForEntity:atom:", v35, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    v37 = (void *)MEMORY[0x1E0CEA4B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __82__CKMacRecipientsController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke;
    v40[3] = &unk_1E274B290;
    v41 = v9;
    v38 = v9;
    objc_msgSend(v37, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_3:

  return v9;
}

id __82__CKMacRecipientsController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  void *v5;
  char isKindOfClass;
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

  v17 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v17, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v17, "recipient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "normalizedAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKMacRecipientsController conversation](self, "conversation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v10, "isGroupConversation");

      if ((_DWORD)v8)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "defaultIMHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("sms://open?addresses=%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "openURL:options:completionHandler:", v15, MEMORY[0x1E0C9AA70], 0);

      }
      else
      {
        -[CKMacRecipientsController _showContactCardForEntity:sourceView:](self, "_showContactCardForEntity:sourceView:", v9, v17);
      }

    }
  }

}

- (void)_showContactCardForEntity:(id)a3 sourceView:(id)a4
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
  id v13;

  objc_msgSend(a3, "rawAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMStripFormattingFromAddress();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__ck_bestAccountForAddress:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst()
    && objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("addressbook://"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:options:completionHandler:", v12, MEMORY[0x1E0C9AA70], 0);

  }
}

- (id)handlesForScreenTimePolicyCheck
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    return 0;
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKMacRecipientsController toField](self, "toField", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "normalizedAddress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void)updateScreenTimePolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("allowedByScreenTime"));

    -[CKMacRecipientsController setCurrentConversationContext:](self, "setCurrentConversationContext:", 0);
  }
  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    -[CKMacRecipientsController handlesForScreenTimePolicyCheck](self, "handlesForScreenTimePolicyCheck");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35808], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "allowedToShowConversationWithHandleIDs:sync:context:", v5, 1, &v11);
    v8 = v11;

    -[CKMacRecipientsController setCurrentConversationContext:](self, "setCurrentConversationContext:", v8);
    if ((_DWORD)v7 != -[CKMacRecipientsController allowedByScreenTime](self, "allowedByScreenTime"))
    {
      -[CKMacRecipientsController toField](self, "toField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidateAtomPresentationOptions");

    }
    -[CKMacRecipientsController setAllowedByScreenTime:](self, "setAllowedByScreenTime:", v7);
    -[CKMacRecipientsController currentConversationContext](self, "currentConversationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("allowedByScreenTime"), 1, ctxAllowedByScreenTime_0);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD block[4];
  id v14;
  CKMacRecipientsController *v15;

  v10 = a4;
  v11 = v10;
  if ((void *)ctxAllowedByScreenTime_0 == a6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__CKMacRecipientsController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E274A108;
    v14 = v10;
    v15 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKMacRecipientsController;
    -[CKMacRecipientsController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

void __76__CKMacRecipientsController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setAllowedByScreenTime:", objc_msgSend(v2, "allowedByScreenTime"));
  objc_msgSend(*(id *)(a1 + 40), "toField");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "invalidateAtomPresentationOptions");
}

- (CKConversation)conversation
{
  return (CKConversation *)objc_loadWeakRetained((id *)&self->_conversation);
}

- (CNComposeRecipientTextView)toField
{
  return self->_toField;
}

- (UIView)detailsPopoverPresentationSourceView
{
  return self->_detailsPopoverPresentationSourceView;
}

- (void)setDetailsPopoverPresentationSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, a3);
}

- (STConversationContext)currentConversationContext
{
  return self->_currentConversationContext;
}

- (void)setCurrentConversationContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentConversationContext, a3);
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (CKMacRecipientsControllerDelegate)delegate
{
  return (CKMacRecipientsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (UIScrollView)toFieldScrollView
{
  return self->_toFieldScrollView;
}

- (void)setToFieldScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_toFieldScrollView, a3);
}

- (CKManualUpdater)addressBookNotificationUpdater
{
  return self->_addressBookNotificationUpdater;
}

- (void)setAddressBookNotificationUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, a3);
}

- (unint64_t)numberOfRowsInToField
{
  return self->_numberOfRowsInToField;
}

- (void)setNumberOfRowsInToField:(unint64_t)a3
{
  self->_numberOfRowsInToField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, 0);
  objc_storeStrong((id *)&self->_toFieldScrollView, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentConversationContext, 0);
  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_destroyWeak((id *)&self->_conversation);
}

@end
