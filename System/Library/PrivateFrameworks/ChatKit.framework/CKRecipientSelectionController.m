@implementation CKRecipientSelectionController

- (void)dealloc
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

  -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("allowedByScreenTime"));

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_recipientSelectionControllerDidChange, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[CKRecipientSelectionController invalidateOutstandingIDStatusRequests](self, "invalidateOutstandingIDStatusRequests");
  -[CKRecipientSelectionController stopCheckingRecipientAvailabilityAndRemoveAllTimers](self, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");
  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[CKRecipientSelectionController toField](self, "toField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutDelegate:", 0);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController removeChildViewController:](self, "removeChildViewController:", v11);

    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", 0);

  }
  self->_numberOfRowsInToField = 1;
  v13.receiver = self;
  v13.super_class = (Class)CKRecipientSelectionController;
  -[CKRecipientSelectionController dealloc](&v13, sel_dealloc);
}

- (CKRecipientSelectionController)init
{
  return -[CKRecipientSelectionController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (CKRecipientSelectionController)initWithConversation:(id)a3
{
  id v4;
  CKRecipientSelectionController *v5;
  CKRecipientSelectionController *v6;
  uint64_t v7;
  CKPendingConversation *conversation;
  void *v9;
  int v10;
  CKRecipientAvailabilities *v11;
  uint64_t v12;
  void *v13;
  CKDetailsContactsManager *v14;
  CKDetailsContactsManager *contactsManager;
  CoreTelephonyClient *v16;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKRecipientSelectionController;
  v5 = -[CKRecipientSelectionController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_forceMMS = 0;
    v7 = objc_msgSend(v4, "copyForPendingConversation");
    conversation = v6->_conversation;
    v6->_conversation = (CKPendingConversation *)v7;

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLazuliEnabled");

    if (v10)
    {
      v11 = objc_alloc_init(CKRecipientAvailabilities);
      v12 = 1128;
    }
    else
    {
      v11 = (CKRecipientAvailabilities *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = 1120;
    }
    v13 = *(Class *)((char *)&v6->super.super.super.super.isa + v12);
    *(Class *)((char *)&v6->super.super.super.super.isa + v12) = (Class)v11;

    v6->_allowedByScreenTime = 1;
    v14 = -[CKDetailsContactsManager initWithConversation:delegate:]([CKDetailsContactsManager alloc], "initWithConversation:delegate:", v6->_conversation, v6);
    contactsManager = v6->_contactsManager;
    v6->_contactsManager = v14;

    v6->_numberOfRowsInToField = 1;
    v16 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x1E0CA6E38]);
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = v16;

  }
  return v6;
}

- (void)loadView
{
  void *v3;
  int v4;
  CKRecipientSelectionView *v5;
  CKRecipientSelectionView *v6;
  CKRecipientSelectionView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  CKComposeRecipientView *v18;
  void *v19;
  CKComposeRecipientView *v20;
  CKComposeRecipientView *toField;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  CKUIScrollView1xAdaptable *v52;
  UIScrollView *toFieldScrollingView;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CKContainerView1xAdaptable *v77;
  UIView *toFieldContainerView;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  UIView *v85;
  UIView *headerDecorationView;
  double v87;
  double v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipientSelectionViewRequiresMainScreenBounds");

  if (v4)
  {
    v5 = [CKRecipientSelectionView alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (CKRecipientSelectionView *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionView bounds](v6, "bounds");
    v7 = -[CKRecipientSelectionView initWithFrame:](v5, "initWithFrame:");
    -[CKRecipientSelectionController setView:](self, "setView:", v7);

  }
  else
  {
    v6 = objc_alloc_init(CKRecipientSelectionView);
    -[CKRecipientSelectionController setView:](self, "setView:", v6);
  }

  -[CKRecipientSelectionController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[CKRecipientSelectionController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[CKRecipientSelectionController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 1);

  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController _macToFieldHeight](self, "_macToFieldHeight");
    v13 = v12;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toFieldPreferredHeight");
    v13 = v15;

  }
  if (-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detailsToFieldPreferredHeight");
    v13 = v17;

  }
  v18 = [CKComposeRecipientView alloc];
  -[CKRecipientSelectionController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v20 = -[CKComposeRecipientView initWithFrame:](v18, "initWithFrame:", 0.0, 0.0);
  toField = self->_toField;
  self->_toField = v20;

  -[CKRecipientSelectionController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", 1);
  if (CKIsRunningInMacCatalyst())
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientView setFocusGroupIdentifier:](self->_toField, "setFocusGroupIdentifier:", v23);

    -[CNComposeRecipientTextView textView](self->_toField, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFocusGroupIdentifier:", 0);

  }
  if (CKIsRunningInMacCatalyst())
    v25 = 2;
  else
    v25 = 18;
  -[CKRecipientSelectionController toField](self, "toField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAutoresizingMask:", v25);

  if (loadView_onceToken != -1)
    dispatch_once(&loadView_onceToken, &__block_literal_global_8);
  if (CKIsRunningInMacCatalyst()
    && !-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "labelView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAttributedText:", loadView_toText);
  }
  else
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)loadView_toText, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLabel:", v28);
  }

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "canAccessContacts") ^ 1;
  -[CKRecipientSelectionController toField](self, "toField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHidden:", v30);

  -[CKRecipientSelectionController toField](self, "toField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "textView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "theme");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setKeyboardAppearance:", objc_msgSend(v36, "keyboardAppearance"));

  v37 = -[CKRecipientSelectionController _userInterfaceStyleOverride](self, "_userInterfaceStyleOverride");
  if (v37)
    -[CKRecipientSelectionController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v37);
  -[CKRecipientSelectionController setEditable:](self, "setEditable:", 1);
  -[CKRecipientSelectionController toField](self, "toField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDelegate:", self);

  -[CKRecipientSelectionController toField](self, "toField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLayoutDelegate:", self);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "toFieldScrollViewInsets");
  v42 = v41;
  v44 = v43;
  v46 = v45;

  if (CKIsRunningInMacCatalyst())
  {
    v42 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v44 = *MEMORY[0x1E0C9D538];
  }
  v47 = v13;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
    v47 = v48;
  }
  -[CKRecipientSelectionController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "frame");
  v51 = v50 - v46;

  v52 = -[CKUIScrollView1xAdaptable initWithFrame:]([CKUIScrollView1xAdaptable alloc], "initWithFrame:", v44, v42, v51, v47);
  toFieldScrollingView = self->_toFieldScrollingView;
  self->_toFieldScrollingView = &v52->super;

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAutoresizingMask:", v25);

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setBackgroundColor:", 0);

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setContentInsetAdjustmentBehavior:", 2);

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setShowsHorizontalScrollIndicator:", 0);

  LODWORD(v54) = CKIsRunningInMacCatalyst();
  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if ((_DWORD)v54)
  {
    objc_msgSend(v58, "setAlwaysBounceVertical:", 1);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setShowsHorizontalScrollIndicator:", 0);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setScrollEnabled:", 0);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setShowsVerticalScrollIndicator:", 0);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  }
  else
  {
    objc_msgSend(v58, "setScrollsToTop:", 0);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBounces:", 0);

    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAutoresizesSubviews:", 0);
  }

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toField](self, "toField");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addSubview:", v66);

  -[CKRecipientSelectionController toField](self, "toField");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bounds");
  objc_msgSend(v67, "setFrame:");

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v99 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "bounds");
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v77 = -[CKContainerView1xAdaptable initWithFrame:]([CKContainerView1xAdaptable alloc], "initWithFrame:", v69, v71, v73, v75);
  toFieldContainerView = self->_toFieldContainerView;
  self->_toFieldContainerView = &v77->super;

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setAutoresizingMask:", 2);

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addSubview:", v99);

  -[CKRecipientSelectionController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v82 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addSubview:", v82);

  -[CKRecipientSelectionController delegate](self, "delegate");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v82) = objc_opt_respondsToSelector();

  if ((v82 & 1) != 0)
  {
    -[CKRecipientSelectionController delegate](self, "delegate");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "headerDecorationViewForRecipientSelectionConroller:", self);
    v85 = (UIView *)objc_claimAutoreleasedReturnValue();
    headerDecorationView = self->_headerDecorationView;
    self->_headerDecorationView = v85;

    if (self->_headerDecorationView)
    {
      -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets");
      v88 = v76 + v87;
      -[UIView setAutoresizingMask:](self->_headerDecorationView, "setAutoresizingMask:", 2);
      -[UIView setFrame:](self->_headerDecorationView, "setFrame:", v70, v72, v74, v88);
      -[CKRecipientSelectionController view](self, "view");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "addSubview:", self->_headerDecorationView);

      -[CKRecipientSelectionController view](self, "view");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "sendSubviewToBack:", self->_headerDecorationView);

    }
  }
  if (-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    v91 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKRecipientSelectionController view](self, "view");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "frame");
    v94 = v93;
    if (CKPixelWidth_once_0 != -1)
      dispatch_once(&CKPixelWidth_once_0, &__block_literal_global_814);
    v95 = (void *)objc_msgSend(v91, "initWithFrame:", 0.0, v13, v94, *(double *)&CKPixelWidth_sPixel_0);

    objc_msgSend(v95, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setBackgroundColor:", v96);

    -[CKRecipientSelectionController setSeparator:](self, "setSeparator:", v95);
    -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController separator](self, "separator");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addSubview:", v98);

  }
  -[CKRecipientSelectionController setPeoplePickerHidden:](self, "setPeoplePickerHidden:", 1);

}

void __42__CKRecipientSelectionController_loadView__block_invoke()
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
  v4 = (void *)loadView_attributes;
  loadView_attributes = v3;

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "initWithString:attributes:", v7, loadView_attributes);
  v9 = (void *)loadView_toText;
  loadView_toText = v8;

  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("No Recipients"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "initWithString:attributes:", v12, loadView_attributes);
  v14 = (void *)loadView_placeHolderText;
  loadView_placeHolderText = v13;

}

