@implementation CKPinnedConversationCollectionViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CKPinnedConversationCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKPinnedConversationCollectionViewCell *v3;
  CKPinnedConversationView *v4;
  uint64_t v5;
  CKPinnedConversationView *pinnedConversationView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationCollectionViewCell;
  v3 = -[CKPinnedConversationCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKPinnedConversationView alloc];
    -[CKPinnedConversationCollectionViewCell bounds](v3, "bounds");
    v5 = -[CKPinnedConversationView initWithFrame:](v4, "initWithFrame:");
    pinnedConversationView = v3->_pinnedConversationView;
    v3->_pinnedConversationView = (CKPinnedConversationView *)v5;

    -[CKPinnedConversationCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_pinnedConversationView);

    v3->_editingMode = 0;
  }
  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKPinnedConversationCollectionViewCell;
  v4 = a3;
  -[CKPinnedConversationCollectionViewCell applyLayoutAttributes:](&v13, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "frame", v13.receiver, v13.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  self->_cellFrameFromLayoutAttributes.origin.x = v6;
  self->_cellFrameFromLayoutAttributes.origin.y = v8;
  self->_cellFrameFromLayoutAttributes.size.width = v10;
  self->_cellFrameFromLayoutAttributes.size.height = v12;
  -[CKPinnedConversationCollectionViewCell _updateActivityItemBoundingFrame](self, "_updateActivityItemBoundingFrame");
}

- (void)_updateActivityItemBoundingFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;

  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionViewBoundsForPinnedConversationCollectionViewCell:", self);
  v16 = v9;
  v17 = v8;
  v11 = v10;
  v13 = v12;

  x = self->_cellFrameFromLayoutAttributes.origin.x;
  y = self->_cellFrameFromLayoutAttributes.origin.y;
  v18.size.width = self->_cellFrameFromLayoutAttributes.size.width;
  v18.size.height = self->_cellFrameFromLayoutAttributes.size.height;
  v18.origin.x = x;
  v18.origin.y = y;
  if (!CGRectIsEmpty(v18))
  {
    v19.origin.y = v16;
    v19.origin.x = v17;
    v19.size.width = v11;
    v19.size.height = v13;
    if (!CGRectIsEmpty(v19))
    {
      v5 = v13;
      v6 = v11;
      v3 = -y;
      v4 = -x;
    }
  }
  -[CKPinnedConversationView setActivityItemBoundingFrame:](self->_pinnedConversationView, "setActivityItemBoundingFrame:", v4, v3, v6, v5);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CKPinnedConversationCollectionViewCell _updateActivityItemBoundingFrame](self, "_updateActivityItemBoundingFrame");
    v5 = obj;
  }

}

