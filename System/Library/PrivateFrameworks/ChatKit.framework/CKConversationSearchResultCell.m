@implementation CKConversationSearchResultCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (Class)conversationListCellClass
{
  void *v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)resultIdentifier
{
  void *v2;
  void *v3;

  -[CKConversationSearchResultCell result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[CKConversationSearchResultCell setSearchText:](self, "setSearchText:", v7);
  -[CKConversationSearchResultCell setResult:](self, "setResult:", v8);
  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithQueryResult:searchText:", v8, v7);

}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CKConversationSearchResultCell searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v11);

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    -[CKConversationSearchResultCell setSearchText:](self, "setSearchText:", v11);
    -[CKConversationSearchResultCell searchText](self, "searchText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
LABEL_5:

      v6 = v11;
      goto LABEL_6;
    }
    -[CKConversationSearchResultCell result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v8)
    {
      -[CKConversationSearchResultCell searchCell](self, "searchCell", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationSearchResultCell result](self, "result");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationSearchResultCell searchText](self, "searchText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configureWithQueryResult:searchText:", v9, v10);

      goto LABEL_5;
    }
  }
LABEL_6:

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
  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKConversationSearchResultCell cellLayout](self, "cellLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationSearchResultCell.m"), 73, CFSTR("%@ needs a cell layout."), v13, v14);

    }
    -[CKConversationSearchResultCell cellLayout](self, "cellLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationSearchResultCell searchCell](self, "searchCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCellLayout:", v9);

  }
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKConversationSearchResultCell delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthForDeterminingAvatarVisibility");
  v4 = v3;

  return v4;
}

- (CKConversationSearchResultCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKConversationSearchResultCell *v7;
  void *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationSearchResultCell;
  v7 = -[CKConversationSearchResultCell initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "conversationListCellClass")), "initWithFrame:", x, y, width, height);
    objc_msgSend(v8, "setDelegate:", v7);
    -[CKConversationSearchResultCell setSearchCell:](v7, "setSearchCell:", v8);
    -[CKConversationSearchResultCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

  }
  return v7;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultCell;
  -[CKConversationSearchResultCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  -[CKConversationSearchResultCell setSearchText:](self, "setSearchText:", 0);
  -[CKConversationSearchResultCell setResult:](self, "setResult:", 0);
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CKConversationSearchResultCell marginInsets](self, "marginInsets");
  if (left != v11 || top != v8 || right != v10 || bottom != v9)
  {
    self->_marginInsets.top = top;
    self->_marginInsets.left = left;
    self->_marginInsets.bottom = bottom;
    self->_marginInsets.right = right;
    -[CKConversationSearchResultCell setNeedsLayout](self, "setNeedsLayout");
  }
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
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKConversationSearchResultCell;
  -[CKConversationSearchResultCell layoutSubviews](&v15, sel_layoutSubviews);
  -[CKConversationSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationSearchResultCell marginInsets](self, "marginInsets");
  objc_msgSend(v12, "setMarginInsets:");

  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAccessibilityPreferredContentSizeCategory");

  if (v12)
  {
    -[CKConversationSearchResultCell searchCell](self, "searchCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

    -[CKConversationSearchResultCell searchCell](self, "searchCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeThatFits:", v10, 1.79769313e308);
    v16 = v15;

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationSearchResultCell traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayScale");
    objc_msgSend(v17, "searchMessageCellHeightForDisplayScale:");
    v16 = v19;

  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v16);
  return v4;
}

- (void)forwardStateToEmbeddedCell:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversationSearchResultCell searchCell](self, "searchCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKConversationSearchResultCell searchCell](self, "searchCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithForwardedConfigurationState:", v7);

  }
}

- (id)configurationState
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultCell;
  -[CKConversationSearchResultCell configurationState](&v4, sel_configurationState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst() && objc_msgSend(v2, "isSelected"))
    objc_msgSend(v2, "setFocused:", 1);
  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CKConversationSearchResultCell forwardStateToEmbeddedCell:](self, "forwardStateToEmbeddedCell:");
  if (-[CKConversationSearchResultCell shouldInsetResults](self, "shouldInsetResults"))
    objc_msgSend(MEMORY[0x1E0CEA370], "listPlainCellConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0CEA370], "listSidebarCellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationSearchResultCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "useSelectedAppearanceForConversationCellState:traitCollection:", v15, v6);

  if (CKIsRunningInMacCatalyst() && objc_msgSend(v15, "isSelected"))
    objc_msgSend(v15, "setFocused:", 1);
  objc_msgSend(v4, "updatedConfigurationForState:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationListSelectedCellColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "theme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "conversationListSelectedCellColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v14);

    }
  }
  -[CKConversationSearchResultCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v8);

}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (CKConversationSearchCellProtocol)searchCell
{
  return self->_searchCell;
}

- (void)setSearchCell:(id)a3
{
  objc_storeStrong((id *)&self->_searchCell, a3);
}

- (CKSpotlightQueryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (BOOL)shouldInsetResults
{
  return self->_shouldInsetResults;
}

- (void)setShouldInsetResults:(BOOL)a3
{
  self->_shouldInsetResults = a3;
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (CKConversationSearchResultCellDelegate)delegate
{
  return (CKConversationSearchResultCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_searchCell, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
}

@end