- (void)viewDidLoad
{
  void *v3;
  CKManualUpdater *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRecipientSelectionController;
  -[CKRecipientSelectionController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleRecipientViewChanged_, *MEMORY[0x1E0D13610], self->_toField);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleIDSResultsWhenSearchTableIsHidden_, CFSTR("CKIDSResultsFinishedWhenSearchTableIsHiddenNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleConversationPreferredServiceDidChangeNotification_, CFSTR("CKConversationPreferredServiceChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookChangedNotification_, *MEMORY[0x1E0D373C0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookPartialChangedNotification_, *MEMORY[0x1E0D373D0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleKeyTransparencyStatusChangedNotification_, *MEMORY[0x1E0D353E8], 0);
  -[CKRecipientSelectionController _updateAddressBookProperties](self, "_updateAddressBookProperties");
  v4 = -[CKManualUpdater initWithTarget:action:]([CKManualUpdater alloc], "initWithTarget:action:", self, sel__updateToFieldRecipientsData);
  -[CKRecipientSelectionController setAddressBookNotificationUpdater:](self, "setAddressBookNotificationUpdater:", v4);

}

- (void)viewDidAppearDeferredSetup
{
  void *v3;
  CKRecipientSearchListController *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CKRecipientSelectionController;
  -[CKViewController viewDidAppearDeferredSetup](&v31, sel_viewDidAppearDeferredSetup);
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[CKRecipientSearchListController initWithStyle:]([CKRecipientSearchListController alloc], "initWithStyle:", CKIsRunningInMacCatalyst() != 0);
    -[CNAutocompleteResultsTableViewController setDelegate:](v4, "setDelegate:", self);
    -[CKRecipientSelectionController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v9 = v9 + v15;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "recipientSelectionSearchControllerRequiresFlexibleMargins");

    if (v17)
    {
      -[CKRecipientSearchListController view](v4, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAutoresizingMask:", 18);

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "recipientSelectionSearchControllerHidesInfoButton");

    if (v20)
      -[CNAutocompleteResultsTableViewController setShouldHideInfoButton:](v4, "setShouldHideInfoButton:", 1);
    -[CKRecipientSearchListController view](v4, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v7, v9, v11, v13);

    -[CKRecipientSearchListController tableView](v4, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKComposeRecipientView focusGroupIdentifier](self->_toField, "focusGroupIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSearchListController tableView](v4, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFocusGroupIdentifier:", v23);

    }
    if (-[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage"))
    {
      v25 = objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");
    }
    else
    {
      v25 = 0;
    }
    -[CKRecipientSearchListController setSmsEnabled:](v4, "setSmsEnabled:", v25);
    -[CKRecipientSelectionController recipients](self, "recipients");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSearchListController setEnteredRecipients:](v4, "setEnteredRecipients:", v26);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "presentsAutocompleteInAPopover"))
    {
      v28 = -[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView");

      if (!v28)
        goto LABEL_18;
    }
    else
    {

    }
    -[CKRecipientSelectionController addChildViewController:](self, "addChildViewController:", v4);
    -[CKRecipientSelectionController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSearchListController view](v4, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    -[CKRecipientSearchListController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
    -[CKRecipientSelectionController bringComposeRecipientViewToFront](self, "bringComposeRecipientViewToFront");
LABEL_18:
    -[CKRecipientSelectionController setSearchListController:](self, "setSearchListController:", v4);
    -[CKRecipientSelectionController _updateToField](self, "_updateToField");
    -[CKRecipientSelectionController _resetSearchResultsInsets](self, "_resetSearchResultsInsets");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRecipientSelectionController;
  -[CKViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[CKRecipientSelectionController undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllActions");

  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentWillClose");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRecipientSelectionController;
  -[CKViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CKRecipientSelectionController setPreventAtomization:](self, "setPreventAtomization:", 0);
  -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("allowedByScreenTime"));

  -[CKRecipientSelectionController setCurrentConversationContext:](self, "setCurrentConversationContext:", 0);
  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentDidClose");

}

- (int64_t)_userInterfaceStyleOverride
{
  void *v3;
  char v4;
  void *v5;
  int64_t v6;

  -[CKRecipientSelectionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CKRecipientSelectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyleOverrideForRecipientSelectionConroller:", self);

  return v6;
}

- (UIEdgeInsets)_additionalSearchResultsEdgeInsets
{
  void *v3;
  char v4;
  void *v5;
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
  double v17;
  UIEdgeInsets result;

  -[CKRecipientSelectionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKRecipientSelectionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "additionalSearchResultsEdgeInsetsForRecipientSelectionController:", self);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x1E0CEB4B0];
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionController;
  -[CKRecipientSelectionController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CKRecipientSelectionController _updateToField](self, "_updateToField");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKRecipientSelectionController;
  v7 = a4;
  -[CKRecipientSelectionController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CKRecipientSelectionController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E274B4D0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __85__CKRecipientSelectionController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateToField");
  return objc_msgSend(*(id *)(a1 + 32), "_resetSearchResultsInsets");
}

- (void)didMoveToParentViewController:(id)a3
{
  -[CKRecipientSelectionController _updateToField](self, "_updateToField", a3);
  -[CKRecipientSelectionController _resetSearchResultsInsets](self, "_resetSearchResultsInsets");
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return 0;
}

- (void)bringComposeRecipientViewToFront
{
  void *v3;
  id v4;

  -[CKRecipientSelectionController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v3);

}

- (double)additionalCatalystTopInset
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  v3 = 0.0;
  if (CKIsRunningInMacCatalyst()
    && !-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "useMacToolbar"))
    {
      -[CKRecipientSelectionController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
      v6 = v5;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "marzNavigationBarHeight");
      v6 = v8;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toFieldPreferredHeight");
    v11 = v10;
    -[CKRecipientSelectionController fieldHeightOffset](self, "fieldHeightOffset");
    v13 = v11 + v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toFieldInterItemSpacing");
    v16 = v6 - (v13 + v15);

    return fmax(v16, 0.0);
  }
  return v3;
}

- (double)fieldHeightOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = 0.0;
  if (v5 != 0.0)
  {
    -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toFieldPreferredHeight");
    v6 = v9 - v11;

  }
  return v6;
}

- (double)_macToFieldHeight
{
  double result;

  -[CKRecipientSelectionController _toolbarHeightForNumberOfRows:](self, "_toolbarHeightForNumberOfRows:", -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField"));
  return result;
}

- (double)preferredMacToolbarHeight
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double result;

  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsOfTextInField");
  v5 = -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField");

  if (v4 != v5)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", objc_msgSend(v6, "numberOfRowsOfTextInField"));

  }
  if (-[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") < 2
    || -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") > 3)
  {
    if (-[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") <= 3)
      v7 = 1;
    else
      v7 = 3;
  }
  else
  {
    v7 = -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField");
  }
  -[CKRecipientSelectionController _toolbarHeightForNumberOfRows:](self, "_toolbarHeightForNumberOfRows:", v7);
  return result;
}

- (BOOL)_shouldEnableScrolling
{
  return (-[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") < 2
       || -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") >= 4)
      && -[CKRecipientSelectionController numberOfRowsInToField](self, "numberOfRowsInToField") > 3;
}

- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultToolbarHeight");
  v6 = v5;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0D13618], "defaultHeight");
    v6 = v6 + (double)(a3 - 1) * (v7 + 6.0);
  }

  return v6;
}

- (void)_handleRecipientViewChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_recipientSelectionControllerDidChange, 0);
  -[CKRecipientSelectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_recipientSelectionControllerDidChange, 0, 0.0);
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v11, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", objc_msgSend(v7, "count") != 0);

  }
  -[CKRecipientSelectionController _adjustToFieldPositionIfNecessary](self, "_adjustToFieldPositionIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recipientSelectionController:textDidChange:", self, v6);

  -[CKRecipientSelectionController _updateSearchResultsTable](self, "_updateSearchResultsTable");
  -[CKRecipientSelectionController alternateAddressesAlertController](self, "alternateAddressesAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CKRecipientSelectionController alternateAddressesAlertController](self, "alternateAddressesAlertController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    -[CKRecipientSelectionController setAlternateAddressesAlertController:](self, "setAlternateAddressesAlertController:", 0);
  }

}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v12, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", objc_msgSend(v8, "count") != 0);

  }
  if (-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v6))
  {
    objc_msgSend(v12, "atomViewForRecipient:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPresentationOptions:", 8);
    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v10);

  }
  -[CKRecipientSelectionController updateScreenTimePolicy](self, "updateScreenTimePolicy");
  objc_msgSend(v6, "IDSCanonicalAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController didAddRecipient:](self, "didAddRecipient:", v11);

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v13, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", objc_msgSend(v8, "count") != 0);

  }
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[CKRecipientSelectionController toField](self, "toField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "recipientSelectionController:textDidChange:", self, v12);

  -[CKRecipientSelectionController removeRecipient:](self, "removeRecipient:", v6);
  -[CKRecipientSelectionController updateScreenTimePolicy](self, "updateScreenTimePolicy");

}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!CKIsRunningInMacCatalyst()
    || !-[CKRecipientSelectionController isSearchResultsHidden](self, "isSearchResultsHidden"))
  {
    objc_msgSend(v6, "clearText");
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelSearch");

    -[CKRecipientSelectionController _updateShowingSearch](self, "_updateShowingSearch");
  }
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v18 = v7;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "length") && CKIsValidAddress(v15))
          {
            +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "recipientWithAddress:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v7 = v18;
  }

}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  id v4;

  -[CKRecipientSelectionController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientSelectionControllerReturnPressed:", self);

}

- (void)composeRecipientViewTabPressed:(id)a3
{
  id v4;

  -[CKRecipientSelectionController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientSelectionControllerTabPressed:", self);

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipientWithAddress:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipientWithContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
  void *v26;

  height = a4.height;
  width = a4.width;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfRowsOfTextInField");

    if (v13 <= 1)
    {
      -[CKRecipientSelectionController composeRecipientViewOriginY](self, "composeRecipientViewOriginY");
      v8 = v14;
    }
  }
  -[CKRecipientSelectionController toField](self, "toField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v7, v8, v11, height);

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentSize");
  v18 = v17;
  v20 = v19;

  if (width != v18 || height != v20)
  {
    -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentSize:", width, height);

    -[CKRecipientSelectionController _updateRecipientViewLayouts](self, "_updateRecipientViewLayouts");
    -[CKRecipientSelectionController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recipientSelectionControllerDidChangeSize:", self);

    if (CKIsRunningInMacCatalyst())
    {
      v23 = -[CKRecipientSelectionController _shouldEnableScrolling](self, "_shouldEnableScrolling");
      -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setScrollEnabled:", v23);

      v25 = -[CKRecipientSelectionController _shouldEnableScrolling](self, "_shouldEnableScrolling");
      -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setShowsVerticalScrollIndicator:", v25);

    }
  }
  -[CKRecipientSelectionController _updateYOriginSearchListController](self, "_updateYOriginSearchListController");
}

- (BOOL)_systemUnderLock
{
  int v2;

  v2 = CKIsRunningInMessagesViewService();
  if (v2)
    LOBYTE(v2) = CKIsScreenLocked();
  return v2;
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CKRecipientSelectionController *v18;
  CKRecipientSelectionController *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD aBlock[5];

  v4 = a3;
  if (!-[CKRecipientSelectionController _systemUnderLock](self, "_systemUnderLock"))
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController composeRecipientView:didFinishEnteringAddress:](self, "composeRecipientView:didFinishEnteringAddress:", v5, v6);

    -[CKRecipientSelectionController setPeoplePickerHidden:](self, "setPeoplePickerHidden:", 0);
    -[CKRecipientSelectionController firstResponder](self, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadInputViews");

    if (self->_gameCenterPickerBlock)
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputAccessoryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[CKRecipientSelectionController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recipientSelectionControllerRequestDismissKeyboard:", self);

      (*((void (**)(void))self->_gameCenterPickerBlock + 2))();
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke;
      aBlock[3] = &unk_1E274B4F8;
      aBlock[4] = self;
      v12 = _Block_copy(aBlock);
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke_2;
      v22[3] = &unk_1E274B520;
      v22[4] = self;
      v13 = _Block_copy(v22);
      -[CKRecipientSelectionController contactPickerViewController](self, "contactPickerViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setModalPresentationStyle:", 7);

      -[CKRecipientSelectionController contactPickerViewController](self, "contactPickerViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "popoverPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPermittedArrowDirections:", 1);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "useMacToolbar"))
      {
        v18 = self;
      }
      else
      {
        -[CKRecipientSelectionController navigationController](self, "navigationController");
        v18 = (CKRecipientSelectionController *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController contactPickerViewController](self, "contactPickerViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentViewController:fromViewController:presentationHandler:dismissalHandler:animated:completion:", v21, v19, v12, v13, 1, 0);

    }
  }

}

id __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;

  objc_msgSend(*(id *)(a1 + 32), "toFieldContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  *a2 = v7;
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  result = (id)objc_claimAutoreleasedReturnValue();
  *a3 = result;
  return result;
}

uint64_t __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPeoplePicker");
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController setIsDisambiguating:](self, "setIsDisambiguating:", 0);
    objc_msgSend(v6, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v6, "recipient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController _showContactCardForRecipient:sourceView:](self, "_showContactCardForRecipient:sourceView:", v9, v10);

    }
  }
  else
  {
    -[CKRecipientSelectionController sendUpdateRecipientForAtom:](self, "sendUpdateRecipientForAtom:", v6);
    -[CKRecipientSelectionController setIsDisambiguating:](self, "setIsDisambiguating:", 1);
  }

}

- (void)sendUpdateRecipientForAtom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecipients:disambiguatingRecipient:", v6, v4);

  -[CKRecipientSelectionController _showSearchField](self, "_showSearchField");
}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v9, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController _showDetailsForRecipient:canDelete:](self, "_showDetailsForRecipient:canDelete:", v7, 0);
    -[CKRecipientSelectionController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipientSelectionControllerDidPushABViewController:", self);

  }
}

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (-[CKRecipientSelectionController isDisambiguating](self, "isDisambiguating"))
  {
    -[CKRecipientSelectionController setIsDisambiguating:](self, "setIsDisambiguating:", 0);
    -[CKRecipientSelectionController _hideSearchField](self, "_hideSearchField");
  }
  v5 = objc_msgSend(v8, "count") == 1;
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage")&& (objc_msgSend(v7, "isGroup") & 1) == 0)
    {
      -[CKRecipientSelectionController _showActionSheetForRecipient:animated:](self, "_showActionSheetForRecipient:animated:", v7, 1);
    }

    v6 = v8;
  }

}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBusinessConversation"))
  {

LABEL_4:
    -[CKRecipientSelectionController toField](self, "toField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    v9 = 0;
    goto LABEL_5;
  }
  -[CKRecipientSelectionController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStewieConversation");

  if (v6)
    goto LABEL_4;
  if (!-[CKRecipientSelectionController isEditable](self, "isEditable"))
    goto LABEL_6;
  v9 = 1;
LABEL_5:
  objc_msgSend(v11, "setEditable:", v9);
LABEL_6:
  -[CKRecipientSelectionController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipientSelectionControllerDidBecomeFirstResponder:", self);

}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  id v4;

  objc_msgSend(a3, "setEditable:", 0);
  -[CKRecipientSelectionController addressBookNotificationUpdater](self, "addressBookNotificationUpdater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIfNeeded");

}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  char isKindOfClass;
  CKDetailsContactsManager *v13;
  void *v14;
  CKDetailsContactsManager *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
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
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKRecipientSelectionController toField](self, "toField");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    goto LABEL_2;
  objc_msgSend(v7, "recipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v13 = [CKDetailsContactsManager alloc];
  -[CKRecipientSelectionController conversation](self, "conversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CKDetailsContactsManager initWithConversation:delegate:](v13, "initWithConversation:delegate:", v14, self);
  -[CKRecipientSelectionController setContactsManager:](self, "setContactsManager:", v15);

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = v7;
    objc_msgSend(v7, "recipient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "children");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v22), "normalizedAddress");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v20);
    }

    -[CKRecipientSelectionController conversation](self, "conversation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recipients");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToArray:", v16);

    if (v27)
    {
      -[CKRecipientSelectionController conversation](self, "conversation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController contactsManager](self, "contactsManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKContextMenuGenerator menuForNamedGroupConversation:andContactsManager:](CKContextMenuGenerator, "menuForNamedGroupConversation:andContactsManager:", v28, v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    v7 = v42;
  }
  else
  {
    -[CKRecipientSelectionController contactsManager](self, "contactsManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "conformsToProtocol:", &unk_1EE2A9A30);

    if (!v31)
      goto LABEL_2;
    objc_msgSend(v7, "recipient");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
      goto LABEL_2;
    v33 = (void *)v32;
    objc_msgSend(v7, "recipient");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "normalizedAddress");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
LABEL_2:
      v9 = 0;
      goto LABEL_3;
    }
    objc_msgSend(v7, "recipient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "normalizedAddress");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecipientSelectionController contactsManager](self, "contactsManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "contextMenuForEntity:atom:", v38, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    v40 = (void *)MEMORY[0x1E0CEA4B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __87__CKRecipientSelectionController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke;
    v43[3] = &unk_1E274B290;
    v44 = v9;
    v41 = v9;
    objc_msgSend(v40, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v43);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_3:

  return v9;
}

id __87__CKRecipientSelectionController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSearchResultsHidden") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasSearchResults");

  }
  return v5;
}

- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSearchResults");

  return v4;
}

- (void)dismissSearchResultsForComposeRecipientView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "clearText");
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSearch");

  -[CKRecipientSelectionController _updateShowingSearch](self, "_updateShowingSearch");
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectNextSearchResult");

}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectPreviousSearchResult");

}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4
{
  void *v6;
  int v7;
  void *v8;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "confirmSelectedRecipient");

  if (a4 == 1 && v7)
  {
    -[CKRecipientSelectionController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipientSelectionControllerShouldResignFirstResponder:", self);

  }
  return v7;
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "expandSelectedRecipient");

  return v7;
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[CKRecipientSelectionController searchListController](self, "searchListController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collapseSelectedRecipient");

  return v7;
}

- (UIEdgeInsets)layoutMarginsForComposeRecipientView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  v4 = a3;
  -[CKRecipientSelectionController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

  if (v13)
    v14 = v12;
  else
    v14 = v8;
  if (v13)
    v15 = v8;
  else
    v15 = v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "additionalComposeRecipientLayoutMargins");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v6 + v18;
  v26 = v15 + v24;
  v27 = v10 + v22;
  v28 = v14 + v20;
  result.right = v26;
  result.bottom = v27;
  result.left = v28;
  result.top = v25;
  return result;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  _BOOL4 v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v37 = a5;
      v38 = 2048;
      v39 = objc_msgSend(v12, "length");
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Selected recipient at index %ld, searchText length %ld", buf, 0x16u);

    }
  }
  -[CKRecipientSelectionController toField](self, "toField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearText");

  -[CKRecipientSelectionController _updateShowingSearch](self, "_updateShowingSearch");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "stewieEnabled");

  if (v15)
  {
    if (objc_msgSend(v9, "kind") == 6)
    {
      v16 = -[CKRecipientSelectionController _openStewieAppForEmergencyIfRequired](self, "_openStewieAppForEmergencyIfRequired");
    }
    else
    {
      if (objc_msgSend(v9, "kind") != 7)
        goto LABEL_11;
      v16 = -[CKRecipientSelectionController _openStewieAppForRoadsideIfRequired](self, "_openStewieAppForRoadsideIfRequired");
    }
    if (v16)
      goto LABEL_34;
  }
