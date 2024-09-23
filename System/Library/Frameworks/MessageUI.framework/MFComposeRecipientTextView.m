@implementation MFComposeRecipientTextView

+ (id)defaultFont
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_11, CFSTR("MFComposeRecipientTextViewDefaultFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __41__MFComposeRecipientTextView_defaultFont__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)dealloc
{
  objc_super v3;

  -[_MFAtomTextView setHostRecipientView:](self->_textView, "setHostRecipientView:", 0);
  -[_MFAtomTextView setDelegate:](self->_textView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeRecipientTextView dealloc](&v3, sel_dealloc);
}

- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MFComposeRecipientTextView *v10;
  MFDragSource *v11;
  MFDragSource *dragSource;
  MFDropTarget *v13;
  MFDropTarget *dropTarget;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[MFComposeRecipientTextView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = -[MFDragSource initWithView:delegate:]([MFDragSource alloc], "initWithView:delegate:", v10, v9);
    dragSource = v10->_dragSource;
    v10->_dragSource = v11;

    -[MFDragSource setAllowsDragOverridingMasterSwitch:](v10->_dragSource, "setAllowsDragOverridingMasterSwitch:", 1);
    v13 = -[MFDropTarget initWithView:delegate:]([MFDropTarget alloc], "initWithView:delegate:", v10, v9);
    dropTarget = v10->_dropTarget;
    v10->_dropTarget = v13;

    v15 = (void *)MEMORY[0x1E0C99E20];
    +[MFComposeRecipient readableTypeIdentifiersForItemProvider](MFComposeRecipient, "readableTypeIdentifiersForItemProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97530], "readableTypeIdentifiersForItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    +[MFComposeRecipients readableTypeIdentifiersForItemProvider](MFComposeRecipients, "readableTypeIdentifiersForItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v19);

    -[MFDropTarget setAcceptableUTIs:](v10->_dropTarget, "setAcceptableUTIs:", v17);
    -[_MFAtomTextView setInteractions:](v10->_textView, "setInteractions:", MEMORY[0x1E0C9AA60]);

  }
  return v10;
}

- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  MFComposeRecipientTextView *v3;
  MFComposeRecipientTextView *v4;
  _MFAtomTextView *v5;
  uint64_t v6;
  _MFAtomTextView *textView;
  void *v8;
  _MFAtomTextView *v9;
  void *v10;
  _MFAtomTextView *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *atomViews;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  NSMutableDictionary *v21;
  NSMutableDictionary *atomLayoutOptionsByRecipient;
  NSMutableArray *v23;
  NSMutableArray *recipientsBeingRemoved;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MFComposeRecipientTextView;
  v3 = -[MFComposeHeaderView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFComposeRecipientTextView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = [_MFAtomTextView alloc];
    -[MFComposeRecipientTextView bounds](v4, "bounds");
    v6 = -[_MFAtomTextView initWithFrame:](v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (_MFAtomTextView *)v6;

    -[_MFAtomTextView textContainer](v4->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    v9 = v4->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_MFAtomTextView setDelegate:](v4->_textView, "setDelegate:", v4);
    v11 = v4->_textView;
    +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView setFont:](v11, "setFont:", v12);

    -[_MFAtomTextView setForceEnableDictation:](v4->_textView, "setForceEnableDictation:", 1);
    -[_MFAtomTextView setAutocorrectionType:](v4->_textView, "setAutocorrectionType:", 1);
    -[_MFAtomTextView setAutocapitalizationType:](v4->_textView, "setAutocapitalizationType:", 0);
    -[_MFAtomTextView setKeyboardType:](v4->_textView, "setKeyboardType:", 7);
    -[_MFAtomTextView setBounces:](v4->_textView, "setBounces:", 0);
    -[_MFAtomTextView setAutoresizingMask:](v4->_textView, "setAutoresizingMask:", 0);
    -[_MFAtomTextView setHostRecipientView:](v4->_textView, "setHostRecipientView:", v4);
    -[_MFAtomTextView layoutManager](v4->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v4);

    -[_MFAtomTextView layoutManager](v4->_textView, "layoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsNonContiguousLayout:", 1);

    -[_MFAtomTextView setScrollsToTop:](v4->_textView, "setScrollsToTop:", 0);
    -[MFComposeRecipientTextView addSubview:](v4, "addSubview:", v4->_textView);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v15;

    -[MFHeaderLabelView removeFromSuperview](v4->super._labelView, "removeFromSuperview");
    -[_MFAtomTextView addSubview:](v4->_textView, "addSubview:", v4->super._labelView);
    -[MFComposeRecipientTextView _setAddButtonVisible:animated:](v4, "_setAddButtonVisible:animated:", 0, 0);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tapGestureRecognized_);
    objc_msgSend(v17, "setCancelsTouchesInView:", 0);
    -[MFComposeRecipientTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel__longPressGestureRecognized_);
    objc_msgSend(v18, "setCancelsTouchesInView:", 0);
    -[MFComposeRecipientTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v18);
    v4->_textViewExclusionPathsAreValid = 1;
    v4->_atomViewAnimationDepth = 0;
    v4->_parentIsClosing = 0;
    v4->_isTextFieldCollapsed = 0;
    v4->_collapsedStateInitialized = 0;
    v4->_indicatesUnsafeRecipientsWhenCollapsed = 0;
    v4->_notifyDelegateOfSizeChange = 1;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    atomPresentationOptionsByRecipient = v4->_atomPresentationOptionsByRecipient;
    v4->_atomPresentationOptionsByRecipient = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    atomLayoutOptionsByRecipient = v4->_atomLayoutOptionsByRecipient;
    v4->_atomLayoutOptionsByRecipient = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recipientsBeingRemoved = v4->_recipientsBeingRemoved;
    v4->_recipientsBeingRemoved = v23;

    v4->_showsAddButtonWhenExpanded = 1;
    -[MFComposeRecipientTextView setEditable:animated:](v4, "setEditable:animated:", 1, 0);

  }
  return v4;
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
  double v11;
  double v12;
  void *textView;
  double v14;
  void *v15;
  CGRect *p_addButtonFrame;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  BOOL v22;
  uint64_t v23;
  CGFloat MinX;
  double v28;
  CGFloat MaxX;
  CGFloat v30;
  CGFloat v31;
  objc_super v32;
  objc_super v33;
  CGRect v34;

  v33.receiver = self;
  v33.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView layoutSubviews](&v33, sel_layoutSubviews);
  v3 = -[MFComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
  -[MFComposeHeaderView _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (!MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    -[_MFAtomTextView bounds](self->_textView, "bounds");
    if (v12 <= 0.00000011920929)
      textView = self;
    else
      textView = self->_textView;
    objc_msgSend(textView, "bounds");
    v11 = v14;
  }
  -[_MFAtomTextView setFrame:](self->_textView, "setFrame:", v5, v7, v9, v11);
  -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  -[_MFAtomTextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");

  -[MFComposeRecipientTextView bounds](self, "bounds");
  UIRoundToViewScale();
  if (self->_addButton)
  {
    p_addButtonFrame = &self->_addButtonFrame;
    x = self->_addButtonFrame.origin.x;
    y = self->_addButtonFrame.origin.y;
    width = self->_addButtonFrame.size.width;
    height = self->_addButtonFrame.size.height;
    UIRoundToViewScale();
    self->_addButtonFrame.origin.y = v21;
    v22 = -[MFComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
    -[MFComposeHeaderView _contentRect](self, "_contentRect");
    if (v22)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v23);
      v28 = self->_addButtonFrame.size.width;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      v28 = self->_addButtonFrame.size.width;
      MinX = MaxX - v28;
    }
    p_addButtonFrame->origin.x = MinX;
    v30 = self->_addButtonFrame.origin.y;
    v31 = self->_addButtonFrame.size.height;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    if (!CGRectEqualToRect(*(CGRect *)&MinX, v34))
    {
      -[UIButton setFrame:](self->_addButton, "setFrame:", p_addButtonFrame->origin.x, self->_addButtonFrame.origin.y, self->_addButtonFrame.size.width, self->_addButtonFrame.size.height);
      -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
    }
  }
  if (!-[MFComposeRecipientTextView editable](self, "editable"))
    -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
  if (v3)
  {
    v32.receiver = self;
    v32.super_class = (Class)MFComposeRecipientTextView;
    -[MFComposeHeaderView layoutSubviews](&v32, sel_layoutSubviews);
  }
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 1;
}

- (void)refreshPreferredContentSize
{
  _MFAtomTextView *textView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView refreshPreferredContentSize](&v4, sel_refreshPreferredContentSize);
  textView = self->_textView;
  -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  -[_MFAtomTextView setTextContainerInset:](textView, "setTextContainerInset:");
  -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
  -[MFComposeRecipientTextView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_MFAtomTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
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
  -[MFComposeRecipientTextView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
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
  -[MFComposeRecipientTextView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
    -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
}

- (void)_removeAllRecipients
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "length");

  if (v3)
  {
    -[_MFAtomTextView textStorage](self->_textView, "textStorage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "length");

    -[_MFAtomTextView textStorage](self->_textView, "textStorage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteCharactersInRange:", 0, v4);

    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView textContainer](self->_textView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ensureLayoutForTextContainer:", v5);

  }
}

- (void)setAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFComposeRecipientTextView recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[MFComposeRecipientTextView _removeAllRecipients](self, "_removeAllRecipients");
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForAddress:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "containsObject:", v13) & 1) == 0)
        {
          -[MFComposeRecipientTextView addRecipient:notify:](self, "addRecipient:notify:", v13, 0);
          objc_msgSend(v8, "addObject:", v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[MFComposeRecipientTextView _recipientsWereAdded:](self, "_recipientsWereAdded:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(v6, "count");
    v15 = objc_msgSend(v8, "count");
    if (v14)
      v16 = v6;
    else
      v16 = 0;
    if (v15)
      v17 = v8;
    else
      v17 = 0;
    objc_msgSend(WeakRetained, "composeRecipientView:didReplaceRecipients:withRecipients:", self, v16, v17, (_QWORD)v18);
  }
  -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView", (_QWORD)v18);
  -[MFComposeRecipientTextView reflow](self, "reflow");

}

- (NSArray)recipients
{
  void *v3;
  _MFAtomTextView *textView;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MFComposeRecipientTextView_recipients__block_invoke;
  v7[3] = &unk_1E5A66030;
  v5 = v3;
  v8 = v5;
  -[_MFAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v7);

  return (NSArray *)v5;
}

void __40__MFComposeRecipientTextView_recipients__block_invoke(uint64_t a1, void *a2)
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
  -[MFComposeRecipientTextView _removeAllRecipients](self, "_removeAllRecipients");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MFComposeRecipientTextView_setRecipients___block_invoke;
  v5[3] = &unk_1E5A66058;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");

}

