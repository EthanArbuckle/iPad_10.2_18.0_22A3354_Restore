@implementation CKDetailsSearchResultsFooterCell

+ (id)supplementaryViewType
{
  return CFSTR("SearchDetailsFooterSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("SearchDetailsResultsFooter");
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKDetailsSearchResultsFooterCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKDetailsSearchResultsFooterCell *v7;
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
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKDetailsSearchResultsFooterCell;
  v7 = -[CKDetailsSearchResultsFooterCell initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 0, x, y, width, height);
    objc_msgSend(v8, "setDataSource:", v7);
    objc_msgSend(v8, "setDelegate:", v7);
    objc_msgSend(v8, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v8, "setAlwaysBounceHorizontal:", 0);
    objc_msgSend(v8, "setScrollEnabled:", 0);
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DetailsFooter"));
    objc_msgSend(v8, "setSeparatorStyle:", 0);
    -[CKDetailsSearchResultsFooterCell setTableView:](v7, "setTableView:", v8);
    -[CKDetailsSearchResultsFooterCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    if (CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailsHeaderFooterContentViewBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v12);

      -[CKDetailsSearchResultsFooterCell contentView](v7, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "theme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "detailsHeaderFooterContentViewBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v16);

      -[CKDetailsSearchResultsFooterCell backgroundView](v7, "backgroundView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "theme");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "detailsHeaderFooterContentViewBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v20);

    }
  }
  return v7;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    -[CKDetailsSearchResultsFooterCell tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (void)layoutSubviews
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
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKDetailsSearchResultsFooterCell;
  -[CKDetailsSearchResultsFooterCell layoutSubviews](&v14, sel_layoutSubviews);
  -[CKDetailsSearchResultsFooterCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKDetailsSearchResultsFooterCell tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKDetailsSearchResultsFooterCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 10.0);

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
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGRect v20;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKDetailsSearchResultsFooterCell tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  objc_msgSend(v13, "sizeThatFits:", CGRectGetWidth(v20), 1.79769313e308);
  v15 = v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "searchResultsTitleHeaderDetailsTopPadding");
  v18 = v15 + v17;

  objc_msgSend(v4, "setFrame:", v6, v8, v10, v18);
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
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

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DetailsFooter"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSearchResultsFooterCell title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v5, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "detailsHeaderFooterContentViewBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v14);

  objc_msgSend(v5, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detailsHeaderFooterContentViewBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v18);

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[CKDetailsSearchResultsFooterCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchDetailsFooterCellShowAllTapped:", self);

  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (CKDetailsSearchResultsFooterCellDelegate)delegate
{
  return (CKDetailsSearchResultsFooterCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSString)title
{
  return self->_title;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
  objc_storeStrong((id *)&self->_topHairline, a3);
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
  objc_storeStrong((id *)&self->_bottomHairline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