LABEL_11:
  v17 = objc_msgSend(v9, "isGroup");
  if (!v17)
  {
    if (!-[CKRecipientSelectionController isMAIDGroupsEnabled](self, "isMAIDGroupsEnabled"))
      goto LABEL_29;
    v19 = 0;
    goto LABEL_16;
  }
  v18 = -[CKRecipientSelectionController shouldAtomizeToConversationName](self, "shouldAtomizeToConversationName");
  if (-[CKRecipientSelectionController isMAIDGroupsEnabled](self, "isMAIDGroupsEnabled"))
  {
    v19 = v18 ^ 1;
LABEL_16:
    if (objc_msgSend(v9, "sourceType") == 256)
      v20 = v17;
    else
      v20 = 0;
    if (((v19 | v20) & 1) != 0)
      goto LABEL_20;
LABEL_29:
    -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", v9);
    objc_msgSend(v9, "address");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (v26)
      -[CKRecipientSelectionController handlePendingRecipient:](self, "handlePendingRecipient:", v9);
    goto LABEL_31;
  }
  if ((v18 & 1) != 0)
    goto LABEL_29;
LABEL_20:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v9, "children", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v21);
        -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v22);
  }

LABEL_31:
  -[CKRecipientSelectionController toField](self, "toField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isFirstResponder");

  if ((v28 & 1) == 0)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "becomeFirstResponder");

  }
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "didSelectRecipient:atIndex:", v9, a5);

LABEL_34:
}

- (BOOL)_openStewieAppForEmergencyIfRequired
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  CoreTelephonyClient *coreTelephonyClient;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];
  _QWORD v16[5];
  id v17;

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStewieEmergencyActive");

  if (v4)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", *MEMORY[0x1E0D39290]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Opening emergency conversation", buf, 2u);
        }

      }
      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke;
      v16[3] = &unk_1E274A108;
      v16[4] = self;
      v6 = v6;
      v17 = v6;
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v16);

    }
    else if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "No emergency conversation found", buf, 2u);
      }

    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CA6E08]);
    objc_msgSend(v6, "setReason:", 2);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_249;
    v13[3] = &unk_1E274B570;
    objc_copyWeak(&v14, (id *)buf);
    -[CoreTelephonyClient requestStewieWithContext:completion:](coreTelephonyClient, "requestStewieWithContext:completion:", v6, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

  return v4 ^ 1;
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(WeakRetained, "showConversation:animate:", *(_QWORD *)(a1 + 40), 1);

}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Opening Stewie SOS application", buf, 2u);
    }

  }
  if (v3)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_249_cold_1(v3);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_250;
  block[3] = &unk_1E274B548;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);

}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_250(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (BOOL)_openStewieAppForRoadsideIfRequired
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  CoreTelephonyClient *coreTelephonyClient;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];
  _QWORD v18[5];
  id v19;

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStewieRoadsideActive");

  if (v4)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mostRecentlyUsedRoadsideChatIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Opening most recent roadside conversation", buf, 2u);
        }

      }
      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke;
      v18[3] = &unk_1E274A108;
      v18[4] = self;
      v8 = v8;
      v19 = v8;
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v18);

    }
    else if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "No roadside conversation found", buf, 2u);
      }

    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CA6E08]);
    objc_msgSend(v8, "setReason:", 7);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_252;
    v15[3] = &unk_1E274B570;
    objc_copyWeak(&v16, (id *)buf);
    -[CoreTelephonyClient requestStewieWithContext:completion:](coreTelephonyClient, "requestStewieWithContext:completion:", v8, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  return v4 ^ 1;
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(WeakRetained, "showConversation:animate:", *(_QWORD *)(a1 + 40), 1);

}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_252(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Opening Stewie Roadside application", buf, 2u);
    }

  }
  if (v3)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_252_cold_1(v3);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_253;
  block[3] = &unk_1E274B548;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);

}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_253(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)_handleIDSResultsWhenSearchTableIsHidden:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "We received an IDS query results when search table is visible. Checkinf if there are any penidng atoms we should update.", buf, 2u);
    }

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v10;
              _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Found a pending recipient: %@. We will try to resolve it with the new IDS results.", buf, 0xCu);
            }

          }
          -[CKRecipientSelectionController handlePendingRecipient:](self, "handlePendingRecipient:", v10);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

}

- (void)handlePendingRecipient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Trying to updating pending state for recipient: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  -[CKRecipientSelectionController preferredRecipientForPendingUnifiedContact:](self, "preferredRecipientForPendingUnifiedContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D136C8]);
    objc_msgSend(v4, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithChildren:defaultChild:", v8, v6);

    objc_msgSend(v6, "normalizedAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAddress:", v10);

    -[CKRecipientSelectionController toField](self, "toField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeRecipient:", v4);

    -[CKRecipientSelectionController toField](self, "toField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addRecipient:", v9);

    -[CKRecipientSelectionController toField](self, "toField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateAtomPresentationOptionsForRecipient:", v6);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v9;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Replaced old pending recipient with new recipient: %@", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "We didn't find existing conversation or new recipient didn't finish resolving all IDS: %@.", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (id)preferredRecipientForPendingUnifiedContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Looking for preffered recipient for the pending recipient: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController preferredRecipientForExistingConversationOfRecipients:](self, "preferredRecipientForExistingConversationOfRecipients:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "No recipient in existing conversations. Looking for best handle for new contact: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(v4, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController preferredRecipientForNewContact:](self, "preferredRecipientForNewContact:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Returning preffered recipient: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v7;
}

- (char)serviceTypeForRecipient:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat");
  objc_msgSend(v4, "normalizedAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSCanonicalAddressForAddress:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKRecipientSelectionController searchListController:idStatusForIDSID:](self, "searchListController:idStatusForIDSID:", v8, v7);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "normalizedAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v11;
      v39 = 2048;
      v40 = v9;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "IDS status for recipinet address %@ is %ld", buf, 0x16u);

    }
  }
  if (v9 == 2)
  {
    LOBYTE(v16) = 0;
  }
  else if (v9 != 1
         || ((objc_msgSend(MEMORY[0x1E0D35910], "iMessageService"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "__ck_serviceType"),
              v12,
              v14 = MEMORY[0x193FF3AEC](v7),
              !v5)
           ? (v15 = 0)
           : (v15 = 4),
             !v14 ? (v16 = v13) : (v16 = v15),
             v16 == 1))
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "smsEnabled");

    if (v18)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultiMessageAccount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "normalizedAddress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      IMStripFormattingFromAddress();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imHandleWithID:alreadyCanonical:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v36 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "conversationForHandles:displayName:joinedChatsOnly:create:", v25, 0, 1, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v26, "sendingService");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(19);
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v38 = v24;
              v39 = 2112;
              v40 = (int64_t)v27;
              _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Updating service color in recipient search list for handle: %@, with service: %@", buf, 0x16u);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
          {
            v34 = v24;
            v35 = v27;
            _CKLogExternal();
          }
          LOBYTE(v16) = objc_msgSend(v27, "__ck_serviceType", v34, v35);
          v29 = objc_msgSend(v24, "isBusiness");
          if (v5)
            v30 = 4;
          else
            v30 = 0;
          if (v29)
            LOBYTE(v16) = v30;

          goto LABEL_37;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "normalizedAddress");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v32;
          _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "ServiceTypeForRecipient: Handle is nil for recipient address: %@", buf, 0xCu);

        }
      }
      LOBYTE(v16) = 1;
LABEL_37:

      goto LABEL_38;
    }
    LOBYTE(v16) = 1;
  }
LABEL_38:

  return v16;
}

- (id)expandedRecipientsForGroupRecipient:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isGroup"))
  {
    objc_msgSend(v3, "children");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (char)serviceColorForRecipientAddresses:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CKRecipientSelectionController_serviceColorForRecipientAddresses___block_invoke;
  v6[3] = &unk_1E274A258;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __68__CKRecipientSelectionController_serviceColorForRecipientAddresses___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "searchListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "searchListController:idStatusForIDSID:", v7, v12);

  if (v8 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_7:
    *a4 = 1;
    goto LABEL_12;
  }
  if (v8 != 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    goto LABEL_7;
  }
  if (MEMORY[0x193FF3AEC](v12))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = 6;
  }
  else
  {
    if (!MEMORY[0x193FF3B28](v12))
    {
      objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "__ck_displayColor");

      goto LABEL_12;
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = 12;
  }
  *(_BYTE *)(v9 + 24) = v10;
LABEL_12:

}

- (id)conversationForRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  CKRecipientSelectionController *v20;
  id v21;

  v4 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __60__CKRecipientSelectionController_conversationForRecipients___block_invoke;
  v19 = &unk_1E274B480;
  v20 = self;
  v7 = v6;
  v21 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v16);

  objc_msgSend(v5, "conversationForHandles:displayName:joinedChatsOnly:create:", v7, 0, 1, 0, v16, v17, v18, v19, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastFinishedMessageItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && !objc_msgSend(v11, "isEqualToString:", v13))
    {

      v14 = 0;
      goto LABEL_6;
    }

  }
  v14 = v8;
LABEL_6:

  return v14;
}

void __60__CKRecipientSelectionController_conversationForRecipients___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "searchListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultiMessageAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  IMStripFormattingFromAddress();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v8, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    v9 = v10;
  }

}

- (BOOL)lastSentMessageWasNotDeliveredForConversation:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldForceServerStatusRefresh");

  return v4;
}

- (BOOL)hasEmailRecipientsInAddresses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((IMStringIsEmail() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)colorTypeForRecipient:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(id, id);
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[CKRecipientSelectionController expandedRecipientsForGroupRecipient:](self, "expandedRecipientsForGroupRecipient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_262_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v33 = -[CKRecipientSelectionController serviceColorForRecipientAddresses:](self, "serviceColorForRecipientAddresses:", v9);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v28 = v6;
  v11 = objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled");
  if (v10)
    v12 = v11;
  else
    v12 = 0;
  if (v12 != 1)
  {
    if (*((unsigned __int8 *)v31 + 24) != 255)
      goto LABEL_15;
    v14 = 0;
LABEL_13:
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "smsEnabled");

    if (((v16 | v14) & 1) != 0)
      goto LABEL_14;
LABEL_15:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "theme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recipientTextColorForColorType:", *((char *)v31 + 24));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v22);
    goto LABEL_16;
  }
  v13 = objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForHawking:", v10);
  v14 = v13;
  if (*((unsigned __int8 *)v31 + 24) == 255)
    goto LABEL_13;
  if (!v13)
    goto LABEL_15;
LABEL_14:
  -[CKRecipientSelectionController hasEmailRecipientsInAddresses:](self, "hasEmailRecipientsInAddresses:", v9);
  -[CKRecipientSelectionController conversationForRecipients:](self, "conversationForRecipients:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController lastSentMessageWasNotDeliveredForConversation:](self, "lastSentMessageWasNotDeliveredForConversation:", v17);
  objc_msgSend(v17, "chat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "receivedResponseForChat");

  objc_msgSend(v17, "chat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastAddressedHandleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastAddressedSIMID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "forceMMS");
  objc_msgSend(v17, "chat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "isDowngraded");
  v22 = v17;
  v29 = v7;
  IMChatCalculateServiceForSendingNewComposeMaybeForce();

LABEL_16:
  _Block_object_dispose(&v30, 8);

}

uint64_t __67__CKRecipientSelectionController_colorTypeForRecipient_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

void __67__CKRecipientSelectionController_colorTypeForRecipient_completion___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isBusinessConversation") & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isStewieConversation") & 1) != 0)
  {
    v3 = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v9)
    {

      v3 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35918], "iMessageLiteService");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v3 = v5 == v9;

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipientTextColorForColorType:", *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)preferredColorTypeForExistingConversation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isBusinessConversation") & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend(v3, "isStewieConversation") & 1) != 0)
  {
    v5 = 12;
  }
  else
  {
    v5 = objc_msgSend(v4, "__ck_displayColor");
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipientTextColorForColorType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)preferredRecipientForExistingConversationOfRecipients:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Looking for existing conversation for these recipients: %@", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__CKRecipientSelectionController_preferredRecipientForExistingConversationOfRecipients___block_invoke;
  v8[3] = &unk_1E274B5E0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __88__CKRecipientSelectionController_preferredRecipientForExistingConversationOfRecipients___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handleForRecipientNormalizedAddress:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "chatForIMHandle:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject chatIdentifier](v9, "chatIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v20 = 138412290;
            v21 = v15;
            _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Found recipient from existing chat. Preferred recipient: %@", (uint8_t *)&v20, 0xCu);
          }

        }
        *a4 = 1;
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          -[NSObject chatIdentifier](v10, "chatIdentifier");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v18;
          v22 = 2112;
          v23 = v19;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "We didn't find a match of the chat identifier: %@ and handle ID = %@ ", (uint8_t *)&v20, 0x16u);

        }
LABEL_20:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v8;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "There was no chat found for handle: %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "normalizedAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v16;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "There was no handle found for recipient normalized address: %@", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_21;
  }
LABEL_22:

}

- (id)handleForRecipientNormalizedAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultiMessageAccount");
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

- (char)_satelliteConnectedColorOverrideForRecipient:(id)a3 inConversation:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a4, "sendingService", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageLiteService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35918], "satelliteSMSService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v6)
      v7 = 0;
    else
      v7 = -1;
  }

  return v7;
}

