@implementation CNComposeRecipientTextView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_CNAtomTextView setHostRecipientView:](self->_textView, "setHostRecipientView:", 0);
  -[_CNAtomTextView setDelegate:](self->_textView, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView keyboardWillHideNotificationObserver](self, "keyboardWillHideNotificationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[CNComposeRecipientTextView keyboardDidHideNotificationObserver](self, "keyboardDidHideNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView dealloc](&v6, sel_dealloc);
}

- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CNComposeRecipientTextView *v10;
  CNComposeDragSource *v11;
  CNComposeDragSource *dragSource;
  CNComposeDropTarget *v13;
  CNComposeDropTarget *dropTarget;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[CNComposeRecipientTextView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = -[CNComposeDragSource initWithView:delegate:]([CNComposeDragSource alloc], "initWithView:delegate:", v10, v9);
    dragSource = v10->_dragSource;
    v10->_dragSource = v11;

    -[CNComposeDragSource setAllowsDragOverridingMasterSwitch:](v10->_dragSource, "setAllowsDragOverridingMasterSwitch:", 1);
    v13 = -[CNComposeDropTarget initWithView:delegate:]([CNComposeDropTarget alloc], "initWithView:delegate:", v10, v9);
    dropTarget = v10->_dropTarget;
    v10->_dropTarget = v13;

    v15 = (void *)MEMORY[0x1E0C99E20];
    +[CNComposeRecipient readableTypeIdentifiersForItemProvider](CNComposeRecipient, "readableTypeIdentifiersForItemProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97530], "readableTypeIdentifiersForItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    +[CNComposeRecipients readableTypeIdentifiersForItemProvider](CNComposeRecipients, "readableTypeIdentifiersForItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v19);

    -[CNComposeDropTarget setAcceptableUTIs:](v10->_dropTarget, "setAcceptableUTIs:", v17);
    -[_CNAtomTextView interactions](v10->_textView, "interactions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_cn_filter:", &__block_literal_global_15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView setInteractions:](v10->_textView, "setInteractions:", v21);

  }
  return v10;
}

BOOL __61__CNComposeRecipientTextView_initWithFrame_dragDropDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;

  v2 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_opt_class();
    v5 = v4 != objc_opt_class();
  }

  return v5;
}

- (CNComposeRecipientTextView)initWithOptions:(id)a3
{
  id v4;
  CNComposeRecipientTextView *v5;
  CNComposeRecipientTextView *v6;
  uint64_t v7;
  CNAutocompleteSearchControllerOptions *options;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNComposeRecipientTextView;
  v5 = -[CNComposeRecipientTextView init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "copy");
    options = v6->_options;
    v6->_options = (CNAutocompleteSearchControllerOptions *)v7;

    -[CNAutocompleteSearchControllerOptions trailingButtonMidlineInsetFromLayoutMargin](v6->_options, "trailingButtonMidlineInsetFromLayoutMargin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNAutocompleteSearchControllerOptions trailingButtonMidlineInsetFromLayoutMargin](v6->_options, "trailingButtonMidlineInsetFromLayoutMargin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      -[CNComposeRecipientTextView setTrailingButtonMidlineInsetFromLayoutMargin:](v6, "setTrailingButtonMidlineInsetFromLayoutMargin:", v11);

    }
    -[CNAutocompleteSearchControllerOptions shouldAlwaysShowAddContactsButton](v6->_options, "shouldAlwaysShowAddContactsButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CNAutocompleteSearchControllerOptions shouldAlwaysShowAddContactsButton](v6->_options, "shouldAlwaysShowAddContactsButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipientTextView setShouldAlwaysShowAddContactsButton:](v6, "setShouldAlwaysShowAddContactsButton:", objc_msgSend(v13, "BOOLValue"));

    }
    else
    {
      -[CNComposeRecipientTextView setShouldAlwaysShowAddContactsButton:](v6, "setShouldAlwaysShowAddContactsButton:", 0);
    }
  }

  return v6;
}

- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  CNComposeRecipientTextView *v3;
  CNComposeRecipientTextView *v4;
  _CNAtomTextView *v5;
  uint64_t v6;
  _CNAtomTextView *textView;
  void *v8;
  _CNAtomTextView *v9;
  void *v10;
  _CNAtomTextView *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *atomViews;
  void *v17;
  _CNAtomTextView *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  NSMutableDictionary *v24;
  NSMutableDictionary *atomLayoutOptionsByRecipient;
  NSMutableArray *v26;
  NSMutableArray *recipientsBeingRemoved;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CNComposeRecipientTextView;
  v3 = -[CNComposeHeaderView initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNComposeRecipientTextView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v4->_usingActiveAppearance = 1;
    v5 = [_CNAtomTextView alloc];
    -[CNComposeRecipientTextView bounds](v4, "bounds");
    v6 = -[_CNAtomTextView initWithFrame:](v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (_CNAtomTextView *)v6;

    -[_CNAtomTextView textContainer](v4->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    v9 = v4->_textView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_CNAtomTextView setDelegate:](v4->_textView, "setDelegate:", v4);
    v11 = v4->_textView;
    +[CNAtomView defaultFont](CNAtomView, "defaultFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView setFont:](v11, "setFont:", v12);

    -[_CNAtomTextView setForceEnableDictation:](v4->_textView, "setForceEnableDictation:", 1);
    -[_CNAtomTextView setAutocorrectionType:](v4->_textView, "setAutocorrectionType:", 1);
    -[_CNAtomTextView setAutocapitalizationType:](v4->_textView, "setAutocapitalizationType:", 0);
    -[_CNAtomTextView setKeyboardType:](v4->_textView, "setKeyboardType:", 7);
    -[_CNAtomTextView setBounces:](v4->_textView, "setBounces:", 0);
    -[_CNAtomTextView setAutoresizingMask:](v4->_textView, "setAutoresizingMask:", 0);
    -[_CNAtomTextView setHostRecipientView:](v4->_textView, "setHostRecipientView:", v4);
    -[_CNAtomTextView layoutManager](v4->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v4);

    -[_CNAtomTextView layoutManager](v4->_textView, "layoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsNonContiguousLayout:", 1);

    -[_CNAtomTextView setScrollsToTop:](v4->_textView, "setScrollsToTop:", 0);
    v4->_enabled = 1;
    -[CNComposeRecipientTextView addSubview:](v4, "addSubview:", v4->_textView);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v15;

    -[CNComposeHeaderView labelView](v4, "labelView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");

    v18 = v4->_textView;
    -[CNComposeHeaderView labelView](v4, "labelView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView addSubview:](v18, "addSubview:", v19);

    -[CNComposeRecipientTextView _setAddButtonVisible:animated:](v4, "_setAddButtonVisible:animated:", 0, 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel__tapGestureRecognized_);
    objc_msgSend(v20, "setCancelsTouchesInView:", 0);
    -[CNComposeRecipientTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v20);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v4, sel__longPressGestureRecognized_);
    objc_msgSend(v21, "setCancelsTouchesInView:", 0);
    -[CNComposeRecipientTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v21);
    v4->_textViewExclusionPathsAreValid = 1;
    v4->_atomViewAnimationDepth = 0;
    v4->_parentIsClosing = 0;
    v4->_isTextFieldCollapsed = 0;
    v4->_collapsedStateInitialized = 0;
    v4->_indicatesUnsafeRecipientsWhenCollapsed = 0;
    v4->_notifyDelegateOfSizeChange = 1;
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    atomPresentationOptionsByRecipient = v4->_atomPresentationOptionsByRecipient;
    v4->_atomPresentationOptionsByRecipient = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    atomLayoutOptionsByRecipient = v4->_atomLayoutOptionsByRecipient;
    v4->_atomLayoutOptionsByRecipient = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recipientsBeingRemoved = v4->_recipientsBeingRemoved;
    v4->_recipientsBeingRemoved = v26;

    v4->_showsAddButtonWhenExpanded = 1;
    *(_WORD *)&v4->_expandRecipientsInNamedGroups = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v29 = *MEMORY[0x1E0CEB970];
    v30 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __44__CNComposeRecipientTextView_initWithFrame___block_invoke;
    v37[3] = &unk_1E62BF170;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v28, "addObserverForName:object:queue:usingBlock:", v29, 0, 0, v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setKeyboardWillHideNotificationObserver:](v4, "setKeyboardWillHideNotificationObserver:", v31);

    v32 = *MEMORY[0x1E0CEB820];
    v35[0] = v30;
    v35[1] = 3221225472;
    v35[2] = __44__CNComposeRecipientTextView_initWithFrame___block_invoke_2;
    v35[3] = &unk_1E62BF170;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v28, "addObserverForName:object:queue:usingBlock:", v32, 0, 0, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setKeyboardDidHideNotificationObserver:](v4, "setKeyboardDidHideNotificationObserver:", v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __44__CNComposeRecipientTextView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyboardIsHiding:", 1);

}

void __44__CNComposeRecipientTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyboardIsHiding:", 0);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (id)menuConfigurationForAtomView:(id)a3
{
  return 0;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
  -[CNComposeRecipientTextView setNeedsLayout](self, "setNeedsLayout");
}

- (double)labelTopPadding
{
  CNAutocompleteSearchControllerOptions *options;
  void *v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  objc_super v10;

  options = self->_options;
  if (options
    && (-[CNAutocompleteSearchControllerOptions labelTopPadding](options, "labelTopPadding"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[CNAutocompleteSearchControllerOptions labelTopPadding](self->_options, "labelTopPadding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNComposeRecipientTextView;
    -[CNComposeHeaderView labelTopPadding](&v10, sel_labelTopPadding);
    return v8;
  }
  return v7;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *textView;
  double v12;
  double v13;
  void *v14;
  UIButton *addButton;
  CGRect *p_addButtonFrame;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  double MinX;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CNAutocompleteSearchControllerOptions *options;
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
  float v50;
  double v51;
  float v52;
  void *v53;
  CNAutocompleteSearchControllerOptions *v54;
  void *v55;
  void *v56;
  objc_super v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v58.receiver = self;
  v58.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeHeaderView layoutSubviews](&v58, sel_layoutSubviews);
  v3 = -[CNComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
  -[CNComposeHeaderView _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[_CNAtomTextView bounds](self->_textView, "bounds");
  if (v10 <= 0.00000011920929)
    textView = self;
  else
    textView = self->_textView;
  objc_msgSend(textView, "bounds");
  v13 = v12;
  if (v3)
  {
    -[_CNAtomTextView frame](self->_textView, "frame");
    v61.origin.x = v5;
    v61.origin.y = v7;
    v61.size.width = v9;
    v61.size.height = v13;
    if (!CGRectEqualToRect(v59, v61))
      -[CNComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");
  }
  -[_CNAtomTextView setFrame:](self->_textView, "setFrame:", v5, v7, v9, v13);
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  -[_CNAtomTextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineHeight");

  -[CNComposeRecipientTextView bounds](self, "bounds");
  UIRoundToViewScale();
  addButton = self->_addButton;
  if (addButton)
  {
    p_addButtonFrame = &self->_addButtonFrame;
    x = self->_addButtonFrame.origin.x;
    y = self->_addButtonFrame.origin.y;
    width = self->_addButtonFrame.size.width;
    height = self->_addButtonFrame.size.height;
    -[UIButton intrinsicContentSize](addButton, "intrinsicContentSize");
    self->_addButtonFrame.size.width = v21;
    self->_addButtonFrame.size.height = v22;
    UIRoundToViewScale();
    self->_addButtonFrame.origin.y = v23;
    -[CNComposeHeaderView _contentRect](self, "_contentRect");
    if (v3)
      MinX = CGRectGetMinX(*(CGRect *)&v24);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v24) - self->_addButtonFrame.size.width;
    p_addButtonFrame->origin.x = MinX;
    -[CNComposeRecipientTextView trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin");
    if (v29 == 0.0)
    {
      v34 = p_addButtonFrame->origin.x;
    }
    else
    {
      -[CNComposeRecipientTextView trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin");
      v31 = v30;
      v60.origin.x = p_addButtonFrame->origin.x;
      v60.origin.y = self->_addButtonFrame.origin.y;
      v60.size.width = self->_addButtonFrame.size.width;
      v60.size.height = self->_addButtonFrame.size.height;
      v32 = v31 + CGRectGetWidth(v60) * -0.5;
      v33 = -1.0;
      if (v3)
        v33 = 1.0;
      v34 = p_addButtonFrame->origin.x + v32 * v33;
      p_addButtonFrame->origin.x = v34;
    }
    v35 = self->_addButtonFrame.origin.y;
    v36 = self->_addButtonFrame.size.width;
    v37 = self->_addButtonFrame.size.height;
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    if (!CGRectEqualToRect(*(CGRect *)&v34, v62))
    {
      -[UIButton setFrame:](self->_addButton, "setFrame:", p_addButtonFrame->origin.x, self->_addButtonFrame.origin.y, self->_addButtonFrame.size.width, self->_addButtonFrame.size.height);
      -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
    }
  }
  if (!-[CNComposeRecipientTextView usingActiveAppearance](self, "usingActiveAppearance"))
    -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
  if (v3)
  {
    v57.receiver = self;
    v57.super_class = (Class)CNComposeRecipientTextView;
    -[CNComposeHeaderView layoutSubviews](&v57, sel_layoutSubviews);
  }
  options = self->_options;
  if (options)
  {
    -[CNAutocompleteSearchControllerOptions labelLeadingPadding](options, "labelLeadingPadding");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[CNComposeHeaderView labelView](self, "labelView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      -[CNAutocompleteSearchControllerOptions labelLeadingPadding](self->_options, "labelLeadingPadding");
      if (v3)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        v51 = v42 - v50;
      }
      else
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        v51 = v52;
      }

      -[CNComposeHeaderView labelView](self, "labelView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFrame:", v51, v44, v46, v48);

    }
    v54 = self->_options;
    if (v54)
    {
      -[CNAutocompleteSearchControllerOptions shouldHideSeparator](v54, "shouldHideSeparator");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        -[CNAutocompleteSearchControllerOptions shouldHideSeparator](self->_options, "shouldHideSeparator");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNComposeRecipientTextView setSeparatorHidden:](self, "setSeparatorHidden:", objc_msgSend(v56, "BOOLValue"));

      }
    }
  }
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 1;
}

- (void)refreshPreferredContentSize
{
  _CNAtomTextView *textView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeHeaderView refreshPreferredContentSize](&v4, sel_refreshPreferredContentSize);
  textView = self->_textView;
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  -[_CNAtomTextView setTextContainerInset:](textView, "setTextContainerInset:");
  -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
  -[CNComposeRecipientTextView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_CNAtomTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + -2.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNComposeRecipientTextView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNComposeRecipientTextView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
}

- (void)_removeAllRecipients
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[_CNAtomTextView textStorage](self->_textView, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    -[_CNAtomTextView textStorage](self->_textView, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteCharactersInRange:", 0, v6);

    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView textContainer](self->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ensureLayoutForTextContainer:", v8);

  }
}

- (void)setAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNComposeRecipientTextView recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[CNComposeRecipientTextView _removeAllRecipients](self, "_removeAllRecipients");
  -[CNComposeHeaderView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "composeRecipientView:composeRecipientForAddress:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
        {
          -[CNComposeRecipientTextView addRecipient:](self, "addRecipient:", v14);
          objc_msgSend(v8, "addObject:", v14);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v6, "count"))
      v15 = v6;
    else
      v15 = 0;
    if (objc_msgSend(v8, "count", (_QWORD)v17))
      v16 = v8;
    else
      v16 = 0;
    objc_msgSend(v7, "composeRecipientView:didReplaceRecipients:withRecipients:", self, v15, v16);
  }
  -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView", (_QWORD)v17);
  -[CNComposeRecipientTextView reflow](self, "reflow");

}

- (NSArray)recipients
{
  void *v3;
  _CNAtomTextView *textView;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CNComposeRecipientTextView_recipients__block_invoke;
  v7[3] = &unk_1E62BFE38;
  v5 = v3;
  v8 = v5;
  -[_CNAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v7);

  return (NSArray *)v5;
}

void __40__CNComposeRecipientTextView_recipients__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)setRecipients:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[CNComposeRecipientTextView _removeAllRecipients](self, "_removeAllRecipients");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CNComposeRecipientTextView_setRecipients___block_invoke;
  v5[3] = &unk_1E62BFE60;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
}