uint64_t __44__MFComposeRecipientTextView_setRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecipient:", a2);
}

- (void)addRecipient:(id)a3
{
  -[MFComposeRecipientTextView addRecipient:notify:](self, "addRecipient:notify:", a3, 1);
}

- (void)addRecipient:(id)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[MFComposeRecipientTextView recipients](self, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientTextView addRecipient:index:animate:notify:](self, "addRecipient:index:animate:notify:", v7, objc_msgSend(v6, "count"), 0, v4);

}

- (void)_addRecord:(void *)a3 identifier:(int)a4
{
  uint64_t v4;
  id WeakRetained;
  id v8;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForRecord:identifier:", self, a3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MFComposeRecipientTextView addRecipient:](self, "addRecipient:", v8);
}

- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  id WeakRetained;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForRecord:property:identifier:", self, a3, v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientTextView addRecipient:](self, "addRecipient:", v9);

  }
  else
  {
    -[MFComposeRecipientTextView _addRecord:identifier:](self, "_addRecord:identifier:", a3, v5);
  }

}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  -[MFComposeRecipientTextView addRecipient:index:animate:notify:](self, "addRecipient:index:animate:notify:", a3, a4, a5, 1);
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5 notify:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a6;
  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v7)
    -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
  if (objc_msgSend(v10, "isGroup"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v10, "children", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          -[MFComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), a4, v7);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v10)
  {
    -[MFComposeRecipientTextView recipients](self, "recipients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v10);

    if ((v16 & 1) == 0)
    {
      -[MFComposeRecipientTextView _atomAttachmentForRecipient:](self, "_atomAttachmentForRecipient:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v11, a4);
      -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", a4 + 1, 0);
      -[MFComposeRecipientTextView undoManager](self, "undoManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerUndoWithTarget:selector:object:", self, sel_removeRecipient_, v10);
      if ((objc_msgSend(v17, "isUndoing") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ADDRESS_ADDITION"), &stru_1E5A6A588, CFSTR("Main"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActionName:", v19);

      }
      if (v6)
      {
        v25 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeRecipientTextView _recipientsWereAdded:](self, "_recipientsWereAdded:", v20);

      }
      goto LABEL_19;
    }
  }
LABEL_20:

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

- (void)_recipientsWereAdded:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
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
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "composeRecipientView:didAddRecipients:", self, v4);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(WeakRetained, "composeRecipientView:didAddRecipient:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MFComposeRecipientTextViewDidChangeNotification"), self, 0);

}

- (void)_didRemoveRecipient:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientView:didRemoveRecipient:", self, v9);
  -[MFComposeRecipientTextView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerUndoWithTarget:selector:object:", self, sel_addRecipient_, v9);
  if ((objc_msgSend(v5, "isUndoing") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADDRESS_DELETION"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionName:", v7);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MFComposeRecipientTextViewDidChangeNotification"), self, 0);

}

- (void)removeRecipient:(id)a3
{
  id v4;
  _MFAtomTextView *textView;
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
  const char *v17;
  __int128 v18;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v17 = "";
  v18 = xmmword_1ABAA0BD0;
  textView = self->_textView;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__MFComposeRecipientTextView_removeRecipient___block_invoke;
  v11 = &unk_1E5A66080;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[_MFAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", &v8);
  if (v15[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_MFAtomTextView textStorage](self->_textView, "textStorage", v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteCharactersInRange:", v15[4], v15[5]);

    -[MFComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", v6);
  }

  _Block_object_dispose(&v14, 8);
}

void __46__MFComposeRecipientTextView_removeRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  int v10;
  uint64_t v11;

  objc_msgSend(a2, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

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
  id WeakRetained;
  void *v6;
  id v7;
  _MFAtomTextView *textView;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForAddress:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v7 = -[MFComposeRecipientTextView _userEnteredTextWithRange:](self, "_userEnteredTextWithRange:", &v11);
    textView = self->_textView;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__MFComposeRecipientTextView_addAddress___block_invoke;
    v9[3] = &unk_1E5A660A8;
    v9[4] = self;
    v10 = v11;
    -[_MFAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v9);
    -[MFComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", v6, (_QWORD)v11, 1);
    -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", (_QWORD)v11 + 1, 0);
  }

}

void __41__MFComposeRecipientTextView_addAddress___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 464), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteCharactersInRange:", a1[5], a1[6]);

}

- (BOOL)containsAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_MFAtomTextView atoms](self->_textView, "atoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__MFComposeRecipientTextView_containsAddress___block_invoke;
  v9[3] = &unk_1E5A660D0;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "count") != 0;

  return (char)v4;
}