- (id)configurationState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKPinnedConversationCollectionViewCell;
  -[CKPinnedConversationCollectionViewCell configurationState](&v5, sel_configurationState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modifyConversationCellStateForDrop:", v2);

  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  _BOOL4 v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  objc_msgSend(MEMORY[0x1E0CEA370], "listSidebarCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v32, v6))
  {
    if (-[CKPinnedConversationCollectionViewCell editingMode](self, "editingMode"))
      v7 = CKIsRunningInMacCatalyst() != 0;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modifyConversationCellStateForDrop:", v32);

  objc_msgSend(v4, "updatedConfigurationForState:", v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && -[CKPinnedConversationCollectionViewCell showsBackgroundViewWhenSelected](self, "showsBackgroundViewWhenSelected"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationListPinnedCellSelectorViewColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "theme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "conversationListPinnedCellSelectorViewColor");
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = v14;
    }
    else
    {
      objc_msgSend(v10, "backgroundColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }

    v17 = 1;
    v8 = (void *)v16;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "conversationPinningTouchdownDimEnabled");

  if (v19)
  {
    v20 = objc_msgSend(v32, "isHighlighted");
    v21 = objc_msgSend(v32, "cellDropState");
    v22 = -[CKPinnedConversationCollectionViewCell showsBackgroundViewWhenSelected](self, "showsBackgroundViewWhenSelected");
    v23 = v20 | v7;
    if (v21 == 2)
      v23 = 1;
    if (v22)
      v24 = v21 == 2;
    else
      v24 = v23;
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDimmed:", v24);

  }
  objc_msgSend(v10, "setBackgroundColor:", v8);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "conversationListPinnedCellSelectedBackgroundCornerRadius");
  objc_msgSend(v10, "setCornerRadius:");

  objc_msgSend(v10, "setEdgesAddingLayoutMarginsToBackgroundInsets:", 0);
  objc_msgSend(v10, "setBackgroundInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
  -[CKPinnedConversationCollectionViewCell _updateActivitySupressionForState:](self, "_updateActivitySupressionForState:", v32);
  -[CKPinnedConversationCollectionViewCell _updateZPositionForState:](self, "_updateZPositionForState:", v32);
  v27 = -[CKPinnedConversationCollectionViewCell isSelected](self, "isSelected");
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSelected:", v27);

  v29 = -[CKPinnedConversationCollectionViewCell showsBackgroundViewWhenSelected](self, "showsBackgroundViewWhenSelected");
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNeedsUnreadIndicatorLeadingEdgePadding:", v29);

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setIsSelectedWithDarkAppearance:", v17);

  -[CKPinnedConversationCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v10);
}

+ (id)unpinAccessoryView
{
  void *v2;
  void *v3;
  void *v4;
  CKConversationListAccessoryView *v5;
  void *v6;
  CKConversationListAccessoryView *v7;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("minus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CKConversationListAccessoryView alloc];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pinnedConversationDefaultAccessorySize");
  v7 = -[CKConversationListAccessoryView initWithDiameter:](v5, "initWithDiameter:");

  -[CKConversationListAccessoryView setBlurEffect:withVibrancyEffectStyle:forState:](v7, "setBlurEffect:withVibrancyEffectStyle:forState:", v3, 2, 0);
  -[CKConversationListAccessoryView setTintColor:forState:](v7, "setTintColor:forState:", v4, 0);
  -[CKConversationListAccessoryView setImage:forState:](v7, "setImage:forState:", v2, 0);

  return v7;
}

+ (id)checkmarkAccessoryView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CKConversationListAccessoryView *v8;
  void *v9;
  CKConversationListAccessoryView *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.100000001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CKConversationListAccessoryView alloc];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pinnedConversationDefaultAccessorySize");
  v10 = -[CKConversationListAccessoryView initWithDiameter:](v8, "initWithDiameter:");

  -[CKConversationListAccessoryView setBlurEffect:forState:](v10, "setBlurEffect:forState:", v6, 0);
  -[CKConversationListAccessoryView setBackgroundColor:forState:](v10, "setBackgroundColor:forState:", v4, 0);
  -[CKConversationListAccessoryView setBackgroundColor:forState:](v10, "setBackgroundColor:forState:", v5, 4);
  -[CKConversationListAccessoryView setTintColor:forState:](v10, "setTintColor:forState:", v7, 4);
  -[CKConversationListAccessoryView setImage:forState:](v10, "setImage:forState:", v2, 4);
  -[CKConversationListAccessoryView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pinnedConversationCheckmarkStrokeRatio");
  v13 = v12;
  -[CKConversationListAccessoryView bounds](v10, "bounds");
  v15 = v13 * v14;
  -[CKConversationListAccessoryView layer](v10, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderWidth:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGColor");
  -[CKConversationListAccessoryView layer](v10, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBorderColor:", v18);

  -[CKConversationListAccessoryView layer](v10, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v21, "CGColor");
  -[CKConversationListAccessoryView layer](v10, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShadowColor:", v22);

  -[CKConversationListAccessoryView layer](v10, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1025758986;
  objc_msgSend(v24, "setShadowOpacity:", v25);

  -[CKConversationListAccessoryView layer](v10, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowRadius:", 7.0);

  -[CKConversationListAccessoryView layer](v10, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowOffset:", 0.0, 12.0);

  return v10;
}

- (double)accessorySizeForLayoutStyle:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;

  if ((unint64_t)a3 > 6)
    return 0.0;
  if (((1 << a3) & 0x3C) != 0)
    return 18.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinnedConversationDefaultAccessorySize");
  v6 = v5;

  return v6;
}

- (void)updateCheckboxAccessoryImageForCurrentLayoutStyle
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutStyle");

  if (v4 > 6)
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", **((_QWORD **)&unk_1E2757488 + v4), 1024);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  v11 = (id)v5;
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithConfiguration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:forState:", v9, 4);

}

- (void)updateUnpinAccessoryImageForCurrentLayoutStyle
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutStyle");

  if (v4 > 6)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v5 = (_QWORD *)qword_1E27574C0[v4];
    v6 = qword_18E7CB550[v4];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *v5, 1024);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v7;
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("minus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v10, 0);

}

- (void)_createCheckboxAccessoryIfNecessary
{
  void *v3;
  CKConversationListAccessoryView *v4;
  CKConversationListAccessoryView *checkboxAccessoryView;

  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[CKPinnedConversationCollectionViewCell checkmarkAccessoryView](CKPinnedConversationCollectionViewCell, "checkmarkAccessoryView");
    v4 = (CKConversationListAccessoryView *)objc_claimAutoreleasedReturnValue();
    checkboxAccessoryView = self->_checkboxAccessoryView;
    self->_checkboxAccessoryView = v4;

    -[CKPinnedConversationCollectionViewCell checkboxFrame](self, "checkboxFrame");
    -[CKConversationListAccessoryView setFrame:](self->_checkboxAccessoryView, "setFrame:");
    -[CKPinnedConversationCollectionViewCell updateCheckboxAccessoryImageForCurrentLayoutStyle](self, "updateCheckboxAccessoryImageForCurrentLayoutStyle");
  }
}

- (void)_createUnpinAccessoryIfNecessary
{
  void *v3;
  CKConversationListAccessoryView *v4;
  CKConversationListAccessoryView *unpinAccessoryView;

  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[CKPinnedConversationCollectionViewCell unpinAccessoryView](CKPinnedConversationCollectionViewCell, "unpinAccessoryView");
    v4 = (CKConversationListAccessoryView *)objc_claimAutoreleasedReturnValue();
    unpinAccessoryView = self->_unpinAccessoryView;
    self->_unpinAccessoryView = v4;

    -[CKPinnedConversationCollectionViewCell unpinAccessoryViewFrame](self, "unpinAccessoryViewFrame");
    -[CKConversationListAccessoryView setFrame:](self->_unpinAccessoryView, "setFrame:");
    -[CKConversationListAccessoryView setImageNeedsEdgeAntiAliasing:](self->_unpinAccessoryView, "setImageNeedsEdgeAntiAliasing:", 1);
    -[CKConversationListAccessoryView addTarget:action:forEvents:](self->_unpinAccessoryView, "addTarget:action:forEvents:", self, sel_unpinButtonTapped_, 64);
    -[CKPinnedConversationCollectionViewCell updateUnpinAccessoryImageForCurrentLayoutStyle](self, "updateUnpinAccessoryImageForCurrentLayoutStyle");
  }
}

- (void)setAllowActivitySuppressionWhenSelected:(BOOL)a3
{
  id v4;

  if (self->_allowActivitySuppressionWhenSelected != a3)
  {
    self->_allowActivitySuppressionWhenSelected = a3;
    -[CKPinnedConversationCollectionViewCell configurationState](self, "configurationState");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationCollectionViewCell _updateActivitySupressionForState:](self, "_updateActivitySupressionForState:", v4);

  }
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;

  v4 = a4;
  if (self->_editingMode != a3)
    self->_editingMode = a3;
  if (a3
    && (-[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "setDimmed:", 0),
        v7,
        a3 == 1)
    && !CKIsRunningInMacCatalyst())
  {
    if (-[CKPinnedConversationCollectionViewCell isShowingCheckboxAccessory](self, "isShowingCheckboxAccessory"))
    {
      v15 = 0;
    }
    else
    {
      -[CKPinnedConversationCollectionViewCell setShowingCheckboxAccessory:](self, "setShowingCheckboxAccessory:", 1);
      v15 = v4;
    }
    -[CKPinnedConversationCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke;
    v37[3] = &unk_1E274A108;
    v37[4] = self;
    v19 = v16;
    v38 = v19;
    objc_msgSend(v18, "performWithoutAnimation:", v37);
    if (v15)
    {
      v36[0] = v17;
      v36[1] = 3221225472;
      v36[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_2;
      v36[3] = &unk_1E274A208;
      v36[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v36);
      v35[0] = v17;
      v35[1] = 3221225472;
      v35[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_3;
      v35[3] = &unk_1E274A208;
      v35[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v35, 0.3);
    }

    -[CKPinnedConversationCollectionViewCell setJittering:](self, "setJittering:", 0);
  }
  else
  {
    -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKPinnedConversationCollectionViewCell setShowingCheckboxAccessory:](self, "setShowingCheckboxAccessory:", 0);
      if (v4)
      {
        v33[4] = self;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_4;
        v34[3] = &unk_1E274A208;
        v34[4] = self;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_5;
        v33[3] = &unk_1E274A1B8;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v34, v33, 0.3);
      }
      else
      {
        -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");

        -[CKPinnedConversationCollectionViewCell setCheckboxAccessoryView:](self, "setCheckboxAccessoryView:", 0);
      }
    }
    -[CKPinnedConversationCollectionViewCell setJittering:](self, "setJittering:", a3 == 2);
    if (a3 == 2)
    {
      if (-[CKPinnedConversationCollectionViewCell isShowingUnpinAccessory](self, "isShowingUnpinAccessory"))
      {
        v10 = 0;
      }
      else
      {
        -[CKPinnedConversationCollectionViewCell setShowingUnpinAccessory:](self, "setShowingUnpinAccessory:", 1);
        v10 = v4;
      }
      -[CKPinnedConversationCollectionViewCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = (void *)MEMORY[0x1E0CEABB0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_6;
      v31[3] = &unk_1E274A108;
      v31[4] = self;
      v14 = v11;
      v32 = v14;
      objc_msgSend(v13, "performWithoutAnimation:", v31);
      if (v10)
      {
        v30[0] = v12;
        v30[1] = 3221225472;
        v30[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_7;
        v30[3] = &unk_1E274A208;
        v30[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v30);
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_8;
        v29[3] = &unk_1E274A208;
        v29[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v29, 0.3);
      }

      if (!CKIsRunningInMacCatalyst())
        goto LABEL_30;
      goto LABEL_32;
    }
  }
  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CKPinnedConversationCollectionViewCell setShowingUnpinAccessory:](self, "setShowingUnpinAccessory:", 0);
    if (v4)
    {
      v27[4] = self;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_9;
      v28[3] = &unk_1E274A208;
      v28[4] = self;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_10;
      v27[3] = &unk_1E274A1B8;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v28, v27, 0.3);
    }
    else
    {
      -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      -[CKPinnedConversationCollectionViewCell setUnpinAccessoryView:](self, "setUnpinAccessoryView:", 0);
    }
  }
  if (!CKIsRunningInMacCatalyst())
  {
    if (!a3)
    {
      -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endSuppressingActivityWithReason:animated:completion:", CFSTR("EditMode"), v4, 0);
      goto LABEL_31;
    }
LABEL_30:
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("EditMode"), v4, 0);
LABEL_31:

  }
LABEL_32:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hidesUnreadIndicatorWhenEditing");
  if (a3)
    v25 = v24;
  else
    v25 = 0;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUnreadIndicatorHidden:animated:", v25, v4);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v9[3];

  objc_msgSend(*(id *)(a1 + 32), "_createCheckboxAccessoryIfNecessary");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setTransform:", v9);

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "checkboxAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setCheckboxAccessoryView:", 0);
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v9[3];

  objc_msgSend(*(id *)(a1 + 32), "_createUnpinAccessoryIfNecessary");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setTransform:", v9);

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_8(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_10(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unpinAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setUnpinAccessoryView:", 0);
}

- (void)setJittering:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[CKPinnedConversationCollectionViewCell isJittering](self, "isJittering") != a3)
  {
    -[CKPinnedConversationCollectionViewCell layer](self, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "_jitterXTranslationAnimation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", v5, CFSTR("CKJitterXTranslation"));

      objc_msgSend((id)objc_opt_class(), "_jitterYTranslationAnimation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", v6, CFSTR("CKJitterYTranslation"));

      objc_msgSend((id)objc_opt_class(), "_jitterRotationAnimation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", v7, CFSTR("CKJitterRotation"));

    }
    else
    {
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("CKJitterXTranslation"));
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("CKJitterYTranslation"));
      objc_msgSend(v8, "removeAnimationForKey:", CFSTR("CKJitterRotation"));
    }

  }
}