- (void)tintColorForRecipient:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[4];
  void (**v31)(id, void *);
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipientTextColorForColorType:", 0xFFFFFFFFLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Request for setting color for: %@.", buf, 0xCu);
    }

  }
  -[CKRecipientSelectionController expandedRecipientsForGroupRecipient:](self, "expandedRecipientsForGroupRecipient:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController conversationForRecipients:](self, "conversationForRecipients:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCarrierPigeonEnabled");

  if (v15
    && (objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isSatelliteConnectionActive"),
        v16,
        v17))
  {
    v18 = -[CKRecipientSelectionController _satelliteConnectedColorOverrideForRecipient:inConversation:](self, "_satelliteConnectedColorOverrideForRecipient:inConversation:", v6, v13);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recipientTextColorForColorType:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v21);

  }
  else if (v13
         && ((objc_msgSend(v6, "isNotAChildOfUnifiedRecipient") & 1) != 0
          || objc_msgSend(v6, "isUnnamedGroup")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v6;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "There is existing conversation with recipient: %@. We will set the color from the conversaion.", buf, 0xCu);
      }

    }
    -[CKRecipientSelectionController preferredColorTypeForExistingConversation:](self, "preferredColorTypeForExistingConversation:", v13);
    v23 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, (void *)v23);
    v10 = (void *)v23;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v6;
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "There is no existing conversation with recipient: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "children");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[CKRecipientSelectionController hasIDSResultsForAllRecipients:](self, "hasIDSResultsForAllRecipients:", v25);

    v27 = IMOSLoggingEnabled();
    if (v26)
    {
      if (v27)
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v6;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Setting color from the IDS results for: %@ ", buf, 0xCu);
        }

      }
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __67__CKRecipientSelectionController_tintColorForRecipient_completion___block_invoke;
      v30[3] = &unk_1E274B608;
      v31 = v7;
      -[CKRecipientSelectionController colorTypeForRecipient:completion:](self, "colorTypeForRecipient:completion:", v6, v30);

    }
    else
    {
      if (v27)
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v6;
          _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "No IDS results: %@.", buf, 0xCu);
        }

      }
      v7[2](v7, v10);
    }
  }

}

uint64_t __67__CKRecipientSelectionController_tintColorForRecipient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  -[CKRecipientSelectionController tintColorForRecipient:completion:](self, "tintColorForRecipient:completion:", a4, a5);
}

- (id)recipientIsDuetSuggestion:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v21 = v8;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Checking for DUET results for  recipient: %@", buf, 0xCu);
          }

        }
        v10 = (objc_msgSend(v8, "sourceType", v15, (_QWORD)v16) & 0x10) == 0;
        v11 = IMOSLoggingEnabled();
        if (!v10)
        {
          if (v11)
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Result is from Duet.", buf, 2u);
            }

          }
          v4 = v8;
          goto LABEL_23;
        }
        if (v11)
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Result is not from Duet.", buf, 2u);
          }

        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_23:

  return v4;
}

- (id)preferredRecipientForRecipients:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Searching for preferred recipient for unified recipient: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[CKRecipientSelectionController preferredRecipientForExistingConversationOfRecipients:](self, "preferredRecipientForExistingConversationOfRecipients:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[CKRecipientSelectionController preferredRecipientForNewContact:](self, "preferredRecipientForNewContact:", v4), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "We found preferred handle for new contact from IDS. Invalidate the to filed.", (uint8_t *)&v11, 2u);
        }

      }
      -[CKRecipientSelectionController toField](self, "toField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateAtomPresentationOptionsForRecipient:", v6);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "No recipients to search for. Returning nil for preferred recipient.", (uint8_t *)&v11, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipients:(id)a4
{
  return -[CKRecipientSelectionController preferredRecipientForRecipients:](self, "preferredRecipientForRecipients:", a4);
}

- (id)preferredRecipientForNewContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Looking for preferred recipient for new contact: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  if (-[CKRecipientSelectionController hasIDSResultsForAllRecipients:](self, "hasIDSResultsForAllRecipients:", v4))
  {
    -[CKRecipientSelectionController preferredRecipientForRecipients:forServiceType:](self, "preferredRecipientForRecipients:forServiceType:", v4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Selected preferred recipient for iMessage: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    if (!v6)
    {
      -[CKRecipientSelectionController preferredRecipientForRecipients:forServiceType:](self, "preferredRecipientForRecipients:forServiceType:", v4, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v6;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Selected preferred recipient for SMS: %@", (uint8_t *)&v14, 0xCu);
        }

      }
      if (!v6)
      {
        -[CKRecipientSelectionController preferredRecipientForRecipients:forServiceType:](self, "preferredRecipientForRecipients:forServiceType:", v4, 4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v14 = 138412290;
            v15 = v6;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Selected preferred recipient for Bussiness chat: %@", (uint8_t *)&v14, 0xCu);
          }

        }
        if (!v6)
        {
          -[CKRecipientSelectionController preferredRecipientForRecipients:forServiceType:](self, "preferredRecipientForRecipients:forServiceType:", v4, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              v14 = 138412290;
              v15 = v6;
              _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Selected preferred recipient for invalid service type: %@", (uint8_t *)&v14, 0xCu);
            }

          }
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Returning preferred recipient: %@", (uint8_t *)&v14, 0xCu);
      }

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
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "IDS didn't resolve for all handles. Return nil for preffered handle.", (uint8_t *)&v14, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)preferredRecipientForRecipients:(id)a3 forServiceType:(char)a4
{
  int v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[CKRecipientSelectionController serviceTypeForRecipient:](self, "serviceTypeForRecipient:", v13, (_QWORD)v17) == v4)
        {
          if ((objc_msgSend(v13, "isPhone") & 1) != 0)
          {
            v15 = v13;

            goto LABEL_20;
          }
          if (objc_msgSend(v13, "isEmail"))
            v14 = v10 == 0;
          else
            v14 = 0;
          if (v14)
          {
            v10 = v13;

            v9 = v10;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  v9 = v9;
  v15 = v9;
LABEL_20:

  return v15;
}

- (BOOL)hasIDSResultsForAllRecipients:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Checking if we have IDS results for : %@ ", buf, 0xCu);
    }

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v8 = 138412546;
    v22 = v8;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "normalizedAddress", v22, (_QWORD)v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "IDSCanonicalAddressForAddress:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKRecipientSelectionController searchListController](self, "searchListController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CKRecipientSelectionController searchListController:idStatusForIDSID:](self, "searchListController:idStatusForIDSID:", v14, v13);

        v16 = IMOSLoggingEnabled();
        if (!v15)
        {
          if (v16)
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v28 = v13;
              v29 = 2048;
              v30 = 0;
              _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "IDS status for address: %@ is IDSIDStatusUnknown: %ld", buf, 0x16u);
            }

          }
          v19 = 0;
          goto LABEL_27;
        }
        if (v16)
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v22;
            v28 = v13;
            v29 = 2048;
            v30 = v15;
            _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "IDS status for address %@ is %ld", buf, 0x16u);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "IDS status is resolved for all recipients.", buf, 2u);
    }

  }
  v19 = 1;
LABEL_27:

  return v19;
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isGroup"))
    -[CKRecipientSelectionController _showDetailsForGroup:](self, "_showDetailsForGroup:", v5);
  else
    -[CKRecipientSelectionController _showDetailsForRecipient:canDelete:](self, "_showDetailsForRecipient:canDelete:", v5, 1);

}

- (void)searchListControllerDidScroll:(id)a3
{
  char v4;
  void *v5;
  id v6;

  -[CNComposeRecipientTextView textView](self->_toField, "textView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFirstResponder"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode");

    if ((v4 & 1) == 0)
    {
      -[CKRecipientSelectionController setPreventAtomization:](self, "setPreventAtomization:", 1);
      -[CKRecipientSelectionController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientSelectionControllerRequestDismissKeyboard:", self);

      -[CKRecipientSelectionController setPreventAtomization:](self, "setPreventAtomization:", 0);
    }
  }
  else
  {

  }
}

- (id)_serviceReachabilityContextForPendingConversation:(BOOL)a3
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

  v3 = a3;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceReachabilityContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (IMBagBoolValueWithDefault())
    objc_msgSend(v7, "setIsForPendingConversation:", v3);
  -[CKRecipientSelectionController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "internalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreconditionsIgnoredForServices:", v12);

  }
  return v7;
}

- (void)refreshAvailabilityForRecipients:(id)a3 pendingConversation:(BOOL)a4
{
  -[CKRecipientSelectionController refreshAvailabilityForRecipients:pendingConversation:preconditionsIgnoredForServices:](self, "refreshAvailabilityForRecipients:pendingConversation:preconditionsIgnoredForServices:", a3, a4, 0);
}

- (void)refreshAvailabilityForRecipients:(id)a3 pendingConversation:(BOOL)a4 preconditionsIgnoredForServices:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CKRecipientSelectionController *v18;
  BOOL v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLazuliEnabled");

  if (v11)
  {
    -[CKRecipientSelectionController _serviceReachabilityContextForPendingConversation:](self, "_serviceReachabilityContextForPendingConversation:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
      objc_msgSend(v12, "setPreconditionsIgnoredForServices:", v9);
    -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __119__CKRecipientSelectionController_refreshAvailabilityForRecipients_pendingConversation_preconditionsIgnoredForServices___block_invoke;
    v15[3] = &unk_1E274B650;
    v16 = v8;
    v19 = v6;
    v17 = v9;
    v18 = self;
    objc_msgSend(v14, "refreshAvailabilityForRecipients:context:resultHandler:", v16, v13, v15);

  }
}

void __119__CKRecipientSelectionController_refreshAvailabilityForRecipients_pendingConversation_preconditionsIgnoredForServices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Availability request finished for recipients: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v10) && !*(_QWORD *)(a1 + 40))
  {
    v11 = *(_BYTE *)(a1 + 56) == 0;

    if (v11)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 48), "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "participants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__imArrayByApplyingBlock:", &__block_literal_global_273_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "expandedRecipientAvailabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "internalName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recipientsWithoutResults:onService:", v10, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendingService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v19, "internalName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "internalName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setWithObjects:", v21, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "refreshAvailabilityForRecipients:pendingConversation:preconditionsIgnoredForServices:", v9, *(unsigned __int8 *)(a1 + 56), v24);
      }

    }
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "recipientAvailibilitiesDidUpdate");

}

id __119__CKRecipientSelectionController_refreshAvailabilityForRecipients_pendingConversation_preconditionsIgnoredForServices___block_invoke_271(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)searchListController:(id)a3 destinationsUpdated:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D39840];
  v6 = a4;
  objc_msgSend(v5, "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLazuliEnabled");

  if (v8)
  {
    -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromIDSResults:", v6);
  }
  else
  {
    -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  }

}

- (int64_t)searchListController:(id)a3 idStatusForIDSID:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLazuliEnabled");

  if (v7)
  {
    -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "idStatusForRecipient:service:", v5, *MEMORY[0x1E0D38F68]);
  }
  else
  {
    -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "integerValue");

  }
LABEL_7:

  return v9;
}

- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4
{
  -[CKRecipientSelectionController setRecentContactForPresentedCNCard:](self, "setRecentContactForPresentedCNCard:", a4);
  -[CKRecipientSelectionController _removeRecent](self, "_removeRecent");
}

- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4
{
  -[CKRecipientSelectionController _showDetailsForRecipient:canDelete:](self, "_showDetailsForRecipient:canDelete:", a4, 0);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  void *v4;
  CNContactStore *v5;
  CNContactStore *v6;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getContactStore");
    v5 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipientWithContactProperty:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController composeRecipientView:composeRecipientForContact:](self, "composeRecipientView:composeRecipientForContact:", v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", v6);
  -[CKRecipientSelectionController _dismissPeoplePicker](self, "_dismissPeoplePicker");

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController composeRecipientView:composeRecipientForContact:](self, "composeRecipientView:composeRecipientForContact:", v6, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", v7);
  -[CKRecipientSelectionController _dismissPeoplePicker](self, "_dismissPeoplePicker");

}

- (void)_dismissPeoplePicker
{
  void *v3;
  CNContactPickerViewController *contactPickerViewController;
  _QWORD v5[5];

  if (self->_contactPickerViewController)
  {
    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__CKRecipientSelectionController__dismissPeoplePicker__block_invoke;
    v5[3] = &unk_1E274A208;
    v5[4] = self;
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);

    -[CKRecipientSelectionController setPeoplePickerHidden:](self, "setPeoplePickerHidden:", 1);
    contactPickerViewController = self->_contactPickerViewController;
    self->_contactPickerViewController = 0;

  }
}

void __54__CKRecipientSelectionController__dismissPeoplePicker__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadInputViews");

  objc_msgSend(*(id *)(a1 + 32), "toField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)setGameCenterPickerBlock:(id)a3
{
  void *v4;
  id gameCenterPickerBlock;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double MaxX;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  CGRect v50;

  v4 = _Block_copy(a3);
  gameCenterPickerBlock = self->_gameCenterPickerBlock;
  self->_gameCenterPickerBlock = v4;

  if (!self->_toFieldPlaceholderLabel)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CKRecipientSelectionController toField](self, "toField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "labelView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v9, v11, v13, v17);
    -[CKRecipientSelectionController setToFieldPlaceholderLabel:](self, "setToFieldPlaceholderLabel:", v18);

    -[CKRecipientSelectionController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
    v20 = v19;
    -[CKRecipientSelectionController toField](self, "toField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "titleLabelBaselineAlignmentRectForLabel:", self->_toFieldPlaceholderLabel);
    v23 = v22;
    v25 = v24;
    v48 = v26;

    -[CKRecipientSelectionController toField](self, "toField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    -[CKRecipientSelectionController toField](self, "toField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safeAreaInsets");
    v39 = v20 + v38;

    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v50.origin.x = v30;
      v50.origin.y = v32;
      v50.size.width = v34;
      v50.size.height = v36;
      MaxX = CGRectGetMaxX(v50);
      v41 = v39 + *(double *)&v48 - MaxX;
    }
    else
    {
      MaxX = v23 + v39;
      v41 = v30 - (v23 + v39);
    }
    -[UILabel setFrame:](self->_toFieldPlaceholderLabel, "setFrame:", MaxX, v25, v41, v17);
    -[UILabel setAutoresizingMask:](self->_toFieldPlaceholderLabel, "setAutoresizingMask:", 18);
    -[CKRecipientSelectionController toField](self, "toField");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "textView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_toFieldPlaceholderLabel, "setFont:", v44);

    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_toFieldPlaceholderLabel, "setTextColor:", v45);

    CKFrameworkBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("GAME_CENTER_TO_FIELD_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_toFieldPlaceholderLabel, "setText:", v47);

    -[UILabel setUserInteractionEnabled:](self->_toFieldPlaceholderLabel, "setUserInteractionEnabled:", 0);
    -[CKRecipientSelectionController toField](self, "toField");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", self->_toFieldPlaceholderLabel);

  }
}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13);
          -[CKRecipientSelectionController toField](self, "toField");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKRecipientSelectionController composeRecipientView:composeRecipientForAddress:](self, "composeRecipientView:composeRecipientForAddress:", v15, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v16);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v11);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21);
          v23 = objc_alloc(MEMORY[0x1E0D13690]);
          v24 = (void *)objc_msgSend(v23, "initWithContact:address:kind:", 0, v22, 5, (_QWORD)v28);
          objc_msgSend(v8, "addObject:", v24);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    -[CKRecipientSelectionController addRecipients:](self, "addRecipients:", v8);
    -[CKRecipientSelectionController _canonicalRecipientAddresses](self, "_canonicalRecipientAddresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v25, 0);

  }
  -[CKRecipientSelectionController _dismissPeoplePicker](self, "_dismissPeoplePicker", (_QWORD)v28);
  -[CKRecipientSelectionController toField](self, "toField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inputAccessoryView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", 0);

}