uint64_t __44__CNComposeRecipientTextView_setRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecipient:", a2);
}

- (void)addRecipient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNComposeRecipientTextView recipients](self, "recipients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", v4, objc_msgSend(v5, "count"), 0);

}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _BOOL4 v40;
  id obj;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v5 = a5;
  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v40 = v5;
    if (v5)
      -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[CNComposeRecipientTextView selectedAtoms](self, "selectedAtoms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    v39 = v8;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v52 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          -[CNComposeRecipientTextView recipients](self, "recipients", v39);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recipient");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          a4 = objc_msgSend(v15, "indexOfObject:", v16);

          objc_msgSend(v14, "recipient");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNComposeRecipientTextView removeRecipient:](self, "removeRecipient:", v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v11);
      v8 = v39;
    }

    if (-[CNComposeRecipientTextView shouldExpandRecipient:](self, "shouldExpandRecipient:", v8))
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v8, "sortedChildren");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v48;
        obj = v18;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v48 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            objc_msgSend(v23, "children", v39);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "arrayByAddingObject:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v44;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v44 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "setIsMemberOfGroup:", 0);
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              }
              while (v27);
            }

            -[CNComposeRecipientTextView recipients](self, "recipients");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __57__CNComposeRecipientTextView_addRecipient_index_animate___block_invoke;
            v42[3] = &unk_1E62BEE78;
            v42[4] = v23;
            v31 = objc_msgSend(v30, "_cn_any:", v42);

            if ((v31 & 1) == 0)
              -[CNComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", v23, a4++, v40);
          }
          v18 = obj;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        }
        while (v20);
        v8 = v39;
      }
    }
    else
    {
      -[CNComposeRecipientTextView recipients](self, "recipients");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "containsObject:", v8);

      if ((v33 & 1) == 0)
      {
        -[CNComposeRecipientTextView _atomAttachmentForRecipient:](self, "_atomAttachmentForRecipient:", v8);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v34, a4);
        -[CNComposeHeaderView delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v35, "composeRecipientView:didAddRecipient:", self, v8);
        -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", a4 + 1, 0, v39);
        -[CNComposeRecipientTextView undoManager](self, "undoManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "registerUndoWithTarget:selector:object:", self, sel_removeRecipient_, v8);
        if ((objc_msgSend(v36, "isUndoing") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("ADDRESS_ADDITION"), &stru_1E62C0368, CFSTR("Localized"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setActionName:", v38);

        }
      }
      -[CNComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility", v39);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("CNComposeRecipientTextViewDidChangeNotification"), self, 0);
    }

  }
}

