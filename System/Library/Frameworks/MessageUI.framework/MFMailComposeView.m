@implementation MFMailComposeView

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__MFMailComposeView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (OS_os_log *)(id)log_log_3;
}

void __24__MFMailComposeView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

+ (double)preferredHeaderHeight
{
  double result;

  objc_msgSend(MEMORY[0x1E0D13680], "preferredHeight");
  return result;
}

- (MFMailComposeView)initWithFrame:(CGRect)a3 options:(unint64_t)a4 isQuickReply:(BOOL)a5
{
  _BOOL8 v5;
  double width;
  MFMailComposeView *v8;
  MFMailComposeView *v9;
  char v10;
  UIView *v11;
  UIView *headerView;
  void *v13;
  double v14;
  double v15;
  MFMailComposeToField *v16;
  MFMailComposeToField *toField;
  id WeakRetained;
  MFMailComposeToField *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MFComposeFromView *v24;
  MFComposeFromView *fromField;
  MFComposeSubjectView *v26;
  MFComposeSubjectView *subjectField;
  MFComposeWebContentVariationView *v28;
  MFComposeWebContentVariationView *webContentVariationField;
  MFComposeMultiView *v30;
  MFComposeMultiView *multiField;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v5 = a5;
  width = a3.size.width;
  v37.receiver = self;
  v37.super_class = (Class)MFMailComposeView;
  v8 = -[UITransitionView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_options = a4;
    if (v5)
      v10 = 64;
    else
      v10 = 0;
    *((_BYTE *)v8 + 785) = *((_BYTE *)v8 + 785) & 0xBF | v10;
    -[UITransitionView setDelegate:](v8, "setDelegate:", v8);
    -[MFMailComposeView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    headerView = v9->_headerView;
    v9->_headerView = v11;

    -[UIView setAutoresizingMask:](v9->_headerView, "setAutoresizingMask:", 2);
    -[UIView setAutoresizesSubviews:](v9->_headerView, "setAutoresizesSubviews:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_headerView, "setBackgroundColor:", v13);

    -[UIView setInsetsLayoutMarginsFromSafeArea:](v9->_headerView, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[UIView setClipsToBounds:](v9->_headerView, "setClipsToBounds:", 1);
    objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
    v15 = v14;
    v16 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeToField alloc], "initWithFrame:dragDropDelegate:", v9, 0.0, 0.0, width, v14);
    toField = v9->_toField;
    v9->_toField = v16;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_toFieldDelegate);
    -[MFMailComposeToField setToFieldDelegate:](v9->_toField, "setToFieldDelegate:", WeakRetained);

    v19 = v9->_toField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E5A6A588, CFSTR("Main"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("To:"), &stru_1E5A6A588, CFSTR("Main"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeView _setupField:withLabel:navTitle:](v9, "_setupField:withLabel:navTitle:", v19, v21, v23);

    -[MFMailComposeToField setAccessibilityIdentifier:](v9->_toField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BF8]);
    v24 = -[MFComposeFromView initWithFrame:]([MFComposeFromView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    fromField = v9->_fromField;
    v9->_fromField = v24;

    -[MFComposeFromView setAutoresizingMask:](v9->_fromField, "setAutoresizingMask:", 2);
    -[MFComposeFromView setDelegate:](v9->_fromField, "setDelegate:", v9);
    -[MFMailComposeView _addHoverEffectToField:](v9, "_addHoverEffectToField:", v9->_fromField);
    v26 = -[MFComposeSubjectView initWithFrame:]([MFComposeSubjectView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    subjectField = v9->_subjectField;
    v9->_subjectField = v26;

    -[MFComposeSubjectView setAutoresizingMask:](v9->_subjectField, "setAutoresizingMask:", 2);
    -[MFMailComposeView _addHoverEffectToField:](v9, "_addHoverEffectToField:", v9->_subjectField);
    v28 = -[MFComposeWebContentVariationView initWithFrame:]([MFComposeWebContentVariationView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    webContentVariationField = v9->_webContentVariationField;
    v9->_webContentVariationField = v28;

    v30 = -[MFComposeMultiView initWithFrame:]([MFComposeMultiView alloc], "initWithFrame:", 0.0, 0.0, width, v15);
    multiField = v9->_multiField;
    v9->_multiField = v30;

    -[MFComposeMultiView setAutoresizingMask:](v9->_multiField, "setAutoresizingMask:", 2);
    -[MFComposeMultiView setDelegate:](v9->_multiField, "setDelegate:", v9);
    -[MFMailComposeView _addHoverEffectToField:](v9, "_addHoverEffectToField:", v9->_multiField);
    -[MFMailComposeView _setUpContentView](v9, "_setUpContentView");
    -[MFMailComposeView displayQuickReplyView:](v9, "displayQuickReplyView:", v5);
    -[UIScrollView setKeyboardDismissMode:](v9->_bodyScroller, "setKeyboardDismissMode:", 2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v9, sel_menuDidHide, *MEMORY[0x1E0DC5040], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v9, sel_automaticKeyboardFinishedAppearing_, *MEMORY[0x1E0DC4E70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v9, sel_automaticKeyboardFinishedDisappearing_, *MEMORY[0x1E0DC4E68], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v9, sel__adjustHeaderFieldsPreferredContentSize, *MEMORY[0x1E0DC48E8], 0);

  }
  return v9;
}

- (void)displayQuickReplyView:(BOOL)a3
{
  char v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 785) = *((_BYTE *)self + 785) & 0xBF | v3;
  if (!a3)
  {
    -[UIScrollView addSubview:](self->_bodyScroller, "addSubview:", self->_headerView);
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_fromField);
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_subjectField);
    -[MFComposeSubjectView setAccessibilityIdentifier:](self->_subjectField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BD8]);
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_webContentVariationField);
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_multiField);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x1E0DC3C98]);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __43__MFMailComposeView_displayQuickReplyView___block_invoke;
    v10 = &unk_1E5A68BB0;
    objc_copyWeak(&v11, &location);
    v6 = (void *)objc_msgSend(v5, "initWithActivationHandler:", &v7);
    -[MFComposeMultiView addInteraction:](self->_multiField, "addInteraction:", v6, v7, v8, v9, v10);
    -[MFComposeMultiView setScribbleDelegate:](self->_multiField, "setScribbleDelegate:", self);
    -[MFComposeMultiView setAccessibilityIdentifier:](self->_multiField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B08]);
    -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __43__MFMailComposeView_displayQuickReplyView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_multiFieldClicked");

}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MFMailComposeContactsSearchController cancelSearch](self->_searchController, "cancelSearch");
  -[MFMailComposeContactsSearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
  objc_msgSend(WeakRetained, "_endPinningInputViews");

  -[MFComposeMultiView setDelegate:](self->_multiField, "setDelegate:", 0);
  -[MFComposeWebView _close](self->_webView, "_close");
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView dealloc](&v5, sel_dealloc);
}

- (void)_setUpContentView
{
  MFComposeWebView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  MFComposeWebView *v8;
  MFComposeWebView *webView;
  UIView **p_contentView;
  void *v11;
  id v12;
  UIView *v13;
  UIView *findPanelHostView;
  UIView *v15;
  void *v16;
  void *v17;
  UIScrollView *v18;
  UIScrollView *bodyScroller;
  id v20;

  -[MFMailComposeView _mainContainerView](self, "_mainContainerView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MFComposeWebView alloc];
  -[MFMailComposeView _frameForMainContainerView](self, "_frameForMainContainerView");
  v8 = -[MFComposeWebView initWithFrame:isQuickReply:](v3, "initWithFrame:isQuickReply:", -[MFMailComposeView isQuickReply](self, "isQuickReply"), v4, v5, v6, v7);
  webView = self->_webView;
  self->_webView = v8;

  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, self->_webView);
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  if (-[MFMailComposeView isQuickReply](self, "isQuickReply"))
    objc_msgSend(MEMORY[0x1E0DC3658], "mailQuickComposeBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "mailGeneralBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](*p_contentView, "setBackgroundColor:", v11);

  objc_msgSend(v20, "addSubview:", *p_contentView);
  -[MFComposeWebView setComposeWebViewDelegate:](self->_webView, "setComposeWebViewDelegate:", self);
  -[MFComposeWebView _setEditable:](self->_webView, "_setEditable:", 1);
  v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v13 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  findPanelHostView = self->_findPanelHostView;
  self->_findPanelHostView = v13;

  v15 = self->_findPanelHostView;
  -[MFComposeWebView findInteraction](self->_webView, "findInteraction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setHostView:", v15);

  -[MFComposeWebView scrollView](self->_webView, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_findPanelHostView);

  -[MFComposeWebView scrollView](self->_webView, "scrollView");
  v18 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  bodyScroller = self->_bodyScroller;
  self->_bodyScroller = v18;

  -[UIScrollView setAutoresizingMask:](self->_bodyScroller, "setAutoresizingMask:", 18);
  -[UIScrollView setDelegate:](self->_bodyScroller, "setDelegate:", self);
  -[UIScrollView setAlwaysBounceVertical:](self->_bodyScroller, "setAlwaysBounceVertical:", -[MFMailComposeView isQuickReply](self, "isQuickReply") ^ 1);
  -[UIScrollView _setFirstResponderKeyboardAvoidanceEnabled:](self->_bodyScroller, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);
  if (-[MFMailComposeView isQuickReply](self, "isQuickReply"))
  {
    -[UIScrollView setContentInsetAdjustmentBehavior:](self->_bodyScroller, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setScrollEnabled:](self->_bodyScroller, "setScrollEnabled:", 0);
    -[UIScrollView setBounces:](self->_bodyScroller, "setBounces:", 0);
  }
  -[MFMailComposeView _adjustContentViewStyle](self, "_adjustContentViewStyle");

}

- (CGRect)_headerFrame
{
  double v3;
  double v4;
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
  CGRect result;

  -[UIView frame](self->_headerView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView contentInset](self->_bodyScroller, "contentInset");
  v12 = v6 + v11;
  v13 = v4;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (void)_setHeaderFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double findPanelHeight;
  double v15;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIScrollView contentInset](self->_bodyScroller, "contentInset");
  -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
  v9 = v8;
  v11 = v10;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = CGRectGetHeight(v17);
  -[UIView frame](self->_headerView, "frame");
  v13 = v12 - CGRectGetHeight(v18);
  findPanelHeight = self->_findPanelHeight;
  v15 = v11 - v13;
  if (-[MFMailComposeView isQuickReply](self, "isQuickReply"))
    v15 = 0.0;
  -[UIScrollView setContentInset:](self->_bodyScroller, "setContentInset:");
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v9, v15);
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v9, v15);
  -[UIView setFrame:](self->_headerView, "setFrame:", x, -(height + findPanelHeight), width, height);
}

- (void)setComposeViewDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mailComposeViewDelegate, obj);
    -[MFComposeWebView setMailComposeViewDelegate:](self->_webView, "setMailComposeViewDelegate:", obj);
  }

}

- (void)setComposeRecipientDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_composeRecipientViewDelegate, obj);
    -[MFMailComposeToField setDelegate:](self->_toField, "setDelegate:", obj);
    -[MFMailComposeRecipientTextView setDelegate:](self->_ccField, "setDelegate:", obj);
    -[MFMailComposeRecipientTextView setDelegate:](self->_bccField, "setDelegate:", obj);
  }

}

- (void)setToFieldDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_toFieldDelegate, obj);
    -[MFMailComposeToField setToFieldDelegate:](self->_toField, "setToFieldDelegate:", obj);
  }

}

- (BOOL)_presentsSearchResultsTableAsPopover
{
  void *v2;
  char v3;

  -[MFMailComposeView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mf_supportsPopoverPresentation");

  return v3;
}

- (CNAutocompleteResultsTableViewController)searchViewController
{
  CNAutocompleteResultsTableViewController *searchViewController;
  CNAutocompleteResultsTableViewController *v4;
  CNAutocompleteResultsTableViewController *v5;

  searchViewController = self->_searchViewController;
  if (!searchViewController)
  {
    v4 = (CNAutocompleteResultsTableViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13638]), "initWithStyle:", 1);
    v5 = self->_searchViewController;
    self->_searchViewController = v4;

    -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchViewController, "setDelegate:", self);
    searchViewController = self->_searchViewController;
  }
  return searchViewController;
}

- (id)_searchResultsTable
{
  return (id)-[CNAutocompleteResultsTableViewController view](self->_searchViewController, "view");
}

- (id)_corecipientResultsTable
{
  return (id)-[CNAutocompleteResultsTableViewController view](self->_corecipientsSearchViewController, "view");
}

