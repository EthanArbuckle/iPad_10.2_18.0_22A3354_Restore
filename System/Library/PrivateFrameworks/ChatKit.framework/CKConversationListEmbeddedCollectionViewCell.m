@implementation CKConversationListEmbeddedCollectionViewCell

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  self->_editingMode = a3;
  -[CKConversationListEmbeddedCollectionViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v9 = v8;
  v11 = v10;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      +[CKConversationListStandardCell leadingLayoutMargin](CKConversationListStandardCell, "leadingLayoutMargin");
      v7 = v12;
    }
  }
  else
  {
    v7 = 16.0;
  }
  -[CKConversationListEmbeddedCollectionViewCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v9, v7, v11);
  -[CKConversationListEmbeddedCollectionViewCell leadingEditingAccessoryConfigurationsForEditingMode:](self, "leadingEditingAccessoryConfigurationsForEditingMode:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell setLeadingEditingAccessoryConfigurations:](self, "setLeadingEditingAccessoryConfigurations:", v13);

  -[CKConversationListEmbeddedCollectionViewCell trailingEditingAccessoryConfigurationsForEditingMode:](self, "trailingEditingAccessoryConfigurationsForEditingMode:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell setTrailingEditingAccessoryConfigurations:](self, "setTrailingEditingAccessoryConfigurations:", v14);

  -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEditing:animated:", a3 != 0, v4);

}

- (void)setCellLayout:(id)a3
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_cellLayout, a3);
  -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKConversationListEmbeddedCollectionViewCell cellLayout](self, "cellLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListEmbeddedCollectionViewCell.m"), 61, CFSTR("%@ needs a cell layout."), v13, v14);

    }
    -[CKConversationListEmbeddedCollectionViewCell cellLayout](self, "cellLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCellLayout:", v9);

    -[CKConversationListEmbeddedCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UITableViewCell)embeddedTableViewCell
{
  return self->_embeddedTableViewCell;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (id)trailingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    -[CKConversationListEmbeddedCollectionViewCell insertCellAccessoryConfiguration](self, "insertCellAccessoryConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
    if (a3)
      v3 = 0;
    if (a3 == 1)
      return MEMORY[0x1E0C9AA60];
    else
      return v3;
  }
}

- (id)leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CKConversationListEmbeddedCollectionViewCell configurationState](self, "configurationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell _leadingEditingAccessoryConfigurationsForEditingMode:usingState:](self, "_leadingEditingAccessoryConfigurationsForEditingMode:usingState:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)configurationState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  -[CKConversationListEmbeddedCollectionViewCell configurationState](&v5, sel_configurationState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modifyConversationCellStateForDrop:", v2);

  return v2;
}

- (id)_leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3 usingState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 2)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else if (a3 == 1)
  {
    -[CKConversationListEmbeddedCollectionViewCell _multiselectCellAccessoryConfigurationUsingState:](self, "_multiselectCellAccessoryConfigurationUsingState:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)setShouldUseSidebarBackgroundConfiguration:(BOOL)a3
{
  self->_shouldUseSidebarBackgroundConfiguration = a3;
}

- (void)setEmbeddedCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_embeddedCellDelegate, a3);
}

- (void)setEditingMode:(unint64_t)a3
{
  -[CKConversationListEmbeddedCollectionViewCell setEditingMode:animated:](self, "setEditingMode:animated:", a3, 0);
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
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (-[CKConversationListEmbeddedCollectionViewCell shouldUseSidebarBackgroundConfiguration](self, "shouldUseSidebarBackgroundConfiguration"))
  {
    objc_msgSend(MEMORY[0x1E0CEA370], "listSidebarCellConfiguration");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA370], "listPlainCellConfiguration");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v20, v6))
    v7 = -[CKConversationListEmbeddedCollectionViewCell editingMode](self, "editingMode") != 2;
  else
    v7 = 0;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modifyConversationCellStateForDrop:", v20);

  -[CKConversationListEmbeddedCollectionViewCell forwardStateToEmbeddedCell:](self, "forwardStateToEmbeddedCell:", v20);
  objc_msgSend(v4, "updatedConfigurationForState:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationListSelectedCellColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "theme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conversationListSelectedCellColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v15);

    }
    if (objc_msgSend(v20, "isHighlighted"))
    {
      -[CKConversationListEmbeddedCollectionViewCell configurationState](self, "configurationState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSelected");

      if (v17)
        objc_msgSend(v9, "setBackgroundColorTransformer:", 0);
    }
  }
  else if (-[CKConversationListEmbeddedCollectionViewCell editingMode](self, "editingMode"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v18);

  }
  -[CKConversationListEmbeddedCollectionViewCell _leadingEditingAccessoryConfigurationsForEditingMode:usingState:](self, "_leadingEditingAccessoryConfigurationsForEditingMode:usingState:", self->_editingMode, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell setLeadingEditingAccessoryConfigurations:](self, "setLeadingEditingAccessoryConfigurations:", v19);

  -[CKConversationListEmbeddedCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v9);
}