uint64_t __57__CNComposeRecipientTextView_addRecipient_index_animate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "normalizedAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)shouldExpandRecipient:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isGroup"))
  {
    if (-[CNComposeRecipientTextView expandRecipientsInNamedGroups](self, "expandRecipientsInNamedGroups"))
    {
      v5 = 1;
    }
    else
    {
      v6 = *MEMORY[0x1E0D13848];
      objc_msgSend(v4, "displayString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v4;
  NSUndoManager *v5;

  undoManager = self->_undoManager;
  if (!undoManager)
  {
    v4 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (void)_didRemoveRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNComposeHeaderView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeRecipientView:didRemoveRecipient:", self, v9);
  -[CNComposeRecipientTextView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerUndoWithTarget:selector:object:", self, sel_addRecipient_, v9);
  if ((objc_msgSend(v5, "isUndoing") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADDRESS_DELETION"), &stru_1E62C0368, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionName:", v7);

  }
  -[CNComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CNComposeRecipientTextViewDidChangeNotification"), self, 0);

}

- (void)removeRecipient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNComposeRecipientTextView shouldExpandRecipient:](self, "shouldExpandRecipient:", v4))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "children", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[CNComposeRecipientTextView removeSingleRecipient:](self, "removeSingleRecipient:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    -[CNComposeRecipientTextView removeSingleRecipient:](self, "removeSingleRecipient:", v4);
  }

}

- (void)removeSingleRecipient:(id)a3
{
  id v4;
  _CNAtomTextView *textView;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v17 = &unk_1B1148B9B;
  v18 = xmmword_1B1144CB0;
  textView = self->_textView;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52__CNComposeRecipientTextView_removeSingleRecipient___block_invoke;
  v11 = &unk_1E62BFE88;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[_CNAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", &v8);
  if (v15[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_CNAtomTextView textStorage](self->_textView, "textStorage", v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteCharactersInRange:", v15[4], v15[5]);

    -[CNComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", v6);
  }

  _Block_object_dispose(&v14, 8);
}

void __52__CNComposeRecipientTextView_removeSingleRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  int v10;
  uint64_t v11;

  objc_msgSend(a2, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEquivalentAddressToRecipient:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v11 + 32) = a3;
    *(_QWORD *)(v11 + 40) = a4;
    *a5 = 1;
  }
}

- (void)addAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _CNAtomTextView *textView;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;

  v4 = a3;
  -[CNComposeHeaderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeRecipientView:composeRecipientForAddress:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11 = 0uLL;
    v7 = -[CNComposeRecipientTextView _userEnteredTextWithRange:](self, "_userEnteredTextWithRange:", &v11);
    textView = self->_textView;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__CNComposeRecipientTextView_addAddress___block_invoke;
    v9[3] = &unk_1E62BFEB0;
    v9[4] = self;
    v10 = v11;
    -[_CNAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v9);
    -[CNComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", v6, (_QWORD)v11, 1);
    -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", (_QWORD)v11 + 1, 0);
  }

}

void __41__CNComposeRecipientTextView_addAddress___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 552), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteCharactersInRange:", a1[5], a1[6]);

}

- (BOOL)containsAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[_CNAtomTextView atoms](self->_textView, "atoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__CNComposeRecipientTextView_containsAddress___block_invoke;
  v10[3] = &unk_1E62BFED8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

uint64_t __46__CNComposeRecipientTextView_containsAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uncommentedAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_addButtonTapped:(id)a3
{
  id v4;

  -[CNComposeHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_addButtonWasTapped = 1;
    objc_msgSend(v4, "composeRecipientViewRequestAddRecipient:", self);
  }

}

- (void)addRecipientsFromContactItemProviders:(id)a3
{
  -[CNComposeDropTarget handleDropOfContactItemProviders:](self->_dropTarget, "handleDropOfContactItemProviders:", a3);
}

- (NSArray)addresses
{
  void *v2;
  void *v3;

  -[CNComposeRecipientTextView recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_commentedAddress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)uncommentedAddresses
{
  void *v2;
  void *v3;

  -[CNComposeRecipientTextView recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_uncommentedAddress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setUsingActiveAppearance:(BOOL)a3
{
  -[CNComposeRecipientTextView setUsingActiveAppearance:animated:](self, "setUsingActiveAppearance:animated:", a3, 1);
}

- (void)setUsingActiveAppearance:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSTimer *collapsableUpdateTimer;
  NSTimer *v7;
  void *v8;
  void *v9;
  void *v10;
  NSTimer *v11;
  NSTimer *v12;
  BOOL v13;
  BOOL v14;

  v14 = a4;
  if (self->_usingActiveAppearance != a3)
  {
    v4 = a4;
    self->_usingActiveAppearance = a3;
    collapsableUpdateTimer = self->_collapsableUpdateTimer;
    if (collapsableUpdateTimer)
    {
      -[NSTimer invalidate](collapsableUpdateTimer, "invalidate");
      v7 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = 0;

      *(_DWORD *)&a3 = self->_usingActiveAppearance;
    }
    v13 = !a3;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0C99DB8];
      -[CNComposeRecipientTextView methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__setTextViewIsCollapsed_animated_);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invocationWithMethodSignature:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTarget:", self);
      objc_msgSend(v10, "setSelector:", sel__setTextViewIsCollapsed_animated_);
      objc_msgSend(v10, "setArgument:atIndex:", &v13, 2);
      objc_msgSend(v10, "setArgument:atIndex:", &v14, 3);
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:invocation:repeats:", v10, 0, 0.1);
      v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v12 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = v11;

    }
    else
    {
      -[CNComposeRecipientTextView _setTextViewIsCollapsed:animated:](self, "_setTextViewIsCollapsed:animated:", !a3, 0);
    }
  }
}

- (void)setEditable:(BOOL)a3
{
  -[CNComposeRecipientTextView setUsingActiveAppearance:animated:](self, "setUsingActiveAppearance:animated:", a3, 1);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[_CNAtomTextView setEditable:](self->_textView, "setEditable:");
    -[CNComposeRecipientTextView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_separatorHidden != a3)
  {
    v3 = a3;
    self->_separatorHidden = a3;
    -[CNComposeHeaderView separator](self, "separator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  -[CNComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility");
  -[CNComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");
}

- (void)_updateAddButtonVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;

  v3 = a3;
  v5 = (self->_addButtonWasTapped || self->_usingActiveAppearance && self->_expanded)
    && self->_showsAddButtonWhenExpanded
    && -[CNComposeRecipientTextView _canAddAdditionalAtoms](self, "_canAddAdditionalAtoms");
  -[CNComposeRecipientTextView _setAddButtonVisible:animated:](self, "_setAddButtonVisible:animated:", v5, v3);
}

- (void)_updateAddButtonVisibility
{
  -[CNComposeRecipientTextView _updateAddButtonVisibilityAnimated:](self, "_updateAddButtonVisibilityAnimated:", 1);
}

- (void)setShowsAddButtonWhenExpanded:(BOOL)a3
{
  if (self->_showsAddButtonWhenExpanded != a3)
  {
    self->_showsAddButtonWhenExpanded = a3;
    -[CNComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility");
    -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
  }
}

- (BOOL)_hasUnsafeRecipients
{
  return -[CNComposeRecipientTextView _hasRecipientsWithPresentationOptions:](self, "_hasRecipientsWithPresentationOptions:", 1);
}

- (BOOL)_hasDowntimeBlockedRecipients
{
  return -[CNComposeRecipientTextView _hasRecipientsWithPresentationOptions:](self, "_hasRecipientsWithPresentationOptions:", 0x2000);
}

- (BOOL)_hasRecipientsWithPresentationOptions:(unint64_t)a3
{
  _CNAtomTextView *textView;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  textView = self->_textView;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CNComposeRecipientTextView__hasRecipientsWithPresentationOptions___block_invoke;
  v6[3] = &unk_1E62BFF00;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  -[_CNAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __68__CNComposeRecipientTextView__hasRecipientsWithPresentationOptions___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)a1[4];
  objc_msgSend(a2, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_atomPresentationOptionsForRecipient:", v4);

  if ((a1[6] & v5) != 0)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
}

- (id)_userEnteredTextWithRange:(_NSRange *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  __CFString *v24;

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_CNAtomTextView selectedRange](self->_textView, "selectedRange");
  v9 = v7 + v8;
  if (v7 + v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = objc_msgSend(v6, "length");
  v10 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "substringToIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "textAttachmentCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:", v12, 4);
  v15 = v14;

  objc_msgSend(v6, "substringFromIndex:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "textAttachmentCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:", v17, 0);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v19 = 0;
  else
    v19 = v13 + v15;
  v20 = v18 + v9;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = v10;
  v21 = v20 - v19;
  v22 = v21 & ~(v21 >> 63);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 < 1)
  {
    v24 = &stru_1E62C0368;
    if (!a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v6, "substringWithRange:", v19, v21 & ~(v21 >> 63));
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
LABEL_16:
    a3->location = v19;
    a3->length = v22;
  }
LABEL_17:

  return v24;
}

- (NSString)text
{
  return (NSString *)-[CNComposeRecipientTextView _userEnteredTextWithRange:](self, "_userEnteredTextWithRange:", 0);
}

- (UITextView)textView
{
  return (UITextView *)self->_textView;
}

- (double)offsetForRowWithTextField
{
  double v2;
  double v3;
  double v4;

  -[CNComposeRecipientTextView bounds](self, "bounds");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  return v3 - v4;
}

- (unint64_t)numberOfRowsOfTextInField
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfGlyphs");

  -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CNComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke;
  v8[3] = &unk_1E62BFF28;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__CNComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)setBaseFont:(id)a3
{
  UIFont **p_baseFont;
  id v6;

  p_baseFont = &self->_baseFont;
  v6 = a3;
  if ((-[UIFont isEqual:](*p_baseFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    -[_CNAtomTextView setFont:](self->_textView, "setFont:", *p_baseFont);
  }

}

- (UIFont)baseFont
{
  UIFont *v2;

  v2 = self->_baseFont;
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v2 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = -[CNComposeRecipientTextView numberOfRowsOfTextInField](self, "numberOfRowsOfTextInField");
  if (a4 >= a3)
    v8 = a3;
  else
    v8 = a4;
  v9 = a3 - v8;
  if (v7 < a3 - v8)
    v9 = v7;
  if (a4 >= a3)
    v10 = 0;
  else
    v10 = v9;
  v11 = 0.0;
  v12 = 0.0;
  if (v8 >= 1)
  {
    v13 = (double)v8;
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v12 = v14 * v13;
  }
  if (v10 >= 1)
  {
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v16 = v15;
    -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
    v11 = (v16 - v17) * (double)v10;
  }
  return v12 + v11;
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[CNComposeHeaderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_atomPresentationOptionsByRecipient, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v5, "presentationOptionsForRecipient:", v4);
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](atomPresentationOptionsByRecipient, "setObject:forKey:", v10, v4);

  }
  else
  {
    v8 = 0;
  }
  if (-[CNComposeDropTarget handlesDroppedContacts](self->_dropTarget, "handlesDroppedContacts")
    && !objc_msgSend(v4, "kind"))
  {
    v11 = *MEMORY[0x1E0D13850];
    objc_msgSend(v4, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12) & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0D1E6B8];
      objc_msgSend(v4, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "emailAddressWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        v8 |= 0x20000uLL;
    }
    else
    {

      v8 |= 0x20000uLL;
    }
  }

  return v8;
}

- (void)_invalidateAtomPresentationOptionsCache
{
  -[NSMutableDictionary removeAllObjects](self->_atomPresentationOptionsByRecipient, "removeAllObjects");
}

- (void)setLabel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeHeaderView setLabel:](&v4, sel_setLabel_, a3);
  -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
}

- (UIColor)inactiveTextColor
{
  UIColor *inactiveTextColor;
  void *v4;
  UIColor *v5;
  UIColor *v6;

  inactiveTextColor = self->_inactiveTextColor;
  if (!inactiveTextColor)
  {
    -[CNComposeRecipientTextView interactionTintColor](self, "interactionTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIColor *)objc_msgSend(v4, "copy");
    v6 = self->_inactiveTextColor;
    self->_inactiveTextColor = v5;

    inactiveTextColor = self->_inactiveTextColor;
  }
  return inactiveTextColor;
}

- (void)setInactiveTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTextColor, a3);
  -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
}