- (void)setDisplayMetrics:(id)a3
{
  MFComposeDisplayMetrics *v5;

  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMailComposeView _displayMetricsDidChange](self, "_displayMetricsDidChange");
  }

}

- (MFComposeImageSizeView)imageSizeField
{
  MFComposeImageSizeView *imageSizeField;

  imageSizeField = self->_imageSizeField;
  if (!imageSizeField)
  {
    -[MFMailComposeView _createImageSizeFieldIfNeededAndAddSubview:](self, "_createImageSizeFieldIfNeededAndAddSubview:", 0);
    imageSizeField = self->_imageSizeField;
  }
  return imageSizeField;
}

- (MFMailComposeRecipientTextView)ccField
{
  MFMailComposeRecipientTextView *ccField;

  ccField = self->_ccField;
  if (!ccField)
  {
    -[MFMailComposeView _createCCAndBCCFieldIfNeededAndCompleteSetup:](self, "_createCCAndBCCFieldIfNeededAndCompleteSetup:", 0);
    ccField = self->_ccField;
  }
  return ccField;
}

- (MFMailComposeRecipientTextView)bccField
{
  MFMailComposeRecipientTextView *bccField;

  bccField = self->_bccField;
  if (!bccField)
  {
    -[MFMailComposeView _createCCAndBCCFieldIfNeededAndCompleteSetup:](self, "_createCCAndBCCFieldIfNeededAndCompleteSetup:", 0);
    bccField = self->_bccField;
  }
  return bccField;
}

- (void)_cancelAnimations
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3468], "sharedAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationsForTarget:", self->_toField);
  objc_msgSend(v3, "removeAnimationsForTarget:", self->_ccField);
  objc_msgSend(v3, "removeAnimationsForTarget:", self->_subjectField);
  objc_msgSend(v3, "removeAnimationsForTarget:", self->_headerView);
  objc_msgSend(v3, "removeAnimationsForTarget:", self->_bodyScroller);

}

- (void)resetContentSize
{
  double v3;
  double v4;
  double v5;
  CGRect v6;

  -[MFMailComposeView bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_bodyScroller, "setContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[MFMailComposeView bounds](self, "bounds");
  -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v3, v4, CGRectGetWidth(v6), v5);
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[MFMailComposeView _cancelAnimations](self, "_cancelAnimations");
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)_collectKeyViews:(id)a3
{
  id v4;
  void *v5;
  MFMailComposeRecipientTextView *v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView _collectKeyViews:](&v10, sel__collectKeyViews_, v4);
  -[CNComposeRecipientTextView textView](self->_toField, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover")
    && objc_msgSend(v5, "isFirstResponder"))
  {
    v6 = self->_ccField;
    -[MFMailComposeRecipientTextView alpha](v6, "alpha");
    if (v7 == 0.0)
    {
      v9 = 1;
    }
    else
    {
      -[MFMailComposeRecipientTextView superview](v6, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

    }
    if (v9 && !*MEMORY[0x1E0D13608])
      objc_msgSend(v4, "insertObject:atIndex:", self->_ccField, objc_msgSend(v4, "indexOfObject:", v5) + 1);
  }

}

- (void)composeHeaderViewClicked:(id)a3
{
  if (self->_multiField == a3)
    -[MFMailComposeView _multiFieldClicked](self, "_multiFieldClicked");
}

- (double)_verticalPadding
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  double result;

  -[MFMailComposeView bounds](self, "bounds");
  v4 = v3;
  -[MFMailComposeView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");

  v7 = v4 <= 768.0 || v6 == 1;
  result = 44.0;
  if (v7)
    return 0.0;
  return result;
}

- (void)_setShadowViewVisible:(BOOL)a3 frame:(CGRect)a4
{
  UIView *shadowView;
  double height;
  double width;
  double y;
  double x;
  MFSearchShadowView *v10;
  UIView *v11;
  void *v12;
  UIScrollView *bodyScroller;
  UIView *v14;

  shadowView = self->_shadowView;
  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    if (shadowView)
    {
      -[UIView setAlpha:](shadowView, "setAlpha:", 1.0);
      -[UIView setFrame:](self->_shadowView, "setFrame:", x, y, width, height);
    }
    else
    {
      v10 = -[MFSearchShadowView initWithFrame:]([MFSearchShadowView alloc], "initWithFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      v11 = self->_shadowView;
      self->_shadowView = &v10->super.super;

      -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 2);
      -[UIView setOpaque:](self->_shadowView, "setOpaque:", 0);
    }
    -[UIView superview](self->_shadowView, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    bodyScroller = self->_bodyScroller;
    v14 = self->_shadowView;
    if (v12)
      -[UIScrollView bringSubviewToFront:](bodyScroller, "bringSubviewToFront:", v14);
    else
      -[UIScrollView addSubview:](bodyScroller, "addSubview:", v14);
  }
  else
  {
    -[UIView removeFromSuperview](shadowView, "removeFromSuperview", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (void)_layoutFindPanelHostView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UIView frame](self->_headerView, "frame");
  v4 = v3 + self->_findPanelHeight;
  -[UIScrollView bounds](self->_bodyScroller, "bounds");
  v6 = v5;
  -[UIScrollView safeAreaInsets](self->_bodyScroller, "safeAreaInsets");
  v8 = v6 + v7;
  -[UIScrollView contentInset](self->_bodyScroller, "contentInset");
  v10 = v9 - v4;
  if (v8 < v10)
    v8 = v10;
  -[MFMailComposeView bounds](self, "bounds");
  -[UIView setFrame:](self->_findPanelHostView, "setFrame:", 0.0, v8);
}

- (void)_setupBodyFieldWithHeaderFrame:(double)a3 enclosingFrame:(double)a4 changingView:(double)a5 frameToPin:(uint64_t)a6 wasSearching:(void *)a7
{
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  CGRect v29;

  v28 = a7;
  objc_msgSend((id)a1, "_updateTextViewHeightWithHeaderFrame:", a2, a3, a4, a5);
  objc_msgSend((id)a1, "_adjustScrollerContentSize");
  objc_msgSend((id)a1, "_layoutFindPanelHostView");
  objc_msgSend((id)a1, "bounds");
  objc_msgSend(*(id *)(a1 + 512), "setFrame:");
  objc_msgSend(*(id *)(a1 + 512), "setScrollEnabled:", 1);
  if (v28)
  {
    v29.origin.x = a13;
    v29.origin.y = a14;
    v29.size.width = a15;
    v29.size.height = a16;
    MaxY = CGRectGetMaxY(v29);
    objc_msgSend(*(id *)(a1 + 512), "contentOffset");
    v25 = v24;
    if (a8)
    {
      v26 = *(double *)(a1 + 720);
      objc_msgSend(*(id *)(a1 + 512), "frame");
      if (v26 >= MaxY - v27)
        v23 = v26;
      else
        v23 = MaxY - v27;
    }
    objc_msgSend(*(id *)(a1 + 512), "setContentOffset:", v25, v23);
  }
  objc_msgSend((id)a1, "_revealSelectionIfNeededWithChangingView:", v28);

}

- (MFComposeWebView)composeWebView
{
  return self->_webView;
}

- (void)_layoutSubviewsWithActiveRecipientView:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  __int128 v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  UIScrollView *bodyScroller;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MaxY;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  _BOOL4 v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id WeakRetained;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  float v111;
  UIScrollView *v112;
  void *v113;
  double v114;
  void *v115;
  char v116;
  uint64_t v117;
  CGFloat v118;
  uint64_t v119;
  CGFloat v120;
  double rect;
  double v122;
  void *v123;
  double v124;
  void *v125;
  _QWORD v126[4];
  id v127;
  id v128;
  id obj;
  _OWORD v130[2];
  _QWORD v131[4];
  CGRect v132;
  CGRect v133;

  height = a5.height;
  width = a5.width;
  v131[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[MFMailComposeView _cancelAnimations](self, "_cancelAnimations");
  -[UIScrollView setScrollEnabled:](self->_bodyScroller, "setScrollEnabled:", 0);
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v130[0] = *MEMORY[0x1E0C9D648];
  v130[1] = v9;
  -[MFMailComposeView _layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:](self, "_layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:", v8, v130, width, height);
  -[MFMailComposeView _heightForBottomView](self, "_heightForBottomView");
  v11 = v10;
  -[MFMailComposeRecipientTextView frame](self->_activeRecipientView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MFMailComposeView frame](self, "frame");
  v21 = v20;
  v23 = v22;
  bodyScroller = self->_bodyScroller;
  -[MFMailComposeRecipientTextView superview](self->_activeRecipientView, "superview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView convertRect:fromView:](bodyScroller, "convertRect:fromView:", v25, v13, v15, v17, v19);
  v117 = v27;
  v119 = v26;
  rect = v28;
  v30 = v29;

  -[MFMailComposeView bounds](self, "bounds");
  v32 = v31;
  -[MFMailComposeView _headerFrame](self, "_headerFrame");
  v124 = v33;
  v35 = v34;
  v37 = v36;
  -[MFComposeSubjectView frame](self->_subjectField, "frame");
  MaxY = CGRectGetMaxY(v132);
  v122 = v32 - v11;
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
  {
    -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v35, v37, v124, MaxY);
    v39 = 0.0;
    if ((*((_BYTE *)self + 784) & 0x40) == 0)
    {
      +[CNComposeHeaderView preferredHeight](MFMailComposeRecipientTextView, "preferredHeight");
      v41 = (uint64_t)((v21 + v23 - (v30 + rect) - v11 + -20.0) / v40);
      if (v41 <= 3)
      {
        +[CNComposeHeaderView preferredHeight](MFMailComposeRecipientTextView, "preferredHeight");
        -[CNComposeRecipientTextView textFieldOffsetForNumberOfRowsToScroll:numberOfRowsAboveField:](self->_activeRecipientView, "textFieldOffsetForNumberOfRowsToScroll:numberOfRowsAboveField:", 4 - v41, (uint64_t)((v30 - v30) / v42));
        v39 = v43;
      }
    }
  }
  else
  {
    -[CNComposeRecipientTextView offsetForRowWithTextField](self->_activeRecipientView, "offsetForRowWithTextField");
    v45 = v44;
    objc_msgSend(MEMORY[0x1E0D13680], "separatorHeight");
    if (v30 + v45 - v37 <= ceil(v46))
      v39 = 0.0;
    else
      v39 = v30 + v45 - v37;
    -[UIView frame](self->_headerView, "frame", v117, v119);
    v48 = v47;
    if (MaxY < v122 + v39)
      MaxY = v122 + v39;
    -[MFMailComposeView _setHeaderFrame:](self, "_setHeaderFrame:", v35, v37, v124, MaxY);
    -[UIView frame](self->_headerView, "frame");
    v30 = v30 + v49 - v48;
  }
  -[MFMailComposeView _updateTextViewOriginWithHeaderFrame:](self, "_updateTextViewOriginWithHeaderFrame:", v35, v37, v124, MaxY, v117, v119);
  -[MFMailComposeView _adjustScrollerContentSize](self, "_adjustScrollerContentSize");
  v50 = -[MFMailComposeView isSearchResultsPopoverVisible](self, "isSearchResultsPopoverVisible");
  -[UIScrollView _effectiveContentInset](self->_bodyScroller, "_effectiveContentInset");
  v52 = v51;
  v53 = v39 - v51;
  v54 = 0.0;
  if (!-[MFMailComposeView shouldScrollLastChangedRecipientViewToTop](self, "shouldScrollLastChangedRecipientViewToTop"))
  {
    -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
    v56 = v53 == v55 || v50;
    if ((v56 & 1) == 0)
    {
      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C10]), "initWithTarget:", self->_bodyScroller);
      -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
      objc_msgSend(v57, "setStartPoint:");
      objc_msgSend(v57, "setEndPoint:", 0.0, v39 - v52);
      objc_msgSend(MEMORY[0x1E0DC3468], "sharedAnimator");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addAnimation:withDuration:start:", v57, 1, 0.349999994);

      -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
      v60 = v59;

      v54 = v53 - v60;
    }
  }
  -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "frame");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
  {
    v124 = v67;
    v35 = v63;
  }
  else
  {
    v133.size.width = v118;
    v133.origin.x = v120;
    v133.origin.y = v30;
    v133.size.height = rect;
    CGRectGetMaxY(v133);
    +[CNComposeHeaderView separatorHeight](MFMailComposeRecipientTextView, "separatorHeight");
    UIRoundToViewScale();
    v65 = v68;
    v69 = -[MFMailComposeView shouldScrollLastChangedRecipientViewToTop](self, "shouldScrollLastChangedRecipientViewToTop");
    v70 = MaxY + v30;
    if (!v69)
      v70 = 0.0;
    v71 = v122;
    if (v122 >= MaxY)
      v71 = MaxY;
    objc_msgSend(v61, "setFrame:", v35, v65, v124, v71 - (v65 - v53) + v70);
    +[MFSearchShadowView defaultHeight](MFSearchShadowView, "defaultHeight");
    -[UIView setFrame:](self->_shadowView, "setFrame:", v35, v65, v124, v72);
  }
  if (!-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
  {
    objc_msgSend(v61, "superview");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75 == 0;

    if (!v76)
      goto LABEL_46;
    goto LABEL_31;
  }
  if (*((char *)self + 784) < 0)
    goto LABEL_46;
  -[MFMailComposeView toField](self, "toField");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v73, "isFirstResponder") & 1) == 0)
  {
    -[MFMailComposeView ccField](self, "ccField");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v74, "isFirstResponder"))
    {
      -[MFMailComposeView bccField](self, "bccField");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "isFirstResponder");

      if ((v116 & 1) == 0)
        goto LABEL_46;
      goto LABEL_31;
    }

  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v78 = objc_claimAutoreleasedReturnValue();

    v77 = (void *)v78;
  }
  -[MFMailComposeView searchViewController](self, "searchViewController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setBackgroundColor:", v77);

  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
  {
    if (WeakRetained)
      v82 = v50;
    else
      v82 = 1;
    if ((v82 & 1) == 0)
    {
      -[MFMailComposeView searchViewController](self, "searchViewController");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeRecipientTextView navTitle](self->_activeRecipientView, "navTitle");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setTitle:", v84);

      v131[0] = self->_activeRecipientView;
      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v131[1] = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = objc_alloc(MEMORY[0x1E0DC3A40]);
      -[MFMailComposeView searchViewController](self, "searchViewController");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v86, "initWithRootViewController:", v87);

      -[CNComposeRecipientTextView textView](self->_activeRecipientView, "textView");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "selectedTextRange");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "end");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "caretRectForPosition:", v90);
      v92 = v91;
      v94 = v93;
      v96 = v95;
      v98 = v97;

      -[MFMailComposeView convertRect:fromView:](self, "convertRect:fromView:", v125, v92, v94, v96, v98);
      v100 = v99;
      v102 = v101;
      v104 = v103;
      v106 = v105;
      objc_msgSend(v88, "setModalPresentationStyle:", 7);
      obj = 0;
      objc_msgSend(v88, "setModalPresentationStyle:", 7);
      objc_msgSend(v88, "popoverPresentationController");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setSourceView:", self);
      objc_msgSend(v107, "setSourceRect:", v100, v102 + v106 - v54, v104, v106);
      objc_msgSend(v107, "setPermittedArrowDirections:", 1);
      objc_msgSend(v107, "_setShouldDisableInteractionDuringTransitions:", 0);
      objc_msgSend(WeakRetained, "pep_getInvocation:", &obj);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = __80__MFMailComposeView__layoutSubviewsWithActiveRecipientView_changingView_toSize___block_invoke;
      v126[3] = &unk_1E5A65430;
      v109 = v107;
      v127 = v109;
      v110 = v123;
      v128 = v110;
      objc_msgSend(v108, "presentViewController:animated:completion:", v88, 1, v126);

      -[MFMailComposeView _cancelDelayedPopover](self, "_cancelDelayedPopover");
      if (v54 == 0.0)
      {
        objc_msgSend(obj, "invoke");
      }
      else
      {
        objc_msgSend(obj, "retainArguments");
        objc_storeStrong((id *)&self->_delayedPopoverInvocation, obj);
        UIAnimationDragCoefficient();
        -[MFMailComposeView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__presentDelayedPopover, 0, (float)(v111 * 0.35));
      }

    }
  }
  else
  {
    v112 = self->_bodyScroller;
    -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](v112, "addSubview:", v113);

    +[MFSearchShadowView defaultHeight](MFSearchShadowView, "defaultHeight");
    -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 1, v35, v65, v124, v114);
  }