uint64_t __46__MFComposeRecipientTextView_containsAddress___block_invoke(uint64_t a1, void *a2)
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
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientViewRequestAddRecipient:", self);

}

- (MFComposeRecipientTextViewDelegate)delegate
{
  return (MFComposeRecipientTextViewDelegate *)objc_loadWeakRetained(&self->super._delegate);
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setDelegate:](&v3, sel_setDelegate_, a3);
}

- (NSArray)addresses
{
  void *v2;
  void *v3;

  -[MFComposeRecipientTextView recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_commentedAddress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)uncommentedAddresses
{
  void *v2;
  void *v3;

  -[MFComposeRecipientTextView recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_uncommentedAddress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setEditable:(BOOL)a3
{
  -[MFComposeRecipientTextView setEditable:animated:](self, "setEditable:animated:", a3, 1);
}

- (void)setEditable:(BOOL)a3 animated:(BOOL)a4
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
  if (self->_editable != a3)
  {
    v4 = a4;
    self->_editable = a3;
    collapsableUpdateTimer = self->_collapsableUpdateTimer;
    if (collapsableUpdateTimer)
    {
      -[NSTimer invalidate](collapsableUpdateTimer, "invalidate");
      v7 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = 0;

      *(_DWORD *)&a3 = self->_editable;
    }
    v13 = !a3;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0C99DB8];
      -[MFComposeRecipientTextView methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__setTextViewIsCollapsed_animated_);
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
      -[MFComposeRecipientTextView _setTextViewIsCollapsed:animated:](self, "_setTextViewIsCollapsed:animated:", !a3, 0);
    }
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    -[UIView setHidden:](self->super._separator, "setHidden:");
  }
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  -[MFComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility");
  -[MFComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");
}

- (void)_updateAddButtonVisibility
{
  _BOOL8 v3;

  v3 = self->_editable
    && self->_expanded
    && self->_showsAddButtonWhenExpanded
    && +[MFAddressBookManager isAuthorizedToUseAddressBook](MFAddressBookManager, "isAuthorizedToUseAddressBook")&& -[MFComposeRecipientTextView _canAddAdditionalAtoms](self, "_canAddAdditionalAtoms");
  -[MFComposeRecipientTextView _setAddButtonVisible:animated:](self, "_setAddButtonVisible:animated:", v3, 1);
}

- (void)setShowsAddButtonWhenExpanded:(BOOL)a3
{
  if (self->_showsAddButtonWhenExpanded != a3)
  {
    self->_showsAddButtonWhenExpanded = a3;
    -[MFComposeRecipientTextView _updateAddButtonVisibility](self, "_updateAddButtonVisibility");
    -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
  }
}

- (BOOL)_hasUnsafeRecipients
{
  _MFAtomTextView *textView;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  textView = self->_textView;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MFComposeRecipientTextView__hasUnsafeRecipients__block_invoke;
  v5[3] = &unk_1E5A660F8;
  v5[4] = self;
  v5[5] = &v6;
  -[_MFAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__MFComposeRecipientTextView__hasUnsafeRecipients__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_atomPresentationOptionsForRecipient:", v4);

  if ((v3 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)_userEnteredTextWithRange:(_NSRange *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  int64_t v16;
  NSUInteger v17;
  __CFString *v19;

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_MFAtomTextView selectedRange](self->_textView, "selectedRange");
  v9 = v7 + v8;
  if (v7 + v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "substringToIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "textAttachmentCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:", v11, 4);
  v14 = v13;

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = v12 + v14;
  v16 = v9 - v15;
  v17 = (v9 - v15) & ~((uint64_t)(v9 - v15) >> 63);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL || v16 <= 0)
  {
    v19 = &stru_1E5A6A588;
    if (!a3)
      goto LABEL_13;
LABEL_12:
    a3->location = v15;
    a3->length = v17;
    goto LABEL_13;
  }
  objc_msgSend(v6, "substringWithRange:", v15, v17);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3)
    goto LABEL_12;
LABEL_13:

  return v19;
}

- (NSString)text
{
  return (NSString *)-[MFComposeRecipientTextView _userEnteredTextWithRange:](self, "_userEnteredTextWithRange:", 0);
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

  -[MFComposeRecipientTextView bounds](self, "bounds");
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
  -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfGlyphs");

  -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MFComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke;
  v8[3] = &unk_1E5A66120;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__MFComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke(uint64_t result)
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
    -[_MFAtomTextView setFont:](self->_textView, "setFont:", *p_baseFont);
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

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setProperty:(int)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientTextView setProperties:](self, "setProperties:", v5);

}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
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

  v7 = -[MFComposeRecipientTextView numberOfRowsOfTextInField](self, "numberOfRowsOfTextInField");
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
    -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
    v11 = (v16 - v17) * (double)v10;
  }
  return v12 + v11;
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  unint64_t v8;
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  void *v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  -[NSMutableDictionary objectForKey:](self->_atomPresentationOptionsByRecipient, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(WeakRetained, "presentationOptionsForRecipient:", v4);
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](atomPresentationOptionsByRecipient, "setObject:forKey:", v10, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_invalidateAtomPresentationOptionsCache
{
  -[NSMutableDictionary removeAllObjects](self->_atomPresentationOptionsByRecipient, "removeAllObjects");
}

- (void)setLabel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setLabel:](&v5, sel_setLabel_, v4);
  -[MFComposeRecipientTextView reflow](self, "reflow");
  -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");

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
    -[MFComposeRecipientTextView interactionTintColor](self, "interactionTintColor");
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
  -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
}

- (id)_baseAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  -[MFComposeRecipientTextView typingTextColor](self, "typingTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)MFComposeRecipientTextView;
    -[MFComposeHeaderView _baseAttributes](&v9, sel__baseAttributes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    -[MFComposeRecipientTextView typingTextColor](self, "typingTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1140]);

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFComposeRecipientTextView;
    -[MFComposeHeaderView _baseAttributes](&v8, sel__baseAttributes);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)clearText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _MFAtomTextView *textView;
  id v19;
  _QWORD v20[4];
  id v21;
  MFComposeRecipientTextView *v22;
  id v23;

  -[_MFAtomTextView delegate](self->_textView, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextView setDelegate:](self->_textView, "setDelegate:", 0);
  -[_MFAtomTextView unmarkText](self->_textView, "unmarkText");
  -[_MFAtomTextView setDelegate:](self->_textView, "setDelegate:", v3);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "textAttachmentCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(v9, "scanLocation");
      if (v11 >= objc_msgSend(v7, "length"))
        break;
      v23 = v10;
      v12 = objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v8, &v23);
      v13 = v23;

      if (objc_msgSend(v13, "length"))
      {
        v14 = objc_msgSend(v9, "scanLocation");
        v15 = objc_msgSend(v13, "length");
        v16 = objc_msgSend(v13, "length");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v14 - v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v17);

      }
      v10 = v13;
      if (((v12 | objc_msgSend(v9, "scanCharactersFromSet:intoString:", v8, 0)) & 1) == 0)
        goto LABEL_9;
    }
    v13 = v10;
LABEL_9:
    textView = self->_textView;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__MFComposeRecipientTextView_clearText__block_invoke;
    v20[3] = &unk_1E5A65430;
    v21 = v19;
    v22 = self;
    -[_MFAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v20);

  }
}