- (BOOL)isJittering
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CKPinnedConversationCollectionViewCell layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationForKey:", CFSTR("CKJitterXTranslation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "animationForKey:", CFSTR("CKJitterYTranslation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "animationForKey:", CFSTR("CKJitterRotation"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_jitterXTranslationAnimation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDuration:", 0.134);
  objc_msgSend(v2, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(v2, "setFromValue:", &unk_1E28714D0);
  objc_msgSend(v2, "setToValue:", &unk_1E28714E0);
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v7);

  LODWORD(v8) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v8);
  objc_msgSend(v2, "setAutoreverses:", 1);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

+ (id)_jitterYTranslationAnimation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDuration:", 0.142);
  objc_msgSend(v2, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(v2, "setFromValue:", &unk_1E28714D0);
  objc_msgSend(v2, "setToValue:", &unk_1E28714E0);
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v7);

  LODWORD(v8) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v8);
  objc_msgSend(v2, "setAutoreverses:", 1);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

+ (id)_jitterRotationAnimation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDuration:", 0.128);
  objc_msgSend(v2, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(v2, "setFromValue:", &unk_1E28714F0);
  objc_msgSend(v2, "setToValue:", &unk_1E2871500);
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v7);

  LODWORD(v8) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v8);
  objc_msgSend(v2, "setAutoreverses:", 1);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