LABEL_46:
}

uint64_t __80__MFMailComposeView__layoutSubviewsWithActiveRecipientView_changingView_toSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPassthroughViews:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isSearchResultsPopoverVisible
{
  id WeakRetained;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
  v4 = -[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover");
  if (WeakRetained)
    v5 = v4;
  else
    v5 = 0;
  if (v5)
  {
    objc_msgSend(WeakRetained, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "isBeingDismissed") & 1) == 0)
    {
      objc_msgSend(v6, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndex:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_userInterfaceConfigurationSupportsCorecipientsTableView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;

  -[MFMailComposeView bounds](self, "bounds");
  v4 = v3;
  -[MFMailComposeView _heightForBottomView](self, "_heightForBottomView");
  v6 = v5;
  -[MFMailComposeView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  return v4 - v6 > 300.0 && v8 == 1;
}

- (BOOL)_shouldShowCorecipientsTableView
{
  void *v3;
  BOOL v4;

  if (!-[MFMailComposeView _userInterfaceConfigurationSupportsCorecipientsTableView](self, "_userInterfaceConfigurationSupportsCorecipientsTableView")|| !-[CNComposeRecipientTextView isFirstResponder](self->_toField, "isFirstResponder"))
  {
    return 0;
  }
  -[CNAutocompleteResultsTableViewController recipients](self->_corecipientsSearchViewController, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_setCorecipientsTableViewVisible:(BOOL)a3 withFieldFrame:(CGRect)a4
{
  double width;
  double y;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double MaxY;
  id v22;
  UIView *v23;
  UIView *corecipientsSearchTableViewSeparator;
  UIView *v25;
  void *v26;
  double v27;
  char v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  if (a3)
  {
    width = a4.size.width;
    y = a4.origin.y;
    -[MFMailComposeView _corecipientResultsTable](self, "_corecipientResultsTable", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);
    -[MFMailComposeView _corecipientResultsTable](self, "_corecipientResultsTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[UIView insertSubview:belowSubview:](self->_headerView, "insertSubview:belowSubview:", v7, self->_ccField);
    +[CNComposeHeaderView separatorHeight](MFMailComposeRecipientTextView, "separatorHeight");
    v11 = v10;
    objc_msgSend(v7, "frame");
    v13 = v12;
    -[MFMailComposeView bounds](self, "bounds");
    v15 = v14;
    +[MFSearchShadowView defaultHeight](MFSearchShadowView, "defaultHeight");
    v16 = y + v11 * -3.0;
    -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 1, 0.0, v16, width, v17);
    objc_msgSend(v7, "frame");
    if (CGRectIsEmpty(v37))
    {
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke;
      v31[3] = &unk_1E5A68BD8;
      v32 = v7;
      v33 = 0;
      v34 = v16;
      v35 = v15;
      v36 = v13;
      objc_msgSend(v18, "performWithoutAnimation:", v31);

    }
    objc_msgSend(v7, "contentSize");
    v20 = v19 + -2.0;
    objc_msgSend(v7, "setFrame:", 0.0, v16, v15, v19 + -2.0);
    objc_msgSend(v7, "setScrollEnabled:", 0);
    v38.origin.x = 0.0;
    v38.origin.y = v16;
    v38.size.width = v15;
    v38.size.height = v20;
    MaxY = CGRectGetMaxY(v38);
    if (!self->_corecipientsSearchTableViewSeparator)
    {
      v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v23 = (UIView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      corecipientsSearchTableViewSeparator = self->_corecipientsSearchTableViewSeparator;
      self->_corecipientsSearchTableViewSeparator = v23;

      v25 = self->_corecipientsSearchTableViewSeparator;
      objc_msgSend(MEMORY[0x1E0D13680], "defaultSeparatorColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    }
    objc_msgSend(MEMORY[0x1E0D13680], "separatorHeight");
    -[UIView setFrame:](self->_corecipientsSearchTableViewSeparator, "setFrame:", 0.0, MaxY, width, v27);
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_corecipientsSearchTableViewSeparator);

    v28 = 32;
  }
  else
  {
    if ((*((_BYTE *)self + 785) & 0x20) != 0)
    {
      v29[4] = self;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_2;
      v30[3] = &unk_1E5A65480;
      v30[4] = self;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_3;
      v29[3] = &unk_1E5A66750;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v30, v29, 0.8, a4.origin.y, a4.size.width, a4.size.height);
    }
    v28 = 0;
  }
  *((_BYTE *)self + 785) = *((_BYTE *)self + 785) & 0xDF | v28;
}

uint64_t __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", 0.0);
}

void __69__MFMailComposeView__setCorecipientsTableViewVisible_withFieldFrame___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setShadowViewVisible:frame:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend(*(id *)(a1 + 32), "_corecipientResultsTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "removeFromSuperview");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 712);
    *(_QWORD *)(v4 + 712) = 0;

  }
}

- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5
{
  -[MFMailComposeView _layoutSubviews:changingView:toSize:searchResultsWereDismissed:](self, "_layoutSubviews:changingView:toSize:searchResultsWereDismissed:", a3, a4, 0, a5.width, a5.height);
}

- (void)_layoutComposeHeaderViewsWithChangingHeader:(id)a3 toSize:(CGSize)a4 withPinFrame:(CGRect *)a5
{
  CGFloat height;
  double width;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGSize v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CGSize v18;
  MFMailComposeToField *v19;
  CGPoint v20;
  CGSize v21;
  CGRect v22;

  height = a4.height;
  width = a4.width;
  v19 = (MFMailComposeToField *)a3;
  -[MFMailComposeView bounds](self, "bounds");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0D13680], "separatorHeight");
  v20.x = 0.0;
  v20.y = ceil(v11);
  v21.width = v10;
  objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
  v21.height = v12;
  _layoutField(self->_toField, v19, &v20.x, width, height);
  if (self->_toField == v19)
  {
    v13 = v21;
    a5->origin = v20;
    a5->size = v13;
  }
  v14 = -[MFMailComposeView _shouldShowCorecipientsTableView](self, "_shouldShowCorecipientsTableView");
  -[MFMailComposeView _setCorecipientsTableViewVisible:withFieldFrame:](self, "_setCorecipientsTableViewVisible:withFieldFrame:", v14, v20, v21);
  if (v14)
  {
    -[MFMailComposeView _corecipientResultsTable](self, "_corecipientResultsTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v20.y = CGRectGetMaxY(v22);

  }
  _layoutField(self->_ccField, v19, &v20.x, width, height);
  _layoutField(self->_bccField, v19, &v20.x, width, height);
  -[MFMailComposeView _updateFromField](self, "_updateFromField");
  _layoutField(self->_fromField, v19, &v20.x, width, height);
  -[MFMailComposeView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "horizontalSizeClass");

  if (v17 == 2)
    _layoutField(self->_imageSizeField, v19, &v20.x, width, height);
  -[MFMailComposeView _updateMultiField](self, "_updateMultiField");
  _layoutField(self->_multiField, v19, &v20.x, width, height);
  if (self->_toField != v19)
  {
    v18 = v21;
    a5->origin = v20;
    a5->size = v18;
  }
  _layoutField(self->_subjectField, v19, &v20.x, width, height);
  _layoutField(self->_webContentVariationField, v19, &v20.x, width, height);

}

- (void)_layoutSubviews:(BOOL)a3 changingView:(id)a4 toSize:(CGSize)a5 searchResultsWereDismissed:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  MFMailComposeRecipientTextView *lastChangedRecipientView;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD aBlock[5];
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];
  _QWORD v33[3];
  char v34;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v11 = a4;
  v12 = a3 & (*((unsigned __int8 *)self + 785) >> 4);
  if (!self->_activeRecipientView
    || -[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover") && v6)
  {
    -[MFMailComposeView _frameForContentView](self, "_frameForContentView");
    -[UIView setFrame:](self->_contentView, "setFrame:");
    if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
    {
      if (!v6)
      {
        -[MFMailComposeView _cancelDelayedPopover](self, "_cancelDelayedPopover");
        if (-[MFMailComposeView isSearchResultsPopoverVisible](self, "isSearchResultsPopoverVisible"))
        {
          v13 = -[UIScrollView mf_needsToAdjustContentOffset](self->_bodyScroller, "mf_needsToAdjustContentOffset") ^ 1;
          WeakRetained = objc_loadWeakRetained((id *)&self->_popoverOwner);
          objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", v13, 0);

        }
      }
    }
    else
    {
      -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFromSuperview");

        -[MFMailComposeView _setShadowViewVisible:frame:](self, "_setShadowViewVisible:frame:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
        v18 = 1;
LABEL_10:
        v19 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_2;
        aBlock[3] = &unk_1E5A68C28;
        aBlock[4] = self;
        v30[0] = v11;
        *(double *)&v30[1] = width;
        *(double *)&v30[2] = height;
        v31 = v18;
        v20 = _Block_copy(aBlock);
        v28[0] = v19;
        v28[1] = 3221225472;
        v28[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_3;
        v28[3] = &unk_1E5A66750;
        v28[4] = self;
        v21 = _Block_copy(v28);
        v22 = (void *)MEMORY[0x1E0DC3F10];
        if ((_DWORD)v12)
        {
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v20, v21, 0.2, 0.0);
        }
        else
        {
          v25[0] = v19;
          v25[1] = 3221225472;
          v25[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_4;
          v25[3] = &unk_1E5A68C50;
          v26 = v20;
          v27 = v21;
          objc_msgSend(v22, "performWithoutAnimation:", v25);

        }
        v23 = (id *)v30;

        goto LABEL_14;
      }
    }
    v18 = 0;
    goto LABEL_10;
  }
  if (!-[MFMailComposeView shouldScrollLastChangedRecipientViewToTop](self, "shouldScrollLastChangedRecipientViewToTop"))
  {
    -[MFMailComposeView _layoutSubviewsWithActiveRecipientView:changingView:toSize:](self, "_layoutSubviewsWithActiveRecipientView:changingView:toSize:", v12, v11, width, height);
    goto LABEL_15;
  }
  lastChangedRecipientView = self->_lastChangedRecipientView;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke;
  v32[3] = &unk_1E5A68C00;
  v32[4] = self;
  v34 = v12;
  v33[0] = v11;
  *(double *)&v33[1] = width;
  *(double *)&v33[2] = height;
  -[MFMailComposeView scrollToRecipientTextView:animated:completion:](self, "scrollToRecipientTextView:animated:completion:", lastChangedRecipientView, 1, v32);
  v23 = (id *)v33;
LABEL_14:

LABEL_15:
}

uint64_t __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviewsWithActiveRecipientView:changingView:toSize:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id WeakRetained;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  id *v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  id v31;
  __int128 v32;
  double MaxY;
  double v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  CGRect v41;

  objc_msgSend(*(id *)(a1 + 32), "_cancelAnimations");
  objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v38 = v6;
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "labelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "labelView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baselinePoint");
  v14 = v13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "baseFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capHeight");
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 32), "_verticalPadding");
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "_headerViewOriginWithScrollViewOffsetCalculation");
  v37 = v20;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 792));
  v22 = objc_msgSend(WeakRetained, "canShowImageSizeField");
  v23 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v23 + 785) & 8) != 0)
  {
    v24 = v22;
    v25 = objc_msgSend(WeakRetained, "canShowFromField");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", 1.0);
    if (v25)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:", 1.0);
    v26 = *(id **)(a1 + 32);
    v27 = 0.0;
    if (v24)
    {
      objc_msgSend(v26, "_createImageSizeFieldIfNeededAndAddSubview:", 1, 0.0);
      v26 = *(id **)(a1 + 32);
      v27 = 1.0;
    }
    objc_msgSend(v26[77], "setAlpha:", v27);
  }
  else
  {
    objc_msgSend(*(id *)(v23 + 608), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "setAlpha:", 0.0);
  }
  v28 = 592;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAllowsNotifyOption:", 1);
  if (objc_msgSend(WeakRetained, "canShowContentVariationPicker")
    && objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 5))
  {
    v29 = v5;
    v30 = v3;
    v28 = 624;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 1.0);
  }
  else
  {
    v29 = v5;
    v30 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 0.0);
  }
  v31 = *(id *)(*(_QWORD *)(a1 + 32) + v28);
  v32 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v39 = *MEMORY[0x1E0C9D648];
  v40 = v32;
  objc_msgSend(*(id *)(a1 + 32), "_layoutComposeHeaderViewsWithChangingHeader:toSize:withPinFrame:", *(_QWORD *)(a1 + 40), &v39, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v31, "frame");
  MaxY = CGRectGetMaxY(v41);
  v34 = fmax(round(v19 - (v11 + v14 - v17)), 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_setHeaderFrame:", v37, v34, v38, MaxY);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "horizontalSizeClass") == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isChangingRecipients") & 1) != 0)
    {

LABEL_17:
      objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
      goto LABEL_18;
    }
    v36 = *(unsigned __int8 *)(a1 + 64);

    if (v36)
      goto LABEL_17;
  }
  else
  {

  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "_setupBodyFieldWithHeaderFrame:enclosingFrame:changingView:frameToPin:wasSearching:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), v37, v34, v38, MaxY, v30, v29, v38, v8, v39, v40);
  if ((objc_msgSend(*(id *)(a1 + 32), "_presentsSearchResultsTableAsPopover") & 1) == 0
    && ((objc_msgSend(*(id *)(a1 + 32), "isChangingRecipients") & 1) != 0 || *(_BYTE *)(a1 + 64)))
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 1);
  }

}