void __39__MFComposeRecipientTextView_clearText__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "rangeValue");
        v8 = v7;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "textStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deleteCharactersInRange:", v6, v8);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)invalidateAtomPresentationOptions
{
  -[NSMutableDictionary removeAllObjects](self->_atomPresentationOptionsByRecipient, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_atomLayoutOptionsByRecipient, "removeAllObjects");
  -[MFComposeRecipientTextView reflow](self, "reflow");
}

- (void)invalidateAtomPresentationOptionsForRecipient:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_atomPresentationOptionsByRecipient, "removeObjectForKey:");
  -[MFComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationOptions:", -[MFComposeRecipientTextView _atomPresentationOptionsForRecipient:](self, "_atomPresentationOptionsForRecipient:", v5));
  -[MFComposeRecipientTextView reflow](self, "reflow");

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
  id WeakRetained;
  void *v7;

  if (self->_parentIsClosing)
    goto LABEL_2;
  v2 = -[MFComposeRecipientTextView editable](self, "editable");
  if (!v2)
    return v2;
  -[MFComposeRecipientTextView text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
LABEL_2:
    LOBYTE(v2) = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MFComposeRecipientTextView text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "composeRecipientView:didFinishEnteringAddress:", self, v7);

    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)becomeFirstResponder
{
  return -[_MFAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[_MFAtomTextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (BOOL)_useRightToLeftLayout
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
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

  if (!-[_MFAtomTextView isEditingTextStorage](self->_textView, "isEditingTextStorage"))
  {
    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfGlyphs");

    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "characterRangeForGlyphRange:actualGlyphRange:", 0, v4, 0);
    v8 = v7;

    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v8, 0);

    if (-[MFComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed"))
      -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
  }
}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[MFComposeRecipientTextView _ensureAddButton](self, "_ensureAddButton");
  v12.receiver = self;
  v12.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeRecipientTextView layoutIfNeeded](&v12, sel_layoutIfNeeded);
  v6 = -[MFComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
  if (v6)
    v7 = 8;
  else
    v7 = 2;
  -[MFComposeHeaderView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", self->super._labelView, v7);
  -[MFComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);
  if (v3)
  {
    if (v6)
      v9 = 2;
    else
      v9 = 8;
    -[MFComposeHeaderView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", self->_addButton, v9);
    -[MFComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  return v5;
}

- (void)_recomputeTextContainerExclusionPaths
{
  uint64_t v3;
  void *v4;
  _MFAtomTextView *textView;
  void *v6;
  id v7;
  id v8;

  if (!self->_textViewExclusionPathsAreValid)
  {
    if (self->_expanded
      || (-[_MFAtomTextView attributedText](self->_textView, "attributedText"),
          v7 = (id)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v7, "length"),
          v7,
          v3))
    {
      -[MFComposeRecipientTextView _textContainerExclusionPathsWithAddButton:](self, "_textContainerExclusionPathsWithAddButton:", self->_showsAddButtonWhenExpanded);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_MFAtomTextView textContainer](self->_textView, "textContainer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setExclusionPaths:", v8);

      self->_textViewExclusionPathsAreValid = 1;
      textView = self->_textView;
      -[MFComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFAtomTextView setTypingAttributes:](textView, "setTypingAttributes:", v6);

      if (-[MFComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed"))
        -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");

    }
  }
}

- (void)_invalidateTextContainerExclusionPaths
{
  void *v3;
  id v4;

  if (self->_textViewExclusionPathsAreValid)
  {
    self->_textViewExclusionPathsAreValid = 0;
    objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientTextView ef_onScheduler:](self, "ef_onScheduler:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_recomputeTextContainerExclusionPaths");

  }
}

- (_NSRange)_rangeForComposeRecipientAtom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _MFAtomTextView *textView;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  const char *v17;
  int64x2_t v18;
  _NSRange result;

  v4 = a3;
  v5 = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3010000000;
  v17 = "";
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v4)
  {
    textView = self->_textView;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__MFComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke;
    v11[3] = &unk_1E5A66080;
    v12 = v4;
    v13 = &v14;
    -[_MFAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", v11);

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

void __60__MFComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
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

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
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
    -[NSMutableDictionary setObject:forKey:](self->_atomLayoutOptionsByRecipient, "setObject:forKey:");
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

  -[_MFAtomTextView text](self->_textView, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, 0);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_atomViews, "enumerateObjectsUsingBlock:", &__block_literal_global_117);
}

uint64_t __50__MFComposeRecipientTextView__resetSelectionState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:animated:", 0, 1);
}

- (BOOL)_textViewContainsAtomizedRecipients
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[MFComposeRecipientTextView recipients](self, "recipients");
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
  MFHeaderLabelView **p_labelView;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0DC1140];
  p_labelView = &self->super._labelView;
  -[MFHeaderLabelView textColor](self->super._labelView, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = *MEMORY[0x1E0DC1138];
  -[MFHeaderLabelView font](*p_labelView, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[MFHeaderLabelView text](self->super._labelView, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E5A6A588;
  v11 = (void *)objc_msgSend(v7, "initWithString:attributes:", v10, v6);

  return v11;
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
    v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:textContainer:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    inactiveTextView = self->_inactiveTextView;
    self->_inactiveTextView = v4;

    v6 = self->_inactiveTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
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

    -[MFComposeRecipientTextView addSubview:](self, "addSubview:", self->_inactiveTextView);
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
  double v11;

  -[MFComposeRecipientTextView _ensureInactiveTextView](self, "_ensureInactiveTextView");
  -[MFComposeRecipientTextView _attributedStringWithAtomizedRecipients](self, "_attributedStringWithAtomizedRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_inactiveTextView, "setAttributedText:", v3);

  -[UITextView frame](self->_inactiveTextView, "frame");
  -[_MFAtomTextView frame](self->_textView, "frame");
  v5 = v4;
  v7 = v6;
  -[_MFAtomTextView frame](self->_textView, "frame");
  v9 = v8;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    -[_MFAtomTextView frame](self->_textView, "frame");
  }
  else
  {
    +[MFComposeHeaderView preferredHeight](MFComposeRecipientTextView, "preferredHeight");
    v10 = v11;
  }
  -[UITextView setFrame:](self->_inactiveTextView, "setFrame:", v5, v7, v9, v10);
}

- (id)_attributedStringWithAtomizedRecipients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;

  if (-[MFComposeRecipientTextView _textViewContainsAtomizedRecipients](self, "_textViewContainsAtomizedRecipients"))
  {
    -[MFComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (self->_indicatesUnsafeRecipientsWhenCollapsed
      && -[MFComposeRecipientTextView _hasUnsafeRecipients](self, "_hasUnsafeRecipients"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1140]);
    }
    else
    {
      -[MFComposeRecipientTextView inactiveTextColor](self, "inactiveTextColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1140]);
    }

    -[MFComposeRecipientTextView recipients](self, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineFragmentRectForGlyphAtIndex:effectiveRange:", 0, 0);
    v10 = v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_msgSend(v7, "count");
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke;
    v24[3] = &unk_1E5A65B88;
    v14 = v7;
    v25 = v14;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2;
    v21[3] = &unk_1E5A66188;
    v15 = v4;
    v22 = v15;
    v23 = v10;
    objc_msgSend(v11, "mf_commaSeparatedRecipientListWithRecipientCount:prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:", v12, 0, v24, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v16, v15);
    -[MFComposeHeaderView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
    -[UITextView setTextContainerInset:](self->_inactiveTextView, "setTextContainerInset:");
    v17 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, 5.0, 5.0);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertAttributedString:atIndex:", v18, 0);
    -[MFComposeRecipientTextView _toString](self, "_toString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertAttributedString:atIndex:", v19, 0);

  }
  else
  {
    -[MFComposeRecipientTextView _toString](self, "_toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

id __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2(uint64_t a1, void *a2)
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
  void (**v12)(void *, uint64_t);
  double v13;
  double v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD aBlock[5];
  BOOL v26;

  v4 = a4;
  v5 = a3;
  collapsableUpdateTimer = self->_collapsableUpdateTimer;
  self->_collapsableUpdateTimer = 0;

  v8 = -[MFComposeRecipientTextView _isTextViewCollapsed](self, "_isTextViewCollapsed");
  if (v5)
    v9 = !-[MFComposeRecipientTextView _textViewContainsAtomizedRecipients](self, "_textViewContainsAtomizedRecipients");
  else
    v9 = 0;
  if (!self->_collapsedStateInitialized || ((v9 | v8 ^ v5 ^ 1) & 1) == 0)
  {
    self->_collapsedStateInitialized = 1;
    self->_isTextFieldCollapsed = v5;
    if (v5)
      -[MFComposeRecipientTextView _updateInactiveTextView](self, "_updateInactiveTextView");
    if (!MFModernUIApplicationPreferredContentSizeIsAccessibility())
    {
      -[_MFAtomTextView bounds](self->_textView, "bounds");
      -[_MFAtomTextView setBounds:](self->_textView, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke;
    aBlock[3] = &unk_1E5A65D00;
    aBlock[4] = self;
    v26 = v5;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2;
    v23[3] = &unk_1E5A65D28;
    v23[4] = self;
    v24 = v5;
    v12 = (void (**)(void *, uint64_t))_Block_copy(v23);
    if (v4)
    {
      -[UITextView setHidden:](self->_inactiveTextView, "setHidden:", 0);
      if (v5)
        v13 = 0.0;
      else
        v13 = 1.0;
      -[UITextView setAlpha:](self->_inactiveTextView, "setAlpha:", v13);
      if (v5)
        v14 = 1.0;
      else
        v14 = 0.0;
      -[_MFAtomTextView setAlpha:](self->_textView, "setAlpha:", v14);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v11, v12, 0.23);
    }
    else
    {
      v11[2](v11);
      v12[2](v12, 1);
    }
    if (v5)
    {
      -[UITextView text](self->_inactiveTextView, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = -[MFComposeRecipientTextView _delegateRespondsToSizeChange](self, "_delegateRespondsToSizeChange");

        if (v16)
        {
          -[MFComposeRecipientTextView bounds](self, "bounds");
          v18 = v17;
          -[UITextView frame](self->_inactiveTextView, "frame");
          -[MFComposeRecipientTextView _notifyDelegateOfNewSize:](self, "_notifyDelegateOfNewSize:", v18, v19);
          -[_MFAtomTextView bounds](self->_textView, "bounds");
          -[_MFAtomTextView setBounds:](self->_textView, "setBounds:");
        }
        goto LABEL_25;
      }
    }
    else
    {
      -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFAtomTextView textStorage](self->_textView, "textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v21, "length"), 0);

      -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFAtomTextView textContainer](self->_textView, "textContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ensureLayoutForTextContainer:", v22);

    }
LABEL_25:

  }
}

uint64_t __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  else
    v3 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", v3);
}

uint64_t __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 472), "setHidden:", *(_BYTE *)(result + 40) == 0);
  return result;
}

- (void)_ensureAddButton
{
  UIButton *v3;
  UIButton *addButton;
  _BOOL4 v5;
  double v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;

  if (!self->_addButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 5);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    addButton = self->_addButton;
    self->_addButton = v3;

    v5 = -[MFComposeRecipientTextView _isAddButtonVisible](self, "_isAddButtonVisible");
    v6 = 0.0;
    if (v5)
      v6 = 1.0;
    -[UIButton setAlpha:](self->_addButton, "setAlpha:", v6);
    -[UIButton setAccessibilityIdentifier:](self->_addButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46AF8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT_ACCESSIBILITY_LABEL"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](self->_addButton, "setAccessibilityLabel:", v8);

    -[UIButton setAutoresizingMask:](self->_addButton, "setAutoresizingMask:", 0);
    -[UIButton setAutoresizesSubviews:](self->_addButton, "setAutoresizesSubviews:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->_addButton, "addTarget:action:forControlEvents:", self, sel__addButtonTapped_, 64);
    -[UIButton frame](self->_addButton, "frame");
    self->_addButtonFrame.origin.x = v9;
    self->_addButtonFrame.origin.y = v10;
    self->_addButtonFrame.size.width = v11;
    self->_addButtonFrame.size.height = v12;
    -[MFComposeRecipientTextView addSubview:](self, "addSubview:", self->_addButton);
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
  void *v7;
  void *v8;
  double v9;
  __int128 v10;
  UIButton *addButton;
  CGAffineTransform v12;
  CGAffineTransform v13;
  _QWORD aBlock[5];
  BOOL v15;

  v4 = a4;
  v5 = a3;
  if (-[MFComposeRecipientTextView _isAddButtonVisible](self, "_isAddButtonVisible") != a3)
  {
    if (v5 && !self->_addButton)
      -[MFComposeRecipientTextView _ensureAddButton](self, "_ensureAddButton");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MFComposeRecipientTextView__setAddButtonVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5A65D00;
    aBlock[4] = self;
    v15 = v5;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v4)
    {
      v9 = 1.0;
      if (v5)
        v9 = 0.0;
      -[UIButton setAlpha:](self->_addButton, "setAlpha:", v9);
      if (v5)
      {
        CGAffineTransformMakeTranslation(&v13, 2.0, 0.0);
      }
      else
      {
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v13.c = v10;
        *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      addButton = self->_addButton;
      v12 = v13;
      -[UIButton setTransform:](addButton, "setTransform:", &v12);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.2);
    }
    else
    {
      (*((void (**)(void *))v7 + 2))(v7);
    }

  }
}

void __60__MFComposeRecipientTextView__setAddButtonVisible_animated___block_invoke(uint64_t a1)
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

- (void)_tapGestureRecognized:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
    -[_MFAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");

}

- (void)_longPressGestureRecognized:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[_MFAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");

}

- (BOOL)_canAddAdditionalAtoms
{
  void *v3;
  BOOL v4;

  if (self->_maxRecipients < 1)
    return 1;
  -[MFComposeRecipientTextView recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") < self->_maxRecipients;

  return v4;
}

- (id)_atomAttachmentForRecipient:(id)a3
{
  id v4;
  MFModernComposeRecipientAtom *v5;
  MFModernComposeRecipientAtom *v6;
  _MFAtomTextAttachment *v7;

  v4 = a3;
  v5 = [MFModernComposeRecipientAtom alloc];
  v6 = -[MFModernComposeRecipientAtom initWithFrame:recipient:](v5, "initWithFrame:recipient:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MFModernAtomView setPresentationOptions:](v6, "setPresentationOptions:", -[MFComposeRecipientTextView _atomPresentationOptionsForRecipient:](self, "_atomPresentationOptionsForRecipient:", v4));
  v7 = -[_MFAtomTextAttachment initWithAtomView:]([_MFAtomTextAttachment alloc], "initWithAtomView:", v6);

  return v7;
}

- (void)_insertAtomAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  -[MFComposeRecipientTextView _insertAtomAttachment:andReplaceCharactersInRange:](self, "_insertAtomAttachment:andReplaceCharactersInRange:", a3, a4, 0);
}

- (void)_insertAtomAttachment:(id)a3 andReplaceCharactersInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  -[MFComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedStringWithBaseAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", location, length, v8);
  else
    objc_msgSend(v9, "insertAttributedString:atIndex:", v8, location);

  if (!-[_MFAtomTextView isEditingTextStorage](self->_textView, "isEditingTextStorage"))
    -[MFComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");

}

- (void)_addAddressAtomSubview:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_atomViews, "containsObject:") & 1) == 0)
  {
    objc_msgSend(v4, "setDelegate:", self);
    -[NSMutableArray addObject:](self->_atomViews, "addObject:", v4);
    -[_MFAtomTextView addSubview:](self->_textView, "addSubview:", v4);
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
  _MFAtomTextView *textView;
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
  v10[2] = __47__MFComposeRecipientTextView_atomViewsInRange___block_invoke;
  v10[3] = &unk_1E5A66030;
  v8 = v6;
  v11 = v8;
  -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v10);

  return v8;
}

uint64_t __47__MFComposeRecipientTextView_atomViewsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)selectedAtoms
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_MFAtomTextView selectedRange](self->_textView, "selectedRange");
  return -[MFComposeRecipientTextView atomViewsInRange:](self, "atomViewsInRange:", v3, v4);
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
  -[_MFAtomTextView atoms](self->_textView, "atoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v12 = objc_msgSend(v5, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MFComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke;
  v8[3] = &unk_1E5A661B0;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__MFComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double MaxX;
  double v8;
  id v9;
  CGRect v10;

  v9 = a2;
  objc_msgSend(v9, "frame");
  MaxX = CGRectGetMaxX(v10);
  objc_msgSend(v9, "frame");
  if (*(double *)(a1 + 40) < MaxX + v8 * -0.5)
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
  void *v12;
  _BOOL4 v13;
  id WeakRetained;
  int v15;
  void *v16;
  void *v17;
  NSMutableArray *recipientsBeingRemoved;
  void *v19;
  _MFAtomTextView *textView;
  _QWORD v22[5];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("\t"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR(",")))
  {
    objc_msgSend(v9, "markedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

  }
  else
  {
    v13 = 0;
  }
  if ((v11 | v13) != 1)
  {
    if (objc_msgSend(v10, "isEqualToString:", &stru_1E5A6A588))
    {
      if (length == 1)
      {
        -[MFComposeRecipientTextView _atomViewAtCharacterIndex:](self, "_atomViewAtCharacterIndex:", location);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v15 = objc_msgSend(v16, "isSelected");
          if (v15)
          {
            recipientsBeingRemoved = self->_recipientsBeingRemoved;
            objc_msgSend(v17, "recipient");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](recipientsBeingRemoved, "addObject:", v19);

          }
          else
          {
            -[MFComposeRecipientTextView selectComposeRecipientAtom:](self, "selectComposeRecipientAtom:", v17);
          }

          goto LABEL_19;
        }
      }
      else
      {
        textView = self->_textView;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __79__MFComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke;
        v22[3] = &unk_1E5A66030;
        v22[4] = self;
        -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v22);
      }
    }
    LOBYTE(v15) = 1;
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (!-[MFComposeRecipientTextView finishEnteringRecipient](self, "finishEnteringRecipient")
    && (objc_opt_respondsToSelector() & v11) == 1)
  {
    objc_msgSend(WeakRetained, "composeRecipientViewReturnPressed:", self);
  }

  LOBYTE(v15) = 0;