- (id)_baseAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeHeaderView _baseAttributes](&v8, sel__baseAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[CNComposeRecipientTextView typingTextColor](self, "typingTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNComposeRecipientTextView typingTextColor](self, "typingTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1140]);

  }
  return v4;
}

- (void)clearText
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
  unint64_t v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _CNAtomTextView *textView;
  _QWORD v20[4];
  id v21;
  CNComposeRecipientTextView *v22;
  id v23;

  -[_CNAtomTextView delegate](self->_textView, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView setDelegate:](self->_textView, "setDelegate:", 0);
  -[_CNAtomTextView unmarkText](self->_textView, "unmarkText");
  -[_CNAtomTextView setDelegate:](self->_textView, "setDelegate:", v3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "textAttachmentCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCharactersToBeSkipped:", 0);
    v11 = 0;
    while (1)
    {
      v12 = objc_msgSend(v10, "scanLocation");
      if (v12 >= objc_msgSend(v8, "length"))
        break;
      v23 = v11;
      v13 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v9, &v23);
      v14 = v23;

      if (objc_msgSend(v14, "length"))
      {
        v15 = objc_msgSend(v10, "scanLocation");
        v16 = v15 - objc_msgSend(v14, "length");
        v17 = objc_msgSend(v14, "length");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v18);

      }
      v11 = v14;
      if (((v13 | objc_msgSend(v10, "scanCharactersFromSet:intoString:", v9, 0)) & 1) == 0)
        goto LABEL_9;
    }
    v14 = v11;
LABEL_9:
    textView = self->_textView;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__CNComposeRecipientTextView_clearText__block_invoke;
    v20[3] = &unk_1E62BF0D0;
    v21 = v4;
    v22 = self;
    -[_CNAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v20);

  }
}

void __39__CNComposeRecipientTextView_clearText__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "rangeValue");
        v9 = v8;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "textStorage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteCharactersInRange:", v7, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)invalidateAtomPresentationOptions
{
  _CNAtomTextView *textView;
  _QWORD v4[5];

  -[NSMutableDictionary removeAllObjects](self->_atomPresentationOptionsByRecipient, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_atomLayoutOptionsByRecipient, "removeAllObjects");
  textView = self->_textView;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CNComposeRecipientTextView_invalidateAtomPresentationOptions__block_invoke;
  v4[3] = &unk_1E62BFE38;
  v4[4] = self;
  -[_CNAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v4);
  -[CNComposeRecipientTextView reflow](self, "reflow");
}

void __63__CNComposeRecipientTextView_invalidateAtomPresentationOptions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setPresentationOptions:", objc_msgSend(*(id *)(a1 + 32), "_atomPresentationOptionsForRecipient:", v3));

}

- (void)invalidateAtomPresentationOptionsForRecipient:(id)a3
{
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  id v5;
  unint64_t v6;
  id v7;

  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](atomPresentationOptionsByRecipient, "removeObjectForKey:", v5);
  -[CNComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[CNComposeRecipientTextView _atomPresentationOptionsForRecipient:](self, "_atomPresentationOptionsForRecipient:", v5);

  objc_msgSend(v7, "setPresentationOptions:", v6);
  -[CNComposeRecipientTextView reflow](self, "reflow");

}

- (void)setAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_atomPresentationOptionsByRecipient, "setObject:forKeyedSubscript:", v7, v8);

    objc_msgSend(v6, "setPresentationOptions:", a3);
    -[CNComposeRecipientTextView reflow](self, "reflow");
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_atomPresentationOptionsByRecipient, "removeObjectForKey:", v8);
  }

}

- (void)parentWillClose
{
  self->_parentIsClosing = 1;
}

- (void)parentDidClose
{
  self->_parentIsClosing = 0;
}

- (BOOL)finishEnteringRecipient
{
  _BOOL4 v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_parentIsClosing)
    goto LABEL_2;
  v2 = -[CNComposeRecipientTextView usingActiveAppearance](self, "usingActiveAppearance");
  if (!v2)
    return v2;
  -[CNComposeRecipientTextView text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
LABEL_2:
    LOBYTE(v2) = 0;
  }
  else
  {
    -[CNComposeHeaderView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CNComposeRecipientTextView text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "composeRecipientView:didFinishEnteringAddress:", self, v7);

    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)becomeFirstResponder
{
  return -[_CNAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[_CNAtomTextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView resignFirstResponder](&v4, sel_resignFirstResponder);
  return -[_CNAtomTextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)_useRightToLeftLayout
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

- (void)reflow
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (!-[_CNAtomTextView isEditingTextStorage](self->_textView, "isEditingTextStorage"))
  {
    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfGlyphs");

    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "characterRangeForGlyphRange:actualGlyphRange:", 0, v4, 0);
    v8 = v7;

    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v8, 0);

    if (-[CNComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed"))
      -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
    -[CNComposeRecipientTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[CNComposeRecipientTextView _ensureAddButton](self, "_ensureAddButton");
  v30.receiver = self;
  v30.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView layoutIfNeeded](&v30, sel_layoutIfNeeded);
  v6 = -[CNComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
  if (v6)
    v7 = 8;
  else
    v7 = 2;
  -[CNComposeHeaderView labelView](self, "labelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeHeaderView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", v8, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CNComposeRecipientTextView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v19, v21, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v26);
  if (v3)
  {
    if (v6)
      v27 = 2;
    else
      v27 = 8;
    -[CNComposeHeaderView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", self->_addButton, v27);
    -[CNComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v28);

  }
  return v5;
}

- (void)_recomputeTextContainerExclusionPaths
{
  void *v3;
  uint64_t v4;
  void *v5;
  _CNAtomTextView *textView;
  void *v7;
  id v8;

  if (!self->_textViewExclusionPathsAreValid)
  {
    if (self->_expanded
      || (-[_CNAtomTextView attributedText](self->_textView, "attributedText"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "length"),
          v3,
          v4))
    {
      -[CNComposeRecipientTextView _textContainerExclusionPathsWithAddButton:](self, "_textContainerExclusionPathsWithAddButton:", self->_showsAddButtonWhenExpanded);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_CNAtomTextView textContainer](self->_textView, "textContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExclusionPaths:", v8);

      self->_textViewExclusionPathsAreValid = 1;
      textView = self->_textView;
      -[CNComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAtomTextView setTypingAttributes:](textView, "setTypingAttributes:", v7);

      if (-[CNComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed"))
        -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");

    }
  }
}

- (void)_invalidateTextContainerExclusionPaths
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (self->_textViewExclusionPathsAreValid)
  {
    self->_textViewExclusionPathsAreValid = 0;
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainThreadScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__CNComposeRecipientTextView__invalidateTextContainerExclusionPaths__block_invoke;
    v6[3] = &unk_1E62BF258;
    v6[4] = self;
    v5 = (id)objc_msgSend(v4, "afterDelay:performBlock:", v6, 0.0);

  }
}

uint64_t __68__CNComposeRecipientTextView__invalidateTextContainerExclusionPaths__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recomputeTextContainerExclusionPaths");
}

- (_NSRange)_rangeForComposeRecipientAtom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _CNAtomTextView *textView;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  int64x2_t v18;
  _NSRange result;

  v4 = a3;
  v5 = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v17 = &unk_1B1148B9B;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v4)
  {
    textView = self->_textView;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__CNComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke;
    v11[3] = &unk_1E62BFE88;
    v12 = v4;
    v13 = &v14;
    -[_CNAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", v11);

    v8 = v15[4];
    v6 = v15[5];
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v14, 8);

  v9 = v8;
  v10 = v6;
  result.length = v10;
  result.location = v9;
  return result;
}

void __60__CNComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "atomView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);

  if (v9 == v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v11 + 32) = a3;
    *(_QWORD *)(v11 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_atomViewAtCharacterIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesAtIndex:effectiveRange:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "atomView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setValue:(id)a3 forAtomLayoutOption:(id)a4 withRecipient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_atomLayoutOptionsByRecipient, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_atomLayoutOptionsByRecipient, "setObject:forKey:", v10, v9);
  }
  objc_msgSend(v10, "setObject:forKey:", v11, v8);

}

- (id)_valueForAtomLayoutOption:(id)a3 withRecipient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_atomLayoutOptionsByRecipient, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_beginAtomViewAnimations
{
  ++self->_atomViewAnimationDepth;
}

- (BOOL)_shouldAnimateAtomViewChanges
{
  return self->_atomViewAnimationDepth > 0;
}

- (void)_resetSelectionState
{
  void *v3;
  uint64_t v4;

  -[_CNAtomTextView text](self->_textView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_atomViews, "enumerateObjectsUsingBlock:", &__block_literal_global_107);
}

uint64_t __50__CNComposeRecipientTextView__resetSelectionState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:animated:", 0, 1);
}