void __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "composeWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_revealSelection");
}

uint64_t __84__MFMailComposeView__layoutSubviews_changingView_toSize_searchResultsWereDismissed___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_layoutSubviews:(BOOL)a3
{
  -[MFMailComposeView _layoutSubviews:changingView:toSize:](self, "_layoutSubviews:changingView:toSize:", a3, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)toggleImageSizeFieldIfNecessary
{
  void *v3;
  uint64_t v4;

  -[MFMailComposeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 == 2)
  {
    -[MFMailComposeView _beginBlockingBodyScroll](self, "_beginBlockingBodyScroll");
    -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);
    -[MFMailComposeView _endBlockingBodyScroll](self, "_endBlockingBodyScroll");
  }
}

- (void)setAutoresizingMask:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView setAutoresizingMask:](&v5, sel_setAutoresizingMask_);
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", a3);
}

- (BOOL)endEditing:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[MFMailComposeView subjectField](self, "subjectField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "endEditing:", v3);

  return v3;
}

- (void)setRecipientFieldsEditable:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[CNComposeRecipientTextView setEditable:animated:](self->_toField, "setEditable:animated:");
  -[CNComposeRecipientTextView setEditable:animated:](self->_ccField, "setEditable:animated:", v5, v4);
  -[CNComposeRecipientTextView setEditable:animated:](self->_bccField, "setEditable:animated:", v5, v4);
}

- (BOOL)isLoading
{
  return (*((unsigned __int8 *)self + 784) >> 1) & 1;
}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  MFMessageContentLoadingView *loadingView;
  MFMessageContentLoadingView *v7;
  MFMessageContentLoadingView *v8;
  MFMessageContentLoadingView *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 0;
  *((_BYTE *)self + 784) = *((_BYTE *)self + 784) & 0xFD | v5;
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      v7 = [MFMessageContentLoadingView alloc];
      v8 = -[MFMessageContentLoadingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_loadingView;
      self->_loadingView = v8;

    }
    -[MFMailComposeView bodyScroller](self, "bodyScroller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resignFirstResponder");

    -[MFMailComposeView bodyScroller](self, "bodyScroller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_loadingView);

    -[MFMailComposeView _layoutLoadingView](self, "_layoutLoadingView");
    -[MFMessageContentLoadingView setLoadingIndicatorVisible:animated:](self->_loadingView, "setLoadingIndicatorVisible:animated:", 1, 1);
  }
  else
  {
    -[MFMessageContentLoadingView superview](loadingView, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[MFMessageContentLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  }
  -[MFComposeWebView _setEditable:](self->_webView, "_setEditable:", !v3);
}

- (BOOL)isSending
{
  return (*((unsigned __int8 *)self + 784) >> 2) & 1;
}

- (void)setSending:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 784);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 784) = v3 & 0xFB | v4;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIScrollView *v5;
  UIScrollView *v6;
  UIScrollView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMailComposeView;
  -[UITransitionView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((*((_BYTE *)self + 784) & 2) != 0 && v5 == self->_bodyScroller)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)searchResultsPopoverWasDismissed
{
  MFMailComposeRecipientTextView *activeRecipientView;

  -[MFMailComposeView _layoutSubviews:changingView:toSize:searchResultsWereDismissed:](self, "_layoutSubviews:changingView:toSize:searchResultsWereDismissed:", 1, 0, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  activeRecipientView = self->_activeRecipientView;
  if (activeRecipientView)
  {
    if (-[CNComposeRecipientTextView didIgnoreFirstResponderResign](activeRecipientView, "didIgnoreFirstResponderResign"))
    {
      -[CNComposeRecipientTextView becomeFirstResponder](self->_activeRecipientView, "becomeFirstResponder");
    }
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:", self->_activeRecipientView, 0, 0);
  }
}

- (BOOL)isForEditing
{
  return *((_BYTE *)self + 785) & 1;
}

- (void)setIsForEditing:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 785);
  if (a3)
  {
    *((_BYTE *)self + 785) = v3 | 1;
    v4 = *((_BYTE *)self + 785) & 0xFD;
  }
  else
  {
    *((_BYTE *)self + 785) = v3 & 0xFE;
    v4 = *((_BYTE *)self + 785) | 2;
  }
  *((_BYTE *)self + 785) = v4;
  -[MFMailComposeView _adjustScrollerContentSize](self, "_adjustScrollerContentSize");
}

- (void)setAnimationDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 785) = *((_BYTE *)self + 785) & 0xFD | v3;
}

- (BOOL)isAnimationDisabled
{
  return (*((unsigned __int8 *)self + 785) >> 1) & 1;
}

- (void)setChangingRecipients:(BOOL)a3
{
  *((_BYTE *)self + 784) = *((_BYTE *)self + 784) & 0xFE | a3;
}

- (BOOL)isChangingRecipients
{
  return *((_BYTE *)self + 784) & 1;
}

- (void)setShowingPeoplePicker:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 784) = *((_BYTE *)self + 784) & 0xF7 | v3;
}

- (BOOL)isShowingPeoplePicker
{
  return (*((unsigned __int8 *)self + 784) >> 3) & 1;
}

- (void)setLoadingFromAddress:(BOOL)a3
{
  char v3;
  _BOOL8 v4;
  char v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v3 = *((_BYTE *)self + 784);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 16;
    else
      v6 = 0;
    *((_BYTE *)self + 784) = v3 & 0xEF | v6;
    if (a3)
    {
      -[CNComposeRecipientTextView setEnabled:](self->_toField, "setEnabled:", 0);
      -[CNComposeRecipientTextView setEnabled:](self->_ccField, "setEnabled:", 0);
      v7 = 0;
    }
    else
    {
      -[CNComposeRecipientTextView setEnabled:](self->_toField, "setEnabled:", (*((_BYTE *)self + 784) & 0x20) == 0);
      -[CNComposeRecipientTextView setEnabled:](self->_ccField, "setEnabled:", (*((_BYTE *)self + 784) & 0x20) == 0);
      v7 = (*((_BYTE *)self + 784) & 0x20) == 0;
    }
    -[CNComposeRecipientTextView setEnabled:](self->_bccField, "setEnabled:", v7);
    -[MFMailComposeView fromField](self, "fromField");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showLoadingState:", v4);

    -[MFMailComposeView multiField](self, "multiField");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showLoadingState:", v4);

  }
}

- (BOOL)isLoadingFromAddress
{
  return (*((unsigned __int8 *)self + 784) >> 4) & 1;
}

- (void)setReplyToHME:(BOOL)a3
{
  char v3;
  char v5;
  _BOOL8 v6;

  v3 = *((_BYTE *)self + 784);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 32;
    else
      v5 = 0;
    *((_BYTE *)self + 784) = v3 & 0xDF | v5;
    v6 = !a3;
    -[CNComposeRecipientTextView setEnabled:](self->_toField, "setEnabled:", v6);
    -[CNComposeRecipientTextView setEnabled:](self->_ccField, "setEnabled:", v6);
    -[CNComposeRecipientTextView setEnabled:](self->_bccField, "setEnabled:", v6);
    -[MFComposeFromView setUserInteractionEnabled:](self->_fromField, "setUserInteractionEnabled:", v6);
    -[MFComposeMultiView setUserInteractionEnabled:](self->_multiField, "setUserInteractionEnabled:", (*((_BYTE *)self + 784) & 0x20) == 0);
  }
}

- (BOOL)isReplyToHME
{
  return (*((unsigned __int8 *)self + 784) >> 5) & 1;
}