LABEL_19:

  return v15;
}

void __79__MFComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "recipient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "addObject:", v3);

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v17;
  MFComposeRecipientTextView *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "selectedRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke;
  v17 = &unk_1E5A66200;
  v18 = self;
  v20 = v5;
  v21 = v7;
  v12 = v8;
  v19 = v12;
  objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, &v14);

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientView:didSelectRecipients:", self, v12, v14, v15, v16, v17, v18);

}

void __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[4];

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  v10 = v9;

  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2;
  v13[3] = &unk_1E5A661D8;
  v15 = v19;
  v16 = v8;
  v13[1] = 3221225472;
  v17 = v10;
  v18 = *(_OWORD *)(a1 + 48);
  v14 = v11;
  objc_msgSend(v12, "enumerateAtomsInCharacterRange:withBlock:", v8, v10, v13);

  _Block_object_dispose(v19, 8);
}

void __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6];
  v5 = a1[8];
  v6 = a1[9];
  v7 = v4 < v5 || v4 - v5 >= v6;
  v14 = v3;
  if (v7)
  {
    if (objc_msgSend(v3, "isSelected"))
      objc_msgSend(v14, "setSelected:animated:", 0, 0);
  }
  else
  {
    v8 = v5 + v6 - 1;
    v9 = v4 == v5;
    v10 = 4;
    if (!v9)
      v10 = 1;
    if (v4 == v8)
      v11 = v10 | 8;
    else
      v11 = v10;
    objc_msgSend(v3, "setSelected:animated:style:", 1, 0, v11);
    v12 = (void *)a1[4];
    objc_msgSend(v14, "recipient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);

}

- (void)textViewDidChange:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_recipientsBeingRemoved, "count", a3))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_recipientsBeingRemoved;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          -[MFComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), (_QWORD)v10);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    -[NSMutableArray removeAllObjects](self->_recipientsBeingRemoved, "removeAllObjects");
  }
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFComposeRecipientTextView text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "composeRecipientView:textDidChange:", self, v9);

  }
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  id WeakRetained;

  self->_didIgnoreFirstResponderResign = 0;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "recipientViewDidBecomeFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientViewDidBecomeFirstResponder:", self);
  if (!-[MFComposeRecipientTextView _canAddAdditionalAtoms](self, "_canAddAdditionalAtoms"))
  {
    -[NSMutableArray lastObject](self->_atomViews, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSelected:animated:", 1, 1);

  }
  if (-[MFComposeRecipientTextView editable](self, "editable"))
    -[MFComposeRecipientTextView setExpanded:](self, "setExpanded:", 1);

}