- (BOOL)_textViewContainsAtomizedRecipients
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CNComposeRecipientTextView recipients](self, "recipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_toString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0DC1140];
  -[CNComposeHeaderView labelView](self, "labelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = *MEMORY[0x1E0DC1138];
  -[CNComposeHeaderView labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CNComposeHeaderView labelView](self, "labelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E62C0368;
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v12, v7);

  return v13;
}

- (void)_ensureInactiveTextView
{
  id v3;
  UITextView *v4;
  UITextView *inactiveTextView;
  UITextView *v6;
  void *v7;
  double v8;
  void *v9;

  if (!self->_inactiveTextView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:textContainer:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    inactiveTextView = self->_inactiveTextView;
    self->_inactiveTextView = v4;

    v6 = self->_inactiveTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITextView setEditable:](self->_inactiveTextView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_inactiveTextView, "setSelectable:", 0);
    -[UITextView setScrollEnabled:](self->_inactiveTextView, "setScrollEnabled:", 0);
    -[UITextView setUserInteractionEnabled:](self->_inactiveTextView, "setUserInteractionEnabled:", 0);
    -[UITextView setHidden:](self->_inactiveTextView, "setHidden:", !self->_isTextFieldCollapsed);
    v8 = 1.0;
    if (!self->_isTextFieldCollapsed)
      v8 = 0.0;
    -[UITextView setAlpha:](self->_inactiveTextView, "setAlpha:", v8);
    -[UITextView textContainer](self->_inactiveTextView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[CNComposeRecipientTextView addSubview:](self, "addSubview:", self->_inactiveTextView);
  }
}

- (void)_updateInactiveTextView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CNComposeRecipientTextView _ensureInactiveTextView](self, "_ensureInactiveTextView");
  -[CNComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  -[UITextView setTextContainerInset:](self->_inactiveTextView, "setTextContainerInset:");
  -[CNComposeRecipientTextView _attributedStringWithAtomizedRecipients](self, "_attributedStringWithAtomizedRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_inactiveTextView, "setAttributedText:", v3);

  -[UITextView frame](self->_inactiveTextView, "frame");
  -[_CNAtomTextView frame](self->_textView, "frame");
  v5 = v4;
  v7 = v6;
  -[_CNAtomTextView frame](self->_textView, "frame");
  v9 = v8;
  +[CNComposeHeaderView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
  -[UITextView setFrame:](self->_inactiveTextView, "setFrame:", v5, v7, v9, v10);
}

- (id)_attributedStringWithAtomizedRecipients
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CNNameListBuilderBlockDelegate *v12;
  uint64_t v13;
  id v14;
  id v15;
  CNNameListBuilder *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;

  if (-[CNComposeRecipientTextView _textViewContainsAtomizedRecipients](self, "_textViewContainsAtomizedRecipients"))
  {
    -[CNComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (-[CNComposeRecipientTextView _hasDowntimeBlockedRecipients](self, "_hasDowntimeBlockedRecipients")
      || self->_indicatesUnsafeRecipientsWhenCollapsed
      && -[CNComposeRecipientTextView _hasUnsafeRecipients](self, "_hasUnsafeRecipients"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNComposeRecipientTextView inactiveTextColor](self, "inactiveTextColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v5;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1140]);

    -[CNComposeRecipientTextView recipients](self, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineFragmentRectForGlyphAtIndex:effectiveRange:", 0, 0);
    v11 = v10;

    v12 = objc_alloc_init(CNNameListBuilderBlockDelegate);
    -[CNNameListBuilderBlockDelegate setCountOfNames:](v12, "setCountOfNames:", objc_msgSend(v8, "count"));
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke;
    v26[3] = &unk_1E62BFF90;
    v27 = v8;
    v14 = v8;
    -[CNNameListBuilderBlockDelegate setNameProviderBlock:](v12, "setNameProviderBlock:", v26);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2;
    v23[3] = &unk_1E62BFFB8;
    v24 = v4;
    v25 = v11;
    v15 = v4;
    -[CNNameListBuilderBlockDelegate setLengthValidationBlock:](v12, "setLengthValidationBlock:", v23);
    v16 = -[CNNameListBuilder initWithDelegate:]([CNNameListBuilder alloc], "initWithDelegate:", v12);
    -[CNNameListBuilder setShouldStripEllipses:](v16, "setShouldStripEllipses:", 0);
    -[CNNameListBuilder build](v16, "build");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v17, v15);
    v18 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v18, "setBounds:", 0.0, 0.0, 5.0, 5.0);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v18, "setImage:", v19);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertAttributedString:atIndex:", v20, 0);
    -[CNComposeRecipientTextView _toString](self, "_toString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertAttributedString:atIndex:", v21, 0);

  }
  else
  {
    -[CNComposeRecipientTextView _toString](self, "_toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

id __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "sizeWithAttributes:", *(_QWORD *)(a1 + 32));
  return v3 < *(double *)(a1 + 40);
}

- (BOOL)_isTextViewCollapsed
{
  return self->_isTextFieldCollapsed;
}

- (void)_setTextViewIsCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSTimer *collapsableUpdateTimer;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD, _QWORD);
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  BOOL v32;
  _QWORD v33[5];
  BOOL v34;

  v4 = a4;
  v5 = a3;
  collapsableUpdateTimer = self->_collapsableUpdateTimer;
  self->_collapsableUpdateTimer = 0;

  v8 = -[CNComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed");
  if (v5)
    v9 = !-[CNComposeRecipientTextView _textViewContainsAtomizedRecipients](self, "_textViewContainsAtomizedRecipients");
  else
    v9 = 0;
  if (!self->_collapsedStateInitialized || ((v9 | v8 ^ v5 ^ 1) & 1) == 0)
  {
    self->_collapsedStateInitialized = 1;
    self->_isTextFieldCollapsed = v5;
    if (v5)
      -[CNComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
    -[_CNAtomTextView bounds](self->_textView, "bounds");
    -[_CNAtomTextView setBounds:](self->_textView, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v10 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke;
    v33[3] = &unk_1E62BFBB8;
    v33[4] = self;
    v34 = v5;
    v11 = (void (**)(_QWORD))MEMORY[0x1B5E16810](v33);
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2;
    v31[3] = &unk_1E62BFD10;
    v31[4] = self;
    v32 = v5;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E16810](v31);
    if (v4)
    {
      -[UITextView setHidden:](self->_inactiveTextView, "setHidden:", 0);
      if (v5)
        v13 = 0.0;
      else
        v13 = 1.0;
      if (v5)
        v14 = 1.0;
      else
        v14 = 0.0;
      -[UITextView setAlpha:](self->_inactiveTextView, "setAlpha:", v13);
      -[_CNAtomTextView setAlpha:](self->_textView, "setAlpha:", v14);
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v11, v12, 0.23);
      if (!v5)
        goto LABEL_16;
    }
    else
    {
      v11[2](v11);
      v12[2](v12, 1);
      if (!v5)
      {
LABEL_16:
        -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CNAtomTextView textStorage](self->_textView, "textStorage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v16, "length"), 0);

        -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CNAtomTextView textContainer](self->_textView, "textContainer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ensureLayoutForTextContainer:", v18);

        goto LABEL_21;
      }
    }
    -[UITextView text](self->_inactiveTextView, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      v19 = -[CNComposeRecipientTextView _delegateRespondsToSizeChange](self, "_delegateRespondsToSizeChange");

      if (v19)
      {
        -[CNComposeRecipientTextView bounds](self, "bounds");
        v21 = v20;
        -[CNComposeHeaderView _additionalContentHeight](self, "_additionalContentHeight");
        v23 = v22;
        -[UITextView frame](self->_inactiveTextView, "frame");
        -[CNComposeRecipientTextView _notifyDelegateOfNewSize:](self, "_notifyDelegateOfNewSize:", v21, v23 + v24);
        -[_CNAtomTextView bounds](self->_textView, "bounds");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        -[UITextView frame](self->_inactiveTextView, "frame");
        -[_CNAtomTextView setBounds:](self->_textView, "setBounds:", v26, v28, v30);
      }
      goto LABEL_22;
    }
LABEL_21:

LABEL_22:
  }
}

uint64_t __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  else
    v3 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", v3);
}

uint64_t __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 560), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (void)_ensureAddButton
{
  void *v3;
  UIButton *v4;
  UIButton *addButton;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  if (!self->_addButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("plus.circle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNComposeRecipientActionButton systemButtonWithImage:target:action:](CNComposeRecipientActionButton, "systemButtonWithImage:target:action:", v3, self, sel__addButtonTapped_);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    addButton = self->_addButton;
    self->_addButton = v4;

    v6 = self->_addButton;
    +[CNComposeTableViewCell axCappedSymbolConfigurationIsBold:](CNComposeTableViewCell, "axCappedSymbolConfigurationIsBold:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v6, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

    -[CNComposeRecipientTextView _updateAddButtonVisibilityAnimated:](self, "_updateAddButtonVisibilityAnimated:", 0);
    -[UIButton setAccessibilityIdentifier:](self->_addButton, "setAccessibilityIdentifier:", CFSTR("ComposeRecipientAddButton"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT_ACCESSIBILITY_LABEL"), &stru_1E62C0368, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](self->_addButton, "setAccessibilityLabel:", v9);

    -[UIButton setAutoresizingMask:](self->_addButton, "setAutoresizingMask:", 0);
    -[UIButton setAutoresizesSubviews:](self->_addButton, "setAutoresizesSubviews:", 0);
    -[UIButton setPointerInteractionEnabled:](self->_addButton, "setPointerInteractionEnabled:", 1);
    -[UIButton frame](self->_addButton, "frame");
    self->_addButtonFrame.origin.x = v10;
    self->_addButtonFrame.origin.y = v11;
    self->_addButtonFrame.size.width = v12;
    self->_addButtonFrame.size.height = v13;
    -[CNComposeRecipientTextView addSubview:](self, "addSubview:", self->_addButton);
  }
}

- (BOOL)_isAddButtonVisible
{
  double v2;

  -[UIButton alpha](self->_addButton, "alpha");
  return v2 > 0.0;
}

- (void)_setAddButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  double v9;
  __int128 v10;
  UIButton *addButton;
  id v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  _QWORD v15[5];
  BOOL v16;

  v4 = a4;
  v5 = a3;
  if (-[CNComposeRecipientTextView _isAddButtonVisible](self, "_isAddButtonVisible") != a3)
  {
    if (v5 && !self->_addButton)
      -[CNComposeRecipientTextView _ensureAddButton](self, "_ensureAddButton");
    if (-[CNComposeRecipientTextView shouldAlwaysShowAddContactsButton](self, "shouldAlwaysShowAddContactsButton"))
    {
      -[CNComposeRecipientTextView addButton](self, "addButton");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 1.0);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__CNComposeRecipientTextView__setAddButtonVisible_animated___block_invoke;
      v15[3] = &unk_1E62BFBB8;
      v15[4] = self;
      v16 = v5;
      v7 = MEMORY[0x1B5E16810](v15);
      v8 = (void *)v7;
      if (v4)
      {
        v9 = 1.0;
        if (v5)
          v9 = 0.0;
        -[UIButton setAlpha:](self->_addButton, "setAlpha:", v9);
        if (v5)
        {
          CGAffineTransformMakeTranslation(&v14, 2.0, 0.0);
        }
        else
        {
          v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v14.c = v10;
          *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        }
        addButton = self->_addButton;
        v13 = v14;
        -[UIButton setTransform:](addButton, "setTransform:", &v13);
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, 0.2);
      }
      else
      {
        (*(void (**)(uint64_t))(v7 + 16))(v7);
      }

    }
  }
}

void __60__CNComposeRecipientTextView__setAddButtonVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "addButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "addButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v6);

}