- (void)setQuickReply:(BOOL)a3
{
  char v3;
  _BOOL8 v4;
  char v6;

  v3 = *((_BYTE *)self + 785);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 64;
    else
      v6 = 0;
    *((_BYTE *)self + 785) = v3 & 0xBF | v6;
    -[MFMailComposeToField setHidden:](self->_toField, "setHidden:");
    -[MFMailComposeRecipientTextView setHidden:](self->_ccField, "setHidden:", v4);
    -[MFMailComposeRecipientTextView setHidden:](self->_bccField, "setHidden:", v4);
    -[MFComposeFromView setHidden:](self->_fromField, "setHidden:", v4);
    -[MFComposeMultiView setHidden:](self->_multiField, "setHidden:", v4);
    -[MFComposeWebView setIsQuickReply:](self->_webView, "setIsQuickReply:", v4);
  }
}

- (BOOL)isQuickReply
{
  return (*((unsigned __int8 *)self + 785) >> 6) & 1;
}

- (void)_createCCAndBCCFieldIfNeededAndCompleteSetup:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  MFMailComposeRecipientTextView *v9;
  MFMailComposeRecipientTextView *ccField;
  MFMailComposeRecipientTextView *v11;
  MFMailComposeRecipientTextView *bccField;
  MFMailComposeRecipientTextView *v13;
  void *v14;
  void *v15;
  void *v16;
  MFMailComposeRecipientTextView *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  id v22;
  id v23;

  v3 = a3;
  if (self->_ccField)
  {
    if (!a3)
      return;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
    -[MFMailComposeView frame](self, "frame");
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
    v8 = v7;
    v9 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeRecipientTextView alloc], "initWithFrame:dragDropDelegate:", self, 0.0, 0.0, v6, v7);
    ccField = self->_ccField;
    self->_ccField = v9;

    -[MFMailComposeRecipientTextView setAccessibilityIdentifier:](self->_ccField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B10]);
    -[MFMailComposeRecipientTextView setDelegate:](self->_ccField, "setDelegate:", WeakRetained);
    v11 = -[CNComposeRecipientTextView initWithFrame:dragDropDelegate:]([MFMailComposeRecipientTextView alloc], "initWithFrame:dragDropDelegate:", self, 0.0, 0.0, v6, v8);
    bccField = self->_bccField;
    self->_bccField = v11;

    -[MFMailComposeRecipientTextView setAccessibilityIdentifier:](self->_bccField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B00]);
    -[MFMailComposeRecipientTextView setDelegate:](self->_bccField, "setDelegate:", WeakRetained);

    if (!v3)
      return;
  }
  if (!self->_completedCCAndBCCFieldSetup)
  {
    self->_completedCCAndBCCFieldSetup = 1;
    v13 = self->_ccField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CC"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cc:"), &stru_1E5A6A588, CFSTR("Main"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeView _setupField:withLabel:navTitle:](self, "_setupField:withLabel:navTitle:", v13, v14, v16);

    v17 = self->_bccField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BCC"), &stru_1E5A6A588, CFSTR("Main"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Bcc:"), &stru_1E5A6A588, CFSTR("Main"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeView _setupField:withLabel:navTitle:](self, "_setupField:withLabel:navTitle:", v17, v18, v20);

  }
}

- (void)_createImageSizeFieldIfNeededAndAddSubview:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  MFComposeImageSizeView *v8;
  MFComposeImageSizeView *imageSizeField;
  void *v10;

  v3 = a3;
  if (self->_imageSizeField)
  {
    if (!a3)
      return;
  }
  else
  {
    -[MFMailComposeView frame](self, "frame");
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
    v8 = -[MFComposeImageSizeView initWithFrame:]([MFComposeImageSizeView alloc], "initWithFrame:", 0.0, 0.0, v6, v7);
    imageSizeField = self->_imageSizeField;
    self->_imageSizeField = v8;

    -[MFComposeImageSizeView setAutoresizingMask:](self->_imageSizeField, "setAutoresizingMask:", 2);
    -[MFComposeImageSizeView setAccessibilityIdentifier:](self->_imageSizeField, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B38]);
    if (!v3)
      return;
  }
  -[MFComposeImageSizeView superview](self->_imageSizeField, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[UIView addSubview:](self->_headerView, "addSubview:", self->_imageSizeField);
}

- (void)_multiFieldClicked
{
  -[MFMailComposeView _createCCAndBCCFieldIfNeededAndCompleteSetup:](self, "_createCCAndBCCFieldIfNeededAndCompleteSetup:", 1);
  -[CNComposeRecipientTextView becomeFirstResponder](self->_ccField, "becomeFirstResponder");
}

- (void)_setupField:(id)a3 withLabel:(id)a4 navTitle:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v11, "setAutoresizingMask:", 2);
  objc_msgSend(v11, "setLabel:", v8);
  objc_msgSend(v11, "setNavTitle:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
  objc_msgSend(v11, "setDelegate:", WeakRetained);

  objc_msgSend(v11, "setIndicatesUnsafeRecipientsWhenCollapsed:", 1);
  -[MFMailComposeView _addHoverEffectToField:](self, "_addHoverEffectToField:", v11);
  -[UIView addSubview:](self->_headerView, "addSubview:", v11);

}

- (void)_updateFromField
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if (objc_msgSend(WeakRetained, "canShowFromField") && (*((_BYTE *)self + 784) & 4) == 0)
  {
    objc_msgSend(WeakRetained, "sendingEmailAddressIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && objc_msgSend(WeakRetained, "isAddressHideMyEmail:", v3))
    {
      -[MFComposeFromView setSelectedAddressToHME:](self->_fromField, "setSelectedAddressToHME:", v3);
    }
    else
    {
      v4 = v3;
      objc_msgSend(v4, "emailAddressValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "simpleAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(v4, "stringValue");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      -[MFComposeFromView setSelectedAddress:](self->_fromField, "setSelectedAddress:", v9);
    }

  }
}

- (void)_updateMultiField
{
  id WeakRetained;
  int v4;
  MFMailComposeRecipientTextView *v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  MFMailComposeRecipientTextView *v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  MFComposeFromView *v13;
  double v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v4 = objc_msgSend(WeakRetained, "canShowFromField");
  v5 = self->_ccField;
  -[MFMailComposeRecipientTextView alpha](v5, "alpha");
  if (v6 == 0.0)
  {
    v8 = 0;
  }
  else
  {
    -[MFMailComposeRecipientTextView superview](v5, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  v9 = self->_bccField;
  -[MFMailComposeRecipientTextView alpha](v9, "alpha");
  if (v10 == 0.0)
  {
    v12 = 0;
  }
  else
  {
    -[MFMailComposeRecipientTextView superview](v9, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  v13 = self->_fromField;
  -[MFComposeFromView alpha](v13, "alpha");
  if (v14 == 0.0)
  {
    v16 = 0;
  }
  else
  {
    -[MFComposeFromView superview](v13, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

  }
  v17 = v4 ^ 1;
  if (!v8 && !v12 && !v16 && (v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CC/BCC/FROM"), &stru_1E5A6A588, CFSTR("Main"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!v8 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CC/BCC"), &stru_1E5A6A588, CFSTR("Main"));
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if ((v4 & 1) != 0)
    {
      v20 = 0;
      goto LABEL_36;
    }
    goto LABEL_26;
  }
  if ((((v16 || v12) | v17) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BCC/FROM"), &stru_1E5A6A588, CFSTR("Main"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((((v16 || v8) | v17) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CC/FROM"), &stru_1E5A6A588, CFSTR("Main"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

    if (v4)
      goto LABEL_24;
    goto LABEL_26;
  }
  v31 = 0;
  if (v4)
  {
LABEL_24:
    objc_msgSend(WeakRetained, "sendingEmailAddressIfExists");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "emailAddressValue");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "simpleAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v21, "stringValue");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v25;
    v26 = v21;
LABEL_34:

    goto LABEL_35;
  }
LABEL_26:
  -[CNComposeRecipientTextView addresses](self->_bccField, "addresses");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count") == 1)
  {
    objc_msgSend(v26, "objectAtIndex:", 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "emailAddressValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(v22, "stringValue");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v29;

    v21 = v22;
    goto LABEL_34;
  }
  v20 = 0;
LABEL_35:

LABEL_36:
  -[MFComposeMultiView setLabel:](self->_multiField, "setLabel:", v31);
  if ((*((_BYTE *)self + 784) & 4) == 0)
    -[MFComposeMultiView setAccountDescription:](self->_multiField, "setAccountDescription:", v20);
  if (objc_msgSend(WeakRetained, "canShowImageSizeField"))
  {
    if (objc_msgSend(WeakRetained, "canShowImageSizeField"))
    {
      objc_msgSend(WeakRetained, "currentScaleImageSize");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    -[MFComposeMultiView setImageSizeDescription:](self->_multiField, "setImageSizeDescription:", v30);
    -[MFComposeMultiView setShowsImageSize:](self->_multiField, "setShowsImageSize:", 1);

  }
  else
  {
    -[MFComposeMultiView setShowsImageSize:](self->_multiField, "setShowsImageSize:", 0);
  }
  -[MFComposeMultiView setNeedsLayout](self->_multiField, "setNeedsLayout");

}

- (void)_adjustHeaderFieldsPreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  MFComposeFromView *fromField;
  MFComposeSubjectView *subjectField;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13628], "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  -[MFMailComposeView bounds](self, "bounds");
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "preferredHeaderHeight");
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((*((_BYTE *)self + 785) & 0x40) == 0)
  {
    fromField = self->_fromField;
    v22[0] = self->_toField;
    v22[1] = fromField;
    subjectField = self->_subjectField;
    v22[2] = self->_multiField;
    v22[3] = subjectField;
    v22[4] = self->_webContentVariationField;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);

    objc_msgSend(v8, "ef_addOptionalObject:", self->_ccField);
    objc_msgSend(v8, "ef_addOptionalObject:", self->_bccField);
    objc_msgSend(v8, "ef_addOptionalObject:", self->_imageSizeField);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MFMailComposeView _layoutSubviews:changingView:toSize:](self, "_layoutSubviews:changingView:toSize:", 0, v16, v5, v7, (_QWORD)v17);
        objc_msgSend(v16, "refreshPreferredContentSize");
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)_presentDelayedPopover
{
  NSInvocation *delayedPopoverInvocation;

  -[NSInvocation invoke](self->_delayedPopoverInvocation, "invoke");
  delayedPopoverInvocation = self->_delayedPopoverInvocation;
  self->_delayedPopoverInvocation = 0;

}

- (void)_cancelDelayedPopover
{
  NSInvocation *delayedPopoverInvocation;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__presentDelayedPopover, 0);
  delayedPopoverInvocation = self->_delayedPopoverInvocation;
  self->_delayedPopoverInvocation = 0;

}

- (BOOL)dragSource:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (id)dragSource:(id)a3 draggableItemsAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a4.y;
  x = a4.x;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeView _setDragging:](self, "_setDragging:", 1);
    objc_msgSend(v10, "hitTest:withEvent:", 0, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v12, "setSelected:", 1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v12, "recipient");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v10, "selectedAtoms");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v23;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v15);
            v19 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v18);
            if (v19 != v12)
            {
              objc_msgSend(v19, "recipient");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v20);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dragSource:(id)a3 targetedPreviewForDraggableItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "sourceView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v6, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dragPreviewForDraggedItem:withContainer:", v7, self->_bodyScroller);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dragSource:(id)a3 localObjectForDraggableItem:(id)a4
{
  return a4;
}

- (id)dragSource:(id)a3 suggestedNameForDraggableItem:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dragSource:(id)a3 willEndInteractionWithItems:(id)a4 dropOperation:(unint64_t)a5
{
  -[MFMailComposeView _setDragging:](self, "_setDragging:", 0, a4, a5);
}

- (void)_setDragging:(BOOL)a3
{
  if (self->_isDragging != a3)
  {
    self->_isDragging = a3;
    if (a3)
    {
      -[MFMailComposeView _updateOptionalHeaderVisibilityForceVisible:](self, "_updateOptionalHeaderVisibilityForceVisible:", 1);
      -[MFMailComposeView setRecipientFieldsEditable:animated:](self, "setRecipientFieldsEditable:animated:", 1, 1);
    }
  }
}

- (void)dropTarget:(id)a3 dragEnteredAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  objc_msgSend(v10, "targetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MFMailComposeView _setDragging:](self, "_setDragging:", 1);
    objc_msgSend(v10, "targetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dragEnteredAtPoint:", x, y);

  }
}

- (void)dropTarget:(id)a3 dragDidMoveToPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  objc_msgSend(v10, "targetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MFMailComposeView _setDragging:](self, "_setDragging:", 1);
    objc_msgSend(v10, "targetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dragMovedToPoint:", x, y);

  }
}

- (void)dropTargetDragExited:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "targetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MFMailComposeView _setDragging:](self, "_setDragging:", 0);
    objc_msgSend(v7, "targetView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dragExited");

  }
}