- (void)atomTextViewDidResignFirstResponder:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "recipientViewShouldIgnoreFirstResponderChanges:", self))
  {
    self->_didIgnoreFirstResponderResign = 1;
  }
  else
  {
    -[MFComposeRecipientTextView finishEnteringRecipient](self, "finishEnteringRecipient");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "recipientViewDidResignFirstResponder:", self);
    -[MFComposeRecipientTextView _resetSelectionState](self, "_resetSelectionState");
    -[MFComposeRecipientTextView setExpanded:](self, "setExpanded:", 0);
  }

}

- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4
{
  _MFAtomTextView *textView;
  _QWORD v6[4];
  BOOL v7;

  textView = self->_textView;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__MFComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke;
  v6[3] = &__block_descriptor_33_e38_v16__0__MFModernComposeRecipientAtom_8l;
  v7 = a4 == 1;
  -[_MFAtomTextView enumerateAtoms:](textView, "enumerateAtoms:", v6);
  -[MFComposeRecipientTextView reflow](self, "reflow");
}

uint64_t __69__MFComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSeparatorIsLeftAligned:", *(unsigned __int8 *)(a1 + 32));
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int64_t atomViewAnimationDepth;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  double v23;
  double v24;
  double v25;
  double width;
  double height;
  double v28;
  double v29;
  void *v30;
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
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_MFAtomTextView baseWritingDirection](self->_textView, "baseWritingDirection");
    objc_msgSend(v8, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    objc_msgSend(v8, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v35[3] = &unk_1E5A66270;
    v35[4] = self;
    v39 = v10;
    v14 = v8;
    v36 = v14;
    v15 = v9;
    v37 = v15;
    v16 = v30;
    v38 = v16;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v35);

    atomViewAnimationDepth = self->_atomViewAnimationDepth;
    if (atomViewAnimationDepth <= 1)
      atomViewAnimationDepth = 1;
    self->_atomViewAnimationDepth = atomViewAnimationDepth - 1;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v18);
          -[MFComposeRecipientTextView _removeAddressAtomSubview:](self, "_removeAddressAtomSubview:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v19);
    }

    if (self->_editable)
    {
      -[_MFAtomTextView textContainerInset](self->_textView, "textContainerInset");
      objc_msgSend(v14, "usedRectForTextContainer:", v15);
      UIRoundToViewScale();
      v23 = v22;
      -[_MFAtomTextView bounds](self->_textView, "bounds");
      v25 = v24;
      if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
      {
        width = self->_currentTextRect.size.width;
        height = self->_currentTextRect.size.height;
      }
      else
      {
        -[_MFAtomTextView bounds](self->_textView, "bounds");
      }
      if (v25 != width || v23 != height)
      {
        v28 = *MEMORY[0x1E0C9D538];
        v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        self->_currentTextRect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
        self->_currentTextRect.origin.y = v29;
        self->_currentTextRect.size.width = v25;
        self->_currentTextRect.size.height = v23;
        if (!MFModernUIApplicationPreferredContentSizeIsAccessibility())
          -[_MFAtomTextView setFrame:](self->_textView, "setFrame:", v28, v29, v25, v23);
        -[MFComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
        -[MFComposeRecipientTextView _notifyDelegateOfSizeChange](self, "_notifyDelegateOfSizeChange");
      }
    }

  }
}