- (BOOL)isGameCenterRecipient:(id)a3
{
  return self->_gameCenterPickerBlock && objc_msgSend(a3, "kind") == 5;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[CKRecipientSelectionController setSearchResultsHidden:](self, "setSearchResultsHidden:", 1);
  -[CKRecipientSelectionController setPeoplePickerHidden:](self, "setPeoplePickerHidden:", 1);
  -[CKRecipientSelectionController stopCheckingRecipientAvailabilityAndRemoveAllTimers](self, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");
  self->_didShowOneTimeErrorAlert = 0;
  -[CKRecipientSelectionController recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "copy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__CKRecipientSelectionController_reset__block_invoke;
  v11[3] = &unk_1E274B678;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSearchManager");

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnteredRecipients:", 0);

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSuppressGroupSuggestions:", 0);

}

uint64_t __39__CKRecipientSelectionController_reset__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecipient:", a2);
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

- (void)setConversation:(id)a3
{
  id v5;
  CKPendingConversation **p_conversation;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_conversation = &self->_conversation;
  if ((-[CKPendingConversation isEqual:](*p_conversation, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)p_conversation, a3);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isKeyTransparencyEnabled");

    if (v8)
    {
      objc_msgSend(v5, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fetchKTStatus");

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Adopting pending conversation %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)addRecipients:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "address");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (v11 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v9;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "-[CKRecipientSelectionController addRecipient] adding recipient %@ with nil address, this will set atom to pending state...", buf, 0xCu);
            }

          }
          -[CKRecipientSelectionController toField](self, "toField");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addRecipient:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v6);
    }

    v4 = v14;
  }

}

- (BOOL)isSearchResultsHidden
{
  void *v3;
  void *v4;
  char v5;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearchResultsHidden");

  return v5;
}

- (void)setEditable:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_editable != a3)
  {
    self->_editable = a3;
    -[CKRecipientSelectionController toField](self, "toField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditable:", self->_editable);

    -[CKRecipientSelectionController toField](self, "toField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", self->_editable);

    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", self->_editable);

    -[CKRecipientSelectionController _updateToField](self, "_updateToField");
  }
}

- (BOOL)toFieldIsFirstResponder
{
  void *v2;
  void *v3;
  char v4;

  -[CKRecipientSelectionController toField](self, "toField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  return v4;
}

- (void)setSearchResultsHidden:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  if (a3)
  {
    -[CKRecipientSelectionController _hideSearchField](self, "_hideSearchField");
  }
  else
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isFirstResponder"))
    {
      v5 = -[CKRecipientSelectionController isPeoplePickerHidden](self, "isPeoplePickerHidden");

      if (v5)
        -[CKRecipientSelectionController _showSearchField](self, "_showSearchField");
    }
    else
    {

    }
  }
}

- (void)invalidateOutstandingIDStatusRequests
{
  id v2;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateOutstandingIDStatusRequests");

}

- (BOOL)finishedComposingRecipients
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (!v5)
    return 1;
  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E276D870);
  else
    v8 = 1;

  return v8;
}

- (BOOL)hasFailediMessageRecipients
{
  void *v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (!-[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage"))
  {
    -[CKRecipientSelectionController recipients](self, "recipients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__CKRecipientSelectionController_hasFailediMessageRecipients__block_invoke;
    v6[3] = &unk_1E274B5E0;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__CKRecipientSelectionController_hasFailediMessageRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isGameCenterRecipient:") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "_availibilityForRecipient:onService:", v8, v7);

    if (!(_DWORD)v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (BOOL)hasUnreachableEmergencyRecipient
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char IsEmergencyPhoneNumber;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsSMS") & 1) != 0)
  {

LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  v4 = objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled");

  if (!v4)
    goto LABEL_13;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CKRecipientSelectionController recipients](self, "recipients", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "rawAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        IsEmergencyPhoneNumber = IMStringIsEmergencyPhoneNumber();

        if ((IsEmergencyPhoneNumber & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

- (BOOL)hasPendingiMessageRecipients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = !-[CKRecipientSelectionController finishedComposingRecipients](self, "finishedComposingRecipients");
  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isGroup");

  }
  else
  {
    v8 = 0;
  }

  if (!*((_BYTE *)v14 + 24)
    && ((-[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage") | v8) & 1) == 0)
  {
    -[CKRecipientSelectionController recipients](self, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__CKRecipientSelectionController_hasPendingiMessageRecipients__block_invoke;
    v12[3] = &unk_1E274B5E0;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __62__CKRecipientSelectionController_hasPendingiMessageRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isGameCenterRecipient:") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "_availibilityForRecipient:onService:", v8, v7);

    if ((_DWORD)v6 == -1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (void)stopCheckingRecipientAvailabilityAndRemoveAllTimers
{
  void *v3;
  void *v4;
  id v5;

  -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_283);

  -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

uint64_t __85__CKRecipientSelectionController_stopCheckingRecipientAvailabilityAndRemoveAllTimers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (double)collapsedHeight
{
  double v3;
  double v4;
  void *v5;
  int v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0D136B8], "preferredHeight");
  v4 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recipientSelectionCollapsedHeightIncludesNavigationBar");
  v7 = 0.0;
  if (v6)
    -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets", 0.0);
  v8 = v4 + v7;

  return v8;
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 newParticipants:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D39840];
  v10 = a3;
  objc_msgSend(v9, "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLazuliEnabled");

  -[CKRecipientSelectionController conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
    v14 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_newParticipants_withCompletionBlock___block_invoke;
    v20[3] = &unk_1E274B6C0;
    v15 = &v21;
    v20[4] = self;
    v21 = v8;
    v16 = v8;
    objc_msgSend(v13, "refreshComposeSendingServiceForAddresses:newParticipants:availabilities:withCompletionBlock:", v10, v5, v14, v20);

    v10 = (id)v14;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __111__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_newParticipants_withCompletionBlock___block_invoke_2;
    v18[3] = &unk_1E274B6E8;
    v15 = &v19;
    v18[4] = self;
    v19 = v8;
    v17 = v8;
    objc_msgSend(v13, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v10, v18);
  }

}

void __111__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_newParticipants_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "recipientAvailibilitiesDidUpdate");
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v11 + 16))(v11, v12, v10, a4, a6);

}

void __111__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_newParticipants_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "recipientAvailabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v9);

  objc_msgSend(*(id *)(a1 + 32), "recipientAvailibilitiesDidUpdate");
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v11 + 16))(v11, v12, v9, a4, a5);

}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:newParticipants:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:newParticipants:withCompletionBlock:", a3, 0, a4);
}

- (void)addRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat") & 1) != 0
      || (objc_msgSend(v4, "rawAddress"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          IMChatCanonicalIDSIDsForAddress(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = MEMORY[0x193FF3AEC](),
          v6,
          v5,
          !v7))
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRecipient:", v4);

      -[CKRecipientSelectionController _canonicalRecipientAddresses](self, "_canonicalRecipientAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__CKRecipientSelectionController_addRecipient___block_invoke;
      v10[3] = &unk_1E274B710;
      v10[4] = self;
      v11 = v4;
      -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:newParticipants:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:newParticipants:withCompletionBlock:", v9, 1, v10);

    }
    else
    {
      -[CKRecipientSelectionController _presentBusinessChatNotSupportedError](self, "_presentBusinessChatNotSupportedError");
    }
  }

}

uint64_t __47__CKRecipientSelectionController_addRecipient___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  if (a5 == 1)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 32), "_showOneTimeErrorAlertForAddedRecipient:service:withError:", *(_QWORD *)(result + 40), a2);
    return objc_msgSend(*(id *)(v5 + 32), "_adjustToFieldPositionIfNecessary");
  }
  return result;
}

- (void)removeRecipient:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKRecipientSelectionController _removeAvailabilityTimeoutTimerForRecipient:](self, "_removeAvailabilityTimeoutTimerForRecipient:", v4);
  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRecipient:", v4);

  -[CKRecipientSelectionController _canonicalRecipientAddresses](self, "_canonicalRecipientAddresses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v6, 0);

}

- (id)_canonicalRecipientAddresses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKRecipientSelectionController recipients](self, "recipients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isGroup"))
        {
          objc_msgSend(v9, "children");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v9))
          {
            v11 = 0;
            goto LABEL_12;
          }
          v18 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
LABEL_12:
        objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_287_0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  return v3;
}

uint64_t __62__CKRecipientSelectionController__canonicalRecipientAddresses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

- (void)_updateToField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  _QWORD v40[5];

  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController _toFieldCollapsedTextColor](self, "_toFieldCollapsedTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInactiveTextColor:", v4);

  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "canInsertMoreRecipients"));

  -[CKRecipientSelectionController toField](self, "toField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateAtomPresentationOptions");

  -[CKRecipientSelectionController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isBusinessConversation"))
  {

  }
  else
  {
    -[CKRecipientSelectionController conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isStewieConversation");

    if (!v11)
      goto LABEL_5;
  }
  -[CKRecipientSelectionController toField](self, "toField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[CKRecipientSelectionController toField](self, "toField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEditable:", 0);

LABEL_5:
  -[CKRecipientSelectionController _refreshActionSheet](self, "_refreshActionSheet");
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController recipients](self, "recipients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnteredRecipients:", v18);

  }
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;

  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "toFieldXOffset");
    v21 = v27;

    v28 = 0.0;
  }
  else
  {
    -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets");
    v28 = v29;
  }
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v21, v28, v23, v25);

  -[CKRecipientSelectionController toField](self, "toField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController composeRecipientViewOriginY](self, "composeRecipientViewOriginY");
    v35 = v38;
  }
  -[CKRecipientSelectionController toField](self, "toField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v33, v35, v23, v37);

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __48__CKRecipientSelectionController__updateToField__block_invoke;
  v40[3] = &unk_1E274A208;
  v40[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v40);
  -[CKRecipientSelectionController _adjustToFieldSeparatorInsetsIfNecessary](self, "_adjustToFieldSeparatorInsetsIfNecessary");
}

uint64_t __48__CKRecipientSelectionController__updateToField__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustToFieldPositionIfNecessary");
}

- (void)_updateToFieldRecipientsData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearText");

  -[CKRecipientSelectionController recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[CKRecipientSelectionController removeRecipient:](self, "removeRecipient:", v11, (_QWORD)v15);
        +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "normalizedAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recipientWithAddress:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKRecipientSelectionController addRecipient:](self, "addRecipient:", v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[CKRecipientSelectionController _updateToField](self, "_updateToField");
}

- (void)_updateYOriginSearchListController
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  -[CKRecipientSelectionController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKRecipientSelectionController separator](self, "separator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v7 = v22;

    -[CKRecipientSelectionController toField](self, "toField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v16 = v24;

  }
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v5, v7, v9, v11);

  -[CKRecipientSelectionController separator](self, "separator");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v14, v16, v18, v20);

}