- (void)dropTarget:(id)a3 didDropDragItems:(id)a4 atPoint:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  MFMailComposeView *v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "targetView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "targetView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v13 = MEMORY[0x1E0C809B0];
    v31[3] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke;
    aBlock[3] = &unk_1E5A68C78;
    v30 = v31;
    v14 = v8;
    v26 = v14;
    v27 = self;
    v15 = v12;
    v28 = v15;
    v16 = v11;
    v29 = v16;
    v17 = _Block_copy(aBlock);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2;
    v21[3] = &unk_1E5A68D68;
    v21[4] = self;
    v18 = v16;
    v22 = v18;
    v23 = v15;
    v24 = v17;
    v19 = v17;
    v20 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

    _Block_object_dispose(v31, 8);
  }

}

uint64_t __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 == result)
    return objc_msgSend(*(id *)(a1 + 40), "_dropItems:recipientTextView:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v3 = a2;
  objc_msgSend(v3, "localObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "localObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__6;
    v41 = __Block_byref_object_dispose__6;
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_107;
    v34[3] = &unk_1E5A68CC8;
    v8 = v6;
    v35 = v8;
    v36 = &v37;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v34);
    v9 = (void *)v38[5];
    if (v9)
      objc_msgSend(v9, "removeRecipient:", v8);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    objc_msgSend(v3, "itemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canLoadObjectOfClass:", objc_opt_class());

    if (v11)
    {
      objc_msgSend(v3, "itemProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_3;
      v31[3] = &unk_1E5A68CF0;
      v32 = *(id *)(a1 + 48);
      v33 = *(id *)(a1 + 56);
      v14 = (id)objc_msgSend(v12, "loadObjectOfClass:completionHandler:", v13, v31);

      v8 = v32;
    }
    else
    {
      objc_msgSend(v3, "itemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "canLoadObjectOfClass:", objc_opt_class());

      if (v16)
      {
        objc_msgSend(v3, "itemProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_class();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_4;
        v28[3] = &unk_1E5A68CF0;
        v29 = *(id *)(a1 + 48);
        v30 = *(id *)(a1 + 56);
        v19 = (id)objc_msgSend(v17, "loadObjectOfClass:completionHandler:", v18, v28);

        v8 = v29;
      }
      else
      {
        objc_msgSend(v3, "itemProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "canLoadObjectOfClass:", objc_opt_class());

        if (!v21)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          goto LABEL_12;
        }
        objc_msgSend(v3, "itemProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_class();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_6;
        v25[3] = &unk_1E5A68D40;
        v26 = *(id *)(a1 + 48);
        v27 = *(id *)(a1 + 56);
        v24 = (id)objc_msgSend(v22, "loadObjectOfClass:completionHandler:", v23, v25);

        v8 = v26;
      }
    }
  }

LABEL_12:
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_107(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a2;
  objc_msgSend(v6, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2_108;
  v11[3] = &unk_1E5A68CA0;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v14 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_2_108(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(a1 + 32) == a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
  }
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "draggingContacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_5;
      v8[3] = &unk_1E5A68D18;
      v9 = *(id *)(a1 + 32);
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C974A8], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13690]), "initWithContact:address:kind:", v4, v7, 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
}

void __57__MFMailComposeView_dropTarget_didDropDragItems_atPoint___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_dropItems:(id)a3 recipientTextView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MFMailComposeView *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__MFMailComposeView__dropItems_recipientTextView___block_invoke;
  v17[3] = &unk_1E5A65608;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __50__MFMailComposeView__dropItems_recipientTextView___block_invoke_2;
  v13[3] = &unk_1E5A65BD8;
  v14 = v10;
  v15 = v7;
  v16 = self;
  v11 = v7;
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __50__MFMailComposeView__dropItems_recipientTextView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __50__MFMailComposeView__dropItems_recipientTextView___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "dropItems:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "dragExited");
  return objc_msgSend(*(id *)(a1 + 48), "_setDragging:", 0);
}

- (BOOL)dropTarget:(id)a3 shouldAddDroppedContactsToTargetView:(id)a4 forSession:(id)a5
{
  return 1;
}

- (id)sendingAddressForDropTarget:(id)a3 withTargetView:(id)a4
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "sendingEmailAddressIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  *((_BYTE *)self + 784) |= 0x40u;
  if (-[UIScrollView isDecelerating](self->_bodyScroller, "isDecelerating", a3, a4))
  {
    -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
    -[UIScrollView setContentOffset:animated:](self->_bodyScroller, "setContentOffset:animated:", 0);
  }
  if (-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover"))
    -[MFMailComposeView _cancelDelayedPopover](self, "_cancelDelayedPopover");
}

- (id)_focusedRecipientView
{
  MFMailComposeRecipientTextView *ccField;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  _BOOL4 v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  ccField = self->_ccField;
  v19[0] = self->_toField;
  v19[1] = ccField;
  v19[2] = self->_bccField;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "textView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isFirstResponder"))
        {

LABEL_13:
          v13 = v8;
          goto LABEL_14;
        }
        objc_msgSend(v8, "textView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
        v12 = v10 == WeakRetained;

        if (v12)
          goto LABEL_13;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      v13 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  return v13;
}

- (void)_finishUpRotationToInterfaceOrientation:(int64_t)a3
{
  -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 0);
  -[MFMailComposeView _adjustScrollerForBottomView](self, "_adjustScrollerForBottomView");
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  *((_BYTE *)self + 784) &= ~0x40u;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeView;
  -[UITransitionView layoutSubviews](&v4, sel_layoutSubviews);
  -[MFMailComposeView _adjustScrollerContentSize](self, "_adjustScrollerContentSize");
  -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 0);
  -[MFMailComposeView _focusedRecipientView](self, "_focusedRecipientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reflow");

  -[MFMailComposeView _layoutLoadingView](self, "_layoutLoadingView");
}

- (void)_layoutLoadingView
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[MFMailComposeView bodyScroller](self, "bodyScroller");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedContentInset");
  v4 = v3;
  objc_msgSend(v7, "bounds");
  -[MFMessageContentLoadingView setFrame:](self->_loadingView, "setFrame:", v5 + 0.0, v4 + v6);

}

- (void)_adjustScrollerContentSize
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1AB96A000, log, OS_LOG_TYPE_DEBUG, "previous web view scroll inset: %{public}@, current web view scroll inset%{public}@", buf, 0x16u);

}

- (void)_adjustScrollerForBottomView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  UIScrollView *bodyScroller;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[MFMailComposeView _normalizeBodyFieldFrame](self, "_normalizeBodyFieldFrame");
  -[MFMailComposeView _adjustScrollerContentSize](self, "_adjustScrollerContentSize");
  -[UIScrollView setContentOffset:](self->_bodyScroller, "setContentOffset:", v4, v6);
  -[MFMailComposeView firstResponder](self, "firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MFMailComposeView firstResponder](self, "firstResponder");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v28;
      bodyScroller = self->_bodyScroller;
      objc_msgSend(v8, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v8, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView convertRect:fromView:](bodyScroller, "convertRect:fromView:", v18, v11, v13, v15, v17);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      -[UIScrollView contentInset](self->_bodyScroller, "contentInset");
      -[UIScrollView scrollRectToVisible:animated:](self->_bodyScroller, "scrollRectToVisible:animated:", 1, v20, v22 + v27, v24, v26);

    }
  }
}

- (BOOL)shouldScrollLastChangedRecipientViewToTop
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
    return !-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover");
  else
    return 0;
}

- (void)_updateKeyboardIntersection:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  char v24;
  UIView *headerView;
  double v26;
  UIScrollView *bodyScroller;
  double v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFMailComposeView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateSpace");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeView bounds](self, "bounds");
  -[MFMailComposeView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v31);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v31, "convertRect:toCoordinateSpace:", v31, x, y, width, height);
  v35.origin.x = v18;
  v35.origin.y = v19;
  v35.size.width = v20;
  v35.size.height = v21;
  v32.origin.x = v11;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v17;
  v33 = CGRectIntersection(v32, v35);
  v22 = v33.size.height;
  -[MFMailComposeView composeWebView](self, "composeWebView", v33.origin.x, v33.origin.y, v33.size.width);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "_contentViewIsFirstResponder"))
  {
    v24 = *((_BYTE *)self + 785);

    if ((v24 & 0x40) == 0)
    {
      headerView = self->_headerView;
      -[UIView bounds](headerView, "bounds");
      -[UIView convertRect:toView:](headerView, "convertRect:toView:", self);
      v26 = v17 - height - CGRectGetMaxY(v34);
      if (v26 < 40.0)
      {
        bodyScroller = self->_bodyScroller;
        -[UIScrollView contentOffset](bodyScroller, "contentOffset");
        v29 = v28;
        -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
        -[UIScrollView setContentOffset:](bodyScroller, "setContentOffset:", v29, fabs(v26) + v30);
      }
    }
  }
  else
  {

  }
  if (self->_keyboardIntersection != v22)
  {
    self->_keyboardIntersection = v22;
    -[MFMailComposeView _adjustScrollerForBottomView](self, "_adjustScrollerForBottomView");
    -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 0);
  }

}

- (void)automaticKeyboardFinishedAppearing:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[MFMailComposeView _updateKeyboardIntersection:](self, "_updateKeyboardIntersection:", v7, v9, v11, v13);
}

- (void)automaticKeyboardFinishedDisappearing:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[MFMailComposeView _beginPreventingScrollingToRevealSelection](self, "_beginPreventingScrollingToRevealSelection");
  -[MFMailComposeView _updateKeyboardIntersection:](self, "_updateKeyboardIntersection:", v7, v9, v11, v13);
  -[MFMailComposeView _endPreventingScrollingToRevealSelection](self, "_endPreventingScrollingToRevealSelection");

}

- (void)setKeyboardVisible:(BOOL)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  char IsAutomaticAppearanceEnabled;

  v4 = a3;
  IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  if (v4)
  {
    if ((IsAutomaticAppearanceEnabled & 1) == 0)
      UIKeyboardForceOrderInAutomaticAnimated();
  }
  else if ((IsAutomaticAppearanceEnabled & 1) == 0)
  {
    UIKeyboardForceOrderOutAutomaticAnimated();
  }
}

- (BOOL)isKeyboardVisible
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMinimized") & 1) != 0)
    v3 = 0;
  else
    v3 = UIKeyboardAutomaticIsOnScreen();

  return v3;
}

- (double)_heightForBottomView
{
  double keyboardIntersection;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  keyboardIntersection = self->_keyboardIntersection;
  -[MFMailComposeView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  -[MFMailComposeView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[MFMailComposeView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromWindow:", 0, 0.0, v6, v9, 100.0);
  -[MFMailComposeView convertRect:fromView:](self, "convertRect:fromView:", 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[MFMailComposeView bounds](self, "bounds");
  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  v21 = CGRectIntersection(v20, v22);
  return keyboardIntersection + v21.size.height;
}

- (void)saveFirstResponder
{
  -[MFMailComposeView saveFirstResponderWithKeyboardPinning:](self, "saveFirstResponderWithKeyboardPinning:", 0);
}

- (void)saveFirstResponderWithKeyboardPinning:(BOOL)a3
{
  _BOOL4 v3;
  UIResponder **p_pinningResponder;
  id WeakRetained;
  id obj;

  v3 = a3;
  -[MFMailComposeView firstResponder](self, "firstResponder");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_firstResponderBeforeSheet, obj);
  if (v3)
  {
    p_pinningResponder = &self->_pinningResponder;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pinningResponder);
    if (WeakRetained != obj)
    {
      objc_msgSend(WeakRetained, "_endPinningInputViews");
      objc_storeWeak((id *)p_pinningResponder, obj);
      objc_msgSend(obj, "_beginPinningInputViews");
    }

  }
}

- (void)restoreFirstResponder
{
  -[MFMailComposeView restoreFirstResponderWithKeyboardPinning:](self, "restoreFirstResponderWithKeyboardPinning:", 0);
  objc_storeWeak((id *)&self->_firstResponderBeforeSheet, 0);
}

- (void)restoreFirstResponderWithKeyboardPinning:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  UIResponder **p_pinningResponder;
  id v7;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponderBeforeSheet);
  objc_msgSend(WeakRetained, "becomeFirstResponder");

  if (v3)
  {
    p_pinningResponder = &self->_pinningResponder;
    v7 = objc_loadWeakRetained((id *)p_pinningResponder);
    objc_msgSend(v7, "_endPinningInputViews");

    objc_storeWeak((id *)p_pinningResponder, 0);
  }
}