- (void)setShowsBackgroundViewWhenSelected:(BOOL)a3
{
  if (self->_showsBackgroundViewWhenSelected != a3)
    self->_showsBackgroundViewWhenSelected = a3;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationCollectionViewCell;
  -[CKPinnedConversationCollectionViewCell didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[CKPinnedConversationCollectionViewCell configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCell _updateZPositionForState:](self, "_updateZPositionForState:", v3);

}

- (void)_updateActivitySupressionForState:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_allowActivitySuppressionWhenSelected
    && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "suppressPinActivityForState:", v7),
        v4,
        v5))
  {
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("CellSelected"), 1, 0);
  }
  else
  {
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSuppressingActivityWithReason:animated:completion:", CFSTR("CellSelected"), 1, 0);
  }

}

- (void)dragStateDidChange:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3 == 1)
  {
    v6 = -[CKPinnedConversationCollectionViewCell isPreparingForReuse](self, "isPreparingForReuse") ^ 1;
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("CellDragState"), v6, 0);
  }
  else
  {
    if (a3 == 2)
    {
      v4 = -[CKPinnedConversationCollectionViewCell isPreparingForReuse](self, "isPreparingForReuse") ^ 1;
      -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("CellDragState"), v4, 0);

      -[CKPinnedConversationCollectionViewCell setAlpha:](self, "setAlpha:", 0.0);
      return;
    }
    v7 = -[CKPinnedConversationCollectionViewCell isPreparingForReuse](self, "isPreparingForReuse") ^ 1;
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endSuppressingActivityWithReason:animated:completion:", CFSTR("CellDragState"), v7, 0);
  }

}