- (BOOL)_recipientAtomHitInView:(id)a3 atLocation:(CGPoint)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a3, "hitTest:withEvent:", 0, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_tapGestureRecognized:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "state") == 3)
  {
    -[CNComposeRecipientTextView textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEditable"))
    {

LABEL_5:
      -[_CNAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
      goto LABEL_6;
    }
    objc_msgSend(v8, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v6);
    v7 = -[CNComposeRecipientTextView _recipientAtomHitInView:atLocation:](self, "_recipientAtomHitInView:atLocation:", v5);

    if (v7)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)_longPressGestureRecognized:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "state") == 1)
  {
    -[CNComposeRecipientTextView textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEditable"))
    {

LABEL_5:
      -[_CNAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
      goto LABEL_6;
    }
    objc_msgSend(v8, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v6);
    v7 = -[CNComposeRecipientTextView _recipientAtomHitInView:atLocation:](self, "_recipientAtomHitInView:atLocation:", v5);

    if (v7)
      goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_canAddAdditionalAtoms
{
  void *v3;
  BOOL v4;

  if (self->_maxRecipients < 1)
    return 1;
  -[CNComposeRecipientTextView recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") < self->_maxRecipients;

  return v4;
}

- (id)_atomAttachmentForRecipient:(id)a3
{
  id v4;
  CNComposeRecipientAtom *v5;
  CNComposeRecipientAtom *v6;
  unint64_t v7;
  _CNAtomTextAttachment *v8;

  v4 = a3;
  v5 = [CNComposeRecipientAtom alloc];
  v6 = -[CNComposeRecipientAtom initWithFrame:recipient:](v5, "initWithFrame:recipient:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = -[CNComposeRecipientTextView _atomPresentationOptionsForRecipient:](self, "_atomPresentationOptionsForRecipient:", v4);

  -[CNAtomView setPresentationOptions:](v6, "setPresentationOptions:", v7);
  v8 = -[_CNAtomTextAttachment initWithAtomView:]([_CNAtomTextAttachment alloc], "initWithAtomView:", v6);

  return v8;
}

- (void)_insertAtomAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  -[CNComposeRecipientTextView _insertAtomAttachment:andReplaceCharactersInRange:](self, "_insertAtomAttachment:andReplaceCharactersInRange:", a3, a4, 0);
}

- (void)_insertAtomAttachment:(id)a3 andReplaceCharactersInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[CNComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedStringWithBaseAttributes:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", location, length, v10);
  else
    objc_msgSend(v9, "insertAttributedString:atIndex:", v10, location);

  if (!-[_CNAtomTextView isEditingTextStorage](self->_textView, "isEditingTextStorage"))
    -[CNComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");

}

- (void)_addAddressAtomSubview:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_atomViews, "containsObject:") & 1) == 0)
  {
    objc_msgSend(v4, "setDelegate:", self);
    -[NSMutableArray addObject:](self->_atomViews, "addObject:", v4);
    -[_CNAtomTextView addSubview:](self->_textView, "addSubview:", v4);
  }

}

- (void)_removeAddressAtomSubview:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_atomViews, "removeObject:", v4);
  objc_msgSend(v4, "removeFromSuperview");

}

- (id)atomViewForRecipient:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_atomViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "recipient", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)atomViewsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _CNAtomTextView *textView;
  id v8;
  _QWORD v10[4];
  id v11;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CNComposeRecipientTextView_atomViewsInRange___block_invoke;
  v10[3] = &unk_1E62BFE38;
  v8 = v6;
  v11 = v8;
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v10);

  return v8;
}

uint64_t __47__CNComposeRecipientTextView_atomViewsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)selectedAtoms
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_CNAtomTextView selectedRange](self->_textView, "selectedRange");
  return -[CNComposeRecipientTextView atomViewsInRange:](self, "atomViewsInRange:", v3, v4);
}

- (unint64_t)indexOfRecipientForInsertionAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  unint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  y = a3.y;
  x = a3.x;
  -[_CNAtomTextView atoms](self->_textView, "atoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v12 = objc_msgSend(v5, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CNComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke;
  v8[3] = &unk_1E62BFFE0;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__CNComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double MaxX;
  double v9;
  double v10;
  CGRect v11;

  v7 = a2;
  objc_msgSend(v7, "frame");
  MaxX = CGRectGetMaxX(v11);
  objc_msgSend(v7, "frame");
  v10 = v9;

  if (*(double *)(a1 + 40) < MaxX + v10 * -0.5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  void *v17;
  NSMutableArray *recipientsBeingRemoved;
  void *v19;
  BOOL v20;
  void *v21;
  _CNAtomTextView *textView;
  _QWORD v24[5];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("\n"));
  v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("\t"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR(",")))
  {
    objc_msgSend(v9, "markedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

  }
  else
  {
    v14 = 0;
  }
  v15 = v11 | v12;
  if ((v15 & 1) == 0 && !v14)
  {
    if (objc_msgSend(v10, "isEqualToString:", &stru_1E62C0368))
    {
      if (length == 1)
      {
        -[CNComposeRecipientTextView _atomViewAtCharacterIndex:](self, "_atomViewAtCharacterIndex:", location);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v16;
          if ((objc_msgSend(v16, "isSelected") & 1) != 0 || objc_msgSend(v9, "_textInputSource") == 3)
          {
            recipientsBeingRemoved = self->_recipientsBeingRemoved;
            objc_msgSend(v17, "recipient");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](recipientsBeingRemoved, "addObject:", v19);

            v20 = 1;
          }
          else
          {
            -[CNComposeRecipientTextView selectComposeRecipientAtom:](self, "selectComposeRecipientAtom:", v17);
            v20 = 0;
          }

          goto LABEL_22;
        }
      }
      else
      {
        textView = self->_textView;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __79__CNComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke;
        v24[3] = &unk_1E62BFE38;
        v24[4] = self;
        -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v24);
      }
    }
    v20 = 1;
    goto LABEL_22;
  }
  -[CNComposeHeaderView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNComposeRecipientTextView finishEnteringRecipient](self, "finishEnteringRecipient"))
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "composeRecipientViewTabPressed:", self);
    }
    else if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "composeRecipientViewReturnPressed:", self);
    }
  }

  v20 = 0;
LABEL_22:

  return v20;
}

void __79__CNComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "addObject:", v3);
    v3 = v4;
  }

}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, uint64_t);
  void *v16;
  CNComposeRecipientTextView *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v4 = objc_msgSend(a3, "selectedRange");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke;
  v16 = &unk_1E62C0030;
  v17 = self;
  v19 = v4;
  v20 = v6;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v9, &v13);

  -[CNComposeHeaderView delegate](self, "delegate", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "composeRecipientView:didSelectRecipients:", self, v11);

}

void __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[4];

  v7 = a2;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  v11 = v10;

  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2;
  v14[3] = &unk_1E62C0008;
  v16 = v20;
  v17 = v9;
  v14[1] = 3221225472;
  v18 = v11;
  v19 = *(_OWORD *)(a1 + 48);
  v15 = v12;
  objc_msgSend(v13, "enumerateAtomsInCharacterRange:withBlock:", v9, v11, v14);

  _Block_object_dispose(v20, 8);
}

void __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  int v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6];
  v5 = a1[8];
  v6 = a1[9];
  v7 = v4 < v5 || v4 - v5 >= v6;
  v16 = v3;
  if (!v7)
  {
    v11 = v4 == v5 + v6 - 1;
    v10 = 3;
    if (v11)
    {
      v11 = v4 == v5;
    }
    else
    {
      v10 = 1;
      v11 = 0;
    }
    v12 = 2;
    if (v11)
      v12 = 4;
    if (v4 == v5)
      v13 = v12;
    else
      v13 = v10;
    objc_msgSend(v3, "setSelected:animated:style:", 1, 0, v13);
    v14 = (void *)a1[4];
    objc_msgSend(v16, "recipient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    goto LABEL_17;
  }
  v8 = objc_msgSend(v3, "isSelected");
  v9 = v16;
  if (v8)
  {
    objc_msgSend(v16, "setSelected:animated:", 0, 0);
LABEL_17:
    v9 = v16;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);

}

- (void)textViewDidChange:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_recipientsBeingRemoved, "count", a3))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_recipientsBeingRemoved;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          -[CNComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_recipientsBeingRemoved, "removeAllObjects");
  }
  -[CNComposeHeaderView delegate](self, "delegate", (_QWORD)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNComposeRecipientTextView text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composeRecipientView:textDidChange:", self, v10);

  }
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  id v5;

  self->_didIgnoreFirstResponderResign = 0;
  self->_addButtonWasTapped = 0;
  -[CNComposeHeaderView delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "recipientViewDidBecomeFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "composeRecipientViewDidBecomeFirstResponder:", self);
  if (!-[CNComposeRecipientTextView _canAddAdditionalAtoms](self, "_canAddAdditionalAtoms"))
  {
    -[NSMutableArray lastObject](self->_atomViews, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelected:animated:", 1, 1);

  }
  if (-[CNComposeRecipientTextView usingActiveAppearance](self, "usingActiveAppearance"))
    -[CNComposeRecipientTextView setExpanded:](self, "setExpanded:", 1);

}

- (BOOL)hostRecipientViewHasSearchResults
{
  void *v3;
  char v4;

  -[CNComposeHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "composeRecipientViewShowingSearchResults:", self);
  else
    v4 = 0;

  return v4;
}

- (void)atomTextViewDidResignFirstResponder:(id)a3
{
  id v4;

  if (-[CNComposeRecipientTextView keyboardIsHiding](self, "keyboardIsHiding", a3)
    && -[CNComposeRecipientTextView hostRecipientViewHasSearchResults](self, "hostRecipientViewHasSearchResults"))
  {
    self->_didIgnoreFirstResponderResign = 1;
  }
  else
  {
    -[CNComposeHeaderView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v4, "recipientViewShouldIgnoreFirstResponderChanges:", self))
    {
      self->_didIgnoreFirstResponderResign = 1;
    }
    else
    {
      -[CNComposeRecipientTextView finishEnteringRecipient](self, "finishEnteringRecipient");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "recipientViewDidResignFirstResponder:", self);
      -[CNComposeRecipientTextView _resetSelectionState](self, "_resetSelectionState");
      -[CNComposeRecipientTextView setExpanded:](self, "setExpanded:", 0);
    }

  }
}

- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4
{
  _CNAtomTextView *textView;
  _QWORD v6[4];
  BOOL v7;

  textView = self->_textView;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CNComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke;
  v6[3] = &__block_descriptor_33_e32_v16__0__CNComposeRecipientAtom_8l;
  v7 = a4 == 1;
  -[_CNAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v6);
  -[CNComposeRecipientTextView reflow](self, "reflow");
}

uint64_t __69__CNComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSeparatorIsLeftAligned:", *(unsigned __int8 *)(a1 + 32));
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  int64_t atomViewAnimationDepth;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  int64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_atomViews);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_CNAtomTextView baseWritingDirection](self->_textView, "baseWritingDirection");
    objc_msgSend(v8, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    objc_msgSend(v8, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v35[3] = &unk_1E62C00A0;
    v35[4] = self;
    v39 = v11;
    v15 = v8;
    v36 = v15;
    v16 = v9;
    v37 = v16;
    v17 = v10;
    v38 = v17;
    objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v35);

    atomViewAnimationDepth = self->_atomViewAnimationDepth;
    if (atomViewAnimationDepth <= 1)
      atomViewAnimationDepth = 1;
    self->_atomViewAnimationDepth = atomViewAnimationDepth - 1;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          -[CNComposeRecipientTextView _removeAddressAtomSubview:](self, "_removeAddressAtomSubview:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v23++), (_QWORD)v31);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v21);
    }

    if (-[CNComposeRecipientTextView usingActiveAppearance](self, "usingActiveAppearance"))
    {
      -[_CNAtomTextView textContainerInset](self->_textView, "textContainerInset");
      objc_msgSend(v15, "usedRectForTextContainer:", v16);
      UICeilToViewScale();
      *(float *)&v24 = v24;
      v25 = roundf(*(float *)&v24);
      -[_CNAtomTextView bounds](self->_textView, "bounds");
      v27 = v26;
      -[_CNAtomTextView bounds](self->_textView, "bounds");
      if (v27 != v29 || v28 != v25)
      {
        v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        self->_currentTextRect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
        self->_currentTextRect.origin.y = v30;
        self->_currentTextRect.size.width = v27;
        self->_currentTextRect.size.height = v25;
        -[_CNAtomTextView setFrame:](self->_textView, "setFrame:", (_QWORD)v31);
        -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
        -[CNComposeRecipientTextView _notifyDelegateOfSizeChange](self, "_notifyDelegateOfSizeChange");
      }
    }

  }
}

void __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  void (**v29)(_QWORD);
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  char v39;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "atomView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isPlaceholder") & 1) != 0 || !v8)
        goto LABEL_21;
      objc_msgSend(v7, "recipient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_valueForAtomLayoutOption:withRecipient:", CFSTR("CNAtomLayoutOptionShouldBuildIn"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      objc_msgSend(*(id *)(a1 + 32), "_valueForAtomLayoutOption:withRecipient:", CFSTR("CNAtomLayoutOptionShouldHide"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      objc_msgSend(v8, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "_addAddressAtomSubview:", v8);
        if (v13)
          objc_msgSend(v8, "setAlpha:", 0.0);
        v11 = 1;
      }
      v15 = objc_msgSend(*(id *)(a1 + 32), "_atomPresentationOptionsForRecipient:", v9);
      if (objc_msgSend(v8, "presentationOptions") != v15)
        objc_msgSend(v8, "setPresentationOptions:", v15);
      objc_msgSend(v8, "setSeparatorStyle:", 2);
      objc_msgSend(v8, "setSeparatorHidden:", 0);
      objc_msgSend(v8, "setSeparatorIsLeftAligned:", *(_QWORD *)(a1 + 64) == 1);
      objc_msgSend(*(id *)(a1 + 40), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(_QWORD *)(a1 + 48));
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v8, "intrinsicContentSize");
      v23 = v22;
      objc_msgSend(v8, "frame");
      if (v21 != v25 || v23 != v24)
      {
        objc_msgSend(v8, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v21, v23);
        objc_msgSend(v8, "layoutSubviews");
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2;
      v31[3] = &unk_1E62C0078;
      v31[4] = *(_QWORD *)(a1 + 32);
      v34 = v17;
      v35 = v19;
      v36 = v21;
      v37 = v23;
      v26 = v8;
      v32 = v26;
      v27 = *(id *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 64);
      v33 = v27;
      v38 = v28;
      v39 = v13;
      v29 = (void (**)(_QWORD))MEMORY[0x1B5E16810](v31);
      if (((objc_msgSend(*(id *)(a1 + 32), "_shouldAnimateAtomViewChanges") ^ 1 | v11) & 1) != 0)
      {
        v29[2](v29);
        if (!v11)
          goto LABEL_20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v29, 0.25);
        if (!v11)
        {
LABEL_20:
          objc_msgSend(*(id *)(a1 + 56), "removeObject:", v26);

LABEL_21:
          goto LABEL_22;
        }
      }
      if (objc_msgSend(*(id *)(a1 + 32), "_shouldAnimateAtomViewChanges"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "textColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "performBuildInAnimationFromTextColor:withDuration:", v30, 0.25);

      }
      goto LABEL_20;
    }
  }
LABEL_22:

}

uint64_t __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGRect v24;
  CGRect v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "convertGlyphRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  v13 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", 0, 0);
  if (v13 >= v14)
  {
    v19 = v5 - v12;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "labelView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    CGRectGetMaxY(v24);
    objc_msgSend(*(id *)(a1 + 32), "labelView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_baselineOffsetFromBottom");

    v25.origin.x = v3;
    v25.origin.y = v5;
    v25.size.width = v7;
    v25.size.height = v9;
    CGRectGetHeight(v25);
    objc_msgSend(*(id *)(a1 + 40), "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_baselineOffsetFromBottom");

    objc_msgSend(*(id *)(a1 + 40), "edgeInsets");
    v19 = -v18;
    if (*(_QWORD *)(a1 + 88) == 1)
      v19 = v18;
  }
  objc_msgSend(*(id *)(a1 + 40), "presentationOptions", v19);
  v20 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  UIRectIntegralWithScale();
  objc_msgSend(v20, "setFrame:");

  v22 = 0.0;
  if (!*(_BYTE *)(a1 + 96))
    v22 = 1.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v22);
}

- (BOOL)_delegateRespondsToSizeChange
{
  void *v2;
  char v3;

  -[CNComposeHeaderView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)_notifyDelegateOfNewSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  -[CNComposeHeaderView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "composeHeaderView:didChangeSize:", self, width, height);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "composeRecipientView:didChangeSize:", self, width, height);
  }

}

- (void)_notifyDelegateOfSizeChange
{
  void *v3;
  _QWORD v4[5];

  if (self->_notifyDelegateOfSizeChange)
  {
    self->_notifyDelegateOfSizeChange = 0;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__CNComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke;
    v4[3] = &unk_1E62BF258;
    v4[4] = self;
    objc_msgSend(v3, "addOperationWithBlock:", v4);

  }
}

uint64_t __57__CNComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "frame");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "_additionalContentHeight");
  v7 = v6;
  result = objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSizeChange");
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewSize:", v3, v5 + v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 669) = 1;
  return result;
}

- (void)selectAtomForRecipient:(id)a3
{
  id v4;

  -[CNComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView selectAtom:](self, "selectAtom:", v4);

}

- (void)selectAtom:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[CNComposeRecipientTextView _rangeForComposeRecipientAtom:](self, "_rangeForComposeRecipientAtom:", a3);
  -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, v5);
}

- (void)shiftSelectAtom:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _CNAtomTextView *textView;
  NSRange v8;
  NSRange v9;
  NSRange v10;

  v4 = -[CNComposeRecipientTextView _rangeForComposeRecipientAtom:](self, "_rangeForComposeRecipientAtom:", a3);
  v6 = v5;
  v9.location = -[_CNAtomTextView selectedRange](self->_textView, "selectedRange");
  textView = self->_textView;
  v10.location = v4;
  v10.length = v6;
  v8 = NSUnionRange(v9, v10);
  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", v8.location, v8.length);
}

- (void)selectAllAtoms
{
  _CNAtomTextView *textView;
  id v3;

  textView = self->_textView;
  -[_CNAtomTextView textStorage](textView, "textStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", 0, objc_msgSend(v3, "length"));

}

- (void)deselectAllAtoms
{
  _CNAtomTextView *textView;
  id v3;

  textView = self->_textView;
  -[_CNAtomTextView textStorage](textView, "textStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", objc_msgSend(v3, "length"), 0);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNComposeRecipientTextView;
  v6 = -[CNComposeRecipientTextView canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, a4);
  if (sel_selectAll_ != a3)
    return v6;
  -[_CNAtomTextView text](self->_textView, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "length") != 0;

  return v7;
}