- (id)_serviceForRecipientPresentationOptions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CKRecipientSelectionController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
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
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  int v25;
  int v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  NSObject *v62;
  int v64;
  void *v65;
  _QWORD v66[6];
  _QWORD v67[6];
  uint8_t buf[4];
  unint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    {
      -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allowedByContactsHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "normalizedAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && !objc_msgSend(v10, "BOOLValue"))
        {

          v28 = 0x2000;
          goto LABEL_80;
        }

      }
    }
    -[CKRecipientSelectionController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendingService");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecipientSelectionController _serviceForRecipientPresentationOptions](self, "_serviceForRecipientPresentationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[CKRecipientSelectionController _availibilityForRecipient:onService:](self, "_availibilityForRecipient:onService:", v4, v12);

    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CKRecipientSelectionController _availibilityForRecipient:onService:](self, "_availibilityForRecipient:onService:", v4, v13);

    objc_msgSend(v4, "rawAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_stripFZIDPrefix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x193FF3B1C]();

    -[CKRecipientSelectionController toField](self, "toField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recipients");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count") == 1)
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recipients");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isGroup");

      if ((v24 & 1) != 0)
      {
        v25 = 1;
        v26 = 1;
        goto LABEL_17;
      }
    }
    else
    {

    }
    -[CKRecipientSelectionController delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v29, "recipientSelectionIsGroup:", self);

    v26 = 0;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isSatelliteConnectionActive");

    if ((v25 & v31 & 1) != 0)
    {
      v32 = 0x10000;
LABEL_72:
      if (-[CKRecipientSelectionController shouldShowVerifiedIconForRecipient:](self, "shouldShowVerifiedIconForRecipient:", v4))
      {
        v28 = v32 | 0x100000;
      }
      else
      {
        v28 = v32;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v69 = v28;
          _os_log_impl(&dword_18DFCD000, v62, OS_LOG_TYPE_INFO, "atomPresentationOptionsForRecipient returning %lu", buf, 0xCu);
        }

      }
      goto LABEL_80;
    }
    if (-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v4))
    {
      v32 = 8;
      goto LABEL_72;
    }
    if (objc_msgSend(v65, "__ck_isRCS"))
    {
      -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "IDSCanonicalAddress");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "hasResultsForRecipient:", v34);

      if (v35)
      {
        buf[0] = 0;
        -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "IDSCanonicalAddress");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "reachabilityForRecipient:service:isFinal:", v37, v38, buf);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "IDSCanonicalAddress");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "reachabilityForRecipient:service:", v41, *MEMORY[0x1E0D38F58]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64 != -1)
          -[CKRecipientSelectionController _removeAvailabilityTimeoutTimerForRecipient:](self, "_removeAvailabilityTimeoutTimerForRecipient:", v4);
        if (v39 && ((v43 = objc_msgSend(v39, "isReachable"), buf[0]) ? (v44 = 1) : (v44 = v43), v44 == 1))
        {
          if ((objc_msgSend(v39, "isReachable") & 1) != 0)
          {
            v32 = 2;
          }
          else if (objc_msgSend(v42, "isReachable"))
          {
            v32 = 2;
          }
          else
          {
            v32 = 1;
          }
        }
        else
        {
          v32 = 6;
        }

        goto LABEL_72;
      }
    }
    if (self->_forceMMS)
    {
      v32 = 2;
      goto LABEL_72;
    }
    if ((v26 | -[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage")) == 1)
    {
      if ((objc_msgSend(v65, "__ck_isCarrierBased") & (v14 != 1)) != 0)
        v45 = 2;
      else
        v45 = 0;
      v46 = objc_msgSend(v65, "__ck_isCarrierBased") ^ 1 | v18;
      if (v25)
        v47 = 1;
      else
        v47 = v45;
      if (v46)
        v32 = v45;
      else
        v32 = v47;
      goto LABEL_72;
    }
    v48 = v64;
    if (v64 != -1)
    {
      -[CKRecipientSelectionController _removeAvailabilityTimeoutTimerForRecipient:](self, "_removeAvailabilityTimeoutTimerForRecipient:", v4);
      v48 = v64;
    }
    if (v14 == 1)
    {
      if ((v18 & 1) == 0)
      {
        v49 = 0;
        v32 = objc_msgSend(v65, "__ck_isCarrierBased");
        goto LABEL_67;
      }
      goto LABEL_57;
    }
    if (v48 == -1)
    {
      -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", v4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        v52 = objc_msgSend(v51, "isValid");
        v49 = v52 ^ 1;
        if (v52)
          v32 = 4;
        else
          v32 = 1;
      }
      else
      {
        -[CKRecipientSelectionController _startAvailabilityTimeoutTimerForRecipient:](self, "_startAvailabilityTimeoutTimerForRecipient:", v4);
        v49 = 0;
        v32 = 4;
      }

    }
    else
    {
      if ((_BYTE)v48)
      {
LABEL_57:
        v49 = 0;
        v32 = 0;
        goto LABEL_67;
      }
      v49 = 1;
      if (v18)
        v32 = 2;
      else
        v32 = 1;
    }
LABEL_67:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v49 & objc_msgSend(v53, "shouldAutomaticallyCheckAvailabilityOfAlternateAddresses");

    if (v54 == 1)
    {
      -[CKRecipientSelectionController _alternateAddressesForRecipient:](self, "_alternateAddressesForRecipient:", v4);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "__imArrayByApplyingBlock:", &__block_literal_global_290_0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isLazuliEnabled");

      -[CKRecipientSelectionController conversation](self, "conversation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_2;
        v67[3] = &unk_1E274B778;
        v61 = v67;
        v67[4] = self;
        v67[5] = v4;
        objc_msgSend(v59, "refreshStatusForAddresses:availabilities:withCompletionBlock:", v56, v60, v67);

      }
      else
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_3;
        v66[3] = &unk_1E274B710;
        v61 = v66;
        v66[4] = self;
        v66[5] = v4;
        objc_msgSend(v59, "refreshStatusForAddresses:withCompletionBlock:", v56, v66);
      }

    }
    goto LABEL_72;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = (unint64_t)v4;
      _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Recipient (%@) address is nil. Set atom state to pending...", buf, 0xCu);
    }

  }
  v28 = 4;
LABEL_80:

  return v28;
}

uint64_t __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke()
{
  return IMChatCanonicalIDSIDsForAddress();
}

void __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v9;
  id v10;

  v10 = a2;
  v9 = a3;
  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "_removeAvailabilityTimeoutTimerForRecipient:", *(_QWORD *)(a1 + 40));
  if (a5)
    objc_msgSend(*(id *)(a1 + 32), "_updateToField");

}

void __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "recipientAvailabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "copy");

  objc_msgSend(*(id *)(a1 + 32), "recipientAvailabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v7);

  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "_removeAvailabilityTimeoutTimerForRecipient:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "recipientAvailabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "isEqualToDictionary:", v10);

  if ((v11 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateToField");

}

- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[CKRecipientSelectionController conversation](self, "conversation");
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
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Status changed for handles: %@", buf, 0xCu);
      }

    }
    -[CKRecipientSelectionController recipients](self, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContactKeyVerificationRecipientsHelper recipientsToUpdateForUpdatedCKVHandles:recipients:inConversation:](CKContactKeyVerificationRecipientsHelper, "recipientsToUpdateForUpdatedCKVHandles:recipients:inConversation:", v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
          -[CKRecipientSelectionController toField](self, "toField", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "invalidateAtomPresentationOptionsForRecipient:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
}

- (id)_toFieldCollapsedTextColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[CKRecipientSelectionController hasFailediMessageRecipients](self, "hasFailediMessageRecipients")
    || -[CKRecipientSelectionController hasTimedOutRecipients](self, "hasTimedOutRecipients"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[CKRecipientSelectionController recipients](self, "recipients", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v4)
      {

        v13 = 0;
        goto LABEL_27;
      }
      v5 = v4;
      v6 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v8, "IDSCanonicalAddress");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "_appearsToBeEmail");

          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[CKRecipientSelectionController _availibilityForRecipient:onService:](self, "_availibilityForRecipient:onService:", v8, v11);

            if (!v12)
            {
              v13 = 3;
              goto LABEL_18;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v5)
          continue;
        break;
      }
      v13 = 0;
      goto LABEL_18;
    }
    v13 = 3;
  }
  else
  {
    if (!-[CKRecipientSelectionController hasPendingiMessageRecipients](self, "hasPendingiMessageRecipients"))
    {
      -[CKRecipientSelectionController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isBusinessConversation");

      if ((v15 & 1) != 0)
      {
        v13 = 6;
        goto LABEL_27;
      }
      -[CKRecipientSelectionController conversation](self, "conversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isStewieConversation");

      if ((v17 & 1) != 0)
      {
        v13 = 12;
        goto LABEL_27;
      }
      -[CKRecipientSelectionController conversation](self, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v18, "recipientCount") <= 1)
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isSatelliteConnectionActive");

        if ((v20 & 1) != 0)
        {
          v13 = -1;
          goto LABEL_27;
        }
      }
      -[CKRecipientSelectionController conversation](self, "conversation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sendingService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v25, "__ck_displayColor");

LABEL_18:
      goto LABEL_27;
    }
    v13 = 1;
  }
LABEL_27:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "theme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recipientTextColorForColorType:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CKRecipientSelectionController addressBookNotificationUpdater](self, "addressBookNotificationUpdater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

  -[CKRecipientSelectionController toField](self, "toField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEditing");

  if ((v7 & 1) == 0)
  {
    -[CKRecipientSelectionController addressBookNotificationUpdater](self, "addressBookNotificationUpdater");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateIfNeeded");

  }
}

- (void)_handleAddressBookPartialChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D373F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D373D8]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D373E0]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D373E8]) & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CKRecipientSelectionController recipients](self, "recipients", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "normalizedAddress");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "isEqualToString:", v14);

          if (v15)
          {
            -[CKRecipientSelectionController _handleAddressBookChangedNotification:](self, "_handleAddressBookChangedNotification:", v4);
            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      -[CKRecipientSelectionController conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_11;
    }
    -[CKRecipientSelectionController conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "object");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "chat");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "chatIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKRecipientSelectionController conversation](self, "conversation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "chat");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "chatIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412546;
          v26 = v18;
          v27 = 2112;
          v28 = v21;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "notification.object %@ conversation.chat %@", (uint8_t *)&v25, 0x16u);

        }
      }
      -[CKRecipientSelectionController conversation](self, "conversation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "__imArrayByApplyingBlock:", &__block_literal_global_295_0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKRecipientSelectionController refreshComposeSendingServiceForAddresses:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:withCompletionBlock:", v24, 0);
    }
  }
LABEL_11:
  -[CKRecipientSelectionController _updateToField](self, "_updateToField");
  -[CKRecipientSelectionController conversationPreferredServiceDidChange](self, "conversationPreferredServiceDidChange");

}

id __91__CKRecipientSelectionController__handleConversationPreferredServiceDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (char)_availibilityForRecipient:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rawAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = IMOSLoggingEnabled();
  if (!v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "rawAddress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412546;
        v26 = v19;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "IMChatCanonicalIDSIDsForAddress returned nil idsAddress for %@ / %@", (uint8_t *)&v25, 0x16u);

      }
    }
LABEL_19:
    v21 = -1;
    goto LABEL_20;
  }
  if (v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "rawAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v12;
      v27 = 2112;
      v28 = v6;
      v29 = 2048;
      v30 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "IDSIDStatus for %@ / %@ returned %ld", (uint8_t *)&v25, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isLazuliEnabled");

  if (v14)
  {
    -[CKRecipientSelectionController expandedRecipientAvailabilities](self, "expandedRecipientAvailabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internalName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "idStatusForRecipient:service:", v9, v16);
  }
  else
  {
    -[CKRecipientSelectionController recipientAvailabilities](self, "recipientAvailabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
  }
  v20 = v17;

  if (v20 == 2)
    goto LABEL_17;
  if (v20 != 1)
    goto LABEL_19;
  if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat") & 1) == 0 && (MEMORY[0x193FF3AEC](v9) & 1) != 0)
  {
LABEL_17:
    v21 = 0;
    goto LABEL_20;
  }
  v21 = 1;
LABEL_20:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "rawAddress");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v23;
      v27 = 2112;
      v28 = v6;
      v29 = 2048;
      v30 = v21;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "availibilityForRecipient %@ / %@ returned as %ld", (uint8_t *)&v25, 0x20u);

    }
  }

  return v21;
}

- (void)_startAvailabilityTimeoutTimerForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    -[CKRecipientSelectionController setRecipientAvailibityTimers:](self, "setRecipientAvailibityTimers:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("recipient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleRecipientAvailabilityTimeout_, v7, 0, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v8, *MEMORY[0x1E0C99748]);

  -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, v4);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Started availability timer for %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (void)_removeAvailabilityTimeoutTimerForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isValid");
      v10 = CFSTR("NO");
      if (v9)
        v10 = CFSTR("YES");
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Cancelling availability timer for %@ (was valid: %@)", (uint8_t *)&v13, 0x16u);

    }
  }
  if (v6)
  {
    -[CKRecipientSelectionController recipientAvailibityTimers](self, "recipientAvailibityTimers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v4);

    objc_msgSend(v6, "invalidate");
  }
  -[CKRecipientSelectionController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recipientSelectionController:didFinishAvailaiblityLookupForRecipient:", self, v4);

}

- (void)_handleRecipientAvailabilityTimeout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("recipient"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Timeout of availability timer for %@", buf, 0xCu);

    }
  }
  if (CKShowInternalErrors())
  {
    objc_msgSend(v6, "rawAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("RECIPIENT_AVAILABILITY_TIMEOUT_ERROR_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v14, "userInterfaceLayoutDirection") == 1;

    if ((_DWORD)v12)
      v15 = CFSTR("\u200F");
    else
      v15 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0CB2D50]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileSMS.CKRecipientAvailabilityTimeout"), 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CKShowError(v18, self);

  }
  objc_msgSend(v4, "invalidate");
  -[CKRecipientSelectionController _updateToField](self, "_updateToField");

}

- (BOOL)hasTimedOutRecipients
{
  void *v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (!-[CKRecipientSelectionController homogenizePreferredServiceForiMessage](self, "homogenizePreferredServiceForiMessage"))
  {
    -[CKRecipientSelectionController recipients](self, "recipients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__CKRecipientSelectionController_hasTimedOutRecipients__block_invoke;
    v6[3] = &unk_1E274B5E0;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__CKRecipientSelectionController_hasTimedOutRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "recipientAvailibityTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v11)
  {
    v10 = objc_msgSend(v11, "isValid");
    v9 = v11;
    if ((v10 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (id)_recipientCausingTooManyRecipientsError
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[CKRecipientSelectionController recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CKRecipientSelectionController__recipientCausingTooManyRecipientsError__block_invoke;
  v6[3] = &unk_1E274B5E0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__CKRecipientSelectionController__recipientCausingTooManyRecipientsError__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_availibilityForRecipient:onService:", v9, v8);

  if (!(_DWORD)v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_showOneTimeErrorAlertForAddedRecipient:(id)a3 service:(id)a4 withError:(char)a5
{
  int v5;
  id v8;
  id v9;
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
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5 == 1 && !self->_didShowOneTimeErrorAlert)
  {
    if (objc_msgSend(v9, "__ck_isiMessage"))
    {
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ADDRESS_LIST_FULL"), &stru_1E276D870, CFSTR("ChatKit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation lastAddressedHandle](self->_conversation, "lastAddressedHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation lastAddressedSIMID](self->_conversation, "lastAddressedSIMID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "__ck_maxRecipientCountForHandle:simID:", v14, v15);

      v17 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringFromNumber:numberStyle:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ERR_TOO_MANY_RECIPIENTS_FOR_IMESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v22, v19);
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
    }
    else
    {
      if (-[CKRecipientSelectionController _availibilityForRecipient:onService:](self, "_availibilityForRecipient:onService:", v8, v10))
      {
        -[CKRecipientSelectionController _recipientCausingTooManyRecipientsError](self, "_recipientCausingTooManyRecipientsError");
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = v8;
      }
      v23 = v28;
      objc_msgSend(v28, "compositeName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation lastAddressedHandle](self->_conversation, "lastAddressedHandle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversation lastAddressedSIMID](self->_conversation, "lastAddressedSIMID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v10, "__ck_maxRecipientCountForHandle:simID:", v30, v31);

      v33 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringFromNumber:numberStyle:", v34, 1);
      v35 = objc_claimAutoreleasedReturnValue();

      v54 = v29;
      if (v29 && (objc_msgSend(v29, "isEqualToString:", &stru_1E276D870) & 1) == 0)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CANNOT_ADD_RECIPIENT_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", v39, v29);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "userInterfaceLayoutDirection");

        if (v41 == 1)
          v42 = CFSTR("\u200F");
        else
          v42 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", v36);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CKFrameworkBundle();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CANNOT_ADD_RECIPIENT"), &stru_1E276D870, CFSTR("ChatKit"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v43 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("ERR_ALL_RECIPIENTS_NEED_IMESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", v45, v35);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)v35;
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "userInterfaceLayoutDirection");

      if (v48 == 1)
        v49 = CFSTR("\u200F");
      else
        v49 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v49, "stringByAppendingString:", v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    CKFrameworkBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0;
    objc_initWeak(&location, self);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __92__CKRecipientSelectionController__showOneTimeErrorAlertForAddedRecipient_service_withError___block_invoke;
    v55[3] = &unk_1E274B7A0;
    objc_copyWeak(&v56, &location);
    CKCreateAlertControllerWithError(0, v12, v27, v51, v55);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
      objc_msgSend(v52, "presentFromViewController:animated:completion:", self, 1, 0);
    self->_didShowOneTimeErrorAlert = 1;

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);

  }
}

void __92__CKRecipientSelectionController__showOneTimeErrorAlertForAddedRecipient_service_withError___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toField");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_presentBusinessChatNotSupportedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANNOT_USE_MESSAGES_FOR_BUSINESS"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BUSINESS_CHAT_IS_CURRENTLY_NOT_SUPPORTED"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v9);
  objc_msgSend(v10, "setPreferredAction:", v9);
  objc_msgSend(v10, "presentFromViewController:animated:completion:", self, 1, 0);

}

- (void)_refreshActionSheet
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "shouldRefreshAlternateAddressesSheet"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldAutomaticallyCheckAvailabilityOfAlternateAddresses");

    if (!v4)
      return;
    -[CKRecipientSelectionController toField](self, "toField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController toField](self, "toField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "selectedRange");
    objc_msgSend(v5, "atomViewsInRange:", v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recipient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "recipient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKRecipientSelectionController _showActionSheetForRecipient:animated:](self, "_showActionSheetForRecipient:animated:", v12, 0);

      }
    }
  }

}