void __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  uint64_t v31;
  void (**v32)(_QWORD);
  void *v33;
  _QWORD aBlock[5];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  char v42;

  v7 = a2;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "atomView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isPlaceholder");
      if (v9)
        v11 = v10;
      else
        v11 = 1;
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v8, "recipient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_valueForAtomLayoutOption:withRecipient:", CFSTR("MFAtomLayoutOptionShouldBuildIn"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        objc_msgSend(*(id *)(a1 + 32), "_valueForAtomLayoutOption:withRecipient:", CFSTR("MFAtomLayoutOptionShouldHide"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        objc_msgSend(v9, "superview");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(*(id *)(a1 + 32), "_addAddressAtomSubview:", v9);
          if (v16)
            objc_msgSend(v9, "setAlpha:", 0.0);
          v14 = 1;
        }
        v18 = objc_msgSend(*(id *)(a1 + 32), "_atomPresentationOptionsForRecipient:", v12);
        if (objc_msgSend(v9, "presentationOptions") != v18)
          objc_msgSend(v9, "setPresentationOptions:", v18);
        objc_msgSend(v9, "setSeparatorStyle:", 0);
        objc_msgSend(v9, "setSeparatorHidden:", 0);
        objc_msgSend(v9, "setSeparatorIsLeftAligned:", *(_QWORD *)(a1 + 64) == 1);
        objc_msgSend(*(id *)(a1 + 40), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(_QWORD *)(a1 + 48));
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v9, "intrinsicContentSize");
        v26 = v25;
        objc_msgSend(v9, "frame");
        if (v24 != v28 || v26 != v27)
        {
          objc_msgSend(v9, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v24, v26);
          objc_msgSend(v9, "layoutSubviews");
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2;
        aBlock[3] = &unk_1E5A66248;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v37 = v20;
        v38 = v22;
        v39 = v24;
        v40 = v26;
        v29 = v9;
        v35 = v29;
        v30 = *(id *)(a1 + 40);
        v31 = *(_QWORD *)(a1 + 64);
        v36 = v30;
        v41 = v31;
        v42 = v16;
        v32 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (((objc_msgSend(*(id *)(a1 + 32), "_shouldAnimateAtomViewChanges") ^ 1 | v14) & 1) != 0)
          v32[2](v32);
        else
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v32, 0.25);
        if (v14 && objc_msgSend(*(id *)(a1 + 32), "_shouldAnimateAtomViewChanges"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "textColor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "performBuildInAnimationFromTextColor:withDuration:", v33, 0.25);

        }
        objc_msgSend(*(id *)(a1 + 56), "removeObject:", v29);

      }
    }
  }

}

uint64_t __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGRect v18;
  CGRect v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "convertGlyphRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");

  v11 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", 0, 0);
  if (v11 < v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
    CGRectGetMaxY(v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_baselineOffsetFromBottom");
    v19.origin.x = v3;
    v19.origin.y = v5;
    v19.size.width = v7;
    v19.size.height = v9;
    CGRectGetHeight(v19);
    objc_msgSend(*(id *)(a1 + 40), "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_baselineOffsetFromBottom");

  }
  objc_msgSend(*(id *)(a1 + 40), "edgeInsets");
  v14 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  UIRectIntegralWithScale();
  objc_msgSend(v14, "setFrame:");

  v16 = 0.0;
  if (!*(_BYTE *)(a1 + 96))
    v16 = 1.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v16);
}

- (BOOL)_delegateRespondsToSizeChange
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
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
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "composeHeaderView:didChangeSize:", self, width, height);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "composeRecipientView:didChangeSize:", self, width, height);
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
    v4[2] = __57__MFComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke;
    v4[3] = &unk_1E5A65480;
    v4[4] = self;
    objc_msgSend(v3, "addOperationWithBlock:", v4);

  }
}

uint64_t __57__MFComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frame");
  v3 = v2;
  v5 = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSizeChange");
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewSize:", v3, v5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 573) = 1;
  return result;
}