- (void)_updateZPositionForState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "suppressPinActivityForState:", v4);

  -[CKPinnedConversationCollectionViewCell layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setZPosition:", (double)(v6 ^ 1u));

}

- (void)layoutSubviews
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
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CKPinnedConversationCollectionViewCell;
  -[CKPinnedConversationCollectionViewCell layoutSubviews](&v41, sel_layoutSubviews);
  -[CKPinnedConversationCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKPinnedConversationCollectionViewCell unpinAccessoryViewFrame](self, "unpinAccessoryViewFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v18, v20);

  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v14 + v18 * 0.5, v16 + v20 * 0.5);

  -[CKPinnedConversationCollectionViewCell checkboxFrame](self, "checkboxFrame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v28, v30);

  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v24 + v28 * 0.5, v26 + v30 * 0.5);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pinnedConversationCheckmarkStrokeRatio");
  v35 = v34;
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v35 * v37;
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBorderWidth:", v38);

  -[CKPinnedConversationCollectionViewCell updateCheckboxAccessoryImageForCurrentLayoutStyle](self, "updateCheckboxAccessoryImageForCurrentLayoutStyle");
  -[CKPinnedConversationCollectionViewCell updateUnpinAccessoryImageForCurrentLayoutStyle](self, "updateUnpinAccessoryImageForCurrentLayoutStyle");
}

- (CGRect)unpinAccessoryViewFrame
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat MinX;
  double MinY;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutStyle");

  -[CKPinnedConversationCollectionViewCell accessorySizeForLayoutStyle:](self, "accessorySizeForLayoutStyle:", v4);
  v6 = v5;
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCell bounds](self, "bounds");
  objc_msgSend(v7, "avatarViewFrameForSize:layoutStyle:", v4, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  MinX = CGRectGetMinX(v23);
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  MinY = CGRectGetMinY(v24);
  v20 = MinX;
  v21 = v6;
  v22 = v6;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = MinY;
  result.origin.x = v20;
  return result;
}