- (void)presentAlternateAddressesAlertForRecipient:(id)a3
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
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  CKRecipientSelectionController *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  CKRecipientSelectionController *v42;
  id v43;

  v4 = a3;
  -[CKRecipientSelectionController _alternateiMessagableAddressesForRecipient:](self, "_alternateiMessagableAddressesForRecipient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEmail") & 1) != 0)
    objc_msgSend(v4, "uncommentedAddress");
  else
    objc_msgSend(v4, "commentedAddress");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADDRESS_NOT_REGISTERED_WITH_MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v32, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

  if (v13 == 1)
    v14 = CFSTR("\u200F");
  else
    v14 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v33, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toField](self, "toField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "atomViewForRecipient:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke;
  v39[3] = &unk_1E274B7F0;
  v40 = v15;
  v41 = v5;
  v42 = self;
  v20 = v4;
  v43 = v20;
  v31 = v5;
  v21 = v15;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v39);

  CKFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1E276D870, CFSTR("ChatKit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v19;
  v37[1] = 3221225472;
  v37[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_3;
  v37[3] = &unk_1E274B818;
  v37[4] = self;
  v38 = v20;
  v24 = v20;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v23, 2, v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v25);

  CKFrameworkBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_4;
  v34[3] = &unk_1E274B818;
  v35 = v17;
  v36 = self;
  v28 = v17;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v27, 1, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v29);

  objc_msgSend(v21, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSourceView:", v28);

  objc_msgSend(v21, "presentFromViewController:animated:completion:", self, 1, 0);
  objc_msgSend(v28, "setSelected:animated:", 1, 1);
  -[CKRecipientSelectionController setAlternateAddressesAlertController:](self, "setAlternateAddressesAlertController:", v21);

}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("USE_ALTERNATE_MADRID_ADDRESS"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  if (v9 == 1)
    v10 = CFSTR("\u200F");
  else
    v10 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_2;
  v16[3] = &unk_1E274B7C8;
  v12 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = v3;
  v13 = *(void **)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = v13;
  v14 = v3;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v11, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "removeRecipient:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "addRecipient:", v2);

}

uint64_t __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecipient:", *(_QWORD *)(a1 + 40));
}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setSelected:animated:", 0, 1);
  objc_msgSend(*(id *)(a1 + 40), "toField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_showActionSheetForRecipient:(id)a3 animated:(BOOL)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKRecipientSelectionController _availibilityForRecipient:onService:](self, "_availibilityForRecipient:onService:", v10, v5);

  if (!v6 && !CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendingService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "__ck_isiMessage");

    if (v9)
      -[CKRecipientSelectionController presentAlternateAddressesAlertForRecipient:](self, "presentAlternateAddressesAlertForRecipient:", v10);
  }

}

- (id)_alternateAddressesForRecipient:(id)a3
{
  id v3;
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "contact", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emailAddresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v4;
}

- (id)_alternateiMessagableAddressesForRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  -[CKRecipientSelectionController _alternateAddressesForRecipient:](self, "_alternateAddressesForRecipient:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__CKRecipientSelectionController__alternateiMessagableAddressesForRecipient___block_invoke;
  v12[3] = &unk_1E274B840;
  v12[4] = self;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __77__CKRecipientSelectionController__alternateiMessagableAddressesForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientWithAddress:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEmail") & 1) != 0)
    objc_msgSend(v6, "uncommentedAddress");
  else
    objc_msgSend(v6, "commentedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_availibilityForRecipient:onService:", v6, *(_QWORD *)(a1 + 40)) == 1)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, v5);

}

- (void)_showDetailsForGroup:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D13630];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setGroup:", v5);

  objc_msgSend(v7, "setDelegate:", self);
  -[CKRecipientSelectionController setPreventAtomization:](self, "setPreventAtomization:", 1);
  -[CKRecipientSelectionController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void)_showDetailsForRecipient:(id)a3 canDelete:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CKChatBotInfoController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CKEntity *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  CKEntity *v34;
  id v35;
  id *v36;
  char v37;
  id location;
  id *p_location;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[2];

  v4 = a4;
  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "rawAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    IMStripFormattingFromAddress();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "__ck_bestAccountForAddress:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imHandleWithID:alreadyCanonical:", v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "isChatBot"))
    {
      v13 = -[CKChatBotInfoController initWithHandle:fallbackHandle:]([CKChatBotInfoController alloc], "initWithHandle:fallbackHandle:", v14, v9);
LABEL_16:
      v7 = 0;
      goto LABEL_17;
    }
    v18 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v14);
    objc_msgSend(v6, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMStripFormattingFromAddress();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    p_location = &location;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4;
    v42 = __Block_byref_object_dispose__4;
    v43 = 0;
    v37 = 0;
    -[CKEntity personViewControllerWithDelegate:isUnknown:](v18, "personViewControllerWithDelegate:isUnknown:", self, &v37);
    v13 = (CKChatBotInfoController *)(id)objc_claimAutoreleasedReturnValue();
    -[CKChatBotInfoController setAllowsActions:](v13, "setAllowsActions:", 0);
    if (v4 && objc_msgSend(v6, "isRemovableFromSearchResults"))
    {
      -[CKRecipientSelectionController setRecentContactForPresentedCNCard:](self, "setRecentContactForPresentedCNCard:", v6);
      if (!v37)
      {
LABEL_13:
        if (p_location[5])
        {
          -[CKEntity propertyType](v18, "propertyType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKChatBotInfoController highlightPropertyWithKey:identifier:](v13, "highlightPropertyWithKey:identifier:", v25, p_location[5]);

        }
        _Block_object_dispose(&location, 8);

        goto LABEL_16;
      }
      -[CKChatBotInfoController contentViewController](v13, "contentViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT"), &stru_1E276D870, CFSTR("ChatKit"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cardBottomGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addActionWithTitle:target:selector:inGroup:destructive:", v31, self, sel__removeRecent, v23, 1);

    }
    else
    {
      -[CKEntity propertyType](v18, "propertyType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForKey:", v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __69__CKRecipientSelectionController__showDetailsForRecipient_canDelete___block_invoke;
      v33[3] = &unk_1E274B868;
      v34 = v18;
      v35 = v32;
      v36 = &location;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v33);

      v22 = v34;
    }

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "areKeysAvailable:", v9) & 1) == 0)
  {
    -[CKRecipientSelectionController contactStore](self, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v11, v9, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v7);
  v13 = (CKChatBotInfoController *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatBotInfoController setContactStore:](v13, "setContactStore:", v14);
LABEL_17:

  -[CKRecipientSelectionController setPreventAtomization:](self, "setPreventAtomization:", 1);
  if (CKIsRunningInMacCatalyst())
  {
    location = 0;
    v26 = objc_initWeak(&location, self);
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tableView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecipientSelectionController _showContactCardForRecipient:sourceView:](self, "_showContactCardForRecipient:sourceView:", v6, v28);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CKRecipientSelectionController navigationController](self, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      -[CKRecipientSelectionController navigationController](self, "navigationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pushViewController:animated:", v13, 1);

    }
  }

}

void __69__CKRecipientSelectionController__showDetailsForRecipient_canDelete___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "propertyType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C967C0]);
  objc_msgSend(v15, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "stringValue");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  IMStripFormattingFromAddress();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v15, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }

}

- (void)_showContactCardForRecipient:(id)a3 sourceView:(id)a4
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

    v11 = (void *)*MEMORY[0x1E0CEB258];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:withCompletionHandler:", v12, 0);

  }
}

- (void)_removeRecent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CKRecipientSelectionController recentContactForPresentedCNCard](self, "recentContactForPresentedCNCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController recentContactForPresentedCNCard](self, "recentContactForPresentedCNCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeRecipient:", v5);

  }
  -[CKRecipientSelectionController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)_updateRecipientViewLayouts
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  id WeakRetained;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  _QWORD v35[9];
  BOOL v36;

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CKRecipientSelectionController toFieldScrollingView](self, "toFieldScrollingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[CKRecipientSelectionController toField](self, "toField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isFirstResponder") & 1) != 0)
    v18 = 1;
  else
    v18 = !-[CKRecipientSelectionController isSearchResultsHidden](self, "isSearchResultsHidden");

  if (CKIsRunningInMacCatalyst())
  {
    -[CKRecipientSelectionController preferredMacToolbarHeight](self, "preferredMacToolbarHeight");
    v20 = v19;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "toFieldPreferredHeight");
    v23 = v22;

    v20 = v5;
    if (v18)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:", self);
      v26 = v25;

      -[CKRecipientSelectionController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v28;
      -[CKRecipientSelectionController composeRecipientViewOriginY](self, "composeRecipientViewOriginY");
      v31 = v29 - v30 - v26;

      if (v5 >= v31)
        v32 = v31;
      else
        v32 = v5;
      if (v32 >= v23)
        v20 = v32;
      else
        v20 = v23;
    }
  }
  v33 = CKIsRunningInMacCatalyst() == 0;
  v34 = 0.0;
  if (v33)
    v34 = v10;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61__CKRecipientSelectionController__updateRecipientViewLayouts__block_invoke;
  v35[3] = &unk_1E274B890;
  v36 = v5 != v15;
  v35[4] = self;
  v35[5] = v8;
  *(double *)&v35[6] = v34;
  v35[7] = v12;
  *(double *)&v35[8] = v20;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v35, 0.200000003);
}

uint64_t __61__CKRecipientSelectionController__updateRecipientViewLayouts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t result;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "toFieldContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "toFieldScrollingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "toFieldContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "toFieldScrollingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__ck_scrollToBottom:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "searchListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "__ck_isScrolledToTop");

  result = objc_msgSend(*(id *)(a1 + 32), "_resetSearchResultsInsets");
  if (v8)
    return objc_msgSend(*(id *)(a1 + 32), "scrollSearchListControllerToTop:", 1);
  return result;
}

- (void)_adjustToFieldPositionIfNecessary
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  void *v34;
  BOOL v35;
  void *v36;
  _QWORD aBlock[9];
  CGRect v38;
  CGRect v39;

  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "recipientSelectionShouldSlideToField");

  if (!v13)
    goto LABEL_14;
  -[CKRecipientSelectionController toField](self, "toField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
    goto LABEL_8;
  -[CKRecipientSelectionController toField](self, "toField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "numberOfRowsOfTextInField") <= 1)
  {

LABEL_8:
LABEL_9:
    -[CKRecipientSelectionController toField](self, "toField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "numberOfRowsOfTextInField");

      if (v32 != 1)
        goto LABEL_14;
    }
    else
    {

    }
    -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets");
    v7 = v33;
    goto LABEL_14;
  }
  -[CKRecipientSelectionController conversation](self, "conversation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "canInsertMoreRecipients");

  if (!v18)
    goto LABEL_9;
  -[CKRecipientSelectionController toField](self, "toField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "offsetForRowWithTextField");
  v21 = v20;

  -[CKRecipientSelectionController toField](self, "toField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;

  if (v21 != 0.0)
  {
    -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets");
    v7 = v28 - (v21 - (v24 - v27) + 2.0);
  }
LABEL_14:
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  v35 = CGRectEqualToRect(v38, v39);

  if (!v35)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__CKRecipientSelectionController__adjustToFieldPositionIfNecessary__block_invoke;
    aBlock[3] = &unk_1E274B8B8;
    aBlock[4] = self;
    *(CGFloat *)&aBlock[5] = v5;
    *(double *)&aBlock[6] = v7;
    *(CGFloat *)&aBlock[7] = v9;
    *(CGFloat *)&aBlock[8] = v11;
    v36 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v36, 0.200000003);

  }
}

void __67__CKRecipientSelectionController__adjustToFieldPositionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "toFieldContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 32), "_resetSearchResultsInsets");
  objc_msgSend(*(id *)(a1 + 32), "scrollSearchListControllerToTop:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipientSelectionControllerDidChangeSize:", *(_QWORD *)(a1 + 32));

}

- (void)_adjustToFieldSeparatorInsetsIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "separatorDirectionalEdgeInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    -[CKRecipientSelectionController toField](self, "toField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_textButtonMargin");
    v12 = v11;
    -[CKRecipientSelectionController toField](self, "toField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v12 + v14;

    if (v15 != 0.0)
    {
      -[CKRecipientSelectionController toField](self, "toField");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSeparatorDirectionalEdgeInsets:", v5, v15, v7, v9);

    }
  }
}

- (BOOL)_isToFieldPushedUp
{
  CKRecipientSelectionController *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = self;
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v5 = v4;
  -[CKRecipientSelectionController _navigationBarInsets](v2, "_navigationBarInsets");
  LOBYTE(v2) = v5 < v6;

  return (char)v2;
}