- (BOOL)shouldUseSidebarBackgroundConfiguration
{
  return self->_shouldUseSidebarBackgroundConfiguration;
}

- (void)forwardStateToEmbeddedCell:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithForwardedConfigurationState:", v7);

  }
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v23;
  objc_class *v24;
  void *v25;

  v5 = a3;
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conversationListCellUsesLargeTextLayout");

  if (v13)
  {
    -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutIfNeeded");

    -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemLayoutSizeFittingSize:", v11, 1.79769313e308);
    v17 = v16;

  }
  else
  {
    -[CKConversationListEmbeddedCollectionViewCell cellLayout](self, "cellLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListEmbeddedCollectionViewCell.m"), 129, CFSTR("%@ needs a cell layout."), v25);

    }
    -[CKConversationListEmbeddedCollectionViewCell cellLayout](self, "cellLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListEmbeddedCollectionViewCell traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    objc_msgSend(v19, "cellHeightForDisplayScale:");
    v17 = v21;

  }
  objc_msgSend(v5, "setFrame:", v7, v9, v11, v17);
  return v5;
}

- (CKConversationListEmbeddedCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKConversationListEmbeddedCollectionViewCell *v4;
  CKConversationListEmbeddedCollectionViewCell *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  v4 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[CKConversationListEmbeddedCollectionViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("CKConversationListEmbeddedCollectionViewCell.m"), 46, CFSTR("The content view must be a UITableViewCell: %@"), v6);

    }
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v6, "setSelectionStyle:", 0);
    -[CKConversationListEmbeddedCollectionViewCell setFocusEffect:](v5, "setFocusEffect:", 0);
    -[CKConversationListEmbeddedCollectionViewCell setEmbeddedTableViewCell:](v5, "setEmbeddedTableViewCell:", v6);

  }
  return v5;
}

- (void)setEmbeddedTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedTableViewCell, a3);
}

+ (Class)embeddedTableViewCellClass
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Subclasses of %@ must override %@."), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  -[CKConversationListEmbeddedCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKConversationListEmbeddedCollectionViewCell embeddedTableViewCell](self, "embeddedTableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

}

- (id)_multiselectCellAccessoryConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v4, v6);

  if (v7)
    v8 = -[CKConversationListEmbeddedCollectionViewCell editingMode](self, "editingMode") != 2;
  else
    v8 = 0;

  v9 = objc_alloc_init(MEMORY[0x1E0CEAC90]);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v11);

  }
  return v9;
}

- (id)multiselectCellAccessoryConfiguration
{
  void *v3;
  void *v4;

  -[CKConversationListEmbeddedCollectionViewCell configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListEmbeddedCollectionViewCell _multiselectCellAccessoryConfigurationUsingState:](self, "_multiselectCellAccessoryConfigurationUsingState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)insertCellAccessoryConfiguration
{
  void *v2;
  void *v3;

  -[CKConversationListEmbeddedCollectionViewCell pinButton](self, "pinButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC88]), "initWithCustomView:", v2);
  objc_msgSend(v3, "setMaintainsFixedSize:", 1);

  return v3;
}

- (id)pinButton
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
  double v15;
  _QWORD v17[5];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithPaletteColors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("pin.circle.fill"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);
  objc_msgSend(v10, "setImageContentMode:", 2);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackground:", v10);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__CKConversationListEmbeddedCollectionViewCell_pinButton__block_invoke;
  v17[3] = &unk_1E274B178;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isAccessibilityPreferredContentSizeCategory"))
    v15 = 60.0;
  else
    v15 = 36.0;

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v15, v15);
  return v13;
}

uint64_t __57__CKConversationListEmbeddedCollectionViewCell_pinButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pinButtonTapped:", *(_QWORD *)(a1 + 32));
}

- (void)pinButtonTapped:(id)a3
{
  id v4;

  -[CKConversationListEmbeddedCollectionViewCell embeddedCellDelegate](self, "embeddedCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinButtonTappedForCell:", self);

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
          -[CKConversationListEmbeddedCollectionViewCell removeInteraction:](self, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10++));
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
          -[CKConversationListEmbeddedCollectionViewCell addInteraction:](self, "addInteraction:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (CKConversationListEmbeddedCollectionViewCellDelegate)embeddedCellDelegate
{
  return (CKConversationListEmbeddedCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_embeddedCellDelegate);
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkInteractions, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_destroyWeak((id *)&self->_embeddedCellDelegate);
  objc_storeStrong((id *)&self->_embeddedTableViewCell, 0);
}

- (void)configureAppEntityForConversation:(uint64_t)a3
{
  id v3;
  id v4;

  if (!a3)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F5010);
    v4 = (id)sub_18E768AC8();
    objc_msgSend(v3, sel_setLinkInteractions_, v4);

  }
}

@end