- (id)_placeholderAttachmentWithStaticWidth
{
  uint64_t v2;
  double v3;
  double v4;
  CNComposeRecipient *v5;
  CNComposeRecipientAtom *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _CNAtomTextAttachment *v11;

  v2 = MEMORY[0x1E0C9D648];
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = -[CNComposeRecipient initWithContact:address:kind:]([CNComposeRecipient alloc], "initWithContact:address:kind:", 0, CFSTR("email@me.com"), 0);
  v6 = -[CNComposeRecipientAtom initWithFrame:recipient:]([CNComposeRecipientAtom alloc], "initWithFrame:recipient:", v5, v3, v4, *(double *)(v2 + 16), *(double *)(v2 + 24));
  -[CNAtomView intrinsicContentSize](v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  v11 = -[_CNAtomTextAttachment initWithAtomView:]([_CNAtomTextAttachment alloc], "initWithAtomView:", 0);
  -[_CNAtomTextAttachment setBounds:](v11, "setBounds:", v3, v4, v8, v10);
  -[_CNAtomTextAttachment setIsPlaceholder:](v11, "setIsPlaceholder:", 1);

  return v11;
}

- (_NSRange)_placeholderAttachmentRange
{
  void *v3;
  _CNAtomTextView *textView;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _NSRange result;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3010000000;
  v14 = 0;
  v15 = 0;
  v13 = &unk_1B1148B9B;
  -[CNComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    textView = self->_textView;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__CNComposeRecipientTextView__placeholderAttachmentRange__block_invoke;
    v9[3] = &unk_1E62BFE88;
    v9[4] = self;
    v9[5] = &v10;
    -[_CNAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", v9);
  }
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

void __57__CNComposeRecipientTextView__placeholderAttachmentRange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "placeholderAttachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNComposeRecipientAtom *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CNComposeRecipientAtom *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  __int128 v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _OWORD v39[3];
  _QWORD v40[2];
  CGRect v41;
  CGRect v42;

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CNComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CNComposeRecipientAtom alloc];
  objc_msgSend(v8, "frame");
  v14 = -[CNComposeRecipientAtom initWithFrame:recipient:presentationOptions:](v9, "initWithFrame:recipient:presentationOptions:", v7, objc_msgSend(v8, "presentationOptions"), v10, v11, v12, v13);

  -[CNAtomView setSeparatorHidden:](v14, "setSeparatorHidden:", 1);
  objc_msgSend(v8, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientAtom setTintColor:](v14, "setTintColor:", v15);

  -[CNAtomView setSelected:](v14, "setSelected:", 1);
  -[CNAtomView layoutSubviews](v14, "layoutSubviews");
  -[CNComposeRecipientAtom frame](v14, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[CNAtomView preferredWidth](v14, "preferredWidth");
  -[CNComposeRecipientAtom setFrame:](v14, "setFrame:", v17, v19, v22, v21);
  objc_msgSend(v8, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientAtom center](v14, "center");
  objc_msgSend(v23, "convertPoint:toView:", v6);
  v25 = v24;
  v27 = v26;

  v28 = objc_alloc(MEMORY[0x1E0CEA570]);
  v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v39[0] = *MEMORY[0x1E0C9BAA8];
  v39[1] = v29;
  v39[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v30 = (void *)objc_msgSend(v28, "initWithContainer:center:transform:", v6, v39, v25, v27);

  v31 = objc_alloc(MEMORY[0x1E0CEA568]);
  v32 = (void *)MEMORY[0x1E0CB3B18];
  -[CNComposeRecipientAtom bounds](v14, "bounds");
  v42 = CGRectInset(v41, 8.0, 8.0);
  objc_msgSend(v32, "valueWithCGRect:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v31, "initWithTextLineRects:", v34);

  -[CNAtomView effectiveTintColor](v14, "effectiveTintColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v36);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA90]), "initWithView:parameters:target:", v14, v35, v30);
  return v37;
}

- (void)dragEnteredAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  y = a3.y;
  x = a3.x;
  -[CNComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CNComposeRecipientTextView _placeholderAttachmentWithStaticWidth](self, "_placeholderAttachmentWithStaticWidth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", v7);

    v14 = 0.0;
    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView textContainer](self->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v9, &v14, x, y);

    -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
    if (v14 + -1.0 >= 0.0)
      v11 = v14 + -1.0;
    else
      v11 = -(v14 + -1.0);
    -[CNComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 >= 0.00000011920929)
    {
      -[CNComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, v10);
    }
    else
    {
      -[_CNAtomTextView textStorage](self->_textView, "textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, objc_msgSend(v13, "length"));

    }
  }
  -[CNComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");
}

- (void)dragMovedToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _CNAtomTextView *textView;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;

  y = a3.y;
  x = a3.x;
  -[CNComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[CNComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
    v9 = v8;
    v33 = 0.0;
    -[_CNAtomTextView layoutManager](self->_textView, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextView textContainer](self->_textView, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v11, &v33, x, y);

    if (v12 != v7 && v12 - v7 == 1)
    {
      v13 = v33;
      if (v33 <= 0.4 || v33 >= 0.9)
        goto LABEL_11;
    }
    else if (v12 == v7)
    {
LABEL_11:
      -[CNComposeRecipientTextView recipients](self, "recipients", v13, v24, v25, v26, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (!v23)
        -[_CNAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
      return;
    }
    -[_CNAtomTextView textStorage](self->_textView, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedStringWithBaseAttributes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
    textView = self->_textView;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __47__CNComposeRecipientTextView_dragMovedToPoint___block_invoke;
    v27 = &unk_1E62C00C8;
    v30 = v7;
    v31 = v9;
    v28 = v15;
    v29 = v18;
    v32 = v12;
    v20 = v18;
    v21 = v15;
    -[_CNAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", &v24);

    goto LABEL_11;
  }
}

uint64_t __47__CNComposeRecipientTextView_dragMovedToPoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "insertAttributedString:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)dragExited
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
  -[_CNAtomTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
  objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);

  -[CNComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", 0);
  -[_CNAtomTextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (void)dropItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _CNAtomTextView *textView;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  CNComposeRecipientTextView *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke;
  v29[3] = &unk_1E62BFE60;
  v29[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v29);
  v6 = -[CNComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
  v8 = v7;
  -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
  v17 = 552;
  textView = self->_textView;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_4;
  v24[3] = &unk_1E62C0140;
  v10 = v4;
  v25 = v10;
  v26 = self;
  v27 = v6;
  v28 = v8;
  -[_CNAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        -[CNComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations", v17);
        -[CNComposeRecipientTextView _setValue:forAtomLayoutOption:withRecipient:](self, "_setValue:forAtomLayoutOption:withRecipient:", MEMORY[0x1E0C9AAA0], CFSTR("CNAtomLayoutOptionShouldHide"), v15);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_6;
        v19[3] = &unk_1E62BF0D0;
        v19[4] = self;
        v19[5] = v15;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v19, 0.35);
        -[CNComposeHeaderView delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "composeRecipientView:didAddRecipient:", self, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v17), "resignFirstResponder");
  -[CNComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", 0);

}

void __40__CNComposeRecipientTextView_dropItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "atoms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_2;
  v12[3] = &unk_1E62BFED8;
  v9 = v3;
  v13 = v9;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_3;
    v10[3] = &unk_1E62C00F0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  }
}

uint64_t __40__CNComposeRecipientTextView_dropItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uncommentedAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uncommentedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", v5);

  return v6;
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeRecipient:", v3);

}

uint64_t __40__CNComposeRecipientTextView_dropItems___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_5;
  v3[3] = &unk_1E62C0118;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_setValue:forAtomLayoutOption:withRecipient:", MEMORY[0x1E0C9AAB0], CFSTR("CNAtomLayoutOptionShouldHide"), v6);
  objc_msgSend(*(id *)(a1 + 32), "_atomAttachmentForRecipient:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (a3)
    objc_msgSend(v7, "_insertAtomAttachment:atCharacterIndex:", v9, v8 + a3);
  else
    objc_msgSend(v7, "_insertAtomAttachment:andReplaceCharactersInRange:", v9, v8, *(_QWORD *)(a1 + 48));

}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "atomViewForRecipient:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)composeRecipientAtomDisambiguate:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[CNComposeHeaderView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView selectedAtoms](self, "selectedAtoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
      objc_msgSend(v4, "composeRecipientView:disambiguateRecipientForAtom:", self, v7);
  }
  else
  {

  }
}

- (void)composeRecipientAtomStopDisambiguating
{
  id v3;

  -[CNComposeHeaderView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stopDisambiguatingForComposeRecipientView:", self);

}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNComposeHeaderView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeRecipientView:showPersonCardForAtom:", self, v5);

}

- (BOOL)indicatesUnsafeRecipientsWhenCollapsed
{
  return self->_indicatesUnsafeRecipientsWhenCollapsed;
}

- (void)setIndicatesUnsafeRecipientsWhenCollapsed:(BOOL)a3
{
  self->_indicatesUnsafeRecipientsWhenCollapsed = a3;
}

- (BOOL)usingActiveAppearance
{
  return self->_usingActiveAppearance;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)didIgnoreFirstResponderResign
{
  return self->_didIgnoreFirstResponderResign;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (BOOL)showsAddButtonWhenExpanded
{
  return self->_showsAddButtonWhenExpanded;
}

- (BOOL)expandRecipientsInNamedGroups
{
  return self->_expandRecipientsInNamedGroups;
}

- (void)setExpandRecipientsInNamedGroups:(BOOL)a3
{
  self->_expandRecipientsInNamedGroups = a3;
}

- (BOOL)shouldAlwaysShowAddContactsButton
{
  return self->_shouldAlwaysShowAddContactsButton;
}

- (void)setShouldAlwaysShowAddContactsButton:(BOOL)a3
{
  self->_shouldAlwaysShowAddContactsButton = a3;
}

- (UIColor)typingTextColor
{
  return self->_typingTextColor;
}

- (void)setTypingTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_typingTextColor, a3);
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (int)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int)a3
{
  self->_hideLastAtomComma = a3;
}

- (BOOL)editable
{
  return self->_editable;
}

- (_CNAtomTextAttachment)placeholderAttachment
{
  return self->_placeholderAttachment;
}

- (void)setPlaceholderAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderAttachment, a3);
}

- (UIView)atomContainerView
{
  return self->_atomContainerView;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)keyboardIsHiding
{
  return self->_keyboardIsHiding;
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  self->_keyboardIsHiding = a3;
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, a3);
}

- (NSObject)keyboardDidHideNotificationObserver
{
  return self->_keyboardDidHideNotificationObserver;
}

- (void)setKeyboardDidHideNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardDidHideNotificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardDidHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_atomContainerView, 0);
  objc_storeStrong((id *)&self->_placeholderAttachment, 0);
  objc_storeStrong((id *)&self->_typingTextColor, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_recipientsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_collapsableUpdateTimer, 0);
  objc_storeStrong((id *)&self->_dropTarget, 0);
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_atomLayoutOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_atomPresentationOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_atomViews, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_inactiveTextColor, 0);
  objc_storeStrong((id *)&self->_inactiveTextView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