- (void)_resetSearchResultsInsets
{
  void *v3;
  double v4;
  double v5;
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
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  if (!CKIsRunningInMacCatalyst())
  {
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[CKRecipientSelectionController _navigationBarInsets](self, "_navigationBarInsets");
    v15 = v14;
    -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "origin");
    v18 = v15 - v17;

    -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20 - v18;

    -[CKRecipientSelectionController _additionalSearchResultsEdgeInsets](self, "_additionalSearchResultsEdgeInsets");
    v5 = v21 + v22;
    v8 = v11 + v23;
    v9 = v12 + v24;
    v10 = v13 + v25;
    goto LABEL_5;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPadding");
  v5 = v4;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  objc_msgSend(v7, "_setSectionContentInset:", 0.0, v5, 0.0, v5);

  v9 = v5;
  v10 = 0.0;
  if (!-[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView"))
  {
LABEL_5:
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAdditionalSafeAreaInsets:", v5, v8, v9, v10);

  }
}

- (void)_updateShowingSearch
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;

  -[CKRecipientSelectionController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canInsertMoreRecipients");

  if (v4)
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSearchResults"))
      v6 = -[CKRecipientSelectionController shouldSuppressSearchResultsTable](self, "shouldSuppressSearchResultsTable");
    else
      v6 = 1;

  }
  else
  {
    v6 = 1;
  }
  -[CKRecipientSelectionController setSearchResultsHidden:](self, "setSearchResultsHidden:", v6 & ~-[CKRecipientSelectionController alwaysShowSearchResultsTable](self, "alwaysShowSearchResultsTable"));
}

- (void)_showSearchField
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
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
  BOOL v19;
  id v20;
  _QWORD v21[5];

  if (!-[CKRecipientSelectionController isSearchResultsHidden](self, "isSearchResultsHidden"))
    goto LABEL_11;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[CKRecipientSelectionController firstResponder](self, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadInputViewsWithoutReset");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "presentsAutocompleteInAPopover"))
  {
    v7 = -[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView");

    if (!v7)
    {
      if (-[CKRecipientSelectionController _configureSearchListControllerAsAPopover](self, "_configureSearchListControllerAsAPopover"))
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __50__CKRecipientSelectionController__showSearchField__block_invoke;
        v21[3] = &unk_1E274A208;
        v21[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB8], "_performWithoutDeferringTransitions:", v21);
      }
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[CKRecipientSelectionController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", v10);

LABEL_8:
  -[CKRecipientSelectionController headerDecorationView](self, "headerDecorationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKRecipientSelectionController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController headerDecorationView](self, "headerDecorationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bringSubviewToFront:", v13);

  }
  -[CKRecipientSelectionController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController toFieldContainerView](self, "toFieldContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", v15);

  -[CKRecipientSelectionController bringComposeRecipientViewToFront](self, "bringComposeRecipientViewToFront");
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScrollsToTop:", 1);

  -[CKRecipientSelectionController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recipientSelectionControllerSearchListDidShowOrHide:", self);

LABEL_11:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "presentsAutocompleteInAPopover")
    && !-[CKRecipientSelectionController isSearchResultsHidden](self, "isSearchResultsHidden"))
  {
    v19 = -[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView");

    if (!v19)
      -[CKRecipientSelectionController _updateSearchListControllerPopOverSizing](self, "_updateSearchListControllerPopOverSizing");
  }
  else
  {

  }
}

void __50__CKRecipientSelectionController__showSearchField__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "searchListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "searchListController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_363_0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "ContactSearchAutocomplete : Source view for search results popover is nil, will not present", v8, 2u);
    }

  }
}

- (void)_hideSearchField
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  _QWORD v16[5];

  if (!-[CKRecipientSelectionController isSearchResultsHidden](self, "isSearchResultsHidden"))
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      objc_msgSend(v5, "setHidden:", 1);

      -[CKRecipientSelectionController firstResponder](self, "firstResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadInputViewsWithoutReset");

      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setScrollsToTop:", 0);

      -[CKRecipientSelectionController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recipientSelectionControllerSearchListDidShowOrHide:", self);

      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[CKRecipientSelectionController presentedViewController](self, "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKRecipientSelectionController searchListController](self, "searchListController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12 != v13;

      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "presentsAutocompleteInAPopover") || v6)
      {

      }
      else
      {
        v14 = -[CKRecipientSelectionController isBeingPresentedInMacDetailsView](self, "isBeingPresentedInMacDetailsView");

        if (!v14)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __50__CKRecipientSelectionController__hideSearchField__block_invoke;
          v16[3] = &unk_1E274A208;
          v16[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB8], "_performWithoutDeferringTransitions:", v16);
        }
      }
    }
  }
}

void __50__CKRecipientSelectionController__hideSearchField__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "searchListController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)_configureSearchListControllerAsAPopover
{
  return 0;
}

- (UIEdgeInsets)_navigationBarInsets
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
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[CKRecipientSelectionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKRecipientSelectionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBarInsetsForRecipientSelectionController:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0CEB4B0];
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_updateSearchResultsTable
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  -[CKRecipientSelectionController toField](self, "toField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[CKRecipientSelectionController resetSearchResults](self, "resetSearchResults");
  -[CKRecipientSelectionController toField](self, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_10;
  -[CKRecipientSelectionController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "canInsertMoreRecipients") & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canAccessContacts");

  if (v10)
  {
    -[CKRecipientSelectionController searchListController](self, "searchListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSelectionController toField](self, "toField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchWithText:", v13);

    -[CKRecipientSelectionController scrollSearchListControllerToTop:](self, "scrollSearchListControllerToTop:", 0);
    -[CKRecipientSelectionController toField](self, "toField");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "length") <= 1)
    {

    }
    else
    {
      -[CKRecipientSelectionController searchListController](self, "searchListController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasSearchResults");

      if (v16)
        -[CKRecipientSelectionController setSearchResultsHidden:](self, "setSearchResultsHidden:", 0);
    }
    return;
  }
LABEL_11:
  if ((-[CKRecipientSelectionController alwaysShowSearchResultsTable](self, "alwaysShowSearchResultsTable") & 1) == 0)
    -[CKRecipientSelectionController setSearchResultsHidden:](self, "setSearchResultsHidden:", 1);
  -[CKRecipientSelectionController invalidateOutstandingIDStatusRequests](self, "invalidateOutstandingIDStatusRequests");
}

- (void)resetSearchResults
{
  id v2;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchResults:", 0);

}

- (void)_updateAddressBookProperties
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  CKPreferredAddressTypes();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 2
    && objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C967C0])
    && (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v3 = 7;
  }
  else if (objc_msgSend(v6, "count") == 1)
  {
    if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C967C0]))
      v3 = 6;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  if (self->_toField)
  {
    -[CKRecipientSelectionController toField](self, "toField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyboardType:", v3);

  }
}

- (CNContactPickerViewController)contactPickerViewController
{
  CNContactPickerViewController *contactPickerViewController;
  CKCNContactPickerViewController *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactPickerViewController *v13;

  contactPickerViewController = self->_contactPickerViewController;
  if (!contactPickerViewController)
  {
    v4 = objc_alloc_init(CKCNContactPickerViewController);
    v5 = -[CKRecipientSelectionController _userInterfaceStyleOverride](self, "_userInterfaceStyleOverride");
    if (v5)
      -[CKCNContactPickerViewController setOverrideUserInterfaceStyle:](v4, "setOverrideUserInterfaceStyle:", v5);
    CKPreferredContactsProperties(-[CNContactPickerViewController setDelegate:](v4, "setDelegate:", self));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setDisplayedPropertyKeys:](v4, "setDisplayedPropertyKeys:", v6);

    -[CKCNContactPickerViewController navigationItem](v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE_PROMPT"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrompt:", v9);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForEnablingContact:](v4, "setPredicateForEnablingContact:", v10);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count + phoneNumbers.@count) == 1"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](v4, "setPredicateForSelectionOfContact:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(property == 'emailAddresses') OR (property == 'phoneNumbers')"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfProperty:](v4, "setPredicateForSelectionOfProperty:", v12);

    v13 = self->_contactPickerViewController;
    self->_contactPickerViewController = &v4->super;

    contactPickerViewController = self->_contactPickerViewController;
  }
  return contactPickerViewController;
}

- (void)scrollSearchListControllerToTop:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSelectionController scrollSearchListControllerToTopContentOffset](self, "scrollSearchListControllerToTopContentOffset");
  objc_msgSend(v5, "setContentOffset:animated:", v3);

}

- (CGPoint)scrollSearchListControllerToTopContentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  -[CKRecipientSelectionController searchListController](self, "searchListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedContentInset");
  v10 = -v9;

  v11 = v6;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
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
  -[CKRecipientSelectionController toField](self, "toField", 0);
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
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("allowedByScreenTime"));

    -[CKRecipientSelectionController setCurrentConversationContext:](self, "setCurrentConversationContext:", 0);
    -[CKRecipientSelectionController handlesForScreenTimePolicyCheck](self, "handlesForScreenTimePolicyCheck");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35808], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v5, "allowedToShowConversationWithHandleIDs:sync:context:", v4, 1, &v9);
    v7 = v9;
    -[CKRecipientSelectionController setAllowedByScreenTime:](self, "setAllowedByScreenTime:", v6);

    -[CKRecipientSelectionController setCurrentConversationContext:](self, "setCurrentConversationContext:", v7);
    -[CKRecipientSelectionController currentConversationContext](self, "currentConversationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("allowedByScreenTime"), 1, ctxAllowedByScreenTime);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD block[4];
  id v14;
  CKRecipientSelectionController *v15;

  v10 = a4;
  v11 = v10;
  if ((void *)ctxAllowedByScreenTime == a6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__CKRecipientSelectionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E274A108;
    v14 = v10;
    v15 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKRecipientSelectionController;
    -[CKRecipientSelectionController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

void __81__CKRecipientSelectionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setAllowedByScreenTime:", objc_msgSend(v2, "allowedByScreenTime"));
  objc_msgSend(*(id *)(a1 + 40), "_updateToField");

}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = (void (**)(id, void *))a5;
  if (objc_msgSend(v6, "isGroup"))
  {
    objc_msgSend(v6, "autocompleteResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationForExistingChatWithGUID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "isGroupConversation");
    if (v12)
    {
      objc_msgSend(v11, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupPhoto");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);

    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (CKRecipientSelectionControllerDelegate)delegate
{
  return (CKRecipientSelectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKPendingConversation)conversation
{
  return self->_conversation;
}

- (CKComposeRecipientView)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
  objc_storeStrong((id *)&self->_toField, a3);
}

- (UIView)toFieldContainerView
{
  return self->_toFieldContainerView;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CKRecipientSearchListController)searchListController
{
  return self->_searchListController;
}

- (void)setSearchListController:(id)a3
{
  objc_storeStrong((id *)&self->_searchListController, a3);
}

- (BOOL)isPeoplePickerHidden
{
  return self->_peoplePickerHidden;
}

- (void)setPeoplePickerHidden:(BOOL)a3
{
  self->_peoplePickerHidden = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
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

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (id)gameCenterPickerBlock
{
  return self->_gameCenterPickerBlock;
}

- (UIScrollView)toFieldScrollingView
{
  return self->_toFieldScrollingView;
}

- (void)setToFieldScrollingView:(id)a3
{
  objc_storeStrong((id *)&self->_toFieldScrollingView, a3);
}

- (UILabel)toFieldPlaceholderLabel
{
  return self->_toFieldPlaceholderLabel;
}

- (void)setToFieldPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_toFieldPlaceholderLabel, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void)setContactPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactPickerViewController, a3);
}

- (CNComposeRecipient)recentContactForPresentedCNCard
{
  return self->_recentContactForPresentedCNCard;
}

- (void)setRecentContactForPresentedCNCard:(id)a3
{
  objc_storeStrong((id *)&self->_recentContactForPresentedCNCard, a3);
}

- (BOOL)isDisambiguating
{
  return self->_isDisambiguating;
}

- (void)setIsDisambiguating:(BOOL)a3
{
  self->_isDisambiguating = a3;
}

- (CKManualUpdater)addressBookNotificationUpdater
{
  return self->_addressBookNotificationUpdater;
}

- (void)setAddressBookNotificationUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, a3);
}

- (BOOL)preventAtomization
{
  return self->_preventAtomization;
}

- (void)setPreventAtomization:(BOOL)a3
{
  self->_preventAtomization = a3;
}

- (BOOL)didShowOneTimeErrorAlert
{
  return self->_didShowOneTimeErrorAlert;
}

- (void)setDidShowOneTimeErrorAlert:(BOOL)a3
{
  self->_didShowOneTimeErrorAlert = a3;
}

- (UIView)headerDecorationView
{
  return self->_headerDecorationView;
}

- (void)setHeaderDecorationView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDecorationView, a3);
}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return self->_homogenizePreferredServiceForiMessage;
}

- (BOOL)shouldSuppressSearchResultsTable
{
  return self->_shouldSuppressSearchResultsTable;
}

- (NSMutableDictionary)recipientAvailibityTimers
{
  return self->_recipientAvailibityTimers;
}

- (void)setRecipientAvailibityTimers:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAvailibityTimers, a3);
}

- (NSMutableDictionary)recipientAvailabilities
{
  return self->_recipientAvailabilities;
}

- (void)setRecipientAvailabilities:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAvailabilities, a3);
}

- (CKRecipientAvailabilities)expandedRecipientAvailabilities
{
  return self->_expandedRecipientAvailabilities;
}

- (void)setExpandedRecipientAvailabilities:(id)a3
{
  objc_storeStrong((id *)&self->_expandedRecipientAvailabilities, a3);
}

- (unint64_t)numberOfRowsInToField
{
  return self->_numberOfRowsInToField;
}

- (void)setNumberOfRowsInToField:(unint64_t)a3
{
  self->_numberOfRowsInToField = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (CKAlertController)alternateAddressesAlertController
{
  return self->_alternateAddressesAlertController;
}

- (void)setAlternateAddressesAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alternateAddressesAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAddressesAlertController, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_expandedRecipientAvailabilities, 0);
  objc_storeStrong((id *)&self->_recipientAvailabilities, 0);
  objc_storeStrong((id *)&self->_recipientAvailibityTimers, 0);
  objc_storeStrong((id *)&self->_headerDecorationView, 0);
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, 0);
  objc_storeStrong((id *)&self->_recentContactForPresentedCNCard, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_toFieldPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_toFieldScrollingView, 0);
  objc_storeStrong(&self->_gameCenterPickerBlock, 0);
  objc_storeStrong((id *)&self->_currentConversationContext, 0);
  objc_storeStrong((id *)&self->_searchListController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_toFieldContainerView, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_249_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Request Stewie error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_252_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18DFCD000, v2, v3, "Request Stewie error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