- (void)focusFirstResponderAfterRecipientView:(id)a3
{
  MFMailComposeToField *v4;
  id *p_ccField;
  MFMailComposeRecipientTextView *ccField;
  MFMailComposeRecipientTextView *bccField;
  MFMailComposeRecipientTextView *v8;
  double v9;
  double v10;
  void *v11;
  MFMailComposeToField *v12;

  v4 = (MFMailComposeToField *)a3;
  p_ccField = (id *)&self->_ccField;
  ccField = self->_ccField;
  v12 = v4;
  if (self->_toField == v4)
  {
    v8 = ccField;
    -[MFMailComposeRecipientTextView alpha](v8, "alpha");
    if (v9 != 0.0)
    {
LABEL_8:
      -[MFMailComposeRecipientTextView superview](v8, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
LABEL_12:
        objc_msgSend(*p_ccField, "becomeFirstResponder");
        goto LABEL_13;
      }
LABEL_11:
      p_ccField = (id *)&self->_subjectField;
      goto LABEL_12;
    }
LABEL_10:

    goto LABEL_11;
  }
  p_ccField = (id *)&self->_bccField;
  bccField = self->_bccField;
  if (ccField == (MFMailComposeRecipientTextView *)v4)
  {
    v8 = bccField;
    -[MFMailComposeRecipientTextView alpha](v8, "alpha");
    if (v10 != 0.0)
      goto LABEL_8;
    goto LABEL_10;
  }
  if (bccField == (MFMailComposeRecipientTextView *)v4)
    goto LABEL_11;
LABEL_13:

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
  v6 = v5;
  -[UIScrollView _effectiveContentInset](self->_bodyScroller, "_effectiveContentInset");
  -[UIScrollView setContentOffset:animated:](self->_bodyScroller, "setContentOffset:animated:", v3, v6, -v7);
}

- (void)setScrollsToTop:(BOOL)a3
{
  -[UIScrollView setScrollsToTop:](self->_bodyScroller, "setScrollsToTop:", a3);
}

- (void)scrollToRecipientTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  char v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "isDescendantOfView:", self) & 1) != 0)
  {
    -[MFMailComposeView navigationBarDelegate](self, "navigationBarDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "getPrefersLargeTitles");
    objc_msgSend(v10, "setPrefersLargeTitles:", 0);
    v12 = (void *)MEMORY[0x1E0CD28B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke;
    v15[3] = &unk_1E5A68DB8;
    v15[4] = self;
    v16 = v8;
    v19 = a4;
    v13 = v10;
    v17 = v13;
    v20 = v11;
    v18 = v9;
    objc_msgSend(v12, "setCompletionBlock:", v15);

  }
  else
  {
    +[MFMailComposeView log](MFMailComposeView, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Unable to scroll to unrelated recipient view.", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

void __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  _QWORD v20[7];

  objc_msgSend(*(id *)(a1 + 32), "bodyScroller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "bodyScroller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertPoint:toView:", v7, v4, v6);
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "bodyScroller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_effectiveContentInset");
  v12 = v11;

  v13 = v9 - v12;
  if (*(_BYTE *)(a1 + 64))
    v14 = 0.200000003;
  else
    v14 = 0.0;
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_2;
  v20[3] = &unk_1E5A660A8;
  v20[4] = *(_QWORD *)(a1 + 32);
  v20[5] = 0;
  *(double *)&v20[6] = v13;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_3;
  v16[3] = &unk_1E5A68D90;
  v17 = *(id *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 65);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v15, "animateWithDuration:animations:completion:", v20, v16, v14);

}

void __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "bodyScroller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

uint64_t __67__MFMailComposeView_scrollToRecipientTextView_animated_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPrefersLargeTitles:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)layoutForChangedComposeHeaderView:(id)a3 size:(CGSize)a4
{
  -[MFMailComposeView _layoutSubviews:changingView:toSize:](self, "_layoutSubviews:changingView:toSize:", (*((_BYTE *)self + 785) & 2) == 0, a3, a4.width, a4.height);
}

- (void)viewDidBecomeFirstResponder:(id)a3
{
  MFMailComposeToField *v4;
  _BOOL8 v5;
  MFMailComposeToField *v6;
  _QWORD v7[4];
  MFMailComposeToField *v8;
  MFMailComposeView *v9;

  v4 = (MFMailComposeToField *)a3;
  if (self->_toField == v4
    && -[MFMailComposeView _shouldShowCorecipientsTableView](self, "_shouldShowCorecipientsTableView"))
  {
    -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);
  }
  v5 = (MFMailComposeToField *)self->_ccField == v4 || self->_bccField == (MFMailComposeRecipientTextView *)v4;
  -[MFMailComposeView _updateOptionalHeaderVisibilityForceVisible:](self, "_updateOptionalHeaderVisibilityForceVisible:", v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MFMailComposeView_viewDidBecomeFirstResponder___block_invoke;
  v7[3] = &unk_1E5A67A30;
  v6 = v4;
  v8 = v6;
  v9 = self;
  -[MFMailComposeView _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", v7);

}

void __49__MFMailComposeView_viewDidBecomeFirstResponder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  const __CFString *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD **)(a1 + 40);
  v7 = v3;
  if (v4 == v5[68])
  {
    v6 = CFSTR("to");
    goto LABEL_9;
  }
  if (v4 == v5[69])
  {
    v6 = CFSTR("cc");
    goto LABEL_9;
  }
  if (v4 == v5[70])
  {
    v6 = CFSTR("bcc");
    goto LABEL_9;
  }
  if (v4 == v5[74])
  {
    v6 = CFSTR("subject");
LABEL_9:
    objc_msgSend(v3, "setFocusedField:", v6);
  }

}

- (void)updateOptionalHeaderVisibility
{
  -[MFMailComposeView _updateOptionalHeaderVisibilityForceVisible:](self, "_updateOptionalHeaderVisibilityForceVisible:", 0);
}

- (void)_updateOptionalHeaderVisibilityForceVisible:(BOOL)a3
{
  char *v4;
  void *v5;
  int v6;
  char v7;
  char v8;
  void *v9;
  id WeakRetained;

  if (a3)
  {
    v4 = (char *)self + 785;
    if ((*((_BYTE *)self + 785) & 8) == 0)
      goto LABEL_10;
  }
  else
  {
    -[CNComposeRecipientTextView addresses](self->_ccField, "addresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") || self->_isDragging)
    {
      v6 = 1;
    }
    else
    {
      -[CNComposeRecipientTextView addresses](self->_bccField, "addresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
        v6 = objc_msgSend(WeakRetained, "bccAddressesDirtied");

      }
      else
      {
        v6 = 0;
      }

    }
    v4 = (char *)self + 785;
    v7 = *((_BYTE *)self + 785);
    if (((v6 ^ ((v7 & 8) == 0)) & 1) == 0)
    {
      if (!v6)
      {
        v8 = 0;
        goto LABEL_12;
      }
LABEL_10:
      -[MFMailComposeView _createCCAndBCCFieldIfNeededAndCompleteSetup:](self, "_createCCAndBCCFieldIfNeededAndCompleteSetup:", 1);
      v7 = *v4;
      v8 = 8;
LABEL_12:
      *v4 = v7 & 0xF7 | v8;
      -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", (*((_BYTE *)self + 785) & 2) == 0);
    }
  }
}

- (void)menuDidHide
{
  void *v3;
  int v4;

  -[MFMailComposeView composeWebView](self, "composeWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
    -[MFMailComposeView _updateQuoteLevelMenu](self, "_updateQuoteLevelMenu");
}

- (id)recipientTextViewForComposeMultiView:(id)a3
{
  return self->_ccField;
}

- (BOOL)isSearching
{
  return self->_activeRecipientView != 0;
}

- (void)selectNextSearchResult
{
  -[CNAutocompleteResultsTableViewController selectNextSearchResult](self->_searchViewController, "selectNextSearchResult");
}

- (void)selectPreviousSearchResult
{
  -[CNAutocompleteResultsTableViewController selectPreviousSearchResult](self->_searchViewController, "selectPreviousSearchResult");
}

- (BOOL)chooseSelectedSearchResult
{
  return -[CNAutocompleteResultsTableViewController confirmSelectedRecipient](self->_searchViewController, "confirmSelectedRecipient");
}

- (UITableView)searchTableView
{
  void *v2;
  void *v3;

  -[MFMailComposeView searchViewController](self, "searchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITableView *)v3;
}

- (BOOL)presentSearchResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;

  -[MFMailComposeView searchViewController](self, "searchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 && !self->_activeRecipientView)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MFMailComposeViewDidSortSearchResults"), 0);

    objc_storeStrong((id *)&self->_activeRecipientView, self->_lastChangedRecipientView);
    -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
    self->_offsetBeforeSearch = v7;
    -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 0);
  }
  return v5 != 0;
}

- (void)dismissSearchResults
{
  MFMailComposeRecipientTextView *activeRecipientView;

  activeRecipientView = self->_activeRecipientView;
  if (activeRecipientView)
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:", activeRecipientView, 1, 1);
}

- (BOOL)presentSearchResults:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[MFMailComposeView searchViewController](self, "searchViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecipients:", v4);

    v6 = -[MFMailComposeView presentSearchResults](self, "presentSearchResults");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)beginSearchForText:(id)a3 recipientView:(id)a4
{
  id v6;
  MFMailComposeContactsSearchController *v7;
  MFMailComposeContactsSearchController *searchController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MFMailComposeContactsSearchController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_storeStrong((id *)&self->_lastChangedRecipientView, a4);
  if (!self->_searchController)
  {
    v7 = objc_alloc_init(MFMailComposeContactsSearchController);
    searchController = self->_searchController;
    self->_searchController = v7;

    -[MFMailComposeContactsSearchController setDelegate:](self->_searchController, "setDelegate:", self);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView recipients](self->_toField, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  -[CNComposeRecipientTextView recipients](self->_ccField, "recipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  -[CNComposeRecipientTextView recipients](self->_bccField, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v12);

  v13 = self->_searchController;
  -[MFComposeSubjectView text](self->_subjectField, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeContactsSearchController searchWithString:enteredRecipients:title:](v13, "searchWithString:enteredRecipients:title:", v17, v9, v14);

  -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);

  -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);

}

- (void)cancelSearch
{
  -[MFMailComposeContactsSearchController cancelSearch](self->_searchController, "cancelSearch");
}

- (void)clearSearchForActiveRecipientView
{
  id v3;

  if (self->_activeRecipientView || self->_lastChangedRecipientView)
  {
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("_MFComposeRecipientTextViewSearchEnd"), self, 0);

  }
}

- (void)invalidateSearchResultRecipient:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[CNAutocompleteResultsTableViewController recipients](self->_searchViewController, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:", self->_activeRecipientView, 0, 0);
  else
    -[CNAutocompleteResultsTableViewController invalidateSearchResultRecipient:](self->_searchViewController, "invalidateSearchResultRecipient:", v6);

}

- (void)findCorecipientsWithRecipientView:(id)a3
{
  MFMailComposeContactsSearchController *v4;
  MFMailComposeContactsSearchController *searchController;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MFMailComposeView _userInterfaceConfigurationSupportsCorecipientsTableView](self, "_userInterfaceConfigurationSupportsCorecipientsTableView"))
  {
    if (!self->_searchController)
    {
      v4 = objc_alloc_init(MFMailComposeContactsSearchController);
      searchController = self->_searchController;
      self->_searchController = v4;

      -[MFMailComposeContactsSearchController setDelegate:](self->_searchController, "setDelegate:", self);
    }
    objc_msgSend(v7, "uncommentedAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      -[CNAutocompleteResultsTableViewController setDeferTableViewUpdates:](self->_corecipientsSearchViewController, "setDeferTableViewUpdates:", 1);
      -[CNAutocompleteResultsTableViewController setRecipients:](self->_corecipientsSearchViewController, "setRecipients:", 0);
      -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);
    }
    else
    {
      -[MFMailComposeContactsSearchController findCorecipientsWithRecipients:](self->_searchController, "findCorecipientsWithRecipients:", v6);
    }

  }
}

- (void)disambiguateRecipient:(id)a3 recipientView:(id)a4
{
  id v6;
  id v7;
  MFMailComposeContactsSearchController *v8;
  MFMailComposeContactsSearchController *searchController;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_searchController)
  {
    v8 = objc_alloc_init(MFMailComposeContactsSearchController);
    searchController = self->_searchController;
    self->_searchController = v8;

    -[MFMailComposeContactsSearchController setDelegate:](self->_searchController, "setDelegate:", self);
  }
  *((_BYTE *)self + 785) |= 4u;
  objc_storeStrong((id *)&self->_lastChangedRecipientView, a4);
  -[MFMailComposeView searchViewController](self, "searchViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateRecipients:disambiguatingRecipient:", v11, v6);

  -[MFMailComposeView presentSearchResults](self, "presentSearchResults");
}