- (CGRect)checkboxFrame
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutStyle");

  -[CKPinnedConversationCollectionViewCell accessorySizeForLayoutStyle:](self, "accessorySizeForLayoutStyle:", v4);
  v6 = v5;
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCell bounds](self, "bounds");
  objc_msgSend(v7, "avatarViewFrameForSize:layoutStyle:", v4, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v28.origin.x = v11;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  v18 = CGRectGetMaxX(v28) - v6;
  v29.origin.x = v11;
  v29.origin.y = v13;
  v29.size.width = v15;
  v29.size.height = v17;
  v19 = CGRectGetMaxY(v29) - v6;
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "borderWidth");
  v23 = v18 + v22 * 0.5;

  v24 = v23;
  v25 = v19;
  v26 = v6;
  v27 = v6;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CKPinnedConversationView sizeThatFits:](self->_pinnedConversationView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  objc_super v9;

  self->_isPreparingForReuse = 1;
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationCollectionViewCell;
  -[CKPinnedConversationCollectionViewCell prepareForReuse](&v9, sel_prepareForReuse);
  v4 = -[CKPinnedConversationCollectionViewCell editingMode](self, "editingMode");
  if ((v4 == 2) != -[CKPinnedConversationCollectionViewCell isJittering](self, "isJittering"))
    -[CKPinnedConversationCollectionViewCell setJittering:](self, "setJittering:", v4 == 2);
  -[CKPinnedConversationCollectionViewCell unpinAccessoryView](self, "unpinAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 != 2);

  v6 = -[CKPinnedConversationCollectionViewCell editingMode](self, "editingMode") != 1;
  -[CKPinnedConversationCollectionViewCell checkboxAccessoryView](self, "checkboxAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDimmed:", 0);

  self->_isPreparingForReuse = 0;
}

- (void)unpinButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKPinnedConversationCollectionViewCell delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](self, "pinnedConversationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unpinButtonTappedForCell:withConversation:", self, v5);

}

- (void)setLinkInteractions:(id)a3
{
  id v4;
  NSArray *linkInteractions;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  linkInteractions = self->_linkInteractions;
  if (linkInteractions)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = linkInteractions;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          -[CKPinnedConversationCollectionViewCell removeInteraction:](self, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  v12 = self->_linkInteractions;
  self->_linkInteractions = v11;

  v13 = self->_linkInteractions;
  if (v13)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v13;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[CKPinnedConversationCollectionViewCell addInteraction:](self, "addInteraction:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (CKPinnedConversationCollectionViewCellDelegate)delegate
{
  return (CKPinnedConversationCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CKPinnedConversationView)pinnedConversationView
{
  return self->_pinnedConversationView;
}

- (void)setPinnedConversationView:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConversationView, a3);
}

- (CKConversationListAccessoryView)unpinAccessoryView
{
  return self->_unpinAccessoryView;
}

- (void)setUnpinAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_unpinAccessoryView, a3);
}

- (BOOL)showsBackgroundViewWhenSelected
{
  return self->_showsBackgroundViewWhenSelected;
}

- (BOOL)allowActivitySuppressionWhenSelected
{
  return self->_allowActivitySuppressionWhenSelected;
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (BOOL)isShowingUnpinAccessory
{
  return self->_isShowingUnpinAccessory;
}

- (void)setShowingUnpinAccessory:(BOOL)a3
{
  self->_isShowingUnpinAccessory = a3;
}

- (BOOL)isShowingCheckboxAccessory
{
  return self->_isShowingCheckboxAccessory;
}

- (void)setShowingCheckboxAccessory:(BOOL)a3
{
  self->_isShowingCheckboxAccessory = a3;
}

- (CKConversationListAccessoryView)checkboxAccessoryView
{
  return self->_checkboxAccessoryView;
}

- (void)setCheckboxAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_checkboxAccessoryView, a3);
}

- (BOOL)isPreparingForReuse
{
  return self->_isPreparingForReuse;
}

- (void)setIsPreparingForReuse:(BOOL)a3
{
  self->_isPreparingForReuse = a3;
}

- (CGRect)cellFrameFromLayoutAttributes
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cellFrameFromLayoutAttributes.origin.x;
  y = self->_cellFrameFromLayoutAttributes.origin.y;
  width = self->_cellFrameFromLayoutAttributes.size.width;
  height = self->_cellFrameFromLayoutAttributes.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCellFrameFromLayoutAttributes:(CGRect)a3
{
  self->_cellFrameFromLayoutAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxAccessoryView, 0);
  objc_storeStrong((id *)&self->_linkInteractions, 0);
  objc_storeStrong((id *)&self->_unpinAccessoryView, 0);
  objc_storeStrong((id *)&self->_pinnedConversationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