- (id)_placeholderAttachmentWithStaticWidth
{
  void *v2;
  MFModernComposeRecipientAtom *v3;
  double v4;
  double v5;
  MFModernComposeRecipientAtom *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _MFAtomTextAttachment *v11;

  +[MFComposeRecipient recipientWithProperty:address:](MFComposeRecipient, "recipientWithProperty:address:", *MEMORY[0x1E0CF5F98], CFSTR("email@me.com"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [MFModernComposeRecipientAtom alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = -[MFModernComposeRecipientAtom initWithFrame:recipient:](v3, "initWithFrame:recipient:", v2, *MEMORY[0x1E0C9D648], v5, *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MFModernAtomView intrinsicContentSize](v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  v11 = -[_MFAtomTextAttachment initWithAtomView:]([_MFAtomTextAttachment alloc], "initWithAtomView:", 0);
  -[_MFAtomTextAttachment setBounds:](v11, "setBounds:", v4, v5, v8, v10);
  -[_MFAtomTextAttachment setIsPlaceholder:](v11, "setIsPlaceholder:", 1);

  return v11;
}

- (_NSRange)_placeholderAttachmentRange
{
  void *v3;
  _MFAtomTextView *textView;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _NSRange result;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3010000000;
  v14 = 0;
  v15 = 0;
  v13 = "";
  -[MFComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    textView = self->_textView;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__MFComposeRecipientTextView__placeholderAttachmentRange__block_invoke;
    v9[3] = &unk_1E5A66080;
    v9[4] = self;
    v9[5] = &v10;
    -[_MFAtomTextView enumerateAtomAttachments:](textView, "enumerateAtomAttachments:", v9);
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

void __57__MFComposeRecipientTextView__placeholderAttachmentRange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "placeholderAttachment");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v11)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    *a5 = 1;
  }

}

- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MFModernComposeRecipientAtom *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MFModernComposeRecipientAtom *v14;
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
  v6 = a3;
  v7 = a4;
  -[MFComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MFModernComposeRecipientAtom alloc];
  objc_msgSend(v8, "frame");
  v14 = -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:](v9, "initWithFrame:recipient:presentationOptions:", v6, objc_msgSend(v8, "presentationOptions"), v10, v11, v12, v13);
  -[MFModernAtomView setSeparatorHidden:](v14, "setSeparatorHidden:", 1);
  objc_msgSend(v8, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernComposeRecipientAtom setTintColor:](v14, "setTintColor:", v15);

  -[MFModernAtomView setSelected:](v14, "setSelected:", 1);
  -[MFModernAtomView layoutSubviews](v14, "layoutSubviews");
  -[MFModernComposeRecipientAtom frame](v14, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[MFModernAtomView preferredWidth](v14, "preferredWidth");
  -[MFModernComposeRecipientAtom setFrame:](v14, "setFrame:", v17, v19, v22, v21);
  objc_msgSend(v8, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernComposeRecipientAtom center](v14, "center");
  objc_msgSend(v23, "convertPoint:toView:", v7);
  v25 = v24;
  v27 = v26;

  v28 = objc_alloc(MEMORY[0x1E0DC3770]);
  v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v39[0] = *MEMORY[0x1E0C9BAA8];
  v39[1] = v29;
  v39[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v30 = (void *)objc_msgSend(v28, "initWithContainer:center:transform:", v7, v39, v25, v27);
  v31 = objc_alloc(MEMORY[0x1E0DC3768]);
  v32 = (void *)MEMORY[0x1E0CB3B18];
  -[MFModernComposeRecipientAtom bounds](v14, "bounds");
  v42 = CGRectInset(v41, 8.0, 8.0);
  objc_msgSend(v32, "valueWithCGRect:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v31, "initWithTextLineRects:", v34);

  -[MFModernAtomView effectiveTintColor](v14, "effectiveTintColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v36);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v14, v35, v30);
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
  -[MFComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MFComposeRecipientTextView _placeholderAttachmentWithStaticWidth](self, "_placeholderAttachmentWithStaticWidth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", v7);

    v14 = 0.0;
    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView textContainer](self->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v9, &v14, x, y);

    -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
    if (v14 + -1.0 >= 0.0)
      v11 = v14 + -1.0;
    else
      v11 = -(v14 + -1.0);
    -[MFComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 >= 0.00000011920929)
    {
      -[MFComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, v10);
    }
    else
    {
      -[_MFAtomTextView textStorage](self->_textView, "textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, objc_msgSend(v13, "length"));

    }
  }
  -[MFComposeRecipientTextView _recomputeTextContainerExclusionPaths](self, "_recomputeTextContainerExclusionPaths");
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
  _MFAtomTextView *textView;
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
  -[MFComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[MFComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
    v9 = v8;
    v33 = 0.0;
    -[_MFAtomTextView layoutManager](self->_textView, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextView textContainer](self->_textView, "textContainer");
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
      -[MFComposeRecipientTextView recipients](self, "recipients", v13, v24, v25, v26, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (!v23)
        -[_MFAtomTextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
      return;
    }
    -[_MFAtomTextView textStorage](self->_textView, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientTextView placeholderAttachment](self, "placeholderAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientTextView _baseAttributes](self, "_baseAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedStringWithBaseAttributes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
    textView = self->_textView;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __47__MFComposeRecipientTextView_dragMovedToPoint___block_invoke;
    v27 = &unk_1E5A66298;
    v20 = v15;
    v28 = v20;
    v30 = v7;
    v31 = v9;
    v21 = v18;
    v29 = v21;
    v32 = v12;
    -[_MFAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", &v24);

    goto LABEL_11;
  }
}

uint64_t __47__MFComposeRecipientTextView_dragMovedToPoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "insertAttributedString:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)dragExited
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
  -[_MFAtomTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
  objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);

  -[MFComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", 0);
  -[_MFAtomTextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (void)dropItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MFAtomTextView *textView;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  MFComposeRecipientTextView *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke;
  v28[3] = &unk_1E5A66058;
  v28[4] = self;
  v16 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v28);
  v5 = -[MFComposeRecipientTextView _placeholderAttachmentRange](self, "_placeholderAttachmentRange");
  v7 = v6;
  -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
  textView = self->_textView;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_4;
  v23[3] = &unk_1E5A66310;
  v9 = v16;
  v24 = v9;
  v25 = self;
  v26 = v5;
  v27 = v7;
  -[_MFAtomTextView batchTextStorageUpdates:](textView, "batchTextStorageUpdates:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[MFComposeRecipientTextView _beginAtomViewAnimations](self, "_beginAtomViewAnimations");
        -[MFComposeRecipientTextView _setValue:forAtomLayoutOption:withRecipient:](self, "_setValue:forAtomLayoutOption:withRecipient:", MEMORY[0x1E0C9AAA0], CFSTR("MFAtomLayoutOptionShouldHide"), v13);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_6;
        v18[3] = &unk_1E5A65430;
        v18[4] = self;
        v18[5] = v13;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v18, 0.35);
        WeakRetained = objc_loadWeakRetained(&self->super._delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v29 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "composeRecipientView:didAddRecipients:", self, v15);

        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(WeakRetained, "composeRecipientView:didAddRecipient:", self, v13);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v10);
  }

  -[_MFAtomTextView resignFirstResponder](self->_textView, "resignFirstResponder");
  -[MFComposeRecipientTextView setPlaceholderAttachment:](self, "setPlaceholderAttachment:", 0);

}

void __40__MFComposeRecipientTextView_dropItems___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "atoms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_2;
  v12[3] = &unk_1E5A660D0;
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
    v10[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_3;
    v10[3] = &unk_1E5A662C0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  }
}

uint64_t __40__MFComposeRecipientTextView_dropItems___block_invoke_2(uint64_t a1, void *a2)
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

void __40__MFComposeRecipientTextView_dropItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeRecipient:");

}

uint64_t __40__MFComposeRecipientTextView_dropItems___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_5;
  v3[3] = &unk_1E5A662E8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __40__MFComposeRecipientTextView_dropItems___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setValue:forAtomLayoutOption:withRecipient:", MEMORY[0x1E0C9AAB0], CFSTR("MFAtomLayoutOptionShouldHide"));
  objc_msgSend(*(id *)(a1 + 32), "_atomAttachmentForRecipient:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (a3)
    objc_msgSend(v6, "_insertAtomAttachment:atCharacterIndex:", v5, v7 + a3);
  else
    objc_msgSend(v6, "_insertAtomAttachment:andReplaceCharactersInRange:", v5, v7, *(_QWORD *)(a1 + 48));

}

void __40__MFComposeRecipientTextView_dropItems___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "atomViewForRecipient:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)selectComposeRecipientAtom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[MFComposeRecipientTextView _rangeForComposeRecipientAtom:](self, "_rangeForComposeRecipientAtom:");
  -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, v5);

}

- (void)deselectComposeRecipientAtom:(id)a3
{
  _MFAtomTextView *textView;
  id v4;

  textView = self->_textView;
  -[_MFAtomTextView textStorage](textView, "textStorage", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextView setSelectedRange:](textView, "setSelectedRange:", objc_msgSend(v4, "length"), 0);

}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeRecipientView:showPersonCardForAtom:", self, v5);

}

- (BOOL)indicatesUnsafeRecipientsWhenCollapsed
{
  return self->_indicatesUnsafeRecipientsWhenCollapsed;
}

- (void)setIndicatesUnsafeRecipientsWhenCollapsed:(BOOL)a3
{
  self->_indicatesUnsafeRecipientsWhenCollapsed = a3;
}

- (BOOL)editable
{
  return self->_editable;
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

- (UIColor)typingTextColor
{
  return self->_typingTextColor;
}

- (void)setTypingTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_typingTextColor, a3);
}

- (int64_t)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int64_t)a3
{
  self->_hideLastAtomComma = a3;
}

- (_MFAtomTextAttachment)placeholderAttachment
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

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_inactiveTextColor, 0);
  objc_storeStrong((id *)&self->_inactiveTextView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