- (void)dismissSearchResultsIfDisambiguating
{
  if ((*((_BYTE *)self + 785) & 4) != 0)
  {
    *((_BYTE *)self + 785) &= ~4u;
    -[MFMailComposeView dismissSearchResults](self, "dismissSearchResults");
  }
}

- (void)didIgnoreSearchResults
{
  -[MFMailComposeContactsSearchController didSelectRecipient:atIndex:](self->_searchController, "didSelectRecipient:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  MFMailComposeRecipientTextView *p_super;
  MFMailComposeToField *v12;
  id v13;
  CNAutocompleteResultsTableViewController *v14;

  v14 = (CNAutocompleteResultsTableViewController *)a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MFMailComposeContactsSearchController didSelectRecipient:atIndex:](self->_searchController, "didSelectRecipient:atIndex:", v9, a5);
      p_super = self->_activeRecipientView;
      if (self->_corecipientsSearchViewController == v14)
      {
        v12 = self->_toField;

        p_super = &v12->super;
      }
      v13 = v9;
      -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:", self->_activeRecipientView, 0, 1);
      -[MFMailComposeView setChangingRecipients:](self, "setChangingRecipients:", 1);
      -[MFMailComposeRecipientTextView addRecipient:](p_super, "addRecipient:", v13);
      -[MFMailComposeView setChangingRecipients:](self, "setChangingRecipients:", 0);

    }
  }

}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientView:showPersonCardForRecipient:", self->_activeRecipientView, v6);

}

- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MFMailComposeView searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRecipient:", v6);

}

- (id)sendingAccountProxyForComposeContactsSearchController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "sendingAccountProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)addressableGroupResultStyleForComposeContactsSearchController:(id)a3
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v4 = objc_msgSend(WeakRetained, "isCloudKitShare");

  return v4 ^ 1u;
}

- (void)composeContactsSearchController:(id)a3 didSortResults:(id)a4
{
  -[MFMailComposeView presentSearchResults:](self, "presentSearchResults:", a4);
}

- (void)composeContactsSearchController:(id)a3 finishedWithResults:(BOOL)a4
{
  if (!a4 && (self->_activeRecipientView || self->_lastChangedRecipientView))
    -[MFMailComposeView clearSearchForRecipientView:reflow:clear:](self, "clearSearchForRecipientView:reflow:clear:");
}

- (void)composeContactsSearchController:(id)a3 didFindCorecipients:(id)a4
{
  id v6;
  CNAutocompleteResultsTableViewController *v7;
  CNAutocompleteResultsTableViewController *corecipientsSearchViewController;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!self->_corecipientsSearchViewController)
  {
    v7 = (CNAutocompleteResultsTableViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13638]), "initWithStyle:", 0);
    corecipientsSearchViewController = self->_corecipientsSearchViewController;
    self->_corecipientsSearchViewController = v7;

    -[CNAutocompleteResultsTableViewController setDelegate:](self->_corecipientsSearchViewController, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultsTableViewController view](self->_corecipientsSearchViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 4)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 3);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  -[CNAutocompleteResultsTableViewController setDeferTableViewUpdates:](self->_corecipientsSearchViewController, "setDeferTableViewUpdates:", objc_msgSend(v6, "count") == 0);
  -[CNAutocompleteResultsTableViewController setRecipients:](self->_corecipientsSearchViewController, "setRecipients:", v6);
  -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);

}

- (void)clearSearchForRecipientView:(id)a3 reflow:(BOOL)a4 clear:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  MFMailComposeRecipientTextView *activeRecipientView;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  -[MFMailComposeContactsSearchController cancelSearch](self->_searchController, "cancelSearch");
  activeRecipientView = self->_activeRecipientView;
  self->_activeRecipientView = 0;

  if (v5)
    objc_msgSend(v9, "clearText");
  if (v6)
    objc_msgSend(v9, "reflow");
  -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 0);

}

- (void)parentWillClose
{
  *((_BYTE *)self + 784) |= 0x80u;
  -[CNComposeRecipientTextView parentWillClose](self->_toField, "parentWillClose");
  -[CNComposeRecipientTextView parentWillClose](self->_ccField, "parentWillClose");
  -[CNComposeRecipientTextView parentWillClose](self->_bccField, "parentWillClose");
}

- (void)parentDidClose
{
  -[CNComposeRecipientTextView parentDidClose](self->_toField, "parentDidClose");
  -[CNComposeRecipientTextView parentDidClose](self->_ccField, "parentDidClose");
  -[CNComposeRecipientTextView parentDidClose](self->_bccField, "parentDidClose");
}

- (void)didAppear
{
  *((_BYTE *)self + 785) |= 0x10u;
  -[UIScrollView flashScrollIndicators](self->_bodyScroller, "flashScrollIndicators");
  -[MFMailComposeView _createCCAndBCCFieldIfNeededAndCompleteSetup:](self, "_createCCAndBCCFieldIfNeededAndCompleteSetup:", 1);
}

- (void)willDisappear
{
  *((_BYTE *)self + 785) &= ~0x10u;
}

- (CGPoint)_headerViewOriginWithScrollViewOffsetCalculation
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIView origin](self->_headerView, "origin");
  v4 = v3;
  -[UIScrollView contentOffset](self->_bodyScroller, "contentOffset");
  if ((*((_BYTE *)self + 785) & 1) == 0)
  {
    if (v5 >= 0.0)
      v6 = v5;
    else
      v6 = 0.0;
    -[MFMailComposeView composeWebView](self, "composeWebView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    -[UIView frame](self->_headerView, "frame");
    v11 = v9 - v10;

    if (v6 <= v11)
      v5 = v6;
    else
      v5 = v11;
  }
  v12 = v4;
  result.y = v12;
  result.x = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
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
  void *v16;
  id v17;

  -[MFMailComposeView traitCollection](self, "traitCollection", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)layoutMarginsDidChange
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeView;
  -[MFMailComposeView layoutMarginsDidChange](&v17, sel_layoutMarginsDidChange);
  -[MFMailComposeView layoutMargins](self, "layoutMargins");
  -[UIView setLayoutMargins:](self->_headerView, "setLayoutMargins:");
  -[MFMailComposeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeView directionalLayoutMargins](self, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFMailComposeView safeAreaInsets](self, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeView setDisplayMetrics:](self, "setDisplayMetrics:", v16);

}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  UIView *headerView;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UIScrollView *v17;

  v4 = (UIScrollView *)a3;
  if ((*((_BYTE *)self + 785) & 0x40) == 0)
  {
    v17 = v4;
    headerView = self->_headerView;
    if (headerView && self->_bodyScroller == v17)
    {
      -[UIView frame](headerView, "frame");
      -[MFMailComposeView _headerViewOriginWithScrollViewOffsetCalculation](self, "_headerViewOriginWithScrollViewOffsetCalculation");
      v7 = v6;
      -[UIView setFrame:](self->_headerView, "setFrame:");
      if (!-[MFMailComposeView _presentsSearchResultsTableAsPopover](self, "_presentsSearchResultsTableAsPopover")
        && self->_searchViewController
        && self->_shadowView)
      {
        -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frame");
        v10 = v9;
        v12 = v11;
        v14 = v13;

        -[MFMailComposeView _searchResultsTable](self, "_searchResultsTable");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFrame:", v7, v10, v12, v14);

        -[UIView frame](self->_shadowView, "frame");
        -[UIView setFrame:](self->_shadowView, "setFrame:", v7);
      }
      -[MFMailComposeView _layoutFindPanelHostView](self, "_layoutFindPanelHostView");
    }
    -[MFMailComposeView composeWebView](self, "composeWebView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hideMakeLinkAccessoryButton");

    v4 = v17;
  }

}

- (void)_displayMetricsDidChange
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[MFMailComposeView displayMetrics](self, "displayMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingButtonMidlineOffset");
  v4 = v3;
  -[MFMailComposeView searchViewController](self, "searchViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailingButtonMidlineInsetFromLayoutMargin:", v4);

}

- (void)composeWebViewTextChanged:(id)a3
{
  id v4;

  -[MFMailComposeView composeViewDelegate](self, "composeViewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeViewBodyTextChanged:", self);

}

- (void)findNavigatorPanelDidChangeHeight:(double)a3
{
  self->_findPanelHeight = a3;
  -[MFMailComposeView _layoutSubviews:](self, "_layoutSubviews:", 1);
}

- (void)composeWebView:(id)a3 didChangeHeight:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[MFMailComposeView composeViewDelegate](self, "composeViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeWebView:didChangeHeight:", v7, a4);

  }
}

- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[MFMailComposeView composeViewDelegate](self, "composeViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeWebView:composeBodyIsEmpty:", v7, v4);

  }
}

- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[MFMailComposeView composeViewDelegate](self, "composeViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeWebView:hasActiveWritingToolsSession:", v7, v4);

}

- (void)composeFromView:(id)a3 didSelectAddress:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MFMailComposeView composeViewDelegate](self, "composeViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSendingEmailAddress:", v6);

}

- (void)_performBlockWithStrongComposeCoordinator:(id)a3
{
  id WeakRetained;
  void (**v5)(id, id);

  v5 = (void (**)(id, id))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
  if (WeakRetained)
    v5[2](v5, WeakRetained);

}

- (MFMailComposeViewDelegate)composeViewDelegate
{
  return (MFMailComposeViewDelegate *)objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
}

- (MFMailComposeRecipientTextViewDelegate)composeRecipientDelegate
{
  return (MFMailComposeRecipientTextViewDelegate *)objc_loadWeakRetained((id *)&self->_composeRecipientViewDelegate);
}

- (UIViewController)popoverOwner
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_popoverOwner);
}

- (void)setPopoverOwner:(id)a3
{
  objc_storeWeak((id *)&self->_popoverOwner, a3);
}

- (MFMailComposeToFieldDelegate)toFieldDelegate
{
  return (MFMailComposeToFieldDelegate *)objc_loadWeakRetained((id *)&self->_toFieldDelegate);
}

- (MFMailComposeToField)toField
{
  return self->_toField;
}

- (MFComposeSubjectView)subjectField
{
  return self->_subjectField;
}

- (MFComposeMultiView)multiField
{
  return self->_multiField;
}

- (UIScrollView)bodyScroller
{
  return self->_bodyScroller;
}

- (MFMailComposeContactsSearchController)searchController
{
  return self->_searchController;
}

- (MFComposeWebContentVariationView)webContentVariationField
{
  return self->_webContentVariationField;
}

- (ComposeViewNavigationBarDelegate)navigationBarDelegate
{
  return (ComposeViewNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->_navigationBarDelegate);
}

- (void)setNavigationBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBarDelegate, a3);
}

- (MFComposeFromView)fromField
{
  return self->_fromField;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  return (MFMailComposeCoordinator *)objc_loadWeakRetained((id *)&self->_composeCoordinator);
}

- (void)setComposeCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_composeCoordinator, a3);
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (EFCancelable)autoCompleteTableViewContentSizeObserver
{
  return self->_autoCompleteTableViewContentSizeObserver;
}

- (void)setAutoCompleteTableViewContentSizeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_autoCompleteTableViewContentSizeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoCompleteTableViewContentSizeObserver, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
  objc_destroyWeak((id *)&self->_toFieldDelegate);
  objc_destroyWeak((id *)&self->_popoverOwner);
  objc_destroyWeak((id *)&self->_composeRecipientViewDelegate);
  objc_destroyWeak((id *)&self->_mailComposeViewDelegate);
  objc_storeStrong((id *)&self->_findPanelHostView, 0);
  objc_storeStrong((id *)&self->_corecipientsSearchTableViewSeparator, 0);
  objc_storeStrong((id *)&self->_corecipientsSearchViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_delayedPopoverInvocation, 0);
  objc_destroyWeak((id *)&self->_pinningResponder);
  objc_destroyWeak((id *)&self->_firstResponderBeforeSheet);
  objc_storeStrong((id *)&self->_pendingDropRecipients, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webContentVariationField, 0);
  objc_storeStrong((id *)&self->_imageSizeField, 0);
  objc_storeStrong((id *)&self->_multiField, 0);
  objc_storeStrong((id *)&self->_fromField, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_activeRecipientView, 0);
  objc_storeStrong((id *)&self->_lastChangedRecipientView, 0);
  objc_storeStrong((id *)&self->_bccField, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_bodyScroller, 0);
}

@end
